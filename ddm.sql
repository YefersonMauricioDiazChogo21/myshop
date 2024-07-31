INSERT INTO ciudades (id_ciudad, nombre) VALUES
    (1, "Bucaramanga"),
    (2, "Bogota");

INSERT INTO clientes ( id ,nombre ,apellidos ,celular ,direccion,id_ciudad, correo_electonico) VALUES
    (1005539417,"Yeferson", "Diaz Chogo",3143807720,"Barrio Las Granjas",1,"Yefer@gmail.com"),
    (1005539418,"Laura", "Torres",3143807721,"Palomitas",1,"laura@gmail.com"),
    (1005539419,"Valentina", "Herrera",3143807722,"Florida",2,"valentinaH@gmail.com"),
    (1005539420,"Karol", "Ramirez",3143807723,"Mutis",1,"KarolR@gmail.com");

INSERT INTO categorias( id_categoria ,descripcion ,estado) VALUES
    (1,"Aseo personal",1),
    (2,"Limpieza",2),
    (3,"Abarrotes",1),
    (4,"Bebidas",2),
    (5,"Lacteos",2),
    (6,"Congelados",1);

INSERT INTO proveedores(id_proveedor,nombre) VALUES 
    (1,"Protex"),
    (2,"Panorama"),
    (3,"Mi graja");

INSERT INTO productos(id_producto, nombre, id_categoria,id_proveedor, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
    (1,"Jabon Protex",1,1,"",2000,20,1),
    (2,"Fabuloso",2,2,"",3000,15,1),
    (3,"Arroz Diana",3,2,"",3800,22,1),
    (4,"Coca-cola personal",4,2,"",3000,20,1),
    (5,"Alqueria litro",5,2,"",4500,25,1),
    (6,"Perniles de pollo",6,3,"",7800,10,1),
    (7,"Saviloe",4,2,"",3500,20,1),
    (8,"Panela",3,3,"",2500,20,1);

INSERT INTO compras(id_compra, id_cliente, fecha, medio_pago, comentario, estado) VALUES
    (1,1005539417,"2024-07-02","E","",1),
    (2,1005539418,"2024-07-10","T","",1),
    (3,1005539419,"2024-03-05","E","",1),
    (4,1005539420,"2024-04-10","E","",1),
    (5,1005539417,"2024-07-12","T","",1);

INSERT INTO compras_productos(id_compra, id_producto, cantidad, total, estado) VALUES
    (1,1,2,4000,1),
    (1,2,3,9000,1),
    (2,4,1,3000,1),
    (2,6,1,7800,1),
    (3,3,5,19500,1),
    (4,5,2,9000,1),
    (4,8,1,2500,1),
    (5,1,3,6000,1);