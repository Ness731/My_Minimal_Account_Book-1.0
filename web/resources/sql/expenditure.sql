create table if not exists Expenditure
(
    expend_id   INT           NOT NULL, /*key of User Expenditure*/
    email_id    VARCHAR(50) NOT NULL,
    amount      INT           NOT NULL,
    expend_date DATE          NOT NULL,
    img         VARCHAR(3000) NOT NULL,
    category    VARCHAR(50)   NOT NULL,
    description VARCHAR(3000) NOT NULL,
    tag         VARCHAR(3000) NOT NULL,
    PRIMARY KEY (expend_id)
)default CHARSET=utf8;