package kr.co.lotson;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;


@SpringBootApplication(scanBasePackages = {"kr.co.lotson"})
@EnableCaching
public class BootjspApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootjspApplication.class, args);
	}

}
