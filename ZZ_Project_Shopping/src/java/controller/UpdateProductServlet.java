/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product_M;

/**
 *
 * @author Admin
 */
public class UpdateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        ProductDAO pD = new ProductDAO();
        Product_M p = pD.getProductById(id);
        request.setAttribute("product", p);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);

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
        ProductDAO pD = new ProductDAO();
        String id_raw=request.getParameter("id");
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String color = request.getParameter("color");
        String image = request.getParameter("image");
        String price_raw = request.getParameter("price");
        String description = request.getParameter("description");
        String quantity_raw = request.getParameter("quantity");
        String cateID_raw = request.getParameter("cateID");
        double price = 0;
        int quantity = 0;
        int cateID = 0;
        int id=0;
        try {
            price = Double.parseDouble(price_raw);
            quantity = Integer.parseInt(quantity_raw);
            cateID = Integer.parseInt(cateID_raw);
            id=Integer.parseInt(id_raw);
            Product_M p= new Product_M(id, name, code, color, image, price, description, quantity);
            pD.UpdateProduct(p);
        } catch (Exception e) {
            
        }
        
        response.sendRedirect("listProduct");
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
