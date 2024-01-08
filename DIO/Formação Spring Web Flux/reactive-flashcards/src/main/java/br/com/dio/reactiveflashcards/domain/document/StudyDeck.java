package br.com.dio.reactiveflashcards.domain.document;

import lombok.Builder;
import org.springframework.data.annotation.Id;

import java.util.Set;

public record StudyDeck(
        String name,
        String description,
        Set<StudyCard> cards
) {
    @Builder(toBuilder = true)
    public StudyDeck {}
}
