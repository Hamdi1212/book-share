package com.elife.book.auth;


import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Builder


public class RegistrationRequest {


    @NotEmpty(message = "firstname is required")
    @NotBlank(message = "firstname is required")
    private String firstname;
    @NotEmpty(message = "lastname is required")
    @NotBlank(message = "lastname is required")
    private String lastname;
    @Email(message="email is not formatted")
    @NotEmpty(message = "email is required")
    @NotBlank(message = "email is required")
    private String email;
    @NotEmpty(message = "password is required")
    @NotBlank(message = "password is required")
    @Size(min = 8, message="Password should be 8 character")
    private String password;
}
