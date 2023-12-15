package dao;

import model.Cliente;

import java.util.List;
import java.util.Optional;

public interface ClienteDAO {

    public void create(Cliente cliente);

    public List<Cliente> getAll();
    public List<Cliente> find(String nombre);
    public Optional<Cliente> find(int id);
    public void update(Cliente cliente);

    public void delete(int id);
}
