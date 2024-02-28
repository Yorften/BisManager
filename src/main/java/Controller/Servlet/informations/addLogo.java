package Controller.Servlet.informations;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controler.JDBC.MYSQL.SqlConnection;

/**
 * Servlet implementation class addLogo
 */
@WebServlet("/addLogo")
@MultipartConfig
public class addLogo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addLogo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		String saveFile="";
		String contenttype =request.getContentType();
		
			DataInputStream in=new  DataInputStream(request.getInputStream());
			int formDatalenght =request.getContentLength();
			byte dataBytes[] =new byte[formDatalenght];
			int byteRead =0;
			int  totalBytesRead =0;
			 while(totalBytesRead< formDatalenght) {
				 byteRead=in.read(dataBytes,totalBytesRead,formDatalenght);
				 totalBytesRead+=byteRead;
			 }
			 String file=new String (dataBytes);
			 saveFile=file.substring(file.indexOf("filename=\"")+10);
			 saveFile=file.substring(0,saveFile.indexOf("\n"));
			 saveFile=file.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
		
		int lastIndex=contenttype.lastIndexOf("-");
		String boundary=contenttype.substring(lastIndex+1,contenttype.length());
		int pos;
		pos=file.indexOf("filename=\"");
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		int boundaryLocation =file.indexOf(boundary,pos)-4;
		int startPos =((file.substring(0, pos)).getBytes()).length;
		int endPos =((file.substring(0, boundaryLocation)).getBytes()).length;
		File ff=new File("C:\\Users\\hp\\eclipse-workspace\\Gestion3\\src\\main\\webapp\\images\\"+saveFile); 		
		FileOutputStream fileOut =new FileOutputStream(ff);
		fileOut.write(dataBytes,startPos,(endPos-startPos)); 
	 	fileOut.flush();
	 	fileOut.close();
		
		
		
		RequestDispatcher dispatcher = null;
		try {

			String sql = "UPDATE `entreprise_info` SET `Logo`=? where `code`='0'";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);			
			PS.setString(1,ff.getPath() );

			int num = PS.executeUpdate();

			

			dispatcher = request.getRequestDispatcher("informations");
			if (num > 0) {
				request.setAttribute("status", "logo_Updated");
				System.err.println("worked");
			} else {
				request.setAttribute("status", "logo_not_uptated");
				System.err.println("not worked");
			}
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}		

		
		
		
		
		
		/*Part img = request.getPart("image");
		System.out.println(img.getName());
		int num = SQLinformations.addLogoImage(img);
		RequestDispatcher dispatcher = null;
		
		try {

			dispatcher = request.getRequestDispatcher("informations");
			if (num > 0) {
				request.setAttribute("status", "logo_Updated");
				System.err.println("worked");
			} else {
				request.setAttribute("status", "logo_not_uptated");
				System.err.println("not worked");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}
*/
	}

}
