CREATE TABLE IF NOT EXISTS profile_photos (
    curtomer_id VARCHAR(36) NOT NULL,
    id VARCHAR(36) NOT NULL,
    original_photo VARCHAR(200),
    generated_photo VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (curtomer_id, id)
);

INSERT INTO profile_photos (curtomer_id, id, original_photo, generated_photo) VALUES
("customer-1", "weqeqweqw-eqqweqweq-qeqweqeq-qweqeq","customer-1-original-photo-1-path", "customer-1-generated-photo-1-path"),
("customer-1", "asadasass-dsdsdsdaw-bxaerazv-tgsaer","customer-1-original-photo-2-path", "customer-1-generated-photo-2-path"),
("customer-2", "0eqeqweqw-0qqweqweq-0eqweqeq-0weqeq","customer-2-original-photo-1-path", "customer-2-generated-photo-1-path");