package application.dto;

import java.util.UUID;

public record ProfilePhoto(String id, String originalPhoto, String generatedPhoto) {

    public domain.models.ProfilePhoto toDomain() {
        return new domain.models.ProfilePhoto(UUID.randomUUID().toString(), null, null);
    }
}