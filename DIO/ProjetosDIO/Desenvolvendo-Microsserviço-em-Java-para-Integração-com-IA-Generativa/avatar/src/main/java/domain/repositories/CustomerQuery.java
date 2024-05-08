package domain.repositories;

import java.util.Optional;
import java.util.Set;

public class CustomerQuery {
    private final Optional<Set<String>> ids;

    public Optional<Set<String>> getIds(){
        return ids;
    }

    private CustomerQuery (Optional<Set<String>> ids){
        this.ids = ids;
    }
}
