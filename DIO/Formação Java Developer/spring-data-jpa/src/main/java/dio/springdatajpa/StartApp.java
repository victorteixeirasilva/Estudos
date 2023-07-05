package dio.springdatajpa;

import dio.springdatajpa.model.User;
import dio.springdatajpa.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class StartApp implements CommandLineRunner {
    @Autowired
    private UserRepository repository;

    @Override
    public void run(String... args) throws Exception {
        insertUser();
        List<User> users = repository.filtrarPorNome("Victor");
        for(User u : users){
            System.out.println(u);
        }
    }

    private void insertUser(){
        User user = new User();
        user.setName("Victor Teixeira");
        user.setUsername("victor230803");
        user.setPassword("12345678");
        repository.save(user);
    }

}
