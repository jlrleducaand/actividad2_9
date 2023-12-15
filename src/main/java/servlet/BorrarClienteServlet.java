package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ClienteDAO;
import dao.ClienteDAOImpl;

import java.io.IOException;

@WebServlet(name = "BorrarClienteServlet", value = "/BorrarClienteServlet")
public class BorrarClienteServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAOImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int clienteId = Integer.parseInt(request.getParameter("codigo"));
            //borrar segun la id
            this.clienteDAO.delete(clienteId);
        }catch (NumberFormatException e){
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        dispatcher.forward(request,response);
    }
}
