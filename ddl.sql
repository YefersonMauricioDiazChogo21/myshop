DROP DATABASE IF EXISTS myshop;
CREATE DATABASE myshop;
USE myshop;

CREATE TABLE clientes(
    id VARCHAR(20),
    nombre VARCHAR(14),
    apellidos VARCHAR(100),
    celular DECIMAL(10,0),
    direccion VARCHAR(80),
    correo_electonico VARCHAR(70),
    CONSTRAINT pk_cliente_id PRIMARY KEY (id)
);

CREATE TABLE categorias(
    id_categoria INT,
    descripcion VARCHAR(45),
    estado TINYINT,
    CONSTRAINT pk_categoria_id PRIMARY KEY (id_categoria)
);

CREATE TABLE productos(
    id_producto INT,
    nombre VARCHAR(45),
    id_categoria INT,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT,
    estado TINYINT,
    CONSTRAINT pk_producto_id PRIMARY KEY (id_producto),
    CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE medio_pago(
    id_medio_pago INT,
    descripcion VARCHAR(20),
    CONSTRAINT pk_medio_pago_id PRIMARY KEY (id_medio_pago)
);

CREATE TABLE compras(
    id_compra INT,
    id_cliente VARCHAR(20),
    fecha DATETIME,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
    CONSTRAINT pk_compra_id PRIMARY KEY (id_compra),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id) REFERENCES clientes(id),
    CONSTRAINT fk_medio_pago FOREIGN KEY (medio_pago) REFERENCES medio_pago(id_medio_pago)
);

CREATE TABLE compras_productos(
    id_compra INT,
    id_producto INT,
    cantidad INT,
    total DECIMAL(16,2),
    estado TINYINT,
    CONSTRAINT pk_compra_producto_id PRIMARY KEY (id_compra,id_producto),
    CONSTRAINT fk_id_compra FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);