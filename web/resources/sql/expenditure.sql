create table if not exists Expenditure
(
    expend_id   INT           NOT NULL, /*key of User Expenditure*/
    amount      INT           NOT NULL,
    expend_date DATE          NOT NULL,
    img         VARCHAR(8000) NOT NULL,
    category    VARCHAR(50)   NOT NULL,
    description VARCHAR(8000) NOT NULL,
    tag         VARCHAR(8000) NOT NULL,
    PRIMARY KEY (expend_id)
)default CHARSET=utf8;