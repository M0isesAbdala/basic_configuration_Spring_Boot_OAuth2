package abdala.resource.resource.repository;

import abdala.resource.resource.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}