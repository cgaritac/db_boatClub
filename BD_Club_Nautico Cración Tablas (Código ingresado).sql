Create Database Club_Nautico

Go

Use Club_Nautico


Create Table Socios 
(
	IdSocio int Not Null,
	Nombre varchar (50) Not Null,
	Direccion varchar (100) Not Null,
	email varchar (50) Null,
	Teléfono int Not Null,
	Constraint PK_Socios Primary Key(IdSocio), 
);

Go

Create Table Barco 
(
	IdBarco int Not Null, 
	Matricula varchar (20) Not Null,  
	Nombre varchar (50) Null, 
	Namarre int Not Null, 
	Cuota int Not Null, 
	Tipo varchar (20) Null, 
	Año int Null, 
	Eslora int Not Null
	Constraint PK_Barco Primary Key(IdBarco), 
);

Go

Create Table Rutas 
(
	IdRuta int Not Null, 
	Destino varchar (100) Not Null, 
	fsalida date Not Null, 
	fregreso date Not Null, 
	Constraint PK_Rutas Primary Key(IdRuta), 
);

Go

Create Table Soc_Bar 
(
	IdSocio int Not Null, 
	IdBarco int Not Null,
	Constraint FK_Socios_Soc_Bar Foreign key (IdSocio) References Socios(IdSocio),
	Constraint FK_Barco_Soc_Bar Foreign key (IdBarco) References Barco(IdBarco)
);

Go

Create Table Rut_Soc 
(
	IdSocio int Not Null, 
	IdRuta int Not Null,
	Constraint FK_Rutas_Rut_Soc Foreign key (IdRuta) References Rutas(IdRuta),
	Constraint FK_Socios_Rut_Soc Foreign key (IdSocio) References Socios(IdSocio),
);

Go

Create view Salidas
 as
 Select b.Namarre as Número_de_amarre, b.Nombre as Nombre_del_barco, r.destino as Destino, r.fsalida as Fecha_de_salida
 From Barco as b
 Join Soc_Bar as sb on b.IdBarco=sb.IdBarco
 join Socios as s on s.IdSocio=sb.IdSocio
 join Rut_Soc as rs on rs.IdSocio=s.IdSocio
 join Rutas as r on r.IdRuta=rs.IdRuta

 Go

 Create view Llegadas
 as
 Select s.Nombre as Nombre_del_socio, b.Matricula as Matrícula_del_barco, r.destino as Destino, r.fregreso as Fecha_de_regreso
 From Barco as b
 Join Soc_Bar as sb on b.IdBarco=sb.IdBarco
 join Socios as s on s.IdSocio=sb.IdSocio
 join Rut_Soc as rs on rs.IdSocio=s.IdSocio
 join Rutas as r on r.IdRuta=rs.IdRuta