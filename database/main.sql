DROP TABLE IF EXISTS OTP cascade;
DROP TABLE IF EXISTS User_status cascade;
DROP TABLE IF EXISTS Users cascade;

CREATE TABLE User_status (
    id              INTEGER     GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    status_name     TEXT       
);

CREATE TABLE Users (
    id        INTEGER     GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    status_id INTEGER     REFERENCES User_status,
    name      TEXT,
    email     TEXT        UNIQUE
);

CREATE TABLE OTP (
    id       INTEGER     GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id  INTEGER     REFERENCES Users,
    Otp      TEXT,
    attempt  INTEGER
);

INSERT INTO User_status (id, status_name) VALUES (1, 'Pending');
INSERT INTO User_status (id, status_name) VALUES (2, 'Failed');
INSERT INTO User_status (id, status_name) VALUES (3, 'Success');

INSERT INTO Users (id, status_id, name, email) VALUES (1, 1, 'James', 'tsuisauchi.tsc@gmail.com');