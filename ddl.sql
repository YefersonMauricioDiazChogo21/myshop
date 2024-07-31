DROP DATABASE IF EXISTS myshop;
CREATE DATABASE myshop;
USE myshop;

CREATE TABLE ciudades(
    id_ciudad INT,
    nombre VARCHAR(20),
    CONSTRAINT pk_cliente_id PRIMARY KEY (id_ciudad)
);

CREATE TABLE clientes(
    id VARCHAR(20),
    nombre VARCHAR(14),
    apellidos VARCHAR(100),
    celular DECIMAL(10,0),
    direccion VARCHAR(80),
    id_ciudad INT,
    correo_electonico VARCHAR(70),
    CONSTRAINT pk_cliente_id PRIMARY KEY (id),
    CONSTRAINT fk_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);

CREATE TABLE categorias(
    id_categoria INT,
    descripcion VARCHAR(45),
    estado TINYINT,
    CONSTRAINT pk_categoria_id PRIMARY KEY (id_categoria)
);

CREATE TABLE proveedores(
    id_proveedor INT,
    nombre VARCHAR(20),
    CONSTRAINT pk_proveedor_id PRIMARY KEY (id_proveedor)
);

CREATE TABLE productos(
    id_producto INT,
    nombre VARCHAR(45),
    id_categoria INT,
    id_proveedor INT,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT,
    estado TINYINT,
    CONSTRAINT pk_producto_id PRIMARY KEY (id_producto),
    CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE compras(
    id_compra INT,
    id_cliente VARCHAR(20),
    fecha DATETIME,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
    CONSTRAINT pk_compra_id PRIMARY KEY (id_compra),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
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