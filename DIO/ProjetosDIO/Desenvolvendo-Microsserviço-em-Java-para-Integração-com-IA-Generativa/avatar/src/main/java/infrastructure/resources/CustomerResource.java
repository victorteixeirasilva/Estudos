package infrastructure.resources;

import application.ApplicationService;
import application.dto.Customer;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

import java.util.List;

@Path("customers")
public class CustomerResource {
    private final ApplicationService service;

    public CustomerResource(ApplicationService service){
        this.service = service;
    }

    @GET
    public List<Customer> searchCustomers(){
        return  service.searchCustomers();
    }

}
