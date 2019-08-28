package image;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageUtil {

	
	public static byte[] graphicsGeneration(String drawStr, int imageWidth, int imageHeight, String fontFamily, int fontWidth) {

	    int yblank = 160; //设置纵向文字间隔

	    int fontSize = 20; //水印文字大小

	    Color color = new Color(0xFF7F24, false); //设置水印文字颜色，第一个参数为16位RGB颜色值

	    int angle = 305; //设置水印倾斜角度

	    BufferedImage image = new BufferedImage(imageWidth, imageHeight,
	        BufferedImage.TYPE_INT_RGB);
	    Graphics graphics = image.getGraphics();
	    graphics.setColor(Color.white);
	    graphics.fillRect(0, 0, imageWidth, imageHeight);
	    graphics.setColor(color);
	    graphics.setFont(new Font(fontFamily, fontSize, fontSize));
	    Graphics2D g2d = (Graphics2D) graphics;
	    int transWidth = imageWidth + 400;
	    g2d.translate(-transWidth, imageHeight);
	    g2d.rotate(angle * Math.PI / 180); //设置水印倾斜角度
	    int x = 15;
	    int y = yblank;
	    for (int k = 0; k < 30; k++) {
	        for (int j = 0; j < 12; j++) {
	            graphics.drawString(drawStr, x, y);
	            x += fontWidth;
	        }
	        x = 15;
	        y += yblank;
	    }
	    ByteArrayOutputStream out = new ByteArrayOutputStream();
	    try {
			boolean flag = ImageIO.write(image, "jpg", out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    byte[] b = out.toByteArray();
	    return b;
	}
	
	public static void main(String[] args) {
		String fontFamily = "宋体"; //水印字体

	    int imageWidth = 1400; // 图片的宽度    

	    int imageHeight = 600; // 图片的高度   

	    int fontWidth = 200; //文字宽度，倾斜直线上两个水印之间的间距
	    String str = "amdin_管理员";

	    byte[] image = graphicsGeneration(str, imageWidth, imageHeight, fontFamily, fontWidth);
	    FileOutputStream outputStream = null;
	    try {
	    	outputStream = new FileOutputStream(new File("C:\\temp.png"));
			try {
				outputStream.write(image);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally {
			if(outputStream!=null){
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	    
	}
}
