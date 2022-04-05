SELECT Nombre,
       Plataforma,
       Año,
       Genero,
       Editorial,
       (CASE t.number
            WHEN 1 THEN 'Norteamérica'
            WHEN 2 THEN 'Europa'
            WHEN 3 THEN 'Japón'
            WHEN 4 THEN 'Otros'
           END) as Region,
       (CASE t.number
            WHEN 1 THEN [Ventas NA]
            WHEN 2 THEN [Ventas EU]
            WHEN 3 THEN [Ventas JP]
            WHEN 4 THEN [Ventas Otros]
           END) as Ventas
FROM [Ventas-Videojuegos]
         inner join master.dbo.spt_values t on t.type = 'P' AND t.number between 1 and 4
order by [Ventas Global] desc