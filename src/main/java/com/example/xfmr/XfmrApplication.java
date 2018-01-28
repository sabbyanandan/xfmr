package com.example.xfmr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.integration.annotation.ServiceActivator;

/**
 * A simple processor that adds extra text to the received payload.
 * 
 * Created by Sabby Anandan on 1/25/2018.
 */
@SpringBootApplication
@EnableBinding(Processor.class)
public class XfmrApplication {

	public static void main(String[] args) {
		SpringApplication.run(XfmrApplication.class, args);
	}

	@ServiceActivator(inputChannel = Processor.INPUT, outputChannel = Processor.OUTPUT)
	public Object transform(Object message) {
		if (message == null) {
			return null;
		}
		return "The Security Number = " + message;
	}
}
