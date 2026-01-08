package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PoliciesAndPrivacyController", urlPatterns = {"/privacy"})
public class PoliciesAndPrivacyController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String VIEW = "/views/PoliciesAndPrivacy.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            RequestDispatcher rd = request.getRequestDispatcher(VIEW);
            if (rd == null) {
                // hiếm khi xảy ra, nhưng để debug
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy view: " + VIEW);
                return;
            }
            rd.forward(request, response);
        } catch (Exception e) {
            // Nếu forward bị lỗi (sai path), bạn sẽ thấy rõ nguyên nhân
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi hiển thị trang Policies & Privacy. Kiểm tra đường dẫn VIEW = " + VIEW);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
