package domain.repositories;

import domain.models.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> find();
}
