package com.test;


import java.net.URL;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.efilebee.util.Common;

public class TestJarConflict {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void testJarConflict() throws Exception {
		
		URL urlOfClass = Common.class.getClassLoader().getResource("org/slf4j/spi/LocationAwareLogger.class");
		//System.out.println(urlOfClass);
	}
	

}
