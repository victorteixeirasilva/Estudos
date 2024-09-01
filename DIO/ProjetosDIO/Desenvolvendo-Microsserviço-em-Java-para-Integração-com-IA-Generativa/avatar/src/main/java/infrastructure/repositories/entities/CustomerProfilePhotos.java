package infrastructure.repositories.entities;

import domain.models.Customer;
import domain.models.ProfilePhoto;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;

import java.util.List;
import java.util.Objects;

@Entity(name = "profile_photos")
public class CustomerProfilePhotos {
    @EmbeddedId
     CompositeKey compositeKey;

    @Column(name = "original_photo")
    String originalPhoto;

    @Column(name = "generated_photo")
    String generatedPhoto;

    @Embeddable
    static class CompositeKey {

        @Column(name = "customer_id")
        String customerId;
        @Column(name = "id")
        String id;

        public CompositeKey() {}

        public CompositeKey(String customerId, String id) {
            this.customerId = customerId;
            this.id = id;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            CompositeKey that = (CompositeKey) o;
            return Objects.equals(customerId, that.customerId) && Objects.equals(id, that.id);
        }

        @Override
        public int hashCode() {
            return Objects.hash(customerId, id);
        }
    }
    public Customer toDomain() {
        return new Customer(compositeKey.customerId,
                List.of(new ProfilePhoto(originalPhoto, generatedPhoto)));
    }

    public static CustomerProfilePhotos fromDomain(String customerid, ProfilePhoto profilePhoto) {
        var entity = new CustomerProfilePhotos();

        entity.compositeKey = new CompositeKey();
        entity.compositeKey.customerId = customerid;
        entity.compositeKey.id = profilePhoto.id().toString();

        entity.originalPhoto = profilePhoto.originalPhoto();
        entity.generatedPhoto = profilePhoto.generatedPhoto();

        return entity;

    }
}
