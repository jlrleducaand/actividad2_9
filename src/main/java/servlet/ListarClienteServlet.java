package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ClienteDAO;
import dao.ClienteDAOImpl;
import model.Cliente;

import java.io.IOException;
import java.util.List;

//path para arrancar el Banco:
// http://localhost:8080/actividad2_9_war_exploded/ListarClienteServlet
//clase para listar
@WebServlet(name = "ListarClienteServlet", value = "/ListarClienteServlet")
public class ListarClienteServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAOImpl();
    //para entrar pon ListarClienteServlet directamente no hay enlaces
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //listar todos
        List<Cliente> listado = this.clienteDAO.getAll();
        request.setAttribute("listado", listado);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/banco/listado.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}