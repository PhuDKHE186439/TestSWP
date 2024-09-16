/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Control;

import entity.Account;
import entity.Cart;
import entity.Order;
import entity.Shipping;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author MH
 */
@WebServlet(name="Checkout", urlPatterns={"/checkOutURL"})
public class CheckOutController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("acc") != null) {
                HttpSession session = request.getSession();
                Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                //tinh tong tien
                double totalMoney = 0;
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Integer productId = entry.getKey();
                    Cart cart = entry.getValue();
                    totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
                }
                request.setAttribute("totalMoney", totalMoney);
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        //lưu vào database
        //Lưu Shipping
        Shipping shipping = new Shipping(name, phone, address);

        int shippingId = new DAO.DAOShipping().createReturnId(shipping); //trả về id tự tăng của bản ghi vừa lưu vào database
        //Lưu Order
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //tinh tong tien
        double totalPrice = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();

            totalPrice += cart.getQuantity() * cart.getProduct().getPrice();

        }

        Account a = (Account) request.getSession().getAttribute("acc");
        Order order =  new Order(a.getUser_id(),  totalPrice, shippingId);
        System.out.println(order);

        int orderId = new DAO.DAOOrder().createReturnId(order);
        System.out.println(order);
        //Lưu OrderDetail
        System.out.println(orderId);
        new DAO.DAOOrderDetail().saveCart(orderId, carts);

        session.removeAttribute("carts");

        request.setAttribute("messi", "Order Success!");
        request.getRequestDispatcher("HomeURL").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
