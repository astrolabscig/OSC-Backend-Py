CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO users (username, full_name, email)
VALUES
    ('sage', 'Sage User', 'sageuser@gmail.com'),
    ('Joe', 'Joe User', 'joeuser@gmail.com'),
    ('Band', 'Band User', 'banduser@gmail.com');


SELECT * FROM USERS 

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    priority INTEGER DEFAULT 1 CHECK (priority BETWEEN 1 AND 5),
    completed BOOLEAN DEFAULT FALSE,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

SELECT * FROM TASKS

INSERT INTO tasks (title, user_id, priority)
VALUES
    ('Wash my clothes', 1, 3),
    ('Learn how to code', 2, 1),
    ('Workout', 3, 2);