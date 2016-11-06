package com.morning.test.thread;

public class Example05 {

	public static void main(String[] args) {
		TicketWindow ticketWindow = new TicketWindow();//创建TicketWindow实例对象
		new Thread(ticketWindow,"窗口1").start();//创建线程对象，开启线程
		new Thread(ticketWindow,"窗口2").start();//创建线程对象，开启线程
		new Thread(ticketWindow,"窗口3").start();//创建线程对象，开启线程
		new Thread(ticketWindow,"窗口4").start();//创建线程对象，开启线程
	}

}

class TicketWindow implements Runnable{
	
	private int tickets = 100;

	@Override
	public void run() {
		while(true){
			if(tickets>0){
				Thread th = Thread.currentThread();//获取当前线程
				String str = th.getName();
				System.out.println(str+"正在发售第"+tickets--+"张票");
			}
		}
	}
	
}
