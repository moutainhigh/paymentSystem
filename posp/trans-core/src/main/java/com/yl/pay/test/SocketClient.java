package com.yl.pay.test;

import com.pay.common.util.ISO8583.ISO8583Utile;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.security.NoSuchAlgorithmException;

public class SocketClient {

	private static int MAXLENGTH = 1024;
	public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
		//签到 0800 001
//		String yd="00BF600004000060220000000008000020000000C00092000020383038393538333838393334343033353439393031353100423030563230313430363130303120202020202020202056323031343036313030312020202020202020200011000000030010009030312065323839363631303832357C323839363635343439347C323839363630323630317C323839363630323630337C323839363632383034377C32383936363130343039203839383630324232313531353530313136333436";//"00BE60000600006131003100310100702406C024C0989B1662144410000101112000000000000000121000663010051000110612296214441000010111D30102200000003034343736383830383135353434383933343430333530393434333632313536C79787B84E51F396200000000000000000423030563230313730323230303120202020202020202056323031373034313930312020202020202020200013110000130006000016000000000000042100034355503536313032413931";

		//消费 芯片卡 0200
		String yd="019D60000400006022000000000200702406C020C0BA931662261867558889990000000000000010000000132112051000000012376226186755888999D21122200097565100000038303839353531303839333434303335343939303135313135360010DF110746552042494E47A595F1D859CD4C8E200000000000000001459F26080234E1A3B206C29D9F2701809F101307010103A03002010A0100000000002E0FD5829F37041F92427D9F360200029505008804E0009A031706039C01009F02060000000010005F2A02015682027C009F1A0201569F03060000000000009F3303E0F9C89F34030203009F3501229F1E0837353532303439328408A0000003330101019F090200309F4104000000130042303056323031353038303730312020202020202020205632303134303631303031202020202020202020001422000001000600007930312054323839363631303832357C323839363632383034377C323839363632303830307C323839363630323630317C323839363631303431302038393836303039313031313546303538303231343431414646454139";

//		String lt="00A9600006000060220000000008000020000000C00092100179383038393532393638393334343033353331313030303100423030563230313530363137303120202020202020202056323031363035313330312020202020202020200011000000190010006830312043303935323332393833367C303935323332393639387C303935323332393833357C30393532333239373834203839383630313134383531303931303934323433";
		System.out.println(ISO8583Utile.bytesToHexString(sendToBank(ISO8583Utile.hexStringToByte(yd),"127.0.0.1",13800)));
		
	}
	public static  byte[] sendToBank(byte[] data,String ip,int port) throws IOException {
		Socket client = new Socket();
		OutputStream ops = null;
		InputStream ins = null;
		
		int timeoutConect = 50000;			// 设置连接超时时间50秒
		int timeoutRevice = 60000;  		// 接收数据超时时间60秒
		long begintime = 0, endtime = 0;  
		
		
		try {
			begintime = System.currentTimeMillis(); 
			client.connect(new InetSocketAddress(InetAddress.getByName(ip), port), timeoutConect); 
			client.setSoTimeout(timeoutRevice);   
			
			ops = client.getOutputStream();
			ops.write(data);
			ops.flush();
			ins = client.getInputStream();
			byte[] _resultByte = new byte[MAXLENGTH];
			int len = ins.read(_resultByte);
			if(len==-1){//
				throw new SocketTimeoutException();
			}
			byte[] resultByte = new byte[len];
			System.arraycopy(_resultByte, 0, resultByte, 0, len);
			
			return resultByte;			
		} catch (SocketTimeoutException e) { 
            throw e;
        }  catch (IOException e) {
			throw e;
		} finally {
			
			endtime = System.currentTimeMillis();  
			
			if (ins != null)
				ins.close();
			if (ops != null)
				ops.close();
			if (client != null) {
				try {
					client.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
