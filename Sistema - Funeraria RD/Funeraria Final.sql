use master
go

If(DB_ID('Funeraria')Is Not Null)
Drop DataBase Funeraria
Create DataBase Funeraria
Go

Use Funeraria
Go

Create table Tipo_Item
(Codigo_Tipo_Item int identity primary key,
Descripción varchar(20) not null 
)
Go

Create Table Item
(Codigo_Item Int Identity Primary Key,
Codigo_Tipo_Item Int Not Null References Tipo_Item,
Nombre Varchar(100) Not Null,
Precio Money Not Null
)
Go

Create Table Detalle_Item
(Codigo_Detalle_Item Int Identity Primary Key,
Codigo_Item Int Not Null References Item,
Descripcion Varchar(100) Not Null,
Color Varchar(50) Not Null,
Material Varchar(20) Not Null,
Stock Int Not Null,
RutaImagen Varchar(100) Not Null
)
go

Create Table Plan_Funerario 
(Codigo_Plan_Funerario Int Identity Primary Key,
Descripcion Varchar(200) Not Null,
Precio Money Not Null,
RutaImagen Varchar(100) Not Null,
Estado Varchar(10) Not Null Default 'Activo'
)
Go

Create Table Detalle_Plan_Funerario
(Codigo_Detalle_Plan_Funerario Int Identity Primary Key,
Codigo_Plan_Funerario Int Not Null References Plan_Funerario,
Codigo_Item Int Not Null References Item
)
Go

Create Table Personal
(Codigo_Personal Int Identity Primary Key,
Dni Char(8) Not Null,
Nombre Varchar(50) Not Null,
Apellidos Varchar(100) Not Null,
Cargo varchar(50) not null,
Direccion Varchar(100) Not Null,
Telefono Varchar(70) Null,
Email Varchar(100) Null,
Estado Varchar(100) Not Null Default 'Activo'
)
Go

Create Table Usuario
(Codigo_Usuario Int Identity Primary Key,
Codigo_Personal Int Not Null References Personal unique,
Usuario Varchar(20) Not Null,
Clave Varchar(10) Not Null
)
Go

Create Table Cliente
(Codigo_Cliente Int Identity Primary Key,
Tipo_Persona Varchar(15) Not Null Check(Tipo_Persona in('Natural','Jurídica')),
Tipo_Documento Char(6) Not Null,
Documento Varchar(11) Not Null,
Nombres Varchar(150) Not Null,
Direccion Varchar(100) Not Null,
Telefono Varchar(70) Not Null,
Email Varchar(100) Null
)
Go

Create Table Difunto
(Codigo_Difunto Int Identity Primary Key,
Dni Char(8) Not Null,
Nombres Varchar(60) Not Null,
Apellidos Varchar(100) Not Null,
Sexo Char(1) Not Null Check(Sexo In('M','F')),
Fecha_Nacimiento Date Not Null,
Fecha_Fallecimiento Date Not Null,
Hora Time Not Null,
Causa_Muerte Varchar(200) Null,
Lugar_Fallecimiento Varchar(100) Null,
Estado_Civil Varchar(15) Not Null,
Ruta_Acta_Difunto Varchar(120) Not Null
)
Go

Create Table Parentesco
(Codigo_Parentesco Int Identity Primary Key,
Codigo_Cliente Int Not Null References Cliente,
Codigo_Difunto Int Not Null References  Difunto unique,
Descripcion Varchar(100) Not Null
)
Go

Create table Proveedor
(Codigo_Proveedor int identity Primary key,
RUC char(11) not null,
Razon_Social varchar(200) not null,
Representante varchar(150) not null,
Celular_Representante varchar(12),
Telefono_Empresa varchar(70),
Direccion varchar(200) not null,
Email varchar(100)
)
go

Create table Compras
(Codigo_Compras int identity Primary Key,
Codigo_Proveedor int not null references Proveedor,
Fecha_Compra date not null,
Tipo_Documento varchar(20) not null check(Tipo_Documento in('Boleta','Factura')),
Serie char(3) not null,
Nro_Documento varchar(7) not null,
Total money not null
)
go

Create table Detalle_Compras
(Codigo_Detalle_Compras int identity primary key,
Codigo_Compras int not null references Compras ,
Codigo_Item int not null references Item,
Precio_Compra money not null,
Cantidad int not null,
Igv money not null,
Sub_Total money not null
)
go

Create Table Ventas
(Codigo_Ventas Int Identity Primary Key,
Codigo_Cliente Int Not Null References Cliente,
Codigo_Personal Int Not Null References Personal,
Tipo_Documento varchar(20) not null check(Tipo_Documento in('Boleta','Factura')),
Serie Char(3) Not Null,
NroComprobante Char(7) Not Null,
FechaVenta Date Not Null,
Total Money Not Null
)
Go

Create Table Detalle_Venta
(CodigoDetalleVenta Int Identity Primary Key,
Codigo_Ventas Int Not Null References Ventas,
Codigo_Item Int Not Null References Item,
Cantidad Int Not Null,
Precio_Venta Money Not Null,
Igv Money Not Null,
Dscto Money null default 0,
Sub_Total Money Not Null
)
Go

Create Table Informacion_Venta
(Codigo_Informacion_Venta int identity primary key,
Codigo_Ventas int not null references Ventas unique,
Dirección_Velatorio varchar(120) not null,
Cementerio varchar(120) not null,
Dirección_Sepelio varchar(120) not null,
Fecha_Sepelio date not null,
Hora time not null
)
go

-- Agregados
Create Table Color
(Codigo_color int identity primary key,
descripcion varchar(100)
)
go

Create Table Material
(Codigo_material int identity primary key,
descripcion varchar(100)
)
go

Create Procedure Registrar_Color(
@Descripcion varchar(100),
@msj varchar(100) out
)
as
	begin
		if(exists(Select * from Color where descripcion=@Descripcion))
		set @msj='¡El color ingresado ya existe!'
		else
			begin
				insert Color values (@Descripcion)
				set @msj='Color Registrado Correctamente'
			end
	end
go

Create Proc Listado_Color
as
	Select * from Color
go

Create Procedure Registrar_Material(
@Descripcion varchar(100),
@msj varchar(100) out
)
as
	begin
		if(exists(Select * from Material where descripcion=@Descripcion))
		set @msj='¡El material ingresado ya existe!'
		else
			begin
				insert Material values (@Descripcion)
				set @msj='Material Registrado Correctamente'
			end
	end
go

Create Proc Listado_Material
as
	Select * from Material
go
/************************************ PROCEDIMIENTOS ALMACENADOS ************************************/


/************************************ PROCEDIMIENTOS ALMACENADOS ************************************/

Create Procedure Listado_Tipo_Item
as
	Select * from Tipo_Item	
go

Create Procedure Listar_Servicios
As
	Begin
		Select * From Item Where Codigo_Tipo_Item=2
	End
Go

Create Procedure Registrar_Item
(@Codigo_Tipo_Item Int,
@Nombre Varchar(100),
@Precio Money,
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Item Where Nombre=@Nombre))
		Set @Mensaje = 'El Producto: '+@Nombre+' ya existe'
		Else
			Begin
				Insert Item Values(@Codigo_Tipo_Item,@Nombre,@Precio)
				Set @Mensaje = 'Registrado Correctamente'				
			End	
	End
Go

Create Procedure Actualizar_Item
(@Codigo_Item Int,
@Codigo_Tipo_Item Int,
@Nombre Varchar(100),
@Precio Money,
@Mensaje Varchar(100) Out
)As
	Begin
		If(Not Exists(Select * From Item Where Codigo_Item=@Codigo_Item))
		Set @Mensaje = 'El Producto: '+@Nombre+' no existe'
		Else
			Begin
				Update Item Set Codigo_Tipo_Item=@Codigo_Tipo_Item,
				Nombre=@Nombre,Precio=@Precio Where Codigo_Item=@Codigo_Item
				Set @Mensaje = 'Actualizado Correctamente'
			End
	End
Go

Create Procedure Listar_Productos
As
	Begin
		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen
		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item
		Where I.Codigo_Tipo_Item = 1
	End
Go

Create Procedure Buscar_Productos
@Datos Varchar(70)
As
	Begin
		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen
		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item
		Where (I.Codigo_Tipo_Item = 1 And I.Nombre Like '%'+@Datos+'%') Or 
		(I.Codigo_Tipo_Item = 1 And D.Color Like @Datos+'%') Or (I.Codigo_Tipo_Item = 1 And D.Material Like @Datos+'%')
	End
Go

Create Procedure Listar_Item
as
	Select Codigo_Item,Nombre,Precio from Item
go

Create Procedure Listar_Item_Tipo
(
@Codigo_Tipo_Item int
)
as
	begin
		Select Codigo_Item,Nombre,Precio from Item
		where Codigo_Tipo_Item=@Codigo_Tipo_Item
	end
go
 

Create Procedure Devolver_Codigo_Item
@CodigoItem Int Output
As
	Begin
		Declare @cant as int
		If(not exists(Select Codigo_Item From Item))
			set @CodigoItem=1;
		else 
			begin
				set @CodigoItem=(SELECT max(Codigo_Item) FROM Item)
			End
	End
Go

Create Procedure Registrar_Detalle_Item
(@Codigo_Item Int,
@Descripcion Varchar(100),
@Color Varchar(50),
@Material Varchar(20),
@Stock Int,
@RutaImagen Varchar(100),
@Mensaje Varchar(100) Out 
)As
	Begin
		Insert Detalle_Item Values(@Codigo_Item,@Descripcion,@Color,@Material,@Stock,@RutaImagen)
		Set @Mensaje = 'Registrado Correctamente'
	End
go

Create Procedure Actualizar_Detalle_Item
(@Codigo_Item Int,
@Descripcion Varchar(100),
@Color Varchar(50),
@Material Varchar(20),
@Stock Int,
@RutaImagen Varchar(100),
@Mensaje Varchar(100) Out 
)As
	Begin
		Update Detalle_Item Set Descripcion=@Descripcion,Color=@Color,Material=@Material,Stock=@Stock,
		RutaImagen=@RutaImagen Where Codigo_Item=@Codigo_Item
		Set @Mensaje = 'Actualizado Correctamente'
	End
Go

Create Procedure Registrar_Plan_Funerario 
(@Descripcion Varchar(200),
@Precio Money,
@RutaImagen Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Plan_Funerario Where Descripcion=@Descripcion))
		Set @Mensaje = 'El Plan Funerario: '+@Descripcion+' ya existe'
		Else
			Begin
				Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values(@Descripcion,@Precio,@RutaImagen)
				Set @Mensaje = 'Registrado Correctamente'
			End
	End
Go

Create Procedure Actualizar_Plan_Funerario 
(@Codigo_Plan_Funerario int,
@Descripcion Varchar(200),
@Precio Money,
@RutaImagen Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(not Exists(Select * From Plan_Funerario Where Codigo_Plan_Funerario=@Codigo_Plan_Funerario))
		Set @Mensaje = 'El código del Plan Funerario no existe'
		Else
			Begin
				Update Plan_Funerario set Descripcion=@Descripcion,Precio=@Precio,RutaImagen=@RutaImagen 
				where Codigo_Plan_Funerario=@Codigo_Plan_Funerario				
				Set @Mensaje = 'Actualizado Correctamente'
			End
	End
Go

Create Procedure Registra_Detalle_Plan_Funerario
(@Codigo_Plan_Funerario Int,
@Codigo_Item Int,
@Precio Decimal,
@Mensaje Varchar(100) Out
)As
	Begin
		If(Not Exists(Select * From Plan_Funerario Where Codigo_Plan_Funerario=@Codigo_Plan_Funerario))
		Set @Mensaje = 'El Plan_Funerario seleccionado no existe'
		Else 
			Begin
				If(Not Exists(Select * From Item Where Codigo_Item=@Codigo_Item))
				Set @Mensaje = 'El item seleccionado no existe'
				Else
					Begin
						Insert Detalle_Plan_Funerario Values(@Codigo_Plan_Funerario,@Codigo_Item)
						Set @Mensaje = 'Registrado correctamente'
						Update Plan_Funerario Set Precio=@Precio Where Codigo_Plan_Funerario=@Codigo_Plan_Funerario
					End
			End
	End
Go

Create Procedure Listar_Detalle_Plan_Funerario
@Codigo_Plan Int
As
	Select D.Codigo_Item,D.Codigo_Detalle_Plan_Funerario,D.Codigo_Plan_Funerario,I.Nombre,I.Precio 
	From Item I Inner Join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item
	Where D.Codigo_Plan_Funerario=@Codigo_Plan
Go

Create Procedure Verificar_Stock_Plan
(@Codigo_Plan Int
)
as
Select DI.Stock from Detalle_Item DI inner join Item I on DI.Codigo_Item=I.Codigo_Item
inner join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item
where I.Codigo_Tipo_Item=1 and D.Codigo_Plan_Funerario=@Codigo_Plan
go

Create Procedure Verificar_Stock_Item
@CodigoItem Int
As
	Begin
		Select Stock From Detalle_Item Where Codigo_Item=@CodigoItem
	End
Go

Create Procedure Eliminar_Detalle_Plan_Funerario
@CodigoDetalle Int,
@Mensaje Varchar(100) Out
As
	Begin
		Delete From Detalle_Plan_Funerario Where Codigo_Detalle_Plan_Funerario=@CodigoDetalle
		Set @Mensaje='Eliminado correctamente'
	End
Go

Create Proc Listar_Plan_Funerario
as
	Select * from Plan_Funerario
go

Create Procedure Registrar_Personal
(@Dni Char(8),
@Nombre Varchar(50),
@Apellidos Varchar(100),
@Cargo varchar(50),
@Direccion Varchar(100),
@Telefono Varchar(70),
@Email Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Personal Where Dni=@Dni))
		Set @Mensaje = 'Este N° de D.N.I. :'+@Dni+' ya existe'
		Else
			Begin
				Insert Personal(Dni,Nombre,Apellidos,Cargo,Direccion,Telefono,Email) Values(@Dni,@Nombre,@Apellidos,@Cargo,@Direccion,@Telefono,@Email)
				Set @Mensaje = 'Registrado Correctamente'
			End
	End
Go

Create Procedure Actualizar_Personal
(@Codigo_Personal Int,
@Dni Char(8),
@Nombre Varchar(50),
@Apellidos Varchar(100),
@Cargo varchar(50),
@Direccion Varchar(100),
@Telefono Varchar(70),
@Email Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Not Exists(Select * From Personal Where Codigo_Personal=@Codigo_Personal))
		Set @Mensaje = 'El personal seleccionado no existe'
		Else
			Begin
				If(Exists(Select * From Personal Where Dni=@Dni And Codigo_Personal<>@Codigo_Personal))
				Set @Mensaje = 'Este N° de D.N.I. :'+@Dni+' ya existe'
				Else
					Begin
						Update Personal Set Dni=@Dni,Nombre=@Nombre,Apellidos=@Apellidos,
						Cargo=@Cargo,Direccion=@Direccion,Telefono=@Telefono,Email=@Email Where Codigo_Personal=@Codigo_Personal
						Set @Mensaje = 'Actualizado Correctamente'
					End
			End
	End
Go

Create Procedure Actualizar_Estado_Personal
@Codigo_Personal Int,
@Estado Varchar(10),
@Mensaje Varchar(100) Out
As
	Begin
		If(@Estado='Activo')
			Begin
				Update Personal Set Estado='Inactivo' Where Codigo_Personal=@Codigo_Personal
				Set @Mensaje='Actualizado Correctamente'
			End
		Else
			Begin
				Update Personal Set Estado='Activo' Where Codigo_Personal=@Codigo_Personal
				Set @Mensaje='Actualizado Correctamente'
			End
	End
Go
	

Create Procedure Listado_Personal
as
	Select * from Personal
go

Create Procedure Buscar_Personal_DNI_Nombre
(@Datos varchar(50)
)
as
	begin
		Select * 
		from Personal 
		Where (Dni like @Datos+'%') or (Nombre Like @Datos+'%') Or (Apellidos Like @Datos+'%') Or
		(Nombre+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombre Like @Datos+'%')
	end
go
		
Create Procedure Listar_Usuarios
As
	Begin
		Select U.Codigo_Personal,P.Nombre+' '+P.Apellidos As 'Personal',U.Usuario,U.Clave 
		From Personal P Inner Join Usuario U On P.Codigo_Personal=U.Codigo_Personal
	End
Go

Create Procedure Registrar_Usuario
(@Codigo_Personal Int,
@Usuario Varchar(20),
@Clave Varchar(10),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Not Exists(Select * From Personal Where Codigo_Personal=@Codigo_Personal))
		Set @Mensaje = 'El personal no existe'
		Else
			Begin
				If(Exists(Select * From Usuario Where Codigo_Personal=@Codigo_Personal))
				Set @Mensaje = 'El personal ya tiene una cuenta de usuario'
				Else
					Begin
						If(Exists(Select * From Usuario Where Usuario=@Usuario))
						Set @Mensaje = 'El usuario: '+@Usuario+' ya existe'
						Else
							Begin
								Insert Usuario Values(@Codigo_Personal,@Usuario,@Clave)
								Set @Mensaje = 'Registrado correctamente'
							End
					End
			End
	End
Go

Create Procedure Actualizar_Usuario
(@Codigo_Personal Int,
@Usuario Varchar(20),
@Clave Varchar(10),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Usuario Where Usuario=@Usuario And Codigo_Personal<>@Codigo_Personal))
		Set @Mensaje = 'El usuario: '+@Usuario+' ya existe'
		Else
			Begin
				Update Usuario Set Usuario=@Usuario,Clave=@Clave Where Codigo_Personal=@Codigo_Personal
				Set @Mensaje = 'Actualizado correctamente'
			End
	End
Go

Create Procedure Verificar_Existe_Usuario
@Codigo_Personal Int
As
	Begin
		Select COUNT(Codigo_Personal) From Usuario WHere Codigo_Personal=@Codigo_Personal
	End
Go

Create Procedure Registrar_Cliente
(@Tipo_Persona Varchar(15),
@Tipo_Documento Char(6),
@Documento Varchar(11),
@Nombres Varchar(150),
@Direccion Varchar(100),
@Telefono Varchar(70),
@Email Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Cliente Where Documento=@Documento))
		Set @Mensaje = 'El N° de documento: '+@Documento+' ya existe'
		Else
			Begin
				Insert Cliente Values(@Tipo_Persona,@Tipo_Documento,@Documento,@Nombres,@Direccion,
				@Telefono,@Email)
				Set @Mensaje = 'Registrado Correctamente'
			End
	End
Go

Create Procedure Actualizar_Cliente
(@Codigo_Cliente int,
@Tipo_Persona Varchar(15),
@Tipo_Documento Char(6),
@Documento Varchar(11),
@Nombres Varchar(150),
@Direccion Varchar(100),
@Telefono Varchar(70),
@Email Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Cliente Where Documento=@Documento and Codigo_Cliente<>@Codigo_Cliente))
		Set @Mensaje = 'El N° de documento: '+@Documento+' ya existe'
		Else
			Begin
				Update Cliente set Tipo_Persona=@Tipo_Persona,Tipo_Documento=@Tipo_Documento,Documento=@Documento,
				Nombres=@Nombres,Direccion=@Direccion,Telefono=@Telefono,Email=@Email where Codigo_Cliente=@Codigo_Cliente
				Set @Mensaje = 'Actualizado Correctamente'
			End
	End
Go

Create Procedure Listado_Cliente
as
	Select * from Cliente
go

Create Procedure Buscar_Cliente_NroDoc_Nombre
(@Datos varchar(50)
)
as
	begin
		Select * from Cliente where (Documento like @Datos+'%') or (Nombres like @Datos+'%')
	end
go

Create Procedure Listar_Difuntos
As
	Begin
		Select * From Difunto
	End
Go

Create Procedure Buscar_Difunto
@Datos Varchar(60)
As
	Begin
		Select * From Difunto 
		Where (Dni like @Datos+'%') Or (Nombres Like @Datos+'%') Or (Apellidos Like @Datos+'%') 
		Or (Nombres+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombres Like @Datos+'%')
	End
Go

Create Procedure Verificar_Existe_Parentesco
@Codigo_Difunto Int
As
	Begin
		Select COUNT(Codigo_Difunto) From Parentesco WHere Codigo_Difunto=@Codigo_Difunto
	End
Go

Create Procedure Registra_Difunto
(@Dni Char(8),
@Nombres Varchar(60),
@Apellidos Varchar(100),
@Sexo Char(1),
@Fecha_Nacimiento Date,
@Fecha_Fallecimiento Date,
@Hora Time,
@Causa_Muerte Varchar(200),
@Lugar_Fallecimiento Varchar(100),
@Estado_Civil Varchar(15),
@Ruta_Acta_Difunto Varchar(120),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Difunto Where Dni=@Dni))
		Set @Mensaje = 'El N° de D.N.I.'+@Dni+' ya existe'
		Else
			Begin
				Insert Difunto Values(@Dni,@Nombres,@Apellidos,@Sexo,@Fecha_Nacimiento,
				@Fecha_Fallecimiento,@Hora,@Causa_Muerte,@Lugar_Fallecimiento,@Estado_Civil,@Ruta_Acta_Difunto)
				Set @Mensaje = 'Registrado correctamente'
			End
	End
Go

Create Procedure Actualizar_Difunto
(@Codigo_Difunto Int,
@Dni Char(8),
@Nombres Varchar(60),
@Apellidos Varchar(100),
@Sexo Char(1),
@Fecha_Nacimiento Date,
@Fecha_Fallecimiento Date,
@Hora Time,
@Causa_Muerte Varchar(200),
@Lugar_Fallecimiento Varchar(100),
@Estado_Civil Varchar(15),
@Ruta_Acta_Difunto Varchar(120),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Difunto Where Dni=@Dni And Codigo_Difunto<>@Codigo_Difunto))
		Set @Mensaje = 'El N° de D.N.I.'+@Dni+' ya existe'
		Else
			Begin
				Update Difunto Set Dni=@Dni,Nombres=@Nombres,Apellidos=@Apellidos,Sexo=@Sexo,
				Fecha_Nacimiento=@Fecha_Nacimiento,Fecha_Fallecimiento=@Fecha_Fallecimiento,
				Hora=@Hora,Causa_Muerte=@Causa_Muerte,Lugar_Fallecimiento=@Lugar_Fallecimiento,
				Estado_Civil=@Estado_Civil,Ruta_Acta_Difunto=@Ruta_Acta_Difunto Where Codigo_Difunto=@Codigo_Difunto
				Set @Mensaje = 'Actualizado correctamente'
			End
	End
Go

Create Procedure Listar_Parentesco
As
	Begin
		Select P.Codigo_Parentesco, P.Codigo_Cliente,P.Codigo_Difunto,C.Nombres As 'Cliente',D.Nombres+' '+D.Apellidos As 'Difunto',P.Descripcion As 'Parentesco' 
		From Cliente C Inner Join Parentesco P on C.Codigo_Cliente=P.Codigo_Cliente
		Inner Join Difunto D on D.Codigo_Difunto=P.Codigo_Difunto
	End
Go

Create Procedure Registrar_Parentesco
(@Codigo_Cliente Int,
@Codigo_Difunto Int,
@Descripcion Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Parentesco Where Codigo_Cliente=@Codigo_Cliente And Codigo_Difunto=@Codigo_Difunto))
		Set @Mensaje = 'El parentesco ya se ha ha defino'
		Else
			Begin
				Insert Parentesco Values(@Codigo_Cliente,@Codigo_Difunto,@Descripcion)
				Set @Mensaje = 'Registrado correctamente'
			End
	End
Go

Create Procedure Actualizar_Parentesco
(@Codigo_Parentesco Int,
@Codigo_Cliente Int,
@Codigo_Difunto Int,
@Descripcion Varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Not Exists(Select * From Parentesco Where Codigo_Parentesco=@Codigo_Parentesco))
		Set @Mensaje = 'El parentesco no existe'
		Else
			Begin
				Update Parentesco Set Codigo_Cliente=@Codigo_Cliente,Codigo_Difunto=@Codigo_Difunto,
				Descripcion=@Descripcion Where Codigo_Parentesco=@Codigo_Parentesco
				Set @Mensaje = 'Actualizado correctamente'
			End
	End
Go

Create Procedure Listar_Proveedores
As
	Begin
		Select * From Proveedor
	End
Go

Create Procedure Buscar_Proveedores
@Datos Varchar(70)
As
	Begin
		Select * From Proveedor Where (RUC Like @Datos+'%') Or (Razon_Social Like @Datos+'%')
	End
Go


Create Procedure Registrar_Proveedor
(@RUC char(11),
@Razon_Social varchar(200),
@Representante varchar(150),
@Celular_Representante varchar(12),
@Telefono_Empresa varchar(70),
@Direccion varchar(200),
@Email varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Proveedor Where RUC=@RUC))
		Set @Mensaje = 'El N° de R.U.C. '+@RUC+' ya existe'
		Else
			Begin
				If(Exists(Select * From Proveedor Where Razon_Social=@Razon_Social))
				Set @Mensaje = 'La razón social: '+@Razon_Social+' ya existe'
				Else
					Begin
						Insert Proveedor Values(@RUC,@Razon_Social,@Representante,@Celular_Representante,
						@Telefono_Empresa,@Direccion,@Email)
						Set @Mensaje = 'Registrado correctamente' 
					End
			End
	End
go

Create Procedure Actualizar_Proveedor
(@Codigo_Proveedor int,
@RUC char(11),
@Razon_Social varchar(200),
@Representante varchar(150),
@Celular_Representante varchar(12),
@Telefono_Empresa varchar(70),
@Direccion varchar(200),
@Email varchar(100),
@Mensaje Varchar(100) Out
)As
	Begin
		If(Exists(Select * From Proveedor Where RUC=@RUC And Codigo_Proveedor<>@Codigo_Proveedor))
		Set @Mensaje = 'El N° de R.U.C. '+@RUC+' ya existe'
		Else
			Begin
				If(Exists(Select * From Proveedor Where Razon_Social=@Razon_Social And Codigo_Proveedor<>@Codigo_Proveedor))
				Set @Mensaje = 'La razón social: '+@Razon_Social+' ya existe'
				Else
					Begin
						Update Proveedor Set RUC=@RUC,Razon_Social=@Razon_Social,Representante=@Representante,
						Celular_Representante=@Celular_Representante,Telefono_Empresa=@Telefono_Empresa,Direccion=@Direccion,Email=@Email
						Where Codigo_Proveedor=@Codigo_Proveedor
						Set @Mensaje = 'Actualizado correctamente' 
					End
			End
	End
Go

Create Procedure Devolver_Codigo_Compras
@CodigoCompra Int Output
As
	Begin
		If(not exists(Select Codigo_Compras From Compras))
			set @CodigoCompra=1
		else 
			begin
				set @CodigoCompra=(SELECT max(Codigo_Compras) FROM Compras)
			End
	End
Go

Create Proc Registrar_Compras
(@Codigo_Proveedor int,
@Fecha_Compra date,
@Tipo_Documento varchar(20),
@Serie char(3),
@Nro_Documento varchar(7),
@Total money,
@Mensaje Varchar(100) Out
)As 
	Begin
		if(not exists(Select * from Proveedor where Codigo_Proveedor=@Codigo_Proveedor))
		set @Mensaje='Código de Proveedor no Existe'
		else
			Begin
				Insert Compras Values(@Codigo_Proveedor,@Fecha_Compra,@Tipo_Documento,@Serie,
						@Nro_Documento,@Total)
						Set @Mensaje = 'Compra Registrada correctamente' 
			End
	End
Go

Create Proc Registrar_Detalle_Compras
(@Codigo_Compras int,
@Codigo_Item int,
@Precio_Compra money,
@Cantidad int,
@Igv money,
@Sub_Total money,
@Mensaje Varchar(100) Out
)As 
	declare @Stock as int
	Begin
		Set @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)
		Insert Detalle_Compras Values(@Codigo_Compras,@Codigo_Item,@Precio_Compra,@Cantidad,@Igv,@Sub_Total)
		Set @Mensaje = 'Detalle de Compra Registrado correctamente' 
		Update Detalle_Item Set Stock=@Stock+@Cantidad Where Codigo_Item=@Codigo_Item
	End
Go

Create Procedure Listar_Compras
As	
	Begin
		Select C.Codigo_Compras,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 
		From Proveedor P Inner Join Compras C on P.Codigo_Proveedor=C.Codigo_Proveedor
	End
Go

Create Procedure Listar_Detalle_Compras
@CodigoCompras Int
As
	Begin
		Select I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]
		From Compras C Inner Join Detalle_Compras D on C.Codigo_Compras=D.Codigo_Compras
		Inner Join Item I on D.Codigo_Item=I.Codigo_Item
		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item
		Where D.Codigo_Compras=@CodigoCompras
		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total
	End
Go

Create Procedure Listar_Compras_PorFechas
@Fecha1 Date,
@Fecha2 Date
As
	Begin
		Select C.Codigo_Compras,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 
		From Proveedor P Inner Join Compras C on P.Codigo_Proveedor=C.Codigo_Proveedor
		Where C.Fecha_Compra Between @Fecha1 And @Fecha2
	End
Go


Create Proc [Serie Documento]
@Serie char(3) out
As
	Begin
		Set @Serie='001'
	End
Go

Create Procedure [Numero Correlativo]
@TipoDocumento Varchar(7),
@NroCorrelativo Char(7)Out
As 
	Begin
		Declare @Cant Int
		If(@TipoDocumento='Factura')
			Begin
				Select @Cant=Count(*)+1 From Ventas where Tipo_Documento='Factura'
				If @Cant<10
					Set @NroCorrelativo='000000'+Ltrim(Str(@Cant))
				Else
					If @Cant<100
						Set @NroCorrelativo='00000'+Ltrim(Str(@Cant))
					Else
						If @Cant<1000
							Set @NroCorrelativo='0000'+Ltrim(Str(@Cant))
						Else
							If(@Cant<10000)
								Set @NroCorrelativo='000'+LTRIM(STR(@Cant))
							Else
								If(@Cant<100000)
									Set @NroCorrelativo='00'+LTRIM(STR(@Cant))
								Else
									If(@Cant<1000000)
										Set @NroCorrelativo='0'+LTRIM(str(@Cant))
									Else
										If(@Cant<10000000)
											Set @NroCorrelativo=LTRIM(str(@Cant))
			End
		If(@TipoDocumento='Boleta')
			Begin
				Select @Cant=Count(*)+1 From Ventas where Tipo_Documento='Boleta'
				If @Cant<10
					Set @NroCorrelativo='000000'+Ltrim(Str(@Cant))
				Else
					If @Cant<100
						Set @NroCorrelativo='00000'+Ltrim(Str(@Cant))
					Else
						If @Cant<1000
							Set @NroCorrelativo='0000'+Ltrim(Str(@Cant))
						Else
							If(@Cant<10000)
								Set @NroCorrelativo='000'+LTRIM(STR(@Cant))
							Else
								If(@Cant<100000)
									Set @NroCorrelativo='00'+LTRIM(STR(@Cant))
								Else
									If(@Cant<1000000)
										Set @NroCorrelativo='0'+LTRIM(str(@Cant))
									Else
										If(@Cant<10000000)
											Set @NroCorrelativo=LTRIM(str(@Cant))
		End
	End
Go

Create Proc Registrar_Ventas
(@Codigo_Cliente Int,
@Codigo_Personal Int,
@Tipo_Documento Varchar(20),
@Serie Char(3),
@NroComprobante Char(7),
@FechaVenta Date,
@Total Money,
@Mensaje Varchar(100) Out
)As 
	Begin
		if(not exists(Select * from Cliente where Codigo_Cliente=@Codigo_Cliente))
		set @Mensaje='Código de Cliente no Existe'
		else
			Begin
				Insert Ventas Values(@Codigo_Cliente,@Codigo_Personal,@Tipo_Documento,@Serie,@NroComprobante,@FechaVenta,@Total)
				Set @Mensaje = 'Venta Registrada correctamente' 
			End
	End
Go

Create Procedure Devolver_Codigo_Ventas
@CodigoVenta Int Output
As
	Begin
		If(not exists(Select Codigo_Ventas From Ventas))
			set @CodigoVenta=1
		else 
			begin
				set @CodigoVenta=(SELECT max(Codigo_Ventas) FROM Ventas)
			End
	End
Go

Create Proc Registrar_Detalle_Venta
(@Codigo_Ventas int,
@Codigo_Item int,
@Cantidad int,
@Precio_Venta money,
@Igv money,
@Dscto Money,
@Sub_Total money,
@Mensaje Varchar(100) Out
)As 
	Declare @Stock as Int
	Begin
		Set  @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)
		Insert Detalle_Venta Values(@Codigo_Ventas,@Codigo_Item,@Cantidad,@Precio_Venta,@Igv,@Dscto,@Sub_Total)
		Set @Mensaje = 'Detalle de Venta Registrado correctamente' 
		Update Detalle_Item Set Stock=@Stock-@Cantidad Where Codigo_Item=@Codigo_Item
	End
Go

Create Procedure Registrar_Informacion_Venta
(@Codigo_Ventas int,
@Dirección_Velatorio varchar(120),
@Cementerio varchar(120),
@Dirección_Sepelio varchar(120),
@Fecha_Sepelio date,
@Hora time,
@Mensaje Varchar(100) Out
)
As
	Begin
		if(not Exists(Select * from Ventas where Codigo_Ventas=@Codigo_Ventas))
		set @Mensaje='No existe el Código de Venta'
		else
			begin
				Insert Informacion_Venta Values(@Codigo_Ventas,@Dirección_Velatorio,
					@Cementerio,@Dirección_Sepelio,@Fecha_Sepelio,@Hora)
				set @Mensaje='Información Registrada Correctamente'
			End		
	End
Go


Create Procedure Actualizar_Informacion_Venta
(@Codigo_Informacion_Venta int,
@Codigo_Ventas int,
@Dirección_Velatorio varchar(120),
@Cementerio varchar(120),
@Dirección_Sepelio varchar(120),
@Fecha_Sepelio date,
@Hora time,
@Mensaje Varchar(100) Out
)
As
	Begin
		if(not Exists(Select * from Informacion_Venta where Codigo_Informacion_Venta=@Codigo_Informacion_Venta))
		set @Mensaje='No existe el código de la información'
		else
			begin
				Update Informacion_Venta Set Codigo_Ventas=@Codigo_Ventas,Dirección_Velatorio=@Dirección_Velatorio,
					Cementerio=@Cementerio,Dirección_Sepelio=@Dirección_Sepelio,Fecha_Sepelio=@Fecha_Sepelio,Hora=@Hora
					where Codigo_Informacion_Venta=@Codigo_Informacion_Venta
					Set @Mensaje='Información Actualizada Correctamente'
			End		
	End
Go

Create Procedure Listar_Ventas
As
	Select V.Codigo_Ventas,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],
	V.Tipo_Documento,V.FechaVenta,V.Total
	From Cliente C Inner Join Ventas V on C.Codigo_Cliente=V.Codigo_Cliente
	Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal
Go


--Create Procedure Listar_Detalle_Venta
--@Codigo_Venta Int
--As
--	Begin
--		Select I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]
--		From Ventas V Inner Join Detalle_Venta D On V.Codigo_Ventas=D.Codigo_Ventas
--		Inner Join Item I on D.Codigo_Item=I.Codigo_Item
--		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item
--		Where D.Codigo_Ventas=@Codigo_Venta
--		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total
--	End
--Go

Create Procedure Listar_Detalle_Venta
@Codigo_Venta Int
As
	Begin
		Select I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]
		From Ventas V Inner Join Detalle_Venta D On V.Codigo_Ventas=D.Codigo_Ventas
		Inner Join Item I on D.Codigo_Item=I.Codigo_Item
		Where D.Codigo_Ventas=@Codigo_Venta
		Group By I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total
	End
Go

Create Procedure Mostrar_Detalle_Item
@CodigoItem Int
As
	Begin
		Select Color,Material From Detalle_Item Where Codigo_Item=@CodigoItem
	End
Go

Create Procedure Listar_Ventas_PorFechas
@Fecha1 Date,
@Fecha2 Date
As
	Begin
		Select V.Codigo_Ventas,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],
		V.Tipo_Documento,V.FechaVenta,V.Total
		From Cliente C Inner Join Ventas V on C.Codigo_Cliente=V.Codigo_Cliente
		Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal
		Where V.FechaVenta Between @Fecha1 And @Fecha2
	End
Go

Create Procedure Ver_Informacion_Venta
@Codigo_Venta Int
As
	Begin
		Select I.Dirección_Velatorio,I.Cementerio,I.Fecha_Sepelio,I.Dirección_Sepelio,I.Hora 
		From Ventas V Inner Join Informacion_Venta I on V.Codigo_Ventas=I.Codigo_Ventas
		Where I.Codigo_Ventas=@Codigo_Venta
	End
Go

Create Procedure Loguear(
@Usuario Varchar(20),
@Clave Varchar(10),
@Mensaje Varchar(100)out)
as 
begin
	if(not exists(Select * from Usuario where Usuario=@Usuario))
	set @Mensaje='El usuario Ingresado no Existe'
	else 
		begin
			if(not exists(Select * from Usuario where Usuario=@Usuario and Clave=@Clave))
			set @Mensaje='La clave ingresada es incorrecta'
			else 
				begin
					if((Select Estado from Personal where Codigo_Personal=(Select Codigo_Personal from Usuario where Usuario=@Usuario))='Inactivo')
					set @Mensaje='Acceso Denegado, este usuario tiene estado Inactivo'
						else 
						begin
							Select * from Usuario where Usuario=@Usuario and Clave=Clave
							set @Mensaje='Logueado Correctamente'
						end
				end
		end
end
go

Create Proc Devolver_Codigo_Personal
(@Usuario varchar(20),
@codigo_personal int out
)
as
	set @codigo_personal=(Select Codigo_Personal from Usuario where Usuario=@Usuario)
go

/************************************ FIN PROCEDIMIENTOS ALMACENADOS ************************************/

-- ===============================================================================================

/************************************ INSERCIONES ************************************/
Insert Personal (Dni,Nombre,Apellidos,Cargo,Direccion,Telefono,Email) values 
('16505263','Pedro Antonio','Valderrama Tapia','Administrador','Avenida Saénz Peña 145 - Chiclayo','415263','pedro_vt@hotmail.com'),
('33185296','Juan Jose','Reynoso Tapia','Vendedor','Avenida Luis Gonsalez 368 - Chiclayo','405066','juan008t@hotmail.com')
Insert Usuario values ('1','administrador','123456'),('2','vendedorjj','654321')

Select * from Usuario

Insert Tipo_Item Values('Producto'),('Servicio')
Go
Insert Item values 
				   ---Productos
				   (1,'Ataúd Modelo Emperador Color Plateado',750),(1,'Ataúd Modelo Emperador Color Marrón',750),
				   (1,'Ataúd Modelo Americano Color Canela',1000),(1,'Ataúd Modelo Americano Color Canela Oscuro',1000),
				   (1,'Ataúd Modelo Figaro Redondo Color Canela',1200),(1,'Ataúd Modelo Figaro Redondo Color Canela Oscuro',1200),
				   (1,'Ataúd Modelo Lincoln Color Marrón',1500),(1,'Ataúd Modelo Lincoln Color Blanco',1500),
				   (1,'Ataúd Modelo Copa Color Canela',1800),
				   ---Servicios
				   (2,'Capilla Ardiente',50),(2,'Carroza fúnebre',70),
				   (2,'Carro porta Arreglos Florales',70),(2,'Conducción e Instalación del Velatorio',60),
				   (2,'Movilidad 12 Pasajeros',50),(2,'Movilidad 24 Pasajeros',100),
				   (2,'Servicio de Cargadores',100),(2,'Salón Velatorio',180),(2,'Servicio de Café',70)
			go
			
Insert Detalle_Item values
						  (1,'Ataúd de Madera con acabado Rectangular','Plateado','Madera',20,'C:\Funeraria\Producto\Ataud-1.jpg'),
						  (2,'Ataúd de Madera con acabado Rectangular','Marrón','Madera',20,'C:\Funeraria\Producto\Ataud-2.jpg'),
						  (3,'Ataúd de Madera Laqueado al Natural, con acabado Rectangular','Canela','Madera',20,'C:\Funeraria\Producto\Ataud-3.jpg'),
						  (4,'Ataúd de Madera Laqueado al Natural, con acabado Rectangular','Canela Oscuro','Madera',20,'C:\Funeraria\Producto\Ataud-4.jpg'),
						  (5,'Ataúd de Madera Laqueado al Natural, con acabado Redondeado','Canela','Madera',20,'C:\Funeraria\Producto\Ataud-5.jpg'),
						  (6,'Ataúd de Madera Laqueado al Natural, con acabado Redondeado','Canela Oscuro','Madera',20,'C:\Funeraria\Producto\Ataud-6.jpg'),
						  (7,'Ataúd de Madera con acabado Redondeado','Marrón','Madera',15,'C:\Funeraria\Producto\Ataud-7.jpg'),
						  (8,'Ataúd de Madera con acabado Redondeado','Blanco','Madera',15,'C:\Funeraria\Producto\Ataud-8.jpg'),				
						  (9,'Ataúd de Madera Laqueado al Natural, con acabado Redondeado','Canela','Madera',10,'C:\Funeraria\Producto\Ataud-9.jpg')
					 
-- ******* PLANES FUNERARIOS ********

Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Tradicional - Plateado',1000.0,'C:\Funeraria\Planes Funerarios\Planes-1.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Tradicional - Marrón',1000.0,'C:\Funeraria\Planes Funerarios\Planes-2.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Superior - Canela',1300.0,'C:\Funeraria\Planes Funerarios\Planes-3.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Superior - Canela Oscuro',1300.0,'C:\Funeraria\Planes Funerarios\Planes-4.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Premier - Canela',1600.0,'C:\Funeraria\Planes Funerarios\Planes-5.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Premier - Canela Oscuro',1600.0,'C:\Funeraria\Planes Funerarios\Planes-6.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Preferencial - Marrón',1900.0,'C:\Funeraria\Planes Funerarios\Planes-7.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Preferencial - Blanco',1900.0,'C:\Funeraria\Planes Funerarios\Planes-8.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Vip',2500.0,'C:\Funeraria\Planes Funerarios\Planes-9.jpg')
Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values('Plan Funerario Essalud',1000.0,'C:\Funeraria\Planes Funerarios\Planes-10.jpg')
Go

--Plan Funerario Tradicional - Plateado
Insert Detalle_Plan_Funerario Values(1,1)
Insert Detalle_Plan_Funerario Values(1,10)
Insert Detalle_Plan_Funerario Values(1,11)
Insert Detalle_Plan_Funerario Values(1,12)
Insert Detalle_Plan_Funerario Values(1,13)

--Plan Funerario Tradicional - Marrón
Insert Detalle_Plan_Funerario Values(2,2)
Insert Detalle_Plan_Funerario Values(2,10)
Insert Detalle_Plan_Funerario Values(2,11)
Insert Detalle_Plan_Funerario Values(2,12)
Insert Detalle_Plan_Funerario Values(2,13)

--Plan Funerario Superior - Canela
Insert Detalle_Plan_Funerario Values(3,3)
Insert Detalle_Plan_Funerario Values(3,10)
Insert Detalle_Plan_Funerario Values(3,11)
Insert Detalle_Plan_Funerario Values(3,12)
Insert Detalle_Plan_Funerario Values(3,13)
Insert Detalle_Plan_Funerario Values(3,14)

--Plan Funerario Superior - Canela Oscuro
Insert Detalle_Plan_Funerario Values(4,4)
Insert Detalle_Plan_Funerario Values(4,10)
Insert Detalle_Plan_Funerario Values(4,11)
Insert Detalle_Plan_Funerario Values(4,12)
Insert Detalle_Plan_Funerario Values(4,13)
Insert Detalle_Plan_Funerario Values(4,14)

--Plan Funerario Premier - Canela
Insert Detalle_Plan_Funerario Values(5,5)
Insert Detalle_Plan_Funerario Values(5,10)
Insert Detalle_Plan_Funerario Values(5,11)
Insert Detalle_Plan_Funerario Values(5,12)
Insert Detalle_Plan_Funerario Values(5,13)
Insert Detalle_Plan_Funerario Values(5,14)
Insert Detalle_Plan_Funerario Values(5,16)

--Plan Funerario Premier - Canela Oscuro
Insert Detalle_Plan_Funerario Values(6,6)
Insert Detalle_Plan_Funerario Values(6,10)
Insert Detalle_Plan_Funerario Values(6,11)
Insert Detalle_Plan_Funerario Values(6,12)
Insert Detalle_Plan_Funerario Values(6,13)
Insert Detalle_Plan_Funerario Values(6,14)
Insert Detalle_Plan_Funerario Values(6,16)

--Plan Funerario Preferencial - Marrón
Insert Detalle_Plan_Funerario Values(7,7)
Insert Detalle_Plan_Funerario Values(7,10)
Insert Detalle_Plan_Funerario Values(7,11)
Insert Detalle_Plan_Funerario Values(7,12)
Insert Detalle_Plan_Funerario Values(7,13)
Insert Detalle_Plan_Funerario Values(7,14)
Insert Detalle_Plan_Funerario Values(7,16)

--Plan Funerario Preferencial - Blanco
Insert Detalle_Plan_Funerario Values(8,8)
Insert Detalle_Plan_Funerario Values(8,10)
Insert Detalle_Plan_Funerario Values(8,11)
Insert Detalle_Plan_Funerario Values(8,12)
Insert Detalle_Plan_Funerario Values(8,13)
Insert Detalle_Plan_Funerario Values(8,14)
Insert Detalle_Plan_Funerario Values(8,16)

--Plan Funerario Vip
Insert Detalle_Plan_Funerario Values(9,9)
Insert Detalle_Plan_Funerario Values(9,10)
Insert Detalle_Plan_Funerario Values(9,11)
Insert Detalle_Plan_Funerario Values(9,12)
Insert Detalle_Plan_Funerario Values(9,13)
Insert Detalle_Plan_Funerario Values(9,15)
Insert Detalle_Plan_Funerario Values(9,16)
Insert Detalle_Plan_Funerario Values(9,17)
Insert Detalle_Plan_Funerario Values(9,18)

--Plan Funerario Essalud
Insert Detalle_Plan_Funerario Values(10,2)
Insert Detalle_Plan_Funerario Values(10,10)
Insert Detalle_Plan_Funerario Values(10,11)
Insert Detalle_Plan_Funerario Values(10,12)
Insert Detalle_Plan_Funerario Values(10,13)
Go

-- ******* PROVEEDORES ********
Insert Proveedor Values('20384747376','Funeraria Virgen del Carmen','Medali Uriarte Terrones','987363631','074-737492','Av. La Conquista N° 482 - Arequipa','funerariavirgendelcarmen@gmail.com')
Insert Proveedor Values('20385739170','Carpintería Dios de Paz','José Quiñones Silva','956735352','756362','Av. La Miguel Grau N° 1635 - Lima','carpinteria@diosdepaz.com')
Insert Proveedor Values('20847466282','Carpintería Niño Jesús','Carmen Ancajima Ortíz','978673636','375632','Av. La Marriscal Nieto N° 4636 - Arequipa','carpinterianiñojesus@gmail.com')
Insert Proveedor Values('20976625401','Carpintería Don Lucho','Ricardo Aldana Cornejo','997463683','673635','Av. La Primavera N° 3541 - Cercado - Lima','carpinteria_donlucho@hotmail.com')

-- ******* COMPRAS ********
Insert Compras values
(1,'12/09/2015','Boleta','001','0000088',30000),(2,'12/09/2015','Factura','005','0000023',40000),
(3,'12/09/2015','Factura','002','0000111',48000),(4,'12/09/2015','Factura','002','0000156',63000)
go

Insert Detalle_Compras values 
(1,1,750,20,2288.14,12711.86),(1,2,750,20,2288.14,12711.86),
(2,3,1000,20,3050.85,16949.15),(2,4,1000,20,3050.85,16949.15),
(3,5,1200,20,3661.02,20338.98),(3,6,1200,20,3661.02,20338.98),
(4,7,1500,15,3432.20,19067.80),(4,8,1500,15,3432.20,19067.80),
(4,9,1800,10,2745.76,15254.24)
go

-- ******* CLIENTES ********
Insert Cliente Values('Natural','D.N.I.','46473847','Daniel Silva Jaramillo','Av. México N° 333 - José Leonardo Ortiz','345724','daniel_sj@hotmail.com')
Insert Cliente Values('Natural','D.N.I.','45375764','María Delgado Uriarte','Calle María Izaga N° 643 - Chiclayo','463682','delgado_uriarte@gmail.com')
Go

-- ******* DIFUNTO ********
Insert Difunto Values('16482861','María Eugenia','Silva Montes','F','18/08/1959','12/09/2015','06:00','Fiebre anémica','Hospital San José','Casado','C:\Funeraria\Actas\Acta-16482861.jpg')
Insert Difunto Values('48281277','Juan Manuel','Saavedra Delgado','M','05/05/1997','12/09/2015','04:30','Para Cardio-respiratorio no traumático','Clínica San Juan de Dios','Soltero (a)','C:\Funeraria\Actas\Acta-48281277.jpg')

-- ******* PARENTESCO ********
Insert Parentesco Values (1,1,'Cónyuge'),(2,2,'Madre')

--  ****** VENTAS *******
Insert Ventas Values (1,1,'Boleta','001','0000001','12/09/2015',1000),(2,1,'Boleta','001','0000002','12/09/2015',1300.00)

--  ****** INFORMACIÓN VENTAS *******
Insert Informacion_Venta values (1,'Avenida Luis Gonsález 789 - Arequipa','Jardines de la Paz','Las Brisas S/N por la vía de Evitamiento','2015/09/14','15:30')
Insert Informacion_Venta values(2,'Malecón Solezzi, 106 - Mariano Melgar','Refugio Eterno','Variante de Uchumayo  Km. 4 - Cerro Colorado','14/09/2015','14:00')

--  ****** DETALLE VENTAS *******
Insert Detalle_Venta values 
(1,1,1,750.00,114.41,0.00,635.59),(1,10,1,50.00,7.63,0.00,42.37),
(1,11,1,70.00,10.68,0.00,59.32),(1,12,1,70.00,10.68,0.00,59.32),
(1,13,1,60.00,9.15,0.00,50.85)

Insert Detalle_Venta values 
(2,3,1,1000.00,152.54,0.00,847.46),(2,10,1,50.00,7.63,0.00,42.37),
(2,11,1,70.00,10.68,0.00,59.32),(2,12,1,70.00,10.68,0.00,59.32),
(2,13,1,60.00,9.15,0.00,50.85),(2,14,1,50.00,7.63,0.00,42.37)
go

Insert Material values ('Seleccione'),('Madera'),('Metal')
Insert Color values ('Seleccione'),('Blanco'),('Canela'),('Canela Oscuro'),('Plateado'),('Marrón')
go

