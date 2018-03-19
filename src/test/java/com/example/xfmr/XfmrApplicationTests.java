package com.example.xfmr;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
public class XfmrApplicationTests {

	@Test
	public void contextLoads() {
	}

	@Test
	public void testPayload() {
		XfmrApplication app = new XfmrApplication();
		
		Object transformedPayload = app.transform(null);
		assertTrue(transformedPayload == null);

		transformedPayload = app.transform("888-33-4444");
		assertTrue(transformedPayload != null);
		assertThat(transformedPayload, not(""));
		assertThat(transformedPayload, is("The Security Number = xxx-xx-4444"));
	}
}
