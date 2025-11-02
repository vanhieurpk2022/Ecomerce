package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import util.Mail;
import util.RandomCode;

/**
 * Servlet implementation class VerifyCodeSending
 */
@WebServlet("/verifyCode")
public class VerifyCodeSending extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCodeSending() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// giải mã json file
		   request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        PrintWriter out = response.getWriter();
	        
	        try {
	            // Đọc JSON
	            StringBuilder sb = new StringBuilder();
	            BufferedReader reader = request.getReader();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                sb.append(line);
	            }
	            
	            // Parse bằng org.json
	            JSONObject jsonRequest = new JSONObject(sb.toString());
	            String email = jsonRequest.getString("email");
	            
	            
	            // Xử lý logic...
	            String code = RandomCode.getInstance().getCode();
	            Mail mail = new Mail();
	            mail.SendVerifyMail(email);
	         
	            // ✅ TẠO và GỬI success response
	            JSONObject jsonResponse = new JSONObject();
	            jsonResponse.put("success", true);
	            jsonResponse.put("message", "Mã đã được gửi!");
	            
	            out.print(jsonResponse.toString());  // ✅ Gửi về client
	            out.flush();  // ✅ Đẩy data đi ngay
	        } catch (Exception e) {
	            JSONObject errorResponse = new JSONObject();
	            errorResponse.put("success", false);
	            errorResponse.put("message", e.getMessage());
	            

	            out.print(errorResponse.toString());  // ✅ Gửi về client
	            out.flush();  // ✅ Đẩy data đi ngay
	        }
	}

}
