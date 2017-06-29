package com.test;


import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestListContain {

	static class Foo {
		private int foo = 0;

		public Foo(int foo) {
			super();
			this.foo = foo;
		}
		
	}
	
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
	public void testListContain() throws Exception {
		List<Integer> list_int = new ArrayList<Integer>();
		list_int.add(1);
		list_int.add(2);
		list_int.add(3);
		//System.out.println(list_int.contains(3));
		
		List<String> list_str = new ArrayList<String>();
		list_str.add("a");
		list_str.add("b");
		list_str.add("c");
		//System.out.println(list_str.contains("a"));		

		List<Foo> list_foo = new ArrayList<Foo>();
		list_foo.add(new Foo(1));
		list_foo.add(new Foo(2));
		list_foo.add(new Foo(3));
		//System.out.println(list_foo.contains(new Foo(1)));				
		
	}

}
