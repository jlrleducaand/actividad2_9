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
import java.util.Optional;

@WebServlet(name = "BuscarClienteServlet", value = "/BuscarClienteServlet")
public class BuscarClienteServlet extends HttpServlet {

    private ClienteDAO clienteDAO = new ClienteDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //aunque nunca va a pasar
        request.setAttribute("errorBuscar", "Error");
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        try {
            //obtener el cliente
            Optional<Cliente> optionalCliente=this.clienteDAO.find(Integer.parseInt(request.getParameter("codigo")));
            if (optionalCliente.isPresent()){
                request.setAttribute("cliente", optionalCliente.get());
                //enviarlo a detalle
                dispatcher = request.getRequestDispatcher("WEB-INF/banco/detalle.jsp");
            }
        }catch (Exception e){
        }
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        String nombre = request.getParameter("nombre");
        //buscar segun el nombre
        List<Cliente> clienteList = this.clienteDAO.find(nombre);
        //segun cantidad hacer cosa diferente
        if (clienteList.isEmpty()){
            request.setAttribute("errorBuscar", "No encontrado");
            dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        }
        else if (clienteList.size()==1){
            request.setAttribute("cliente", clienteList.get(0));
            dispatcher = request.getRequestDispatcher("WEB-INF/banco/detalle.jsp");
        }else{
            request.setAttribute("cliente", clienteList);
            dispatcher = request.getRequestDispatcher("WEB-INF/banco/buscar.jsp");
        }
        dispatcher.forward(request,response);
    }
}
