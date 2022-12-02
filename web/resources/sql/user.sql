create table if not exists User
(
    email_id VARCHAR(300) NOT NULL, /*key of User*/
    pwd      VARCHAR(300) NOT NULL,
    uname    VARCHAR(300) NOT NULL,
    profile_img VARCHAR(3000) NOT NULL,
    PRIMARY KEY (email_id)
)default CHARSET=utf8;