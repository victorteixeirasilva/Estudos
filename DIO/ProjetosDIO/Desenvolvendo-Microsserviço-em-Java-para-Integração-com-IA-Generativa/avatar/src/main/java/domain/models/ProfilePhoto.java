package domain.models;

public record ProfilePhoto(
        String id,
        String originalPhoto,
        String generatedPhoto
) {
    public ProfilePhoto {
    }

    public ProfilePhoto(String originalPhoto, String generatedPhoto) {
        this("", originalPhoto, generatedPhoto);
    }
}
