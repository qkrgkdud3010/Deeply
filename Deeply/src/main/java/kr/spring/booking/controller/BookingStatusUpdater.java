package kr.spring.booking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import kr.spring.booking.service.BookingService;

@Component
public class BookingStatusUpdater {

    @Autowired
    private BookingService bookingService;

    @Scheduled(cron = "0 0 9 * * ?") // 매일 오전 9시에 실행
    public void updatePerformanceStatuses() {
        bookingService.updatePerformanceStatus();
    }
}
