package com.elife.book.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Integer> {

    // method to find a Token entity by its token field.
    // Returns an Optional<Token>, which will be empty if no token is found.

    Optional<Token> findByToken(String token);
}
