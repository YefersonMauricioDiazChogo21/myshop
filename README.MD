## Consultas Básicas

1. Consultar todos los productos y sus categorías

   ```sql
   SELECT 
       p.id_producto,
       p.nombre, 
       c.descripcion
   FROM
   	productos p
   JOIN categorias c ON c.id_categoria= p.Id_categoria;
   ```

2. Consultar todas las compras y los clientes que las realizaron

   ```sql
   SELECT 
   	c.id_compra,
   	c.fecha,
   	p.nombre AS "Producto",
   	cp.cantidad,
   	cp.total,
   	cl.nombre AS "Cliente"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   JOIN clientes cl ON cl.id=c.id_cliente;
   ```

3. Consultar los productos comprados en una compra específica

   ```sql
   SELECT 
   	c.id_compra,
   	p.nombre AS "Productos"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   WHERE c.id_compra=1;
   ```

4. Agregar un nuevo producto

   ```sql
   INSERT INTO productos(id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES (9,"Esponja",2,"",2000,15,2);
   ```

5. Actualizar el stock de un producto

   ```sql
   UPDATE productos
   SET cantidad_stock=cantidad_stock-2
   WHERE id_producto=1;
   ```

6. Consultar todas las compras de un cliente específico

   ```sql
   SELECT 
   	id_compra,
   	id_cliente
   FROM
   	compras
   WHERE id_cliente=1005539417;
   ```

7. Consultar todos los clientes y sus correos electrónicos

   ```sql
   SELECT 
   	id,
       nombre,
       correo_electonico
   FROM
   	clientes;
   ```

8. Consultar la cantidad total de productos comprados en cada compra

   ```sql
   SELECT
   	c.id_compra,
   	SUM(cp.cantidad) AS "Total Productos"
   FROM
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   GROUP BY c.id_compra;
   ```

9. Consultar las compras realizadas en un rango de fechas

   ```sql
   SELECT 
   	id_compra,
   	fecha
   FROM 
   	compras
   WHERE fecha BETWEEN "2024-07-01" AND "2024-07-31";
   ```

   

## Consultas usando funciones agregadas

1. Contar la cantidad de productos por categoría

   ```sql
   SELECT
   	c.descripcion AS "Categoria",
   	COUNT(p.id_producto) AS "Total Productos En Categoria"
   FROM 
   	productos p
   JOIN categorias c ON c.id_categoria= p.id_categoria
   GROUP BY c.descripcion;
   ```

2. Calcular el precio total de ventas por cada cliente

   ```sql
   SELECT 
   	cl.id,
   	cl.nombre AS "Cliente",
   	SUM(cp.total) AS "Precio Total De Compras"
   FROM
   	clientes cl
   JOIN compras c ON c.id_cliente=cl.id
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   GROUP BY cl.id;
   ```

3. Calcular el precio promedio de los productos por categoría

   ```sql
   SELECT
   	c.descripcion AS "Categoria",
   	AVG(p.precio_venta) AS "AVG Precios Por Categoria"
   FROM 
   	productos p
   JOIN categorias c ON c.id_categoria= p.id_categoria
   GROUP BY c.descripcion;
   ```

4. Encontrar la fecha de la primera y última compra registrada

   ```sql
   SELECT 
   	id_compra,
   	MIN(fecha) AS "Primera fecha"
   FROM
   	compras c
   GROUP BY id_compra;
   
   SELECT 
   	id_compra,
   	MAX(fecha) AS "Ultima fecha"
   FROM
   	compras c
   GROUP BY id_compra;
   ```

5. Calcular el total de ingresos por ventas

   ```sql
   SELECT 
   	c.id_compra,
   	SUM(cp.total) AS "Total Compra"
   FROM 
   	compras c
   JOIN compras_productos cp ON c.id_compra=cp.id_compra
   GROUP BY c.id_compra;
   ```

6. Contar la cantidad de compras realizadas por cada medio de pago

   ```sql
   SELECT 
   	DISTINCT(medio_pago),
   	COUNT(id_compra) AS "Cantidad de compras"
   FROM
   	compras
   GROUP BY medio_pago;
   ```

7. Calcular el total de productos vendidos por cada producto

   ```sql
   SELECT 
   	p.id_producto,
   	p.nombre,
   	SUM(cp.cantidad) AS "Total Productos Vendidos"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   GROUP BY p.id_producto;
   ```

8. Obtener el promedio de cantidad de productos comprados por compra

   ```sql
   SELECT 
   	c.id_compra,
   	avg(cp.cantidad) AS "Promedio Productos"
   FROM 
   	compras c
   JOIN compras_productos cp ON c.id_compra=cp.id_compra
   GROUP BY c.id_compra;
   ```

9. Encontrar los productos con el stock más bajo

   ```sql
   SELECT 
   	id_producto,
   	nombre,
   	cantidad_stock
   FROM 
   	productos
   ORDER BY cantidad_stock ASC;
   ```

10. Calcular el total de productos comprados y el total gastado por cliente

    ```sql
    SELECT 
    	cl.nombre AS "Cliente",
    	SUM(cp.cantidad) AS "Total Productos Comprados",
    	SUM(cp.total) AS "Total Gastado"
    FROM 
    	compras c
    JOIN compras_productos cp ON cp.id_compra=c.id_compra
    JOIN clientes cl ON cl.id=c.id_cliente
    GROUP BY cl.id;
    ```

## Consultas usando join

1. Consultar todos los productos con sus categorías 

   ```sql
   SELECT 
       p.id_producto,
       p.nombre, 
       c.descripcion
   FROM
   	productos p
   JOIN categorias c ON c.id_categoria= p.Id_categoria;
   ```

2. Consultar todas las compras y los clientes que las realizaron

   ```sql
   SELECT
   	c.id_compra,
   	cl.nombre
   FROM 
   	compras c
   JOIN clientes cl ON cl.id=c.id_cliente;
   ```

3. Consultar los productos comprados en cada compra

   ```sql
   SELECT 
   	c.id_compra,
   	GROUP_CONCAT(p.nombre ORDER BY p.nombre SEPARATOR ', ') AS "Productos"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   GROUP BY c.id_compra;
   ```

4. Consultar las compras realizadas por un cliente específico

   ```sql
   SELECT 
   	id_compra,
   	id_cliente
   FROM
   	compras
   WHERE id_cliente=1005539417;
   ```

5. Consultar el total gastado por cada cliente

   ```sql
   SELECT 
   	cl.id,
   	cl.nombre AS "Cliente",
   	SUM(cp.total) AS "Total Gastado"
   FROM
   	clientes cl
   JOIN compras c ON c.id_cliente=cl.id
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   GROUP BY cl.id;
   ```

6. Consultar el stock disponible de productos y su categoría

   ```sql
   SELECT 
   	p.nombre AS "Producto",
   	p.cantidad_stock AS "Stock Disponible",
   	c.descripcion AS "Categoria"
   FROM 
   	productos p
   JOIN categorias c ON p.id_categoria =c.id_categoria;
   ```

7. Consultar los detalles de compras junto con la información del cliente y el producto

   ```sql
   
   ```

8. Consultar los productos que han sido comprados por más de una cantidad específica

   ```SQL
   SELECT 
   	DISTINCT(p.nombre) AS "Producto"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   WHERE cp.cantidad>2;
   ```

9. Consultar la cantidad total de productos vendidos por categoría

   ```sql
   SELECT 
   	ca.descripcion AS "Categoria",
   	SUM(cp.cantidad) AS "Total Productos Vendidos"
   FROM 
   	compras c
   JOIN compras_productos cp ON cp.id_compra=c.id_compra
   JOIN productos p ON p.id_producto=cp.id_producto
   JOIN categorias ca ON p.id_categoria=ca.id_categoria
   GROUP BY ca.descripcion;
   ```

10. Consultar los clientes que han realizado compras en un rango de fechas específico

    ```sql
    SELECT 
    	DISTINCT(cl.nombre) AS "Cliente",
    	fecha
    FROM 
    	compras c
    JOIN clientes cl ON c.id_cliente=cl.id
    WHERE c.fecha BETWEEN "2024-07-01" AND "2024-07-31";
    ```

11. Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados

    ```sql
    SELECT 
    	cl.nombre AS "Cliente",
    	SUM(cp.total) AS "Total Gastado",
    	SUM(cp.cantidad) AS "Total Productos Comprados"
    	
    FROM 
    	compras c
    JOIN compras_productos cp ON cp.id_compra=c.id_compra
    JOIN clientes cl ON cl.id=c.id_cliente
    GROUP BY cl.id;
    ```

12. Consultar los productos que nunca han sido comprados

    ```sql
    SELECT
    	p.nombre AS "Productos No Vendidos"
    FROM
    	productos p
    LEFT JOIN compras_productos cp ON cp.id_producto=p.id_producto
    WHERE cp.id_producto IS NULL;
    ```

13. Consultar los clientes que han realizado más de una compra y el total gastado por ellos

    ```sql
    SELECT 
    	cl.nombre AS "Cliente",
    	COUNT(DISTINCT c.id_compra) AS Compras,
    	SUM(cp.total) AS "Total Gastado"
    FROM
    	compras c
    JOIN compras_productos cp ON cp.id_compra=c.id_compra
    JOIN clientes cl ON cl.id=c.id_cliente
    GROUP BY cl.nombre
    HAVING COUNT(DISTINCT c.id_compra) >1;
    ```

14. Consultar los productos más vendidos por categoría

    ```sql
    SELECT
        ca.descripcion AS "Categoria",
        p.nombre AS "Producto Mas Vendido",
        t.max_vendido AS "Productos Vendidos"
    FROM
        categorias ca
    JOIN (
        SELECT
            p.id_categoria,
            p.id_producto,
            SUM(cp.cantidad) AS max_vendido
        FROM
            productos p
        JOIN compras_productos cp ON p.id_producto = cp.id_producto
        JOIN compras c ON cp.id_compra = c.id_compra
        GROUP BY p.id_categoria, p.id_producto
    ) t ON ca.id_categoria = t.id_categoria
    JOIN productos p ON t.id_producto = p.id_producto
    WHERE t.max_vendido = (
        SELECT MAX(SUM(cp.cantidad))
        FROM productos p2
        JOIN compras_productos cp ON p2.id_producto = cp.id_producto
        WHERE p2.id_categoria = ca.id_categoria
        GROUP BY p2.id_producto
    )
    ORDER BY ca.descripcion;
    ```

15. Consultar las compras realizadas por clientes de una ciudad específica y el total gastado

    ```sql
    SELECT 
    	c.id_compra,
    	cl.id AS "Cliente",
    	ci.nombre AS "Ciudad"
    FROM
    	compras c
    JOIN clientes cl ON cl.id=c.id_cliente
    JOIN ciudades ci ON ci.id_ciudad=cl.id_ciudad
    WHERE ci.nombre="Bucaramanga"
    GROUP BY cl.id, c.id_compra;
    ```

16. Consultar los proveedores que han suministrado productos y la cantidad total suministrada

    ```sql
    SELECT 
    	pr.nombre AS "Proveedor",
    	SUM(p.cantidad_stock) AS "Productos suministrados"
    FROM
    	proveedores pr
    JOIN productos p ON p.id_proveedor =pr.id_proveedor
    GROUP BY pr.nombre;
    ```

    

## Subconsultas

1. Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos

   ```sql
   SELECT 
   	nombre AS "Producto",
   	precio_venta
   FROM
   	productos
   WHERE 
   	precio_venta> (SELECT AVG(precio_venta) FROM productos);
   ```

2. Consultar los clientes que han gastado más del promedio general en sus compras

   ```sql
   SELECT 
   	nombre AS "Cliente"
   FROM
   	clientes
   WHERE 
   	> (SELECT AVG() FROM );
   ```

3. Consultar las categorías que tienen más de 5 productos

   ```sql
   SELECT
   	descripcion AS "Categoria"
   FROM
   	categorias 
   HAVING COUNT((SELECT id_producto FROM productos))
   ```

4. Consultar los productos más vendidos (top 5) por categoría

   ```sql
   
   ```

5. Consultar los clientes que han realizado compras en los últimos 30 días

   ```sql
   
   ```

6. Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes

   ```sql
   
   ```

7. Consultar las categorías que tienen productos con un stock por debajo del promedio general

   ```sql
   SELECT 
   	nombre AS "Producto",
   	cantidad_stock
   FROM
   	productos
   WHERE 
   	cantidad_stock<(SELECT AVG(cantidad_stock) FROM productos);
   ```

8. Consultar los productos que han sido comprados por todos los clientes

   ```sql
   
   ```

9. Consultar las compras que tienen más productos que el promedio de productos por compra

   ```sql
   
   ```

10. Consultar los productos que se han vendido menos de la cantidad promedio de productos vendidos

    ```sql
    
    ```

    