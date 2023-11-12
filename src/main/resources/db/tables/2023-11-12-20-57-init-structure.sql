CREATE TABLE customer (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    register_date DATE DEFAULT now(),
    birth_date DATE NOT NULL,
    address VARCHAR(255),
    zipcode CHAR(5),
    city VARCHAR(50),
    phone_number VARCHAR(20)
);

CREATE TABLE purchase_order (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date DATE NOT NULL,

    customer_id UUID NOT NULL,
    CONSTRAINT fk_customer_purchase_order FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE RESTRICT
);

CREATE TABLE product_category (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    description TEXT
);

create table product (
    id UUID PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(5, 2) NOT NULL,
    available_stock INT,

    product_category_id UUID NOT NULL,
    CONSTRAINT fk_product_product_category FOREIGN KEY (product_category_id) REFERENCES product_category (id) ON DELETE RESTRICT
);

CREATE TABLE order_product (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    order_id UUID NOT NULL,
    CONSTRAINT fk_order_product_purchase_order FOREIGN KEY (order_id) REFERENCES purchase_order (id) ON DELETE RESTRICT,

    product_id UUID NOT NULL,
    CONSTRAINT fk_order_product_product FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE RESTRICT
);