package net;

import java.io.IOException;
import java.net.InetAddress;

/*
 什么是计算机 网络：
 分布在 不同地域的计算机通过外部设备进行连接，达到了资源共享和交互消息的功能称作计算机网络。

 网络通讯的三要素：
 1. ip地址
 2. 端口
 3. 协议


 IP地址：ip地址实际上是由32位二进制的数据组成的，因为32个二进制位不方便记忆，那么这时候把32位二进制分割成4份，每份一个字节8位.  2^8 = 256   0- 255
 00000000-00000000-00000000-00000000

 ip地址的类别： 一个ip地址实际上是由两部分组成的，ip地址 = 网络号+主机号。
 A类： 一个网络号+ 3个主机号。
 B类：  两个网络号+ 2个主机号
 C类： 三个网络号+ 1个主机号。

 端口号：逻辑端口号，并不是物理端口号。   
 范围： 0-65535

 公认端口（WellKnownPorts）：从0到1023，它们紧密绑定（binding）于一些服务。

 注册端口（RegisteredPorts）：从1024到49151。它们松散地绑定于一些服务。

 动态和/或私有端口（Dynamicand/orPrivatePorts）：从49152到65535。 

 比如：	
 ftp 21 
 http : 80
 ...

 协议：
 udp  通讯协议
 tcp  通讯协议

 sun公司使用了一个类(InetAddress) 对IP地址进行了描述。

 一个域名至少会对应一个主机，比如： www.baidu.com首先会在本机的hosts文件中去查找该域名是否有对应的主机，如果在hosts文件找不到对应的主机，
 那么会在对应通讯运营商的dns服务器去寻找。

 */
public class NetTest {

	public static void main(String[] args) throws IOException {
		InetAddress ip = InetAddress.getLocalHost(); // 获取本机的ip地址对象
		System.out.println("ip地址为：" + ip.getHostAddress()); // getHostAddress() 获取ip地址的字符串表示 形式
		System.out.println("获取主机名：" + ip.getHostName()); // getHostName 获取主机名

		ip = InetAddress.getByName("localhost"); // 传入一个计算机的ip地址或者是一个计算机的主机名字确定一个计算机的ip。
		// localhost 127.0.0.1 代表的本机ip 回环地址。特殊的IP地址
		System.out.println("获取主机名：" + ip.getHostAddress());
		System.out.println("获取主机名：" + ip.getHostName());
		System.out.println("是否可以与该ip地址的主机通讯吗？" + ip.isReachable(2000));

		InetAddress[] ips = InetAddress.getAllByName("www.baidu.com"); // 两个ip地址、
		for(InetAddress address :ips){
			System.out.println(address+"，"+address.getHostAddress());
		}
	}
}
