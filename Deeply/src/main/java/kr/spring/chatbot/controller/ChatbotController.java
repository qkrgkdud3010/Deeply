package kr.spring.chatbot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chatbot")
public class ChatbotController {
	@Value("${dataconfig.openai-secret-key}")
	private String apiKey;
	
	@GetMapping("/list")
	public String list() {
		return "chatbotList";
	}
	
	@PostMapping("/chatbot")
	@ResponseBody
	public Map<String,String> chatMain(
			          String message, HttpSession session){
		//세션에 대화 기록을 가져옴
		JSONArray conversationHistory = 
				(JSONArray)session.getAttribute(
						         "conversionHistory");
		if(conversationHistory==null) {
			//대화 기록이 없으면 새로운 JSONArray 생성
			conversationHistory = new JSONArray();
			//시스템 역할 추가
			JSONObject systemMessage = new JSONObject();
			systemMessage.put("role", "system");
			systemMessage.put("content", 
					    "You are a helpful assistant.");
			conversationHistory.put(systemMessage);
		}
		//사용자 입력을 컨텍스트에 추가
		JSONObject userMessage = new JSONObject();
		userMessage.put("role", "user");
		userMessage.put("content", message);
		conversationHistory.put(userMessage);
		
		//ChatGPT와 대화 수행
		String response = chatWithGPT(conversationHistory);
		Map<String,String> mapJson = 
				new HashMap<String,String>();
		if(response != null) {
			log.debug("ChatGPT message : " + response);
			mapJson.put("response", response);
			
			//ChatGPT 응답을 컨텍스트에 추가
			JSONObject assistantMessage = new JSONObject();
			assistantMessage.put("role", "assistant");
			assistantMessage.put("content", response);
			conversationHistory.put(assistantMessage);
			
			session.setAttribute("conversationHistory", 
					              conversationHistory);
		}else {
			log.error("ChatGPT와 통신 중 오류가 발생했습니다.");
		}
		//클라이언트에 응답 반환
		return mapJson;
	}
	
	//OPEN AI 연동
	private String chatWithGPT(JSONArray messages) {
		HttpURLConnection connection = null;
		try {
			//요청 본문 생성
			JSONObject data = new JSONObject();
			data.put("model", "gpt-4o-mini");//사용할 모델 지정
			data.put("messages", messages);//대화 기록 포함
			data.put("max_tokens", 1000);//최대 토큰 수 설정
			data.put("temperature", 0.5);//응답의 창의성 조절
			
			//HTTP 연결 설정
			URL url = 
			new URL("https://api.openai.com/v1/chat/completions");
			connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			//인증 헤더 추가
			connection.setRequestProperty(
					"Authorization", "Bearer " + apiKey);
			connection.setRequestProperty(
					"Content-Type", "application/json");
			//출력 스트림 사용 가능 설정
			connection.setDoOutput(true);
			
			//요청 데이터 전송
			try (OutputStream os = connection.getOutputStream()){
				//데이터를 UTF-8 형식으로 변환하여 전송
				os.write(data.toString().getBytes("utf-8"));
			}
			//응답 받기
			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				//HTTP 200 응답 처리
				try(BufferedReader br = 
					   new BufferedReader(
							new InputStreamReader(
								connection.getInputStream(),"utf-8"))){
					StringBuilder response = new StringBuilder();
					String line;
					while((line = br.readLine())!=null) {
						response.append(line.trim());
					}
					//JSON 응답 파싱 및 응답 텍스트 추출
					JSONObject result = 
							new JSONObject(response.toString());
					//ChatGPT의 응답 내용 반환
					return result.getJSONArray("choices")
							     .getJSONObject(0)
							     .getJSONObject("message")
							     .getString("content");
				}
			}else {
				log.error("HTTP 오류 코드 : " + responseCode);
			}			
		}catch(IOException | JSONException e) {
			log.error("오류 발생 : " +  e.getMessage());
		}finally {
			if(connection != null)
				connection.disconnect();
		}
		return null;
	}
}





