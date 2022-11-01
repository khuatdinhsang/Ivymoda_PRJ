/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.UserInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.UserInfo;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO c = new CategoryDAO();
        List<Category> listCategory = c.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String dob_raw = request.getParameter("dob");
        String gender_raw = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("re_password");
        PrintWriter out = response.getWriter();
        UserInfoDAO uD = new UserInfoDAO();
        AccountDAO aD = new AccountDAO();
        boolean gender;
        int check = 0;
        if (gender_raw.equals("1")) {
            gender = true;
        } else {
            gender = false;
        }
        Date dob = null;
        try {
            dob = Date.valueOf(dob_raw);
        } catch (Exception e) {
        }
        ArrayList<String> listEmail = uD.getEmailFromUser();
        ArrayList<String> listUserName = uD.getListUsername();
        for (String s : listEmail) {
            if (s.equalsIgnoreCase(email)) {
                check = 1;
            }
        }
        for (String s : listUserName) {
            if (s.equalsIgnoreCase(username)) {
                check = 2;
            }
        }
        if (!password.equals(repassword)) {
            check = 3;
        }

        if (check == 0) {
            Account a = new Account(username, password, 0);
            aD.insertAccount(a);
            int accountID = aD.getAccountID();
            UserInfo u = new UserInfo(firstName, lastName, dob, gender, email, phone, username, password, address, accountID);
            uD.insertUser(u);
            HttpSession session = request.getSession();
            session.setAttribute("check", 4);
            response.sendRedirect("alert");
        } else {
            if (check == 1) {
                request.setAttribute("errorEmail", "Email này đã được đăng ký");
            } else if (check == 2) {
                request.setAttribute("errorUser", "Tài khoản này đã tồn tại");
            } else if (check == 3) {
                request.setAttribute("errorPass", "Mật khẩu không khớp");
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
