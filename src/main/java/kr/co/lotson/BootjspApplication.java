package kr.co.lotson;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"kr.co.lotson"})
public class BootjspApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootjspApplication.class, args);
	}

}
