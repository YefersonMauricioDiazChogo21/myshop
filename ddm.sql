INSERT INTO clientes ( id ,nombre ,apellidos ,celular ,direccion, correo_electonico) VALUES
    (1005539417,"Yeferson", "Diaz Chogo",3143807720,"Barrio Las Granjas","Yefer@gmail.com"),
    (1005539418,"Laura", "Torres",3143807721,"Palomitas","laura@gmail.com"),
    (1005539419,"Valentina", "Herrera",3143807722,"Florida","valentinaH@gmail.com"),
    (1005539420,"Karol", "Ramirez",3143807723,"Mutis","KarolR@gmail.com");

INSERT INTO categorias( id_categoria ,descripcion ,estado) VALUES
    (1,"Aseo personal",1),
    (2,"Limpieza",2),
    (3,"Abarrotes",1),
    (4,"Bebidas",2),
    (5,"Lacteos",2),
    (6,"Congelados",1);

INSERT INTO productos(id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
    (1,"Jabon Protex",1,"",2000,20,1),
    (2,"Fabuloso",2,"",3000,15,1),
    (3,"Arroz Diana",3,"",3800,22,1),
    (4,"Coca-cola personal",4,"",3000,20,1),
    (5,"Alqueria litro",5,"",4500,25,1),
    (6,"Perniles de pollo",6,"",7800,10,1),
    (7,"Saviloe",4,"",3500,20,1),
    (8,"Panela",3,"",2500,20,1);

INSERT INTO compras(id_compra, id_cliente, fecha, medio_pago, comentario, estado) VALUES
    (1,1005539417,"2024-07-02","E","",1);

INSERT INTO compras_productos(id_compra, id_producto, cantidad, total, estado) VALUES
    (1,1,2,4000,1),
    (1,2,3,9000,1);