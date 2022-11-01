/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.UserInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Category;
import model.UserInfo;

/**
 *
 * @author Admin
 */
@WebServlet(name = "editUserServlet", urlPatterns = {"/editUser"})
public class EditUserServlet extends HttpServlet {

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
            out.println("<title>Servlet editUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editUserServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("user_profile.jsp").forward(request, response);
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
        UserInfoDAO uD= new UserInfoDAO();
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String dob_raw = request.getParameter("dob");
        String gender_raw = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String account_raw = request.getParameter("id");
        int accountID = Integer.parseInt(account_raw);
        boolean gender;
        HttpSession session=request.getSession();
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
        String username=uD.getUserByAccountID(accountID).getUsername();
        String password=uD.getUserByAccountID(accountID).getPassword();
        UserInfo u = new UserInfo(firstName, lastName, dob, gender, email, phone,username,password, address, accountID);
        uD.editUser(u);
        request.setAttribute("user", u);
        request.getRequestDispatcher("user_profile.jsp").forward(request, response);

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
