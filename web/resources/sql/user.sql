create table if not exists User
(
    email_id VARCHAR(50) NOT NULL, /*key of User*/
    pwd      VARCHAR(50) NOT NULL,
    uname    VARCHAR(30) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT CHK_VALID_EMAIL CHECK (email_id LIKE '%@%.%') /*email form constraint*/
)default CHARSET=utf8;