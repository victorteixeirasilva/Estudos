package infrastructure.repositories;

import domain.models.Customer;
import domain.models.ProfilePhoto;
import domain.repositories.CustomerRepository;

import java.util.List;

public class HibernateCustomerRepository implements CustomerRepository {
    @Override
    public List<Customer> find() {
        return List.of(new Customer("customerId", List.of(new ProfilePhoto("profilePhotoId", "originalPhoto", "generatedPhoto"))));
    }
}
