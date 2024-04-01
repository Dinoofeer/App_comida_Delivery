-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Creación de la tabla Pedido
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    fecha_pedido DATE,
    total DECIMAL(10, 2)
);


-- Creación de la tabla Consumible
CREATE TABLE Consumible (
    id_consumible SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(8, 2)
);

-- Creación de la tabla Establecimiento
CREATE TABLE Establecimiento (
    id_establecimiento SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Creación de la tabla Repartidor
CREATE TABLE Repartidor (
    id_repartidor SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(15)
);

-- Creación de la tabla Pedido_Consumible para la relación muchos a muchos entre Pedido y Consumible
CREATE TABLE Pedido_Consumible (
    id_pedido INT,
    id_consumible INT,
    PRIMARY KEY (id_pedido, id_consumible),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_consumible) REFERENCES Consumible(id_consumible)
);

-- Creación de la tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT,
    id_consumible INT,
    cantidad INT,
    FOREIGN KEY (id_pedidos) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_consumible) REFERENCES Consumible(id_consumible)
);


-- Insertar datos para tabla de  clientes
INSERT INTO Cliente (nombre, direccion, telefono) VALUES
('Juan', 'Calle 123, Cancún', '9981234567'),
('María', 'Avenida 456, Cancún', '9987654321'),
('Pedro', 'Calle Principal, Cancún', '9989876543');

-- Insertar datos para la tabla deestablecimientos
INSERT INTO Establecimiento (nombre, direccion, telefono) VALUES
('Restaurante A', 'Avenida Principal, Cancún', '9981112222'),
('Restaurante B', 'Calle 456, Cancún', '9983334444');

-- Insertar datos para la tabla consumibles
	INSERT INTO Consumible (nombre, precio) VALUES
	('Hamburguesa', 80.00),
	('Pizza', 100.00),
	('Tacos', 50.00);

-- Insertar datos para la tablarepartidores
INSERT INTO Repartidor (nombre, telefono) VALUES
('Carlos', '9985556666'),
('Ana', '9987778888');

-- Insertar datos para la tabla pedidos
INSERT INTO Pedido (id_cliente, fecha_pedido, total) VALUES
(1, '2024-02-28', 120.00),
(2, '2024-03-01', 150.00),
(3, '2024-03-02', 90.00);

-- Insertar datos para la tabla consumibles de cada pedido
	INSERT INTO Pedido_Consumible (id_pedido, id_consumible) VALUES
	(9, 5), (10, 7),
	(11, 6), (11, 5),
	(12, 7);

INSERT INTO Detalle_Pedido (id_pedido, id_consumible, cantidad) VALUES
(9, 5, 2),
(11, 6, 1),
(12, 7, 3);

INSERT INTO Pedido (id_pedido, id_cliente, fecha_pedido, total) 
VALUES (1, 1, '2024-02-28', 120.00);

INSERT INTO Detalle_Pedido (id_pedido, id_consumible, cantidad) 
VALUES (1, 1, 2);

---Verificar datos de consulta
SELECT * FROM Cliente;
SELECT * FROM Pedido;
SELECT * FROM Establecimiento;
SELECT * FROM Consumible;
SELECT * FROM Repartidor;
Select * from Pedido_Consumible
Select * from Detalle_Pedido

SELECT * FROM Repartidor WHERE nombre = 'Carlos';

DELETE FROM Repartidor
WHERE id_repartidor = (
    SELECT id_repartidor
    FROM Repartidor
    WHERE nombre = 'Carlos'
    LIMIT 1
);

----Nuevo repartido
INSERT INTO Repartidor (nombre, telefono)
VALUES ('Fernando', '9982229187');

----Nuevo Cliente
INSERT INTO Cliente (nombre, direccion, telefono)
VALUES ('Leslie', 'Calle 122 A, Cancún', '9983485721');

-- Modificar el nombre del establecimiento con id_establecimiento = 1
UPDATE Establecimiento
SET nombre = 'Dominos'
WHERE id_establecimiento = 1;

INSERT INTO Establecimiento (nombre, direccion, telefono)
VALUES ('Taco Feliz','20 de noviembre','998854715');

DELETE FROM Establecimiento
WHERE id_establecimiento = 3;

DROP TABLE Consumible;

ALTER TABLE Consumible
ADD COLUMN descripcion VARCHAR(255);
