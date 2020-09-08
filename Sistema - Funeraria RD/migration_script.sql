CREATE TABLE IF NOT EXISTS `Funeraria`.`Tipo_Item` (
  `Codigo_Tipo_Item` INT NOT NULL,
  `Descripción` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codigo_Tipo_Item`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Item` (
  `Codigo_Item` INT NOT NULL,
  `Codigo_Tipo_Item` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Precio` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`Codigo_Item`),
  CONSTRAINT `FK__Item__Codigo_Tip__267ABA7A`
    FOREIGN KEY (`Codigo_Tipo_Item`)
    REFERENCES `Funeraria`.`Tipo_Item` (`Codigo_Tipo_Item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Detalle_Item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Detalle_Item` (
  `Codigo_Detalle_Item` INT NOT NULL,
  `Codigo_Item` INT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Color` VARCHAR(50) NOT NULL,
  `Material` VARCHAR(20) NOT NULL,
  `Stock` INT NOT NULL,
  `RutaImagen` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo_Detalle_Item`),
  CONSTRAINT `FK__Detalle_I__Codig__29572725`
    FOREIGN KEY (`Codigo_Item`)
    REFERENCES `Funeraria`.`Item` (`Codigo_Item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Plan_Funerario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Plan_Funerario` (
  `Codigo_Plan_Funerario` INT NOT NULL,
  `Descripcion` VARCHAR(200) NOT NULL,
  `Precio` DECIMAL(19,4) NOT NULL,
  `RutaImagen` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(10) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`Codigo_Plan_Funerario`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Detalle_Plan_Funerario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Detalle_Plan_Funerario` (
  `Codigo_Detalle_Plan_Funerario` INT NOT NULL,
  `Codigo_Plan_Funerario` INT NOT NULL,
  `Codigo_Item` INT NOT NULL,
  PRIMARY KEY (`Codigo_Detalle_Plan_Funerario`),
  CONSTRAINT `FK__Detalle_P__Codig__2F10007B`
    FOREIGN KEY (`Codigo_Plan_Funerario`)
    REFERENCES `Funeraria`.`Plan_Funerario` (`Codigo_Plan_Funerario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Detalle_P__Codig__300424B4`
    FOREIGN KEY (`Codigo_Item`)
    REFERENCES `Funeraria`.`Item` (`Codigo_Item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Personal
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Personal` (
  `Codigo_Personal` INT NOT NULL,
  `Dni` CHAR(8) NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Cargo` VARCHAR(50) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(70) NULL,
  `Email` VARCHAR(100) NULL,
  `Estado` VARCHAR(100) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`Codigo_Personal`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Usuario` (
  `Codigo_Usuario` INT NOT NULL,
  `Codigo_Personal` INT NOT NULL,
  `Usuario` VARCHAR(20) NOT NULL,
  `Clave` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Codigo_Usuario`),
  UNIQUE(`Codigo_Personal`) ,
  CONSTRAINT `FK__Usuario__Codigo`
    FOREIGN KEY (`Codigo_Personal`)
    REFERENCES `Funeraria`.`Personal` (`Codigo_Personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Cliente
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Cliente` (
  `Codigo_Cliente` INT NOT NULL,
  `Tipo_Persona` VARCHAR(15) NOT NULL,
  `Tipo_Documento` CHAR(6) NOT NULL,
  `Documento` VARCHAR(11) NOT NULL,
  `Nombres` VARCHAR(150) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(70) NOT NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo_Cliente`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Difunto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Difunto` (
  `Codigo_Difunto` INT NOT NULL,
  `Dni` CHAR(8) NOT NULL,
  `Nombres` VARCHAR(60) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Sexo` CHAR(1) NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Fecha_Fallecimiento` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Causa_Muerte` VARCHAR(200) NULL,
  `Lugar_Fallecimiento` VARCHAR(100) NULL,
  `Estado_Civil` VARCHAR(15) NOT NULL,
  `Ruta_Acta_Difunto` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`Codigo_Difunto`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Parentesco
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Parentesco` (
  `Codigo_Parentesco` INT NOT NULL,
  `Codigo_Cliente` INT NOT NULL,
  `Codigo_Difunto` INT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo_Parentesco`),
  UNIQUE  (`Codigo_Difunto` ) ,
  CONSTRAINT `FK__Parentesc__Codig__403A8C7D`
    FOREIGN KEY (`Codigo_Cliente`)
    REFERENCES `Funeraria`.`Cliente` (`Codigo_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Parentesc__Codig__412EB0B6`
    FOREIGN KEY (`Codigo_Difunto`)
    REFERENCES `Funeraria`.`Difunto` (`Codigo_Difunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Proveedor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Proveedor` (
  `Codigo_Proveedor` INT NOT NULL,
  `RUC` CHAR(11) NOT NULL,
  `Razon_Social` VARCHAR(200) NOT NULL,
  `Representante` VARCHAR(150) NOT NULL,
  `Celular_Representante` VARCHAR(12) NULL,
  `Telefono_Empresa` VARCHAR(70) NULL,
  `Direccion` VARCHAR(200) NOT NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo_Proveedor`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Compras
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Compras` (
  `Codigo_Compras` INT NOT NULL,
  `Codigo_Proveedor` INT NOT NULL,
  `Fecha_Compra` DATE NOT NULL,
  `Tipo_Documento` VARCHAR(20) NOT NULL,
  `Serie` CHAR(3) NOT NULL,
  `Nro_Documento` VARCHAR(7) NOT NULL,
  `Total` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`Codigo_Compras`),
  CONSTRAINT `FK__Compras__Codigo___45F365D3`
    FOREIGN KEY (`Codigo_Proveedor`)
    REFERENCES `Funeraria`.`Proveedor` (`Codigo_Proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Detalle_Compras
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Detalle_Compras` (
  `Codigo_Detalle_Compras` INT NOT NULL,
  `Codigo_Compras` INT NOT NULL,
  `Codigo_Item` INT NOT NULL,
  `Precio_Compra` DECIMAL(19,4) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Igv` DECIMAL(19,4) NOT NULL,
  `Sub_Total` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`Codigo_Detalle_Compras`),
  CONSTRAINT `FK__Detalle_C__Codig__49C3F6B7`
    FOREIGN KEY (`Codigo_Compras`)
    REFERENCES `Funeraria`.`Compras` (`Codigo_Compras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Detalle_C__Codig__4AB81AF0`
    FOREIGN KEY (`Codigo_Item`)
    REFERENCES `Funeraria`.`Item` (`Codigo_Item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Ventas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Ventas` (
  `Codigo_Ventas` INT NOT NULL,
  `Codigo_Cliente` INT NOT NULL,
  `Codigo_Personal` INT NOT NULL,
  `Tipo_Documento` VARCHAR(20) NOT NULL,
  `Serie` CHAR(3) NOT NULL,
  `NroComprobante` CHAR(7) NOT NULL,
  `FechaVenta` DATE NOT NULL,
  `Total` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`Codigo_Ventas`),
  CONSTRAINT `FK__Ventas__Codigo_C__4D94879B`
    FOREIGN KEY (`Codigo_Cliente`)
    REFERENCES `Funeraria`.`Cliente` (`Codigo_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Ventas__Codigo_P__4E88ABD4`
    FOREIGN KEY (`Codigo_Personal`)
    REFERENCES `Funeraria`.`Personal` (`Codigo_Personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Detalle_Venta
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Detalle_Venta` (
  `CodigoDetalleVenta` INT NOT NULL,
  `Codigo_Ventas` INT NOT NULL,
  `Codigo_Item` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Precio_Venta` DECIMAL(19,4) NOT NULL,
  `Igv` DECIMAL(19,4) NOT NULL,
  `Dscto` DECIMAL(19,4) NULL DEFAULT 0,
  `Sub_Total` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`CodigoDetalleVenta`),
  CONSTRAINT `FK__Detalle_V__Codig__52593CB8`
    FOREIGN KEY (`Codigo_Ventas`)
    REFERENCES `Funeraria`.`Ventas` (`Codigo_Ventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Detalle_V__Codig__534D60F1`
    FOREIGN KEY (`Codigo_Item`)
    REFERENCES `Funeraria`.`Item` (`Codigo_Item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Informacion_Venta
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Informacion_Venta` (
  `Codigo_Informacion_Venta` INT NOT NULL,
  `Codigo_Ventas` INT NOT NULL,
  `Dirección_Velatorio` VARCHAR(120) NOT NULL,
  `Cementerio` VARCHAR(120) NOT NULL,
  `Dirección_Sepelio` VARCHAR(120) NOT NULL,
  `Fecha_Sepelio` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`Codigo_Informacion_Venta`),
  UNIQUE INDEX `UQ__Informac__FBB5D263F44E77C5` (`Codigo_Ventas` ASC) VISIBLE,
  CONSTRAINT `FK__Informaci__Codig__5812160E`
    FOREIGN KEY (`Codigo_Ventas`)
    REFERENCES `Funeraria`.`Ventas` (`Codigo_Ventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Funeraria.Color
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Color` (
  `Codigo_color` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo_color`));

-- ----------------------------------------------------------------------------
-- Table Funeraria.Material
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funeraria`.`Material` (
  `Codigo_material` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo_material`));
 Schema Funeraria
 
DROP SCHEMA IF EXISTS `Funeraria` ;
CREATE SCHEMA IF NOT EXISTS `Funeraria` ;

 
 Table Funeraria.Tipo_Item
 


 
 View Funeraria.Buscar_Difunto
 
 USE `Funeraria`;

 DELIMITER $$

 Create  OR REPLACE Procedure Buscar_Difunto
(
 @Datos Varchar(60)

 )As

 	Begin

 		Select * From Difunto 

 		Where (Dni like @Datos+'%') Or (Nombres Like @Datos+'%') Or (Apellidos Like @Datos+'%') 

 		Or (Nombres+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombres Like @Datos+'%')

 	End$$
DELIMITER

 
 View Funeraria.Verificar_Existe_Parentesco
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Verificar_Existe_Parentesco

 @Codigo_Difunto Int

 )As

 	Begin

 		Select COUNT(Codigo_Difunto) From Parentesco WHere Codigo_Difunto=@Codigo_Difunto

 	End

 ;

 
 View Funeraria.Registra_Difunto
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registra_Difunto

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

 ))As

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

 ;

 
 View Funeraria.Actualizar_Difunto
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Difunto

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

 ))As

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

 ;

 
 View Funeraria.Listar_Parentesco
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Parentesco

 )As

 	Begin

 		Select P.Codigo_Parentesco, P.Codigo_Cliente,P.Codigo_Difunto,C.Nombres )As 'Cliente',D.Nombres+' '+D.Apellidos )As 'Difunto',P.Descripcion )As 'Parentesco' 

 		From Cliente C Inner Join Parentesco P on C.Codigo_Cliente=P.Codigo_Cliente

 		Inner Join Difunto D on D.Codigo_Difunto=P.Codigo_Difunto

 	End

 ;

 
 View Funeraria.Registrar_Parentesco
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Parentesco

 (@Codigo_Cliente Int,

 @Codigo_Difunto Int,

 @Descripcion Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Parentesco Where Codigo_Cliente=@Codigo_Cliente And Codigo_Difunto=@Codigo_Difunto))

 		Set @Mensaje = 'El parentesco ya se ha ha defino'

 		Else

 			Begin

 				Insert Parentesco Values(@Codigo_Cliente,@Codigo_Difunto,@Descripcion)

 				Set @Mensaje = 'Registrado correctamente'

 			End

 	End

 ;

 
 View Funeraria.Actualizar_Parentesco
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Parentesco

 (@Codigo_Parentesco Int,

 @Codigo_Cliente Int,

 @Codigo_Difunto Int,

 @Descripcion Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Listar_Proveedores
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Proveedores

 )As

 	Begin

 		Select * From Proveedor

 	End

 ;

 
 View Funeraria.Buscar_Proveedores
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Buscar_Proveedores

 @Datos Varchar(70)

 )As

 	Begin

 		Select * From Proveedor Where (RUC Like @Datos+'%') Or (Razon_Social Like @Datos+'%')

 	End

 ;

 
 View Funeraria.Registrar_Proveedor
 
 USE `Funeraria`;
 

 

 Create  OR REPLACE Procedure Registrar_Proveedor

 (@RUC char(11),

 @Razon_Social varchar(200),

 @Representante varchar(150),

 @Celular_Representante varchar(12),

 @Telefono_Empresa varchar(70),

 @Direccion varchar(200),

 @Email varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Actualizar_Proveedor
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Proveedor

 (@Codigo_Proveedor int,

 @RUC char(11),

 @Razon_Social varchar(200),

 @Representante varchar(150),

 @Celular_Representante varchar(12),

 @Telefono_Empresa varchar(70),

 @Direccion varchar(200),

 @Email varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Devolver_Codigo_Compr)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Devolver_Codigo_Compr)As

 @CodigoCompra Int Output

 )As

 	Begin

 		If(not exists(Select Codigo_Compr)As From Compr)As))

 			set @CodigoCompra=1

 		else 

 			begin

 				set @CodigoCompra=(SELECT max(Codigo_Compr)As) FROM Compr)As)

 			End

 	End

 ;

 
 View Funeraria.Registrar_Compr)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Registrar_Compr)As

 (@Codigo_Proveedor int,

 @Fecha_Compra date,

 @Tipo_Documento varchar(20),

 @Serie char(3),

 @Nro_Documento varchar(7),

 @Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	Begin

 		if(not exists(Select * from Proveedor where Codigo_Proveedor=@Codigo_Proveedor))

 		set @Mensaje='Código de Proveedor no Existe'

 		else

 			Begin

 				Insert Compr)As Values(@Codigo_Proveedor,@Fecha_Compra,@Tipo_Documento,@Serie,

 						@Nro_Documento,@Total)

 						Set @Mensaje = 'Compra Registrada correctamente' 

 			End

 	End

 ;

 
 View Funeraria.Registrar_Detalle_Compr)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Registrar_Detalle_Compr)As

 (@Codigo_Compr)As int,

 @Codigo_Item int,

 @Precio_Compra money,

 @Cantidad int,

 @Igv money,

 @Sub_Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	declare @Stock )As int

 	Begin

 		Set @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)

 		Insert Detalle_Compr)As Values(@Codigo_Compr)As,@Codigo_Item,@Precio_Compra,@Cantidad,@Igv,@Sub_Total)

 		Set @Mensaje = 'Detalle de Compra Registrado correctamente' 

 		Update Detalle_Item Set Stock=@Stock+@Cantidad Where Codigo_Item=@Codigo_Item

 	End

 ;

 
 View Funeraria.Listar_Compr)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Compr)As

 )As	

 	Begin

 		Select C.Codigo_Compr)As,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compr)As C on P.Codigo_Proveedor=C.Codigo_Proveedor

 	End

 ;

 
 View Funeraria.Listar_Detalle_Compr)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Detalle_Compr)As

 @CodigoCompr)As Int

 )As

 	Begin

 		Select I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Compr)As C Inner Join Detalle_Compr)As D on C.Codigo_Compr)As=D.Codigo_Compr)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item

 		Where D.Codigo_Compr)As=@CodigoCompr)As

 		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total

 	End

 ;

 
 View Funeraria.Listar_Compr)As_PorFech)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Compr)As_PorFech)As

 @Fecha1 Date,

 @Fecha2 Date

 )As

 	Begin

 		Select C.Codigo_Compr)As,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compr)As C on P.Codigo_Proveedor=C.Codigo_Proveedor

 		Where C.Fecha_Compra Between @Fecha1 And @Fecha2

 	End

 ;

 
 View Funeraria.Serie Documento
 
 USE `Funeraria`;
 

 

 Create  OR REPLACE Proc [Serie Documento]

 @Serie char(3) out

 )As

 	Begin

 		Set @Serie='001'

 	End

 ;

 
 View Funeraria.Numero Correlativo
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure [Numero Correlativo]

 @TipoDocumento Varchar(7),

 @NroCorrelativo Char(7)Out

 )As 

 	Begin

 		Declare @Cant Int

 		If(@TipoDocumento='Factura')

 			Begin

 				Select @Cant=Count(*)+1 From Vent)As where Tipo_Documento='Factura'

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

 				Select @Cant=Count(*)+1 From Vent)As where Tipo_Documento='Boleta'

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

 ;

 
 View Funeraria.Registrar_Vent)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Registrar_Vent)As

 (@Codigo_Cliente Int,

 @Codigo_Personal Int,

 @Tipo_Documento Varchar(20),

 @Serie Char(3),

 @NroComprobante Char(7),

 @FechaVenta Date,

 @Total Money,

 @Mensaje Varchar(100) Out

 ))As 

 	Begin

 		if(not exists(Select * from Cliente where Codigo_Cliente=@Codigo_Cliente))

 		set @Mensaje='Código de Cliente no Existe'

 		else

 			Begin

 				Insert Vent)As Values(@Codigo_Cliente,@Codigo_Personal,@Tipo_Documento,@Serie,@NroComprobante,@FechaVenta,@Total)

 				Set @Mensaje = 'Venta Registrada correctamente' 

 			End

 	End

 ;

 
 View Funeraria.Devolver_Codigo_Vent)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Devolver_Codigo_Vent)As

 @CodigoVenta Int Output

 )As

 	Begin

 		If(not exists(Select Codigo_Vent)As From Vent)As))

 			set @CodigoVenta=1

 		else 

 			begin

 				set @CodigoVenta=(SELECT max(Codigo_Vent)As) FROM Vent)As)

 			End

 	End

 ;

 
 View Funeraria.Registrar_Detalle_Venta
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Registrar_Detalle_Venta

 (@Codigo_Vent)As int,

 @Codigo_Item int,

 @Cantidad int,

 @Precio_Venta money,

 @Igv money,

 @Dscto Money,

 @Sub_Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	Declare @Stock )As Int

 	Begin

 		Set  @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)

 		Insert Detalle_Venta Values(@Codigo_Vent)As,@Codigo_Item,@Cantidad,@Precio_Venta,@Igv,@Dscto,@Sub_Total)

 		Set @Mensaje = 'Detalle de Venta Registrado correctamente' 

 		Update Detalle_Item Set Stock=@Stock-@Cantidad Where Codigo_Item=@Codigo_Item

 	End

 ;

 
 View Funeraria.Registrar_Informacion_Venta
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Informacion_Venta

 (@Codigo_Vent)As int,

 @Dirección_Velatorio varchar(120),

 @Cementerio varchar(120),

 @Dirección_Sepelio varchar(120),

 @Fecha_Sepelio date,

 @Hora time,

 @Mensaje Varchar(100) Out

 )

 )As

 	Begin

 		if(not Exists(Select * from Vent)As where Codigo_Vent)As=@Codigo_Vent)As))

 		set @Mensaje='No existe el Código de Venta'

 		else

 			begin

 				Insert Informacion_Venta Values(@Codigo_Vent)As,@Dirección_Velatorio,

 					@Cementerio,@Dirección_Sepelio,@Fecha_Sepelio,@Hora)

 				set @Mensaje='Información Registrada Correctamente'

 			End		

 	End

 ;

 
 View Funeraria.Actualizar_Informacion_Venta
 
 USE `Funeraria`;
 

 

 Create  OR REPLACE Procedure Actualizar_Informacion_Venta

 (@Codigo_Informacion_Venta int,

 @Codigo_Vent)As int,

 @Dirección_Velatorio varchar(120),

 @Cementerio varchar(120),

 @Dirección_Sepelio varchar(120),

 @Fecha_Sepelio date,

 @Hora time,

 @Mensaje Varchar(100) Out

 )

 )As

 	Begin

 		if(not Exists(Select * from Informacion_Venta where Codigo_Informacion_Venta=@Codigo_Informacion_Venta))

 		set @Mensaje='No existe el código de la información'

 		else

 			begin

 				Update Informacion_Venta Set Codigo_Vent)As=@Codigo_Vent)As,Dirección_Velatorio=@Dirección_Velatorio,

 					Cementerio=@Cementerio,Dirección_Sepelio=@Dirección_Sepelio,Fecha_Sepelio=@Fecha_Sepelio,Hora=@Hora

 					where Codigo_Informacion_Venta=@Codigo_Informacion_Venta

 					Set @Mensaje='Información Actualizada Correctamente'

 			End		

 	End

 ;

 
 View Funeraria.Listar_Vent)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Vent)As

 )As

 	Select V.Codigo_Vent)As,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],

 	V.Tipo_Documento,V.FechaVenta,V.Total

 	From Cliente C Inner Join Vent)As V on C.Codigo_Cliente=V.Codigo_Cliente

 	Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal

 ;

 
 View Funeraria.Listar_Detalle_Venta
 
 USE `Funeraria`;
 

 

 Create Procedure Listar_Detalle_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Vent)As V Inner Join Detalle_Venta D On V.Codigo_Vent)As=D.Codigo_Vent)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item

 		Where D.Codigo_Vent)As=@Codigo_Venta

 		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total

 	End

 Go

 

 Create  OR REPLACE Procedure Listar_Detalle_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Vent)As V Inner Join Detalle_Venta D On V.Codigo_Vent)As=D.Codigo_Vent)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Where D.Codigo_Vent)As=@Codigo_Venta

 		Group By I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total

 	End

 ;

 
 View Funeraria.Mostrar_Detalle_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Mostrar_Detalle_Item

 @CodigoItem Int

 )As

 	Begin

 		Select Color,Material From Detalle_Item Where Codigo_Item=@CodigoItem

 	End

 ;

 
 View Funeraria.Listar_Vent)As_PorFech)As
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Vent)As_PorFech)As

 @Fecha1 Date,

 @Fecha2 Date

 )As

 	Begin

 		Select V.Codigo_Vent)As,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],

 		V.Tipo_Documento,V.FechaVenta,V.Total

 		From Cliente C Inner Join Vent)As V on C.Codigo_Cliente=V.Codigo_Cliente

 		Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal

 		Where V.FechaVenta Between @Fecha1 And @Fecha2

 	End

 ;

 
 View Funeraria.Ver_Informacion_Venta
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Ver_Informacion_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Dirección_Velatorio,I.Cementerio,I.Fecha_Sepelio,I.Dirección_Sepelio,I.Hora 

 		From Vent)As V Inner Join Informacion_Venta I on V.Codigo_Vent)As=I.Codigo_Vent)As

 		Where I.Codigo_Vent)As=@Codigo_Venta

 	End

 ;

 
 View Funeraria.Loguear
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Loguear(

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100)out)

 )As 

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

 ;

 
 View Funeraria.Devolver_Codigo_Personal
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Devolver_Codigo_Personal

 (@Usuario varchar(20),

 @codigo_personal int out

 )

 )As

 	set @codigo_personal=(Select Codigo_Personal from Usuario where Usuario=@Usuario)

 ;

 
 View Funeraria.Registrar_Color
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Color(

 @Descripcion varchar(100),

 @msj varchar(100) out

 )

 )As

 	begin

 		if(exists(Select * from Color where descripcion=@Descripcion))

 		set @msj='¡El color ingresado ya existe!'

 		else

 			begin

 				insert Color values (@Descripcion)

 				set @msj='Color Registrado Correctamente'

 			end

 	end

 ;

 
 View Funeraria.Listado_Color
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Listado_Color

 )As

 	Select * from Color

 ;

 
 View Funeraria.Registrar_Material
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Material(

 @Descripcion varchar(100),

 @msj varchar(100) out

 )

 )As

 	begin

 		if(exists(Select * from Material where descripcion=@Descripcion))

 		set @msj='¡El material ingresado ya existe!'

 		else

 			begin

 				insert Material values (@Descripcion)

 				set @msj='Material Registrado Correctamente'

 			end

 	end

 ;

 
 View Funeraria.Listado_Material
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Listado_Material

 )As

 	Select * from Material

 ;

 
 View Funeraria.Listado_Tipo_Item
 
 USE `Funeraria`;
 /************************************ PROCEDIMIENTOS ALMACENADOS ************************************/

 

 

 /************************************ PROCEDIMIENTOS ALMACENADOS ************************************/

 

 Create  OR REPLACE Procedure Listado_Tipo_Item

 )As

 	Select * from Tipo_Item	

 ;

 
 View Funeraria.Listar_Servicios
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Servicios

 )As

 	Begin

 		Select * From Item Where Codigo_Tipo_Item=2

 	End

 ;

 
 View Funeraria.Registrar_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Item

 (@Codigo_Tipo_Item Int,

 @Nombre Varchar(100),

 @Precio Money,

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Item Where Nombre=@Nombre))

 		Set @Mensaje = 'El Producto: '+@Nombre+' ya existe'

 		Else

 			Begin

 				Insert Item Values(@Codigo_Tipo_Item,@Nombre,@Precio)

 				Set @Mensaje = 'Registrado Correctamente'				

 			End	

 	End

 ;

 
 View Funeraria.Actualizar_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Item

 (@Codigo_Item Int,

 @Codigo_Tipo_Item Int,

 @Nombre Varchar(100),

 @Precio Money,

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Listar_Productos
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Productos

 )As

 	Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where I.Codigo_Tipo_Item = 1

 	End

 ;

 
 View Funeraria.Buscar_Productos
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Buscar_Productos

 @Datos Varchar(70)

 )As

 	Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where (I.Codigo_Tipo_Item = 1 And I.Nombre Like '%'+@Datos+'%') Or 

 		(I.Codigo_Tipo_Item = 1 And D.Color Like @Datos+'%') Or (I.Codigo_Tipo_Item = 1 And D.Material Like @Datos+'%')

 	End

 ;

 
 View Funeraria.Listar_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Item

 )As

 	Select Codigo_Item,Nombre,Precio from Item

 ;

 
 View Funeraria.Listar_Item_Tipo
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Item_Tipo

 (

 @Codigo_Tipo_Item int

 )

 )As

 	begin

 		Select Codigo_Item,Nombre,Precio from Item

 		where Codigo_Tipo_Item=@Codigo_Tipo_Item

 	end

 ;

 
 View Funeraria.Devolver_Codigo_Item
 
 USE `Funeraria`;
  

 

 Create  OR REPLACE Procedure Devolver_Codigo_Item

 @CodigoItem Int Output

 )As

 	Begin

 		Declare @cant )As int

 		If(not exists(Select Codigo_Item From Item))

 			set @CodigoItem=1;

 		else 

 			begin

 				set @CodigoItem=(SELECT max(Codigo_Item) FROM Item)

 			End

 	End

 ;

 
 View Funeraria.Registrar_Detalle_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Detalle_Item

 (@Codigo_Item Int,

 @Descripcion Varchar(100),

 @Color Varchar(50),

 @Material Varchar(20),

 @Stock Int,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out 

 ))As

 	Begin

 		Insert Detalle_Item Values(@Codigo_Item,@Descripcion,@Color,@Material,@Stock,@RutaImagen)

 		Set @Mensaje = 'Registrado Correctamente'

 	End

 ;

 
 View Funeraria.Actualizar_Detalle_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Detalle_Item

 (@Codigo_Item Int,

 @Descripcion Varchar(100),

 @Color Varchar(50),

 @Material Varchar(20),

 @Stock Int,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out 

 ))As

 	Begin

 		Update Detalle_Item Set Descripcion=@Descripcion,Color=@Color,Material=@Material,Stock=@Stock,

 		RutaImagen=@RutaImagen Where Codigo_Item=@Codigo_Item

 		Set @Mensaje = 'Actualizado Correctamente'

 	End

 ;

 
 View Funeraria.Registrar_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Plan_Funerario 

 (@Descripcion Varchar(200),

 @Precio Money,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Plan_Funerario Where Descripcion=@Descripcion))

 		Set @Mensaje = 'El Plan Funerario: '+@Descripcion+' ya existe'

 		Else

 			Begin

 				Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values(@Descripcion,@Precio,@RutaImagen)

 				Set @Mensaje = 'Registrado Correctamente'

 			End

 	End

 ;

 
 View Funeraria.Actualizar_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Plan_Funerario 

 (@Codigo_Plan_Funerario int,

 @Descripcion Varchar(200),

 @Precio Money,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Registra_Detalle_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registra_Detalle_Plan_Funerario

 (@Codigo_Plan_Funerario Int,

 @Codigo_Item Int,

 @Precio Decimal,

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Listar_Detalle_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Detalle_Plan_Funerario

 @Codigo_Plan Int

 )As

 	Select D.Codigo_Item,D.Codigo_Detalle_Plan_Funerario,D.Codigo_Plan_Funerario,I.Nombre,I.Precio 

 	From Item I Inner Join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 	Where D.Codigo_Plan_Funerario=@Codigo_Plan

 ;

 
 View Funeraria.Verificar_Stock_Plan
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Verificar_Stock_Plan

 (@Codigo_Plan Int

 )

 )As

 Select DI.Stock from Detalle_Item DI inner join Item I on DI.Codigo_Item=I.Codigo_Item

 inner join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 where I.Codigo_Tipo_Item=1 and D.Codigo_Plan_Funerario=@Codigo_Plan

 ;

 
 View Funeraria.Verificar_Stock_Item
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Verificar_Stock_Item

 @CodigoItem Int

 )As

 	Begin

 		Select Stock From Detalle_Item Where Codigo_Item=@CodigoItem

 	End

 ;

 
 View Funeraria.Eliminar_Detalle_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Eliminar_Detalle_Plan_Funerario

 @CodigoDetalle Int,

 @Mensaje Varchar(100) Out

 )As

 	Begin

 		Delete From Detalle_Plan_Funerario Where Codigo_Detalle_Plan_Funerario=@CodigoDetalle

 		Set @Mensaje='Eliminado correctamente'

 	End

 ;

 
 View Funeraria.Listar_Plan_Funerario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Proc Listar_Plan_Funerario

 )As

 	Select * from Plan_Funerario

 ;

 
 View Funeraria.Registrar_Personal
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Personal

 (@Dni Char(8),

 @Nombre Varchar(50),

 @Apellidos Varchar(100),

 @Cargo varchar(50),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Personal Where Dni=@Dni))

 		Set @Mensaje = 'Este N° de D.N.I. :'+@Dni+' ya existe'

 		Else

 			Begin

 				Insert Personal(Dni,Nombre,Apellidos,Cargo,Direccion,Telefono,Email) Values(@Dni,@Nombre,@Apellidos,@Cargo,@Direccion,@Telefono,@Email)

 				Set @Mensaje = 'Registrado Correctamente'

 			End

 	End

 ;

 
 View Funeraria.Actualizar_Personal
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Personal

 (@Codigo_Personal Int,

 @Dni Char(8),

 @Nombre Varchar(50),

 @Apellidos Varchar(100),

 @Cargo varchar(50),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Actualizar_Estado_Personal
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Estado_Personal

 @Codigo_Personal Int,

 @Estado Varchar(10),

 @Mensaje Varchar(100) Out

 )As

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

 ;

 
 View Funeraria.Listado_Personal
 
 USE `Funeraria`;
 	

 

 Create  OR REPLACE Procedure Listado_Personal

 )As

 	Select * from Personal

 ;

 
 View Funeraria.Buscar_Personal_DNI_Nombre
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Buscar_Personal_DNI_Nombre

 (@Datos varchar(50)

 )

 )As

 	begin

 		Select * 

 		from Personal 

 		Where (Dni like @Datos+'%') or (Nombre Like @Datos+'%') Or (Apellidos Like @Datos+'%') Or

 		(Nombre+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombre Like @Datos+'%')

 	end

 ;

 
 View Funeraria.Listar_Usuarios
 
 USE `Funeraria`;
 		

 Create  OR REPLACE Procedure Listar_Usuarios

 )As

 	Begin

 		Select U.Codigo_Personal,P.Nombre+' '+P.Apellidos )As 'Personal',U.Usuario,U.Clave 

 		From Personal P Inner Join Usuario U On P.Codigo_Personal=U.Codigo_Personal

 	End

 ;

 
 View Funeraria.Registrar_Usuario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Usuario

 (@Codigo_Personal Int,

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Actualizar_Usuario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Usuario

 (@Codigo_Personal Int,

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Usuario Where Usuario=@Usuario And Codigo_Personal<>@Codigo_Personal))

 		Set @Mensaje = 'El usuario: '+@Usuario+' ya existe'

 		Else

 			Begin

 				Update Usuario Set Usuario=@Usuario,Clave=@Clave Where Codigo_Personal=@Codigo_Personal

 				Set @Mensaje = 'Actualizado correctamente'

 			End

 	End

 ;

 
 View Funeraria.Verificar_Existe_Usuario
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Verificar_Existe_Usuario

 @Codigo_Personal Int

 )As

 	Begin

 		Select COUNT(Codigo_Personal) From Usuario WHere Codigo_Personal=@Codigo_Personal

 	End

 ;

 
 View Funeraria.Registrar_Cliente
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Registrar_Cliente

 (@Tipo_Persona Varchar(15),

 @Tipo_Documento Char(6),

 @Documento Varchar(11),

 @Nombres Varchar(150),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Actualizar_Cliente
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Actualizar_Cliente

 (@Codigo_Cliente int,

 @Tipo_Persona Varchar(15),

 @Tipo_Documento Char(6),

 @Documento Varchar(11),

 @Nombres Varchar(150),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 ;

 
 View Funeraria.Listado_Cliente
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listado_Cliente

 )As

 	Select * from Cliente

 ;

 
 View Funeraria.Buscar_Cliente_NroDoc_Nombre
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Buscar_Cliente_NroDoc_Nombre

 (@Datos varchar(50)

 )

 )As

 	begin

 		Select * from Cliente where (Documento like @Datos+'%') or (Nombres like @Datos+'%')

 	end

 ;

 
 View Funeraria.Listar_Difuntos
 
 USE `Funeraria`;
 

 Create  OR REPLACE Procedure Listar_Difuntos

 )As

 	Begin

 		Select * From Difunto

 	End

 ;

 
 Routine Funeraria.Buscar_Difunto
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Buscar_Difunto

 @Datos Varchar(60)

 )As

 	Begin

 		Select * From Difunto 

 		Where (Dni like @Datos+'%') Or (Nombres Like @Datos+'%') Or (Apellidos Like @Datos+'%') 

 		Or (Nombres+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombres Like @Datos+'%')

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Verificar_Existe_Parentesco
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Verificar_Existe_Parentesco

 @Codigo_Difunto Int

 )As

 	Begin

 		Select COUNT(Codigo_Difunto) From Parentesco WHere Codigo_Difunto=@Codigo_Difunto

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registra_Difunto
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

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

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Difunto
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

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

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Parentesco
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Parentesco

 )As

 	Begin

 		Select P.Codigo_Parentesco, P.Codigo_Cliente,P.Codigo_Difunto,C.Nombres )As 'Cliente',D.Nombres+' '+D.Apellidos )As 'Difunto',P.Descripcion )As 'Parentesco' 

 		From Cliente C Inner Join Parentesco P on C.Codigo_Cliente=P.Codigo_Cliente

 		Inner Join Difunto D on D.Codigo_Difunto=P.Codigo_Difunto

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Parentesco
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Parentesco

 (@Codigo_Cliente Int,

 @Codigo_Difunto Int,

 @Descripcion Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Parentesco Where Codigo_Cliente=@Codigo_Cliente And Codigo_Difunto=@Codigo_Difunto))

 		Set @Mensaje = 'El parentesco ya se ha ha defino'

 		Else

 			Begin

 				Insert Parentesco Values(@Codigo_Cliente,@Codigo_Difunto,@Descripcion)

 				Set @Mensaje = 'Registrado correctamente'

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Parentesco
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Parentesco

 (@Codigo_Parentesco Int,

 @Codigo_Cliente Int,

 @Codigo_Difunto Int,

 @Descripcion Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Proveedores
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Proveedores

 )As

 	Begin

 		Select * From Proveedor

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Buscar_Proveedores
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Buscar_Proveedores

 @Datos Varchar(70)

 )As

 	Begin

 		Select * From Proveedor Where (RUC Like @Datos+'%') Or (Razon_Social Like @Datos+'%')

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Proveedor
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 

 Create Procedure Registrar_Proveedor

 (@RUC char(11),

 @Razon_Social varchar(200),

 @Representante varchar(150),

 @Celular_Representante varchar(12),

 @Telefono_Empresa varchar(70),

 @Direccion varchar(200),

 @Email varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Proveedor
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

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

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Devolver_Codigo_Compr)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Devolver_Codigo_Compr)As

 @CodigoCompra Int Output

 )As

 	Begin

 		If(not exists(Select Codigo_Compr)As From Compr)As))

 			set @CodigoCompra=1

 		else 

 			begin

 				set @CodigoCompra=(SELECT max(Codigo_Compr)As) FROM Compr)As)

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Compr)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Registrar_Compr)As

 (@Codigo_Proveedor int,

 @Fecha_Compra date,

 @Tipo_Documento varchar(20),

 @Serie char(3),

 @Nro_Documento varchar(7),

 @Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	Begin

 		if(not exists(Select * from Proveedor where Codigo_Proveedor=@Codigo_Proveedor))

 		set @Mensaje='Código de Proveedor no Existe'

 		else

 			Begin

 				Insert Compr)As Values(@Codigo_Proveedor,@Fecha_Compra,@Tipo_Documento,@Serie,

 						@Nro_Documento,@Total)

 						Set @Mensaje = 'Compra Registrada correctamente' 

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Detalle_Compr)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Registrar_Detalle_Compr)As

 (@Codigo_Compr)As int,

 @Codigo_Item int,

 @Precio_Compra money,

 @Cantidad int,

 @Igv money,

 @Sub_Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	declare @Stock )As int

 	Begin

 		Set @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)

 		Insert Detalle_Compr)As Values(@Codigo_Compr)As,@Codigo_Item,@Precio_Compra,@Cantidad,@Igv,@Sub_Total)

 		Set @Mensaje = 'Detalle de Compra Registrado correctamente' 

 		Update Detalle_Item Set Stock=@Stock+@Cantidad Where Codigo_Item=@Codigo_Item

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Compr)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Compr)As

 )As	

 	Begin

 		Select C.Codigo_Compr)As,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compr)As C on P.Codigo_Proveedor=C.Codigo_Proveedor

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Detalle_Compr)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Detalle_Compr)As

 @CodigoCompr)As Int

 )As

 	Begin

 		Select I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Compr)As C Inner Join Detalle_Compr)As D on C.Codigo_Compr)As=D.Codigo_Compr)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item

 		Where D.Codigo_Compr)As=@CodigoCompr)As

 		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Compr)As_PorFech)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Compr)As_PorFech)As

 @Fecha1 Date,

 @Fecha2 Date

 )As

 	Begin

 		Select C.Codigo_Compr)As,P.RUC,P.Razon_Social,C.Serie+' - '+C.Nro_Documento [Comprobante],C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compr)As C on P.Codigo_Proveedor=C.Codigo_Proveedor

 		Where C.Fecha_Compra Between @Fecha1 And @Fecha2

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Serie Documento
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 

 Create Proc [Serie Documento]

 @Serie char(3) out

 )As

 	Begin

 		Set @Serie='001'

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Numero Correlativo
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure [Numero Correlativo]

 @TipoDocumento Varchar(7),

 @NroCorrelativo Char(7)Out

 )As 

 	Begin

 		Declare @Cant Int

 		If(@TipoDocumento='Factura')

 			Begin

 				Select @Cant=Count(*)+1 From Vent)As where Tipo_Documento='Factura'

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

 				Select @Cant=Count(*)+1 From Vent)As where Tipo_Documento='Boleta'

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Vent)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Registrar_Vent)As

 (@Codigo_Cliente Int,

 @Codigo_Personal Int,

 @Tipo_Documento Varchar(20),

 @Serie Char(3),

 @NroComprobante Char(7),

 @FechaVenta Date,

 @Total Money,

 @Mensaje Varchar(100) Out

 ))As 

 	Begin

 		if(not exists(Select * from Cliente where Codigo_Cliente=@Codigo_Cliente))

 		set @Mensaje='Código de Cliente no Existe'

 		else

 			Begin

 				Insert Vent)As Values(@Codigo_Cliente,@Codigo_Personal,@Tipo_Documento,@Serie,@NroComprobante,@FechaVenta,@Total)

 				Set @Mensaje = 'Venta Registrada correctamente' 

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Devolver_Codigo_Vent)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Devolver_Codigo_Vent)As

 @CodigoVenta Int Output

 )As

 	Begin

 		If(not exists(Select Codigo_Vent)As From Vent)As))

 			set @CodigoVenta=1

 		else 

 			begin

 				set @CodigoVenta=(SELECT max(Codigo_Vent)As) FROM Vent)As)

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Detalle_Venta
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Registrar_Detalle_Venta

 (@Codigo_Vent)As int,

 @Codigo_Item int,

 @Cantidad int,

 @Precio_Venta money,

 @Igv money,

 @Dscto Money,

 @Sub_Total money,

 @Mensaje Varchar(100) Out

 ))As 

 	Declare @Stock )As Int

 	Begin

 		Set  @Stock=(Select Stock From Detalle_Item Where Codigo_Item=@Codigo_Item)

 		Insert Detalle_Venta Values(@Codigo_Vent)As,@Codigo_Item,@Cantidad,@Precio_Venta,@Igv,@Dscto,@Sub_Total)

 		Set @Mensaje = 'Detalle de Venta Registrado correctamente' 

 		Update Detalle_Item Set Stock=@Stock-@Cantidad Where Codigo_Item=@Codigo_Item

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Informacion_Venta
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Informacion_Venta

 (@Codigo_Vent)As int,

 @Dirección_Velatorio varchar(120),

 @Cementerio varchar(120),

 @Dirección_Sepelio varchar(120),

 @Fecha_Sepelio date,

 @Hora time,

 @Mensaje Varchar(100) Out

 )

 )As

 	Begin

 		if(not Exists(Select * from Vent)As where Codigo_Vent)As=@Codigo_Vent)As))

 		set @Mensaje='No existe el Código de Venta'

 		else

 			begin

 				Insert Informacion_Venta Values(@Codigo_Vent)As,@Dirección_Velatorio,

 					@Cementerio,@Dirección_Sepelio,@Fecha_Sepelio,@Hora)

 				set @Mensaje='Información Registrada Correctamente'

 			End		

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Informacion_Venta
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 

 Create Procedure Actualizar_Informacion_Venta

 (@Codigo_Informacion_Venta int,

 @Codigo_Vent)As int,

 @Dirección_Velatorio varchar(120),

 @Cementerio varchar(120),

 @Dirección_Sepelio varchar(120),

 @Fecha_Sepelio date,

 @Hora time,

 @Mensaje Varchar(100) Out

 )

 )As

 	Begin

 		if(not Exists(Select * from Informacion_Venta where Codigo_Informacion_Venta=@Codigo_Informacion_Venta))

 		set @Mensaje='No existe el código de la información'

 		else

 			begin

 				Update Informacion_Venta Set Codigo_Vent)As=@Codigo_Vent)As,Dirección_Velatorio=@Dirección_Velatorio,

 					Cementerio=@Cementerio,Dirección_Sepelio=@Dirección_Sepelio,Fecha_Sepelio=@Fecha_Sepelio,Hora=@Hora

 					where Codigo_Informacion_Venta=@Codigo_Informacion_Venta

 					Set @Mensaje='Información Actualizada Correctamente'

 			End		

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Vent)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Vent)As

 )As

 	Select V.Codigo_Vent)As,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],

 	V.Tipo_Documento,V.FechaVenta,V.Total

 	From Cliente C Inner Join Vent)As V on C.Codigo_Cliente=V.Codigo_Cliente

 	Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Detalle_Venta
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 

 Create Procedure Listar_Detalle_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Vent)As V Inner Join Detalle_Venta D On V.Codigo_Vent)As=D.Codigo_Vent)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item

 		Where D.Codigo_Vent)As=@Codigo_Venta

 		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total

 	End

 Go

 

 Create Procedure Listar_Detalle_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) [Total]

 		From Vent)As V Inner Join Detalle_Venta D On V.Codigo_Vent)As=D.Codigo_Vent)As

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Where D.Codigo_Vent)As=@Codigo_Venta

 		Group By I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Mostrar_Detalle_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Mostrar_Detalle_Item

 @CodigoItem Int

 )As

 	Begin

 		Select Color,Material From Detalle_Item Where Codigo_Item=@CodigoItem

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Vent)As_PorFech)As
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Vent)As_PorFech)As

 @Fecha1 Date,

 @Fecha2 Date

 )As

 	Begin

 		Select V.Codigo_Vent)As,C.Tipo_Documento,C.Documento,C.Nombres [Cliente],V.Serie+' - '+V.NroComprobante [Comprobante],

 		V.Tipo_Documento,V.FechaVenta,V.Total

 		From Cliente C Inner Join Vent)As V on C.Codigo_Cliente=V.Codigo_Cliente

 		Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal

 		Where V.FechaVenta Between @Fecha1 And @Fecha2

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Ver_Informacion_Venta
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Ver_Informacion_Venta

 @Codigo_Venta Int

 )As

 	Begin

 		Select I.Dirección_Velatorio,I.Cementerio,I.Fecha_Sepelio,I.Dirección_Sepelio,I.Hora 

 		From Vent)As V Inner Join Informacion_Venta I on V.Codigo_Vent)As=I.Codigo_Vent)As

 		Where I.Codigo_Vent)As=@Codigo_Venta

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Loguear
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Loguear(

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100)out)

 )As 

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Devolver_Codigo_Personal
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Devolver_Codigo_Personal

 (@Usuario varchar(20),

 @codigo_personal int out

 )

 )As

 	set @codigo_personal=(Select Codigo_Personal from Usuario where Usuario=@Usuario)

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Color
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Color(

 @Descripcion varchar(100),

 @msj varchar(100) out

 )

 )As

 	begin

 		if(exists(Select * from Color where descripcion=@Descripcion))

 		set @msj='¡El color ingresado ya existe!'

 		else

 			begin

 				insert Color values (@Descripcion)

 				set @msj='Color Registrado Correctamente'

 			end

 	end

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listado_Color
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Listado_Color

 )As

 	Select * from Color

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Material
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Material(

 @Descripcion varchar(100),

 @msj varchar(100) out

 )

 )As

 	begin

 		if(exists(Select * from Material where descripcion=@Descripcion))

 		set @msj='¡El material ingresado ya existe!'

 		else

 			begin

 				insert Material values (@Descripcion)

 				set @msj='Material Registrado Correctamente'

 			end

 	end

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listado_Material
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Listado_Material

 )As

 	Select * from Material

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listado_Tipo_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 /************************************ PROCEDIMIENTOS ALMACENADOS ************************************/

 

 

 /************************************ PROCEDIMIENTOS ALMACENADOS ************************************/

 

 Create Procedure Listado_Tipo_Item

 )As

 	Select * from Tipo_Item	

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Servicios
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Servicios

 )As

 	Begin

 		Select * From Item Where Codigo_Tipo_Item=2

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Item

 (@Codigo_Tipo_Item Int,

 @Nombre Varchar(100),

 @Precio Money,

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Item Where Nombre=@Nombre))

 		Set @Mensaje = 'El Producto: '+@Nombre+' ya existe'

 		Else

 			Begin

 				Insert Item Values(@Codigo_Tipo_Item,@Nombre,@Precio)

 				Set @Mensaje = 'Registrado Correctamente'				

 			End	

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Item

 (@Codigo_Item Int,

 @Codigo_Tipo_Item Int,

 @Nombre Varchar(100),

 @Precio Money,

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Productos
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Productos

 )As

 	Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where I.Codigo_Tipo_Item = 1

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Buscar_Productos
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Buscar_Productos

 @Datos Varchar(70)

 )As

 	Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where (I.Codigo_Tipo_Item = 1 And I.Nombre Like '%'+@Datos+'%') Or 

 		(I.Codigo_Tipo_Item = 1 And D.Color Like @Datos+'%') Or (I.Codigo_Tipo_Item = 1 And D.Material Like @Datos+'%')

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Item

 )As

 	Select Codigo_Item,Nombre,Precio from Item

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Item_Tipo
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Item_Tipo

 (

 @Codigo_Tipo_Item int

 )

 )As

 	begin

 		Select Codigo_Item,Nombre,Precio from Item

 		where Codigo_Tipo_Item=@Codigo_Tipo_Item

 	end

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Devolver_Codigo_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
  

 

 Create Procedure Devolver_Codigo_Item

 @CodigoItem Int Output

 )As

 	Begin

 		Declare @cant )As int

 		If(not exists(Select Codigo_Item From Item))

 			set @CodigoItem=1;

 		else 

 			begin

 				set @CodigoItem=(SELECT max(Codigo_Item) FROM Item)

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Detalle_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Detalle_Item

 (@Codigo_Item Int,

 @Descripcion Varchar(100),

 @Color Varchar(50),

 @Material Varchar(20),

 @Stock Int,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out 

 ))As

 	Begin

 		Insert Detalle_Item Values(@Codigo_Item,@Descripcion,@Color,@Material,@Stock,@RutaImagen)

 		Set @Mensaje = 'Registrado Correctamente'

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Detalle_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Detalle_Item

 (@Codigo_Item Int,

 @Descripcion Varchar(100),

 @Color Varchar(50),

 @Material Varchar(20),

 @Stock Int,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out 

 ))As

 	Begin

 		Update Detalle_Item Set Descripcion=@Descripcion,Color=@Color,Material=@Material,Stock=@Stock,

 		RutaImagen=@RutaImagen Where Codigo_Item=@Codigo_Item

 		Set @Mensaje = 'Actualizado Correctamente'

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Plan_Funerario 

 (@Descripcion Varchar(200),

 @Precio Money,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Plan_Funerario Where Descripcion=@Descripcion))

 		Set @Mensaje = 'El Plan Funerario: '+@Descripcion+' ya existe'

 		Else

 			Begin

 				Insert Plan_Funerario (Descripcion,Precio,RutaImagen) Values(@Descripcion,@Precio,@RutaImagen)

 				Set @Mensaje = 'Registrado Correctamente'

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Plan_Funerario 

 (@Codigo_Plan_Funerario int,

 @Descripcion Varchar(200),

 @Precio Money,

 @RutaImagen Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registra_Detalle_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registra_Detalle_Plan_Funerario

 (@Codigo_Plan_Funerario Int,

 @Codigo_Item Int,

 @Precio Decimal,

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Detalle_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Detalle_Plan_Funerario

 @Codigo_Plan Int

 )As

 	Select D.Codigo_Item,D.Codigo_Detalle_Plan_Funerario,D.Codigo_Plan_Funerario,I.Nombre,I.Precio 

 	From Item I Inner Join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 	Where D.Codigo_Plan_Funerario=@Codigo_Plan

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Verificar_Stock_Plan
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Verificar_Stock_Plan

 (@Codigo_Plan Int

 )

 )As

 Select DI.Stock from Detalle_Item DI inner join Item I on DI.Codigo_Item=I.Codigo_Item

 inner join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 where I.Codigo_Tipo_Item=1 and D.Codigo_Plan_Funerario=@Codigo_Plan

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Verificar_Stock_Item
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Verificar_Stock_Item

 @CodigoItem Int

 )As

 	Begin

 		Select Stock From Detalle_Item Where Codigo_Item=@CodigoItem

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Eliminar_Detalle_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Eliminar_Detalle_Plan_Funerario

 @CodigoDetalle Int,

 @Mensaje Varchar(100) Out

 )As

 	Begin

 		Delete From Detalle_Plan_Funerario Where Codigo_Detalle_Plan_Funerario=@CodigoDetalle

 		Set @Mensaje='Eliminado correctamente'

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Plan_Funerario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Proc Listar_Plan_Funerario

 )As

 	Select * from Plan_Funerario

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Personal
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Personal

 (@Dni Char(8),

 @Nombre Varchar(50),

 @Apellidos Varchar(100),

 @Cargo varchar(50),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Personal Where Dni=@Dni))

 		Set @Mensaje = 'Este N° de D.N.I. :'+@Dni+' ya existe'

 		Else

 			Begin

 				Insert Personal(Dni,Nombre,Apellidos,Cargo,Direccion,Telefono,Email) Values(@Dni,@Nombre,@Apellidos,@Cargo,@Direccion,@Telefono,@Email)

 				Set @Mensaje = 'Registrado Correctamente'

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Personal
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

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

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Estado_Personal
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Estado_Personal

 @Codigo_Personal Int,

 @Estado Varchar(10),

 @Mensaje Varchar(100) Out

 )As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listado_Personal
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 	

 

 Create Procedure Listado_Personal

 )As

 	Select * from Personal

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Buscar_Personal_DNI_Nombre
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Buscar_Personal_DNI_Nombre

 (@Datos varchar(50)

 )

 )As

 	begin

 		Select * 

 		from Personal 

 		Where (Dni like @Datos+'%') or (Nombre Like @Datos+'%') Or (Apellidos Like @Datos+'%') Or

 		(Nombre+' '+Apellidos Like @Datos+'%') Or (Apellidos+' '+Nombre Like @Datos+'%')

 	end

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Usuarios
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 		

 Create Procedure Listar_Usuarios

 )As

 	Begin

 		Select U.Codigo_Personal,P.Nombre+' '+P.Apellidos )As 'Personal',U.Usuario,U.Clave 

 		From Personal P Inner Join Usuario U On P.Codigo_Personal=U.Codigo_Personal

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Usuario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Usuario

 (@Codigo_Personal Int,

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Usuario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Actualizar_Usuario

 (@Codigo_Personal Int,

 @Usuario Varchar(20),

 @Clave Varchar(10),

 @Mensaje Varchar(100) Out

 ))As

 	Begin

 		If(Exists(Select * From Usuario Where Usuario=@Usuario And Codigo_Personal<>@Codigo_Personal))

 		Set @Mensaje = 'El usuario: '+@Usuario+' ya existe'

 		Else

 			Begin

 				Update Usuario Set Usuario=@Usuario,Clave=@Clave Where Codigo_Personal=@Codigo_Personal

 				Set @Mensaje = 'Actualizado correctamente'

 			End

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Verificar_Existe_Usuario
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Verificar_Existe_Usuario

 @Codigo_Personal Int

 )As

 	Begin

 		Select COUNT(Codigo_Personal) From Usuario WHere Codigo_Personal=@Codigo_Personal

 	End

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Registrar_Cliente
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Registrar_Cliente

 (@Tipo_Persona Varchar(15),

 @Tipo_Documento Char(6),

 @Documento Varchar(11),

 @Nombres Varchar(150),

 @Direccion Varchar(100),

 @Telefono Varchar(70),

 @Email Varchar(100),

 @Mensaje Varchar(100) Out

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Actualizar_Cliente
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

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

 ))As

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

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listado_Cliente
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listado_Cliente

 )As

 	Select * from Cliente

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Buscar_Cliente_NroDoc_Nombre
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Buscar_Cliente_NroDoc_Nombre

 (@Datos varchar(50)

 )

 )As

 	begin

 		Select * from Cliente where (Documento like @Datos+'%') or (Nombres like @Datos+'%')

 	end

 $$
 
 DELIMITER ;
 
 
 Routine Funeraria.Listar_Difuntos
 
 DELIMITER $$
 
 DELIMITER $$
 USE `Funeraria`$$
 

 Create Procedure Listar_Difuntos

 )As

 	Begin

 		Select * From Difunto

 	End

 $$
 
 DELIMITER ;
 SET FOREIGN_KEY_CHECKS = 1;
