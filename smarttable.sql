

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tables_restaurant;

CREATE TABLE tables_restaurant (
  id INT AUTO_INCREMENT PRIMARY KEY,
  number INT NOT NULL UNIQUE,
  capacity INT NOT NULL,
  status ENUM('livre','reservada','ocupada','pedido','preparacao','pronto') NOT NULL DEFAULT 'livre',
  people INT NOT NULL DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO tables_restaurant (number, capacity, status, people) VALUES
(1,2,'livre',0),(2,2,'livre',0),(3,4,'livre',0),(4,4,'livre',0),
(5,6,'livre',0),(6,2,'livre',0),(7,8,'livre',0),(8,4,'livre',0),
(9,6,'livre',0),(10,2,'livre',0),(11,4,'livre',0),(12,10,'livre',0);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(60) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('entrada','mesa','garcom','cozinha','admin') NOT NULL,
  name VARCHAR(90) NOT NULL
);

-- Password de todos: 1234
INSERT INTO users (username,password,role,name) VALUES
('entrada','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','entrada','Tablet Entrada'),
('mesa','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','mesa','Tablet Mesa'),
('garcom','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','garcom','Garçom'),
('cozinha','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','cozinha','Cozinha'),
('admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','admin','Administrador');

CREATE TABLE menu_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1
);

INSERT INTO menu_items (name,category,price) VALUES
('Bruschetta de Tomate','Entradas',5.50),('Sopa do Dia','Entradas',3.80),('Tábua de Queijos','Entradas',8.90),
('Bife da Casa','Pratos',14.90),('Risotto de Cogumelos','Pratos',12.50),('Bacalhau à Chef','Pratos',16.90),('Hambúrguer Premium','Pratos',11.80),
('Água','Bebidas',1.50),('Sumo Natural','Bebidas',3.20),('Café','Bebidas',1.10),
('Mousse de Chocolate','Sobremesas',4.20),('Cheesecake','Sobremesas',4.80);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  table_id INT NOT NULL,
  status ENUM('novo','processando','finalizado','entregue','cancelado') NOT NULL DEFAULT 'novo',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (table_id) REFERENCES tables_restaurant(id)
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  menu_item_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);
