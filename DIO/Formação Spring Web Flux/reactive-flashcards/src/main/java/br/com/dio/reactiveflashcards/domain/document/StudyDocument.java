package br.com.dio.reactiveflashcards.domain.document;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.OffsetDateTime;
import java.util.List;

@Document(collection = "studies_decks")
public record StudyDocument(
    @Id
    String id,
    String userId,
    StudyDeck studyDeck,
    List<Questions> questions,
    @CreatedDate
    @Field("created_at")
    OffsetDateTime createdAt,
    @LastModifiedDate
    @Field("updated_at")
    OffsetDateTime updatedAt

) {

}
