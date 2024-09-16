package Control;

import DAO.DAOProduct;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet(name="UpdateCartQuantityController", urlPatterns={"/update-quantity"})
public class UpdateCartQuantityController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        if (session.getAttribute("acc") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }
            
            DAOProduct daoProduct = new DAOProduct();
            Product product = daoProduct.getProductByProductID(productId);
            
            if (product != null && carts.containsKey(productId)) {
                int availableQuantity = product.getQuantity();
                int oldQuantity = carts.get(productId).getQuantity();
                
                // Kiểm tra và điều chỉnh số lượng mới
                int maxAllowedQuantity = availableQuantity + oldQuantity;
                if (newQuantity > maxAllowedQuantity) {
                    newQuantity = maxAllowedQuantity;
                }
                
                if (newQuantity < 1) {
                    carts.remove(productId);
                    daoProduct.updateProductQuantity(productId, availableQuantity + oldQuantity);
                } else {
                    carts.get(productId).setQuantity(newQuantity);
                    int quantityToUpdate = availableQuantity + oldQuantity - newQuantity-1;
                    daoProduct.updateProductQuantity(productId, quantityToUpdate);
                }
                
                session.setAttribute("carts", carts);
            } else {
                request.setAttribute("quantityError", "Product not found in cart.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("quantityError", "Invalid quantity format.");
        } catch (Exception e) {
            request.setAttribute("quantityError", "An error occurred while updating the cart.");
        }
       
        request.getRequestDispatcher("cartsURL").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}