package Control;

import entity.Product;
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
import entity.Cart;

@WebServlet(name="AddToCartController", urlPatterns={"/addToCartURL"})
public class AddToCartController extends HttpServlet {
   
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
                /* TODO output your page here. You may use following sample code. */
                int productId = Integer.parseInt(request.getParameter("pid"));
                
                //map    productId | cart
                HttpSession session = request.getSession();
                Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                
                
                if (carts.containsKey(productId)) {//sản phẩm đã có trên giỏ hàng
                    int oldQuantity = carts.get(productId).getQuantity();
                    carts.get(productId).setQuantity(oldQuantity + 1);
                    
                } else {//sản phẩm chưa có trên giỏ hàng
                    
                    Product product = new DAO.DAOProduct().getProductByProductID(productId);
                    
                    carts.put(productId, new Cart(1, product));
                }
                //lưu carts lên session
                session.setAttribute("carts", carts);
                response.sendRedirect("HomeURL");
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
        processRequest(request, response);
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
