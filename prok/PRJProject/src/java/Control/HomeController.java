package Control;

import DAO.DAOProduct;
import entity.Category;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name="HomeController", urlPatterns={"/HomeURL"})
public class HomeController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        DAOProduct dao = new DAOProduct();
        
        List<Product> listP = dao.getProduct("select * from Products");
        List<Category> listC = dao.getCategory("select * from Categories");
        Product last = dao.getLast();
        

        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("p", last);

        request.getRequestDispatcher("Home.jsp").forward(request, response);
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