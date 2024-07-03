-- Create the user table
CREATE TABLE "user" (
                        id SERIAL PRIMARY KEY,  -- Use SERIAL instead of AUTO_INCREMENT
                        firstname VARCHAR(255) NOT NULL,
                        lastname VARCHAR(255) NOT NULL,
                        date_of_birth DATE NOT NULL,
                        email VARCHAR(255) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        account_locked BOOLEAN DEFAULT FALSE,
                        enabled BOOLEAN DEFAULT TRUE
);

-- Create the user_id_seq sequence
CREATE SEQUENCE user_id_seq;

-- Create the token table
CREATE TABLE token (
                       id SERIAL PRIMARY KEY,  -- Use SERIAL for auto-incrementing ID
                       token VARCHAR(255) NOT NULL UNIQUE,
                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       expires_at TIMESTAMP NOT NULL,
                       validated_at TIMESTAMP,
                       user_id INT NOT NULL,
                       FOREIGN KEY (user_id) REFERENCES "user"(id)
);
CREATE SEQUENCE token_id_seq;

-- Create the role table
CREATE TABLE role (
                      id SERIAL PRIMARY KEY,
                      name VARCHAR(255) NOT NULL UNIQUE,
                      created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                      last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE SEQUENCE role_id_seq;

-- Create the user_role table
CREATE TABLE user_role (
                           user_id INT NOT NULL,
                           role_id INT NOT NULL,
                           FOREIGN KEY (user_id) REFERENCES "user"(id),
                           FOREIGN KEY (role_id) REFERENCES role(id),
                           PRIMARY KEY (user_id, role_id)
);


