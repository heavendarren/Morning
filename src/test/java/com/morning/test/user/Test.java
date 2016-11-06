package com.morning.test.user;


import com.alibaba.fastjson.JSON;

public class Test {
	
	private String id;
	private String name;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Test [id=" + id + ", name=" + name + "]";
	}

	public static void main(String[] args) {
		String[] a = {"a","b"};
		Test test = new Test();
		test.setId("1");
		test.setName("2");
		for (String c :a){
			test.setName(c);
			System.out.println(test);
		}
		System.out.println(test);
		System.out.println(JSON.toJSON(test));
	}
}
