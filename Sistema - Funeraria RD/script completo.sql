-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2020 a las 02:20:35
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `funeraria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente` (`Codigo_Clientes` INT, `Tipo_Personas` VARCHAR(15), `segundadireccion` VARCHAR(100), `Documentos` VARCHAR(11), `Nombress` VARCHAR(150), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Cliente Where Documento=Documentos and Codigo_Cliente<>Codigo_Clientes))then

 		Set Mensaje = 'El N° de documento: '+Documentos+' ya existe';

 		Else

 			

 				Update Cliente set Tipo_Persona=Tipo_Personas,Direccion2=segundadireccion,Documento=Documentos,

 				Nombres=Nombress,Direccion=Direccions,Telefono=Telefonos,Email=Emails where Codigo_Cliente=Codigo_Clientes;

 				Set Mensaje = 'Actualizado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Detalle_Item` (`Codigo_Items` INT, `Descripcions` VARCHAR(100), `Colors` VARCHAR(50), `Materials` VARCHAR(20), `RutaImagens` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		Update Detalle_Item Set Descripcion=Descripcions,Color=Colors,Material=Materials,

 		RutaImagen=RutaImagens Where Codigo_Item=Codigo_Items;

 		Set Mensaje = 'Actualizado Correctamente';

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Difunto` (`Codigo_Difuntos` INT, `Dnis` CHAR(8), `Nombress` VARCHAR(60), `Apellidoss` VARCHAR(100), `Sexos` CHAR(1), `Fecha_Nacimientos` DATE, `Fecha_Fallecimientos` DATE, `Horas` TIME, `Causa_Muertes` VARCHAR(200), `Lugar_Fallecimientos` VARCHAR(100), `Estado_Civils` VARCHAR(15), `Ruta_Acta_Difuntos` VARCHAR(120), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Difunto Where Dni=Dnis And Codigo_Difunto<>Codigo_Difuntos))then

 		Set Mensaje = 'El N° de D.N.I.'+Dnis+' ya existe';

 		Else

 			

 				Update Difunto Set Dni=Dnis,Nombres=Nombress,Apellidos=Apellidoss,Sexo=Sexos,

 				Fecha_Nacimiento=Fecha_Nacimientos,Fecha_Fallecimiento=Fecha_Fallecimientos,

 				Hora=Horas,Causa_Muerte=Causa_Muertes,Lugar_Fallecimiento=Lugar_Fallecimientos,

 				Estado_Civil=Estado_Civils,Ruta_Acta_Difunto=Ruta_Acta_Difuntos Where Codigo_Difunto=Codigo_Difuntos;

 				Set Mensaje = 'Actualizado correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Estado_Personal` (`Codigo_Personals` INT, `Estado` VARCHAR(10), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Estado='Activo')then

 			

 				Update Personal Set Estado='Inactivo' Where Codigo_Personal=Codigo_Personals;

 				Set Mensaje='Actualizado Correctamente';

 			

 		Else

 			

 				Update Personal Set Estado='Activo' Where Codigo_Personal=Codigo_Personals;

 				Set Mensaje='Actualizado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Informacion_Venta` (`Codigo_Informacion_Venta` INT, `Codigo_Vents` INT, `Dirección_Velatorios` VARCHAR(120), `Cementerios` VARCHAR(120), `Dirección_Sepelios` VARCHAR(120), `Fecha_Sepelios` DATE, `Horas` TIME, OUT `Mensaje` VARCHAR(100))  Begin

 		if(not Exists(Select * from Informacion_Venta where Codigo_Informacion_Venta=@Codigo_Informacion_Venta))then

 		set Mensaje='No existe el código de la información';

 		else

 			

 				Update Informacion_Venta Set Codigo_Venta=Codigo_Vents,Dirección_Velatorio=Dirección_Velatorios,

 					Cementerio=Cementerios,Dirección_Sepelio=Dirección_Sepelios,Fecha_Sepelio=Fecha_Sepelios,Hora=Horas

 					where Codigo_Informacion_Venta=Codigo_Informacion_Ventas;

 					Set Mensaje='Información Actualizada Correctamente';

 			End		if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Item` (`Codigo_Items` INT, `Codigo_Tipo_Items` INT, `Nombres` VARCHAR(100), `Precios` DECIMAL, OUT `Mensaje` VARCHAR(100))  Begin

 		If(Not Exists(Select * From Item Where Codigo_Item=Codigo_Items))then

 		Set Mensaje = 'El Producto: '+Nombres+' no existe';

 		Else

 			

 				Update Item Set Codigo_Tipo_Item=Codigo_Tipo_Items,

 				Nombre=Nombres, Precio=Precios  Where Codigo_Item=Codigo_Items;

 				Set Mensaje = 'Actualizado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Parentesco` (`Codigo_Parentescos` INT, `Codigo_Clientes` INT, `Codigo_Difuntos` INT, `Descripcions` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Not Exists(Select * From Parentesco Where Codigo_Parentesco=Codigo_Parentescos))then

 		Set @Mensaje = 'El parentesco no existe';

 		Else

 			

 				Update Parentesco Set Codigo_Cliente=Codigo_Clientes,Codigo_Difunto=Codigo_Difuntos,

 				Descripcion=Descripcions Where Codigo_Parentesco=Codigo_Parentescos;

 				Set @Mensaje = 'Actualizado correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Personal` (`Codigo_Personals` INT, `Dnis` CHAR(8), `Nombres` VARCHAR(50), `Apellidoss` VARCHAR(100), `Cargos` VARCHAR(50), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Not Exists(Select * From Personal Where Codigo_Personal=Codigo_Personals))then

 		Set Mensaje = 'El personal seleccionado no existe';

 		Else

 			

 				If(Exists(Select * From Personal Where Dni=Dnis And Codigo_Personal<>Codigo_Personals))then

 				Set Mensaje = 'Este N° de D.N.I. :'+Dnis+' ya existe';

 				Else

 					

 						Update Personal Set Dni=Dnis,Nombre=Nombres,Apellidos=Apellidoss,

 						Cargo=Cargos,Direccion=Direccions,Telefono=Telefonos,Email=Emails Where Codigo_Personal=@Codigo_Personals;

 						Set Mensaje = 'Actualizado Correctamente';

 					End if;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Plan_Funerario` (`Codigo_Plan_Funerarios` INT, `Descripcions` VARCHAR(200), `Precios` DOUBLE, `RutaImagens` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(not Exists(Select * From Plan_Funerario Where Codigo_Plan_Funerario=Codigo_Plan_Funerarios))then

 		Set Mensaje = 'El código del Plan Funerario no existe';

 		Else

 			

 				Update Plan_Funerario set Descripcion=Descripcions,Precio=Precios,RutaImagen=RutaImagens

 				where Codigo_Plan_Funerario=Codigo_Plan_Funerarios	;			

 				Set Mensaje = 'Actualizado Correctamente';

 			End if;

 	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Proveedor` (`Codigo_Proveedors` INT, `RUCs` CHAR(11), `Razon_Socials` VARCHAR(200), `Representantes` VARCHAR(150), `Celular_Representantes` VARCHAR(12), `Telefono_Empresas` VARCHAR(70), `Direccions` VARCHAR(200), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Proveedor Where RUC=RUCs And Codigo_Proveedor<>Codigo_Proveedors))then

 		Set Mensaje = 'El N° de R.U.C. '+RUCs+' ya existe';

 		Else

 			

 				If(Exists(Select * From Proveedor Where Razon_Social=Razon_Socials And Codigo_Proveedor<>Codigo_Proveedors))then

 				Set Mensaje = 'La razón social: '+Razon_Socials+' ya existe';

 				Else

 					

 						Update Proveedor Set RUC=RUCs,Razon_Social=Razon_Socials,Representante=Representantes,

 						Celular_Representante=Celular_Representantes,Telefono_Empresa=Telefono_Empresas,Direccion=Direccions,Email=@Emails

 						Where Codigo_Proveedor=Codigo_Proveedors;

 						Set Mensaje = 'Actualizado correctamente' ;

 					End if;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Servicio` (`Codigo_Items` INT, `tipos` VARCHAR(30), `kms` DECIMAL, `precio_kms` DECIMAL, OUT `Mensaje` VARCHAR(100))  BEGIN
	Update servicios Set tipo=tipos,km=kms,precio_km=precio_kms

		Where Codigo_Item=Codigo_Items;

 		Set Mensaje = 'Actualizado Correctamente';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Usuario` (`Codigo_Personals` INT, `Usuarios` VARCHAR(20), `Claves` VARCHAR(10), `personales` VARCHAR(20), `productos` VARCHAR(20), `planes` VARCHAR(20), `clientes` VARCHAR(20), `difuntos` VARCHAR(20), `provedores` VARCHAR(20), `compras` VARCHAR(20), `ventas` VARCHAR(20), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Usuario Where Usuario=Usuarios And Codigo_Personal<>Codigo_Personals)) then

 		Set Mensaje = 'El usuario: '+Usuarios+' ya existe';

 		Else

 			

 				Update Usuario Set Usuario=Usuarios,Clave=Claves Where Codigo_Personal=Codigo_Personals;
                set usuarios=(select Codigo_Usuario  from usuario where Codigo_Personal =Codigo_Personals);

update permisos set personal=personales , producto=productos , plan=planes , cliente=clientes , difunto=difuntos ,provedor=provedores , compra=compras ,venta=ventas 
where fk_usuario=usuarios ;
 				Set Mensaje = 'Actualizado correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Cliente_NroDoc_Nombre` (`Datos` VARCHAR(50))  begin

 		Select * from Cliente where Documento like concat(datos,'%') or Nombres like concat_ws('%',datos,'%') limit 25;

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Difunto` ()  BEGIN
 declare Datos Varchar(60);
	
Select * From Difunto Where Dni like CONCAT(Datos, '%') Or Nombres Like CONCAT(Datos, '%') Or Apellidos Like CONCAT(Datos, '%') Or Nombres+' '+Apellidos Like CONCAT(Datos, '%') Or Apellidos +' '+Nombres Like CONCAT(Datos, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Personal_DNI_Nombre` (`Datos` VARCHAR(50))  begin

 		Select * from Personal Where Dni like concat(Datos,'%') or Nombre Like concat(Datos,'%') Or Apellidos Like concat(Datos,'%') Or

 		Nombre+' '+Apellidos Like concat(Datos,'%') Or Apellidos+' '+Nombre Like concat(Datos,'%') limit 50;

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Productos` (`Datos` VARCHAR(70))  Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.Stock,I.Precio,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where (I.Codigo_Tipo_Item = 1 And I.Nombre Like concat('%', concat(@Datos,'%'))) Or 

 		(I.Codigo_Tipo_Item = 1 And D.Color Like concat(@Datos,'%')) Or (I.Codigo_Tipo_Item = 1 And D.Material Like concat(@Datos,'%'));

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Proveedores` (`Datos` VARCHAR(70))  Begin

 		Select * From Proveedor Where (RUC Like concat(@Datos,'%')) Or (Razon_Social Like concat(@Datos,'%'));

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Devolver_Codigo_Compra` (OUT `CodigoCompras` INT)  Begin

 		If(not exists(Select Codigo_Compras  From compras))then

 			set CodigoCompras=1;

 		else 

 			

 				set CodigoCompras=(SELECT max(Codigo_Compras ) FROM compras);

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Devolver_Codigo_Item` (OUT `CodigoItems` INT)  Begin

 		Declare cant  int;

 		If(not exists(Select Codigo_Item From Item))then

 			set CodigoItems=1;

 		else 

 			

 				set CodigoItems=(SELECT max(Codigo_Item) FROM Item);

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Devolver_Codigo_Personal` (`Usuarios` VARCHAR(20), OUT `codigo_personals` INT)  begin

 	set codigo_personals=(Select Codigo_Personal from Usuario where Usuario=Usuarios);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Devolver_Codigo_Vent` (OUT `CodigoVentas` INT)  Begin

 		If(not exists(Select Codigo_Vent From Vent))then

 			set CodigoVentas=1;

 		else 

 			

 				set CodigoVentas=(SELECT max(Codigo_Vent) FROM Vent);

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Devolver_permisos` (`codigo_personals` VARCHAR(20), `tipo` VARCHAR(20), OUT `permiso` VARCHAR(20))  begin
declare usuarios int;
  set usuarios=(select Codigo_Usuario  from usuario where Codigo_Personal =Codigo_Personals);
  
 if(tipo='personal')then
 	set permiso=(Select personal from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='producto') then
    set permiso=(Select producto from permisos where fk_usuario  =usuarios);
    
 elseif(tipo='plan') then
    set permiso=(Select plan from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='cliente') then
    set permiso=(Select cliente from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='difunto') then
    set permiso=(Select difunto from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='provedor') then
    set permiso=(Select provedor from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='compra') then
    set permiso=(Select compra from permisos where fk_usuario  =usuarios);
    
    elseif(tipo='venta') then
    set permiso=(Select ventas from permisos where fk_usuario  =usuarios);
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Detalle_Plan_Funerario` (`CodigoDetalle` INT, OUT `Mensaje` VARCHAR(100))  Begin

 		Delete From Detalle_Plan_Funerario Where Codigo_Detalle_Plan_Funerario=CodigoDetalle;

 		Set Mensaje='Eliminado correctamente';

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listado_Cliente` ()  begin

 	Select * from Cliente limit 100;
    
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listado_Color` ()  BEGIN


 

 	Select * from Color;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listado_Material` ()  BEGIN
 

 

 	Select * from Material;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listado_Personal` ()  BEGIN


 

 	Select * from Personal;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listado_Tipo_Item` ()  begin

 	Select * from Tipo_Item;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Compras` ()  Begin

 		Select C.Codigo_Compras,P.RUC,P.Razon_Social,concat_ws(C.Serie,' - ',C.Nro_Documento) as Comprobante ,C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compras C on P.Codigo_Proveedor=C.Codigo_Proveedor;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Compras_PorFechas` (`Fecha1` DATE, `Fecha2` DATE)  Begin

 		Select C.Codigo_Compras,P.RUC,P.Razon_Social,concat(concat(C.Serie,' - '),C.Nro_Documento ) as Comprobante ,C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compras C on P.Codigo_Proveedor=C.Codigo_Proveedor

 		Where C.Fecha_Compra Between Fecha1 And Fecha2;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Detalle_Compras` (`CodigoComprass` INT)  Begin

 		Select I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) as Total

 		From Compra C Inner Join Detalle_Compr D on C.Codigo_Compr=D.Codigo_Compra

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Inner Join Detalle_Item DI on I.Codigo_Item=DI.Codigo_Item

 		Where D.Codigo_Compr=CodigoComprass

 		Group By I.Nombre,DI.Color,DI.Material,D.Precio_Compra,D.Cantidad,D.Igv,D.Sub_Total;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Detalle_Plan_Funerario` (`Codigo_Plan` INT)  begin
 	Select D.Codigo_Item,D.Codigo_Detalle_Plan_Funerario,D.Codigo_Plan_Funerario,I.Nombre,I.Precio 

 	From Item I Inner Join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 	Where D.Codigo_Plan_Funerario=Codigo_Plan;
    
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Detalle_Venta` (`Codigo_Ventas` INT)  Begin

 		Select I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total,SUM(D.Igv+D.Sub_Total) as Total

 		From Vent V Inner Join Detalle_Venta D On V.Codigo_Vent=D.Codigo_Vent

 		Inner Join Item I on D.Codigo_Item=I.Codigo_Item

 		Where D.Codigo_Vent=Codigo_Ventas

 		Group By I.Codigo_Item,I.Nombre,D.Precio_Venta,D.Cantidad,D.Igv,D.Sub_Total;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Difuntos` ()  BEGIN
Select * From difunto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Item` ()  BEGIN


 

 	Select Codigo_Item,Nombre,Precio from Item;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Item_Tipo` (`Codigo_Tipo_Items` INT)  begin

 		Select Codigo_Item,Nombre,Precio from Item

 		where Codigo_Tipo_Item=Codigo_Tipo_Items;

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Parentesco` ()  Begin

 		Select P.Codigo_Parentesco, P.Codigo_Cliente,P.Codigo_Difunto,C.Nombres  'Cliente',D.Nombres+' '+D.Apellidos  'Difunto',P.Descripcion  'Parentesco' 

 		From Cliente C Inner Join Parentesco P on C.Codigo_Cliente=P.Codigo_Cliente

 		Inner Join Difunto D on D.Codigo_Difunto=P.Codigo_Difunto;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_permisos` (`Codigo_Personals` INT)  BEGIN
Select U.Codigo_Personal,tipo,permiso

 		From Personal P Inner Join Usuario U On P.Codigo_Personal =Codigo_Personals inner join permisos on fk_usuario =Codigo_Usuario  ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Plan_Funerario` ()  BEGIN
 

 

 	Select * from plan_funerario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Productos` ()  Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,stock,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where I.Codigo_Tipo_Item = 1;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Proveedores` ()  Begin

 		Select * From Proveedor;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Servicios` ()  Begin

 		Select it.Codigo_Item,it.Nombre,tipo,km,precio_km,it.precio From Item as  it inner join servicios as se on se.Codigo_Item =it.Codigo_Item Where Codigo_Tipo_Item=2;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Usuarios` ()  Begin

 		Select U.Codigo_Personal,concat(concat(P.Nombre,' '),P.Apellidos) ,U.Usuario,U.Clave,personal,producto,plan,cliente,difunto,provedor,compra,venta

 		From Personal P Inner Join Usuario U On P.Codigo_Personal =U.Codigo_Personal inner join permisos on fk_usuario=Codigo_Usuario  ;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Venta` ()  begin
 	Select V.Codigo_Vent,C.Tipo_Documento,C.Documento,C.Nombres as Cliente,concat(concat(V.Serie ," - ") , V.NroComprobante) as Comprobante,

 	V.Tipo_Documento,V.FechaVenta,V.Total

 	From Cliente C Inner Join Vent V on C.Codigo_Cliente=V.Codigo_Cliente

 	Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Ventas_PorFecha` (`Fecha1` DATE, `Fecha2` DATE)  Begin

 		Select V.Codigo_Vent,C.Tipo_Documento,C.Documento,C.Nombres as Cliente,concat(concat(V.Serie,' - '),V.NroComprobante) as Comprobante,

 		V.Tipo_Documento,V.FechaVenta,V.Total

 		From Cliente C Inner Join Vent V on C.Codigo_Cliente=V.Codigo_Cliente

 		Inner Join Personal P On P.Codigo_Personal=V.Codigo_Personal

 		Where V.FechaVenta Between Fecha1 And Fecha2;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Loguear` (`Usuarios` VARCHAR(20), `Claves` VARCHAR(10), OUT `Mensaje` VARCHAR(100))  begin

 	if(not exists(Select * from Usuario where Usuario=Usuarios))then

 	set Mensaje='El usuario Ingresado no Existe';

 	else 

 		

 			if(not exists(Select * from Usuario where Usuario=Usuarios and Clave=Claves)) then

 			set Mensaje='La clave ingresada es incorrecta';

 			else 

 				

 					if((Select Estado from Personal where Codigo_Personal=(Select Codigo_Personal from Usuario where Usuario=Usuarios))='Inactivo') then

 					set Mensaje='Acceso Denegado, este usuario tiene estado Inactivo';

 						else 

 						

 							Select * from Usuario where Usuario=Usuarios and Clave=Claves ;

 							set Mensaje='Logueado Correctamente';

 						END IF;

 				END IF;

 		END IF;

 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_Detalle_Item` (`CodigoItems` INT)  Begin

 		Select Color,Material From Detalle_Item Where Codigo_Item=CodigoItems;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Numero_Correlativo` (`TipoDocumentos` VARCHAR(7), OUT `NroCorrelativos` CHAR(7))  Begin

 		Declare Cant Int;

 		If(TipoDocumentos='Factura')then

 			

 				Select Cant=Count(*)+1 From Vent where Tipo_Documento='Factura';

 				If Cant<10 then

 					Set NroCorrelativos='000000'+Ltrim(Str(Cant));

 				Else

 					If Cant<100 then

 						Set NroCorrelativos='00000'+Ltrim(Str(Cant));

 					Else

 						If Cant<1000 then

 							Set NroCorrelativos='0000'+Ltrim(Str(Cant));

 						Else

 							If(Cant<10000)then

 								Set NroCorrelativos='000'+LTRIM(STR(Cant));

 							Else

 								If(@Cant<100000) then

 									Set NroCorrelativos='00'+LTRIM(STR(Cant));

 								Else

 									If(Cant<1000000)then

 										Set NroCorrelativos='0'+LTRIM(str(Cant));

 									Else

 										If(Cant<10000000)then

 											Set NroCorrelativos=LTRIM(str(Cant));
                                            End if;
                                            End if;
                                            End if;
                                            End if;
                                            End if;
                                            End if;
                                            End if;

 			End if;

 		If(@TipoDocumento='Boleta') then

 			

 				Select Cant=Count(*)+1 From Vent where Tipo_Documentos='Boleta';

 				If Cant<10 then

 					Set NroCorrelativos='000000'+Ltrim(Str(Cant));

 				Else

 					If Cant<100 then

 						Set NroCorrelativos='00000'+Ltrim(Str(Cant));

 					Else

 						If Cant<1000 then

 							Set NroCorrelativos='0000'+Ltrim(Str(Cant));

 						Else

 							If(@Cant<10000)then

 								Set NroCorrelativos='000'+LTRIM(STR(Cant));

 							Else

 								If(@Cant<100000) then

 									Set NroCorrelativos='00'+LTRIM(STR(Cant));

 								Else

 									If(Cant<1000000)then

 										Set NroCorrelativos='0'+LTRIM(str(Cant));

 									Else

 										If(Cant<10000000)then

 											Set NroCorrelativos=LTRIM(str(Cant));

 		End if;
        	End if;
            	End if;
                	End if;
                    	End if;
                        	End if;
                            	End if;
                                	End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Cliente` (`Tipo_Personas` VARCHAR(15), `segundadireccion` VARCHAR(100), `Documentos` VARCHAR(11), `Nombress` VARCHAR(150), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Cliente Where Documento=Documentos))then

 		Set Mensaje = 'El N° de documento: '+Documentos+' ya existe';

 		Else

 			

 				Insert into Cliente (Tipo_Persona,Direccion2,Documento,Nombres,Direccion,

 				Telefono,Email) Values(Tipo_Personas,segundadireccion,Documentos,Nombress,Direccions,

 				Telefonos,Emails);

 				Set Mensaje = 'Registrado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Color` (`Descripcions` VARCHAR(100), OUT `msj` VARCHAR(100))  begin

 		if(exists(Select * from Color where descripcion=Descripcions))then

 		set msj='¡El color ingresado ya existe!';

 		else

 			

 				insert into Color  (Descripcion) values (Descripcions);

 				set msj='Color Registrado Correctamente';

 			end if;

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Compras` (`Codigo_Proveedors` INT, `Fecha_Compras` DATE, `Tipo_Documentos` VARCHAR(20), `Tipo_compras` VARCHAR(20), `Series` CHAR(3), `Nro_Documentos` VARCHAR(7), `Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin

 		if(not exists(Select * from Proveedor where Codigo_Proveedor=Codigo_Proveedors))then

 		set Mensaje='Código de Proveedor no Existe';

 		else

 			

 				Insert into Compras (Codigo_Proveedor,Fecha_Compra,Tipo_Documento,Series,

 						Nro_Documento,Total,Tipo_Compra) Values(Codigo_Proveedors,Fecha_Compras,Tipo_Documentos,Series,

 						Nro_Documentos,Totals,Tipo_compras);

 						Set Mensaje = 'Compra Registrada correctamente' ;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Detalle_Compras` (`Codigo_Comprass` INT, `Codigo_Items` INT, `Precio_Compras` DOUBLE, `utilidades` DECIMAL, `precio_venta` DECIMAL, `Cantidads` INT, `Igvs` DOUBLE, `Sub_Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin
declare Stock  int;
 		Set Stock=(Select Stock From Detalle_Item Where Codigo_Item=Codigo_Items);

 		Insert into Detalle_Compras (Codigo_Compras,Codigo_Item,Precio_Compra,Cantidad,Igv,Sub_Total,utillidad) Values(Codigo_Comprass,Codigo_Items,Precio_Compras,Cantidads,Igvs,Sub_Totals,utilidades);

 		Set Mensaje = 'Detalle de Compra Registrado correctamente' ;

 		Update Detalle_Item Set Stock=Stock+Cantidads Where Codigo_Item=Codigo_Items;
        Update item Set Precio=precio_venta Where Codigo_Item=Codigo_Items;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Detalle_Item` (`Codigo_Items` INT, `Descripcions` VARCHAR(100), `Colors` VARCHAR(50), `Materials` VARCHAR(20), `RutaImagens` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		Insert into Detalle_Item (Codigo_Item,Descripcion,Color,Material,RutaImagen) Values(Codigo_Items,Descripcions,Colors,Materials,RutaImagens);

 		Set Mensaje = 'Registrado Correctamente';

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Detalle_Venta` (`Codigo_Vents` INT, `Codigo_Items` INT, `Cantidads` INT, `Precio_Ventas` DOUBLE, `Igvs` DOUBLE, `Dsctos` DOUBLE, `Sub_Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin
Declare Stock  Int;
 		Set  Stock=(Select Stock From Detalle_Item Where Codigo_Item=Codigo_Items);

 		Insert into Detalle_Venta (Codigo_Ventas,Codigo_Item,Cantidad,Precio_Venta,Igv,Dscto,Sub_Total) Values(Codigo_Vents,Codigo_Items,Cantidads,Precio_Ventas,Igvs,Dsctos,Sub_Totals);

 		Set Mensaje = 'Detalle de Venta Registrado correctamente' ;

 		Update Detalle_Item Set Stock=Stock-Cantidads Where Codigo_Item=Codigo_Items;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Informacion_Venta` (`Codigo_Vents` INT, `Dirección_Velatorios` VARCHAR(120), `Cementerios` VARCHAR(120), `Dirección_Sepelios` VARCHAR(120), `Fecha_Sepelios` DATE, `Horas` TIME, OUT `Mensaje` VARCHAR(100))  Begin

 		if(not Exists(Select * from Ventas where Codigo_Vent=Codigo_Vents))then

 		set Mensaje='No existe el Código de Venta';

 		else

 			

 				Insert into  Informacion_Venta (Codigo_Ventas,Dirección_Velatorio,

 					Cementerio,Dirección_Sepelio,Fecha_Sepelio,Hora) Values(Codigo_Vents,Dirección_Velatorios,

 					Cementerios,Dirección_Sepelios,Fecha_Sepelios,Horas);

 				set Mensaje='Información Registrada Correctamente';

 			End		if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Item` (`Codigo_Tipo_Items` INT, `Nombres` VARCHAR(100), `Precios` DECIMAL, OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Item Where Nombre=Nombres))then 

 		Set Mensaje = 'El Producto: '+Nombres+' ya existe';

 		Else

 			

 				Insert into Item (Codigo_Tipo_Item,Nombre,Precio) Values(Codigo_Tipo_Items,Nombres,Precios);

 				Set Mensaje = 'Registrado Correctamente'	;			

 			End	if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Material` (`Descripcions` VARCHAR(100), OUT `msj` VARCHAR(100))  begin

 		if(exists(Select * from Material where descripcion=Descripcions))then

 		set msj='¡El material ingresado ya existe!';

 		else

 			

 				insert into Material  (Descripcion) values (Descripcions);

 				set msj='Material Registrado Correctamente';

 			end if;

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Parentesco` (`Codigo_Clientes` INT, `Codigo_Difuntos` INT, `Descripcions` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Parentesco Where Codigo_Cliente=Codigo_Clientes And Codigo_Difunto=Codigo_Difuntos))then

 		Set Mensaje = 'El parentesco ya se ha ha defino';

 		Else

 			

 				Insert into Parentesco (Codigo_Cliente,Codigo_Difunto,Descripcion) Values(Codigo_Clientes,Codigo_Difuntos,Descripcions);

 				Set Mensaje = 'Registrado correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_permisos` (`codigo_personals` INT, `personales` VARCHAR(11), `productos` VARCHAR(11), `planes` VARCHAR(11), `clientes` VARCHAR(11), `difuntos` VARCHAR(11), `provedores` VARCHAR(11), `compras` VARCHAR(11), `ventas` VARCHAR(11), OUT `Mensaje` VARCHAR(100))  BEGIN

declare usuarios int;

set usuarios=(select Codigo_Usuario  from usuario where Codigo_Personal =codigo_personals);


INSERT INTO permisos (permiso,tipo,fk_usuario) values (personales,'personal',usuarios), (productos,'producto',usuarios), (planes,'plan',usuarios), 
(clientes,'cliente',usuarios), (difuntos,'difunto',usuarios), (provedores,'provedor',usuarios), (compras,'compra',usuarios),(ventas,'venta',usuarios);


Set Mensaje = 'Registrado correctamente';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Personal` (`Dnis` CHAR(11), `Nombres` VARCHAR(50), `Apellidoss` VARCHAR(100), `Cargos` VARCHAR(50), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Personal Where Dni=Dnis))then

 		Set Mensaje = 'Este N° de D.N.I. :'+Dnis+' ya existe';

 		Else

 			

 				Insert Personal(Dni,Nombre,Apellidos,Cargo,Direccion,Telefono,Email) Values(Dnis,Nombres,Apellidoss,Cargos,Direccions,Telefonos,Emails);

 				Set Mensaje = 'Registrado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Plan_Funerario` (`Descripcions` VARCHAR(200), `Precios` DOUBLE, `RutaImagens` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Plan_Funerario Where Descripcion=Descripcions))then

 		Set Mensaje = 'El Plan Funerario: '+Descripcions+' ya existe';

 		Else

 			

 				Insert into Plan_Funerario (Descripcion,Precio,RutaImagen) Values(Descripcions,Precios,RutaImagens);

 				Set Mensaje = 'Registrado Correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Proveedor` (`RUCs` CHAR(11), `Razon_Socials` VARCHAR(200), `Representantes` VARCHAR(150), `Celular_Representantes` VARCHAR(12), `Telefono_Empresas` VARCHAR(70), `Direccions` VARCHAR(200), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Proveedor Where RUC=RUCs))then

 		Set Mensaje = 'El N° de R.U.C. '+RUCs+' ya existe';

 		Else

 			

 				If(Exists(Select * From Proveedor Where Razon_Social=Razon_Socials))then

 				Set Mensaje = 'La razón social: '+Razon_Socials+' ya existe';

 				Else

 					

 						Insert Proveedor (RUC,Razon_Social,Representante,Celular_Representante,

 						Telefono_Empresa,Direccion,Email) Values(RUCs,Razon_Socials,Representantes,Celular_Representantes,

 						Telefono_Empresas,Direccions,Emails);

 						Set Mensaje = 'Registrado correctamente' ;

 					End if;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Servicio` (`Codigo_Items` INT, `tipos` VARCHAR(30), `kms` DECIMAL, `precio_kms` DECIMAL, OUT `Mensaje` VARCHAR(100))  Begin

 		Insert into servicios (Codigo_Item,tipo,km,precio_km) Values(Codigo_Items,tipos,kms,precio_kms);

 		Set Mensaje = 'Registrado Correctamente';


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Usuario` (`Codigo_Personals` INT, `Usuarios` VARCHAR(20), `Claves` VARCHAR(10), `personales` VARCHAR(20), `productos` VARCHAR(20), `planes` VARCHAR(20), `clientes` VARCHAR(20), `difuntos` VARCHAR(20), `provedores` VARCHAR(20), `compras` VARCHAR(20), `ventas` VARCHAR(20), OUT `Mensaje` VARCHAR(100))  Begin
declare codigousuario int;
 		If(Not Exists(Select * From Personal Where Codigo_Personal=Codigo_Personals))then

 		Set Mensaje = 'El personal no existe';

 		Else


 				If(Exists(Select * From Usuario Where Codigo_Personal=Codigo_Personals))then

 				Set Mensaje = 'El personal ya tiene una cuenta de usuario';

 				Else

 					

 						If(Exists(Select * From Usuario Where Usuario=Usuarios))then

 						Set Mensaje = 'El usuario: '+Usuarios+' ya existe';

 						Else

 							

 								Insert into Usuario  (Codigo_Personal,Usuario,Clave) 
                                Values(Codigo_Personals,Usuarios,Claves);
                                
                             
						set codigousuario=(select Codigo_Usuario  from usuario where Codigo_Personal =codigo_personals);
INSERT INTO permisos (personal,producto,plan,cliente,difunto,provedor,compra,venta,fk_usuario) values (personales,productos,planes,clientes,difuntos,provedores,compras,ventas,codigousuario);
 								
                                Set Mensaje = 'Registrado correctamente';

 							End if;

 					End if;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Venta` (`Codigo_Clientes` INT, `Codigo_Personals` INT, `Tipo_Documentos` VARCHAR(20), `Series` CHAR(3), `NroComprobantes` CHAR(7), `FechaVentas` DATE, `Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin

 		if(not exists(Select * from Cliente where Codigo_Cliente=Codigo_Clientes))then

 		set Mensaje='Código de Cliente no Existe';

 		else

 			

 				Insert into Venta (Codigo_Cliente,Codigo_Personal,Tipo_Documento,Serie,NroComprobante,FechaVenta,Total) Values(Codigo_Clientes,Codigo_Personals,Tipo_Documentos,Series,NroComprobantes,FechaVentas,Totals);

 				Set Mensaje = 'Venta Registrada correctamente' ;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registra_Detalle_Plan_Funerario` (`Codigo_Plan_Funerarios` INT, `Codigo_Items` INT, `Precios` DECIMAL, OUT `Mensaje` VARCHAR(100))  Begin

 		If(Not Exists(Select * From Plan_Funerario Where Codigo_Plan_Funerario=Codigo_Plan_Funerarios))then

 		Set Mensaje = 'El Plan_Funerario seleccionado no existe';

 		Else 

 			

 				If(Not Exists(Select * From Item Where Codigo_Item=Codigo_Items))then

 				Set Mensaje = 'El item seleccionado no existe';

 				Else

 					

 						Insert into Detalle_Plan_Funerario (Codigo_Plan_Funerario,Codigo_Item) Values(Codigo_Plan_Funerarios,Codigo_Items);

 						Set Mensaje = 'Registrado correctamente';

 						Update Plan_Funerario Set Precio=Precios Where Codigo_Plan_Funerario=Codigo_Plan_Funerarios;

 					End if;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registra_Difunto` (`Dnis` CHAR(8), `Nombress` VARCHAR(60), `Apellidoss` VARCHAR(100), `Sexos` CHAR(1), `Fecha_Nacimientos` DATE, `Fecha_Fallecimientos` DATE, `Horas` TIME, `Causa_Muertes` VARCHAR(200), `Lugar_Fallecimientos` VARCHAR(100), `Estado_Civils` VARCHAR(15), `Ruta_Acta_Difuntos` VARCHAR(120), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Difunto Where Dni=Dnis))then

 		Set Mensaje = 'El N° de D.N.I.'+Dnis+' ya existe';

 		Else

 			

 				Insert into Difunto (Dni,Nombress,Apellidos,Sexo,Fecha_Nacimiento,

 				Fecha_Fallecimiento,Hora,Causa_Muerte,Lugar_Fallecimiento,Estado_Civil,Ruta_Acta_Difunto) Values(Dnis,Nombress,Apellidoss,Sexos,Fecha_Nacimientos,

 				Fecha_Fallecimientos,Horas,Causa_Muertes,Lugar_Fallecimientos,Estado_Civils,Ruta_Acta_Difuntos);

 				Set Mensaje = 'Registrado correctamente';

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Serie_Documento` (OUT `Serie` CHAR(3))  Begin

 		Set Serie='001';

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_Existe_Parentesco` ()  BEGIN
 declare Codigo_Difunto Int ;

 		Select COUNT(Codigo_Difunto) From Parentesco WHere Codigo_Difunto=Codigo_Difunto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_Existe_Usuario` (`Codigo_Personal` INT)  Begin

 		Select COUNT(Codigo_Personal) From Usuario WHere Codigo_Personal=@Codigo_Personal;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_Stock_Item` (`CodigoItem` INT)  Begin

 		Select Stock From Detalle_Item Where Codigo_Item=CodigoItem;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_Stock_Plan` (`Codigo_Plan` INT)  begin

 Select DI.Stock from Detalle_Item DI inner join Item I on DI.Codigo_Item=I.Codigo_Item

 inner join Detalle_Plan_Funerario D on I.Codigo_Item=D.Codigo_Item

 where I.Codigo_Tipo_Item=1 and D.Codigo_Plan_Funerario=Codigo_Plan;
 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver_Informacion_Venta` (`Codigo_Ventas` INT)  Begin

 		Select I.Dirección_Velatorio,I.Cementerio,I.Fecha_Sepelio,I.Dirección_Sepelio,I.Hora 

 		From Vent V Inner Join Informacion_Venta I on V.Codigo_Vent=I.Codigo_Vent

 		Where I.Codigo_Vent=Codigo_Ventas;

 	End$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Codigo_Cliente` int(11) NOT NULL,
  `Tipo_Persona` varchar(15) NOT NULL,
  `Documento` int(11) NOT NULL,
  `Nombres` varchar(150) NOT NULL,
  `Direccion` text NOT NULL,
  `Direccion2` text NOT NULL,
  `Telefono` varchar(70) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(2, 'Jurídica', 201680437, 'ABARCA BRENES CASIMIRO', 'Bº Carmen Abrojo lote 140  cs celes', 'te forrada en Maya.', '2783-6171', '1'),
(3, 'Cedula Fisica', 103490218, 'ABARCA CAMPOS RAFAEL', 'F.C.A. GUANACASTE FRENTE A', 'ABASTECEDOR COOPEFUTURO', '*-*-*-*', ''),
(4, 'Cedula Fisica', 205410466, 'ABARCA CHINCHILLA LUIS ADOLFO', 'Fca Alajuela  en Abastecedor.', '', '2741-1205', ''),
(5, 'Cedula Fisica', 603840773, 'ABARCA CORDERO YEIMY', '500MTS DEL CRUCE A PAVONES A PLAYA', 'ZANCUDO 1ER CASA IZQUIERDA', '2276-8135', ''),
(6, 'Cedula Fisica', 800420883, 'ABARCA ESPINOZA PETRONILA', 'EL TRIUNFO 500 MTS DE LA ENTRADA', 'CASA CONTG A LA QUEBRADA', '', ''),
(7, 'Cedula Fisica', 601520799, 'ABARCA GONZALEZ DUNNIER', 'FCA.COTO 45 CASA Nº 10238 COSTADO', '** FECHA DE PAGO 2 C/MES **', '7811017', ''),
(8, 'Cedula Fisica', 602400221, 'ABARCA GRANADOS ALAMAR', 'Bº EL PRECARIO 600 N.ESTE DE CARMEN', 'DE ABROJO * CANCELA 3 CADA MES **', '8542806', ''),
(9, 'Cedula Fisica', 901000500, 'ABARCA MARIN DAGOBERTO', 'SIERPE CIUDADELA MARTINEZ COSTADO N', 'DE LA PLAZA DE DEPORTES', '', ''),
(10, 'Cedula Fisica', 102450912, 'ABARCA PEREZ ANDREA', 'Sierpe Osa  75m Sur de Plaza cs 59.', '', '2786-7043', ''),
(11, 'Cedula Fisica', 102450912, 'ABARCA PEREZ ANDREA', 'Sierpe  75m sur de la Plaza. cs 59.', '', '2788-1043', ''),
(12, 'Cedula Fisica', 900650338, 'ABARCA ROJAS CESILIA', 'PUEBLO NUEVO COMEDOR ESCOLAR O EL', 'BARRIDO 200 Mts DE PULP DE FREDYY', '', ''),
(13, 'Cedula Fisica', 900640403, 'ABARCA ROJAS ESTRELLA', 'PUEBLO NUEVO PULP LA NACIONAL DIAG', 'ESC O FRENT PLAZA <P> 18 C/M', '', ''),
(14, 'Cedula Fisica', 603880601, 'ABARCA SANCHEZ MELVIN', 'C Neily  Bº La Unión  fte Cabinas', 'Carcache.', '8946-5746', ''),
(15, 'Cedula Fisica', 601260095, 'ABARCA SOLORZANO MARLENY', '', '', '', ''),
(16, 'Cedula Fisica', 800640881, 'ABURTO CAMPOS VICTORIA', 'C NEILY SAN RAFAEL 100 Mts NORTE Y', '100 ESTE SALON COMUNAL <P> 01 C/M', '783', ''),
(17, 'Cedula Fisica', 603290997, 'ABURTO NUÑEZ AMBAR', 'Bº Veracruz casa Nº 29.', '', '8644-5910', ''),
(18, 'Cedula Fisica', 603290997, 'ABURTO NUÑEZ AMBAR', 'Rio Claro  100 N y 60 E test Jehova', 'calle a San Ramon 8801-7188', '8644-5910', ''),
(19, 'Cedula Fisica', 600210684, 'ACEBEDO ACEBEDO ELENA PRISCA', 'GOLFITO LA MONA DESPUES DEL', 'PUENTE 1er CASA MANO DERECHA.', '', ''),
(20, 'Cedula Fisica', 500570550, 'ACEBEDO ACEBEDO LUIS', 'BAMBELL SECTOR # 3 DEL RANCHITO 1KM', 'AL ESTE <P> 03 C/M', '7898045', ''),
(21, 'Cedula Fisica', 501410532, 'ACEVEDO ACEVEDO TRINIDAD', 'Laurel  Peral  Entrada Bar Bonanza ', '900m al fondo.', '2780-0618', ''),
(22, 'Cedula Fisica', 602030122, 'ACEVEDO ACOSTA ELIZABETH', 'La Cuesta Bª Zumbado  cs esquinera', '3C.', '2732-2129', ''),
(23, 'Cedula Fisica', 602030122, 'ACEVEDO ACOSTA ELIZABETH', 'L Cuesta Bª Zumbado  800 M Suroeste', 'detras del Cementerio  2732-1902', '8415-0213', ''),
(24, 'Cedula Fisica', 501010924, 'ACEVEDO BONILLA PAZ RAMONA', 'P Canoas  La Brigada  1º cs MD blan', 'ca. Cel 8891-5554.', '2732-2882', ''),
(25, 'Cedula Fisica', 601230232, 'ACEVEDO CHAVARRIA GUILLERMO', 'CUERVITO LA CUESTA 250 M. ANTIGUO', 'AHORRO CUERVITO', '7321152', ''),
(26, 'Cedula Fisica', 601630529, 'ACEVEDO CHAVARRIA MARITZA', 'LA CUESTA  Cañaza un kilometro de', 'la antigua arrocera', '8949-1113', ''),
(27, 'Cedula Fisica', 602280846, 'ACEVEDO GUERRERO BLANCA JULIA', 'P Jiménez  Cañaza  del Plantel 200', 'Sur casa rosada.', '8644-3575', ''),
(28, 'Cedula Fisica', 600550644, 'ACEVEDO GUTIERREZ CARLOS', 'JIMENEZ  Bo. Antiguo super la', 'esquina 300 Norte', '8837-8956', ''),
(29, 'Cedula Fisica', 600960032, 'ACEVEDO MARQUEZ MILDRED', 'PALMAR NORTE B* ALEMANIA BAZAR', 'JATANA', '8949-7654', ''),
(30, 'Cedula Fisica', 603410690, 'ACEVEDO REYES MANUEL ANTONIO', 'PALMAR NORTE 100 N. 20 SUR DE', 'ABAST. NURY. 8 C/MES', '', ''),
(31, 'Cedula Fisica', 602910033, 'ACEVEDO RORIGUEZ EDWIN', 'BAMBEL *1 DE RIO CLARO 300MTS ANTES', 'DE LA ESCUELA', '8571-5942', ''),
(32, 'Cedula Fisica', 603410955, 'ACEVEDO URBINA JAEL RUTH', 'P Jiménez  Antigua pulp. La Esquina', '400m al fondo. o Ferret. La Costa.', '8837-8956', ''),
(33, 'Cedula Fisica', 500530198, 'ACEVEDO VANEGAS TEODULO', 'CAÑAZA DE LA CUESTA DE ENTRADA A LA', 'ARROCERA X ENTRADA A M.D ULTIMA C.', '', ''),
(34, 'Cedula Fisica', 800530198, 'ACEVEDO VANEGAS TEODULO', 'CAÑAZA DE LA CUESTA DE ENTRADA A LA', 'ARROCERA X ENTRADA A M.D ULTIMA C.', '', ''),
(35, 'Cedula Fisica', 600830104, 'ACHIO ALVARADO GUESEY', 'CIUDAD NEILLY', '', '753842', ''),
(36, 'Cedula Fisica', 601830129, 'ACOSTA BENAVIDES VICTOR WILLIAM', 'GOLFITO  EN LAS OFICINAS DEL', 'AEROPUERTO.', '7751014', ''),
(37, 'Cedula Fisica', 602020775, 'ACOSTA MORALES NEREIDA', 'P Canoas S Jorge  cont antigua pulp', 'La Mariposa. Cel 8971-6572.', '2732-1389', ''),
(38, 'Cedula Fisica', 102730577, 'ACUÑA ACUÑA DAGOBERTO', 'S Vito La Alborada 800m Colegio cll', 'a la Gutiérrez.', '8852-3910', ''),
(39, 'Cedula Fisica', 600350009, 'ACUÑA ACUÑA MARIA', 'SIERPE CENTRO DE SODA SIERPE', '4TA CASA M. IZQ.', '7881027', ''),
(40, 'Cedula Fisica', 900740375, 'ACUÑA CHAVARRIA DAISY', 'COTO 54 GURRION', '*** CANCELA 8 CADA MES ***', '8100021', ''),
(41, 'Cedula Fisica', 107530252, 'ACUÑA GONZALES NIDIA', 'LA CAMPIÑA  COSTADO DE LA IGLECIA', 'CATOLICA. Cel 8546-4454.', '2776-6139', ''),
(42, 'Cedula Fisica', 107530252, 'ACUÑA GONZALEZ NIDIA', 'Golfito. Soda el Descanso', '', '7751128', ''),
(43, 'Cedula Fisica', 107530252, 'ACUÑA GONZALEZ NIDIA', 'Golfito. Soda el Descanso', '', '7751128', ''),
(44, 'Cedula Fisica', 602020728, 'ACUÑA HIDALGO MARIA LORENA', 'SIERPE 160MTS AL ESTE DE IGLESIA', 'EVANGELICA PUEBLO NUEVO', '8556-1496', ''),
(45, 'Cedula Fisica', 602020728, 'ACUÑA HIDALGO MARIA LORENA', 'SIERPE 160MTS AL ESTE DE IGLESIA', 'EVANGELICA PUEBLO NUEVO', '8556-1496', ''),
(46, 'Cedula Fisica', 601090537, 'ACUÑA LUNA RIGOBERTO', '', '', '', ''),
(47, 'Cedula Fisica', 601090537, 'ACUÑA LUNA RIGOBERTO GREGORIO', 'Golfito  Km 1  6º Fila cs 4166.', 'cel 8629-5118. Trabajo 2775-1022.', '2775-2279', ''),
(48, 'Cedula Fisica', 700350762, 'ACUÑA MORENO JORGE', 'ciudad cortes frente al hospital', '', '7887039', ''),
(49, 'Cedula Fisica', 102240341, 'ACUÑA ZALAZAR EFRAIN', 'LA CAMPIÑA CONTIGUO A LA IGLESIA', 'CATOLICA PAGA EL 13 DE C/M', '', ''),
(50, 'Cedula Fisica', 501920582, 'AGUEDAS ARGUEDAS ROBERTO', 'DE LOS TANQUES DE AGUA  CIUDADELA M', 'AGRIGAL 100MTRS OESTE', '8725-2570', ''),
(51, 'Cedula Fisica', 104310074, 'AGUERO ABARCA SANTOS', 'CIUDAD NEILT  75 SUR DE LAS ANTIGUA', 'PLANTAS DEL I.C.E.', '3947699', ''),
(52, 'Cedula Fisica', 602290180, 'AGUERO ALFARO ANA CECILIA', 'NARANJO LAUREL 300MTS SUR DE LA ESC', 'UELA CASA CEMENTO VERDE', '2780-1702', ''),
(53, 'Cedula Fisica', 600950668, 'AGUERO BARRANTES ANDRES', 'GOLF.RECI RICARDO PASOS DETRAS', 'IGLE. CATOL.C. CELESTE <P> 16 C/M', '775-07', ''),
(54, 'Cedula Fisica', 603370994, 'AGUERO BRENES DINIA', 'Comte 600 m este de la unión.', '', '2776-6079', ''),
(55, 'Cedula Fisica', 501890255, 'AGUERO CAMACHO MARVIN', 'Paso Canoas 100 Oeste Zapatería el', 'Combate', '', ''),
(56, 'Cedula Fisica', 602200057, 'AGUERO CARVAJAL FREDDY.', 'BUENOS AIRES SANTA MARTA DEL TELEF', '800 E. Y 150 N.O EN COMANDO CUESTA.', '', ''),
(57, 'Cedula Fisica', 602200057, 'AGUERO CARVAJAL FREDDY.', 'BUENOS AIRES SANTA MARTA DEL TELEF', '800 E. Y 150 N.O EN COMANDO CUESTA.', '', ''),
(58, 'Cedula Fisica', 601410595, 'AGUERO CASTILLO MARCOS', 'Unión de Comte  Pulpería Garrobos.', '', '8764-7029', ''),
(59, 'Cedula Fisica', 601960609, 'AGUERO CHAVES NURIAN', 'CONTROL 100 METROS HACIA LA BRUJITA', '', '7321608', ''),
(60, 'Cedula Fisica', 601030338, 'AGUERO GOMEZ LUIS FERNANDO', 'Las Trenzas de Golfito', '<P>  03 C/M', '', ''),
(61, 'Cedula Fisica', 600700630, 'AGUERO GOMEZ TRINIDAD', 'GOLFITO LA MONA FCA. LAS TECAS', '** FECHA DE PAGO 16 CADA MES **', '7756333', ''),
(62, 'Cedula Fisica', 501870051, 'AGUERO GONZALEZ ISABEL', '\"RIO CLARO Bº SANTIAGO FTE AL \"\"ICE\"\"\"', 'PULP AMIGA. <P> 03 C/M', '*-*-*-*', ''),
(63, 'Cedula Fisica', 501870051, 'AGUERO GONZALEZ ISABEL', 'R Claro Bº S Franciso costado oeste', 'de ICE.', '2789-9003', ''),
(64, 'Cedula Fisica', 102750175, 'AGUERO MONGE MARGARITA', 'LA VIRGEN DE SABALO  DEL TEL PUBLI.', '1 KMT CALLE A ZANCUDO M. DEREC P.20', '783', ''),
(65, 'Cedula Fisica', 102750175, 'AGUERO MONGE MARGARITA', 'La Virgen de Pavones', '', '8721-6273', ''),
(66, 'Cedula Fisica', 102270444, 'AGUERO PEÑA CARIDAD', 'bahia chal contg. ave mar', '', '8210087', ''),
(67, 'Cedula Fisica', 602010313, 'AGUERO QUIROS ARMANDO.', 'GOLFITO LAS TRENZAS  75 MTS ANTES', 'DE LA IGLESIA ASAMBLEAS DE DIOS.', '', ''),
(68, 'Cedula Fisica', 502260325, 'AGUIIRRE SOLIS DIXON', 'GOLFITO BELLA VISTA', '', '758236', ''),
(69, 'Cedula Fisica', 600300210, 'AGUILAR ALVARADO DOMINGA', 'Fca PUNTARENAS 50 Mts ANTES PULP', 'CASA # 43 <P> 19 C/M', '', ''),
(70, 'Cedula Fisica', 600300210, 'AGUILAR ALVARADO DOMINGA', 'Fca PUNTARENAS 50 Mts ANTES PULP', 'CASA # 43 <P> 19 C/M', '', ''),
(71, 'Cedula Fisica', 103670746, 'AGUILAR AVILA JOSE ENRIQUE', '', '', '', ''),
(72, 'Cedula Fisica', 602450118, 'AGUILAR CALVO ALEXIS', 'Pto Jiménez  Gallardo', '', '8970-3354', ''),
(73, 'Cedula Fisica', 601500414, 'AGUILAR CESPEDES AMABLE', 'LA FORTUNA DE PAVONES', '', '7801481', ''),
(74, 'Cedula Fisica', 601650157, 'AGUILAR CESPEDES RIGOBERTO', 'LA ESPERANZA DE SABALO ABASTECEDOR', '\"\"\" 3 R \"\" <P> 15 C/M\"', '', ''),
(75, 'Cedula Fisica', 501150730, 'AGUILAR JAEN SOLON', 'Bº SANTIAGO DE RIO CLARO 200 MTS', 'ANTES DEL ICE ...', '7898223', ''),
(76, 'Cedula Fisica', 107840045, 'AGUILAR MOLINA ILEANA', 'Plaza Canoas  fte ent La Palma cs', 'beige. Cel 8795-8693', '2732-3620', ''),
(77, 'Cedula Fisica', 601740101, 'AGUILAR MONTERO JOSE RAFAEL', 'PALMAR NORTE  OLLA CERO  CONTIGO A', 'PUENTE RIO CULEBRA', '7864067', ''),
(78, 'Cedula Fisica', 601990517, 'AGUILAR MORALES MARITZA', 'PASO CANOAS  CIUDADELA EL TRIUNFO', 'CASA F-15 TERCERA FILA 5 ta CASA', '7321406', ''),
(79, 'Cedula Fisica', 601990517, 'AGUILAR MORALES MARITZA DEL SOCORRO', 'CIUDADELA EL TRIUNFO', '', '7321406', ''),
(80, 'Cedula Fisica', 601990517, 'AGUILAR MORALES MARITZA DEL SOCORRO', 'Paso Canoas  El Triunfo casa Nº F15', '2732-4406', '', ''),
(81, 'Cedula Fisica', 603140008, 'AGUILAR MORALES ROSALBA', 'las nubes de caracol', '', '', ''),
(82, 'Cedula Fisica', 603140008, 'AGUILAR MORALES ROSALBA', 'LAS NUBES DE CARACOL', '8427-3837 telf de hija', '-', ''),
(83, 'Cedula Fisica', 601040316, 'AGUILAR MURILLO ELISA', 'Las Fincas Coto 58 frente comisaria', 'casa # 10872 P.15 C/M', '2783-3259', ''),
(84, 'Cedula Fisica', 601040316, 'AGUILAR MURILLO ELISA', 'Las Fincas Coto 58 frente comisaria', 'casa # 10872 P.15 C/M', '7831359', ''),
(85, 'Cedula Fisica', 601040316, 'AGUILAR MURILLO ELISA', 'Coto 58 frente comisariato Nº10865', 'Cel 8780-8571.', '2781-1426', ''),
(86, 'Cedula Fisica', 800470219, 'AGUILAR OLIVIERA JOSEFINA', '', '', '', ''),
(87, 'Cedula Fisica', 601810885, 'AGUILAR VALLECILLO Mº ELENA', 'Golfito Bella Vista 2º fila cs 8179', 'Cobrar local 2 DP Libre.', '8833-7943', ''),
(88, 'Cedula Fisica', 603030725, 'AGUILAR VILLALTA LISBETH', 'Golfito  Bella Vista  Cs 4340.', 'Cel 8779-3910.', '2775-1737', ''),
(89, 'Cedula Fisica', 102850046, 'AGUILAR VINDAS ANTONIO', 'laurel san juan de la calle asfalta', '400 mts sur', '7800500', ''),
(90, 'Cedula Fisica', 102850046, 'AGUILAR VINDAS ANTONIO', 'FINCA MANGO ENTRADA SN JUAN DE LA', 'IGLESIA EVANG 400MTS 87192924', '2780-0500', ''),
(91, 'Cedula Fisica', 102460036, 'AGUILAR VINDAS CARLOS', 'NARANJO  100 SUR CAMINO A SARAGOZA', '<P> 30 C/M', '', ''),
(92, 'Cedula Fisica', 102460036, 'AGUILAR VINDAS CARLOS', 'NARANJO  100 SUR CAMINO A SARAGOZA', '<P> 30 C/M', '', ''),
(93, 'Cedula Fisica', 102460036, 'AGUILAR VINDAS CARLOS', 'Laurel  Naranjo  100m camino a Zara', 'goza. Cel 8827-9183.', '2780-0247', ''),
(94, 'Cedula Fisica', 107240691, 'AGUILAR VINDAS GERARDINA', 'NARANJO DE LAUREL  DE LA G.A.R.', '100 MTS AL SUR CALLE A SARAGOZA', '7800247', ''),
(95, 'Cedula Fisica', 104540803, 'AGUILAR VINDAS WILLIAM', 'BEREH DE ESCUELA JAZMIN 600 MTS', 'CASA A MANO DERECHA.', '7800107', ''),
(96, 'Cedula Fisica', 601010698, 'AGUIRRE ACEVEDO HANNIA EUGENIA', 'GOLF INVU KMT 3 CASA # 127 LUGAR', 'DETRAS D` ALCALDIA <P> 03 C/M', '775', ''),
(97, 'Cedula Fisica', 601010698, 'AGUIRRE ACEVEDO HANNIA EUGENIA.', 'Golfito  kmt 3 casa 127. cobrar en', 'local 04 de cajera. Telf:8628-6587.', '6286587', ''),
(98, 'Cedula Fisica', 600840786, 'AGUIRRE AGUIRRE PLACIDA', 'JIMENEZ 120MTS NORTE DE POLLOS OPI.', 'OPI CASA BLANCA', '2735-5910', ''),
(99, 'Cedula Fisica', 600430306, 'AGUIRRE AGUIRRE VICTOR HUGO', 'Caimito  diagonal a la Escuela', 'Coopetrabasur  R.L. (reactivado).', '', ''),
(100, 'Cedula Fisica', 600430306, 'AGUIRRE AGUIRRE VICTOR HUGO', 'Caimito  contiguo a Iglesia.', '', '8764-6686', ''),
(101, 'Cedula Fisica', 603420922, 'AGUIRRE CARRILLO EVELYN', 'PALMAR NORTE Bo PRIMERO DE MARZO', '4ta ENTRADA ULTIMA CASA.', '3367022', ''),
(102, 'Cedula Fisica', 603510081, 'AGUIRRE HERNANDEZ MAICOL STIVEN', 'Coto 50 frente a la plaza.', 'Cel 8949-2516.', '8941-9355', ''),
(103, 'Cedula Fisica', 601510410, 'AGUIRRE LANZA ROSA LUZ', 'Bº LLAMARADA DEL JARDIN CERCERO', '400 MTS SUR', '7888641', ''),
(104, 'Cedula Fisica', 800390411, 'AGUIRRE MARTINEZ SINFORIANO', 'Bº LA LLAMARADA DE JARDIN CERBECERO', '', '', ''),
(105, 'Cedula Fisica', 601400212, 'AGUIRRE MURILLO WILBER', 'COTO 63 CASA 15573 /2789-9218', '', '8977-8009', ''),
(106, 'Cedula Fisica', 601400212, 'AGUIRRE MURILLO WILBER ANTONIO', 'RIO CLARO COTO 63 FTE BODEGA CASA', 'Nº 15573 **FECHA DE PAGO 10 C/MES**', '7899218', ''),
(107, 'Cedula Fisica', 601400212, 'AGUIRRE MURILLO WILBERT', 'COTO 63 FRENT A LA BODEGA DE', 'MATERIALES <P> 01 C/M', '*-*-*-*', ''),
(108, 'Cedula Fisica', 155802446, 'AGUIRRE RUIZ ROSA ISABEL', 'P Canoas  Fte Hotel Ronald  soda Ro', 'sita.', '2732-3741', ''),
(109, 'Cedula Fisica', 601950453, 'ALANIS RODRIGUEZ IVANIA', 'URB. SAN LAZARO 2DA ENTRADA', '150 MTRS OESTE CASA Nº 35', '3371683', ''),
(110, 'Cedula Fisica', 602160165, 'ALANIS RODRIGUEZ LILLIANA', 'P Jiménez  cost oeste Igl. Católica', 'cs matas amarillas. Cel 8635-5180.', '2735-5172', ''),
(111, 'Cedula Fisica', 201800937, 'ALBUROLA RAMIREZ ALVARO', 'Kmt 1 L`BOLSA FRET A JOSE SANTOS', 'LOZADA (LOS BOTES) LA PICINA <P> 27', '7751142', ''),
(112, 'Cedula Fisica', 201800937, 'ALBUROLA RAMIREZ ALVARO.', 'GOLFITO  LA BOLSA DESP DE LA', 'PULP PRIMERA ENTRADA M.DEREC', '7751142', ''),
(113, 'Cedula Fisica', 800470528, 'ALCANTAR ALCANTAR ELBA LUZ', 'GOLFITO K 5 AL PURO FINAL PEGANDO C', 'ON LA MALLA', '7750714', ''),
(114, 'Cedula Fisica', 800470528, 'ALCANTAR ALCANTAR ELBA LUZ', 'GOLFITO K 5 AL PURO FINAL PEGANDO', 'CON LA MALLA.', '2775-0714', ''),
(115, 'Cedula Fisica', 601150442, 'ALCAZAR VILLAREAL MERCEDES', 'CORTES BAHIA BALLENA EN SODA.', '', '8916618', ''),
(116, 'Cedula Fisica', 601150442, 'ALCAZAR VILLAREAL MERCEDES', 'Palmar Vill Colón Rest Terra Nostra', '', '2786-3044', ''),
(117, 'Cedula Fisica', 501640957, 'ALEMAN ALEMAN JOSE', 'Laurel  Bambito  costado Sur de la', 'plaza  en la esquina.', '2780-0273', ''),
(118, 'Cedula Fisica', 501510340, 'ALEMAN VALENCIA ZENEN', 'SANTA ROSA DE VALENCIADE OSA 75M', 'NORTE PULP.SANTA ROSA.', '8196478', ''),
(119, 'Cedula Fisica', 501510340, 'ALEMAN VALENCIA ZENEN', 'santa rosa de venecia de osa', '75 al norte pul sat rosa', '8196478', ''),
(120, 'Cedula Fisica', 800410911, 'ALEMAN ZAPATA JORGE AQUILES', 'tamarindo de laurel 500 mts norte', 'de la iglesia catolica', '', ''),
(121, 'Cedula Fisica', 500540495, 'ALFARO ARAYA ALBERTINA', 'PASO CANOAS  LA BRIGADA DE PULPERIA', 'EL CAPRICHO 150 METROS NORTE C.AZUL', '', ''),
(122, 'Cedula Fisica', 107790178, 'ALFARO AZOFEIFA OSCAR', 'PUNTA ZANCUDO  EN INVERSIONES', 'SABALO', '', ''),
(123, 'Cedula Fisica', 101580400, 'ALFARO BERMUDEZ HERNAN', 'LA ESCUADRA  150 Mts DE LA IGLESIA', 'P. 20 C/M', '', ''),
(124, 'Cedula Fisica', 101580400, 'ALFARO BERMUDEZ HERNAN', 'LA ESCUADRA  150 Mts DE LA IGLESIA', 'P. 13 C/M', '', ''),
(125, 'Cedula Fisica', 104460763, 'ALFARO CALVO ISABEL', 'RIO INCENDIO DE LA ESCUELA 1KM AL', 'OESTE CASA AL FONDO VERDE CON LILA', '2783-8203', ''),
(126, 'Cedula Fisica', 303600517, 'ALFARO CENTENO JEFRY', 'La Cuesta  Colegio 150m s/carretera', 'a Pueblo Nuevo MD.', '8624-1957', ''),
(127, 'Cedula Fisica', 103450141, 'ALFARO CORDERO MANUEL', 'KMT 38 PULPERIA EL MANGO', '', '', ''),
(128, 'Cedula Fisica', 155806906, 'ALFARO DIAZ PILAR ADILIA', 'RIO NUEVO  CASA I-9. Cobrar en los', 'Cipreses del salón al fondo.', '2783-6587', ''),
(129, 'Cedula Fisica', 107460921, 'ALFARO GAMBOA GEOVANNY ENRIQUE', '', '', '', ''),
(130, 'Cedula Fisica', 900320687, 'ALFARO GONZALEZ JACINTA', 'Golfito  INVU Km 3 frente a la', 'iglesia catolica  2775-1651', '2775-1651', ''),
(131, 'Cedula Fisica', 103290604, 'ALFARO JIMENEZ DIGNA', 'Naranjo Centro Fte Vidrios Génesis', '', '2780-0368', ''),
(132, 'Cedula Fisica', 114630626, 'ALFARO LOPEZ MARICRUZ', 'JIMENEZ CENTRO 75MTS OESTE BANCO NA', 'CINAL', '7355315', ''),
(133, 'Cedula Fisica', 501240745, 'ALFARO MENDEZ JUANA MARIA', 'NARANJO 100 M ANTES PUENTE LA VACA.', 'Actualizado del 08-2010 al 02-2011.', '7838017', ''),
(134, 'Cedula Fisica', 501411202, 'ALFARO MENDEZ PRIMITIBO', 'LA ESTRELLA DE CONTE EN EL BAR EL', 'SARPE.', '', ''),
(135, 'Cedula Fisica', 603160989, 'ALFARO MONTES JACKELINE', 'PALMAR NORTE AL FRENTE DE CENTRAL', 'DE TAXIS BARRIO ALEMANIA', '2786-5630', ''),
(136, 'Cedula Fisica', 201960241, 'ALFARO PEREZ GERARDO FRANCISCO', 'R Claro Esperanza Ciud Pérez  150m', 'Oeste x tanques de agua. 8669-4758', '2789-9573', ''),
(137, 'Cedula Fisica', 201960241, 'ALFARO PEREZ GERARDO.', 'RIO CLARO  LA ESPERANZA 100 MTS N.', 'DEL TANQUE DE AGUA P. EL 16 C-MES.', '789', ''),
(138, 'Cedula Fisica', 600460728, 'ALFARO RAMIREZ MARIA CRISTINA', 'COTO 54 DE TANQUE DE AGUA ULTIMA', 'AL FONDO * 3 CADA MES *', '7811454', ''),
(139, 'Cedula Fisica', 600460728, 'ALFARO RAMIREZ MARIA CRISTINA', 'COTO 54 DE TANQUE DE AGUA ULTIMA', 'AL FONDO', '2781-1268', ''),
(140, 'Cedula Fisica', 202900376, 'ALFARO ROJAS TERESA', '', '', '', ''),
(141, 'Cedula Fisica', 900410130, 'ALFARO ROSALES JUAN', 'RIO C. 150 Mts NORTE DE CABINAS', 'PEREZ <P.> 04 Y 23 C/M', '7899394', ''),
(142, 'Cedula Fisica', 601011134, 'ALFARO SANTAMARIA RAFAEL.', 'PIEDRAS BLANCAS DE LA DELEGACION -', '400 MTS AL ESTE.P-19 C/M.', '', ''),
(143, 'Cedula Fisica', 201560358, 'ALFARO VARGAS DAISY', 'San Vito  150 Mts de P La Liga  EN', 'PULP LA FE CASA PAPAYA  2773-4640', '8806-2289', ''),
(144, 'Cedula Fisica', 502820221, 'ALFARO VEGA LIDIA', 'Golfito Km 20 Agroindustrial contig', 'a Iglesia.', '8741-3199', ''),
(145, 'Cedula Fisica', 106550816, 'ALFARO ZUÑIGA MARIA JUDITH', 'P Canoas  S Jorge  Ent Los Tanques', '200 oeste pulp. Mary.', '2732-1819', ''),
(146, 'Cedula Fisica', 600991143, 'ALGUERA SANCHEZ CARLOS.', 'COMANDO KM 37 EL MANGO', '', '', ''),
(147, 'Cedula Fisica', 601320062, 'ALGUERA SANCHEZ RIGOBERTO', 'Bº UREÑA SECTOR K. CASA #K6 TRABAJA', 'EN MUNICIPALIDAD <P> 03 Y 16 C/M', '', ''),
(148, 'Cedula Fisica', 500560005, 'ALIZAR FONCECA MODESTO', 'VILLA BONITA DE LA ESCUELA 800MTS.', 'CASA DERECHA CELESTE.', '', ''),
(149, 'Cedula Fisica', 280759493, 'ALMENGOR TORRES OLGA', 'LAUREL  TAMARINDO 600 SUR SUPERMERC', 'ADO', '', ''),
(150, 'Cedula Fisica', 101920082, 'ALPIZAR  HERNANDEZ  EVANGELISTA', 'BAHIA CONCHAL DE SIERPE (SAN JUAN)', '', '', ''),
(151, 'Cedula Fisica', 603610916, 'ALPIZAR BARRANTES ESTEFANNY', 'C Neily 100m sur Taller A&E Cabinas', 'Guarapo.', '8943-0196', ''),
(152, 'Cedula Fisica', 503800208, 'ALPIZAR FONSECA CUSTODIO', 'Fca GUANACASTE 200 M SUR DE ESCUELA', '<P> 19 C/M', '', ''),
(153, 'Cedula Fisica', 500350683, 'ALPIZAR FONSECA JAIME', 'RIO CLARO 50 Mts OESTE DE CRUZ ROJA', '<P>  EN OFICINA', '7434029', ''),
(154, 'Cedula Fisica', 101920082, 'ALPIZAR HERNANDEZ EVANGELISTA', 'BAHIA CHAL DE AVE MAR  200M CALLE A', 'PTO JIMENEZ * CANCELA 11 C/MES **', '', ''),
(155, 'Cedula Fisica', 202370983, 'ALPIZAR MORA MIGUEL', 'AGUA BUENA EN COPAL FTE ESCUELA', 'MANO IZQUIERDA CASA DOS PISOS.', '775', ''),
(156, 'Cedula Fisica', 202260648, 'ALPIZAR SABORIO ALBERTO', 'BELLA LUZ DE LA VACA  CONTG A BAR', 'LAS CARRETAS', '', ''),
(157, 'Cedula Fisica', 800420124, 'ALTAMIRANO ANDURAY TERESA', '', '', '', ''),
(158, 'Cedula Fisica', 601000746, 'ALTAMIRANO BEITA ADRIAN', 'BERE LAUREL PULP LA ESMERALDA', '<P> 15 C/M', '', ''),
(159, 'Cedula Fisica', 900500678, 'ALTAMIRANO BEITA JOSE', 'GOLFITO Kmt 3 CASA # 120 CASA', 'FAMILIA 21 <P> 03 C/M', '', ''),
(160, 'Cedula Fisica', 900500678, 'ALTAMIRANO BEITA JOSE', 'GOLFITO Kmt 3 CASA # 120 CASA', 'FAMILIA 21 <P> 03 C/M', '7750473', ''),
(161, 'Cedula Fisica', 601480168, 'ALTAMIRANO BEITA RONALD', 'Golfito  Pueblo Civil  frente a la', 'Bomba  Carnicería Puerto Libre.', '', ''),
(162, 'Cedula Fisica', 900630166, 'ALTAMIRANO SEQUEIRA MARVIN', 'RECIDENCIAL UREÑA CASA # C.20', 'GOLFITO  .P. 03 C/M', '', ''),
(163, 'Cedula Fisica', 102230846, 'ALVARADO AGUERO ANGEL', '', '', '', ''),
(164, 'Cedula Fisica', 600380744, 'ALVARADO ALFARO RAMON.', 'FRENTE A COOPERATIVA VAQUITA KMT 29', '', '', ''),
(165, 'Cedula Fisica', 600380744, 'ALVARADO ALFARO RAMON.', 'FRENTE A COOPERATIVA VAQUITA KMT 29', '', '', ''),
(166, 'Cedula Fisica', 900460693, 'ALVARADO ALVARADO FIDEL.', 'RIO CLARO PLANTEL DEL M.O.P.T.', '', '', ''),
(167, 'Cedula Fisica', 900460693, 'ALVARADO ALVARADO FIDEL.', 'RIO CLARO PLANTEL DEL M.O.P.T.', '', '', ''),
(168, 'Cedula Fisica', 103010123, 'ALVARADO ARGUEDAS CRUZ', 'Km 37  Rio Oro  500 al este Romana.', '', '2741-8272', ''),
(169, 'Cedula Fisica', 103010123, 'ALVARADO ARGUEDAS CRUZ', 'Km37  La Julieta  Rio Oro  100m nor', 'te de la Romana.', '2741-8272', ''),
(170, 'Cedula Fisica', 501610923, 'ALVARADO ARGUEDAS EDGAR', 'LA CUESTA DEL CEMENTERIO 200 MTS EN', 'CAMINO AL CHORRO DONDE ESTABA FABRI', '7321424', ''),
(171, 'Cedula Fisica', 501610923, 'ALVARADO ARGUEDAS EDGAR', 'la cuesta camino al Chorro en bloqu', 'era 03 cada mes', '7321421', ''),
(172, 'Cedula Fisica', 602780908, 'ALVARADO BUSTOS JOSE MANUEL', 'P.Blancas  Villa Sur cs 74  azul.', '', '8749-0937', ''),
(173, 'Cedula Fisica', 600470546, 'ALVARADO CAMBRONERO EPIFANIO', 'C Neily  Bº Carmen Abrojo  150m oes', 'te Abast Noel; 2º cs MI. 8793-8890', '8941-3098', ''),
(174, 'Cedula Fisica', 603380175, 'ALVARADO CASTRO ARACEMIA', 'P Jimenez Cañaza ent Cunas 800m de', 'clle principal. Trabaja en BCR', '8832-0211', ''),
(175, 'Cedula Fisica', 602110585, 'ALVARADO DURAN WILBERTH', 'Fca GUANACASTE CONTG A YOLANDA', 'DURAN <P> 06 C/M', '*-*-*-*', ''),
(176, 'Cedula Fisica', 201880264, 'ALVARADO FERNANDEZ JOSE', 'San vito; Bar Copabuena.', '', '', ''),
(177, 'Cedula Fisica', 201880264, 'ALVARADO FERNANDEZ JOSE', 'SAN VITO BAR COPABUENA', '<P> 05 C/M', '7340289', ''),
(178, 'Cedula Fisica', 101760714, 'ALVARADO FONCECA JOSE ANGEL', 'PIEDRAS BLANCAS 100SUR DEL', 'COMISARIATO', '7411158', ''),
(179, 'Cedula Fisica', 602390643, 'ALVARADO JARA TERESA', 'C Cortés Bº Lagunas 150 N taller', 'Gamboa.', '2788-8461', ''),
(180, 'Cedula Fisica', 600250008, 'ALVARADO MADRIGAL JOSE', 'Tinoco 50 m de la Escuela Leonel Ch', 'o frente a la plaza.', '', ''),
(181, 'Cedula Fisica', 600250008, 'ALVARADO MADRIGAL JOSE', 'Tinoco 50 m de la Escuela Leonel Ch', 'o frente a la plaza.', '', ''),
(182, 'Cedula Fisica', 401011083, 'ALVARADO OVIEDO VICTOR MANUEL', 'GOLFITO LA CURTIEMBRE', '<P> 03 C/M', '7750644', ''),
(183, 'Cedula Fisica', 603610888, 'ALVARADO RAMIREZ ADRIAN', 'naranjo laurel.caserio el naranjal', 'casa n2', '8712-6071', ''),
(184, 'Cedula Fisica', 502090090, 'ALVARADO RODRIGUEZ EVARISTO', 'CENIZO DE LAUREL ABASTECEDOR NAOMI', '85169429', '2780-9429', ''),
(185, 'Cedula Fisica', 601670891, 'ALVARADO RODRIGUEZ MANUEL ANTONIO', 'ABROJO X DONDE EL LIC ALFREDO LOPEZ', 'CASA MANO IZQUIERDA', '', ''),
(186, 'Cedula Fisica', 104180949, 'ALVARADO SABORIO FLOR', 'CANOAS  Bº S. JORGE DESP. DE PLAZA', 'CALLE A SAN MARTIN C.#14  P.30 C/M', '', ''),
(187, 'Cedula Fisica', 104180949, 'ALVARADO SABORIO FLOR', 'CANOAS  Bº S. JORGE DESP. DE PLAZA', 'CALLE A SAN MARTIN C.#14  P.30 C/M', '', ''),
(188, 'Cedula Fisica', 104180949, 'ALVARADO SABORIO FLOR', 'CANOAS  Bº S. JORGE DESP. DE PLAZA', 'CALLE A SAN MARTIN C.#14  P.30 C/M', '', ''),
(189, 'Cedula Fisica', 601460720, 'ALVARADO SANCHEZ ELIANA', 'La Cuesta  detrás iglesia Católica', 'cs esq con malla c beige. 8917-5700', '2732-3756', ''),
(190, 'Cedula Fisica', 900640749, 'ALVARADO UVA ALEX', 'DE LA OFICINA DEL IDA 150 Mts AL', 'NORTE <P> 19 C/M', '*-*-*-*', ''),
(191, 'Cedula Fisica', 601150710, 'ALVARADO UVA FREDDY', 'PIEDRAS BLANCAS LA FLORIDA ABASTECE', 'MARANATA <P> 19 C/M', '783', ''),
(192, 'Cedula Fisica', 104080202, 'ALVARADO VALVERDE ZENEIDA CC MITA', 'Comte de Laurel  275m este escuela.', '', '8745-9416', ''),
(193, 'Cedula Fisica', 601850073, 'ALVARADO VILLALOBOS RAFAEL', 'GOLFITO  KMT 2 DE TAXIMAR 2 CASAS', 'DESPUES AL ESTE', '', ''),
(194, 'Cedula Fisica', 601850073, 'ALVARADO VILLALOBOS RAFAEL', 'GOLFITO  KMT 2 DE TAXIMAR 2 CASAS', 'DESPUES AL ESTE', '', ''),
(195, 'Cedula Fisica', 107400487, 'ALVARDO UVA ENOC', 'PIEDRAS BLANCAS 100 SUR DEL COMISAR', 'IATO PAGA EL 20 DE CADA MES', '7411158', ''),
(196, 'Cedula Fisica', 900320572, 'ALVAREZ AGUILAR SERGIO', '', '', '', ''),
(197, 'Cedula Fisica', 800520886, 'ALVAREZ ALVAREZ FELIX PEDRO', 'GOLF  Kmt 1 ENTRE 5 Y 6 CASA #4496', '<P> 02 C/M', '', ''),
(198, 'Cedula Fisica', 900580597, 'ALVAREZ ALVAREZ JOSE ANTONIO', 'P Jiménez  Casa esquinera diagonal', 'al BM o frente a la Bomba.', '2735-5806', ''),
(199, 'Cedula Fisica', 800670887, 'ALVAREZ ALVAREZ JUAN RAMON', 'Laurel  San Juan  cont. Iglesia de', 'Dios.', '2770-8212', ''),
(200, 'Cedula Fisica', 800670887, 'ALVAREZ ALVAREZ JUAN RAMON.', 'SAN JUAN DE LAUREL  X EL TELEFONO', 'PUBLICO.', '7708212', ''),
(201, 'Cedula Fisica', 601840962, 'ALVAREZ ANGULO GEOVANNY', '', '', '', ''),
(202, 'Cedula Fisica', 600540535, 'ALVAREZ BARRANTES JOSE', 'Cortes B: lourdes  en bar pulperia', 'El Rinconsito', '7888055', ''),
(203, 'Cedula Fisica', 600280898, 'ALVAREZ BARRIENTOS LUISA', 'GOLFITO KM 1  LA BOLSA CASA 9189', 'O TORTILLERIA PUEBLO CIVIL P.02 C/M', '', ''),
(204, 'Cedula Fisica', 600280898, 'ALVAREZ BARRIENTOS LUISA', 'GOLFITO KM. 1 LA BOLSA CASA', 'Nº 9189 FTE VENTA DE TORTILLAS', '7750240', ''),
(205, 'Cedula Fisica', 602720095, 'ALVAREZ BARRIENTOS SHELVIN HAROID', 'Pavones  Langostino  1km Sur de la', 'plaza. cs celeste. cel 8616-9622.', '-', ''),
(206, 'Cedula Fisica', 601310499, 'ALVAREZ BATISTA ANGELA', 'PUERTO JIMENEZ LA PALMA 250 MTS', 'SUR  OESTE DE ALMACEN LA PALMA', '', ''),
(207, 'Cedula Fisica', 602140506, 'ALVAREZ BEJARANO ARTURO', 'P Canoas  Darizara  cs A10 fte Par-', 'quesito.', '', ''),
(208, 'Cedula Fisica', 900620496, 'ALVAREZ BELLIDO NELY', 'PTO.JIMENEZ SODA EL RANCHITO', '', '', ''),
(209, 'Cedula Fisica', 900620496, 'ALVAREZ BELLIDO NELY.', 'P. JIMENEZ SODA EL RANCHITO.', '<P> 11 C/M', '735', ''),
(210, 'Cedula Fisica', 900620496, 'ALVAREZ BELLIDO NELY.', 'P. JIMENEZ SODA EL RANCHITO.', '<P> 11 C/M', '735', ''),
(211, 'Cedula Fisica', 600991066, 'ALVAREZ BELLIDO RAMON', 'PTO JIMENEZ  ABASTEC MINI CENTRAL', 'JIMENEZ CENTRO. PAGA EL 11 C/MES.', '8819-1079', ''),
(212, 'Cedula Fisica', 600991066, 'ALVAREZ BELLIDO RAMON', 'Pto JIMENEZ ABASTECEDOR MINI', 'CENTRAL <P> 11 C/M', '735', ''),
(213, 'Cedula Fisica', 112730774, 'ALVAREZ CALVO ALEXANDRA +', 'DOMINICALITO B* POZA AZUL PULP', 'POZA AZUL 8960/2090', '2787-8268', ''),
(214, 'Cedula Fisica', 602640768, 'ALVAREZ CASTILLO ERASMO', 'PALMAR NORTE 50 MTS N. DE CABINAS', 'TICO ALEMAN . 8 C/MES', '', ''),
(215, 'Cedula Fisica', 502750083, 'ALVAREZ CORELLA YORLENY', 'Bº El Carmen de Abrojo de pulp el', 'cruce 5 Cs Arriba  8646-0563', '8959-449', ''),
(216, 'Cedula Fisica', 601160930, 'ALVAREZ CORTES LUZ MARINA', 'GOLFITO BARRIO BELLA VISTA', '5TA.FILA C.ASILO DE ANCIANOS', '750514', ''),
(217, 'Cedula Fisica', 601160930, 'ALVAREZ CORTES LUZ MARINA', 'GOLFITO Bº UREÑA C # L-7 O HOGAR DE', 'ANCIANOS P 02 CADA MES.', '775', ''),
(218, 'Cedula Fisica', 900380387, 'ALVAREZ ELIZ ANGELINA', 'PTO JIMENEZ RIO BARRIGONES X BAZAR3', 'ANGIE 3ª CASA FECHA DE PAGO 11 C/ME', '7355248', ''),
(219, 'Cedula Fisica', 900070567, 'ALVAREZ ESPINOZA IRMA', '', '', '', ''),
(220, 'Cedula Fisica', 701110438, 'ALVAREZ FAJARDO MELVIN', 'Sierpe  Sábalo.', '', '8819-5340', ''),
(221, 'Cedula Fisica', 502890321, 'ALVAREZ FONSECA EMILCE', 'PIEDRAS BLANCAS URB. VILLAS DEL SUR', 'CEVICHERA BOMBA CHACARITA', '8501-3014', ''),
(222, 'Cedula Fisica', 105340344, 'ALVAREZ GOMEZ JENNIFER ELIZABETH', 'LAUREL CARNICERIA PROGRESO CAMINO', 'BELLA LUZ  87649394', '2780-7551', ''),
(223, 'Cedula Fisica', 603110575, 'ALVAREZ GONZALEZ HELLEN', 'Golfito  Km3 2º Entrada Testigos de', 'Jehová  Cs Esquinera.', '2775-0307', ''),
(224, 'Cedula Fisica', 603110575, 'ALVAREZ GONZALEZ HELLEN', 'Golfito.', '', '2775-0307', ''),
(225, 'Cedula Fisica', 603190915, 'ALVAREZ LOPEZ EDIT', 'LA CAMPIÑA DE LA ESCUELA 600MTS SUR', '8776-2551', '2776-6133', ''),
(226, 'Cedula Fisica', 503120435, 'ALVAREZ LOPEZ JUAN', 'comte  200 N. Escuela la Unión.', '', '8647-6214', ''),
(227, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', '', '', '', ''),
(228, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', 'LA CAMPIÑA  DE LA IGLESIA ASAMBLEAS', 'DE DIOS 200 MTS NORTE.', '', ''),
(229, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', 'LA CAMPIÑA  DE LA IGLESIA ASAMBLEAS', 'DE DIOS 200 MTS NORTE.', '', ''),
(230, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', 'LA CAMPIÑA DE IGLESIA ASAMBLEAS', '250M NORTE', '', ''),
(231, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', 'LA CAMPIÑA DE IGLECIA A.D. 150 NORT', '* PAGO DE PALMEROS *', '9963137', ''),
(232, 'Cedula Fisica', 501330722, 'ALVAREZ MATARRITA GREGORIO', 'La Campiña  fte Iglesia Asambleas', 'de Dios.', '2776-6100', ''),
(233, 'Cedula Fisica', 900600090, 'ALVAREZ MONGE RAMONA.', 'PALMAR SUR  FINCA 11 CASA Nº 22523', '', '7867002', ''),
(234, 'Cedula Fisica', 901050150, 'ALVAREZ MORALES SEGUNDO', 'CARACOL DE VACA CONTG.A PULPERIA', 'Cel 8846-9381.', '2783-8192', ''),
(235, 'Cedula Fisica', 501330868, 'ALVAREZ PICADO SARA', 'Laurel  San Juan de la Esc. Jobo', '1km norte.', '8864580', ''),
(236, 'Cedula Fisica', 600980803, 'ALVAREZ RODRIGUEZ FREDDY', 'GOLFITO K16 DONDE ESTA EL DEPOCITO', 'DEL SUR', '7756194', ''),
(237, 'Cedula Fisica', 600440492, 'ALVAREZ ROJAS FRANCISCO', 'Km 29 de Laurel  60 norte escuela', 'Coto Sur  Coopevaquita.', '2780-0273', ''),
(238, 'Cedula Fisica', 603010447, 'ALVAREZ RUIZ GERARDO', 'Carrion golfito Bº Buenos Aires. Ta', 'ller Carrion', '7755255', ''),
(239, 'Cedula Fisica', 603010447, 'ALVAREZ RUIZ GERARDO', 'Golfito  La Mona taller de ebaniste', 'ria Carrión.', '7755255', ''),
(240, 'Cedula Fisica', 500940505, 'ALVAREZ SILVA CECILIA', 'CIUDAD NEILY Bº SAN RAFAEL 100 METR', 'DE BAR LAS CABERNAS ENTRADA AL FREN', '7835898', ''),
(241, 'Cedula Fisica', 500940505, 'ALVAREZ SILVA CECILIA', 'CIUDAD NEILY Bº SAN RAFAEL FRENTE', 'A PLACHEL.**FECHA DE PAGO 3 C/MES**', '7835898', ''),
(242, 'Cedula Fisica', 416633634, 'ALVAREZ TAMARIS SERGIO.', 'GOLFITO. Bo. PARROQUIAL ENTRADA A', 'APIAGOL PELUQUERIA UNISEX C.C.S.S', '750262', ''),
(243, 'Cedula Fisica', 900480897, 'ALVAREZ VALVERDE GERARDO', '', '', '', ''),
(244, 'Cedula Fisica', 900480897, 'ALVAREZ VALVERDE GERARDO', 'LAUREL  F.C.A. MANGO 300 MTS ANTES', 'DE LA ESCUELA. PAGA 15 DE CADA MES', '', ''),
(245, 'Cedula Fisica', 102900265, 'ALVAREZ VALVERDE JUVEN', 'TAMARINDO 75 MTS SUR ESTE DEL', 'SUPER TAMARINDO', '7800630', ''),
(246, 'Cedula Fisica', 102900265, 'ALVAREZ VALVERDE JUVEN', 'tamarindo de laurel 75 sur este del', 'supermercado', '', ''),
(247, 'Cedula Fisica', 602740173, 'ALVAREZ VILLALOBOS EZEQUIEL', 'Palmar N 50 S y 25 Este de hotel Cs', 'Amarilla  Agencia Sthill  2786-6132', '8815-3660', ''),
(248, 'Cedula Fisica', 602740173, 'ALVAREZ VILLALOBOS EZQUIEL', 'Palmar Norte  Agencia Sthil.', '', '8153660', ''),
(249, 'Cedula Fisica', 603230915, 'ALVAREZ VILLEGAS JOSUE ROBERTO', 'C Neily  22 Octubre  cs 14 blq H', 'Cel 8960-2872.', '2732-1050', ''),
(250, 'Cedula Fisica', 108530087, 'ALVRADO GRANADOS JUAN CARLOS', 'BARRIO SAN JORGE PASO CANOAS 200MTS', 'AL OESTE DE LA ESCUELA', '8984-2379', ''),
(251, 'Cedula Fisica', 603340725, 'AMADOR RAMIREZ SILVIA', 'C Neily  Bº Unión 200 este 75 Norte', 'Municipalidad. Cel 8608-4302', '2783-1396', ''),
(252, 'Cedula Fisica', 601410690, 'AMAYA AMAYA EMILCE', 'R.C.Bº GUAYCARA CASA Nº 21 Quincena', 'Soda Samuel donde van los tráficos.', '3367552', ''),
(253, 'Cedula Fisica', 602630111, 'AMAYA AMAYA ERICKA', 'C Neily  Rio Nuevo  cs 22A.', '', '2783-1152', ''),
(254, 'Cedula Fisica', 601270328, 'AMAYA AMAYA SANTANA', 'GOLF DEP LIBRE LOCAL # 3', '<P> 16 C/M', '*-*-*-*', ''),
(255, 'Cedula Fisica', 602880128, 'AMAYA GUBARDI JOSE ANTONIO', 'Drake Agujitas 100m Este Parque los', 'Jaguares. Cel 8640-7125', '6084-7352', ''),
(256, 'Cedula Fisica', 900800207, 'AMILCAR MONTENEGRO JOEL', 'P Canoas S Jorge  600 NO CENCINAI', 'Cel 8910-3685.', '2732-2536', ''),
(257, 'Cedula Fisica', 602870593, 'AMPIE SANTAMARIA JENNY JESSICA', 'URBA EL ALMACEN CASA *9', '', '8657-1369', ''),
(258, 'Cedula Fisica', 202480947, 'ANCHIA ANCHIA JUAN MIGUEL', 'Bº EL CARMEN DE ABROJO CONTG. PULP.', 'CRUCE * FECHA DE PAGO 1 C/MES **', '7836287', ''),
(259, 'Cedula Fisica', 603440097, 'ANCHIA ARAYA BLANCA FLOR', 'CIUDAD NEILLY  PARADAD TAXI', 'sala de juegos rey dragon', '', ''),
(260, 'Cedula Fisica', 109320930, 'ANCHIA BLANCO EMILIA', 'EL TRIUNFO PRIMERA ENRTADA DE MANO', 'DRECHA CARRETERA A LA ESCUELA', '8928-4650', ''),
(261, 'Cedula Fisica', 500900829, 'ANCHIA NOVOA ORFILIA', 'GOLFITO LA MONA 3RA CASA DESPUES DE', 'LA VUELTA FECHA DE PAGO 3 C/MES', '7755323', ''),
(262, 'Cedula Fisica', 600630695, 'ANCHIA RAMIREZ JESUS', '', '', '', ''),
(263, 'Cedula Fisica', 501030799, 'ANCHIA RODRIGUEZ ALEXIS', '', '', '', ''),
(264, 'Cedula Fisica', 900380387, 'ANGELINA ALVARES ELIZ', 'PTO. JIMENEZ RIO BARRIGONES BAZAR', 'ANGIE TERSERA CASA', '', ''),
(265, 'Cedula Fisica', 600740930, 'ANGULO ANGULO RUTH', 'Bº EL CARMEN ABROJO DIAG A LA PLAZA', 'CASA # 113  <P> 30 C/M', '', ''),
(266, 'Cedula Fisica', 600940826, 'ANGULO ARRIETA ALICIA', 'Golfito la purruja 200mts.', 'antes del puente de oro.', '7750512', ''),
(267, 'Cedula Fisica', 500890644, 'ANGULO BRICEÑO MARGARITA', 'Golfito La Purruja  Rest Rancho Gra', 'nde .KM 7 2775-1951', '2775-1951', ''),
(268, 'Cedula Fisica', 500890644, 'ANGULO BRICEÑO MARGARITA.', 'GOLFITO  REST RANCHO GRANDE PAGA', 'P.03 Y 17 C/M', '', ''),
(269, 'Cedula Fisica', 502161817, 'ANGULO BUSTOS BELFILIA', 'RIO CLARO 50 MTS OESTE DE CABINAS', 'CONECHAN', '', ''),
(270, 'Cedula Fisica', 502161817, 'ANGULO BUSTOS BELFILIA', 'RIO CLARO 50 MTS OESTE DE CABINAS', 'CONECHAN', '', ''),
(271, 'Cedula Fisica', 502160817, 'ANGULO BUSTOS BELFILIA', 'RIO CLARO 50MTS. O. DE CABINAS', 'CONECHAN', '7899739', ''),
(272, 'Cedula Fisica', 500233615, 'ANGULO BUSTOS JESUS', 'DETRAS DE LA PULP LA ESYONA Bº', 'SAN JORGE  I.D.E.M. <P> 15 C/M', '', ''),
(273, 'Cedula Fisica', 500233615, 'ANGULO BUSTOS JESUS', 'PASO CANOAS  B SAN JORGE  I.D.E.M.', '', '', ''),
(274, 'Cedula Fisica', 500233615, 'ANGULO BUSTOS JESUS', 'CANOAS Bº SAN JORGE DETRAS DE LA', 'IGLESIA CATOLICA CASA C MAMONES CHI', '', ''),
(275, 'Cedula Fisica', 500233615, 'ANGULO BUSTOS JESUS', 'fincas coto', '', '', ''),
(276, 'Cedula Fisica', 104970031, 'ANGULO DIAZ JORGE', 'La Palma  Depósito de Madera Hnos', 'Angulo.', '3942430', ''),
(277, 'Cedula Fisica', 500360082, 'ANGULO JUAREZ ENCARNACION DIMAS', 'GOLFITO KMT 1 CASA 4482', '', '', ''),
(278, 'Cedula Fisica', 201730204, 'ANGULO LARA VINICIO.', 'PUESTO GONZALEZ DE LAUREL', 'O LA ADUANA.P.15 C/M.', '', ''),
(279, 'Cedula Fisica', 602320332, 'ANGULO MARTINEZ ERAIDA', 'GOLF BELLA VISTA 400 M OEST. D` Mª', 'IMACULADA TRAB ABAST PEARSON 03 C/M', '775', ''),
(280, 'Cedula Fisica', 602320332, 'ANGULO MARTINEZ ERAIDA', 'GOLF BELLA VISTA 400 M OEST. D` Mª', 'IMACULADA TRAB ABAST PEARSON 03 C/M', '7751270', ''),
(281, 'Cedula Fisica', 602320332, 'ANGULO MARTINEZ ERAIDA', 'GOLFITO KM.1 ULTIMA FILA', '', '7750690', ''),
(282, 'Cedula Fisica', 602320332, 'ANGULO MARTINEZ ERAIDA', 'KM 1  SEXTA FILA  CASA DE PORTON', 'ROJO Y TERRAZA', '7750690', ''),
(283, 'Cedula Fisica', 602610784, 'ANGULO OBANDO YESSENNIA', 'Laurel  Caimito 250 O d empacadora', 'Cs Prefabricada verde 8719-1896', '8760-4393', ''),
(284, 'Cedula Fisica', 602980322, 'ANGULO SANTAMARIA MINOR', 'P Canoas  costado del correo  vende', 'dor de frescos.', '2732-1369', ''),
(285, 'Cedula Fisica', 602370986, 'APARICIO BONILLA YAMILETH', 'GOLFITO  Bº SAN JUAN ENTRADA AL', 'BOSQUE ULTIMA CASA DE CEMENTO', '7751230', ''),
(286, 'Cedula Fisica', 600660391, 'APARICIO RIOS ROMELIA', 'P Jiménez Ctro Fte Peluqueria KIKI.', 'Cel 8569-7644.', '2735-5309', ''),
(287, 'Cedula Fisica', 600760479, 'ARAICA ALVAREZ JUSTO', 'LA CENTRAL DE COTO', '* CANCELA 4 CADA MES *', '7811179', ''),
(288, 'Cedula Fisica', 104710467, 'ARAUZ ARAUZ MAYELA', 'GOLF Bº BELLA VISTA CASA # 4350', 'COBRAR EN HOSPOTAL. FIN MES', '', ''),
(289, 'Cedula Fisica', 600570019, 'ARAUZ ARAUZ PAULA', '', '', '', ''),
(290, 'Cedula Fisica', 600570019, 'ARAUZ ARAUZ PAULA', 'GOLFITO  BARRIO BELLA VISTA CASA', 'Nº 4223 TERCERA FILA', '7750325', ''),
(291, 'Cedula Fisica', 602070443, 'ARAUZ IBARRA DIMAS', '', '', '', ''),
(292, 'Cedula Fisica', 109200849, 'ARAUZ ROJAS CRISTIAN', 'C Neily  El Carmen  cs 29', 'Cel 87794369', '8779-4369', ''),
(293, 'Cedula Fisica', 601480597, 'ARAUZ ROJAS NOELIA', 'Bº EL CARMEN DE ABROJO 2 da CASA', 'M. IZQUIERDA CASA Nº 29', '7834434', ''),
(294, 'Cedula Fisica', 601480597, 'ARAUZ ROJAS NOELIA', 'Bº El Carmen fret abas El Carmen Cs', '29 verde y rosado mixta ', '8779-4369', ''),
(295, 'Cedula Fisica', 600590601, 'ARAUZ ROJAS OSCAR', 'RIO CLARO KMT 29 EN OFICINAS', 'DE ASOCIACION DE PRODUCTORES AGROPE', '7899133', ''),
(296, 'Cedula Fisica', 502220566, 'ARAUZ VENEGAS JORGE', 'La Gamba  Del Cruce para Golfito ', 'ent MD 50m', '8803-9661', ''),
(297, 'Cedula Fisica', 602500630, 'ARAUZ VILLARREAL LETICIA', 'P Jiménez La Palma fte a plaza.', '', '8754-9624', ''),
(298, 'Cedula Fisica', 601750608, 'ARAYA ARAYA MARLENY', 'VALLE AZUL DE AGUA BUENA ABASTECEDO', 'R EL INVENCIBLE. 8690-1657.', '2734-3037', ''),
(299, 'Cedula Fisica', 601920183, 'ARAYA BLANCO YORLENY', 'GOLFITO LA PURRUJA LA TUCLER', '** CANCELA 3 CADA MES **', '', ''),
(300, 'Cedula Fisica', 900480673, 'ARAYA BOLAÑOS JESUS', 'Ciudadela Madrigal Pulpería 50 Nor-', 'te 50 oeste templo Zacariano.', '2775-2238', ''),
(301, 'Cedula Fisica', 601030943, 'ARAYA BOLAÑOS LUZ MARINA', 'Palma Real  Casa A7.', '', '5651-0727', ''),
(302, 'Cedula Fisica', 900480673, 'ARAYA BOLOÑOS JESUS', 'CIUDADELA MADRIGAL FRENTE A LA IGLE', 'SIA ZACARIANOS', '', ''),
(303, 'Cedula Fisica', 601200862, 'ARAYA CARRANZA SARA', 'COSTADO ESTE DE LA PLAZA O EN SODA', 'HNS VEGA LAUREL CENTRO <P> 30 C/M', '', ''),
(304, 'Cedula Fisica', 600890974, 'ARAYA CHAMORO RAMON', 'SIERPE PUEBLO NUEVO PESCADERIA LA R', 'EINA DEL PROGRESO', '2788-1256', ''),
(305, 'Cedula Fisica', 501290146, 'ARAYA CHAVES FRANKLIN', 'R Claro  La Viquilla  Nº3 fte Campo', 'de aterrizaje.', '', ''),
(306, 'Cedula Fisica', 601710246, 'ARAYA CHAVES MACSANET', 'C.CORTES URB. YANET P. CASA 139', '100M O DEL PARQUE INFANTIL 8 C/M', '', ''),
(307, 'Cedula Fisica', 603820456, 'ARAYA DURAN ALEX FERNANDO', 'Golfito  Res Ureña  cs c13 c/verde', 'c malla. 8664-2424.', '8716-4802', ''),
(308, 'Cedula Fisica', 601011307, 'ARAYA JIMENEZ ISABEL', 'S RAMON RIO CLARO 300 MTS E DE LA', 'ESC.TRABJ EN ESCUELA R.C P.03 C/M', '789-93', ''),
(309, 'Cedula Fisica', 900560851, 'ARAYA JIMENEZ JOSE LUIS', 'San Ramón RC  100 N 25 E Escuela.', '', '7898634', ''),
(310, 'Cedula Fisica', 900270777, 'ARAYA JIMENEZ MARIA', 'km 14 500 mts antes del bar el', 'rodeo viniendo de golfito', '2775-0468', ''),
(311, 'Cedula Fisica', 900270777, 'ARAYA JIMENEZ MARIA', 'GOLFITO  KMT 14 DEL BAR LA RUEDA', '400 MTS ANTES', '', ''),
(312, 'Cedula Fisica', 501980870, 'ARAYA MONGE ROSA', 'Sabalito  La Ceiba Costado de la', 'Plaza    8527-9076', '8568-0092', ''),
(313, 'Cedula Fisica', 602320672, 'ARAYA MONTERO SONIA', 'kmt 27  diagonal a la Escuela', 'Paga 10 c/mes.', '2780-1298', ''),
(314, 'Cedula Fisica', 501530600, 'ARAYA MUÑOZ ELENA', 'COTO 56 FINCAS DE COTO', '', '7811254', ''),
(315, 'Cedula Fisica', 202270503, 'ARAYA MURILLO VICTOR JULIO', 'GOLFITO P. CIVIL JULIOS BAR', 'CALLE PRINCIPAL <P> 3 Y 16 C/M', '7751347', ''),
(316, 'Cedula Fisica', 202270503, 'ARAYA MURILLO VICTOR JULIO', 'GOLFITO  LA MONA KMT 7 100 MTS', 'ANTES DEL TALLER NAVAS.', '7751347', ''),
(317, 'Cedula Fisica', 601620566, 'ARAYA RODRIGUEZ NELLY', 'ABASTECEDOR EL CIVIL CONTIGUO A TIE', 'NDA EL REGALON', '8962-7401', ''),
(318, 'Cedula Fisica', 111660140, 'ARAYA ROJAS LOURDES IRENE', 'BARRIO TUKLER MARTINEZ CASA A22', '', '7753326', ''),
(319, 'Cedula Fisica', 500770978, 'ARAYA RUIZ JESUS M.', 'CENIZO POR IGLESIA EVANGELICA', 'DIRECCION INCOMPLETA', '7800513', ''),
(320, 'Cedula Fisica', 105220323, 'ARAYA SANCHEZ DAMARIS', 'Golfito  Contg Rest El Canto del', 'TUCAN. 2775-5196', '8898-4735', ''),
(321, 'Cedula Fisica', 203331213, 'ARAYA TORRES MARIA LOURDES', 'LA FLORIDA NAZARET DE GOLFITO', '100 MTS ESTE DE LA IGLESIA CATOLICA', '', ''),
(322, 'Cedula Fisica', 601910450, 'ARAYA UMAÑA MARLENE', 'Agua calien 400 E d la delegacion', 'P Oficina  8858-0863', '8342-7085', ''),
(323, 'Cedula Fisica', 103110752, 'ARAYA VARGAS JOSE ANTONIO', '', '', '', ''),
(324, 'Cedula Fisica', 202020099, 'ARAYA VARGAS MARCIAL', 'C CORTES ULTIMA CASA DE PRECARIO', 'A DOMICILIO', '8911808', ''),
(325, 'Cedula Fisica', 500910554, 'ARAYA VARGAS MARIA ESTER', 'Naranjo de Laurel  300 mts de la Gu', 'ardia Rural  calle a Laurel.', '', ''),
(326, 'Cedula Fisica', 500910554, 'ARAYA VARGAS MARIA ESTHER', 'NARANJO 500 Mts ESTE DE G.A.R. CASA', 'ROSADA <P> 15 C/M', '', ''),
(327, 'Cedula Fisica', 600690726, 'ARAYCA ALVAREZ CARLOS MANUEL.', 'LA CENTRAL CAMPESINA', '', '7811195', ''),
(328, 'Cedula Fisica', 270285471, 'ARAYCA ARAYCA SALVADOR', 'CENTRAL CAMPESINA DE COTO', '<P> 30 C/M', '', ''),
(329, 'Cedula Fisica', 601990921, 'ARAYCA MOLINA CARLOS MANUEL', 'CENTRAL CAMPESINA 100MTS S Y 50 O', 'DE LA PULPERIA EL SOL  15 C/M', '*-*-*-*', ''),
(330, 'Cedula Fisica', 500840412, 'ARBUROLA MOYA ANTONIA.', 'NO SE REGISTRO.', '', '', ''),
(331, 'Cedula Fisica', 601350210, 'ARBUROLA RAMIREZ JOSE GERARDO', 'Golfito  Cabinas Purruja.', '', '7751054', ''),
(332, 'Cedula Fisica', 502070143, 'ARCE ARCE FRANCISCA', 'Ciudad Cortez  Diagonal al Juzgado', 'Tel: 8913-2287', '', ''),
(333, 'Cedula Fisica', 601320099, 'ARCE CASTILLO CARLOS ALBERTO', 'PIEDRAS BLANCAS URBA. VILLAS DEL', 'SUR  CASA Nº 61  21 C/M', '2741-1280', ''),
(334, 'Cedula Fisica', 203030999, 'ARCE CORDOBA IMTOM', 'Caracol la Vaca  Puente 800 m sur.', '', '2783-8172', ''),
(335, 'Cedula Fisica', 101630853, 'ARCE ESPINOZA JOSE RAMON', 'GOLFITO B. BELLA VISTA CASA N. 4322', '', '7752223', ''),
(336, 'Cedula Fisica', 203780555, 'ARCE GONGORA SANDI', 'S. RAMON R. CLARO DE PULP EL CORRAL', '75 MTS O. Y 25 SUR <P> 16 C/M', '', ''),
(337, 'Cedula Fisica', 101080862, 'ARCE RUBI DOMINGO', 'LAUREL  ENTRADA SAN JUAN O DE LA', 'CASETILLA COOPEAGROPAL 800 ENTRADO', '', ''),
(338, 'Cedula Fisica', 101080862, 'ARCE RUBI DOMINGO', 'LAUREL ENTRADA SAN JUAN DE CACETILL', '800M AL SUR', '', ''),
(339, 'Cedula Fisica', 101080862, 'ARCE RUBI DOMINGO', 'LAUREL ENTRADA SAN JUAN DE CACETILL', '800M AL SUR CONTIGUO AL PUENTE CEME', '', ''),
(340, 'Cedula Fisica', 601061413, 'ARCE SEQUEIRA ARACELLY', 'Fca ALAJUELA PULP. MARILYN', '<P> 19 C/M', '', ''),
(341, 'Cedula Fisica', 501550570, 'ARCE TREJOS OLIVIO', 'FCA TAMARINDO FTE EMPACADORA', '*** FECHA DE PAGO 16 CADA MES***', '7801093', ''),
(342, 'Cedula Fisica', 800520534, 'ARCIA VILCHEZ SALVADOR', 'GOLFITO Bº SAN MARTIN 2da ETAPA', '<P> 03 Y 16 C/M', '', ''),
(343, 'Cedula Fisica', 800630627, 'AREAS PELLECER Mª DE LOS ANGELES', 'GOLFITO PUEBLO CIVIL CONTIGUO', 'A MAG <P> 03 C/M', '7750198', ''),
(344, 'Cedula Fisica', 105210202, 'ARGUEDAS AGUERO NURIA EUGENIA', 'COTO 54  200M ESTE COMISARIATO CASA', 'Nº 11699. Cel:8805-2722.', '2781-1515', ''),
(345, 'Cedula Fisica', 205640651, 'ARGUEDAS BARAHONA ANA YANSI', 'San Vito 2 km N de la esc La bonita', 'Agua Buena  8534-4416', '8503-6371', ''),
(346, 'Cedula Fisica', 601580796, 'ARGUEDAS ELIZONDO ANA LORENA', 'Finca Puntarenas frente a Surcoop', 'tel 87860322', '', ''),
(347, 'Cedula Fisica', 501430019, 'ARGUEDAS ESPINOZA MIGUEL ANGEL', 'C Neily Pulp La Pulguita  300m cll', 'a S Vito.', '8616-3246', ''),
(348, 'Cedula Fisica', 602410470, 'ARGUEDAS FERNANDEZ EDUARDO A.', 'C Neily Bº San Rafael  300m norte P', 'ulp. Miguelito.', '8971-9117', ''),
(349, 'Cedula Fisica', 500780161, 'ARGUEDAS GAMBOA ANDRES ABELINO', 'CIUDAD CORTES 800 Mts ESTE DEL', 'COLEGIO <P> 6 C/M', '7888161', ''),
(350, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTA', 'LA CUESTA  20 MTS ANTES DEL COLEGIO', '', '7321023', ''),
(351, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTA', 'LA CUESTA  20 MTS ANTES DEL COLEGIO', '', '7321023', ''),
(352, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTA', 'CIUDADELA EL TRIUNFO DIAGONAL ALA E', 'SCUELA FRENTE AL PLANCHEL MULTI USO', '7321023', ''),
(353, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTHA', 'La Cuesta a la par del Colegio', '1 c/mes', '7321023', ''),
(354, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTHA', 'La Cuesta a la par del Colegio', '1 c/mes', '7321451', ''),
(355, 'Cedula Fisica', 501070986, 'ARGUEDAS JIMENEZ MARTHA', 'LA CUESTA CONTIGUO AL COLEGIO', '', '7321023', ''),
(356, 'Cedula Fisica', 502480869, 'ARGUEDAS MEJIAS RICARDO', 'ZANCUDO 500 Mts SUR DE CABINAS SUSY', 'ABASTECEDOR EL BUEN PRECIO <P> 15 C', '776', ''),
(357, 'Cedula Fisica', 203430544, 'ARGUEDAS MORA MARIA DEL CARMEN', 'BARRIO EL CARMEN ABROJO  FRENTE A', 'LA PLAZA  CASA ESQUINERA No.115', '7834339', ''),
(358, 'Cedula Fisica', 602900014, 'ARGUEDAS MORALES ARMANDO', 'CIUDAD NEILY SAN RAFAEL ENTRADA LOS', 'MUSICOS.', '', ''),
(359, 'Cedula Fisica', 202330886, 'ARGUEDAS ROJAS MARCELINO', 'BAMBEL UNO DE DONDE EL INDIO', 'APROXI UN KILOMETRO ADENTRO', '', ''),
(360, 'Cedula Fisica', 202330886, 'ARGUEDAS ROJAS MARCELINO', 'RIO CLARO BAMBEL UNO CONTIG. PUENTE', 'DE MADERA A  63 FECHA PAGO 20 C/MES', '7897309', ''),
(361, 'Cedula Fisica', 202330886, 'ARGUEDAS ROJAS MARCELINO', 'GRANJAS CAMPESINAS BAMBEL 1', 'RIO CLARO CASA Nª 7', '7897309', ''),
(362, 'Cedula Fisica', 105210202, 'ARGUEDAZ AGUERO NURIA EUGENIA', 'COTO 54 200 MTS ESTE DE ABASTECEDOR', 'Nº 11699 * FECHA DE PAGO 15 C/MES *', '7811243', ''),
(363, 'Cedula Fisica', 103930646, 'ARGUELLO BEJARANO CARLOS LUIS', 'C Cortés  Proyecto Llane Pacheco ', 'cs 28.', '', ''),
(364, 'Cedula Fisica', 501970341, 'ARGUELLO BERROCAL TRINIDAD', 'Bª LA FORTUNA DETRAS DEL TALLER SUL', '', '7834263', ''),
(365, 'Cedula Fisica', 601430411, 'ARGUELLO ESPINOZA CARLOS', 'EL CARMEN DE ABROJO EN PULPERIA', 'EL CARMEN CANCELA 1º CADA MES', '7836017', ''),
(366, 'Cedula Fisica', 602260822, 'ARGUELLO VEGA CELENE', 'Cortes  el precario No 43 25mts', 'norte del publico.', '', ''),
(367, 'Cedula Fisica', 203290349, 'ARIAS AMORES ADOLFO', 'Paso Canoas; Aduana panameña 175 mt', 'Este  fte a telf público (Soda).', '', ''),
(368, 'Cedula Fisica', 203680029, 'ARIAS AMORES MAURICIO', 'Paso Canoas Taxi de carga color', 'gris P. 30 c/m.', '', ''),
(369, 'Cedula Fisica', 500590157, 'ARIAS ARIAS ALINA', 'San Ramon De Rio Claro UrbanizaciÓn', 'El Esfuerzo Casa =33', '2789-7459', ''),
(370, 'Cedula Fisica', 602550600, 'ARIAS ARIAS MINOR.', 'SANTA LUCIA  CONTIGUO A ASAMBLEAS', 'DE DIOS O ABAST EL PARQUESITO.', '', ''),
(371, 'Cedula Fisica', 900500220, 'ARIAS CARMONA CATALINA', 'P Jiménez Agujas Bº Bonito Fte Sa-', 'lón Comunal', '8343-8370', ''),
(372, 'Cedula Fisica', 600560038, 'ARIAS CASTRO FRANCISCO', 'Sabalito la ceiba  75 desp del abas', 'PICAME  2784-0176', '8514-4826', ''),
(373, 'Cedula Fisica', 102570810, 'ARIAS CASTRO MARIA MERCEDES', 'LA CUESTA  DE LA ENTRADA A CIUDADEL', 'TAMAYO  2da CALLE 100 M. ANTES DE P', '7322555', ''),
(374, 'Cedula Fisica', 603320662, 'ARIAS CEDEÑO YAMILETH', 'Bella Luz de la Vaca. 1km este bar', 'las Carretas.', '8634-0788', ''),
(375, 'Cedula Fisica', 108580285, 'ARIAS CHACON ELBA', 'R Incendio  300m N de escuela  cs', 'roja al fondo.', '2783-8368', ''),
(376, 'Cedula Fisica', 601390761, 'ARIAS CORDERO IDALY.', 'CIUDAD NEILY CONTG A SUPER', 'HERMANOS LOAIZA', '', ''),
(377, 'Cedula Fisica', 601390761, 'ARIAS CORDERO IDALY.', 'CIUDAD NEILY CONTG A SUPER', 'HERMANOS LOAIZA', '', ''),
(378, 'Cedula Fisica', 201810176, 'ARIAS CORDERO JUAN', 'CIUDAD NEILY  CENTRO', '', '', ''),
(379, 'Cedula Fisica', 601580345, 'ARIAS CORRALES LUZ MARINA', 'GOLFITO SODA MAGNOLIA FTE. HOSPITAL', '*** CANCELA 03 C/M *** CEL:8250730', '7751897', ''),
(380, 'Cedula Fisica', 202090792, 'ARIAS CRUZ GABRIEL', 'RIO CLARO  LA ESPERANZA AGENCIA DE', 'CAFE DORADO. P 16 Y 03 CADA MES', '7899173', ''),
(381, 'Cedula Fisica', 603760289, 'ARIAS ESPINOZA ALLAN', 'Laurel La Nubia 200m oeste de entra', 'da  cs fibrolit sin pintar.', '8778-0493', ''),
(382, 'Cedula Fisica', 603090277, 'ARIAS GONZALEZ HENRRY', 'COTO 45 COSTADO NORTE DE CLUB', 'CASA Nº 2001 FECHA DE PAGO 2 C/M', '', ''),
(383, 'Cedula Fisica', 602600936, 'ARIAS GONZALEZ WENDY', 'LA CUESTA 150 S DEL COLEGIO', '** CANCELA 4 CADA MES **', '7322887', ''),
(384, 'Cedula Fisica', 602600936, 'ARIAS GONZALEZ WENDY', 'DEL COLEGIO LA CUESTA 150 SUR HACIA', 'LAUREL CASA ROSADA CANCELA 15 C/MES', '7322887', ''),
(385, 'Cedula Fisica', 603310228, 'ARIAS MATARRITA LUZMERY', 'Sierpe 150 Mts O del Motel Margarit', 'Cs Cemento Papaya.  8401-2662', '8402-3958', ''),
(386, 'Cedula Fisica', 201710554, 'ARIAS MOYA CONSUELO', 'Paso Canoas  Calle del Tajo Canoas', 'Abajo.', '7322422', ''),
(387, 'Cedula Fisica', 105600655, 'ARIAS MUÑOZ JORGE', 'PASO CANOAS  CONTIG A LA ADUANA', 'DE PASO CANOAS AEROMAR', '*-*-*-*', ''),
(388, 'Cedula Fisica', 203490308, 'ARIAS MURILLO MIGUEL ANGEL', 'Bº Comandos cs19 o entrada bloquera', '150 m al fondo. Telf: 2783-6337.', '8889-7691', ''),
(389, 'Cedula Fisica', 203490308, 'ARIAS MURILLO MIGUEL.', 'GOLFITO  COMANDO O EN PARADA DE', 'TAXI PUBLICO PASO CANOAS P.30 C/M', '', ''),
(390, 'Cedula Fisica', 600380947, 'ARIAS MURILLO TRINIDAD', 'el barrido de pueblo nuevo', '', '', ''),
(391, 'Cedula Fisica', 602360209, 'ARIAS NUÑEZ IRIS', 'Fca GUANCT 400 Mts ESTE DE ESCUELA', '<P> 19 C/M', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(392, 'Cedula Fisica', 500600140, 'ARIAS PORRAS CARLOS ALBERTO', 'Paso Canoas  200 N.la Aduana cont', 'al Rest.Gran China.P. 01 C/M.', '782039', ''),
(393, 'Cedula Fisica', 600700109, 'ARIAS RODRIGUEZ TRINO', 'CARTAGO EL LLANO  UBA STA LUCIA', 'PROYECTO MI CASA LOTE 38-L.', '', ''),
(394, 'Cedula Fisica', 900710522, 'ARIAS SALAMANCA FLORA', 'conte. escuadra 200mts sur de la es', 'cuela mano derecha casa verde', '2776-8328', ''),
(395, 'Cedula Fisica', 601960031, 'ARIAS SANDI GLADYS', 'Laurel Cenizo detrás de escuela.', '', '8695-2990', ''),
(396, 'Cedula Fisica', 800470156, 'ARLEY SILVA JOSE ALEJANDRO', 'PALMAR NORTE  100 MTS NORTE', 'DE LA PULPERIA NURY.', '', ''),
(397, 'Cedula Fisica', 800470156, 'ARLEY SILVA JOSE ALEJANDRO', 'PALMAR NORTE  100 MTS NORTE', 'DE LA PULPERIA NURY.', '', ''),
(398, 'Cedula Fisica', 800470156, 'ARLEY SILVA JOSE ALEJANDRO', 'PALMAR NORTE  100 MTS NORTE', 'DE LA PULPERIA NURY.', '', ''),
(399, 'Cedula Fisica', 600520618, 'ARRIETA ARRIETA NATIVIDAD', 'ACUADUCTO RURAL GOLFITO LA PRESA', 'P.28 CADA MES', '', ''),
(400, 'Cedula Fisica', 203160632, 'ARRIETA ASTORGA MIGUEL ANGEL', '', '', '', ''),
(401, 'Cedula Fisica', 400840313, 'ARRIETA VIQUEZ ALVARO', 'Ciudad Neily 200mts al este del', 'Palacio Municipal.', '7833614', ''),
(402, 'Cedula Fisica', 600240295, 'ARRIOLA QUINTERO ANTONIA', 'C. CORTES 3ERA CASA FTE. A PULP.', 'PLO BLANCO PENCIONADA', '', ''),
(403, 'Cedula Fisica', 701200385, 'ARROYO FUENTES SIANNE', 'Puerto Jimenez  Matapalo casa', 'vida verde. 8654-6253.', '2735-8928', ''),
(404, 'Cedula Fisica', 600970056, 'ARROYO GATGENS MARIA ISABEL', '', '', '', ''),
(405, 'Cedula Fisica', 500740221, 'ARROYO GOMEZ JORGE', '', '', '', ''),
(406, 'Cedula Fisica', 500600953, 'ARROYO JIMENEZ ANTONIO', 'Fca ALAJUELA ESC LA NAVIDAD 800 M', 'MANO IZQUIERDA <P> 19-C/M.', '', ''),
(407, 'Cedula Fisica', 500600953, 'ARROYO JIMENEZ ANTONIO', 'Fca ALAJUELA ESC LA NAVIDAD 800 M', 'MANO IZQUIERDA <P> 19-C/M.', '', ''),
(408, 'Cedula Fisica', 602270792, 'ARROYO MORA LEIMETH', 'COMTE JARDIN 500 MTS SUR DE LA', 'ESCUELA DE JARDIN', '', ''),
(409, 'Cedula Fisica', 602660230, 'ARTAVIA ABARCA WENDY', 'GOLFITO  KM.01  LA BOLSA', '', '7751843', ''),
(410, 'Cedula Fisica', 202290615, 'ARTAVIA ARTAVIA FERNANDO', 'FCA. 10 2DA FILA 3ERA AL PAR', 'DE SILVIA  7 C/MES', '', ''),
(411, 'Cedula Fisica', 202290615, 'ARTAVIA ARTAVIA FERNANDO', 'Palmar Sur Fca 10 2º fila  3º casa', 'a la par de Silvia.', '', ''),
(412, 'Cedula Fisica', 602120284, 'ARTAVIA AZOFEIFA OLGA', 'Sierpe  contiguo a casa Jorge Uribe', '', '8743-7800', ''),
(413, 'Cedula Fisica', 602170284, 'ARTAVIA AZOFEIFA OLGA', 'SIERPE A LA PAR DE LA CASA JORGE', 'URIBE', '8743-7800', ''),
(414, 'Cedula Fisica', 401600568, 'ARTAVIA CASTRO PATRICIA', 'P Jiménez  La Palma  300m este AYA.', '', '2735-1723', ''),
(415, 'Cedula Fisica', 501000194, 'ARTAVIA CEDEÑO MARIA', '.BROJO CENTRO 3era CASA ANTES DE', 'PULPERIA KATERIN.', '7835731', ''),
(416, 'Cedula Fisica', 500990379, 'ARTAVIA CONEJO ALVARO', 'BELLA LUZ 200 Mts D`RIO L`VACA MANO', 'IZQUIERDA <P> 30 C/M', '', ''),
(417, 'Cedula Fisica', 103110593, 'ARTAVIA MARIN NIEVES', 'Golfito  B Vista  cs 4371. Ultima x', 'la grada.', '2775-0550', ''),
(418, 'Cedula Fisica', 601340673, 'ARTAVIA MURILLO ANA.', 'GOLFITO HOP. RAYOS X O KM 3 A LA', 'PAR DE DOÑA LIDIA.', '775', ''),
(419, 'Cedula Fisica', 601340673, 'ARTAVIA MURILLO ANA.', 'GOLFITO HOP. RAYOS X O KM 3 A LA', 'PAR DE DOÑA LIDIA.', '775', ''),
(420, 'Cedula Fisica', 601340673, 'ARTAVIA MURILLO ANA.', 'GOLFITO HOP. RAYOS X O KM 3 A LA', 'PAR DE DOÑA LIDIA.', '2775-1594', ''),
(421, 'Cedula Fisica', 601950419, 'ARTAVIA ROJAS MARJORIE.', 'CIUDAD CORTEZ  B. San Antonio  Urb.', 'Boruca. 6cm.', '', ''),
(422, 'Cedula Fisica', 103050404, 'ARTAVIA SANDI EMILCE', '', '', '', ''),
(423, 'Cedula Fisica', 601500917, 'ARTAVIA SEGURA MARLENY', '', '', '', ''),
(424, 'Cedula Fisica', 602600791, 'ARTOLA VIQUEZ CARLOS A.', 'Golfito  km20. pulp La Guaria 400m', 'este cs amarilla. Cel 8979-8493.', '2789-7585', ''),
(425, 'Cedula Fisica', 300205679, 'ASOCIACION DE DESARROLLO INTEGRAL', 'RIO CLARO', '', '', ''),
(426, 'Cedula Fisica', 300205679, 'ASOCIACION DE DESARROLLO INTEGRAL', 'RIO CLARO', '', '', ''),
(427, 'Cedula Fisica', 300205679, 'ASOCIACION DE DESARROLLO INTEGRAL', 'RIO CLARO', '', '', ''),
(428, 'Cedula Fisica', 302376752, 'ASOMEP (ASOC.MUJERES EMPRENDEDORAS)', 'P Jiménez La Palma  Cel 8784-2312.', '', '2735-1546', ''),
(429, 'Cedula Fisica', 302376752, 'ASOMEP(ASOC. MUJERES EMPRESARIAS)', 'LA PALMA DE JIMENEZ. Tel 2735-1546.', 'Johana Gutiérrez. por el Salón.', '2735-1546', ''),
(430, 'Cedula Fisica', 605620170, 'ASTUA FALLAS MARIA ISABEL.', '200 MTS SUR DEL RASTRO EN CIUDAD', 'NEILY.', '', ''),
(431, 'Cedula Fisica', 105620170, 'ASTUA FALLAS Mº ISABEL', 'La cuesta  El Chorro  2.5 km oeste.', '', '8602-7347', ''),
(432, 'Cedula Fisica', 601300137, 'ASTUA QUIROS MARIO', 'ZANCUDO frent panaderis del Mar Cs', 'papaya y gris 2776-0330', '2775-0330', ''),
(433, 'Cedula Fisica', 600940496, 'ATENCIO ALVARADO LIDIA', 'PASO CANOAS  COLORADITO DEL PUENTE', '1 KM SUR.', '2252500', ''),
(434, 'Cedula Fisica', 600940496, 'ATENCIO ALVARADO LIDIA', 'PASO CANOAS  COLORADITO DEL PUENTE', '1 KM SUR.', '2252500', ''),
(435, 'Cedula Fisica', 600940496, 'ATENCIO ALVARADO LIDIA', 'EL CARMEN DE ABROJO 500 MTS DE', 'ANTIGUA ESCUELA SANTA MARTA.', '', ''),
(436, 'Cedula Fisica', 159100057, 'ATENCIO ATENCIO DIOMEDE', 'Veracruz  Pulp. Los Naranjos entran', 'do. Telf 2783-6388 PUBLICO.', '2783-6388', ''),
(437, 'Cedula Fisica', 602890012, 'ATENCIO BAULES EUGENIO', 'Finca 6-11 1era casa antes de la Es', 'cuela.', '2780-1081', ''),
(438, 'Cedula Fisica', 800460411, 'ATENCIO BEITA JAVIER', 'CARACOL DE LA VACA 400NORTE', 'DE ESCUELA CALLE A INCENDIO.', '7838155', ''),
(439, 'Cedula Fisica', 500810051, 'ATENCIO CORDERO ROSALIA', 'GOLFITO KM 1 CASA #4452 <P> 02 C/M', 'O EN ESCUELA DE KM 1', '775', ''),
(440, 'Cedula Fisica', 500810051, 'ATENCIO CORDERO ROSALIA', 'GOLFITO KM 1 CASA #4452 <P> 02 C/M', 'O EN ESCUELA DE KM 1', '7751676', ''),
(441, 'Cedula Fisica', 159100848, 'ATENCIO DE GRACIA BENITA', 'Rio Claro  Las Viquillas  200 mts', 'de pulp la guanacasteca 2da Cs verd', '8425-6160', ''),
(442, 'Cedula Fisica', 600330477, 'ATENCIO FLORES JUSTINA', 'GOLFITO  Bº BELLA VISTA CASA 4261', 'SEGUNDA FILA DESPUES DEL TELEFONO', '7751092', ''),
(443, 'Cedula Fisica', 600800173, 'ATENCIO MARTINEZ VICENTA', 'Golfito  La mona de taller carrion', '25 S Cs sin pintar -275-75-5024', '8534-5702', ''),
(444, 'Cedula Fisica', 601210896, 'ATENCIO PALACIOS FRANCISCO', 'C Neily C González 70 Sur Escuela.', 'Cs Blanco con Rojo.', '8446-3353', ''),
(445, 'Cedula Fisica', 601220170, 'ATENCIO RIVERA ROSA EMILIA', 'PUNTA ZANCUDO  SODA KATERIN 50 MTS', 'ANTES DEL COQUITO.', '7760010', ''),
(446, 'Cedula Fisica', 602580580, 'ATENCIO ZAPATA MARIA', 'HOSPITAL GOLFITO  RESIDENCIAL', 'MEDICO EN ADMINISTRACION', '', ''),
(447, 'Cedula Fisica', 602580580, 'ATENCIO ZAPATA MARIA', 'HOSPITAL GOLFITO  RESIDENCIAL', 'MEDICO EN ADMINISTRACION', '7831568', ''),
(448, 'Cedula Fisica', 601840980, 'ATENCIO ZAPATA PAULINA', 'GOLFITO LOS TRIBUNALES.O C.NEILY', 'CARA VACA 5TA CASA NARANJA 15 C/MES', '7752201', ''),
(449, 'Cedula Fisica', 601840980, 'ATENCIO ZAPATA PAULINA', 'EDIFICIO DE LOS TRIBUNALES GOLFO.', 'CLIENTE  CLASE A', '7836300', ''),
(450, 'Cedula Fisica', 501050077, 'AVALOS AVALOS LUCIA', 'FINCA 10 PALMAR SUR. FRENTE PLAZA', 'DE DEPORTES.', '', ''),
(451, 'Cedula Fisica', 602820696, 'AVALOS HERNANDEZ MARIA DEL CARMEN', 'GOLFITO  I.N.V.U. KM 3 CASA Nº 03', 'Frente a antigua Camaronera', '', ''),
(452, 'Cedula Fisica', 602820696, 'AVALOS HERNANDEZ MARIA DEL CARMEN', 'GOLFITO  I.N.V.U. KM 3 CASA Nº 03', 'Frente a antigua Camaronera', '', ''),
(453, 'Cedula Fisica', 102820696, 'AVALOS HERNANDEZ MARIA DEL CARMEN', 'GOLFITO  I.N.V.U. KM 3 CASA Nº 03', 'Frente a antigua Camaronera', '', ''),
(454, 'Cedula Fisica', 501050542, 'AVELLAN AVELLAN VICTORIA', '', '', '', ''),
(455, 'Cedula Fisica', 800490132, 'AVELLAN BALTODANO JOSE E.', 'C dos plantas contg a salon guarani', '<p> 03 c/m', '782230', ''),
(456, 'Cedula Fisica', 601021492, 'AVELLAN GRIJALBA LEONEL', 'C Cortés  Ojo de Agua.', '', '2788-8628', ''),
(457, 'Cedula Fisica', 610201492, 'AVELLAN GRIJALBA LEONEL.', 'PULPERIA EL VALLE OJO DE AGUA EN---', 'CIUDAD CORTES.', '', ''),
(458, 'Cedula Fisica', 602040502, 'AVELLAN MARENCO RAMONA', 'Golfito  Km20  calle agroindustrial', 'Desp puente cemento  cs 2 pisos.', '8622-0374', ''),
(459, 'Cedula Fisica', 201500121, 'AVENDAÑO ALVARADO AGUSTO CESAR', 'VILLA COLON ULTIMA CASA', 'MANO DERECHA', '', ''),
(460, 'Cedula Fisica', 600920959, 'AVENDAÑO BARAHONA AURORA', 'GOLFITO  HOSP O KMT UNO CASA 4499', 'FILA 4 Y MEDIA.', '750011', ''),
(461, 'Cedula Fisica', 600920959, 'AVENDAÑO BARAHONA AURORA', 'GOLFITO HOSPITAL I.D.E.M', '<P> BISEMANAL', '*-*-*-*', ''),
(462, 'Cedula Fisica', 602140444, 'AVENDAÑO NUÑEZ RANDAL', 'C. CORTES URB. YANET P.', 'CASA Nº 111  8 C/MES', '8335-5546', ''),
(463, 'Cedula Fisica', 601890693, 'AVENDAÑO SIBAJA YESSENIA', 'C Cortés  Ciud Pacheco  cs 71.', '', '8624-9041', ''),
(464, 'Cedula Fisica', 500940013, 'AVILA CASTAÑEDA MARIA LUCILA', '', '', '', ''),
(465, 'Cedula Fisica', 602780483, 'AVILA MONTERO LEONEL', 'C Cortés  Bº S José 75m norte Bomba', 'cs 2 pisos. Cel 8754-5278.', '2784-7147', ''),
(466, 'Cedula Fisica', 602180123, 'AVILA RUIZ MARITZA', 'NARANJO DE LAUREL CARRETERA A', 'SARAGOZA DE LA ESCUELA 1 KMT DERECH', '', ''),
(467, 'Cedula Fisica', 600540434, 'AZOFEIFA ABARCA ALEX.', 'LA ESPERANZA DE PAVONES.', 'CASA METIDA MANO IZQUIERDA.', '', ''),
(468, 'Cedula Fisica', 900420301, 'AZOFEIFA ABARCA VIRGINIA', 'PALMAR NORTE.ENTRADA JALACA', 'PILADERO DE LOS ALFARO', '8256584', ''),
(469, 'Cedula Fisica', 900420301, 'AZOFEIFA ABARCA VIRGINIA', 'Jalaca  Piladora de los Alfaro.', '', '8825-6584', ''),
(470, 'Cedula Fisica', 601420917, 'AZOFEIFA AZOFEIFA GERADINA', 'P Jiménez  fte finca Franchesque Bº', 'los Cholos.   8760-9372', '8318-9162', ''),
(471, 'Cedula Fisica', 601730336, 'AZOFEIFA AZOFEIFA JOSE CIRILO', 'PTO JIMENEZ URB. SAN LAZARO Nº D-8', '** FECHA DE PAGO 11 DE CADA MES**', '7355560', ''),
(472, 'Cedula Fisica', 601730336, 'AZOFEIFA AZOFEIFA JOSE CIRILO', 'PTO JIMENEZ EN LA URBA.', '* CANCELA 12 C/MES **', '7355218', ''),
(473, 'Cedula Fisica', 602270707, 'AZOFEIFA AZOFEIFA LUIS A.', 'PTO. JIMENEZ SANDALO', '', '7355421', ''),
(474, 'Cedula Fisica', 602270707, 'AZOFEIFA AZOFEIFA LUIS ALBERTO', 'TPO JIMENEZ SANDALO EN PULPERIA', '** CANCELA LOS 11 DE CADA MES **', '8287067', ''),
(475, 'Cedula Fisica', 601240997, 'AZOFEIFA BUSTAMANTE ANGELA', 'LA PALMA 200M SUR CEMENTERIO', 'Fte Cacerío detras alm La Palma.', '', ''),
(476, 'Cedula Fisica', 601850927, 'AZOFEIFA CARRANZA OLMAN', 'LA ESPERANZA DE PAVONES.', 'Abastecedor La Esperanza.', '2776-8143', ''),
(477, 'Cedula Fisica', 601660480, 'AZOFEIFA FLORES GILBERTO', 'Guanacaste  La Cruz  o en Golfito ', 'Purruja. tel. 27752312 83483069.', '2775-2312', ''),
(478, 'Cedula Fisica', 601081183, 'AZOFEIFA RAMIREZ DANIEL.', 'PASO CANOAS M. S. P.', 'PAGA EL 30 DE C/M.', '782371', ''),
(479, 'Cedula Fisica', 601081183, 'AZOFEIFA RAMIREZ DANIEL.', 'PASO CANOAS M. S. P.', 'PAGA EL 30 DE C/M.', '782371', ''),
(480, 'Cedula Fisica', 602440364, 'AZOFEIFA ROJAS SAIRES', 'ZANCUDO  BAR ARENA ALTA <P> 15 C/M', '', '776', ''),
(481, 'Cedula Fisica', 900330110, 'AZOFEIFA SALAZAR OSCAR', 'Río Claro  de la Cruz Roja M.I 3º', 'Casa color celeste', '7898635', ''),
(482, 'Cedula Fisica', 102960704, 'BADILLA ALPIZAR MARIO', 'CUERVITO DE PAVONES ANTES DE ENTRAR', 'A MONTAÑILLA C.C AMARILLA ZING VERD', '', ''),
(483, 'Cedula Fisica', 601530134, 'BADILLA ALVARADO LUIS ALBERTO', 'P Jiménez  La Palma  panadería La', 'Palma.', '8704-0407', ''),
(484, 'Cedula Fisica', 500700595, 'BADILLA ALVARADO SOCORRO.', 'NO SE REGISTRO.', '', '', ''),
(485, 'Cedula Fisica', 600320950, 'BADILLA BADILLA CARLOS BORROMEO', 'GOLFO KMT 5 CERRO PARTIDO AL FONDO', 'CASA DE COLOR AZUL FRTE A ALMENDRO', '7751343', ''),
(486, 'Cedula Fisica', 600320950, 'BADILLA BADILLA CARLOS BORROMEO', 'GOLFITO KM.5 CERRO PARTIDO AL FONDO', 'CASA COLOR AZUL * CANCELA 02 C/M *', '7751343', ''),
(487, 'Cedula Fisica', 500222760, 'BADILLA BADILLA RAFAEL', 'GOLFITO  KMT 3 CASA Nº 1 AL OTRO', 'LADO DE LA PLAZA C. VERDE  DE MADER', '7750215', ''),
(488, 'Cedula Fisica', 108980520, 'BADILLA CALDERON KATHIA', 'Pto Jiménez Soda El Colectivo fte', 'Super 96.', '8971-8873', ''),
(489, 'Cedula Fisica', 108660230, 'BADILLA CALDERON LUIS', 'P Jiménez Ñeque contiguo al vivero.', '', '8832-3055', ''),
(490, 'Cedula Fisica', 900500052, 'BADILLA CARDENAS CARLOS LUIS', 'BAHIA BALLENA NORTE ESCUELA FLOR DE', 'BAHIA CASA 1 PLATA 8867/5566', '2743-8245', ''),
(491, 'Cedula Fisica', 900710540, 'BADILLA CRUZ GUILLERMO CC MEMO', 'Fca Alajuela  detras oficinas Coope', 'Triunfo.', '8747-3463', ''),
(492, 'Cedula Fisica', 602190464, 'BADILLA GAMBOA EDGAR', 'Coto 52  Zona Americana casa 10502', 'Cobrar en ASD coto 49. 8569-7208.', '8818-8147', ''),
(493, 'Cedula Fisica', 101500513, 'BADILLA GARCIA LORELY', 'C Cortés  Urb Pacheco  cs 11', '', '2786-4163', ''),
(494, 'Cedula Fisica', 602320935, 'BADILLA GARCIA OLGA', 'Urb Pacheco casa 2D2 50 m Abast el', 'progreso Ojo de Agua.', '2788-8916', ''),
(495, 'Cedula Fisica', 500990951, 'BADILLA GARITA RAMON', 'La Campiña 2km de Esc. 600 Norte', '', '2776-6064', ''),
(496, 'Cedula Fisica', 500990951, 'BADILLA GARITA RAMON', 'La Campiña 2km de Esc. 600 Norte', '', '8692-5136', ''),
(497, 'Cedula Fisica', 603600149, 'BADILLA MENDEZ JORGE', 'Ciudad Neily  Cs esq fret a la UNED', 'Farmacia Ibarra  8521-6162', '2783-3171', ''),
(498, 'Cedula Fisica', 105410961, 'BADILLA MORA HERMAN', 'RIO CLARO FERRETERIA ARTAVIA 100MTS', 'NORTE 100 SUR  03 C/M', '', ''),
(499, 'Cedula Fisica', 105410961, 'BADILLA MORA HERMAN.', 'RIO CLARO FERRETERIA ARTAVIA 100MTS', 'NORTE 100 SUR.30 C/M.', '', ''),
(500, 'Cedula Fisica', 600380665, 'BADILLA MOYA MANUEL', 'RIO CLARO SAN RAMON 100M NORTE', 'DE LA ESCUELA', '7898104', ''),
(501, 'Cedula Fisica', 303590565, 'BADILLA QUIROS ANALIA', 'Coto 54 casa 8226 x la plaza.', '', '8754-5300', ''),
(502, 'Cedula Fisica', 600670587, 'BADILLA QUIROS PEDRO', 'P Canoas S Jorge 75m oeste Muebler.', 'Rojas. Cel 8612-5686.', '2732-2616', ''),
(503, 'Cedula Fisica', 601250276, 'BADILLA RUIZ EDWIN', 'P Norte  Bº Alemania  cs1  fte pulp', 'El Ciprés. Cel 8829-7484.', '2786-7372', ''),
(504, 'Cedula Fisica', 106070975, 'BADILLA SOTO OLGA', 'La Fortuna Las Latas  diag Plaza', 'ultima casa c/natural. 8894-9996', '2783-1960', ''),
(505, 'Cedula Fisica', 500800530, 'BALTODANO AGUIRRE JOSE ANGEL', 'P.Blancas  La Guaria  125 m Escuela', 'calle a Palmar.', '8312-1831', ''),
(506, 'Cedula Fisica', 106170720, 'BALTODANO BALTODANO  MARIA ESTER', 'Bº CANADA POR BALZAR  X PULP.', 'ALAMEDAS CLIENTE CONOSIDO.', '7888718', ''),
(507, 'Cedula Fisica', 501471144, 'BALTODANO BALTODANO JOSEFINA.', 'VILLA COLON LA PERLA DEL SUR BAR.', '', '', ''),
(508, 'Cedula Fisica', 106170720, 'BALTODANO BALTODANO M. ESTER', 'GOLFITO  DE LA ESNTRADA AL MUELLE', '(LA PAPOTA) CASA M. IZQUIERDA.', '', ''),
(509, 'Cedula Fisica', 106170720, 'BALTODANO BALTODANO M. ESTER', 'CIUDAD CORTES  BALZAR X PULP LAS', 'ALAMEDAS  PREGUNTAR POR EDWIN LOPEZ', '7888482', ''),
(510, 'Cedula Fisica', 501130161, 'BALTODANO BALTODANO MARTA ALICIA', 'Coto 54  frte a plaza de deportes ', 'Club de Trabajadores.', '8781-1051', ''),
(511, 'Cedula Fisica', 601490461, 'BALTODANO ESPINOZA MARJORIE', 'ZANCUDO PANADERIA EL MAR', '<P> 15 C/M', '776', ''),
(512, 'Cedula Fisica', 601490461, 'BALTODANO ESPINOZA MARJORIE', 'Playa Zancudo  200 de Punta Lodge', 'Panaderia del Mar   2776-0132', '2776-0132', ''),
(513, 'Cedula Fisica', 501540276, 'BALTODANO JIMENEZ PATRICIO', 'PUNTA BANCO PAVONES', 'BAR Y RESTAURANTE MAREA ALTA', '', ''),
(514, 'Cedula Fisica', 501540206, 'BALTODANO JIMENEZ PATRICIO', 'Punta Banco  Frente a la Escuela.', '', '2776-2083', ''),
(515, 'Cedula Fisica', 500640841, 'BALTODANO LOPEZ OLDEMAR', 'CUERVITO DE PAVONES', 'DE CRUCE ZANCUDO 2 KMTS', '', ''),
(516, 'Cedula Fisica', 500640841, 'BALTODANO LOPEZ OLDEMAR', 'CUERVITO DE PAVONES DEL CRUCE', 'A ZANCUDO 2 KMTS', '7768154', ''),
(517, 'Cedula Fisica', 501720253, 'BARAHONA UMAÑA CARLOS GERARDO', 'Coto 54  Casa 11625', '', '2781-1052', ''),
(518, 'Cedula Fisica', 602310710, 'BARBOZA ARROYO MARIA EVELYN', 'San Vito Sta Elenate.Cel 8603-6044.', '', '2776-6072', ''),
(519, 'Cedula Fisica', 502050509, 'BARBOZA BADILLA FRANCISCO (FRANCO)', 'C.N.Bº el Carmen de Abrojo pulp.', 'La Cuevita independiente. P 15 C/M', '', ''),
(520, 'Cedula Fisica', 502050509, 'BARBOZA BADILLA FRANCISCO (FRANCO)', 'C.N BºEL CARMEN DE ABROJO PULP.', 'LA CUEVITA INDEPENDIENTE <P> OFICIN', '', ''),
(521, 'Cedula Fisica', 105400409, 'BARBOZA BARBOZA RUPERTO', 'BELLA LUZ DE LA VACA', 'POR EL BAR ABANGARES', '', ''),
(522, 'Cedula Fisica', 601210960, 'BARBOZA CASCANTE LUIS', 'COMTE DEL COLEGIO DE COMTE 700MTS', 'NORTE CONTIGUO A CANCHA', '2776-8016', ''),
(523, 'Cedula Fisica', 105400409, 'BARBOZA ELIZONDO RUPERTO', 'BELLA LUZ 150 ESTE DEL BAR ABANGARE', 'CASA BLANCA DE CEMENTO <P> 15 C/M', '382', ''),
(524, 'Cedula Fisica', 105400409, 'BARBOZA ELIZONDO RUPERTO', 'BELLA LUZ 150 ESTE DEL BAR ABANGARE', 'CASA BLANCA DE CEMENTO <P> 15 C/M', '3821347', ''),
(525, 'Cedula Fisica', 105360187, 'BARBOZA ESPINOZA FLOR', 'Rio Claro. Carnicería Guaycará.', 'Cobrar 350 Norte del Salón Comunal.', '', ''),
(526, 'Cedula Fisica', 602700886, 'BARBOZA MARIN MARIZA', 'UVITA 300MTS SUR BANCO NACIONAL', 'CABINAS GATO 88069429', '2743-8587', ''),
(527, 'Cedula Fisica', 103760169, 'BARBOZA MASIS OLDEMAR', 'P Norte Bº Wong cont taller Ronald', '', '8996-0390', ''),
(528, 'Cedula Fisica', 602870757, 'BARBOZA MORA GERARDO', 'Laurel  Bella Luz  Antiguo Bar las', 'Carretas. Cel 8784-7820.', '2783-8012', ''),
(529, 'Cedula Fisica', 202150526, 'BARBOZA RODRIGUEZ LUIS DELFIN', 'Palmar calle a Cortés. taller de ca', 'miones empezando la calle lado izq.', '8719-3553', ''),
(530, 'Cedula Fisica', 106390952, 'BARBOZA SOLIS DAISY', 'GUADALUPE PTO JIMENEZ DEL CEMENTERI', '1 KMT Y MEDIO 1er ENTRADA DESP PUEN', '7750333', ''),
(531, 'Cedula Fisica', 900990394, 'BARBOZA SOLIS ELBA', 'La Palma  Guadalupe 100 m oeste Esc', '', '7351118', ''),
(532, 'Cedula Fisica', 105010712, 'BARBOZA SOLIS RAMIRO', 'Naranjo de Laurel  600 m del cruce', 'Naranjo a tamarindo; CC Celeste.', '', ''),
(533, 'Cedula Fisica', 105010712, 'BARBOZA SOLIS RAMIRO', 'Naranjo de Laurel  600 m Norte de', 'la delegación de la GAR.', '7800592', ''),
(534, 'Cedula Fisica', 105010712, 'BARBOZA SOLIS RAMIRO', 'Laurel  Naranjo  1km norte Guardia', 'Rural. Cel 8779-5869.', '2780-0592', ''),
(535, 'Cedula Fisica', 603230912, 'BARBOZA TENORIO DIDIER', 'COMTE LA ESTRELLA CONTIGUO A LA PLA', 'ZA. Cel 8667-6061', '2776-8398', ''),
(536, 'Cedula Fisica', 600890844, 'BARQUERO BARQUERO JOSE LUIS', 'LA GAMBA DE LA RURAL 500MTS AL ESTE', 'CASA CAFE CON VERDE', '2741-8127', ''),
(537, 'Cedula Fisica', 601860092, 'BARQUERO BARRANTES FLOR LIZ', 'CIUDAD CORTES  I.M.A.S. CASA 16', '', '7888654', ''),
(538, 'Cedula Fisica', 401280878, 'BARQUERO BARRANTES LUIS', 'PUERTO JIMENEZ DIAGONAL A', 'SERVICENTRO', '7353360', ''),
(539, 'Cedula Fisica', 601190432, 'BARQUERO CHACON OLMAN', 'Golfito  Bº Bella Vista. Cuarta', 'Fila Casa # 8174.', '', ''),
(540, 'Cedula Fisica', 601190432, 'BARQUERO CHACON OLMAN', 'B` BELLA VISTA 4ta FILA CASA # 8174', 'GOLFITO .P. 28 C/M', '', ''),
(541, 'Cedula Fisica', 601980165, 'BARQUERO CORDERO DENIS', 'LA JULIETA FRENTE A ZONA VERDE', 'CASAS BLANCAS', '8116815', ''),
(542, 'Cedula Fisica', 601980165, 'BARQUERO CORDERO DENIS', 'LA JULIETA FRENTE A ZONA VERDE', 'CASAS BLANCAS', '8116815', ''),
(543, 'Cedula Fisica', 601460628, 'BARQUERO GODOY GERARDINA', 'LA CUESTA  CALLE AL CEMENTERIO', 'CONTIGUO A PULERIA LA FLOR', '', ''),
(544, 'Cedula Fisica', 602250449, 'BARQUERO GODOY LIDIA', 'NAZARETH DE GOLFITO 250 NORTE DE', 'LA IGLESIA CATOLICA', '', ''),
(545, 'Cedula Fisica', 602070857, 'BARQUERO GUERRERO DAVID', 'PTO.JIMENEZ PALO SECO 150MTS. SUR', 'DE LA ESCUELA.', '', ''),
(546, 'Cedula Fisica', 103260491, 'BARQUERO JIMENEZ MIRIAM', 'La Isla Bº orotina 600 M de la pulp', 'Cs color Arcilla  2773-4554', '', ''),
(547, 'Cedula Fisica', 900380498, 'BARQUERO LOPEZ OSCAR', 'Rio Claro  contiguo a Super Pan', 'Frente al ahorro.', '', ''),
(548, 'Cedula Fisica', 500390598, 'BARQUERO NAVARRO ISIDORO CC RAMON', 'Golf Km 5 a la par de taller de MIN', 'una casa antes.', '', ''),
(549, 'Cedula Fisica', 900880879, 'BARQUERO VARGAS LIMBER', 'Sabalito  Bº La paz del cen 150 SE', 'Cs Color Jeraneo  Chatarrera ', '2784-0371', ''),
(550, 'Cedula Fisica', 601800886, 'BARRANTES ARIAS ESTRELLA', 'CIUDAD NEILY  NOVEDADES LAS', 'GEMELITAS', '7833124', ''),
(551, 'Cedula Fisica', 601800886, 'BARRANTES ARIAS ESTRELLA', 'C Neily  Tienda las Gemelas  contig', 'Alfa & Omega. Cel 8844-8111.', '2783-5729', ''),
(552, 'Cedula Fisica', 104380785, 'BARRANTES ARTAVIA MANUEL', 'pto jimenez gallardo', '', '', ''),
(553, 'Cedula Fisica', 104380785, 'BARRANTES ARTAVIA MANUEL', 'PUERTO JIMENEZ GALLARDO 200 MTS', 'DE LA PULPERIA LA EUREKITA AL OESTE', '', ''),
(554, 'Cedula Fisica', 104380785, 'BARRANTES ARTAVIA MANUEL', 'P Jiménez Gallardo  200 O Pulp Eure', 'kita.', '8639-5235', ''),
(555, 'Cedula Fisica', 500600347, 'BARRANTES BARRANTES JAVIER', '', '', '', ''),
(556, 'Cedula Fisica', 104770924, 'BARRANTES CHACON MARINA', 'RIO CLARO BAMBEL 4 CONTIGUO AL', 'TALLER HTB FECHA PAGO 16 C/M.', '7899460', ''),
(557, 'Cedula Fisica', 102010417, 'BARRANTES CORRALES EFRAIN.', 'GOLFITO CONTIGUO A APIRGOL.', 'P.03 Y 16 C/M', '750167', ''),
(558, 'Cedula Fisica', 107020082, 'BARRANTES ELIZONDO SANDRA', 'PTO. JIMENEZ URB.EL COLEGIO', '', '', ''),
(559, 'Cedula Fisica', 107020082, 'BARRANTES ELIZONDO SANDRA', 'P Jiménez  Urb el Colegio  Cs H13.', '', '8614-2236', ''),
(560, 'Cedula Fisica', 601750241, 'BARRANTES GRANADOS LUZ MARINA', 'R Claro Urb. Guaycará casa 99 conti', 'guo a Tito el Joyero.', '', ''),
(561, 'Cedula Fisica', 601750241, 'BARRANTES GRANADOS LUZ MARINA', 'R Claro Urb. El ICE  300 Mts del', 'puente  8685-9192', '', ''),
(562, 'Cedula Fisica', 600720511, 'BARRANTES JIMENEZ EULALIA', 'La Estrella de Comte 100 m este', 'Bar el Zarpe  contig puente cemento', '', ''),
(563, 'Cedula Fisica', 102310533, 'BARRANTES MENDEZ JESUS', 'CIUDAD NEILY Bº LA FORTUNA  FABRICA', 'DE BLOCK JOHAN', '', ''),
(564, 'Cedula Fisica', 102310533, 'BARRANTES MENDEZ JESUS', 'CIUDAD NEILY Bº LA FORTUNA  FABRICA', 'DE BLOCK JOHAN', '*-*-*-*', ''),
(565, 'Cedula Fisica', 102310533, 'BARRANTES MENDEZ JESUS', 'C Neily  La Fortuna  Antigua Bloque', 'ra Jhoan  fte puente nuevo.', '2783-5467', ''),
(566, 'Cedula Fisica', 900610975, 'BARRANTES OCAMPO SANTIAGO', 'BAMBEL SECTOR 2  DE TANQUES AGUA 75', 'MT ESTE COSTA DE LA PISTA P 03*', '', ''),
(567, 'Cedula Fisica', 500780370, 'BARRANTES RODRIGUEZ RUFINO', 'LA CUESTA  CALLE AL CEMENTERIO', '300 MTS DEL CORREO.', '7322714', ''),
(568, 'Cedula Fisica', 602450552, 'BARRANTES ROJAS MARIA GUISELLE', 'LA MONA GOLF TALLER ESBANISTERIA', '', '7750327', ''),
(569, 'Cedula Fisica', 107510441, 'BARRANTES TREJOS PATRICIA', 'RIO CLARO  COSTADO ESTE DE LA', 'FERRETERIA ARTAVIA SANCHEZ', '7899864', ''),
(570, 'Cedula Fisica', 501230838, 'BARRANTES VASQUEZ JUAN', 'PASO CANOAS 1 KL DE LA IGLESIA', 'METODISTA  P 30.C/M', '', ''),
(571, 'Cedula Fisica', 501230838, 'BARRANTES VASQUEZ JUAN', 'Paso Canoas  1 km Iglesia Metodista', 'p 30 c/mes.', '', ''),
(572, 'Cedula Fisica', 603420538, 'BARRANTES VILLARREAL INGRID', 'P Norte  Bº Alemania  cs k4', 'Cel 8766-1597.', '2786-7317', ''),
(573, 'Cedula Fisica', 155804058, 'BARRAZA GOMEZ ROGER', 'C Neily  contiguo Alfa & Omega', '', '', ''),
(574, 'Cedula Fisica', 601870683, 'BARRERA MARCHENA WALTER DE JESUS', 'Pto Jiménez Agujas detrás Escuela', 'cs esquinera.', '8557-4124', ''),
(575, 'Cedula Fisica', 800460883, 'BARRERA PANIAGUA SERBULO', 'Comte  La Estrella  Finca Sérbulo.', '', '2776-8059', ''),
(576, 'Cedula Fisica', 800460883, 'BARRERA PANIAGUA SERBULO.', 'TIGRITO EN LA CUESTA ANTES DE', 'CRUZAR EL RIO TIGRITO.', '', ''),
(577, 'Cedula Fisica', 600920734, 'BARRIA BARRIA PORFIRIA', 'GOLFITO  HOSPI ENFERMERIA  O EN Bº', 'BELLA VISTA 6º FILA CASA #4274', '775', ''),
(578, 'Cedula Fisica', 600570851, 'BARRIENTOS BARRIENTOS DALIA', 'Cortés  Ciudadela Pacheco casa Nº33', '', '', ''),
(579, 'Cedula Fisica', 108400236, 'BARRIENTOS FERNANDEZ MARCO VINICIO', 'CUIDAD NEILY CENTRO', '', '8970-3815', ''),
(580, 'Cedula Fisica', 900400499, 'BARRIOS B. FELICIANO', 'GOLFITO  KMT 15 VENTA DE FRUTAS', 'CASA MANO DERECHA', '7750458', ''),
(581, 'Cedula Fisica', 900400499, 'BARRIOS B. FELICIANO', 'GOLFITO  KMT 15 VENTA DE FRUTAS', 'CASA MANO DERECHA', '7750458', ''),
(582, 'Cedula Fisica', 601940966, 'BARRIOS CASTILLO ALCIDES', 'COTO 54  CASA  13122 O EN COMPAÑIA', 'ACEITERA', '7811219', ''),
(583, 'Cedula Fisica', 601940966, 'BARRIOS CASTILLO ALCIDES', 'COTO 54', '', '', ''),
(584, 'Cedula Fisica', 601940966, 'BARRIOS CASTILLO ALCIDES', 'COTO 54', '', '7811219', ''),
(585, 'Cedula Fisica', 601940966, 'BARRIOS CASTILLO ALCIDES', 'COTO 54', '', '7811219', ''),
(586, 'Cedula Fisica', 601250133, 'BARRIOS CASTILLO ANITA', '', '', '', ''),
(587, 'Cedula Fisica', 601250133, 'BARRIOS CASTILLO ANITA.', 'GOLFITO HOSPITAL EN ARCHIVO', 'PAGA APARTIR DE ENERO 1993.', '759107', ''),
(588, 'Cedula Fisica', 602090447, 'BARRIOS ORTEGA MIRIAM', 'Golfito  La Mona  Ciud. B Aires  cs', 'fte a puente de riel.', '8326-5934', ''),
(589, 'Cedula Fisica', 602490655, 'BARROSO JIMENEZ GEOVANNY', 'Golf  Km 5 C partido frent fabrica', 'hielo Andres Umana  8853-1328', '8741-6718', ''),
(590, 'Cedula Fisica', 601880513, 'BARROSO RIOS DAYSI', 'Pto Escondido a un costado de la Es', 'cuela.', '', ''),
(591, 'Cedula Fisica', 103190751, 'BARTELES CHAVARRIA GERARDO.', 'ASERRI', '', '3625967', ''),
(592, 'Cedula Fisica', 103190751, 'BARTELES CHAVARRIA GERARDO.', 'ASERRI.', '', '3625967', ''),
(593, 'Cedula Fisica', 800680235, 'BATISTA CEDEÑO DIDIMO', 'LLANO B DESP CABLE 1º Ent casa izq.', 'Es Guarda del Hospital.', '8345-52', ''),
(594, 'Cedula Fisica', 280161496, 'BATISTA VERGARA VICENTE', 'PTO.JIMENEZ EL BANBU ULTIMA CASA', '', '', ''),
(595, 'Cedula Fisica', 280161496, 'BATISTA VERGARA VICENTE', 'PUERTO JIMENEZ DEPOSITO DE MADERAS', 'LA PRIMAVERA', '7355475', ''),
(596, 'Cedula Fisica', 600870656, 'BATRES TORRES PEDRO', 'la campiña 400 mts sur de la escuel', 'fret iglesia asambleas.', '', ''),
(597, 'Cedula Fisica', 601051089, 'BECERRA CHINTERO NARCISO', 'DE LA DELEGACION DE LA CUESTA', '700MTS AL ESTE CAMINO A CUERVITO', '2732-1314', ''),
(598, 'Cedula Fisica', 601051034, 'BECERRA HERNANDEZ MARGARITA', 'Ciudad Neilly  Hogar de Ancianos ', '', '', ''),
(599, 'Cedula Fisica', 601051034, 'BECERRA HERNANDEZ MARGARITA', 'Ciudad Neilly  Hogar de Ancianos ', '', '', ''),
(600, 'Cedula Fisica', 601051034, 'BECERRA HERNANDEZ MARGARITA', 'Ciudad Neilly  Hogar de Ancianos ', '', '7835773', ''),
(601, 'Cedula Fisica', 105710065, 'BECERRA MORA HAIDEE', 'PUERT JIMENEZ 100 MTS OESTE DE LA', 'IGLESIA CATOLICA', '7355371', ''),
(602, 'Cedula Fisica', 105710065, 'BECERRA MORA HAIDEE', 'PUERT JIMENEZ 100 MTS OESTE DE LA', 'IGLESIA CATOLICA', '7355371', ''),
(603, 'Cedula Fisica', 105710065, 'BECERRA MORA HAYDEE', 'JIMENEZ 75MTRS  OESTE DEL BANCO NAC', 'IONAL', '7355812', ''),
(604, 'Cedula Fisica', 601790592, 'BEITA ALPIZAR RAFAEL ANGEL', 'Ciudad Neily  Igles Metodista contg', 'Tropigas   2783-3206', '8511-0500', ''),
(605, 'Cedula Fisica', 601700979, 'BEITA ALTAMIRANO LEBI', 'VEREH DE LAUREL 350 MTS. DE LA', 'PULP. DEL LUGAR PALMERO', '7800691', ''),
(606, 'Cedula Fisica', 602990693, 'BEITA BATRES KEILOR', 'Km 5 75 Antes frente al castillo Cs', 'Color madera Natural ', '8504-1661', ''),
(607, 'Cedula Fisica', 603580513, 'BEITA BEITA OSCAR', 'EL TRIUNFO A UN COSTADO SE PULP.', 'EL BUEN PRECIO', '', ''),
(608, 'Cedula Fisica', 605070394, 'BEITA CAMPOS OLIVIER', 'P Canoas S Martín  Costado Iglesia', 'Cuadrangular  2º cs cc natural', '2732-1823', ''),
(609, 'Cedula Fisica', 600440382, 'BEITA ELIZONDO ENRIQUE', 'CIUDAD NEILLY  DEL PUENTE DE CARACO', 'L  1300 MTS AL ESTE FTE KM 326.', '', ''),
(610, 'Cedula Fisica', 600440382, 'BEITA ELIZONDO ENRIQUE', 'CIUDAD NEILLY  DEL PUENTE DE CARACO', 'L  1300 MTS AL ESTE FTE KM 326.', '', ''),
(611, 'Cedula Fisica', 601870825, 'BEITA ELIZONDO HILDA', 'P NORTE SODA LIDIA EN EL CENTRO DE', 'PALMAR NORTE', '8344020', ''),
(612, 'Cedula Fisica', 603640493, 'BEITA FERRETO PRISCILA', 'Golfito. Res Ureña  cs G6  primeras', 'casas MI.', '2775-0019', ''),
(613, 'Cedula Fisica', 602520661, 'BEITA FUENTES JANETH', 'km37 Frente a la escuela', '', '7899068', ''),
(614, 'Cedula Fisica', 602520661, 'BEITA FUENTES JEANETTE', 'GOLFITO Bº BELLA VISTA FRENTE IGLE', 'CORDERO DE DIOS C. #4265 <P> 19 C/M', '', ''),
(615, 'Cedula Fisica', 600470806, 'BEITA GARITA ELIDA', '', '', '', ''),
(616, 'Cedula Fisica', 601230384, 'BEITA MORALES PABLO', 'LA GUARIA 400 SUR DE ESCUELA CASA', 'ROSADA * CANCELA 8 C/MES **', '', ''),
(617, 'Cedula Fisica', 108500943, 'BEITA MORALES ROY', 'COMTE de Esc  200 N y 250 Este Cs', 'Madera Amarilla con celeste ', '8852-0153', ''),
(618, 'Cedula Fisica', 111570508, 'BEITA PEREZ NARCISA', 'La Cuesta Cuervito 100 sur 750 este', 'Pulp. el ahorro cs verde 8879-9155', '2732-1964', ''),
(619, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'SIERPE DE OSA  A UN COSTADO DE LA', 'PLAZA TIENDA Y BAZAR YENNIFER.', '7867361', ''),
(620, 'Cedula Fisica', 105580212, 'BEITA QUIROS JOSE ANGEL', 'SIERPE. A UN COSTADO DE LA PLAZA', 'TIENDA Y BAZAR YENIFFER', '7867361', ''),
(621, 'Cedula Fisica', 105580212, 'BEITA QUIROS JOSE ANGEL', 'SIERPE DE OSA A UN COSTADO DE PLAZA', '', '', ''),
(622, 'Cedula Fisica', 105580212, 'BEITA QUIROS JOSE ANGEL', 'SIERPE DE OSA A UN COSTADO DE PLAZA', '** FECHA DE PAGO 08 C/MES **', '7881361', ''),
(623, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'SIERPE CLIENTE CONOCIDA', '', '3799491', ''),
(624, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'SIERPE CLIENTE CONOCIDO TIPO---', '** CLASE 1 ** CANCELA 8 C/MES**', '3799491', ''),
(625, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'SIERPE CLIENTE CONOCIDO TIPO---', '** CLASE 1 ** CANCELA 8 C/MES**', '3799491', ''),
(626, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'Sierpe  Costado de la Plaza  Tienda', 'Jennifer.', '', ''),
(627, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL', 'Sierpe  Cabinas SIERPE  8705-9042', '', '', ''),
(628, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL.', 'SIERPE CASA AP 89  50MTS AL OESTE', 'DE LA PLAZA CASA AMARILLA.', '7888032', ''),
(629, 'Cedula Fisica', 104080524, 'BEITA QUIROS JOSE ANGEL.', 'SIERPE CASA AP 89  50MTS AL OESTE', 'DE LA PLAZA CASA AMARILLA.', '7888032', ''),
(630, 'Cedula Fisica', 601980427, 'BEITA RUIZ GERARDO', 'Golfito  Km 16 Frente la plaza Cs', 'cement blanca  2775-6096', '8984-1661', ''),
(631, 'Cedula Fisica', 602580726, 'BEITA SERRANO ENID', 'Caracol Norte  La Palma detrás Lic.', 'Canales. cobrar DP Libre kiosko Coc', '8623-2935', ''),
(632, 'Cedula Fisica', 203130594, 'BEJARANO ALVARADO FLOR Mº', 'P Jiménez  Cañaza  del cruce 1º cas', 'MI camino a S Miguel.', '8729-8685', ''),
(633, 'Cedula Fisica', 603290918, 'BEJARANO ARGUEDAS ROSA ISABEL', 'Golfo  Imas San Martin # 22 Cs verd', 'agua  8716-2124', '8606-0641', ''),
(634, 'Cedula Fisica', 601720808, 'BEJARANO BEJARAN0 MARITZA', 'BARRIO EL CARMEN COLORADITO', '', '7836360', ''),
(635, 'Cedula Fisica', 111540558, 'BEJARANO CASCANTE FLOREIDY ANAIS', 'P Canoas S Martín cs verde a un cos', 'tado Iglesia Cuadrangular.8559-1660', '8943-5667', ''),
(636, 'Cedula Fisica', 602630824, 'BEJARANO GOMEZ JOSE ALFREDO', 'La fortuna  frente a plaza de depor', 'tes.', '7834111', ''),
(637, 'Cedula Fisica', 602630824, 'BEJARANO GOMEZ JOSE ALFREDO.', 'La Fortuna Costado Este de la plaza', '', '7834111', ''),
(638, 'Cedula Fisica', 901000271, 'BEJARANO JIMENEZ JUSTO', 'La Cuesta 300m este Comandancia', 'camino a la Palma.', '2732-3141', ''),
(639, 'Cedula Fisica', 603580511, 'BEJARANO RIOS YAISAK CC ISAC', 'La Escuadra de Comte  Asentamiento', 'Alberto Villalobos.', '8640-9665', ''),
(640, 'Cedula Fisica', 901000259, 'BEJARANO SANTOS FELIPE', 'COTO 52 CASA Nª 10240 DETRAS DEL', 'MARCO ** FECHA DE PAGO 1 C/MES**', '7811024', ''),
(641, 'Cedula Fisica', 108530796, 'BEJARANO SUAZO LETICIA', 'P Norte  Asentam. Caña Blanca  lote', '33. Fte telf público. cel 8619-7435', '2786-6566', ''),
(642, 'Cedula Fisica', 601130090, 'BELLANERO SANCHEZ EVARISTO', 'Pto JIMENEZ 400 MTS SUROESTE DE LA', 'BOMBA OSA CONTG TORRE RADIO COL P 1', '735', ''),
(643, 'Cedula Fisica', 900480456, 'BELLANERO SANCHEZ JULIANA', 'URB. EL COLEGIO', '', '7355352', ''),
(644, 'Cedula Fisica', 900480456, 'BELLANERO SANCHEZ JULIANA', 'Urbanización el Colegio #B7', '', '7355352', ''),
(645, 'Cedula Fisica', 900480456, 'BELLANERO SANCHEZ JULIANA', 'Urbanización el Colegio #B7', '', '7355352', ''),
(646, 'Cedula Fisica', 600740426, 'BELLANERO SANCHEZ MAXIMINA', 'PALMAR SUR 750 N. DE LA BOMBA DE LA', 'PALMA CASA CON CORRAL.', '7866850', ''),
(647, 'Cedula Fisica', 600740426, 'BELLANERO SANCHEZ MAXIMINA', 'PALMAR SUR 750 N DE LA BONBA DE LA', 'PALMA  CASA CON CORRAL', '7866850', ''),
(648, 'Cedula Fisica', 600550639, 'BELLANERO SANCHEZ TRINIDAD', 'JIMENEZ  DE LA IGLESIA CATOLICA', '100 MTS SURESTE.', '7355052', ''),
(649, 'Cedula Fisica', 600550639, 'BELLANERO SANCHEZ TRINIDAD', 'Pto Jimenez centro calle a la bomba', '', '2735-5052', ''),
(650, 'Cedula Fisica', 601130090, 'BELLANERO SANCHEZ VALENTINA', 'Pto JIMENEZ 400 Mts SUROESTE DE LA', 'BOMBA OSA CONTG TORRE R.COLOSAL', '735', ''),
(651, 'Cedula Fisica', 600830983, 'BELLANERO SANCHEZ VALENTINA', 'PTO JIMENEZ URB. EL COLEGIO', 'CASA J1', '', ''),
(652, 'Cedula Fisica', 600830983, 'BELLANERO SANCHEZ VALENTINA', 'Pto Jiménez Urbanización el Colegio', 'Casa J-1.', '', ''),
(653, 'Cedula Fisica', 600830983, 'BELLANERO SANCHEZ VALENTINA', 'PTO JIMENEZ', '', '', ''),
(654, 'Cedula Fisica', 600830983, 'BELLANERO SANCHEZ VALENTINA', 'Pto Jiménez  600m suroeste de Bomba', 'fte Cabinas Heilyn.', '2732-5517', ''),
(655, 'Cedula Fisica', 600830983, 'BELLANERO SANCHEZ VALENTINA', 'P Jiménez 600m suroeste de la bomba', 'fte Cabinas Heilyn. 8771-6086.', '2732-5517', ''),
(656, 'Cedula Fisica', 108910844, 'BELLIDO BELLIDO GREY', 'Pto Jimenez Contg pension Quintero', '', '2735-5803', ''),
(657, 'Cedula Fisica', 106290813, 'BELLIDO BELLIDO ORLANDO', 'PtO JIMENEZ 25 Mts PENCION QUINTERO', '(SODA YOHANNA) <P> 11 C/M', '735', ''),
(658, 'Cedula Fisica', 106290813, 'BELLIDO BELLIDO ORLANDO', 'P Jiménez  25 m Pensión Quintero', '', '8819-3959', ''),
(659, 'Cedula Fisica', 600360602, 'BENAVIDES CARMONA JOSE ALBERTO', 'CIUDAD CORTES 400MTS  O. CALLE', 'AL CEMENTERIO 100MTS ANTES 8 C/M', '7888389', ''),
(660, 'Cedula Fisica', 800680587, 'BENAVIDES DAVILA MARIA DE JESUS', 'GOLFITO  KMT 2 DE LA CRUZ ROJA 50', 'MTS ESTE. CASA DE JOBEL.', '', ''),
(661, 'Cedula Fisica', 900930924, 'BENAVIDES JIMENEZ MARIBEL', 'C Neily  La Cartonera  4º cs desp.', 'Cervecería camino a 47. 8862-3587.', '2783-3698', ''),
(662, 'Cedula Fisica', 202040844, 'BENAVIDES SOLANO RODRIGO', 'Cortes  5O N DE LA ALCALDIA', 'CASA AMARILLA DE SOLACALO', '', ''),
(663, 'Cedula Fisica', 202040844, 'BENAVIDES SOLANO RODRIGO', 'CORTES 50 NORTE DE LA ALCADIA', '', '', ''),
(664, 'Cedula Fisica', 104120585, 'BENAVIDEZ DE LA O GERARDO', 'GILF DEL SAMOA 50 Mts CALLE AL Pto', 'CONTG. REPAR DE LLANTAS 03 C/M', '7750151', ''),
(665, 'Cedula Fisica', 104120585, 'BENAVIDEZ DE LA O GERARDO', 'GOLF DEL SAMOA 50 Mts CALLE AL Pto', 'CONTG. REPAR DE LLANTAS 16 C/M', '2775-1313', ''),
(666, 'Cedula Fisica', 603130179, 'BENAVIDEZ RODRIGUEZ MARIBEL', 'S Vito  Valle Azul 600 este Escuela', 'cs color cemento.', '8766-4339', ''),
(667, 'Cedula Fisica', 600640870, 'BERMUDEZ BLANCO ALFREDO', 'CENIZO  D`LA IGLESIA EVANGELICA 250', 'MTS SURESTE <P> 30', '', ''),
(668, 'Cedula Fisica', 600640870, 'BERMUDEZ BLANCO ALFREDO', 'Laurel  Cenizo  150m este Pulp. Nao', 'mi. Cs anaranjada.', '2780-0683', ''),
(669, 'Cedula Fisica', 601930574, 'BERMUDEZ CARVAJAL JAMES', 'GOLFITO LA MONA CIUDADELA NUEVA', 'CASA Nº B-20.', '7750754', ''),
(670, 'Cedula Fisica', 601930574, 'BERMUDEZ CARVAJAL JAMES', 'La Mona  Ciudadela nueva  casa B20', 'telf: 2775-6018.', '', ''),
(671, 'Cedula Fisica', 601930574, 'BERMUDEZ CARVAJAL JAMES.', 'GOLFITO  LA MONA CIUDADELA NUEVA', 'C. NUMER0 B-20 COLOR MORADO', '7750754', ''),
(672, 'Cedula Fisica', 103090411, 'BERMUDEZ CHINCHILLA ARNOLIDA', '', '', '', ''),
(673, 'Cedula Fisica', 103090411, 'BERMUDEZ CHINCHILLA ARNOLIDA', 'GOLFITO  CASA EN CABINAS DOÑA NOLA', '', '7751174', ''),
(674, 'Cedula Fisica', 103520057, 'BERMUDEZ JIMENEZ JULIAN', 'STA LUCIA  DE PULP STA LUCIA 800', 'Mts NORTE <P> 20 C/M', '*-*-*-*', ''),
(675, 'Cedula Fisica', 600690903, 'BERMUDEZ MOLINA MALAQUIAS', 'kmto 27 de la escuela 100 mts norte', 'reactivado x anibal 10/03/2010.', '', ''),
(676, 'Cedula Fisica', 601270194, 'BERMUDEZ MORA CARMEN', 'Río Claro  frente a Campo de aterri', 'zaje', '', ''),
(677, 'Cedula Fisica', 601270194, 'BERMUDEZ MORA CARMEN', 'RIO CLARO BAMBEL 3', '', '', ''),
(678, 'Cedula Fisica', 601690307, 'BERMUDEZ MORENO MARIA MARTA', 'RIO CLARO  FRENTE A IGLESIA ASAMBLE', 'DE DIOS 125 OESTE DE CABINAS PEREZ', '', ''),
(679, 'Cedula Fisica', 601690307, 'BERMUDEZ MORENO MARIA MARTHA', 'RIO CLARO DE TALLER ESTIL 100MTS', 'NE.CASA CON AMAPOLA', '8991967', ''),
(680, 'Cedula Fisica', 103710096, 'BERMUDEZ ROJAS ELSI', 'La Guaria de P. Blancas 100 Este de', 'la Escuela costado calle principal.', '2741-8111', ''),
(681, 'Cedula Fisica', 601540278, 'BERMUDEZ VIDAUNE MERCEDES', 'LA CUESTA  C. TAMAYO CASA Nº 3-C', '* CANCELA 16 CADA MES *', '7322347', ''),
(682, 'Cedula Fisica', 601540278, 'BERMUDEZ VIDAURRE MERCEDES.', 'la Cuesta  Ciudadela Tamayo  Bloque', 'C casa No 3 telefono 2732-2347', '7322347', ''),
(683, 'Cedula Fisica', 104410770, 'BERROCAL BERMUDEZ ALEXIS', 'LAGARTO DE R.C ABASTECEDOR', 'EL RINCONCITO', '', ''),
(684, 'Cedula Fisica', 601080939, 'BERROCAL HERNANDEZ EFREN', '50MTS AL SUR DE LA PENSION QINTERO', 'CASA COLOR MIXTA MADERA', '8790-7002', ''),
(685, 'Cedula Fisica', 602380360, 'BERROCAL PEREZ ALEIDA', 'P Jiménez Agujas Costado oeste de', 'la plaza.', '8676-2548', ''),
(686, 'Cedula Fisica', 201850227, 'BERROCAL PEREZ ULICES', '', '', '', ''),
(687, 'Cedula Fisica', 602220670, 'BERROCAL QUIROS EIDA MARIA', 'LA MONA BUENOS ARIES DE LA ENTRADA', 'CARRION 125MTRS LA COLOR MELON Y BL', '6', ''),
(688, 'Cedula Fisica', 500440355, 'BETANCORT BETANCORT BERNABE', 'RIO CLARO DIAGONAL A TALLER FELUCO', '', '', ''),
(689, 'Cedula Fisica', 603150199, 'BIRAMONTES MORA ROCIO DE LOS A.', 'GOLFITO KM2 EN EL SERRO', '** CANCELA 3 CADA MES *', '7751936', ''),
(690, 'Cedula Fisica', 400000177, 'BIZCAINO GARAY JOSEFINA B.', 'KINDER DE PASO CANOAS', '', '7322104', ''),
(691, 'Cedula Fisica', 602630200, 'BLANCO BELLANERO CARLOS', 'PTO. JIMENEZ AGUJAS DE PULP. KEREN', '', '7898129', ''),
(692, 'Cedula Fisica', 102560903, 'BLANCO GODINEZ GUILLERMO', 'P Canoas  El Trinfo  cs 06 antigua', 'pulp. Jara. cel 8377-0986', '2732-2783', ''),
(693, 'Cedula Fisica', 601470694, 'BLANCO JARA ULISES', 'Las Brisas de C.Neily detrás del', 'estadio.', '7833939', ''),
(694, 'Cedula Fisica', 501580705, 'BLANCO LARA MANUEL', 'RINCON DEL CAMPO (agua buena) CASA', 'D PUBLICO. Cel 8766-7512.', '2735-1177', ''),
(695, 'Cedula Fisica', 600971434, 'BLANCO RAMIREZ JALILIAN', 'DEL BAR LA RUEDA 50 MTS CALLE A', 'GOLFITO MANO DERECHA. P.27 C/M', '', ''),
(696, 'Cedula Fisica', 600920101, 'BLANCO RAMIREZ JEANNETE', 'GOLFITO  DE SODA VERA 50M. HACIA', 'ADENTRO.', '', ''),
(697, 'Cedula Fisica', 600920101, 'BLANCO RAMIREZ JEANNETTE', 'GOLF DE SODA DE VERA 50 Mts', 'HACIA DENTRO <P> 03 C/M', '*-*-*-*', ''),
(698, 'Cedula Fisica', 600260307, 'BLANCO SANDI ROBERTO', 'COOPERATIVA INTEGRAL', '', '', ''),
(699, 'Cedula Fisica', 600260307, 'BLANCO SANDI ROBERTO', 'Jalaca 800m Sur de la Cooperativa', '', '', ''),
(700, 'Cedula Fisica', 600260307, 'BLANCO SANDI ROBERTO', 'Palmar  Jalaca  800m Oeste de la', 'Cooperativa.', '8524-7478', ''),
(701, 'Cedula Fisica', 601660428, 'BLANCO VILLALOBOS JAHEL', 'pto jimenez', '', '', ''),
(702, 'Cedula Fisica', 601660428, 'BLANCO VILLALOBOS JAHEL', 'PTO JIMENEZ DETRAS DEL BANCO N.', '** CANCELA 16 CADA MES **', '7355325', ''),
(703, 'Cedula Fisica', 601660428, 'BLANCO VILLALOBOS JAHEL.', 'GOLFITO  KM 1 CASA #4150', '<P> 03 c/m', '', ''),
(704, 'Cedula Fisica', 601660428, 'BLANCO VILLALOBOS JAHEL.', 'GOLFITO  KM 1 CASA #4150', '<P> 03 c/m', '7751696', ''),
(705, 'Cedula Fisica', 601070813, 'BLANDON CASTILLO JEREMIAS', 'Sierpe  75 Mts N de Pulp MARY', 'Ciudadela Martinez  8669-1604', '8638-0650', ''),
(706, 'Cedula Fisica', 800560576, 'BLANDON DELGADO LEONOR', 'COLORADO P. CANOAS CONTIGUO', 'A PLAZA DE FUTBOL', '', ''),
(707, 'Cedula Fisica', 601081231, 'BLANDON SANCHEZ CESILIA', 'GOLFITO pueblo civil BAR LA PIRAGUA', '', '7752296', ''),
(708, 'Cedula Fisica', 502740048, 'BOGANTES MACOTELO SANTIAGO', 'P Jiménez Finca Corosales calle a', 'Carbonera.', '8983-8167', ''),
(709, 'Cedula Fisica', 502740048, 'BOGANTES MACOTELO SANTIAGO CC CHAGO', 'EL BANBU LOTE 42 DE LA PARCELA 35', '', '', ''),
(710, 'Cedula Fisica', 502380135, 'BOGANTES NUÑEZ CARLOS', 'Bª EL BAMBU 100 AL NORTE AL FONDO', 'CONTIGUO A LA PLAZA', '', ''),
(711, 'Cedula Fisica', 601070265, 'BOLANDY MAYORGA ODETTE.', 'LA 22 DE OCTUBRE FRENTE AL PLAY.', 'DIAGONAL A LOS TELEFONOS.', '', ''),
(712, 'Cedula Fisica', 105530475, 'BOLAÑOS CARPIO EDUARDO ANTONIO', 'LA ESPERANZA DE RIO CLARO', '', '7833150', ''),
(713, 'Cedula Fisica', 602880397, 'BOLAÑOS HIDALGO TATIANA', 'PALMAR NORTE  BARRIO ALEMANIA', 'CONTIGUO A LA ESCUELA', '8766096', ''),
(714, 'Cedula Fisica', 602880397, 'BOLAÑOS HIDALGO TATIANA', 'Palmar Norte  Bº Alemania contiguo', 'a Iglesia.', '2786-6096', ''),
(715, 'Cedula Fisica', 601021477, 'BOLAÑOS OCAMPOS PEDRO HUGO', 'GOLFITO URBANIZACION UREÑA CASA', '#I 5 P. 16 C/M', '', ''),
(716, 'Cedula Fisica', 501680291, 'BOLAÑOS SOTO LUZ MARINA', 'R Claro  Bambel 3  750m Ent Trilli-', 'zas.', '8804-4347', ''),
(717, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'COTO 63  DIAGONAL AL COMISARIATO', 'APROX.LA 2da CASA P.30 C/M', '', ''),
(718, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'COTO 63  DIAGONAL AL COMISARIATO', 'APROX.LA 2da CASA P.30 C/M', '', ''),
(719, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'COTO 63  DIAGONAL AL COMISARIATO', 'APROX.LA 2da CASA P.30 C/M', '', ''),
(720, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'COTO 63 CASA Nº 15524', '', '7899611', ''),
(721, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'BAMBEL UNO ENTRADA AL FONDO DE', 'MELINA ** FECHA DE PAGO 17 C/MES**', '8275636', ''),
(722, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD', 'LA GRANJA CAMPESINA BAMBEL 1', '', '2789-7630', ''),
(723, 'Cedula Fisica', 501890929, 'BOLAÑOS SOTO TRINIDAD.', 'COTO 63 DIAGONAL AL COMISARIATO CA-', 'SA-15524-  . P -30 C/M.', '789-', ''),
(724, 'Cedula Fisica', 500300699, 'BOLIVAR BOLIVAR MARCELINO', 'GOLFITO  LA MONA KMT 12 DEL BAR', 'LA RUEDA 100 MTS CASA A M. IZQUIERD', '7750552', ''),
(725, 'Cedula Fisica', 500300699, 'BOLIVAR BOLIVAR MARCELINO', 'GOLFITO  LA MONA KMT 12 DEL BAR', 'LA RUEDA 100 MTS CASA A M. IZQUIERD', '7750552', ''),
(726, 'Cedula Fisica', 602360920, 'BOLIVAR MORALES CONCEPCION', 'B* SAN MARTIN PASO CANOAS FRENTE A', 'LA IGLESIA CATOLICA', '8342-6252', ''),
(727, 'Cedula Fisica', 602980934, 'BONILLA ARGUEDAZ  XINIA', 'COTO 54 DETRAS DE LA PLANTA Nº13106', '** FECHA DE PAGO 2 CADA MES **', '7811576', ''),
(728, 'Cedula Fisica', 602980934, 'BONILLA ARGUEDAZ  XINIA', 'COTO 54 DETRAS DE LA PLANTA Nº13106', 'Telf: 2781-1697.', '8328-4982', ''),
(729, 'Cedula Fisica', 500380875, 'BONILLA BONILLA CARMEN', 'Bº EL CARMEN DE ABROJO 200 Mts N.', 'DE ASAMBLEAS DE DIOS. <P> 30 C/M', '', ''),
(730, 'Cedula Fisica', 900350823, 'BONILLA CONTRERAS AURIA CECILIA', 'Cortés Ciud.Pacheco cs Nº66 detrás', 'EBAIS Cel 8692-0817.', '2786-4272', ''),
(731, 'Cedula Fisica', 112080248, 'BONILLA HIDALGO JOSE LUIS', 'Punta Mala 1 km este Esc. Pta Mala.', 'telf: 8320-0645.', '', ''),
(732, 'Cedula Fisica', 301270388, 'BONILLA LORENZO CARLOS ENRIQUE.', 'PALMAR NORTE  CASA CURAL.', '', '7866184', ''),
(733, 'Cedula Fisica', 601440836, 'BONILLA MARTINEZ ANA LUISA', 'Ciudad Neily  Rio Nuevo casa 16 A.', '', '7836984', ''),
(734, 'Cedula Fisica', 601440836, 'BONILLA MARTINEZ ANA LUISA', 'Ciudad Neily  Rio Nuevo casa 16 A.', '', '2783-6984', ''),
(735, 'Cedula Fisica', 800420905, 'BONILLA MARTINEZ RAMON', 'Bº EL CARMEN CASA 276 DE IGLECIA', 'CATOLICA 400 OESTE. 7 C/M PENCION', '2783-3111', ''),
(736, 'Cedula Fisica', 600502810, 'BONILLA MORAGA MANUEL', 'FINCA 44 CONTIGUO A ESCUELA CONCORD', 'O ESCUELA CENTRAL C. MANO DERECHA', '7811001', ''),
(737, 'Cedula Fisica', 603130136, 'BONILLA ROJAS ANA YENCI', 'BAHIA BALLENA 250MTS DE LA ESC  FLO', 'R DE BAHIA', '8406-6109', ''),
(738, 'Cedula Fisica', 600950956, 'BONILLA TELLO VICTORIA', 'PAVOMES  LA ESPERANZA CASA COSTADO', 'SUR DE ABAST. LA ESPERANZA', '2776-8005', ''),
(739, 'Cedula Fisica', 108320400, 'BORBON GAMBOA RONAL GERARDO', 'COTO 52 EN EL COMISARITO', '** FECHA DE PAGO 1 DE CADA MES **', '7811158', ''),
(740, 'Cedula Fisica', 602080207, 'BORBON MELENDEZ SIDNEY.', 'RIO CLARO  CENTRO EN ABASTECEDOR', 'BORBON.', '', ''),
(741, 'Cedula Fisica', 104230605, 'BORBON PIEDRA GEORGINA', 'CASTAÑOS DE COTO 44 DE LA ENTRADA 1', 'KM HACIA LA ESCUELA', '7811406', ''),
(742, 'Cedula Fisica', 104230605, 'BORBON PIEDRA GEORGINA', 'Los Castaños  400 Mts antes de la', 'Esc. 8628-9662', '8628-9662', ''),
(743, 'Cedula Fisica', 900960388, 'BRANDO SANTAMARIA FELICITA', 'Calle a la Cuesta. 100 sur del Cole', 'gio. x Juan Herrera.', '2732-1890', ''),
(744, 'Cedula Fisica', 500690220, 'BRENES BOGARIN JOSE', 'Comte  La Unión  contiguo pulp. los', 'garrobos.', '8764-7029', ''),
(745, 'Cedula Fisica', 600951038, 'BRENES BRENES VICTOR JULIO', 'LA FORTUNA DE CONTE CARRETERA A', 'ZANCUDO CASA METIDA GRANDE.', '', ''),
(746, 'Cedula Fisica', 600951038, 'BRENES BRENES VICTOR JULIO', 'La fortuna Pavones de esc 200 Cs', 'al fondode madera celeste ', '2780-1487', ''),
(747, 'Cedula Fisica', 500990837, 'BRENES CASTILLO NOEMI', 'Laurel  Tamarindo  Fte Supermercado', '', '2780-1279', ''),
(748, 'Cedula Fisica', 500990837, 'BRENES CASTILLO NOEMY', 'TAMARINDO  FRENTE A SUPER DOS MIL', '', '', ''),
(749, 'Cedula Fisica', 202700675, 'BRENES GARITA ALEJANDRO', 'COTO 52 CASA Nº 10516 FTE PLANCHEL', '', '2781-1007', ''),
(750, 'Cedula Fisica', 900270338, 'BRENES PEREZ RITA', 'GOLFITO  3er FILA CASA 4221', 'BARRIO BELLA VISTA', '2775-0474', ''),
(751, 'Cedula Fisica', 602590268, 'BRENES PICADO ARACELLY', 'La Cuesta  Control 600m hacia Bruji', 'ta cs esquinera. Cel 8688-8980.', '2732-1670', ''),
(752, 'Cedula Fisica', 602920512, 'BRENES POTOY LORENA', 'pto jimenez dos brasos del tigre', 'soda el caiman', '', ''),
(753, 'Cedula Fisica', 602920512, 'BRENES POTOY LORENA', 'pto jimenez dos brasos del tigre', 'soda el caiman', '', ''),
(754, 'Cedula Fisica', 108710133, 'BRENES RODRIGUEZ JOSE LUIS', 'BAMBU AUN COSTADO OESTE DE LA PLAZA', 'DE DEPORTES', '8846-1853', ''),
(755, 'Cedula Fisica', 900250304, 'BRENEZ PEREZ RITA', 'Bº BELLA VISTA CASA # 4221', '<P> 03 C/M', '*-*-*-*', ''),
(756, 'Cedula Fisica', 602640386, 'BRICEÑO ALFARO MARIELSY', 'Bº BELLA VISTA CASA # 4377', '<P> BISEMANAL', '7750694', ''),
(757, 'Cedula Fisica', 601920619, 'BRICEÑO ALVAREZ RUTH', 'Coto 56 casa 11949 un costado Pulp.', '', '8793-3366', ''),
(758, 'Cedula Fisica', 500960118, 'BRICEÑO MONTOYA RAFAELA', 'C Neily  La Fortuna  fte plaza 500m', 'de calle.', '8944-1018', ''),
(759, 'Cedula Fisica', 602110011, 'BRIONES ATENCIO ARMANDO', 'Finca Puntarenas 125 N Escuela.', '', '8602-2191', ''),
(760, 'Cedula Fisica', 501240066, 'BRIONES LOPEZ EDWIN', 'Laurel  Km31  La Libertad 700 sur', 'Escuela. Cel 8606-2372', '2780-0591', ''),
(761, 'Cedula Fisica', 602100125, 'BRIONES SEQUEIRA ELIZABET', 'Laurel km 31 500m sur de Escuela', 'Cel 8796-2891.', '2780-1115', ''),
(762, 'Cedula Fisica', 502740155, 'BRIONES VILLAGRA ANGEL', 'Ciudad Cortes Urban Renacimiento Cs', '# E-23 Pulperia Sarita 8608-1572', '8510-3618', ''),
(763, 'Cedula Fisica', 603400106, 'BRIONES ZUÑIGA ERICKA GABRIELA', 'C.N. Centro Articulos Plásticos en', 'el puente.', '2783-3555', ''),
(764, 'Cedula Fisica', 113590507, 'BRISTAN BRISTAN ALFONSO', 'UN COSTADO DEL ANTIGUO BANCO', 'NACONAL  PUERTO JIMENEZ', '7355900', ''),
(765, 'Cedula Fisica', 600550870, 'BRISTAN BRISTAN ESTER MELBA', 'PUERTO JIMENEZ DE LA IGLESIA', 'CATOLICA 50 MTS ESTE C.C. AMARILLO', '', ''),
(766, 'Cedula Fisica', 606760067, 'BRISTAN BRISTAN JACOBA', 'P Jiménez Iglesia Católica 25m este', 'casa rosada.', '2735-5139', ''),
(767, 'Cedula Fisica', 602040489, 'BRISTAN BRISTAN JACOBA SIRLEY', 'P Jiménez  25m oeste Iglesia Católi', 'ca  cs rosada.', '2735-5337', ''),
(768, 'Cedula Fisica', 602040489, 'BRISTAN BRISTAN JACOBA SIRLEY', 'P Jiménez  25m oeste Iglesia Católi', 'ca  cs rosada.', '2735-5337', ''),
(769, 'Cedula Fisica', 602190324, 'BRISTAN BRISTAN JUANITA', 'PTO JIMENEZ URB. EL COLEG. 4TA', 'ENTRADA AL FONDO. CANCELA 13 C/M', '7355492', ''),
(770, 'Cedula Fisica', 602190324, 'BRISTAN BRISTAN JUANITA', 'P Jiménez  Urb El Colegio  cs E10', 'cc papaya. Cel 8827-2478.', '8827-2478', ''),
(771, 'Cedula Fisica', 601190199, 'BRISTAN BRISTAN MATILDE', 'PTO JIMENEZ. 150 M.ESTE', 'DE LA IGLESIA CATOLICA', '7355367', ''),
(772, 'Cedula Fisica', 601190199, 'BRISTAN BRISTAN MATILDE', 'PTO JIMENEZ  150 MTRS ESTE DE LA', 'IGLESIA CATOLICA', '7355367', ''),
(773, 'Cedula Fisica', 102790711, 'BUSTAMANTE RETANA ISMAEL.', 'CALLE A SAN JORGE DETRAS DE DONDE', 'WENDY CONTG A BAR ESCORPIO.', '732', ''),
(774, 'Cedula Fisica', 600440666, 'BUSTAVINO BUSTAVINO FERNANDO', 'CALLE APASO CANOAS Bº BETANIA', 'CASA METIDA AL LADO IZQUIERDO', '7322894', ''),
(775, 'Cedula Fisica', 601590093, 'BUSTILLOS VILLALTA WILLIAM', 'C. Neily  Registro Civil.', 'Bº Nuevo  Veracruz  cs 60.', '8617-3840', ''),
(776, 'Cedula Fisica', 270012236, 'BUSTO BUSTO JUSTO EMILIO', 'PASO CANOAS CONT A CABINAS EL PASO', 'VENDEDOR DE LOTERIA <P> 30 C/M', '', ''),
(777, 'Cedula Fisica', 500750790, 'BUSTOS BUSTOS ALEJANDRA', 'TINOCO DE LA PUERTA DEL SOL 200M EN', 'TRADA EN LA CURVA', '7752355', ''),
(778, 'Cedula Fisica', 500750790, 'BUSTOS BUSTOS ALEJANDRA', 'tinoco puerta del sol', '', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(779, 'Cedula Fisica', 602660344, 'BUSTOS BUSTOS ELIDA RUTH', 'P Canoas  Darizara  casa H-15.', '', '8742-4913', ''),
(780, 'Cedula Fisica', 601180473, 'BUSTOS BUSTOS MIGUEL', 'Ciudad Neily  Cabinas Kokis paga en', 'oficina    [Verdulero].', '2548505', ''),
(781, 'Cedula Fisica', 601180473, 'BUSTOS BUSTOS MIGUEL', 'SAN JOSE  TRABAJA EN MAS POR MENOS', 'GUARDA DE SEGURIDAD <P> DEP', '2548505', ''),
(782, 'Cedula Fisica', 401370636, 'BUSTOS BUSTOS RICARDO', 'Paso Canoas  Frente a cabinas', 'Victoria.', '7322232', ''),
(783, 'Cedula Fisica', 601660095, 'BUSTOS BUSTOS WALTER', 'CORTEZ B* JHANMET ZAPATERIA', '', '8743-2060', ''),
(784, 'Cedula Fisica', 500890362, 'BUSTOS LARA MARIA ADINA', 'LA VIQUILLA Nº 2 casa Nº 56', '', '', ''),
(785, 'Cedula Fisica', 500880275, 'BUSTOS LARA WALTER', 'De Zancudo Lodge  200 Mts Sur Cs de', 'Cemento Color Papaya ', '8505-5601', ''),
(786, 'Cedula Fisica', 202090668, 'BUSTOS OSES RAFAEL ANGEL', 'DEL ABASTECEDOR EL AHORRO 40MTS NOR', 'TE DETRAS DE ACERRADERO 8408/7801', '2780-1990', ''),
(787, 'Cedula Fisica', 101840766, 'BUSTOS RIVAS MELQUISEDETH', 'GOLFITO Kmt 16 D`ENTRAD ESC 100 M', 'SOBRE CARRETERA MANO IZQ <P> 03 C/M', '*-*-*-*', ''),
(788, 'Cedula Fisica', 500760266, 'BUZANO ACOSTA JOSE VICENTE', 'R Claro  La Esperanza  Tanque agua', 'cs esquinera del fondo.', '2789-8436', ''),
(789, 'Cedula Fisica', 600520639, 'CABALLERO CABALLERO CORNELIO', 'GOLFITO  KM 3 ENTRADA Bº HONG KON', '', '', ''),
(790, 'Cedula Fisica', 600520639, 'CABALLERO CABALLERO CORNELIO', 'GOLFITO  KM 3 DE  PULP TORRES 50 MT', 'A MANO IZQUIERDA', '7751302', ''),
(791, 'Cedula Fisica', 600520742, 'CABALLERO CABALLERO EMILIO', 'EL ROBLE FRENTE A LA ESCUELA', '<P> 30 C/M', '*-*-*-*', ''),
(792, 'Cedula Fisica', 601060650, 'CABALLERO CABALLERO FELICIANO', 'Paso Canoas 100 o. de  abarrotes', 'la tica.', '7323082', ''),
(793, 'Cedula Fisica', 601060650, 'CABALLERO CABALLERO FELICIANO', 'Paso Canoas  La Brigada fte Iglesia', 'Adventista. cs mixta azul con blanc', '2732-2382', ''),
(794, 'Cedula Fisica', 600940596, 'CABALLERO CHACON DISNARDA', 'P Jiménez  a un costado del Mall', 'Cel 8983-1761.', '2735-5383', ''),
(795, 'Cedula Fisica', 601500936, 'CABALLERO CHACON GEORGINA', 'Pto Jiménez Urb. S Lázaro  cc celes', 'te.', '8791-4681', ''),
(796, 'Cedula Fisica', 602030981, 'CABALLERO CHAVEZ WILBERT', 'Golfito Bº buenos Aires cost de igl', 'Rest familiar Cs Nº 6 / 2775-3361', '8732-5010', ''),
(797, 'Cedula Fisica', 601740873, 'CABALLERO COBA FERNANDA', 'PUEBLO CIVIL DE ABASTECEDOR JUDITH', 'CINCO CASAS A MANO IZQUIERDA', '7751222', ''),
(798, 'Cedula Fisica', 601031106, 'CABALLERO ESPINOZA MODESTO', 'COTO 63 CASA 15473', '', '7899784', ''),
(799, 'Cedula Fisica', 601031106, 'CABALLERO ESPINOZA MODESTO', 'Coto 63  Casa 15473', '', '7899784', ''),
(800, 'Cedula Fisica', 159000836, 'CABALLERO LEZCANO PETRA', 'Bº el Carmen de parada pampero 2da', 'Cs Color Verde.', '8699-5899', ''),
(801, 'Cedula Fisica', 102860722, 'CABALLERO MENA AGUSTIN', 'LA FUENTE 100 OESTE DE LA PLAZA DEL', 'DEPORTE', '2783-1014', ''),
(802, 'Cedula Fisica', 900660822, 'CABALLERO PEÑA SANTOS', 'CIUDADELA HERRERA LA MONA C. Nº9-G', 'FRENTE AL TELEFONO DEL FONDO', '7751555', ''),
(803, 'Cedula Fisica', 601330640, 'CABALLERO RIOS CARMEN', 'P Canoas  Betania  Entrada Puriscal', 'MD casa color rosada.', '2732-2444', ''),
(804, 'Cedula Fisica', 601860190, 'CABALLERO VALDEZ JERENILDO.', 'Bo el Carmen  50 E de pulp el cruce', 'reactivado por anibal el 10/03/11', '', ''),
(805, 'Cedula Fisica', 159100108, 'CABALLERO VALDEZ LEOPOLDO', 'Bº Carmen de Abrojo  200 m oeste de', 'la escuela. PAGA TRIMESTRAL.', '2783-2652', ''),
(806, 'Cedula Fisica', 602520027, 'CABALLERO VIGIL ELI ROGER', 'C Neily La Fortuna 300m N Taller', 'Siul.', '5005-0743', ''),
(807, 'Cedula Fisica', 601051035, 'CABALLERO VIGIL PAULA', 'Laurel  Naranjo  contiguo a Ferret.', '', '2780-0302', ''),
(808, 'Cedula Fisica', 800340082, 'CABEZAS QUESADA MIREYA', 'castaños', '', '', ''),
(809, 'Cedula Fisica', 800340082, 'CABEZAS QUESADA MIREYA', 'Entrada los Castaños de Coto 44.', '', '', ''),
(810, 'Cedula Fisica', 800340081, 'CABEZAS QUESADA MIREYA.', 'central campesina coto 44', '', '7811149', ''),
(811, 'Cedula Fisica', 602800697, 'CABEZAS QUESADA YENNI DEL CARMEN', 'Bella Luz  100 sur del E.B.A.I.S', 'reactivado por Anibal. 10/03/11', '8625-5866', ''),
(812, 'Cedula Fisica', 603930791, 'CABEZAS RUIZ KARLA', 'La campiña  800 Mts Norte de la esc', 'Cs al fondo amarilla  2776-6005', '8719-9801', ''),
(813, 'Cedula Fisica', 603610429, 'CABRERA COREA MARIANO', 'Palmar Fca 5  cs esquinera de plaza', 'cc amarilla.', '8643-4837', ''),
(814, 'Cedula Fisica', 600312493, 'CABRERA GRANDA ORLANDO JOAQUIN', 'PALMAR SUR  FINCA 5 C. Nº22-054', 'A 100 MTS NORTE DEL CLUB.', '7866868', ''),
(815, 'Cedula Fisica', 700640674, 'CABRERA JIMÉNEZ NIEVES CC BLANCA', 'C Cortés  Embarcadero  500 m oeste', 'de Pulpería.', '8678-1243', ''),
(816, 'Cedula Fisica', 104191095, 'CABRERA MORA ELIZABETH', 'GOLFITO URBANIZACION UREÑA CASA', '# A 15 P. 16 DE C/M', '*-*-*-*', ''),
(817, 'Cedula Fisica', 900950107, 'CACERES APONTE NORIS GERTRUDIZ', 'La Cuesta 150m sur Panadería Trigal', '', '2732-2135', ''),
(818, 'Cedula Fisica', 900950107, 'CACERES APONTE NORIS GERTRUDIZ', 'La Cuesta.150m sur Panadería Trigal', '', '2732-2135', ''),
(819, 'Cedula Fisica', 602140101, 'CACERES CACERES GILBERH', 'Golfito  1º Fila casa 4448A.', 'detras Lic. Ana. 8656-5946.', '2775-2787', ''),
(820, 'Cedula Fisica', 632300027, 'CACERES OROZCO EDUARDO', 'Golfito  Km1  lado B cs 4446 verde', 'oscuro  Cel 8656-8922.', '2775-3333', ''),
(821, 'Cedula Fisica', 601030044, 'CALDERON AGUILAR JOSE LUIS.', 'GOLFITO  I.N.V.U. KM 3 CASA 126.', '', '7750747', ''),
(822, 'Cedula Fisica', 601320112, 'CALDERON CALDERON MARIA ISABEL', 'laurel la bota pulperia el arco', 'del triunfo', '', ''),
(823, 'Cedula Fisica', 601320112, 'CALDERON CALDERON MARIA ISABEL.', 'La Cuesta; LA BOTA.', '<p> 15 c/m', '', ''),
(824, 'Cedula Fisica', 601660765, 'CALDERON MENDEZ MARTIN', 'CIUDAD NEILLY LA FORTUNA 50 MTS DE', 'PULP.FRANDY', '', ''),
(825, 'Cedula Fisica', 601660765, 'CALDERON MENDEZ MARTIN', 'SAN JOSE CIUDADELA OSCAR FELIPE', 'PAVAS LOMAS DEL RIO', '231', ''),
(826, 'Cedula Fisica', 202620272, 'CALDERON OVIEDO GILBERTH', 'C Cortés 200 M Megasuper fte al Gim', 'nasio. Cel 8422-7522   6011-7661.', '2788-8116', ''),
(827, 'Cedula Fisica', 200620272, 'CALDERON OVIEDO GILBERTO', 'C. Cortés Bº Renacimiento. casa A7.', '', '8898-1532', ''),
(828, 'Cedula Fisica', 202710625, 'CALDERON OVIEDO LUZ.', 'KILOMETRO 31 RIO CLARO CANTINA ANA.', 'P.LOS 6 C/M.', '', ''),
(829, 'Cedula Fisica', 601110967, 'CALDERON PEREZ LUZ ADILIA', 'Laurel  El Roble.', '', '7800423', ''),
(830, 'Cedula Fisica', 500430770, 'CALDERON ROJAS AMPARO', 'Ciudad Neily  50 Norte Plantas del', 'Ice; Ciudad Neily.', '7833306', ''),
(831, 'Cedula Fisica', 500430770, 'CALDERON ROJAS AMPARO', 'Ciudad Neily  50 Norte Plantas del', 'Ice; Ciudad Neily.', '7833306', ''),
(832, 'Cedula Fisica', 600166269, 'CALDERON SOLANO ALBERICO.', 'GOLFITO  PURRUJA DE LA ESCUELA 100', 'MTS. PAGA EL 16 DE CADA MES.', '775', ''),
(833, 'Cedula Fisica', 500830177, 'CALDERON TREJOS CANDIDA', 'la cuesta calle al cementerio', 'reactivado por anibal 10/03/11', '2732-2092', ''),
(834, 'Cedula Fisica', 601360778, 'CALERO AMAYA MARIA', 'Fca Guanacaste  400 oeste Escuela.', 'Cel 8482-6186.', '2786-3091', ''),
(835, 'Cedula Fisica', 700260355, 'CALERO CALERO EDWIN', 'Golfito La Mona  Diagonal a Pulp el', 'Bosque.', '2775-2531', ''),
(836, 'Cedula Fisica', 800690766, 'CALERO CALERO SANTOS MANUEL', 'La Cuesta Cuervito Bº Aurora  50 s', 'Pulp.PREGUNTAR Y COBRAR HIJO MIGUEL', '2732-3187', ''),
(837, 'Cedula Fisica', 601320353, 'CALERO GOMEZ MIGUEL', 'La Cuesta  Cuervito  Bº Aurora  50', 'sur pulp. cel 8921-2033.', '2732-2980', ''),
(838, 'Cedula Fisica', 601020073, 'CALLEJAS GUTIERREZ CESAR', 'GOLFITO Bº UREÑA CASA CONTG PULP EL', 'PARQUE O LOCAL # 5 DEP.<P> 03 Y 16', '', ''),
(839, 'Cedula Fisica', 601020073, 'CALLEJAS GUTIERREZ CÉSAR', 'Golfito  Res. Ureña  casa F-3 ó lo-', 'cal 39 Gollo.', '2775-0763', ''),
(840, 'Cedula Fisica', 601600120, 'CALLEJAS GUTIERREZ FULVIO NORB', 'GOLFITO URBANIZACION UREÑA CASA #B3', 'DETRAS DE LA ESCUELA.P.14 DE C/M', '', ''),
(841, 'Cedula Fisica', 501890940, 'CALVO AVILA JOSE MANUEL', 'Río Claro  La Esperanza  300 m de', 'la Escuela.', '', ''),
(842, 'Cedula Fisica', 220410084, 'CALVO BRENES MARIO', 'PUERTO JIMENEZ  DIAGONAL A', 'SERVICENTRO DE OSA', '7355032', ''),
(843, 'Cedula Fisica', 202410084, 'CALVO BRENES MARIO', 'P Jimenez  Diag servicentro Osa.', '', '2735-5032', ''),
(844, 'Cedula Fisica', 301170271, 'CALVO FERNANDEZ NOEMY.', 'GOLFITO  Bº LLANO BONITO.', 'P. 27 C/M', '7751087', ''),
(845, 'Cedula Fisica', 301170271, 'CALVO FERNANDEZ NOEMY.', 'GOLFITO  Bº LLANO BONITO.', 'P. 27 C/M', '7751087', ''),
(846, 'Cedula Fisica', 301490820, 'CALVO FERNANDEZ RUTH', 'GOLFITO INVU.K.3 CASA N. 26', '', '', ''),
(847, 'Cedula Fisica', 310020945, 'CALVO FERNANDEZ YOLANDA', 'LA MONA 150 MTS ANTES DE PULP', 'Bº MEXICO.', '7750253', ''),
(848, 'Cedula Fisica', 301020945, 'CALVO FERNANDEZ YOLANDA.', 'GOLFITO LA MONA  DEL RANCHO LA', 'AMISTAD 500 MTS CALLE A GOLFO.', '7750253', ''),
(849, 'Cedula Fisica', 501140213, 'CALVO MORA MARIA DEL CARMEN', 'km 30 Pulperia cinco esquinas', '', '7898189', ''),
(850, 'Cedula Fisica', 601040735, 'CAMACHO ALCOCER BLANCA', 'C.N. Bº SAN RAFAEL FRENTE AL SALON', 'COMUNAL. <P> OFICINA', '783-51', ''),
(851, 'Cedula Fisica', 601040735, 'CAMACHO ALCOCER BLANCA', 'C.N. Bº SAN RAFAEL FRENTE AL SALON', 'COMUNAL. <P> OFICINA', '783-51', ''),
(852, 'Cedula Fisica', 500840048, 'CAMACHO CHAVARRIA HONORIO', 'Piedras Blancas  Fca Alajuela  de', 'Escuela la Navidad  Cntg Coopetriun', '8958-3203', ''),
(853, 'Cedula Fisica', 501080814, 'CAMACHO ESPINOZA DAVID', 'Palmar Tinoco 75m Este Esc. Iglesia', 'Asambleas de Dios.', '2786-3114', ''),
(854, 'Cedula Fisica', 900380253, 'CAMACHO FLORES LUCIO', '', '', '', ''),
(855, 'Cedula Fisica', 980380253, 'CAMACHO FLORES LUCIO', 'DE PUENTE RIO COLORADITO 1 KMT CALL', 'A PASO CANOAS M. IZQ C.BLANCA', '7834283', ''),
(856, 'Cedula Fisica', 900380253, 'CAMACHO FLORES LUCIO', 'P Canoas  300 Oeste Parqueo Fronbus', 'Desp Barrio Carmen.', '', ''),
(857, 'Cedula Fisica', 600740138, 'CAMACHO LOAICIGA LETICIA.', 'CIUDAD CORTES DE SODA EL REY 1OO', 'ESTE                      .', '', ''),
(858, 'Cedula Fisica', 600740138, 'CAMACHO LOAICIGA LETICIA.', 'CIUDAD CORTES DE SODA EL REY 1OO', 'ESTE                      .', '', ''),
(859, 'Cedula Fisica', 600800220, 'CAMACHO LOAICIGA SALVADOR.', 'CIUDAD CORTES', '', '', ''),
(860, 'Cedula Fisica', 600981153, 'CAMACHO SANCHEZ ELIETH', 'RESIDENCIAL UREÑA POR LA ESCUELA', 'CASA D-1 VERDE GOLFITO', '7750201', ''),
(861, 'Cedula Fisica', 602290710, 'CAMACHO SOLANO WILLIAM', 'El Carmen de Abrojo.', '', '2783-6264', ''),
(862, 'Cedula Fisica', 602290710, 'CAMACHO SOLANO WILLIAM', 'C Neily  Coloradito contiguo al pre', 'dio Buses de P. Canoas.', '8699-9132', ''),
(863, 'Cedula Fisica', 600961397, 'CAMAÑO SANTAMARIA MARIA CRISTINA', 'BAR DE PLAYA BLANCA  250 MTS SUR CA', 'MPING TOSERNAGA', '2735-1638', ''),
(864, 'Cedula Fisica', 270717253, 'CAMBRONERO CAMBRONERO ROSA', 'NO SE REGISTRO.', '', '', ''),
(865, 'Cedula Fisica', 270717253, 'CAMBRONERO CAMBRONERO ROSA', 'LA FORTUNA  FTE A LIC. ORBELINA', 'SOBRE CARRETERA INTERAMERICANA', '7834004', ''),
(866, 'Cedula Fisica', 270717253, 'CAMBRONERO CAMBRONERO ROSA', 'Ciudad Neily La Fortuna fte. a', 'casa de Lic. Orbelina', '7834004', ''),
(867, 'Cedula Fisica', 601610054, 'CAMBRONERO CAMBRONERO WILY', 'CIUDAD NEILY  Bº EL PROGRESO', 'POR DONDE MASIS.', '', ''),
(868, 'Cedula Fisica', 108040853, 'CAMBRONERO DURAN RAFAEL ANGEL', 'K3 200 MTS S PULP EL BOTONCITO', '<P>  03 C/M', '7750252', ''),
(869, 'Cedula Fisica', 502540354, 'CAMBRONERO GOMEZ DANIEL', 'Copa Buena  detras ant Sankey. cc/', 'papaya. 8740-2849.', '8603-4530', ''),
(870, 'Cedula Fisica', 112250238, 'CAMBRONERO GOMEZ ESDRAS JOSUE', 'Agua Buena S Gabriel  400m norte de', 'la Bomba.', '8731-1861', ''),
(871, 'Cedula Fisica', 603500979, 'CAMBRONERO GUIDO ROGER', 'DRAQUE RESTAURANT. JADE MAR  //', 'PALMAR SUR.', '', ''),
(872, 'Cedula Fisica', 603500979, 'CAMBRONERO GUIDO ROGER', 'DRAKE BAJO REST MAR Y SOMBRA GORRO', '', '8646-5009', ''),
(873, 'Cedula Fisica', 202670293, 'CAMPOS ARCE JAIME LUIS', 'CAMPO TRES AGUA BUENA 800 Mts', 'DE LA ESCUELA', '', ''),
(874, 'Cedula Fisica', 202670293, 'CAMPOS ARCE JAIME LUIS', 'CAMPO TRES AGUA BUENA 800 Mts', 'DE LA ESCUELA', '', ''),
(875, 'Cedula Fisica', 202670293, 'CAMPOS ARCE JAIME LUIS.', '\"CAMPO \"\"3\"\" 800MTS DE LA ESCUELA.\"', '', '', ''),
(876, 'Cedula Fisica', 601120801, 'CAMPOS ARGUEDAS OLDEMAR.', 'LAUREL VERE 500 MTS NORTE 150 OESTE', 'DE PULP. LA ESMERALDA.P-30 C/M.', '', ''),
(877, 'Cedula Fisica', 601120801, 'CAMPOS ARGUEDAS OLDEMAR.', 'LAUREL VERE 500 MTS NORTE 150 OESTE', 'DE PULP. LA ESMERALDA.P-30 C/M.', '', ''),
(878, 'Cedula Fisica', 601120801, 'CAMPOS ARGUEDAS OLDEMAR.', 'LAUREL VERE500 MTS NORTE 150 OESTE', 'DE PULP. LA ESMERALDA.P-30 C/M.', '', ''),
(879, 'Cedula Fisica', 900560331, 'CAMPOS ARGUEDAS OLGA', 'SALAS VINDAS 400 N.SEGUNDA ENTRADA', 'O RESTAURANT 31X2', '7835039', ''),
(880, 'Cedula Fisica', 201230644, 'CAMPOS ARIAS Mº ANTONIA', 'Barrio el Carmen de Abrojo Casa #30', '', '', ''),
(881, 'Cedula Fisica', 600570682, 'CAMPOS BRENES CATALINA', 'C.NEILY 22 DE OCTUBRE CASA #18', 'BLOQUE 1 P 28 C/M.', '', ''),
(882, 'Cedula Fisica', 600570682, 'CAMPOS BRENES CATALINA.', 'SIQUIRRES BºSAN RAFAEL 200 MTS NORT', 'DE LA PLAZA.LIMON.', '768', ''),
(883, 'Cedula Fisica', 601210126, 'CAMPOS CERDAS ROSARIO', 'BAHIA BALLENA ENTRADA 50MTS ROTULO', 'ALQUILER', '8898-4024', ''),
(884, 'Cedula Fisica', 603600907, 'CAMPOS CHACON KATTIA VANESSA', 'Sabalito 150 N y75 E de mini super', '5 esquinas  8343-3742', '2773-4345', ''),
(885, 'Cedula Fisica', 110090903, 'CAMPOS DURAN MARLEN', 'RIO INCENDIO DE LAS CARRETAS 1 KM', 'HACIA INCENDIO CASA VERDE POSTE LUZ', '7838213', ''),
(886, 'Cedula Fisica', 603000742, 'CAMPOS FUENTES SAIDIA', 'URBANIZACIO BARRIGONES CASA N*/ 18', '', '', ''),
(887, 'Cedula Fisica', 900900520, 'CAMPOS GARCIA MARIA ELENA', 'CORTES  OJO DE AGUA URB JANNETH', 'PACHECHO CASA 65 C.VERDE', '7887037', ''),
(888, 'Cedula Fisica', 108100672, 'CAMPOS GARRO ALVARO', 'CAUCHO OFICINAS COOPETRABASUR', '<P> 15 C/M', '7750946', ''),
(889, 'Cedula Fisica', 603200466, 'CAMPOS GOMEZ KATTIA', 'PALMAR NORTE FCA. 3 DETRAS DE ANTIG', 'OFICINA * PAGO 20 CADA MES ***', '', ''),
(890, 'Cedula Fisica', 501290838, 'CAMPOS HIDALGO EMILCE', '', '', '', ''),
(891, 'Cedula Fisica', 501290838, 'CAMPOS HIDALGO EMILCE', 'GOLFO  Bº BELLA VISTA CASA Nº 4294', '', '7751731', ''),
(892, 'Cedula Fisica', 501290838, 'CAMPOS HIDALGO EMILCE', 'Golfito B Vista detrás Escuela Cen-', 'tral. cs 4294.', '2775-1855', ''),
(893, 'Cedula Fisica', 500910429, 'CAMPOS LUNA ALFONSO.', 'CONTIGUO AL PUENTE DE LA VACA.', 'P.LOS 30/M.', '', ''),
(894, 'Cedula Fisica', 501290309, 'CAMPOS LUNA JUAN DE DIOS', 'BELLE LUZ  CONTG PUENTE LA VACA', '<P> 30 C/M', '', ''),
(895, 'Cedula Fisica', 501290309, 'CAMPOS LUNA JUAN DE DIOS', 'La vaca 125 mts del puente calle a', 'punta zancudo', '7800000', ''),
(896, 'Cedula Fisica', 501290309, 'CAMPOS LUNA JUAN DE DIOS', 'La Vaca  125 mts del puente calle a', 'Zancudo  Reactivado por Anibal.', '2783-8082', ''),
(897, 'Cedula Fisica', 501290309, 'CAMPOS LUNA JUAN DE DIOS', 'PUNTE LA VACA 100MTS CARRETERA ZANC', 'UDO', '2783-8082', ''),
(898, 'Cedula Fisica', 900460257, 'CAMPOS MENDEZ IRIS', '', '', '', ''),
(899, 'Cedula Fisica', 113360711, 'CAMPOS MORA DAYANA', 'R Claro Bambel 3  500m Noreste Abas', 'Garbanzo.', '8967-5587', ''),
(900, 'Cedula Fisica', 601810971, 'CAMPOS MORA FELIX', '', '', '', ''),
(901, 'Cedula Fisica', 602167060, 'CAMPOS MORA MARTIN', 'Pto Jiménez  150 m Sur del Angar.', 'Telf: 8624-2561.', '', ''),
(902, 'Cedula Fisica', 101200002, 'CAMPOS NUÑEZ JOSE MARIA', 'RIO CLARO KMT 31 PUPL EL PUENTE', '', '', ''),
(903, 'Cedula Fisica', 600720542, 'CAMPOS SALAS ABELINO', 'Km 16  Las Trenzas  Fte Salón Comun', 'al. Telf: 2780-1521.', '', ''),
(904, 'Cedula Fisica', 600720542, 'CAMPOS SALAS ABELINO.', 'NAZARET DE GOLFITO  600 MTS DE LA', 'ESCUELA.', '', ''),
(905, 'Cedula Fisica', 600720542, 'CAMPOS SALAS ABELINO.', 'NAZARET DE GOLFITO  600 MTS DE LA', 'ESCUELA.', '', ''),
(906, 'Cedula Fisica', 600670810, 'CAMPOS SALAS FLORENTINO', 'LA FLORIDA NAZARET DE GOLFITO', 'DIAGONAL A LA PLAZA.', '', ''),
(907, 'Cedula Fisica', 601000611, 'CAMPOS SALAS TEODORICO.', 'GOLFITO  KM 16 COSTADO NORTE DE LA', 'ESCUELA.', '', ''),
(908, 'Cedula Fisica', 603260910, 'CAMPOS SALAZAR ARIANNY', '\"P Canoas  Darizara  Pulp \"\"Y\"\"\"', 'Cel 8847-0630.', '2732-3595', ''),
(909, 'Cedula Fisica', 700680590, 'CAMPOS SALAZAR FLOR', 'CIUDADELA GUAYCARA CASA Nº 3', 'DETRAS DEL PLANTEL DEL I.C.E.', '', ''),
(910, 'Cedula Fisica', 104240740, 'CAMPOS SEGURA MATILDE', '100 Mts AL NORTE DE LA PULP. ISABEL', 'CHINAMO DONDE PEPE WAN CHAN P 15', '*-*-*-*', ''),
(911, 'Cedula Fisica', 800550198, 'CAMPOS TELLEZ OFELIA', 'GOLFITO PBLO CIVIL  DE BAR CHICA', 'PICA 125 MTS ESTE.', '2775-048', ''),
(912, 'Cedula Fisica', 900670063, 'CAMPOS TIFFER XINIA MARIA', 'Bº SAN JUAN GOLFITO O SODA DEL HOSP', '<P> 03 Y 16 C/M', '', ''),
(913, 'Cedula Fisica', 602180657, 'CAMPOS VALENCIANO DALILA', 'Golfito  Km20 Cs 57. Cel 8759-4867', '', '2789-9050', ''),
(914, 'Cedula Fisica', 601920742, 'CAMPOS VALENCIANO SEDY Mª', 'GOLFITO Bº MADRIGAL LA MONA DE PULP', 'FANK100 N. Y 25 OESTE CANCELA 16 C/', '2775-5242', ''),
(915, 'Cedula Fisica', 601920742, 'CAMPOS VALENCIANO SEIDY', 'Golfito La Mona La Madrigal  Pulp', 'Frank 200m norte 25 oeste.', '8666-0210', ''),
(916, 'Cedula Fisica', 603200682, 'CAMPOS VALVERDE YEIMY', 'P Jiménez 2 brazos  Pulp Tucán', '8786-9010', '8808-3891', ''),
(917, 'Cedula Fisica', 105070461, 'CAMPOS VARGAS ROSA', 'PULPERIA SANTA DUVIGEDES', 'PASO CONOAS .', '-', ''),
(918, 'Cedula Fisica', 105070461, 'CAMPOS VARGAS ROSA', 'P Canoas Calle a la cuesta. 75m Bar', 'Internacional. Cel 8927-8832.', '2732-1217', ''),
(919, 'Cedula Fisica', 601260905, 'CAMPOS VILLAFUERTE SARA', 'LA AURORA HEREDIA', '', '391548', ''),
(920, 'Cedula Fisica', 601790911, 'CAMPOS VINDAS GERARDO', 'GOLF Bº SAN JUAN 2do PUENTE CASA', '# 6 <P> 03 C/M', '775', ''),
(921, 'Cedula Fisica', 401200154, 'CAMPOS VINDAS JUAN MIGUEL', 'GOLFITO  Bº SAN JUAN CRUZANDO PUENT', 'CRUZANDO PUENTE O HTEL CIERRA 03C/M', '', ''),
(922, 'Cedula Fisica', 401200154, 'CAMPOS VINDAS JUAN MIGUEL', 'GOLFITO  Bº SAN JUAN CRUZANDO PUENT', 'CRUZANDO PUENTE O HTEL CIERRA 03C/M', '', ''),
(923, 'Cedula Fisica', 401200154, 'CAMPOS VINDAS JUAN MIGUEL', 'Golf Bº San Juan detras del colegio', '8569-1394 telf HIJA', '8651-2260', ''),
(924, 'Cedula Fisica', 601590843, 'CAMPOS VINDAS MANUEL', 'GOLFITO B` SAN JUAN 2do PUENTE.', '.P. primer cobro de c/m', '775', ''),
(925, 'Cedula Fisica', 601590843, 'CAMPOS VINDAS MANUEL', 'Golfito  barrio San Juan detrás del', 'Colegio.', '', ''),
(926, 'Cedula Fisica', 601590843, 'CAMPOS VINDAS MANUEL', 'Golfito  barrio San Juan detrás del', 'Colegio.    8629-9139', '8557-2074', ''),
(927, 'Cedula Fisica', 500560550, 'CANALES AMPIE PAULINO CC POLONCHO', 'C cortés  150m norte Escuela Noro-', 'bosqui.', '2788-8007', ''),
(928, 'Cedula Fisica', 500560550, 'CANALES AMPIE PAULINO CC POLONCHO', 'C cortés  150m norte Escuela Noro-', 'bosqui.', '2788-8007', ''),
(929, 'Cedula Fisica', 601180982, 'CANALES BERRIOS ROBERTO', 'Residencial Ureña  Casa D-6 frente', 'al Telf Público.', '7751204', ''),
(930, 'Cedula Fisica', 602090106, 'CANO GONZALEZ JOSE LUIS', 'LAUREL  INVU JUNTO AL TEMPLO', 'CORDERO DE DIOS <P> 30 C/M', '7750979', ''),
(931, 'Cedula Fisica', 602090106, 'CANO GONZALEZ JOSE LUIS', 'LAUREL  INVU JUNTO AL TEMPLO', 'CORDERO DE DIOS <P> 30 C/M', '7750979', ''),
(932, 'Cedula Fisica', 270921613, 'CANO OBANDO PETRONA', 'DRAKE ENTRADA X FINCA DE DON CARMEN', 'QUIROS FINCA LA PERLA CANCELA 11 C/', '', ''),
(933, 'Cedula Fisica', 602220223, 'CARAZO FALLAS ARTURO', 'C Neily 200m O Mercado. cc Naranja', 'Cobrar DLCG local 43. Cel 8812-3399', '2783-3996', ''),
(934, 'Cedula Fisica', 601700461, 'CARAZO GRANERA EIDA', 'Kmt 12 Bº Mexico 100 M Pulp Mexico', 'Trabaja en Coope Reina', '7751425', ''),
(935, 'Cedula Fisica', 601700461, 'CARAZO GRANERA EIDA', 'Kmt 12 Bº Mexico 100 M Pulp Mexico', 'Trabaja en Coope Reina', '7751425', ''),
(936, 'Cedula Fisica', 602180790, 'CARAZO GRANERA ELVA', 'golfito kilometro 7 Manuel Tucler C', 'casa f-14 * FECHA DE PAGO 16 C/MES*', '7755407', ''),
(937, 'Cedula Fisica', 603160835, 'CARAZO QUESADA HENRY', 'Laurel  Río Incendio 300 m este de', 'la escuela.', '8987-4943', ''),
(938, 'Cedula Fisica', 700320164, 'CARBALLO CANTILLO CARLOS', 'CIUDADELA MADRIGAL KMT 12 CONTIGUO', 'A IGLES MINISTERIO CASA DEL BANQUET', '7750396', ''),
(939, 'Cedula Fisica', 103390213, 'CARBALLO NUÑEZ FRANKLIN', 'CORONADO DE OSA EN SODA CORONADO', '', '7865516', ''),
(940, 'Cedula Fisica', 302260373, 'CARBALLO SOLANO ANABELLE', 'CORTES 200MTS AL ESTE DEL ANTIGUO', 'HOSPITAL CASA MADERA UNAPLANTA', '2788-8746', ''),
(941, 'Cedula Fisica', 500970873, 'CARBONERO HERNANDEZ ANGEL', 'RIO C.KL 33 D\' LA PLAZA 100', 'MT SUR', '', ''),
(942, 'Cedula Fisica', 602690069, 'CARDENAS AGUILAR LAUREANO', 'BARRIDO  CORONADO DE COTO DE LA', 'PULPEL CRUCE 150 MTS AL ESTE.', '', ''),
(943, 'Cedula Fisica', 602690069, 'CARDENAS AGUILAR LAUREANO', 'Laurel Entrada Peral MI 600m de Es-', 'cuela. Cel 8443-8785.', '8785-9464', ''),
(944, 'Cedula Fisica', 602220033, 'CARDENAS AGUILAR MARTA FRANCISCA', 'LA CAMPIÑA DONDE JOSE ANTONIO REYES', 'CONTG A PULP LA ESTRELLA <P> 18 C/M', '', ''),
(945, 'Cedula Fisica', 104670405, 'CARDENAS MENA JESUS', 'SABALO DE SIERPE FRET. SALON COMUNA', 'AL', '', ''),
(946, 'Cedula Fisica', 603200988, 'CARDENAS PORRAS ANA GABRIELA', 'Rio Claro  colonia la Luz del Mundo', 'o en Veterinaria el Corcel.', '7753015', ''),
(947, 'Cedula Fisica', 601270575, 'CARDENAS ZUÑIGA JOSE RAUL', 'PALMA REAL BLOQUE G CASA *55', '89644504', '8750-4422', ''),
(948, 'Cedula Fisica', 201200436, 'CARMONA CARMONA JUAN', 'LAUREL  CASAS DEL I.N.V.U.', '', '', ''),
(949, 'Cedula Fisica', 600790071, 'CARMONA HERNANDEZ APARICIO', 'RIO CLARO DETRAS DE PLANTAS DEL IEC', '', '3631494', ''),
(950, 'Cedula Fisica', 600790071, 'CARMONA HERNANDEZ APARICIO', 'R Claro  Res ICE  50 m este Taller', 'Mainor. Cel 8796-7857.', '2789-8704', ''),
(951, 'Cedula Fisica', 601000412, 'CARMONA HERNANDEZ GUADALUPE', '25 MTS ESTE DE LA CRUZ ROJA', '', '', ''),
(952, 'Cedula Fisica', 600830837, 'CARMONA MORA MIRIAN', 'PLAZA CANOAS  CIUDADELA EL TRIUNFO', 'EN LA PULPERIA FRENTE A LA ESCUELA', '7322701', ''),
(953, 'Cedula Fisica', 502420879, 'CARMONA PONCE WILFREDO', 'Cuervito  200 mts antes del Comando', 'casa mixta color marron P. 15 C/M.', '', ''),
(954, 'Cedula Fisica', 600390296, 'CARMONA VILLEGAS MILTON', '', '', '', ''),
(955, 'Cedula Fisica', 601380647, 'CARRANZA CAMBRONERO JOSE', 'R Claro  bambell 3 entr al ranchito', '1 Kmt al fondo ultima Cs. al fondo', '8685-9625', ''),
(956, 'Cedula Fisica', 600370493, 'CARRANZA CAMBRONERO MIGUEL', 'CIUDAD NEILY  CIUDADELA EL TRIUNFO', 'FTE A CAPILLA EVANGELICA', '', ''),
(957, 'Cedula Fisica', 600390828, 'CARRANZA CHAVARRIA PETRONILA', 'LAUREL Bº SAINO  CS 19', '', '8612-6258', ''),
(958, 'Cedula Fisica', 301170552, 'CARRANZA MEDINA REBECA', 'La Cuesta  C Tamayo B17  Cll antes', 'la torre  x 3º entrada cs esquinera', '2732-3134', ''),
(959, 'Cedula Fisica', 101670064, 'CARRANZA SOSA MANUEL', 'GOLFITO COSTADO NORTE DE MUNIC.', 'CASA EN EL CERRO', '7751161', ''),
(960, 'Cedula Fisica', 501860938, 'CARRANZA VILLALOBOS LUCIA', 'S Vito La Pintada  200m Salon el Se', 'villano  cs Rosada.', '2773-4713', ''),
(961, 'Cedula Fisica', 603600504, 'CARRILLO  BELLIDO JAQUELINE', 'Purruja entrada a las gradas frte', 'al parque c.verde oscuro (Jungla).', '', ''),
(962, 'Cedula Fisica', 603600504, 'CARRILLO BELLIDO JACQUELINE', 'km 12 la mona de golfito entrada ca', 'rrion casa verde esquinera', '', ''),
(963, 'Cedula Fisica', 501670144, 'CARRILLO CARRILLO BENEDICTO', 'SANTA LUCIA 1500 Mts AL NORTE DE', 'LA ESCUELA <P> 20 C/M', '*-*-*-*', ''),
(964, 'Cedula Fisica', 500810111, 'CARRILLO CARRILLO JESUS', 'Rio Claro  la viquillas Nº2 en pulp', 'La GUANACASTECA  2789-7371', '8311-4602', ''),
(965, 'Cedula Fisica', 500570442, 'CARRILLO CARRILLO MARCELO', '', '', '', ''),
(966, 'Cedula Fisica', 500670664, 'CARRILLO CASTILLO JOSE TOMAS', 'PAVONES 1era CASA A LA DERECHA ENTR', 'A PAVONES', '', ''),
(967, 'Cedula Fisica', 600490726, 'CARRILLO CONCEPCION BRAULIA', 'GOLFITO  EL HIGUERON EN EL RANCHO', 'FRENTE AL FERRI.', '', ''),
(968, 'Cedula Fisica', 602270916, 'CARRILLO CONCEPCION ERLIS', 'La Cuesta cdela Fernandez Zumbado', 'casa # 6 o escuela Finca Mango', '', ''),
(969, 'Cedula Fisica', 603300013, 'CARRILLO JIRON ALEXANDER', 'SANTA LUCIA 500 M. NORTE FTE AL', 'MANSANO..proximo 13 febrero 2010..', '', ''),
(970, 'Cedula Fisica', 603300013, 'CARRILLO JIRON ALEXANDER', 'Santa Lucia 500 Mts N frente al', 'Manzano ', '2780-1013', ''),
(971, 'Cedula Fisica', 500890425, 'CARRILLO LOPEZ ELPIDIO.', 'CANGREJO VERDE CASA DE JIRON PEREZ', 'BEATRIZ. 20 c/m', '*-*-*-*', ''),
(972, 'Cedula Fisica', 501940341, 'CARRILLO LOPEZ FELIX', 'TIGRILLO DE CONTE', '* 15 CADA MES *', '', ''),
(973, 'Cedula Fisica', 501320542, 'CARRILLO LOPEZ SANTOS.', 'SANTA LUCIA DE LA VACA 1 KMT. DE', 'LA ESCUELA C.C.AMAR.EN LA CHANCHERA', '', ''),
(974, 'Cedula Fisica', 502510955, 'CARRILLO MONTIEL PABLO', 'Zancudo  Contiguo la Luz del Mundo', '2776-0206', '8723-2813', ''),
(975, 'Cedula Fisica', 702250947, 'CARRILLO PEREZ GEISON ANDREY', 'Drake  Supermercado Sta FE en drake', 'centro  8579-1219', '8629-7776', ''),
(976, 'Cedula Fisica', 600540717, 'CARRILLO SANCHEZ ROLBIN.', 'BAJO DE LOS INDIOS.', '', '', ''),
(977, 'Cedula Fisica', 600540717, 'CARRILLO SANCHEZ ROLVIN', 'Ciudad Neily bajo los indios', '', '', ''),
(978, 'Cedula Fisica', 502580478, 'CARRILLO VALENCIA BELEIDA', 'P Canoas S Jorge 100m y 25 Sur de', 'Abast. Isabael. Cel 8614-2772.', '2732-1828', ''),
(979, 'Cedula Fisica', 501920594, 'CARRILLO VALENCIA JOSE LIDIER.', 'KMT 25 LA NUVIA FRENTE A LA IGLE-', 'SIA CATOLICA.P.15/C/M.', '', ''),
(980, 'Cedula Fisica', 900680785, 'CARTIN CORDERO GEOVANNY', 'CIUDAD NEILY.PELUQERIA', 'CARTIN', '8865324', ''),
(981, 'Cedula Fisica', 606930137, 'CARTIN VASQUEZ ANGELA', 'Paso Canoas; D`PULP DE MARINA CARTI', '150 CALLE A SAN JORGE.C.ESQ P.25 CM', '', ''),
(982, 'Cedula Fisica', 606930137, 'CARTIN VASQUEZ ANGELA', 'Paso Canoas; D`PULP DE MARINA CARTI', '150 CALLE A SAN JORGE.C.ESQ P.25 CM', '', ''),
(983, 'Cedula Fisica', 600930137, 'CARTIN VASQUEZ ANGELA', 'PASO CANOAS 100 MTS NORTE DE PULP', 'DOS HERMANDOS <P> 30 C/M', '732', ''),
(984, 'Cedula Fisica', 600930137, 'CARTIN VASQUEZ ANGELA', 'P Canoas 100 N City Mall.', 'Cel 8897-5449.', '2732-1505', ''),
(985, 'Cedula Fisica', 601060637, 'CARVAJAL BLANCO ADELA', 'GOLFITO BARRIO BELLA VISTA CASA #81', 'TRAB. DEL Bº BELLA VISTA.', '750438', ''),
(986, 'Cedula Fisica', 600990247, 'CARVAJAL GONZALEZ GABRIEL', 'LAS FINCAS PAGA EN OFIC.', '', '', ''),
(987, 'Cedula Fisica', 600990247, 'CARVAJAL GONZALEZ GABRIEL', 'LAS FINCAS PAGA EN OFIC.', '', '', ''),
(988, 'Cedula Fisica', 600990247, 'CARVAJAL GONZALEZ JOSE GABRIEL', 'COTO 47  CASA 11771 O COMPAÑIA', 'INSTRUSTRIAL ACEITERA', '7811212', ''),
(989, 'Cedula Fisica', 603040347, 'CARVAJAL LOPEZ REBECA', 'Agua Buena  150 Mts Este de Bomba', 'Movieva Ciudadela Imas  8963-8704', '2734-0059', ''),
(990, 'Cedula Fisica', 602340774, 'CARVAJAL PIEDRA ISMAEL', '', '', '', ''),
(991, 'Cedula Fisica', 400530022, 'CARVAJAL RAMOS DANILO', 'GOLFITO  Bº BELLA VISTA ENTRADA FRT', 'A SODA EL BARCO 3er FILA CASA 4236', '7751305', ''),
(992, 'Cedula Fisica', 500800041, 'CASANOVA CASANOVA ROBERTO', 'ABROJO NORTE  DEL BAR RANCHEROS', '2 KILOMETROS.', '', ''),
(993, 'Cedula Fisica', 602250959, 'CASCANTE AVILA ALBERTO', 'El Higuerón de Golfito.', '', '', ''),
(994, 'Cedula Fisica', 602250959, 'CASCANTE AVILA ALBERTO', 'Golfito  Llano Bonito Urb. Oasis de', 'Esperanza. Casa # 90.', '3635641', ''),
(995, 'Cedula Fisica', 602400975, 'CASCANTE AVILA EDUARDO', 'GOLFITO LA MONA EN BAR EL MONO CASA', 'Nº H2 ** FECHA DE PAGO 16 C/MES **', '8228081', ''),
(996, 'Cedula Fisica', 601810254, 'CASCANTE CASCANTE ANDRES', 'C. CORTES EL RENECIMIENTO CASA 11-E', '100 MTS O.DE PULP. SARITA ...', '', ''),
(997, 'Cedula Fisica', 601810254, 'CASCANTE CASCANTE ANDRES', 'Ciudad Cortes Bº renacimiento', '', '8844-5554', ''),
(998, 'Cedula Fisica', 601670170, 'CASCANTE CASCANTE HERIBERTO', 'ENTRADA A SAN JUAN EN SODA ERIKA', '* FECHA DE PAGO 11 CADA MES **', '8460251', ''),
(999, 'Cedula Fisica', 108090003, 'CASCANTE GOMEZ GERARDO ALBERTO', 'Laurel  Caucho  200 oeste ofic. Coo', 'petrabasur. Tel 2783-3757.', '2780-0214', ''),
(1000, 'Cedula Fisica', 600700701, 'CASCANTE HERNANDEZ MARLENE', 'GOLFITO  CIUDADELA MADRIGAL 100 SUR', 'DE LA CASETILLA  o DEP LIBRE TARGET', '', ''),
(1001, 'Cedula Fisica', 103750132, 'CASCANTE JIMENEZ ROBERTO', 'RIO CLARO KM 37 SAN MIGUEL EN PULP.', '', '', ''),
(1002, 'Cedula Fisica', 500890261, 'CASCANTE MANZANARES MANUEL', 'Ciudadela Madrigal de Pulp BºMexico', 'segunda entrada.', '', ''),
(1003, 'Cedula Fisica', 500890261, 'CASCANTE MAZANARES MANUEL', 'CIUDADELA MADRIGAL DE PULP Bº MEXIC', '2da ENTRADA O DONDE LOS CARBALLOS', '7755134', ''),
(1004, 'Cedula Fisica', 103390398, 'CASCANTE PADILLA HUGO', '', '', '', ''),
(1005, 'Cedula Fisica', 103390398, 'CASCANTE PADILLA HUGO', 'Golfito  Km1  detrás Migración  fte', 'Escuela. Cel 8790-4218.', '2775-1562', ''),
(1006, 'Cedula Fisica', 602190967, 'CASCANTE QUESADA RAFAEL', 'Coto 52 casa 1500', '', '8719-4719', ''),
(1007, 'Cedula Fisica', 500500733, 'CASTAÑEDA PIZARRO AGUSTINA', 'PIEDAS BLANCAS KMT 45 <P>  19 C/M', '', '', ''),
(1008, 'Cedula Fisica', 603730113, 'CASTAÑEDA VARGAS OLGER', 'KM 1 5º FILA X CASA NIÑEZ 1º CS DER', 'CAJERA DE LOCAL 28.', '8141254', ''),
(1009, 'Cedula Fisica', 601370092, 'CASTELLON ARAUZ CORINA.', 'Abrojo  Barrio el Carmen  Lote 2.', 'a un costado del parquesito.', '9452422', ''),
(1010, 'Cedula Fisica', 500550023, 'CASTELLON LOPEZ MAXIMO', 'Bº BETANIA CONTIGUO A BUSES DE', 'FELIX LOPEZ', '2732-1929', ''),
(1011, 'Cedula Fisica', 500245155, 'CASTELLON RUIZ FAVIAN', 'SAN JUAN CUATROBOCAS DE LA ESCUELA', 'LABRADOR DOS CASA. LA CUESTA', '', ''),
(1012, 'Cedula Fisica', 601410786, 'CASTILLO ALVAREZ GREGORIA', 'Laurel  km24  600 norte  Cs MD made', 'ra.', '8781-1066', ''),
(1013, 'Cedula Fisica', 602010350, 'CASTILLO ALVAREZ ISABEL', 'SANTA CECILIA COMEDOR ESCOLAR', 'Puerto Jiménez.', '', ''),
(1014, 'Cedula Fisica', 602010350, 'CASTILLO ALVAREZ ISABEL', 'SANTA CECILIA COMEDOR ESCOLAR', 'Puerto Jiménez.', '', ''),
(1015, 'Cedula Fisica', 602390089, 'CASTILLO ARTAVIA HILDA', 'UVITA CENTRO AUN COSTADO IGLESIA', 'CATOLICA CASA VERDE AGUA DE MADERA', '8956-8770', ''),
(1016, 'Cedula Fisica', 501441278, 'CASTILLO BRIONES JOSE', '', '', '', ''),
(1017, 'Cedula Fisica', 506700045, 'CASTILLO BRIONES JOSE LIONCIO', 'Laurel  San Juan de la Escuela Jobo', '700 Norte.', '', ''),
(1018, 'Cedula Fisica', 600320691, 'CASTILLO CALVO RAFAEL ANGEL', 'LAS FINCAS COTO 44 CASA #23572', 'FRENTE AL CLUB DE TRABAJADORES', '', ''),
(1019, 'Cedula Fisica', 500870395, 'CASTILLO CARAVACA BEIDY', 'fca alajuela  de coopetriunfo 500 m', 'noreste casa color natural', '3672276', ''),
(1020, 'Cedula Fisica', 500870395, 'CASTILLO CARAVACA DEIDY', 'Fca Alajuela  500 Mts Sur Este de', 'Coopetriunfo ', '2741-1179', ''),
(1021, 'Cedula Fisica', 600380384, 'CASTILLO CASTILLO BENEDICTA', 'RIO NUEVO  CASA 41-A', '', '7835297', ''),
(1022, 'Cedula Fisica', 600430120, 'CASTILLO CASTILLO LEONICIA', 'Barrio San Jorge  500 mts E de', 'la plaza y 200 Norte. P 30 C/M', '', ''),
(1023, 'Cedula Fisica', 600430120, 'CASTILLO CASTILLO LEONICIA', 'Barrio San Jorge  500 mts E de', 'la plaza y 200 Norte. P 30 C/M', '', ''),
(1024, 'Cedula Fisica', 600440386, 'CASTILLO CASTILLO LORENZO', 'POTRERO DE SIERPE', '', '8360855', ''),
(1025, 'Cedula Fisica', 600440386, 'CASTILLO CASTILLO LORENZO', 'POTRERO DE SIERPE', '', '8359-8985', ''),
(1026, 'Cedula Fisica', 900840636, 'CASTILLO CASTILLO MARITZA', 'RIO CLARO GOLFITO MUEBLERIA ZUMBADO', 'FRENTE PARADA DE TAXI <P> 27 C/M', '759424', ''),
(1027, 'Cedula Fisica', 900480636, 'CASTILLO CASTILLO MARITZA', 'RIO CLARO MUEBLERIA ZUMBADO FRETE', 'PARADA DE TAXIS <P> 03 C/M', '2789-9224', ''),
(1028, 'Cedula Fisica', 501900487, 'CASTILLO CERDAS ELIZABETH', 'Pto Jiménez  Sándalo  casa contiguo', 'al abogado.', '', ''),
(1029, 'Cedula Fisica', 501900487, 'CASTILLO CERDAS ELIZABETH', 'PTO JIMENEZ SANDALO CONTIGUO CS DEL', 'ABOGADO', '2200-4017', ''),
(1030, 'Cedula Fisica', 46130119, 'CASTILLO ESPINOZA KARLA', 'Comte  Urba amapolas C.No 68 o en', 'Zancudo Restaurant Sol y Mar.', '7768902', ''),
(1031, 'Cedula Fisica', 406130119, 'CASTILLO ESPINOZA KARLA', 'Comte  Urb Amapolas cs 68 o Zancudo', 'Rest Sol y Mar.', '2776-0902', ''),
(1032, 'Cedula Fisica', 601590550, 'CASTILLO GUTIERREZ DIOSELINA Mª', 'Bº Betania  300 Mts antes de llegar', 'al tajo camino a la gloria.', '8754-3524', ''),
(1033, 'Cedula Fisica', 601030510, 'CASTILLO HERNANDEZ MAGADALENA.', 'GOLFITO Bº BELLA VISTA', '', '', ''),
(1034, 'Cedula Fisica', 601030510, 'CASTILLO HERNANDEZ MAGDALENA', 'GOLF Bº BELLA VISTA CASA # 4213', 'U HOSPITAL <P> 03 C/M', '775', ''),
(1035, 'Cedula Fisica', 601030510, 'CASTILLO HERNANDEZ MAGDALENA', 'GOLF Bº BELLA VISTA CASA # 4213', 'U HOSPITAL <P> 03 C/M', '775', ''),
(1036, 'Cedula Fisica', 602080816, 'CASTILLO HERRERA GUILLERMO', 'Cortes  contig a Cabinas el oasis y', 'la Corte  reacti. tel. 7888949.', '2788-8949', ''),
(1037, 'Cedula Fisica', 602340988, 'CASTILLO JIMENEZ JOSELITO', 'COPA BUENA RESIDENCIAL KENNEDY', 'PULP EL COMERCIO', '8972-5305', ''),
(1038, 'Cedula Fisica', 602700216, 'CASTILLO MADRIGAL LIDIA', 'S Vito S Rita 800m E Igl Luz dl Mun', 'do. Cel 8747-2878 Cob Imprenta Romo', '2773-4932', ''),
(1039, 'Cedula Fisica', 601450211, 'CASTILLO MENDOZA JUAN', 'pulperia los higuerones.', '45', '2962026', ''),
(1040, 'Cedula Fisica', 602700885, 'CASTILLO PARRA YORLENY', 'P Canoas  Veracruz  cs81 verde/ama-', 'rillo. Cel 8949-0044.', '5703-3484', ''),
(1041, 'Cedula Fisica', 602980048, 'CASTILLO ROJAS GUISELLE', 'GOLFITO INVU KM 3 CONTIGUO A PLAZA', 'EN SODA MAGGI ** CANC. 3 C/MES **', '7750173', ''),
(1042, 'Cedula Fisica', 602980048, 'CASTILLO ROJAS GUISELLE', 'SODA MAGUI KM3  O PURRUJA 10 MTS', 'ABST. LEA CASA DOS PLANTAS', '7750173', ''),
(1043, 'Cedula Fisica', 602360927, 'CASTILLO ROJAS ISABEL', 'Golfito  La Mona  detrás Escuela;', '100m telf público.', '2775-2405', ''),
(1044, 'Cedula Fisica', 602080522, 'CASTILLO SABORIO JHONNY', 'CHACARITA BOMBA CORCOVADO O CONTG A', 'CANTINA EL CLAVO CALLE A PALMAR P 6', '', ''),
(1045, 'Cedula Fisica', 155804945, 'CASTILLO SANTANA DAMARIS', 'CENTRAL CAMPESINA LADO TRASERO DE', 'IGLESIA EL ALFA', '8749-5237', ''),
(1046, 'Cedula Fisica', 601220096, 'CASTILLO VILLAFUERTE JOSE', 'Coto 58 frente a la Esc ', '', '8640-3494', ''),
(1047, 'Cedula Fisica', 600320705, 'CASTRILLO AGUILAR ANA GRACE', 'Pavones  Cuervito 2km Sureste de la', 'Escuela. Cel 8771-0', '2776-8167', ''),
(1048, 'Cedula Fisica', 500870781, 'CASTRILLO CASTRILLO EDUVINA', 'Laurel  Tamarindo  Bar 2000  300m', 'norte.', '8667-8595', ''),
(1049, 'Cedula Fisica', 500800706, 'CASTRILLO CASTRILLO LORENZO', 'CUERVITO DE PAVONES CONTIGUO A', 'LA ESCUELA', '', ''),
(1050, 'Cedula Fisica', 500800706, 'CASTRILLO CASTRILLO LORENZO', 'Comte  La Esperanza  frente a super', 'Loaiza.', '2776-8136', ''),
(1051, 'Cedula Fisica', 500800706, 'CASTRILLO CASTRILLO LORENZO', 'Comte  La Esperanza  fre al Super', 'Loaiza. Cel 8600-6189.', '2776-8136', ''),
(1052, 'Cedula Fisica', 600690376, 'CASTRILLO MONTOYA BOLIVAR', 'Estrella  Comte  50 antes rio Tigri', 'to casa al fondo cobrar al hijo Rea', '', ''),
(1053, 'Cedula Fisica', 601130213, 'CASTRILLO SEQUEIRA NARCISA', '', '', '', ''),
(1054, 'Cedula Fisica', 601220096, 'CASTRILLO VILLAFUERTE JOSE', 'COTO 58  CONTIGUO AL COMISARIATO', 'CASA Nº 11342.', '', ''),
(1055, 'Cedula Fisica', 601220096, 'CASTRILLO VILLAFUERTE JOSE', 'COTO 58  CONTIGUO AL COMISARIATO', 'CASA #11342', '', ''),
(1056, 'Cedula Fisica', 602980483, 'CASTRO ALCOCER JEIMY', 'Villa Colón de Osa  a costado Rest.', 'Terra Nostra.', '8753-6239', ''),
(1057, 'Cedula Fisica', 104090191, 'CASTRO BARQUERO IRENE', 'FCA JALACA ABASTEC. LA COMPETENCIA', 'P. EL 19 C/MES.', '', ''),
(1058, 'Cedula Fisica', 500970393, 'CASTRO CALVO ANGEL', '', '', '', ''),
(1059, 'Cedula Fisica', 500970393, 'CASTRO CALVO ANGEL', 'Bo el Carmen  300 mts este de', 'entrada a manu', '7836125', ''),
(1060, 'Cedula Fisica', 600310793, 'CASTRO CASTRO CANDELARIO', 'FINCA GUANACASTE  FRENTE A LA', 'ESCUELA 25 MTS ESTE.', '', ''),
(1061, 'Cedula Fisica', 600310793, 'CASTRO CASTRO CANDELARIO', 'Finca Guanacaste  frente a la escue', 'la.', '2786-3020', ''),
(1062, 'Cedula Fisica', 501030444, 'CASTRO CASTRO GENARO', 'P Canoas La Argentina 2km hacia a-', 'dentro del Retiro  cs celeste.', '8899-7223', ''),
(1063, 'Cedula Fisica', 105830161, 'CASTRO CASTRO MARVIN A.', 'PTO JIMENEZ B. BONITO 300M.', 'DESPUES DEL PUENTE TERRONES', '', ''),
(1064, 'Cedula Fisica', 105830161, 'CASTRO CASTRO MARVIN A.', 'PTO JIMENEZ B. BONITO 300M.', 'DESPUES DEL PUENTE TERRONES', '', ''),
(1065, 'Cedula Fisica', 601440947, 'CASTRO CESPEDES SANTOS', 'DRAKE ABAST. DRAKE CALLE A LOS', 'PLANES * CANCELA 11 C/MES *', '', ''),
(1066, 'Cedula Fisica', 203540886, 'CASTRO CHACON FERNANDO', 'Sabalito  S Antonio frnt delegacion', 'policial  2784-5031 / 8545-6566', '8940-1586', ''),
(1067, 'Cedula Fisica', 602390142, 'CASTRO CHAVARRIA ALEX', 'P Jiménez fte Cementerio a un costa', 'do de Alfa Romeo.', '5007-6730', ''),
(1068, 'Cedula Fisica', 601070617, 'CASTRO CHINCHILLA CARLOS', 'DE LA ESCUELA DE ROBLE 500 MTS', 'HACIA DON PITO P.25 C/M.', '', ''),
(1069, 'Cedula Fisica', 201120221, 'CASTRO DUARTE RAFAEL PEDRO', 'CIUDAD NEILY  DEL 31X2 100 MTS CONT', 'A CABINAS DE BEITA.', '', ''),
(1070, 'Cedula Fisica', 602370190, 'CASTRO ESTELLER GOEVANNY', 'PASO CANOAS LOTES CARTIN', '', '8944-4168', ''),
(1071, 'Cedula Fisica', 101950768, 'CASTRO FALLAS MIGUEL ANGEL', 'LA PALMA DE Pto JIMENEZ 1 Kmt S 700', 'ESTE Y 200 S D` COMISARIATO <P> 11', '', ''),
(1072, 'Cedula Fisica', 101950768, 'CASTRO FALLAS MIGUEL ANGEL', 'La Palma Pto Jiménez  1 km Este del', 'Taller Ceibo  entrada antes del tal', '', ''),
(1073, 'Cedula Fisica', 602420312, 'CASTRO FERNANDEZ ISABEL', 'LA VIQUILLAN Nº 2 CONTIGUO A LA', 'LA IGLESIA', '', ''),
(1074, 'Cedula Fisica', 106740581, 'CASTRO GODINEZ LIGIA', 'Sabalito  S Antonio Contg Asambleas', 'de DIOS  2784-0261 / 8664-6434', '8804-4621', ''),
(1075, 'Cedula Fisica', 108370291, 'CASTRO GOMEZ WENDY', 'CANOAS 300 M N Y 25 OEST TAXI CARGA', 'FRET PULP Hnos RODRIGUEZ <P> 30 C/M', '732', ''),
(1076, 'Cedula Fisica', 108370291, 'CASTRO GOMEZ WENDY', 'CANOAS 300 M N Y 25 OEST TAXI CARGA', 'FRET PULP Hnos RODRIGUEZ <P> 30 C/M', '732', ''),
(1077, 'Cedula Fisica', 602770092, 'CASTRO HERNANDEZ MAURICIO', 'PALMAR SUR ANGAR SIPA Nº1', '', '', ''),
(1078, 'Cedula Fisica', 602770092, 'CASTRO HERNANDEZ MAURICIO', 'PALMAR SUR ANGAR SIPA Nº1', 'ANGAR CONTIGUO A AEROPUERTO', '', ''),
(1079, 'Cedula Fisica', 601500284, 'CASTRO JIMENEZ MARIA ANGELA', 'LA MONA. URB. CIUDADELA MADRIGAL', 'CASA 37 COSTADO IGLECIA ZACARIANA', '7750055', ''),
(1080, 'Cedula Fisica', 601500284, 'CASTRO JIMENEZ MARIA ANGELA', 'Golfito Ciud Madrigal C Nº38 costad', 'Iglesia Zacariana. 2775-0065', '', ''),
(1081, 'Cedula Fisica', 601500460, 'CASTRO MADRIGAL ANGEL', 'coto 50 casa 10733', '', '', ''),
(1082, 'Cedula Fisica', 503110368, 'CASTRO MADRIGAL ELVIS QUEYLOR', 'Laurel  Vereh del cruce 800m cll a', 'cariari. cs MI. Cel 8946-9670.', '8946-9670', ''),
(1083, 'Cedula Fisica', 202790915, 'CASTRO MENDEZ SAUL', 'UVITA CENTRO CALLE AL PARQUE AL FTE', 'DE BUNGALOS BALLENA', '8827-5272', ''),
(1084, 'Cedula Fisica', 602610753, 'CASTRO MEZA MANUEL', 'S Vito 300 Antes EBAIS Gutierrez', 'P Crus Roja S.Vito  8732-7820', '8946-2741', ''),
(1085, 'Cedula Fisica', 203510400, 'CASTRO MORA GRACE', 'A Buena  Valle Azul  100m norte cru', 'ce de cañas  cs celeste', '8943-3009', ''),
(1086, 'Cedula Fisica', 105500755, 'CASTRO MORA LUIS ALBERTO', 'Canoas Bº San Gil calle San Martin', 'Vende Guarapo en Canoas cc Licho.', '2732-3239', ''),
(1087, 'Cedula Fisica', 601280524, 'CASTRO MOYA ALEJANDRINA', 'DARIZARA', '*** CANCELA 1 Y 15 C/MES **', '7811132', ''),
(1088, 'Cedula Fisica', 601280524, 'CASTRO MOYA ALEJANDRINA', 'La Gamba 25m MD de puesto policial.', '*** CANCELA 1 Y 15 C/MES **', '2741-8140', ''),
(1089, 'Cedula Fisica', 600450968, 'CASTRO MOYA BELLANIRA', 'La Gamba  detrás de MINAET.', '', '2741-8140', ''),
(1090, 'Cedula Fisica', 900420443, 'CASTRO MOYA VICTOR', 'Golfito  Km 37  Las Gambas.', '', '', ''),
(1091, 'Cedula Fisica', 303170105, 'CASTRO NUÑEZ CARLOS', 'BELLA LUZ 1 KM. NORTE  DEL BAR LAS', 'CARRETAS..', '7838001', ''),
(1092, 'Cedula Fisica', 501140887, 'CASTRO NUÑEZ URBANO', 'ZANDALO DE PULP BURUNBUN 75 N.', 'C. DE MADERA C. CREMA', '7708207', ''),
(1093, 'Cedula Fisica', 600360005, 'CASTRO PEREZ JUAN DE DIOS', 'BEREH DE LAUREL FCA. ERNESTO CASTRO', '', '2780-0589', ''),
(1094, 'Cedula Fisica', 603640005, 'CASTRO PEREZ JUAN DE DIOS', 'BEREH DE LAUREL', '', '', ''),
(1095, 'Cedula Fisica', 900690095, 'CASTRO PORRAS RAUL', 'El carmen de Violey 700 N calle al', 'colegio ', '8431-7663', ''),
(1096, 'Cedula Fisica', 270151167, 'CASTRO RIVERA ELENA', 'LA CUESTA  150 OESTE DEL MATADERO', 'MUNICIPAL', '', ''),
(1097, 'Cedula Fisica', 201250933, 'CASTRO ROJAS LIDIMA (MIMA)', 'GOLFITO  Bº PARROQUIAL DETRAS DE', 'SODA SANTA MARTA', '7750037', ''),
(1098, 'Cedula Fisica', 201250933, 'CASTRO ROJAS LIDIMA (MIMA)', 'GOLFITO  Bº PARROQUIAL DETRAS DE', 'SODA SANTA MARTA', '7750037', ''),
(1099, 'Cedula Fisica', 201250933, 'CASTRO ROJAS LIDIMA (MIMA)', 'Golfito  Bº Parroquial  of Contador', 'Público al fondo cs verde c amarill', '2775-0037', ''),
(1100, 'Cedula Fisica', 501630041, 'CASTRO SANCHEZ DANIEL', 'Sierpe de OSA contiguo asambleas de', 'DIOS  2788-1421', '8870-2725', ''),
(1101, 'Cedula Fisica', 502200671, 'CASTRO SEGURA GENARO.', 'COLORADO  LA ARGENTINA DE ENTRADA', 'AL RETIRO 1 Y MEDIO KMT. MANO.IZQ', '8654-8465', ''),
(1102, 'Cedula Fisica', 201940234, 'CASTRO SIBAJA PABLO', 'CIUDAD NEILY Bº LA FUENTE 50 MTS', 'ANTES DE ESCUELA..', '', ''),
(1103, 'Cedula Fisica', 101451289, 'CASTRO SOLORZANO DANILO', 'VALLE AZUL DE AGUA BUENA 150 MTS N', 'DEL SALON VERSALLES.', '*-*-*-*', ''),
(1104, 'Cedula Fisica', 980047081, 'CASTRO VALVERDE ALVARO', 'DRAKE PROGRESO DE DRAKE PULP', 'LA GUACAMAYA', '2775-1478', ''),
(1105, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN', 'SODA MUELLESITO GOLFITO.', 'P. 16 C/M', '7355078', ''),
(1106, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN', 'SODA MUELLESITO GOLFITO.', 'P. 16 C/M', '7355078', ''),
(1107, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN', '125 MTS ESTE DE BAR AGUA LUNA  Pto', 'Jimènez. 11 C/M', '7355078', ''),
(1108, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN', 'CAÑASA 600M O. DE LA ESCUELA', '', '', ''),
(1109, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN.', 'PUERTO JIMENEZ  125 MTS DEL', 'RESTAURANTE AGUA LUNA.', '7355078', ''),
(1110, 'Cedula Fisica', 900370527, 'CASTRO VASQUEZ EDWIN.', 'PUERTO JIMENEZ 125 MTS ESTE BAR', 'AGUA LUNA.', '7355446', ''),
(1111, 'Cedula Fisica', 601210572, 'CASTRO VILCHEZ ERNESTO', 'BERE DE LAUREL 1800 MTS DE LA', 'ESCUELA JAZMIN CASA M. IZQUIERDA', '7800589', ''),
(1112, 'Cedula Fisica', 601210572, 'CASTRO VILCHEZ ERNESTO', 'bereh de laurel', '', '', ''),
(1113, 'Cedula Fisica', 601210572, 'CASTRO VILCHEZ HERNESTO', 'BERE DE LAUREL 1800 MTS DE LA', 'ESCUELA JAZMIN CASA M. IZQUIERDA', '', ''),
(1114, 'Cedula Fisica', 601210572, 'CASTRO VILCHEZ HERNESTO.', 'BERE DE LAUREL 1800. M DE LA ESCUEL', 'CASA DE CEMENTO SIN PINTAR M.IZQUI.', '', ''),
(1115, 'Cedula Fisica', 603120150, 'CASTRO VILLALTA SHIRLEY', 'P Jiménez  La Palma  Tienda Ropa', 'Americana  Fte Cabinas el Tucán.', '8510-3484', ''),
(1116, 'Cedula Fisica', 600810492, 'CATON BALTODANO ANA LUISA.', 'KILOMETRO 1 SALA DE BELLEZA NOHELI.', '', '', ''),
(1117, 'Cedula Fisica', 116833503, 'CATON BALTODANO CLEOTILDE', 'CASA *87.KM 3 GOLFITO', '', '7751442', ''),
(1118, 'Cedula Fisica', 116833503, 'CATON BALTODANO CLOTILDE', 'HOTEL LAS GAVIOTAS O EN KM 3', 'CASA #87 CONTG A HANG.P 03 Y 16 C/M', '', ''),
(1119, 'Cedula Fisica', 116833503, 'CATON BALTODANO CLOTILDE', 'HOTEL LAS GAVIOTAS O EN KM 3', 'CASA #87 CONTG A HANG.P-03 C/M.', '775', ''),
(1120, 'Cedula Fisica', 109790886, 'CEBAS JIMENEZ KEMBLY', 'CIUD EL TRIUNFO casa G-17.', 'Telf: 2732-1781.', '2732-2274', ''),
(1121, 'Cedula Fisica', 280576337, 'CEDEÑO BEITA ERUNDINO', 'LA CUESTA CONT. FAB.DE', 'ROTULOS.', '7322095', ''),
(1122, 'Cedula Fisica', 280576337, 'CEDEÑO BEITA ERUNDINO', 'LA CUESTA CONTG. FABRICA DE ROTULOS', '** FECHA DE PAGO 10 CADA MES **', '7322095', ''),
(1123, 'Cedula Fisica', 600610863, 'CEDEÑO CEDEÑO CIPRIANO', 'P Jiménez Rincón  Vanegas.', '', '8699-9470', ''),
(1124, 'Cedula Fisica', 601450635, 'CEDEÑO CEDEÑO CONZUELO', 'GOLFITO  CASA Nº 4154', '', '7750114', ''),
(1125, 'Cedula Fisica', 601450637, 'CEDEÑO CEDEÑO CONZUELO', 'GOLFITO  Llano Bonito casa Nº 41', 'Cabinas Heredianas 100 Este.', '7750114', ''),
(1126, 'Cedula Fisica', 600600945, 'CEDEÑO CEDEÑO ESTELA MARIA', 'RIO CLARO   BAMBEL Nº 2 DE LA', 'ESCUELA BRUNCA 400 M. ESTE', '7898728', ''),
(1127, 'Cedula Fisica', 600600945, 'CEDEÑO CEDEÑO ESTELA MARIA', 'RIO CLARO BAMBEL 2 400M. DE LA', 'BRUNCA', '', ''),
(1128, 'Cedula Fisica', 600270832, 'CEDEÑO CEDEÑO JOSE ANGEL CC REMIGIO', 'Coto 63 costado este de la escuela.', 'cs Nº 15456', '8973-0031', ''),
(1129, 'Cedula Fisica', 600710336, 'CEDEÑO CEDEÑO SANTIAGA', 'PASO CANOAS 75 MT ESTE DE ESCUELA.', '* CANCELA 8 CADA MES *', '', ''),
(1130, 'Cedula Fisica', 600610863, 'CEDEÑO CEDEÑO SIPRIANO', 'RINCON DE OSA  VANEGAS CARRETERA A', 'PUERTO JIMENEZ.', '', ''),
(1131, 'Cedula Fisica', 600610863, 'CEDEÑO CEDEÑO SIPRIANO', 'RINCON DE OSA  VANEGAS CARRETERA A', 'PUERTO JIMENEZ.', '', ''),
(1132, 'Cedula Fisica', 600610863, 'CEDEÑO CEDEÑO SIPRIANO', 'RINCON DE OSA  VANEGAS CARRETERA A', 'PUERTO JIMENEZ.', '', ''),
(1133, 'Cedula Fisica', 900070672, 'CEDEÑO CERDAS MARIA ESTER', 'LAUREL', '', '', ''),
(1134, 'Cedula Fisica', 600610863, 'CEDEÑO DECEÑO CIPRIANO', 'PTO. JIMENEZ RINCON DE OSA', 'VANEGAS .', '', ''),
(1135, 'Cedula Fisica', 603500105, 'CEDEÑO DIAZ ALEXANDRA', 'P Jiménez  El Bambú  Entrada 2º cs', 'MD. Cel 8842-8824.', '2735-5059', ''),
(1136, 'Cedula Fisica', 600470558, 'CEDEÑO ESCOBAR BLAS', 'PASO CANOAS  Bº SAN JORGE 400 METS', 'DE LA GALLINERA 25 N 300 N DE IGLES', '', ''),
(1137, 'Cedula Fisica', 600470558, 'CEDEÑO ESCOBAR BLAS', 'PASO CANOAS  Bº SAN JORGE 400 METS', 'DE LA GALLINERA 25 N 300 N DE IGLES', '', ''),
(1138, 'Cedula Fisica', 600510291, 'CEDEÑO ESCOBAR OTILIO', 'CONTROL DE LA CUESTA; SODA-PULP', 'LA BELLA <P> 15 C/M', '732', ''),
(1139, 'Cedula Fisica', 603480538, 'CEDEÑO ESPINOZA MELISSA', 'P Canoas  Triunfo  cs D10 azul. 200', 'sur pilp. Maná.', '2732-3055', ''),
(1140, 'Cedula Fisica', 600990339, 'CEDEÑO GOMEZ JUAN', '', '', '', ''),
(1141, 'Cedula Fisica', 600990339, 'CEDEÑO GOMEZ JUAN', 'R Claro Bambel 1  Pulp. Jardín 250m', 'norte. Cel 8812-5797.', '2789-8685', ''),
(1142, 'Cedula Fisica', 601570184, 'CEDEÑO HERNANDEZ  ELBA', 'PTO. JIMENEZ 50 MTS AL S.E. DE IGL.', 'CATOLICA  CANCELA 12 CADA  MES', '', ''),
(1143, 'Cedula Fisica', 601840633, 'CEDEÑO HERNANDEZ ENRIQUE', 'P Jiménez Agujas 250 S Escuela. Cs', 'verde. Soldadura.', '', ''),
(1144, 'Cedula Fisica', 602500543, 'CEDEÑO HERNANDEZ LISBETH', 'P Jiménez diagonal a Servicentro.', 'Trabaja en Fuerza Pública.', '2735-5360', ''),
(1145, 'Cedula Fisica', 600730150, 'CEDEÑO MARTINEZ MILAGROS', 'LA PALMA DE LAUREL HERMANA DE', 'ERUNDINO *CANCELA 15 C/MES *', '', ''),
(1146, 'Cedula Fisica', 600540056, 'CEDEÑO NIETO MARIELOS', '', '', '', ''),
(1147, 'Cedula Fisica', 602220883, 'CEDEÑO PORRAS ROSA', 'Golfito  Urb Daniel Herr casa G4', 'Rest Canto del Tucan 8908-0786', '2775-5196', ''),
(1148, 'Cedula Fisica', 603600085, 'CEDEÑO TEJADA TOMAS', 'P Jiménez  fte BM  casa esquinera.', 'a la par de la bomba.', '2735-5806', ''),
(1149, 'Cedula Fisica', 603850632, 'CENTENO BRIONES SHARON', 'URBANIZACION LOS CERRITOS CASA *23', '8520-9112', '8558-1987', ''),
(1150, 'Cedula Fisica', 501390001, 'CENTENO CENTENO JOSE LUIS', 'Pavones  R Claro  Las Vegas  ultima', 'cs fibrolit.', '2776-2219', ''),
(1151, 'Cedula Fisica', 104650647, 'CENTENO CENTENO MARIA', 'P Jiménez Bambú 600 m de Pulp.', 'o el tigre soda frte plaza.', '2735-2541', ''),
(1152, 'Cedula Fisica', 500790800, 'CENTENO MARTINEZ JORGE', 'PALMAR SUR  75 M. ESTE DE LA PULPER', 'IA CERDAS; DETRAS DEL ESTADIO', '8857-6048', ''),
(1153, 'Cedula Fisica', 602550280, 'CENTENO MARTINEZ PIO', 'PUERTO JIMENEZ CIUDAD NEGRA', '', '', ''),
(1154, 'Cedula Fisica', 602980273, 'CENTENO ROSALES EDUARDO', 'PIEDRAS BLANCAS AGENCIA TRACOPA', '', '7411103', ''),
(1155, 'Cedula Fisica', 600490412, 'CENTENO SANTAMARIA ISIDORA', 'LA CUESTA.', '', '', ''),
(1156, 'Cedula Fisica', 600490412, 'CENTENO SANTAMARIA ISIDORA', 'La Cuesta centro 200mts de la', 'guardia rural calle ala palma.', '7322963', ''),
(1157, 'Cedula Fisica', 600490412, 'CENTENO SANTAMARIA ISIDORA', 'La Cuesta contiguo Salon del Reino', 'T. Jehová.', '2732-2092', ''),
(1158, 'Cedula Fisica', 502808463, 'CENTENO ZAMORA Mª LUISA.', 'LA MONA KMT Nº12 DE GILFITO FRENTE', 'AL BAR LA RUEDA.', '', ''),
(1159, 'Cedula Fisica', 502880463, 'CENTENO ZAMORA Mª LUISA.', 'LA MONA KMT Nº12 DE GOLFITO 100 MTS', 'DE BAR LA RUEDA M.IZQ EN EL BAJO.', '6613761', ''),
(1160, 'Cedula Fisica', 603200793, 'CERCEÑO CERCEÑO ANA YENSI', 'La Escuadra  500m sur Escuela.', '', '2776-8272', ''),
(1161, 'Cedula Fisica', 600480122, 'CERCEÑO MORALES MARIA ROSA', 'Km 31  200 m Esc. calle a Tamarindo', '', '2780-0426', ''),
(1162, 'Cedula Fisica', 600480122, 'CERCEÑO MORALES MARIA ROSA.', 'KMT 31 200 MTS DE LA ESCUELA CARRE-', 'TERA A ZANCUDO.P-15 C/M.', '', ''),
(1163, 'Cedula Fisica', 602090655, 'CERDAS CAMPOS DANIEL', 'Los Castaños.', '', '8944-6043', ''),
(1164, 'Cedula Fisica', 116913304, 'CERDAS CASTILLO ROBERTO', 'P. NORTE COSTADO E. DE IGLECIA', 'ASAMBLEAS DE DIOS   CANCELA 21 C/M', '2786-6620', ''),
(1165, 'Cedula Fisica', 600670915, 'CERDAS CERDAS AURELIA', 'Kmt 1 CUARTA FILA  CASA 44-88', '<P> 16 C/M', '775', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(1166, 'Cedula Fisica', 600670915, 'CERDAS CERDAS AURELIA', 'Kmt 1 CUARTA FILA  CASA 44-88', '<P> 04 C/M', '7750820', ''),
(1167, 'Cedula Fisica', 500780718, 'CERDAS CERDAS JOSE VICENTE', 'Ciud 1º Marzo 25 mts Pulp Farith', 'Palmar Norte.', '7067792', ''),
(1168, 'Cedula Fisica', 500590046, 'CERDAS CHAVARRIA JOSE', 'SAN JORGE BARRIO ASENTAMIENTO PADIL', 'LA CASA N*6', '8617-0612', ''),
(1169, 'Cedula Fisica', 270477862, 'CERDAS GUADAMUZ MEDARDO', 'LA MARIPOSA  DE LA ESCUELA', '1 KILOMETRO AL SUR FINCA CERDAS', '', ''),
(1170, 'Cedula Fisica', 900090570, 'CERDAS JIMENEZ VIDAL', 'SAN MARTIN DE GOLFITO CASA No.6', '', '7751431', ''),
(1171, 'Cedula Fisica', 900090570, 'CERDAS JIMENEZ VIDAL', 'IMAS SAN MARTIN  I FILA', 'SEXTA CASA', '7751431', ''),
(1172, 'Cedula Fisica', 601670583, 'CERDAS PARRA JESUS GUILLERMO', 'RIO CLARO LA ESPERANZA CIUDADELA', 'CRUZ ROJA  CASA # 11 O COMANDO SUR', '', ''),
(1173, 'Cedula Fisica', 601280315, 'CERDAS PARRA JORGE', '', '', '', ''),
(1174, 'Cedula Fisica', 602720131, 'CERDAS PEREZ DENNIS CC EVER', 'La Escuadra fte a entrada la Unión.', '', '8987-5005', ''),
(1175, 'Cedula Fisica', 800390420, 'CERDAS QUEDO ANTONIO', 'PALMAR SUR 50 MTS. E. DEL ESTADIO E', 'N PULP. ZUÑIGA.', '7867030', ''),
(1176, 'Cedula Fisica', 800390420, 'CERDAS QUEDO ANTONIO', 'Palmar Sur  50 E estadio  Pulp Zúñi', 'ga.', '2786-7030', ''),
(1177, 'Cedula Fisica', 800390420, 'CERDAS QUEDO ANTONIO', 'Palmar sur 50 este del estadio en', 'pulp Zuñiga  2786-7030', '', ''),
(1178, 'Cedula Fisica', 600730423, 'CERDAS QUESADA BELLANIRA.', 'CONTROL DE LA CUESTA.', '', '7322440', ''),
(1179, 'Cedula Fisica', 601590092, 'CERDAS SALAS LOSBIA', '', '', '', ''),
(1180, 'Cedula Fisica', 601470719, 'CERDAS SALAS MARVIN.', 'CIUDAD NEILY CABINAS # 2', 'CARCACHE.', '', ''),
(1181, 'Cedula Fisica', 601080605, 'CERRACIN CHAVES SATURDINA', 'LA CENTRAL CAMPESINA EN PULPERIA', 'LA CENTRAL FECHA DE PAGO 12 C/M', '7811328', ''),
(1182, 'Cedula Fisica', 603120041, 'CESPEDES AGUILAR FREDDY', 'Rio Claro  Viquilla Nº1.', '', '8410-2928', ''),
(1183, 'Cedula Fisica', 600620063, 'CESPEDES CALVO BELISA', 'PULP EL GUANACASTECO 100 Mts OESTE', 'VIQUILLA # 2 R CLARO <P> 16 C/M', '', ''),
(1184, 'Cedula Fisica', 601260322, 'CESPEDES CALVO CAMILO', 'La Esperanza de la escuela 1km este', '500 sureste.', '8780-9367', ''),
(1185, 'Cedula Fisica', 601290674, 'CESPEDES CORTES MARIA MARTA', 'CIUDAD NEILY  Bº EL PROGRESO', 'COBRO EN HOGAR DE ANCIANOS.', '7834239', ''),
(1186, 'Cedula Fisica', 601290674, 'CESPEDES CORTES MARIA MARTA', 'P Canoas  Vera Cruz  cs 58.', '', '8663-8527', ''),
(1187, 'Cedula Fisica', 602220899, 'CESPEDES LOBO YOLANDA', 'C.NEILY COLORADITO 800 MTS ESTE', 'DE MADERIN/DEPOSITO LOCAL 43', '2783-1553', ''),
(1188, 'Cedula Fisica', 600650093, 'CESPEDES MORALES FRANCISCO', 'Bº EL CARMNE FTE A RESTAURANT', 'BURICA CASA Nº80  7 C/MES', '', ''),
(1189, 'Cedula Fisica', 601780210, 'CESPEDES MORALES JOSE FAUSTINO', '', '', '', ''),
(1190, 'Cedula Fisica', 602950581, 'CESPEDES PEREZ VERONICA', 'DRAKE RESTAURANTE JADE MAR', '* FECHA DE PAGO 11 CADA MES **', '', ''),
(1191, 'Cedula Fisica', 102250641, 'CESPEDES PIZARRO ARTURO', 'INVU Km 3 GOLFITO CASA # 100', 'P. 16 Y 27 C/M', '775-05', ''),
(1192, 'Cedula Fisica', 601780694, 'CESPEDEZ ANCHIA FLOR', 'KM 27 CASA DETRAS DE LA ESCUELA COL', 'OR CELESTE (LAUREL)', '8662-7971', ''),
(1193, 'Cedula Fisica', 900150725, 'CHACON ARTAVIA ANGEL.', 'LA CAMPIÑA  DOS KILOMETROS AL OESTE', 'DE LA ESCUELA LA CAMPIÑA.', '', ''),
(1194, 'Cedula Fisica', 103510987, 'CHACON ARTOLA ELICEO', 'GOLFITO; DIAGONAL REST. EL UNO', 'SODA NUEVA.P.27 C/M', '', ''),
(1195, 'Cedula Fisica', 103510987, 'CHACON ARTOLA ELISEO', 'Golfito  km1 diagonal a casa de los', 'niños  casa amarilla.', '', ''),
(1196, 'Cedula Fisica', 400570289, 'CHACON BOLAÑOS CLODOMIRO', 'RIO CLARO  SAN RAMON FRET. A', 'MINI SUPER', '', ''),
(1197, 'Cedula Fisica', 603240083, 'CHACON CABALLERO JUAN JOSE', 'Laurel Peral fte a plaza detrás del', 'Marco  cs rosada.', '8740-6275', ''),
(1198, 'Cedula Fisica', 900080844, 'CHACON CHACON MARCIAL.', 'CIUDADELA MADRIGAL DE GOLFITO DEL -', 'PUBLICO 150 MTS PARA ADENTRO.', '', ''),
(1199, 'Cedula Fisica', 602540698, 'CHACON GARRO JOSE LUIS', 'RIO CLARO BAMBEL 1 CASA SOBRE CALLE', 'PRINCIPAL ENTRANDO 16 C/MES', '7897918', ''),
(1200, 'Cedula Fisica', 602540698, 'CHACON GARRO JOSE LUIS', 'BAMBEL DE RIO CLARO 150MTS SUR IGLE', 'ASAMBLEAS DE DIOS', '8823-3848', ''),
(1201, 'Cedula Fisica', 602540698, 'CHACON GARRO JOSE LUIS.', '300 MTS SUR COMISARIATO COTO 63.', '', '7899654', ''),
(1202, 'Cedula Fisica', 600940544, 'CHACON NAVAS JUDITH', '', '', '', ''),
(1203, 'Cedula Fisica', 601230299, 'CHACON PORRAS OVIDIO', 'RIO CLARO BAMBEL Nº 2 PULPERIA LA', 'PRIMAVERA.* CANCELA 10 C/MES *', '7899569', ''),
(1204, 'Cedula Fisica', 103650181, 'CHACON ROJAS RAUL', 'LA GAMBA KM 37 1KM AL NORTE ENTRAD', 'CASA COLOR VERDE DONDE CORTAN PELO', '8685-8946', ''),
(1205, 'Cedula Fisica', 601460527, 'CHACON TREJOS JOSE', 'FINCA PERAL DE LA LAUREL TERCERA', 'CASA FRENTE A LA PLAZA.', '', ''),
(1206, 'Cedula Fisica', 601460527, 'CHACON TREJOS JOSE', 'FINCA PERAL DE LA LAUREL TERCERA', 'CASA FRENTE A LA PLAZA.', '780', ''),
(1207, 'Cedula Fisica', 110660015, 'CHACON VARGAS ROSI', 'Golfito  Bº San Juan detrás colegio', 'Cobrar en DLCG. Cel 8861-1293.', '2775-1965', ''),
(1208, 'Cedula Fisica', 500470060, 'CHAJUD CALVO JORGE', '', '', '', ''),
(1209, 'Cedula Fisica', 601090227, 'CHAMORRO ABARCA Mª LUISA', 'RIO CLARO  SALA DE BELLEZA', 'I.D.E.M.  <P> 16 C/M', '*-*-*-*', ''),
(1210, 'Cedula Fisica', 601090227, 'CHAMORRO AVARCA MARIA LUISA', 'Rio Claro ', '', '', ''),
(1211, 'Cedula Fisica', 270357211, 'CHAMORRO IBARRA ANDRES', 'B` SAN JORGE FRENTE A LA IGLESIA.', '', '', ''),
(1212, 'Cedula Fisica', 603860986, 'CHAMORRO MOLINA LAURA', 'B* EL PROGRESO DETRAS DEL COLONO', 'CUIDAD NEILY 8793/1961', '8754-9881', ''),
(1213, 'Cedula Fisica', 602330048, 'CHAMORRO SOTO NUVIA', 'PTO. JIMENEZ URB. EL COLEG. FTE', 'PULP. MARCHENA. CANCELA 13C/M.', '7355421', ''),
(1214, 'Cedula Fisica', 600670399, 'CHAN AMADOR ENRIQUE', 'C. Cortés 50 N 75 O Cruz Roja.', 'AV21 C1 Via168. Cobrar mes adelante', '2788-8080', ''),
(1215, 'Cedula Fisica', 600420981, 'CHAN MORALES DELIA', 'C Cortés  100m oeste del colegio', '', '2788-8152', ''),
(1216, 'Cedula Fisica', 600420981, 'CHAN MORALES DELIA MARIA', 'CORTES 100 MTS OESTE DEL COLEGIO', '', '7888152', ''),
(1217, 'Cedula Fisica', 601350410, 'CHANTO GAMBOA GAMALIEL.', 'BAMBITO.', '', '', ''),
(1218, 'Cedula Fisica', 601350410, 'CHANTO GAMBOA GAMALIEL.', 'BAMBITO.', '', '', ''),
(1219, 'Cedula Fisica', 601350410, 'CHANTO GAMBOA GAMALIEL.', 'BAMBITO.', '', '', ''),
(1220, 'Cedula Fisica', 102710718, 'CHANTO JIMENEZ VICTOR MAUEL', 'Sabalito  350 Mts Oeste de la Esc', '2784-0231', '8779-2510', ''),
(1221, 'Cedula Fisica', 103740471, 'CHARPANTIER DIAZ ANAIS', 'C Neily  22 Octubre  Bloque E2 ', 'Cel 8841-5145.', '2783-5133', ''),
(1222, 'Cedula Fisica', 603050022, 'CHARPANTIER ROSALES JESSENIA', 'LA GUARIA FTE A LA PLAZA DEPORTES', '** CANCELA 8 C/MES **', '7411081', ''),
(1223, 'Cedula Fisica', 602960459, 'CHAVARRIA ARAUZ DIDIER', 'EL BANU 500MT SUR OESTE DE PULPERIA', 'BARRIO LA AMISTAD', '885057-', ''),
(1224, 'Cedula Fisica', 603670269, 'CHAVARRIA ARAUZ IVIS', 'BAMBU PTO JIMENEZ 400MTS SUROESTE', 'CASA ROSADA DE LA PULP LA AMISTAD', '8802-6083', ''),
(1225, 'Cedula Fisica', 201610250, 'CHAVARRIA ARGUEDAS FILIBERTO', 'C Neily  22 Octubre cs B21 amarilla', 'Cel 8643-9740', '8857-6002', ''),
(1226, 'Cedula Fisica', 204690978, 'CHAVARRIA BADILLA SANDRA', 'PASO CANOAS  EN LAS AFUERAS DE LA', 'ADUANA', '7322035', ''),
(1227, 'Cedula Fisica', 204690978, 'CHAVARRIA BADILLA SANDRA', 'DETRAS DE LA BOMBA TICA X LA ADUANA', 'CASA COLOR LADRILLO ROJO MORRON', '2732-2341', ''),
(1228, 'Cedula Fisica', 101820433, 'CHAVARRIA BERMUDEZ LUZ MARINA', 'KM 35 ALTO D`NAZARENO VILLA BRICEÑO', 'D`PULP E`NAZARENO 100 M <P> 30 C/M', '', ''),
(1229, 'Cedula Fisica', 101820433, 'CHAVARRIA BERMUDEZ LUZ MARINA', 'P Canoas  San Martín.', 'cel 8860-2229', '', ''),
(1230, 'Cedula Fisica', 601070840, 'CHAVARRIA BONILLA SANDRA', 'GOLFITO  Bº BELLA VISTA CASA', '# 81-65 JUSGADO ZONA P.03 c/m', '7750585', ''),
(1231, 'Cedula Fisica', 601070840, 'CHAVARRIA BONILLA SANDRA', 'GOLFITO Bº BELLA VISTA ( TRIBUNAL)', '** FECHA DE PAGO 3 CADA MES **', '7750585', ''),
(1232, 'Cedula Fisica', 601070840, 'CHAVARRIA BONILLA SANDRA', 'GPLFITO  BARRIO BELLA VISTA TRIBUNA', 'L', '7750583', ''),
(1233, 'Cedula Fisica', 601070840, 'CHAVARRIA BONILLA SANDRA', 'Golfito  Bº B Vista  cs 8165.', 'Cel 8842-7145.', '2775-0585', ''),
(1234, 'Cedula Fisica', 601520806, 'CHAVARRIA CABALLERO ISABEL', 'C Neily  22 Octubre  Bloque C cs 15', '', '2783-4355', ''),
(1235, 'Cedula Fisica', 602070261, 'CHAVARRIA CABALLERO LEILA', 'C Neily  22 Octubre  Bloque B cs 21', 'amarillo  verjas rojas.', '', ''),
(1236, 'Cedula Fisica', 602970433, 'CHAVARRIA CAMPOS KARINA', 'P Jiménez 2 brazos 500 O de escuela', 'Cel 8644-8035', '8798-9634', ''),
(1237, 'Cedula Fisica', 601570876, 'CHAVARRIA CASCANTE ROSIBEL', 'P Jiménez  fte Cementerio Soda Miti', 'ca.', '2735-5408', ''),
(1238, 'Cedula Fisica', 501100336, 'CHAVARRIA CERDAS JUAN', 'laurel vereh 600 mts oeste de la', 'escuela local', '7800646', ''),
(1239, 'Cedula Fisica', 500670277, 'CHAVARRIA CHAVARRIA BIENBENIDA', 'GOLF Bº BELLA VISTA FRENT A LA ESC', '<P> 03 C/M', '7750121', ''),
(1240, 'Cedula Fisica', 601510947, 'CHAVARRIA CHAVARRIA JAVIER', 'GOLF Bº SAN ANDRES CASA # 04', 'FRENTE A PULP. <P> 03 C/M', '7750831', ''),
(1241, 'Cedula Fisica', 900330054, 'CHAVARRIA CHAVARRIA MARIA', 'ALTO LOS MOGOS CASA DE LOS MENA ENT', 'RADA POR ARTESANIA', '', ''),
(1242, 'Cedula Fisica', 600380097, 'CHAVARRIA CHAVARRIA PABLO', 'ZANCUDO DE CABINAS LONG 100 OESTE', '<P> 15 C/M', '*-*-*-*', ''),
(1243, 'Cedula Fisica', 600740788, 'CHAVARRIA CHAVARRIA WENCESLAO', 'COTO 58 FTE. BODEGA CASA Nº 11320', '** FECHA DE PAGO 30 CADA MES **', '7811168', ''),
(1244, 'Cedula Fisica', 600740788, 'CHAVARRIA CHAVARRIA WENCESLAO', 'Los Mogos  del Bar el Mirador 150 m', 'mano izq.', '7620860', ''),
(1245, 'Cedula Fisica', 602340030, 'CHAVARRIA COBA SIXTO', 'La mona Entr Marvin Carrion Cs Esqu', 'contg Cs Adoracion # 22', '8736-4808', ''),
(1246, 'Cedula Fisica', 602150728, 'CHAVARRIA GARCIA WILBER', 'naranjo calle los fernandez 800mts', 'este de la policia urba casa n6', '2780-1851', ''),
(1247, 'Cedula Fisica', 270168531, 'CHAVARRIA LOPEZ ESPERANZA', 'PASO CANOAS  ENTRADA A ESCUELA', 'ADVENTISTA 500 X PULPERIA BETEL.', '7322292', ''),
(1248, 'Cedula Fisica', 502330114, 'CHAVARRIA MARCHENA GERMAN', 'CIUDAD CORTES OJO DE AGUA CASA FTE.', 'A MUNIC. **FECHA DE PAGO 20 C/MES**', '7888347', ''),
(1249, 'Cedula Fisica', 118900199, 'CHAVARRIA MARLENE DEL CARMEN', 'Canoas carretera hacia la', 'cuesta', '7322320', ''),
(1250, 'Cedula Fisica', 155800042, 'CHAVARRIA MARLENE DEL CARMEN', 'Canoas Bº betel de entrada esc adve', '250 Mts Oeste  2732-2320', '8512-1322', ''),
(1251, 'Cedula Fisica', 601270431, 'CHAVARRIA MIRANDA YADIRA', 'LA CUESTA CIUDADELA TAMAYO C.4-B', 'C.MINIST DE S PASO CANOAS 30 C/M', '7322689', ''),
(1252, 'Cedula Fisica', 602700431, 'CHAVARRIA MIRANDA YADIRA', 'LA CUESTA CIUDADELA TAMAYO C.4-B', 'C.MINIST DE S PASO CANOAS 30 C/M', '7322689', ''),
(1253, 'Cedula Fisica', 601270431, 'CHAVARRIA MIRANDA YADIRA', 'LA CUESTA CIUDADELA TAMAYO C.4-B', 'MINIST. DE SALUD * 15 CADA MES **', '7322689', ''),
(1254, 'Cedula Fisica', 601270431, 'CHAVARRIA MIRANDA YADIRA', 'LA CUESTA CIUDADELA TAMAYO C.4-B', 'MINIST. DE SALUD. 2732-1228', '8373-0572', ''),
(1255, 'Cedula Fisica', 602370583, 'CHAVARRIA MORALES FERNANDO ENRIQUE', 'GOLF Kmt 1 L`BOLSA POR EL PUENTE', 'CASA #4129 <P> 16 C/M', '7751141', ''),
(1256, 'Cedula Fisica', 500400464, 'CHAVARRIA PEREZ EUGENIO', 'RIO CLARO  X ENTRADA AL GUABO 2da', 'ENTRADA 1era C.COLOR VERDE ESQUINER', '7899655', ''),
(1257, 'Cedula Fisica', 500400464, 'CHAVARRIA PEREZ EUGENIO', 'RIO CLARO 150 NORTE ENTRAD. AL', 'GUABO CLIENTE CONOCIDO', '', ''),
(1258, 'Cedula Fisica', 500970303, 'CHAVARRIA PICADO RODRIGO', 'R.Claro Viquilla  2º Puente Hamaca ', '5º casa.Responsable Deily Chavarría', '8833-2429', ''),
(1259, 'Cedula Fisica', 600810571, 'CHAVARRIA PITI SANTOS JULIAN', 'RECIDENCIAL UREÑA CASA E 1', '(P) 02 C/M.', '7750070', ''),
(1260, 'Cedula Fisica', 600810561, 'CHAVARRIA PITTY JULIO', 'R. Ureña  Golfito  Casa E-1.', 'Cel 8980-4125.', '2775-0070', ''),
(1261, 'Cedula Fisica', 600450290, 'CHAVARRIA PITTY MARCELINO', 'km 1  Barrio el Disco casa 4134', '', '7750994', ''),
(1262, 'Cedula Fisica', 600450290, 'CHAVARRIA PITTY MARCELINO', 'GOLFITO KMT UNO CASA Nº 4134', '', '7750994', ''),
(1263, 'Cedula Fisica', 600450290, 'CHAVARRIA PITTY MARCELINO', 'GOLFITO KMT UNO CASA Nº 4134', '', '7750994', ''),
(1264, 'Cedula Fisica', 600910654, 'CHAVARRIA RAMIREZ ZELEDONIO C JESUS', 'Sierpe Costado Sur de la Plaza ', '2788-1113', '8981-8824', ''),
(1265, 'Cedula Fisica', 602510388, 'CHAVARRIA RODRIGUEZ CARMEN', 'Golfito Km 13  1km Est del estadio', 'La Mona   8820-2751 / 2775-6292', '2775-0729', ''),
(1266, 'Cedula Fisica', 603550234, 'CHAVARRIA RODRIGUEZ GREIVIN', 'P Jiménez  La Palma  Guadalupe.', 'Cel 8745-9819.', '2735-1270', ''),
(1267, 'Cedula Fisica', 601450099, 'CHAVARRIA RODRIGUEZ OLGA', 'GUADALUPE 150M OESTE DE LA ESCUELA', 'GUADALUPE DE LA PALMA JIMENEZ.', '2735-1270', ''),
(1268, 'Cedula Fisica', 62350909, 'CHAVARRIA RODRIGUEZ TERESITA', 'Km 20  50m E diagonal a Escuela c.', 'verde. Cobrar local 1 Dep. Libre.', '7750601', ''),
(1269, 'Cedula Fisica', 602350909, 'CHAVARRIA RODRIGUEZ TERESITA', 'Golfito  Km 20 50 Est diag a la Esc', '2789-9735  /  2775-0601', '8815-7191', ''),
(1270, 'Cedula Fisica', 601960886, 'CHAVARRIA SANDI JOSE RAMON', 'GOLFITO  CARRETERA AL ANTIGUO', 'PIC-NIC. CASA 4354', '7751279', ''),
(1271, 'Cedula Fisica', 600490258, 'CHAVARRIA VILLALOBOS NECTALY IDALY', 'PUERTO JIMENEZ DOS BRAZOS DE LA', 'ESCUELA 100 MTS SUR.', '', ''),
(1272, 'Cedula Fisica', 602800013, 'CHAVERRY SOLANO ZELMIRA', 'Golfito  Km20  de Pulp. Guaria 200', 'sur  cs metida.', '2789-9628', ''),
(1273, 'Cedula Fisica', 602270362, 'CHAVES ALFARO MONICA', 'COTO 63 CASA Nº 15457 CLIENTE CLASE', '\"\"\" A \"\" * CANCELA 16 C/MES *\"', '7897128', ''),
(1274, 'Cedula Fisica', 501100321, 'CHAVES ALVARADO TRINIDAD VICTORIANA', 'RIO CLARO X PULP.SUPER TORRESCOBRAR', 'TIENDA AMERIC. FECHA DE PAGO 2 C/ME', '', ''),
(1275, 'Cedula Fisica', 602030609, 'CHAVES ALVAREZ PATRICIA', 'PTO JIMENEZ EN CASA DETRAS DEL', 'GIMNACIO *FECHA DE PAGO 11 C/MES*', '7355674', ''),
(1276, 'Cedula Fisica', 602030609, 'CHAVES ALVAREZ PATRICIA', 'PTO. JIMENEZ EN CASA DETRAS DEL', 'GIMNACIO * FECHA DE PAGO 11 C/MES *', '7355674', ''),
(1277, 'Cedula Fisica', 102420166, 'CHAVES ARAYA RAFAEL', 'P Jiménez  Bº Ceibo.', '', '2735-1074', ''),
(1278, 'Cedula Fisica', 102760593, 'CHAVES ARAYA RAMON', 'AMAPOLA CALLE A CONTE  DEL P.J. ULT', 'IMA CASA DE LA CALLE', '', ''),
(1279, 'Cedula Fisica', 600950789, 'CHAVES CHAVARRIA LUCIA', 'PURRUJA kmt 7 PULP PEJIBALLE', '<P> 03 C/M', '775', ''),
(1280, 'Cedula Fisica', 300546439, 'CHAVES CHAVES AURELIANO', 'GOLFITO  Kmt 2 ½ FRENTE', 'COOPEMONTECILLOS. P. 03 C/M', '7750014', ''),
(1281, 'Cedula Fisica', 300546439, 'CHAVES CHAVES AURELIANO', 'GOLFITO  Kmt 2 ½ FRENTE', 'COOPEMONTECILLOS. P. 03 C/M', '7750014', ''),
(1282, 'Cedula Fisica', 502140183, 'CHAVES CHAVES DANIEL', 'ceniso de laurel por el puente de', 'madera', '', ''),
(1283, 'Cedula Fisica', 502140183, 'CHAVES CHAVES DANIEL', 'CENIZO DE LAUREL X PUENTE DE CEMENT', '** PAGO DE PALMEROS **', '7800353', ''),
(1284, 'Cedula Fisica', 502140183, 'CHAVES CHAVES DANIEL', 'CENIZO X EL PUENTE *** PAGO DE PALM', 'EROS', '7800553', ''),
(1285, 'Cedula Fisica', 502140183, 'CHAVES CHAVES DANIEL', 'Cenizo de laurel  Costado de la Esc', '', '2780-1684', ''),
(1286, 'Cedula Fisica', 600470097, 'CHAVES CHAVES EULALIA', 'IMAS SAN MARTIN GOLF. 1era ENTRADA', 'MANO DERECHA ULTIMA CASA.', '7751721', ''),
(1287, 'Cedula Fisica', 700190887, 'CHAVES CHAVES JUANA', 'CONTROL  DE LA PULP. 1 Km CALLE A', 'LA BRUJITA .P. 15 C/M', '', ''),
(1288, 'Cedula Fisica', 700190887, 'CHAVES CHAVES JUANA', 'CONTROL DE LA PUPL 1 KMT', 'CALLE A LA BRUJITA', '', ''),
(1289, 'Cedula Fisica', 700190887, 'CHAVES CHAVES JUANA', 'CONTROL  DE LA PULP. 1 Km CALLE A', 'LA BRUJITA .P. 15 C/M', '', ''),
(1290, 'Cedula Fisica', 601400736, 'CHAVES CHAVES SANTOS ISABEL', 'Urb.Daniel Herrera G 24 La mona', 'golfito frente a pulteria Gari', '7756028', ''),
(1291, 'Cedula Fisica', 701210131, 'CHAVES FERNANDEZ GLADYS', 'Bº EL PRECARIO AL FINAL Nº 42', 'FTE AL CIPRES....', '', ''),
(1292, 'Cedula Fisica', 601490110, 'CHAVES GARCIA LUIS', 'Fca 63 COSTADO OESTE D` CASA', '# 15461 <P> C/M', '-', ''),
(1293, 'Cedula Fisica', 301020466, 'CHAVES HERNANDEZ AUDILIO', 'PTO JIMENEZ LA PALMA.', 'PLAYA BLANCA.', '', ''),
(1294, 'Cedula Fisica', 603700257, 'CHAVES MENA ALEXANDER CC NANDI', 'LA MONA LA ENTRADA CARRION 160 AL E', 'STE AL FONDO', '7881303', ''),
(1295, 'Cedula Fisica', 602160049, 'CHAVES TELLO FANNY MARIA', 'P Jiménez  La Palma  costado oeste', 'Taller el Ceibo.', '2735-1322', ''),
(1296, 'Cedula Fisica', 102760593, 'CHAVEZ ARAYA RAMON', 'LA AMAPOLA CONTG. A PULPERIA ANAIS', '** CANCELA 11 DE CADA MES **', '3686634', ''),
(1297, 'Cedula Fisica', 108160698, 'CHAVEZ BALTODANO MINOR', 'MANGO LAUREL ENTRADA 300MTS AL ESTE', 'COLOR VERDE AGUA', '8580-2643', ''),
(1298, 'Cedula Fisica', 500850966, 'CHAVEZ FRAY ALICIA', 'ciudad neily frent al porton antigu', 'a cartonera p. el dia 1 c/m.', '783', ''),
(1299, 'Cedula Fisica', 900810353, 'CHAVEZ NUÑEZ Mº ZORAIDA', 'Golfito km 23 1km de Interamericana', 'Cel 8750-7745.', '8683-1000', ''),
(1300, 'Cedula Fisica', 501170697, 'CHAVEZ RODRIGUEZ RICARDO', 'LAUREL INVU CASA 31', '', '8409-5487', ''),
(1301, 'Cedula Fisica', 603440085, 'CHAVEZ VENEGAS DEILYN', 'Golfito  KM 5 La Hielera. 8616-3033', '8654-8480', '', ''),
(1302, 'Cedula Fisica', 601130540, 'CHAVEZ VENEGAS ELDEBRANDO', 'RIO CLARO FTE. AL INA ENTRADA CASA', 'COLOR ROSADO FECHA DE PAGO 2 C/MES*', '7899137', ''),
(1303, 'Cedula Fisica', 603250299, 'CHINCHILLA FLORES YENNI', 'GOLFITO KM.14 EN BAR RESTAURANT', 'EL RODEO.', '8123754', ''),
(1304, 'Cedula Fisica', 101640101, 'CHINCHILLA RIOS JOSE ANGEL.', 'DE LA ESCUELA DEL ROBLE 1 KMT 300 M', 'ANTES DEL ALMACEN YANCI. P.15 C/M.', '', ''),
(1305, 'Cedula Fisica', 101640101, 'CHINCHILLA RIVAS JOSE ANGEL.', 'DE LA ESCUELA DEL ROBLE 1 KMT 300 M', 'ANTES DEL ALMACEN YANCI. P.15 C/M.', '', ''),
(1306, 'Cedula Fisica', 103610093, 'CHINCHILLA VILLALOBOS RAFAEL', 'LA MONA DEL TALLER 200 MTS CASA A', 'LA PAR DE LA CARRETERA DES DE VUELT', '7750535', ''),
(1307, 'Cedula Fisica', 104260263, 'CHINCHILLA VILLANUEVA ELI', 'KM 5 PANADERIA D`JESUCRISTO 200 MT', 'ANTES <P> 16 C/M', '', ''),
(1308, 'Cedula Fisica', 104260263, 'CHINCHILLA VILLANUEVA ELI', 'Golfito km 5  100m panadería Jesu-', 'Cristo.', '', ''),
(1309, 'Cedula Fisica', 600260511, 'CHIPSEN JIMENEZ FERNANDO.', 'Golfito Barrio Llano Bonito casa', '# 4901.', '', ''),
(1310, 'Cedula Fisica', 600810571, 'CHJAVARRIA PITI SANTOS JULIAN', 'golfito ureña casa e-1', '', '', ''),
(1311, 'Cedula Fisica', 602350761, 'CIANCA CEDEÑO EUNICE', 'SAN MARTIN 400MTS ESTE DE LA ESCUEL', 'DE LA LOCALIDAD PASO CANOAS', '2732-1667', ''),
(1312, 'Cedula Fisica', 500400375, 'CISNEROS CISNEROS OBDULIA', 'LA CUESTA COSTADO NORTE DE LA', 'ESCUELA C.C.VERDE X EL PARQUE', '', ''),
(1313, 'Cedula Fisica', 800440939, 'CISNEROS ORTEGA CARLOS', 'ABROJO  PULP EL ESTUDIANTE', '<P> 15 Y 30 C/M', '', ''),
(1314, 'Cedula Fisica', 8440939, 'CISNEROS ORTEGA CARLOS', 'ABROJO CENTRO PULPERIA CATERIN', '', '7834560', ''),
(1315, 'Cedula Fisica', 800440939, 'CISNEROS ORTEGA CARLOS.', 'ABROJO  CENTRO EN PULP EL ESTUDIANT', 'COBRAR EL 15 Y EL 30 DE CADA MES.', '', ''),
(1316, 'Cedula Fisica', 800480571, 'COBA COBA FELICIANA', 'GOLFITO B. SAN MARTIN CASA N. 04', '', '7751301', ''),
(1317, 'Cedula Fisica', 800480571, 'COBA COBA FELICIANA', 'GOLFITO INVU SAN MARTIN', '* PENCIONADA **', '7751301', ''),
(1318, 'Cedula Fisica', 601440062, 'COBA COBA JULIA', 'Golfito  Oasis de Esperanza  ultima', 'casa camino a Cacao.', '7751465', ''),
(1319, 'Cedula Fisica', 601620895, 'COLOMER BENAVENTE CARLOS', '', '', '', ''),
(1320, 'Cedula Fisica', 602780865, 'CONCEPCION CABALLERO  FREDDY', 'SAN ISIDRO DE CANOAS X 53 K', '** CANCELA 01 CADA MES ***', '', ''),
(1321, 'Cedula Fisica', 159100194, 'CONCEPCION CAMPOS FLORA', 'P Canoas  costado de Real Victoria.', '', '2732-3157', ''),
(1322, 'Cedula Fisica', 601920318, 'CONCEPCION CAMPOS JORGE', 'PASO CANOAS  ABASTECEDOR LA GORDA', '100 OESTE DEL C.N.P.', '', ''),
(1323, 'Cedula Fisica', 601920318, 'CONCEPCION CAMPOS JORGE', 'Paso Canoas 100 Oeste del CNP', '', '', ''),
(1324, 'Cedula Fisica', 601090607, 'CONCEPCION CHAVES LUIS', 'LA CAMPIÑA 350 MTS N. DE LA ESCUELA', 'CALLE A PUEBLO NUEVO.', '7800000', ''),
(1325, 'Cedula Fisica', 601090607, 'CONCEPCION CHAVES LUIS', 'La campiña  350 m Escuela local. Ca', 'lle a Pueblo Nuevo.', '2776-6024', ''),
(1326, 'Cedula Fisica', 600790489, 'CONCEPCION CHAVEZ CELEDONIO', 'LA CAMPIÑA <P> 18 C/M', '', '*-*-*-*', ''),
(1327, 'Cedula Fisica', 600980772, 'CONCEPCION CHAVEZ EULOGIA', 'GOLFITO CASA FTE.AL JUZGADO DE TRAB', 'TRAB. HOSP.DPTO.ESTADISTICA', '', ''),
(1328, 'Cedula Fisica', 600460133, 'CONCEPCION CONCEPCION EMILIO', 'GOLF LLANO BONITO CASA # 4921', '<P>  03 C/M', '7751433', ''),
(1329, 'Cedula Fisica', 600460133, 'CONCEPCION CONCEPCION EMILIO', 'Golfito  Llano Bonito  casa 4921', '', '7751433', ''),
(1330, 'Cedula Fisica', 600460133, 'CONCEPCION CONCEPCION EMILIO', 'Golfito  LLano bonito  cs 4921', '', '2775-1433', ''),
(1331, 'Cedula Fisica', 601010696, 'CONCEPCION CONCEPCION RUFINO', 'El barrido 500 mts E de pulp', 'el cruce <P> el 17 C/M', '', ''),
(1332, 'Cedula Fisica', 601010696, 'CONCEPCION CONCEPCION RUFINO', 'El barrido 500 mts E de pulp', 'el cruce <P> el 17 C/M', '', ''),
(1333, 'Cedula Fisica', 601010696, 'CONCEPCION CONCEPCION RUFINO', 'EL BARRIDO 500 Mts ESTE DE PULP', 'EL CRUCE <P> 17 C/M', '', ''),
(1334, 'Cedula Fisica', 800470094, 'CONCEPCION CONCEPCION TEOFILA', 'COTO 47 ZONA ADMININISTRATICA CASA', '12231.', '', ''),
(1335, 'Cedula Fisica', 800470094, 'CONCEPCION CONCEPCION TEOFILA', 'LA CUESTA 200 M DESPUES DE LA PLAZA', 'EN LA VUELTA ENTRADILLA 1era CASA.', '7802693', ''),
(1336, 'Cedula Fisica', 602920459, 'CONCEPCION FERNANDEZ HIGINIA', 'Golfito urb Ducler Martinez C E33', 'casa color Azul 8448-7707', '', ''),
(1337, 'Cedula Fisica', 602020015, 'CONCEPCION GOMEZ GERBER', 'Kmt 1 CASA # 8100  PREGUNTAR EN PUL', 'ANGIE <P> 03 C/M', '7751532', ''),
(1338, 'Cedula Fisica', 602020015, 'CONCEPCION GOMEZ GERBER', 'Golfito Frente a tortugas ninja', 'telefono 89870206', '', ''),
(1339, 'Cedula Fisica', 109520737, 'CONCEPCION GOMEZ HENRY', 'Llano Bonito  cs 4921', 'Cel 8519-8411.', '2775-1433', ''),
(1340, 'Cedula Fisica', 601720018, 'CONCEPCION GONZALEZ WALTER', 'P Canoas Veracruz cs 105 madera.', 'Cel 8558-8190.   85167442.', '8676-2982', ''),
(1341, 'Cedula Fisica', 601720018, 'CONCEPCION GONZALEZ WALTER', 'P Canoas Veracruz cs 105 madera.', 'Cel 8516-7442.', '-', ''),
(1342, 'Cedula Fisica', 280070381, 'CONCEPCION GUERRA ADENICIA', 'CANOAS  DEL C.N.P HACIA ADENTRO', '<P> 15 C/M', '', ''),
(1343, 'Cedula Fisica', 280070381, 'CONCEPCION GUERRA ADENICIA', 'CANOAS A LA PAR DE CABLE CANOAS', '', '7322276', ''),
(1344, 'Cedula Fisica', 603050445, 'CONCEPCION LARA CRISTIAN', 'LA MARIPOSA ACENTAMIENTO LAS VEGITA', 'CANCELA 18 C/MES', '', ''),
(1345, 'Cedula Fisica', 601120581, 'CONCEPCION MORERA GENARO', 'GOLFITO  LA MONA DEL BAR LA RUEDA', 'CASA DE DOS PISOS MANO DERECHA', '7750759', ''),
(1346, 'Cedula Fisica', 601490577, 'CONCEPCION QUIROS LIDIA', 'GOLF SODA CONTG. HOTEL DELFINA O EN', 'Kmt 3 CONTG PULP.BOTONCITO.P 03Y16', '', ''),
(1347, 'Cedula Fisica', 601490577, 'CONCEPCION QUIROS LIDIA', 'GOLF EL CIVIL DIAGONAL A CONSULTORI', 'DEL DR. ALLUE.', '7750941', ''),
(1348, 'Cedula Fisica', 602060785, 'CONEJO BEJARANO GIOVANNA CC YUDI', 'CONTIGUA AL REDONDEL BARRIO BAMBU', 'CANCELA EN OFICINA**', '7355643', ''),
(1349, 'Cedula Fisica', 602060785, 'CONEJO BEJARANO GIOVANNA CC YUDI', 'Pto Jimenez  contg  redondel', '2735-5840', '', ''),
(1350, 'Cedula Fisica', 600410946, 'CONEJO BEJARANO SONIA', 'PALMAR NORTE COSTADO SUR DE IGLESIA', 'CATOLICA **FECHA DE PAGO 20 C/MES**', '7866475', ''),
(1351, 'Cedula Fisica', 602500161, 'CONTRERAS CONTRERAS SALVADOR', 'sierpe 75 este del hotel margarita', '', '2788-1306', ''),
(1352, 'Cedula Fisica', 501140060, 'CONTRERAS GARCIA JOSE A.', 'Pto Jiménez. Urb Colegio  contiguo', 'pulp Marchena. Desp cable 4 casas.', '2735-5313', ''),
(1353, 'Cedula Fisica', 700240429, 'CONTRERAS MONTIEL JOSE ANGEL.', 'CIUDAD NEILY  CABINAS CONTRERAS', 'CONTIGUO A PENSION ELVIRA.', '', ''),
(1354, 'Cedula Fisica', 600680256, 'CONTRERAS PEREZ ALFREDO', 'Coyoche de la escuela 300 mts n.', 'casa a mano derecha', '', ''),
(1355, 'Cedula Fisica', 600680256, 'CONTRERAS PEREZ ALFREDO', 'Coyoche de la escuela 300 mts n.', 'casa a mano derecha CANCELA 15 C/ME', '7838132', ''),
(1356, 'Cedula Fisica', 300407160, 'COOPE-AUTOGESTIONARIA GUAYCARA R.L.', 'Rio Claro  del transito 125. mts', 'calle a Ciudad Neily.', '789', ''),
(1357, 'Cedula Fisica', 600660462, 'CORDERO ARAYA RODRIGO', '', '', '', ''),
(1358, 'Cedula Fisica', 600600462, 'CORDERO ARAYA RODRIGO', 'GOLFITO KM.5 EL CEIBO EN PULPERIA', 'LA GOLFITEÑA ..', '7750714', ''),
(1359, 'Cedula Fisica', 602600784, 'CORDERO BARRIOS ROSA', 'GOLFITO KM 5 EL CEIBO', '', '', ''),
(1360, 'Cedula Fisica', 602600784, 'CORDERO BARRIOS ROSA', 'GOLFITO K.5 EL CIEBO C.C', '** FECHA DE PAGO 16 C/MES **', '7752563', ''),
(1361, 'Cedula Fisica', 113560960, 'CORDERO CHACON ARIANA MARIA', 'S Vito  100 M Oest de la Bomba', 'MOBIEVA  2734-0120', '8640-8662', ''),
(1362, 'Cedula Fisica', 900580427, 'CORDERO CHAVARRIA JOSE', 'CIUDAD NEILY  B`EL CARMAN ABROJO', '300 Mts DE LA CASETILLA.', '', ''),
(1363, 'Cedula Fisica', 900580427, 'CORDERO CHAVARRIA JOSE', 'BARRIO EL CARMEN ABROJO.', '', '', ''),
(1364, 'Cedula Fisica', 900580427, 'CORDERO CHAVARRIA JOSE', 'COLORADITO  CONTIGUO A LA ANTIGUA', 'ESCUELA SANTA MARTA.', '7835407', ''),
(1365, 'Cedula Fisica', 600910881, 'CORDERO GONZALEZ VICTOR MANUEL', 'RIO CLARO  Bº SANTIAGO 50 MTS N. E.', 'DEL ALMACEN DE ABASTECIMIENTO I.C.E', '', ''),
(1366, 'Cedula Fisica', 602340940, 'CORDERO MONTERO ALEX BERNEY', 'Palmar Sur 125m Sureste Esc. cs ver', 'de claro. Trab en clínica 2786-6344', '2786-7213', ''),
(1367, 'Cedula Fisica', 602600823, 'CORDERO NAVARRO ANDREY GERARDO', 'Golfito La Mona 100 M antes Escuela', 'Guarda MOPT Río Claro. 8738-6565.', '2775-6179', ''),
(1368, 'Cedula Fisica', 600326581, 'CORDERO OBREGON KATHIA', 'P Jiménez  cs G-6 Tienda Cristiana', '', '8937-2999', ''),
(1369, 'Cedula Fisica', 110470203, 'CORDERO OBREGON WILLIAM CC CUCU', 'P Jiménez El Bambú 300 Noroeste Pul', 'El Bambú. Cel8781-8053.', '2735-5635', ''),
(1370, 'Cedula Fisica', 100470203, 'CORDERO OBREGON WILLIAM CC. CUCU', 'Bª EL BAMBU  350 NORESTE DE LA PULP', 'LA AMISTAD', '7355635', ''),
(1371, 'Cedula Fisica', 601660920, 'CORDERO ROMERO ANDRES JESUS', 'GOLFITO OTEL SIERRA O Bº UREÑA', 'CASA G-3 MANO IZQUIERDA <P> 16 C/M', '', ''),
(1372, 'Cedula Fisica', 601280795, 'CORDERO ROMERO FERNANDO', 'Golfito  La Mona  Bº Daniel Herrera', 'Cel 8976-8616.', '2775-6269', ''),
(1373, 'Cedula Fisica', 601280795, 'CORDERO ROMERO FERNANDO', 'LA MONA GOLFITO URB DANIEL HERRERA', 'FRETE A LA BOMBA DE AGUA', '2775-6269', ''),
(1374, 'Cedula Fisica', 601150226, 'CORDERO RUBI MATIAS', 'control de laurel diagonal a pulpe.', 'la bella', '7321279', ''),
(1375, 'Cedula Fisica', 601150226, 'CORDERO RUBI MATIAS', 'Jobo Laurel. 300 m sur Bar Bonanza', 'calle de piedra.', '7321279', ''),
(1376, 'Cedula Fisica', 104320489, 'CORDERO SEGURA HECTOR', 'PUEBLO NUEVO COTO D`ESC HACIA FERRI', '100  Mts <P> 20 C/M', '*-*-*-*', ''),
(1377, 'Cedula Fisica', 104320489, 'CORDERO SEGURA HECTOR', 'Pueblo Nuevo  75 m de la escuela ha', 'cia el ferry.', '7766041', ''),
(1378, 'Cedula Fisica', 202380998, 'CORDERO SOLANO JOSE MANUEL (PALITO)', 'ESPERANZA R.CLARO CONTG.A IGLESIA', 'EVANGELICA O DONDE KATTIA <P>03 C/M', '*-*-*-*', ''),
(1379, 'Cedula Fisica', 600920668, 'CORDOBA MORALES ARTURO', 'C Cortés  C Pachecho  cs 19.', '', '2786-4119', ''),
(1380, 'Cedula Fisica', 601070159, 'CORDOBA TORRES ALBERTO', 'BAMBEL 1   200 METROS AL OESTE DE', 'PULP EL JARDIN.', '7898142', ''),
(1381, 'Cedula Fisica', 601070159, 'CORDOBA TORRES ALBERTO', 'R Claro  Bambel 300m desp. pulp Jar', 'dín. cel 8323-4696.', '2789-8142', ''),
(1382, 'Cedula Fisica', 502840779, 'COREA MATARRITA ISAIAS', 'PALMAR SUR FCA 12', '', '7881165', ''),
(1383, 'Cedula Fisica', 601330410, 'COREA RUIZ RUTH', 'P Sur fte Delegación cs blanca fran', 'ja roja. Cel 8994-8196.', '2786-7970', ''),
(1384, 'Cedula Fisica', 501290792, 'CORELLA OSES RAFAEL', 'RIO CLARO  DEL PALMICHE 700 MTS', 'ENTRADA M.IZQU BAMBEL CASA AL FONDO', '7899818', ''),
(1385, 'Cedula Fisica', 501290792, 'CORELLA OSES RAFAEL', 'RIO CLARO DEL PLAMICHE 700M', 'ENTRADA M. IZ.BAMBEL CASA AL FONDO', '7899818', ''),
(1386, 'Cedula Fisica', 159100125, 'CORELLA RODRIGUEZ ANDRES', 'P Canoas  S Miguel Antes de Escuela', '', '8552-9709', ''),
(1387, 'Cedula Fisica', 501160160, 'CORONADO ALEMAN  MARIA V', 'LOS PLANES DE DRAKE', '', '', ''),
(1388, 'Cedula Fisica', 601220059, 'CORONADO SOLANO CARLOS ESTEBAN', 'GOLFITO  HOSP EBAIS. Cel 8814-0467.', 'Km 1 3º y 1/2 fila a la par Buitre.', '2775-3187', ''),
(1389, 'Cedula Fisica', 601220059, 'CORONADO SOLANO CARLOS ESTEVAN', 'GOLFITO. HOSP ADMINISTRACION O KMTO', '1 Ier FILA C #4451 P. A MENDIO MES.', '750011', ''),
(1390, 'Cedula Fisica', 601170590, 'CORRALES ALEMAN JOSE GERARDO', 'Golfito Bella Vista 100m Norte Esc.', 'Central. Cel 8613-0565', '2775-2564', ''),
(1391, 'Cedula Fisica', 601580893, 'CORRALES BRENES MARTHA SONIA', 'Laurel finca 2-24 3º fila 2º cs', 'primer cuadrante', '2786-7524', ''),
(1392, 'Cedula Fisica', 600790054, 'CORRALES CALVO MANUEL.', 'GOLFITO  CALLE A LAS TRENZAS KM 16', 'CONTG. IGLESIA PAGA EL 16 DE C/M.', '', ''),
(1393, 'Cedula Fisica', 107290903, 'CORRALES CARMONA DAMARIS', 'LA ESTRELLA DE COMTE DE LA PANADERI', 'A LA ESTRELLA 50MTS CARRETERA CONTE', '8543-5457', ''),
(1394, 'Cedula Fisica', 106810985, 'CORRALES CARMONA GRACIANO', 'LA ESTRELLA DE CONTE 600 MTS. DEL', 'BAR EL SARPE.', '', ''),
(1395, 'Cedula Fisica', 107030495, 'CORRALES CASTRO ROGER ANTONIO', 'Playa Zancudo  30 m Sur de Cabinas', 'Tío Froylán.', '', ''),
(1396, 'Cedula Fisica', 107030495, 'CORRALES CASTRO ROGER.', 'LA CUESTA.', '', '', ''),
(1397, 'Cedula Fisica', 601530808, 'CORRALES CHAVES GILBERT', 'R Claro  Diag antig Cruz Roja.', 'Cel 8879-3597.', '2789-8197', ''),
(1398, 'Cedula Fisica', 202530268, 'CORRALES CORDOBA ARNOLDO', 'golfito las gradas ............', 'bella vista', '', ''),
(1399, 'Cedula Fisica', 202530268, 'CORRALES CORDOBA ARNOLDO', 'Bº bella vista las gradas Cs # 4312', '2775-0918', '', ''),
(1400, 'Cedula Fisica', 300820098, 'CORRALES CORRALES JOSE', 'GOLF Bº BELLA VISTA CASA # 4331', '<P> 03 C/M', '775', ''),
(1401, 'Cedula Fisica', 300420098, 'CORRALES CORRALES JOSE', 'GOLF Bº BELLA VISTA CASA # 4331', '<P> 03 C/M', '775', ''),
(1402, 'Cedula Fisica', 601570264, 'CORRALES CORTES ABELARDO', 'GOLFITO BARRIO BELLA VISTA CABINA N', 'AVARRETE', '7751819', ''),
(1403, 'Cedula Fisica', 603690108, 'CORRALES ELIZONDO JEYLIN', 'Sabalito Bº Los pinos  250 E de Esc', 'Cs Cemento Blanca. 2784-0314', '8952-0244', ''),
(1404, 'Cedula Fisica', 107740601, 'CORRALES GONZALEZ JUAN CARLOS', '200MTS NOROESTE DEL CAMPO DE ATERRI', 'ZAJE CALLE A LA ISLA S. VITO', '2773-4968', ''),
(1405, 'Cedula Fisica', 602150517, 'CORRALES GONZALEZ MAIKI', 'GOLFITO BAJOS HOTEL DELFINA', '<P> 16 C/M', '7751664', ''),
(1406, 'Cedula Fisica', 602780048, 'CORRALES GUTIERREZ JOHANNY', 'GOLFITO KM. 20 4TA CASA 2DA FILA', 'FECHA DE PAGO 17 C/MES ?X NATALIA', '8382146', ''),
(1407, 'Cedula Fisica', 106500947, 'CORRALES HERRERA XINIA', 'C. Cortés contiguo al Multiuso.', 'Cel 8981-6696.', '2788-8733', ''),
(1408, 'Cedula Fisica', 900430906, 'CORRALES MADRIGAL JORGE A.', 'La Mona pulpería y video madrigal', '', '', ''),
(1409, 'Cedula Fisica', 900430906, 'CORRALES MADRIGAL JORGE A.', 'La Mona pulpería y video madrigal', '', '', ''),
(1410, 'Cedula Fisica', 900430906, 'CORRALES MADRIGAL JORGE ARTURO', 'Km 1 CUATRO FILAS GOLFITO O EN EL', 'VIDEO P.09 Y 22 C/M', '', ''),
(1411, 'Cedula Fisica', 900430906, 'CORRALES MADRIGAL JORGE ARTURO', 'La Mona de Golfito pulpería y video', 'Madrigal c/16 y 03 c/mes.', '', ''),
(1412, 'Cedula Fisica', 202060378, 'CORRALES ROJAS EFRAIN', 'GUADALUPE DE PTO JIMENEZ DE LA', 'ENTRADA 4ta CASA M.DERECHA', '', ''),
(1413, 'Cedula Fisica', 202060378, 'CORRALES ROJAS EFRAIN', 'GUADALUPE PTO JIMENEZ CLIENTE', 'EXELENTE.', '', ''),
(1414, 'Cedula Fisica', 500750419, 'CORRALES SOTO SOCORRO', 'CORTES CONTG. AL PUENTE DE', 'AMACA  EN PULPERIA', '7888639', ''),
(1415, 'Cedula Fisica', 501970811, 'CORTES ANGULO DANIEL', 'Golfito  Km1  cs 4482', '', '2775-0329', ''),
(1416, 'Cedula Fisica', 701640399, 'CORTES DELGADO MARCELA ESTEBANA', 'PALMAR NORTE 100MTS. N. DE COOPEALI', 'CASA ESQUINERA COLOR CELESTE 8/MES', '7867521', ''),
(1417, 'Cedula Fisica', 800760718, 'CORTES ESPINOZA JUAN PABLO', 'P Jiménez Cañaza  Pulp. David 800m', 'Suroeste de la escuela.', '8752-3806', ''),
(1418, 'Cedula Fisica', 103001999, 'CORTES FLORES FELICIANO', 'LAUREL BECEH CONTIGUO PUENTE', 'FTE.MASIS', '', ''),
(1419, 'Cedula Fisica', 603120423, 'CORTES GARCIA ROSALYN', 'PASO CANOAS SAN JORGE ENTRADA EL', 'TUNEL 150 N. *CANCELA 1 C/MES*', '', ''),
(1420, 'Cedula Fisica', 501560376, 'CORTES GUIDO JOSE', 'FCA COTO 47 CONTG. AL LABORATORIO', 'DE PIPA.FECHA DE PAGO * 16 C/MES*', '', ''),
(1421, 'Cedula Fisica', 501560376, 'CORTES GUIDO JOSE', 'Coto 42  costado de laboratorio.', 'Cel  8692-9541.', '8803-5928', ''),
(1422, 'Cedula Fisica', 900550826, 'CORTES JIMENEZ ANABEL', 'CORONADO CARRETERA PUNTA MALA A LA', 'PAR DE VIVERO LA COSTA CASA CAFE', '2786-5388', ''),
(1423, 'Cedula Fisica', 602790365, 'CORTES JIMENEZ FIDELINA', 'P Canoas S Jorge  400m Norte de la', 'Escuela  Prima 5.000', '2732-3065', ''),
(1424, 'Cedula Fisica', 602790365, 'CORTES JIMENEZ FIDELINA', 'B* GUSANO BARRENADOR AL FINAL DEL', 'CAMINO 400MTS IZQU. CASA MIXTA', '8638-3108', ''),
(1425, 'Cedula Fisica', 600820124, 'CORTES LARA MARIA FELIX', 'SIERPE DEL HOTEL MARGARITA 3ª CASA', 'MANO IZQUIERDA', '', ''),
(1426, 'Cedula Fisica', 600820124, 'CORTES LARA MARIA FELIX', 'SIERPE DEL HOTEL MARGARITA 3era', 'casa  m.izqu. C/x depo. Banco.', '', ''),
(1427, 'Cedula Fisica', 502010641, 'CORTES MARCHENA SECUNDINO', 'PTO. JIMENEZ AL COSTADO DEL', 'AEROPUERTO.', '7355386', ''),
(1428, 'Cedula Fisica', 501660219, 'CORTES MIRANDA DANIEL', 'PUNTA MALA DEL PUENTE 200 MTS', 'ENTRADA VERGEL.  8 C/M', '', ''),
(1429, 'Cedula Fisica', 155803071, 'CORTES MORA NOEL ANTONIO', 'Paso Canoas  frente a la pencion el', 'Descanso    2732-1393', '8597-6988', ''),
(1430, 'Cedula Fisica', 603440467, 'CORTES QUIROS ROCIO', 'Golfito  La Mona  Pulp. El Bosque', '3º cs hacia arriba.', '2775-6263', ''),
(1431, 'Cedula Fisica', 600460971, 'CORTES ROSALES GLADYS', 'NEILY  Bº LA FORTUNA 300 M. DESPUES', 'DE SALON INTERAMERICANO C.RIO CLARO', '7833878', ''),
(1432, 'Cedula Fisica', 397033539, 'CORTES SILVA SAMUEL.', 'EL FERRI LAS TRENZAS.', '', '', ''),
(1433, 'Cedula Fisica', 603260466, 'CORTÉS URBINA ANDREA', 'La Cuesta  300m este de la plaza', 'cobrar en soda de Escuela Juan Lara', '8767-4813', ''),
(1434, 'Cedula Fisica', 106360535, 'CORTES VARGAS ANA LUCIA', 'SINAI DE OSA 250MTS DE LA ESCUELA', 'EN LA PULP.', '3908313', ''),
(1435, 'Cedula Fisica', 501371270, 'CORTEZ ARIAS CRUZ', 'laurel urbanizacion el zaino casa n', '42', '', ''),
(1436, 'Cedula Fisica', 800780716, 'COTO LOPEZ SONIA', 'Golfito  La Mona contiguo a Soda Na', 'taly. Cel 8813-6149.', '2775-1722', ''),
(1437, 'Cedula Fisica', 602030300, 'CRUZ ALEMAN YENNI', 'C. Cortes  Escuela Ojo de Agua 100', 'm sur.', '2780-5382', ''),
(1438, 'Cedula Fisica', 602890672, 'CRUZ ARIAS BRAYAN', 'C Neily  La Fortuna  200 noroeste', 'interamericano. 8795-0390  2783-487', '2775-0793', ''),
(1439, 'Cedula Fisica', 601360876, 'CRUZ CASTAÑEDA EDGAR', 'PIEDRAS BLANCAS KM 35.P 10 DE C/M', '', '', ''),
(1440, 'Cedula Fisica', 601570543, 'CRUZ CASTAÑEDA SEIDY', 'CIUDAD NEILY CONTIG. ESCUELA LA', 'FORTUNA O EN BUFETE 15 C/MES', '2783-5213', ''),
(1441, 'Cedula Fisica', 900590836, 'CRUZ CORDOBA Mª LUZ', 'INVU Kmt 3 CASA # 130', '<P> 16 C/M', '775', ''),
(1442, 'Cedula Fisica', 900590836, 'CRUZ CORDOBA MARIA LUZ', 'GOLFITO  KMT 3', '', '', ''),
(1443, 'Cedula Fisica', 600260699, 'CRUZ CORDOBA OLGA MARIA', 'GOLFITO INVU KM.3 CASA 130', '', '7750582', ''),
(1444, 'Cedula Fisica', 501530692, 'CRUZ ESQUIVEL OLIVIER', 'COTO 42 EN EL COMISARIATO', '', '', ''),
(1445, 'Cedula Fisica', 501530692, 'CRUZ ESQUIVEL OLIVIER', 'COTO 42 EN EL COMISARIATO', '', '', ''),
(1446, 'Cedula Fisica', 603760771, 'CRUZ GOMEZ KATHERIN', 'Golfito Urb Tucker ult fila cs G2', '', '8804-0420', ''),
(1447, 'Cedula Fisica', 601170955, 'CRUZ GUADAMUZ FRANCISCO CC PANCHO', 'La Lucha de Chacarita  600m de en-', 'trada', '8786-5652', ''),
(1448, 'Cedula Fisica', 602070179, 'CRUZ GUADAMUZ PAULINO', 'VENECIA DE OSA  DE LA ESCUELA', '200 MTS AL ESTE', '', ''),
(1449, 'Cedula Fisica', 600480961, 'CRUZ JIMENEZ DANIEL', 'MONTE VERDE FTE A LA ESCUELA', '', '7801872', ''),
(1450, 'Cedula Fisica', 600440238, 'CRUZ JIMENEZ FILIBERTO', 'COLORADO  PASO CANOAS', '', '', ''),
(1451, 'Cedula Fisica', 600440238, 'CRUZ JIMENEZ FILIBERTO.', 'COLORADO DE PASO CANOAS DE LA ESCUE', 'LA 100 MTS AL SUR DESPUES DEL PUENT', '', ''),
(1452, 'Cedula Fisica', 600390861, 'CRUZ JIMENEZ JUAN FIDEL', 'CIUDAD NEILY CENTRO SASTRERIA CRUZ', '', '7833082', ''),
(1453, 'Cedula Fisica', 600390861, 'CRUZ JIMENEZ JUAN FIDEL', 'CIUDAD NEILY CENTRO SASTRERIA CRUZ', 'Cel 8705-2429.', '2783-3082', ''),
(1454, 'Cedula Fisica', 501530692, 'CRUZ JIMENEZ OLIVIER', 'COTO 42  EN EL COMISARIATO', '', '7708230', ''),
(1455, 'Cedula Fisica', 602760695, 'CRUZ LOBO ALEXANDER', 'S Vito  Valle Azul 200 este Escuela', 'cc amarilla y verde 2 plantas. 8515', '2734-3083', ''),
(1456, 'Cedula Fisica', 601860502, 'CRUZ MARTINEZ EMILCE', 'Bº VERA CRUZ 500E. ESCUELA BºNUEVO', 'O COBRAR ESCUELA LAS VEGUITAS.', '7836100', ''),
(1457, 'Cedula Fisica', 601860502, 'CRUZ MARTINEZ EMILCE', 'Bº Veracruz contiguo pulp. Los Na-', 'ranjos.', '2783-6100', ''),
(1458, 'Cedula Fisica', 600940974, 'CRUZ MATAMOROZ EDUARDO', 'COLORADO DE PASO CANOAS  800 MTS S.', 'R DE LA ESCUELA DE COLORADO', '', ''),
(1459, 'Cedula Fisica', 603320348, 'CRUZ MONGE MARIA', 'Km 25 300 Mts N de Pulp La Nubia ', 'Casa Cemento Verde.', '2776-6414', ''),
(1460, 'Cedula Fisica', 501610832, 'CRUZ MORA JESUS', 'Colorado  contiguo a la Escuela', 'calle al Cementerio', '8639-2832', ''),
(1461, 'Cedula Fisica', 502180401, 'CRUZ MORA SERAFIN', 'P Canoas  Colorado  50m sur de la', 'plaza. cs MI. Cel 8748-6708', '8748-6708', ''),
(1462, 'Cedula Fisica', 502430486, 'CRUZ MORA WALTER FRANCISCO', 'COLORADO DE PASO CANOAS 800 MTS', 'SUR DE LA ESCUELA', '', ''),
(1463, 'Cedula Fisica', 601110919, 'CRUZ PORRAS ENRIQUE', 'KILOMETRO 27  500 SUR DE LA ESCUELA', '', '7800634', ''),
(1464, 'Cedula Fisica', 601110919, 'CRUZ PORRAS ENRIQUE', 'KILOMETRO 27  500 SUR DE LA ESCUELA', '2780-1332', '8743-7881', ''),
(1465, 'Cedula Fisica', 601370377, 'CRUZ PRENDAS Mª DE LOS ANGELES', '', '', '', ''),
(1466, 'Cedula Fisica', 601040334, 'CRUZ SANCHEZ GUILLERMO', 'COCAS BAR  GOLF FRENTE AL ESTADIO', '<P> 02 C/M', '775', ''),
(1467, 'Cedula Fisica', 602420869, 'CRUZ SEGURA MARJORIE', 'JIMENEZ CENTRO SODA KALILO', '', '8850-7457', ''),
(1468, 'Cedula Fisica', 900750103, 'CRUZ SOLORZANO GLADYS', 'Bº CARMEN DE ABROJO PULP LAS', 'BRISAS ANTES DELA PLAZA', '', ''),
(1469, 'Cedula Fisica', 603040002, 'CRUZ VIGIL LAURA', 'COTO 63 CASA * 15466', 'FTE AL CLUB', '8779-4779', ''),
(1470, 'Cedula Fisica', 603070121, 'CUANDIKE CORTES DICK', 'santa lucia 300 mts norte de la', 'iglesia asambleas de Dios', '', ''),
(1471, 'Cedula Fisica', 603070121, 'CUANDIKE CORTES DICK', 'SANTA LUCIA DE LAUREL', '* CANCEAL PAGO DE PALMEROS **', '', ''),
(1472, 'Cedula Fisica', 603070121, 'CUANDIQUE CORTES DICK', 'SANTA LUCIA 300 MTS NORTE DE LA', 'IGLESIA ASAMBLEAS DE DIOS.', '', ''),
(1473, 'Cedula Fisica', 603230906, 'CUBERO BADILLA MELISSA', 'Golfito Res Ureña  cont tanque agua', 'CEL 8640-3875.', '2775-2332', ''),
(1474, 'Cedula Fisica', 108650539, 'CUBERO LOBO YAMILETH', 'Palmar  Puerta del Sol  contiguo al', 'Cementerio  Cel 8848-8599.', '2786-3167', ''),
(1475, 'Cedula Fisica', 600960106, 'CUBERO PERAZA MANUEL DE JESUS', 'GOLFITO Bº UREÑA DIAGONAL AL PARQUE', '', '7751315', ''),
(1476, 'Cedula Fisica', 600960106, 'CUBERO PERAZA MANUEL JESUS', 'ureña', '', '', ''),
(1477, 'Cedula Fisica', 600960106, 'CUBERO PERAZA MANUEL JESUS', 'Golfito  Bº Ureña frente a Pulp. El', 'Parque.', '7751315', ''),
(1478, 'Cedula Fisica', 600960106, 'CUBERO PERAZA MANUEL JESUS', 'Golfito  Bº Ureña frente a Pulp. El', 'Parque.', '7751315', ''),
(1479, 'Cedula Fisica', 600310980, 'CUBERO PERAZA ZELMIRA', 'GOLF Bº UREÑA CASA D 8 FRENTE AL', 'TANQUE <P> 16 C/M', '', ''),
(1480, 'Cedula Fisica', 600310980, 'CUBERO PERAZA ZELMIRA', 'GOLF Bº UREÑA CASA D 8 FRENTE AL', 'TANQUE <P> 16 C/M', '', ''),
(1481, 'Cedula Fisica', 202060040, 'CUBERO PICADO HERNAN.', 'CIUDAD NEILY COMANDO SUR O BELLO', 'ORIENTE', '', ''),
(1482, 'Cedula Fisica', 900890413, 'CUBILAS VALLEJOS EVARISTO', 'LA AMAPOLA EL PATIO PUERTO JIMENES', '', '8759-2525', ''),
(1483, 'Cedula Fisica', 600470171, 'CUBILLAS RODRIGUEZ ESTEBAN', 'Amapolas  La Comte  250 antes Pulp.', 'Walter Mono.', '', ''),
(1484, 'Cedula Fisica', 600950013, 'CUBILLO AGUERO CECILIA', 'BARRIO BELLA VISTA  EL BALCON DE MA', 'RISCO', '8581-8365', ''),
(1485, 'Cedula Fisica', 600950013, 'CUBILLO AGUERO CECILIA', 'Golfito  Bella Vista  el Balcón del', 'Marisco.', '2775-0671', ''),
(1486, 'Cedula Fisica', 600950130, 'CUBILLO AGUERO CECILIA.', '', '', '', ''),
(1487, 'Cedula Fisica', 600950013, 'CUBILLO AGUERO CECILIA.', 'DEL JUZGADO PENAL CARRETERA DEL ANT', 'GUO PIC-NIC CASA VERDE Y BLANCO.', '775', ''),
(1488, 'Cedula Fisica', 600370824, 'CUBILLO CUBILLO GUILLERMINA', 'RESIDENCIAL UREÑA  CASA A-8', 'FILA FRENTE A LA ESCUELA', '', ''),
(1489, 'Cedula Fisica', 601420038, 'CUBILLO CUBILLO OLMAN ALEXIS', 'Fca Alajuela  de la Esc 500 Mts Oes', 'Cs Prefabricada Verde', '8716-4392', ''),
(1490, 'Cedula Fisica', 504100314, 'CUBILLO GOMEZ JOSE', 'GOLFITO RECIDENCIAL UREÑA FRTE', 'A LA ESCUELA', '', ''),
(1491, 'Cedula Fisica', 601240815, 'CUBILLO GONZALEZ CECILIO', 'GOLFITO URBANIZACION UREÑA CASA #', 'E 5 P. LOS 03 Y 16 C/M', '', ''),
(1492, 'Cedula Fisica', 601240815, 'CUBILLO GONZALEZ CECILIO', 'GOLFITO URBANIZACION UREÑA CASA #', 'E 5 P. LOS 03 Y 16 C/M', '7750383', ''),
(1493, 'Cedula Fisica', 603170591, 'CUBILLO HERNANDEZ JOHANA', 'PTO JIMENEZ 100MTS O. DE IGLE.', 'CATOLICA. FECHA DE PAGO 11 C/MES', '7355340', ''),
(1494, 'Cedula Fisica', 603140229, 'CUBILLO MONTIEL XINIA', 'Golfito  Llano Bonito  Cabinas doña', 'Nola. Cobrar en Local 4 DLCG', '2775-0867', ''),
(1495, 'Cedula Fisica', 104260925, 'CUBILLO ROJAS GERMAN', 'CONTROL  PULP SUSY <P> 30 C/M', '', '', ''),
(1496, 'Cedula Fisica', 103830457, 'CUBILLO SANCHEZ ULISES OLIVIER', 'San Vito Fila San Rafael  en pulp', 'San Rafael  2784-8017', '6118-5370', ''),
(1497, 'Cedula Fisica', 900610817, 'CUBILLO VARGAS OLIVER', 'La Cuesta a un costado de la', 'Iglesia Catòlica.', '7322674', ''),
(1498, 'Cedula Fisica', 600630055, 'CUBILLO VILLAGRA ALFREDO', 'Laurel  Jobo Peral  Parcela 11  en-', 'trada Bar Bonanza.', '2780-0618', ''),
(1499, 'Cedula Fisica', 502990335, 'DAVILA DAVILA LUISA', 'PUERTO JIMENEZ  FRENTE A LA FINCA', 'EL PORVENIR CASA DE PEDRO VILLEGAS', '', ''),
(1500, 'Cedula Fisica', 601120556, 'DAVILA GUTIERREZ FRANCISCO', 'Golfito  Barrio Bella Vista. Carret', 'era antiguo pic-nic. desp. Puente.', '7751193', ''),
(1501, 'Cedula Fisica', 900380039, 'DAVILA MORA JOSE', 'SAN JUAN DE VERE  I.D.E.', '', '7800641', ''),
(1502, 'Cedula Fisica', 900380039, 'DAVILA MORA JOSE.', 'SAN JUAN DE VERE  DESP SEGUNDO PUEN', 'TE MANO DERECH. PAGA EL 13 DE C/M.', '', ''),
(1503, 'Cedula Fisica', 602040898, 'DAVILA VELASQUEZ JORGE LUIS.', 'CIUDAD NEILLY 75MTS Pulp. las Palma', 's  <P> 01 C/M', '', ''),
(1504, 'Cedula Fisica', 280994584, 'DE GRACIA ATENCIO CECILIA', 'cariari 50 mts norte de iglesia', 'evangelica', '7800107', ''),
(1505, 'Cedula Fisica', 600991026, 'DE GRACIA DE GRACIA ALMA', 'CIUDAD NEILY EN MERCADO MUNICIPAL', 'CLIENTE CLASE *** EXELENTE***', '', ''),
(1506, 'Cedula Fisica', 601240327, 'DE LA ROCHA AGUERO MARGARITA', 'Golfito Barrio Bella Vista carrete', 'ra al pic nic', '7750667', ''),
(1507, 'Cedula Fisica', 6, 'DEGRACIA ATENCIO CECILIA', 'Cariari 1km norte de la Escuela.', 'Telf: 2780-0735.', '', ''),
(1508, 'Cedula Fisica', 600991026, 'DEGRACIA DEGRACIA ALMA', 'Ciudad Neily  Mercado Municipal', 'Soda Buen Gusto. P 01 c/m.', '', ''),
(1509, 'Cedula Fisica', 600991026, 'DEGRACIA DEGRACIA ALMA', 'Ciudad Neily  Mercado Municipal', '', '', ''),
(1510, 'Cedula Fisica', 600991026, 'DEGRACIA DEGRACIA ALMA', 'C. Neily  Mercado Municipal Soda', 'Las Titas.', '2783-3888', ''),
(1511, 'Cedula Fisica', 600991026, 'DEGRACIA DEGRACIA ALMA.', 'CIUDAD N SODA EL BUEN GUSTO MERCADO', '75 ESTE PENCION ELVIRA <P> 30 C/M', '7835687', ''),
(1512, 'Cedula Fisica', 600760218, 'DEL RIO DEL RIO LEONARDO', 'GOLFITO Bº BELLA VISTA CONTG AL', 'MERCADO CASA # 8153 <P> 16 C/M', '-', ''),
(1513, 'Cedula Fisica', 202230424, 'DELGADO ALFARO MISAEL', 'PIEDRAS BLANCAS DEL COMISARIATO 500', 'MTS S SOBRE L`LINEA DEL TREN <P> 19', '', ''),
(1514, 'Cedula Fisica', 602130242, 'DELGADO ARRIOLA ALVARO', '', '', '', ''),
(1515, 'Cedula Fisica', 500970367, 'DELGADO CAMPOS JOSE CESAR', 'COTO 58 DEL  DISPENSARIO 150MTS', 'AL ESTE * FECHA DE PAGO 30 C/MES **', '7811253', ''),
(1516, 'Cedula Fisica', 155805425, 'DELGADO DARCE MERCEDES', 'C. Neily contiguo oficinas PANI.', 'cobrar en Soda el Parqueo.', '8754-9881', ''),
(1517, 'Cedula Fisica', 900400218, 'DELGADO DELGADO CRISTINA', 'LA CUESTA  200 METROS ANTES DE LA', 'PLAZA.UNICA CASA..', '', ''),
(1518, 'Cedula Fisica', 700180433, 'DELGADO DELGADO ESTEVANA.', 'BºBETANIA 150 M NORTE DE MOTEL TICO', 'ALEMAN PALMAR NORTE.PAGA 6 C/MES.', '', ''),
(1519, 'Cedula Fisica', 601630385, 'DELGADO DIAZ DIGNA', '', '', '', ''),
(1520, 'Cedula Fisica', 601630385, 'DELGADO DIAZ DIGNA', 'C Neily  200 m oeste Colegio.', '', '2783-1319', ''),
(1521, 'Cedula Fisica', 602260983, 'DELGADO GONZALEZ SANDRA', 'Bº SAN JORGE ESC CONFRATERNIDAD C.C', 'NATURAL CEMENT. O ESC BAMBITO P.30', '', ''),
(1522, 'Cedula Fisica', 602260983, 'DELGADO GONZALEZ SANDRA', 'Bº SAN JORGE ESC CONFRATERNIDAD', 'C.DE CEMENTO C. PAPAYA.', '7322609', ''),
(1523, 'Cedula Fisica', 601690028, 'DELGADO JIMENEZ RODOLFO', 'GOLFITO km 3 CASA # 89 P.', '30 DE C/M HOSPITAL.', '', ''),
(1524, 'Cedula Fisica', 107870682, 'DELGADO MORALES ENRIQUE', 'SINAI DE OSA DIAGONAL A LA', 'ESCUELA', '7836334', ''),
(1525, 'Cedula Fisica', 101740116, 'DELGADO MORALES HILARIO', 'BARRIO SAN ANDRES GOLFITO', 'SEGUNDA FILA CASAS AL FONDO', '7751781', ''),
(1526, 'Cedula Fisica', 101740116, 'DELGADO MORALES HILARIO', 'BARRIO SAN ANDRES GOLFITO', 'SEGUNDA FILA CASAS AL FONDO', '7751781', ''),
(1527, 'Cedula Fisica', 101740116, 'DELGADO MORALES HILARIO.', 'RIO CLARO  ENTRADA EL GUABO 600 M', 'CALLE A SAN RAMON.', '', ''),
(1528, 'Cedula Fisica', 201890236, 'DELGADO MORERA MAXIMILIANO', 'PIEDRAS BLANCAS FCA LIMON 150MTS E.', 'DE SODA LA AMISTAD CANCELA 8 C/MES*', '7411237', ''),
(1529, 'Cedula Fisica', 601051308, 'DELGADO PIMENTEL BACILIA', 'La Cuesta centro tienda ropa', 'americana frente al parque.', '7322984', ''),
(1530, 'Cedula Fisica', 601051308, 'DELGADO PIMENTEL BASILIA', 'LA CUESTA 200 Mts ANTES DE LA', 'ESCUELA <P> 30 C/M', '7322984', ''),
(1531, 'Cedula Fisica', 602390459, 'DELGADO PIMENTEL BASILIA', 'LA CUESTA 200M. ANTES DE LA ESCUELA', '', '7322984', ''),
(1532, 'Cedula Fisica', 270132771, 'DELGADO RAMIREZ NOEMI.', 'PASO CANOAS  DIAGONAL A LA PARADA', 'TAXI PBL FRET A CARNICERIA BENEDICT', '', ''),
(1533, 'Cedula Fisica', 104360774, 'DELGADO SALAZAR JORGE', 'CANOAS 100SUR OESTE DE LA BOMBA TIC', 'A CABINAS VIANEY', '8913-8891', ''),
(1534, 'Cedula Fisica', 600830249, 'DELGADO SOTO FEDERICO.', 'TINOCO PULPERIA MIRAFLORES.', '', '', ''),
(1535, 'Cedula Fisica', 103310670, 'DELGADO VALVERDE ALVARO', 'Laurel  Cuadrante  casa 91  fte a', 'la plaza.', '2780-1581', ''),
(1536, 'Cedula Fisica', 202410476, 'DELGADO VARELA ALBINO', 'RIO CLARO  LAGARTO ULTIMA PULPERIA', '', '', ''),
(1537, 'Cedula Fisica', 103710286, 'DELGADO VARGAS ALBERTO', 'COYOCHE  500MTS SUR DE LA ESCUELA', '* PALMERO *', '', ''),
(1538, 'Cedula Fisica', 601790607, 'DELGADO VEGA FLOR', 'GOLFITO Bº LAS ALAMEDAS X ICE CASA', 'Nº 4649 ** FECHA DE PAGO 2 C/MES **', '7750844', ''),
(1539, 'Cedula Fisica', 602400612, 'DELGADO VIQUEZ ROBERTO', 'COTO 47 DETRAS DEL TALLER MECANICO', 'DANIEL ARCE CASA 11089', '2781-1234', ''),
(1540, 'Cedula Fisica', 601031358, 'DIAS FIGUEROA FRANCISCO', 'Santa Rosa  de la Iglesia Catolica', '50 M. Este 2da casa.', '8764-0477', ''),
(1541, 'Cedula Fisica', 500870569, 'DIAZ ANGULO ANGEL ISIDRO', 'RIO CLARO KM. 30 200MTS OESTE DE LA', 'PULPERIA * CANCELA 2 CADA MES *', '', ''),
(1542, 'Cedula Fisica', 500870569, 'DIAZ ANGULO ANGEL ISIDRO', 'RIO CLARO KM 30  200 MTS OESTE DE', 'LA PULPERIA  CANCELA 2 DE CADA MES', '', ''),
(1543, 'Cedula Fisica', 602490513, 'DIAZ BERMUDEZ DAMARIS', 'Bº LLANO BONITO  CASA 4573. BUSCAR', 'EN DLCG LOCAL 1.', '2775-1304', ''),
(1544, 'Cedula Fisica', 602610607, 'DIAZ BERROCAL MARIO', 'Coto 52 frente a galerón de abono.', 'Casa 10518.', '8731-7271', ''),
(1545, 'Cedula Fisica', 101810527, 'DIAZ BRENES REGINA.', 'VILLA BRICEÑO; Km 29 VILLA FOSTER', 'ENTRADA A LAS VIQUILLAS.', '', ''),
(1546, 'Cedula Fisica', 500740508, 'DIAZ CASTILLO RAMON', 'CAIMITO DE LAUREL CASA No. 83', '', '7800357', ''),
(1547, 'Cedula Fisica', 500800238, 'DIAZ CASTRILLO MIGUEL ANGEL', 'GOLFITO  KMT 5 DESP DE LA PULP 4 ta', 'CASA MANO IZQUIERDA', '7751810', ''),
(1548, 'Cedula Fisica', 602120211, 'DIAZ CHAVES WILBERTH', 'GOLFITO KM 3 DE TALLER MILTON 50 AL', 'N. P. 03 DE C/M', '', ''),
(1549, 'Cedula Fisica', 601410158, 'DIAZ DIAZ CARLOS.', 'CIUDADELA GUAYCARA FRENTE AL ICE---', 'Nº31 RIO CLARO.P-16 C/M.', '789', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(1550, 'Cedula Fisica', 600510294, 'DIAZ DIAZ EVELIO', 'GOLFITO  BARRIO BELLA VISTA', 'CASA Nº 4215-B FRTE A GENCIA FISCAL', '7750351', ''),
(1551, 'Cedula Fisica', 900760450, 'DIAZ DIAZ GENOVEVA', 'EL CARMEN DE ABROJO FRENTE AL TELEF', 'PUBLICO  Casa Nº 32. P. 15 C/M', '', ''),
(1552, 'Cedula Fisica', 600370817, 'DIAZ DIAZ INOCENTE', 'PUERTA DEL SOL  RIO LA BONITA', '<P> 06 C/M', '', ''),
(1553, 'Cedula Fisica', 601160926, 'DIAZ DIAZ NORMA', 'SAN JUAN DE SIERPE 1 KM. S. DE LA', 'ESCUELA * CANCELA 11 CADA MES **', '3302609', ''),
(1554, 'Cedula Fisica', 602520146, 'DIAZ FIGUEROA GREIVIN', 'COQUITO DE OSA', '', '', ''),
(1555, 'Cedula Fisica', 500600527, 'DIAZ GARCIA JOSE HIGINIO', 'JIMENEZ CENTRO X DETRAS DEL BANCO', 'NACIONAL', '7355682', ''),
(1556, 'Cedula Fisica', 102390464, 'DIAZ GUERRERO ROSA', 'Bº EL CARMEN CASA 271 600M. O.', 'DE IGLECIA CATOLICA 7 C/MES..', '', ''),
(1557, 'Cedula Fisica', 501600919, 'DIAZ MATARRITA CARMEN', 'Pto Jiménez  100 Este de Parada de', 'buses  última casa a la derecha.', '7355672', ''),
(1558, 'Cedula Fisica', 502750076, 'DIAZ MATARRITA ZAIDA', 'BARRIO BARRIO EL BANBU 150MT NORTE', 'DE LA PLAZA', '2735-5698', ''),
(1559, 'Cedula Fisica', 600870843, 'DIAZ MORALES ISABEL CC MIGUELITO', 'Palmar Norte  Bº 1º Marzo detrás an', 'tigua Plantas I.C.E', '2786-6197', ''),
(1560, 'Cedula Fisica', 602740169, 'DIAZ MUÑOZ ELI ROXANA', 'P JIMENEZ URB. EL COLEGIO  Trabaja', 'en Super BM. Cel 8851-3442.', '2735-5009', ''),
(1561, 'Cedula Fisica', 501460933, 'DIAZ NAVAS FRANKLIN', '', '', '', ''),
(1562, 'Cedula Fisica', 601830152, 'DIAZ OBREGON DUNIA MARIA', 'C. CORTES Bº CANADA A UN COSTADO', 'IGLECIA MARANATA CASA Nº 13 20C/M', '', ''),
(1563, 'Cedula Fisica', 601200710, 'DIAZ PEREZ BAYARDO', 'PUERTO JIMENEZ ASENTAMIENTO BAMBU', 'PARCELA Nº 7', '7355535', ''),
(1564, 'Cedula Fisica', 103840295, 'DIAZ PICADO ALVARO', 'PASO CANOAS 100 AL SUR Y 100 OESTE', 'DE LA ESCUELA ADVENTISTA', '', ''),
(1565, 'Cedula Fisica', 105900316, 'DIAZ RAMIREZ ANA LORENA', 'GOLFITO BºALAMEDAS DIAGONAL A CASA', 'DE HUESPEDES ANTIGUOS TRIBUNALES.', '7750937', ''),
(1566, 'Cedula Fisica', 601530546, 'DIAZ SANDI IRENE', 'CIUDAD NEILLY BARRIO EL CARMEN CASA', '#37 TRAB.BANCO POPULAR', '2240831', ''),
(1567, 'Cedula Fisica', 107490479, 'DIAZ VARGAS OLGER', 'la estrella de comte del bar el', 'zarpe 500 mts sur.', '8452548', ''),
(1568, 'Cedula Fisica', 501880061, 'DIAZ ZUÑIGA SARA MARIA.', '350 MTS DEL COLEGIO DE LA CUESTA', 'HACIA EL SUR 1a.CASA M/D.P-30 C/M.', '', ''),
(1569, 'Cedula Fisica', 201920872, 'DO RIO CARMONA ABDEL', '6 Vito  Tres Ríos  200m sur Tanque', 'AyA. Cel 8336-1747   2773-5071.', '2773-4600', ''),
(1570, 'Cedula Fisica', 155800402, 'DOMINGUEZ AGUILAR NATIVIDA', 'JIMENEZ GOLFITO DE LA BOMBA 200 MTS', 'HACIA TALLER JOCSAN Y 25 ESTE', '', ''),
(1571, 'Cedula Fisica', 270148315, 'DOMINGUEZ AGUILAR NATIVIDAD', 'PUERTO JIMENEZ  URBA EL COLEGIO', '1558002323', '7355025', ''),
(1572, 'Cedula Fisica', 601630279, 'DOMINGUEZ AVILES ANA CECILIA', 'Km 25 de Laurel  Diag Iglesia Evan-', 'gelio Completo. Cel 8853-2411.', '2780-1910', ''),
(1573, 'Cedula Fisica', 601290551, 'DOMINGUEZ ESPINOZA CRISTINA.', 'CARMEN DE ABROJO', '15 C/M', '', ''),
(1574, 'Cedula Fisica', 602620246, 'DUARTE ALEMAN WILBER ENOC', 'COTO 45 FTE. TELEF. PUBLICO', '** FECHA DE PAGO 2 CADA MES **', '', ''),
(1575, 'Cedula Fisica', 700420048, 'DUARTE BERMUDEZ CATALINO', 'I.N.V.U. DE LAUREL 300 MTS OESTE Y', '150 M SUR DE TEMPLO CORDERO DE DIOS', '', ''),
(1576, 'Cedula Fisica', 700420048, 'DUARTE BERMUDEZ KATALINO', '', '', '', ''),
(1577, 'Cedula Fisica', 603090730, 'DUARTE DUARTE JONATHAN', 'Coto 50 cs 10631', '', '8945-5022', ''),
(1578, 'Cedula Fisica', 602250265, 'DUARTE QUINTERO MARIA', 'JIMENEZ URBA EL COLEGIO CASA*2', '27355950', '8625-4760', ''),
(1579, 'Cedula Fisica', 603430267, 'DUARTE ROSALES JUNIOR ALBERTO', 'Km 25 Laurel 1.5km Escuela la Nuvia', '', '', ''),
(1580, 'Cedula Fisica', 900640193, 'DUARTES CHAVES ROMILIO', 'Las Nubes de Caracol  100 Sureste', 'Esc. San Jorge. Telf: 8353-4982.', '', ''),
(1581, 'Cedula Fisica', 602740349, 'DURAM ROBLES SABINO', 'Sinai o en Piedras blancas ?x', 'el hermano martin trab  en BARCA.', '', ''),
(1582, 'Cedula Fisica', 103740220, 'DURAN ACUÑA WILFRIDO', 'RIO BONITO FRENTE A LA PLAZA DE LOS', 'DEPORTES 86599015', '2783-1249', ''),
(1583, 'Cedula Fisica', 202230169, 'DURAN CORDOBA VICTOR JULIO', 'BARRIO BELLA VISTA  CASA 8155 DETRA', 'DE LA TORRE DE CLARO BLANCO HUESO', '2775-2632', ''),
(1584, 'Cedula Fisica', 600630538, 'DURAN MORA JOSEFA', 'C. NEILY 175 MTS N DE LAS CABINAS', 'EL RANCHO P. 25 DE C/M.', '', ''),
(1585, 'Cedula Fisica', 600730403, 'DURAN MORA YOLANDA', 'Fca GUANC D`PULP COOPEFUTURO 200 Mt', 'SUR Y 50 OESTE <P> 19 C/M', '*-*-*-*', ''),
(1586, 'Cedula Fisica', 111970707, 'DURAN QUESADA FRANCISCO', 'La Julieta Villa briceño Cs Nº1', 'Pulp  La Franka. 8791-8011', '8803-8574', ''),
(1587, 'Cedula Fisica', 602740349, 'DURAN ROBLES SABINO', 'PIEDRAS BLANCAS URB. VILLAS DEL S.', 'CASA Nº 65 ** 8 C/MES **', '7411303', ''),
(1588, 'Cedula Fisica', 900640797, 'DURAN SANCHEZ ABELINO', 'KILOMETRO 37', '', '', ''),
(1589, 'Cedula Fisica', 900640797, 'DURAN SANCHEZ ABELINO', 'KILOMETRO 37', '**CANCELA 8 CADA MES **', '', ''),
(1590, 'Cedula Fisica', 900640797, 'DURAN SANCHEZ ABELINO.', 'KM 37 S.MIGUEL DE LA ESCUELA A 1 km', 'Cobrar  Negocio de Efraìn Gutièrrez', '', ''),
(1591, 'Cedula Fisica', 900640791, 'DURAN SANCHEZ ABELINO.', 'KM 37 S.MIGUEL DE LA ESCUELA A 1 km', 'Cobrar  Negocio de Efraìn Gutièrrez', '', ''),
(1592, 'Cedula Fisica', 103770774, 'DURAN SANCHEZ GERARDO', 'RIO CLARO SAN MIGUEL 2.5 KM DEL', 'EBAIS POR LAS QUEBRADAS.', '', ''),
(1593, 'Cedula Fisica', 501461181, 'DURAN VENEGAS JOSE JOAQUIN', 'la union de comte entrada por el', 'colegio', '', ''),
(1594, 'Cedula Fisica', 600660633, 'ELIZONDO BERMUDEZ LONGINO', 'la estrella de comte kilometro y', 'medio al norte de escuela', '', ''),
(1595, 'Cedula Fisica', 600660635, 'ELIZONDO BERMUDEZ LONGINO', 'LA ESTRELLA DE CONTE CLIENTE', '\"CONOSIDO CLASE \"\" A \"\" ..\"', '', ''),
(1596, 'Cedula Fisica', 103470205, 'ELIZONDO ELIZONDO ZENEIDA', 'Río Claro  100 m Sur del Aserradero', 'Impala  Soda Nena.', '7899503', ''),
(1597, 'Cedula Fisica', 601370266, 'ELIZONDO GARITA BLANCA', 'Ciudad Neily Palma Real Abastecedor', 'la Flor', '2783-5161', ''),
(1598, 'Cedula Fisica', 601370266, 'ELIZONDO GARITA BLANCA', 'Ciudad Neily Palma Real Abastecedor', 'La Flor', '2783-5161', ''),
(1599, 'Cedula Fisica', 106040216, 'ELIZONDO GARITA MARIA LUISA', 'Bº el carmen de abrojo  de pulp el', 'Garrotazo  25 Sur  2783-3147', '8633-2503', ''),
(1600, 'Cedula Fisica', 900850169, 'ELIZONDO MONTERO ENID', 'P Canoas  El Triunfo  cs BE-3 fte a', 'Policía Anchía. cs verde.', '2732-1863', ''),
(1601, 'Cedula Fisica', 900730801, 'ELIZONDO MONTERO JORGE ELIAS', 'Paso Canoas  ciudadela el triunfo', 'plaza canoas 8592-8345', '', ''),
(1602, 'Cedula Fisica', 101660424, 'ELIZONDO ROJAS ANTONIO', 'CIUDADELA GONZALEZ PULP EL JARDIN', 'FRENTE TEL PUBLIC <P> 01 C/M', '783', ''),
(1603, 'Cedula Fisica', 203160086, 'ELIZONDO ROJAS ISABEL', 'LA CENTRAL CAMPESINA 250MTS AL OEST', 'E DE LA PULPE CASA AL FONDO CELESTE', '2781-1096', ''),
(1604, 'Cedula Fisica', 602620152, 'ELIZONDO SANCHEZ KATHIA', 'P Jiménez  Riyito  1km iglesia Cató', 'lica.', '', ''),
(1605, 'Cedula Fisica', 201930714, 'ELIZONDO VARGAS ELADIO', 'ABROJO', 'TAXISTA CIUDAD NILY', '', ''),
(1606, 'Cedula Fisica', 106320041, 'ELIZONDO VARGAS OLGER', 'GOLF Bº BELLA VISTA C. 4263', 'CERRO MONDONGO <P> 16 C/M', '7750390', ''),
(1607, 'Cedula Fisica', 106320041, 'ELIZONDO VARGAS OLGER', 'Bella Vista  Cerro Mondongo Casa Nº', '4463.', '', ''),
(1608, 'Cedula Fisica', 501570889, 'ENRIQUEZ ANGULO EVELIA', 'CAIMITO  DETRAS DE LA ESCUELA', 'CASA Nº 34 COLOR AMARILLO', '7800384', ''),
(1609, 'Cedula Fisica', 900380703, 'ENRIQUEZ ENRIQUEZ ANA NATALIA', 'Bº Carmen Abrojo. 100m este Parque', 'infantil.', '2783-6029', ''),
(1610, 'Cedula Fisica', 501340310, 'ENRIQUEZ GRANADOS JUAN', 'Casa frent al Correo o en comosaria', 'to parada de taxis laur.p. 30 c/m', '', ''),
(1611, 'Cedula Fisica', 204710300, 'ERRANO LORIA ADORACION CC DORA', 'GOLFITO CIVIL COSTADO DE ESCUELA', 'Cobrar DEP chinamos comida afuera', '2775-3042', ''),
(1612, 'Cedula Fisica', 602190362, 'ESCALANTE MADRIGAL ALEXANDER', 'C. Cortes 50m N. 100m O y', '50m N. Iglesia Bautista. X ICE.', '', ''),
(1613, 'Cedula Fisica', 603100982, 'ESCALANTE VEGA JORGE MAURICIO', 'P Canoas  S Jorge  100m Sur Iglesia', 'Católica. Cel 8742-2047.', '2732-1572', ''),
(1614, 'Cedula Fisica', 602860317, 'ESCOCIA ESCOCIA MARIA', 'LA CAMPIÑA DIAGONAL A LA PLAZA', '', '2776-5014', ''),
(1615, 'Cedula Fisica', 107240647, 'ESPINOZA ALVARADO ANGEL', 'P Jiménez  La Amapola fte al Rastro', 'Urb. nueva cs 18.', '', ''),
(1616, 'Cedula Fisica', 601590682, 'ESPINOZA ALVAREZ EDUARDO', '', '', '', ''),
(1617, 'Cedula Fisica', 502950661, 'ESPINOZA ARIAS YOLANDA', 'Fincas Central Campesina  300m de', 'Iglesia Católica. Cel 8741-1355', '8501-8009', ''),
(1618, 'Cedula Fisica', 601400726, 'ESPINOZA AZOFEIFA HERLIN', 'Ciudad Neilly barrio la union', 'frente a taller mecanico campos', '', ''),
(1619, 'Cedula Fisica', 500560883, 'ESPINOZA BERMUDEZ MIGUEL ANGEL', 'SAN JORGE CONTIGUO A PULP LA', 'MARIPOSA 200 MTS DE LOS TANQUES', '', ''),
(1620, 'Cedula Fisica', 800520162, 'ESPINOZA BURGOS ANA JULIA', '', '', '', ''),
(1621, 'Cedula Fisica', 602080045, 'ESPINOZA CABALLERO SANTIAGO.', 'CIUDAD NEILY  SUPER ANGULO O EN Bº', '22 DE OCTUBRE CASA #15 H P 02 C/MES', '783', ''),
(1622, 'Cedula Fisica', 502900548, 'ESPINOZA CARMONA RUTH', 'LA CUESTA CIUDADELA TAMAYO', 'CASA Nº 19 O TIENDA SALOMON', '7321127', ''),
(1623, 'Cedula Fisica', 600610961, 'ESPINOZA CASTILLO ODILY', 'RIO NUEVO  CASA 23-B A UN COSTADO', 'DE LA ESCUELA', '2783-3421', ''),
(1624, 'Cedula Fisica', 601610040, 'ESPINOZA CERDAS ANA MARIA.', 'BELLA LUZ DE LA VACA  400 Mts OESTE', 'DEL SALON ABANGARES.  P. 30 CADA M.', '', ''),
(1625, 'Cedula Fisica', 607800126, 'ESPINOZA CHAVARRIA BENITO', 'PLAZA CANOAS LA CIUDADELA', 'NUEVA CASA Nª 011', '7322892', ''),
(1626, 'Cedula Fisica', 501860862, 'ESPINOZA CRUZ ANTONIO', 'C Cortés  fte al Estadio cs blanca', 'de cemento.', '8569-0575', ''),
(1627, 'Cedula Fisica', 601440953, 'ESPINOZA DEGRACIA DAVID', 'La Cuesta  Cuervito  Destacamento d', 'e policía de Cuervito.', '', ''),
(1628, 'Cedula Fisica', 280388701, 'ESPINOZA ESPINOZA DEMETRIO', 'GOLFITO LA MONA', '', '*-*-*-*', ''),
(1629, 'Cedula Fisica', 601930065, 'ESPINOZA ESPINOZA DORA', 'B. SAN JORGE 300N ESCUELA PULP.', 'GOMEZ', '7321964', ''),
(1630, 'Cedula Fisica', 900450393, 'ESPINOZA ESPINOZA EMILCE', 'LA PURRUJA CONTIGUO AL BAR LA JUNGL', 'GOLFITO <P> 03 C/M', '', ''),
(1631, 'Cedula Fisica', 501170600, 'ESPINOZA ESPINOZA ERAIDA', 'CIUDAD NEILY B SAN RAFAEL CONTIGUO', 'A IMPRENTA REYES', '7835059', ''),
(1632, 'Cedula Fisica', 501170600, 'ESPINOZA ESPINOZA ERAIDA', 'Ciudad Neily  Contigo a Imprenta', 'a Imprenta Reyes', '2783-5079', ''),
(1633, 'Cedula Fisica', 502070345, 'ESPINOZA ESPINOZA JUAN RAFAEL', 'Laurel  Cenizo  300m norte Escuela', '', '2780-0573', ''),
(1634, 'Cedula Fisica', 500980903, 'ESPINOZA ESPINOZA PEDRO', 'GOLF  Bº BELLA VISTA TALLER', 'ESPINOZA <P> 30 C/M', '775', ''),
(1635, 'Cedula Fisica', 500980903, 'ESPINOZA ESPINOZA PEDRO', 'GOLF  Bº BELLA VISTA TALLER', 'ESPINOZA', '7750932', ''),
(1636, 'Cedula Fisica', 500980903, 'ESPINOZA ESPINOZA PEDRO', 'GOLF  Bº BELLA VISTA TALLER', 'ESPINOZA', '7750932', ''),
(1637, 'Cedula Fisica', 603330035, 'ESPINOZA GARITA HAROLD WAGNER', 'Río Claro  San Ramón  Super La Amis', 'tad.', '8737-2580', ''),
(1638, 'Cedula Fisica', 270832833, 'ESPINOZA GERONIMO MIGUEL', 'F.C.A. GUANACASTE DE LA ENTRADA 300', 'MTS A DERECHA CASA CONTG A CORRAL', '', ''),
(1639, 'Cedula Fisica', 501300507, 'ESPINOZA GOMEZ DELFINA', 'Ciudad Neily; 100 Mts Este de la', 'Planta del ICE  taller de Juan', '', ''),
(1640, 'Cedula Fisica', 501300507, 'ESPINOZA GOMEZ DELFINA', 'SALAS VINDAS FRENTE ANTG PULP LAS', 'PALMAS 2da CASA MANO DERECHA', '7835029', ''),
(1641, 'Cedula Fisica', 602550833, 'ESPINOZA GONZALEZ FANY', 'LA MARIPOSA 1KM DE PLAZA A COLORADO', 'CONTG. 1ER PUENTE CANCELA 15 CADA M', '', ''),
(1642, 'Cedula Fisica', 501790212, 'ESPINOZA GUTIERREZ FABIAN.', 'RINCON DE BEREH DE LAUREL CASA DE', 'CEMENTO JUNTO AL PALMAR.P.15 C/M.', '', ''),
(1643, 'Cedula Fisica', 155806439, 'ESPINOZA JIRON JULIA', 'PTO JIMENEZ LA URBA.  EL COLEGIO', 'CASA Nº G-6  ***', '7836743', ''),
(1644, 'Cedula Fisica', 602680334, 'ESPINOZA LOPEZ EDDY', 'CARIARI 300 S DE LA IGLESIA EVAN', '*** CANCELA PAGO PALMEROS ***', '7321218', ''),
(1645, 'Cedula Fisica', 107620181, 'ESPINOZA MARIN ROSE MARI', 'PUERTO JIMENEZ  LA PALMA SODA', 'LAS PALMAS.', '', ''),
(1646, 'Cedula Fisica', 500380518, 'ESPINOZA MATARRITA GENARO', 'Agua Buena S Miguel 150 MD de Pulp.', 'cs celeste madera.', '8619-6264', ''),
(1647, 'Cedula Fisica', 601660335, 'ESPINOZA MONTERO FELIX.', 'LAUREL DE LA BOMBA DE GASOLINA 300', 'MTS SUR CALLE A BAMBITO.', '', ''),
(1648, 'Cedula Fisica', 601170800, 'ESPINOZA MONTERO GERARDO', 'La Chacarita  Piedras Blancas  Fca', 'Alajuela 100 metros del Colegio', '8772-4604', ''),
(1649, 'Cedula Fisica', 601061118, 'ESPINOZA MORA GUILLERMINA', 'P Canoas  Darizara  Casa J1.', '', '2732-3253', ''),
(1650, 'Cedula Fisica', 501590959, 'ESPINOZA MORA NORMA', 'LAUREL CENTRO AUN COSTADO DE LA PLA', 'ZA DE DEPORTES CASA BLANCA 2 PISOS', '2780-0183', ''),
(1651, 'Cedula Fisica', 500570135, 'ESPINOZA MORENO NEMESIO CC LEONARDO', 'Río Claro  100 N Antes de Escuela.', '', '7899936', ''),
(1652, 'Cedula Fisica', 500860842, 'ESPINOZA OBANDO JUANITA', 'R Claro  Bº Santiago  fte a Plantel', 'Ice.', '', ''),
(1653, 'Cedula Fisica', 501280301, 'ESPINOZA PEÑA HERIBERTO', 'LA CUESTA DETRAS DE LA IGLESIA', 'TESTIGOS DE JEHOVA', '', ''),
(1654, 'Cedula Fisica', 501660966, 'ESPINOZA PEÑA JUAN.', 'ESCUELA CONFRATERNIDAD 300 MTS AL S', 'BARRIO SAN JORGE PASO CANOAS.P-2C/M', '732', ''),
(1655, 'Cedula Fisica', 207010431, 'ESPINOZA PEREZ AUDEL', 'PALMAR NORTE TAXISTA', '', '', ''),
(1656, 'Cedula Fisica', 270143146, 'ESPINOZA PEREZ AUDEL', 'PALMAR NORTE', '', '', ''),
(1657, 'Cedula Fisica', 207010431, 'ESPINOZA PEREZ AUDEL', 'PALMAR NORTE EN PARADA DE TAXIS', '', '7866063', ''),
(1658, 'Cedula Fisica', 155816166, 'ESPINOZA PEREZ AUDEL', 'PALMAR NORTE EN PARADA DE TAXIS', 'Cel 8842-3222.  8833-4139.', '2786-6063', ''),
(1659, 'Cedula Fisica', 600870784, 'ESPINOZA RIOS OLGA', 'COLORADO DE PASO CANOAS.', '** CANCELA 10 C/MES **', '', ''),
(1660, 'Cedula Fisica', 500420155, 'ESPINOZA SILVA LUCIANO.', 'COTO 44 CLUB', '', '', ''),
(1661, 'Cedula Fisica', 601570896, 'ESPINOZA TORRENTES ANA VICTORIA', 'Caracol Norte  600m del puente cont', 'a acueductos.', '8623-8619', ''),
(1662, 'Cedula Fisica', 601650723, 'ESPINOZA VEGA ALLAN ALBERTO.', 'LA FORTUNA.', '', '', ''),
(1663, 'Cedula Fisica', 502110323, 'ESPINOZA VILLALOBOS CARLOS', 'LAUREL INVU POR LA PULPERIA', '', '', ''),
(1664, 'Cedula Fisica', 600290304, 'ESPINOZA VILLALOBOS CLAUDIO', 'LAUREL COSTADO N.T DE LA PLAZA CONT', 'GUO ABASTESEDOR EL TRIUNFO.', '7800037', ''),
(1665, 'Cedula Fisica', 602900304, 'ESPINOZA VILLALOBOS CLAUDIO', 'Laurel costado N plaza contiguo', 'Abast. El Triunfo.', '2780-0037', ''),
(1666, 'Cedula Fisica', 600290304, 'ESPINOZA VILLALOBOS CLAUDIO', 'Laurel  Costado norte de Plaza cs', 'celeste.', '2780-0037', ''),
(1667, 'Cedula Fisica', 502040326, 'ESPINOZA VILLALOBOS ESDRAS.', 'FCA HACIENDA VICTORIA COBRAR EN', 'LAS OFICINAS.', '7866431', ''),
(1668, 'Cedula Fisica', 600270628, 'ESPINOZA VILLALOBOS ISACC', 'EN EL I.N.V.U. DE LAUREL POR LA', 'PULPERIA EL I.N.V.U.', '7800044', ''),
(1669, 'Cedula Fisica', 502190324, 'ESPINOZA VILLALOBOS SONIA', '', '', '', ''),
(1670, 'Cedula Fisica', 601440497, 'ESQUIVEL ALFARO ANA BERTA.', 'GOLFITO I.N.V. KM 3 A UN COSTADO DE', 'TESTIGOS JEHOVA CASA DEL FONDO 30CM', '*-*-*-*', ''),
(1671, 'Cedula Fisica', 104300419, 'ESQUIVEL ALFARO MARIO MARTIN', 'GOLFITO  I.N.V.U. LA ROTONDA', 'C PLANTA BAJA #14.', '', ''),
(1672, 'Cedula Fisica', 600480302, 'ESQUIVEL CHAVEZ CARLOS', 'GOLFITO LA PURRUJA CONTG. AL', 'PUENTE DE ORO.', '', ''),
(1673, 'Cedula Fisica', 203100118, 'ESQUIVEL GARCIA JOSE ANGEL', 'San Vito  las alturas de coton', 'detras del cine ', '8889-3603', ''),
(1674, 'Cedula Fisica', 603360623, 'ESQUIVEL MUÑOZ GUSTAVO ADOLFO', 'C Neily  La Colina  cs 39', 'Cobrar en INS.', '8976-2260', ''),
(1675, 'Cedula Fisica', 601350707, 'ESQUIVEL PORTUGUEZ GREGORIO', 'Ccortes  Bo San Antonio  25 mts Est', 'la Iglesia Catolica  reac. 20/03/11', '7888524', ''),
(1676, 'Cedula Fisica', 202470316, 'ESQUIVEL TORRES MIGUEL ANGEL', 'GOLFITO  KM 3 CASA MIXTA', '', '7751116', ''),
(1677, 'Cedula Fisica', 202470316, 'ESQUIVEL TORRES MIGUEL ANGEL', 'GOLFITO  KMT 3 CASA MIXTA', 'COLOR CELESTE', '7751116', ''),
(1678, 'Cedula Fisica', 202470316, 'ESQUIVEL TORRES MIGUEL ANGEL', 'GOLFITO  KMT 3 CASA MIXTA', 'COLOR CELESTE', '7752930', ''),
(1679, 'Cedula Fisica', 602600372, 'ESTELLER JIMENEZ ROSIBEL', 'LA PALMA PUERTO JIMENEZ', '', '8616-5582', ''),
(1680, 'Cedula Fisica', 577262059, 'ESTRIBI RIVERA MARTIN.', 'PASO CANOAS.', '', '', ''),
(1681, 'Cedula Fisica', 601320734, 'EVIN ALBERTO SEVILLA AGUIRRE', 'PALMAR NORTE B* 1DE MARZO 1 ENTRADA', 'PENULTIMA CASA', '7866397', ''),
(1682, 'Cedula Fisica', 603080930, 'FAJARDO AMAYA FRANCISCA', 'LOS PLANES MINI SUPER  EL 32', '** CANCELA 11 CADA MES **', '8112102', ''),
(1683, 'Cedula Fisica', 602560522, 'FAJARDO AVENDAÑO ELIAS', 'GOLF IMAS Bº SAN ANDRES CASA # 01', '<P> 03 C/M', '', ''),
(1684, 'Cedula Fisica', 602560522, 'FAJARDO AVENDAÑO ELIAS', 'GOLF CARNICERIA GOLFITO  FRTE', 'A LA BOMBA', '', ''),
(1685, 'Cedula Fisica', 500360615, 'FAJARDO CUBILLO JESUS', 'pago x dep bancario', '', '', ''),
(1686, 'Cedula Fisica', 500360615, 'FAJARDO CUBILLO JESUS', 'pago x dep bancario', '', '', ''),
(1687, 'Cedula Fisica', 500360615, 'FAJARDO CUBILLO JESUS.', 'ANTES DE TINOCO CHISPERO', 'ENTRANDO. MANO DERECHA. 100 MTS', '', ''),
(1688, 'Cedula Fisica', 800540676, 'FAJARDO FAJARDO MARCELINO.', 'ASAMBLEAS DE DIOS LAUREL', 'P.30 C/M', '*-*-*-*', ''),
(1689, 'Cedula Fisica', 501510330, 'FAJARDO JIMENEZ DIONICIA', 'monteverde', '', '', ''),
(1690, 'Cedula Fisica', 501510330, 'FAJARDO JIMENEZ LEONICIA', 'MONTE VERDE DE LA VACA', '', '7809086', ''),
(1691, 'Cedula Fisica', 501510330, 'FAJARDO JIMENEZ LEONICIA', 'MONTE VERDE DE LA VACA', '', '7809086', ''),
(1692, 'Cedula Fisica', 501510330, 'FAJARDO JIMENEZ LEONICIA.', 'SANTA LUCIA  ENTRADA A MONTE VERDE', 'DE LA PULP 1 Kmt NORTE <P> 17 C/M', '', ''),
(1693, 'Cedula Fisica', 502590309, 'FAJARDO JIMENEZ MARVIN', 'LOS PLANES FTE. ALBERGUE TESORO', '', '9828811', ''),
(1694, 'Cedula Fisica', 601061077, 'FALLAS CANTILLANO HILDA Mª', 'COLORADITO PASO CANOAS', '<P> OFICINA', '-', ''),
(1695, 'Cedula Fisica', 301280233, 'FALLAS CASTILLO RAFAEL', 'PTO. JIMENEZ CAÑASA COLONIA', 'JUANITO MORA', '', ''),
(1696, 'Cedula Fisica', 301280233, 'FALLAS CASTILLO RAFAEL', 'PTO JIMENEZ CAÑASA X LA PLAZA DE', 'DEPORTES.  CANCELA 11 CADA MES', '', ''),
(1697, 'Cedula Fisica', 102230222, 'FALLAS CHAVARRIA JOSE ROMULO', 'Coto 49 El Dueño De la Pulperia', 'Mary', '2781-1401', ''),
(1698, 'Cedula Fisica', 102230222, 'FALLAS CHAVARRIA ROMULO', 'Coto 49 pulp. Mary.', '', '2781-1401', ''),
(1699, 'Cedula Fisica', 102230222, 'FALLAS CHAVARRIA ROMULO.', 'COTO 49 CASA #10437 A UN COSTADO', 'DE LA PLAZA P. 30 C/M', '', ''),
(1700, 'Cedula Fisica', 104350203, 'FALLAS ELIZONDO RICARDO', 'COTO 47 BºLA QUIMICA CONT.IGLESIA', 'EVANGELICA CASA 11223 P.30 C/M', '', ''),
(1701, 'Cedula Fisica', 600930645, 'FALLAS ESPINOZA ANA FELICIA', 'PTO JIMENEZ BAMBU 800 MTS DE LA', 'ENTRADA', '', ''),
(1702, 'Cedula Fisica', 600540014, 'FALLAS GRANADOS JUANA', 'CORTES OJO DE AGUA 200O. DE', 'MUNICIPALIDAD', '7888073', ''),
(1703, 'Cedula Fisica', 600540014, 'FALLAS GRANADOS JUANA', 'C Cortés  Ojo de Agua  200m Oeste', 'Municipalidad. Cel 8719-5049.', '2788-8500', ''),
(1704, 'Cedula Fisica', 600750606, 'FALLAS MOLINA ANA LUISA', 'Pto JIMENEZ CINTG A CABINAS THOMSON', '<P> 11 C/M', '', ''),
(1705, 'Cedula Fisica', 600620166, 'FALLAS MOLINA EMILCE', 'GOLF Kmt 3 CONTIGUO ABASTECEDOR', 'JORLENY CASA # 125 <P> 02 C/M', '7751057', ''),
(1706, 'Cedula Fisica', 600620166, 'FALLAS MOLINA EMILCE', 'GOLFITO K.3 CONTIGUO ABASTECEDOR', 'YORLENY  CASA #125.', '7751057', ''),
(1707, 'Cedula Fisica', 600750606, 'FALLAS MOLINA LUISA', 'Pto Jimenez  detras de Escuela', 'Saturdino Cedeño diagonal a Lavacar', '7355703', ''),
(1708, 'Cedula Fisica', 600550397, 'FALLAS MONTES TRINIDAD.', 'DEL CENTRO DE SALUD DE BELLA LUZ DE', '1KMT Y MEDIO CARRETERA CARACOL.P-15', '', ''),
(1709, 'Cedula Fisica', 302880831, 'FALLAS MONTIEL HELLEN', 'Km 12 d salon bellez HERLIN 2da Cs', 'M/I.cobro contg bomba   8944-9806', '2775-2424', ''),
(1710, 'Cedula Fisica', 603230144, 'FALLAS ROJAS FRANCINI', 'P Jiménez fte pista aterrizaje con-', 'tiguo al MINAE.', '2735-0904', ''),
(1711, 'Cedula Fisica', 601300525, 'FALLAS SALAZAR JOSE', 'caimito  abastecedor caimito', '', '*-*-*-*', ''),
(1712, 'Cedula Fisica', 603450247, 'FALLAS SANDI IVANIA', 'conte 200 este y 400 norte de la es', 'cuela', '2776-8205', ''),
(1713, 'Cedula Fisica', 103730166, 'FALLAS SOLIS JUAN LUIS', '\"LA CUESTA DEL TALLER \"\"TITO\"\" 20 MTS\"', 'CONTG.PULP.FAMILIA RAMIREZ  30 C/M', '732', ''),
(1714, 'Cedula Fisica', 103730166, 'FALLAS SOLIS JUAN LUIS', 'LA CUESTA CIUDADELA TAMAYO', 'ULTIMA ENTRADA CASA A-13', '732', ''),
(1715, 'Cedula Fisica', 900650675, 'FALLAS VEGA CECILIA', 'P Jiménez S Lazaro taller costura', 'hacia abajo cs morada. Ofic.Remanso', '2735-5917', ''),
(1716, 'Cedula Fisica', 601860040, 'FALLAS VILLEGAS MIREYA', 'Barrio Bella Vista casa Nº 4400', 'carretera antiguo Pic-Nic.', '2775-1798', ''),
(1717, 'Cedula Fisica', 602110283, 'FALLAS VINDAS MARIA ISABEL', 'VEREH DE LAUREL CONTIGUO AL PUENTE', 'DE CEMENTO Nº 2', '7322300', ''),
(1718, 'Cedula Fisica', 501710494, 'FALLAS VINDAS ROSALBA', 'CANOAS CALLE LA CUESTA FRENT ESCUEL', 'PANAMEÑE ENTRADA M IZQ  <P> 15 C/M', '732', ''),
(1719, 'Cedula Fisica', 601630093, 'FALLAS VINDAS ROSALBA', 'REST YAKARAI O CALLE LA CUESTA FREN', 'PANAMEÑa ENTRADA M IZQ  <P> 15 C/M', '7322300', ''),
(1720, 'Cedula Fisica', 601630093, 'FALLAS VINDAS ROSALBA', 'LA CUESTA  REST YAKARAI O FRENTE', 'A LA ESCUELA PANA ENTRADA LAVACAR', '7322900', ''),
(1721, 'Cedula Fisica', 501710494, 'FALLAS VINDAS ROSALBA.', 'calle a Canoas  fte a esc. panameña', 'Entrada mano izq. p.15 c/m', '782364', ''),
(1722, 'Cedula Fisica', 600480619, 'FARRIER SAMUELS JAIME', 'CONTROL  D`LA PULP  2 kmt ESTE CASA', 'COSTADO SUR CAFE CON CELESTE <P> 30', '', ''),
(1723, 'Cedula Fisica', 104690455, 'FERNADEZ RAMIREZ RAFAEL', 'CUERVITO B* LA AURORA 25SUR DE LA', 'CANCHA ASERRADERO', '8741-6303', ''),
(1724, 'Cedula Fisica', 108070999, 'FERNADEZ SANCHEZ OLMAN', 'CARACOL NORTE 300MTS DE LA ESCUELA', 'NOROESTE', '8603-2196', ''),
(1725, 'Cedula Fisica', 603070247, 'FERNANDEZ ACEVEDO WENDY', 'Sierpe C martinez Frent cab estero', 'azul Cobro en Colegio la Palma', '2788-1435', ''),
(1726, 'Cedula Fisica', 600910445, 'FERNANDEZ ALFARO RUTH', 'Palmar Puerta del Sol  Pulp. Puerta', 'del Sol.', '2786-3215', ''),
(1727, 'Cedula Fisica', 600910445, 'FERNANDEZ ALFARO RUTH', 'Palmar Puerta del Sol  Pulp. Puerta', 'del Sol.', '2786-3215', ''),
(1728, 'Cedula Fisica', 105790211, 'FERNANDEZ ARGUEDAS ZULLY MARIA', 'Golf el INVU Cs Nº 77 cemento', '2775-2798', '', ''),
(1729, 'Cedula Fisica', 600620270, 'FERNANDEZ BERMUDEZ LOURDES', 'TINOCO CONTIGUO A CANCHA MULTI USOS', 'CASA BLANCA DE MADERA CON MALLA', '2786-3194', ''),
(1730, 'Cedula Fisica', 602240332, 'FERNANDEZ BERROCAL RONALD', 'JIMENEZ  CASA EL COCAL 300 NORTE', 'SIPER LA ESQUINA', '9427081', ''),
(1731, 'Cedula Fisica', 600580551, 'FERNANDEZ CARVAJAL EMILCE', 'EL CARMEN DE ABROJO  CASA 237', 'POR LAS QUEBRADAS', '7834003', ''),
(1732, 'Cedula Fisica', 600580551, 'FERNANDEZ CARVAJAL EMILCE', 'El Carmen de Abrojo  Casa 237.', 'Por las quebradas.', '7834403', ''),
(1733, 'Cedula Fisica', 602020915, 'FERNANDEZ CHAVARRIA JUAN CATALINO', 'Bambel 1  Granja Campesina.', '', '2789-8690', ''),
(1734, 'Cedula Fisica', 602940404, 'FERNANDEZ CHAVARRIA JUANA', 'LA PALMA 55MTS NORTE DE REDONDEL', '86272590', '2735-1189', ''),
(1735, 'Cedula Fisica', 602360187, 'FERNANDEZ CHAVARRIA MARIA ISABEL', 'P Jiménez  Guadalupe Cementerio 200', 'norte.', '8970-0097', ''),
(1736, 'Cedula Fisica', 601160900, 'FERNANDEZ DE LA O GLORIA.', 'GOLFITO.', '', '', ''),
(1737, 'Cedula Fisica', 602920637, 'FERNANDEZ DIAZ LISBETH', 'Drake Agujitas a un costado cabinas', 'Jademar. Cel 8824-3710.', '2775-0244', ''),
(1738, 'Cedula Fisica', 900530029, 'FERNANDEZ FERNANDEZ BENIGNA', 'Coto 54  Zona Administrativa.', '', '2781-1122', ''),
(1739, 'Cedula Fisica', 600820958, 'FERNANDEZ FERNANDEZ SECUNDINO', 'R Claro  La Esperanza  75 oeste 75', 'norte delegacion . 8804-5469.', '2789-9816', ''),
(1740, 'Cedula Fisica', 102950081, 'FERNANDEZ JIMENEZ EDUARDO', 'Naranjo  Ciudadela Fernandez', '', '2780-0604', ''),
(1741, 'Cedula Fisica', 201690389, 'FERNANDEZ JIMENEZ MARIA', 'S vito La isla 75 Mts de pulp calle', 'a la Escuela  2773-3330', '2773-3330', ''),
(1742, 'Cedula Fisica', 501331336, 'FERNANDEZ JIMENEZ TERESA', '', '', '', ''),
(1743, 'Cedula Fisica', 103450378, 'FERNANDEZ JIMENEZ YETI', 'LA UNION DEL SUR STA. LUCIA', '', '7766065', ''),
(1744, 'Cedula Fisica', 900740117, 'FERNANDEZ LEDEZMA TOBIAS', 'KM. 37  LA JULIETA', 'CANCELA 7 C/MES', '', ''),
(1745, 'Cedula Fisica', 602330847, 'FERNANDEZ LOPEZ MARIA CRISTINA', 'Golfito Civil 200 este Chica-Pica', 'cs 22. Cobrar Local 52 DLCG 8921-44', '2775-1739', ''),
(1746, 'Cedula Fisica', 500690348, 'FERNANDEZ MAROTO JUAN JOSE', 'P Jiménez La Palma Bº Bonito  500m', 'este Salon Comunal  casa rosada.', '2735-1581', ''),
(1747, 'Cedula Fisica', 102960721, 'FERNANDEZ MORA MARCELINO', 'LA FLORIDA  PIEDRAS BLANCAS ENTRADA', 'FRTE AL GUIRI_GUIRI', '', ''),
(1748, 'Cedula Fisica', 900410593, 'FERNANDEZ MORALES LUIS.', '200 MTS ADUANA PANAMEÑA CARRETERA', 'LOS LOTES C FERRETERIA KARLA.1 2C/M', '', ''),
(1749, 'Cedula Fisica', 603380326, 'FERNANDEZ NAVARRO SIDALY', 'GOLFITO LA BOLSA KM UNO', 'CASA Nº 4195-A', '7751665', ''),
(1750, 'Cedula Fisica', 103580530, 'FERNANDEZ PICADO PROSPERO', 'BAMBEL TRES RIO CLARO GOLFITO 50MTS', 'ANTES SUPER FRANK ENTRADA CASA ROSA', '8826-9143', ''),
(1751, 'Cedula Fisica', 600780449, 'FERNANDEZ QUESADA ARTEMIDA', 'P. Norte  Bº Alemania cs M21 fte a', 'Pulp. Mery. Cel: 8960-1560.', '2786-7438', ''),
(1752, 'Cedula Fisica', 602900992, 'FERNANDEZ SEGURA ULISES', 'TRS RIOS D CORONADO 200 MTS DESP', 'DE LA ESCUELA.. 8 C/MES', '7865678', ''),
(1753, 'Cedula Fisica', 900340856, 'FERNANDEZ ZUMBADO VICTOR DEL CARMEN', 'LA PALMA 60MTS NORTE DEL REDONDEL', '', '2735-1531', ''),
(1754, 'Cedula Fisica', 104400397, 'FERRETO ALVARADO JOSEFA', 'la fortuna de pavones', '', '7801472', ''),
(1755, 'Cedula Fisica', 104050028, 'FERRETO ALVAREZ ROMELIA', 'Coto 49  100 m Norte Iglesia Evange', 'lica  casa 12406.', '2781-1128', ''),
(1756, 'Cedula Fisica', 104050028, 'FERRETO ALVAREZ ROMELIA', 'C Neily  Coto 49  100 m Norte.', '', '8807-0915', ''),
(1757, 'Cedula Fisica', 104050028, 'FERRETO ALVREZ ROMELIA', 'COTO 49DE IGLESIA EVANGELICA AL', 'FONDO * FECHA DE PAGO 2 CADA MES*', '7811028', ''),
(1758, 'Cedula Fisica', 701360636, 'FERRETO VIQUEZ YORLENI', 'R Claro Bambel  500m O  100 S del', 'Ranchito.En mueblería. Cob Novimbre', '2789-8604', ''),
(1759, 'Cedula Fisica', 900950056, 'FIGUEROA REYES ADILIO', 'Neily  Barrrio Nuevo casa 32-G.', 'Cobrar en Super Hnos Loaiza.', '7833152', ''),
(1760, 'Cedula Fisica', 900730860, 'FIGUEROA VARGAS JOSE FRANCISCO', 'SAN FRANCISCO DE TINOCO DEL PUENTE', 'OLLA UNO 200M. NORTE', '8471139', ''),
(1761, 'Cedula Fisica', 900730860, 'FIGUEROA VARGAS JOSE FRANCISCO', 'SAN FRANCISCO DE TINOCO DEL PUENTE', 'OLLA UNO 200M. NORTE', '-', ''),
(1762, 'Cedula Fisica', 603320190, 'FIGUEROA VILLANUEVA XIRIA ELVIRA', 'PALMAR NORTE B* BETANIA 100 NORTE', '50 ESTE DE LAS OFICINAS DE COOPEALI', '8676-3089', ''),
(1763, 'Cedula Fisica', 155801085, 'FLETES CAROLINA GEOVANNA', 'Veracruz Esc.Bº Nuevo 1km S 75 O cs', '24A. Cobrar Depósito local 1 y 28.', '8776-2975', ''),
(1764, 'Cedula Fisica', 800610724, 'FLETES MENDOZA LESLIE', 'Ciudad Cortes  Pizza Panaderia y', 'Antojitos EBEN-EZER  8422-8834', '2788-7695', ''),
(1765, 'Cedula Fisica', 602270598, 'FLORES BARQUERO CARLOS', 'C. Neily  Bº San Rafael 100 N  25 E', '', '7835719', ''),
(1766, 'Cedula Fisica', 600370169, 'FLORES BUSTOS ANTONIA', 'C Cortés  800m este del Liceo Pací-', 'fico Sur.', '8659-0346', ''),
(1767, 'Cedula Fisica', 603250299, 'FLORES CHINCHILLA YENNI', 'Calle Trenzas Nasaret tajo azul sgt', 'entrada. Actualizada en oficina.', '7756224', ''),
(1768, 'Cedula Fisica', 600430683, 'FLORES FLORES BEATRIZ', 'KILOMETRO 27 DE LAUREL CONTIGUO A', 'CASA DE FELIPA', '', ''),
(1769, 'Cedula Fisica', 600350200, 'FLORES FLORES MARTINA', 'LA MARIPOSA 1KM A COLORADO', '** FECHA DE PAGO 04 CADA MES **', '', ''),
(1770, 'Cedula Fisica', 601810544, 'FLORES JIMENEZ DIMAS RAMON', 'PURRUJA PARADA ALMENDROS DIAG A', 'TALLER NAVAS <P> 16 C/M', '7751157', ''),
(1771, 'Cedula Fisica', 900490059, 'FLORES MENDOZA SOFIA', '', '', '', ''),
(1772, 'Cedula Fisica', 101650057, 'FLORES MORALES RAFAEL', 'DE LOS TANQUES DE AGUA 200 Mts ESTE', 'CONTIGUO PISTA <P> 09 C/M', '', ''),
(1773, 'Cedula Fisica', 602360189, 'FLORES MOSQUERA LUCDUVINA', 'Golfito La Mona 4º fila  detrás de', 'Escuela.', '2775-2555', ''),
(1774, 'Cedula Fisica', 102900681, 'FLORES NAVARRO PABLO', 'CORTEZ OJO DE AGUA DE LA MUNICIPALI', 'DAD 75 OESTE CAMINO AL HOSPITAL', '7888743', ''),
(1775, 'Cedula Fisica', 401930494, 'FLORES SALAZAR  LUZMILDA', 'JIMENEZ B*BAMBU DE LA PANADERIA 300', 'MTS', '8885-7848', ''),
(1776, 'Cedula Fisica', 600520546, 'FLORES SANDI LIDIA', 'GOLFITO I.N.V.U.KM 3 C.# 53 BLANCA', 'COBRAR EN HOSPITALtal.', '', ''),
(1777, 'Cedula Fisica', 600520546, 'FLORES SANDI LIDIA', '', '', '', ''),
(1778, 'Cedula Fisica', 600380098, 'FLORES SANTAMARIA  ALEJANDRA', 'SAN RAMON DE RIO CLARO URB. CASA', 'Nº 61 * FECHA DE PAGO 3 CADA MES *', '7897714', ''),
(1779, 'Cedula Fisica', 600380098, 'FLORES SANTAMARIA ALEJANDRA', 'RIO CLARO SAN RAMON ENTRADA FTE TRO', 'PIGAS', '7897185', ''),
(1780, 'Cedula Fisica', 602160273, 'FLORES SEGURA SARA MARIA', 'P. SUR  fte  a Coopemec-Sur ', 'a un costado de la plaza.', '', ''),
(1781, 'Cedula Fisica', 501980765, 'FONSECA BLANCO JOSE', 'La Bota I.D.E.M.', '', '', ''),
(1782, 'Cedula Fisica', 501980765, 'FONSECA BLANCO JOSE.', 'LA BOTA CENTRO <P> 30 C/M', '', '', ''),
(1783, 'Cedula Fisica', 103440273, 'FONSECA FONSECA RODRIGO', 'Ciudad Neilly  Bo Abrojo de la', 'Escuela 500 mts Sur.', '', ''),
(1784, 'Cedula Fisica', 103440273, 'FONSECA FONSECA RODRIGO', 'HOSPITAL CIUDAD NEILY ', 'PAGA OFICINA', '783-', ''),
(1785, 'Cedula Fisica', 600950316, 'FONSECA GUTIERREZ GERARDO', 'Coto 52  casa 11535.', '', '8606-6655', ''),
(1786, 'Cedula Fisica', 101188235, 'FONSECA MADRIGAL ESTEBAN', 'Uvita Bahía Ballena  Puntarenas', 'Hotel Villas Bejuco. Recepción.', '5702-2374', ''),
(1787, 'Cedula Fisica', 101310616, 'FONSECA MADRIGAL JUAN CARLOS', 'BAHIA BALLENA  FRENTE A LA ENTRADA', 'A LA PLAYA COLONIA', '2743-8025', ''),
(1788, 'Cedula Fisica', 602870564, 'FONSECA MURILLO ALEX JAVIER', 'S Vito  Las Brisas  700m este del', 'Palenque. cc blanco/rosado 87177157', '8633-6648', ''),
(1789, 'Cedula Fisica', 602200356, 'FONSECA SEQUEIRA ALBAN', 'GOLFITO Bº SAN ANDRES CASA # 00', '<P> 03 C/M', '7751671', ''),
(1790, 'Cedula Fisica', 602090852, 'FONSECA VALVERDE ALEXANER', 'COTO 45  CASA Nº 10228 COSTADOPLAZA', 'CARRITO ** FECHA DE PAGO 2 CADA MES', '', ''),
(1791, 'Cedula Fisica', 500710658, 'FONSECA VALVERDE FILIBERTO', 'Fca ALAJUELA  100 Mts ANTES DE LA', 'ESC <P> EN OFI', '', ''),
(1792, 'Cedula Fisica', 500710658, 'FONSECA VALVERDE FILIBERTO', 'Fca Alajuela  100 sur Escuela.', '', '2741-1065', ''),
(1793, 'Cedula Fisica', 700400633, 'FONSECA VEGA MANUEL', '', '', '', ''),
(1794, 'Cedula Fisica', 603690199, 'FRAGOS CHAVES LIDIER', 'Laurel  costado de plaza deportes', 'o Ofici Inversiones Thomson Bereh', '7801664', ''),
(1795, 'Cedula Fisica', 602180073, 'FRANCO ESPINOZA JOSE JOAQUIN', 'Golfito  Entrada Munic  50 este  50', 'norte casa azul. 8750-3845.', '2775-1535', ''),
(1796, 'Cedula Fisica', 800450411, 'FRANCO LOZADA JOSE SANTOS', 'GOLFITO  KM 1 EL DISCO CASA #4199', 'PAGA EL 09 DE CADA MES', '775', ''),
(1797, 'Cedula Fisica', 900520288, 'FRANCO VASQUEZ NELI', 'CALLE A LA CUESTA ENTRADA CONTIG.', 'AL MALINCHE', '7322323', ''),
(1798, 'Cedula Fisica', 900520288, 'FRANCO VASQUEZ NELI', 'LA CUESTA ENTRADA CONTIGUO AL', 'MALINCHE * FECHA DE PAGO 15 C/MES**', '7322323', ''),
(1799, 'Cedula Fisica', 907083977, 'FUENTES FUENTES NIDIA EIDA', 'LA MARIPOSA ENTRADA A LA DERECHA', 'XMAGD', '', ''),
(1800, 'Cedula Fisica', 900830977, 'FUENTES FUENTES NIDIA EIDA', 'La Mariposa entrada a mano derecha.', 'Telf: 8890-4214  8613-7514.', '', ''),
(1801, 'Cedula Fisica', 603920885, 'FUENTES GRANDA JEISON', 'LA CUESTA 600MTS DEL COLEGIO', '', '8608-4808', ''),
(1802, 'Cedula Fisica', 106840374, 'FUENTES MARIN JAVIER', 'fca puntarenas  3era casa  izquierd', '50 mts sur de Cooperativa', '', ''),
(1803, 'Cedula Fisica', 603490053, 'FUENTES PADILLA JESSICA', 'C. Meily  Bº S. Rafael contiguo im-', 'prenta Hnos Reyes.', '8786-8473', ''),
(1804, 'Cedula Fisica', 159100084, 'FUENTES RIOS RUBEN DARIO', 'La Cuesta del colegio 600 m hacia', 'Laurel  2º casa desp. letrero quebr', '', ''),
(1805, 'Cedula Fisica', 601210228, 'FUNES OBREGON LUIS RODOLFO', 'CUERVITO LA CUESTA B* DE LA AURORA', '150MTS AL SUR DE LA PULP EL AHORRO', '8883-3999', ''),
(1806, 'Cedula Fisica', 602290307, 'GALLARDO CASTILLO DOMINGO.', 'SAN MARTIN DE CANOAS 400M NORTE DE', 'LA ESCUELA COMANDO DE CIUDAD NEILY.', '', ''),
(1807, 'Cedula Fisica', 602330164, 'GALLARDO CONCEPCION JOSE MARIA', 'SAN MARTIN DEL CRUSE DE LA PATA', 'POLLO 150MTS NOROESTE PULPERIA', '8514-6560', ''),
(1808, 'Cedula Fisica', 601550906, 'GALLARDO GONZALEZ ELIDIA', 'Canoas; 75 mts Norte 25 Oeste del', 'alm. el Unico. o clínica la Cuesta.', '', ''),
(1809, 'Cedula Fisica', 601470967, 'GALLARDO GONZALEZ MAXIMA', 'P Canoas S Martín  fte a la escuela', 'Cs verde.', '8685-7707', ''),
(1810, 'Cedula Fisica', 900940203, 'GALLARDO VALDEZ FELIZ', 'PASO CANOAS CALLE A LA CUESTA', '<P> 30 C/M', '', ''),
(1811, 'Cedula Fisica', 601880322, 'GALLARDO VIQUEZ BEOCINA', 'PASO CANOAS Bº SAN MARTIN 600 NORTE', 'DE LA ESCUELA * CANCELA 16 CADA MES', '7323436', ''),
(1812, 'Cedula Fisica', 500720882, 'GALLO GALLO JOSE RAMON', 'LOS CASTAÑOS  80 METROS ANTES', 'DE LA ESCUELA LOCAL', '', ''),
(1813, 'Cedula Fisica', 500720882, 'GALLO GALLO JOSE RAMON', 'LOS CASTAÑOS  80 METROS ANTES', 'DE LA ESCUELA LOCAL', '', ''),
(1814, 'Cedula Fisica', 500620859, 'GALLO GUIDO CLAUDIO FERMIN', 'SIERPE CIUDADELA MARTINEZ DE', 'CABINAS ESTERO AZUL C. ANTERIOR', '7881074', ''),
(1815, 'Cedula Fisica', 700930831, 'GALLO SANDI ELBA MARIA', 'Entrada Poza los abuelos  2º bloque', '1º casa.', '8875787', ''),
(1816, 'Cedula Fisica', 601930785, 'GALO MUÑOZ MARIA', 'IMAS B*SAN MARTIN 1ERA ENTRADA DEL', 'TEL ARRIBA DANDO VUELTA 88088674', '2775-2179', ''),
(1817, 'Cedula Fisica', 601340110, 'GALO MUÑOZ PEDRO DAVID', 'Golfito  IMAS S. Martín  cs C9', 'Cel 8640-4227.', '2775-0648', ''),
(1818, 'Cedula Fisica', 601860503, 'GAMAZA QUESADA Mº VIRGINIA', 'C Cortés  Renacimiento  cs 10 c Pa-', 'paya.', '8669-8283', ''),
(1819, 'Cedula Fisica', 601340304, 'GAMBOA BADILLA ADILIA', 'Bambel o Granja Campesina entrada', 'diagonal a la Escuela 500 m', '8850-1367', ''),
(1820, 'Cedula Fisica', 600760808, 'GAMBOA BADILLA RAMIRO', 'Bambel 1  La Granja Campesina  Abas', 'tecedor La Campesina.', '2789-8056', ''),
(1821, 'Cedula Fisica', 201080274, 'GAMBOA CARRANZA ISIDRO.', 'EL HIJO DEL CONTRATANTE VA A SEGUIR', 'PAGANDO POR MEDIO DE DEPTO. BANC.', '4334375', ''),
(1822, 'Cedula Fisica', 107890518, 'GAMBOA CERDAS JORGE LUIS', 'Bº EL TRIUNFO CASA # 16 O EN PARADA', 'DE TAXIS PASO CANOAS.P.01 C/M', '73223', ''),
(1823, 'Cedula Fisica', 106550094, 'GAMBOA ELIZONDO GERARDO', 'UVITA CAMINO A BAHIA ENTRADA TIENDA', 'DOÑA JULIA 8889/6359', '2743-8139', ''),
(1824, 'Cedula Fisica', 103140478, 'GAMBOA GAMBOA MIGUEL ANTONIO', 'RIO CLARO BAMBEL 800 M OESTE DE', 'PULP EL JARDIN', '7898891', ''),
(1825, 'Cedula Fisica', 105640635, 'GAMBOA GUZMAN ANA VIRGINIA', 'R Claro  Coto 63  costado este cs', '15455.', '8517-5501', ''),
(1826, 'Cedula Fisica', 900810297, 'GAMBOA JIMENEZ FRANCISCO', 'Viquilla 3  km 29 Parcela 13', 'del Telefono 50 m Oeste.', '', ''),
(1827, 'Cedula Fisica', 106720296, 'GAMBOA MARIN JOSE MANUEL', 'Golfito Km20  Agroindustrial Diag a', 'la escuela.', '8314-4611', ''),
(1828, 'Cedula Fisica', 104390977, 'GAMBOA MARIN RODOLFO', 'AGROINDUSTRIAL KMT 20.P-16 C/M.', '', '', ''),
(1829, 'Cedula Fisica', 104390977, 'GAMBOA MARIN RODOLFO', 'AGROINDUSTRIAL KMT 20', 'CARRETERA A GOLFITO', '', ''),
(1830, 'Cedula Fisica', 104390977, 'GAMBOA MARIN RODOLFO', 'AGROINDUSTRIAL KMT 20', 'CARRETERA A GOLFITO', '', ''),
(1831, 'Cedula Fisica', 104390977, 'GAMBOA MARIN RODOLFO', 'AGROINDUSTRIAL KMT 20', 'CARRETERA A GOLFITO', '', ''),
(1832, 'Cedula Fisica', 104390977, 'GAMBOA MARIN RODOLFO', 'Golfito  km 20 Agroindustrial', '', '8664-7200', ''),
(1833, 'Cedula Fisica', 105350722, 'GAMBOA VARGAS MARJORIE', 'La Palma de Pto Jiménez de almacén', 'la Palma 2 km Norte.', '', ''),
(1834, 'Cedula Fisica', 105350722, 'GAMBOA VARGAS MARJORIE.', 'LA PALMA DEL CEMENTERIO 2 KMT CAMI-', 'NO A     DE ORO.P LOS 8 C/M.', '', ''),
(1835, 'Cedula Fisica', 105350722, 'GAMBOA VARGAS MARJORIE.', 'LA PALMA DE PTO JIMENEZ DEL CEMENTE', 'RIO 2KMT A RIO ORO.P-11 C/M.', '', ''),
(1836, 'Cedula Fisica', 601980449, 'GAMBOA VARGAS SILIAM', 'PUERTO JIMENEZ  LA PALMA SUPER', 'ABASTECEDOR LA AMISTAD', '', ''),
(1837, 'Cedula Fisica', 601980449, 'GAMBOA VARGAS SILIAN', 'La Palma Puerto Jiménez;', 'Abast. La Amistad.', '', ''),
(1838, 'Cedula Fisica', 601980449, 'GAMBOA VARGAS SILIAN', 'P Jiménez  Amapola  1km Suroeste de', 'matadero. Cel 8629-6110.', '8964-3846', ''),
(1839, 'Cedula Fisica', 603480259, 'GANIER WONG EMANUEL', 'C Cortes  San Josecito 50 Mts Norte', 'S Multiuso   Cobro Taller jesica', '8774-1764', ''),
(1840, 'Cedula Fisica', 800871013, 'GARAY NONORI GABRIELA', 'P. CANOAS ENTRADA ENTRADA ESCUELA', 'ADVENTISTA 500 MTS DE PUELP BETEL', '2732-1850', ''),
(1841, 'Cedula Fisica', 603300812, 'GARBANZO FLORES JORLENY', 'LAS DELICIAS RIO CLARO  FRETE A LA', 'ESCUELA', '9494413', ''),
(1842, 'Cedula Fisica', 601030071, 'GARCIA ACEVEDO MARIA FELIX', 'Pto Jiménez  de Cabinas Marcelina', '125 m oeste. cc Naranja.', '2735-5050', ''),
(1843, 'Cedula Fisica', 601520062, 'GARCIA ALVARADO MARBELIT', 'CIUDADELA GONZALEZ FRET A PLAZOLETA', '', '', ''),
(1844, 'Cedula Fisica', 201940035, 'GARCIA ALVARADO MARIA ESTER', '', '', '', ''),
(1845, 'Cedula Fisica', 201940035, 'GARCIA ALVARADO MARIA ESTER', 'GOLFITO  CABINAS LOS COREANOS', 'DIAGONAL AL BANCO NACIONAL', '7750196', ''),
(1846, 'Cedula Fisica', 601520061, 'GARCIA ALVARADO MARLENE', 'Las Fincas Coto 54 comisariato', 'P.30 C/M', '*-*-*-*', ''),
(1847, 'Cedula Fisica', 602020897, 'GARCIA ALVAREZ MARIA ESTER', 'RIO CLARO LA ESPERANZA DEL TACONAZO', '100M HACIA EL RIO ***CAN 20 C/MES**', '7897340', ''),
(1848, 'Cedula Fisica', 601810055, 'GARCIA BARRANTES JOSE MANUEL', 'GOLFITO  BARRIO PARROQUIAL CASA Nº', '4526', '7750524', ''),
(1849, 'Cedula Fisica', 602640947, 'GARCIA BELLIDO ANA YENSI', 'pto jimenez  Urb el San Lazaro  cas', 'No 10 Abastecedor mini super sol', '2735-5830', ''),
(1850, 'Cedula Fisica', 501180286, 'GARCIA CARRILLO AMADA', 'LA VIRGEN DE SABALO  SURTIDOR', 'SAN MARTIN P.15 C/M', '783-', ''),
(1851, 'Cedula Fisica', 500720002, 'GARCIA CASTRILLO GREGORIO', 'kmt 27 500 sur de la escuela', '', '7800578', ''),
(1852, 'Cedula Fisica', 500720002, 'GARCIA CASTRILLO GREGORIO', 'kmt 27 500 sur de la escuela', '', '7800578', ''),
(1853, 'Cedula Fisica', 500720002, 'GARCIA CASTRILLO GREGORIO', 'kmt 27 800 sur de la escuela ', '2780-0578', '8506-9465', ''),
(1854, 'Cedula Fisica', 502400516, 'GARCIA CENTENO MARIA ZELEDONIA', 'JIMENEZ LA URBA CASA *12 VECINA DE', 'JUANITA BRITAN', '7355815', ''),
(1855, 'Cedula Fisica', 204260423, 'GARCIA CHAVARRIA IDALIA', 'Laurel Naranjo. Ciudadela los Fer-', 'nandez casa Nº5 casa verde', '2780-1851', ''),
(1856, 'Cedula Fisica', 100440818, 'GARCIA CHAVES CARLOS', 'BELLA VISTA FRT TRACOPA 2da FILA', 'C. Nº 8160 CONTG A C.C. ZAPOTE', '', ''),
(1857, 'Cedula Fisica', 601970895, 'GARCIA CHEVEZ MARIA DEL SOCORRO.', 'Cenizo por la Pulperia', '', '', ''),
(1858, 'Cedula Fisica', 601420082, 'GARCIA ESQUIVEL CARLOS', 'BELLA VISTA CONTG.CASA PARROQUIAL', '# 4379 P. EN HOSP. INFORMACION', '750615', ''),
(1859, 'Cedula Fisica', 400760230, 'GARCIA FONSECA RAFAEL ANGEL', 'CN COTO 42 1ª ENTRADA 2 CASA DESPUE', 'DEL TEL PUBLICO MANO IZQUIERDA', '7811261', ''),
(1860, 'Cedula Fisica', 400870805, 'GARCIA FONSECA RAMON LUIS', 'Coto 42  casa contiguo a la escuela', '', '', ''),
(1861, 'Cedula Fisica', 500830208, 'GARCIA GARCIA ANASTACIO', 'RIO CLARO SAN RAMON DETRAS DE LA', 'ESCUELA * CANCELA PENCIONADO 8 C/M*', '7897233', ''),
(1862, 'Cedula Fisica', 501090445, 'GARCIA GARCIA EZEQUIEL', 'Rio Claro  Viquilla 3 300 m este de', 'puesto salud fte corral claudio.', '', ''),
(1863, 'Cedula Fisica', 501870176, 'GARCIA GARCIA MARIA ALEJANDRINA', 'GOLFITO K3 DEL ABASTECEDOR TOMAS X', 'LA PARTE DE ATRAS', '7752930', ''),
(1864, 'Cedula Fisica', 800470217, 'GARCIA GARCIA VIVIANA MARGARITA', 'Laurel 500m norte de la Escuela', '', '8983-8485', ''),
(1865, 'Cedula Fisica', 800470217, 'GARCIA GARCIA VIVIANA MARGARITA', 'LAUREL 500MTS NORTE DE LA ESC.', '', '8983-8485', ''),
(1866, 'Cedula Fisica', 500630843, 'GARCIA GOMEZ INES', 'PLANES DE DRAKE CALLE  A CALETAS', 'CASA DE ALTO ** CANCELA 11 C/MES **', '8994187', ''),
(1867, 'Cedula Fisica', 502580612, 'GARCIA HERNANDEZ JOSE ANTONIO', 'cocal amarillo pavones despues de', 'pulperia celena casa verde', '', ''),
(1868, 'Cedula Fisica', 600690042, 'GARCIA JIMENEZ DAYSI', 'KMT 14 250 MTS DESPUES DE BAR EL RE', 'TORNO CASITA AMARILLA P.27 C/M', '', ''),
(1869, 'Cedula Fisica', 600690042, 'GARCIA JIMENEZ DAYSI', 'GOLFITO Kmt 7 PURRUJA ABASTECEDOR', 'PURRUJA <P> 16 C/M', '', ''),
(1870, 'Cedula Fisica', 603230067, 'GARCIA JIMENEZ MARIBEL', 'golfito Bº BELLA VISTA 150 M ESTE D', 'LA ESCUELA (DONDE VILLAGRA)', '7750645', ''),
(1871, 'Cedula Fisica', 501120466, 'GARCIA JUAREZ BOLIVAR', 'Comte La Escuadra ', 'Cel 8579-9617', '2776-8110', ''),
(1872, 'Cedula Fisica', 501890384, 'GARCIA JUAREZ CARMELINA', 'Bº Carmen  Abrojo  entrada Pampero ', 'MD  casa de maya color blanco.', '2783-6041', ''),
(1873, 'Cedula Fisica', 501410716, 'GARCIA MARIN ROXANA', 'Golfito  contiguo a Alfa & Omega.', 'Cel 8916-1108.', '2775-0442', ''),
(1874, 'Cedula Fisica', 500490647, 'GARCIA MARTINEZ Mº ISABEL', 'La Esperanza de Río Claro frente a', 'la Escuela', '', ''),
(1875, 'Cedula Fisica', 502040480, 'GARCIA MARTINEZ XINIA', 'Rio Claro  la esper 3ra casa M/D', 'despues de la Esc  8440-3945', '', ''),
(1876, 'Cedula Fisica', 800490262, 'GARCIA MEMBREÑO JULIO CESAR', 'Laurel; frente al C.N.P primer', 'casa <p> 30 c/m', '2732-0533', ''),
(1877, 'Cedula Fisica', 502420138, 'GARCIA MENA HILDA', 'R.CLARO BAMBEL PULP GARBANZO DE RAN', 'CHO PALMICHE 100 M A GOLF.P.03 Y 16', '', ''),
(1878, 'Cedula Fisica', 203000328, 'GARCIA MENA LUIS', 'P Canoas Detrás Aduana lotes cartin', '', '2732-1237', ''),
(1879, 'Cedula Fisica', 601440212, 'GARCIA MORA JUAN MARIA', 'La Cuesta  pulp Xinia 50m sur  en-', 'trada antiguo tajo Gallardo.', '8942-7945', ''),
(1880, 'Cedula Fisica', 155805622, 'GARCIA OBANDO SANTOS', 'Coto 50  cs 10739 fte antiguo club.', '', '8628-3442', ''),
(1881, 'Cedula Fisica', 601440093, 'GARCIA RODRIGUEZ LUZ ANNIA', 'PUERTO JIMENEZ  LA PALMA 500 MTS', 'ESTE DE LA ESCUELA', '', ''),
(1882, 'Cedula Fisica', 601590041, 'GARCIA RODRIGUEZ MARIA IRENE', 'URBA LOS CERRITOS CASA*18', '27351704', '8546-4281', ''),
(1883, 'Cedula Fisica', 602060937, 'GARCIA SALAZAR JUANITA', 'Sierpe  150 mts sur de la plaza.', '', '8647-2732', ''),
(1884, 'Cedula Fisica', 100550130, 'GARCIA SAMANIEGO PATRICIA', 'Golfito Bº S juan de igles de Crist', '200 mts N C beige 8699-6114', '', ''),
(1885, 'Cedula Fisica', 110980366, 'GARCIA VILLALOBOS JOB ELIAS', 'Cariari de Laurel  Cruce 4 bocas.', '', '', ''),
(1886, 'Cedula Fisica', 602900679, 'GARITA BERMUDEZ FREDDY', 'La Guaria  de la Escuela 300 m SE.', 'Cobrar en R. Claro Taller Feluco.', '8878-5508', ''),
(1887, 'Cedula Fisica', 601640274, 'GARITA MARIN MANUEL', 'P.CANOAS FRT.BOMBA PANAMEÑA REPUEST', 'LA FRONTERA <P> 15 C/M', '732', ''),
(1888, 'Cedula Fisica', 601640274, 'GARITA MARIN MANUEL', 'Paso Canoas  venta de repuestos', 'frente a la bomba panameña.', '7322110', ''),
(1889, 'Cedula Fisica', 101550084, 'GARITA SANDI PABLO', 'Finca puntarenas', '', '', ''),
(1890, 'Cedula Fisica', 202020258, 'GARITA VENEGAS ELIECER', 'LA GUARIA 60 ESTE SOBRE LA LINEA', 'CASA AMARILLA * CANCELA 8 C/MES **', '', ''),
(1891, 'Cedula Fisica', 601200645, 'GARRO VASQUEZ CRISTINA', 'COTO 54 CAS 11633 FRENT DISPENSARIO', 'ULTIMA CASA <p> 02 C/M', '*-*-*-*', ''),
(1892, 'Cedula Fisica', 800420069, 'GAZO GAZO BRUNILDA', 'COTO 47  LAS FINCAS.', '', '', ''),
(1893, 'Cedula Fisica', 501230904, 'GAZO OBANDO PEDRO JOSE', 'ROBLE COSTADO SUR DEL CUADRANTE DE', 'LA PLAZA CASA COLOR BLANCO.', '', ''),
(1894, 'Cedula Fisica', 101500681, 'GODINEZ AZOFEIFA CATALINA', 'PALMAR NORTE  DEL PARQUE 150 MTRS', 'SUR HACIA EL RIO X CORREOS DE C.R.', '', ''),
(1895, 'Cedula Fisica', 103550845, 'GODINEZ CALDERON MARIA ERNESTINA', 'Laurel Cenizo  600m Iglesia Evange-', 'lica.', '2780-1208', ''),
(1896, 'Cedula Fisica', 603430322, 'GODOY GODOY CLAUDIO', 'NARANJO DE LAUREL URBA NARANJAL CAS', 'A 7* MANO DERECHA', '8555-5557', ''),
(1897, 'Cedula Fisica', 602510987, 'GOLFIN MENA JOSE', 'cortes  del I.C.E. 100 mts Oeste', '', '8477357', ''),
(1898, 'Cedula Fisica', 601980580, 'GOMEZ ACHIO ALEXANDER', 'KM 1 LA BOLSA  CASA # 4596 GOLFITO', 'P. 05 DE C/M', '750011', ''),
(1899, 'Cedula Fisica', 502190586, 'GOMEZ ALVAREZ FELIX DONALDO', 'Golfito  La Virgen de Comte.', 'Cel 8328-5476.', '2780-1808', ''),
(1900, 'Cedula Fisica', 604050744, 'GOMEZ AVELLAN KAREN ELENA', 'PASO CANOAS  SAN JORGE  B CARTIN ', 'COSTADO OESTE DEL CITY MALL', '2732-3894', ''),
(1901, 'Cedula Fisica', 602130238, 'GOMEZ BADILLA ANA ISABEL', 'Laurel  Del Abast. Martínez 75m ca-', 'lle a Ciudadela  cs grande.', '8910-3481', ''),
(1902, 'Cedula Fisica', 900390473, 'GOMEZ BALTODANO JOSE THOMAS', 'laurel el roble de la escuela 100 m', 'sur', '', ''),
(1903, 'Cedula Fisica', 500780824, 'GOMEZ BALTODANO TOMAS DAVID', 'Laurel El Invu cs 49. detrás pulp.', 'El Invu  color verde.', '2780-1004', ''),
(1904, 'Cedula Fisica', 603570656, 'GOMEZ BARBOZA GEORGE', 'P Jiménez  La Palma  Cs Maximiliano', 'Trabaja Alm. La Palma.', '-', ''),
(1905, 'Cedula Fisica', 501300942, 'GOMEZ BRIONES JACINTO', 'Laurel  Bambito  150m oeste Pulp.', 'cruce cs blanca MD.', '2780-1379', ''),
(1906, 'Cedula Fisica', 501300942, 'GOMEZ BRIONES JACINTO', 'BAMBITO DE LAUREL 150M OESTE DE', 'PULPERIA EL CRUCE C.C BLANCO', '2780-1379', ''),
(1907, 'Cedula Fisica', 603290475, 'GOMEZ CARRANZA VILMA', 'Golfito Bº bella vista  al Pic-Nic', 'casa verde Nº 4338   8605-1710', '8515-7383', ''),
(1908, 'Cedula Fisica', 501730777, 'GOMEZ CASTILLO ORLANDO', 'Finca Puntarenas 125 Norte de la Es', 'cuela.', '8638-2729', ''),
(1909, 'Cedula Fisica', 601760902, 'GOMEZ CASTILO FELIX', '', '', '', ''),
(1910, 'Cedula Fisica', 601320045, 'GOMEZ CEDEÑO GERARDO', 'COTO 54  LAS FINCAS.', '', '', ''),
(1911, 'Cedula Fisica', 502070252, 'GOMEZ CENTENO M* DEL CARMEN', 'RIO CLARO PAVONES 300 MTS SUR DE LA', 'IGLESIA OASIS DE AMOR', '2776-2212', ''),
(1912, 'Cedula Fisica', 501550190, 'GOMEZ DIAZ OFELIA', 'PTO JIMENEZ 400MTS N. DESUPER', 'ESQUINAS* FECHA DE PAGO 12 C/MES*', '', ''),
(1913, 'Cedula Fisica', 501550190, 'GOMEZ DIAZ OFELIA', 'PTO JIMENEZ 400MTS N. DESUPER', 'ESQUINAS* FECHA DE PAGO 12 C/MES*', '', ''),
(1914, 'Cedula Fisica', 600890867, 'GOMEZ GOMEZ AIDA LUZ', 'SODA Dr CHAVEZ > CIUDAD DEILY', '<P> OFICINA', '7833771', ''),
(1915, 'Cedula Fisica', 600670820, 'GOMEZ GOMEZ EVARISTO', 'Río Incendio  Pulpería Jiménez  a', 'un costado de la Plaza.', '', ''),
(1916, 'Cedula Fisica', 601880340, 'GOMEZ GOMEZ GUADALUPE', 'Laurel  Km 25  700m sur Escuela.', '', '2780-1898', ''),
(1917, 'Cedula Fisica', 800640085, 'GOMEZ GOMEZ INES', '', '', '', ''),
(1918, 'Cedula Fisica', 601650670, 'GOMEZ GOMEZ JUANA', 'P Jiménez  Pblo Nuevo  300 N Cemen-', 'terio.', '2735-5835', ''),
(1919, 'Cedula Fisica', 800440776, 'GOMEZ GOMEZ JULIO CESAR.', 'TAMARINDO  600 MTRS CALLE A LA VACA', 'MANO IZQ. FONDO BANANAL PAGA 30 C/M', '', ''),
(1920, 'Cedula Fisica', 600460117, 'GOMEZ GOMEZ LAUREANA', 'GOLFITO  KMT 3 CASA Nº 62', '', '', ''),
(1921, 'Cedula Fisica', 601940687, 'GOMEZ GOMEZ LORENZA CC LORENA', 'R Claro  Bambel 1  La Granja Campe-', 'sina de pulp. Guillermina 50m', '8737-7838', ''),
(1922, 'Cedula Fisica', 601140607, 'GOMEZ GOMEZ SOCORRO', 'Pto Jimenez  50 mts sur oeste de', 'pension quintero  tel 27355329', '7516530', ''),
(1923, 'Cedula Fisica', 601140607, 'GOMEZ GOMEZ SOCORRO', 'Pto Jiménez cont. muebleria Oasis.', 'Jimenez centro.', '2735-5329', ''),
(1924, 'Cedula Fisica', 602530379, 'GOMEZ GONZALEZ VIRGINIA', 'Km 31  100 Mts N Iglesia Catolica', '2780-1406', '8614-7855', ''),
(1925, 'Cedula Fisica', 502580474, 'GOMEZ JIMENEZ JOSE FRANCISCO', 'LAUREL 150M. SUR  DEL BANCO NACIONA', '', '7800297', ''),
(1926, 'Cedula Fisica', 603700216, 'GOMEZ JIMENEZ SOLMAN', 'Coto 50  Última casa 10628.', '', '8742-5109', ''),
(1927, 'Cedula Fisica', 601620882, 'GOMEZ LACAYO PEDRO', 'RIO NUEVO C.H. 15', '', '7836555', ''),
(1928, 'Cedula Fisica', 601620882, 'GOMEZ LACAYO PEDRO', 'RIO NUEVO.CASA H.15 BAR DE', 'MANUEL 200 HACIA EL FONDO', '7836555', ''),
(1929, 'Cedula Fisica', 601620882, 'GOMEZ LACAYO PEDRO', 'C Neily  R Nuevo  cs h15  200 m al', 'fondo Bar Manuel.', '2783-6555', ''),
(1930, 'Cedula Fisica', 601620882, 'GOMEZ LACAYO PEDRO.', 'Las Fincas; coto 45 del comisariato', '200 mts.', '*-*-*-*', ''),
(1931, 'Cedula Fisica', 601700279, 'GOMEZ LARA  MCDONAL', 'COTO 45 COSTADO O.DE LA PLAZA', '** FECHA DE PAGO 2ª SEMANA DE MES**', '7811007', ''),
(1932, 'Cedula Fisica', 601700279, 'GOMEZ LARA MCDONAL', 'CIUDAD NEILY LA FORTUNA DETRAS DE', 'TALLER POLACO * CANCELA 2ª SEMANA *', '2781-1007', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(1933, 'Cedula Fisica', 602900846, 'GOMEZ LEZCANO MARIA ROSIBEL', 'PALMAR NORTE Bº ALEMANIA CASA M-7', 'FRENTE A CENTRAL DE TAXIS* 8 C/MES*', '7867210', ''),
(1934, 'Cedula Fisica', 600900858, 'GOMEZ MARCHENA MARIA DE LOS ANGELES', 'Coronado del EBAIS 150m norte dobla', 'mano derecha 50 m.', '2786-5692', ''),
(1935, 'Cedula Fisica', 601570996, 'GOMEZ MARCHETA ROSIBEL', 'P Canoas  Darizara cs 06  fte igle-', 'sia evangélica.', '2732-2918', ''),
(1936, 'Cedula Fisica', 603460693, 'GOMEZ MENA SIANNY', 'Coto 52  Pulp 8 casas al fondo  cs', '10541.', '2781-1024', ''),
(1937, 'Cedula Fisica', 602550611, 'GOMEZ MENDOZA MARITZA', 'C Neily  R Nuevo  1º Fila cs H4', '', '8633-8953', ''),
(1938, 'Cedula Fisica', 601390786, 'GOMEZ MOYA ISIDORA', 'PTO. JIMENEZ POR ENTRADA EL BAMBU', '** FECHA DE PAGO 11 CADA MES  **', '8960822', ''),
(1939, 'Cedula Fisica', 601390786, 'GOMEZ MOYA ISIDORA', 'TPO JIMENEZ X ENTRADA AL BAMBU', '** FECHA DE PAGO 12-13 C/MES **', '8960822', ''),
(1940, 'Cedula Fisica', 601390786, 'GOMEZ MOYA ISIDORA', 'PTO jimenez  bambu Cs detras marco', 'Plaza  8413-0596', '8960822', ''),
(1941, 'Cedula Fisica', 601390786, 'GOMEZ MOYA ISIDORA.', 'URBANIZACION EL COLEGIO DIAGONAL AL', 'COLEGIO CASA:A2.P-8 C/M.', '735', ''),
(1942, 'Cedula Fisica', 104030504, 'GOMEZ PERAZA MARTHA ISABEL', 'C Neily  La Fuente  50 mts Oeste de', 'la plaza Casa verde Agua/ 8910-5340', '', ''),
(1943, 'Cedula Fisica', 500530975, 'GOMEZ PEREZ CLARO', '', '', '', ''),
(1944, 'Cedula Fisica', 500530975, 'GOMEZ PEREZ CLARO', 'COTO 54 EL DISPENSARIO', '', '7811403', ''),
(1945, 'Cedula Fisica', 500530975, 'GOMEZ PEREZ CLARO', 'Coto 54  antiguo dispensario.', '', '2781-1403', ''),
(1946, 'Cedula Fisica', 601020035, 'GOMEZ QUIROS MARTA ALICIA', 'Golfito  Recid Ureña  Cs A7', '2775-3038', '2775-2036', ''),
(1947, 'Cedula Fisica', 600290233, 'GOMEZ REYES ISAAC.', 'CARIARI DE TEMPLO METODISTA 350', 'AL ESTE CASA BLANCA', '', ''),
(1948, 'Cedula Fisica', 600840941, 'GOMEZ ROSALES ELENA', 'C.N.B.EL CARMEN DE ABROJO CASA #27', 'P.EN EL MERCADO C.N. EL 30 C/M', '', ''),
(1949, 'Cedula Fisica', 600840941, 'GOMEZ ROSALES ELENA', 'C.N.B.EL CARMEN DE ABROJO CASA #27', 'P.EN EL MERCADO C.N. EL 30 C/M', '', ''),
(1950, 'Cedula Fisica', 600840941, 'GOMEZ ROSALES ELENA', 'C.N.B.EL CARMEN DE ABROJO CASA #27', 'P.EN EL MERCADO C.N. EL 30 C/M', '7835789', ''),
(1951, 'Cedula Fisica', 407260142, 'GOMEZ SANTAMARIA GENARA', 'SAN ISIDRO PLAZA CANOAS', '', '', ''),
(1952, 'Cedula Fisica', 603070056, 'GOMEZ TREJOS NEFERTI CC. MARIA', 'DEL BAR RIO DE JANEIRO 50 MTS OESTE', '', '7751150', ''),
(1953, 'Cedula Fisica', 602830888, 'GOMEZ ZAPATA RUFINA', 'Ciudad Cortes  Urban Renacimiento', 'Cs # E-11 color Celeste', '8659-1919', ''),
(1954, 'Cedula Fisica', 601310107, 'GOMEZ ZAPATA SANTA INES', 'C Cortes  Bº Renacimiento Casa Nº', 'E-10', '8435-9021', ''),
(1955, 'Cedula Fisica', 601310107, 'GOMEZ ZAPATA SANTAINES', 'C. CORTES Bº EL RENACIMIENTO', 'CASA Nº 10-E A LA PAR DE RUFINA GOM', '', ''),
(1956, 'Cedula Fisica', 601310107, 'GOMEZ ZAPATA SANTAINES', 'Bº Renacimiento casa Nº 10.', '', '', ''),
(1957, 'Cedula Fisica', 500630320, 'GOMEZ ZUÑIGA DIEGO', 'FINCA ALAJUELA 1 KM NORTE', '', '7411179', ''),
(1958, 'Cedula Fisica', 500740896, 'GOMEZ ZUÑIGA EVARISTO', 'LA CAMPIÑA CONTIGUO AL SALON', 'COMUNAL <P> 18 C/M', '', ''),
(1959, 'Cedula Fisica', 500740896, 'GOMEZ ZUÑIGA EVARISTO', 'LA CAMPIÑA CONTIGUO AL SALON', 'COMUNAL <P> 18 C/M', '', ''),
(1960, 'Cedula Fisica', 502630709, 'GONZALE ROBLES GERARDO CC NEGRO PIC', 'P.Blancas 300 oeste Cooperativa. cs', 'celeste con rojo. Cel 8805-0947', '2741-1398', ''),
(1961, 'Cedula Fisica', 106890509, 'GONZALES MORA ASDRUBAL', 'BAMBU 600MTS OESTE DE LA PULPERIA', 'LA AMISTAD TALLER JACOB', '2735-5414', ''),
(1962, 'Cedula Fisica', 603330477, 'GONZALES MORA JUINIOR', 'LA AMAPOLA DELA ESCUELA 1KM AMTES D', 'E CALLE ALA PALMA', '7351282', ''),
(1963, 'Cedula Fisica', 102590626, 'GONZALEZ ABARCA CLAUDIO', 'Bambel 1  La granja  100m Escuela', 'Cel 8752-6717', '8616-1244', ''),
(1964, 'Cedula Fisica', 600750101, 'GONZALEZ ALFARO LUISA MARINA', 'GOLFITO PUEBLO CIVIL', 'SODA LA MANUDA <P> 03 C/M', '', ''),
(1965, 'Cedula Fisica', 600750101, 'GONZALEZ ALFARO LUISA MARINA', 'GOLFITO PUEBLO CIVIL', 'SODA LA MANUDA <P> 03 C/M', '7750598', ''),
(1966, 'Cedula Fisica', 600750101, 'GONZALEZ ALFARO LUISA MARINA', 'GOLFITO PUEBLO CIVIL', 'SODA LA MANUDA <P> 03 C/M', '7750598', ''),
(1967, 'Cedula Fisica', 600700494, 'GONZALEZ ALTAMIRANO TERESA', '', '', '', ''),
(1968, 'Cedula Fisica', 600850630, 'GONZALEZ BARQUERO ELIDA', 'Bº CARMEN ABROJO FTE PLAZA CS 29 P', '', '7832367', ''),
(1969, 'Cedula Fisica', 600850630, 'GONZALEZ BARQUERO ELIDA.', 'Bº EL CARMEN D  ABROJO FRT A LA', 'PLAZA C# 29 P. 17 Y 30 C/MES.', '', ''),
(1970, 'Cedula Fisica', 600570165, 'GONZALEZ BATISTA CONSTANTINO', 'PTO. JIMENEZ EL BAMBU 1KM. O.', 'CASA VERDE 2 PISOS', '', ''),
(1971, 'Cedula Fisica', 600570163, 'GONZALEZ BATISTA CONSTANTINO', 'P Jiménez Entrada La Balsa al fondo', 'cs hacia abajo. Cel 8648-1867.', '8692-4539', ''),
(1972, 'Cedula Fisica', 601110347, 'GONZALEZ BATISTA RUFINA', 'RIO INCENDIO DE LAUREL  200MTS AL', 'OESTE DE LA ESCUELA', '2783-8160', ''),
(1973, 'Cedula Fisica', 601980909, 'GONZALEZ BEITA MARIA LUISA', 'LA PALMA FTE ALMACEN LA PALMA', '** CANCELA 11 DE CADA MES **', '7351161', ''),
(1974, 'Cedula Fisica', 601980909, 'GONZALEZ BEITA MARIA LUISA', 'LA PALMA FTE ALMACEN LA PALMA', '** CANCELA 11 DE CADA MES **', '2735-5161', ''),
(1975, 'Cedula Fisica', 601980909, 'GONZALEZ BEITA MARIA LUISA', 'P Jiménez  La Palma  fte a Mayoreo', 'Osa.', '2735-1161', ''),
(1976, 'Cedula Fisica', 800460621, 'GONZALEZ BELLANERO ERNESTO', 'CENIZO DE LAUREL POR LA PULPERIA', 'CASA DE ALTO CASA VERDE C. MORADO', '7800559', ''),
(1977, 'Cedula Fisica', 400840016, 'GONZALEZ BOGANTES MANUEL', 'Sta ROSA D`ESC 500 Mts SUR O EN', 'OFIC COOPEFUTURO <P> 19 C/M', '', ''),
(1978, 'Cedula Fisica', 800510957, 'GONZALEZ BONICHE OBDULIO', 'LA CAMPIÑA  DE LA ESCUELA 1 KM. N.', 'HACIA COTO.', '', ''),
(1979, 'Cedula Fisica', 280851520, 'GONZALEZ CABALLERO VICTOR MANUEL', 'PUEBLO NUEVO CONTG AL PUENTE', 'DE CEMENTO', '', ''),
(1980, 'Cedula Fisica', 602250457, 'GONZALEZ CAROL ESTER', 'Golfito  Kmt 1 cuarta fila', '', '8602949', ''),
(1981, 'Cedula Fisica', 104490434, 'GONZALEZ CARVAJAL ANTONIO', 'Golfito  S Juan  contiguo a Iglesia', 'de Cristo.', '2776-2236', ''),
(1982, 'Cedula Fisica', 104490434, 'GONZALEZ CARVAJAL JOSE ANTONIO', 'calle a Playa Cacao Villa Flor de', 'Liz o en Colegio de Golf p.03 c/m', '', ''),
(1983, 'Cedula Fisica', 104490434, 'GONZALEZ CARVAJAL JOSE ANTONIO', 'CALLE A CACAO VILLA FLOR D`LIZ O EN', 'COLEG GOLFITO <P> 16 C/M', '', ''),
(1984, 'Cedula Fisica', 104490434, 'GONZALEZ CARVAJAL JOSE ANTONIO', 'GOLFITO LA ROTONDA DETRAS COLEGIO O', 'SODA EL COLEGIO', '', ''),
(1985, 'Cedula Fisica', 104490434, 'GONZALEZ CARVAJAL JOSE ANTONIO', 'GOLFITO  BARRIO SAN JUAN A UN COSTA', 'DO DE LA IGLECIA DE CRISTO', '7752198', ''),
(1986, 'Cedula Fisica', 603310497, 'GONZALEZ CERDAS VICTOR', 'Canoas  Bº Polideportivi 100 Mts', 'Sur de Bomba TEXACO    8795-0619', '8754-2284', ''),
(1987, 'Cedula Fisica', 602060662, 'GONZALEZ CHAVEZ GERARDO ALBERTO', 'golfito b.buenos aires', 'lote 17 casa blanca c/malla', '7755147', ''),
(1988, 'Cedula Fisica', 601410998, 'GONZALEZ CHINCHILLA ROSSA', 'DOMINICALITO POZA AZUL CS *14', 'CELESTE 87428322', '2787-0345', ''),
(1989, 'Cedula Fisica', 501160475, 'GONZALEZ CONTRERAS JUSTO PASTOR.', 'CIUDAD NEILLY  22 DE OCTUBRE 1 er', 'ENTRADA SEGUNDA CASA M. DERECHA.', '7833760', ''),
(1990, 'Cedula Fisica', 500620514, 'GONZALEZ CORDERO RAMON', 'PALMAR SUR EN FINCA 7', '89677689', '8673-0834', ''),
(1991, 'Cedula Fisica', 603040228, 'GONZALEZ CORELLA JOSE MARIA', 'COLORADO DE PASO CANOAS COSTADO EST', 'DE LA PLAZA.', '', ''),
(1992, 'Cedula Fisica', 601580683, 'GONZALEZ CRUZ CRISTINA', 'RIO CLARO  BAMBEL 4 DE ENTRADA', 'PRINCIPAL 600 SUR', '7899732', ''),
(1993, 'Cedula Fisica', 501570781, 'GONZALEZ CRUZ ELADIO', 'ZANCUDO  FRENTE A RANCHO COQUITO', 'SODA MARALIN <P> 15 C/M', '', ''),
(1994, 'Cedula Fisica', 204190017, 'GONZALEZ CRUZ ELIETH', 'SAN ANTONIO SABALITO  FRENTE A LA', 'IGLESIA CATOLICA', '8852-5597', ''),
(1995, 'Cedula Fisica', 502530073, 'GONZALEZ CRUZ EMILCE', 'Agua Buena. Pueblo Nuevo  500 Mts', 'de Iglesia X   Puente     2200-9649', '8609-7126', ''),
(1996, 'Cedula Fisica', 603800372, 'GONZALEZ DEL RIO MICHAEL', 'Golfito  Res Ureña CS C14.', '', '8353-8919', ''),
(1997, 'Cedula Fisica', 603550139, 'GONZALEZ FALLAS LAURA', 'CHACARITA  150 mts N. de servicient', 'abastecedor Kristopher.', '7233692', ''),
(1998, 'Cedula Fisica', 500900478, 'GONZALEZ FENNELL LUIS', '', '', '', ''),
(1999, 'Cedula Fisica', 602710304, 'GONZALEZ FONSECA FLORIBETH', 'P Jiménez Bambú costado plaza de de', 'portes cs madera.', '8896-5371', ''),
(2000, 'Cedula Fisica', 107720535, 'GONZALEZ GOMEZ JOSUE', 'San José  Bº Lujan 150 Oeste BCR', 'Cont autobutic Ideal.', '5862-4849', ''),
(2001, 'Cedula Fisica', 600360782, 'GONZALEZ GONZALEZ FRACIA', 'C Cortés C Pacheco cs 223.', '', '8567-8352', ''),
(2002, 'Cedula Fisica', 900120763, 'GONZALEZ GONZALEZ ISABEL', 'Golfito  Pueblo Civil a un costado', 'de la escuela.', '2775-3309', ''),
(2003, 'Cedula Fisica', 900120763, 'GONZALEZ GONZALEZ ISABEL', 'Golfito  Pueblo Civil  a un costado', 'de la escuela.', '2775-3309', ''),
(2004, 'Cedula Fisica', 600440904, 'GONZALEZ GONZALEZ JOSE JESUS.', 'DE LA CANTINA DE ABANGARES 100 MTS', 'ESTE Y 2kmt SUR.', '', ''),
(2005, 'Cedula Fisica', 600520922, 'GONZALEZ GONZALEZ LAURIANO', 'EL BARRIDO 300 Mts OESTE.', '<P> 18 C/M', '', ''),
(2006, 'Cedula Fisica', 800650967, 'GONZALEZ GONZALEZ MANUEL', 'CALLE A PASO CANOAS CONTG A OFICINA', 'DEL GUSANO BARRENADOR.', '7322483', ''),
(2007, 'Cedula Fisica', 600420271, 'GONZALEZ GONZALEZ TEOFILO', 'CIUDAD NEILY 25 M AL ESTE', 'DEL CUERPO DE BOMBEROS', '7833246', ''),
(2008, 'Cedula Fisica', 201310948, 'GONZALEZ GONZALEZ VICTOR JULIO', 'GOLFITO KM 1 LA BOLSA DE PULP ANGIE', '100 NORTE Y 100 ESTE C #4159 P. 09', '', ''),
(2009, 'Cedula Fisica', 800780812, 'GONZALEZ GUERRA CRISTINO', 'Paso canoas Bettel de igles advent', '250 O Cs Blanca con Gris Cemento', '3222-0713', ''),
(2010, 'Cedula Fisica', 500500428, 'GONZALEZ GUTIERREZ VIDAL', 'CAIMITO 50 MTS OESTE DE COMISARIATO', 'MIXTA', '', ''),
(2011, 'Cedula Fisica', 600480889, 'GONZALEZ JIMENEZ RAFAEL MARIA', 'P Canoas  S Martín  200m oeste del', 'cruce pata de Gallina. Cel 8750-804', '2732-3548', ''),
(2012, 'Cedula Fisica', 603260566, 'GONZALEZ LEITON SALOME DENNIS', 'Drake  Hotel Aguila de Osa.', '', '8640-9703', ''),
(2013, 'Cedula Fisica', 501690591, 'GONZALEZ LOPEZ GONZALO HERIBERTO', 'COTO 56  EN PULPERIA', '** FECHA EXACTA DE PAGO 30 C/MES **', '7811254', ''),
(2014, 'Cedula Fisica', 103921113, 'GONZALEZ MARIN FELIX CLAUDIO', '', '', '', ''),
(2015, 'Cedula Fisica', 601860149, 'GONZALEZ MAYORGA DIDIER', 'PTO JIMENEZ LA PALMA', '50 NORTE DE COMERCIAL YASI', '7899064', ''),
(2016, 'Cedula Fisica', 601860149, 'GONZALEZ MAYORGA DIDIER', 'PTO JIMENEZ LA PALMA', '50 NORTE DE COMERCIAL YASI', '7899064', ''),
(2017, 'Cedula Fisica', 601860149, 'GONZALEZ MAYORGA DIDIER', 'MUNIC. DE GOLFITO / KM 37 /', '** CANCELA 16 CADA MES  **', '8557216', ''),
(2018, 'Cedula Fisica', 601860149, 'GONZALEZ MAYORGA DIDIER', 'Km 37  Villa Briceño  200m Norte y', '100 oeste de Abast. Abangares.', '8524-7551', ''),
(2019, 'Cedula Fisica', 601760571, 'GONZALEZ MAYORGA MERLY', 'PTO JIMENEZ PLAYA BLANCA 600 SUR', 'DE PLAYA * CANCELA 11 C/MES *', '3809407', ''),
(2020, 'Cedula Fisica', 601760571, 'GONZALEZ MAYORGA MERLY', 'R Claro  Oficina.', '', '8380-9407', ''),
(2021, 'Cedula Fisica', 602860485, 'GONZALEZ MENA ALVARO STEVENS', 'Golfito Urb Tukler casa Nº D24 call', 'las gradas   8986-7365', '2775-2105', ''),
(2022, 'Cedula Fisica', 600310821, 'GONZALEZ MESEN MANUEL', 'Laurel Vereh 1 km este de Escuela', '', '-', ''),
(2023, 'Cedula Fisica', 280114974, 'GONZALEZ MOJICA ARCINIO', 'L`CUESTA CONTROL D`PULP L`BELLA 50', 'Mts ESTE CASA METIDA <P> 30 C/M', '732', ''),
(2024, 'Cedula Fisica', 159100201, 'GONZALEZ MOJICA ARCINIO', 'La Cuesta  Control  30 m antes Pulp', 'Bella.', '2732-1909', ''),
(2025, 'Cedula Fisica', 191800000, 'GONZALEZ MOJICA Mª DILCIA', 'LA CUESTA LA CAÑAZA O CARNICERIA LA', 'MODERNA <P> 30 C/M', '', ''),
(2026, 'Cedula Fisica', 191800000, 'GONZALEZ MOJICA Mª DILCIA', 'LA CUESTA LA CAÑAZA O CARNICERIA LA', 'MODERNA <P> 30 C/M', '', ''),
(2027, 'Cedula Fisica', 280159184, 'GONZALEZ MOJICA Mª DILCIA', 'LA CUESTA LA CAÑAZA O CARNICERIA LA', 'MODERNA <P> 30 C/M', '7322309', ''),
(2028, 'Cedula Fisica', 280159184, 'GONZALEZ MOJICA Mª DILCIA', 'LA CUESTA LA CAÑAZA O CARNICERIA LA', 'MODERNA <P> 30 C/M', '7322309', ''),
(2029, 'Cedula Fisica', 191800000, 'GONZALEZ MOJICA MARIA DILCIA.', 'LA CUESTA  CIUD TAMAYO CASA 23-A O', 'EN CARNICERIA LA MODERNA <P> 30 C/m', '782309', ''),
(2030, 'Cedula Fisica', 600590412, 'GONZALEZ MOLINA ABELARDO', 'FINCA COTO 44  CASA Nº 17724', 'CONTIGUO A PULPERIA', '', ''),
(2031, 'Cedula Fisica', 600590412, 'GONZALEZ MOLINA ABELARDO', 'P Canoas  Darizara  Bloque C10 fte', 'a la plaza.', '2732-3382', ''),
(2032, 'Cedula Fisica', 113540136, 'GONZALEZ MOLINA CARLOS', 'C Neily C González Taller Filos del', 'Sur.', '8665-7437', ''),
(2033, 'Cedula Fisica', 103573471, 'GONZALEZ MONTENEGRO JOSE D. (PANA)', '', '', '', ''),
(2034, 'Cedula Fisica', 500460689, 'GONZALEZ MORA CARMEN', 'LA PALMA PULP. LA CHIRIPA.', 'p.25 c/m', '', ''),
(2035, 'Cedula Fisica', 500460689, 'GONZALEZ MORA CARMEN', 'LA PALMA PULPERIA LA CIRIPA', '<P> 30 C/M', '', ''),
(2036, 'Cedula Fisica', 602680970, 'GONZALEZ MORALES ELSIE', 'CAIMITO DE LAUREL AL NORTE DE LA', 'PLAZA CASA ESQ. C.NARANJA CON VERDE', '7800105', ''),
(2037, 'Cedula Fisica', 104510934, 'GONZALEZ MORERA GONZALO', 'P. Canoas  agencia Husquarna fte a', 'bomba Panameña. Cel 8347-7243.', '2732-1397', ''),
(2038, 'Cedula Fisica', 104210934, 'GONZALEZ MORERA GONZALO', 'P Canoas  fte Bomba Panameña Conejo', 'Cel 8804-7942.', '2783-2158', ''),
(2039, 'Cedula Fisica', 900340775, 'GONZALEZ MORERA YADIRA', 'Ciudad Neily  Cabinas helga', '', '', ''),
(2040, 'Cedula Fisica', 900340755, 'GONZALEZ MORERA YADIRA', 'C Neily  Cabinas Helga.', 'Cel 8822-5457.', '2783-3146', ''),
(2041, 'Cedula Fisica', 900380633, 'GONZALEZ MUÑOS CARLOS', 'PALMAR SUR FRENTE COOPEMECSUR SEGUN', 'DA CASA', '7866545', ''),
(2042, 'Cedula Fisica', 900380633, 'GONZALEZ MUÑOS CARLOS', 'PALMAR SUR FRENTE COOPEMECSUR SEGUN', 'DA CASA * CANCELA 8 C/MES *', '7866545', ''),
(2043, 'Cedula Fisica', 900380633, 'GONZALEZ MUÑOZ CARLOS', 'Palmar Sur frente a Rest. Chino', 'El Delfin.', '', ''),
(2044, 'Cedula Fisica', 601060556, 'GONZALEZ MURILLO IVETH', 'GOLFITO LA MONA URB. NUEVA POR', 'EL BAZAR', '7756320', ''),
(2045, 'Cedula Fisica', 601060556, 'GONZALEZ MURILLO IVETH', 'LA MONA URB. NUEVA POR EL BAZAR', '', '7756320', ''),
(2046, 'Cedula Fisica', 601060556, 'GONZALEZ MURILLO IVETH', 'Golfito  La Mona  Urba Nueva', 'carretera hacia el nartillo c.N G32', '7751474', ''),
(2047, 'Cedula Fisica', 205140911, 'GONZALEZ NAVAS KATTIA.', 'DE LA ANTIGUA CRUZ ROJA 25 MTS A', 'MANO DERECHA.RIO CLARO.C/HOSPITAL.', '', ''),
(2048, 'Cedula Fisica', 501580442, 'GONZALEZ NUÑEZ CRISTOBAL.', 'TINOCO CONTIGUO BAR LA PRINCESA.', '', '', ''),
(2049, 'Cedula Fisica', 602110332, 'GONZALEZ ORTIZ ANTONIO.', 'FINCA Nº18 DE AGROSUR.', '<P> 06 C/M', '7888327', ''),
(2050, 'Cedula Fisica', 501160101, 'GONZALEZ PICADO JESUS', 'Barrio el Carmen de Abrojo.', '150 Este de la Iglesia Católica', '7836039', ''),
(2051, 'Cedula Fisica', 602420314, 'GONZALEZ QUINTERO LIZBETH', 'PTO JIMENEZ  CASA AL COSTADO N. DE', 'LA IGLESIA CATOLICA P. 11 DE C/MES', '735', ''),
(2052, 'Cedula Fisica', 600260158, 'GONZALEZ QUIROS MIGUEL ANGEL', 'PIEDRAS BLANCAS FCA LIMON 1 KM.OEST', 'DEL CEMENTERIO CASA EN CURVA. 8 C/M', '', ''),
(2053, 'Cedula Fisica', 204153061, 'GONZALEZ RAMIREZ CARMEN', 'PUEBLO NUEVO DE COTO DIAGONAL AL', 'REDONDEL  FECHA DE PAGO 13 CADA MES', '', ''),
(2054, 'Cedula Fisica', 503620854, 'GONZALEZ RAMIREZ GERLYN', '11KM CAMINO A MAT PALO PLAYA ama', 'TAMALES', '8301-0075', ''),
(2055, 'Cedula Fisica', 200900798, 'GONZALEZ RODRIGUEZ JORGE', '', '', '', ''),
(2056, 'Cedula Fisica', 606940494, 'GONZALEZ RODRIGUEZ YAMILETH', 'Golfito  Comte  Ciud Guyamí cs 53', 'del público 50 sur.', '2776-8263', ''),
(2057, 'Cedula Fisica', 602430419, 'GONZALEZ SAMUDIO GEOVANA.', 'Golfito  La Gamba  200m de Pulpería', 'camino al bonito.', '8742-2583', ''),
(2058, 'Cedula Fisica', 602680969, 'GONZALEZ SANCHEZ HAROLD', 'LA CUESTA 800 METROS AL OESTE DE', 'LA GUARDIA RURAL', '', ''),
(2059, 'Cedula Fisica', 602100830, 'GONZALEZ SOLIS MIGUEL', 'F.C.A. COTO 54 CASA 10962', '', '', ''),
(2060, 'Cedula Fisica', 602240884, 'GONZALEZ TIFER NOEMY', 'INVU LA ROTONDA DETRAS DEL COLEGIO', 'O APIAGOL <P> 16 C/M', '*-*-*-*', ''),
(2061, 'Cedula Fisica', 601600278, 'GONZALEZ ULATE MARCIANO', 'Pavas  100 E Colegio Rincón Grande.', 'Cel 8629-7740.', '2213-1341', ''),
(2062, 'Cedula Fisica', 600380346, 'GONZALEZ VALDEZ PEDRO', 'PASO CANOAS SAN MARTIN 500 N. DE LA', 'ESCUELA * PENCIONADO *', '7321834', ''),
(2063, 'Cedula Fisica', 600820726, 'GONZALEZ VALVERDE ANGEL', 'CIUDAD CEILY. ( TAXISTA )', 'P.16 C/M.', '', ''),
(2064, 'Cedula Fisica', 600970637, 'GONZALEZ VARGAS FRANCISCO', 'COTO 47 CASA # 11076 CALLE PATY', 'FRENTE A ARBOL ALMENDRO P.30 C/M', '7833985', ''),
(2065, 'Cedula Fisica', 600970637, 'GONZALEZ VARGAS FRANCISCO', 'Coto 47  cs 11076 sobre pavimento', 'cobrar despues 4 de la tarde.', '2781-1026', ''),
(2066, 'Cedula Fisica', 600870322, 'GONZALEZ VENEGAS FRANCISCO', 'Comte  La Estrella  Bar Chico.', '', '8819-4823', ''),
(2067, 'Cedula Fisica', 600870322, 'GONZALEZ VENEGAS FRANCISCO', 'LA ESTRELLA BAR REST', '', '8819-4823', ''),
(2068, 'Cedula Fisica', 602450817, 'GONZALEZ VILLALTA MARIA ANITA', 'DOMINICALITO POZA AZUL CASA *8', 'COLOR VERDE', '8673-0834', ''),
(2069, 'Cedula Fisica', 600550131, 'GONZALEZ ZAPATA INES', 'Sabalito  300 Mts de bodega de', 'mayoreo  Cs color verde  calle de p', '2784-0236', ''),
(2070, 'Cedula Fisica', 109210540, 'GONZALEZ ZUÑIGA RAYMOND', 'Gusano Barrenador Paso Canoas', '<P> 15 C/M', '*-*-*-*', ''),
(2071, 'Cedula Fisica', 109210540, 'GONZALEZ ZUÑIGA RAYMOND', 'GUSANO BARRENAOR PASO CANOAS', '', '', ''),
(2072, 'Cedula Fisica', 600830151, 'GORGONA GUTIERREZ GERMAN', 'LOS CASTAÑOS AL FONDO DE CALLE', '** FECHA DE PAGO 12 CADA MES **', '7811126', ''),
(2073, 'Cedula Fisica', 600830151, 'GORGONA GUTIERREZ GERMAN', 'LOS CASTAÑOS AL FONDO DE LA CALLE', '', '', ''),
(2074, 'Cedula Fisica', 600830151, 'GORGONA GUTIERREZ GERMAN', 'Las Fincas  Los Castaños  contiguo', 'a la escuela. Cel 8944-3808.', '2781-1126', ''),
(2075, 'Cedula Fisica', 501120466, 'GRACIA JUAREZ BOLIVAR', 'escuadra de conte.2km al norte del', 'colegio conte', '2776-8110', ''),
(2076, 'Cedula Fisica', 602130602, 'GRACIA VIQUEZ MARIA', 'R Claro  S Ramón  Fte Esc. S Ramón.', '', '8539-9477', ''),
(2077, 'Cedula Fisica', 600552201, 'GRANADOS ELIZONDO DOMINGA', 'R Claro  Bambel 1  Pulp.Jardín 350m', 'norte.', '8756-9560', ''),
(2078, 'Cedula Fisica', 103070412, 'GRANADOS ROJAS GUSELLE', '', '', '', ''),
(2079, 'Cedula Fisica', 602640221, 'GRANADOS SEQUEIRA EVELYN', 'CIUDAD NEILY Bº SAN JUAN 15/CM', 'TRAB. TANGO Y CSH', '7831191', ''),
(2080, 'Cedula Fisica', 601031011, 'GRANADOS SOLIS RAFAEL', '', '', '', ''),
(2081, 'Cedula Fisica', 601790770, 'GRANADOS SOLIS VIRGINIA', 'CIUDAD CORTES Bº LA LAGUNA', '', '2788-8913', ''),
(2082, 'Cedula Fisica', 101285126, 'GRANADOS SOLORZANO ALEXANDER', 'Palmar  S del estadio 1era entrada', '2da Cs M/D 8555-8118', '', ''),
(2083, 'Cedula Fisica', 203290234, 'GRANADOS SOTO MERY', 'LA CENTRAL CAMPESINA DE LA IGLE EVA', 'NGELICA 75MTS SUR DE DE MADERA', '2781-1164', ''),
(2084, 'Cedula Fisica', 601610735, 'GRANADOS TAPIA ALICE', 'P Canoas  Bº Comandos  Pulp Andrey', '25 m norte  cs crema.', '8967-5293', ''),
(2085, 'Cedula Fisica', 600310916, 'GRANADOS VILLANUEVA VALENTIN', 'CIUDAD NEILY 22 DE OCTUBRE CASA', '# 36 <P> EN OFICINA', '', ''),
(2086, 'Cedula Fisica', 600310916, 'GRANADOS VILLANUEVA VALENTIN.', 'C. NEILY 22/OCTUBRE BLOQUE A CASA', '39', '', ''),
(2087, 'Cedula Fisica', 603210137, 'GRANADOS ZUÑIGA WILGEN JOSE', 'Copa Buena 500 S de Esc Cs verde', 'Prefabricada. 8984-7098', '8786-2533', ''),
(2088, 'Cedula Fisica', 900710199, 'GRANDA MORALES ANTOLIN', 'Rio claro c. el esfuerzo', '', '', ''),
(2089, 'Cedula Fisica', 800400719, 'GRANERA ALTAMIRANO ELBA', 'GOLFITO KMT 2.5 PULP LIRIO BLANCO', 'FRENTE A TALLER MECANICO P.03 C/M.', '775', ''),
(2090, 'Cedula Fisica', 800400719, 'GRANERA ALTAMIRANO ELBA', 'GOLFITO KMT 2.5 PULP LIRIO BLANCO', 'FRENTE A TALLER MECANICO P.03 C/M.', '7751355', ''),
(2091, 'Cedula Fisica', 800400719, 'GRANERA ALTAMIRANO ELVA', 'Golfito  Kmt 2.5 pulp lirio blanco', 'frente taller mecanico P. 03 c/m', '775', ''),
(2092, 'Cedula Fisica', 601710380, 'GRIJALBA GOMEZ JORGE ENRIQUE', 'Fca CAUCHO DE LUAREL OFICINAS DE', 'COOPETRABASUR <P> 30 C/M', '', ''),
(2093, 'Cedula Fisica', 501150731, 'GRIJALVA CAMPOS FRANKLIN', 'NO SE REGSITRO.', '', '', ''),
(2094, 'Cedula Fisica', 501150731, 'GRIJALVA CAMPOS FRANKLIN', 'NO SE REGSITRO.', '', '', ''),
(2095, 'Cedula Fisica', 501220971, 'GRIJALVA RUIZ TEODORA.', 'CIUDAD NEILY  Bº SAN RAFAEL', '', '', ''),
(2096, 'Cedula Fisica', 501220971, 'GRIJALVA RUIZ TEODORA.', 'CIUDAD NEILY  Bº SAN RAFAEL', '', '', ''),
(2097, 'Cedula Fisica', 609740324, 'GTUIERREZ TORUÑO LIDIETH', 'Cortes  Bo Pacheco Pulperia Li.', '', '3307467', ''),
(2098, 'Cedula Fisica', 600710612, 'GUADAMUZ GUADAMUZ JULIANA', 'Pueblo nuevo frente pulp el barrido', 'Pulp el cruce  8692-7312', '', ''),
(2099, 'Cedula Fisica', 601900684, 'GUADAMUZ MATA NURIA MARIA', 'Golfito  km 2 1/2 fte taller Arroyo', 'cs de la montaña.', '8515-3825', ''),
(2100, 'Cedula Fisica', 601290301, 'GUADAMUZ NOVOA EULOGIO CC FRANCISCO', 'Fca Puntarenas  50 m antes Escuela', 'Casa 2 plantas.', '8807-8620', ''),
(2101, 'Cedula Fisica', 601470407, 'GUADAMUZ NOVOA ROSALIA VICTORIA', 'P Norte  p', '', '8971-0933', ''),
(2102, 'Cedula Fisica', 500540368, 'GUADAMUZ NOVOA ROSARIO', 'VENECIA DE OSA  DE LA ESCUELA', '200 MTS AL ESTE', '', ''),
(2103, 'Cedula Fisica', 601610858, 'GUADAMUZ NOVOA SANDRA.', 'RIO CLARO 100 MTS AL NORTE DE LA CA', 'SONA DE LOS MARISCOS.', '', ''),
(2104, 'Cedula Fisica', 600400139, 'GUADAMUZ NUÑEZ ELADIO', 'R Claro  La Esperanza  Casa 31.', '', '8737-6967', ''),
(2105, 'Cedula Fisica', 501430207, 'GUADAMUZ ORTIZ LUIS', 'CIUDAD CORTES  Bº OJO DE AGUA PULP', 'Y PILADORA EL CEIBO.', '788', ''),
(2106, 'Cedula Fisica', 602190669, 'GUADAMUZ ORTIZ SANDRA', 'C. Cortés  Ojo de Agua  piladora de', 'arroz.', '', ''),
(2107, 'Cedula Fisica', 602190669, 'GUADAMUZ ORTIZ SANDRA', 'C Cortés  Ojo de agua  Piladora el', 'Ceibo. Cel 8732-9753.', '2786-4228', ''),
(2108, 'Cedula Fisica', 600850605, 'GUADAMUZ TENORIO MARIA', 'DISPLEY/EL GUABO 200 MTS 2da ENTRAD', 'TERECER CASA MANO IZQUI C.C. ROSADA', '7898747', ''),
(2109, 'Cedula Fisica', 600850605, 'GUADAMUZ TENORIO MARIA', 'DISPLEY/EL GUABO 200 MTS 2da ENTRAD', 'TERECER CASA MANO IZQUI C.C. ROSADA', '7898747', ''),
(2110, 'Cedula Fisica', 600850605, 'GUADAMUZ TENORIO MARIA', 'R. Claro  El Guabo 200 M 2º entrada', '3º Casa M. Izq C.C. Rosada.', '2789-7496', ''),
(2111, 'Cedula Fisica', 900330152, 'GUBILLA GUBILLA EUSTAQUIO', 'GOLFITO  PURRUJA DE LA ESCUELA 75', 'MTS. PAGA EL 16 DE CADA MES.', '775', ''),
(2112, 'Cedula Fisica', 900330152, 'GUBILLA GUBILLA EUSTAQUIO', 'Golfito Km7 a un costado Salón Comu', 'nal.', '', ''),
(2113, 'Cedula Fisica', 600350493, 'GUERRA CEDEÑO GILBERTO', 'El Barrido  Las Vegas de Comte;Casa', 'antes de las alemanas.', '', ''),
(2114, 'Cedula Fisica', 900330583, 'GUERRA CHAVARRIA AGUSTIN', 'La Virgen de Pavones  2 km sur igle', 'sia católica.', '8387-7588', ''),
(2115, 'Cedula Fisica', 903300583, 'GUERRA CHAVARRIA AGUSTIN', 'La Virgen de Pavones  2 km sur igle', 'sia católica.', '8723-5294', ''),
(2116, 'Cedula Fisica', 600790490, 'GUERRA CHAVARRIA DEMETRIO', 'SANCUDO  100 MTS NORTE DE PANADERIA', '', '', ''),
(2117, 'Cedula Fisica', 600790490, 'GUERRA CHAVARRIA DEMETRIO', 'zancudo 100 norte de panaderia', '', '', ''),
(2118, 'Cedula Fisica', 600790490, 'GUERRA CHAVARRIA DEMETRIO', 'Zancudo 200 norte de Zancudo LODGE', 'Cs cemento blanca  8763-8892', '2776-0197', ''),
(2119, 'Cedula Fisica', 604390601, 'GUERRA GAMAZA ANDREA MARIA', 'C Cortés  Bº Renacim. cs 111.', 'Cel 8608-4528.', '2788-8703', ''),
(2120, 'Cedula Fisica', 602270660, 'GUERRA GRANDA CRISTINA', 'GOLFITO  Kmt 2 PESCADERIA', 'COOPEMONTECILLOS <P> 03 C/M', '7750270', ''),
(2121, 'Cedula Fisica', 601490826, 'GUERRERO AGUERO JUAN', 'PAVONES  LA VIRGEN 300 MTS DE LA', 'ESCUELA CALLE A ZANCUDO.llamar ante', '2780-0641', ''),
(2122, 'Cedula Fisica', 601490826, 'GUERRERO AGUERO JUAN GERARDO', 'LA VIRGEN DE CONTE POR TELEFONO PUB', 'LICO *** CANCELA 13 C/MES ***', '3937302', ''),
(2123, 'Cedula Fisica', 500945054, 'GUERRERO ARBUROLA EDITH', 'RIO CLARO CONTIGUO A LA GUARDIA', 'RURAL P.03 C/M', '789', ''),
(2124, 'Cedula Fisica', 600570002, 'GUERRERO BRENES LETICIA', 'CIUDAD NEILY Bº EL PROGRESO', 'CASA #25.', '7835449', ''),
(2125, 'Cedula Fisica', 103630267, 'GUERRERO CARDENAS JOSE ANGEL', 'LA MONA B PROGRESO  4TA ENTRADA  AL', 'FONDO MANO DERECHA 5TA CASA MARIBEL', '', ''),
(2126, 'Cedula Fisica', 601200157, 'GUERRERO GUERRERO MAXIMILIANO', 'LA PALMA FRENTE A ORO SOL', '', '', ''),
(2127, 'Cedula Fisica', 601200157, 'GUERRERO GUERRERO MAXIMILIANO', 'P Jiménez  fte soda La Esquina', '', '2735-1087', ''),
(2128, 'Cedula Fisica', 270818943, 'GUERRERO GUERRERO SARA', 'BARRIO EL PROGRESO COSTADO OESTE DE', 'LA ARROCERA.', '', ''),
(2129, 'Cedula Fisica', 103630589, 'GUERRERO GUERRERO VICTORIA', 'Pavones  Cuervito  2km suereste Esc', 'Cuervito  fte torre cs verde.', '2776-8158', ''),
(2130, 'Cedula Fisica', 602170407, 'GUEVARA ARGUEDAS JAVIER', 'Kmt 27  150 desp entrad monteverde', 'Cs Verjas Negras Color Natural', '8656-5697', ''),
(2131, 'Cedula Fisica', 501600514, 'GUEVARA CARRILLO JOSE ZENEIDO', 'KM 20 EN URB. NUEVA CONSIGNADO A', 'LUSBIN ZUÑIGA P. * CANCELA 2 C/MES', '7811439', ''),
(2132, 'Cedula Fisica', 501600514, 'GUEVARA CARRILLO JOSE ZENEIDO', 'Fca Coto 47  diagonal marco del es-', 'tadio. Casa 10324.', '8663-9801', ''),
(2133, 'Cedula Fisica', 600350493, 'GUEVARA CEDEÑO GILBERTO', 'conte', '', '', ''),
(2134, 'Cedula Fisica', 500660379, 'GUEVARA CORTES PEDRO.', 'SANTA LUCIA  DEL TEMPLO EVANGELICO', '500 NORTE CASA AZUL C BLANCO.', '', ''),
(2135, 'Cedula Fisica', 500660379, 'GUEVARA CORTES PEDRO.', 'SANTA LUCIA  DEL TEMPLO EVANGELICO', '500 NORTE CASA AZUL C BLANCO.', '', ''),
(2136, 'Cedula Fisica', 500660379, 'GUEVARA CORTES PEDRO.', 'SANTA LUCIA  DEL TEMPLO EVANGELICO', '500 NORTE CASA AZUL C BLANCO.', '3917103', ''),
(2137, 'Cedula Fisica', 270292391, 'GUEVARA DOMINGUEZ MATIAS', 'RIO CLARO DEL SALON FAMILIAR 100 Mt', 'NORTE FRENT PLAZA <P> 16 C/M', '', ''),
(2138, 'Cedula Fisica', 501370339, 'GUEVARA ESPINOZA ANTONIO', '', '', '', ''),
(2139, 'Cedula Fisica', 501280050, 'GUEVARA ESPINOZA ELADIO', '', '', '', ''),
(2140, 'Cedula Fisica', 500640040, 'GUEVARA MANZANARES EMILCE', 'GOLFITO B. BELLA VISTA POR LA', 'ESCUELA CASA N. 4302', '7751900', ''),
(2141, 'Cedula Fisica', 500140640, 'GUEVARA MANZANARES EMILCE', 'BARRIO BELLA VISTA X LA ESCUELA', 'ANTIGUO TALLER FOFO', '8994129', ''),
(2142, 'Cedula Fisica', 500950650, 'GUEVARA MATARRITA MARIA ELPIDIA', 'RIO CLARO DE LA BOMBA 500 MTS AL N.', 'Y 150 AL ESTE.', '', ''),
(2143, 'Cedula Fisica', 103202054, 'GUEVARA MORA CARLOS ALBERTO', 'Laurel  El Invu  casa 21  diagonal', 'antigua pulpería.', '2780-0285', ''),
(2144, 'Cedula Fisica', 601830283, 'GUEVARA PIZARRO JESSICA', 'GOLF Bº BELLA VISTA 2dª FILA FRENTE', 'A TRACOPA <P> 09 C/M', '7751959', ''),
(2145, 'Cedula Fisica', 601830283, 'GUEVARA PIZARRO JESSICA', 'GOLF Bº BELLA VISTA 2dª FILA FRENTE', 'A TRACOPA <P> 09 C/M', '7751959', ''),
(2146, 'Cedula Fisica', 600510829, 'GUEVARA QUINTERO HAYDEE', 'Golfito  El Civil  100 sur de la', 'Iglesia Católica.', '8629-4818', ''),
(2147, 'Cedula Fisica', 104660217, 'GUEVARA QUINTERO LEDA TERESA', 'Golfito  El Civil  150m este de la', 'Municipalidad. cs papaya. 8946-5416', '2775-1913', ''),
(2148, 'Cedula Fisica', 601890862, 'GUEVARA RUIZ LUIS ANGEL', 'GOLFITO RESIDENCIAL UREÑA CASA I-14', '', '', ''),
(2149, 'Cedula Fisica', 601960044, 'GUIDO BATRES MARIA ELIZABETH', 'Laurel Fca Caucho  un costado de la', 'plaza  tercera casa.', '2780-0317', ''),
(2150, 'Cedula Fisica', 502820282, 'GUIDO CORTEZ OLGER', 'Cortés S Buenas fte plaza cs amari-', 'lla. Vive en Tres Rios. Deposita Bc', '8343-7757', ''),
(2151, 'Cedula Fisica', 602510121, 'GUIDO GONZALEZ Mª ESTELIA', 'LAUREL INVU EN LA SIGUIENTE FILA DE', 'CANO GONZALEZ <P> 30 C/M', '', ''),
(2152, 'Cedula Fisica', 602510121, 'GUIDO GONZALEZ MARIA ESTELIA', 'Laurel INVU 200m Norte del puente ', 'contiguo a Bellanira.', '', ''),
(2153, 'Cedula Fisica', 500760192, 'GUIDO PEREZ BRAULIO RAMON', 'Cortés  Sambuena frente a la plaza.', '', '', ''),
(2154, 'Cedula Fisica', 102360426, 'GUILLEN ARIAS REMIGIO', 'San vito  100 M O del taller Juan', 'Cubero El Campo  2773-3313', '8973-1081', ''),
(2155, 'Cedula Fisica', 601070670, 'GUILLEN FALLAS DAGOBERTO', 'COLORADO CENTRO A LA PAR DEL', 'COMUNAL PULPERIA COLORADO', '8516-8908', ''),
(2156, 'Cedula Fisica', 600900998, 'GUILLEN FALLAS OMAR', 'ENTRADA A LA BOTA DE COLORADO', '300M', '', ''),
(2157, 'Cedula Fisica', 603040802, 'GUILLEN MADRIGAL NORELI', 'Bº El estadio en Sedisur ', '', '7833420', ''),
(2158, 'Cedula Fisica', 105600575, 'GUILLEN SALAZAR JORGE FRANCISCO', 'NEILLY LIBRERIA CRISTIANA OREP', 'COBRAR A LA ESPOSA.', '', ''),
(2159, 'Cedula Fisica', 500580597, 'GUITIERREZ GUTIERREZ SANTIAGO', 'LA CHANCHERA 300MTRS DE LA INTERAME', 'RICANA DE RIO CLARO CARACOL', '2789-7131', ''),
(2160, 'Cedula Fisica', 600860394, 'GUITIERREZ TORRES CECILIA', 'KM 10 DE GOLFITO FTE. PULPERIA LA', 'GUARIA CONTIGUO A ESCUELA', '7899742', ''),
(2161, 'Cedula Fisica', 155803598, 'GURDIAN IDIAQUEZ ESCARLETH', 'BARRIO ALAMEDAS ANTIGUO I.C.E 25MTR', 'AL OESTE BELLA VISTA GOLFITO', '8874-4215', ''),
(2162, 'Cedula Fisica', 700950509, 'GUTIERRES RODRIGUEZ VICTOR', 'La Escuadra de conte. recidencia gu', 'aimy casa n 12', '8544-2298', ''),
(2163, 'Cedula Fisica', 500244445, 'GUTIERREZ BRICEÑO RAFAELA.', 'CIUDAD NEILY  Bº LAS LATAS.', '', '', ''),
(2164, 'Cedula Fisica', 800450290, 'GUTIERREZ BUSTOS JUSTO', 'GOLFITO BARRIO BELLA VISTA FRENTE A', 'ESCUELA SAN JOSE PULP LA ESCUELA.', '7750121', ''),
(2165, 'Cedula Fisica', 800450290, 'GUTIERREZ BUSTOS JUSTO', 'GOLFITO  Bº BELLA VISTA CASA Nº4326', 'FRET A LA ESCUELA SAN JOSE LADO SUR', '7750121', ''),
(2166, 'Cedula Fisica', 800450290, 'GUTIERREZ BUSTOS JUSTO', 'GOLFITO Bº BELLA VISTA CASA Nº 4326', 'COSTADO SUR DE LA ESCUELA.', '7750121', ''),
(2167, 'Cedula Fisica', 800450290, 'GUTIERREZ BUSTOS JUSTO', 'GOLFITO Bº BELLA VISTA EN ABAST. FT', 'A LA ESCUELA FECHA DE PAGO 3 C/M', '7750121', ''),
(2168, 'Cedula Fisica', 201380749, 'GUTIERREZ CARRANZA MARIA EVANGELINA', 'LA FLORIDA DE NAZARETH FRENTE A LA', 'PULPERIA', '', ''),
(2169, 'Cedula Fisica', 602730448, 'GUTIERREZ CASTILLO DENIS ALBERTO', 'Palmar Finca 12 costado oeste plaza', 'futbool. Cel 8565-8716  2788-1189', '2788-1146', ''),
(2170, 'Cedula Fisica', 900580050, 'GUTIERREZ CHAVARRIA DIOMEDES', 'La Cuesta Bº Las Torres  150m Norte', '50m Oeste.', '2780-0208', ''),
(2171, 'Cedula Fisica', 431941357, 'GUTIERREZ CUEVA EULALIO', '', '', '', ''),
(2172, 'Cedula Fisica', 601450761, 'GUTIERREZ CUEVAS EDGAR', 'CAÑAZA DE LA CUESTA DE LA ARROCERA', '200 MTS MANO DERECHA.', '7321349', ''),
(2173, 'Cedula Fisica', 601450761, 'GUTIERREZ CUEVAS EDGAR', 'CAÑAZA DE LA CUESTA DE LA ARROCERA', '200 MTS MANO DERECHA.', '7321349', ''),
(2174, 'Cedula Fisica', 601550302, 'GUTIERREZ ESPINOZA Mª AIDEE', 'PUEBLO CIVIL FTE IGLES METODISTA O', 'O BAJO HOTEL GOLF. <P> 03 C/M', '7751486', ''),
(2175, 'Cedula Fisica', 601550302, 'GUTIERREZ ESPINOZA Mª AIDEE', 'PUEBLO CIVIL FTE IGLES METODISTA O', 'O BAJO HOTEL GOLF. <P> 03 C/M', '7751486', ''),
(2176, 'Cedula Fisica', 601990870, 'GUTIERREZ ESQUIVEL JENNY', 'C Neily Municipalidad de Corredores', 'Cel 8897-1747.', '8671-7935', ''),
(2177, 'Cedula Fisica', 600700688, 'GUTIERREZ GALARZA MIGUEL', 'RIO CLARO  BOTIQUIN RIO CLARO', 'PAGA EL 27 DE C/M.', '759081', ''),
(2178, 'Cedula Fisica', 800570708, 'GUTIERREZ GARCIA LUCIA', 'GOLFITO  Bº BELLA VISTA CASA# 45-66', 'CALLE A ANTIG PIC-NIC DESP PUENTE', '775', ''),
(2179, 'Cedula Fisica', 601840673, 'GUTIERREZ GONZALEZ OLIVA', 'San Vito 200 de bar Monte Gloria la', 'Gutierrez Brawn  8520-9630', '', ''),
(2180, 'Cedula Fisica', 103560055, 'GUTIERREZ GRANADOS PEDRO EQUILCE', 'Sabalito  Bº INVU antig colegio 190', 'm oeste cs color papaya. 8672-0385.', '2784-0340', ''),
(2181, 'Cedula Fisica', 201740160, 'GUTIERREZ GUTIERREZ ELIECER.', 'FCA ALJUELA ULTIMA CASA CALLE A PTO', 'JIMENEZ.P-19 C/M.', '', ''),
(2182, 'Cedula Fisica', 501790073, 'GUTIERREZ GUTIERREZ MARIA', 'CIUDAD NEILY LA FORTUNA LOS LOTES', '1er CASA', '', ''),
(2183, 'Cedula Fisica', 901030127, 'GUTIERREZ GUTIERREZ MARIBEL', 'Pto Jiménez El Bambú entrada taller', 'Ronald 100 m y 50 norte.', '8348-7856', ''),
(2184, 'Cedula Fisica', 500470727, 'GUTIERREZ GUTIERREZ MAXIMINA', 'EL CARMEN DE ABROJO FRTE A FERRETER', '75 MTS ESTE CASA Nº 55 M.IZQUIERDA', '', ''),
(2185, 'Cedula Fisica', 500470727, 'GUTIERREZ GUTIERREZ MAXIMINA', 'EL CARMEN DE ABROJO FRTE A FERRETER', '75 MTS ESTE CASA Nº 55 M.IZQUIERDA', '', ''),
(2186, 'Cedula Fisica', 600750024, 'GUTIERREZ GUTIERREZ MIGUEL', 'Ciudad Neily', '', '', ''),
(2187, 'Cedula Fisica', 600750024, 'GUTIERREZ GUTIERREZ MIGUEL A (KOKY)', 'CIUDAD FTE PLANTAS DEL I.C.E.', 'PAGA 30 Y 15 C/MES.', '7835272', ''),
(2188, 'Cedula Fisica', 600750024, 'GUTIERREZ GUTIERREZ MIGUEL A (KOKY)', 'CIUDAD FTE PLANTAS DEL I.C.E.', 'PAGA 30 Y 15 C/MES.', '7835272', ''),
(2189, 'Cedula Fisica', 901060381, 'GUTIERREZ GUTIERREZ PEDRO', 'URBA LOS CERRITOS CASA *12', '', '8501-5253', ''),
(2190, 'Cedula Fisica', 159100110, 'GUTIERREZ MENDOZA IGNACIO', 'Laurel  Rio Incendio  contiguo a la', 'plaza.', '8552-4417', ''),
(2191, 'Cedula Fisica', 402910430, 'GUTIERREZ MIRANDA NORIS', 'P Canoas S Martin  200m Cruce.', 'Soda fte bomba tica.', '8693-3696', ''),
(2192, 'Cedula Fisica', 601230937, 'GUTIERREZ MONTENEGRO ANA HAZEL', 'COLONIA LA LUZ DEL MUNDO CASA', 'CONTIGUO A PANADERIA', '7899092', ''),
(2193, 'Cedula Fisica', 601230937, 'GUTIERREZ MONTENEGRO ANA HEZEL', 'RIO CLARO LA LUZ DEL MUNDO O EN OFI', 'CINA DEL MINAE TEL: 7899292', '7898086', ''),
(2194, 'Cedula Fisica', 701160822, 'GUTIERREZ OBANDO JUVENAL', 'ABROJO CONTG A PULP KATERIN', '', '7833591', ''),
(2195, 'Cedula Fisica', 601780445, 'GUTIERREZ PALACIOS MANUEL', 'GOLFITO  Bº HONG KONG CONTIGUO AL', 'PUENTE PAGA 16 Y 03 C/M.', '', ''),
(2196, 'Cedula Fisica', 502880607, 'GUTIERREZ PEREZ VICTOR MANUEL', 'EL CARMEN DE ABROJO FTE FERRETERIA', '75 MTS ESTE CASA Nº 55 M.IZQUIERDA', '2783-6042', ''),
(2197, 'Cedula Fisica', 601890413, 'GUTIERREZ QUESADA RODIETH', 'JIMENEZ URB EL COLEGIO CASA 9-B', '', '8246875', ''),
(2198, 'Cedula Fisica', 601890413, 'GUTIERREZ QUESADA RODIETH', 'Pto Jiménez  Urb Colegio casa 9-B', '', '8246-6875', ''),
(2199, 'Cedula Fisica', 601890413, 'GUTIERREZ QUESADA RODIETH', 'PTO JIMENEZ URBA EL COLEGIO CS *9 P', '88246875', '2735-5548', ''),
(2200, 'Cedula Fisica', 603010253, 'GUTIERREZ QUIROS GUSTAVO', 'Ciudad Neily  Taller Steven', 'Campo 2 y medio 100 N. de Escuela', '6247668', ''),
(2201, 'Cedula Fisica', 603110362, 'GUTIERREZ REYES CAROLINA', 'RIO CLARO Bº SANTIAGO DIAGONAL A LA', 'ESCUELA..', '', ''),
(2202, 'Cedula Fisica', 500370978, 'GUTIERREZ RODRIGUEZ BENIGNO', 'Bº SAN JORGE 150 NORTE DE LAGUARDIA', '?X ANITA XPULPERIA * 04 C/MES *', '7322138', ''),
(2203, 'Cedula Fisica', 501160977, 'GUTIERREZ RUIZ JUAN JOSE.', 'CUATRO BOCAS DE LA CUESTA DE LA ES-', 'CUELA LABRADOR 200 MTS E.C/MANO/IZQ', '', ''),
(2204, 'Cedula Fisica', 501160977, 'GUTIERREZ RUIZ JUAN JOSE.', 'CUATRO BOCAS DE LA CUESTA DE LA ES-', 'CUELA LABRADOR 200 MTS E.C/MANO/IZQ', '', ''),
(2205, 'Cedula Fisica', 601590987, 'GUTIERREZ SANTAMARIA MARIA', 'LA CUESTA CIUDADELA FERNANDO', 'ZUMBADO CASA D 10', '7352789', ''),
(2206, 'Cedula Fisica', 601590987, 'GUTIERREZ SANTAMARIA MARIA D CARMEN', 'CIUDADELA ZUMBADO CASA D-10 FRENTE', 'A PULPERIA MITRE', '7322789', ''),
(2207, 'Cedula Fisica', 600860394, 'GUTIERREZ TORRES Mª CECILIA', 'GOLF  Kmt 20 FRENT  PULP LA GUARIA', '<P> 02 C/M', '', ''),
(2208, 'Cedula Fisica', 601430569, 'GUTIERREZ TORUÑO ENRIQUE.', 'BARRIO ALAMEDAS CASA Nº21 GOLFITO.', '', '7750262', ''),
(2209, 'Cedula Fisica', 501180252, 'GUTIERREZ TORUÑO NERY', 'C Cortés  Pulp. Fte Jorón  Valle de', 'Diquis.', '2788-8754', ''),
(2210, 'Cedula Fisica', 601230993, 'GUTIRREZ ZUÑIGA RODOLFO', 'URBANIZACION EL COLEGIO PTO.JIMENEZ', 'CASA F6.SEGUNDA ENTRADA ALA DERECHA', '7355369', ''),
(2211, 'Cedula Fisica', 606360080, 'GUZMAN ANGULO KRISSIA', 'R Claro  fte Clinica Yireh.', 'Cobrar local 1. DLCG 8321-7514', '2789-7618', ''),
(2212, 'Cedula Fisica', 201980944, 'GUZMAN CORDOBA MANUEL', 'Golfito  Res Ureña. cs 13A. cont so', 'da las palmeras.', '2775-2694', ''),
(2213, 'Cedula Fisica', 201980944, 'GUZMAN CORDOBA MANUEL', 'Golfito  Res Ureña. cs 13A. cont so', 'da las palmeras.', '2775-2694', ''),
(2214, 'Cedula Fisica', 601750127, 'GUZMAN CRUZ LEDA', 'JOYERIA EL NICA RIO CLARO', '<P> 03 Y 16 C/M', '7897190', ''),
(2215, 'Cedula Fisica', 501570507, 'GUZMAN CRUZ MAYELA', 'Bº Santiago ft 5º de Silverio.', 'C. Neily Cabinas el Parque.', '7899492', ''),
(2216, 'Cedula Fisica', 600700829, 'GUZMAN DUARTE MARIA', '1KM DESPUES DE LA CAMPIÑA ENTRADITA', 'A L IZQUIERDA CASA COLOR VERDE', '8940-2827', ''),
(2217, 'Cedula Fisica', 501780332, 'GUZMAN GRUZ MIGUEL', 'rio claro carniceria contiguo bar l', 'os coquitos', '7899810', ''),
(2218, 'Cedula Fisica', 602360201, 'GUZMAN GUZMAN JEANNETTE', 'CUIDAD NEILY FRENTE AL HOTEL WILSON', '', '8754-5144', ''),
(2219, 'Cedula Fisica', 602200030, 'GUZMAN MORA CARMEN', 'conte 200mts al norte de la escuela', 'casa prefa color vino', '2776-8056', ''),
(2220, 'Cedula Fisica', 603230993, 'GUZMAN MORA JORGE', 'Comte  100m N 100m E de la escuela.', '', '2776-8256', ''),
(2221, 'Cedula Fisica', 603230993, 'GUZMAN MORA JORGE', 'Comte.', 'Cel 8427-1778.', '2776-8256', ''),
(2222, 'Cedula Fisica', 601650176, 'GUZMAN POLANCO JOSEFA', 'P Canoas  La Libertad 2º entrada MD', '100 m al fondo.', '8779-5410', ''),
(2223, 'Cedula Fisica', 900550492, 'GUZMAN TORRES SILVERIO', 'ESPERANZA R.CLARO CASA # 10', '<P> 03 C/M', '2789-9774', ''),
(2224, 'Cedula Fisica', 900550492, 'GUZMAN TORRES SILVERIO', 'ESPERANZA R.CLARO CASA # 10', 'DE G.A.R. 200 MTS M.IZQ 5ta CASA', '7899774', ''),
(2225, 'Cedula Fisica', 900550492, 'GUZMAN TORRRES SILVERIO.', 'Rio Claro  La Esperanza  casa No 10', '', '2789-9774', ''),
(2226, 'Cedula Fisica', 701900532, 'HAY ROJAS ELIDA', 'Rìo Claro frente a la Dos Pinos.', '', '', ''),
(2227, 'Cedula Fisica', 700190532, 'HAY ROJAS ELIDA MARIA.', 'RIO CLARO FRENTE A LA DOS PINOS.', 'PAGA MENSUAL', '*-*-*-*', ''),
(2228, 'Cedula Fisica', 500760802, 'HERNADEZ HERNANDEZ PAULINO', 'LA CAMPIÑA MEDIO KM AL ESTE DE LA', 'PLAZA DE DEPORTES CASA BLANCA', '2776-5009', ''),
(2229, 'Cedula Fisica', 600590006, 'HERNADEZ HERNANDEZ TOMASA', 'PTO JIMENEZ FTE. AL TALLER DE', 'RAFA CHACON * CANCELA 13 C/M **', '7355430', ''),
(2230, 'Cedula Fisica', 110590129, 'HERNADEZ MELENDEZ VIRGINIA', 'LA PALMA DE LA GUARDIA 1 KM ESTE', '** CANCELA 10 C/MES **', '', ''),
(2231, 'Cedula Fisica', 602050216, 'HERNANDES CERVANTEZ KATHYA', 'EN LOS DEPARTAMENTOS SOLANO CONTTIG', 'UO ALA FUNERARIA', '7325114', ''),
(2232, 'Cedula Fisica', 103710975, 'HERNANDEZ ARIAS GUILLERMO', 'BELLA LUZ DE LA VACA DEL PUENTE ENT', 'MANO IZQUIERDA 2da. CASA MANO DEREC', '', ''),
(2233, 'Cedula Fisica', 107120997, 'HERNANDEZ ARIAS HILDA', 'RIO CLARO FINCA 63 FILA 1 PEQUEÑA', '3RA CASA ** FECHA DE PAGO 10 C/MES*', '7897816', ''),
(2234, 'Cedula Fisica', 601530467, 'HERNANDEZ ATENCIO HILDA', 'Laurel  tamarindo en pulp  Kathia.', '8692-5276', '', ''),
(2235, 'Cedula Fisica', 601370430, 'HERNANDEZ ATENCIO JULIO CESAR', 'ROBLE FRENTE A LA ESCUELA ABASTECE-', 'DOR HANZEL.P-30 C/M', '775-', ''),
(2236, 'Cedula Fisica', 601370430, 'HERNANDEZ ATENCIO JULIO CESAR', 'Coto 52  a un costado de la plaza', 'de deportes.     P-28 C/M', '', ''),
(2237, 'Cedula Fisica', 601250051, 'HERNANDEZ BENAVIDEZ JUAN', 'Km 37; contiguo a Guardia Rural.', 'o en la  cantina de km 37.', '', ''),
(2238, 'Cedula Fisica', 601250051, 'HERNANDEZ BENAVIDEZ JUAN', 'Km 37; contiguo a Guardia Rural.', 'o en la  cantina de km 37.', '', ''),
(2239, 'Cedula Fisica', 104240466, 'HERNANDEZ BRIZUELA SOLEDAD', 'P Canoas S Jorge Fte a Chatarrera.', 'Cel 8767-8197.', '', ''),
(2240, 'Cedula Fisica', 602400559, 'HERNANDEZ CASTILLO DENICE', 'GOLF Mt 12 CONTG AL PUENTE 100 M  E', 'DEL RANCHO <P> 03 C/M', '775', ''),
(2241, 'Cedula Fisica', 602400559, 'HERNANDEZ CASTILLO DENNISE', 'GOLFITO  KMT 12 CONTG AL PUENTE', '100 MTS E DEL RANCHO P. 03 C/MES', '', ''),
(2242, 'Cedula Fisica', 601630381, 'HERNANDEZ CASTILLO RICARDO MANUEL', 'Coto 50  Costado Este plaza  casa', '107291.', '8759-2022', ''),
(2243, 'Cedula Fisica', 501180576, 'HERNANDEZ CASTILLO ROSA', 'KM 31 DE LA VAQUITA  CASA DETRAS DE', 'PULP. LA VAQUITA. <P> 30 C/M', '', ''),
(2244, 'Cedula Fisica', 501180576, 'HERNANDEZ CASTILLO ROSA', 'KM 31 DE LA VAQUITA CASA DETRAS DE', 'PULP LA VAQUITA <P> 30 C/M', '', ''),
(2245, 'Cedula Fisica', 201170725, 'HERNANDEZ CASTRO ADRIAN', 'CALLE A PALMAR VILLA COLON EL ALTO', 'DE SAN ANTONIO <P> 19 C/M', '', ''),
(2246, 'Cedula Fisica', 602050216, 'HERNANDEZ CERVANTES KATTIA', 'GOLFITO SODA RESTAURANT  DOMINO', 'INVU LA ROTONDA. <P> 03 C/M', '', ''),
(2247, 'Cedula Fisica', 104110190, 'HERNANDEZ CHAVES FLORY', '', '', '', ''),
(2248, 'Cedula Fisica', 900110516, 'HERNANDEZ CHAVES SERGIO', 'LANGOSTINO  150 METROS ESTE DE LA', 'PLAZA', '', ''),
(2249, 'Cedula Fisica', 501360656, 'HERNANDEZ CHAVEZ GERMAN', 'Golfito  la mona C.madrigal del', 'ranchito  50 Sur.', '8675-4545', ''),
(2250, 'Cedula Fisica', 603810282, 'HERNANDEZ CHAVEZ KATHERINE', 'Golfito  KM 5 detras luguna 2da Cas', 'dos plantas verde  8439-6184', '8616-3033', ''),
(2251, 'Cedula Fisica', 602050196, 'HERNANDEZ CORTES FLOR MARIA', 'COSTADO OESTE DE LA COMICION', 'NACIONAL DE EMERGENCIAS 4ª CASA', '7811113', ''),
(2252, 'Cedula Fisica', 602050196, 'HERNANDEZ CORTEZ FLOR MARIA', 'COTO 47 COMICION DE EMERGECIA AL LA', 'DO OESTE CASA 4', '7811113', ''),
(2253, 'Cedula Fisica', 602250340, 'HERNANDEZ CORTEZ MARIA DE LOS A.', 'CIUDAD NEILY 75 SUR CASA CELESTE', '', '7898723', ''),
(2254, 'Cedula Fisica', 602530420, 'HERNANDEZ DEL RIO GILBERTO', 'Kmt 1 4º FILA CASA #4493 GOLFITO', '<P> 16 C/M', '', ''),
(2255, 'Cedula Fisica', 602670771, 'HERNANDEZ DIAZ ARTURO', 'SIERPE  DE HOTEL OLEAJE SERENO', 'ENTRADA MANO DERECHA 4TA CASA.', '', ''),
(2256, 'Cedula Fisica', 602130846, 'HERNANDEZ DIAZ DIGNA', 'Rio Claro  100 mts sur del', 'Nacional o frente al Banco Nacional', '7899047', ''),
(2257, 'Cedula Fisica', 502620627, 'HERNANDEZ ESPINOZA MAINOR', 'SANTA LUCIA 100 M. NORTE  DE PULP.', 'EL PARQUESITO. CANCELA 15 C/MES', '', ''),
(2258, 'Cedula Fisica', 502620627, 'HERNANDEZ ESPINOZA MAYNOR', 'SANTA LUCIA DE LAUREL PULPERIA EL', 'PARQUESITO 100MTS CALLE ALA CAMPIÑA', '2780-0206', ''),
(2259, 'Cedula Fisica', 200080187, 'HERNANDEZ FLOR ALVARO', 'COTO 56 FRENTE A LA ESCUELA', '<P> 15 Y 30 C/M', '*-*-*-*', ''),
(2260, 'Cedula Fisica', 501381439, 'HERNANDEZ FLOR GERARDO', 'CARACOL ENTRADA FRENTE A LA', 'IGLESIA ASAMBLEAS DE DIOS', '', ''),
(2261, 'Cedula Fisica', 501381439, 'HERNANDEZ FLOR GERARDO', 'Caracol Entrada fte Iglesia Asamble', 'as de Dios ', '2780-6696', ''),
(2262, 'Cedula Fisica', 502350114, 'HERNANDEZ GONZALES LUCY', 'RIO CLARO BAMBEL 3 EN PULPERIA', 'FRANCIS * FECHA DE PAGO 2 C/MES *', '7897896', ''),
(2263, 'Cedula Fisica', 500410536, 'HERNANDEZ HERNANDEZ MIGUEL', 'Caracol de la Vaca fte a la Escuela', '', '2783-8153', ''),
(2264, 'Cedula Fisica', 500410536, 'HERNANDEZ HERNANDEZ MIGUEL', 'Caracol de la Vaca 250 Noroeste de', 'la Escuela ', '8510-1116', ''),
(2265, 'Cedula Fisica', 500520038, 'HERNANDEZ HERNANDEZ Mº ISABEL', 'Tinoco  camino a Paraiso 500m de la', 'Interamericana.', '2786-3314', ''),
(2266, 'Cedula Fisica', 500760802, 'HERNANDEZ HERNANDEZ PAULINO', 'LA CAMPIÑA POR LA ENTRADA DE', 'CONGREJO VERDE CASA DOS PISOS', '7834135', ''),
(2267, 'Cedula Fisica', 500450349, 'HERNANDEZ HERNANDEZ SALVADOR', 'RIO CLARO  150 MTS SUR DEL CORREO', 'CALLE AL COLEGIO.', '789', ''),
(2268, 'Cedula Fisica', 600590006, 'HERNANDEZ HERNANDEZ TOMASA', 'PUERTO JIMENEZ  FRENTE A TALLER DE', 'RAFA CHACON POR LA BOMBA', '7355430', ''),
(2269, 'Cedula Fisica', 602660235, 'HERNANDEZ JARA LUIS EDUARDO', 'P Jiménez Balsa 1 400m oeste Entrad', '', '8744-4880', ''),
(2270, 'Cedula Fisica', 230000051, 'HERNANDEZ LOBO VIVIANA', 'LA CUESTA FTE GIMNACIO CASA COLOR', 'PAPAYA DP.DEL PRIMER PUENTE', '7322667', ''),
(2271, 'Cedula Fisica', 203000051, 'HERNANDEZ LOBO VIVIANA', 'LA CUESTA FTE GIMNACIO CASA COLOR', 'PAPAYA  CNCELA 1 C/MES', '7322667', ''),
(2272, 'Cedula Fisica', 601190817, 'HERNANDEZ LOPEZ WILLIAM', 'CIUDAD NEILLY BANCO POPULAR', 'CTA DE BANCO POPULAR # 10-06363-4', '', ''),
(2273, 'Cedula Fisica', 601190817, 'HERNANDEZ LOPEZ WILLIAM', 'BANCO POPULAR CIUDAD NEILY.', '', '783', ''),
(2274, 'Cedula Fisica', 302930597, 'HERNANDEZ MASIS ADOLFO', '', '', '', ''),
(2275, 'Cedula Fisica', 501010926, 'HERNANDEZ MEDRANO AQUILES', 'COYOCHE Sta LUCIA DE IGLESIA', 'ASAMBLEAS DE DIOS 500 Mts S.<P>20', '', ''),
(2276, 'Cedula Fisica', 501010926, 'HERNANDEZ MEDRANO AQUILES', 'COYOCHE Sta LUCIA DE IGLESIA ASAMBL', 'DE DIOS 500 Mts SUR. <P> 18 C/M', '*-*-*-*', ''),
(2277, 'Cedula Fisica', 105580212, 'HERNANDEZ MENA MAYELA', 'CARACOL NORTE  200 M  NORTE', 'DE IGLESIA CATOLICA.', '', ''),
(2278, 'Cedula Fisica', 105580212, 'HERNANDEZ MENA MAYELA', 'Caracol de Río Claro', '', '', ''),
(2279, 'Cedula Fisica', 105580212, 'HERNANDEZ MENA MAYELA', 'CARACOL NORTE I.D.E.M.', '', '', ''),
(2280, 'Cedula Fisica', 105580212, 'HERNANDEZ MENA MAYELA', 'CARACOL NORTE 600 N.DEL PUENTE', '** FECHA DE PAGO 20 CADA MES **', '7836717', ''),
(2281, 'Cedula Fisica', 105580212, 'HERNANDEZ MENA MAYELA', 'CARACOL NORTE 600 N.DEL PUENTE', 'Cel 8663-9879.', '2783-6717', ''),
(2282, 'Cedula Fisica', 104330101, 'HERNANDEZ MENA ROSALIA', 'CARACOL NORTE 750 MTS DEL PUENTE.', '** FECHA DE PAGO 20 CADA MES **', '7836752', ''),
(2283, 'Cedula Fisica', 800580880, 'HERNANDEZ MENDOZA MIREYA', 'GOLF Bº PARROQUIAL CASA # 4515', '<P> 02 C/M', '', ''),
(2284, 'Cedula Fisica', 600680790, 'HERNANDEZ MOLINA ANTONIA.', 'RIO CLARO DE LA DELEGACION 100', 'MTS OESTE.P.2 C/M.', '7899239', ''),
(2285, 'Cedula Fisica', 201290732, 'HERNANDEZ MOLINA MARIA DEL SOCORRO', 'RIO CLARO B. SANTIAGO. SEGUNDA CASA', 'DESP. DEL PARQUESITO.', '7899279', ''),
(2286, 'Cedula Fisica', 501580161, 'HERNANDEZ MONTIEL EMILCE.', 'GOLFITO  Bº LLANO BONITO.', '', '', ''),
(2287, 'Cedula Fisica', 501580161, 'HERNANDEZ MONTIEL EMILCE.', 'GOLFITO  Bº LLANO BONITO.', '', '', ''),
(2288, 'Cedula Fisica', 501580161, 'HERNANDEZ MONTIEL EMILCE.', 'GOLFITO  Bº LLANO BONITO.', '', '', ''),
(2289, 'Cedula Fisica', 101168382, 'HERNANDEZ MORA JULIO CESAR', '200MTS AL OESTE DE LA ENTRADA COOPE', 'MANGLE CASA EN UN BAJO', '8942-1800', ''),
(2290, 'Cedula Fisica', 900410593, 'HERNANDEZ MORALES LUIS', 'PASO CANOAS CALLE A SAN JORGE ABAST', 'SAN LUIS CONTG FERRET.KARLA 30 C/ME', '', ''),
(2291, 'Cedula Fisica', 204290993, 'HERNANDEZ NUÑEZ MARLENE', 'C Neily  Bº El Invu  Detrás Escuela', 'Cabinas Ranger. Cel 8732-5237.', '2783-1348', ''),
(2292, 'Cedula Fisica', 601190071, 'HERNANDEZ OBANDO MARIA AURELIA', 'Sabalit Mellizas 100 M SE de igles', 'catolica  Cs amarilla  2773-4826', '8558-6254', ''),
(2293, 'Cedula Fisica', 501100517, 'HERNANDEZ PEREZ MARIA', 'SAN JORGE DE PASO CANOAS CASA FRENT', 'E A LA BLOQUERA', '2732-1472', ''),
(2294, 'Cedula Fisica', 501260477, 'HERNANDEZ PEREZ MARIA JOSEFA', 'Bº S. Jorge  costado sur de plaza', 'Diag. Pulp. Isabel p.30 c/m', '', ''),
(2295, 'Cedula Fisica', 501260477, 'HERNANDEZ PEREZ MARIA JOSEFA', 'Bº S. JORGE COSTADO SUR DE PLAZA', 'DIAG PULP ISABEL <P> 30 C/M', '', ''),
(2296, 'Cedula Fisica', 601080551, 'HERNANDEZ RUIZ SALVADOR.', 'RIO CLARO.', '', '', ''),
(2297, 'Cedula Fisica', 601080551, 'HERNANDEZ RUIZ SALVADOR.', 'RIO CLARO.', '', '', ''),
(2298, 'Cedula Fisica', 601080551, 'HERNANDEZ RUIZ SALVADOR.', 'RIO CLARO.', '', '', ''),
(2299, 'Cedula Fisica', 601270318, 'HERNANDEZ RUIZ TANIA', 'Golfito  Invu Km3  casa 126.', '', '2775-0617', ''),
(2300, 'Cedula Fisica', 202920371, 'HERNANDEZ SALAZAR FRANCIS', 'LA CUESTA LA PALMA CONTG.A PULP.', 'LA CHIRIPA. CANCELA 5 CADA MES', '2732-1577', ''),
(2301, 'Cedula Fisica', 108350485, 'HERNANDEZ SANARRUSIA YESICA', 'C Cortés  Carnicería JF  fte Parque', 'Cel 8701-5427.', '2786-7276', ''),
(2302, 'Cedula Fisica', 105470590, 'HERNANDEZ UMAÑA JOSE ANGEL', 'CIUDAD  NEILY. 75 MTS NORTE DEL', 'MERCADO O COMANDO C.N.', '*-*-*-*', ''),
(2303, 'Cedula Fisica', 602840678, 'HERNANDEZ VALLEJOS MARJORIE', 'Deposito Libre Local Nº9', 'Residencial Ureña casa C-8.', '7751926', ''),
(2304, 'Cedula Fisica', 601810575, 'HERNANDEZ VILLALOBOS ELIZABETH', 'laurel tamarindo un cost oeste de l', 'a plaza de deportes cel 8635 15 09', '2780-1157', ''),
(2305, 'Cedula Fisica', 600700701, 'HERNANDEZ ZAMORA CLARISA.', 'CIUDADELA MADRIGAL PRIMERA ENTRADA', 'DE LA INTERAMERICANA 100 N.C.NATURA', '', ''),
(2306, 'Cedula Fisica', 600740585, 'HERNANDEZ ZAMORA VICTOR MANUEL.', '', '', '', ''),
(2307, 'Cedula Fisica', 600740585, 'HERNANDEZ ZAMORA VICTOR MANUEL.', '', '', '', ''),
(2308, 'Cedula Fisica', 204580964, 'HERRA CORELLA MARINO', 'S vito 1Km O de la Y griega la isla', 'Bº Orotina  8602-3356', '8944-3586', ''),
(2309, 'Cedula Fisica', 604010971, 'HERRERA BEITA GREIVIN', 'Golfito  Km 20  Ciud. Brenes Durán', 'casa 45 color blanco.', '', ''),
(2310, 'Cedula Fisica', 603760814, 'HERRERA CABALCETA LUIS', 'C Cortés  Urb Pacheco  cs 53 verde.', '', '2786-4251', ''),
(2311, 'Cedula Fisica', 602820874, 'HERRERA CASTILLO MARIA LUZ', 'Sarapiquí Puerto Viejo 50 mts oeste', 'de la Clínica.', '', ''),
(2312, 'Cedula Fisica', 602280953, 'HERRERA CHAVES ELIAS', 'C Neily  Caracol Norte 50m Norte de', 'Frabrica de Block.', '8987-3845', ''),
(2313, 'Cedula Fisica', 501030443, 'HERRERA ELIZONDO EMILIA', 'Laurel Jobo  30m antes antigua pulp', 'Campesina.', '2780-0457', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(2314, 'Cedula Fisica', 602060382, 'HERRERA FERNANDEZ ARTURO', 'C Cortés Ojo d Agua carnicería Hnos', 'Herrera. cel 8515-7189.', '8659-1572', ''),
(2315, 'Cedula Fisica', 600940755, 'HERRERA GONZALEZ SANTOS', 'PASO CANOAS 400MTS. DE ESCUELA DE', 'PASO CANOAS CASA COLOR AMARILLA', '', ''),
(2316, 'Cedula Fisica', 700660384, 'HERRERA GUTIERREZ RUTH', 'Pto Jimenez  Por el Aeropuerto ', 'detras de Almacen la Esquina', '7355243', ''),
(2317, 'Cedula Fisica', 700660384, 'HERRERA GUTIERREZ RUTH', 'DEL CEMENTERIO 75MTS ESTE 3RA CASA', 'MANO IZQUIERDA', '2735-5243', ''),
(2318, 'Cedula Fisica', 111480610, 'HERRERA JARQUIN WENDY', 'JIMENEZ EL BANBU TALLER WIKO', '', '8572-8672', ''),
(2319, 'Cedula Fisica', 501010517, 'HERRERA JIMENEZ JUAN', 'B EL COLEGIO 175 SUR DEL COLEGIO CA', 'MINO A LA ESCUELA', '2732-1190', ''),
(2320, 'Cedula Fisica', 504010517, 'HERRERA JIMENEZ JUAN.', 'La Cuesta  100 mts sur del colegio', '<p> 30 c/m', '', ''),
(2321, 'Cedula Fisica', 201620014, 'HERRERA MURILLO CLARA', 'Ciudad Cortes  de bomba corcobado', '175 m. sur. telef 27888151', '8482459', ''),
(2322, 'Cedula Fisica', 202310864, 'HERRERA MURILLO IMELDA', 'Ciudad Neily  Bo el Estadio  frente', 'a la torre  c.c.celeste', '9168332', ''),
(2323, 'Cedula Fisica', 500840720, 'HERRERA PEREZ HEDMAN', 'golfito  urb ureña casa 4-j', '', '', ''),
(2324, 'Cedula Fisica', 500840720, 'HERRERA PEREZ HEDMAN', 'GOLFITO  URB UREÑA CASA 4-J', '', '7751408', ''),
(2325, 'Cedula Fisica', 500840720, 'HERRERA PEREZ HEDMAN', 'Golfito  urb ureña casa 4-j', '** CANCELA 3 CADA MES **', '7751408', ''),
(2326, 'Cedula Fisica', 500840720, 'HERRERA PEREZ HEDMAN', 'Golfito  Res Ureña   casa 54.', 'Cel 8850-1578.', '2775-1408', ''),
(2327, 'Cedula Fisica', 602070358, 'HERRERA PORRAS RUDY', 'P Jiménez  Guadalpe  150m norte tel', 'p163', '8649-712', ''),
(2328, 'Cedula Fisica', 603200173, 'HERRERA ROSALES LIZETH', 'Golfito  Res Ureña  casa Nº12', '', '2775-1283', ''),
(2329, 'Cedula Fisica', 202330283, 'HERRERA SALAZAR EDGAR', 'C. CORTES OJO DAGUA 25 ESTE DE LA', 'ESCUELA . CANCELA 8C/MES', '7888707', ''),
(2330, 'Cedula Fisica', 502550394, 'HERRERA SILVA YISEL', 'P Jiménez  El Bambú  250m 100 Norte', 'Pulp. La Amistad.', '8658-1052', ''),
(2331, 'Cedula Fisica', 501610102, 'HERRERA SOLIS CARLOS LUIS', 'Palmar Norte Caña Blancal  Pulp. He', 'rrera  contiguo puente. Cel 8884-42', '8884-4202', ''),
(2332, 'Cedula Fisica', 501020257, 'HERRERA VARGAS FRANCISCO', 'S. RAMON DE R.CLARO PULP. EL CORRAL', 'ULT. PULP. <P> 03 C/M', '789-', ''),
(2333, 'Cedula Fisica', 501020257, 'HERRERA VARGAS FRANCISCO', 'S. RAMON DE R.CLARO PULP. EL CORRAL', 'ULT. PULP. <P> 03 C/M', '789-', ''),
(2334, 'Cedula Fisica', 602760410, 'HERRERA VILLARREAL ANA YANCY', 'Golfito S Andrés IMAS  cs Nº24.', '', '2775-0624', ''),
(2335, 'Cedula Fisica', 102630048, 'HIDALGO ARIAS ANTONIO', 'Bambel 3  Antiguas trillizas  500 m', 'Oeste  MI.', '', ''),
(2336, 'Cedula Fisica', 601730648, 'HIDALGO CESPEDES JOSE ( CHEPE )', 'RIO CLARO 300 Mts NORTE DEL C.N.P', '<P> PAGA EN OFICINA', '789', ''),
(2337, 'Cedula Fisica', 601730648, 'HIDALGO CESPEDES JOSE ( CHEPE )', 'RIO CLARO 500 Mts NORTE DEL RESTAUR', 'IMPALA.', '7899378', ''),
(2338, 'Cedula Fisica', 603200800, 'HIDALGO CESPEDEZ CARLOS', 'R Claro Bambel 3  600 este ant pulp', 'las trillizas.', '', ''),
(2339, 'Cedula Fisica', 602150178, 'HIDALGO CESPEDEZ WALTER', 'R Claro Bambel 3  Ant. Pulp Trilli-', 'zas 600 mts. Cel 8658-4095.', '2789-7224', ''),
(2340, 'Cedula Fisica', 602670555, 'HIDALGO GOMEZ ERICK', 'BAMBEL DE RIO CLARO 500 MTS. OESTE', 'ANTIGUAS TRILLIZAS.', '', ''),
(2341, 'Cedula Fisica', 601170237, 'HIDALGO LOPEZ VERA VIOLETA', '', '', '', ''),
(2342, 'Cedula Fisica', 601170237, 'HIDALGO LOPEZ VERA VIOLETA', 'KM 1 GOLFITO FRENTE A LA ESCUELA', '<P> 16 C/M', '7751342', ''),
(2343, 'Cedula Fisica', 602220129, 'HIDALGO MADRIGAL HEYLIN', 'PTO. JIMENES FCA. MIRAMAR', 'CALLE A TAMALES', '7355053', ''),
(2344, 'Cedula Fisica', 602201291, 'HIDALGO MADRIGAL HEYLIN', 'PTO. JIMENES FCA. MIRAMAR', 'CALLE A TAMALES', '7355053', ''),
(2345, 'Cedula Fisica', 600830541, 'HIDALGO MADRIGAL M. LUISA', 'GOLFITO  LA ROTONDA TERCER CASA', 'M.DERECHA P <03> CADA MES', '', ''),
(2346, 'Cedula Fisica', 600830541, 'HIDALGO MADRIGAL M. LUISA', 'GOLFITO  LA ROTONDA TERCER CASA', 'M.DERECHA CASA NUMERO 20', '7751114', ''),
(2347, 'Cedula Fisica', 600830541, 'HIDALGO MADRIGAL MARIA LUISA', 'Golfito  La Rotonda Casa Nº 20', 'Entrada del Casa Amarillo', '7751114', ''),
(2348, 'Cedula Fisica', 601270169, 'HIDALGO MADRIGAL MARLENE', 'PTO JIMENEZ CONTG AL ANGAR', 'ALFA ROMEO', '7355356', ''),
(2349, 'Cedula Fisica', 103270761, 'HIDALGO PADILLA FILIBERTO', 'Kmt 16 Pulp LA FLOR <P> 16 c/m', '......', '', ''),
(2350, 'Cedula Fisica', 106870476, 'HIDALGO SALAZAR MARISEL', 'ABROJO EL CARMEN  CASA 167', '', '7833399', ''),
(2351, 'Cedula Fisica', 601490145, 'HIDALGO VIDAURRE CECILIA', 'La Cuesta  Adulto Mayor  1 km casa', 'color melón.', '2732-3214', ''),
(2352, 'Cedula Fisica', 602440942, 'HURTADO ARIAS ANA LORENA', 'Bº EL CARMEN DEL CRUZE EL MANU', '300M A LA IZQ. 21 C/MES..', '', ''),
(2353, 'Cedula Fisica', 202430403, 'HURTADO CORDOBA ISABEL', 'RESIDENCIAL UREÑA C. # K8 FRENTE AL', 'TELF PúBLICO <P> 03 C/M', '7751608', ''),
(2354, 'Cedula Fisica', 600670692, 'HURTADO ORELLANA EMILIO', 'RIO CLARO  FRTE ESCUELA LA ESPERANZ', 'EN BAMBEL 1 DE LA PULP 300 MTS OEST', '', ''),
(2355, 'Cedula Fisica', 600870717, 'HURTADO ORELLANA PEDRO', 'RIO CLARO FTE SALON COMUNAL ROSADA', 'ROPA AMERICA ** FECHA PAGO 02 C/M**', '7899856', ''),
(2356, 'Cedula Fisica', 600870717, 'HURTADO ORELLANA PEDRO', 'R Claro  Centro  Lavacar de Minor.', '', '8876-4826', ''),
(2357, 'Cedula Fisica', 600670692, 'HURTADO OREYANA EMILIO', 'BANBEL No.1 1.4 KMTS. O. DE LA', 'PULP. 300 MTS. C/COLOR BLANCO', '7898137', ''),
(2358, 'Cedula Fisica', 310119457, 'I.S.E.P.A.', 'CIUDAD NEILY COSTADO NORTE DEL', 'PARQUE <P> 30 C/M', '*-*-*-*', ''),
(2359, 'Cedula Fisica', 800390531, 'IBARRA JIMENEZ LORENZO.', 'PALMAR SUR.', '', '', ''),
(2360, 'Cedula Fisica', 500920739, 'IGLESIA METODISTA.', 'CIUDAD NEILY  Bº LA CARTONERA.', 'FRET AL REDONDEL O CONTG A TROPIGAS', '753206', ''),
(2361, 'Cedula Fisica', 602020999, 'JAEN CASTILLO MARTHA', '', '', '', ''),
(2362, 'Cedula Fisica', 602020999, 'JAEN CASTILLO MARTHA', 'CIUDADELA MADRIGAL DIAGONAL A PULP', 'DE RIGO PANZON O EN RANCHO LA MONA.', '7750357', ''),
(2363, 'Cedula Fisica', 601810537, 'JAEN CASTILLO PEDRO DAMIAN', 'GOLFITO LA PURRUJA 1 KMT Y MEDIO', 'DE LA ENTRADA', '', ''),
(2364, 'Cedula Fisica', 602320590, 'JAEN CASTILLO VICTORIA', 'R Claro  Bambel 1  Granja Campesina', 'lote 12.', '2789-7003', ''),
(2365, 'Cedula Fisica', 501200597, 'JAEN GOMEZ JUAN MARIA', 'RIO CLARO 125NT DE LA ESCUELA', '0', '', ''),
(2366, 'Cedula Fisica', 601400586, 'JAEN GOMEZ NORMA', 'km 31 800 m de la interamericana', 'calle a la unión.', '8764-9305', ''),
(2367, 'Cedula Fisica', 601770214, 'JAEN GUTIERREZ DEYANIRA', 'LAUREL  I.N.V.U. CASA 257 DE SALA', 'DE BELLEZA GEMINIS 50 N.', '7800315', ''),
(2368, 'Cedula Fisica', 601770214, 'JAEN GUTIERREZ DEYANIRA', 'Laurel  INVU  cs 257 cc blanca.', '', '2780-0315', ''),
(2369, 'Cedula Fisica', 601770214, 'JAEN GUTIERREZ DEYANIRA', 'Laurel  INVU  cs 257 cc blanca.', '', '2780-0315', ''),
(2370, 'Cedula Fisica', 503160628, 'JAEN JAEN LUIS', 'TAMRINDO 2da CASA ANTES DE LLEGAR', 'A CAUCHO', '', ''),
(2371, 'Cedula Fisica', 800560635, 'JAEN JAEN MARINA', 'cuervito de pavones despues de', 'la escuela c. madera c.natural', '', ''),
(2372, 'Cedula Fisica', 602370139, 'JAEN MEDRANO DENIS', 'Laurel  Tamarindo  100 m calle a', 'Caucho.', '2780-0587', ''),
(2373, 'Cedula Fisica', 501760940, 'JAEN RODRIGUEZ JOSEFA JACINTA', 'Laurel Comte 300m Pulp Diamante  de', 'trás Iglesia Evangélica.', '8645-1699', ''),
(2374, 'Cedula Fisica', 800470592, 'JAIME LOPEZ MATILDE.', 'GOLFITO  KM UNO CONTG A SALA DE', 'BELLEZA NOHELIA.-ELIAS-.', '775', ''),
(2375, 'Cedula Fisica', 105000126, 'JAIMEZ DAVILA TERESA', 'UVITA CENTRO ENTRADA PRINCIPAL AL', 'PARQUE  REST. LOS ALMENDROS', '8510-4957', ''),
(2376, 'Cedula Fisica', 601270216, 'JARA MATAMOROS CARLOS ALBERTO', 'LA GUARIA KM 43 PULP LA NUEVA', 'FELICIDAD <P> 10 C/M', '775', ''),
(2377, 'Cedula Fisica', 601850761, 'JARA MONTENEGRO JANETH', 'PTO. JIMENES  SANDALO 50MTS AL', 'S.E. DE PLAZA  CASA COLOR CELESTE.', '', ''),
(2378, 'Cedula Fisica', 601850761, 'JARA MONTENEGRO JANETH', 'PTO JIMENEZ SANDALO 50M SUR DE LA P', 'LAZA  CASA CELESTE *** CANC. 11 ***', '', ''),
(2379, 'Cedula Fisica', 601850761, 'JARA MONTENEGRO JEANNETHE', 'SANDALO DE JIMENEZ 150 SUR OESTE', 'DE LA PLAZA FTE A BAZAR.', '8454598', ''),
(2380, 'Cedula Fisica', 602670267, 'JARA RODRIGUEZ NORMAN', 'Palmar Sur Fca 5  150m detrás Escue', 'la.', '8349-1631', ''),
(2381, 'Cedula Fisica', 601390675, 'JARA ROJAS JOSE FRANCISCO', 'Palmar 700 O Antig Pulp Puerta del', 'Sol. Central Campesina. 8615-1983.', '2781-1338', ''),
(2382, 'Cedula Fisica', 601030151, 'JARA SOSA DELSA', 'Chacarita 1 Km de la bomba calle a', 'jimenez Cs Celeste y amarillo ', '2741-1128', ''),
(2383, 'Cedula Fisica', 601030151, 'JARA SOSA DELSA', 'chacarita de la bomba 1200 calle a', 'Puerto jimenez.Cs Celeste con Amari', '2741-1128', ''),
(2384, 'Cedula Fisica', 601440809, 'JARQUIN GARCIA CARLOS JOSE', 'Pto Escondido  200 este y 200 norte', 'Escuela. Cel 8617-0974', '2735-1651', ''),
(2385, 'Cedula Fisica', 602450914, 'JARQUIN GARCIA JOSE FRANCISCO', 'PTO JIMNEZ LA PALMA EN ALMACEN. O', 'PTO ESCONDIDO X IGLESIA 11 C/MES', '', ''),
(2386, 'Cedula Fisica', 107290864, 'JIMENEZ ACUÑA NOEMI', 'P Jiménez  La Palma  Carnicería la', 'Amistad. Cel 8545-6186. 8650-7925.', '2735-1170', ''),
(2387, 'Cedula Fisica', 102910336, 'JIMENEZ AGUERO ALBERTINA', 'GOLFITO KM 3 DEL BILLAR 75 M OESTE', '(HOSPITAL) <p> BISEMANAL', '7751396', ''),
(2388, 'Cedula Fisica', 102930541, 'JIMENEZ AGUILAR BIENVEIDO', 'EL JARDIN DE CONTE 1 KM NORTE', 'DE LA ESCUELA', '7801704', ''),
(2389, 'Cedula Fisica', 102930541, 'JIMENEZ AGUILAR BIENVENIDO', 'Jardín de Coto  1 km norte de la Es', 'cuela.', '', ''),
(2390, 'Cedula Fisica', 102930541, 'JIMENEZ AGUILAR BIENVENIDO', 'EL JARDIN DE CONTE 1 KN NORTE', 'DE LA ESCUELA. **', '7801704', ''),
(2391, 'Cedula Fisica', 104250574, 'JIMENEZ AGUILAR CARLOS LUIS', 'LA GUARIA FTE A LA PLAZA CASA COLOR', 'AMARILLA ** CANCELA 8 C/MES **', '8881192', ''),
(2392, 'Cedula Fisica', 104930838, 'JIMENEZ AGUILAR IVO', 'LA GUARIA DE PIEDRAS BLANCAS', '** CANCELA PAGO DE PALMEROS **', '3322951', ''),
(2393, 'Cedula Fisica', 106120275, 'JIMENEZ AGUILAR SILVIO', '', '', '', ''),
(2394, 'Cedula Fisica', 602260161, 'JIMENEZ ARAYA OMAR', '500MTS DESPUES DEK BAR RODEO CAMINO', 'A GOLFITO', '8645-6906', ''),
(2395, 'Cedula Fisica', 104220998, 'JIMENEZ ARGUEDAS JOSE LUIS', 'GOLFITO KM 20 DE LA ESCUELA 800 SUR', 'P. 27 C/M', '', ''),
(2396, 'Cedula Fisica', 104220998, 'JIMENEZ ARGUEDAS JOSE LUIS', 'Golfito  Km20.', '', '2789-8168', ''),
(2397, 'Cedula Fisica', 107140351, 'JIMENEZ ARIAS ANGEL', 'pto jimenez boca gallardo 150 mts', 'norte de pulperia turekita', '', ''),
(2398, 'Cedula Fisica', 901050437, 'JIMENEZ ARIAS BELLANIRA', 'LA CAMPIÑA POR LA FABRICA DE', 'MUEBLE HIJA DE FERNANDO EL ARROCERO', '3605208', ''),
(2399, 'Cedula Fisica', 901050437, 'JIMENEZ ARIAS BELLANIRA', 'LA CAMPIÑA 1500 MTS CARRETERA A LAS', 'TRENSAS ENTRADA MANO DERECHA', '8656-4814', ''),
(2400, 'Cedula Fisica', 601950391, 'JIMENEZ ARIAS CARLOS LUIS', 'el cruce del barrido 100 mts antes', 'del puente d pueblo nuevo', '3020890', ''),
(2401, 'Cedula Fisica', 601950391, 'JIMENEZ ARIAS CARLOS LUIS', 'CRUCE DE BARRIDO 100 MTS ANTES DEL', 'PUENTE D` PUEBLO NUEVO <P>20 C/M', '*-*-*-*', ''),
(2402, 'Cedula Fisica', 600650790, 'JIMENEZ ARIAS CARMEN', 'Golfito Bº Cruz Roja cs 13.', 'Cel 8617-8666.', '2775-0872', ''),
(2403, 'Cedula Fisica', 601220382, 'JIMENEZ ARIAS MARINA.', 'L`CUESTA CIUDADELA IMAS CHINAMO SOL', 'Y SOMBRA CANOAS <P> 30 C/M', '732', ''),
(2404, 'Cedula Fisica', 904200020, 'JIMENEZ BADILLA JOSE ANIBAL', 'Cariari  La Cuesta; 1000 m Sur de', 'la escuela', '', ''),
(2405, 'Cedula Fisica', 503130641, 'JIMENEZ BALTODANO JOSE MIGUEL', 'Coto 54  Casa 10970', '', '8898-3364', ''),
(2406, 'Cedula Fisica', 601240649, 'JIMENEZ BARROSO EDGAR', 'Golfito  Km 16  250m entrada de pa-', 'vimento MD. Ebanistería.', '8669-1308', ''),
(2407, 'Cedula Fisica', 601130150, 'JIMENEZ BARROSO HAYDEE', 'LA PALMA SODA LAS DELICIAS DEL MAR', 'A P. BLANCA. * CANCELA 10 C/MES *', '2735-1103', ''),
(2408, 'Cedula Fisica', 601130750, 'JIMENEZ BARROSO HAYDEE', 'P Jiménez La Palma Soda delicias', 'del mar.', '2735-1103', ''),
(2409, 'Cedula Fisica', 502410103, 'JIMENEZ BOGANTES REYES FRANCISCO', 'Taller de la Bomba; Hnos Jiménez.', '', '', ''),
(2410, 'Cedula Fisica', 502410103, 'JIMENEZ BOGANTES REYES FRANCISCO', 'EL BAMBU TALLER AUTOTOMOTRIZ JIMENE', 'Z', '8701-8171', ''),
(2411, 'Cedula Fisica', 900890466, 'JIMENEZ BONILLA AGUSTIN G.', 'CORONADO DE OSA FTE. ALA ESCUELA', 'CANCELA 8 C/MES', '7865292', ''),
(2412, 'Cedula Fisica', 601550264, 'JIMENEZ CABEZAS ALEXANDER', 'GOLFITO PUEBLO CIVIL CARNICERIA', 'PUERTO LIBRE P. 27 Y 14 C/M.', '750755', ''),
(2413, 'Cedula Fisica', 601550264, 'JIMENEZ CABEZAS ALEXANDER', 'GOLFITO PUEBLO CIVIL CARNICERIA', 'Pto LIBRE: <p> 27 Y 14 C/M', '', ''),
(2414, 'Cedula Fisica', 900420219, 'JIMENEZ CADRANO DIMAS LORENZO', 'Laurel  R Incendio  800m Oeste Escu', 'ela.', '8695-3317', ''),
(2415, 'Cedula Fisica', 601150782, 'JIMENEZ CALDERON DANIEL.', 'RIO CLARO  TALLER GUAYCARA FTE CENT', 'TELEFONICA I.C.E. P. 16 DE C/MES.', '759145', ''),
(2416, 'Cedula Fisica', 601470342, 'JIMENEZ CANALES GILBERTH', 'Golfito Bº Vista cll Picnic ft Abas', 'Susan. Trab Hosp Golfito 8910-7560.', '2775-0996', ''),
(2417, 'Cedula Fisica', 603650465, 'JIMENEZ CARRALES KATERIN', 'Copa Buena  200 N de CENCINAE  8942', '-8535', '', ''),
(2418, 'Cedula Fisica', 600700329, 'JIMENEZ CASTRO GELBER.', 'PALMAR NORTE  100 METROS OESTE DEL', 'CEMENTERIO EN ABASTECEDOR NURY.', '756103', ''),
(2419, 'Cedula Fisica', 602900568, 'JIMENEZ CASTRO GUISELLE', 'P Canoas  Veracruz  Abastecedor Ve-', 'racruz.', '8803-6843', ''),
(2420, 'Cedula Fisica', 203280265, 'JIMENEZ CASTRO MARCOS', 'P Norte  250m noroeste servicentro', 'casa del arbol.', '8793-2161', ''),
(2421, 'Cedula Fisica', 205670543, 'JIMENEZ CASTRO PATRICIA', 'La Palma  Guadalupe  Esquina de la', 'plaza.', '2735-1551', ''),
(2422, 'Cedula Fisica', 205670543, 'JIMENEZ CASTRO PATRICIA', 'La Palma  Guadalupe  Esquina de la', 'plaza.', '2735-1551', ''),
(2423, 'Cedula Fisica', 900520122, 'JIMENEZ CASTRO YENNI', 'PALMAR NORTE  DE ASAMBLEAS DE DIOS', '50 E ABASTEC FIGURIN P. 06 C/MES.', '786', ''),
(2424, 'Cedula Fisica', 103170648, 'JIMENEZ CHAVES MARIA ANGELA', 'Cariari de la Cuesta 200 E Escuela.', '', '', ''),
(2425, 'Cedula Fisica', 103170648, 'JIMENEZ CHAVES MARIA ANGELA', 'Laurel  Cariari 200 N de Escuela.', 'Cel 8606-1048.', '2780-0413', ''),
(2426, 'Cedula Fisica', 103170648, 'JIMENEZ CHAVES MARIA ANGELA.', 'CARIARI DE LA CUESTA  200 M.E. DE', 'LA ESCUELA ENTRADA A MANO DERECHA.', '', ''),
(2427, 'Cedula Fisica', 103170648, 'JIMENEZ CHAVES MARIA ANGELA.', 'CARIARI DE LA CUESTA  200 M.E. DE', 'LA ESCUELA ENTRADA A MANO DERECHA.', '7800413', ''),
(2428, 'Cedula Fisica', 103170648, 'JIMENEZ CHAVES MARIA ANGELA.', 'CARIARI DE LA CUESTA  200 M.E. DE', 'LA ESCUELA ENTRADA A MANO DERECHA.', '7800413', ''),
(2429, 'Cedula Fisica', 501421464, 'JIMENEZ CORRALES MARIO', 'PLAZA CANOAS CIUDADELA EL TRIUNFO', 'BLOK E CASA # 10 <P> 25 C/M', '', ''),
(2430, 'Cedula Fisica', 501421464, 'JIMENEZ CORRALES MARIO', 'PLAZA CANOAS CIUDADELA EL TRIUNFO', 'BLOK E CASA # 10 <P> 25 C/M', '', ''),
(2431, 'Cedula Fisica', 501340836, 'JIMENEZ CORRALES MAYELA', 'CIUD EL TRIUNFO MAESTRA casa G-17.', 'Telf: 2732-1781.', '2732-2274', ''),
(2432, 'Cedula Fisica', 500580241, 'JIMENEZ DELGADO ALICIA', '', '', '', ''),
(2433, 'Cedula Fisica', 601470781, 'JIMENEZ ELIZONDO ODILIE', 'Naranjo  Fte al Colegio Soda Lilly.', '', '2780-0093', ''),
(2434, 'Cedula Fisica', 900430150, 'JIMENEZ ELIZONDO ZENEIDA', 'Golfito  Km 23 Entrada desp puent', 'M/I sexta Cs madera. 8629-6401', '', ''),
(2435, 'Cedula Fisica', 500830315, 'JIMENEZ ESQUIVEL AIDEE', 'RIO CLARO   DE GAR. 50 MTS SUR', 'CASA ROSADA PAGA 14 Y 27 C/MES', '', ''),
(2436, 'Cedula Fisica', 601480777, 'JIMENEZ FONSECA ZELMIRA', 'URBA* LOS CERRITOS CASA *12', 'HIJA: 8607 6633', '8804-6085', ''),
(2437, 'Cedula Fisica', 602820721, 'JIMENEZ GARCIA JOSE', 'Pavones  Rio Claro  400m Iglesia', 'Oasis de Amor. Cel 8937-6396.', '2776-2133', ''),
(2438, 'Cedula Fisica', 502380763, 'JIMENEZ GARCIA MARIA LUISA', 'Pavones Rio Claro 300m sur Iglesia', 'Oasis de Amor.', '', ''),
(2439, 'Cedula Fisica', 103290252, 'JIMENEZ GARCIA SERGIO', 'Drake  de cabinas manolo 50 M antes', 'Cs celese con escalera  8859-0558', '6027-7248', ''),
(2440, 'Cedula Fisica', 202350737, 'JIMENEZ GOMEZ ARTURO', 'LAUREL CORREDORES FINAS TAMARINDO F', 'XC ALA ESCUELA CASA 2 PLANTAS VERDE', '8616-9335', ''),
(2441, 'Cedula Fisica', 501100641, 'JIMENEZ GOMEZ JOSE PEDRO', 'DRAKE 300 M DE IGLECIA BAUTISTA', '** CANCELA 10 C/MES  **', '', ''),
(2442, 'Cedula Fisica', 500920045, 'JIMENEZ GOMEZ MARCOS', 'PUNTA BANCO PAVONES FRNTE A', 'LA PLAZA A LA PAR DE LA PULP', '', ''),
(2443, 'Cedula Fisica', 600850261, 'JIMENEZ GOMEZ NATIVIDAD', 'LA ESPERANZA DE GOLFITO FRTE A LA', 'PLAZA', '', ''),
(2444, 'Cedula Fisica', 501150530, 'JIMENEZ GOMEZ WENCESLAO', 'RIO CLARO DE PAVONES 300 MTS AL SUR', 'DE IGLESIA OASIS DE AMOR', '2776-5043', ''),
(2445, 'Cedula Fisica', 101112178, 'JIMENEZ GONZALEZ JUANA ISABEL', 'Bº EL LLAMARON JARDIN CERVECERO', '400 METROS SUR', '', ''),
(2446, 'Cedula Fisica', 101112178, 'JIMENEZ GONZALEZ JUANA ISABEL', 'Bº EL LLAMARON JARDIN CERVECERO', '400 METROS SUR', '', ''),
(2447, 'Cedula Fisica', 602000336, 'JIMENEZ GONZALEZ JUANA ISABEL', 'CORTES CIUDADELA CANADA CASA 3', '', '7888586', ''),
(2448, 'Cedula Fisica', 202780552, 'JIMENEZ GONZALEZ LUZ MIRIAM', 'Bº EL IMAS CASA 24 O DE DELEGACION', '175M NORTE. CIUDAD CORTES 8 C/MES', '', ''),
(2449, 'Cedula Fisica', 201910816, 'JIMENEZ GONZALEZ MATILDE', 'CIUDAD CORTES EL PRECARIO CASA', 'ESQ. C.C.BLANC. TRABAJA EN HOSPITAL', '7888233', ''),
(2450, 'Cedula Fisica', 201910816, 'JIMENEZ GONZALEZ MATILDE', 'CIUDAD CORTES EL PRECARIO CASA', 'ESQ. C.C.BLANC. TRABAJA EN HOSPITAL', '7888247', ''),
(2451, 'Cedula Fisica', 603180644, 'JIMENEZ GRANADOS MARIA', 'Bambel 3  Minisuper Anabel 300 N ca', 'sa Amarilla.', '8908-9272', ''),
(2452, 'Cedula Fisica', 601050256, 'JIMENEZ HERNANDEZ ALICE', 'RIO CLARO FTE  IGLESIA LOS', 'MORMONES', '7899624', ''),
(2453, 'Cedula Fisica', 501790127, 'JIMENEZ HERNANDEZ ENRIQUE', 'Laurel  km31  900m Escuela Libertad', 'casa detras de la azul. 8628-3112.', '2780-1310', ''),
(2454, 'Cedula Fisica', 501790127, 'JIMENEZ HERNANDEZ ENRIQUE.', 'DE LA ESCUELA LA LIBERTAD KMT Nº31', 'CORREDORES 800 MTS.', '', ''),
(2455, 'Cedula Fisica', 600240070, 'JIMENEZ HERRERA JOSEFA', 'El km 31 de Laurel de Pulperia el', 'Bambú 500mts Calle a Tamarindo', '', ''),
(2456, 'Cedula Fisica', 900610472, 'JIMENEZ JIMENEZ ANA', 'LA CUESTA  CIUDADELA TAMAYO CASA Nº', '17\'A', '7322947', ''),
(2457, 'Cedula Fisica', 501490927, 'JIMENEZ JIMENEZ MIRIAM', 'Bº Silencio  Iguana Verde 20 m', 'Noroeste.', '2783-5223', ''),
(2458, 'Cedula Fisica', 102210564, 'JIMENEZ JIMENEZ MIRIAM', 'LA PUERTA DEL SOL LA BONITA', '75 NORTE', '2786-3237', ''),
(2459, 'Cedula Fisica', 601081156, 'JIMENEZ JIMENEZ NIDIA', 'GOLF Bº BELLA VISTA 150 M N. DE LA', 'ESC (HOSPITAL) <P> BISEMANAL', '7750645', ''),
(2460, 'Cedula Fisica', 601081156, 'JIMENEZ JIMENEZ NIDIA', 'GOLFITO  Bº BELLA VISTA', '', '', ''),
(2461, 'Cedula Fisica', 601081156, 'JIMENEZ JIMENEZ NYDIA', 'GOLFITO BELLA VISTA', '', '7750645', ''),
(2462, 'Cedula Fisica', 601081156, 'JIMENEZ JIMENEZ NYDIA', 'GOLFITO 150M.E. DE ESCUELA CENTRAL', 'BELLA VISTA CASA N 4570', '7750645', ''),
(2463, 'Cedula Fisica', 601470906, 'JIMENEZ JULIO', 'Ciudad Neily  Residencial Río Nuevo', 'casa Nº 21 C.', '', ''),
(2464, 'Cedula Fisica', 501020872, 'JIMENEZ LOPEZ MARIA LUISA', 'Copa Buena 500m oeste de la Escuela', '', '2734-3194', ''),
(2465, 'Cedula Fisica', 603180625, 'JIMENEZ LOPEZ ROCIO', 'Laurel  Cenizo  digaonal a iglesia', 'evangélica.', '2780-0713', ''),
(2466, 'Cedula Fisica', 501030263, 'JIMENEZ MATAMOROS JOSE', 'BELLA LUZ DE LA VACA DE PULP EL', 'GALLITO 100 Mts OESTE <P> 15 C/M', '', ''),
(2467, 'Cedula Fisica', 501030263, 'JIMENEZ MATAMOROS JOSE', 'Bella Luz  Pulp el Gallito 100 m', 'Oeste  (p) 15 c/ mes.', '', ''),
(2468, 'Cedula Fisica', 602020487, 'JIMENEZ MATAMOROS MANUEL', 'Finca 50 a un costado de la plaza ', 'casa Nº 10 644', '', ''),
(2469, 'Cedula Fisica', 602020487, 'JIMENEZ MATAMOROS MANUEL ANTONIO', 'Coto 50  costado oeste plaza  fte a', 'Iglesia Cuadrangular.', '8780-0968', ''),
(2470, 'Cedula Fisica', 501030263, 'JIMENEZ MATAMORROS JOSE', 'BELLA LUZ LAUREL 100MTS SUR DE LA', 'DELEGACION', '2783-8039', ''),
(2471, 'Cedula Fisica', 107640183, 'JIMENEZ MENA ENRIQUE', 'Sta TERESA SABALITO 500 M. N.DE LA', 'ESCUELA 500 M.DEL TELEFONO.PULPERIA', '773-', ''),
(2472, 'Cedula Fisica', 104031013, 'JIMENEZ MENDOZA ANA', 'PALMA JIMENEZ FTE A LAPAS ROJAS', '85589942', '2735-1068', ''),
(2473, 'Cedula Fisica', 500830017, 'JIMENEZ MOYA SERGIO.', 'KILOMETRO 30 LA VAQUITA CASA DE', 'CEMENTO TIPO CLALET.', '', ''),
(2474, 'Cedula Fisica', 202410901, 'JIMENEZ MOYA VISMAR', 'Bº BELL VIST CONTG A ROPA AMERICANA', 'O BAZAR KAREN MERCAD GOLF<P>03 Y 16', '', ''),
(2475, 'Cedula Fisica', 101004821, 'JIMENEZ NUÑEZ JESUS', 'C Cortés  C Pacheco  Ojo de Agua ', 'cs 208  color verde.', '8679-5207', ''),
(2476, 'Cedula Fisica', 501220260, 'JIMENEZ OBREGON EMILIO', 'LA CUESTA DEL PARQUE 1½  CALLE A', 'LAUREL  <P> 30 C/M', '', ''),
(2477, 'Cedula Fisica', 105110837, 'JIMENEZ OREOMUNO ELEIDA', '', '', '', ''),
(2478, 'Cedula Fisica', 204670610, 'JIMENEZ PADILLA CARLOS', '', '', '', ''),
(2479, 'Cedula Fisica', 500057927, 'JIMENEZ PATIÑO MARIA', 'Canoas detras de la bomba tica casa', 'color papaya en la bajadita', '', ''),
(2480, 'Cedula Fisica', 110180570, 'JIMENEZ PEREIRA WAGNER', 'Laurel Centro  mercadito de Laurel', 'Verdulería Heilyn. paga el 15 c/mes', '', ''),
(2481, 'Cedula Fisica', 602560198, 'JIMENEZ PEREZ ANA SOFIA', 'DRAKE CAMINO A LOS PLANES X IGLECIA', 'BAUTISTA * CANCELA 10 C/MES *', '', ''),
(2482, 'Cedula Fisica', 602910031, 'JIMENEZ PEREZ ANNIA', 'DRAKE DE OSA', '', '8280280', ''),
(2483, 'Cedula Fisica', 603800269, 'JIMENEZ PEREZ HEROLD', 'P Jiménez cañaza 200 mts de entrda', 'a M /I 2da casa', '8745-7785', ''),
(2484, 'Cedula Fisica', 101520998, 'JIMENEZ PEREZ ISIDRO', 'LA ESCUADRA DEL LABRIEGO 1 KMT SUR', 'DE ABASTECEDOR EL LABRIEGO  <P> 18', '*-*-*-*', ''),
(2485, 'Cedula Fisica', 500350641, 'JIMENEZ PEREZ LUCIANA', 'LA JULIETA KMT 37 PRIMERA CASA', 'A LA DERECHA.', '', ''),
(2486, 'Cedula Fisica', 101660020, 'JIMENEZ PEREZ ROSA', 'PASO CANOAS DEL ABAST. EL TRIUNFO', '200M MANO IZQ.', '', ''),
(2487, 'Cedula Fisica', 601980329, 'JIMENEZ PORRAS MARINA', 'B* Alemania casa L 7 detras de', 'central de taxi', '8983-7189', ''),
(2488, 'Cedula Fisica', 602490233, 'JIMENEZ QUESADA LUIS ANGEL', 'DOMINICALITO B*POZA AZUL CASA*2', '', '8605-1190', ''),
(2489, 'Cedula Fisica', 602330488, 'JIMENEZ QUESADA MARIA CECILIA', 'POZA AZUL DOMINICALITO CASA *15', 'AMARILLA 87823968', '2787-0327', ''),
(2490, 'Cedula Fisica', 501180742, 'JIMENEZ RAMIREZ CARMEN LIDIA', 'RIO CLARO  URBA CONTG AL I.C.E.', 'CASA Nº 24. P 16 Y 30 DE C-MES', '789', ''),
(2491, 'Cedula Fisica', 603540801, 'JIMENEZ RODRIGUEZ ANA RUTH CC NANI', 'PULPERIA DAYARITH GUADALUPE DE LA P', 'ALMA JIMENEZ', '', ''),
(2492, 'Cedula Fisica', 602620032, 'JIMENEZ RODRIGUEZ LETH CC INDIO', 'PUERTO JIMENEZ 150MT SUR DE TALLER', 'DE DIEGO MORO', '', ''),
(2493, 'Cedula Fisica', 100780604, 'JIMENEZ ROJAS ALEXANDER', 'Drake de Osa  contiguo al EBAIS', '', '8853-5168', ''),
(2494, 'Cedula Fisica', 601570541, 'JIMENEZ ROJAS MARIO', 'Coto 49  diagonal al telf. público.', '', '2781-1564', ''),
(2495, 'Cedula Fisica', 501980439, 'JIMENEZ ROSALES NELSON', 'Palmar Sur  contiguo a asilo de an-', 'cianos.', '', ''),
(2496, 'Cedula Fisica', 501980439, 'JIMENEZ ROSALES NELSON', 'Palmar Sur  contiguo a asilo de an-', 'cianos.', '', ''),
(2497, 'Cedula Fisica', 501980439, 'JIMENEZ ROSALES NELSON', 'Palmar Sur  contiguo a asilo de an-', 'cianos.', '8366-7213', ''),
(2498, 'Cedula Fisica', 500730979, 'JIMENEZ SALGUERO RAFAEL', 'CIUDAD NEILY 22 DE OCTUBRE DE PULP', 'SINDY CUARATA CASA M.IZQUIERDA', '7835114', ''),
(2499, 'Cedula Fisica', 601320651, 'JIMENEZ SEGURA GERARDO', 'Km 16  Golfito  carretera al 18.', '', '2775-2831', ''),
(2500, 'Cedula Fisica', 900620771, 'JIMENEZ SEGURA LIBRADO', 'R.C. S.RAMON 800 E Y 400 N DEL IDA.', 'BAMBEL 1 X IGLESIA.', '', ''),
(2501, 'Cedula Fisica', 203010638, 'JIMENEZ SOTO OSCAR.', 'PALMAR SUR  FINCA 10 CASA 22413', '', '', ''),
(2502, 'Cedula Fisica', 600640731, 'JIMENEZ SUMBADO NELSON', 'CORTES PUNTA MALA COBRAR EN MUNICIP', '', '7888554', ''),
(2503, 'Cedula Fisica', 103500056, 'JIMENEZ TENORIO JOSE RAMON', 'EL CLAVO FRENTE AL CLAVO <P> 19 C/M', '', '', ''),
(2504, 'Cedula Fisica', 200990050, 'JIMENEZ UGALDE RAFAEL', 'COTO 44  LA CENTRAL CAMPESINA PULP', 'LA PUERTA DEL SOL  200 M CALLE A ZA', '', ''),
(2505, 'Cedula Fisica', 502640268, 'JIMENEZ VALVERDE ANALCI', 'PALMAR NORTE 100 MTS SUR DEL SUPER', 'NURI. CANCELA 8 C/MES', '7866920', ''),
(2506, 'Cedula Fisica', 102580484, 'JIMENEZ VARGAS HERNAN', 'RIO CLARO  LA ESPERANZA CASA CONTIG', 'A ASAMBLEAS DE DIOS.', '7751228', ''),
(2507, 'Cedula Fisica', 108560612, 'JIMENEZ VARGAS RAMON', '1KM AL SUR DE LA ESCULA  SANTA LUSI', 'A', '2780-1170', ''),
(2508, 'Cedula Fisica', 601020927, 'JIMENEZ VENEGAS LILIAM', 'BARRIO PROGRESO BAHIA DRAKE  ENTRAD', 'A 100MTRS NORTE DE LA IGLESIA EVANG', '8671-4060', ''),
(2509, 'Cedula Fisica', 109270472, 'JIMENEZ VILLALOBOS ROBERTO', 'Calle S Jorge Ent Tunel 1º Ent MD', '2º casa MD. Cel 8945-7756.', '2732-1552', ''),
(2510, 'Cedula Fisica', 602440924, 'JIMENEZ VINDAS BERTALINA', 'rio nuevo bloque k1 casa 1  primera', 'entrada al sur', '2783-6530', ''),
(2511, 'Cedula Fisica', 601310259, 'JIMENEZ VINDAS MARIA LUISA', 'LA ESPERANZA DE SABALO CALLE FRTE', 'A LA PLAZA  200 MTS ADENTRO', '', ''),
(2512, 'Cedula Fisica', 601480511, 'JIMENEZ VINDAS RAFAEL', 'LA ESPERANZA DE SABALO 500 MTS AL', 'SUR DEL SALON COMUNAL (PAVONES)', '', ''),
(2513, 'Cedula Fisica', 104950400, 'JIMENEZ ZUÑIGA MARIO', 'pavones cruce de pilon pulperia', 'hns jimenez', '', ''),
(2514, 'Cedula Fisica', 104950400, 'JIMENEZ ZUÑIGA MARIO', 'PAVONES CRUCE DE PILON', 'PULPERIA HERS JIMENEZ', '', ''),
(2515, 'Cedula Fisica', 104950400, 'JIMENEZ ZUÑIGA MARIO', 'Pavones cruce de pilón pulperia', 'hnos imenez', '', ''),
(2516, 'Cedula Fisica', 270350311, 'JIRON JIRON JOSE', 'Pto JIMENEZ  ZANDALO PULP ZANDALO', '<P> 11 C/M', '', ''),
(2517, 'Cedula Fisica', 270350311, 'JIRON JIRON JOSE', 'Pto JIMENEZ  ZANDALO PULP VIELO O', 'PAULA <P> 11 C/M', '', ''),
(2518, 'Cedula Fisica', 501320543, 'JIRON PEREZ BEATRIZ', 'LA CAMPIÑA ENTRADA A 300 Mts CALLE', 'CANGREJO VERDE PRIMER CASA M/DEREC', '', ''),
(2519, 'Cedula Fisica', 601800567, 'JUARES GUTIERREZ RICARDO', 'GOLFITO KM.1 TERCERA FILA', 'CASA Nº 4483 COLOR CELESTE.', '7751383', ''),
(2520, 'Cedula Fisica', 502240129, 'JUAREZ CORDERO JUANITA', 'La Cuesta 200 sur casa adulto mayor', 'Cel 8793-9251.', '7321081', ''),
(2521, 'Cedula Fisica', 602880498, 'JUAREZ DELGADO ZOILA LISBETH', 'Laurel Sta Lucía diag a la Escuela.', '', '2780-0717', ''),
(2522, 'Cedula Fisica', 600450051, 'JUAREZ GOMEZ BLAS', 'SIERPE D OSA COSTA D SODA SIERPE', 'ENTRA MANO IZQUIER 2GNDA DERECHA', '2788-1349', ''),
(2523, 'Cedula Fisica', 600450051, 'JUAREZ GOMEZ BLAS', 'Sierpe 50m de la plaza entrada soda', 'Sierpe.', '2788-1349', ''),
(2524, 'Cedula Fisica', 500770283, 'JUAREZ GUTIERREZ LUIS', 'Laurel Roble  a un costado de plaza', 'cs Nº 4.', '8589-0047', ''),
(2525, 'Cedula Fisica', 603100497, 'JUAREZ HIDALGO ALBA', 'PALMAR NORTE X PROYECTO DEL ICE', 'ENTRADA X EL PUENTE', '3229749', ''),
(2526, 'Cedula Fisica', 501370712, 'JUAREZ JIMENEZ MARIA', 'P Canoas Bº Lopez. Pulp Nance.', '', '2732-1773', ''),
(2527, 'Cedula Fisica', 600730430, 'JUAREZ LOPEZ VICTOR MIGUEL', 'COTO 58 Nº 11329 X BODEGA AL FONDO', '**  FECHA DE PAGO 30 CADA MES  **', '7811538', ''),
(2528, 'Cedula Fisica', 601940825, 'JUAREZ MATARRITA OLMAN EDUARDO', 'GUADALUPE LA PALMA DE JIMENEZ', '30 MTS NORORESTE DE LA ESCUELA', '7351329', ''),
(2529, 'Cedula Fisica', 800680768, 'JUAREZ ORTIZ CARLOS', 'Bº Canadá  Cortés  casa f4.', '', '2788-8078', ''),
(2530, 'Cedula Fisica', 103550563, 'LACAYO SALMERON MARIA OFELIA', 'B* SAN JORGE DE INDUSTRIAS GALLI', 'SUR 100MTS NOROESTE CASA ESQUINERA', '8683-6336', ''),
(2531, 'Cedula Fisica', 604480551, 'LAGOS ZELEDON CARINA', 'PUERTO JIMENEZ CIUDAD NEGRA', 'FECHA DE PAGO 11 C/M', '', ''),
(2532, 'Cedula Fisica', 604480055, 'LAGOS ZELEDON CORINA', 'CAÑAZA EN Bº CIUDAD NEGRA', '', '', ''),
(2533, 'Cedula Fisica', 159100241, 'LAM MURILLO ERICK', 'P Jiménez fte Cabinas el Manglar.', '', '8810-1210', ''),
(2534, 'Cedula Fisica', 159100241, 'LAM MURILLO ERICK SALOMON', 'P Jiménez  Fte Cabinas Chozas del', 'Manglar x cementerio. Cel 8810-1230', '2735-5467', ''),
(2535, 'Cedula Fisica', 603970106, 'LAN SOTO GUILLERMO', 'P Jiménez  Urb el Colegio  del puen', 'te 2º entrada casa esquinera.', '8751-5508', ''),
(2536, 'Cedula Fisica', 206324847, 'LANDAZURI MINOTTA NAYIBE', 'P Canoas Bº Calin Rodriguez  Detrás', 'Bomba Tica. Cel 8611-5520.', '8611-5520', ''),
(2537, 'Cedula Fisica', 602560467, 'LARA ALVARDO ANA YANCI', 'Ciudad Cortez  Diagonal a las ofici', 'nas del ICE.', '', ''),
(2538, 'Cedula Fisica', 603180415, 'LARA ARTAVIA CARLOS', 'BELLA VISTA 2 FILA 4207', '86711265', '2775-6412', ''),
(2539, 'Cedula Fisica', 601940437, 'LARA GONZALEZ BLANCA', 'S Vito Bº Tres Ríos 75m SO Plantel', 'Municipal. 2773-3975 8866-5040', '2773-5040', ''),
(2540, 'Cedula Fisica', 500660210, 'LARA JOSE LEUTERIO', 'LA ESPERANZA 450 MTS AL NORTE DE LA', 'ESCUELA.', '', ''),
(2541, 'Cedula Fisica', 600490949, 'LARA LARA AGUSTIN', 'VEHERE DE LA ESCUELA 600 MTS SUR Y', '400 MTS AL OESTE.', '7800526', ''),
(2542, 'Cedula Fisica', 601060208, 'LARA LOPEZ JUAN RAMON', 'Golfito  Barrio Bella Vista Segunda', 'fila casa Nº 4207.', '7750120', ''),
(2543, 'Cedula Fisica', 601060208, 'LARA LOPEZ JUAN RAMON', 'Golfito  Barrio Bella Vista Segunda', 'fila casa Nº 4207. CANCELA 16 C/M', '7752172', ''),
(2544, 'Cedula Fisica', 603390011, 'LARA VINDAS DEIBIS', 'EN LA PISTA DE ATERRIZAJE 100NORTE', 'Y 50 AL ESTE', '8820-0043', ''),
(2545, 'Cedula Fisica', 800650813, 'LARIOS GOMEZ MARIA ISABEL', 'ENTRADA FINCA MANGO  Soda la Abuela', '', '2780-0383', ''),
(2546, 'Cedula Fisica', 602750841, 'LAZARO MORA ANA ISABEL', 'CIUDAD CORTES  CONTIGUO A LA', 'CORTE  CASA DE MADERA', '3305522', ''),
(2547, 'Cedula Fisica', 601040899, 'LAZO BARRANTES MARLENE', 'RIO CLARO  25 MTS AL SUR DE LA', 'AGENCIA DE TRACOPA', '7899392', ''),
(2548, 'Cedula Fisica', 601040899, 'LAZO BARRANTES MARLENE', 'RIO CLARO  25 MTS AL SUR DE LA', 'AGENCIA DE TRACOPA', '7899392', ''),
(2549, 'Cedula Fisica', 601040899, 'LAZO BARRANTES MARLENE', '25 m Sur Agencia Tracopa', 'Cobrar en Agencia Tracopa', '7899392', ''),
(2550, 'Cedula Fisica', 601220208, 'LAZO GUEVARA AURORA', 'GOLFITO PUEBLO CIVIL DE LA MUNICIP.', '100 N C.C CELESTE <P> 02 DE C/M', '7750392', ''),
(2551, 'Cedula Fisica', 600690157, 'LEAL ENRIQUEZ DAGOBERTO', '', '', '', ''),
(2552, 'Cedula Fisica', 502560061, 'LEDEZMA GUTIERREZ ALBERTO', 'Drake de Jade Mar  50 Sur Cs verde', 'agua  2775-2319', '8571-5899', ''),
(2553, 'Cedula Fisica', 101124180, 'LEDEZMA MACOTELO LIDIETH', 'P Jiménez  Playa sombrero Bar Buena', 'Esperanza  Cel 8889-6382.', '8889-6382', ''),
(2554, 'Cedula Fisica', 601290877, 'LEDEZMA MENDEZ LUZ MARINA', 'Barrio Alemania  caa E17 frente a p', 'laza palmar norte.', '7866169', ''),
(2555, 'Cedula Fisica', 601290877, 'LEDEZMA MENDEZ LUZ MARINA', 'Barrio Alemania  caa E17 frente a p', 'laza palmar norte.', '2786-6164', ''),
(2556, 'Cedula Fisica', 601120792, 'LEDEZMA MONTERO WILBERT', 'Palmar Norte  Antigua Alfa & Omega ', 'Bar Guabina.', '', ''),
(2557, 'Cedula Fisica', 601120792, 'LEDEZMA MONTERO WILBERT', 'Palmar N Bar Lili  fte a Bomberos.', '', '-', ''),
(2558, 'Cedula Fisica', 601120792, 'LEDEZMA MONTERO WILBERTH', 'PALMAR NORTE  FUNERALES ALFA & OMEG', '', '786', ''),
(2559, 'Cedula Fisica', 601120792, 'LEDEZMA MONTERO WILBERTH', 'PALMAR NORTE  FUNERALES ALFA & OMEG', '', '786', ''),
(2560, 'Cedula Fisica', 603090649, 'LEITON ARIAS JEANNETH', 'La Fortuna de Pavones de la esc 300', 'Mts SUR Cs verde  2780-1471', '8759-4016', ''),
(2561, 'Cedula Fisica', 600930298, 'LEITON CRUZ PILAR', 'Golfito detrás Cabinas el Tucán.', '', '2775-0959', ''),
(2562, 'Cedula Fisica', 600310491, 'LEITON GONZALEZ JOSE MARIA', 'R Claro  S Ramón  1º entrada MD.', '', '', ''),
(2563, 'Cedula Fisica', 600310491, 'LEITON GONZALEZ JOSE MARIA', 'R Claro  Bº Santiago.', 'Cobrar en Supermercado el Ahorro. 8', '2789-9718', ''),
(2564, 'Cedula Fisica', 502220705, 'LEITON ROJAS ALVARO', 'R Claro  San Ramón  El Esfuerzo cs', 'Nº 7. Cel 8321-9970.', '2789-9718', ''),
(2565, 'Cedula Fisica', 500670021, 'LEITON SIBAJA FRANCISCO', 'Golfito  la Mona después de la', 'vuelta.', '7751445', ''),
(2566, 'Cedula Fisica', 600300229, 'LEIVA NAVAS CARLOS', 'LA CUESTA DEL COMANDO 125 NORTE', 'CALLE A LA ARROCERA', '7322053', ''),
(2567, 'Cedula Fisica', 600300229, 'LEIVA NAVAS CARLOS', 'LA CUESTA CONTIG. AL SALON DE', 'TESTIGOS.', '7322053', ''),
(2568, 'Cedula Fisica', 601840228, 'LEMAITRE MORA GILBERTH.', 'BARRIO EL CARMEN DE ABROJO.', '', '', ''),
(2569, 'Cedula Fisica', 941053709, 'LEON ARANGO JOHN ALEJANDRO', 'PTO JIMENEZ B* EL BAMBU VIDRIOS', 'LEON DE OSA', '8941-4822', ''),
(2570, 'Cedula Fisica', 500690047, 'LEON ARAYA PEDRO', 'CAUCHO DEL VIVERO 2da CASA MANO IZQ', 'CALLE A MANGO.', '7800319', ''),
(2571, 'Cedula Fisica', 500690047, 'LEON ARAYA PEDRO', '900 M SUR FINCA MANGO O EN LA ENTRA', 'DADE MANGO EN CAUCHO', '7800319', ''),
(2572, 'Cedula Fisica', 603120709, 'LEON MADRIGAL WILFRED', 'PUERTO JIMENEZ  LA PALMA 1 KMT', 'ESTE DE LA GUARDIA RURAL', '', ''),
(2573, 'Cedula Fisica', 601570147, 'LEON MONGE ARNOLDO', 'Km 24  600 Mts N de Abast La Nubia', 'Cs Fibrolit Blanca  Palo Lorito', '2780-0322', ''),
(2574, 'Cedula Fisica', 202280306, 'LEON MORA GUIDO', 'PIEDRAS BLANCAS URB. VILLAS DEL SUR', 'CASA Nº96 ** 8C/MES **', '7411237', ''),
(2575, 'Cedula Fisica', 401010311, 'LEON VALERIO MARIA CESILIA', 'GOLFITO  Bº BELLA VISTA CASA', 'Nº 4390 OCTAVA FILA', '7751967', ''),
(2576, 'Cedula Fisica', 602740586, 'LEONILIA ALVARADO ALBA', 'Laurel Naranjo Urb Naranjal cs 30', 'c/ amarillo. Telf', '2780-1194', ''),
(2577, 'Cedula Fisica', 600920696, 'LESVA SANDOVAL GLADYS', 'LA CUESTA AUN COSTADO DEL COMANDO C', 'ASA COLOR ESQUINERA AMARILLA', '8719-1442', ''),
(2578, 'Cedula Fisica', 800640103, 'LEZAMA LOPEZ HERMOGENES', 'ENTRADA FINCA MANGO  DIAGONAL A', 'CASA DEL CONSTRUCTOR', '2780-0383', ''),
(2579, 'Cedula Fisica', 602170961, 'LEZAMA PORRAS HANIA', 'PSO CANOAS FTE ALA PLAZA CASA', 'ESQUINERA BLANCA', '7322892', ''),
(2580, 'Cedula Fisica', 602390120, 'LEZAMA PORRAS WILSON', 'PURRUJA MANUEL TUCLER CASA E-22', '', '7751697', ''),
(2581, 'Cedula Fisica', 800640103, 'LEZAMO LOPEZ HERMOGENES', '', '', '', ''),
(2582, 'Cedula Fisica', 603750895, 'LEZCANO CUBILLO ALONSO', 'P Jiménez  Bambú  600m Oeste Pulp.', 'La Amistad. cel 8562-6003', '8658-1052', ''),
(2583, 'Cedula Fisica', 602360004, 'LEZCANO FERNANDEZ MARJORIE', 'C Cortés  Bº Pacheco  cs 57', '', '2786-4127', ''),
(2584, 'Cedula Fisica', 600480687, 'LEZCANO GUITERREZ TRINIDAD', 'JIMENEZ EL BANBU COSTADO TALLER WIK', 'O', '', ''),
(2585, 'Cedula Fisica', 600770813, 'LEZCANO GUTIERREZ FLORENCIO', 'CORTES', '', '', ''),
(2586, 'Cedula Fisica', 601760914, 'LEZCANO LEZCANO MARLENY', 'BAMBITO LAUREL 150MTS DESPUES DE', 'LA ESCUELA CASA BLANCA', '8976-0462', ''),
(2587, 'Cedula Fisica', 602420691, 'LEZCANO MATARRITA EDIXON', 'P Jiménez 75m sur Cable Corcovado', '', '8915-0184', ''),
(2588, 'Cedula Fisica', 602690221, 'LEZCANO MATARRITA ZOBEIDA', 'EL NEQUE CONTIGUO AL VIVERO', 'ORO VERDE EN PTO JIMENEZ', '8323155', ''),
(2589, 'Cedula Fisica', 601910800, 'LEZCANO PITTI LAZARO', 'P. Canoas  Veracruz  Desp quebrada', '2º cs.', '', ''),
(2590, 'Cedula Fisica', 600460439, 'LEZCANO VALDEZ JACINTO.', 'TINOCO  KILOMETRO Y MEDIO DESPUES', 'DEL C.E.N.', '788', ''),
(2591, 'Cedula Fisica', 601530450, 'LIBER HERNANDEZ JORGE', 'Laurel  Cenizo  contiguo al puente.', 'Cel 8819-5087.', '7801206', ''),
(2592, 'Cedula Fisica', 202250469, 'LIZANO OVIEDO JORGE.', 'CIUDAD NEILY  POR LAS PLANTAS I.C.E', 'O EN FARMACIA IBARRA. P 15 Y 30 C/M', '753171', ''),
(2593, 'Cedula Fisica', 602430330, 'LOAIZA RODRIGUEZ FLORIBETH', 'B* LA MARIPOSA DE LA ESCUELA', '500MTS AL NORTE', '8919-6265', ''),
(2594, 'Cedula Fisica', 502290549, 'LOBO CRUZ FELIX', 'Agua Buena Pueblo Nuevo 400 Mts Sur', 'Iglesia Catolica Cs Verde Contg Pue', '8808-2373', ''),
(2595, 'Cedula Fisica', 601460873, 'LOBO MAYORGA SONIA', 'Kmt 20 FRET BODEGA DEL DEPOSITO', '<P> 03 C/M', '', ''),
(2596, 'Cedula Fisica', 601500946, 'LOBO MIRANDA CARMEN', 'Bº ALEMANIA CLL 141 AV 13', 'CASA MANOO AZUL CEMENTO', '8628-4062', ''),
(2597, 'Cedula Fisica', 600690373, 'LOBO MIRANDA DANIEL', 'La Campiña  3 Kilometros calle a', 'Abangares  casa a mano Izquierda.', '9779263', ''),
(2598, 'Cedula Fisica', 600690373, 'LOBO MIRANDA DANIEL', 'La Campiña  3 Kilometros calle a', 'Abangares  casa a mano Izquierda.', '8538-0916', ''),
(2599, 'Cedula Fisica', 600690373, 'LOBO MIRANDA DANIEL.', 'COBRAR DONDE JIRON PEREZ BEATRIS', 'PAGA EL 20 DE C/M.', '', ''),
(2600, 'Cedula Fisica', 600690373, 'LOBO MIRANDA DANIEL.', 'COBRAR DONDE JIRON PEREZ BEATRIS', 'PAGA EL 20 DE C/M.', '', ''),
(2601, 'Cedula Fisica', 201280420, 'LOBO VARGAS CLAUDIO', 'GOLFITO  I.N.V.U. LA ROTONDA', '2da CASA DESP D ELA PULP M.IZQUIEDA', '7751903', ''),
(2602, 'Cedula Fisica', 600840042, 'LOPEZ ABARCA ALVARO', 'Sabalito  Bº Esquinas 50 Mts Este d', 'la Esc. Depocita en el banco siempr', '2784-0086', ''),
(2603, 'Cedula Fisica', 800460596, 'LOPEZ AGUIRRE RAMON', 'GOLFITO  LA MONA EN LA PULP. Bº', 'MEXICO <P> 03 CADA MES', '775', ''),
(2604, 'Cedula Fisica', 800460596, 'LOPEZ AGUIRRE RAMON', 'GOLFITO  LA MONA EN LA PULP. Bº', 'MEXICO <P> 15 CADA MES', '7751132', ''),
(2605, 'Cedula Fisica', 700180365, 'LOPEZ ALVARADO ADOLFO', 'CANOAS  EN ZAPATERIA PASO CANOAS', 'A XINIA LOPEZ VEGA.', '732', ''),
(2606, 'Cedula Fisica', 700180365, 'LOPEZ ALVARADO ADOLFO', 'CALLE A LA CUESTA 200 N DEL COLEGIO', 'PULP EL BOSQUE <P> 30 C/M', '', ''),
(2607, 'Cedula Fisica', 601730121, 'LOPEZ ALVARADO GILBERTO', '', '', '', ''),
(2608, 'Cedula Fisica', 603090644, 'LOPEZ ARAUZ LUIS ALEXANDER', 'Abrojo Sur 2º Entrada Iglesia Evan-', 'gélica.', '8557-9151', ''),
(2609, 'Cedula Fisica', 602250307, 'LOPEZ ARRIETA GUSTAVO', 'GOLFITO EN COOPESERIMEC.', '', '7750867', ''),
(2610, 'Cedula Fisica', 601440144, 'LOPEZ BOLIVAR ELIOPOLDO', 'SANTA ROSA  DE PALMAR NORTE  FRET A', 'LA ENTRADA DE VILLA.P.19 C/M', '', ''),
(2611, 'Cedula Fisica', 600770079, 'LOPEZ CALERO ANGELA', 'GOLFITO INVU KM 3 CASA # 64', 'paga 14 y 27 de c/mes.', '', ''),
(2612, 'Cedula Fisica', 600770079, 'LOPEZ CALERO ANGELA.', 'GOLFITO  INVU KM 3 CASA #64', 'PAGA EL 27 C/M', '775', ''),
(2613, 'Cedula Fisica', 602560073, 'LOPEZ CARRILO EUGENIO', 'SANTA LUCIA DE LAUREL. Trabaja en', 'Escuela de Golfito.', '2780-0717', ''),
(2614, 'Cedula Fisica', 500470107, 'LOPEZ CASTRILLO JUAN', 'SANTA LUCIA UN COSTADO DE LA PLAZA', 'CASA DE ALTO.', '', ''),
(2615, 'Cedula Fisica', 500730158, 'LOPEZ CASTRILLO MACARIA', 'PASO CANOAS  LA BRIGADA FABRICA DE', 'PILAS', '', ''),
(2616, 'Cedula Fisica', 103650771, 'LOPEZ CRUZ OSCAR', 'Cooperativa las Gambas o del salon', 'Comunal 100 mts Noreste', '7899344', ''),
(2617, 'Cedula Fisica', 103650771, 'LOPEZ CRUZ OSCAR', 'La Gamba  125 m antes de la Iglesia', 'Evangélica.', '8344-4650', ''),
(2618, 'Cedula Fisica', 502790452, 'LOPEZ FAJARDO DONALD', 'MONTE VERDE VILLA LUZ', '', '', ''),
(2619, 'Cedula Fisica', 103730945, 'LOPEZ GAMBOA MIREYA', 'LA ESPERANZA DE PAVONES 250 MTS SUR', 'Y 75 ESTE DEL SALON COMUNAL', '7708201', ''),
(2620, 'Cedula Fisica', 205640202, 'LOPEZ GOMEZ EDEN', 'Golfito Bº san juan al final casa', 'amarilla 8789-1159', '2775-1159', ''),
(2621, 'Cedula Fisica', 602860243, 'LOPEZ HERNANDEZ LUIS ELIECER', 'KM1 1º FILA FTE A ESC.ATRAS CABINAS', 'EL TUCAN.', '7209215', ''),
(2622, 'Cedula Fisica', 205730788, 'LOPEZ HERNANDEZ YESSENIA', 'Ciud Neily  125 Est del B Popular ', 'Bº la Union  8984-5547', '2783-3038', ''),
(2623, 'Cedula Fisica', 602330991, 'LOPEZ JIMENEZ MAGALY', 'C Neily  La fortuna 600 m noroeste', 'del Salon Interamericano.', '2783-4402', ''),
(2624, 'Cedula Fisica', 900890806, 'LOPEZ JIMENEZ MARCOS ANTONIO', '150MTS DE LA ENTRADA DE LA BOLSA CA', 'SA COLOR NATURAL', '8984-7834', ''),
(2625, 'Cedula Fisica', 276589124, 'LOPEZ LARGAESPADA RODOLFO', 'EL CARMEN DE ABROJO CASA #228', '<P> 15 Y 30 C/M', '', ''),
(2626, 'Cedula Fisica', 276589124, 'LOPEZ LARGAESPADA RODOLFO', 'EL CARMEN DE ABROJO CASA #228', '<P> 15 Y 30 C/M', '', ''),
(2627, 'Cedula Fisica', 276589124, 'LOPEZ LARGAESPADA RODOLFO', 'EL CARMEN DE ABROJO CASA #228', '<P> 01 Y 15 C/M', '', ''),
(2628, 'Cedula Fisica', 276589124, 'LOPEZ LARGAESPADA RODOLFO', 'EL CARMEN DE ABROJO CASA #228', '<P> 01 Y 15 C/M', '', ''),
(2629, 'Cedula Fisica', 600960690, 'LOPEZ LOPEZ ANALIVE', 'R Claro 200 N 50 E De Salón Comunal', 'Cel 8966-6241.', '2789-8210', ''),
(2630, 'Cedula Fisica', 601000402, 'LOPEZ LOPEZ MARGARITA', 'COTO 63 CASA # 15403 FRENTE AL', 'COMISARIATO <P> 30 C/M', '7899193', ''),
(2631, 'Cedula Fisica', 601000402, 'LOPEZ LOPEZ MARGARITA', 'Río Claro  Coto 63  casa # 15403.', '', '', ''),
(2632, 'Cedula Fisica', 601000402, 'LOPEZ LOPEZ MARGARITA', 'RIO CLARO COTO 63 CASA Nº 15403', '** FECHA DE PAGO 10 C/MES**', '7899193', ''),
(2633, 'Cedula Fisica', 601000402, 'LOPEZ LOPEZ MARGARITA', 'Coto 63  Rio Claro casa de alto 3º', 'casa', '7899193', ''),
(2634, 'Cedula Fisica', 601000402, 'LOPEZ LOPEZ MARGARITA', 'Coto 63  Cs verde a un costado Pulp', 'González. Cel 8979-1236.', '2789-9193', ''),
(2635, 'Cedula Fisica', 500670754, 'LOPEZ LOPEZ MARIA', 'GOLFITO PURRUJA KMT 9 SODA EL', 'MUELLACITO <P> 16 C/M', '', ''),
(2636, 'Cedula Fisica', 900580472, 'LOPEZ LOPEZ MARIA FABIANA', 'Rio Claro detràs del Restaurant', 'Victoria.', '', ''),
(2637, 'Cedula Fisica', 207822815, 'LOPEZ LOPEZ MOISES', '', '', '', ''),
(2638, 'Cedula Fisica', 600760704, 'LOPEZ LOPEZ NICOLASA', 'rio claro frente al', 'correo casa verde esquinera', '7899297', ''),
(2639, 'Cedula Fisica', 600760704, 'LOPEZ LOPEZ NICOLOSA EMILCE', 'R Claro fte Correo cs verde Esquine', 'ra.', '2789-9297', ''),
(2640, 'Cedula Fisica', 800470105, 'LOPEZ LOPEZ ODILIA ( C.C. SOCORRO', 'golfito km.3 casa 34 detras', 'de iglecia advbe.', '', ''),
(2641, 'Cedula Fisica', 501170636, 'LOPEZ LOPEZ RUDESINDO', 'Pto JIMENEZ  DE LA BOMBA 2 KMT SUR', 'ENTRADA LA BALSA 1 KMT <P> 11 C/M', '', ''),
(2642, 'Cedula Fisica', 501170636, 'LOPEZ LOPEZ RUDESINDO', 'Pto JIMENEZ  DE LA BOMBA 2 KMT SUR', 'ENTRADA LA BALSA 1 KMT <P> 11 C/M', '', ''),
(2643, 'Cedula Fisica', 501170636, 'LOPEZ LOPEZ RUDESINDO', 'Pto JIMENEZ  DE LA BOMBA 2 KMT SUR', 'ENTRADA LA BALSA 1 KMT <P> 11 C/M', '7355644', ''),
(2644, 'Cedula Fisica', 501170636, 'LOPEZ LOPEZ RUDESINDO', 'DE LA BOMBA DE OSA 3KTRS CAMINO A P', 'ALO SECO ENTRADA A LA BOLSA', '2735-5644', ''),
(2645, 'Cedula Fisica', 500640904, 'LOPEZ LOPEZ RUFINO PAUL', 'Langostino de Pavones  2º cs antes', 'plaza de futbol.', '8803-0552', ''),
(2646, 'Cedula Fisica', 501200050, 'LOPEZ LOPEZ SANTOS', 'Santa Lucia de pulp la cuevita', '250 Mts entrada a monte verde', '', ''),
(2647, 'Cedula Fisica', 500570581, 'LOPEZ MARTINEZ JESUS', 'PASO CANOAS SAN JOSE 75 OESTE DE', 'ACUEDUCTOS', '7322917', ''),
(2648, 'Cedula Fisica', 500570581, 'LOPEZ MARTINEZ JESUS Mº', 'P Canoas S Jorge 75M O Acueductos.', '', '2732-2917', ''),
(2649, 'Cedula Fisica', 501391259, 'LOPEZ MAYORGA PEDRO JOSE', 'R Claro  Bambel 3  entrada Ranchito', '500 oeste MD.', '8960-0068', ''),
(2650, 'Cedula Fisica', 270330791, 'LOPEZ MERCADO GUILLERMO', 'LA ESPERANZA DEL TELF  100 Mts', 'OESTE <P> 03 C/M', '', ''),
(2651, 'Cedula Fisica', 270330791, 'LOPEZ MERCADO GUILLERMO', 'LA ESPERANZA 1 er ENTRADA M.IZQUIER', 'EN CIUDADELA DESP PULP 3er CASA M.I', '', ''),
(2652, 'Cedula Fisica', 501990470, 'LOPEZ MORERA DANILO', 'Ciudadela Gonzalez  frente Iglesia', 'evang Cs Celeste # 14', '8812-7570', ''),
(2653, 'Cedula Fisica', 601320942, 'LOPEZ OBANDO MARVIN', 'DEL CORREO 25 SUR Y 25 ESTE', 'TRABAJA  I.C.E. RIO CLARO.', '783-30', ''),
(2654, 'Cedula Fisica', 601320942, 'LOPEZ OBANDO MARVIN', 'DEL CORREO 25 SUR Y 25 ESTE', 'TRABAJA  I.C.E. RIO CLARO.', '783-30', ''),
(2655, 'Cedula Fisica', 601320942, 'LOPEZ OBANDO MARVIN', 'CIUDAD NEILY  CONTIGUO A CASA', 'PASTORAL IGLESIA ASABLEAS DE DIOS.', '7833095', ''),
(2656, 'Cedula Fisica', 601900157, 'LOPEZ OBANDO SIGRID SURAMA', 'GOLFITO KILOMETRO TRES', 'CASA Nº 88 U HOSPITAL DE GOLFITO', '7751378', ''),
(2657, 'Cedula Fisica', 601900157, 'LOPEZ OBANDO SIGRID SURAMA', 'Golfito Km3 cs 88.', 'Cel 8944-5388.', '2775-1378', ''),
(2658, 'Cedula Fisica', 601900157, 'LOPEZ OBANDO SINGRID SUMARA', '', '', '', ''),
(2659, 'Cedula Fisica', 500890323, 'LOPEZ ORTEGA JOSE LEON', 'SANTA ROSA 200M ANTES DE PULPERIA', 'LA CUESTA.', '', ''),
(2660, 'Cedula Fisica', 500890323, 'LOPEZ ORTEGA JOSE LEON', 'SANTA ROSA 200M ANTES DE PULPERIA', '', '', ''),
(2661, 'Cedula Fisica', 602580355, 'LOPEZ ORTEGA JOSE RONALD', 'C. Neily Bº las Picinas', '20 mts norte Casa Ande.', '7835957', ''),
(2662, 'Cedula Fisica', 500820838, 'LOPEZ ORTEGA MAXIMILIANO', 'Finca Guanacaste 400 mts oeste de', 'la Escuela local.', '', ''),
(2663, 'Cedula Fisica', 500820838, 'LOPEZ ORTEGA MAXIMILIANO', 'Fca Guanacaste  400 oeste Escuela.', '', '2786-3091', ''),
(2664, 'Cedula Fisica', 102570778, 'LOPEZ PADILLA CARLOS', 'LA CAMPIÑA  DIAGONAL A LA CASA DE', 'DOÑA FLORENCIA CABRERA.', '', ''),
(2665, 'Cedula Fisica', 102570778, 'LOPEZ PADILLA CARLOS.', 'CAMPIÑA  DIAG A C. DE DOÑA FLORENCI', '<P> EL 20 DE C/ MES', '', ''),
(2666, 'Cedula Fisica', 102570778, 'LOPEZ PADILLA CARLOS.', 'CAMPIÑA  DIAG A C. DE DOÑA FLORENCI', '<P> EL 20 DE C/ MES', '', ''),
(2667, 'Cedula Fisica', 270543532, 'LOPEZ PELLECER ALBA', 'Kmt 1 GOLF 6º FILA CASA # 4158', '<P> 27 C/M', '*-*-*-*', ''),
(2668, 'Cedula Fisica', 600830678, 'LOPEZ PORRAS CARLOS ALBERTO', 'SAN BUENAS DE LA ENTRADA PRINCIPAL', '300MTS CASA PAPAYA 86512775', '2786-5456', ''),
(2669, 'Cedula Fisica', 500930707, 'LOPEZ PORRAS GEORGINO', 'CURTIEMBRE LA PURRUJA', '<P> 16 C/M', '', ''),
(2670, 'Cedula Fisica', 104320828, 'LOPEZ PORRAS ROSA NEILLY', 'cenizo Laurel entrada principal', 'frente iglesia de Dios', '', ''),
(2671, 'Cedula Fisica', 104320828, 'LOPEZ PORRAS ROSA NEILLY', 'cenizo Laurel entrada principal', 'frente iglesia de Dios', '', ''),
(2672, 'Cedula Fisica', 661870232, 'LOPEZ QUIEL AURELIA', 'P Canoas  Cninamo fte Parqueo funda', 'dor.', '2732-1955', ''),
(2673, 'Cedula Fisica', 103330124, 'LOPEZ QUIROS ALCIDES', 'Puerto Jiménez. CaÑaza de pulp', 'de Juan hacia puerto Jimenez.', '', ''),
(2674, 'Cedula Fisica', 103330124, 'LOPEZ QUIROS ALCIDES', 'pto jimenez  cañaza pulperia', 'telefono administrado', '', ''),
(2675, 'Cedula Fisica', 103330124, 'LOPEZ QUIROS ALCIDES', 'PTO Jimenez  Cañaza Pulperia', 'telefono administrado', '', ''),
(2676, 'Cedula Fisica', 103330124, 'LOPEZ QUIROS ALCIDES.', 'CAÑAZA DE PUERTO JIMENEZ.', 'P.LOS 8 C/M.', '', ''),
(2677, 'Cedula Fisica', 103580786, 'LOPEZ QUIROS PORFIRIO', '', '', '', ''),
(2678, 'Cedula Fisica', 103580786, 'LOPEZ QUIROS PORFIRIO', 'NARANJO DE LAUREL 300 MTS ESTE G.AR', 'REPARACION DE LLANTAS', '', ''),
(2679, 'Cedula Fisica', 602910287, 'LOPEZ RAMIREZ MAINOR', 'SABALITO Bº INVU 150 M Oeste pulp', 'La Guaria ( se cobra en palmar )', '8336-0566', ''),
(2680, 'Cedula Fisica', 601490177, 'LOPEZ REYES WALTER SIMON.', 'RIO CLARO  DE LOS FUTBOLINES 50 MTS', 'AL NORTE CASA ESQUINERA SIN PINTAR', '', ''),
(2681, 'Cedula Fisica', 601300149, 'LOPEZ SALAS JOSE GUILLERMO', 'COTO 63 ULTIMA CASA DE ALTO', '¨( PALMERO )', '7898421', ''),
(2682, 'Cedula Fisica', 601300149, 'LOPEZ SALAS JOSE GUILLERMO', 'COTO 63 ÚLTIMA CASA DE ALTO', '** CANCELA PAGO DE PALMA **', '7898421', ''),
(2683, 'Cedula Fisica', 601610439, 'LOPEZ SALAZAR ALVIN', 'CIUDADELA 22 DE OCTUBRE FRENTE A LA', 'ESCUELA BLOQUE A#13 16Y2C/M.', '', ''),
(2684, 'Cedula Fisica', 601610439, 'LOPEZ SALAZAR ALVIN', 'CIUDADELA 22 DE OCTUBRE FRENTE A LA', 'ESCUELA BLOQUE A#13 16Y2C/M.', '', ''),
(2685, 'Cedula Fisica', 601610439, 'LOPEZ SALAZAR ALVIN', 'CIUDADELA 22 DE OCTUBRE FRENTE A LA', 'ESCUELA BLOQUE A#13 16Y2C/M.', '', ''),
(2686, 'Cedula Fisica', 601690821, 'LOPEZ SALAZAR ROSA NELLY', '', '', '', ''),
(2687, 'Cedula Fisica', 601690821, 'LOPEZ SALAZAR ROSA NELY', 'CIUDAD NEILY Bº 22 DE OCTUBRE', 'BLOQUE C Nº16 * CANCELA 30 C/MES *', '7834935', ''),
(2688, 'Cedula Fisica', 601020557, 'LOPEZ SEGURA ELI', 'MONTE VERDE DE IGLECIA ADVENT. 600', 'SUR ** PLAMERO **', '', ''),
(2689, 'Cedula Fisica', 601020557, 'LOPEZ SEGURA ELI', 'La Campiña  Monte Verde  800 sur', 'Iglesia Adventista.', '2780-1319', ''),
(2690, 'Cedula Fisica', 501680142, 'LOPEZ SEGURA ELIDER', 'SANTA LUSIA FRENTE A LA PULPERIA EL', 'PARQUESITO CASA COLOR PAPAYA', '2780-7047', ''),
(2691, 'Cedula Fisica', 502410005, 'LOPEZ SEGURA MARLENE', 'NARANJO LAUREL FRENTE A IGLECIA', 'ADVENTISTA', '2780-1617', ''),
(2692, 'Cedula Fisica', 601760273, 'LOPEZ SEQUEIRA DAVID', 'Cortes  San Buenas 250 mts sur', 'de la Iglesia', '', ''),
(2693, 'Cedula Fisica', 501150123, 'LOPEZ SILVA ADONIAS', 'La Gloria  ent a la Palma fte tajo', 'Corredores 500 m adentro.', '8898-8360', ''),
(2694, 'Cedula Fisica', 501150123, 'LOPEZ SILVA ADONIAS', 'La Gloria  ent a la palma 1 Km', 'Oeste 8898-8360', '', ''),
(2695, 'Cedula Fisica', 101920561, 'LOPEZ VARGAS DEUSDEDIT.', 'KILOMETRO 29 300 MTS SUR DE', 'LA ESCUELA.P.16 o 17 C/M.', '789', ''),
(2696, 'Cedula Fisica', 500930227, 'LOPEZ VILLEGAS ALICE', 'La Cuesta  La Palma  200 oeste Gua-', 'yacán. cliente paga 12 cuotas x año', '', ''),
(2697, 'Cedula Fisica', 105620592, 'LOPEZ ZUÑIGA ANA', 'Ciud. González 75 sur de la iglesia', 'casa Nº 12.', '2783-2654', ''),
(2698, 'Cedula Fisica', 502510866, 'LOPEZ ZUÑIGA GERARDO', 'LANGOSTINO DE PAVONES 400 MTS', 'ANTES DELA ESCUELA LINDA MAR', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(2699, 'Cedula Fisica', 502510866, 'LOPEZ ZUÑIGA GERARDO', 'Langostino de Pavones 400 m antes', 'de la Escuela Linda Mar.', '', ''),
(2700, 'Cedula Fisica', 602260137, 'LOPEZ ZUÑIGA ROSAURA', 'DE LA ESCU. AGUA BUENA 900 MTS', 'CARRETERA CAÑAS GORDAS 88982802', '2734-0094', ''),
(2701, 'Cedula Fisica', 603380228, 'LORIA CORDERO YESSENIA', 'Golfito  Km 5 detras de la laguna C', 'cemento verde c celeste 8611-1702', '8737-0312', ''),
(2702, 'Cedula Fisica', 500930723, 'LORIA LOPEZ CARLOS', 'CONTROL LA BRUJITA ULTIMA TIENDA', '', '', ''),
(2703, 'Cedula Fisica', 500930723, 'LORIA LOPEZ CARLOS', 'LA BRUJITA  ALMACEN GUANACASTE', '', '', ''),
(2704, 'Cedula Fisica', 500810147, 'LORIA LOPEZ JUAN BAUTISTA', 'Fca Alajuela  500 m Coopetriunfo.', 'Cel: 8960-6629.', '2741-1047', ''),
(2705, 'Cedula Fisica', 500390546, 'LORIA MATA ZULEMA', 'GOLFITO FRENTE AL JUSGADO PENAL', 'CASA A-4375 CONT AL BANCO NACIONAL', '', ''),
(2706, 'Cedula Fisica', 602260971, 'LORIA MATAMOROS JORGE EDUARDO', '', '', '', ''),
(2707, 'Cedula Fisica', 601140941, 'LORIA MORA ELIECER', 'FINCA ALAJUELA PULP. LORIA RAMIREZ', '<PAGA>EL 10 DE C/M', '', ''),
(2708, 'Cedula Fisica', 601140941, 'LORIA MORA ELIECER', 'FINCA ALAJUELA PULP  LORIA RAMIREZ', '', '', ''),
(2709, 'Cedula Fisica', 601300635, 'LORIA OVARES EDWIN', 'VILLA BONITA PULP EL GUABO', '<P> 06', '-', ''),
(2710, 'Cedula Fisica', 600630541, 'LOZADA RODRIGUEZ VICENTA', '', '', '', ''),
(2711, 'Cedula Fisica', 603400187, 'LOZANO SALAZAR ADRIANA', 'Golfito  Diagonal Bnaco Nacional', '', '7751931', ''),
(2712, 'Cedula Fisica', 609601011, 'LUNA JARA GABRIEL', '100MTS DE  LA IGLESIA', 'CASA COLOR ANARANJADA', '2783-2154', ''),
(2713, 'Cedula Fisica', 601460523, 'LUNA JARA MAYELA.', 'CIUDAD NEILLY CASA DE HENRY ELIZON-', 'DO 300 MTS ESTE DE LA ESCUELA', '', ''),
(2714, 'Cedula Fisica', 601150803, 'LUNA JARA ZAIDA', 'CIUDADELA EL TRIUNFO', 'PULPERIA LA LUNA', '7322783', ''),
(2715, 'Cedula Fisica', 602750760, 'MAC ALLISTER WHITVER JAN GORDON.', 'PUNTA ZANCUDO  200 MTS N. DE LA', 'PANADERIA EL MAR CASA DE ZOCALO', '7760091', ''),
(2716, 'Cedula Fisica', 501680923, 'MADRIGAL BARQUERO MIREYA', 'San Vito  frente a la Cruz Roja', '2773-4441', '8875-4274', ''),
(2717, 'Cedula Fisica', 603960051, 'MADRIGAL FERNADEZ JERLENY', 'CUIDADELA EL NARANJAL CASA', '*18', '8579-5094', ''),
(2718, 'Cedula Fisica', 601280841, 'MADRIGAL GODOY MARIA AUXILIADORA', 'GOLFITO LA BOLSA 3 casa', '', '7750580', ''),
(2719, 'Cedula Fisica', 601280841, 'MADRIGAL GODOY MARIA AUXILIADORA', 'GOLFITO LA BOLSA 3 casa', '', '7750580', ''),
(2720, 'Cedula Fisica', 501230970, 'MADRIGAL LOPEZ GERARDO.', 'LA ESPERANZA 600MTS OESTE Y 300 SUR', 'DE LA ESCUELA. P> 03 C/M', '', ''),
(2721, 'Cedula Fisica', 501230970, 'MADRIGAL LOPEZ GERARDO.', 'LA ESPERANZA 600MTS OESTE Y 300 SUR', 'DE LA ESCUELA. P> 03 C/M', '', ''),
(2722, 'Cedula Fisica', 501310496, 'MADRIGAL LOPEZ RAMON', 'LA AMPOLA CASA EN LA PLAYA FINCA DE', 'FRANCISCO CORRALES cel 8986-0016.', '', ''),
(2723, 'Cedula Fisica', 202380161, 'MADRIGAL MADRIGAL MARIA', 'ESPERANZA RIO CLARO. 400 Mts ANTES', 'DE CARMELO <P> 03 C/M', '*-*-*-*', ''),
(2724, 'Cedula Fisica', 600990037, 'MADRIGAL MUÑOZ FERNANDO.', 'GOLFITO  KILOMETRO UNO PULP ANGIE.', '', '', ''),
(2725, 'Cedula Fisica', 602810846, 'MADRIGAL PORRAS ANA JULIA', 'LA PALMA 100MTS ESTE DE LA TIENDA', 'ROXTY', '8510-5911', ''),
(2726, 'Cedula Fisica', 603030412, 'MADRIGAL PORTUGUES MARIA TERESA', 'LA VIRGEN BAR Y RESTAURANT', 'EL RANCHO', '7760095', ''),
(2727, 'Cedula Fisica', 103660380, 'MADRIGAL PORTUGUEZ ANTONIO.', 'CUATRO BOCAS DE LA CUESTA DEL TEMPL', 'EVANGELICO 200 MTS.N.CASA M/IZQUIER', '', ''),
(2728, 'Cedula Fisica', 103660380, 'MADRIGAL PORTUGUEZ ANTONIO.', 'CUATRO BOCAS DE LA CUESTA DEL TEMPL', 'EVANGELICO 200 MTS.N.CASA M/IZQUIER', '', ''),
(2729, 'Cedula Fisica', 601030123, 'MADRIGAL PORTUGUEZ GONZALO', 'CUATRO BOCAS KMT 25 ENTRADA X EL 25', 'CASA CONTIGUO A LA FABRICA', '', ''),
(2730, 'Cedula Fisica', 601030123, 'MADRIGAL PORTUGUEZ GONZALO', 'Cuatro Bocas  50 Mts N de Iglesia', 'Amarilla Prefabricada ', '8657-8129', ''),
(2731, 'Cedula Fisica', 104160109, 'MADRIGAL SANCHEZ MARLENE', 'PURRUJA CONTIGUO A LA CURTIEMBRE', 'COBRO EL DIA 16 Y 27 DE CADA MES.', '', ''),
(2732, 'Cedula Fisica', 601550085, 'MADRIGAL VEGA ROSA LIDIA', 'BEREH DE LAUREL CALLE A CARIARI', '** FECHA DE PAGO 08 CADA MES **', '7800589', ''),
(2733, 'Cedula Fisica', 104290343, 'MADRIZ RETANA GILBERTH', '', '', '', ''),
(2734, 'Cedula Fisica', 500550708, 'MALEAÑO MALEAÑO ROBERTO', 'COOPERATIVA INTEGRAL 1 KM AL OESTE', '', '', ''),
(2735, 'Cedula Fisica', 270975080, 'MALTES MARTINEZ FRANCISCO JOSE', 'R.CLARO  TALLER IDEAL MECANICA DE', 'PRESICION. P.02  C/M', '7899250', ''),
(2736, 'Cedula Fisica', 602500749, 'MARCHENA ALVAREZ LUCY', 'P jiménez  Urba San Lazaro  frte', 'al parquesito taller de costura', '7355530', ''),
(2737, 'Cedula Fisica', 603070160, 'MARCHENA BARAHONA MAUREN', 'Pto Jiménez  Bº Bambú. Bº Amistad', '2º casa.  LA GAMBA', '8957-1788', ''),
(2738, 'Cedula Fisica', 600700538, 'MARCHENA BEITA JOSE LUIS', 'KILOMETRO 37 DE LA ANTIGUA BODEGA', 'DE LA CANADRY 100 METROS SUR', '', ''),
(2739, 'Cedula Fisica', 600700538, 'MARCHENA BEITA JOSE LUIS', 'KM.36 CASAS DEL BANCO  COBRAR EN', 'PLANTEL DEL MOP EN RIO CLARO', '2789-9660', ''),
(2740, 'Cedula Fisica', 600670624, 'MARCHENA BEITA VICTOR MANUEL', 'Km37 La Gamba centro Abast Mayovit', 'cs celeste. Cel 8732-5633', '2741-8178', ''),
(2741, 'Cedula Fisica', 601640549, 'MARCHENA GOMEZ WILLIAM', 'C Neily  22 Octubre  Bloque C cs 15', '', '8851-8600', ''),
(2742, 'Cedula Fisica', 501080029, 'MARCHENA MARCHENA ANGEL', 'GOLF. INVU LA ROTONDA SAN JUAN', 'CONTG  IGLESIA DE CRISTO  P. 16 C/M', '*-*-*-*', ''),
(2743, 'Cedula Fisica', 601220104, 'MARCHENA MARCHENA JOSE.', 'GOLFITO BARRIO BELLA VISTA CASA Nº-', '4396 FTE CSA DE LAS MONJAS.P-16 C/M', '775', ''),
(2744, 'Cedula Fisica', 601220104, 'MARCHENA MARCHENA JOSE.', 'GOLFITO Bº BELLA VISTA CASA Nº4396', 'DEL PUENTE ENTRADA M.IZQ 2da CASA', '7751623', ''),
(2745, 'Cedula Fisica', 601270053, 'MARCHENA ROSALES ROSA IRIS', 'RIO CLARO  LAGARTO DE LOS ANGELES', 'EN BARRIO LOS ANGELES', '', ''),
(2746, 'Cedula Fisica', 601510152, 'MARCIA JARA JEANNETHE', 'C.CORTES CASA Nº 133 100M O.', 'DE PARQUE INFANTIL. 8 c/mes..', '', ''),
(2747, 'Cedula Fisica', 270611722, 'MARENCO MARENCO ANTONIO', 'AGRO INDUSTRIAL KMT 20 CASA DE', 'OLIMPIA MARENCO <P> 16 C/M', '', ''),
(2748, 'Cedula Fisica', 155804452, 'MARENCO MARENCO BLANCA NIEVES', 'R Claro El Ranchito  800 Mts Oeste', 'ultima Cs verde Madera ', '8558-7735', ''),
(2749, 'Cedula Fisica', 800530381, 'MARENCO MARENCO OLIMPIA', 'GOLF Kmt 20 3 Kmtros SUR Fca', 'AGROINDUSTRIAL <P> 02 C/M', '', ''),
(2750, 'Cedula Fisica', 800530381, 'MARENCO MARENCO OLIMPIA', 'Golfito  Km 20  Agroindustrial.', '', '8314-4611', ''),
(2751, 'Cedula Fisica', 800530381, 'MARENCO MARENCO OLIMPIA', 'Golfito  Km20  3km sur Fca Agroin-', 'dustrial.', '8314-4611', ''),
(2752, 'Cedula Fisica', 800670932, 'MARENCO SANDIGO VICTOR RONALDO', 'RIO CLARO BAMBEL 1 700MTS DE PULP.', 'EL JARDIN *FECHA DE PAGO 08 C/MES**', '7897819', ''),
(2753, 'Cedula Fisica', 501650068, 'MARIA FERNANDEZ BARRANTES', 'JIMENEZ CENTRO 8670-8964', '', '2735-5817', ''),
(2754, 'Cedula Fisica', 502310169, 'MARIN BRENES EDWIN', 'P Canoas  S Jorge  500m oeste abast', 'Isabel. Cel 8824-0412.', '2732-1368', ''),
(2755, 'Cedula Fisica', 900600152, 'MARIN CALDERON GERARDO', 'Laurel  Naranjo  Guardia civil 600', 'este. cs celeste. Cel 8780-1569.', '2780-0301', ''),
(2756, 'Cedula Fisica', 103930927, 'MARIN CALDERON LUZ', 'pto jimenez la palma taller ceibo', '', '', ''),
(2757, 'Cedula Fisica', 103930927, 'MARIN CALDERON LUZ', 'PUERTO JIMENEZ  LA PALMA EN', 'TALLER EL CEIBO', '', ''),
(2758, 'Cedula Fisica', 103930927, 'MARIN CALDERON LUZ', 'PUERTO JIMENEZ  LA PALMA EN', 'TALLER EL CEIBO', '', ''),
(2759, 'Cedula Fisica', 600930328, 'MARIN CASCANTE TOMAS ALBERTO', 'Bº parroquial cs4506 color verde.', '25N Bco Nac. Telf: 2775-1927.', '7751927', ''),
(2760, 'Cedula Fisica', 600930328, 'MARIN CASCANTE TOMAS.', 'GOLFITO  ESCUELA CENTRAL KM 1', 'RANCHILLOS CASA COLOR VERDE', '2775-1927', ''),
(2761, 'Cedula Fisica', 601750411, 'MARIN DURAN ROSSY', 'Rio Claro  calle del comercio ', 'sala de belleza Rossy.', '2789-9057', ''),
(2762, 'Cedula Fisica', 601750411, 'MARIN DURAN ROSSY', 'Rio Claro  De las oficinas Tracopa ', 'Sala de belleza Rossy. 8827-0491.', '2789-9057', ''),
(2763, 'Cedula Fisica', 104390323, 'MARIN ESPINOZA OFELIA', 'R Claro  Bº Santiago  125m Noroeste', 'Cel 8622-6163.', '2789-8147', ''),
(2764, 'Cedula Fisica', 900700320, 'MARIN GODINEZ GABRIEL', 'PALMAR NORTE Bº 1 MARZO ULTIMA FILA', 'FILA 1º CASA', '', ''),
(2765, 'Cedula Fisica', 601500940, 'MARIN JIMENEZ GUMERCINDA', 'CIUDADELA GONZALEZ DETRAS DE PULP', 'EL JARDIN.', '', ''),
(2766, 'Cedula Fisica', 600910484, 'MARIN MADRIGAL JEANNETTE', 'B` LOS ALAMEDOS  CABINAS EL MANGLAR', 'GOLFITO. HOSP. RAYOS X', '750510', ''),
(2767, 'Cedula Fisica', 103000091, 'MARIN MESEN EZEQUIEL', 'CENTRAL CAMPESINA D LA IGLESIA', 'EVANGELICA 75MTS AL SUR ALTO MADERA', '2781-1164', ''),
(2768, 'Cedula Fisica', 500340853, 'MARIN MURILLO MIGUEL', 'PAVONES  CUERVITO DE ESCUELA 400 MT', 'HACIA PLAYA 1er C. A DERCH 13 C/M', '', ''),
(2769, 'Cedula Fisica', 500340853, 'MARIN MURILLO MIGUEL', 'PAVONES  CUERVITO DE ESCUELA 400 MT', 'HACIA PLAYA 1er C. A DERCH 13 C/M', '', ''),
(2770, 'Cedula Fisica', 500650807, 'MARIN OSES SIMEON', 'LA CAMPIÑA  1-1/2 KMT DE LA', 'ESCUELA LOCAL', '', ''),
(2771, 'Cedula Fisica', 800470994, 'MARIN ROJAS LILLIAM', 'La Cuesta  contiguo al cementerio ', 'cc verde.', '8940-2241', ''),
(2772, 'Cedula Fisica', 600670160, 'MARIN UREÑA JUAN', 'CENIZO 300 MTS ANTES DE LA IGLESIA', 'EVANGELICA', '7800287', ''),
(2773, 'Cedula Fisica', 601560070, 'MARIN UREÑA VICTOR MANUEL', '', '', '', ''),
(2774, 'Cedula Fisica', 502360208, 'MARTINEZ ALPIZAR MARILU', 'COTO 47 CONTG. AL EXPENDIO 75 MTS', 'NORTE CASA Nº 12343 COBRAR 2 C/MES', '', ''),
(2775, 'Cedula Fisica', 502360208, 'MARTINEZ ALPIZAR MARILU', 'COTO 47 CONTG. AL EXPENDIO 75 MTS', 'NORTE CASA Nº 12343 COBRAR 2 C/MES', '7811029', ''),
(2776, 'Cedula Fisica', 601950135, 'MARTINEZ ANGULO OLIDIER', 'COMANDO DE GOLFITO <P> 03 Y 16 C/M', '', '*-*-*-*', ''),
(2777, 'Cedula Fisica', 601360982, 'MARTINEZ ARAUZ ENEIDA', 'LA CUESTA  LA PALMA SODA KATERIN', 'FRENTE A LA ESCUELA', '', ''),
(2778, 'Cedula Fisica', 601360982, 'MARTINEZ ARAUZ ENEIDA', 'LA PALMA DE LA CUESTA FRENTE ALA ES', 'CUELA ESCUELA', '8896888', ''),
(2779, 'Cedula Fisica', 602120020, 'MARTINEZ ARROYO BELLANIRA', 'C. CORTES CAMINO A BALSAR', 'CANCELA  8 C/MES', '7888718', ''),
(2780, 'Cedula Fisica', 501381357, 'MARTINEZ CARAVACA JOSE ANGEL', 'Laurel  El Invu  casa 16.', '', '', ''),
(2781, 'Cedula Fisica', 159100082, 'MARTINEZ CASTILLO ESTEBAN', 'Plaza entr de Univer HUACA adentro', 'Kiosco La Fe parada taxis ROJOS', '-', ''),
(2782, 'Cedula Fisica', 601220083, 'MARTINEZ CATON ROSMERY.', 'GOLFITO INVU LA ROTONDA CONT. TALLE', 'CEDRIC 1 C/M', '7750633', ''),
(2783, 'Cedula Fisica', 602160727, 'MARTINEZ FLETES MANUEL', 'Golfito  Res Ureña  300m MI de co-', 'mandos cs celeste. 8855-4466.', '2775-0867', ''),
(2784, 'Cedula Fisica', 121310187, 'MARTINEZ GONZALEZ ARACELLY', 'Drake Agujitas Restaurante Jademar.', 'Cel 5710-5161.', '2775-1919', ''),
(2785, 'Cedula Fisica', 201730376, 'MARTINEZ HERNANDEZ MARIA ALBERTINA', 'RIO CLARO LAGARTO Bº LOS ANGELES', 'CANCELA 1 CADA MES', '7897512', ''),
(2786, 'Cedula Fisica', 602820850, 'MARTINEZ JIMENEZ VICTOR', 'C. Neily Bº la Unión Lavacar el Bos', 'que.', '8766-1778', ''),
(2787, 'Cedula Fisica', 600350291, 'MARTINEZ LEZCANO REYES DOMINGA', 'RIO CLARO Bº LA LUCHA DE LAGARTO', '', '', ''),
(2788, 'Cedula Fisica', 900780217, 'MARTINEZ LORIA ELIZABETH', 'C Neily S Rafael;Antigua pulp. Los', 'Naranjos. Cel 8968-8115.', '2783-2625', ''),
(2789, 'Cedula Fisica', 600810667, 'MARTINEZ MARTINEZ BENIGNA CC NENA', 'P Norte  Bº Alemania  casa Nº3', '', '8978-1061', ''),
(2790, 'Cedula Fisica', 601570989, 'MARTINEZ MARTINEZ DELCITO', 'Laurel Bambito 250m N de la Escuela', 'cs rosada.', '2780-1134', ''),
(2791, 'Cedula Fisica', 600830539, 'MARTINEZ MARTINEZ EZEQUIEL', 'GOLFITO  KMT 1 LA BOLSA DEL PUENTE', '4ta CASA A MANO IZQ CASA Nº 4132', '7750963', ''),
(2792, 'Cedula Fisica', 600830539, 'MARTINEZ MARTINEZ EZEQUIEL', 'GOLFITO  KMT 1 LA BOLSA DEL PUENTE', '4ta CASA A MANO IZQ CASA Nº 4132', '7750963', ''),
(2793, 'Cedula Fisica', 600830539, 'MARTINEZ MARTINEZ EZEQUIEL', 'Golfito Km1 Ent La Bolsa  1º puente', '3º cs MI.', '2775-0963', ''),
(2794, 'Cedula Fisica', 502550194, 'MARTINEZ MARTINEZ PEDRO SANTO', 'EL JARDIN DE CONTE CASA EN EL CERRO', 'AL FRTE DE MAGALY EXEMPLEDA ALFA OM', '', ''),
(2795, 'Cedula Fisica', 502550194, 'MARTINEZ MARTINEZ PEDRO SANTO', 'EL JARDIN DE CONTE CASA EN EL CERRO', 'AL FRTE DE MAGALY EXEMPLEDA ALFA OM', '', ''),
(2796, 'Cedula Fisica', 600820775, 'MARTINEZ MARTINEZ ZULAY', 'Paso Canoas  Las Brigadas detrás de', 'la Gallinera.', '', ''),
(2797, 'Cedula Fisica', 105160328, 'MARTINEZ MEJIA MARTA', '', '', '', ''),
(2798, 'Cedula Fisica', 270318781, 'MARTINEZ MENA ANTONIO', 'PALMAR SUR COSTADO ESTE DEL PARQUE', 'CASA AMARILLA FTE MANZANO', '7867939', ''),
(2799, 'Cedula Fisica', 600730806, 'MARTINEZ MENDOZA CESILIO.', 'GOLFITO  Bº KMT UNO LA BOLSA CASA', '4185  P. 18 Y 27 C/M', '', ''),
(2800, 'Cedula Fisica', 159100191, 'MARTINEZ MONTENEGRO ROSA LILIA', 'Paso canoas de entrad igles adventi', '150 al Oeste Cs anaranjada ', '2732-2137', ''),
(2801, 'Cedula Fisica', 800420205, 'MARTINEZ ORDEÑANA SONIA ELENA', 'Paso Canoas  Agencia de aduana la', 'Frontera  contiguo a la aduana.', '', ''),
(2802, 'Cedula Fisica', 800490792, 'MARTINEZ PEÑA CLETO MARCELINO', 'LA CUESTA DETRAS DE LA IGLESIA', 'TESTIGOS DE JEHOVA', '', ''),
(2803, 'Cedula Fisica', 601920519, 'MARTINEZ RIOS AURELIA', 'La cuesta  Fte a Testigos de Jehová', '', '2732-2348', ''),
(2804, 'Cedula Fisica', 601390750, 'MARTINEZ SANCHEZ LEONICIA', 'colorado 600 Mts Oeste de la esc', 'pulp Las Palmas <p> 30 c/m', '', ''),
(2805, 'Cedula Fisica', 601390750, 'MARTINEZ SANCHEZ LEONICIA', 'Veracruz  Bº Nuevo  cont a Escuela', 'Cel 8319-4630.', '2732-2268', ''),
(2806, 'Cedula Fisica', 601360991, 'MARTINEZ SEQUEIRA CLEOTILDE', 'Ciudad Neily  Barrio San Rafael; 20', 'm las cavernas.', '7835043', ''),
(2807, 'Cedula Fisica', 602710595, 'MARTINEZ VIGIL BIENVENIDO', 'COLORADO DEL PUENTE LA LEONA 100M S', 'UR *** CANCELA PALMEROS ***', '3391121', ''),
(2808, 'Cedula Fisica', 602710595, 'MARTINEZ VIGIL BIENVENIDO', 'Colorado 100 m Sur Puente la Leona', '', '8949-3396', ''),
(2809, 'Cedula Fisica', 601990883, 'MARTINEZ VIGIL ELIZABETH', 'P Canoas Colorado cruce 4 bocas cs', 'esquinero.', '8671-3357', ''),
(2810, 'Cedula Fisica', 400379956, 'MASIS MASIS ANGELICA', 'Km 37 de la Escuela 50 mts Este', 'casa esquinera color natural.', '', ''),
(2811, 'Cedula Fisica', 102300049, 'MASIS MASIS MANUEL', 'BEREH DE LAUREL ANTES DE LA PESA DE', 'EBASA', '2780-0222', ''),
(2812, 'Cedula Fisica', 102300049, 'MASIS MASIS MANUEL ANTONIO', 'VEHERE UN KMT SUR DE LA', 'ESCUELA LOCAL', '', ''),
(2813, 'Cedula Fisica', 102300049, 'MASIS MASIS MANUEL ANTONIO', 'BEREH DE LAUREL CONTIG AL PUENTE', '** FECHA DE PAGO 10 C/MES **', '7800222', ''),
(2814, 'Cedula Fisica', 601370682, 'MASIS MASIS MANUEL ANTONIO.', 'BERE  EN EL CRUZE O ESCUELA CAIMITO', 'PAGA EL 30 c/m', '', ''),
(2815, 'Cedula Fisica', 101480437, 'MASIS MASIS RAMON', 'CIUDAD NEILY  Bº EL PROGRESO', 'PAGA DESPUES DEL 20 C/MES', '', ''),
(2816, 'Cedula Fisica', 103350140, 'MATA MATA HERNAN', 'La Cuesta  Pueblo Nuevo  800m entra', 'da casa amarilla.', '2732-1441', ''),
(2817, 'Cedula Fisica', 104560459, 'MATA MATA VICTOR JULIO', 'El Carmen Abrojo Digonal Asambleas', 'de Dios o Maderín.', '2783-2000', ''),
(2818, 'Cedula Fisica', 602860859, 'MATA PALMA MARTHA PAULINA', 'Golf Bº bella vista CNº 4213 verjas', 'con palomas X antg CNP 8663-3835', '2775-1363', ''),
(2819, 'Cedula Fisica', 900670482, 'MATA PICADO RAFAELA', 'GOLFITO Kmt 20 150 Mts DE PULP', 'GAVIOTA <P> 09 C/M\'', '', ''),
(2820, 'Cedula Fisica', 601820961, 'MATARRITA ABARCA FREDDY', 'SANTA LUCIA  DE LA VACA 2 KMTS', 'NORTE DE LA ESCUELA', '', ''),
(2821, 'Cedula Fisica', 501430030, 'MATARRITA ALVAREZ JOSE ANGEL', '', '', '', ''),
(2822, 'Cedula Fisica', 603410176, 'MATARRITA AMAYA BRIAN', 'Golfito  Res Ureña  100m oeste del', 'Parque  cs F2. 8942-3918 8790-9448', '2775-2412', ''),
(2823, 'Cedula Fisica', 602800477, 'MATARRITA BRIONES DELIA', 'LA CAMPIÑA FTE. LA IGLECIA', '', '', ''),
(2824, 'Cedula Fisica', 601010968, 'MATARRITA CARRILLO CARMEN', 'Coto 54  El Gorrión.', '', '8578-0726', ''),
(2825, 'Cedula Fisica', 501361246, 'MATARRITA CASTRILLO SOCORRO', 'LA VAQUITA KMT 29 ENTRADA FRENTE A-', 'ESCUELA COTO SURPALMERO', '7800173', ''),
(2826, 'Cedula Fisica', 501361246, 'MATARRITA CASTRILLO SOCORRO.', 'LA VAQUITA KMT 29 ENTRADA FRENTE A-', 'ESCUELA COTO SUR.P.15 C/M.', '', ''),
(2827, 'Cedula Fisica', 500740728, 'MATARRITA GUTIERREZ ALADINO', 'VENECIA DETRAS DE PELP TICOMEC', 'CALLE A PALMA NORTE', '', ''),
(2828, 'Cedula Fisica', 502620002, 'MATARRITA LOPEZ MARIA', 'campiña.600mts sur de la escuela de', 'la localidad', '2776-6029', ''),
(2829, 'Cedula Fisica', 501600007, 'MATARRITA MATARRITA JOSE ENRIQUE.', 'Comte  Soda la Morena', 'telefono  27768287.', '2776827', ''),
(2830, 'Cedula Fisica', 600710400, 'MATARRITA MEDINA ARTEMIDA', 'El Ñeque  Sala de Belleza Mary.', 'Urba el Cole.', '8832-3055', ''),
(2831, 'Cedula Fisica', 501230236, 'MATARRITA ROSALES FRANCISCO', 'Laurel  Caracol de la vaca 300 Mts', 'despues de la Esc  2783- 8026', '2783-8026', ''),
(2832, 'Cedula Fisica', 501130303, 'MATARRITA SANCHEZ MARIO', 'BARRIO ALEMANIA DE PALMAR.', '<P>19 C/M.', '', ''),
(2833, 'Cedula Fisica', 601220011, 'MAYORGA CAMPOS MARINA', 'RIO CLARO  LAGARTO', '** FECHA DE PAGO 1 CADA MES **', '', ''),
(2834, 'Cedula Fisica', 601220011, 'MAYORGA CAMPOS MARINA', 'LAGARTO DE RIO CLARO  DE LA', '1ERA PULPERIA  50 MTRS NORTE', '7892316', ''),
(2835, 'Cedula Fisica', 602510971, 'MAYORGA CAMPOS MARJORIE', 'RIO CLARO  LAGARTO  DE PRIMER PULPE', 'TERCERA CASA.', '2765-2876', ''),
(2836, 'Cedula Fisica', 602310646, 'MAYORGA LEZCANO MARIANELA', 'D` LA G.A.R. D`NARANJO LAUREL 1 Kmt', 'AL NORTE <P> 30 C/M', '', ''),
(2837, 'Cedula Fisica', 270506612, 'MAYORGA MARTINEZ MIGUEL', 'GOLFITO Bº MEXICO DE LA ENTRADA', 'A LA URBA 50 M.NORTE. M.IQUIER C.BL', '', ''),
(2838, 'Cedula Fisica', 600610868, 'MAYORGA NOVOA CONCEPCION', 'golfito llano bonito ciudadela', 'oasis casa n. 79', '7751857', ''),
(2839, 'Cedula Fisica', 601210079, 'MAYORGA VASQUEZ SARA', 'LA MONA KMT 12 2da ENTRADA PAVIMENT', 'CASA ESQUINERA COLOR AMARILLO', '7751880', ''),
(2840, 'Cedula Fisica', 601210079, 'MAYORGA VASQUEZ SARA', 'La Mona  2 entrada enfermera.', 'telefonos 27756232 88699726', '8699726', ''),
(2841, 'Cedula Fisica', 600670332, 'MEDIANERO SANCHEZ JUANA', 'LA CUESTA  200 MTS DEL COLEGIO', '', '', ''),
(2842, 'Cedula Fisica', 600670332, 'MEDIANERO SANCHEZ JUANA', 'La Cuesta 200mts del Colegio.', '', '7322875', ''),
(2843, 'Cedula Fisica', 500770206, 'MEDINA CRUZ PLUTARCO', 'PALMAR NORTE FRENTE A SILOS BAR POR', 'EL CEMENTERIO.', '', ''),
(2844, 'Cedula Fisica', 500860339, 'MEDINA FONSECA HELIODORO C.C. LOLO', 'FINCA 2-4 FRENTE AL COMISARIATO', 'CANCELA LOS 8 /C/MES', '', ''),
(2845, 'Cedula Fisica', 601081121, 'MEDINA GAMBOA CARMEN.', 'RIO CLARO.', '', '', ''),
(2846, 'Cedula Fisica', 601081121, 'MEDINA GAMBOA CARMEN.', 'RIO CLARO.', '', '', ''),
(2847, 'Cedula Fisica', 501140278, 'MEDINA GOMEZ CELESTINO CC BERNAL', 'Sierpe   Pueblo Nuevo   Pulp la Nueva', '100 Norte 50 Este.', '8761-0571', ''),
(2848, 'Cedula Fisica', 112690169, 'MEDINA JIMENEZ JOSE GABRIEL', 'URBA LOS CERRITOS CASA *1', '89892316', '8548-6299', ''),
(2849, 'Cedula Fisica', 302790884, 'MEDINA LOPEZ SEIDY JOHANNA', 'LA ESPERANZA DE GOLFITO   100 MTS.', 'MANO IZQUIERDA DE BAR EL RETORNO', '7751740', ''),
(2850, 'Cedula Fisica', 602190625, 'MEDINA LOPEZ SINAI', 'PUERTO JIMENEZ   100 METROS SUR DE', 'LA BOMBA DE OSA', '7355406', ''),
(2851, 'Cedula Fisica', 602190625, 'MEDINA LOPEZ SINAI', 'P Jiménez  50 S 50 O de Gasolinera.', 'Cel 8832-9618.  27355396.', '2735-5406', ''),
(2852, 'Cedula Fisica', 602320158, 'MEDINA PEREIRA MARIELOS', 'P Jiménez  La Palma 100 E de la Guar', 'dia. Cel 8476-9603   8445-2683.', '2735-1045', ''),
(2853, 'Cedula Fisica', 800460570, 'MEDINA SABALLOS PEDRO', 'CENTRAL CAMPESINA CONTIGUO A LA', 'PULPERIA LA CENTRAL CASA DE 2 PISOS', '2781-1361', ''),
(2854, 'Cedula Fisica', 501500612, 'MEDRANO HERNANDEZ WILLIAM', 'CIUDAD NEILY.', 'Bº CAPRI.', '783', ''),
(2855, 'Cedula Fisica', 103500214, 'MEJIA ARGUELLO JOSE', 'Kmt 37 400 Mts AL NORTE <P> EN', 'OFICINA.', '', ''),
(2856, 'Cedula Fisica', 900280289, 'MEJIA ESPINOZA JUSTINA.', 'GOLFITO kilometro 1 ENTARADA A LA', 'BOLSA FRENTE A LA CASA DEL NIÑO.', '7751727', ''),
(2857, 'Cedula Fisica', 201930110, 'MEJIA HOSHANY MARIO', 'NARANJO DE LA CUESTA   PULPERIA', 'LA VAQUITA', '', ''),
(2858, 'Cedula Fisica', 900510524, 'MEJIA ROMERO JULIA', 'Paso Canoas   Bº S. Jorge 150 m este', 'Iglesia Metodista.', '7321371', ''),
(2859, 'Cedula Fisica', 101313440, 'MEJIA SOLIS LIBETH', 'rio claro   costado este de la', 'escuela central.', '9515687', ''),
(2860, 'Cedula Fisica', 220111746, 'MEJIA SOLORZANO LORENA', 'LA CUESTA D`LA PLAZA 300 Mts ESTE', 'ENTRADA OLMOZ NEGRO <P> 30 C/M', '', ''),
(2861, 'Cedula Fisica', 201930110, 'MEJIAS HOSHONY MARIO', 'CONTIG PUENTE LA VACA PULP LA', 'VACA <P> 30 C/M', '732', ''),
(2862, 'Cedula Fisica', 500620905, 'MEJIAS SIBAJA JOSE', 'Dos brasas de rincon de guadalupe  ', 'la palma de pto jimenez.', '7351353', ''),
(2863, 'Cedula Fisica', 501570886, 'MEJIAS VILLALOBOS SANTANA', 'F.C.A. PUNTARENAS ESQUINA DE LA', 'PLAZA', '', ''),
(2864, 'Cedula Fisica', 602640843, 'MELENDEZ BLANCO IRMA', 'LA MONA 50 MTS DE BAR LA RUEDA', 'CARRETERA A GOLFITO', '', ''),
(2865, 'Cedula Fisica', 104350834, 'MELENDEZ CASTILLO ELBA', 'Golfito  B Vista  contiguo al antiguo', 'CNP. casa 4213. Cel 8983-7955.', '2775-1197', ''),
(2866, 'Cedula Fisica', 602470805, 'MELENDEZ CUBILLO EDUARDO', 'COSTADO ESTE DE LA IGLESIA CATOLICA', 'CASA COLOR VERDE CON CAFE', '8685-5219', ''),
(2867, 'Cedula Fisica', 601980457, 'MELENDEZ DINARTE XINIA', 'San Vito   Linda Vista cost pulp la', 'Flor   Cs Gris    2773-4172', '8946-8772', ''),
(2868, 'Cedula Fisica', 107270046, 'MELENDEZ JIMENEZ ROXANA', 'Laurel  Urb Saíno  Cs 16.', 'Trab. en la Cuesta Soda Buen Gusto', '', ''),
(2869, 'Cedula Fisica', 602510626, 'MELENDEZ OBANDO JORGE', 'La Cuesta   contiguo al Tajo.', '', '2732-1165', ''),
(2870, 'Cedula Fisica', 601860945, 'MELENDEZ SALAZAR NURIA', 'La Cuesta   calle al chorro   2km de', 'la Guardia.', '2732-1165', ''),
(2871, 'Cedula Fisica', 102390081, 'MELENDEZ SANDI RAFAEL CC FELO', 'C Cortés   Bº San Antonio   75m oeste', '300 norte Panadería Naime.', '2788-8926', ''),
(2872, 'Cedula Fisica', 602480479, 'MELENDEZ SEQUEIRA CLARIBETH', 'NARANJO 400 Mts ANTES DE GAR', '<P> 30 C/M', '', ''),
(2873, 'Cedula Fisica', 102150855, 'MELGADO VALVERDE PAULINO', 'km37 DE ABAST. ABANGARES 700MTS', 'CARRETARA A SAN MIGUEL.', '', ''),
(2874, 'Cedula Fisica', 601390184, 'MENA BRICEÑA RIGOBERTO', 'R Claro  cont a Veterinaria Herbecan', 'x delegac. a izq casa rosada.', '2789-7872', ''),
(2875, 'Cedula Fisica', 601390184, 'MENA BRICEÑO RIGOBERTO', 'RIO CLARO 25MTS DE SUPER CARNES', '** FECHA DE PAGO 2 C/MES **', '7897205', ''),
(2876, 'Cedula Fisica', 601390184, 'MENA BRICEÑO RIGOBERTO', 'R Claro cont Veterin. Herbecan x de', 'legac. MI cs rosada. 8811-8557.', '2789-7872', ''),
(2877, 'Cedula Fisica', 601390184, 'MENA BRICEÑO RIGOBERTO', 'R Claro cont Veterin. Herbecan x de', 'legac. MI cs rosada. 8811-8557.', '2789-7872', ''),
(2878, 'Cedula Fisica', 600960591, 'MENA CAMACHO IRENE', 'LA CUESTA   DE ASASAMBLEAS DE DIOS', '200 MTS OESTE.', '-', ''),
(2879, 'Cedula Fisica', 104090202, 'MENA CAMACHO NORIEL DR.', 'LA CUESTA DIAG. A LA ESCUELA.', '', '', ''),
(2880, 'Cedula Fisica', 602470864, 'MENA CASTILLO AZALIA', 'Sabalito Bº Los Pinos 300 E de Esc', 'Cs verde verjas blancas  ', '8400-6644', ''),
(2881, 'Cedula Fisica', 602210241, 'MENA CASTILLO FRANKLIN', 'Barrio Renacimiento casa I-4', '', '2788-8701', ''),
(2882, 'Cedula Fisica', 105680709, 'MENA CASTRO ROSE MARY', 'S Vito   La Alborada   contiguo escue', 'la Kennedy. 8872-0028  2773-4087.', '2773-4153', ''),
(2883, 'Cedula Fisica', 104300549, 'MENA ESQUIVEL AIDEE', 'Bº SAN JUAN GOLF 1º CASA DESPUES DE', 'PUENTE <P> 16 C/M', '*-*-*-*', ''),
(2884, 'Cedula Fisica', 602350058, 'MENA ESQUIVEL MARIA DEL CARMEN', 'GOLFITO   KMT 5 EN PULP ABASTECEDOR', 'LAS BRISAS.', '7751158', ''),
(2885, 'Cedula Fisica', 602350958, 'MENA ESQUIVEL MARIA DEL CARMEN', 'GOLFITO EL CIVIL', '', '8841541', ''),
(2886, 'Cedula Fisica', 601200357, 'MENA GOMEZ MARTHA', 'SAN VITO   ENTRADA Bº LOS MURILLO', 'FRT A FINCA LAS ESTRELLAS SAN VITO', '7734413', ''),
(2887, 'Cedula Fisica', 102140250, 'MENA GUILLEN JOSE', 'CIUDADELA GONZALEZ FRENTE A LA', 'CASA DE ALTO', '', ''),
(2888, 'Cedula Fisica', 600570452, 'MENA MENA ISRAEL', 'RIO CLARO ASENTAMIENTO LOS MANGOS', 'FTE AL TAJO * CANCELA 6 CADA MES **', '7897395', ''),
(2889, 'Cedula Fisica', 104000541, 'MENA MENA MANUELA', 'GOLFITO Bº EL UNO 2ª CASA 4451 LADO', 'ATRAS DETRAS DEL HOTEL TUCM', '7751673', ''),
(2890, 'Cedula Fisica', 104930162, 'MENA MORA Mª DEL CARMEN', 'Pto ESCONDIDO ABASTECEDOR CARLOS', 'ALBERTO <P> 11 C/M', '', ''),
(2891, 'Cedula Fisica', 110090200, 'MENA MURILLO DEYNER', '', '', '', ''),
(2892, 'Cedula Fisica', 603600468, 'MENA ORIAS MAGDIEL', 'RIO CLARO SAN RAMON URBA EL ESFUERZ', 'O CASA 33 83162090', '2789-7459', ''),
(2893, 'Cedula Fisica', 103990036, 'MENA QUIROS SARA MARIA', 'CIUDAD CORTES B. EL RENACIMIENTO', 'EN PULPERIA', '3741215', ''),
(2894, 'Cedula Fisica', 601040507, 'MENA REDONDO MARCOS', 'RIO BONITO   DE LA ESCUELA 1500 Mts', 'NORTE <P> 15 Y 30 C/M', '*-*-*-*', ''),
(2895, 'Cedula Fisica', 601750187, 'MENA RETANA SONIA', 'Coto 49  Pulp. Mary 3º casa Nº 12435', 'C Neily   Fte Lavacar El bosque.', '8977-8541', ''),
(2896, 'Cedula Fisica', 102980252, 'MENA RIOS ADAN', 'Coto 49 un costado de plaza   cs de', '2 pisos verde del fondo. cel 8613-4', '2781-1470', ''),
(2897, 'Cedula Fisica', 102980252, 'MENA RIOS ADAN.', 'COTO 49  A UN COSTADO DE LA PLAZA.', '', '', ''),
(2898, 'Cedula Fisica', 102190877, 'MENA VARGAS GUILLERMO', '', '', '', ''),
(2899, 'Cedula Fisica', 102480708, 'MENA VEGA AIDA C.C. CHINA', 'Cortes Precario   bulevar c.No 9', 'contiguo a pulp Maria', '7887004', ''),
(2900, 'Cedula Fisica', 109400204, 'MENCIO CAMACHO GAUDI', 'UVITA BAHIA BALLENA CABINAS GATO', '400MTS NORTE Y 50 AL SUR', '8648-2593', ''),
(2901, 'Cedula Fisica', 602460588, 'MENDEZ ALVAREZ  GEOVANNY', 'LA BOTA DE LA CUESTA...', 'CANCELA  15 C/MES **', '8906413', ''),
(2902, 'Cedula Fisica', 104970763, 'MENDEZ AMADOR MISAEL', 'LA CUESTA   CARRETERA AL CHORRO POR', 'EL CEMTERIO 2da CASA DESP PUENTE', '', ''),
(2903, 'Cedula Fisica', 302060903, 'MENDEZ ARIAS RAFAEL ANGEL', 'P Zeledón  La Hermosa  75 S 50 O de', 'la cancha.', '8336-1028', ''),
(2904, 'Cedula Fisica', 603450739, 'MENDEZ CESPEDES VIRGINIA', 'P Jiménez  Agujas  Bº Bonito  Pulpería', 'Karlen.', '8994-5059', ''),
(2905, 'Cedula Fisica', 603230375, 'MENDEZ CHAVARRIA VICTOR HUGO', 'PUERTO JIMENEZ   SODA KATTY', '', '7355589', ''),
(2906, 'Cedula Fisica', 603230375, 'MENDEZ CHAVARRIA VICTOR HUGO', 'Pto Jimenez   diagonal al colegio', '', '', ''),
(2907, 'Cedula Fisica', 900650504, 'MENDEZ IBARRA TERESA', 'GOLFITO INVU LA ROTONDA O EN HOTEL', 'SIERRA <P> 03 Y 16 C/M', '7750666', ''),
(2908, 'Cedula Fisica', 900650504, 'MENDEZ IBARRA TERESA', 'golfito invu la rotonda o en', 'hotel sierra', '7750666', ''),
(2909, 'Cedula Fisica', 900650504, 'MENDEZ IBARRA TERESA', 'GOLFITO LA ROTONDA CONTG. A CICLO', 'Trabaja en el EBAIS.', '2775-5225', ''),
(2910, 'Cedula Fisica', 601110168, 'MENDEZ JIMENEZ ABEL', 'CIUDAD NEILLY   EL CEIBO   DIAGONAL', 'AL CNP', '8764-1728', ''),
(2911, 'Cedula Fisica', 601110168, 'MENDEZ JIMENEZ ABEL PAULINO', 'COTO 52 CASA Nº 1538 75 MTS NORTE', 'DE PULPERIA* FECHA DE PAGO 30 C/MES', '7811146', ''),
(2912, 'Cedula Fisica', 900330245, 'MENDEZ JIMENEZ CONSUELO', '', '', '', ''),
(2913, 'Cedula Fisica', 600470118, 'MENDEZ MENDEZ RAFAEL', 'Control de la Cuesta; frente a en', 'trada a la bota.', '', ''),
(2914, 'Cedula Fisica', 603580605, 'MENDEZ MOYA LUIS ALFREDO', 'S Vito   250 M Ost   de la escuela', 'El Danto   8530-4616', '8764-9562', ''),
(2915, 'Cedula Fisica', 603180258, 'MENDEZ PADILLA YAMILETH', 'Bº orotina la Isla 100 M Este Casa', 'de alto Blanca   paga solo  A Y A', '8595-1302', ''),
(2916, 'Cedula Fisica', 501450968, 'MENDEZ RAMIREZ ALEJANDRO', 'Copa Buena   Entrada a S Gabriel 50m', 'Cel 8730-6962.', '2734-0007', ''),
(2917, 'Cedula Fisica', 601630371, 'MENDEZ SEQUEIRA MARCOS', 'Control de la Cuesta   de la pulp', 'a la Brujita 1 kmt calle a la Cuest', '', ''),
(2918, 'Cedula Fisica', 502790046, 'MENDEZ SIBAJA ELIZABETH', 'Golfito Hosp FTE A ESC. CENTRAL Bº', 'BELLA VISTA CASA 4211 FTE C.N.P.', '750060', ''),
(2919, 'Cedula Fisica', 102000181, 'MENDEZ VEGA ERNESTO', 'GOLFITO   KMT 20 ENTRADA AGROINDUSTR', 'TRIAL LA QUEBRADA', '', ''),
(2920, 'Cedula Fisica', 102000181, 'MENDEZ VEGA ERNESTO', 'Golfito  Km 20  Ent industrial cruzan', 'do el cs 2 pisos. cel 8828-5973.', '8847-0152', ''),
(2921, 'Cedula Fisica', 105250762, 'MENDEZ ZUÑIGA CRISTINA', 'CARTAGO SAN RAFAEL DE OREAMUNO', '100SUR 25ESTE DE MUNICIPALIDAD', '5519197', ''),
(2922, 'Cedula Fisica', 602232953, 'MENDIOLA MENDIOLA PAULA', 'Sierpe   Pueblo Nuevo   contiguo a ta', 'ller fuera de borda.', '2788-1334', ''),
(2923, 'Cedula Fisica', 206330836, 'MENDOZA BARRANTES DAVID', 'GOLFO LLANO BONITO OASIS DE ESPERAN', 'ZA CARRETERA A CACAO CASA *10', '8629-1994', ''),
(2924, 'Cedula Fisica', 800710518, 'MENDOZA DINARTE ANGELA DEL SOCORRO', 'PASO CANOAS DE PULP LA TICA 150 MTS', 'ESTE.', '', ''),
(2925, 'Cedula Fisica', 800710518, 'MENDOZA DINARTE ANGELA DEL SOCORRO', 'PASO CANOAS DE PULP LA TICA 150 MTS', 'ESTE.', '', ''),
(2926, 'Cedula Fisica', 800710518, 'MENDOZA DINARTE ANGELA DEL SOCORRO', 'PASO CANOAS DE PULP LA TICA 150 MTS', 'ESTE.', '', ''),
(2927, 'Cedula Fisica', 800710518, 'MENDOZA DINARTE ANGELA DEL SOCORRO', 'PASO CANOAS DE PULP LA TICA 150 M.E', 'FECHA ***** PAGO 16 CADA MES*****', '7321846', ''),
(2928, 'Cedula Fisica', 800710518, 'MENDOZA DINARTE ANGELA DEL SOCORRO', 'PASO CANOAS   PULP.LA TICA   150 mts', 'ESTE', '7321846', ''),
(2929, 'Cedula Fisica', 501360413, 'MENDOZA ESPINOZA MARIA ISABEL', 'VENECIA 200 MTS NORTE DE LA ESCUELA', 'C.COLOR BARNIZ MIXTA', '2242400', ''),
(2930, 'Cedula Fisica', 800390971, 'MENDOZA FLORES MANUEL', '', '', '', ''),
(2931, 'Cedula Fisica', 602460526, 'MENDOZA GUTIERREZ EDITH', 'Zancudo Costado N cabinas Palmera d', 'ORO Cs madera Natural   2776-0125', '8446-1086', ''),
(2932, 'Cedula Fisica', 602380278, 'MENDOZA GUTIERREZ WILBERTH', 'Zancudo Diagonal a la escuela  ', '2776-0228', '8310-6495', ''),
(2933, 'Cedula Fisica', 502100655, 'MENDOZA LOPEZ ALEXIS', 'PAVONES RIO CLARO', 'HOTEL MAUBREN', '', ''),
(2934, 'Cedula Fisica', 601220245, 'MENDOZA LOPEZ CLAUDIO', 'rio claro de pavones 1 km despues d', 'e la iglesia oasis casa color ladri', '8518-9814', ''),
(2935, 'Cedula Fisica', 600940833, 'MENDOZA MENDOZA JACINTO', 'TINOCO SAN FRANCISCO   DE PULPERIA', 'MIRAFLORES 800 MTS ADENTRO.', '', ''),
(2936, 'Cedula Fisica', 500780392, 'MENDOZA MENDOZA RAMONA', 'ENTRADA LA PUERTA DEL SOL DEL', 'ULTIMO PUENTE 300 MTS', '', ''),
(2937, 'Cedula Fisica', 603710844, 'MENDOZA ORTIZ NELSON JAVIER', 'Paso Canoas   Asentamiento Padilla', 'Cs Nº 3 8987-5250', '8553-5428', ''),
(2938, 'Cedula Fisica', 159100061, 'MENDOZA RODRIGUEZ JULIANA', 'P Canoas  Veracruz  Pulp. Amistad 200', 'sur entrando cs verde al fondo.', '2783-6023', ''),
(2939, 'Cedula Fisica', 280698350, 'MENDOZA RODRIGUEZ JULIANA.', 'COLORADITO', '', '', ''),
(2940, 'Cedula Fisica', 280698350, 'MENDOZA RODRIGUEZ JULIANA.', 'COLORADITO', '', '', ''),
(2941, 'Cedula Fisica', 601510541, 'MENDOZA SEQUEIRA HILDA', 'fiNCA 9 CASA Nº15', '', '7866644', ''),
(2942, 'Cedula Fisica', 602680597, 'MENDOZA SEQUEIRA MAYRA', 'CORTES ENTRADA FRENTE IGLESIA', 'MARANATA CASA CON MAYA Bª CANADA', '7888771', ''),
(2943, 'Cedula Fisica', 602680597, 'MENDOZA SEQUEIRA MAYRA', 'C Cortés   Bº Llamarón   entrada fte', 'Iglesia Maranata   cs con malla.', '2788-8771', ''),
(2944, 'Cedula Fisica', 502910116, 'MENDOZA TORRES MARIA ELENA', 'PLAYA SOMBRERO DE LA ESCUELA 2KM', '', '8236545', ''),
(2945, 'Cedula Fisica', 600830518, 'MENDOZA VALDEZ ARGENTINA', 'SAN MARTIN DE DONDE ESTA LA SODA EL', 'BAMBU 6ta CASA A MANO IZQUIERDA', '7751335', ''),
(2946, 'Cedula Fisica', 900670393, 'MENDOZA VARGAS HERNAN', 'RIO CLARO   BAMBEL SECTOR UNO', 'DE PULP EL JARDIN 400 MTS ESTE', '', ''),
(2947, 'Cedula Fisica', 900670393, 'MENDOZA VARGAS HERNAN EDUARDO', 'RIO CLARO BAMBEL 1 400MTS  DE PULP.', 'EL JARDIN * FECHA DE PAGO 10 C/M. *', '7898891', ''),
(2948, 'Cedula Fisica', 600780361, 'MENDOZA ZUÑIGA FRANCISCO NATIVIDAD', 'PALMAR SUR FCA 2-4 2DA FILA ULTIMA', 'CASA  8 C/M.', '7866668', ''),
(2949, 'Cedula Fisica', 602000533, 'MERINO ESPINOZA ALEXANDER', 'BAJO DE SAN JUAN  1era CASA MANO', 'IZQ. * CANCELA 11 CADA MES *', '', ''),
(2950, 'Cedula Fisica', 603170419, 'MESA RODRIGUEZ YAMILETH', 'Pozo azul   dominicalito casa *17', 'color rosado', '2787-0333', ''),
(2951, 'Cedula Fisica', 110030944, 'MESEN ARTAVIA CRISTOBAL', 'Laurel   Jobo   Contiguo a Pulp. Cam-', 'pesina MD. cel 8964-5654.', '2780-0525', ''),
(2952, 'Cedula Fisica', 103610929, 'MESEN BADILLA MARIA DEL CARMEN.', 'PASO CANOAS  FRENTE DEPOSITO MADERA', 'YASAEL PAGA 12 Y 25 C/M', '', ''),
(2953, 'Cedula Fisica', 602880535, 'MESEN CERCEÑO OLIVIER CC GUAJIL', 'Proyecto la Escuadra Comte   casa 59', '', '8640-1029', ''),
(2954, 'Cedula Fisica', 600850040, 'MESEN JIMENEZ JOSE MANUEL', 'COTO 63   50 MTS AL ESTE DE LA', 'PLAZA', '', ''),
(2955, 'Cedula Fisica', 103620129, 'MESEN JIMENEZ MERCEDES', 'R Claro  hacia plantas ICE 2da entr', '4ta Cs rosada. 8752-8324', '2789-9082', ''),
(2956, 'Cedula Fisica', 109930175, 'MESEN MARTINEZ MARIBEL', 'C. Neily   S. Rafael   25 m este 1º', 'puente de amaca. Cobrar Ofic. AVON', '8701-3386', ''),
(2957, 'Cedula Fisica', 102730858, 'MESEN MONTOYA DOMINGO.', 'EL JOBO DE LAUREL.', '', '', ''),
(2958, 'Cedula Fisica', 102730858, 'MESEN MONTOYA DOMINGO.', 'EL JOBO DE LAUREL.', 'P-12 C/M.', '', ''),
(2959, 'Cedula Fisica', 102730858, 'MESEN MONTOYA DOMINGO.', 'EL JOBO DE LAUREL   DE PULPERIA', 'LA CAMPESINA 600 MTS CASA M.DERECHA', '7800525', ''),
(2960, 'Cedula Fisica', 104720093, 'MESEN OBANDO GELBER', 'NARANJO    CONTIGUO ABASTECEDOR LA', 'BOMBA', '', ''),
(2961, 'Cedula Fisica', 104720093, 'MESEN OBANDO GELBERT', 'BELLA LUZ EN ABASTECEDOR EL PUEBLO', '** FECHA DE PAGO 13 CADA MES **', '7838056', ''),
(2962, 'Cedula Fisica', 603870647, 'MESEN RODRIGUEZ WENDY PAMELA', 'P Jiménez  del Colegio 150 N 25 E.', 'Cel 8650-4698.  8960-6373.', '2735-5598', ''),
(2963, 'Cedula Fisica', 602120957, 'MESEN SALAS MARCOS JAVIER', 'P Jiménez   El Bambú   Entrada 1º cs.', 'Sándalo x Esc 1km cs 2 pisos.', '2735-5369', ''),
(2964, 'Cedula Fisica', 601440774, 'MESEN SALAS MARGOTH', 'P Jiménez   Bambú Parcela 15.', 'Jiménez Esquina plaza cs poste azul', '8752-1272', ''),
(2965, 'Cedula Fisica', 601660417, 'MEXICANO AMAYA JOSE JOAQUIN', 'GOLF Kmt 7 PURRUJA U HOSPITAL Dto', 'SERVICIO DOMESTICO <P> BISEMANAL', '7751419', ''),
(2966, 'Cedula Fisica', 601760306, 'MEXICANO CUBILLO MARCELINO', 'PUERTO ESCONDIDO DEL TELEFONO 700 M', 'AL ESTE.', '', ''),
(2967, 'Cedula Fisica', 603430173, 'MEZA GRANADOS JHONNY', 'C Neily   San Rafael  costado este de', 'imprenta Reyes. Cel 8793-7558.', '2783-3252', ''),
(2968, 'Cedula Fisica', 600780792, 'MEZA JIMENEZ OLIVIER', 'Jiménez   Diagonal taller Haico.', 'Vive en la Bambú.', '8942-5620', ''),
(2969, 'Cedula Fisica', 600198959, 'MEZA MEZA LUIS PAULINO', 'GOLFITO   Km 3 CONTIGUO A TALLER', 'MILTON. P.16 C/M', '*-*-*-*', ''),
(2970, 'Cedula Fisica', 600198959, 'MEZA MEZA LUIS PAULINO', 'Golfito   La Mona   Ciud Daniel Herre', 'ra   casa Nº 2.', '2775-6143', ''),
(2971, 'Cedula Fisica', 603250300, 'MEZA MIRANDA FLORIBETH', 'P Jiménez  Bambú  100 O Pulp Amistad', 'Panadería Bambupan   Cel 8765-5485.', '2735-5419', ''),
(2972, 'Cedula Fisica', 603560505, 'MIRANDA ACEVEDO  JIMMY', 'LA CUESTA 150MTS CARRETERA A LA', 'PALMA PRIMERA A LA DERECHA ROSADA', '2732-2010', ''),
(2973, 'Cedula Fisica', 601150374, 'MIRANDA CABEZAS GINA', 'Bº BELLA VISTA 50 Mts N DEL ANTIGUO', 'BANCO NACIONAL <P> 03 C/N', '775', ''),
(2974, 'Cedula Fisica', 602180435, 'MIRANDA CANALES RAMIRO', 'GOLFITO LA PURRUJA DETRAS DE', 'PARADA LÑOS MADEROS.', '7752243', ''),
(2975, 'Cedula Fisica', 102740411, 'MIRANDA CORRALES GUILLERMO', 'R Claro  Km 27  Parada Santiago 500m', 'Norte   cs verde.', '', ''),
(2976, 'Cedula Fisica', 980045706, 'MIRANDA DA COSTA JOAO', 'SIERPE DE OSA   BAR RESTAURANT LAS', 'VEGAS   A 100 MTS DE LA PLAZA', '7866711', ''),
(2977, 'Cedula Fisica', 601031468, 'MIRANDA FLORES GLORIA', 'LA VACA 75 MTS ANTES DE LLEGAR', 'A LA VACA.P 30 C-M.', '', ''),
(2978, 'Cedula Fisica', 601031468, 'MIRANDA FLORES GLORIA', 'NARANJO 75 MTS ANTES DEL PUENTE DE', 'LA VACA * FECHA DE PAGO 10 C /MES *', '', ''),
(2979, 'Cedula Fisica', 610310468, 'MIRANDA FLORES GLORIA', 'Naranjo Laurel   300 antes  puente', 'de la Vaca.', '2780-1763', ''),
(2980, 'Cedula Fisica', 601150534, 'MIRANDA GARCIA FRANKLIN', 'CONTG HOTEL CAMINO REAL COLORADITO', 'DE PASO CANOAS <P>  30 C/M', '783', ''),
(2981, 'Cedula Fisica', 601150534, 'MIRANDA GARCIA FRANKLIN', 'ABROJO 150MTRS AL SUR DE PRISILA LA', 'CASA DE LA DOCTORA SABALA', '8438-4160', ''),
(2982, 'Cedula Fisica', 201480525, 'MIRANDA JIMENEZ OSCAR', 'VILLA COLON  CENTRO BAR LA PERLA', 'DEL SUS <P> 06 C/M', '', ''),
(2983, 'Cedula Fisica', 601051054, 'MIRANDA MEXICANO MARIA ISABEL', 'GOLFITO   CARNICERIA BELLA VISTA', 'CONTIGUO AL C.N.P. P. 27 C/M', '', ''),
(2984, 'Cedula Fisica', 900590662, 'MIRANDA MIRANDA JUAN RAFAEL', 'Laurel   Cariari   100m sur escuela  ', 'cs madera.', '8983-8485', ''),
(2985, 'Cedula Fisica', 603100672, 'MIRANDA PEREZ NUBIA', 'GOLFITO   KMT 18', '', '', ''),
(2986, 'Cedula Fisica', 603100672, 'MIRANDA PEREZ NUBIA', 'golfito km. 18', '', '8101302', ''),
(2987, 'Cedula Fisica', 800690438, 'MIRANDA QUIROS JULIO', 'COYOCHE DE LAUREL CASA CELESTE', '* CANCELA PAGO PALMEROS *', '3939924', ''),
(2988, 'Cedula Fisica', 601081329, 'MIRANDA REYES PETRONILA', 'Golfito; Km3  Casa # 5 de la entrada', 'del MSP. Cobrar en el Hospital', '', ''),
(2989, 'Cedula Fisica', 601930112, 'MIRANDA ROJAS ADANEIS', 'Bº SAN JORGE FRENTE AL TALLER ESQ', 'DE LA PLAZA. <P> 25 C/M', '', ''),
(2990, 'Cedula Fisica', 602390973, 'MIRANDA ROJAS MIRIAM', 'Bº SAN JORGE COSTADO ESTE DE LA', 'PLAZA 25 MTS M. DERECHA', '7321081', ''),
(2991, 'Cedula Fisica', 800670044, 'MIRANDA SANCHEZ ALBA AUXILIADORA', 'La Asunción de Belen Heredia de acu', 'amania 150 Mts oeste y 25 Norte.', '2390595', ''),
(2992, 'Cedula Fisica', 800670044, 'MIRANDA SANCHEZ ALBA AUXILIADORA', 'Heredia   La asunción de Acuamanía  ', '150 O y 25 N 2º casa MI.', '2239-0595', ''),
(2993, 'Cedula Fisica', 602520274, 'MIRANDA SANCHEZ IRENE', 'URBA LOS CERRITOS CASA *10', '85062602', '8568-7622', ''),
(2994, 'Cedula Fisica', 600860787, 'MIRANDA SOTO FIDEL', 'Coto 49   25m de la Escuela cs 12454', '', '8960-0024', ''),
(2995, 'Cedula Fisica', 103330492, 'MIRANDA SOTO VICTOR HUGO', 'COTO 52 COSTAO DE BODEGA DE ABONO', '** FECHA DE PAGO 30 C/MES **', '7811459', ''),
(2996, 'Cedula Fisica', 103330492, 'MIRANDA SOTO VICTOR HUGO', 'COTO 52', '', '2781-1459', ''),
(2997, 'Cedula Fisica', 103330492, 'MIRANDA SOTO VICTOR HUGO', 'Fincas  Coto 52 frente al Planché.', '', '8500-3313', ''),
(2998, 'Cedula Fisica', 602500666, 'MIRANDAS PALACIOS EMERITA', 'La Cuesta   Ent P Nuevo 100m Calle a', 'Laurel MD.', '8603-6121', ''),
(2999, 'Cedula Fisica', 603080044, 'MITRE CABALLERO LADY ELENA', 'COTO 45 Nº ENTRADA FTE BODEGA.', '** FECHA DE PAGO 30 CADA MES **', '', ''),
(3000, 'Cedula Fisica', 600810674, 'MITRE CEDEÑO ROGELIO', 'LA CUESTA CAMINO AL CHORRO DEL', 'CEMENTERIO 500 Mts <P> 30 C/M', '7321474', ''),
(3001, 'Cedula Fisica', 600810674, 'MITRE CEDEÑO ROGELIO', 'LA CUESTA CAMINO AL CHORRO DEL', 'CEMENTERIO 500 Mts <P> 30', '', ''),
(3002, 'Cedula Fisica', 600810674, 'MITRE CEDEÑO VICENTE ROGELIO', 'LA CUESTA CALLE AL CHORRO 1KMYMEDIO', '* FECHA DE PAGO QUINCENAL  *', '7321474', ''),
(3003, 'Cedula Fisica', 602540184, 'MITRE MOJICA JAVIER', 'MANGO DE LAUREL CARNICERIA GENESIS', '', '8791-9862', ''),
(3004, 'Cedula Fisica', 602430161, 'MITRE MOJICA ROGELIO', 'LA CUESTA CALLE AL CHORRO', 'QUINCENALMENTE', '7321865', ''),
(3005, 'Cedula Fisica', 601607939, 'MITRE REYES JULIO', 'CIUDADELA TAMAYO   PULP   LA CUESTA', '<P> 15 Y 30 C/M', '7322921', ''),
(3006, 'Cedula Fisica', 601607939, 'MITRE REYES JULIO', 'Ciudadela Tamayo Pulperia 5 Menos', '', '7322921', ''),
(3007, 'Cedula Fisica', 601607939, 'MITRE REYES JULIO', 'CIUDADELA TAMAYO   LA CUESTA', 'PUPERIA EL CINCO MENOS', '7322921', ''),
(3008, 'Cedula Fisica', 601450759, 'MITRE SAAVEDRA CESILIO', 'PASO CANOAS   LA GLORIA 1 kmt SUR DE', 'LA ESCUELA MANO IZQ   <P> 30 C/M', '*-*-*-*', ''),
(3009, 'Cedula Fisica', 280579362, 'MOEDANO CERCEÑO MARIO', 'CALLE A CUERVITO DEL PUENTE 1ero', '20 MTS A LA DERECHA.P- 30 c/m', '732', ''),
(3010, 'Cedula Fisica', 280579362, 'MOEDANO CERCEÑO MARIO', 'CALLE A CUERVITO DEL PUENTE 1ero', '20 MTS A LA DERECHA.P- 30 c/m', '732', ''),
(3011, 'Cedula Fisica', 500580809, 'MOLINA ARRIETA LUCIANO', 'ANTIGUA PULPERIA DEL SOL 800 MTS', 'OESTE CASA MANO IZQUIERDA', '7811402', ''),
(3012, 'Cedula Fisica', 500580809, 'MOLINA ARRIETA LUCIANO', 'Antigua Pulp. del Sol 800m oeste cs', 'MI.', '2781-1402', ''),
(3013, 'Cedula Fisica', 500580809, 'MOLINA ARRIETA LUCIANO MILCIADES.', 'LA CENTRAL  DE LA PULPERIA LA PUERTA', 'DEL SOL 800 MTS OESTE.CASA.M.IZQ.', '783', ''),
(3014, 'Cedula Fisica', 500710481, 'MOLINA ARRIETA TOMAS', 'KILOMETRO 31 CONTIGUO A LA ESCUELA', 'LOCAL ( LA LIBERTAD )', '', ''),
(3015, 'Cedula Fisica', 500710481, 'MOLINA ARRIETA TOMAS.', 'KMT 31 LA LIBERTAD DE LA ESCUELA CA', 'SA SIN PINTAR.P 15 C/M.', '', ''),
(3016, 'Cedula Fisica', 602330062, 'MOLINA GUSTAVINO JESUS', '', '', '', ''),
(3017, 'Cedula Fisica', 602610686, 'MOLINA GUSTAVINO JUAN', '', '', '', ''),
(3018, 'Cedula Fisica', 109970154, 'MOLINA JIMENEZ OLGA', 'P Jiménez   La Palma   Guadalupe   Fte', 'A Panadería. cel 8659-7328', '2735-1283', ''),
(3019, 'Cedula Fisica', 603620035, 'MOLINA JIMENEZ SUSANA', 'PTO JIMENEZLA PALMA FTE. A TALLER', 'EL CEIBO FECHA DE PAGO 11 CADA MES', '7775052', ''),
(3020, 'Cedula Fisica', 603620035, 'MOLINA JIMENEZ SUSANA', 'P Jiménez  La Palma  fte taller el', 'Ceibo.', '8790-1837', ''),
(3021, 'Cedula Fisica', 502000811, 'MOLINA MADRIGAL JESUS MOLINA', 'PTO JIMENEZ EL BAMBU 160SUR DE', 'PULP. CANCELA 12 CADA MES**', '', ''),
(3022, 'Cedula Fisica', 600400686, 'MOLINA MOLINA NERY', 'SAN RAMON DE RIO  CLARO ENTRADA', 'FRENTE A TROPIGAS 100 MTS', '7897137', ''),
(3023, 'Cedula Fisica', 602520167, 'MOLINA MORA DAVID', 'CARACOL NORTE COBRAR EN BUS', 'URBANO DE GOLFITO', '7836693', ''),
(3024, 'Cedula Fisica', 602900500, 'MOLINA SIBAJA LEIDA', 'FINCA CAUCHO COOPETRABASUR 300 MTS', 'OESTE VIVERO DE PALMA', '7800269', ''),
(3025, 'Cedula Fisica', 502210481, 'MOLINA VILLAFUERTE MAYRA', 'jimenez   el ñeque entra ceibo 600 m', '8976-5591', '3443493', ''),
(3026, 'Cedula Fisica', 109010753, 'MOLINA VILLALOBOS MELANIA', 'CIUDAD NEILY Bº 22 DE OCTUBRE CASA', '# 10 - BLOCK C.', '7833711', ''),
(3027, 'Cedula Fisica', 501150472, 'MONCADA CONTRERAS EMMA', 'Fca PUNT. FONDO PLAZ COST O CASA CO', 'AMARILLO <P> 19 PULP DOÑA PAOLA', '', ''),
(3028, 'Cedula Fisica', 501150472, 'MONCADA CONTRERAS EMMA', 'Finca Puntarenas Esquina de Plaza', 'al fondo. Casa cerrada  pite o llame', '8981-1340', ''),
(3029, 'Cedula Fisica', 501441412, 'MONCADA ORDOÑEZ CARMELA', 'CIUDAD NEILY   POR LA U.N.E.D. MANO', 'DERECHA FRTE A ALCANTARILLAS', '', ''),
(3030, 'Cedula Fisica', 602570177, 'MONCADA RODRIGUEZ MELVIN DIDIER', 'RIO BONITO 300 Mts NORTE DE LA', 'ESCUELA. P. EN OFICINA.', '7833642', ''),
(3031, 'Cedula Fisica', 602680224, 'MONCADA RODRIGUEZ OLMAN', 'Coto 47   costado oeste del Estadio', 'cs 10.328 Cel 8616-7054. 2781-1481.', '2785-9119', ''),
(3032, 'Cedula Fisica', 201910992, 'MONDRAGON CASTRO TERESA', 'Agua Buena   Valle Azul   100m antes', 'Pulp. V Azul. cs verde y amarillo', '', ''),
(3033, 'Cedula Fisica', 501550199, 'MONESTEL ARIAS CLAUDIA', 'Laurel   Bambito   Escuela 400m este  ', '2º casa MD.', '2780-1226', ''),
(3034, 'Cedula Fisica', 502060596, 'MONESTEL ARIAS ZULEMA', 'Laurel   Bambito Escuela 300 m este.', '', '2780-1285', ''),
(3035, 'Cedula Fisica', 900910806, 'MONGE CASCANTE GILBERTO', 'LA CUESTA   CARIARI 1500 MTS NORTE', 'DE LA CUESTA CARIARI.', '', ''),
(3036, 'Cedula Fisica', 900910806, 'MONGE CASCANTE GILBERTO', 'CARIARI  1500MTS. NORTE DE LA', 'ESCUELA', '', ''),
(3037, 'Cedula Fisica', 900810806, 'MONGE CASCANTE GILBERTO', 'Km 25 Laurel   1.5km Escuela   desp', 'puente 3º casa color azul.', '8981-6488', ''),
(3038, 'Cedula Fisica', 103004744, 'MONGE CASCANTE MANUEL', 'LA MARIPOSA 250MTS A COLORADO', '', '', ''),
(3039, 'Cedula Fisica', 103004744, 'MONGE CASCANTE MANUEL', 'LA MARIPOSA 250 MTS CALLE A LA', 'MARIPOSA *CANCELA 15 CADA MES *', '', ''),
(3040, 'Cedula Fisica', 130047442, 'MONGE CASCANTE MANUEL', 'MARIPOZA 250 M DE LA PLAZA CALLE A', 'COLORADO', '', ''),
(3041, 'Cedula Fisica', 601730431, 'MONGE GODINEZ RONALD', 'BAHIA BALLENA FTE SALON COMUNAL DE', 'BAHIA CASA VERDE 8714/3190', '2743-8071', ''),
(3042, 'Cedula Fisica', 602390114, 'MONGE GONZALES KATI', 'Bº El Carmen 100 m este de las Asam', 'bleas de Dios Casa Nº5 x quebrada.', '8876-5524', ''),
(3043, 'Cedula Fisica', 601130559, 'MONGE MORA ZEIDY', 'Palmar Norte   soda El Mango', '', '7866482', ''),
(3044, 'Cedula Fisica', 202430558, 'MONGE MORALES VICTOR MANUEL.', 'NARANJO DE LAUREL  CASA CON CORRAL -', 'ANTES DEL PTE DE CARACOL.P-15 C/M.', '', ''),
(3045, 'Cedula Fisica', 600620028, 'MONGE QUIROS MARIA CECILIA', 'Copa Buena   Fte Parque Infantil   cs', 'Beige con Marrón.', '2734-0704', ''),
(3046, 'Cedula Fisica', 110560115, 'MONGE TORRES ROGER A.', 'B SAN MARTIN 300 E DE LA ESCUELA', '*** CANCELA 15 C/MES ***', '7321252', ''),
(3047, 'Cedula Fisica', 601610344, 'MONGE TREJOS FLOR MARIA', 'Laurel   El Invu   detrás Pulp.', '', '2780-0243', ''),
(3048, 'Cedula Fisica', 601430930, 'MONGE UREÑA HERIBERTO', 'Coto Brus   Sabalito   800m O Escuela', 'Cobrar en Veterinaria Sabalito.', '8883-5067', ''),
(3049, 'Cedula Fisica', 602000682, 'MONTANO ALVAREZ LUIS.', 'CIUDAD CORTES Bº I.M.A.S.CASA # 28', 'COLOR VERDE', '758242', ''),
(3050, 'Cedula Fisica', 116366411, 'MONTANO MONTANO ENRIQUE', 'CIUDAD CORTES Bº I.M.A.S CASA # 28', 'COLOR VERDE', '', ''),
(3051, 'Cedula Fisica', 602980327, 'MONTENEGRO PITTY ANGELINA', 'SODA LA AMISTAD FRENTE DE PARADA', 'TAXIS PUBLICOS', '5535875', ''),
(3052, 'Cedula Fisica', 601350429, 'MONTERO ACUÑA JOSE LUIS', '', '', '', ''),
(3053, 'Cedula Fisica', 601350429, 'MONTERO ACUÑA JOSE LUIS.', 'KILOMETRO 02   MONTECILLOS', 'Cobrar 3 c/m.', '7750270', ''),
(3054, 'Cedula Fisica', 603100446, 'MONTERO ALVARADO DUNIA', 'Agua Buena  Metapunto  cont caseta de', 'buses cs/c gris. Cel 8736-3088', '8690-6622', ''),
(3055, 'Cedula Fisica', 202841090, 'MONTERO AMAYA LUIS EMILIO', 'La Cuesta; 100 Mts del cementerio', '<p> 25 c/m', '*-*-*-*', ''),
(3056, 'Cedula Fisica', 206280299, 'MONTERO ARGUEDAS EDUARDO', 'B* EL CARMEN DE LA PULERIA EL GARRO', 'TAZO CASA *97 150MTS SURESTE', '2783-6196', ''),
(3057, 'Cedula Fisica', 105680695, 'MONTERO CALDERON CARMEN LIDIA', 'SINAI DE OSA DETRAS DE LA ESCUELA', '', '', ''),
(3058, 'Cedula Fisica', 603000246, 'MONTERO CARAZO JEFFRY', 'kmt 12 Bº Mexico casa 90', '', '7751425', ''),
(3059, 'Cedula Fisica', 603000246, 'MONTERO CARAZO JEFFRY', 'kmt 12 Bº Mexico casa 90', '', '7751425', ''),
(3060, 'Cedula Fisica', 202130510, 'MONTERO CASCANTE FLOR', 'CORTES DEL COLEGIO   500 NORTE TRABA', 'EN EL COMEDOR   MINISTERIO DE SALUD', '', ''),
(3061, 'Cedula Fisica', 402400027, 'MONTERO DE PITTI MIRNA YADIRA', 'P Canoas   Bº San Rafael  Diagonal al', 'Tajo   Cel 507-6493-4940.', '', ''),
(3062, 'Cedula Fisica', 104008222, 'MONTERO DIAZ CARLOS', 'OLLA CERO PULP COSTA RICA DESP DEL', 'PUENTE 1er CASA M. DERECHA', '7866233', ''),
(3063, 'Cedula Fisica', 401320211, 'MONTERO ESQUIVEL ANA LUCIA', 'Golfito  4ºcs desp Cruz Roja.cc nara', 'nja.Cobrar local 40 DLCG. 8823-9960', '2775-0859', ''),
(3064, 'Cedula Fisica', 201190482, 'MONTERO GUERRERO JORGE.', 'TINOCO 1ª CASA DESPUES DEL PUENTE', '', '', ''),
(3065, 'Cedula Fisica', 102610636, 'MONTERO JIMENEZ JULIA', 'Golfito   Bº Parroquial   fte Alfa &', 'Omega. Cel 8503-3571.', '2775-0647', ''),
(3066, 'Cedula Fisica', 202200473, 'MONTERO JIMENEZ XINIA', 'Agua Buena   costado iglesia catolic', 'C madera verde agua    8682-9039', '2734-0215', ''),
(3067, 'Cedula Fisica', 202280478, 'MONTERO MIRANDA JORGE', 'Sierpe  Pueblo Nuevo  150m sur Abast', 'Marylin cs verde madera.', '7057-1171', ''),
(3068, 'Cedula Fisica', 600300351, 'MONTERO MONESTEL FIDELIA', 'Bº SAN JUAN DETRAS DEL COLEGIO GOLF', '<P> 03 C/M', '', ''),
(3069, 'Cedula Fisica', 600960040, 'MONTERO MONESTEL OLDEMAR', 'GOLFITO COBRO EN EL CLUB DE PLAYA', 'PUEBLO CIVIL.', '750220', ''),
(3070, 'Cedula Fisica', 201440393, 'MONTERO MONTERO CLAUDIO', 'BARRIO ALEMANIA DE PULPERIA CENTRAL', 'CASA A LA DERECHA', '2786693', ''),
(3071, 'Cedula Fisica', 202130994, 'MONTERO MONTERO TERESITA', 'PALMAR NORTE ANTIGUO RASTRO CASA LA', 'A ORILLA DEL RIO TERRABA', '', ''),
(3072, 'Cedula Fisica', 601140260, 'MONTERO MONTES GERARDINA', 'Bella Luz   Oficina de Tracopa.', '', '2783-8011', ''),
(3073, 'Cedula Fisica', 103921136, 'MONTERO MONTES JAVIER', 'Bella Luz 150m antes Bar Las Carre-', 'tas. Ent Incendio. Taxista Naranjo.', '', ''),
(3074, 'Cedula Fisica', 602930481, 'MONTERO MURILLO JUAN CARLOS', 'Drake   de Esc los Angeles 200 Noest', 'Cs deleste madera   8601-0789', '8969-2899', ''),
(3075, 'Cedula Fisica', 301080471, 'MONTERO ORTIZ ELSA', 'EL TRIUNFO 2da CASA DE LA IGLESIA', 'EVANGELICA  CASA C-7', '', ''),
(3076, 'Cedula Fisica', 101980341, 'MONTERO ROJAS BERNALDO', '', '', '', ''),
(3077, 'Cedula Fisica', 101980341, 'MONTERO ROJAS BERNARDO', 'CONTROL 600 MTS DE LA', 'PULPERIA CASA MANO IZQUIERDA', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(3078, 'Cedula Fisica', 602130819, 'MONTERO TORRES ISABEL', 'CUIDADELA MARTINEZ DEL ABASTECEDOR', 'MARILYN MANO DERECHA AL FINAL', '8787-3150', ''),
(3079, 'Cedula Fisica', 103260334, 'MONTERO VALVERDE DAGOBERTO.', 'NO SE REGISTRO.', '', '', ''),
(3080, 'Cedula Fisica', 600870158, 'MONTERO VILLALOBOS DEILY', 'GOLFITO  ', '', '', ''),
(3081, 'Cedula Fisica', 600870158, 'MONTERO VILLALOBOS DEILY', 'GOLFITO  ', '', '', ''),
(3082, 'Cedula Fisica', 103110747, 'MONTES CASTILLO OSCAR.', 'BARRIO BELLA VISTA  SODA PAVAS.', 'P-16 C/M.', '775', ''),
(3083, 'Cedula Fisica', 800450724, 'MONTES GARCIA AMANDA', 'Golfito  Res Ureña  cs G9.', '', '2775-2320', ''),
(3084, 'Cedula Fisica', 500860878, 'MONTES GARCIA ANTONIA', 'GOLFITO LA MONA   DEL TEL 7 ma CASA', 'M. DERECHA CIUDADELA NUEVA', '7751947', ''),
(3085, 'Cedula Fisica', 601340914, 'MONTES TAPIA GABRIEL', 'B. Los Angeles de Piedras Blancas', '100m al este de la escuela', '', ''),
(3086, 'Cedula Fisica', 602690827, 'MONTES TAPIA WILLIAM', 'LAUREL CENIZO 150M ESTE IGLESIA', 'EVANGELICA CC TERRACOTA 8767-5054.', '2780-1341', ''),
(3087, 'Cedula Fisica', 603720930, 'MONTEZUMA BEITA BRAINER', 'conte.200 este  100 al sur de la esc', 'uela de conte', '2776-8024', ''),
(3088, 'Cedula Fisica', 401210238, 'MONTIEL CAMPOS ALEXANDER', '', '', '', ''),
(3089, 'Cedula Fisica', 501070302, 'MONTIEL HERNANDEZ DAMIAN', 'CIUDAD NEILY   DEL TALLER SANCHEZ 75', 'MTS ESTE  Y 100 N <P> 09 C/MES', '', ''),
(3090, 'Cedula Fisica', 501070302, 'MONTIEL HERNANDEZ DAMIAN', 'C Neily   Bº Capri   100m entrada.', '', '2783-4213', ''),
(3091, 'Cedula Fisica', 501580161, 'MONTIEL HERNANDEZ EMILCE', 'Golfito   Llano Bonito   cabinas Rebe', 'ca.', '8814-5376', ''),
(3092, 'Cedula Fisica', 601670186, 'MONTIEL MONTIEL JOSE ANGEL', 'KM 37 DE LA GAMBA 100MTS', 'CARRETERA HACIA LA BULSA', '8762-1264', ''),
(3093, 'Cedula Fisica', 600830333, 'MONTIEL MONTIEL JUAN FELIX', 'LA GAMBA DE LA PULPERIA 100NORTE EN', 'TRADA CASA VERDE PREFABRICADA', '2741-8187', ''),
(3094, 'Cedula Fisica', 600880617, 'MONTIEL SEQUEIRA CARMEN', 'NARANJO LAUREL DEL COLEGIO 25MTS', 'SUR CASA VERDE MADREA', '2780-1532', ''),
(3095, 'Cedula Fisica', 603130888, 'MONTOYA ARAYA EDWIN', 'Fca Guanacaste 700 Norte de Escuela', '', '2786-3340', ''),
(3096, 'Cedula Fisica', 603390567, 'MONTOYA CALDERON LAURA', 'Sabalito  S Antonio  fte Igles Catoli', 'ca en carnicería. Cel 8569-1579.', '8942-1293', ''),
(3097, 'Cedula Fisica', 202130846, 'MONTOYA GONZALEZ TEODORICO', 'P Canoas   La Argentina   1km al este', 'del retiro.', '', ''),
(3098, 'Cedula Fisica', 601350931, 'MONTOYA GUZMAN MIGUEL', 'COTO 52 FTE AL MARCO DE LA PLAZA', 'CASA Nº 10524 FECHA DE PAGO 2 C/M*', '7811092', ''),
(3099, 'Cedula Fisica', 601350931, 'MONTOYA GUZMAN MIGUEL', 'COTO 52 FTE AL MARCO DE LA PLAZA', 'CASA Nº 10524 FECHA DE PAGO 2 C/M*', '7811092', ''),
(3100, 'Cedula Fisica', 108970628, 'MONTOYA MADRIGAL GEOVANNY', 'la Argentina de Colorado de la', 'entrada al Retiro un Kmt.', '3325002', ''),
(3101, 'Cedula Fisica', 108970628, 'MONTOYA MADRIGAL GEOVANNY GERARDO', 'P Canoas  La Argentina  2km oeste del', 'Retiro.', '8332-5002', ''),
(3102, 'Cedula Fisica', 602620038, 'MONTOYA MARIN KATIA MARIA', 'RIO CLARO FTE. SALON COMUNAL', '', '', ''),
(3103, 'Cedula Fisica', 602620038, 'MONTOYA MARIN KATIA MARIA', 'RIO CLARO FTE. SALON COMUNAL', 'FECHA DE PAGO16 C/M', '7897271', ''),
(3104, 'Cedula Fisica', 602620038, 'MONTOYA MARIN KATTIA MARIA', 'RIO CLARO   FRENTE AL SALON COMUNAL', 'DE RIO CLARO', '', ''),
(3105, 'Cedula Fisica', 602190462, 'MONTOYA MORA ALVARO GERARDO', 'PTO JIMENEZ   CIUDADELA EL COLEGIO', 'DE DONDE SONIA 4 CASAS.', '7355132', ''),
(3106, 'Cedula Fisica', 501010895, 'MONTOYA MORA RITA.', 'RIO CLARO   FRENTE A TRACOPA   DETRAS', 'DE IGLESIA MORMON', '789', ''),
(3107, 'Cedula Fisica', 203780306, 'MONTOYA MORALES GISELLE', 'GOLFITO CONTG. A TRACOPA / CIUDAD N', 'Bº SAN RAFAEL * CANCELA 2 CADA MES', '', ''),
(3108, 'Cedula Fisica', 107000434, 'MONTOYA MORENO MARIA AUXILIADORA', 'GOLFITO BELLA VISTA 4TA FILA CASA', '*8143', '2275-0769', ''),
(3109, 'Cedula Fisica', 107840994, 'MONTOYA PORRAS CARLOS.', 'KMT 24 COOPEVAQUITA SEGUNDA CASA --', 'DESPUES DE LAS OFICINAS.P.15 C/M.', '', ''),
(3110, 'Cedula Fisica', 603300755, 'MONTOYA SANCHEZ DAVID', 'jandin de conte  100mts antes de lle', 'gar a la escuela', '8984-0970', ''),
(3111, 'Cedula Fisica', 604070934, 'MONTOYA SANCHEZ HANDY', 'Km 29 de Ofic de Coopevaquita 300', 'Mts al Sur Cs al Fondo mixta.', '8421-3273', ''),
(3112, 'Cedula Fisica', 106690001, 'MORA AMAYA ELIDER', 'La Palma   Pto Jiménez   200 norte de', 'entrada a la plaza.', '2735-1348', ''),
(3113, 'Cedula Fisica', 106690001, 'MORA ARAYA ELIDER', 'Pto Jimenez   La Palma   100 norte de', 'de la plaza   bar las gemelas', '7750522', ''),
(3114, 'Cedula Fisica', 203970708, 'MORA ARGUEDAS ANA', 'P Jiménez  Ñeque  detrás Pulp Las Flo', 'res. Cs al fondo rosada. 8812-6473.', '8899-4428', ''),
(3115, 'Cedula Fisica', 102130520, 'MORA ARGUEDAS BELARMINA', 'P Jiménez   Urb S Lázaro x pulp. JK', 'x Cab evelyn ent antes hacia arriba', '2735-5675', ''),
(3116, 'Cedula Fisica', 102390020, 'MORA ARGUEDAS MARIA DE LOS ANGELES', 'San Vito CB   Urb S Joaquín   cs 16', 'beige   porton rojo.', '2773-4719', ''),
(3117, 'Cedula Fisica', 501070013, 'MORA ARGUEDAS VICTOR MANUEL', 'MERCADO DE CIUDAD NEILY  ', 'VERDULERIA.', '', ''),
(3118, 'Cedula Fisica', 501070013, 'MORA ARGUEDAS VICTOR MANUEL', 'C.N.B`SAN RAFAEL 300 MTS ESTE', 'P.17 C/M', '', ''),
(3119, 'Cedula Fisica', 501070013, 'MORA ARGUEDAS VICTOR MANUEL', 'CIUDAD NEILY MERCADO MUNICIPAL', '', '', ''),
(3120, 'Cedula Fisica', 900970259, 'MORA BADILLA EDGAR', 'P Norte  detrás Iglesia Asambleas de', 'Dios.', '2786-7073', ''),
(3121, 'Cedula Fisica', 601680821, 'MORA CAMPOS DAVID', '2KM AL NORTE DEL COLEGIO DE CONTE', 'PULPERIA LA VENCEDORA', '8306-1597', ''),
(3122, 'Cedula Fisica', 500600166, 'MORA CASTRO JOSE', 'LA CUESTA 800 Mts CALLE A LAUREL', '<P> 15 c/M', '7322467', ''),
(3123, 'Cedula Fisica', 201160015, 'MORA CASTRO MERETINA (C.C.EMERITA)', 'GOLFITO   EL CIVIL CASA FRTE A LA', 'ESCUELA C.COLOR VERDE.', '7751221', ''),
(3124, 'Cedula Fisica', 101019264, 'MORA CASTRO RAFAEL EDUARDO', 'RIO BONITO 500 M DESPUES DE ESCUELA', 'CASA MANO IZQUIERDA', '', ''),
(3125, 'Cedula Fisica', 103450291, 'MORA CHAVARRIA MIGUEL', 'LA GUARIA KM 43 300 SUR DE LA', 'ESCUELA SOBRE LA LINEA', '', ''),
(3126, 'Cedula Fisica', 109380900, 'MORA CORDERO PEDRO MATIAS', 'UVITA COOPE AGRILODGE', '87399620', '2743-8081', ''),
(3127, 'Cedula Fisica', 502610203, 'MORA ESPINOZA ROBERT ANTONIO', 'RIO CLARO BAMBEL 3 200MTS DESP. DE', 'PULPERIA * FECHA DE PAGO 16 C/MES*', '7898528', ''),
(3128, 'Cedula Fisica', 602390640, 'MORA ESPINOZA ROSA', 'GOLFITO B* EL INVU', '', '8764-9743', ''),
(3129, 'Cedula Fisica', 701270716, 'MORA FALLAS KATHIA', 'Pto Jimenez   fret la Plaza 50 Mts', 'de Anita Polanco    8519-1768', '', ''),
(3130, 'Cedula Fisica', 602590239, 'MORA FONSECA ROSEMARE', 'C Neily   R Nuevo   Bloque G   cs Nº28', '', '8737-2403', ''),
(3131, 'Cedula Fisica', 600920937, 'MORA GAMBOA RAUL', 'RIO CLARO BARRIO SANTIAGO DETRAS DE', 'LA ESCUELA SEGUNDA CASA', '', ''),
(3132, 'Cedula Fisica', 601090349, 'MORA GOMEZ JUAN DANIEL.', 'CIUDAD NEILY   LA FORTUNA 75 MTS DE', 'LA ASAMBLEAS DE DIOS.', '', ''),
(3133, 'Cedula Fisica', 104910340, 'MORA GUZMAN MARIO', 'KM 20 DE GOLFITO CASA B-11', 'FRENTE A IGLESIA', '7751120', ''),
(3134, 'Cedula Fisica', 900390709, 'MORA HERNADEZ RAFAEL', 'RIO CLARO COBRAR EN TAQUERIA', 'O PUESTO DE LOTERIA', '7899633', ''),
(3135, 'Cedula Fisica', 103080421, 'MORA HERRERA VICTOR', 'Golfito   Comte   detrás Bar Palmas.', 'Cel 8775-7165.', '2776-8098', ''),
(3136, 'Cedula Fisica', 103080421, 'MORA HERRERA VICTOR', 'Golfito   Comte   detrás Bar Palmas.', 'Cel 8775-7165.', '2776-8098', ''),
(3137, 'Cedula Fisica', 108170854, 'MORA HIDALGO ELADIO', 'Gilfito  pueblo civil   del bar chica', 'pica 150 Mts   hacia arriba  ', '8416-6952', ''),
(3138, 'Cedula Fisica', 501130114, 'MORA JIMENEZ FRANCISCO', 'PUERTO JIMENEZ CENTRO SODA', 'EL MERCADITO', '7355132', ''),
(3139, 'Cedula Fisica', 606010061, 'MORA JIMENEZ JUANA ARACELY', 'UVITA 200 MTS PLAZA DE DEPORTE', 'CASA CAFE 189459292', '2743-8537', ''),
(3140, 'Cedula Fisica', 601560845, 'MORA JIMENEZ SANDRA ELIETH', 'INVU LA ROTONDA   GOLFITO', '.P. 03 Y 16 C/M', '775-', ''),
(3141, 'Cedula Fisica', 600680858, 'MORA LEIVA JOSE VICENTE', 'Palmar Norte   costado sur de la', 'Iglesia Catolica', '7866475', ''),
(3142, 'Cedula Fisica', 601500743, 'MORA MADRIGAL SANDRA', 'conte de pavones detras de la torre', '', '2776-8194', ''),
(3143, 'Cedula Fisica', 101590351, 'MORA MARIN FERMINA', 'jardin de comte frete a la escuela', 'c.color verde ojo se fue a Cortes.', '', ''),
(3144, 'Cedula Fisica', 600680418, 'MORA MENA MAGDALENA', 'Sierpe   Soda Sierpe. costado sur de', 'la plaza.', '2788-1228', ''),
(3145, 'Cedula Fisica', 602660064, 'MORA MIRANDA LISBETH', 'Palmar Norte   Escuela 11 de Abril', '', '7866834', ''),
(3146, 'Cedula Fisica', 602660064, 'MORA MIRANDA LISBETH', 'Palmar Norte   Escuela 11 de Abril', '** FECHA DE PAGO 8 CADA MES **', '7866834', ''),
(3147, 'Cedula Fisica', 602660064, 'MORA MIRANDA LISBETH', 'Cortes   Escuela Valle del Diquis.', 'Cel 8759-8234.', '2786-6834', ''),
(3148, 'Cedula Fisica', 900420497, 'MORA MORA ALCIDES', 'Río Claro   Pulpería los almendros.', '', '7899473', ''),
(3149, 'Cedula Fisica', 601000252, 'MORA MORA ANA JULIA', 'PUERTO JIMENEZ CENTRO 50 METROS', 'SUR DE LA IGLESIA CATOLICA', '7355085', ''),
(3150, 'Cedula Fisica', 104300587, 'MORA MORA EMILIA', 'CONTE   DE LA ESCUELA 275 Mts  Oeste', '<P> 13 C/M', '', ''),
(3151, 'Cedula Fisica', 600790018, 'MORA MORA FRANCISCO', 'LA VIRGEN DE ZABALO FTE.A LAESCUELA', 'CASA PREFABRICADA.', '', ''),
(3152, 'Cedula Fisica', 600790018, 'MORA MORA FRANCISCO', 'LA VIRGEN 2 KILOMETROS', 'ANTES DE LA ESCUELA LOCAL.', '', ''),
(3153, 'Cedula Fisica', 600640751, 'MORA MORA FRANCISCO', 'BELLA LUZ DE LA VACA DEL BAR', 'LAS CARRETAS 1 KMT ESTE C. BLANCA', '', ''),
(3154, 'Cedula Fisica', 105030354, 'MORA MORA GERARDINA', 'P Canoas  Veracruz   100m abastecedor', 'Cs 68.', '8805-2406', ''),
(3155, 'Cedula Fisica', 106780177, 'MORA MORA JOSE MELVIN', 'FCA COTO 49 COSTADO OESTE DE PLAZA', '** FECHA DE PAGO 31 C/M **', '', ''),
(3156, 'Cedula Fisica', 601000252, 'MORA MORA JULIA', 'JIMENEZ 75MTRS OESTE BANCO NACIONAL', '', '7355085', ''),
(3157, 'Cedula Fisica', 600930852, 'MORA MORA MAGDALENA', 'PUERTO JIMENEZ   DE LA IGLESIA', 'CATOLICA 40 MTS OESTE', '7355134', ''),
(3158, 'Cedula Fisica', 600930852, 'MORA MORA MAGDALENA', '45m OESTE DE BANCO NACINAL JIMENEZ', '', '7355134', ''),
(3159, 'Cedula Fisica', 106009470, 'MORA MORA MARVIN', 'CIUDAD NEILY DEL TALLER POLACO 1K', 'CALLE PIEDRA CANCELA 30 FIJO C/MES', '7835696', ''),
(3160, 'Cedula Fisica', 602580955, 'MORA MORA ROSENDO', 'jardin frente a la escuela', '', '', ''),
(3161, 'Cedula Fisica', 602040638, 'MORA MORA SOFIA ISABEL', 'Bº EL CARMEN CASA Nº 186 DIAGONAL', 'IGLECIA ASAMBLEAS DE DIOS..', '', ''),
(3162, 'Cedula Fisica', 601370106, 'MORA PORRAS JORGE GERARDO', 'La Palma   Detrás de redondel MD 2º', 'casa   Desp. de la plaza. 8632-7936.', '2735-1233', ''),
(3163, 'Cedula Fisica', 202010430, 'MORA QUIROS CARLOS LUIS', 'NARANJO FRTE A PRIMER PULPERIA', '', '', ''),
(3164, 'Cedula Fisica', 102860020, 'MORA QUIROS LUCRECIA', 'C Cortés   Ojo de Agua   Ent Escuela', 'fte Play.', '', ''),
(3165, 'Cedula Fisica', 600450362, 'MORA QUIROS OLGA', '', '', '', ''),
(3166, 'Cedula Fisica', 600450362, 'MORA QUIROS OLGA', 'CONTRO DE LA CUESTA ENTRANDO', '4ta CASA.', '', ''),
(3167, 'Cedula Fisica', 113570698, 'MORA REYES MABEL IRENE', 'LAUREL CORREDORES', '8737/8456', '2780-0580', ''),
(3168, 'Cedula Fisica', 501380575, 'MORA RODRIGUEZ ALVARO', 'LA CUESTA DEL COLEGIO 200 M ESTE', '', '7322060', ''),
(3169, 'Cedula Fisica', 601510287, 'MORA RODRIGUEZ MARGARITA', 'Golfito  La Mona  Bº Progreso  4º Entr', 'cs esq madera rosada.', '8988-1408', ''),
(3170, 'Cedula Fisica', 103320182, 'MORA RODRIGUEZ MIGUEL', 'NARANJO 800 M ESTE DE LA ESCUELA', '', '', ''),
(3171, 'Cedula Fisica', 103320182, 'MORA RODRIGUEZ MIGUEL', 'NARANJO 800MT. SUR DE LA DELEGACION', '', '7800632', ''),
(3172, 'Cedula Fisica', 601140355, 'MORA SANCHEZ CARLOS ALBERTO', '', '', '', ''),
(3173, 'Cedula Fisica', 602480440, 'MORA SANCHEZ JUAN CARLOS', 'Bella Luz de la Vaca. 1km este bar', 'las Carretas.', '8992-4867', ''),
(3174, 'Cedula Fisica', 602730685, 'MORA SANCHEZ MARIA VICENTA', 'Copa Buena   250m sur de la Escuela  ', 'cs verde. Cel 8693-8814', '2774-0079', ''),
(3175, 'Cedula Fisica', 301700204, 'MORA SANCHEZ VIRGINIA', 'GOLFITO KM. 2 CASA EN CERRO', '** FECHA DE PAGO 17 CADA MES **', '7750431', ''),
(3176, 'Cedula Fisica', 102230815, 'MORA SEGURA GAMALIEL', '', '', '', ''),
(3177, 'Cedula Fisica', 108270147, 'MORA SOLIS MARGIN', 'COMTE 200MTS SUR DE LA ESCUELA CASA', 'PREFABRICADA TERRACOTA AL FONDO', '8808-2054', ''),
(3178, 'Cedula Fisica', 103840290, 'MORA ULLOA GERMAN', 'P Canoas  S Jorge  175m oeste de mue-', 'bleria Los Rojas.', '2732-1013', ''),
(3179, 'Cedula Fisica', 601340309, 'MORA UREÑA AIDA', 'DETRAS DE LA ESCUELA ALBERTO ECHAND', '<P> 30 C/M', '783-', ''),
(3180, 'Cedula Fisica', 601080029, 'MORA UREÑA MARIA EMMA', '', '', '', ''),
(3181, 'Cedula Fisica', 602590970, 'MORA VARGAS ARMANDO', 'Coto 47   100 oeste del Club de Tra-', 'bajadores casa 10983', '8910-650', ''),
(3182, 'Cedula Fisica', 601820851, 'MORA VARGAS JUANA FRANCISCA', 'RIO CLARO BAMBEL 1 ULTIMA CASA', 'C.C LA MACHA * FECHA PAGO 20 C/MES*', '7897416', ''),
(3183, 'Cedula Fisica', 603080473, 'MORA VILLANUEVA EDUARDO', 'Comte   La Estrella 100 m Bar el Zar', 'pe en panadería.', '7836174', ''),
(3184, 'Cedula Fisica', 502460446, 'MORA VINDAS ROSIBEL', 'LA VIRGEN DE SABALO EN EL SUPER', 'MERENDINA.* FECHA DE 13 C/MES **', '7760068', ''),
(3185, 'Cedula Fisica', 102790034, 'MORA ZUÑIGA JOSE ANGEL', 'RINCON DE BEREH DE IGLESIA CORDERO', 'DE DIOS 150 MTS.NORTE .', '7800597', ''),
(3186, 'Cedula Fisica', 501030053, 'MORAGA MARCHENA LEVI', 'CONTROL DE LA CUESTA FTE. PULP.', 'LA BELLA.', '', ''),
(3187, 'Cedula Fisica', 600680586, 'MORAGA MORAGA CARMEN', 'Palmar Sur   Bº 11 de abril fte a', 'Iglesia Católica', '7866429', ''),
(3188, 'Cedula Fisica', 501190903, 'MORAGA MORAGA PONCIANO', 'EL CARMEN DE ABROJO 2 DA ENTRADA DE', 'TELEFONO PUBLICO 75 MTS MIXTA C.CEL', '7834434', ''),
(3189, 'Cedula Fisica', 602180855, 'MORAGA SALAMANCA ISMAEL CC.CHIKI', 'P Jiménez   La Palma   detrás Alm La', 'Palma   Urb nueva 1º casa.', '2735-1066', ''),
(3190, 'Cedula Fisica', 602960927, 'MORAGA SANCHEZ HAZEL', 'PASO CANOAS   RESTAURANT LA EUREKITA', '', '7322162', ''),
(3191, 'Cedula Fisica', 602960927, 'MORAGA SANCHEZ HAZEL', 'PASO CANOAS   RESTAURANT LA EUREQUIT', 'O BANCO POPULAR C.N.', '7322162', ''),
(3192, 'Cedula Fisica', 603180207, 'MORALES ABARCA XINIA', 'A UN COSTADO DE LA ESCUELA DE', 'ÑEQUE EN PUERTO JIMENEZ', '8328414', ''),
(3193, 'Cedula Fisica', 600350409, 'MORALES AGUILAR NOE', 'CARIARI   50 MTS NORTE DE LA', 'IGLESIA EVANGELICA', '', ''),
(3194, 'Cedula Fisica', 500980814, 'MORALES ANGULO FLORA DEYANIRA', 'DELA ESCUELA DE ABROJO 500 MTS', 'FTE A LIC LOPEZ', '7835269', ''),
(3195, 'Cedula Fisica', 601450413, 'MORALES BADILLA GERUNDINO LIBORIO', 'COTO 45 Nº 12035 ENTRADA FTE BODEGA', '** FECHA DE PAGO 15 CADA MES **', '', ''),
(3196, 'Cedula Fisica', 603050160, 'MORALES BADILLA MARJORIE', 'LA FORTUNA X LA PLAZA', '* CANCELA 30 CADA MES', '', ''),
(3197, 'Cedula Fisica', 605300758, 'MORALES CABALLERO MARIA', 'BARRIO SAN JORGE 400MTS NORTE DE LA', 'IGLESIA CATOLICA MADERA NATURAL', '2732-1503', ''),
(3198, 'Cedula Fisica', 602550771, 'MORALES CASTRO GLEN', 'C Cortés   Bº Lourdes   300 oeste de', 'Plaza de deportes.', '8818-2973', ''),
(3199, 'Cedula Fisica', 159100010, 'MORALES CEDEÑO DALYS', 'La Cuesta   Cuervito   175 este de la', 'Antigua comandancia   cc blanco.', '2732-2442', ''),
(3200, 'Cedula Fisica', 602640568, 'MORALES CESPEDES XINIA', 'Drake 100 m atras del puesto prg', 'chancha. Cuñada de Cristopher.', '8628-5290', ''),
(3201, 'Cedula Fisica', 603080936, 'MORALES CESPEDES YORLENY', 'Drake   500 mts sur   camino a los', 'planes de la Iglesia bautista.', '8250387', ''),
(3202, 'Cedula Fisica', 601660442, 'MORALES CHACON MARIA EDITH', 'LA CENTRAL 250MTS AL OESTE DE LA', 'PULPERIA CASA AL FONDO MADERA', '8516-6825', ''),
(3203, 'Cedula Fisica', 600950665, 'MORALES CHAVARRIA VICTOR MANUEL', 'COTO 52 EN ZONITA CASA BLANCA', 'CONTIGUOA OFICINAS DE PALMA TICA', '7835101', ''),
(3204, 'Cedula Fisica', 600950665, 'MORALES CHAVARRIA VICTOR MANUEL', 'Coto 47 casa fte a Gerencia Palma', 'Tica.', '2781-1183', ''),
(3205, 'Cedula Fisica', 602360920, 'MORALES CONCEPCION BOLIVAR', 'Canoas  Ent Tunel 300m sur cs tapia', 'Anaranjada. cs hija.', '8342-6252', ''),
(3206, 'Cedula Fisica', 602450491, 'MORALES CORTES ROXANA', 'Pto Jiménez   Antigua Funeraria.', '', '8825-4489', ''),
(3207, 'Cedula Fisica', 600660960, 'MORALES CRUZ ALVARO', 'C Neily   La Colina   150m Norte Abas', 'tecedor La Colina   casa rosada.', '2783-3782', ''),
(3208, 'Cedula Fisica', 900720924, 'MORALES DURAN WILLIAM', 'P Jiménez  Ñeque 75 O Pulp Flores', 'cel 8504-4184.', '8515-8749', ''),
(3209, 'Cedula Fisica', 601140337, 'MORALES GUIDO JESUS', 'Golfito   Res. Ureña   Cs Nº19', 'Cel 8826-9573.', '2775-2646', ''),
(3210, 'Cedula Fisica', 601600796, 'MORALES JIMENEZ ELPIDIO', 'C.CORTES URB. YENET P. CASA 134', '125 O DEL PARQUE INFANTIL 21 C/M', '7888917', ''),
(3211, 'Cedula Fisica', 600290370, 'MORALES LAZARO JUANA', 'EL CARMEN ABROJO IGLESIA CUADRANGUL', 'AR 150 ESTE', '', ''),
(3212, 'Cedula Fisica', 401490584, 'MORALES LEITON JACKELINE', 'DARIZARA CASA J-10', '** FECHA DE PAGO 15 CADA MES **', '3362307', ''),
(3213, 'Cedula Fisica', 500480136, 'MORALES MENDEZ ALVARO', 'PUNTA ZANCUDO   110 MTS N. DEL', 'RESTAURANT SUSSY CASA C.BLANCO M.D.', '', ''),
(3214, 'Cedula Fisica', 600710127, 'MORALES MORALES EDILBERTO', 'LA AMAPOLA FINCA LA TRINIDAD DE LA', 'ENTRADA A PALO SECO 500 MTS', '', ''),
(3215, 'Cedula Fisica', 600800840, 'MORALES MORALES FIDEL', 'DRAKE 150M DESP. DEL MIRADOR LODGE', '* FECHA DE PAGO 11 C/MES **', '', ''),
(3216, 'Cedula Fisica', 900830011, 'MORALES MORALES JUAN MANUEL', 'BªEL CARMEN DE DONDE WALTER (CHINO)', '200 MTS AL OTRO LADO DEL RIO.', '', ''),
(3217, 'Cedula Fisica', 600370584, 'MORALES MORALES LUISIANO', 'PASO CANOAS FRENTE A ALMACEN MEDIA', 'LUNA. P. 30 C MES.', '', ''),
(3218, 'Cedula Fisica', 900680396, 'MORALES MORALES MARIA TERESA', 'URB. IMAS CASA Nº23', 'CANCELA  8 C/MES', '7887686', ''),
(3219, 'Cedula Fisica', 900680396, 'MORALES MORALES MARIA TERESA', 'C Cortés. Urb. IMAS Cs Nº23', '', '8754-2128', ''),
(3220, 'Cedula Fisica', 601340748, 'MORALES MORALES VERA', 'Hospital Ciudad Neily enfermera', 'Rio Claro frente al I.N.A', '7834111', ''),
(3221, 'Cedula Fisica', 602660833, 'MORALES OBANDO ISABEL', 'ESCUADRA DE CONTE PROYECTO ALBERTO', 'VILLALOBOS.', '8311-5352', ''),
(3222, 'Cedula Fisica', 600590486, 'MORALES OBANDO PASCUALA', 'Comte de Laurel   200m norte Escuela', '', '2776-8054', ''),
(3223, 'Cedula Fisica', 601020190, 'MORALES PORTILLA RAMON', 'LA GUARIA DE PIEDRAS BLANCAS', '300 SURESTE DE ESCUELA 8 C/MES', '8898-0158', ''),
(3224, 'Cedula Fisica', 601020190, 'MORALES PORTILLA RAMON', 'LA GUARIA P. BLANCAS 200 m SUR ESTE', 'ESCUELA. Hija se hizo cargo.', '8980158', ''),
(3225, 'Cedula Fisica', 103580864, 'MORALES QUIROS MANUEL', 'PTO JIMENEZ LA AMAPOLA 200E. DEPULP', 'CALLE A LA PLAYA. CANCELA 11 C/MES*', '3760164', ''),
(3226, 'Cedula Fisica', 500870150, 'MORALES RAMIREZ ELVIRA', '', '', '', ''),
(3227, 'Cedula Fisica', 601081416, 'MORALES RAMIREZ VERA', 'GOLFITO   KM 3 CASA #68 FTE A ENTR.', 'TALLER PAULINO P. 03 C/M.', '750436', ''),
(3228, 'Cedula Fisica', 601080416, 'MORALES RAMIREZ VERA', 'GOLFITO   KM 3 CASA #68 FTE A ENTR.', 'TALLER PAULINO P. 03 C/M.', '7751351', ''),
(3229, 'Cedula Fisica', 602690842, 'MORALES RIVERA MARELI', 'P Norte   90m ent Iglesia Luz del Mu', 'ndo. Cel 8669-1967.', '2786-6896', ''),
(3230, 'Cedula Fisica', 601940105, 'MORALES SALAS JOSE ANGEL', 'CIUDAD CORTES   Bº CANADA 50 MTS O.', 'DE LA PULP.', '-', ''),
(3231, 'Cedula Fisica', 601940105, 'MORALES SALAS JOSE ANGEL', 'CORTEZ B* CANADA 75MTS AL SUR', 'DEL JARDIN CERVECERO 8866-6719', '2788-8141', ''),
(3232, 'Cedula Fisica', 100997530, 'MORALES SALAZAR ELIDA', 'EL ALTO DE KM 35 PULP EL NAZARENO', 'P. 06 CADA MES', '', ''),
(3233, 'Cedula Fisica', 602980727, 'MORALES SALINAS AZALEA', 'GOLFITO KM 1 LA BOLSA CASA Nº 4198', 'EDIFICIO DE TRIBUNALES BISEMANAL', '8257107', ''),
(3234, 'Cedula Fisica', 900690620, 'MORALES SANCHEZ ALCIBIADES', 'Laurel Rio Incendio.150 mts sur de', 'escuela casa n 57', '8762-5867', ''),
(3235, 'Cedula Fisica', 600840222, 'MORALES SANCHEZ LINO ANCELMO', 'RIO CLARO   CARACOL NORTE 200 MTS O.', 'DE LA IGLESIA EVANGELICA.', '*-*-*-*', ''),
(3236, 'Cedula Fisica', 118070055, 'MORALES SANCHEZ SANTY', '', '', '', ''),
(3237, 'Cedula Fisica', 602960044, 'MORALES VIQUEZ SEFERINO', 'P Canoas   Gusano Barrenador   100 N', '200 E calle del Chorizo.', '8683-6897', ''),
(3238, 'Cedula Fisica', 900440369, 'MORENO DE GRACIA RUTH', '', '', '', ''),
(3239, 'Cedula Fisica', 5, 'MORENO FERNANDEZ FROYLAN', 'ALTO LAS VEGAS   CALLE LAS', 'DELICIAS DE RIO CLARO', '', ''),
(3240, 'Cedula Fisica', 501401365, 'MORENO JIMENEZ ODALI', 'RIO CLARO   C.E.N.C.I.N.A.I. O DEL', 'DEL GUABO 800 MTS N. P. 03 C/MES.', '', ''),
(3241, 'Cedula Fisica', 601090414, 'MORENO NAVARRETE OSCAR CC PEJE', 'Palmar Sur   Bº Alemania   cs E18 cos', 'tado de salón comunal  ', '2786-6945', ''),
(3242, 'Cedula Fisica', 500820466, 'MORENO NAVARRO BLANCA AMELIA', 'RIO CLARO   150 m Norte del Tránsito', 'por entrada 3º Casa mano derecha.', '', ''),
(3243, 'Cedula Fisica', 500820466, 'MORENO NAVARRO BLANCA AMELIA', 'R Claro   75 Mts N calle frent trans', 'Cs color verde cemento  ', '8605-6820', ''),
(3244, 'Cedula Fisica', 500980329, 'MORENO NAVARRO JORGE', 'ENTRADA EL GUABO  SODA CECILIA CONTG', 'LIBRERIA EXPRESS. <P> 14 Y 27 C/M', '', ''),
(3245, 'Cedula Fisica', 500980329, 'MORENO NAVARRO JORGE', 'ENTRADA AL GUABO SODA CECILIA CONTG', 'LIBRERIA ESPRES <P> 03 y 16  C/M', '', ''),
(3246, 'Cedula Fisica', 501610603, 'MORENO NAVARRO RAMON', 'RIO CLARO   FRENTE AL TRANSITO', 'X ENTRADA 3er CASA MANO DERECHA', '', ''),
(3247, 'Cedula Fisica', 501210564, 'MORENO VASQUEZ ANTONIO', 'Bº SAN JORGE PULP LA MARIPOSA', 'DE LOS TANQUES 300 MTS NORTE', '7321072', ''),
(3248, 'Cedula Fisica', 501100329, 'MORERA CHAVARRIA LUIS', 'P Canoas   Bº San Jorge   50m oeste', 'Iglesia Mantial de Vida. 8692-4377.', '2732-3469', ''),
(3249, 'Cedula Fisica', 601420626, 'MORERA CHAVARRIA MARCIANO', 'CIUDADELA MADRIGAL 1er ENTRADA C.C.', 'BLANCO Y AZUL X ENTRADA DE C. DOS P', '7751022', ''),
(3250, 'Cedula Fisica', 501100329, 'MORERA CJAVARRIA LUIS', 'C.N Bo LA FUENTE', '', '', ''),
(3251, 'Cedula Fisica', 502070906, 'MORERA DUARTE CESAR', 'GOLF 100 M OESTE ANTIGUO REGISTRO', 'CIVIL CASA BEIS <P> 03 C/M', '775', ''),
(3252, 'Cedula Fisica', 502070906, 'MORERA DUARTE CESAR', 'GOLF 100 M OESTE ANTIGUO REGISTRO', 'CIVIL CASA BEIS <P> 03 C/M', '7899050', ''),
(3253, 'Cedula Fisica', 601860817, 'MORERA FAJARDO LUIS', 'Invu   Laurel Cs17. Trabaja Hospital', 'Neily. Cel 8890-3459.', '2780-0689', ''),
(3254, 'Cedula Fisica', 602610761, 'MORERA GONZALEZ MARTHA', 'Golf  Km 7 purruja en el cacerio Cs', 'A 10 celeste   2775-1026', '8477-5219', ''),
(3255, 'Cedula Fisica', 501330264, 'MORERA MORALES MARITA', 'SIERPE DEL HOTEL OLEAJE SERENO', 'ENTRADA A LA DERECHA 4ª CASA CONT T', '', ''),
(3256, 'Cedula Fisica', 200960690, 'MORERA MORERA JOSE ANGEL', 'RIO CLARO FRENTE A IGLESIA CATOLICA', '<P> 03 C/M', '', ''),
(3257, 'Cedula Fisica', 501130921, 'MORERA PORRAS JOSE', 'BELLA LUZ BAR ABANGARES', '<P> 30 C/M', '*-*-*-*', ''),
(3258, 'Cedula Fisica', 900570401, 'MORERA RODRIGUEZ ELIETH (FLOR)', 'ABROJO DIAG A LA ESC LAS VEGAS', 'COBRAR LABORATORIO <P>', '783', ''),
(3259, 'Cedula Fisica', 601040216, 'MORERA RODRIGUEZ LUIS', 'PAVONES PULP. EL CRUCE PILON.', '<P> 13 C/M', '', ''),
(3260, 'Cedula Fisica', 603260361, 'MORERA SAMUDIO IRVING', 'Golfito  C Madrigal  cs 03 rosada de', 'cemento. Cel 8623-7011.', '2775-5135', ''),
(3261, 'Cedula Fisica', 601740175, 'MORERA SOTO JORGE', 'Km 1 CASA 4484 3era FILA HOTEL', 'SIERRA P.03 Y 16 C/M', '', ''),
(3262, 'Cedula Fisica', 601280884, 'MORERA VARGAS  MARIANA', 'LA BOTA DE LA CUESTA', '', '7323479', ''),
(3263, 'Cedula Fisica', 500870603, 'MOSQUERA MOSQUERA JOSEFA', 'Palmar norte.', '', '', ''),
(3264, 'Cedula Fisica', 500870603, 'MOSQUERA MOSQUERA JOSEFA', 'Palmar norte.', '', '', ''),
(3265, 'Cedula Fisica', 602170314, 'MOYA ARIAS JOSE', 'Palmar   Bº Alemania   Dos casas des-', 'pués pulp. Deilyn Cs Nº Y20 8639-85', '2786-6428', ''),
(3266, 'Cedula Fisica', 301040734, 'MOYA BRENES RODRIGO', 'Las Fincas Coto 54 comisariato', 'P. 30 C/M', '7833497', ''),
(3267, 'Cedula Fisica', 700300891, 'MOYA CARVAJAL BLANCA NIEVES', 'Bo El Carmen   300 mts de la entrada', 'a Manu.', '7832300', ''),
(3268, 'Cedula Fisica', 500910754, 'MOYA CASTRO BRAULIO', 'La Gamba Golfito   camino al hotel', 'contiguo a la Escuela vieja.', '', ''),
(3269, 'Cedula Fisica', 500910754, 'MOYA CASTRO BRAULIO', 'La Gamba Golfito   camino al hotel', 'contiguo a la Escuela vieja.', '8313-0015', ''),
(3270, 'Cedula Fisica', 600630607, 'MOYA CASTRO DANILO', 'La Gamba   100 mts de salon comunal', 'Csal fondo verde malla. 2741-8010', '', ''),
(3271, 'Cedula Fisica', 500520516, 'MOYA CHAVEZ ARISTIDES', 'Laurel; Invu Casa 32.', 'p.15 c/m', '', ''),
(3272, 'Cedula Fisica', 600680370, 'MOYA DIAZ ELIBETH', 'golfito km 1 casa #4447 primera', 'fila cobrar en el hospital', '7750415', ''),
(3273, 'Cedula Fisica', 601081057, 'MOYA DIAZ GUSTAVO', 'GOLFITO EN LA MONA FRENTE DE LA CAN', 'CHA SINTETICA', '7756070', ''),
(3274, 'Cedula Fisica', 601150376, 'MOYA GUTIERREZ AUGUSTIO CESAR', 'GOLFITO', '', '', ''),
(3275, 'Cedula Fisica', 601150376, 'MOYA GUTIERREZ AUGUSTO CESAR', 'CIUDAD NEILY   Bº SAN RAFAEL DEL', 'SALON COMUNAL 50 MTS NORTE 15 Y 30', '', ''),
(3276, 'Cedula Fisica', 602970120, 'MOYA GUTIERREZ KARLA', 'GOLFITO   KMT 3 FRENTE A LA PLAZA', 'CASA Nº 41', '7751591', ''),
(3277, 'Cedula Fisica', 602970120, 'MOYA GUTIERREZ KARLA', 'GOLFITO   KMT 3 FRENTE A LA PLAZA', 'CASA Nº 41', '7751591', ''),
(3278, 'Cedula Fisica', 800470589, 'MOYA MORA CARLOS', 'GOLFITO   KM 3 CASA Nº 41 CONTIGUO', 'A CANTINA VIEJA A MANO DERECHA.', '7751591', ''),
(3279, 'Cedula Fisica', 600750209, 'MOYA NAGERA MARIA MERCEDES.', 'GOLFITO   HOSPITAL O EN Bº BELLA', 'VISTA C.# 4064 FTE A CANCHA BASKET.', '750011', ''),
(3280, 'Cedula Fisica', 600750209, 'MOYA NAJERA MARIA MERCEDES', 'GOLF.B\' BELLA VISTA P.CASA #4064', 'FRENTE CANCHA DE BEISBOL P.02 C/M', '750077', ''),
(3281, 'Cedula Fisica', 600200953, 'MOYA ZUÑIGA GEORGINA', 'LAS GAMBAS   CONTG A ANTIGUO SALON', 'LAS GAMBAS <P> 19 C/M', '', ''),
(3282, 'Cedula Fisica', 601330586, 'MUNOZ MORA MANUEL', 'FCA. ALAJUELA DE LA PULP. VICTOR', 'CASTILLO 400 O. <P> 10 C/M', '', ''),
(3283, 'Cedula Fisica', 501640580, 'MUÑOS LOPEZ ISABEL', 'cocal amarillo de pavone de', 'fabrica de chile', '-------', ''),
(3284, 'Cedula Fisica', 603290978, 'MUÑOZ CANO PRISCILLA', 'Laurel   150m norte de Farmasur', 'cc natural. 8885-9622', '2780-0078', ''),
(3285, 'Cedula Fisica', 601190339, 'MUÑOZ CORDERO DINARAH', 'Bº San Jorge antig pulp carmencita', '500 Mts al Oeste.', '8674-0136', ''),
(3286, 'Cedula Fisica', 601190339, 'MUÑOZ CORDERO DINORAH', 'PASO CANOAS DIAG PULP CARMENCITA', '<P> 30 C/M', '', ''),
(3287, 'Cedula Fisica', 601190331, 'MUÑOZ CORDERO DINORAH.', 'PASO CANOAS   SAN JORGE 50 M ANTES', 'DE PULP CARMENCITA.P-30 C/M.', '', ''),
(3288, 'Cedula Fisica', 900680802, 'MUÑOZ GONZALEZ ARACELY', '200 MTS SUR DEL DIVINO PASTOR', 'COLORADITO SUR', '7836046', ''),
(3289, 'Cedula Fisica', 900720171, 'MUÑOZ GONZALEZ MIRNA.', 'HOSP CIUDAD NEILY O EN ENTRADA A LA', 'MARIPOSA CALLE A PASO CANOAS.', '', ''),
(3290, 'Cedula Fisica', 900720171, 'MUÑOZ GONZALEZ MIRNA.', 'HOSP CIUDAD NEILY O EN ENTRADA A LA', 'MARIPOSA CALLE A PASO CANOAS.', '7834948', ''),
(3291, 'Cedula Fisica', 500570805, 'MUÑOZ LOPEZ BALBINO', 'PTO JIMENEZ Bº JIMENEZ Bº MONTE REY', 'DESPUES DE CAÑAZA ULTIMA CASA', '', ''),
(3292, 'Cedula Fisica', 102030544, 'MUÑOZ MADRIGAL JUAN', 'JIMENEZ URB SAN LAZARO 400 MTRS DE', 'LA ENTRADA  TALLER DIEGO', '7355485', ''),
(3293, 'Cedula Fisica', 500820719, 'MUÑOZ MARIN RAMON', 'LA ESTRELLA COMTE 100MTS SUR PANADE', 'RIA LA ESTRELLA CASA MIXTA IZQUIERD', '8698-0098', ''),
(3294, 'Cedula Fisica', 602760258, 'MUÑOZ MORERA MARVIN', 'Palmar   Sierpe   Contiguo a Hielera', 'Vieja. Direc. Nueva.Cel 8615-5949.', '2788-1336', ''),
(3295, 'Cedula Fisica', 109760986, 'MUÑOZ PICADO LANDELINO', 'P Canoas  Bº S Martín  300 este de la', 'Escuela.', '8623-5552', ''),
(3296, 'Cedula Fisica', 600220172, 'MUÑOZ RODRIGUEZ RAFAEL', 'Sabalito  Bº antg colegio cost plaza', 'Cs Blanca vergas negras  ', '2784-0294', ''),
(3297, 'Cedula Fisica', 102150045, 'MUÑOZ SALAZAR RAFAELA', 'Bº SAN MARTIN FRTE A PULP CASA 16', 'ENTRADA POR DONDE ESTA EL TELEFONO', '7750785', ''),
(3298, 'Cedula Fisica', 601170737, 'MUÑOZ SANTAMARIA DOMINGO', 'Golfito   La Mona ciud   Madrigal de', 'bar los Monos 75 N.  2775-5192', '8813-0693', ''),
(3299, 'Cedula Fisica', 103110687, 'MUÑOZ VALVERDE JESUS', 'Ciudad Neilly del Taller Siul 500', 'mts la Fortuna', '', ''),
(3300, 'Cedula Fisica', 602920165, 'MUÑOZ VALVERDE JESUS', 'PIEDRAS BLANCAS 200 MTS N. DEL', 'CEMENTERIO. P.19 DE C/M', '783', ''),
(3301, 'Cedula Fisica', 103110687, 'MUÑOZ VALVERDE JESUS', 'Bº EL CARMEN   CASA Nº 64 DE PULP DE', 'LUIS GUTIERREZ 200 MTS', '7836065', ''),
(3302, 'Cedula Fisica', 140580331, 'MUÑOZ VASQUEZ LIBIA SARAY', 'pto jimenez agrobambu', '', '', ''),
(3303, 'Cedula Fisica', 603210435, 'MUÑOZ VEGA ROGER', 'JIMENEZ   EL ÑEQUE PULP LAS FLORES', '', '8321435', ''),
(3304, 'Cedula Fisica', 603070057, 'MUÑOZ VEGA RONALD', 'P Jiménez  2 Brazos  200 O Escuela.', '', '8631-5454', ''),
(3305, 'Cedula Fisica', 602760045, 'MUÑOZ VEGA YORLENY', 'Pto Jiménez   Gallardo   100m E de la', 'Escuela.', '8517-9624', ''),
(3306, 'Cedula Fisica', 501660993, 'MUÑOZ VILLALOBOS FLOR', 'P Jiménez  Agujas  50 O Puente Terro-', 'nes   cs rotulo Perros Bravos.', '8640-0748', ''),
(3307, 'Cedula Fisica', 104800466, 'MURILLO ALVARADO J.ANGEL CC RODOLFO', 'Golfito Km7   200m NE Bar Escondite', 'cs papaya 8375-5949. 2775-1019.', '2775-1563', ''),
(3308, 'Cedula Fisica', 601610184, 'MURILLO AVILES VICTOR HUGO', 'CIUDAD NEILY Bº SALAS VINDAS TALLER', 'MURILLO * FECHA DE PAGO 15 C/MES *', '7833490', ''),
(3309, 'Cedula Fisica', 601910808, 'MURILLO CERDAS YAMILETH', 'LA CUESTA 800 OESTE CARRETERA', 'A LA PALMA', '8226986', ''),
(3310, 'Cedula Fisica', 160540752, 'MURILLO CHAMORRO MARIANO', 'pto jimenez zandalo fret a', 'pulperia burumbun', '', ''),
(3311, 'Cedula Fisica', 900860201, 'MURILLO JIMENEZ JIMMY', 'EL TRIUNFO 100 Mts OESTE DE', 'PULP. EL TRIUNFO <P> OFICINA', '', ''),
(3312, 'Cedula Fisica', 500340565, 'MURILLO MENA PEDRO', 'LA PALMA CALLE A GUADLAUPE', '** 13 CADA MES **', '735106', ''),
(3313, 'Cedula Fisica', 600850027, 'MURILLO MENA ULADISLAO (LALO)', '', '', '', ''),
(3314, 'Cedula Fisica', 602900854, 'MURILLO MEZA MARITA', 'Palmar Norte; BARRIO ALEMANIA', 'CASA M.14', '756186', ''),
(3315, 'Cedula Fisica', 601280313, 'MURILLO MORA TEODORO', '', '', '', ''),
(3316, 'Cedula Fisica', 602000158, 'MURILLO MURILLO CARLOS ALFREDO', 'Paso Canoas del Taller Vega 50 mts', 'al este carretera a al Cuesta', '', ''),
(3317, 'Cedula Fisica', 601530869, 'MURILLO PALMA EMILCE', 'Drake  Agujitas  50 m de la Escuela.', 'Cel 8683-8554.', '2775-1451', ''),
(3318, 'Cedula Fisica', 502430883, 'MURILLO PALMA UBER', 'Drake  Agujitas  contiguo cabinas Mu', 'rillo. Cel 8892-7702.   2775-0738', '2775-0224', ''),
(3319, 'Cedula Fisica', 502570902, 'MURILLO RAMIREZ RONALD', 'JIMENEZ EL BANBU TALLER WIKO', '', '8849-1359', ''),
(3320, 'Cedula Fisica', 601970549, 'MURILLO ULLOA ANA IRIS', 'PALMAR NORTE CARRETERA A CORTES', 'TALLER EL PAISA', '7866094', ''),
(3321, 'Cedula Fisica', 700210296, 'MURILLO VARGAS RICARDO', '', '', '', ''),
(3322, 'Cedula Fisica', 112980785, 'MURILLO VASQUEZ ALONSO', 'Ciudad Cortés   Precario', '', '8767-7134', ''),
(3323, 'Cedula Fisica', 602730670, 'NAJERAS CASCANTE LIDIER', 'P Canoas   Veracruz   cs 22', '', '8518-0398', ''),
(3324, 'Cedula Fisica', 102900698, 'NARANJO BLANCO CARMEN.', 'CIUDAD NEILY   250 MTS ESTE DE LA', 'ANTIGUA PLANTA DEL I.C.E.', '', ''),
(3325, 'Cedula Fisica', 600810521, 'NARANJO BLANCO DOMINGO.', 'VELLA LUZ POR ASERRADERO.', '', '', ''),
(3326, 'Cedula Fisica', 600710642, 'NARANJO BLANCO MARIA TERESA', 'Fca Guanacaste  800 M de entrada Cs', 'mixta amarillo y azul   8729-0288', '8729-0288', ''),
(3327, 'Cedula Fisica', 502230599, 'NARANJO ESQUIVEL JORGE', '', '', '', ''),
(3328, 'Cedula Fisica', 201570088, 'NARANJO SANCHEZ RAFAEL', 'LA CUESTA PULP. EL KOKITO.', '', '', ''),
(3329, 'Cedula Fisica', 201570088, 'NARANJO SANCHEZ RAFAEL.', 'LA CUESTA   PULPERIA EL COQUITO', 'PAGA 15 DE C/M.', '', ''),
(3330, 'Cedula Fisica', 201570088, 'NARANJO SANCHEZ RAFAEL.', 'La Cuesta   200m del Parque camino a', 'Laurel.', '2732-2096', ''),
(3331, 'Cedula Fisica', 601150072, 'NATIVIDAD RUIZ ROSALES', 'Golfito; Residencial Ureña 2º entra', 'da   md casa Nº M5.', '', ''),
(3332, 'Cedula Fisica', 700610876, 'NAVARRETE FUENTES MARIA DELATRINIDA', 'RIO CLARO BARRIO SANTIAGO DETRAS DE', 'LA ESCUELA *FECHA DE PAGO17 C/MES*', '7897157', ''),
(3333, 'Cedula Fisica', 700610876, 'NAVARRETE FUENTES MARIA TRINIDAD', 'RIO CLARO BARRIO SANTIAGO DETRAS DE', 'LA ESCUELA.', '8941-1755', ''),
(3334, 'Cedula Fisica', 600560987, 'NAVARRETE JIMENEZ CARMEN', 'LA CUESTA CUIDADELA CAMAYO', 'CASA *13 COLOR BLANCO', '8555-3885', ''),
(3335, 'Cedula Fisica', 800350519, 'NAVARRETE NAVARRETE EFRAIN', 'Bº EL CARMEN DE CASETILLA DE POLI..', '50 M. NORTE CASA 66', '7836079', ''),
(3336, 'Cedula Fisica', 501260067, 'NAVARRETE ONDOY MARCOS', 'R Claro   Coto 63   casa 15526.', '', '8752-8084', ''),
(3337, 'Cedula Fisica', 701000347, 'NAVARRETE SOLANO MARISOL', 'Uvita  calle al mariposario  cs antes', 'color papaya.', '8945-2904', ''),
(3338, 'Cedula Fisica', 900730800, 'NAVARRETE VEGA FRANCISCO', 'RIO CLARO OFICINAS DE INFOCOP.', '<P> 03 C/M', '7899362', ''),
(3339, 'Cedula Fisica', 601370530, 'NAVARRETE VEGA Mº DE LOS ANGELES', 'Puerto Jiménez', '', '', ''),
(3340, 'Cedula Fisica', 602280790, 'NAVARRETE VEGA YAMILETH', 'GOLFITO Bº BELLA VISTA FTE  PARQUE', 'CASA Nº 8137 AMARILA CANCELA 3 C/ME', '7753050', ''),
(3341, 'Cedula Fisica', 102740762, 'NAVARRO CASTILLO BENIGNO', 'CARACOL NORTE CONTIGUO A PULP. FOFO', '', '7836693', ''),
(3342, 'Cedula Fisica', 502000069, 'NAVARRO CORELLA IRMA.', 'Puerto Jimenez   Matapalo   casa la', 'luz   telefono. 83653103 83599045.', '3653103', ''),
(3343, 'Cedula Fisica', 106370116, 'NAVARRO GARCIA ESMERALDA', 'P Jiménez   Gallardo 500m N Escuela  ', 'calle a Sándalo. Colegio Jiménez.', '8663-4595', ''),
(3344, 'Cedula Fisica', 603050587, 'NAVARRO GOMEZ PATRICIA', 'TINOCO 100MTS DEL ANTIGUO SENCIANE', 'PALMAR', '2786-3104', ''),
(3345, 'Cedula Fisica', 202480244, 'NAVARRO HERNANDEZ MARGARITA', 'EL NEQUE PTO JIMENEZ 200MTS', 'DE LA PULPERIA LA FLOR', '8833-8243', ''),
(3346, 'Cedula Fisica', 900290833, 'NAVARRO NAVARRO AURORA.', 'GOLFITO   PUEBLO CIVIL ENTRADA FTRE', 'A LA EUREKITA A 25 MTS. PAGA 3 C/M', '', ''),
(3347, 'Cedula Fisica', 601670574, 'NAVARRO RIVERA CRISTINA.', 'GOLFITO  ', '', '', ''),
(3348, 'Cedula Fisica', 601670574, 'NAVARRO RIVERA CRISTINA.', 'GOLFITO  ', '', '', ''),
(3349, 'Cedula Fisica', 602190612, 'NAVARRO ROJAS ALCIDES', '', '', '', ''),
(3350, 'Cedula Fisica', 603750947, 'NAVARRO SALAZAR ABNER', 'LA CARTONERA CASA *2 BLOQUE A', 'CASA COLOR VERJAS VINO', '8644-7580', ''),
(3351, 'Cedula Fisica', 105890315, 'NAVARRO UMAÑA REINA', 'UVITA AUN COSTADO DE FERRETERIA IGU', 'ANA VERDE CASA CELESTE', '2743-8092', ''),
(3352, 'Cedula Fisica', 601340751, 'NAVARRO VILLALOBOS VICTOR FRANCISCO', 'Kmt 12 LA MONA   BAR LA RUEDA.', 'P. 03 Y 16 C/M', '', ''),
(3353, 'Cedula Fisica', 602020685, 'NAVAS MENA RUTH', 'Cortés   Uvita; El Chamán contiguo a', 'mueblería de Carlos Porras.', '', ''),
(3354, 'Cedula Fisica', 606620295, 'NIETO ARAUZ DOMINGO', 'FINCA GUANACASTE CARRETERA A', 'PALMAR NORTE 2da ENTRADA DESP PLAZA', '', ''),
(3355, 'Cedula Fisica', 602050629, 'NIETO BRENES FELIX', 'R. Claro Calle San Ramón   Puente 2º', 'Ent. Telf público 6º casa MI.', '8760-8176', ''),
(3356, 'Cedula Fisica', 602440013, 'NIETO CONCEPCION FELIX REYNALDO', 'JIMENEZ B* BAMBU DE LA PULPE', '50MTS AL SUR CASA COLOR AZUL', '8831-2289', ''),
(3357, 'Cedula Fisica', 600850201, 'NIETO CONCEPCION MARIA LUCIA', 'Golfito   la mona Ciud Buenos Aires', 'contg  igles evang C crema 27750989', '8769-5828', ''),
(3358, 'Cedula Fisica', 600960186, 'NIETO CONCEPCION PAULA', 'GOLFITO EN OFICINAS DE TRACOPA', '', '', ''),
(3359, 'Cedula Fisica', 600960186, 'NIETO CONCEPCION PAULA', 'GOLFITO EN OFICINAS DE TRACOPA', 'Bº UREÑA Nº16C ** CANCELA 1 C/MES *', '7757632', ''),
(3360, 'Cedula Fisica', 601410705, 'NIETO LOPEZ CATALINA.', 'GOLFITO.', '', '', ''),
(3361, 'Cedula Fisica', 601290383, 'NIETO LOPEZ FRANCISCO', 'GOLFITO LA MONA Bº BUENOS AIRES', '** FECHA DE PAGO 17 C/MES **', '7755102', ''),
(3362, 'Cedula Fisica', 602700337, 'NIETO VARGAS ELIZABETH', 'PURRUJA Bo TUCLER MARTINEZ', 'CASA F-3', '2775-0579', ''),
(3363, 'Cedula Fisica', 600630606, 'NIETO VILLAREAL JUAN', 'FCA ALAJUELA 3RA CASA', '', '7411067', ''),
(3364, 'Cedula Fisica', 155801448, 'NONORIS AGUIRRE ERNESTO GERONIMO', 'Paso Canoas  Bº Bettel de igles adve', '50 S y 100 O Cs color Papaya  ', '2732-3795', ''),
(3365, 'Cedula Fisica', 202610661, 'NOVOA MOLINA ESPERANZA', 'PASO CANOAS MOTO REPUESTOS DEL SUR', 'calle a la cuesta <P> 30 C/m', '', ''),
(3366, 'Cedula Fisica', 202610661, 'NOVOA MOLINA ESPERANZA', 'PASO CANOAS EN REPUESTOS DEL SUR', '*** CANCELA 15 Y 30 C/MES', '7322016', ''),
(3367, 'Cedula Fisica', 202610661, 'NOVOA MOLINA ESPERANZA', 'P Canoas   Motorepuestos del Sur', '', '2732-2016', ''),
(3368, 'Cedula Fisica', 600810078, 'NOVOA NOVOA LUCIANO', 'SIERPE EN LA VUELTA 3RA CASA', 'MANO IZQUIERDA PORTON CELESTE', '', ''),
(3369, 'Cedula Fisica', 601150579, 'NUÑEZ ALPIZAR FELIX ANGEL', 'Agua Buena   500 M N   esc San franci', 'Cs Beige c rojo   2734-0461', '5714-6851', ''),
(3370, 'Cedula Fisica', 603160067, 'NUÑEZ CHINCHILLA HAFETH MAURICIO', 'SALAS VINDAS   ENTRADA CARAVACA OCTA', 'VO CASA IZQUIERDA. 27831716', '8707-4370', ''),
(3371, 'Cedula Fisica', 500760134, 'NUÑEZ CORTES EPIFANIA', 'LA CUESTA   CIUDADELA TAMAYO C.11-A', '', '7321302', ''),
(3372, 'Cedula Fisica', 601530940, 'NUÑEZ GRANADOS ALIS', 'RIO CLARO BAMBEL *3 ENTRADA A TRILL', 'IZAS 600 MTS OESTE', '8671-6086', ''),
(3373, 'Cedula Fisica', 600600309, 'NUÑEZ HERRA RODRIGO', 'Kmt 20 350 Mts OESTE FRENTE A LA', 'GRANJA <P> 03 C/M', '', ''),
(3374, 'Cedula Fisica', 602700120, 'NUÑEZ JIMENEZ LORENA', 'Golfito   La Mona detas de la esc  ', 'Bº el progreso   2775-2140', '8754-8473', ''),
(3375, 'Cedula Fisica', 601710845, 'NUÑEZ LOPEZ FRANKLIN', 'PUEBLO NUEVO DE COTO PULP. LA', 'NACIONAL FRENTE LA PLAZA.27 C/M', '*-*-*-*', ''),
(3376, 'Cedula Fisica', 900040506, 'NUÑEZ MENDOZA MIGUEL ANGEL', 'COTO 54 CASA Nº 13121 CASAS', 'DETRAS DE LA PLANTA ACEITERA', '7811392', ''),
(3377, 'Cedula Fisica', 106830161, 'NUÑEZ MONGE FRANKLIN', 'PTO JIMENEZ CASA DOÑ ELSA VARGAS LA', 'PALMA FRENTE ALMAC LA PALMA P.11', '775', ''),
(3378, 'Cedula Fisica', 601530139, 'NUÑEZ PEREZ MARITZA', 'La Cuesta   calle a Cuervito despues', 'de Iglesia Adventista.', '7322335', ''),
(3379, 'Cedula Fisica', 603070725, 'NUÑEZ PEREZ MARYLUZ', 'Cuervito de la cuesta 500 mts del', 'parque   calle a Cuervito', '2732-2335', ''),
(3380, 'Cedula Fisica', 901030466, 'NUÑEZ QUESADA MARIA CECILIA', 'COTO 47 DESPUES DEL TALLER ENTRADA', 'FICA 50 A MANO IZQ CASA Nª 11784', '9518041', ''),
(3381, 'Cedula Fisica', 603500915, 'NUÑEZ RIVERA JAVIER', 'P Jiménez  Urba  Diag sala Bellísima.', '', '8771-6369', ''),
(3382, 'Cedula Fisica', 601070280, 'NUÑEZ ROJAS WILLIAM', 'C.CORTES 2DA CASA A LA DERECHA  DEL', 'CRUCE HACIA CANADA CANCELA 20 C/MES', '', ''),
(3383, 'Cedula Fisica', 509010382, 'NUÑEZ ROSALES MARCELINA', '', '', '', ''),
(3384, 'Cedula Fisica', 500910382, 'NUÑEZ ROSALES MARCELINA', '50 M SUR DE ANTIGUO HOSPITAL CIUDAD', 'CORTES   8 DE CADA  MES', '7888086', ''),
(3385, 'Cedula Fisica', 601420611, 'NUÑEZ SALAZAR MARCOS', 'Pavones  La Fortuna  500 m Oeste de l', 'a Escuela.', '2780-1485', ''),
(3386, 'Cedula Fisica', 603440691, 'NUÑEZ SANCHEZ ELEINER', 'LAUREL CARACOL DE LA VACA 300MTS SU', 'R DE PALMATEC', '8547-1883', ''),
(3387, 'Cedula Fisica', 603250199, 'NUÑEZ SANCHEZ ELSA', 'CARRACOL DE LA VACA   100 MTS NORTE', 'DE LA PLAZA', '8644-1401', ''),
(3388, 'Cedula Fisica', 602740093, 'NUÑEZ SANDI ELSI', 'C Neily   Bº Uned   Cabinas Ríos Nº7', '', '8519-8494', ''),
(3389, 'Cedula Fisica', 603210930, 'NUÑEZ SANDI MARIANA', 'Veracruz Casa Nº 22.', '', '8644-5910', ''),
(3390, 'Cedula Fisica', 600450832, 'NUÑEZ SOLIS WALTER', 'CAÑAZA DE LA ESCUELA 500 MTS', 'AL OESTE', '', ''),
(3391, 'Cedula Fisica', 201130742, 'NUÑEZ SOTO AUSTELINA', 'SAN RAMON DE RIO CLARO URBA EL', 'ESFUERZO 2da FILA CASA Nº 59', '', ''),
(3392, 'Cedula Fisica', 202140045, 'NUÑEZ UMAÑA FERNANDO', 'GOLF   Bº BELLA VISTA C. DE TELMA', '<P> 03 C/M', '775', ''),
(3393, 'Cedula Fisica', 906300131, 'NUÑEZ UMAÑA TERESA', 'P JIMENEZ 450M BOMBA OSA CALLE KARA', 'TE. MUEBLERIA.', '2735-5517', ''),
(3394, 'Cedula Fisica', 800480643, 'OBANDO ACEVEDO LUCRECIA', 'LA CUESTA SODA CONTG A CENTRO DE', 'AMIGOS <P> 30 C/M', '', ''),
(3395, 'Cedula Fisica', 800480643, 'OBANDO ACEVEDO LUCRECIA', 'LA CUESTA SODA CONTG A CENTRO DE', 'AMIGOS   O 1 KMT CALLE A LAUREL', '7322958', ''),
(3396, 'Cedula Fisica', 500870819, 'OBANDO ANGULO ERASMO', 'BARRIO SAN JORGE DE LA PULP.LA', 'ESQUIN. 200 MTS OESTE P. 15Y30 C/M', '', ''),
(3397, 'Cedula Fisica', 601210832, 'OBANDO ARRIETA RITA MARIA', 'C. CORTES DE OFICINAS DE ICE 300MTS', 'N. Y 25MTS OESTE. CANCELA 21 C/MES', '7888855', ''),
(3398, 'Cedula Fisica', 601210832, 'OBANDO ARRIETA RITA MARIA', 'C. Cortes  San Antonio  detrás de la', 'Panadería Naomi. Cel 8531-7023.', '2788-8855', ''),
(3399, 'Cedula Fisica', 601450409, 'OBANDO ARRIETA RUTH', 'CORTES Bº S.ANTONIO FTE A PULP 4 AS', '', '8331-3420', ''),
(3400, 'Cedula Fisica', 601450409, 'OBANDO ARRIETA RUTH', 'CORTES Bº S.ANTONIO DIAGONAL SUPER', 'ZAMORA.', '8331-3426', ''),
(3401, 'Cedula Fisica', 603310232, 'OBANDO BRICEÑO ERICKA', 'Coto 56 frente a la bodega 1º casa.', '', '8768-9948', ''),
(3402, 'Cedula Fisica', 602040456, 'OBANDO DELGADO BERENICE', 'PUERTA DEL SOL   S FRANCISCO TINOCO', 'Ya no trabaja en el Deposito.', '7863153', ''),
(3403, 'Cedula Fisica', 602040456, 'OBANDO DELGADO BERENICE', 'La Puerta del Sol San Francisco de', 'Tinoco     8659-8419', '8423-9887', ''),
(3404, 'Cedula Fisica', 600670865, 'OBANDO GUTIERREZ MARIA', 'NO SE REGISTRO', '', '', ''),
(3405, 'Cedula Fisica', 600670865, 'OBANDO GUTIERREZ MARIA', 'GOLFITO   Bº SAN ANDRES IMAS CASA', '# 11', '7751221', ''),
(3406, 'Cedula Fisica', 600670865, 'OBANDO GUTIERREZ MARIA', 'GOLFITO   Bº SAN ANDRES IMAS CASA', '# 11', '7751221', ''),
(3407, 'Cedula Fisica', 600670865, 'OBANDO GUTIERREZ MARIA', 'GOLFITO   Bº SAN ANDRES IMAS CASA', '# 11', '7751221', ''),
(3408, 'Cedula Fisica', 600670865, 'OBANDO GUTIERREZ MARIA', 'GOLFITO B. SAN ANDRES IMAS CASA', 'N. 11', '7751221', ''),
(3409, 'Cedula Fisica', 502290856, 'OBANDO MARTINEZ TERESA', 'Drake  50 N y 50 Oest de igles evang', 'Cs madera Rosada    8622-1307', '8512-9329', ''),
(3410, 'Cedula Fisica', 500870106, 'OBANDO OBANDO ADAL ALBERTO', 'PASO CANOAS Bº SAN JORGE DE PULP', 'LA MARIPOSA', '', ''),
(3411, 'Cedula Fisica', 500870106, 'OBANDO OBANDO ADAL ALBERTO', 'PASO CANOAS Bº SAN JORGE DE PULP', 'LA MARIPOSA 200 MTS. CASA ESQUIN.', '', ''),
(3412, 'Cedula Fisica', 601490288, 'OBANDO OBANDO ALEXIS', 'FINCA GUANACASTE   PULP. LA AMISTAD', '', '7833769', ''),
(3413, 'Cedula Fisica', 601490288, 'OBANDO OBANDO ALEXIS', 'f.c.a. Guanacaste', '', '', ''),
(3414, 'Cedula Fisica', 501700296, 'OBANDO OBANDO ELIZABETH', '', '', '', ''),
(3415, 'Cedula Fisica', 600600243, 'OBANDO OBANDO ISIDRA', 'SANTA ROSA DE VENECIA POR LA ESCUEL', '', '', ''),
(3416, 'Cedula Fisica', 501060145, 'OBANDO OBANDO JOSE ABELARDO', 'GOLF   LLANO BONITO CASA # 4912', '<P> 03 C/M', '775', ''),
(3417, 'Cedula Fisica', 501060145, 'OBANDO OBANDO JOSE ABELARDO', 'GOLF   LLANO BONITO CASA # 4912', '<P> 03 C/M', '775', ''),
(3418, 'Cedula Fisica', 501060195, 'OBANDO OBANDO JOSE ABELARDO', 'GOLFITO   LLANO BONITO CASA 49-12', '', '7750741', ''),
(3419, 'Cedula Fisica', 600331003, 'OBANDO OBANDO JOSE FRANCISCO', 'CIUDAD NEILY 22 DE OCTUBRE C. Nº 7', 'BLOKE.', '7835791', ''),
(3420, 'Cedula Fisica', 602960059, 'OBANDO OBANDO LUIS ALBERTO', 'COTO 42 CONTIGUO A IGLESIA', 'CUADRANGULAR', '2781-1172', ''),
(3421, 'Cedula Fisica', 500222975, 'OBANDO OBANDO OTILIO', 'RESIDENCIAL UREÑA   CASA #I-17 DEL', 'PARQUE 1era.FILA OCTAVA CASA.', '7751816', ''),
(3422, 'Cedula Fisica', 600970298, 'OBANDO ORTEGA JOSE', 'C Neily   22 Octubre   Fte Cementerio', 'cs Nº 13a.', '', ''),
(3423, 'Cedula Fisica', 601490041, 'OBANDO RIVAS ESPERANZA', 'GOLFITO KM 2 OFICINA DE RECURSOS', 'HOSPITAL. P.15 Y 30 DE C/M.', '775', ''),
(3424, 'Cedula Fisica', 500720065, 'OBANDO SILVA DARIO', 'GOLFITO   LA BOLSA 5ta FILA', 'CASA Nº 4155', '', ''),
(3425, 'Cedula Fisica', 500720065, 'OBANDO SILVA DARIO', 'GOLFITO Km1 C.Nº4155 cont. Tortugas', 'Ninja. Paga Erick Obando Tribunales', '2667-8354', ''),
(3426, 'Cedula Fisica', 603530025, 'OBANDO UMAÑA GREIVIN', 'RIO INCENDIO.', '', '', ''),
(3427, 'Cedula Fisica', 601350449, 'OBANDO VEGA ROSA', 'C Neily   Ciud 22 Octubre  cs1 Bloque', 'E.', '2783-3066', ''),
(3428, 'Cedula Fisica', 500730867, 'OBANDO VILLAGRA MARIA ANTONIA', 'COTO 45 CASA Nº 1243 FTE ABSTECEDOR', '** CLIENTE CONOSIDO 15 CADA MES **', '7811414', ''),
(3429, 'Cedula Fisica', 500730867, 'OBANDO VILLAGRA MARIA ANTONIA', 'COTO 45 CASA Nº 1243 FTE ABSTECEDOR', 'Cel 8946-6354.', '2781-1414', ''),
(3430, 'Cedula Fisica', 500730867, 'OBANDO VILLAGRA MARIA ANTONIA', 'COTO 45 CASA Nº 1243 FTE ABSTECEDOR', 'Cel 8946-6354.', '2781-1414', ''),
(3431, 'Cedula Fisica', 500730867, 'OBANDO VILLAGRA MARTA ANTONIA', 'COTO FINCA 45   CASA Nº 1243 FRENTE', 'AL COMISARIATO.', '', ''),
(3432, 'Cedula Fisica', 501700084, 'OBREGON AGUIRRE EFIGENIO', 'BEREH DE LAUREL DE LA PLAZA 50MTS', 'OESTE', '2780-1284', ''),
(3433, 'Cedula Fisica', 205100274, 'OBREGON ALEMAN ANA LORENA', 'rio nuevo casa c-125', '', '', ''),
(3434, 'Cedula Fisica', 601210423, 'OBREGON CAMPOS MARIA CRISTINA', 'Pto Jimènez   Urb.El Colegio casa G8', 'de Mango Real 2º entrada.', '7325796', ''),
(3435, 'Cedula Fisica', 109010611, 'OBREGON CAMPOS VIRGINIA', 'NARANJO URBA   NARANJA PULPE', 'NARANJITO. Cel8983-2285.', '2780-1759', ''),
(3436, 'Cedula Fisica', 603330392, 'OBREGON PERALTA VICENTE', 'ENTRADA X ZANDALO CARRETERA A TIGRE', '2da ENTRADA M.IZQ 3er CASA C.VERDE', '', ''),
(3437, 'Cedula Fisica', 601630318, 'OBREGON TORRES SANTOS.', 'LA FORTUNA 100 MTS OESTE PULP', 'FRANUDY.', '7833799', ''),
(3438, 'Cedula Fisica', 502400315, 'OBREGON VILLEGAS JOSE GUILLERMO', '', '', '', ''),
(3439, 'Cedula Fisica', 800400704, 'OCAMPOS RODRIGUEZ ALFREDO', 'Km 2 GOLFITO  SASTRERIA REGINA.', 'P.03 Y 16 C/MN', '775-', ''),
(3440, 'Cedula Fisica', 602030820, 'OCHOA CHAVES MARIO ALFONSO', 'La Cuesta BºCañaza calle a la Palma', '100 Oeste de Pulp. La chiripa.', '', ''),
(3441, 'Cedula Fisica', 603530187, 'OCON OBREGON ALEXIS', 'CANGREJO VERDE', '', '', ''),
(3442, 'Cedula Fisica', 603530187, 'OCON OBREGON ALEXIS', 'Laurel  Cangrejo Verde  100m Noroeste', 'de la escuela.', '2776-6158', ''),
(3443, 'Cedula Fisica', 601310752, 'OLAYA CEDEÑO TEOFILO.', 'CLUB DE TRABAJADORES COTO 49.', '', '7835077', ''),
(3444, 'Cedula Fisica', 600000111, 'OLIVARES NAVARRO ROY', 'CORTES   OJO CHAL ARRIBA DE PULPERIA', 'COTALUA', '', ''),
(3445, 'Cedula Fisica', 501680737, 'OLIVAREZ OCAMPOS ROLANDO', 'Bº EL ICE 150 AL NORTE DE LA', 'PLANTA ICE <P. 16 C/M', '', ''),
(3446, 'Cedula Fisica', 600470098, 'OLMO OLMO ELOY', 'Bº MEXICO DE TIENDA AMERICANA 100', 'MTS SUR 3era CASA MANO DERECHA', '', ''),
(3447, 'Cedula Fisica', 600940181, 'OLMOS ARAUZ ANGELA', 'GOLF Kmt 3 DE PULP EL BOTONCITO 50', 'Mts Oeste Y 75 Norte <P> 16 C/M', '', ''),
(3448, 'Cedula Fisica', 600940181, 'OLMOS ARAUZ ANGELA', 'GOLF Kmt 3 DE PULP TORRES ENTRADA A', 'MANO DERECHA   SEGUNDA ENTRADA.', '', ''),
(3449, 'Cedula Fisica', 601080591, 'OLMOS ARAUZ PEDRO', 'GOLFITO KMT 5 DE PULP EL NEGRITO', '3era CASA MANO IZQUIERDA', '7750907', ''),
(3450, 'Cedula Fisica', 601080591, 'OLMOS ARAUZ PEDRO', 'GOLFITO KM. 5 FRENTE A CASA DE', 'FAMILIA GUERRA', '7752397', ''),
(3451, 'Cedula Fisica', 601080591, 'OLMOS ARAUZ PEDRO', 'GOLFITO KM. 5 FRENTE A CASA DE', 'FAMILIA GUERRA', '7753231', ''),
(3452, 'Cedula Fisica', 600400740, 'OLMOS MOLINA LUCIANO', 'GOLFITO   LA MONA DE PULP Bº MEXICO', '1 era ENTRADA 50 MTS CASA ESQUINERA', '', ''),
(3453, 'Cedula Fisica', 603160791, 'OLMOS NAVARRETE ALLAN', 'Golfito  la mona de pulp el barrio', '100 S Cs celeste. 8605-2554', '6114-9510', ''),
(3454, 'Cedula Fisica', 602090587, 'OLMOS ORTEGA ANA LIA', 'GOLFITO CLINICA DENTAL DR. MORALES', 'Kmt 1 DE LUNES A JUEVES <P> 03 C/M', '7751154', ''),
(3455, 'Cedula Fisica', 602090587, 'OLMOS ORTEGA ANA LIA', 'GOLFITO CLINICA DENTAL DR. MORALES', 'Kmt 1 DE LUNES A JUEVES <P> 03 C/M', '7751154', ''),
(3456, 'Cedula Fisica', 602090587, 'OLMOS ORTEGA ANA LIA', 'Golfito  Res Ureña  cs Nº4.', 'Cel 8768-3836', '2775-2751', ''),
(3457, 'Cedula Fisica', 601550617, 'OLMOS PITTY ELIEZER', 'GOLFITO RECIDENCIAL UREÑA CASA F1', 'PAGA EL 14 Y 28 DE C/M', '750011', ''),
(3458, 'Cedula Fisica', 601670601, 'OLMOS PITTY ELPIDIER', 'Golfito   La Mona Contiguo a La Esc', '', '2775-1817', ''),
(3459, 'Cedula Fisica', 601680288, 'OPORTA SANCHEZ HECTOR', 'PTO JIMENEZ   CONTIGUO A TANQUES DEL', 'A Y A', '7355641', ''),
(3460, 'Cedula Fisica', 602350810, 'OPORTA SANCHEZ JEANNETH', 'PUERTO JIMENEZ   DE LA BOMBA 50', 'mts sur contg a tanques A y A.', '', ''),
(3461, 'Cedula Fisica', 602350810, 'OPORTA SANCHEZ JEANNETH', 'PUERTO JIMENEZ URBA EL COLEGIO', 'DE BOMBA OSA 100 N Y 200 OESTE.', '7355641', ''),
(3462, 'Cedula Fisica', 602750299, 'ORDOÑEZ ARAYA LUIS ANGEL', 'Golfito   Llano Bonito   Del Hidrante', 'MI cs 19.', '2640-2709', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(3463, 'Cedula Fisica', 603060056, 'OREAMUNO LEITON ANDREA NATALIA', 'Golfito   Llano Bonito a un costado', 'de Apart.Roy Ventura. 8722-3693', '8811-1379', ''),
(3464, 'Cedula Fisica', 602070940, 'OREAMUNO ORTEGA SANDRA', 'CIUDADELA EL TRIUNFO CASA BF 13', 'CANCELA 15 C/MES', '7321953', ''),
(3465, 'Cedula Fisica', 155800655, 'OREYANA HERNANEZ PABLO', 'RIO CLARO LAGARTO Bº LOS ANGELES', 'CASA COLOR PAPAYA * 3 CADA MES **', '7897512', ''),
(3466, 'Cedula Fisica', 602030892, 'OROCU OROCU MARIA EUGENIA', 'pto jimenez libreria maru', '', '7355423', ''),
(3467, 'Cedula Fisica', 602030892, 'OROCU OROCU MARIA EUGENIA', 'PTO. JIMENEZ EN LIBRERIA MANU', 'CANCELA   11 DE CADA MES', '7355423', ''),
(3468, 'Cedula Fisica', 602030892, 'OROCU OROCU MARIA EUGENIA', 'P Jiménez   Librería Manú.', '', '2735-5423', ''),
(3469, 'Cedula Fisica', 603770888, 'OROZCO CAMPOS LENY ELI', 'GOLFITO   PURRUJA   BARRIO TUCLER', '', '7755074', ''),
(3470, 'Cedula Fisica', 600650953, 'OROZCO ELIZONDO ROGER', 'VIQUILLE DOS DE PULP EL CRUCE', '100 Mts  OESTE <P> 16 C/M', '', ''),
(3471, 'Cedula Fisica', 600650953, 'OROZCO ELIZONDO ROGER', 'GOLFITO KILOMETRO 7', '', '', ''),
(3472, 'Cedula Fisica', 110590445, 'OROZCO FERNANDEZ JOSUE', 'BARRIO VERA CRUZ CASA*15', '', '8659-3540', ''),
(3473, 'Cedula Fisica', 270670608, 'OROZCO OROZCO SATURDINO', 'GOLFITO KM. 1 CUARTA FILA', 'CASA N. 4489', '7750843', ''),
(3474, 'Cedula Fisica', 301960121, 'OROZCO RAMIREZ GILBERTO', 'GOLFITO RECIDENCIAL UREÑA', 'CASA I.19 P. 18 C/M', '', ''),
(3475, 'Cedula Fisica', 601900588, 'OROZCO SIBAJA JULIO', 'Ciudad Neily  calle a San Vito en el', 'Pelón.', '', ''),
(3476, 'Cedula Fisica', 601350767, 'OROZCO SIBAJA SANTOS.', 'CIUDAD NEILY   Bº 22 DE OCTUBRE', '', '', ''),
(3477, 'Cedula Fisica', 601350767, 'OROZCO SIBAJA SANTOS.', 'CIUDAD NEILY   Bº 22 DE OCTUBRE', '', '', ''),
(3478, 'Cedula Fisica', 601350767, 'OROZCO SIBAJA SANTOS.', 'CIUDAD NEILY   Bº 22 DE OCTUBRE', '', '', ''),
(3479, 'Cedula Fisica', 601330464, 'ORTEGA CARRILLO XENIA', 'Vereh de Laurel   1500 m este Pulp.', 'Donald.', '', ''),
(3480, 'Cedula Fisica', 501740384, 'ORTEGA CASCANTE JORGE.', 'RIO CLARO   TRANSITO O CIUDADELA EN', 'ESPERANZA 100 N. TEL <P> 14 Y 27', '7899050', ''),
(3481, 'Cedula Fisica', 500940548, 'ORTEGA CASTAÑEDA VIRGINIA', 'GOLFITO KILOMETRO UNO A UN COSTADO', 'DE LA ESCUELA CASA N.4454 banco nac', '7751576', ''),
(3482, 'Cedula Fisica', 500940548, 'ORTEGA CASTAÑEDA VIRGINIA', 'Golfito KM 1 1º Fila   cs 4454   blo-', 'que C   color beige. Cel 8630-5619.', '2775-3191', ''),
(3483, 'Cedula Fisica', 500940548, 'ORTEGA CASTAÑEDA VIRGINIA.', 'GOLFITO PRIMERA CALLE KM 1', 'CASA # 4454 P.03 Y 16 C/M', '*-*-*-*', ''),
(3484, 'Cedula Fisica', 601650239, 'ORTEGA CASTILLO ENILDO', 'R CLARO DETRAS D`LA IGLES MORMONES', 'O ICE <P> 03 Y 16 C/M', '7899345', ''),
(3485, 'Cedula Fisica', 101700026, 'ORTEGA DURAN Mª DE LOS ANGELES', '', '', '', ''),
(3486, 'Cedula Fisica', 600991351, 'ORTEGA FRANCO SILVIA', 'golfito kilometro tres', '', '', ''),
(3487, 'Cedula Fisica', 603000879, 'ORTEGA GOMEZ MARTIN EUGENIO', 'Comte 2km oeste de Esc. unión del', 'sur. vecino de Franco Arias.', '8608-7235', ''),
(3488, 'Cedula Fisica', 601810767, 'ORTEGA HERRERA JOSE VALENTIN', 'P Jiménez   La Palma   costado oeste', 'Taller el Ceibo.', '2735-1322', ''),
(3489, 'Cedula Fisica', 603200706, 'ORTEGA LEON SAMUEL', 'La Cuesta   calle al chorro   después', 'del cementerio   7º cs MD cc celeste', '8637-0845', ''),
(3490, 'Cedula Fisica', 600500337, 'ORTEGA ORTEGA ELIAS.', 'CARACOL DE LA VACA DE ENTRADA PRINC', '1 KM CAMINO A CARACOL CASA C. NATUR', '', ''),
(3491, 'Cedula Fisica', 600450844, 'ORTEGA ORTEGA PATROCINIA', 'LA MARIPOSA 50 ANTES DE MAGDA.', 'MANO IZQ.FECHA DE PAGO 15 C/MES', '8960739', ''),
(3492, 'Cedula Fisica', 601690112, 'ORTEGA ROJAS EMILIA', 'B` 22 DE OCTUBRE CASA # 29 C', '.P. EN OFICINA', '', ''),
(3493, 'Cedula Fisica', 107870936, 'ORTEGA SALAZAR EDDY', 'CANOAS TAXI P.P.#138 (PASAJEROS)', 'D`ADUAN.TICA   200 Mts ESTE P.30 C/M', '', ''),
(3494, 'Cedula Fisica', 102850174, 'ORTEGA SANCHEZ TRINIDAD', 'Laurel   Km24   150 mts antes del 24.', '', '', ''),
(3495, 'Cedula Fisica', 800420656, 'ORTEGA SOLIS SABAS', 'CENIZO  LAUREL DE IGLESIA EVANGELICA', '300 Mts ESTE <P> 15 C/M', '', ''),
(3496, 'Cedula Fisica', 601990632, 'ORTIS VIGIL ALCIVIDADES', 'PASO CANOAS FTE GUSANO BARRENADOR', 'O EN BOMBA * CANCELA 16 C/MES *', '8572088', ''),
(3497, 'Cedula Fisica', 602090429, 'ORTIZ BONILLA GERARDO', 'LAUREL BECETH DEL CENTRO 700.M.', 'ESTE', '7800758', ''),
(3498, 'Cedula Fisica', 800160813, 'ORTIZ BONILLA LUIS (SIUL)', 'Ciudad Neily   Bº La Fortuna Taller', 'Siul. P. 20 C-Mes.', '783', ''),
(3499, 'Cedula Fisica', 602080271, 'ORTIZ CASTRO BELARMINA', 'P Jiménez   La Palma   detrás del Re-', 'dondel. Cel 8406-7255.', '2735-1603', ''),
(3500, 'Cedula Fisica', 600780453, 'ORTIZ CASTRO ETELVINA', 'LA PALMA 2 KM ANTG. COOPEMARTI.', '** CANCELA 10 C/MES  **', '', ''),
(3501, 'Cedula Fisica', 104020271, 'ORTIZ CERDAS OVIDIO', 'RIO CLARO 400 MTS SUR DEL TRANSITO', 'CLASE EXELENTE FECHA DE PAGO 16 C/M', '7899128', ''),
(3502, 'Cedula Fisica', 601620492, 'ORTIZ CHAVARRIA MIGUEL', 'PALMAR NORTE DETRA DE GOSOLINERA', 'ENERSOL  21 C/M', '', ''),
(3503, 'Cedula Fisica', 155814205, 'ORTIZ DE MORENO VERONICA', 'Drake   Agujitas   100m Oeste Rest.', 'Neily detras de la esc.', '8862-0801', ''),
(3504, 'Cedula Fisica', 159100138, 'ORTIZ DELCID MARGARITA', 'P canoas  Bº san martin 50 S de igle', 'cat (soda don juan P.canoas)', '8690-8132', ''),
(3505, 'Cedula Fisica', 201670853, 'ORTIZ FLORES ROSA MARIA', 'Ojo de Agua 150 mts antes de la esc', 'uela o el la piladora', '7888282', ''),
(3506, 'Cedula Fisica', 201670853, 'ORTIZ FLORES ROSA MARIA.', 'CIUDAD CORTES   Bº OJO DE AGUA PULP', 'Y PILADORA EL CEIBO.', '788', ''),
(3507, 'Cedula Fisica', 201670853, 'ORTIZ FLORES ROSA MARIA.', 'OJO DE AGUA  PULPERIA EL CUBO CONTI-', 'GUO A LA PILADORA.', '788', ''),
(3508, 'Cedula Fisica', 116400111, 'ORTIZ MARTINEZ DOLORES', '', '', '', ''),
(3509, 'Cedula Fisica', 501860609, 'ORTIZ MORALES GERMAN', 'OFICINAS DE AGENTES DE SEGURO', 'CIUDAD NEILY X ACUEDUCTOS', '7835269', ''),
(3510, 'Cedula Fisica', 601730253, 'ORTIZ NAJERA JACINTO.', 'FINCA  N.18 AGROSUR.', 'COBRAR 6 C/M.', '7888327', ''),
(3511, 'Cedula Fisica', 601790724, 'ORTIZ NUÑEZ JORGE FRANCISCO', 'San vito   Lourdes de pulp la liga', '300 Mts Oeste   2773-4157', '8924-7011', ''),
(3512, 'Cedula Fisica', 602080232, 'ORTIZ NUÑEZ LORENA', 'Agua Buena   Valle Azul   300m oeste', 'de la escuela. cs blanco hueso.', '8793-0705', ''),
(3513, 'Cedula Fisica', 601260970, 'ORTIZ ORTIZ FRANCISCO SALOMON', 'C Neily   Rio Nuevo casa 54 F', 'Cel 8834-5575.', '2783-1936', ''),
(3514, 'Cedula Fisica', 501420690, 'ORTIZ ORTIZ NORA', 'LAUREL URBANIZACION EL ZAINO CASA', 'n.37 CEL 8928-2862.', '2780-0119', ''),
(3515, 'Cedula Fisica', 501420690, 'ORTIZ ORTIZ NORA', 'Laurel  500 E y 10 Sur del Megasuper', 'Ciud el Zaino. 2780-0119', '8928-2862', ''),
(3516, 'Cedula Fisica', 601480530, 'ORTIZ RODRIGUEZ ALFREDO', 'P Canoas   Darizara   60m sur puente', 'hacia el triunfo. Cs A13 8871-8569.', '8660-9909', ''),
(3517, 'Cedula Fisica', 601990632, 'ORTIZ VIGIL ALCIBIADES', 'paso canoas frente al gusano barren', 'ador', '8572088', ''),
(3518, 'Cedula Fisica', 601990632, 'ORTIZ VIGIL ALCIBIADES', 'P Canoas   La Brigada   ent Mathías', 'fte Gusano Barrenador. 8768-9986.', '2732-2221', ''),
(3519, 'Cedula Fisica', 155803042, 'OSORNO VALLE JOSE GUILLERMO', 'CIUDAD CORTES DEL REY 50 MTS NORTE', 'VISITAR A HERMANO DEL CONTRATANTE.', '', ''),
(3520, 'Cedula Fisica', 602510879, 'OTAROLA HARDING KENGLI', 'PALMAR NORTE FTE  PRIMERO DE MARZO', 'C.C. KENSI * CANCELA 8 CADA MES *', '7867109', ''),
(3521, 'Cedula Fisica', 102630419, 'OTAROLA HERRERA JORGE', 'PALMAR NORTE  ', '', '', ''),
(3522, 'Cedula Fisica', 102630419, 'OTAROLA HERRERA JORGE', 'PALMAR NORTE   DEL CEMENTERIO 100 S', 'Y 200 E. DEJA LAS CUOTAS EN OFICINA', '786', ''),
(3523, 'Cedula Fisica', 102630419, 'OTAROLA HERRERA JORGE', 'PALMAR NORTE POR EL CEMENTERIO', '', '', ''),
(3524, 'Cedula Fisica', 602770843, 'OTAROLA VILLALOBOS JORGE EDUARDO', 'CORONADO DE OSA AUN COSTADO CHICHAR', 'RONERA REAL LA COSTA 8647/9844', '2786-5523', ''),
(3525, 'Cedula Fisica', 600760543, 'OVARES BRENES HERMAN', 'KM27 LAUREL FENTE A IGLESIA ADVENTI', 'STA CASA AL FONDO CELESTE', '2780-1667', ''),
(3526, 'Cedula Fisica', 202310858, 'OVARES BRENES MANUEL', 'SAN RAMON DE RIO CLARO COSTADO SUR', 'DEL CORRAL. <P> 03 C/M', '', ''),
(3527, 'Cedula Fisica', 202110179, 'OVARES BRENES MARIA DE LOS ANGELES', 'Laurel  Km 28  1km de Escuela cs na-', 'ranja. Cel 8671-3719.', '2776-6261', ''),
(3528, 'Cedula Fisica', 601300635, 'OVARES LORIA EDWIN', 'Villa Bonita   100 m este de Esc.', 'Telf: 8858-5020.', '2786-3062', ''),
(3529, 'Cedula Fisica', 600650092, 'OVARES RAMOS MIGUEL ANTONIO', 'CHACARITA D`REST.400 Mts OEST Y 300', 'NORTE ENTRADA LA LUCHA <P> 10 C/M', '', ''),
(3530, 'Cedula Fisica', 600650092, 'OVARES RAMOS MIGUEL ANTONIO', 'CHACARITA D`REST.400 Mts OEST Y 300', 'NORTE ENTRADA LA LUCHA <P> 10 C/M', '', ''),
(3531, 'Cedula Fisica', 500970818, 'OVIEDO JUAREZ DONAL', 'KM 27 500MTS. AL SUR DE LA ESCUELA', 'COTO SUR', '7800530', ''),
(3532, 'Cedula Fisica', 500970818, 'OVIEDO JUAREZ DONALD', 'Laurel  Km 29  300m suroeste Escuela', 'Coto Sur. Cel 8730-0446.', '2780-0530', ''),
(3533, 'Cedula Fisica', 201310030, 'OVIEDO MENA RAFAEL ANGEL', 'CONTROL DE LA CUESTA FTE. PULP.', 'LA BELLA.', '7321279', ''),
(3534, 'Cedula Fisica', 270380541, 'OZORNO VALLE JOSE GUILLERMO', 'CIUDAD CORTES DEL REY 50 MTS NORTE', 'VISITAR A HERMANO DEL CONTRATANTE.', '788', ''),
(3535, 'Cedula Fisica', 600910919, 'PALACIOS BEITA HILMA', 'PIEDRAS BLANCAS URB. VILLAS DEL SUR', 'CASA Nº 156 COSTADO AL RIO...', '7411041', ''),
(3536, 'Cedula Fisica', 901040219, 'PALACIOS BEITA WILLIAM', 'PIEDRAS BLANCAS URB. VILLAS DEL SUR', 'ACSA Nº 2 ** 8 C/MES **', '---', ''),
(3537, 'Cedula Fisica', 603300149, 'PALACIOS CASTRILLO HEISEL TATIANA', 'RIO NUEVO CIUDAD NEILY DEL POOL 500', 'MTS AL ESTE CASA 21 K', '7831232', ''),
(3538, 'Cedula Fisica', 600520783, 'PALACIOS CEDEÑO DOMINGO', 'BELLA LUZ DE LA VACA SEGUNDA ENTRAD', 'CARACOL', '', ''),
(3539, 'Cedula Fisica', 600840694, 'PALACIOS CEDEÑO NICAZIO.', 'COLORADO DEL TEMPLO ADVENTISTA 500M', 'A MANO IZQ  CASA AL FONDO.P.30 C/M.', '', ''),
(3540, 'Cedula Fisica', 600760744, 'PALACIOS FUENTES GILBERTO', 'Coto 47; Casa Nº 11105 detrás del', 'Laboratorio', '', ''),
(3541, 'Cedula Fisica', 600630438, 'PALACIOS MONTENEGRO MARIA', 'P Canoas   S Jorge   Ent Gallinera', 'Fte al taller.', '-', ''),
(3542, 'Cedula Fisica', 603030990, 'PALACIOS MONTEZUMA FRANCISCA', 'Comte La Unión   de Esc. 2.5 km al', 'suroeste.', '', ''),
(3543, 'Cedula Fisica', 155804510, 'PALACIOS PADILLA FLORINDA DEL CARM', 'GOLFITO FTE LATINO ANTIGUA SOSA.', 'PAGA WALTER DLCG. 8895-0856.', '2775-2839', ''),
(3544, 'Cedula Fisica', 4000073, 'PALACIOS PADILLA FLORINDA DEL CARME', 'GOLFITO FRTE AL LATINO EN LA', 'ANTIGUA SODA', '7752063', ''),
(3545, 'Cedula Fisica', 601070910, 'PALACIOS PALACIOS JUAN DE DIOS', 'KILOMETRO 38 FRENTE AL PULPERIA', 'EL MANGO C.COLOR BLANCO DE CEMENTO', '', ''),
(3546, 'Cedula Fisica', 601070910, 'PALACIOS PALACIOS JUAN DE DIOS', 'Km 38   Fte Pulp. Mango cs blanca de', 'cemento.', '2741-8139', ''),
(3547, 'Cedula Fisica', 603450431, 'PALACIOS PALACIOS YOLANDA', 'BELLA LUZ', '', '7838818', ''),
(3548, 'Cedula Fisica', 602780756, 'PALACIOS QUIROS TATIANA VANESSA', 'RIO CLARO DEL COMUNAL 100 MTS. AL', 'NE. 2DA IZQ. * FECHA DE PAGO 2 C/ME', '7899056', ''),
(3549, 'Cedula Fisica', 502470819, 'PALMA SEGURA MARCOS', 'Laurel  km 25  200 este de Escuela.', '', '8510-2874', ''),
(3550, 'Cedula Fisica', 104600870, 'PANIAGUA SABORIO RODRIGO', 'LA PALMA   COST D`LA ESC. COBRAR EN', 'OFIC. COOPEFUTURO <P> 06 C/M', '', ''),
(3551, 'Cedula Fisica', 601830660, 'PANIAGUA SOBORIO ROBERTO', 'LA PALMA DE PALMAR 25 M N DE LA ESC', 'COBRAR EN COOPEFUTURO <P> 19 C/M', '7867056', ''),
(3552, 'Cedula Fisica', 901020845, 'PANILLA JIMENEZ DORIS', 'LA CUESTA ENTRADA EL TAJO POR EL CO', 'LEGIO', '', ''),
(3553, 'Cedula Fisica', 901020845, 'PANILLA JIMENEZ DORIS', 'LA CUESTA ENTRADA AL TAJO 100M', 'DEL COLEGIO', '', ''),
(3554, 'Cedula Fisica', 901020845, 'PANILLA JIMENEZ DORIS', 'CUESTA ENTRADA AL 150MTS DESPUES DE', 'L COLEGIO', '8660-1065', ''),
(3555, 'Cedula Fisica', 105360595, 'PARAJELES SANTAMARIA MARIA EUGENIA', 'VIVE EN LA CUESTA EN SODA DIAGONAL', 'A COQUITO CALLE A LAUREL P. 30 C/M', '', ''),
(3556, 'Cedula Fisica', 502940737, 'PARRA ALVARADO FRANCISCO', 'P.Blancas   Florida 125 este Escuela', 'Cs cabaña.', '2741-1310', ''),
(3557, 'Cedula Fisica', 502700549, 'PARRA ALVARADO IRIS', 'Fca Alajuela   por linea del tren.', '', '8650-1987', ''),
(3558, 'Cedula Fisica', 2, 'PARRA MONTERO SEILIS', 'R Claro   S Ramón   100 N Puesto de', 'Policía.', '', ''),
(3559, 'Cedula Fisica', 600961085, 'PARRA PARRA AQUILINA', 'GOLFITO KM. 8', '', '', ''),
(3560, 'Cedula Fisica', 600960185, 'PARRA PARRA AQUILINA', 'R. Claro Urb. Caballo Blanco de la', 'entrada 4º casa Mano izquierda.', '', ''),
(3561, 'Cedula Fisica', 103130694, 'PARRA PIEDRA RODOLFO', 'LA FORTUNA DE PAVONES', '', '7831467', ''),
(3562, 'Cedula Fisica', 130130694, 'PARRA PIEDRA RODOLFO', 'LA FORTUNA DE PAVONES CONTIGUO A LA', 'ESCUELA', '7831467', ''),
(3563, 'Cedula Fisica', 900700434, 'PARRA UGALDE HUMBERTO', 'Laurel   Peral   fte a Plaza x Telf', 'público.', '2780-0671', ''),
(3564, 'Cedula Fisica', 701070007, 'PARRALES JIMENEZ YORLENE', 'P Jiménez  La Bambú  200 m antes Escu', 'ela; cs beige. Cel 8650-3460.', '-', ''),
(3565, 'Cedula Fisica', 800530574, 'PARRALES MORALES DELFINA', 'B* SAN RAFAEL Z ENTRA DESPUES DEL', 'PUENTE 2GDA CASA A LA DERECHA', '2783-1185', ''),
(3566, 'Cedula Fisica', 600590440, 'PARRAS PARRAS SANTOS FRANCISCO', 'Naranjo contiguo a la cueva del', 'sapo', '', ''),
(3567, 'Cedula Fisica', 600133135, 'PATIÑO PATIÑO VICTOR', 'KM 5 ENTRADA HOTEL GRAN CEIBO', 'P.16 C/M', '', ''),
(3568, 'Cedula Fisica', 601200401, 'PEÑA BRICEÑO NURIA', '', '', '', ''),
(3569, 'Cedula Fisica', 600260994, 'PEÑA CEDEÑO JOSE', 'Fca GUANAC PULP EL TALLER 650 Mts', 'ESTE <P> 19 c/m', '', ''),
(3570, 'Cedula Fisica', 600260994, 'PEÑA CEDEÑO JOSE', 'Fca GUANAC PULP EL TALLER 650 Mts', 'ESTE <P> 19 c/m', '', ''),
(3571, 'Cedula Fisica', 601670922, 'PEÑA PAEZ ISABEL', 'PTO. JIMENEZ CONTIGUA A PULPERIA', 'LA URB O EN LA CLINICA', '7355272', ''),
(3572, 'Cedula Fisica', 601670922, 'PEÑA PAEZ MARIA ISABEL', 'PUERTO JIMENEZ URBANIZACION EL', 'COLEGIO CASA Nº 14-F', '7355272', ''),
(3573, 'Cedula Fisica', 601670922, 'PEÑA PAEZ MARIA ISABEL', 'P Jiménez   La Urba   cs F14   verde.', 'Cel 8656-6330.', '2735-5272', ''),
(3574, 'Cedula Fisica', 600380729, 'PERALTA ALVAREZ MARTIN.', 'CIUDAD NEILY LA FORTUNA.', '', '', ''),
(3575, 'Cedula Fisica', 602040125, 'PERALTA CHAVEZ JORGE', 'Ciudad Neily   Costado Norte de la', 'plaza de la Fuente  ', '8989-1875', ''),
(3576, 'Cedula Fisica', 600920391, 'PERALTA PERALTA GUILLERMO', 'COTO 54 200MTS ESTE DE ABAST.', '** FECHA DE PAGO 15 CADA MES **', '7811053', ''),
(3577, 'Cedula Fisica', 601050622, 'PERALTA RIVAS AURIA.', 'NO SE REGISTRO.', '', '', ''),
(3578, 'Cedula Fisica', 600620207, 'PERALTA VALVERDE FRANCISCO', '', '', '', ''),
(3579, 'Cedula Fisica', 600910285, 'PERALTA VARGAS ROSA VICTORIA', '', '', '', ''),
(3580, 'Cedula Fisica', 500670595, 'PERALTA ZUÑIGA ANGEL', 'Piedras Blancas 100 mts sur de la', 'calera', '2741-1165', ''),
(3581, 'Cedula Fisica', 602870163, 'PERAZA PORRAS JENNY', 'CIUDAD NEILY Bº CAÑO SECO DE PLANTA', 'DEL ICE MANO DERECHA 2DA ENTRADA.', '8177096', ''),
(3582, 'Cedula Fisica', 600480230, 'PEREIRA ARGUEDAS CERAFIN', 'La Mariposa   1 Km despues del centr', 'turistico el retiro  ', '', ''),
(3583, 'Cedula Fisica', 302630834, 'PEREIRA NAVARRO Mª DEL CARMEN', 'Bº SALAS VINDAS  TALLER MURILLO', '\"Cel 8886-1399. Cliente Clase \"\"A\"\"\"', '7833490', ''),
(3584, 'Cedula Fisica', 600610207, 'PEREIRA VALVERDE FRANCISCO', 'Bambel 3 de Río Claro   200 Norte de', 'Pulpería de Alvaro Murillo.', '', ''),
(3585, 'Cedula Fisica', 600610207, 'PEREIRA VALVERDE FRANCISCO.', 'Rio Claro   Abastecedor El Almendro.', '', '', ''),
(3586, 'Cedula Fisica', 600730962, 'PEREIRA VALVERDE JOSE LUIS', 'R Claro   Bambell 3 d´ ranchito 1 km', 'hacia dentro Cs socalo   8431-7262', '', ''),
(3587, 'Cedula Fisica', 102010075, 'PEREZ ACUÑA ANSELMO', '', '', '', ''),
(3588, 'Cedula Fisica', 101450710, 'PEREZ ACUÑA LUISA', 'CIUDAD NEILY   ANTES DEL GUAIMY.', '', '', ''),
(3589, 'Cedula Fisica', 601920885, 'PEREZ AMAYA CARMEN JEANNETTE', 'DE LA DELEGACION 500MTS AL ESTE', 'CASA COLOR ROJO LADRILLO', '2735-1715', ''),
(3590, 'Cedula Fisica', 205110963, 'PEREZ ARAYA DONNAL FREDDY', '', '', '', ''),
(3591, 'Cedula Fisica', 600940607, 'PEREZ CAMPOS FERNANDO', 'C. NEILY Bº RIO NUEVO.', '', '-', ''),
(3592, 'Cedula Fisica', 600940607, 'PEREZ CAMPOS FERNANDO', 'C Neily   R Nuevo   Cs F-51.', 'Cel 8617-9621.', '2783-6507', ''),
(3593, 'Cedula Fisica', 601560375, 'PEREZ CARRILLO ANGELA', 'COLORADO DE LA CUESTA   100 OESTE', 'DE LA ESCUELA LOCAL', '', ''),
(3594, 'Cedula Fisica', 501570028, 'PEREZ CARRILLO EUSEBIO', 'LAUREL   I.N.V.U. 1 era CASA', 'CASA ESQUINERA.', '7800135', ''),
(3595, 'Cedula Fisica', 501570028, 'PEREZ CARRILLO EUSEBIO', 'LAUREL EL INVU CASA ESQUINERA', '', '7800135', ''),
(3596, 'Cedula Fisica', 601450793, 'PEREZ CERDAS AURA.', 'LA CUESTA CONTIGUO A LA FERRETERIA', 'DE LA CUESTA p. 30 c/m', '', ''),
(3597, 'Cedula Fisica', 502770170, 'PEREZ CHAVARRIA LEONIDAS', 'CONTE LA ESCUADRA URBA GUAYMI CASA', ' NUMERO 9*', '8732-5349', ''),
(3598, 'Cedula Fisica', 102690666, 'PEREZ CHAVEZ MANUEL', 'GOLF Bº ALAMEDAS FRENT A CABINAS', 'EL MANGLAR <P> 02 C/M', '775', ''),
(3599, 'Cedula Fisica', 602120187, 'PEREZ CORTES ELETICIA', 'Laurel   detrás Banco Nacional. Lote', 'Nº 20', '8695-3477', ''),
(3600, 'Cedula Fisica', 500930735, 'PEREZ CORTES MARCELINA', 'LAUREL INVU CASA Nº 274', '** CANCELA 4 CADA MES PENCION **', '', ''),
(3601, 'Cedula Fisica', 603330724, 'PEREZ DAVILA LAURA', 'CORONADO DE OSA FTE A EBAIS CASA', 'MADERA VERDE', '8625-1555', ''),
(3602, 'Cedula Fisica', 103730125, 'PEREZ DURAN ANDY JOSE', 'P Jiménez  La Palma  250 E puesto po-', 'licial. Cel 8780-5066', '2735-1026', ''),
(3603, 'Cedula Fisica', 900280582, 'PEREZ ESCOBAR LUIS ALBERTO', 'La Guaria   500 mts Oeste de la', 'Escuela   telefono 88574793', '8574793', ''),
(3604, 'Cedula Fisica', 900280582, 'PEREZ ESCOBAR LUIS ALBERTO', 'La Guaria de Osa.', '', '8603-2632', ''),
(3605, 'Cedula Fisica', 603590602, 'PEREZ GUERRERO SONIA', 'Laurel  Caracol de la Vaca   500m al', 'Sureste de Palmatec.', '8624-0797', ''),
(3606, 'Cedula Fisica', 503020799, 'PEREZ HERNANDEZ ADRIANA', 'C Neily   Consultorio Odontológico', 'diag Bar Friend`s. Cel 8826-7275.', '2783-5060', ''),
(3607, 'Cedula Fisica', 601310687, 'PEREZ HERRERA RITA JULIA', 'DE LOS TANQUES 200 MTS AL NORTE', 'ANTIGUA PUL. RITA CANOAS.', '', ''),
(3608, 'Cedula Fisica', 101650870, 'PEREZ HERRERA RITA JULIA', 'CARRETERA A SAN MARTIN ENTRADA LOS', 'TANQUES 200 MTS NORTE Bº SAN JORGE', '7322940', ''),
(3609, 'Cedula Fisica', 603440334, 'PEREZ HIDALGO CARLOS', 'TAJO LA CUESTA', '', '8734-5562', ''),
(3610, 'Cedula Fisica', 602290245, 'PEREZ JIMENEZ FERNANDO', 'CONTROL DE LA ESCUELA SURY 200 MTS', 'ESTE 2da CASA LADO DERECHO', '', ''),
(3611, 'Cedula Fisica', 106660492, 'PEREZ LOPEZ JULIA MARIA', 'Pavones  La Esperanza  600m Pulp.', 'Olman Azofeifa. Cel 8660-7306.', '2776-8118', ''),
(3612, 'Cedula Fisica', 601250655, 'PEREZ LOPEZ OSCAR', 'EL BOSQUE', '88658050', '2750658', ''),
(3613, 'Cedula Fisica', 106910898, 'PEREZ LOPEZ PEDRO JESUS', '700MTS DESPUES DEL CRUCE DE PAVONES', 'CARRETERA A ZANCUDO', '8803-3822', ''),
(3614, 'Cedula Fisica', 109430573, 'PEREZ MADRIGAL ADRIAN', 'LA ESCUADRA DE LA ESCUELA 500 MTS', 'NORTE', '', ''),
(3615, 'Cedula Fisica', 109430573, 'PEREZ MADRIGAL ADRIAN', 'CONTE URB. GUAYMI CASA Nº57', '', '7768237', ''),
(3616, 'Cedula Fisica', 600480805, 'PEREZ MADRIGAL LUIS', 'CIUDAD NEILY   BANCO POPULAR', '', '', ''),
(3617, 'Cedula Fisica', 600480805, 'PEREZ MADRIGAL LUIS ANGEL', 'Ciudad Neily   Barrio S.Juan; frente', 'Pulp. la Pulguita. Trab B. Popular.', '', ''),
(3618, 'Cedula Fisica', 600480805, 'PEREZ MADRIGAL LUIS ANGEL', 'Ciudad Neily   Barrio La Cartonera.', '', '8745-1727', ''),
(3619, 'Cedula Fisica', 102820264, 'PEREZ MARIN DAVID', 'POZA LOS ABUELOS   CASA NUMERO 24 CO', 'LOR NATURAL', '2781-1009', ''),
(3620, 'Cedula Fisica', 602140327, 'PEREZ MENDEZ BAUDILIO', 'P Canoas   Darizara   cs D10 c/ verde', 'Cel: 8804-8173  2783-2000.', '2732-3534', ''),
(3621, 'Cedula Fisica', 101143663, 'PEREZ MENDEZ JESSICA', 'Poza azul B* Dominicalito casa', 'papaya', '8750-5522', ''),
(3622, 'Cedula Fisica', 500840674, 'PEREZ MENDOZA MARTIN', 'DRAKE OSA FTE A JADE MAR O CASA DE', 'HONDURE. * CANCELA 11 CADA MES **', '', ''),
(3623, 'Cedula Fisica', 602450606, 'PEREZ MESEN HENRY', 'RIO CLARO BºSAN RAMON CASA Nº24', 'X ABASTECEDOR ANDREA CANCELA 7 C/ME', '7897438', ''),
(3624, 'Cedula Fisica', 601760679, 'PEREZ MORA RIGOBERTO', 'UVITA 75 MTS SUPER TATIANA', 'CASA VERDE', '2743-8424', ''),
(3625, 'Cedula Fisica', 601760679, 'PEREZ MORA ROGOBERTO', 'UVITA 75MTS SUR SUPER TATIANA', 'CASA VERDE', '2743-8424', ''),
(3626, 'Cedula Fisica', 102210751, 'PEREZ MORA VIRGINIA.', 'BELLA LUZ 200 Mts ANTES DE CANTINA', 'ABANGARES <P> 15 C/M', '', ''),
(3627, 'Cedula Fisica', 900960834, 'PEREZ MORALES MARIA', 'PALMAR NORTE Bº ALEMANIA', 'ENTRADA 1ER TELEF. PUBLICO', '7866367', ''),
(3628, 'Cedula Fisica', 500550505, 'PEREZ PEREZ JUAN RUPERTO', 'SIERPE CENTRO DE HOTEL MARGARITA', '4TA CASA', '7867938', ''),
(3629, 'Cedula Fisica', 500550505, 'PEREZ PEREZ JUAN RUPERTO', 'Sierpe contiguo a Hotel Margarita.', '', '2786-7938', ''),
(3630, 'Cedula Fisica', 600460880, 'PEREZ PEREZ VILMA', '', '', '', ''),
(3631, 'Cedula Fisica', 602420759, 'PEREZ PORRAS CECILIA', 'P Canoas   S Jorge   150m este pulp.', 'los ángeles.', '8986-0062', ''),
(3632, 'Cedula Fisica', 105590279, 'PEREZ QUIROS WILLIAM', '75 mts sur de la aduana tica', 'detrás Rest. Jeanneth <p> 30 c/m', '', ''),
(3633, 'Cedula Fisica', 603310724, 'PEREZ RAMIREZ IVANNIA CC LOLI', 'P Jiménez  Agujas costado oeste de', 'la plaza.', '8431-2109', ''),
(3634, 'Cedula Fisica', 500550489, 'PEREZ RAMIREZ LEANDRO', 'LA CUESTA   FRET TEST DE JEHOVA', '<P> 30 C/M', '', ''),
(3635, 'Cedula Fisica', 500550489, 'PEREZ RAMIREZ LEANDRO', 'LA CUESTA   FRET TEST DE JEHOVA', '<P> 30 C/M', '732', ''),
(3636, 'Cedula Fisica', 205450245, 'PEREZ RIOS YORLENY', 'Golfito   Bº Daniel Herrera   cs J-10', 'verde agua. 8868-6189.', '2775-1032', ''),
(3637, 'Cedula Fisica', 174847724, 'PEREZ RODRIGUEZ ALONSO', 'Ciudad Neily   200 m Sur del Puente', 'Corredores. Taller Perez Oconor.', '7833991', ''),
(3638, 'Cedula Fisica', 155806120, 'PEREZ RODRIGUEZ ALONSO', 'C Neily Taller O´Conor', 'Cel 8730-5583.', '2783-3991', ''),
(3639, 'Cedula Fisica', 201950981, 'PEREZ RODRIGUEZ ELOY', 'BERE   DIAGONAL A DOÑA IVONNE', 'EL CRUCE   <P> 30 C/M', '-', ''),
(3640, 'Cedula Fisica', 602560213, 'PEREZ RODRIGUEZ ROXI MANLEY', '-P Jimenez  Puesto policial 100m al', 'fondo. cel 8567-2165.', '2735-1058', ''),
(3641, 'Cedula Fisica', 601700314, 'PEREZ RODRIGUEZ TERESA', 'Laurel   Urb Zaíno   cs amarilla', '', '2780-0554', ''),
(3642, 'Cedula Fisica', 602210926, 'PEREZ ROJAS MARIA LUZ', 'Sierpe   Escuela   trabaja en la coci', 'na.', '', ''),
(3643, 'Cedula Fisica', 602290444, 'PEREZ SALAZAR RONAL.', 'GOLFITO   KILOMETRO UNO  COBRAR EN LI', 'CORERA MI HUEVO FTE AL PARQUE', '', ''),
(3644, 'Cedula Fisica', 603470283, 'PEREZ SAMUDIO EDGAR JOSE', 'barrio lurdes costado del redondel', 'ciudad cortes', '8323584', ''),
(3645, 'Cedula Fisica', 204200134, 'PEREZ SANCHEZ MARIA', 'GOLFITO KM 1   6ª FILA CASA DE DOS', 'PLANTAS', '7752390', ''),
(3646, 'Cedula Fisica', 508400186, 'PEREZ SANDOVAL RODRIGO', '200MTS DE LA PLAZA BAMBITO AL', 'NOROESTE', '5704-9205', ''),
(3647, 'Cedula Fisica', 501420589, 'PEREZ SEGURA GERARDO', 'CIUDAD NEILY   Bº 22 DE OCTUBRE', '\"BLOQUE \"\"A\"\" CASA # 38\"', '', ''),
(3648, 'Cedula Fisica', 501420589, 'PEREZ SEGURA GERARDO', 'CIUDADA NEILY FTE. RESTAURANT NUEVO', 'MUNDO CLIENTE EXELENTE.', '8169313', ''),
(3649, 'Cedula Fisica', 501420589, 'PEREZ SEGURA GERARDO', 'C Neily BºProgreso   fte. Rest Nuevo', 'Mundo 100 m este. Apartamentos.', '8632-1782', ''),
(3650, 'Cedula Fisica', 601520170, 'PEREZ SEQUEIRA MARITZA', 'GOLFITO .', '', '', ''),
(3651, 'Cedula Fisica', 601520170, 'PEREZ SEQUEIRA MARITZA', 'GOLFITO Bº BELLA VISTA 2DA FILA', 'CASA Nº 4206 16 C/MES', '7750962', ''),
(3652, 'Cedula Fisica', 600700247, 'PEREZ TELLEZ Mª LUISA', 'GOLF Bº BELLA VISTA CASA # 4399', 'O EN HOSPITAL <P> HOSPITAL', '', ''),
(3653, 'Cedula Fisica', 600700247, 'PEREZ TELLEZ Mª LUISA', 'GOLF Bº BELLA VISTA CASA # 4399', 'O EN HOSPITAL <P> HOSPITAL', '7751537', ''),
(3654, 'Cedula Fisica', 602790751, 'PEREZ TENORIO SANDRA', 'GOLFITO KM12 LA MONA CASA Nº G-37', 'CANCELA DEPO. LOCAL 24  16 C/MES', '7756280', ''),
(3655, 'Cedula Fisica', 201660881, 'PEREZ VARGAS RAFAEL ANGEL', 'Ciudad Cortes   Bº renacimiento', 'Cs E-7.llamarlo antes sale mucho', '8342-6617', ''),
(3656, 'Cedula Fisica', 201990047, 'PEREZ VASQUEZ AUSTELINA', 'LA CUESTA CALLE A CUERVITO..', '** CANCELA  21 C/MES **', '', ''),
(3657, 'Cedula Fisica', 201990047, 'PEREZ VAZQUEZ AUSTELINA', 'LA CUESTA CALLE A CUERVITO 50 MTS S', 'DE IGLECIA METODISTA CASA BLANCA.', '7322355', ''),
(3658, 'Cedula Fisica', 600720020, 'PEREZ ZUÑIGA ISRAEL.', 'LIMITE ENTRE FCA GUANC Y JALAC 800', 'MTS OESTE DE ESC GUANC <P> 06 C/M', '*-*-*-*', ''),
(3659, 'Cedula Fisica', 602560193, 'PICADO AGUERO THAIS', 'CORTES 100MTS DESP. DEL PUENTE', 'BLANCO Bº LA LAGUNA..', '', ''),
(3660, 'Cedula Fisica', 900410402, 'PICADO ALVAREZ ALCIDES', 'I.N.V.U. DE LAUREL 1er. ENTRADA', 'MANO IZQ. 1er. CASA MANO DERECHA', '7800414', ''),
(3661, 'Cedula Fisica', 601450269, 'PICADO ALVAREZ AMALIA', 'Rio Claro   Cost taller Mainor esq', 'casa Nº 15 (Guaicara) 2789-8823', '', ''),
(3662, 'Cedula Fisica', 900870093, 'PICADO ALVAREZ DINORA', 'Bambito   700. este de la escuela', '', '', ''),
(3663, 'Cedula Fisica', 600420758, 'PICADO ARAUZ IPOLITA   C.C POLITA.', 'Comte Centro   Frente Soda la', 'Morena   telefono 27768208', '7768208', ''),
(3664, 'Cedula Fisica', 602810278, 'PICADO GODIN MARIA', 'Golfito   KM 23 300 M oeste C color', 'natural   8757-1243', '', ''),
(3665, 'Cedula Fisica', 603280278, 'PICADO GONZALEZ GERSON', 'Sabalito  Bº Mercedes   1km SE Parque', 'Cel 8941-8447', '8689-7660', ''),
(3666, 'Cedula Fisica', 109070465, 'PICADO MENA LINETH', 'LA PALMA EN SALA DE BELLEZA ADRIANA', '** FECHA DE PAGO 11 CADA MES **', '7351138', ''),
(3667, 'Cedula Fisica', 109070465, 'PICADO MENA LINETH', 'LA PALMA EN SALA DE BELLEZA ADRIANA', '** FECHA DE PAGO 11 CADA MES **', '7351138', ''),
(3668, 'Cedula Fisica', 109070465, 'PICADO MENA LINETH', 'P Jiménez   La Palma   Costado Oeste', 'del EBAIS. Cel 8519-7928.', '2735-1138', ''),
(3669, 'Cedula Fisica', 109070465, 'PICADO MENA LINETH', 'PTO JIMENEZ LA PALMA PELUQUERIA', '', '8519-7928', ''),
(3670, 'Cedula Fisica', 109070465, 'PICADO MENA LINETH', 'P Jiménez  La Palma  Costado O EBAIS.', 'Cel 8519-7928.', '2735-1138', ''),
(3671, 'Cedula Fisica', 103260229, 'PICADO MENDEZ EDWIN', 'pto jimenez la palma detras de', 'almacen la palma', '', ''),
(3672, 'Cedula Fisica', 603070940, 'PICADO MEZA YADIRA', 'COTO 47 DEL BAR EL BUEN CORAZON', 'CASA ESQUINERA *12208', '8762-7093', ''),
(3673, 'Cedula Fisica', 602070881, 'PICADO TENORIO ELVIS', 'Coto 42 1º Ent telef público casa 5', 'mano izquierda.', '2781-1663', ''),
(3674, 'Cedula Fisica', 602070881, 'PICADO TENORIO ELVIS', 'Coto 42   1º entrada   Telf Publico', 'casa 5 MI.', '2781-1291', ''),
(3675, 'Cedula Fisica', 600930769, 'PIEDRA AMADOR GERARDO', 'PALMAR Bº 11 DE ABRIL', '<P> 06  C/M', '', ''),
(3676, 'Cedula Fisica', 600930769, 'PIEDRA AMADOR GERARDO', 'Palmar   Cuid. 11 Abril   cs 4   fte a', 'la Escuela. Cel 8671-0869.', '2786-6573', ''),
(3677, 'Cedula Fisica', 108950234, 'PIEDRA BARRIOS ANA ISABEL', 'ABROJO CONTG LA PLAZA C` DE PIEDRA', 'TRAB TIENDA EL TIBURON <P> 30 C/M', '', ''),
(3678, 'Cedula Fisica', 601520336, 'PIEDRA CALDERON ELADIO.', 'Bo.SAN JUAN 75 MTS DEL MERCADO DE', 'CIUDAD NEILY COMANDO PASO CANOAS.', '', ''),
(3679, 'Cedula Fisica', 102210461, 'PIEDRA CHINCHILLA ELIAS', 'SAN RAMON DE RIO CLARO  100 MTS ESTE', 'DE LA ESCUELA P.30 DE C/M', '789', ''),
(3680, 'Cedula Fisica', 102210461, 'PIEDRA CHINCHILLA ELIAS', 'SAN RAMON DE RIO CLARO  100 MTS ESTE', 'DE LA ESCUELA P.30 DE C/M', '789', ''),
(3681, 'Cedula Fisica', 601060646, 'PIEDRA CHINCHILLA HECTOR', 'RIO CLARO DE LA FERRETERIA ARTAVIA', '150 NORTE', '7897668', ''),
(3682, 'Cedula Fisica', 601060646, 'PIEDRA CHINCHILLA HECTOR', 'RIO CLARO  Bº LA LUCHA FTE A SALON', '*** FECHA DE PAGO 16 C/MES  ***', '7897668', ''),
(3683, 'Cedula Fisica', 601060646, 'PIEDRA CHINCHILLA HECTOR', 'RIO CLARO  Bº LA LUCHA FTE A SALON', '*** FECHA DE PAGO 16 C/MES  ***', '7897668', ''),
(3684, 'Cedula Fisica', 601060646, 'PIEDRA CHINCHILLA HECTOR.', 'RIO CLARO   100 MTS N. Y 25 ESTE DE', 'FERRETERIA SANCHEZ ARTAVIA P.16 C.M', '7899060', ''),
(3685, 'Cedula Fisica', 601060646, 'PIEDRA CHINCHILLA HECTOR.', 'RIO CLARO   100 MTS N. Y 25 ESTE DE', 'FERRETERIA SANCHEZ ARTAVIA P.16 C.M', '7899060', ''),
(3686, 'Cedula Fisica', 601960246, 'PIEDRA JIMENEZ MIREYA', 'PIEDRAS BLANCAS 150 Mts Oeste DE LA', 'ESCUELA <P> 19 C/M', '', ''),
(3687, 'Cedula Fisica', 601920322, 'PIMENTEL BARRIOS JOSE JUNIOR', 'COLORADO DE PASO CANOAS 1 KM NORTE', 'DEL SALON COMUNAL.', '3211553', ''),
(3688, 'Cedula Fisica', 600440507, 'PIMENTEL PIMENTEL JOSE', 'Colorado', '', '8747-5779', ''),
(3689, 'Cedula Fisica', 106390763, 'PIMENTEL PINEDA JOSE ALVARO', 'Salas Vindas   Cabinas Laguna', '', '6508296', ''),
(3690, 'Cedula Fisica', 800840299, 'PINEDA SANTOS GEDALIA', 'Tienda El Tiburón.', '', '2783-3426', ''),
(3691, 'Cedula Fisica', 280163311, 'PINEDA SANTOS GEDALIA.', 'TIENDA EL TIBURON', '', '7833426', ''),
(3692, 'Cedula Fisica', 901010921, 'PITTI MARTINEZ MARTA', 'PASO CANOAS   DEL C.E.N.C.I.N.A.I', '150 MTS AL OESTE C.ZOCALO C. NATURA', '', ''),
(3693, 'Cedula Fisica', 901010921, 'PITTI MARTINEZ MARTA', 'PASO CANOAS   DEL C.E.N.C.I.N.A.I', '150 MTS AL OESTE C.ZOCALO C. NATURA', '', ''),
(3694, 'Cedula Fisica', 901010921, 'PITTI MARTINEZ MARTA', '150MTS DE LA ESCUELA AL SUR', '', '8731-6113', ''),
(3695, 'Cedula Fisica', 901010921, 'PITTI MARTINEZ MARTHA', 'PASO CANOAS DEL CEN. 150MTS AL ESTE', '', '7321418', ''),
(3696, 'Cedula Fisica', 407362139, 'PITTI PITTI JACKELINE', 'P Canoas   Bº San Martín.', 'Cel 507-6592-0272.', '', ''),
(3697, 'Cedula Fisica', 107980771, 'PITTY GONZALEZ FRANCISCA', 'Paso Canoas   La Brigada   preguntar', 'en Pulp. La Ramonence.Paga DESP 04C', '7322672', ''),
(3698, 'Cedula Fisica', 280173936, 'PITTY MOJICA ANTONIO', 'LA CUESTA CONTG A LA CEMENTERIO', 'IGLESIA EBEN-EZER', '7322423', ''),
(3699, 'Cedula Fisica', 280173936, 'PITTY MOJICA ANTONIO', 'LA CUESTA CONTG. AL CEMENTERIO', 'IGLESIA EBENECER', '7322423', ''),
(3700, 'Cedula Fisica', 451700000, 'PITTY MOJICA JUAN ANTONIO', 'LA CUESTA CAMINO AL CEMENTERIO 100', 'Mts ANTES M.DER.C.C CEL. 15 C/M', '', ''),
(3701, 'Cedula Fisica', 500710257, 'PIZARRO CORTES JOSE FILADELFO', 'MANGO DEL LAUREL   X LA IGLESIA', 'DIRECCION INCOMPLETA', '', ''),
(3702, 'Cedula Fisica', 502030685, 'PIZARRO PIZARRO JOSE JOAQUIN.', 'NO SE REGISTRO.', '', '', ''),
(3703, 'Cedula Fisica', 601300892, 'PIZARRO ROSALES VICTOR MANUEL.', 'Bº EL CARMEN.', '', '', ''),
(3704, 'Cedula Fisica', 601590545, 'POLANCO ESPINOZA WILLIAM', 'BARRIO SAN JORGE 200MTS AL NORTE DE', 'LA ESCUELA CASA*6', '8815-2868', ''),
(3705, 'Cedula Fisica', 600760994, 'POLANCO GUTIERREZ ERCILIA', 'P Jiménez   a un costado de la plaza', 'Fotocopiadora. Cel 8702-1392.', '2735-5039', ''),
(3706, 'Cedula Fisica', 500680258, 'PONCE MALTES HIPOLITA', 'LA CUESTA CIUDADELA TAMAYO CASA', '3-A', '7322705', ''),
(3707, 'Cedula Fisica', 500970263, 'PONCE PONCE MARIA MARCIANA', 'VELLA LUZ DE LA VACA DE LA ESCUELA', '25 MTS PULP LA NEGRITA. PAGA 20 C/M', '', ''),
(3708, 'Cedula Fisica', 202090026, 'PORRAS AGUILAR TERESINA', 'COPA BUENA  Bº ZAMORALIA 50M CEN-', 'CINAI.', '2734-0038', ''),
(3709, 'Cedula Fisica', 601790274, 'PORRAS BEITA WALTER CC WILLIAM', 'R. Claro Bambel I 200 m norte Pulp', 'Jardin casa celeste. cel 8781-9319.', '2789-7764', ''),
(3710, 'Cedula Fisica', 601790274, 'PORRAS BEITA WILLIAM', 'RIO CLARO  FRENTE A LA ESCUELA LA', 'ESPERANZA ENTRAD. A BANBEL 3 C/M.', '', ''),
(3711, 'Cedula Fisica', 930180000, 'PORRAS CAMPOS TERESITA', 'Paso Canoas. Taller de Alternadores', 'Contiguo a Iglesia Adventista.', '211874', ''),
(3712, 'Cedula Fisica', 900360270, 'PORRAS CHAVES AMABLE', 'Golfito  Km37   300m calle a S Miguel', 'cont Salon del Reino. Cel 8914-1708', '2741-8078', ''),
(3713, 'Cedula Fisica', 601940745, 'PORRAS CUBILLO ALEXANDER.', 'NO SE REGISTRO.', '', '', ''),
(3714, 'Cedula Fisica', 601940745, 'PORRAS CUBILLO ALEXANDER.', 'NO SE REGISTRO.', '', '', ''),
(3715, 'Cedula Fisica', 601920002, 'PORRAS GOMEZ ALBIN', 'PULP BAMBU CRUCE CARIARI <P> 15 C/M', '', '*-*-*-*', ''),
(3716, 'Cedula Fisica', 600760346, 'PORRAS MADRIGAL ALVARO.', 'PRIMERA FILA DETRAS DEL ESTADIO CAS', '5181 15 Y 30 CM.', '*-*-*-*', ''),
(3717, 'Cedula Fisica', 600560808, 'PORRAS MADRIGAL ELIZABETH', 'GOLF Bº SAN ANDRES IMAS C # 6', '<P> 03 C/M', '770885', ''),
(3718, 'Cedula Fisica', 600560808, 'PORRAS MADRIGAL ELIZABETH', 'GOLF Bº SAN ANDRES IMAS C # 6', '<P> 03 C/M', '7750885', ''),
(3719, 'Cedula Fisica', 605107140, 'PORRAS MOSCOSO BENJAMIN GERARDO', 'DIAGONAL A LA ESCUELA DE ABROJO', '', '3939401', ''),
(3720, 'Cedula Fisica', 602440898, 'PORRAS PORRAS CRISTINA', 'CORONADO OSA   150 MTRS OESTE DE', 'LA ENTRADA A COOPEMANGLE', '7865649', ''),
(3721, 'Cedula Fisica', 600940196, 'PORRAS PORRAS ISLIA MARIA', '', '', '', ''),
(3722, 'Cedula Fisica', 601310337, 'PORRAS PORRAS JUANA', 'LA MONA D`PARADA 100 Mts HACIA GOLF', 'Y 200 HACIA ADENTRO <P> 27 C/M', '*-*-*-*', ''),
(3723, 'Cedula Fisica', 601250984, 'PORRAS PORRAS JUANA', 'PUERTO JIMENEZ EL NIEQUE CONTIGUO A', 'L VIVERO', '879523', ''),
(3724, 'Cedula Fisica', 601480545, 'PORRAS RAMIREZ MIRIAM', 'BAMBEL 300 MTS DE SUPER FRANK CASA', 'ESQUINERA', '8782-2518', ''),
(3725, 'Cedula Fisica', 101264941, 'PORRAS ROSALES EVELIN', 'El Barrido 500 hacia campiña   1 Cs', 'antes pulp Quiros   2776-6107', '', ''),
(3726, 'Cedula Fisica', 601110126, 'PORRAS SALAS JOHEL.', 'FCA ALAJUELA DEL PLANTEL DE SANCHEZ', 'CARVAJAL 600 M CARRETA A PTO JIMENE', '', ''),
(3727, 'Cedula Fisica', 105340050, 'PORRAS VILLALOBOS LUIS', 'Sabalito   400 M S de la guardia', 'calle hacia neily   8778-1528', '', ''),
(3728, 'Cedula Fisica', 901010693, 'PORRAS VILLALOBOS SELMIRA', 'CIUDAD NEILY DE ANTIGUA PULP.', 'LAS PALMAS 50MTS HACIA EL DIQUE', '', ''),
(3729, 'Cedula Fisica', 106870867, 'PORRAS VILLALOBOS ZELMIRA.', 'CIUDAD NEILY BARRIO EL CARMEN.', 'P-01 C/M.', '', ''),
(3730, 'Cedula Fisica', 600490783, 'PORTUGUEZ POTUGUEZ HERMENEGILDO', 'LA MONA BARRIO MEXICO ALA PAR DE LA', 'CASA VIRGINIA CAMARENO', '', ''),
(3731, 'Cedula Fisica', 900590408, 'POTOY ORTIZ ROSA MARIA', 'La Virgen   sector la Maravilla   Fca', 'la Rosita   pregunte en Pulp Merendi', '8350-2931', ''),
(3732, 'Cedula Fisica', 900590408, 'POTOY ORTIZ ROSA MARIA', 'La virgen   2 Km Sur de Esc L virgen', '8723-5294', '8350-2931', ''),
(3733, 'Cedula Fisica', 603890855, 'PRADO ROJAS INGRID', 'Drake   Agujitas centro. Supermercad', 'SANTA FE:   2775-1639', '8626-4103', ''),
(3734, 'Cedula Fisica', 600620110, 'PRENDAS AGUIRRE MARIA SALVADORA.', 'RIO CLARO   DEL M.O.P.T FRENTE A', 'TALLER MECANICO.', '', ''),
(3735, 'Cedula Fisica', 603340860, 'PRENDAS BARQUERO MAUREN', 'C Cortés   Ciud IMAS Cs Nº 17', 'Verde de dos plantas.', '8256484', ''),
(3736, 'Cedula Fisica', 603340860, 'PRENDAS BARQUERO MAUREN', 'C Cortés   Ciud. IMAS cs Nº17   color', 'verde de 2 plantas.  Cel 8508-2102.', '2788-7671', ''),
(3737, 'Cedula Fisica', 601390853, 'PRENDAS PRENDAS JOSE GERARDO', '', '', '', ''),
(3738, 'Cedula Fisica', 601250492, 'PRENDAS RODRIGUEZ MANUEL', 'TAXI PASAJEROS LA CUESTA  CASA IRENE', 'P-30 C/M.', '2732-2086', ''),
(3739, 'Cedula Fisica', 501170251, 'PRENDAS RODRIGUEZ MARGARITA', 'CIUDAD NEILY   Bº LA FORTUNA   PULP.', 'FRANDY <P> 02 C/M', '', ''),
(3740, 'Cedula Fisica', 501170251, 'PRENDAS RODRIGUEZ MARGARITA', 'CIUDAD NEILY   Bº LA FORTUNA   PULP.', 'FRANDY <P> 02 C/M', '783', ''),
(3741, 'Cedula Fisica', 501170251, 'PRENDAS RODRIGUEZ MARGARITA', 'CIUDAD NEILLY   LA FORTUNA   ABAST', 'FRANDY', '2783-1178', ''),
(3742, 'Cedula Fisica', 600520632, 'PRENDAS VILLALOBOS CARMEN', 'LAS FINCAS LOS CASTAÑOS DE LA PULP.', '75 MTS.P.30 C/M', '', ''),
(3743, 'Cedula Fisica', 600520632, 'PRENDAS VILLALOBOS CARMEN', 'LAS FINCAS LOS CASTAÑOS DE LA PULP.', '75 MTS.P.30 C/M', '7811323', ''),
(3744, 'Cedula Fisica', 106750262, 'QUESADA ALPIZAR BLANCA ROSA', 'San vito   San Joaquin   Cs nº 17', '2773-5863', '', ''),
(3745, 'Cedula Fisica', 400560883, 'QUESADA CARBALLO CARLOS LUIS', 'PALMAR SUR   FRENTE A LA COOPEMESUR', '', '7867004', ''),
(3746, 'Cedula Fisica', 602740773, 'QUESADA CASTILLO ELIZABETH', 'R Claro   Bambel 2   Ent MD Antes tel', 'Público   3º cs malla blanca 8692520', '8671-7980', ''),
(3747, 'Cedula Fisica', 202740218, 'QUESADA CHAVARRIA ELVA', 'CIUDAD CORTES B. LOURDES VECINA DE', 'DON SINFORIANO', '7888538', ''),
(3748, 'Cedula Fisica', 203100151, 'QUESADA DELGADO TITO', '', '', '', ''),
(3749, 'Cedula Fisica', 107930331, 'QUESADA GARCIA ALBA ANITA', 'Cortés  C Pacheco.', '', '8753-0044', ''),
(3750, 'Cedula Fisica', 603230983, 'QUESADA GONZALEZ JENNIFER', 'P Canoas   Veracruz   1500m oeste de', 'la Escuela. cs al fondo. 8747-9623', '8833-7121', ''),
(3751, 'Cedula Fisica', 603080307, 'QUESADA MORA ERICK', 'BAHIA BALLENA SALON COMUNAL 100MTS', 'CONTIGUO A CAFE ITERNET', '8641-6568', ''),
(3752, 'Cedula Fisica', 603080307, 'QUESADA MORA ERICK', 'BAHIA BALLENA SALON COMUNAL 100MTS', 'CONTIGUO A CAFE ITERNET', '8522-5013', ''),
(3753, 'Cedula Fisica', 600350796, 'QUESADA MORERA AURA', 'GOLFITO BELLA VISTA CASA N. 8177', 'FTE. A PULPERIA', '7750310', ''),
(3754, 'Cedula Fisica', 900830595, 'QUESADA NUÑEZ ROSA', 'INCENDIO DE LAUREL   300 MTRS ESTE', 'DE LA ESCUELA', '7838162', ''),
(3755, 'Cedula Fisica', 102920560, 'QUESADA QUESADA VIRGINIA', '', '', '', ''),
(3756, 'Cedula Fisica', 900550693, 'QUESADA RAMOS ALEXIS', '', '', '', ''),
(3757, 'Cedula Fisica', 102930457, 'QUESADA SALAZAR MARIO', 'P Canoas   Veracruz  cs 80 c Papaya.', '', '8743-2184', ''),
(3758, 'Cedula Fisica', 108650792, 'QUESADA VARGAS LUIS GONZALO', 'P Jiménez  La Palma  camino a Riyito', 'Ciud Nueva cs 37.', '8732-5819', ''),
(3759, 'Cedula Fisica', 108060084, 'QUESADA VARGAS MARIA ELENA', 'GUADALUPE 100 N. DE LA ESCUELLA', '** FECHA DE PAGO 11 CADA MES **', '7351076', ''),
(3760, 'Cedula Fisica', 108060084, 'QUESADA VARGAS MARIA ELENA', 'La Palma de Puerto Jiménez cabinas', 'de Amira', '2735-1142', ''),
(3761, 'Cedula Fisica', 104040201, 'QUESADA VARGAS URBANO', 'Río Claro centro   Surtidor Yaneth', '', '', ''),
(3762, 'Cedula Fisica', 104040201, 'QUESADA VARGAS URBANO.', 'RIO CLARO DEL PARQ. INFANT. 50MTS', 'OESTE <P> 03 C/M.', '7751890', ''),
(3763, 'Cedula Fisica', 602210738, 'QUESADA VASQUEZ MARISOL', 'Pto Jimenez   calle mora contiguo a', 'cabinas Conchita', '8643-1381', ''),
(3764, 'Cedula Fisica', 301580205, 'QUESADA VILLALOBOS MAYRA', 'PASO CANOAS CIUDADELA EL TRIUNFO', 'FRENTE A LA PULP LA LUNA', '7321216', ''),
(3765, 'Cedula Fisica', 301580205, 'QUESADA VILLALOBOS MAYRA', 'C. EL TRIUNFO FRENTE AL PLANTEL', 'MULTIUSO CASA BLOQUE E-B', '7321042', ''),
(3766, 'Cedula Fisica', 602000214, 'QUIEL DINARTE AIDA', 'UVITA CENTRO 75MTS ESTE BANCO CR EN', 'FEELING GOOD SPA 8312/5208', '2743-8489', ''),
(3767, 'Cedula Fisica', 203460683, 'QUINTANILLA MONTERO MIRIAM', 'Tinoco   S Francisco   contiguo al Sa', 'lón del Reino.', '2786-3106', ''),
(3768, 'Cedula Fisica', 603820529, 'QUINTERO ARCE MICHAEL', 'Golfito   Llano Bonito   Oasis de Es-', 'peranza   casa 22. Cel 8692-7358.', '8692-7330', ''),
(3769, 'Cedula Fisica', 602180405, 'QUINTERO CABALLERO ELIZABETH', 'P  JIMENEZ   SODA LAS DELICIAS DEL', 'MAIZ', '7351196', ''),
(3770, 'Cedula Fisica', 600630376, 'QUINTERO CASERES EVA', 'PUERTO JIMENEZ DEL RESTAURANT', 'ORO VERDE 50 N SODA CHANA.(CENTRO)', '7355216', ''),
(3771, 'Cedula Fisica', 600690987, 'QUINTERO CASERES GLICERINA', 'Puerto Jiménez Centro   Pensión Quin', 'tero.', '7355433', ''),
(3772, 'Cedula Fisica', 600690987, 'QUINTERO CASERES GLICERINA', 'Puerto Jiménez Centro   Pensión Quin', 'tero.', '7355433', ''),
(3773, 'Cedula Fisica', 601080198, 'QUINTERO GUSTAVINO JOSE MARIA', 'LA CUESTA CAMINO AL CHORRO', '<P> 30 C/M', '-', ''),
(3774, 'Cedula Fisica', 109740044, 'QUINTERO MENDEZ LUIS', 'La cuesta 2 Km y Medio Cementeri Cs', 'amarilla de cemento de vergas negra', '8752-5745', ''),
(3775, 'Cedula Fisica', 601650170, 'QUINTERO PITTY DIOGENES.', 'PTO ESCONDIDO RANCHO QUEMADO 1era', 'ENTRADA 1er CASA MANO IZQUIERDA', '', ''),
(3776, 'Cedula Fisica', 600540642, 'QUINTERO QUINTERO AURIA', 'PTO JIMENEZ CONT.A TALLER TABOGA', '', '8349987', ''),
(3777, 'Cedula Fisica', 900280458, 'QUINTERO QUINTERO MARIA CRISTINA', 'PUERTO JIMENEZ   COSTADO SUR DE LA', 'IGLESIA CATOLICA CASA COLOR CREMA', '7355040', ''),
(3778, 'Cedula Fisica', 202140045, 'QUINTERO QUINTERO TELMA', 'GOLFITO  CASA 4229 DETRAS DE LA', 'ESCUELA   P. 03 C/M.', '750390', ''),
(3779, 'Cedula Fisica', 601010223, 'QUINTERO QUINTERO THELMA', 'Golfito  Bº Bella Vista  200m Ferret', 'Pachica. cs 4229.', '2775-0390', ''),
(3780, 'Cedula Fisica', 600720198, 'QUINTERO QUINTERO VIVIANA', 'Pto escondido del telefono 400mts', 'norte entrada mano izquierda', '', ''),
(3781, 'Cedula Fisica', 600720198, 'QUINTERO QUINTERO VIVIANA', 'P Jiménez   Escondido  Bar Restaurant', 'El Cedro. 2735-1084.', '2735-1567', ''),
(3782, 'Cedula Fisica', 601850113, 'QUINTERO ZAPATA JUAN EDILBERTO', 'C. CORTES Bº EL PRECARIO Nº28 3RA A', '50 MTS SUR DE PULP. VANESA..', '', ''),
(3783, 'Cedula Fisica', 601850113, 'QUINTERO ZAPATA JUAN EDILBERTO', 'CORTES PRECARIO CASA Nª 31', '8  CADA   MES', '8970113', ''),
(3784, 'Cedula Fisica', 103921192, 'QUIROS AGUILAR CARLOS', 'GOLFITO   KM 1   SEXTA FILA', 'CASA Nº 4167', '7751834', ''),
(3785, 'Cedula Fisica', 103921192, 'QUIROS AGUILAR CARLOS.', 'NO SE REGISTRO.', '', '', ''),
(3786, 'Cedula Fisica', 103921192, 'QUIROS AGUILAR CARLOS.', 'NO SE REGISTRO.', '', '', ''),
(3787, 'Cedula Fisica', 103190022, 'QUIROS ALVARADO ELVIRA', 'LA VIQUILLA 3 1er ENTRADA 400 MTS', 'M.IZQUIERDA', '2789-8546', ''),
(3788, 'Cedula Fisica', 103190022, 'QUIROS ALVARADO ELVIRA', 'LA VIQUILLA 3 1er ENTRADA 400 MTS', 'M.IZQUIERDA', '7898546', ''),
(3789, 'Cedula Fisica', 103190022, 'QUIROS ALVARADO ELVIRA', 'LA VIQUILLA 3 1 ER ENTRADA 400MTRS', 'M IZQUIERDA. Paga de mes x medio.', '7898546', ''),
(3790, 'Cedula Fisica', 602750799, 'QUIROS CAJINA ELRIA BETTE', 'CONTIGUO A ENTRADA A LA PLAYA', 'CAÑAZA PTO JIMENEZ', '3271684', ''),
(3791, 'Cedula Fisica', 602750799, 'QUIROS CAJINA ELRIA BETTE', 'P Jiménez  Cañaza x ent antiguo Yugo', '50m hacia jiménez.', '8702-7232', ''),
(3792, 'Cedula Fisica', 603910735, 'QUIROS CASTILLO KATIANA', 'Coto 47  Costado Sur Estadio   5º cs', 'Nº 10.326', '8676-6940', ''),
(3793, 'Cedula Fisica', 103010730, 'QUIROS CHACON ANGELA', 'P Jiménez   Urb S Lázaro   cs 70 200m', 'taller Diego.', '2735-5804', ''),
(3794, 'Cedula Fisica', 601910394, 'QUIROS GONZALEZ HILDA', 'GOLFITO   KMT 12 LA MONA', 'BAR Y RESTAURANT LA MONA', '7750818', ''),
(3795, 'Cedula Fisica', 600860379, 'QUIROS GONZALEZ ROSA', 'GOLF. LA MONA DEL PUENTE X ENTRADA', 'M.D. 700 Mts Noreste. p. 03 c/m', '-', ''),
(3796, 'Cedula Fisica', 601900927, 'QUIROS HIDALGO LIZETH', 'CIUDAD NEILY Bº SAN RAFAEL FRENTE', 'SALON COMUNAL. <P> OFICINA', '783-', ''),
(3797, 'Cedula Fisica', 600170592, 'QUIROS JIMENEZ OTILIA', '', '', '', ''),
(3798, 'Cedula Fisica', 601070972, 'QUIROS LORIA MIRIAM', 'R Claro   Bambel 3   Rancho 300m al', 'fondo 100m MI.', '2789-8156', ''),
(3799, 'Cedula Fisica', 500900858, 'QUIROS MADRIGAL ODILIE CC DAMARIS', 'Fca Alajuela 500 m sur recibidor', 'Palma Tica.', '8616-5062', ''),
(3800, 'Cedula Fisica', 103580864, 'QUIROS MORALES MANUEL', 'P Jiménez   La Amapola   200m este de', 'Pulp. Calle a la playa.', '8376-0164', ''),
(3801, 'Cedula Fisica', 106010682, 'QUIROS MUÑOZ LIGIA', 'P Canoas   S Martín  Cs Nº5 cc blanca', 'Tapia Café. Cel 8944-1179', '2732-2017', ''),
(3802, 'Cedula Fisica', 104050033, 'QUIROS PORRAS ADONAY ZENEIDA', 'LA PALMA ENTRADA FCA MIGUEL CASTRO', '* FECHA DE PAGO 11 CADA MES **', '', ''),
(3803, 'Cedula Fisica', 502060593, 'QUIROS PORRAS LILLIAM', 'CIUDAD NEILY   BANCO DEL COMERCIO', 'CREDOSA S.A.', '7835301', ''),
(3804, 'Cedula Fisica', 502060593, 'QUIROS PORRAS LILLIAM', 'CIUDAD NEILY ABROJO DE COLORADITO', '<P> 15 Y 30 C/M', '', ''),
(3805, 'Cedula Fisica', 502060593, 'QUIROS PORRAS LILLIAM.', 'CIUDAD NEILY ABROJO CENTRO 200 M', 'NORTE DEL PUENTE DE ABROJO', '', ''),
(3806, 'Cedula Fisica', 102600893, 'QUIROS QUESADA ISOLINA', 'Rio Claro   Bambel   contiguo antiguo', 'angar   detras de casa de Faustino.', '8333-6888', ''),
(3807, 'Cedula Fisica', 501680033, 'QUIROS QUESADA URIAS', 'DRAKE 150 MTS DEPS. DEL MIRADOR', '', '', ''),
(3808, 'Cedula Fisica', 603100733, 'QUIROS ROJAS MAUREN', 'Coloradito   abrojo San Antonio', 'abajo  ', '8743-0236', ''),
(3809, 'Cedula Fisica', 600450026, 'QUIROS VENEGAS MARIO..', 'GOLFITO. HOSPITAL FARMACIA O EN KMT', 'UNO PRIMERA CASA # 4450', '750291', ''),
(3810, 'Cedula Fisica', 601970111, 'QUIROS VIVAS ELSI', 'Pto Jiménez   Playa Matapalo Casa', 'Tortuga. Telf: 8367-0702.', '', ''),
(3811, 'Cedula Fisica', 601970111, 'QUIROS VIVAS ELSY', 'P Jiménez  Cañaza  Abast.La Paquerita', '', '8729-3752', ''),
(3812, 'Cedula Fisica', 109850774, 'QUIROZ GONZALEZ KAROL', 'CN.B* LA ESPERANZA DETRAS DE MIRIAM', 'SOTO LA PULPERIA', '8954-1456', ''),
(3813, 'Cedula Fisica', 101840131, 'RADIO GOLFITO   T.V. 32', 'GOLFITO LA ROTONDA', '', '775', ''),
(3814, 'Cedula Fisica', 101840131, 'RADIO GOLFITO   T.V. 32', 'GOLFITO LA ROTONDA', '', '775', ''),
(3815, 'Cedula Fisica', 118430713, 'RAMIRES SALAZAR MARIA YALILE', 'P SUR 2º ENT ESTADIO. Deja dinero', 'con vecina maruja si no estuviera.', '8967-9859', ''),
(3816, 'Cedula Fisica', 501980302, 'RAMIREZ  CRUZ LUZ MARINA', 'PTO JIMENEZ   PLAYA SOMBRERO', 'PREGUNTAR EN CASA YERLIN GONZALEZ', '8584176', ''),
(3817, 'Cedula Fisica', 601240628, 'RAMIREZ ABARCA CELESTINO', 'Sierpe de Osa   Sabalo   Iglesia', 'Evangelio Completo. 87024739', '8702-4739', ''),
(3818, 'Cedula Fisica', 602020686, 'RAMIREZ ALVARADO ALFREDO', 'Finca Guanacaste 800m de la Escuela', 'Cel 8560-4453', '8560-4453', ''),
(3819, 'Cedula Fisica', 600630223, 'RAMIREZ ALVARADO CARLOS LUIS', 'Paso Canoas   Almacen New antes del', 'Almacen Wong Chan con Enel', '', ''),
(3820, 'Cedula Fisica', 600730758, 'RAMIREZ ALVARADO ELISA', 'Villa Bonita   Detrás Iglesia AD   ca', 'lle a Palmar.', '2786-3004', ''),
(3821, 'Cedula Fisica', 501130622, 'RAMIREZ ALVARADO FERNANDO', 'GOLFITO LLANO BONITO', 'CABINAS HEREDIANA', '7750841', ''),
(3822, 'Cedula Fisica', 601880133, 'RAMIREZ ALVARADO LISBETH CC BETTY', 'Palmar   Tinoco  un costado del EBAIS', 'cc rosada. Cel 8537-7559', '8798-9596', ''),
(3823, 'Cedula Fisica', 601090217, 'RAMIREZ ALVARADO MARVIN', 'SAN RAMON RIO CLARO DEL PUENTE 1RA', 'ESTRADA MA.DERECHA C.A. EST.CHALETH', '7898915', ''),
(3824, 'Cedula Fisica', 501451280, 'RAMIREZ ARIAS GERARDO', 'Planta del ICE Río Claro.', 'Segunda Puerta.', '', ''),
(3825, 'Cedula Fisica', 601260963, 'RAMIREZ ARIAS GLADYS', 'CIUDADELA GUAYCARA R CLARO CASA #2', 'CONTG PLANTEL ICE <P> 03 C/M', '7899436', ''),
(3826, 'Cedula Fisica', 601260963, 'RAMIREZ ARIAS GLADYS', 'RIO CLARO CIUDADELA GUAYCARA CASA', 'Nº 2 ** FECHA DE PAGO 17 C/MES **', '7899436', ''),
(3827, 'Cedula Fisica', 601260963, 'RAMIREZ ARIAS GLADYS', 'RIO CLARO   CIUDADELA GUAYCARA CONTI', 'GUO AL ICE CASA NUMERO 2', '7473896', ''),
(3828, 'Cedula Fisica', 601150673, 'RAMIREZ ARIAS JEANETHE.', 'RIO CLARO   POR LA ESCUELA CENTRAL  ', '150 M NORTE DE LA IGLESIA METODISTA', '7898954', ''),
(3829, 'Cedula Fisica', 601150673, 'RAMIREZ ARIAS JEANETTE', 'CIUDADELA GUAYCARA R CLARO CASA # 4', 'CONTG PLANTEL ICE <P> 03 Y 16 C/M', '7899481', ''),
(3830, 'Cedula Fisica', 601150673, 'RAMIREZ ARIAS JEANETTE', 'RIO CLARO CIUDADELA GUYCARA CASA', 'Nº 2 ** FECHA DE PAGO 17 C/MES **', '7899436', ''),
(3831, 'Cedula Fisica', 601150673, 'RAMIREZ ARIAS JEANNETHE.', 'Rio Claro   X la Escuela Central 150', 'metros Norte de la Iglesia Metodist', '2789-8954', ''),
(3832, 'Cedula Fisica', 600940025, 'RAMIREZ BARQUERO ARNOLDO', 'conte  contiguo al colegio soda xini', 'a', '2776-8061', ''),
(3833, 'Cedula Fisica', 602950772, 'RAMIREZ BARRANTES FLOR', 'Sabalito Bº Los Pinos 300 Mts E de', 'Esc Central Cs color papaya  ', '2784-0937', ''),
(3834, 'Cedula Fisica', 501360434, 'RAMIREZ BARRANTES JOEL CC CHANEL', 'Sta Lucía de Naranjo 10 N Asambleas', 'de Dios.', '2780-0147', ''),
(3835, 'Cedula Fisica', 500780780, 'RAMIREZ BLANCO EMILCE', 'JIMENEZ   SAN LAZARO 200 MTRS SUR DE', 'L TALLER DIEGO MORA', '8322-50', ''),
(3836, 'Cedula Fisica', 502300511, 'RAMIREZ BLANCO RONALD', 'JIMENEZ LA CALLE DEL BULEVAR', 'LA PURRUJA 87187472', '2767-6054', ''),
(3837, 'Cedula Fisica', 603810295, 'RAMIREZ CABEZAS CESAR', 'Comte   100m norte de la Escuela Fte', 'Super Sumari.', '8686-8630', ''),
(3838, 'Cedula Fisica', 101094407, 'RAMIREZ CAMBRONERO JAHAIRA', 'Ciudad Cortes   Bª Renacimiento Cs', 'E-4', '8630-0728', ''),
(3839, 'Cedula Fisica', 501330638, 'RAMIREZ CASTRO OLGA.', 'PASO CANOAS   Bº SAN JORGE DE LOS TA', 'NQUES 150MTS OESTE CASA #57 15CM.', '7322923', ''),
(3840, 'Cedula Fisica', 301510766, 'RAMIREZ CHACON CARLOS LUIS.', 'RIO CLA   LA ESPER. C. COLOR GRIS', 'FILA DESP. DEL PUENTE P.16 Y 03 C/M', '7899027', ''),
(3841, 'Cedula Fisica', 301510766, 'RAMIREZ CHACON CARLOS LUIS.', 'RIO CLA   LA ESPER. C. COLOR GRIS', 'FILA DESP. DEL PUENTE P.19 C/M', '*-*-*-*', ''),
(3842, 'Cedula Fisica', 401070518, 'RAMIREZ CHAVARRIA ZORAIDA', 'CIUDADELA TAMAYO   CASA # 12 A PULP', 'HERNANOS RAMIREZ <P> 15 C/M', '7322686', ''),
(3843, 'Cedula Fisica', 800820193, 'RAMIREZ CHAVARRIA ZORAIDA', 'La Cuesta  C Tamayo  1º entrada Pulp.', 'Ramírez.', '', ''),
(3844, 'Cedula Fisica', 603030308, 'RAMIREZ GUTIERREZ EFRAIN', 'Piedras Blancas   Res.Villas del Sur', 'Casa 11.', '8313-5711', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(3845, 'Cedula Fisica', 106460253, 'RAMIREZ HERNANDEZ ANA LORENA', 'BARRIO BELLA VISTA POR LAS GRADAS C', 'ASA 4368 COLOR AMARILLO', '2775-0913', ''),
(3846, 'Cedula Fisica', 601440511, 'RAMIREZ HERNANDEZ TRINIDAD', 'Golfito   Purruja   Ciud. Tuckler.', 'Abast. El Eloi.', '2775-2532', ''),
(3847, 'Cedula Fisica', 601450921, 'RAMIREZ JARA ILEANA', 'COTO 47 CASA # 1271', '*** CANCELA 15 C/MES ***', '7811073', ''),
(3848, 'Cedula Fisica', 601450921, 'RAMIREZ JARA ILEANA', 'C Neily   Bº Cartonera   Diagonal a', 'Fertica ultima casa.', '2783-4160', ''),
(3849, 'Cedula Fisica', 601450921, 'RAMIREZ JARA ILEANA', 'Ciudad Neily   Bº la cartonera', '', '8810-0126', ''),
(3850, 'Cedula Fisica', 601450920, 'RAMIREZ JARA ILEANA.', '47 EN LA ZONA CASA DE P BAJA #12271', '(cobro 30 y 15 de c/mes).', '754073', ''),
(3851, 'Cedula Fisica', 601450921, 'RAMIREZ JARA ILIANA', 'COTO 47 CASA N. 1271', '', '', ''),
(3852, 'Cedula Fisica', 501320219, 'RAMIREZ JIMENEZ BENIGNO', 'JIMENEZ BARRIO BONITO', 'CONTRATO INDIVIDUAL', '', ''),
(3853, 'Cedula Fisica', 602230727, 'RAMIREZ MARTINEZ WILFREDO', 'LAUREL Bº LUZ 350M ESTE TORRE ICE', 'CC BLANCA. 5002-0174.', '2783-8050', ''),
(3854, 'Cedula Fisica', 301240014, 'RAMIREZ MESA JOSE FRANCISCO', 'GOLFITO KM.1 DETRAS DE FERRETERIA', 'CASA N. 4444', '7750959', ''),
(3855, 'Cedula Fisica', 301240014, 'RAMIREZ MESA JOSE FRANCISCO', 'GOLFITO KM.1 DETRAS DE FERRETERIA', 'CASA N. 4444 03 c/m', '7750959', ''),
(3856, 'Cedula Fisica', 301120680, 'RAMIREZ MEZA FLORA', 'CIUDAD NEILY Bº 22 OCTUBRE EL IMAS', 'CASA 27 BLOQUE B * CANCELA 8 C/MES', '7833273', ''),
(3857, 'Cedula Fisica', 601720629, 'RAMIREZ MOLINA MIGUEL', 'SAN JORGE 125 SO DE TANQUEZ COBRAR', 'MINI SPE QUIJOTICO X ENTRADA BRIGAD', '7322076', ''),
(3858, 'Cedula Fisica', 601720629, 'RAMIREZ MOLINA MIGUEL', 'S Jorge   Tunel al final casa esqui-', 'nera.', '2732-2076', ''),
(3859, 'Cedula Fisica', 201510459, 'RAMIREZ MOLINA RAFAEL', 'BELLA LUZ DE ESCUELA 300  Mts SUR', '<P> 30 C/M', '', ''),
(3860, 'Cedula Fisica', 603170594, 'RAMIREZ MONGE JAVIER FRANCISCO', 'CIUDAD CORTES 400 MTS NORTE DE', 'PUENTE DE AMACA 8 C/MES', '7888022', ''),
(3861, 'Cedula Fisica', 601320735, 'RAMIREZ PEREZ MARIA CECILIA', 'CIUDAD NEILY FRENTE AL TALLER DE', 'CARLOS MEJIA', '', ''),
(3862, 'Cedula Fisica', 601320735, 'RAMIREZ PEREZ MARIA CESILIA', 'COTO 47 DEL ANTG. C.N.P. 100 Mts', 'ESTE CASA # 12233 P.02 C/M', '', ''),
(3863, 'Cedula Fisica', 800660780, 'RAMIREZ RAMIREZ SABINA.', 'KILOMETRO 37   VILLA BRICEÑO FRENTE', 'A SALON TESTIGOS DE JEHOVA.', '', ''),
(3864, 'Cedula Fisica', 900660424, 'RAMIREZ RETANA RAMONA', 'CIUDAD NEILY   CIUDADELA GONZALEZ', 'PULP EL JARDIN FRENTE AL TELE PUBLI', '7833199', ''),
(3865, 'Cedula Fisica', 401330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO  COBRAR A RAMIREZ ICE', '', '754057', ''),
(3866, 'Cedula Fisica', 401330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO  COBRAR A RAMIREZ', '', '789-', ''),
(3867, 'Cedula Fisica', 401330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO. COBRAR A RAMIREZ', '', '789', ''),
(3868, 'Cedula Fisica', 410330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO. COBRAR A RAMIREZ', '', '789', ''),
(3869, 'Cedula Fisica', 410330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO. COBRAR A RAMIREZ.', '', '789', ''),
(3870, 'Cedula Fisica', 401330896, 'RAMIREZ ROMERO LUIS FERNANDO', 'RIO CLARO I C E  COBRAR A RAMIREZ', '<P> 16 C/M', '7894057', ''),
(3871, 'Cedula Fisica', 601450934, 'RAMIREZ SALINAS OLGA', 'LA CUESTA CAMINO AL CHORRO', '<p> 25 C/M', '', ''),
(3872, 'Cedula Fisica', 601450934, 'RAMIREZ SALINAS OLGA', 'LA CUESTA CAMINO AL CHORRO', '<P> EN OFICINA', '', ''),
(3873, 'Cedula Fisica', 601450934, 'RAMIREZ SALINAS OLGA', 'La Cuesta   1Kmt Sur  de la Guardia', 'Rural. 2732-3032', '8818-2752', ''),
(3874, 'Cedula Fisica', 601450934, 'RAMIREZ SALINAS OLGA RUTH', 'La Cuesta   1km sur Guardia Civil.', 'Cel 8818-2752.', '2732-3032', ''),
(3875, 'Cedula Fisica', 602360397, 'RAMIREZ SANTAMAARIA MARYXABEL', 'Bambu de pulp La Amistad 500 SurO', 'Cs verde Mixta. 8995-2266', '8986-2186', ''),
(3876, 'Cedula Fisica', 602140796, 'RAMIREZ SERRACIN IVETTE', 'LA JULIETA 200 METROS AL SUR DE LA', 'ESCUELA LA JULIETA', '', ''),
(3877, 'Cedula Fisica', 602140796, 'RAMIREZ SERRACIN IVETTE', 'LA JULIETA 200 METROS AL SUR DE LA', 'ESCUELA LA JULIETA', '', ''),
(3878, 'Cedula Fisica', 602140796, 'RAMIREZ SERRACIN IVETTE', 'la julieta 200m s. de la', 'escuela la julieta', '3615521', ''),
(3879, 'Cedula Fisica', 501980927, 'RAMIREZ SIBAJA FRANCISCO', 'LA VIRGEN DE SABALO ABASTECEDOR LA', 'MERENDINA   <P> 15 C/M', '', ''),
(3880, 'Cedula Fisica', 501980927, 'RAMIREZ SIBAJA FRANCISCO', 'LA VIRGEN DE SABALO ABASTECEDOR LA', 'MERENDINA   <P> 30 C/M', '', ''),
(3881, 'Cedula Fisica', 501980927, 'RAMIREZ SIBAJA FRANCISCO', 'La Virgen de Pavones   abast. La Me-', 'rendina. Cel 8315-5804.', '2780-1632', ''),
(3882, 'Cedula Fisica', 501980927, 'RAMIREZ SIBAJA FRANCISCO', 'LA VIRGEN DE COMTE ABASTECEDOR', 'MERENDINA', '2780-1632', ''),
(3883, 'Cedula Fisica', 502090840, 'RAMIREZ UGALDE OLGER', 'BELLA LUZ   BAR RESTAURANT LAS', 'CARRETAS.', '3863024', ''),
(3884, 'Cedula Fisica', 602980396, 'RAMIREZ VEGA DELFIN', 'LA CENTRAL CAMPESINA DEL BAR', 'AR0 MTS CASA A MANO DERECHA.', '', ''),
(3885, 'Cedula Fisica', 602980396, 'RAMIREZ VEGA DELFIN', 'LA CENTRAL CAMPESINA DEL BAR', '500 MTS CASA A MANO DERECHA.', '', ''),
(3886, 'Cedula Fisica', 602980396, 'RAMIREZ VEGA DELFIN', 'Coto 44   Central Campesina   150 sur', 'Bar Urimar   MD. Cel 8971-9847.', '', ''),
(3887, 'Cedula Fisica', 602380469, 'RAMIREZ VILLALOBOS ANA LUISA', 'Paso Canoas   Bo San Jorge   de la', 'entrasda a los tanques 3 calles izq', '7321872', ''),
(3888, 'Cedula Fisica', 501471403, 'RAMOS BARRERA RAFAEL', 'R Claro   La Esperanza   100 este 100', 'sur puesto policial. cs color espig', '2789-7326', ''),
(3889, 'Cedula Fisica', 500550004, 'RAMOS LEIVA LURLINES', 'PALMAR N. 25 OESTE DE IGLECIA ASAMB', 'O FTE CABINAS FIGURIN  8 C/M.', '7866570', ''),
(3890, 'Cedula Fisica', 900490156, 'RAMOS LOPEZ LUIS GERARDO', 'ZARAGOZA ALMACEN YANCY', '', '', ''),
(3891, 'Cedula Fisica', 900490156, 'RAMOS LOPEZ LUIS GERARDO (PITO)', 'Roblito de Laurel   Corredores', '', '', ''),
(3892, 'Cedula Fisica', 900490156, 'RAMOS LOPEZ LUIS GERARDO (PITO)', 'Roblito de Laurel   Almacén Yanci.', '', '', ''),
(3893, 'Cedula Fisica', 900490156, 'RAMOS LOPEZ LUIS GERARDO (PITO)', 'NARANJO. ALMACEN PITO Y ALBA', '', '2780-0264', ''),
(3894, 'Cedula Fisica', 602730431, 'RAMOS ORTEGA NELEY (C.C. NELSY)', 'GOLFITO KMT 3 CONTIG A ABASTECEDORS', 'ANDREA O COMERDOR DEL HOSPITAL GOLF', '7751183', ''),
(3895, 'Cedula Fisica', 104090100, 'RAMOS RAMOS CRISTINA', 'PALMAR NORTE FTE. CABINAS FYGURIN', '8 C/MES', '7866574', ''),
(3896, 'Cedula Fisica', 900610805, 'RAMOS RAMOS NIEVES DEL SOCORRO', 'La Palma   de la entrada de Guadalup', '100 Oes trocha nueva. 8990-6861', '', ''),
(3897, 'Cedula Fisica', 601740238, 'RAMOS TORRES INOCENTE ANTONIO', 'Vereh de Laurel   2km este de Pulp.', 'Donald. Telf: 8885-0377.', '', ''),
(3898, 'Cedula Fisica', 501920022, 'RANGEEL JIMENEZ CARLOS', 'ESTRELLA DE CONTE.ENTR. POR BAR', 'CHICOS 200M CASA MANO DERECHA.', '', ''),
(3899, 'Cedula Fisica', 602860569, 'RANGEL BRIONES FLOR', 'Punta Banco  25m sur costado sur de', 'la plaza.', '2776-2064', ''),
(3900, 'Cedula Fisica', 501590683, 'RANGEL JIMENEZ JOBITA', 'Bella luz de bar las carretas 500 M', 'hacia comte M/D casa al fondo  ', '', ''),
(3901, 'Cedula Fisica', 502240221, 'RANGEL LOPEZ BERNANDINO', 'pto JIMENEZ URB   EL COLEGIO FRTE', 'PURPERIA', '7355939', ''),
(3902, 'Cedula Fisica', 502240221, 'RANGEL LOPEZ BERNARDINO', 'PTO JIMENEZ URB. EL COLEGIO FTE', 'PULP.* FECHA DE PAGO  13 C/MES *', '7355939', ''),
(3903, 'Cedula Fisica', 502240221, 'RANGEL LOPEZ BERNARDINO', 'PTO JIMENEZ URBA EL COLEGIO FTE A', 'PULPERIA  ', '', ''),
(3904, 'Cedula Fisica', 800440854, 'REAL ESTRADA ROSA', '', '', '', ''),
(3905, 'Cedula Fisica', 602900744, 'RETANA ALVAREZ MAYNOR', 'FINCA 6-11 DETRAS DEL COMEDOR', 'ESCOLAR', '2788-1002', ''),
(3906, 'Cedula Fisica', 602900744, 'RETANA ALVAREZ MINOR', 'Palmar Fca 6-11 detrás de Escuela', 'Cel 8331-2583', '2788-1002', ''),
(3907, 'Cedula Fisica', 601700726, 'RETANA BERMUDEZ OSCAR', 'rio incendio de la escuela 500mts o', 'este casa color verde en alto', '8941-2850', ''),
(3908, 'Cedula Fisica', 603330898, 'RETANA GONZALEZ LORENA', 'Bella Luz   Rio Incendio   200m oeste', 'de la Escuela. Cel 8644-6265.', '2783-8425', ''),
(3909, 'Cedula Fisica', 600960884, 'REY JIMENEZ BLAS JORGE', 'RIO NUEVO   CASA 23-B A UN COSTADO', 'DE LA ESCUELA', '7834521', ''),
(3910, 'Cedula Fisica', 601340275, 'REYES AGUIRRE EUSTAQUIO', 'pto jimenez urbanizacion el colegio', '40 mts sur de pulperia tony', '', ''),
(3911, 'Cedula Fisica', 601340275, 'REYES AGUIRRE EUSTAQUIO', 'Pto Jiménez  Urbanización el Colegio', '40 mts sur de pulpería Tony.', '7355439', ''),
(3912, 'Cedula Fisica', 602180076, 'REYES CORRALES JAIRO', 'R. CLARO COSTADO OESTE D`LA ESCUELA', 'VIDEO DESINNE <P> 03 C/M', '', ''),
(3913, 'Cedula Fisica', 602180076, 'REYES CORRALES JAIRO', 'R. CLARO COSTADO OESTE D`LA ESCUELA', 'VIDEO DESINNE <P> 03 C/M', '', ''),
(3914, 'Cedula Fisica', 601200380, 'REYES FLORES GUILLERMO', '', '', '', ''),
(3915, 'Cedula Fisica', 600780064, 'REYES GOMEZ DESIDERIO CC BURRITO', 'R Claro   Bambel 3   300m antes bar', 'Ranchito   carretera a Golfito.', '2789-8510', ''),
(3916, 'Cedula Fisica', 601660693, 'REYES HERNANDEZ WILLIAM.', 'Bº EL CARMEN.', '', '', ''),
(3917, 'Cedula Fisica', 202830175, 'REYES JIMENEZ MARIA ELENA', 'Las Gambas   Finca la Bolsa.', 'Villa Briceño.', '', ''),
(3918, 'Cedula Fisica', 202830175, 'REYES JIMENEZ MARIA ELENA', 'FINCA LA BOLSA DE LAS GAMBAS', '', '', ''),
(3919, 'Cedula Fisica', 202830175, 'REYES JIMENEZ MARIA ELENA', 'LA GAMBA DE GOLFITO FCA. LA BOLSA', '*** FECHA DE PAGO 8 C/MES ***', '', ''),
(3920, 'Cedula Fisica', 202380175, 'REYES JIMENEZ MARIA ELENA', 'Las Gambas   finca la bolsa', '', '', ''),
(3921, 'Cedula Fisica', 603950136, 'REYES NAVARRO ITCEL', 'BAMBITO LAUREL 150MTS AL SUR DE LA', 'ESCUELA CASA PREFABRICADA ROSADA', '2780-0141', ''),
(3922, 'Cedula Fisica', 603660977, 'REYES NAVARRO KRISTEL', 'Laurel   Bambito  150m sur Escuela cs', 'rosada.', '2780-0141', ''),
(3923, 'Cedula Fisica', 700460563, 'REYES OBANDO MARIA SALVADORA', 'chacarita entrada a puerto jimenez', '700 metros mano derecha', '7411223', ''),
(3924, 'Cedula Fisica', 700460563, 'REYES OBANDO MARIA SALVADORA', 'chacarita calle jimenez 700 mts de', 'la bomba.', '7411285', ''),
(3925, 'Cedula Fisica', 700460563, 'REYES OBANDO SALVADORA', 'Chacarita 700mts de la bomba', '', '', ''),
(3926, 'Cedula Fisica', 700460563, 'REYES OBANDO SALVADORA', 'Chacarita 700mts de la bomba', '', '', ''),
(3927, 'Cedula Fisica', 700460563, 'REYES OBANDO SALVADORA', 'Chacarita 700mts de la bomba', '', '', ''),
(3928, 'Cedula Fisica', 600520217, 'REYES PALACIOS VICTOR ABAD', 'C Neily   C González   70m Norte escu', 'ela. Cel 8685-7752.', '2783-2831', ''),
(3929, 'Cedula Fisica', 601950983, 'REYES PICADO ESTHER', 'CIUDADELA GUAYMI 13 C/MES', '', '7768176', ''),
(3930, 'Cedula Fisica', 111610333, 'REYES PICADO SERGIO', 'Bº Carmen   Iglesia Misionera 500 m', 'Sur.', '8764-5722', ''),
(3931, 'Cedula Fisica', 111610333, 'REYES PICADO SERGIO', 'B.EL CARMEN CIUDAD NEILY', '', '2783-6389', ''),
(3932, 'Cedula Fisica', 500610779, 'REYES REYES FRANCISCO', 'pto jimenez mata gorda', '', '', ''),
(3933, 'Cedula Fisica', 600820942, 'REYES REYES JOSE VICENTE', 'GOLFITO B. SAN ANDRES CASA # 3', 'PRIMER ETAPA <P> 03 C/M', '', ''),
(3934, 'Cedula Fisica', 600820942, 'REYES REYES JOSE VICENTE', 'GOLFITO B. SAN ANDRES CASA # 12', '', '7750323', ''),
(3935, 'Cedula Fisica', 600470529, 'REYES REYES SIMON', 'FINCA GUANACASTE   50 MTS DE LA', 'ESCUELA A UN COSTADO DE LA PLAZA', '', ''),
(3936, 'Cedula Fisica', 280682002, 'RIOS CABALLERO JUAN', 'B. SAN JORGE  300M NORTE DE ESCUELA', 'CONFRATERNIDAD.', '', ''),
(3937, 'Cedula Fisica', 280682002, 'RIOS CABALLERO JUAN', 'B SAN JORGE   75 m norte Pulp Gómez.', 'Palo mango grande.', '2732-3797', ''),
(3938, 'Cedula Fisica', 104010077, 'RIOS ELIZONDO OLMAN', 'JIMENEZ CUIDADELA GALLARDO', 'CONTIGUO CASA DE HABITACION', '8786-1418', ''),
(3939, 'Cedula Fisica', 601560738, 'RIOS GARITA RAFAEL', 'P Jiménez   Escondido   50m feria del', 'Maíz.', '2735-1625', ''),
(3940, 'Cedula Fisica', 601600114, 'RIOS RIOS MARIA MODESTA', 'Pto Jiménez   La Urba de la Antena 5', '0 m izquierda. Telf 8817-4801  2735', '', ''),
(3941, 'Cedula Fisica', 107670563, 'RIOS RIOS MAUREN PATRICIA', 'PTO.JIMENEZ URB.EL.COLEGIO', 'CASA B.1', '7355470', ''),
(3942, 'Cedula Fisica', 107670560, 'RIOS RIOS PATRICIA', 'P Jiménez   La Urba casa B1', 'Trabaja Iglesia Católica.', '8335-6888', ''),
(3943, 'Cedula Fisica', 900280019, 'RIOS RIOS PLACIDO BELTRAN', 'JMNZ CENTRO DEL SUR 250 AL SUR CASA', 'COLOR LADRILLO', '8622-2624', ''),
(3944, 'Cedula Fisica', 112320233, 'RIOS VARGAS SILVIA MAGALY', 'P Norte   11 Abril   diagonal abast.', '11 de Abril. Cel 8602-8392.', '2786-6596', ''),
(3945, 'Cedula Fisica', 602910674, 'RIVAS BEJARANO AUDIEL', 'GOLFITO   I.M.A.S. Bº SAN MARTIN', 'CASA Nº 25 COLOR CELESTE C. ROJO', '7751341', ''),
(3946, 'Cedula Fisica', 601350229, 'RIVAS BERNARDO', 'km 12 la mona de golfito', '150 m  del ranchito', '7755361', ''),
(3947, 'Cedula Fisica', 601330844, 'RIVAS CASTRILLO MARGARITA', 'Golfito   Res Ureña   casa c15.', '', '2775-2432', ''),
(3948, 'Cedula Fisica', 600660889, 'RIVAS CASTRILLO MARIA DE LOS ANGELE', 'Golfito   Km 16   50m entrada al 18  ', 'fte pulp. La Flor.', '2775-6117', ''),
(3949, 'Cedula Fisica', 602400401, 'RIVAS GUTIERREZ NIDIA', 'naranjo de laurel  urbanizacion el n', 'aranjal casa n10l color verde', '8530-3225', ''),
(3950, 'Cedula Fisica', 270125105, 'RIVAS GUZMAN FRANCISCA', 'pto jimenez 1 kmt de la entrada', 'al tigre casa con verjas', '', ''),
(3951, 'Cedula Fisica', 601730730, 'RIVAS MARIN LORENA', 'CORTES Bº PRECARIO CASA Nº 4', 'COBRAR EN CCSS.', '7888684', ''),
(3952, 'Cedula Fisica', 601730730, 'RIVAS MARIN LORENA', 'Cortés Bº Precario Casa Nº 4', '', '8854-3216', ''),
(3953, 'Cedula Fisica', 601460680, 'RIVAS PINEDA LUIS', '', '', '', ''),
(3954, 'Cedula Fisica', 270592882, 'RIVAS RIVAS ANGEL.', 'LA ESPERANZA DE RIO CLARO 100 NORTE', 'DE LA IGLESIA CUADRANGULAR.', '7899757', ''),
(3955, 'Cedula Fisica', 500610313, 'RIVAS RIVAS DOMITILA', 'GOLFITO LA MONA DETRAS DE LA', 'ESCUELA', '', ''),
(3956, 'Cedula Fisica', 601340327, 'RIVAS RODRIGUEZ BLANCA LEDA', 'Sierpe Ciudadela Martinez   Frente a', 'Cabina Estero Azul.', '8737-6918', ''),
(3957, 'Cedula Fisica', 600700928, 'RIVAS ULATE ARGELIA', '', '', '', ''),
(3958, 'Cedula Fisica', 800700625, 'RIVERA CENTENO JULIO', 'LA CUESTA 1800 Mts CALLE A LAUREL.', '<P> 02 C/M', '', ''),
(3959, 'Cedula Fisica', 900980378, 'RIVERA GARBANZO GERARDO C.C WILBERT', 'Iglesia luz del mundo de la entrada', '40 mts hacia adentro', '8767-5732', ''),
(3960, 'Cedula Fisica', 101107058, 'RIVERA JIMENEZ JUAN JOSE', 'C Cortés   250m N Municipalidad cs', 'rosada.', '8796-3859', ''),
(3961, 'Cedula Fisica', 270568242, 'RIVERA LOPEZ CARLOS ALBERTO', 'COTO 54 CASA # 8210', '<P> OFICINA', '', ''),
(3962, 'Cedula Fisica', 159100124, 'RIVERA QUINTERO CARLOS ALBERTO', 'P Canoas   S Jorge   Asentam. Padilla', 'lote Nº 15. Cel 8764-2375.', '2732-3281', ''),
(3963, 'Cedula Fisica', 600380233, 'RIVERA RIVERA GERTRUDIS', 'BAMBITO CASA ESQUINERA DE LA PLAZA', '* PENCIONADA **', '', ''),
(3964, 'Cedula Fisica', 600460916, 'RIVERA RIVERA VENERANDA', 'RIO CLARO LA ESPERANZA FTE A LA', 'DELEGACION **  PAGO 10 C/MES ***', '3155312', ''),
(3965, 'Cedula Fisica', 601980710, 'RIVERA ZAMORA CARLOS ALBERTO', 'LAUREL INVU DE CENTRAL 200 Mts', 'NORTE <P> 30 C/M', '', ''),
(3966, 'Cedula Fisica', 501690078, 'ROBLES ANCHIA JOSE ANTONIO', 'GOLF kmt 1 LA BOLSA CASA # 4182', '<p> 02 C/M', '*-*-*-*', ''),
(3967, 'Cedula Fisica', 600610367, 'ROBLES CALVO VIDAL', 'Fca GUANC A UN COSTADO D`LA ESC', 'O ESQ DE PLAZA <P> 06 C/M', '', ''),
(3968, 'Cedula Fisica', 600610367, 'ROBLES CALVO VIDAL', 'OSA PUNTARENAS   FINCA GUANACASTE  ', 'FRANTE ALA ESCUELA', '7863302', ''),
(3969, 'Cedula Fisica', 109330501, 'ROBLES CORTES JUAN ANTONIO', 'C Cortés   Ciud. Renacimiento.', '', '8699-0029', ''),
(3970, 'Cedula Fisica', 602900504, 'ROBLES CORTES WENDY', 'C Cortes   Bº Renacimiento Cs E-1', '', '8400-6500', ''),
(3971, 'Cedula Fisica', 603220738, 'ROBLES FUENTES ANAIS', 'URBA EL ALMACEN CASA *11', '', '8507-9072', ''),
(3972, 'Cedula Fisica', 601980972, 'ROCHA BARRANTES ALAN', 'COTO 63   COSTADO SUR DEL COMISARIAT', 'O75 MTS SUR CASA Nº 15512', '7899271', ''),
(3973, 'Cedula Fisica', 600930124, 'ROCHA COREA MARIELOS', 'Bº BELLA VISTA 2da FILA FRET TRACOP', 'CASA # 4205 <P> 03 C/M', '7751160', ''),
(3974, 'Cedula Fisica', 900500092, 'ROCHA ROCHA DAYSI', 'CIUDAD CORTES 100 m.antes', 'del colegio', '7888604', ''),
(3975, 'Cedula Fisica', 501430368, 'RODRIGUEZ ALVARADO ARACELLY.', 'CIUDADELA LOS COMANDOS FTE A STON.', 'CASA COLOR VERDE Y BLANCO.', '7835876', ''),
(3976, 'Cedula Fisica', 514301368, 'RODRIGUEZ ALVARADO ARACELLY.', 'CIUDADELA LOS COMANDOS FTE A STON.', 'CASA COLOR VERDE Y BLANCO.', '7835876', ''),
(3977, 'Cedula Fisica', 104020939, 'RODRIGUEZ ARGUEDAS RODRIGO', 'B*BETANIA CANOAS ENTRADA PURISCAL', '300MTS AL ESTE DE LA PULP BETANIA', '8793-6992', ''),
(3978, 'Cedula Fisica', 601380955, 'RODRIGUEZ ARROYO MARVIN', 'Bambito de Laurel.', '', '2780-1297', ''),
(3979, 'Cedula Fisica', 603330098, 'RODRIGUEZ BARRANTES JOY', 'P Jiménez   Bº Bonito   Agujas   200 m', 'de Oeste de la Escuela.', '8566-6139', ''),
(3980, 'Cedula Fisica', 603330098, 'RODRIGUEZ BARRANTES JOY ALBERTO', 'DE LA ESCUELA 150 SUR BARRIO BONITO', 'DE AGUJAS', '882640-', ''),
(3981, 'Cedula Fisica', 900810486, 'RODRIGUEZ BELLO GERARDO', 'Naranjo 800m de la Guardia   Calle a', 'Zaragosa   casa Blanca M. Izq.', '7800309', ''),
(3982, 'Cedula Fisica', 800620635, 'RODRIGUEZ BRAVO JOSEFA', 'GOLFITO KM.3 DETRAS DCE PULPERIA', 'TORRES', '7751371', ''),
(3983, 'Cedula Fisica', 800620635, 'RODRIGUEZ BRAVO MARIA JOSEFA', 'Golfito   km3 contiguo abast   Miguel', 'Torres. Cel 8943-0614.', '2775-1371', ''),
(3984, 'Cedula Fisica', 603260537, 'RODRIGUEZ CAMACHO GEORGINA', 'P Jiménez   S Lazaro   Taller Diego', '300 este   cs 47.', '8671-3026', ''),
(3985, 'Cedula Fisica', 601800440, 'RODRIGUEZ CARMONA MARTHA', 'RIO CLARO FTE SALON COMUNAL CASA', 'ROSADA', '2789-9856', ''),
(3986, 'Cedula Fisica', 900570845, 'RODRIGUEZ CARMONA RAFAELA', 'km. 31 del bazar doña Rosa casa', 'mano izquierda', '', ''),
(3987, 'Cedula Fisica', 602630789, 'RODRIGUEZ CARRILLO WILBERT', 'C Cortés   200m Oeste Puente Hamaca', '', '8896-2533', ''),
(3988, 'Cedula Fisica', 602520307, 'RODRIGUEZ CASTELLON ALEIDA', 'Bº EL CARMEN ENTRADA PRINCIPAL 50 M', 'ESTE O IMPRENTA W-Z (WILLY ZUMBADO)', '783', ''),
(3989, 'Cedula Fisica', 602520307, 'RODRIGUEZ CASTELLON ALEIDA', 'C Neily   Carmen de Abrojo   lote 54  ', 'fte al Parquecito. 8949-7598.', '2783-5163', ''),
(3990, 'Cedula Fisica', 603520011, 'RODRIGUEZ CASTILLO DEIBIS', 'LA GAMBA DE COOPEGAMBA SEGUNDA CASA', 'DETRAS DE LA CASA CELESTE', '8898-0642', ''),
(3991, 'Cedula Fisica', 603520011, 'RODRIGUEZ CASTILLO DEIBIS', 'La Gamba   de Coopegamba 2da Cs', 'detras de Cs Celeste   8629-3108', '', ''),
(3992, 'Cedula Fisica', 603040972, 'RODRIGUEZ CASTRO IVANNIA', 'Coton   finca las del bosque Verde', 'P oficina San Vito.', '8689-0612', ''),
(3993, 'Cedula Fisica', 601550621, 'RODRIGUEZ CERDAS LEDA LUCIA', 'PASO CANOAS CONTIGUO AL COLONO SUR', 'OFIC. DE UMCA *** CANCELA 1 C/MES*', '2732-1610', ''),
(3994, 'Cedula Fisica', 155809343, 'RODRIGUEZ CERDAS MELVA', 'Ciudad Neily   Rio Nuevo   casa c-24', '', '8945-4264', ''),
(3995, 'Cedula Fisica', 602060003, 'RODRIGUEZ CHACON LILIAM', 'FCA. ALALUELA', '', '7411052', ''),
(3996, 'Cedula Fisica', 602060003, 'RODRIGUEZ CHACON LILLIAM', 'Fca ALAJUELA <P> 19 C/M', '', '', ''),
(3997, 'Cedula Fisica', 602060003, 'RODRIGUEZ CHACON LILLIAM', 'Fca Alajuela   Escuela Navidad 1 km', 'Norte.', '2741-1052', ''),
(3998, 'Cedula Fisica', 601230982, 'RODRIGUEZ CHAVES JHONNY', 'C.N. BARRIO SAN JUAN DEL MERCADO', '200 METROS ESTE. P. 30 DE C/M', '', ''),
(3999, 'Cedula Fisica', 600450747, 'RODRIGUEZ CHAVES JORGE LIDIO', 'CIUDAD CORTES FARMACIA LUIS MARTI-', 'NEZ CORTES CENTRO.', '', ''),
(4000, 'Cedula Fisica', 502200393, 'RODRIGUEZ CONTRERAS RONALDO', 'C Neily   Bº S Rafael   200s pulp los', 'Gallos. Trab Coopeande1. 8874-4741', '2783-5108', ''),
(4001, 'Cedula Fisica', 602360817, 'RODRIGUEZ CORTES FRANCISCO', 'SIERPE DE HOTEL MARGARITA 3RA CASA', 'MANO IZQUIERDA', '', ''),
(4002, 'Cedula Fisica', 600770025, 'RODRIGUEZ CRUZ JESUS MARIA', 'Rancho Quemado   800m de la Escuela.', '', '8808-8730', ''),
(4003, 'Cedula Fisica', 600770025, 'RODRIGUEZ CRUZ JESUS MARIA', 'Rancho Quemado   800m de la Escuela.', '', '8808-8730', ''),
(4004, 'Cedula Fisica', 602110100, 'RODRIGUEZ CRUZ JOSELITO', 'pto jimenez zandalo centro', '', '', ''),
(4005, 'Cedula Fisica', 900400770, 'RODRIGUEZ CRUZ MIRIAM', '150 m Este de la Municipalidad de', 'Corredores. Trab. Escuela Echandí M', '7833817', ''),
(4006, 'Cedula Fisica', 601870584, 'RODRIGUEZ CRUZ NOEMY', '', '', '', ''),
(4007, 'Cedula Fisica', 602020136, 'RODRIGUEZ ELIZONDO VICTOR MANUEL', 'Pto Jiménez   Iglesia Asambleas de', 'Dios x la bomba (Pastor).', '2735-5463', ''),
(4008, 'Cedula Fisica', 602800976, 'RODRIGUEZ ESPINOZA ROSMERY', 'FINCA 6-11 DE PALMAR FILA 1ERA', 'ULTIMA CASA DESPUES DE LA ESCUELA', '7881285', ''),
(4009, 'Cedula Fisica', 103590384, 'RODRIGUEZ FLORES AMPARO', '', '', '', ''),
(4010, 'Cedula Fisica', 800530367, 'RODRIGUEZ GAITAN INES', 'Tamarindo; Parada los Gemelos.', 'p.25 c/m', '', ''),
(4011, 'Cedula Fisica', 800530367, 'RODRIGUEZ GAITAN INES', 'Tamarindo; Parada los Gemelos.', 'p.25 c/m', '', ''),
(4012, 'Cedula Fisica', 602050481, 'RODRIGUEZ GARRO ROSA NIEVES', 'CIUDAD NEILY B` 22 DE OCTUBRE', 'CASA  # 9 BLOQUE E', '', ''),
(4013, 'Cedula Fisica', 210280693, 'RODRIGUEZ GONZALEZ FABIAN.', 'NO SE REGISTRO.', '', '', ''),
(4014, 'Cedula Fisica', 210280693, 'RODRIGUEZ GONZALEZ FABIAN.', 'NO SE REGISTRO.', '', '', ''),
(4015, 'Cedula Fisica', 210280693, 'RODRIGUEZ GONZALEZ FABIAN.', 'NO SE REGISTRO.', '', '', ''),
(4016, 'Cedula Fisica', 601780472, 'RODRIGUEZ GRANADOS JOSE MANUEL', 'GOLF PUEBLO CIVIL FRET MUNICIPALIDA', '<P>  16 Y 27 C/M', '7750250', ''),
(4017, 'Cedula Fisica', 500510773, 'RODRIGUEZ GUTIERREZ DAISY GERARDA', 'P Canoas   S Jorge   fte Balnearios', 'don Eduardo.', '', ''),
(4018, 'Cedula Fisica', 500870262, 'RODRIGUEZ GUTIERREZ OLMAN.', 'BELLA LUZ FRENTE AL ANTIGUO', 'ASERRADERO.', '771', ''),
(4019, 'Cedula Fisica', 602450914, 'RODRIGUEZ HERNANDEZ ELIUDU', 'C Cortés   Ojo de Agua   Urb. Pacheco', 'detrás EBAIS 50 sur.', '8649-2185', ''),
(4020, 'Cedula Fisica', 603630867, 'RODRIGUEZ HERRERA ERICKA', 'CARRETERA AL PIC NIC CASA·4420 CASA', 'COLOR CELESTE MADERA', '8685-9747', ''),
(4021, 'Cedula Fisica', 301310307, 'RODRIGUEZ JIMENEZ ABIGAEL', 'GOLF. BºBELLA VISTA CASA # 4042', '(HOSP)  <P> BISEMANAL', '', ''),
(4022, 'Cedula Fisica', 301310307, 'RODRIGUEZ JIMENEZ ABIGAEL', 'GOLF. BºBELLA VISTA CASA # 4042', '(HOSP)  <P> BISEMANAL', '', ''),
(4023, 'Cedula Fisica', 301310307, 'RODRIGUEZ JIMENEZ ABIGAEL', 'Bº BELLA VISTA 4TA FILA CASA', 'Nº 4042 * FECHA DE PAGO 2 C/MES*', '7751613', ''),
(4024, 'Cedula Fisica', 301180441, 'RODRIGUEZ JIMENEZ CARLOS ALBERTO', 'GOLFITO Bº BELLA VISTA CASA Nº 4240', '4TA FILA HERMANO DE ABIGAEL 2 C/MES', '7751613', ''),
(4025, 'Cedula Fisica', 102460308, 'RODRIGUEZ JIMENEZ JORGE', 'La Gamba   100 Mts Sur de la Pulp', '', '8866-1377', ''),
(4026, 'Cedula Fisica', 602940415, 'RODRIGUEZ JIMENEZ SILVIA', 'Sabalito  1 Km al sur Coopesabalito', '8558-1939', '', ''),
(4027, 'Cedula Fisica', 600940532, 'RODRIGUEZ JUAREZ ESMERALDA', 'CIUDAD NEILLY CASA DE HENRY ELIZON-', 'DO 300 MTS ESTE DE LA ESCUELA', '', ''),
(4028, 'Cedula Fisica', 600880457, 'RODRIGUEZ MATAMOROS GERARDO', 'RIO CLARO KMT 31 FRENTE', 'A LA IGLESIA CATOLICA', '', ''),
(4029, 'Cedula Fisica', 600880457, 'RODRIGUEZ MATAMOROS GERARDO', 'R Claro  Km31  fte Iglesia Católica  ', 'cs rojo vino con amarillo. 8842-615', '8977-5869', ''),
(4030, 'Cedula Fisica', 797333205, 'RODRIGUEZ MEDINA ANDRES', 'Paso Canoas  entrada Matías 25 Norte', '25 Sur.', '', ''),
(4031, 'Cedula Fisica', 797333205, 'RODRIGUEZ MEDINA ANDRES', 'P. Canoas   Calle Matías   75 m Norte', '25 Este.', '2732-2606', ''),
(4032, 'Cedula Fisica', 601001250, 'RODRIGUEZ MEJIA ANTONIO VICTOR', 'FINCA GUANACASTE', '', '', ''),
(4033, 'Cedula Fisica', 603380582, 'RODRIGUEZ MENDEZ JOSE LUIS', 'CIUDAD CORTES 75 MTS N. DEL JARDIN', 'CERVECERO 2DA MANO IZQ.', '7888880', ''),
(4034, 'Cedula Fisica', 603380583, 'RODRIGUEZ MENDEZ JOSE LUIS', 'Cortés Jardín cervecero 75 Norte.', '', '8650-6249', ''),
(4035, 'Cedula Fisica', 601400628, 'RODRIGUEZ MIRANDA REGINA YETI', 'La cuesta  125 sur del parque; calle', 'a Laurel. Cel 2732-2354 8791-6489.', '2732-2198', ''),
(4036, 'Cedula Fisica', 601400628, 'RODRIGUEZ MIRANDA REGINA YETTI', 'COBRAR EN MINIS DE SALUD LA CUESTA', '150 M. CALLE A LAUREL. P.30 C/M', '7322275', ''),
(4037, 'Cedula Fisica', 501220202, 'RODRIGUEZ MORA ISAAC', 'PTO. JIMENEZ Bª BONITO   DE AGUJAS', 'ENTRADA POR LA ESCUELA', '', ''),
(4038, 'Cedula Fisica', 900270338, 'RODRIGUEZ MORA JUAN MANUEL', 'PUNTA ZANCUDO    BAR REST SUSY', '<P> 20 C/M', '', ''),
(4039, 'Cedula Fisica', 900270338, 'RODRIGUEZ MORA JUAN MANUEL', 'PUNTA ZANCUDO    BAR REST SUSY', '<P> 20 C/M', '', ''),
(4040, 'Cedula Fisica', 900270338, 'RODRIGUEZ MORA JUAN MANUEL', 'ZANCUDO RESTAURANTE SUSY', '<P> 15 C/M', '776', ''),
(4041, 'Cedula Fisica', 900270338, 'RODRIGUEZ MORA JUAN MANUEL', 'PUNTA ZANCUDO    BAR REST SUSY', '<P> 20 C/M', '', ''),
(4042, 'Cedula Fisica', 900270338, 'RODRIGUEZ MORA JUAN MANUEL', 'RIO INCENDIO 50MTS DE LA ESCUELA', '', '', ''),
(4043, 'Cedula Fisica', 201630788, 'RODRIGUEZ MORERA BELISARIO', 'P Jiménez  La Palma  Urb Cerritos cs', '24. Cel 8578-9290.', '8766-1107', ''),
(4044, 'Cedula Fisica', 105110436, 'RODRIGUEZ MOYA OSCAR', 'La Cuesta 500 mts al este de escue-', 'la la Bota p.30 c/m', '732', ''),
(4045, 'Cedula Fisica', 105110436, 'RODRIGUEZ MOYA OSCAR', 'La Cuesta 500 mts al este de escue-', 'la la Bota p.30 c/m', '', ''),
(4046, 'Cedula Fisica', 602120046, 'RODRIGUEZ NOEL RICARDO MARTIN', 'Canoas   400 M Oest y 400 Sur y 50', 'Oeste del gusano barrenador', '8799-0712', ''),
(4047, 'Cedula Fisica', 501431036, 'RODRIGUEZ NOGUERA MARIA OLGA', '', '', '', ''),
(4048, 'Cedula Fisica', 600430036, 'RODRIGUEZ NOGUERA MARIA OLGA', 'GOLFITO   Bº SAN MARTIN CASA 26', 'DEL TEL 50 MTS', '', ''),
(4049, 'Cedula Fisica', 900830273, 'RODRIGUEZ NUÑES MARGARITA', 'jalaca de la escuela 800 al sur', 'en telefono publico', '7750922', ''),
(4050, 'Cedula Fisica', 601070626, 'RODRIGUEZ NUÑEZ MARIA LIDIA', 'Jiménez   de entrada Bambú 1.5 km.', 'Casa de madera con jardin afuera.', '2735-5753', ''),
(4051, 'Cedula Fisica', 601180493, 'RODRIGUEZ PEREZ ISABEL', 'La Cuesta   Cañaza 1 km al Oeste del', 'Correo.', '*-*-*-*', ''),
(4052, 'Cedula Fisica', 500660463, 'RODRIGUEZ PEREZ SOCORRO', 'CARRETERA A CUERVIO DE LA DELEGACIO', 'N 700MTS ESTE CARRETERA CUERVITO', '2732-1321', ''),
(4053, 'Cedula Fisica', 701180130, 'RODRIGUEZ PEREZ YORLENY', 'Urb. Villas del Sur   casa Nº 38.', '', '8666-4055', ''),
(4054, 'Cedula Fisica', 602990859, 'RODRIGUEZ PORRAS EDIET MARIA', 'Golfito   La Mona   C Herrera   cs G27', 'Cobrar Local 1 Dep Libre. 2775-612', '2775-0601', ''),
(4055, 'Cedula Fisica', 601450244, 'RODRIGUEZ PORRAS ELIZABETH', 'GOLF PUEBLO CIVIL DETRAS IGLE CATOL', 'ALCALDIA Bº ALAM <P> 03 C/M', '', ''),
(4056, 'Cedula Fisica', 601450244, 'RODRIGUEZ PORRAS ELIZABETH', 'GOLF PUEBLO CIVIL DETRAS IGLE CATOL', 'ALCALDIA * FECHA DE PAGO 2 C/MES**', '7750486', ''),
(4057, 'Cedula Fisica', 601450244, 'RODRIGUEZ PORRAS ELIZABETH', 'GOLFITO EL CIVIL COBRAR EN EL', 'JUSGADO. **CANCELA 2 CADA MES ***', '', ''),
(4058, 'Cedula Fisica', 501560222, 'RODRIGUEZ PORRAS MARIA LUISA', 'LAS PANGAS DE DE LA ENTRADA 400 MTS', 'CASA A MANO IZQUIERDA', '', ''),
(4059, 'Cedula Fisica', 501560222, 'RODRIGUEZ PORRAS MARIA LUISA', 'LAS PANGAS DE DE LA ENTRADA 400 MTS', 'CASA A MANO IZQUIERDA', '', ''),
(4060, 'Cedula Fisica', 600951241, 'RODRIGUEZ RODRIGUEZ ADELA', 'CIUDAD NEILLY CIUD.GONZALEZ 100mts', 'NORTE  100mts SUR PULP.EL JARDIN', '', ''),
(4061, 'Cedula Fisica', 600951241, 'RODRIGUEZ RODRIGUEZ ADELA', 'C Neily  C González  contiguo Iglesia', 'Evangélica. Cel 8819-8735.', '2783-5969', ''),
(4062, 'Cedula Fisica', 500950823, 'RODRIGUEZ RODRIGUEZ ADINA', '', '', '', ''),
(4063, 'Cedula Fisica', 509500823, 'RODRIGUEZ RODRIGUEZ ADINA', 'La Cuesta   Cuervito   fte antiguo Co', 'mando Sur   local esquinero.', '2732-2937', ''),
(4064, 'Cedula Fisica', 601710976, 'RODRIGUEZ RODRIGUEZ ANTONIA JOSEFA', 'RIO CLARO  ', 'CASA C. CELESTE C. BLANCO.', '', ''),
(4065, 'Cedula Fisica', 601710976, 'RODRIGUEZ RODRIGUEZ ANTONIA JOSEFA', 'EN GUABO DETRAS DE FERRETERIA PACHI', 'CHA CASA AZUL CON ROJO', '7898505', ''),
(4066, 'Cedula Fisica', 500490621, 'RODRIGUEZ RODRIGUEZ ARGEO', 'Sierpe 75mts norte de cabinas', 'sereno', '8663-3604', ''),
(4067, 'Cedula Fisica', 600460632, 'RODRIGUEZ RODRIGUEZ AUGUSTO', 'PUERTO JIMENEZ RIO TIGRE 60 MTS AL', 'OESTE DE LA ESCUELA', '', ''),
(4068, 'Cedula Fisica', 600460632, 'RODRIGUEZ RODRIGUEZ AUGUSTO', 'PUERTO JIMENEZ RIO TIGRE 60 MTS AL', 'OESTE DE LA ESCUELA', '', ''),
(4069, 'Cedula Fisica', 600460632, 'RODRIGUEZ RODRIGUEZ AUGUSTO', 'PTO JIMENEZ URB   EL COLEGIO  EN', 'CASA DE SELINA. CANCELA 11 C/MES*', '', ''),
(4070, 'Cedula Fisica', 600460632, 'RODRIGUEZ RODRIGUEZ AUGUSTO', 'P jiménez  El Tigre   250 sur Escuela', '', '', ''),
(4071, 'Cedula Fisica', 600500510, 'RODRIGUEZ RODRIGUEZ JESUS', 'P. Canoas   Vera Cruz  cs 70 amarilla', 'diag. Abast. Vera Cruz.', '', ''),
(4072, 'Cedula Fisica', 600940131, 'RODRIGUEZ RODRIGUEZ JOSE A.', 'PASO CANOAS DEPTO.DE TRANSITO', '', '117', ''),
(4073, 'Cedula Fisica', 601580925, 'RODRIGUEZ RODRIGUEZ Mª TEODORA', 'Naranjo calle a Tamarindo 500 norte', 'de la Guardia M/D. 8741-1194', '8580-7279', ''),
(4074, 'Cedula Fisica', 500320598, 'RODRIGUEZ RODRIGUEZ MARCIAL', 'CIUDAD NEILY   Bº EL PROGRESO DE LA', 'PULPERIA RAMON MASIS 150 AL OESTE', '7833606', ''),
(4075, 'Cedula Fisica', 500320598, 'RODRIGUEZ RODRIGUEZ MARCIAL', 'CIUDAD NEILY B. EL PROGRESO DE', 'PULP. RAMON MASIS 150 ESTE', '7833606', ''),
(4076, 'Cedula Fisica', 500320598, 'RODRIGUEZ RODRIGUEZ MARCIAL', 'CIUDAD NEILY Bº EL PORGRESO', '', '7833606', ''),
(4077, 'Cedula Fisica', 600870087, 'RODRIGUEZ RODRIGUEZ MARIA NIDIA', '', '', '', ''),
(4078, 'Cedula Fisica', 601580925, 'RODRIGUEZ RODRIGUEZ MARIA TEODORA', 'tamarindo cuadrante casa del fondo', '15 de cada mes cobro', '', ''),
(4079, 'Cedula Fisica', 600420833, 'RODRIGUEZ SANCHEZ AURELIO', 'PUERTO JIMENEZ   150 METROS OESTE DE', 'LA IGLESIA CATOLICA', '7355050', ''),
(4080, 'Cedula Fisica', 159181203, 'RODRIGUEZ SENCION MARIA DE LOS ANGE', 'SAN J DE LA ESCUELA 300MTS AL', 'ASENTAMIENTO JIRETH CASA PARA PAIS', '8558-7882', ''),
(4081, 'Cedula Fisica', 601560846, 'RODRIGUEZ SERRANO ROXANA', 'CIUDAD NEILY   SECTOR I.C.E.', '', '', ''),
(4082, 'Cedula Fisica', 601560846, 'RODRIGUEZ SERRANO ROXANA', 'CIUDAD NEILY   SECTOR I.C.E.', 'DE LAS PLANTAS I.C.E. 100N 25 OESTE', '7833039', ''),
(4083, 'Cedula Fisica', 500630903, 'RODRIGUEZ SIBAJA ZOILA ARGENTINA', 'PTO. JIMENEZ URBANIZACION S. LAZARO', 'CASA VERDE', '', ''),
(4084, 'Cedula Fisica', 500630903, 'RODRIGUEZ SIBAJA ZOILA ARGENTINA', 'P Jiménez  Urb S Lazaro  cs verde.', '', '2735-5650', ''),
(4085, 'Cedula Fisica', 205730100, 'RODRIGUEZ VILLALOBOS CINDY', 'Golfito  en COSECHAS frente super', 'comercio costarrisence 8605-3916', '8441-8654', ''),
(4086, 'Cedula Fisica', 600760051, 'RODRIGUEZ VILLALOBOS SERGIO', 'SANTA LUCIA DE LAUREL 100 MTS', 'DE IGLECIA A.D. * PALMERO *', '', ''),
(4087, 'Cedula Fisica', 103670983, 'ROJAS ACUÑA ALCIDEZ', 'Cortes   Ojo de Agua   400 m sur del', 'EBAIS.', '8788-7091', ''),
(4088, 'Cedula Fisica', 600730545, 'ROJAS ACUÑA GERARDINA', 'Pto JIMENEZ   PUERTO ESCONDIDO 150 M', 'DE ABASTC CARLOS ALBERTO CALLE JIME', '', ''),
(4089, 'Cedula Fisica', 600730445, 'ROJAS ACUÑA GERARDINA', 'Pto JIMENEZ   PUERTO ESCONDIDO 150 M', 'DE ABASTC CARLOS ALBERTO CALLE JIME', '', ''),
(4090, 'Cedula Fisica', 103030445, 'ROJAS AGUILAR HERNAN', 'CONTROL DE LA CUESTA 50 MTS DIAGONA', 'A IGLESIA ASAMBLEAS DE DIOS.', '7321186', ''),
(4091, 'Cedula Fisica', 601390270, 'ROJAS AGUILAR JOSE FRANCISCO', 'La Cuesta; Soda Cascante   frente', 'al parque.', '', ''),
(4092, 'Cedula Fisica', 601390270, 'ROJAS AGUILAR JOSE FRANCISCO.', 'LA CUESTA  DETRAS DE IGLESIA CATOLIC', 'VIVE EN SAN JOSE.', '2840895', ''),
(4093, 'Cedula Fisica', 601390270, 'ROJAS AGUILAR JOSE FRANCISCO.', 'La Cuesta   Control   1º Ent de la Bo', 'ta   50m Asambleas de Dios.', '8964-7773', ''),
(4094, 'Cedula Fisica', 600760234, 'ROJAS AGUILAR NEILLY', 'kilometro 24 de la vaca entrada a', 'la Campiña casa antes del puente', '', ''),
(4095, 'Cedula Fisica', 600760234, 'ROJAS AGUILAR NEILLY', 'km 24 del cruce 2 casas calle al 25', '', '8866-3262', ''),
(4096, 'Cedula Fisica', 600760234, 'ROJAS AGUILAR NIELY', 'la campiña 24 de la vaca esntrada a', 'la campiña casa antes del puente', '', ''),
(4097, 'Cedula Fisica', 600760234, 'ROJAS AGUILAR ROSA NELY', 'Km 24 del cruce 2 casas calle al 25', '', '8866-3262', ''),
(4098, 'Cedula Fisica', 600079082, 'ROJAS ALFARO REGINA', 'BAHIA BALLENA 50NORTE ESCUELA FLOR', 'DE BAHIA 8890/5186', '2743-8524', ''),
(4099, 'Cedula Fisica', 600940854, 'ROJAS ALVARADO NELSON', 'LA PALMA DE Pto JIMENEZ 200 NORTE Y', '500 OESTE DE ASOPROSA <P> 11 C/M', '', ''),
(4100, 'Cedula Fisica', 600750636, 'ROJAS ARGUEDAS CARLOS', 'RIO CLARO SAN RAMON 300 MTS E DE', 'TROPIGAS  * FECHA DE PAGO 16 C/MES*', '7897185', ''),
(4101, 'Cedula Fisica', 600590286, 'ROJAS ARGUELLO PEGGY', 'P Norte   150m este colegio   cont a', 'Fadasa.', '2786-6959', ''),
(4102, 'Cedula Fisica', 110510031, 'ROJAS ATENCIO DIDIER', 'R Claro   Bambel 1   Granja Campesina', 'contg. pulp. Bambel 1.', '8803-3169', ''),
(4103, 'Cedula Fisica', 500840162, 'ROJAS BARBOZA PORFIRIO', 'GOLF IMAS 2dª ETAPA FRET HOTEL', 'MIRAMAR CASA 14 <P> 03 Y 16 C/M', '7751565', ''),
(4104, 'Cedula Fisica', 600360463, 'ROJAS BARRANTES ARTURO', 'LA VIRGEN DE SABALO  ABASTECEDOR LOS', 'ALMENDROS P. 20 C/M', '', ''),
(4105, 'Cedula Fisica', 602460343, 'ROJAS BARRANTES ROSIBEL', 'SAN VITO Bo CANADA   RESD LOS PINARE', 'S CASA COLOR TERRACOTA', '8942-6601', ''),
(4106, 'Cedula Fisica', 603130766, 'ROJAS BERMUDEZ ROSMERI', 'esperanza de pavones.500mts sur de', 'la escuela del manzano', '8659-9724', ''),
(4107, 'Cedula Fisica', 602350154, 'ROJAS CAMPOS LUIS ENRIQUE', 'C Neily  Bº Unión  Imprenta Scorpio.', '', '2783-3038', ''),
(4108, 'Cedula Fisica', 600560355, 'ROJAS CASCANTE BENIGNO', 'KM 27 NORTE DE ESCUELA VIVE EN P.', 'CANOAS.', '7800134', ''),
(4109, 'Cedula Fisica', 600930083, 'ROJAS CASCANTE ELIECER', 'Cariari de Laurel   cruce 4 bocas.', '', '8807-2056', ''),
(4110, 'Cedula Fisica', 601310058, 'ROJAS CASCANTE RODRIGO', 'Km 25 de Laurel   25m Iglesia Adven-', 'tista.', '8622-3639', ''),
(4111, 'Cedula Fisica', 900340597, 'ROJAS CENTENO NOE TRINIDAD', 'Naranjo de la Esc  50 Mts Sur Cs', 'cemento blanca    2780-0154', '8785-6090', ''),
(4112, 'Cedula Fisica', 600630650, 'ROJAS ELIZONDO GERMAN', 'LA VIQUILLA 3 ENTRADA CONTG A LA', 'ESCUELA DOBLA A M.IZQ 400 MTS', '', ''),
(4113, 'Cedula Fisica', 600360051, 'ROJAS ELIZONDO HUMBERTO', 'PUEBLO NUEVO DE ANGA  CABINAS MANGLA', 'RES 195 NORTE 2DA CASA DESPUES PLAY', '9421261', ''),
(4114, 'Cedula Fisica', 601020310, 'ROJAS ELIZONDO LAUDENCIO', 'VIQUILLA 3 ENTRADA CONTIGUO A LA', 'ESCUELA DOBAL A LA IZQUIERDA 400 MT', '', ''),
(4115, 'Cedula Fisica', 602400672, 'ROJAS ESQUIVEL LUIS FRANCISCO', 'R CLARO FRENT ENTRADA LAS VIQUILLAS', 'DE ARROCERA 200 NORTE <P> 16 C/M', '', ''),
(4116, 'Cedula Fisica', 601460001, 'ROJAS FALLAS GLENDA', 'GOLFITO EL CIVIL FTE.ALA PLAZA', 'DIAGONAL A LA ESCUELA..', '7750912', ''),
(4117, 'Cedula Fisica', 600410852, 'ROJAS GOMEZ SOCORRO', 'Piedras Blancas 100 mts sur de la', 'calera', '', ''),
(4118, 'Cedula Fisica', 600410852, 'ROJAS GOMEZ SOCORRO', 'Piedras Blancas 100 mts sur de la', 'calera', '', ''),
(4119, 'Cedula Fisica', 600580252, 'ROJAS GONZALEZ Mª DEL CARMEN', 'PIEDRAS BLANCAS FRENTE A OFICINAS', 'DEL IDA <P> 19 C/M', '', ''),
(4120, 'Cedula Fisica', 600580252, 'ROJAS GONZALEZ Mª DEL CARMEN', 'PIEDRAS BLANCAS FRENTE A OFICINAS', 'DEL IDA <P> 19 C/M', '', ''),
(4121, 'Cedula Fisica', 600580252, 'ROJAS GONZALEZ Mª DEL CARMEN', 'PIEDRAS BLANCAS FRENTE A OFICINAS', 'DEL IDA <P> 19 C/M', '', ''),
(4122, 'Cedula Fisica', 600580252, 'ROJAS GONZALEZ MARIA DEL CARMEN', 'Piedras Blancas   frente a oficinas', 'del Ida.', '', ''),
(4123, 'Cedula Fisica', 600580252, 'ROJAS GONZALEZ MARIA DEL CARMEN', 'PIEDRAS BLANCAS   COSTADO DE LAS', 'OFICINAS DEL I.D.A.', '7411028', ''),
(4124, 'Cedula Fisica', 202360319, 'ROJAS JIMENEZ RAFAEL', 'Golfito   Km 1 3ra fila casa 44-76', '8401-6707', '8731-7866', ''),
(4125, 'Cedula Fisica', 202360319, 'ROJAS JIMENEZ RAFAEL.', 'GOLFITO   DEPOSITO LIBRE GUARDA', 'O KM 1 C. 4476 PAGA  28 Y 13 O 16', '750384', ''),
(4126, 'Cedula Fisica', 202360319, 'ROJAS JIMENEZ RAFAEL.', 'GOLFITO   DEPOSITO LIBRE GUARDA', 'O KM 1 C. 4476 PAGA  28 Y 13 O 16', '750384', ''),
(4127, 'Cedula Fisica', 501520253, 'ROJAS LACAYO DIONY.', 'CANOAS URBA POR ENTRADA POR BAR', 'AGUACERO CASA DE MOYA (MOYITA).', '', ''),
(4128, 'Cedula Fisica', 600810922, 'ROJAS LARA VILMA', 'Fca ALAJUELA 200 Mts OESTE DE ESC', 'NATIVIDAD <P> 19 C/M', '', ''),
(4129, 'Cedula Fisica', 600810922, 'ROJAS LARA VILMA', 'FCA   ALAJUELA 200M. O. DE ESCULELA', 'NATIVIDAD', '', ''),
(4130, 'Cedula Fisica', 602090396, 'ROJAS LEDEZMA ISABEL', 'Rio Claro   la Esperanza   100 N. de', 'la Escuela   cobrar en el Colono.', '7897455', ''),
(4131, 'Cedula Fisica', 601530560, 'ROJAS MARTINEZ EDGAR', 'Control la Cuesta 200mts al oeste', 'de la Asamblea de Dios.', '', ''),
(4132, 'Cedula Fisica', 601100713, 'ROJAS MASIS ELIZABETH', 'Barrio Alemania Costado arbol higue', 'ron casa papaya donde NANA.', '2783-6655', ''),
(4133, 'Cedula Fisica', 603550929, 'ROJAS MEJIAS YADITA', 'UVITA CENTRO PIZZERIA FOGATA', '', '8916-6353', ''),
(4134, 'Cedula Fisica', 602620029, 'ROJAS MENDOZA ROXANA', 'R Claro   Bambel 2 Escuela', '300 mts este.', '8283507', ''),
(4135, 'Cedula Fisica', 600830532, 'ROJAS MONTES ROBERTO.', 'NO SE REGISTRO.', '', '', ''),
(4136, 'Cedula Fisica', 600830532, 'ROJAS MONTES ROBERTO.', 'NO SE REGISTRO.', '', '', ''),
(4137, 'Cedula Fisica', 601880465, 'ROJAS MORA GERARDO', '', '', '3935561', ''),
(4138, 'Cedula Fisica', 601060097, 'ROJAS MORALES NELLY', '', '', '', ''),
(4139, 'Cedula Fisica', 602140657, 'ROJAS MUÑOZ OLGER', 'Pérez Zeledón. Cel 8707-6129.', 'Paga mediante el Banco Nacional.', '2772-2636', ''),
(4140, 'Cedula Fisica', 702050176, 'ROJAS OLMOS BEATRIZ', 'BAMBEL *3 RIO CLARO DEL RANCHITO', '800 NORTE 50 OESTE', '8959-7025', ''),
(4141, 'Cedula Fisica', 602350420, 'ROJAS ORTEGA MARIBEL', 'CONTROL DE LAUREL 1era ENTRADA A LA', 'BOTA 80 OESTE DE LA IGLESIA 15 C/ME', '7321792', ''),
(4142, 'Cedula Fisica', 102300105, 'ROJAS PADILLA LEONEL', 'GOLF Bº RICARDO PASO CONTG', 'PULP NARALIT <P> 16 C/M', '', ''),
(4143, 'Cedula Fisica', 900390262, 'ROJAS QUESADA AMADA', 'SIERPE X HOTEL MARGARITA ?x', 'OLGA LA COSTURERA  21 C/MES', '7881206', ''),
(4144, 'Cedula Fisica', 101910898, 'ROJAS QUIROS ISIDRO', 'LA FORTUNA DE PAVONES   O CONTE 3 KM', 'HACIA DENTRO DE LA ESCUELA C.VERDE', '', ''),
(4145, 'Cedula Fisica', 101910898, 'ROJAS QUIROS ISIDRO', 'LA FORTUNA DE PAVONES', '', '7801468', ''),
(4146, 'Cedula Fisica', 104750253, 'ROJAS RODRIGUEZ JOSE', 'LA CUESTA FRENTE A LA PLAZA', '<P> 30 C/M', '', ''),
(4147, 'Cedula Fisica', 600981380, 'ROJAS ROJAS DAMIANA', 'BARRIO UREÑA DETRAS DE LA SODA LAS', 'PALMERAS CASA·11A', '2775-1436', ''),
(4148, 'Cedula Fisica', 900600667, 'ROJAS ROJAS RAMON.', 'PALMAR NORTE Bº ALEMANIA CONTIGUO A', 'PULPERIA LA AMISTAD.', '786', ''),
(4149, 'Cedula Fisica', 101443078, 'ROJAS SALAS MANUEL', 'R Claro   Bambel 1   Iglesia Evangali', 'ca 50 sur.', '', ''),
(4150, 'Cedula Fisica', 601021135, 'ROJAS SALAZAR CALIXTO', 'LA FORTUNA DE CONTE ENTRADA FRENTE', 'A TEMPLO CATOLICO', '', ''),
(4151, 'Cedula Fisica', 601021135, 'ROJAS SALAZAR CALIXTO', 'La fortuna d pavones 500 O de igles', 'catolica Cs Madera Rosada  ', '2780-1596', ''),
(4152, 'Cedula Fisica', 600980996, 'ROJAS SALAZAR JORGE', 'LA FORTUNA DE PAVONES DE LA ENTRADA', '3 KMT CONTG A LA ESCUELA C. DE MADE', '', ''),
(4153, 'Cedula Fisica', 600980996, 'ROJAS SALAZAR JORGE', 'LA FORTUNA DE CONTE .', '** FECHA DE PAGO 13 CADA MES**', '', ''),
(4154, 'Cedula Fisica', 600980996, 'ROJAS SALAZAR JORGE', 'La Fortuna de pavones 100 mts N de', 'Esc Cs madera Celeste  ', '2780-1375', ''),
(4155, 'Cedula Fisica', 601830220, 'ROJAS SANDI ELIECER', 'LOS CASTAÑOS A UN COSTADO DE LAIGLE', 'SIA CASA DE MADERA COLOR CELESTE', '8823-4587', ''),
(4156, 'Cedula Fisica', 602840476, 'ROJAS SANDI GERARDO', 'GOLFITO LA UREÑA CASA Nº I-19', '* CANCELA 3 CADA MES *', '', ''),
(4157, 'Cedula Fisica', 602840476, 'ROJAS SANDI GERARDO', 'Res. Ureña 1º Casa I-21. R.Claro de', 'tras sub-estacion ice lote 39', '3309519', ''),
(4158, 'Cedula Fisica', 201280106, 'ROJAS SEGURA RAUL', 'pto. jimenez el bambu tercera', 'casa', '', ''),
(4159, 'Cedula Fisica', 201800931, 'ROJAS SIBAJA RAFAEL', 'RIO CLARO SAN RAMON DEL CORRAL', '500 METROS DESPUES', '', ''),
(4160, 'Cedula Fisica', 503020615, 'ROJAS SOLORZANO EFRAIN', 'DETRAS DE LA ESCUELA DE COPA BUENA', 'CASA *13', '8783-8231', ''),
(4161, 'Cedula Fisica', 600380440, 'ROJAS SOTO RAMON BENITO', 'GOLFITO KM2 / LOCAL 29 /', 'PREGUNTAR X MELISA ...DEPOSITO', '888956-', ''),
(4162, 'Cedula Fisica', 101920673, 'ROJAS TORRES FERNANDO', 'LA MONA DETRAS DEL ESTADIO CASA CON', 'MALLA * FECHA DE PAGO 02 C/MES *', '7750326', ''),
(4163, 'Cedula Fisica', 601050636, 'ROJAS VALVERDE EDITH', '', '', '', ''),
(4164, 'Cedula Fisica', 600850020, 'ROJAS VARGAS GUILLERMO', 'CONTE', '', '', ''),
(4165, 'Cedula Fisica', 600850020, 'ROJAS VARGAS GUILLERMO.', 'CARTAGO', '', '', ''),
(4166, 'Cedula Fisica', 600270643, 'ROJAS VARGAS LUISA', 'Kmt 14 DE BAR EL RODEO 200 Mt CALLE', 'A GOLFITO <P> 03 Y 16 C/M', '', ''),
(4167, 'Cedula Fisica', 600920072, 'ROJAS VILLAFUERTE PEDRO', 'C Neily   Bº Las brisas   300 oeste', 'antenas Radio Cultural.', '8842-7534', ''),
(4168, 'Cedula Fisica', 600590841, 'ROJAS VILLANEVA JUAN AGUSTIN', 'Chacarita calle jimenez 700 mts de', 'la bomba.', '-', ''),
(4169, 'Cedula Fisica', 101840374, 'ROMAN BADILLA CORONADO', 'LA CUESTA 275 MTS OESTE CALLE AL', 'CEMENTERIO X PULP EL CINCO MENOS', '7322096', ''),
(4170, 'Cedula Fisica', 101840374, 'ROMAN BADILLA CORONADO', 'La Cuesta  calle Cementerio Bar Isla', 'Verde.', '', ''),
(4171, 'Cedula Fisica', 202020115, 'ROMAN MAYORGA ROSIBEL', 'GOLFITO INVU KM 3 CASA # 69 FTE TES', 'TIGOS DE JEHOVA', '8771895', ''),
(4172, 'Cedula Fisica', 603630353, 'ROMAN MEZA REBECA', 'C Cortés   Ciud. Renacimiento.', '', '8760-6594', ''),
(4173, 'Cedula Fisica', 601790552, 'ROMAN RODRIGUEZ NANCY', 'GOLFITO   KILOMETRO 3 FRENTE A SODA', 'MAGGI o MINISTERIO DE SALUD', '7750048', ''),
(4174, 'Cedula Fisica', 409991153, 'ROMAN SAAVEDRA GUSTAVINO', 'LA CUESTA   200 MTS ANTES DE LLEGAR', 'A LA PLAZA PULPERIA SAN JOSE', '7322753', ''),
(4175, 'Cedula Fisica', 601920238, 'ROMAN SALAZAR CESAR GEOVANNY', 'La Cuesta   275 Suroeste del Comando', 'Calle al Cementerio.', '7322418', ''),
(4176, 'Cedula Fisica', 201430746, 'ROMAN SALAZAR JOSE MARIA', 'LA VIRGEN DE SABALO TELEFONO', 'PUBLICO <P> 13 C/M', '7833470', ''),
(4177, 'Cedula Fisica', 602320483, 'ROMERO LOPEZ MINOR', 'GOLF Kmt 3 Bº DE LA PLAYA C DE', 'DOÑA JEANNETHE <P> 16 C/M', '7751073', ''),
(4178, 'Cedula Fisica', 602320483, 'ROMERO LOPEZ MINOR', 'Golfito   La Mona   Daniel Herrera  ', 'cs G10. Cel 8812-1362.', '2775-2239', ''),
(4179, 'Cedula Fisica', 602320483, 'ROMERO LOPEZ MINOR', 'Golfito  La Mona  Urb Daniel Herrera', 'Servicio Express.', '8812-1362', ''),
(4180, 'Cedula Fisica', 109490485, 'ROMERO ORTIZ PATRICIA', 'C.Cortés   Punta Mala 400m O Escuela', 'Cel 8514-3604.', '8322-7462', ''),
(4181, 'Cedula Fisica', 600320846, 'ROSALES AGUIRRE GERONIMO', 'C N   Bº EL CARMEN DE LA PLANTA DEL', 'ICE 100 N Y 100 POR TALLER MECANICO', '', ''),
(4182, 'Cedula Fisica', 600540269, 'ROSALES ALVAREZ JUANA.', 'RIO CLARO FRENTE AL PARQUE INFANTIL', '', '7899470', ''),
(4183, 'Cedula Fisica', 900660128, 'ROSALES ANCHIA DAISY', 'Urbanización Jeanett Pacheco   lote', '46   200 mts entrada nuevo local', '8662029', ''),
(4184, 'Cedula Fisica', 601250471, 'ROSALES ANCHIA FLOR', 'Cortes   Bº Canadá fte Minisuper El', 'Sol Cs Esquinera.', '2788-8652', ''),
(4185, 'Cedula Fisica', 601250471, 'ROSALES ANCHIA FLOR', 'Cortés Bº Canada. fte Minisuper el', 'Sol cs esquinera.', '2788-8652', ''),
(4186, 'Cedula Fisica', 601700927, 'ROSALES CAMPOS CARMEN', 'RIO CLARO SAN RAMON COSTADO NORTE', 'OFIC. DEL I.D.A. *CANCELA 1 C/MES*', '7898724', ''),
(4187, 'Cedula Fisica', 601700927, 'ROSALES CAMPOS CARMEN MARIA', 'SAN RAMON DE RIO CLARO   AL COSTADO', 'SUROESTE OFICINAS IDA   CASA AMARILL', '7898724', ''),
(4188, 'Cedula Fisica', 602120267, 'ROSALES CARBALLO DAMARIS', 'Bambel 1   Granja campesina contiguo', 'a pulperia la esquina.', '8602-7135', ''),
(4189, 'Cedula Fisica', 601370019, 'ROSALES CARBALLO EDGAR.', 'FINCA Nº50  A UN COSTADO DE LA PLAZA', '', '', ''),
(4190, 'Cedula Fisica', 602510637, 'ROSALES ESPINOZA YADIRA', 'Laurel   Jobo   calle a Laurel. Abast', 'Keysi. Cel 8829-3778.', '8804-0073', ''),
(4191, 'Cedula Fisica', 600930428, 'ROSALES GOMEZ MARCIANA', 'GOLFITO   CIUDADELA UREÑA DETRAS', 'DE LA ESCUELA COBRO EN SODA MARCIA', '7751216', ''),
(4192, 'Cedula Fisica', 601430356, 'ROSALES GOMEZ MARIA GERARDA', 'CORTES   UVITA ENTRADA FRENTE A LA', 'BOMBA.', '7438114', ''),
(4193, 'Cedula Fisica', 601200696, 'ROSALES GONZALEZ RAFAEL', 'CIUDAD NEILY; Bº SALAS VINDAS DE', 'PULP. LA GUARIA 300 O. TRABJ INS', '', ''),
(4194, 'Cedula Fisica', 602320511, 'ROSALES MADRIGAL MARIA', 'COTO 58 Nº 11356 DE CENTRO DE SALUD', 'AL FONDO FECHA DE PAGO 30 CADA MES', '7811618', ''),
(4195, 'Cedula Fisica', 602320511, 'ROSALES MADRIGAL MARIA', 'Coto 58 Nº 11356 Del EBAIS al fondo', 'Cel 8757-3058.', '2781-1618', ''),
(4196, 'Cedula Fisica', 602390059, 'ROSALES MORERA LUPITA', 'CORTEZ OJO DE AGUA JHANNET', 'PACHECO', '8771-3175', ''),
(4197, 'Cedula Fisica', 601060499, 'ROSALES RAMIREZ GERARDO', '', '', '', ''),
(4198, 'Cedula Fisica', 603170469, 'ROSALES RODRIGUEZ KEILA', 'P Canoas   El Triunfo   cs D9 concre-', 'to natural. Cel 8942-4809', '8960-1647', ''),
(4199, 'Cedula Fisica', 600450086, 'ROSALES ROSALES ALFREDO', 'OLLA CERO EN LA PULP COSTA RICA', 'DONDE ESTA EL TELEFONO', '7864010', ''),
(4200, 'Cedula Fisica', 600780803, 'ROSALES ROSALES ELIZABETH', 'Coto 49   diagonal al telf público.', 'casa 12456.', '2781-1564', ''),
(4201, 'Cedula Fisica', 601890229, 'ROSALES ROSALES MARISOL', 'GOLFITO Bº SAN ANDRES', 'Cel 8991-0989.', '2775-2579', ''),
(4202, 'Cedula Fisica', 601890229, 'ROSALES ROSALES MARISOL', 'Golfito   Bº S Andrés cs Nº8.', 'Cel 8991-0989.', '2775-2579', ''),
(4203, 'Cedula Fisica', 601660877, 'ROSALES ROSALES MARTHA LUZ', 'Golfito   Llno Bonito Carretera a', 'Cacao Cs Nº 11 Oasis de Esperanza  ', '8539-4561', ''),
(4204, 'Cedula Fisica', 601740111, 'ROSALES ROSALES MARVIN', 'CORTEZ RENACIMIENTO B* CASA C17', 'FTE A LA PLAZA 86086588', '8628-7594', ''),
(4205, 'Cedula Fisica', 601740111, 'ROSALES ROSALES MARVIN', 'Ciudad Cortes   Urb   Renacimiento Cs', '# C-17 Color Melon. 8528-7594', '8778-5668', ''),
(4206, 'Cedula Fisica', 600460376, 'ROSALES ROSALES OSVALDO', 'Sierpe de las cabinas sereno 75mts', 'al norte fte parqueo', '2788-1102', ''),
(4207, 'Cedula Fisica', 601980531, 'ROSALES RUIZ EDITH', 'BARRIO SAN JORGE DE LA IGLESIA', 'PUERTA DEL CIELO 100MTS SUR', '2732-3340', ''),
(4208, 'Cedula Fisica', 501190972, 'ROSALES RUIZ RAUL', 'RIO CLARO   COLONIA LA LUZ DEL MUNDO', '1 er CASA ENTRADO A M.IZQU C.CEMENT', '7899170', ''),
(4209, 'Cedula Fisica', 500780140, 'ROSALES VILLEGAS JOSE', 'LA GAMBA KM 37 DE LA COOPEGAMBA', '50 MTS HACIA DENTRO', '8623-4798', ''),
(4210, 'Cedula Fisica', 602980399, 'ROSE RUGAMA KANDY', 'PLAZA CANOAS FRENTE BAR AGUACEROS', '8854/9813', '2780-0002', ''),
(4211, 'Cedula Fisica', 601880649, 'ROSS VILLALOBOS BLANCA', 'LA CUESTA B*LA CASANA 700 MST AL ES', 'TE DEL COMANDO DE LA CUESTA ANT ARR', '2232-3259', ''),
(4212, 'Cedula Fisica', 601420521, 'RUEDA BEITA WILFRIDO', 'Bº EL CARMEN ABROJO 200 Mts DE IGLE', 'ASAMBLEAS DE DIOS   <P> OFICINA', '', ''),
(4213, 'Cedula Fisica', 602510761, 'RUEDA MONTERO FRANCISCO', '', '', '', ''),
(4214, 'Cedula Fisica', 602200698, 'RUGAMA CAMPOS EDER LERY', 'Ciudad Neily  cost E de mercado cobr', 'en Taqueria de mi TATA   2783-2103', '8619-9805', ''),
(4215, 'Cedula Fisica', 800420761, 'RUGAMA ESPINOZA ANA EMILIA', '', '', '', ''),
(4216, 'Cedula Fisica', 501470249, 'RUIZ ARAYA FERNANDO', 'BAMBITO   500 MTS ESTE DE PULP', 'DOÑA XENIA O EN LA BOMBA LAUREL', '', ''),
(4217, 'Cedula Fisica', 501470249, 'RUIZ ARAYA FERNANDO', 'Bambito 800 m Oeste pulp. Xenia.', 'Telf: 8783-1241.', '2780-1395', ''),
(4218, 'Cedula Fisica', 602350718, 'RUIZ BERMUDEZ MARIA ISABEL', 'JIMENEZ   URB S. LAZARO CS 25.', 'DETRAS DE MERCADO TIGRE', '7355230', ''),
(4219, 'Cedula Fisica', 500930389, 'RUIZ CAMPOS JOSE CLODOMIRO', 'FINCA GUANACASTE   250 MTS DEL', 'COMEDOR ESCOLAR M. IZQUIERDA', '', ''),
(4220, 'Cedula Fisica', 250000410, 'RUIZ CORTES ESMERALDA ANGELICA', 'GOLFITO   CIUDADELA MADRIGAL CALLE', 'AL GOLFO C. DE DOS PISOS X IGLESIA', '', ''),
(4221, 'Cedula Fisica', 502650684, 'RUIZ DUARTE ANABELLE', 'C Neily   Caracol Norte   fte Rastro.', '', '8778-1434', ''),
(4222, 'Cedula Fisica', 900610956, 'RUIZ FONSECA XINIA.', 'BARRIO LOS MEDICOS  100MTS SUR DEL H', 'OSPITAL 30/CM.', '7751001', ''),
(4223, 'Cedula Fisica', 601090844, 'RUIZ GOMEZ EMILCE', 'RIO CLARO 200 MTS DE LA ESCUELA', 'CENTRAL', '7899695', ''),
(4224, 'Cedula Fisica', 601090844, 'RUIZ GOMEZ EMILCE.', '200 MTS AL NORTE DE LA ESCUELA DE', 'RIO CLARO CTG AA O A VIGIL B-N-C.R', '789', ''),
(4225, 'Cedula Fisica', 501290257, 'RUIZ GUTIERREZ JUSTINA', 'RIO CLARO LA VIQUILLA Nº 2 X', '2DO PUENTE * 10 CADA MES *', '7898876', ''),
(4226, 'Cedula Fisica', 502310305, 'RUIZ HERRERA BENJAMIN', 'S.RAMON R.CLARO DE ESC.100 MTS S.', 'COSTAD E.C.COLOR AMARILLO.P.03 C/M', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(4227, 'Cedula Fisica', 601250745, 'RUIZ LOPEZ PAULINO', 'LAUREL 100 MTS AL OESTE DE PULPERIA', 'EL INVU.', '', ''),
(4228, 'Cedula Fisica', 600550251, 'RUIZ MOSQUERA JULIA', 'GOLFITO IMAS   SAN MARTIN SEG. ETAPA', 'CASA # 7  PAGA LOS 03 C/M.', '', ''),
(4229, 'Cedula Fisica', 600550251, 'RUIZ MOSQUERA JULIA', 'GOLFITO IMAS   SAN MARTIN SEG. ETAPA', 'CASA # 7  PAGA LOS 03 C/M.', '*-*-*-*', ''),
(4230, 'Cedula Fisica', 600550251, 'RUIZ MOSQUERA JULIA', 'GOLFITO IMAS   SAN MARTIN SEG. ETAPA', 'CASA # 7  PAGA LOS 03 C/M.', '', ''),
(4231, 'Cedula Fisica', 201800826, 'RUIZ PANIAGUA VICTOR JULIO', 'RIO CLARO KM 28 1ª CASA EN CUESTA', 'MANO DERECHA FECHA DE PAGO 17 C/MES', '3697926', ''),
(4232, 'Cedula Fisica', 601150072, 'RUIZ ROSALES NATIVIDAD', 'Golfito  Res Ureña  Cs M5.', '', '8514-4426', ''),
(4233, 'Cedula Fisica', 500820864, 'RUIZ RUIZ ABELARDO', 'RIO CLARO DE LA COCACOLA 150 N.', 'AL FONDO', '', ''),
(4234, 'Cedula Fisica', 601430165, 'RUIZ RUIZ CARLOS LUIS', 'Cortés  Bº Lourdes  100m este del CEN', 'cs verde. Cel', '8740-3130', ''),
(4235, 'Cedula Fisica', 600300425, 'RUIZ RUIZ EUSTAQUIO', 'LA MONA CIUDADELA MADRIGAL DE LA PA', 'RADA 100 NORTE Y 150 AL OESTE', '7755310', ''),
(4236, 'Cedula Fisica', 600910089, 'RUIZ RUIZ FLORENCIA', 'GOLFITO RESIDENCIAL UREÑA CASA F4', 'PAGA LOS 16 Y 03 DE C/M', '*-*-*-*', ''),
(4237, 'Cedula Fisica', 4, 'RUIZ RUIZ SANTOS', 'Golfito', '', '', ''),
(4238, 'Cedula Fisica', 603330872, 'RUIZ UMAÑA LAUREN', 'Laurel   contiguo Bar Aguila.', '', '8516-9738', ''),
(4239, 'Cedula Fisica', 117000396, 'RUIZ VILLA GLORIA', 'UVITA CENTRO FTE CANCHA SINTETICA', '', '2743-8363', ''),
(4240, 'Cedula Fisica', 106020246, 'RUIZ ZUÑIGA MARIO', 'GOLFITO   PURRUJA BAR EL ESCONDITE', '', '7751330', ''),
(4241, 'Cedula Fisica', 106020246, 'RUIZ ZUÑIGA MARIO', 'Golfito   La Mona   fte Bar la Rueda', 'cc celeste.', '2775-2518', ''),
(4242, 'Cedula Fisica', 602520672, 'SAAVEDRA SAMUDIO OLGA', 'P Jiménez  Ñeque  120 NO de Escuela', 'Cel 8820-8094.', '8688-2979', ''),
(4243, 'Cedula Fisica', 602700615, 'SABALLOS DIAZ MELANIA', 'GOLFITO KM 1 PRIMERA FILA CASA', 'Nº 4450 *FECHA DE PAGO 2 C/MES*', '8514085', ''),
(4244, 'Cedula Fisica', 500540272, 'SABALLOS NAVARRO MATEO', 'Golfito   Bo LLano Bonito', '', '', ''),
(4245, 'Cedula Fisica', 500540272, 'SABALLOS NAVARRO MATEO', 'GOLF Bº LLANO BONITO CASA', '# 4900 <P> 03 C/M', '*-*-*-*', ''),
(4246, 'Cedula Fisica', 202120976, 'SABORIO BARBOZA CARLOS', 'LAUREL   CENIZO COSTADO OESTE DE LA', 'PLAZA DE DEPORTES', '8545-9188', ''),
(4247, 'Cedula Fisica', 601250891, 'SAENS REYES MARIA DE LOS ANGELES', 'Golf. Hotel Nica 2º casa arriba', 'puerta hacia montaña.No cob en trab', '', ''),
(4248, 'Cedula Fisica', 800550843, 'SALABLANCA POLANCO PASTORA', 'Bº San Jorge; detrás de la Esc. CAS', 'Amarilla  Corredor Celest p.25 c/m', '', ''),
(4249, 'Cedula Fisica', 800550843, 'SALABLANCA POLANCO PASTORA', 'Bº San Jorge; detrás de la Esc. CAS', 'Amarilla  Corredor Celest p.25 c/m', '', ''),
(4250, 'Cedula Fisica', 800550843, 'SALABLANCA POLANCO PASTORA', 'SAN JORGE DE PASO CANOAS   DETRAS DE', 'LA ESCUELA.', '7322036', ''),
(4251, 'Cedula Fisica', 602370650, 'SALAMANCA ASTORGA XINIA PATRICIA', 'GOLFITO BARRIO BELLA VISTA 7ta FILA', 'CASA 8129', '7752058', ''),
(4252, 'Cedula Fisica', 201870315, 'SALAS AGUERO SONIA MARIA', 'BAMBITO DE LA ESCUELA 700 MTS', 'CASA A MANO IZQUIERDA 3 era CASA', '', ''),
(4253, 'Cedula Fisica', 201870315, 'SALAS AGUERO XENIA MARIA', 'bambito de la escuela 700 mts norte', 'en pulperia', '7890032', ''),
(4254, 'Cedula Fisica', 201870315, 'SALAS AGUERO XENIA MARIA', 'BAMBITO DE LA ESCUELA 700M NORTE EN', 'PULPERIA', '7800282', ''),
(4255, 'Cedula Fisica', 201870315, 'SALAS AGUERO XENIA MARIA', 'BAMBITO DE LA ESCUELA 700M NORTE EN', 'PULPERIA', '2780-0282', ''),
(4256, 'Cedula Fisica', 600750320, 'SALAS ALVARADO JOSE RAMON', '', '', '', ''),
(4257, 'Cedula Fisica', 400600982, 'SALAS ARAYA VICTOR', '', '', '', ''),
(4258, 'Cedula Fisica', 602180833, 'SALAS ESQUIVEL JESUS', 'FCA PUNTARENAS SURESTE DE LA PLAZA', 'DE DEPORTES <P> 19 C/M', '*-*-*-*', ''),
(4259, 'Cedula Fisica', 602180833, 'SALAS ESQUIVEL JESUS', 'finca puntarenas 150 mtsde la entra', 'da 1ra pulperia.', '3166168', ''),
(4260, 'Cedula Fisica', 603570396, 'SALAS GOMEZ ERICK', '100MTR SUR ESTE DEL COLEGIO DE JIME', 'NEZ.OFICINA O ADOMICILIO', '892132-', ''),
(4261, 'Cedula Fisica', 601200849, 'SALAS GONZALEZ ALEJANDRO', 'LOS CASTAÑOS ANTES DE LA ESCUELA CA', 'SA COLOR VERDE DE MEDERA', '2781-1015', ''),
(4262, 'Cedula Fisica', 600910092, 'SALAS GONZALEZ ANA ISABEL', 'LANGOSTINO DE PAVONES EN EL', 'TELEFONO ´PUBLICO', '7760080', ''),
(4263, 'Cedula Fisica', 502970871, 'SALAS GONZALEZ MARISELA', 'Bº el Progreso 150mts norte del', 'Abastecedor Las Vegas.', '7835125', ''),
(4264, 'Cedula Fisica', 104880852, 'SALAS MEZA JESSICA', 'ZANCUDO BAR RESTURANT ESTERO MAR', '', '7321135', ''),
(4265, 'Cedula Fisica', 601940337, 'SALAS MOSCOSO MARIA', 'PUNTA ZANCUDO FRENTE A LA IGLESIA', 'CATOLICA ULTIMA CASA', '', ''),
(4266, 'Cedula Fisica', 201770182, 'SALAS PEREZ ISIDORO', 'Bambito de Laurel 500 sur Pulp. El', 'cruce.', '2780-1307', ''),
(4267, 'Cedula Fisica', 601260444, 'SALAS QUESADA VICTOR HUGO', 'Coto 49   al fondo de la plaza.', 'telf: 2781-1303', '8849-3493', ''),
(4268, 'Cedula Fisica', 500940400, 'SALAS RAMIREZ ALICE', 'GOLFITO   KM 14 75 DE BAR EL RODEO', 'pensionada 04 de cada mes', '7756172', ''),
(4269, 'Cedula Fisica', 203260063, 'SALAS RODRIGUEZ ELIZABETH', 'LA CUESTA   CAÑAZA CASA Nº 36', '', '', ''),
(4270, 'Cedula Fisica', 203260063, 'SALAS RODRIGUEZ ELIZABETH', 'La Cuesta Cañaza ent a derecha', '1º puente.', '2732-3455', ''),
(4271, 'Cedula Fisica', 600480159, 'SALAS RODRIGUEZ EVANGELINA', 'SANDALO ENTRADA POR LA PULPERIA', 'VIEJA O VIEJO C.ESQUINERA C.BLANCA', '7355326', ''),
(4272, 'Cedula Fisica', 600480159, 'SALAS RODRIGUEZ EVANGELINA', 'SANDALO ENTRADA POR LA PULPERIA', 'VIEJA O VIEJO C.ESQUINERA C.BLANCA', '7355326', ''),
(4273, 'Cedula Fisica', 601110276, 'SALAS RODRIGUEZ ROSA', 'PUERTO JIMENEZ URBANIZACION', 'EL COLEGIO CASA 11-B', '7355629', ''),
(4274, 'Cedula Fisica', 102860114, 'SALAS SALAZAR EDGAR', 'PTO. JIMENEZ EL BAMBU 300MTS.', 'DE LA ENTRADA A LA DERECHA.', '', ''),
(4275, 'Cedula Fisica', 102860114, 'SALAS SALAZAR EDGAR', 'Bª EL BAMBU 300 DE LA PULPERIA LA', 'AMISTAD PTO. JIMENEZ', '7355323', ''),
(4276, 'Cedula Fisica', 401750662, 'SALAS SALAZAR OBED', 'Golfito  Km16 175m Noroeste Abast la', 'Flor.  ultima cs', '2775-0601', ''),
(4277, 'Cedula Fisica', 603860486, 'SALAS SANCHEZ MICHAEL', 'PTO JIMENEZ AGUJAS   500 M DEL PUENT', '', '', ''),
(4278, 'Cedula Fisica', 500980365, 'SALAS VENEGAS ELI', 'ANTES D`CONTROL CASA ANTES DONDE', 'LAVAN CARROS <P> 30 C/M', '-', ''),
(4279, 'Cedula Fisica', 500980365, 'SALAS VENEGAS ELI', 'La Cuesta   1km calle a Laurel x que', 'brada.', '8926-3906', ''),
(4280, 'Cedula Fisica', 601420863, 'SALAZAR ACOSTA MARTHA', 'CANOAS CONTG. U. LATINA ? EN SODA', 'DE LA U. * FECHA DE PAGO 08 C/MES *', '7322861', ''),
(4281, 'Cedula Fisica', 601420863, 'SALAZAR ACOSTA MARTHA', 'La Cuesta  Ciud Tamayo nueva 2º cs.', 'Cel 8345-4532.', '2732-2861', ''),
(4282, 'Cedula Fisica', 107280503, 'SALAZAR ALPIZAR ROBERTO', 'GOLFITO RESIDENCIAL UREÑA CASA 9-D', 'O FRENTE A LA PLAZA DE DEPORTES.', '7833972', ''),
(4283, 'Cedula Fisica', 603780097, 'SALAZAR ARIAS CRISTINA', 'Caimito a un Costado de la plaza en', 'pulp Caimito   2780-1086', '8596-5807', ''),
(4284, 'Cedula Fisica', 900810666, 'SALAZAR ARIAS SANDRA', 'CAIMITO DE LAUREL EN ABASTECEDOR', '* FECHA DE PAGO 15 CADA MES **', '7800537', ''),
(4285, 'Cedula Fisica', 600500728, 'SALAZAR AZOFEIFA RAFAEL', 'laurel jobo 200 mts de la escuela', '', '', ''),
(4286, 'Cedula Fisica', 603060942, 'SALAZAR BONILLA OSVALDO', 'Bº EL CARMEN DE ABROJO CASA N.97', 'CLIENTE CLASE A', '7836344', ''),
(4287, 'Cedula Fisica', 601070067, 'SALAZAR CASTILLO ODILI', 'Los Mogos calle a Jiménez   200 m an', 'tes Cabinas el Mirador', '868677', ''),
(4288, 'Cedula Fisica', 603320961, 'SALAZAR COREA JAIRO', 'Pavones   600 m hacia pilón   de la', 'Escuela Bahía de Pavones.', '8573-1432', ''),
(4289, 'Cedula Fisica', 103840049, 'SALAZAR FALLAS DANILO', 'P Canoas  C Triunfo  cs E2  Plaza ca-', 'noas.', '2732-1896', ''),
(4290, 'Cedula Fisica', 102960298, 'SALAZAR GAMBOA RAMIRO', 'LA ESPERANZA DE RIO CLARO', 'EN PULPERIA YEIMI', '', ''),
(4291, 'Cedula Fisica', 603840983, 'SALAZAR GRANADOS SINDY', 'Ciudad Cortes   Bo la Laguna', '', '2788-8913', ''),
(4292, 'Cedula Fisica', 603960201, 'SALAZAR GRANADOS XINIA', 'C. CORTES Bº LA LAGUNA', 'Cel 8329-4686.', '2788-8913', ''),
(4293, 'Cedula Fisica', 501050832, 'SALAZAR JARA RAMON', 'COMANDO C. NEILY O PALMAR NORTE DE', 'LA PULP. YOHANA 50 MT. NORTE.......', '', ''),
(4294, 'Cedula Fisica', 601290672, 'SALAZAR JIMENEZ CARLOS LUIS.', 'NO SE REGISTRO.', '', '', ''),
(4295, 'Cedula Fisica', 108100732, 'SALAZAR MONGE MARIA RAQUEL', 'C.Neily Bº el Estadio costado este', 'casa rosada.', '7835909', ''),
(4296, 'Cedula Fisica', 600430281, 'SALAZAR MORALES TEOFILO.', 'KM 31 LA LIBERTAD DE LAUREL CASA DE', 'ALTA COLOR AMARILLA.', '', ''),
(4297, 'Cedula Fisica', 601132954, 'SALAZAR ORTEGA FRANCISCO.', 'GOLFITO KM 1 CASA # 4454', '', '750011', ''),
(4298, 'Cedula Fisica', 601132954, 'SALAZAR ORTEGA FRANCISCO.', 'GOLFITO KM 1 CASA # 4454', '', '750011', ''),
(4299, 'Cedula Fisica', 104001227, 'SALAZAR PICADO ROBERTO.', 'GOLFITO:BARRIO SAN JUAN COBRAR EN', 'SODA EL HOSPITAL. P. 14 Y 27 C/M', '', ''),
(4300, 'Cedula Fisica', 603590515, 'SALAZAR QUIROS ANA', 'golfito   I.N.V.U. kmt3 de pulpe', 'acevdedo   al fondo c. esquinera', '7752805', ''),
(4301, 'Cedula Fisica', 602900121, 'SALAZAR RIOS ISABEL', 'Laurel 825 Mts Sur de Esc Fca Mango', 'Cs celeste cemento  ', '8484-4952', ''),
(4302, 'Cedula Fisica', 603760746, 'SALAZAR RUIZ TATIANA', 'Pto Jiménez   La Balsa   Fam. Reyes', 'Alm. Minitigre-Internet.', '8918-6074', ''),
(4303, 'Cedula Fisica', 601130997, 'SALAZAR SALAZAR SANTOS', 'Golfito  km3 entrada Puesto Salud 4º', 'casa. Cel: 8320-1682.', '2775-2802', ''),
(4304, 'Cedula Fisica', 601260407, 'SALAZAR SALAZAR SEIDY', 'BARRIO UREÑA   CASA H-8', 'Actualizada en oficina 03-2011.', '7752034', ''),
(4305, 'Cedula Fisica', 900810204, 'SALAZAR SALAZAR VIRGINIA EMILCE', 'RIO CLARO SAN MIGUEL DE 37 POR', 'LAS QUEBRADAS', '7899510', ''),
(4306, 'Cedula Fisica', 602850920, 'SALAZAR SAMUDIO XINIA', 'Cortes   Bo San Antonio 180 m Oeste', 'del M.A.G', '8991287', ''),
(4307, 'Cedula Fisica', 602560195, 'SALAZAR SUÑIGA SARA MARIA', 'CORTES Bº LA LAGUNA 250 ESTE', '7ª CASA', '7888657', ''),
(4308, 'Cedula Fisica', 102280237, 'SALAZAR VALVERDE ARISTIDES', '', '', '', ''),
(4309, 'Cedula Fisica', 102390826, 'SALAZAR VARGAS CARMEN', 'LA ESTRELLA DE CONTE 200MTS OESTE', 'BAR EL SARPE FECHA DE PAGO 13 C/MES', '', ''),
(4310, 'Cedula Fisica', 602560195, 'SALAZAR ZUÑIGA SARA MARIA', 'CORTES B LA LAGUNA 150M ESTE', 'CELULAR: 861-1223', '7888657', ''),
(4311, 'Cedula Fisica', 600540791, 'SALDAÑA BEITA EVELIO', 'Bambel 1   La Granja Campesina diago', 'nal a la escuela.', '', ''),
(4312, 'Cedula Fisica', 800350631, 'SALDAÑA CASTILLO GENEROSO', 'EL CARMEN CONTIGUO WILFRIDO RUEDA', '  p. OFICINA', '', ''),
(4313, 'Cedula Fisica', 603000717, 'SALDAÑA GONZALEZ ALEX', 'colorado   de la escuela 2 km surest', 'e carretera a la cuesta', '8510-8110', ''),
(4314, 'Cedula Fisica', 609701174, 'SALDAÑA RODRIGUEZ FLOR', 'JIMENEZ LA PALMA FRE ENT PLAYA COLI', 'BRI.', '8702-24', ''),
(4315, 'Cedula Fisica', 600810878, 'SALDAÑA TREMINIO GERARDO', 'CARTAGO. Ent.rec. a Digna en Golfit', 'P.Civil costado Iglesia Asamb. Dios', '5514162', ''),
(4316, 'Cedula Fisica', 600810878, 'SALDAÑA TREMINIO GERARDO', 'CARTAGO.ENT.REC.A DIGNA EN', 'GOLF.CIVIL COSTADO IGLESIA ASAMBLEA', '', ''),
(4317, 'Cedula Fisica', 600810878, 'SALDAÑO TREMINIO GERARDO', '', '', '', ''),
(4318, 'Cedula Fisica', 400000000, 'SALGADO PICHARDO MARIA ESPERANZA', 'COTO 63 CASA Nº 15471 FECHA DE', '', '2789-7574', ''),
(4319, 'Cedula Fisica', 800920541, 'SALGADO PICHARDO MARIA ESPERANZA', 'R Claro  Bambel 2  detrás igl Católic', 'cs blanca c rojo vino. Cel 8737-651', '2789-7209', ''),
(4320, 'Cedula Fisica', 602380531, 'SALGUERO CASTILLO RITA MARIA', 'BARRIO CARTIN DEL CITY MALL ENTRADA', 'FRONTAL 100MTS CASA 03. 8631-4654.', '2732-1431', ''),
(4321, 'Cedula Fisica', 600730033, 'SALGUERO SEBALLO JOSE LEON', 'RIO CLARO TALLER SALCEBSA .', '<P> 03 C/M', '*-*-*-*', ''),
(4322, 'Cedula Fisica', 600730033, 'SALGUERO SEBALLOS JOSE LEON', 'FRENTE AL M.O.P.T.', '', '', ''),
(4323, 'Cedula Fisica', 600730033, 'SALGUERO SEBALLOS JOSE LEON', 'FRENTE AL M.O.P.T.', '', '', ''),
(4324, 'Cedula Fisica', 280103375, 'SALINAS MOJICA BEATRIZ.', 'LANGOSTINO DE PAVONES   4 KM SOBRE E', 'NTRADA LA HIERBA.', '', ''),
(4325, 'Cedula Fisica', 601320638, 'SALINAS MOLINA BOANERGE', 'PASO CANOAS   FRENTE ADUANA TICA', '', '7322653', ''),
(4326, 'Cedula Fisica', 603120632, 'SALINAS VILLANERA BRICIDA', 'Coto 52   casa 11525', '', '8617-4311', ''),
(4327, 'Cedula Fisica', 501920735, 'SALMERON CORTES LIDIETH', 'URBA SANTA RITA SANTA ELENA CABALLO', 'BLANCO CASA *B4', '8626-0388', ''),
(4328, 'Cedula Fisica', 104470072, 'SALVATIERRA MURILLO ROCIO', 'PLAYA CACAO CENTRO CASA DE DOÑA', 'ROCIO   DEPOSITA EN EL BANCO.', '3836093', ''),
(4329, 'Cedula Fisica', 600510694, 'SAMUDIO LOPEZ IRENE', 'Piedras Blancas   Cel 8336-6089.', 'casa Nº 147', '8660-1610', ''),
(4330, 'Cedula Fisica', 600550567, 'SAMUDIO OLMOS ROBERTO', 'LA CUESTA FRENTE A LA PALZA.', '<P> 18 C/M', '', ''),
(4331, 'Cedula Fisica', 600550567, 'SAMUDIO OLMOS ROBERTO', 'LA CUESTA FRENTE A LA PALZA.', '<P> 18 C/M', '732', ''),
(4332, 'Cedula Fisica', 600550567, 'SAMUDIO OLMOS ROBERTO', 'La cuesta frente a la plaza', '', '', ''),
(4333, 'Cedula Fisica', 900110051, 'SAMUDIO SAMUDIO MARIA MANGDALENA', 'DE LA ENTRADA DEL NEQUE   SEGUNDA CA', 'SA A MANO IZQUIERDA CASA COLOR CELE', '8614-7540', ''),
(4334, 'Cedula Fisica', 600390873, 'SAMUDIO SAMUDIO MATILDE', 'LAUREL   CASA Nº 25 DETRAS DEL MARCO', '', '7800356', ''),
(4335, 'Cedula Fisica', 600390873, 'SAMUDIO SAMUDIO MATILDE', 'Laurel   Plaza de Futbol   detrás del', 'Marco del fondo.', '2780-1103', ''),
(4336, 'Cedula Fisica', 600390873, 'SAMUDIO SAMUDIO MATILDE', 'Laurel   Plaza de Futbol   detrás del', 'Marco del fondo.', '2780-1103', ''),
(4337, 'Cedula Fisica', 600440723, 'SAMUDIO SAMUDIO SAVINA', '', '', '', ''),
(4338, 'Cedula Fisica', 601030299, 'SANABRIA CASTILLO FRANCISCO', 'Km 29 frente a la Esc 1er Cs a M/I', 'frente a un palo de mango', '8764-5137', ''),
(4339, 'Cedula Fisica', 102140715, 'SANABRIA SALAZAR MARCIAL', 'LA ESTRELLA DE CONTE ENTRADA FTE.', 'BAR EL SARPE3RA. CASAM. DERECHA', '', ''),
(4340, 'Cedula Fisica', 600980120, 'SANABRIA SANABRIA AURELIO', 'BAHIA DE PAVONES COCAL AMARILLO 2Km', 'DE AL ESC. AL SUR EN LA BAJADA.', '', ''),
(4341, 'Cedula Fisica', 601510985, 'SANARRUSIA PEÑA DINIA', 'URB.JANET PACHECO CASA N95 DE LA PU', 'LPERIA LA NEGRA 50MTS OESTE', '8112025', ''),
(4342, 'Cedula Fisica', 602220643, 'SANCHEZ  BLANCO KATTY', 'RIO CLARO LA ESPERANZA DE PULPERIA', 'MARGARITA 50 MTS OESTE', '7898186', ''),
(4343, 'Cedula Fisica', 602220643, 'SANCHEZ  BLANCO KATTY', 'RIO CLARO LA ESPERANZA DE PULPERIA', 'MARGARITA 50 MTS OESTE', '7898186', ''),
(4344, 'Cedula Fisica', 601760725, 'SANCHEZ ACEVEDO LIGIA MARIA', 'La Cuesta   del parque 100 m Sureste', 'Carretera a Laurel.', '', ''),
(4345, 'Cedula Fisica', 501940960, 'SANCHEZ ALEMAN JUAN', 'AGUA BUENA SAN FRANCISCO DEL SALON', 'TESTIGOS 300MTS HACIA S VITO 10 C/M', '7340167', ''),
(4346, 'Cedula Fisica', 602150750, 'SANCHEZ ALFARO EUNICE', '', '', '', ''),
(4347, 'Cedula Fisica', 601041141, 'SANCHEZ ALMENGOR TOMASA SIOMARA', '', '', '', ''),
(4348, 'Cedula Fisica', 601200546, 'SANCHEZ APARICIO CANDIDO', 'C Neily   Diagonal Salón Comunal Bº', 'La Colina.', '', ''),
(4349, 'Cedula Fisica', 603320060, 'SANCHEZ ARAYA EVER', 'PTO JIMENEZ LA PALMA DEL SALON MULT', 'IUSO 250MTRS NOROESTE CASA PREFABRI', '8501-9230', ''),
(4350, 'Cedula Fisica', 602790356, 'SANCHEZ ARCE CRISTIAN', '300 AL ESTE DEL CENTRO DE COPA BUEN', 'A SAN VITO   AGUA BUENA', '8733-1225', ''),
(4351, 'Cedula Fisica', 800400965, 'SANCHEZ AREAS VICTOR MANUEL', 'GOLF PENCION MINERVA  ', 'MERCADO <P> 03 C/M', '775', ''),
(4352, 'Cedula Fisica', 501401147, 'SANCHEZ ARGUEDAS BOLIVAR', 'PAVONES 200 M DE LA ESCUELA', 'PUNTA BANCO CASA DE BLOK', '', ''),
(4353, 'Cedula Fisica', 501400147, 'SANCHEZ ARGUEDAS BOLIVAR', 'Punta Banco   200m norte Escuela   cs', 'al fondo.', '2776-2163', ''),
(4354, 'Cedula Fisica', 103860816, 'SANCHEZ ARIAS FLOR MARIA', 'La Vaca   Bella Luz   200 del puente', 'pulp M/I calle a La Estrella.', '8719-8831', ''),
(4355, 'Cedula Fisica', 600350050, 'SANCHEZ AVILES DOROTHEA', 'P Sur   11 Abril   Ent principal 125m', 'hacia Escuela.', '2786-7153', ''),
(4356, 'Cedula Fisica', 601520146, 'SANCHEZ BADILLA FLORENTINO', 'GOLFITO PURRUJA KMT 7 ANTG PUENTE', 'DE ORO <P> 03 Y 16 C/M', '*-*-*-*', ''),
(4357, 'Cedula Fisica', 601520146, 'SANCHEZ BADILLA FLORENTINO', 'Golfito   Purruja  200m Oeste Bar Rio', 'de Janeiro.', '2775-5016', ''),
(4358, 'Cedula Fisica', 600330640, 'SANCHEZ BADILLA RAMONA.', 'RIO ORO  ENTRADA POR LA PLAZA AL FON', 'DO CARRETERA A PALMAR  KMT 37.P-6 CM', '', ''),
(4359, 'Cedula Fisica', 601730773, 'SANCHEZ BELLANERO LIDUVINA', 'Golfito   La Mona Urba Daniel', 'Herrera   Casa C-20', '7756038', ''),
(4360, 'Cedula Fisica', 1, 'SANCHEZ BLANCO KATTY', 'R Claro   S Ramón   100 N puesto de', 'policía.', '', ''),
(4361, 'Cedula Fisica', 602220643, 'SANCHEZ BLANCO KATTY', 'R Claro  La Esperanza  cs Seidy Parra', 'o Yeremy Cordero   Cel 8824-5552.', '2789-8186', ''),
(4362, 'Cedula Fisica', 600981153, 'SANCHEZ CAMACHO ELIETH', 'GOLFITO RECIDENCIAL UREÑA', 'CASA D-1', '7750201', ''),
(4363, 'Cedula Fisica', 600981153, 'SANCHEZ CAMACHO ELIETH', 'GOLFITO RECIDENCIAL UREÑA', 'CASA D-1', '7750201', ''),
(4364, 'Cedula Fisica', 701130518, 'SANCHEZ CARVAJAL NELSIE', 'Fca ALAJUELA 400 Mts SUR DE LA', 'ESCUELA <P> 16 C/M', '', ''),
(4365, 'Cedula Fisica', 701130518, 'SANCHEZ CARVAJAL NELSYE', 'Fca Alajuela   La Navidad 400 sur MD', '', '2741-1376', ''),
(4366, 'Cedula Fisica', 900450826, 'SANCHEZ CASTILLO ANDRES', 'P Jiménez Bco NACIONAL 100 N 50 O', 'hacia Monge x vidrios.', '7355642', ''),
(4367, 'Cedula Fisica', 601041071, 'SANCHEZ CESPEDES GERARDINA', '', '', '', ''),
(4368, 'Cedula Fisica', 602070352, 'SANCHEZ CHAVARRIA ANNIVETH', 'CIUDAD NEILY; COBRAR EN O.I.J.', 'GOLFITO LA ROTONDA CASA # 32', '750157', ''),
(4369, 'Cedula Fisica', 501030134, 'SANCHEZ CONEJO RAFAEL C.C.PELON', 'Puerto Jimenez   Uurba el Colegio', '27355586 o 2755886. direc incomplet', '7355586', ''),
(4370, 'Cedula Fisica', 601470443, 'SANCHEZ CORRALES FAUSTINO', 'P Canoas   calle a la Cueta   entrada', 'x abast. Xinia   ult casa. 8733-7644', '2732-2336', ''),
(4371, 'Cedula Fisica', 135029568, 'SANCHEZ DIAZ RUBEN', 'finca 2-4 tercera fila frente', 'iglecia metodista cuarta casa', '7867660', ''),
(4372, 'Cedula Fisica', 601720078, 'SANCHEZ FAJARDO RUTH MARIA', 'C.CORTES EL PRECARIO 20M ANTES', 'DE PULP. VANESA  LA NEGRA.', '', ''),
(4373, 'Cedula Fisica', 601170449, 'SANCHEZ FLORES ROGER', 'RIO CLARO   FRENTE AL TRANCITO EN LA', 'PILADORA DE ARROZ <P> 03 Y 16 C/M', '', ''),
(4374, 'Cedula Fisica', 113700815, 'SANCHEZ FONSECA ALBERTO', 'Laurel  S Lucía  300M hacia Campiña', '', '8678-3481', ''),
(4375, 'Cedula Fisica', 600300550, 'SANCHEZ GARCIA TEODORO', 'Sierpe  P Nuevo   Ent Picola 100m sur', 'casa verde.', '8823-9925', ''),
(4376, 'Cedula Fisica', 602330876, 'SANCHEZ GOMEZ ALEXANDER', '', '', '', ''),
(4377, 'Cedula Fisica', 601470443, 'SANCHEZ GONZALEZ FAUSTINO', 'LA CUESTA; BLOQUERA EL TAJO', '<P> 30 C/M', '', ''),
(4378, 'Cedula Fisica', 502030518, 'SANCHEZ GUEVARA PETRONILA', 'Laurel   50m detrás de la Escuela.', '', '8530-2063', ''),
(4379, 'Cedula Fisica', 201380879, 'SANCHEZ GUILLLEN CARLOS', 'LA PUERTA DEL SOL CONTG. A', 'PUENTE LA BONITA', '', ''),
(4380, 'Cedula Fisica', 601850430, 'SANCHEZ HERNANDEZ CARLOS', 'Bambel 1   Fte a Pulpería el Jardín.', 'Telf: 2789-8970.', '8863-1517', ''),
(4381, 'Cedula Fisica', 104220926, 'SANCHEZ HERNANDEZ CARMEN', 'GOLFITO KM. 20 ENTRADA X LA PULP.', '', '2789-7258', ''),
(4382, 'Cedula Fisica', 602090297, 'SANCHEZ HERNANDEZ JAVIER', 'RIO CLARO BAMBEL 1 EN PULPERIA', 'EL JARIN * FECHA DE PAGO 15 C/MES *', '7898967', ''),
(4383, 'Cedula Fisica', 601800278, 'SANCHEZ HERNANDEZ VICTOR MANUEL', 'P Jiménez  La Palma   Urb. El Maderea', 'do cs 01.', '8964-5923', ''),
(4384, 'Cedula Fisica', 601270490, 'SANCHEZ LOZADA MARIA DE LA CRUZ', 'LA CUESTA 200 Mts SUR DE CEMENTERIO', 'CASA # 33  <P> 30 C/M', '', ''),
(4385, 'Cedula Fisica', 602230236, 'SANCHEZ MARTINEZ MARIA OFELINA', 'La Gloria   Finca del Gringo', 'Telf: 8750-8545.', '8754-9874', ''),
(4386, 'Cedula Fisica', 900760187, 'SANCHEZ MARTINEZ SANTOS', 'PLAZA CANOAS   ENTRADA AL TAJO  CASA', 'COLOR BLANCO.', '7321338', ''),
(4387, 'Cedula Fisica', 502320515, 'SANCHEZ MONCADA DAMARIS', 'COOPEPIERAS BLANCAS', '', '2741-1314', ''),
(4388, 'Cedula Fisica', 600720954, 'SANCHEZ MORALES CATALINA', 'RESIDENCIAL UREÑA CASA E 2 REST.', 'EL UNO. P. 03 Y 18 C/M', '7750061', ''),
(4389, 'Cedula Fisica', 600720954, 'SANCHEZ MORALES CATALINA', 'RESIDENCIAL UREÑA CASA E 2 REST.', 'EL UNO. P. 03 Y 18 C/M', '7750061', ''),
(4390, 'Cedula Fisica', 600720954, 'SANCHEZ MORALES CATALINA', 'Golfito   Urb. Ureña   Casa E-2', '', '2775-2046', ''),
(4391, 'Cedula Fisica', 601051345, 'SANCHEZ PAIS JUANA', 'RIO CLARO CIUDADELA I.C.E.', 'CASA Nº 5', '', ''),
(4392, 'Cedula Fisica', 601051345, 'SANCHEZ PAIS JUANA', 'RIO CLARO CIUDADELA ICE CASA N .5', 'CLIENTE EXELENTE', '7899496', ''),
(4393, 'Cedula Fisica', 800480256, 'SANCHEZ PANCHANA JORGE', 'GOLFITO LA MONA DANIEL HERRERA', 'CASA G.19', '', ''),
(4394, 'Cedula Fisica', 800570062, 'SANCHEZ PINEDA  AGUSTINA', 'LA PALMA 200 MTS DEL GUAY..', '', '', ''),
(4395, 'Cedula Fisica', 104950498, 'SANCHEZ PORRAS JOAQUIN ELIAS', 'LA JULIETA 100 MTS ANTES DE LA ESC', 'DEL LUGAR', '8911-9816', ''),
(4396, 'Cedula Fisica', 500800514, 'SANCHEZ REYES RAFAELA', 'GOLF   Bº BELLA VISTA PULP LA', 'CUESTA <P> 16 C/M', '-', ''),
(4397, 'Cedula Fisica', 500800514, 'SANCHEZ REYES RAFAELA', 'Golfito   Bella Vista   Calle al Pic-', 'nic.', '2776-8154', ''),
(4398, 'Cedula Fisica', 105360366, 'SANCHEZ RODRIGUEZ ARMANDO', '', '', '', ''),
(4399, 'Cedula Fisica', 105360366, 'SANCHEZ RODRIGUEZ ARMANDO', 'COTO 49 COSTADO SUR DE PLAZA', 'Nº 12435 * FECHA DE PAGO 2 C/MES*', '7811112', ''),
(4400, 'Cedula Fisica', 105360366, 'SANCHEZ RODRIGUEZ ARMANDO', 'COTO 49 COSTADO SUR DE PLAZA', 'Nº 10435 * FECHA DE PAGO 2 C/MES*', '2781-1470', ''),
(4401, 'Cedula Fisica', 502570142, 'SANCHEZ ROSALES ISABEL', 'UVITA DE LA ENTRADA 600 MTS BAR', 'COCOTICO.', '', ''),
(4402, 'Cedula Fisica', 401300118, 'SANCHEZ SALAS CARMEN', 'Golfito  Higuerón  3km O Rancho Cachi', 'ri sobre río.', '8635-7769', ''),
(4403, 'Cedula Fisica', 159100076, 'SANCHEZ SANCHEZ ANGEL', 'LA MARIPOSA DE LA PLAZA 2sda CASA', 'CALLE A LA POSA LA ABUELA  15 C/MES', '', ''),
(4404, 'Cedula Fisica', 600870894, 'SANCHEZ SANCHEZ DAMARIS', 'GOLFITO   LA MONA 50 MTS OESTE DE', 'PULP. Bº MEXICO', '', ''),
(4405, 'Cedula Fisica', 602530593, 'SANCHEZ SANCHEZ FREDDY', 'P Jiménez   Cañaza  1km oeste Escuela', '', '8740-7819', ''),
(4406, 'Cedula Fisica', 602950981, 'SANCHEZ SANCHEZ IRVING', 'pto jimenez cobrar en banco naciona', '', '7355743', ''),
(4407, 'Cedula Fisica', 600780531, 'SANCHEZ SANCHEZ JUAN ALEXIS', '', '', '', ''),
(4408, 'Cedula Fisica', 600540459, 'SANCHEZ SANCHEZ JUAN DE DIOS', 'CONTROL DE ENTRADA A LA BRUJITA 1KM', 'AL SUR', '', ''),
(4409, 'Cedula Fisica', 101478858, 'SANCHEZ SANCHEZ MIGUEL ANGEL', 'LAUREL SAN JUAN DE VERE FRENTE A', 'LA ENTRADA', '', ''),
(4410, 'Cedula Fisica', 101470858, 'SANCHEZ SANCHEZ MIGUEL ANGEL', 'Laurel   Vereh   fte parada San Juan.', '', '2780-1016', ''),
(4411, 'Cedula Fisica', 600590825, 'SANCHEZ SANCHEZ RAFAEL', 'PUNTA ZANCUDO   FRENTE AL RANCHO', 'EL COQUITO', '7751994', ''),
(4412, 'Cedula Fisica', 600740954, 'SANCHEZ SANCHEZ RAMON', 'R Claro Bambel   Granja Campesina', 'casa 4.', '2789-4816', ''),
(4413, 'Cedula Fisica', 602330263, 'SANCHEZ SILES CARLOS LUIS', 'TINOCO   CARRETERA A PARAISO CASA', 'MANO IZQUIERDA ANTES DEL RIO.P 6C/M', '', ''),
(4414, 'Cedula Fisica', 103750246, 'SANCHEZ UMAÑA DANILO.', 'VEREH 200MTS SUR DE LA ESCUELA.', 'CANCELA LOS 18 C/M.', '7800532', ''),
(4415, 'Cedula Fisica', 501310277, 'SANCHEZ VEGA CELSO', '', '', '', ''),
(4416, 'Cedula Fisica', 602130210, 'SANCHEZ VIJIL JORGE LUIS.', 'LA GLORIA DE PASO CANOAS 500MTS SUR', 'DE LA ESCUELA COMANDO CUERVITO', '', ''),
(4417, 'Cedula Fisica', 602225047, 'SANCHEZ VILLAREAL KATALINA', 'TRAMO FRENT WANG CHANG PASO CANOAS', 'O DEL AZTECA 200 Mts OESTE <P> 30', '', ''),
(4418, 'Cedula Fisica', 601380476, 'SANCHEZ VILLARREAL LIDIA', 'Golfito   pueblo civil   3era entrada', '3era casa frente a la Escuela.', '', ''),
(4419, 'Cedula Fisica', 602160330, 'SANCHO ALPIZAR ULICES E.', 'RIO INCENDIO X LA ESCUELA', '* 15 C/MES /', '7838167', ''),
(4420, 'Cedula Fisica', 107080362, 'SANCHO ARIAS EMILIA', 'CARRETERA ALA CUESTA FRENTE A CHINA', 'MO DUTY FREE', '2732-3579', ''),
(4421, 'Cedula Fisica', 107080362, 'SANCHO ARIAS EMILIA', 'La Cuesta   Frente a China Duty Free', '8436-0725', '', ''),
(4422, 'Cedula Fisica', 400600255, 'SANCHO BRENES JAIME', 'P Canoas   El Triunfo   casa B3', '', '8898-2271', ''),
(4423, 'Cedula Fisica', 602790706, 'SANCHO CALDERON SEIDY', 'Coto 54   3º casa fte al tanque de', 'agua   m izq. soda la planta.', '8975-6636', ''),
(4424, 'Cedula Fisica', 107050097, 'SANCHO FALLAS VANESSA TATIANA', 'GOLFITO INUVU KM3 CASA *75', '8629/0966..8332/9224', '2775-0542', ''),
(4425, 'Cedula Fisica', 501610012, 'SANCHO VARGAS ODILIA', 'RIO CLARO LA ESPERANZA DEL BAR CUAR', 'ATA CASA FTE TASCONAZO', '', ''),
(4426, 'Cedula Fisica', 600410103, 'SANDI AZOFEIFA CALIXTO', 'CARACOL EN ABASTECEDOR LANORTEÑA', '', '7836743', ''),
(4427, 'Cedula Fisica', 600410103, 'SANDI AZOFEIFA CALIXTO', 'CARACOL NORTE EN  ABASTECEDOR LA', 'NORTEÑA* CANCELA 16 CADA MES *', '7836746', ''),
(4428, 'Cedula Fisica', 600670488, 'SANDI AZOFEIFA LUCIA', 'CARACOL TERCERA CASA A MANO DERECHA', '', '2783-3193', ''),
(4429, 'Cedula Fisica', 600670488, 'SANDI AZOFEIFA LUCIA', 'Caracol Norte   diag a la plaza Cs', 'M/D / 2783-3193', '', ''),
(4430, 'Cedula Fisica', 501130352, 'SANDI BALTODANO ADILIA.', 'GOLFITO.', '', '', ''),
(4431, 'Cedula Fisica', 501130352, 'SANDI BALTODANO ADILIA.', 'GOLFITO.', '', '', ''),
(4432, 'Cedula Fisica', 501130352, 'SANDI BALTODANO ADILIA.', 'GOLFITO.', '', '', ''),
(4433, 'Cedula Fisica', 601730407, 'SANDI CASTRO MARVIN', 'Caracol Norte   contiguo Abast. LA.', 'Cel 8745-96745.', '2783-6714', ''),
(4434, 'Cedula Fisica', 601200445, 'SANDI CASTRO ROSALINA', 'CARACOL NORTE EN PULPERIA', 'LA NORTEÑA', '7836718', ''),
(4435, 'Cedula Fisica', 601200445, 'SANDI CASTRO ROSALINA', 'CARACOL NORTE EN PULPERIA', 'LA NORTEÑA', '7836718', ''),
(4436, 'Cedula Fisica', 102530796, 'SANDI CHANTO FROILAN', 'ZANCUDO CABINAS TIO FROILAN', '<P>13 C/M', '7760102', ''),
(4437, 'Cedula Fisica', 201280574, 'SANDI CORDERO ELENA', 'CENIZO POR DONDE ESTA LA', 'ENTRDA DE LA IGLESIA EVANGELICA', '7800176', ''),
(4438, 'Cedula Fisica', 201280574, 'SANDI CORDERO ELENA', 'CENIZO POR DONDE ESTA LA', 'ENTRDA DE LA IGLESIA EVANGELICA', '7800176', ''),
(4439, 'Cedula Fisica', 106270097, 'SANDI FALLAS HAIDEE M.', 'LAUREL COSTADO SUR ESTE DE LA PAZA', '', '2780-1135', ''),
(4440, 'Cedula Fisica', 602540429, 'SANDI JIMENEZ AUDILIA', 'SAN MARTIN.MARTIN PASO CANOAS 300 M', 'TS DE LA ESCUELA', '7321252', ''),
(4441, 'Cedula Fisica', 102930483, 'SANDI LEMAITRE HERNAN', '', '', '', ''),
(4442, 'Cedula Fisica', 601160833, 'SANDI LEON FRAY MARTIN', 'LA ESTRELLA CONTE 700.M NORTE', 'BAR EL SARPE', '7768042', ''),
(4443, 'Cedula Fisica', 601160833, 'SANDI LEON FRAY MARTIN', 'Comte   La Estrella   800m Norte Bar', 'el Zarpe. Ent a Tigrillo. 8756-1086', '2776-8368', ''),
(4444, 'Cedula Fisica', 601160833, 'SANDI LEON MARTIN', 'LA ESTRELLA DE CONTE 700M N. DEL', 'BAR EL SARPE', '', ''),
(4445, 'Cedula Fisica', 602050096, 'SANDI LEON MIRIAM', 'Laurel  Comte  La Estrella   diagonal', 'al bar el Zarpe.', '2776-8156', ''),
(4446, 'Cedula Fisica', 601540564, 'SANDI LEON ROBERTINO', 'LA ESTRELLA DE CONTE FTE A BAR EL', 'SARPE * FECHA DE PAGO 10 C/MES**', '', ''),
(4447, 'Cedula Fisica', 601300929, 'SANDI MONGE HUGO', 'GOLF HOTEL DELFINA <P> 03 C/M', '', '', ''),
(4448, 'Cedula Fisica', 601300929, 'SANDI MONGE HUGO', 'GOLFITO LA PURRUJA POR EL PUENTE', 'Nº 2 ** CANCELA 3 CADA MES **', '7755203', ''),
(4449, 'Cedula Fisica', 601130159, 'SANDI MONGE WILSON GERARDO', '', '', '', ''),
(4450, 'Cedula Fisica', 601020912, 'SANDI MORA ODILI', 'GOLFITO LLANO BONITO ABASTECEDOR LA', 'CENTRAL', '7753075', ''),
(4451, 'Cedula Fisica', 601020912, 'SANDI MORA ODILIE', 'Golfito   Llano Bonito  Abast Central', '', '2775-3075', ''),
(4452, 'Cedula Fisica', 101830728, 'SANDI SANDI JUAN', 'PALMAR NORTE B¨ALEMANIA   CASA N 5 D', 'E LA PULP LA CENTRAL 50 ESTE Y 50 S', '7866221', ''),
(4453, 'Cedula Fisica', 601021479, 'SANDI VALVERDE MARTIN', 'CIUDAD NEILLY BARRIO EL CARMEN DEL', 'ICE 200 MTS NORTE  25 MTS ESTE', '', ''),
(4454, 'Cedula Fisica', 601100633, 'SANDI VILLALOBOS HERMAN', 'CARACOL NORTE 500 DE LA PAVIMENTADA', '** FECHA DE PAGO 2 CADA MES  ***', '7836699', ''),
(4455, 'Cedula Fisica', 601100633, 'SANDI VILLALOBOS HERMAN', 'CARACOL NORTE 500 DE LA PAVIMENTADA', '** FECHA DE PAGO PALMEROS ***', '7836699', ''),
(4456, 'Cedula Fisica', 601100633, 'SANDI VILLALOBOS HERMAN', 'CARACOL NORTE 500 DE INTERAMERICANA', '', '2783-6699', ''),
(4457, 'Cedula Fisica', 270846723, 'SANDOVAL ARGUELLO RENE', 'Bº EL CARMEN DE ABROJO 150 MTS ANTE', 'DE PULP LAS BRISAS M.IZQ EN BAZAR', '7834430', ''),
(4458, 'Cedula Fisica', 603730044, 'SANDOVAL BELLO ESTEBAN', 'PTO JIMENEZ SANDALO ABASTECEDOR PAU', 'LA', '8778-0692', ''),
(4459, 'Cedula Fisica', 701430611, 'SANDOVAL FALLAS DOUGLAS', 'Coto 54   casa 10985 x la plaza.', '', '8754-7427', ''),
(4460, 'Cedula Fisica', 501820853, 'SANDOVAL NUÑEZ FULVIO', 'SANDALO PJ   150 M SUR DEL', 'SALON COMUNAL', '7708207', ''),
(4461, 'Cedula Fisica', 600300229, 'SANDOVAL OROSCO AMADA LINA', 'LA CUESTA CONTIG. AL SALON DE', 'TESTIGOS.', '7322053', ''),
(4462, 'Cedula Fisica', 110910890, 'SANTAMARIA ARROYO JACQUELINE', 'VALLE AZUL AGUA BUENA ABASTECEDOR', 'EL INVENCIBLE 8749-4980.', '2734-3135', ''),
(4463, 'Cedula Fisica', 602710500, 'SANTAMARIA CARLOS', 'P Jiménez   2km hacia Karate entrada', 'antiguo yugo al fondo cs amarilla.', '8673-6175', ''),
(4464, 'Cedula Fisica', 601680162, 'SANTAMARIA GARCIA ANGELA', 'PTO JIMENEZ LA PALMA DEL CEMENTERIO', '200N NE. * CANCELA 11 C/MES **', '7351252', ''),
(4465, 'Cedula Fisica', 600960745, 'SANTAMARIA GUERRA BIENVENIDO.', 'KMT 12 LA MONA CIUDADELA MADRIGAL.', '50 MTS ANTES DEL TELEFONO.LOTE 2.', '-------', ''),
(4466, 'Cedula Fisica', 600810261, 'SANTAMARIA GUERRA MA DE LOS ANGELES', 'GOLFITO   I.N.V.U. KM 3 ENTRADA  DE', 'TALLER MILTON', '750781', ''),
(4467, 'Cedula Fisica', 600810261, 'SANTAMARIA GUERRA Mª DE LOS ANGELES', 'GOLFITO Bº BELLA VISTA SGUNDA FILA', '', '', ''),
(4468, 'Cedula Fisica', 800560110, 'SANTAMARIA GUSTAVINO CECILIA', 'LA CUESTA.SAN JOSE DE DESAMPARADOS', 'TOÑO BAR 100.SUR 100 OESTE.', '591422', ''),
(4469, 'Cedula Fisica', 601031189, 'SANTAMARIA MORALES ALBERTINA', 'CORNADO COOPEMANGLE', '', '', ''),
(4470, 'Cedula Fisica', 601031189, 'SANTAMARIA MORALES ALBERTINA', 'CORNADO COOPEMANGLE', '', '', ''),
(4471, 'Cedula Fisica', 601300189, 'SANTAMARIA MORALES ALBERTINA', 'CORONADO   COOPEMANGLE   CORTES.', '', '', ''),
(4472, 'Cedula Fisica', 601210392, 'SANTAMARIA MORALES CATALINA', 'C. CORTES CORONADO 100 MTRS ESTE', 'DE LA ESCUELA', '8628009', ''),
(4473, 'Cedula Fisica', 601090350, 'SANTAMARIA MORALES FRANCISCA', 'CORTES   DEL MAG 125 OESTE', '', '7888647', ''),
(4474, 'Cedula Fisica', 900430226, 'SANTAMARIA MORALES GABRIEL', 'CORTES CORONADO COOPEMANGLE', 'DE LA ENTRADA 3era CASA DERECHA', '', ''),
(4475, 'Cedula Fisica', 600630267, 'SANTAMARIA RODRIGUEZ FRANCISCO', 'P Jiménez   Escondido   50m Soda las', 'Delicias.', '2735-1113', ''),
(4476, 'Cedula Fisica', 600820921, 'SANTAMARIA RODRIGUEZ MIRIAM', 'LA PALMA PLAYA BLANCA FTE   AL COLEG', '**   CANCELA 10 C/MES **', '', ''),
(4477, 'Cedula Fisica', 602860098, 'SANTAMARIA RODRIGUEZ YEIMI', 'URB* EL ALMACEN CASA *14', 'TRABJO:8979 6223', '8657-1369', ''),
(4478, 'Cedula Fisica', 601300784, 'SANTAMARIA ROJAS WALTER', 'CIUDAD NEILY   50 MTS E. DEL PUENTE', 'Bº SN RAFEL O EN ABASTEC. GABRIELA', '783-', ''),
(4479, 'Cedula Fisica', 600710579, 'SANTAMARIA SANTAMARIA DANILO', 'CIUDAD NEILY; Bº SAN JUAN.', 'COBRAR EN LA COMANDANCIA', '', ''),
(4480, 'Cedula Fisica', 600470063, 'SANTAMARIA SANTAMARIA HECTOR', 'GOLFITO Bº BELLA VISTA CONTG A', 'CABINAS MARLEN C.4213 <P> 03 C/M', '*-*-*-*', ''),
(4481, 'Cedula Fisica', 600710090, 'SANTAMARIA SANTAMARIA ROSA', 'LA CUESTA   CIUDADELA TAMAYO CASA', '#1-A.', '', ''),
(4482, 'Cedula Fisica', 600660742, 'SANTAMARIA SATAMARIA ANGELA', 'Golfito   Purruja  Urb Tukler  cs A27.', 'Cel  8692-6637.', '2775-5172', ''),
(4483, 'Cedula Fisica', 603370872, 'SANTAMARIA SEQUIERA DINIA Mª', 'C. CORTES CORONADO COSTADO E. DE', 'LA ESCUELA CANCELA 8 C/MES', '7865645', ''),
(4484, 'Cedula Fisica', 603370872, 'SANTAMARIA SEQUIERA DINIA Mª', 'C. CORTES CORONADO COSTADO E. DE', 'LA ESCUELA CANCELA 8 C/MES', '7865645', ''),
(4485, 'Cedula Fisica', 603150934, 'SANTAMARIA VASQUEZ EDWIN', 'P Jiménez  Agujas detrás de Escuela.', 'Cel 8635-4100.', '2206-5861', ''),
(4486, 'Cedula Fisica', 800700257, 'SANTOS GALLARDO BRIGILIO', 'Bella luz dela Vaca  Sta Rosa  ', 'Las Vegas   8511-1750 = Hijo', '', ''),
(4487, 'Cedula Fisica', 602210817, 'SAVEDRA SAMUDIO MARIA MIDEY', 'P Jiménez  Ñeque  50m Pulp.Las Flores', '', '8699-0603', ''),
(4488, 'Cedula Fisica', 603530657, 'SEGURA ARGUIJO JENNY', 'DRAKE   Hotel Aguila de Osa.', 'CANCELA POR DEPOSITO BANCARIO', '8940-2929', ''),
(4489, 'Cedula Fisica', 500980879, 'SEGURA CAMPOS DIMAS', 'BARRIO ARGERTINA LA MARIPAZA LA ENR', 'TRADA CASA ALA IZQUIERDA', '', ''),
(4490, 'Cedula Fisica', 500940184, 'SEGURA CAMPOS MARCELINO', 'LA MARIPOSA   ENTRADA   C.MANO IZQUIE', '2 KMTS DEL RETIRO.', '', ''),
(4491, 'Cedula Fisica', 500940184, 'SEGURA CAMPOS REMIGIO', 'LA MARIPOSA DE LA ENTRADA CEFERINO', '2 KM ADENTRO Bª ARGENTINA CSAS IZQ', '', ''),
(4492, 'Cedula Fisica', 602700424, 'SEGURA CASCANTE ALBA', 'SABALITO B* EL INVU 200 AL OESTE DE', 'LA IGLESIA CATOLICA', '8960-1783', ''),
(4493, 'Cedula Fisica', 500450340, 'SEGURA CERDAS AUGUSTO.', 'SODA TRACOPA.', '', '7833778', ''),
(4494, 'Cedula Fisica', 110600656, 'SEGURA DIAZ ALEJANDRO', 'P Jiménez centro   detrás Farmacia', 'Hidalgo   cc zapote. Cel 8811-2410', '2735-5555', ''),
(4495, 'Cedula Fisica', 600390657, 'SEGURA EUSEBIA ANTONIA', 'SAN RAMON DE RIO CLARO DE LA ENTRAD', 'DE LA ESCUELA A MANO DEREC C.C MALL', '2789-7540', ''),
(4496, 'Cedula Fisica', 700481417, 'SEGURA FLORES JORGE', '', '', '', ''),
(4497, 'Cedula Fisica', 700481417, 'SEGURA FLORES JORGE', 'CORTES DE LA GUARIA 300 OESTE  ', 'CONTIGUO AL TELEFONO PUBLICO', '7888205', ''),
(4498, 'Cedula Fisica', 700481417, 'SEGURA FLORES JORGE', 'Cortés Bº Cementerio Mega Super 800', 'm Oeste. Telf 2788-8205. 8628-2815.', '2788-8327', ''),
(4499, 'Cedula Fisica', 603250735, 'SEGURA HERNANDEZ ADRIANA', 'La Campiña 2 km oeste plaza camino', 'al 24.', '2776-6089', ''),
(4500, 'Cedula Fisica', 602700723, 'SEGURA JIMENEZ YORLENY', 'CAÑAZA DE PUERTO JIMENEZ', 'TELEFONO ADIMINISTRADO YARIELA', '2779-7424', ''),
(4501, 'Cedula Fisica', 600400868, 'SEGURA MONTERO TEODOLINDA', 'Laurel. Sta Lucía   200 m calle a mo', 'nte verde.', '2780-1067', ''),
(4502, 'Cedula Fisica', 601130333, 'SEGURA PANIAGUA ALFONSO', 'LA CAMPIÑA CASA PASTORAL IGLECIA', 'METODISTA CANCELA 13 C/MES*', '7766056', ''),
(4503, 'Cedula Fisica', 601001131, 'SEGURA REYES JOSE ISIDRO', 'Guaycara Nº 3 Casa Nº 24.', '', '2789-9617', ''),
(4504, 'Cedula Fisica', 601001131, 'SEGURA REYES JOSE ISIDRO.', 'RIO CLARO  Detrás de la Sub-estación', 'del ICE. Ciudadela Guaycará 3.', '7899617', ''),
(4505, 'Cedula Fisica', 603460722, 'SEQUEIRA AMADOR ESTRELLA', 'FRENTE AL TALLER DE MOISES ANTES DE', 'ASOMEP', '8801-7791', ''),
(4506, 'Cedula Fisica', 602900498, 'SEQUEIRA AMADOR RICARDO GEOVANNI', 'Pto Jimenez   asent El Tigre   frent', 'pulp Las flores   8696-3608', '8949-2766', ''),
(4507, 'Cedula Fisica', 108030855, 'SEQUEIRA ARROYO CARLOS', 'CN. B*SAN RAFAEL A UN COSTADO DE', 'IMPRENTA HERMANOS REYES', '8942-7895', ''),
(4508, 'Cedula Fisica', 114250947, 'SEQUEIRA AZOFEIFA ERICK ANDRES', 'Finca Alajuela   super económico del', 'Sur. Ceñ 8517-2976.', '2741-1011', ''),
(4509, 'Cedula Fisica', 500390160, 'SEQUEIRA CARRILLO TIBURCIO', 'La Cuesta  15m desp. colegio antes', 'de entrada el tajo.', '2732-1652', ''),
(4510, 'Cedula Fisica', 500590160, 'SEQUEIRA CARRILLO TIBURCIO DE JESUS', 'LA CUESTA 150 M NORTE DEL COLEGIO', 'FRENTE A PULPERIA FRANCIS.', '7760133', ''),
(4511, 'Cedula Fisica', 800350426, 'SEQUEIRA CASTRO RAMON', 'GOLFITO BELLA VISTA DESTRAS ESTADIO', '4 FILA P. <03> C/M', '775', ''),
(4512, 'Cedula Fisica', 800350426, 'SEQUEIRA CASTRO RAMON', 'GOLFITO BELLA VISTA DESTRAS ESTADIO', '5 FILA.', '775', ''),
(4513, 'Cedula Fisica', 800350426, 'SEQUEIRA CASTRO RAMON', 'GOLFITO BELLA VISTA DETRAS ESTADIO', '5 FILA.', '2275-0172', ''),
(4514, 'Cedula Fisica', 800350426, 'SEQUEIRA CASTRO RAMON', 'Golfito   Bella Vista.', '', '2775-0172', ''),
(4515, 'Cedula Fisica', 506000662, 'SEQUEIRA DIAZ ANTONIO', 'OLLA CERO DE IGLESIA VIDA NUEVA', 'CONTIG A PULP (PASTOR)', '7866283', ''),
(4516, 'Cedula Fisica', 600610427, 'SEQUEIRA DIAZ JOSEFA', '', '', '', ''),
(4517, 'Cedula Fisica', 600610427, 'SEQUEIRA DIAZ JOSEFA', 'COTO 47 POR EL TELEFONO', 'PUBLICO CASA VERDE <P> OFICINA', '', ''),
(4518, 'Cedula Fisica', 600820013, 'SEQUEIRA DOMINGUEZ MARIA', 'paso canoas chinamera', '', '', ''),
(4519, 'Cedula Fisica', 101630398, 'SEQUEIRA ONDOY HUMBERTO', 'C.CORTES  RENECIMIENTO CASA E-6', '70 MTS OESTE DEL PLEY...', '', ''),
(4520, 'Cedula Fisica', 600950341, 'SEQUEIRA ORTEGA FROILAN', 'GOLFITO   Bº BELLA VISTA C. Nº 4287', 'DONDE HACEN PUERTAS.', '7750497', ''),
(4521, 'Cedula Fisica', 601240523, 'SEQUEIRA ORTEGA NATALIA', 'GOLFITO LA MONA KM 12', '', '', ''),
(4522, 'Cedula Fisica', 601240523, 'SEQUEIRA ORTEGA NATALIA', 'LA MONA Kmt 12 DE LA PULP LA PUEBLA', '150 Mts SUR <P> 02 C/M', '7750759', ''),
(4523, 'Cedula Fisica', 601240523, 'SEQUEIRA ORTEGA NATALIA', 'GOLFITO   LA MONA 75 SUR DE LA', 'ESCUELA   O   HOTEL CIERRA', '7750759', ''),
(4524, 'Cedula Fisica', 601240523, 'SEQUEIRA ORTEGA NATALIA', 'LA MONA 75m Antes Pulp. La Puebla.', 'Sino cobrar lavanderia Hotel Sierra', '7756302', ''),
(4525, 'Cedula Fisica', 111620114, 'SEQUEIRA PEREZ MELISSA', 'GOLFITO FRENTE AL BANCO NACIONAL', '', '7750495', ''),
(4526, 'Cedula Fisica', 700870974, 'SEQUEIRA ROSALES JORGE LUIS', '250 mts de la entrada del LLamaron  ', 'casa verde a mano derecha ciudad co', '7888433', ''),
(4527, 'Cedula Fisica', 502220887, 'SEQUEIRA ROSALES MARIA SOLEIDA', 'C Cortés   Renacim. cs E1 verde.', 'Cel 8690-2915.', '8673-7492', ''),
(4528, 'Cedula Fisica', 602020331, 'SEQUEIRA SAMUDIO ANA ISABEL', 'SAN BUENA VENTURA  FTE. ALA PLAZA', 'DE FUTBOL. CANCELA  21 C/MS**', '7865440', ''),
(4529, 'Cedula Fisica', 603490110, 'SEQUEIRA SEGURA MARCOS', 'C Neily   Bº S Juan   diag antig pulp', 'Proovedora   cs c/madera. 8946-9762', '2783-1605', ''),
(4530, 'Cedula Fisica', 600870900, 'SEQUEIRA SEQUEIRA ADRIANA', 'GOLFITO   HOTEL GOLFITO O EN KMT', 'UNO CUARTA FILA CASA #4486. 16 C/M', '*-*-*-*', ''),
(4531, 'Cedula Fisica', 600870900, 'SEQUEIRA SEQUEIRA ADRIANA', 'GOLFITO KM.1 4TA FILA CASA', 'N. 4486', '', ''),
(4532, 'Cedula Fisica', 600870900, 'SEQUEIRA SEQUEIRA ADRIANA', 'GOLFITO KM.1 4TA FILA CASA', 'N. 4486', '7752007', ''),
(4533, 'Cedula Fisica', 104850056, 'SEQUEIRA SEQUEIRA ANA CECILIA', 'P. NORTE 50 M NORTE ASAMB. DE DIOS.', '', '8882-8630', ''),
(4534, 'Cedula Fisica', 600450419, 'SEQUEIRA SEQUEIRA CANDELARIA', 'C Cortés  Precario  cs azul fte pulp', 'Mari.', '8788-8213', ''),
(4535, 'Cedula Fisica', 106020246, 'SEQUEIRA SEQUEIRA CARMEN', 'GOLFITO KM 12  FREN.BAR LA RUEDA', 'LA MONA CASA MANO IZQUIERDA', '', ''),
(4536, 'Cedula Fisica', 501330253, 'SEQUEIRA SEQUEIRA ELADIO', 'LA CAMPIÑA DE LA ESC 50 Mts SUR O', 'EN CASA JOSE MATARRITA <P> 18 C/M', '', ''),
(4537, 'Cedula Fisica', 501330253, 'SEQUEIRA SEQUEIRA ELADIO', 'LA CAMPIÑA DE LA ESC 50 Mts SUR O', 'EN CASA JOSE MATARRITA <P> 18 C/M', '', ''),
(4538, 'Cedula Fisica', 501330253, 'SEQUEIRA SEQUEIRA ELADIO', 'LA CAMPIÑA DE LA ESC 50 Mts SUR O', 'EN CASA JOSE MATARRITA <P> 18 C/M', '', ''),
(4539, 'Cedula Fisica', 501330253, 'SEQUEIRA SEQUEIRA ELADIO', 'La Campiña contiguo a Iglesia Meto-', 'dista   casa verde.', '-', ''),
(4540, 'Cedula Fisica', 500620523, 'SEQUEIRA SEQUEIRA GREGORIA', 'GOLFITO EN CASA DE GERMAN OFICIAL', 'DE TRANSITO Bº VISTA..****', '7760104', ''),
(4541, 'Cedula Fisica', 501000891, 'SEQUEIRA SEQUEIRA JOSE P. CC FLACO', 'Palmar Sur  Fca 5   Diagonal Escuela.', '', '8878-5649', ''),
(4542, 'Cedula Fisica', 900250656, 'SEQUEIRA SEQUEIRA VICENTE', '', '', '', ''),
(4543, 'Cedula Fisica', 900210656, 'SEQUEIRA SEQUEIRA VICENTE', 'GOLFITO KM. 1 4TA FILA Nº 4490', '* CANCELA 3 C/M PENCION *', '7752487', ''),
(4544, 'Cedula Fisica', 900210656, 'SEQUEIRA SEQUEIRA VICENTE', 'Golfito   4ta fila Km 1 44-90', '2775-2487', '8946-4891', ''),
(4545, 'Cedula Fisica', 603150806, 'SEQUEIRA UREÑA MARISOL', 'B*BETANIA CANOAS ENTRADA PURISCAL', 'CASA 9* AMARILLA PREFABRICADA', '2732-2246', ''),
(4546, 'Cedula Fisica', 501210150, 'SEQUEIRA VEGA ROSA', 'JALACA 50 Mts NORTE DE LA ESCUELA', '<P> 06 C/M', '', ''),
(4547, 'Cedula Fisica', 140687862, 'SERMUCOOP COTO 63', 'COTO 63.', '', '', ''),
(4548, 'Cedula Fisica', 601870332, 'SERRACIN ALMENGOR FELIPE', 'La Palma   Super Corcobado', '', '3982422', ''),
(4549, 'Cedula Fisica', 600640127, 'SERRACIN CHAVES FRANCISCO', 'Golfito   Res Ureña   Fte al Parque', 'cs G-01.', '2775-1475', ''),
(4550, 'Cedula Fisica', 601080605, 'SERRACIN CHAVEZ SATURDINA', 'Fincas   Central Campesina   Pulp. La', 'Central.', '2781-1328', ''),
(4551, 'Cedula Fisica', 600590190, 'SERRACIN SERRACIN LEOCADIO', 'PTO JIMENEZDETRAS DELA IGLECIA CATO', 'AL ESTE.* CANCELA 13 C/MES *', '7355403', ''),
(4552, 'Cedula Fisica', 900280144, 'SERRACIN SERRACIN MARIO', 'Golfito  2º fila taller de tapicería', 'Telf: 2775-0771', '2775-1869', ''),
(4553, 'Cedula Fisica', 605060090, 'SERRANO ACOSTA JUAN', 'MANGO DE LAUREL 150 ESTE DE', 'PULP.EL CRUCE. 15 C/MES', '7800696', ''),
(4554, 'Cedula Fisica', 900620180, 'SERRANO CHAVES VILMA', 'Coto 54 detrás de planta cs 13110.', 'Cel 8996-3876.', '2781-1170', ''),
(4555, 'Cedula Fisica', 104140459, 'SERRANO CHAVES VILMA.', 'COTO 54 EN SODA DE LA PLANTA', 'ACEITERA.', '7833770', ''),
(4556, 'Cedula Fisica', 900620180, 'SERRANO CHAVEZ VILMA', 'Coto 54 en Soda la Planta.', '', '', ''),
(4557, 'Cedula Fisica', 900620180, 'SERRANO CHAVEZ VILMA', 'COTO 54 DETRAS DE LA PLANTA', 'Nº 13110 ** CANCELA 1 C/MES **', '8197125', ''),
(4558, 'Cedula Fisica', 303050998, 'SERRANO LOAIZA GERARDO EFRAIN.', 'COTO 47  DESPUES TEL PUBLIC ENTRADA', 'A SANSA LA 3era CASA.P.30 C/M', '', ''),
(4559, 'Cedula Fisica', 600640127, 'SERRASIN CHAVEZ FRANCISCO.', 'Golfito   Res. Ureña   fte al Parque.', 'Cs G-01.', '', ''),
(4560, 'Cedula Fisica', 600820386, 'SEVILLA AGUIRRE MIGUEL ANGEL', 'CIUDAD CORTES PULP. 5 ESQUINAS 150', 'MTS NOROESTE DE LA IGLESIA', '7888479', ''),
(4561, 'Cedula Fisica', 600820386, 'SEVILLA AGUIRRE MIGUEL ANGEL', 'C. CORTES 75 MTS N. DE PULP.', '5 ESQUINAS *CANCELA 21 C/MES *', '7888479', ''),
(4562, 'Cedula Fisica', 601050534, 'SEVILLA VARGAS MIRIAM', 'C Cortés   100 oeste oficina de Co-', 'rreos. cel 8557-6176.', '2788-7017', ''),
(4563, 'Cedula Fisica', 500560695, 'SIBAJA CORDERO GONZALO', 'pilon de pavones diagonal a pulperi', 'hns jimenez', '', ''),
(4564, 'Cedula Fisica', 601390390, 'SIBAJA CUBERO MARIA', 'GOLFITO KMT 3 CASA Nº 25', '', '7750590', ''),
(4565, 'Cedula Fisica', 603040734, 'SIBAJA GUERRA JOSE LUIS', 'Coto 50 entrada de la plaza casa', '# 10837 al fondo  ', '8556-4856', ''),
(4566, 'Cedula Fisica', 602210893, 'SIBAJA MONTIEL GILBERTH', 'RIO CLARO BºSAN RAMON ASENTAMIENTO', 'LOS MANGOS PARCELA 14 CANCELA 1 C/M', '7897338', ''),
(4567, 'Cedula Fisica', 501170036, 'SIBAJA RODRIGUEZ EFRAIN', '400mts adelante del campo de aterri', 'zaje de palmar sur', '7867145', ''),
(4568, 'Cedula Fisica', 201060012, 'SIBAJA RODRIGUEZ LUIS ANGEL', 'BAMBITO 1 KMT DE PLAZA CALLE A', 'CONTE <P> 15 C/M', '', ''),
(4569, 'Cedula Fisica', 201060012, 'SIBAJA RODRIGUEZ LUIS ANGEL', 'Bamito 1 km de plaza calle a Comte', '', '', ''),
(4570, 'Cedula Fisica', 201060012, 'SIBAJA RODRIGUEZ LUIS ANGEL', 'BAMBITO 1KM DE PLAZA CALLE A CONTE', 'CASA COLOR AMARILLA DESP. DEL PUENT', '7800483', ''),
(4571, 'Cedula Fisica', 202550389, 'SIBAJA RODRIGUEZ VICTOR', 'Km 20   300 mts antes de Pulp. la', 'Guaria casa a mano derecha.', '', ''),
(4572, 'Cedula Fisica', 502240402, 'SIBAJA SOLIS ALFREDO', 'Bambito de Laurel   Corredores.', '', '', ''),
(4573, 'Cedula Fisica', 501070166, 'SIBAJA SOLIS EMILCE', 'LAUREL CALLE A CAUCHO   CONTG. AL', 'PUENTE DE CEMENTO', '7800269', ''),
(4574, 'Cedula Fisica', 603480591, 'SIBAJA VILLARREAL SANDRA', 'CORTEZ B RENACIMIENTO CASA H9 CONTI', 'GUO  A PULPERIA EL RENCUENTRO', '7888534', ''),
(4575, 'Cedula Fisica', 602410906, 'SILES MADRIGAL HELEN', 'Golfito   La mona  pulp el Barrio en', 'entrada taller carrion   8630-7709', '', ''),
(4576, 'Cedula Fisica', 600780778, 'SILVA BARRIOS RAMON', 'Golfito   La Purruja   Ciud. Tuckler', 'Martínez. cc terracot Nº C18.', '2775-5072', ''),
(4577, 'Cedula Fisica', 600700657, 'SILVA CORTES BEATRIZ (BETTY)', 'PUERTO JIMENEZ URB. EL COLEGIO', 'CASA 12 A.', '', ''),
(4578, 'Cedula Fisica', 602580317, 'SILVA LOPEZ ANAYANCI', 'Laurel Centro   entrada al torno   cs', 'prefabricada c/natural.', '2780-1755', ''),
(4579, 'Cedula Fisica', 501290813, 'SIRIAS ALFARO IDALIA', 'GOLF PUEBLO CIVIL FRENTE A CANTINA', 'LA BOMBA <P> 03 C/M', '7750534', ''),
(4580, 'Cedula Fisica', 901030291, 'SIRIAS CAMPOS JOSE FELIX.', 'COTO 49  COSTADO OESTE DE LA PLAZA.', '', '', ''),
(4581, 'Cedula Fisica', 500930343, 'SIRIAS MEZA RAFAEL', 'GOLFITO   INVU LA ROTONDA CASA # 23', 'CONTG. A RADIO GOLF   <P> 03 C/M', '', ''),
(4582, 'Cedula Fisica', 500930343, 'SIRIAS MEZA RAFAEL', 'GOLFITO   INVU LA ROTONDA CASA # 23', 'CONTG. A RADIO GOLF   <P> 03 C/M', '', ''),
(4583, 'Cedula Fisica', 602210766, 'SIRIAS ROJAS VERONICA', 'Fca Alajuela   200 m escuela fte a', 'plaza de futbol. Cel:8730-5063', '8730-5062', ''),
(4584, 'Cedula Fisica', 602710883, 'SOCORRO SANDOVAL SONIA', 'P Jiménez ctro  fte llantera Marvin', 'Rodríguez. cc papaya   8636-5774.', '8508-2827', ''),
(4585, 'Cedula Fisica', 601640118, 'SOLANO CANALES FRANCISCO', 'Golfito   Civil   Fte abast. Laiz', '', '8694-4131', ''),
(4586, 'Cedula Fisica', 501210463, 'SOLANO CASTRO LUCAS', 'pto jimenez la palma soda la', 'esquina', '', ''),
(4587, 'Cedula Fisica', 501210463, 'SOLANO CASTRO LUCAS', 'La Palma   Jiménez   200 m Norte es-', 'quina plaza.', '2735-1539', ''),
(4588, 'Cedula Fisica', 603600900, 'SOLANO CERDAS DILCIA', 'Golfito  IMAS  Bº S Martín   Pulp. La', 'Familia. Cel 8547-8223.', '2775-1431', ''),
(4589, 'Cedula Fisica', 202070292, 'SOLANO CORDERO TEOFILA', 'LA MONA DE  PULP LOS PEJIVALLES 100', 'MTS A MANO DERECHA C. FONDO K-10', '7750514', ''),
(4590, 'Cedula Fisica', 402950391, 'SOLANO LOPEZ ROSA EMILIA', 'CHACARITA ANTIGUO PLANTEL DEL MOP', '', '7411113', ''),
(4591, 'Cedula Fisica', 601390757, 'SOLANO RAMIREZ GUARIA', 'SALAS VINDAS   CUIDAD NEILY', '', '7833749', ''),
(4592, 'Cedula Fisica', 106690620, 'SOLANO SOLANO RAFAEL', 'LA CUESTA DEL COMANDO HACIA EL', 'CHORRO CASA DE CEMENTO', '', ''),
(4593, 'Cedula Fisica', 106690620, 'SOLANO SOLANO RAFAEL', 'La Cuesta  Calle al Chorro 1km coman', 'dancia. Cel 8822-9170.', '2732-3769', ''),
(4594, 'Cedula Fisica', 600650143, 'SOLERA CAMPOS REINIER', 'Palmar  Puerta del Sol  Bº Sant Maria', '', '2786-3170', ''),
(4595, 'Cedula Fisica', 603700178, 'SOLIS ARAYA ERICK', 'San Vito   Las Huacas   cabina Nº 2', '8575-9242', '6057-3203', ''),
(4596, 'Cedula Fisica', 101850823, 'SOLIS BADILLA DOLORES GLADYS', 'ZANCUDO EN VENTA DE ACEITE DE COCO', 'ANTES DE RANCHO EL COQUITO', '', ''),
(4597, 'Cedula Fisica', 202110010, 'SOLIS BARQUERO GUILLERMO', '', '', '', ''),
(4598, 'Cedula Fisica', 110670954, 'SOLIS BARRANTES JHONNY', 'Palmar Sur   250 este Estadio en ta-', 'ller de Coco Solís.', '8317-2354', ''),
(4599, 'Cedula Fisica', 110670954, 'SOLIS BARRANTES JOHNNY', 'P.SUR 25 O ESTADIO 2ºENT cll s/sali', 'da. Trab Taller 11 abril hcia Pulp.', '3172354', ''),
(4600, 'Cedula Fisica', 102760236, 'SOLIS CALDERON ELEAQUIN', 'PASO CANOAS   EN LA ENTRADA AL TAJO', '', '', ''),
(4601, 'Cedula Fisica', 104840605, 'SOLIS CALDERON LETICIA', 'LA CUESTA DEL COLEGIO 600 Mts SUR', 'MANO DERECHA <P> 25 C/M', '7322091', ''),
(4602, 'Cedula Fisica', 103470732, 'SOLIS CALDERON MIRIAM', '', '', '', ''),
(4603, 'Cedula Fisica', 103407732, 'SOLIS CALDERON MIRIAM', 'GOLFITO. LA ROTONDA BARRIO SAN JUAN', 'DETRAS DEL COLEGIO 2do. PUENTE', '7750467', ''),
(4604, 'Cedula Fisica', 600650213, 'SOLIS CARRANZA CARMEN LUISA', 'CIUDAD CORTES INVU CASA Nº19', '', '7888634', ''),
(4605, 'Cedula Fisica', 600650213, 'SOLIS CARRANZA CARMEN LUISA', 'cortes   I.N.V.U. CASA No 19', '', '', ''),
(4606, 'Cedula Fisica', 600650213, 'SOLIS CARRANZA CARMEN LUISA', 'Cortes   INVU CASA No 19', '', '8524-1397', ''),
(4607, 'Cedula Fisica', 602800263, 'SOLIS CERDAS VICTOR JULIO', 'S Vito   Urb Pioneros   cs 46.', '', '8946-4533', ''),
(4608, 'Cedula Fisica', 500980716, 'SOLIS CORTES CECILIA', 'LAUREL DE LA ANTIGUA BAR TABERNA', '2DA CASA BLANCA YUPLON', '2780-0023', ''),
(4609, 'Cedula Fisica', 601810298, 'SOLIS GUERRERO JOSE LUIS', '', '', '', ''),
(4610, 'Cedula Fisica', 201380354, 'SOLIS MARIN LUZ MARIA', 'CIUDAD CORTES Bº LA LAGUNA', '* FECHA DE PAGO  08 CADA MES *', '7888913', ''),
(4611, 'Cedula Fisica', 101020634, 'SOLIS SANCHEZ DOMINGO', 'GOLFITO KM 20 ENTRADA A', 'PULPERIA LA GUARIA', '', ''),
(4612, 'Cedula Fisica', 101020634, 'SOLIS SANCHEZ DOMINGO', 'GOLFITO KM 20 ENTRADA A PULPERIA LA', 'GUARIA.', '8325541', ''),
(4613, 'Cedula Fisica', 602260696, 'SOLIS UGALDE LUIS GUILLERMO.', 'LA ESPERANZA DE RIO CLARO A UN COS-', 'TADO DE LA PLAZA  CASA BEIGE. 16C/M.', '', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(4614, 'Cedula Fisica', 601320649, 'SOLIS VASQUEZ ALICIA', 'PUERTO JIMENEZ   DETRAS DEL ANGAR', 'CASA DE MADERA', '', ''),
(4615, 'Cedula Fisica', 601001287, 'SOLORZANO CORRALES ANA LIA', 'CIUDAD NEILY.', '', '', ''),
(4616, 'Cedula Fisica', 601001287, 'SOLORZANO CORRALES ANA LIA', 'CIUDAD NEILY.', '', '', ''),
(4617, 'Cedula Fisica', 600910093, 'SOLORZANO CORRALES CECILIO', 'COTO 49   Por los tanques de agua', '', '7811405', ''),
(4618, 'Cedula Fisica', 600910093, 'SOLORZANO CORRALES CECILIO', 'COTO 49 POR LOS TANQUES DE AGUA', '', '7811405', ''),
(4619, 'Cedula Fisica', 601420778, 'SOLORZANO MONGE ANTONIO', 'Las Fincas; coto 47 segunda casa', 'entrando.', '', ''),
(4620, 'Cedula Fisica', 203420639, 'SOLORZANO MORA CARMEN LIDIA', 'pto jimenez zandalo 50 oeste de', 'pulperia burumbun', '', ''),
(4621, 'Cedula Fisica', 601030197, 'SOLORZANO QUESADA BELARMINA', 'Bº UREÑA D` TEL PUBL 50 MANO DEREC', 'Y 75 M IZQ PULP MINITA <P> 16 C/M', '7751872', ''),
(4622, 'Cedula Fisica', 201900734, 'SOLORZANO QUESADA MARCO TULIO', 'LAUREL   FRENTE A MOTO REPUESTO LORA', '<P> 30 C/M', '', ''),
(4623, 'Cedula Fisica', 200210703, 'SOLORZANO SALAS ALEXANDER', 'VANEGAS LA PALMA  PTO JIMENEZ', '** CANCELA 11 CADA MES **', '', ''),
(4624, 'Cedula Fisica', 602780566, 'SOMARIVAS UMAÑA YESENIA', 'P Canoas   Veracruz   cs 83.', '', '8791-9351', ''),
(4625, 'Cedula Fisica', 500930421, 'SOSA CASTRO DIMAS', 'SANTA LUCIA 200 Mts AL N DE PULP', 'CASA COLOR CELESTE. <P> 20 C/M', '', ''),
(4626, 'Cedula Fisica', 500930420, 'SOSA CASTRO DIMAS', 'SANTA LUCIA 200 MTS NORTE DE', 'ESCUELA ...', '7800217', ''),
(4627, 'Cedula Fisica', 501040739, 'SOSA CASTRO HORTENSIA', 'Langostino de Pavones   600m sur Es-', 'cuela.', '8745-5761', ''),
(4628, 'Cedula Fisica', 500760375, 'SOSA CASTRO VICTOR', 'Santa Lucía de Comte   100m norte I-', 'glesia Católica. Cel 8716-7998.', '2780-0193', ''),
(4629, 'Cedula Fisica', 601620736, 'SOTO  OCAMPO ELIZABET', 'FRENTE AL BAR LAS CARRETAS', '', '7838070', ''),
(4630, 'Cedula Fisica', 201140847, 'SOTO AGUILAR ANTONIO', 'CORTES OJO DE AGUA FTE A EBAIS', '', '7888516', ''),
(4631, 'Cedula Fisica', 202590772, 'SOTO CHAVEZ ANGELA', 'CORTES CONTIGUO AL COLEGIO', '', '2788-8619', ''),
(4632, 'Cedula Fisica', 202780647, 'SOTO CHAVEZ MARIA CECILIA', 'C.CORTES CONTIG. AL COLEGIO.', '* 21 C/MES *', '', ''),
(4633, 'Cedula Fisica', 601070781, 'SOTO ELIZONDO CECILIA', 'CORTES', '', '', ''),
(4634, 'Cedula Fisica', 601410145, 'SOTO FUENTES MIRIAM', 'C Neily   Res Salas Vindas.', '50m NO rest Wen Sun.', '8943-3763', ''),
(4635, 'Cedula Fisica', 601250304, 'SOTO GUZMAN JAVIER', 'LA CAMPIÑA DE LA PLAZA 1200 Mts SUR', 'CASA CEMENTO <P> 20 C/M', '', ''),
(4636, 'Cedula Fisica', 600950433, 'SOTO GUZMAN MARCOS', '400 Mts SUR DE LA PLAZA CASA MIXTA', 'A MANO DERECHA <P> 20 C/M', '*-*-*-*', ''),
(4637, 'Cedula Fisica', 602600309, 'SOTO HERRERA ANA YANCI', 'PTO JIMENEZ EL BAMBU DE LA PULP LA', 'AMISTAD 100MTS PANADERIA 8850/4987', '2735-5419', ''),
(4638, 'Cedula Fisica', 603590629, 'SOTO QUINTERO KAREN', 'C Neily   Las Palmas   siguiente casa', 'de la Platanera.', '8747-4759', ''),
(4639, 'Cedula Fisica', 600950659, 'SOTO RODRIGUEZ AIDA', '200 MTS OESTE DE LA PLAZA DE', 'DEPROTES DE PUERTO JIMENEZ', '7355261', ''),
(4640, 'Cedula Fisica', 603420882, 'SOTO ROJAS ANA YANCI', 'P Jiménez  Gallardo  300 m de Pulp.', 'Eurekita. Cel 8616-0421.', '8515-3640', ''),
(4641, 'Cedula Fisica', 401120710, 'SOTO SANABRIA RUBEN', 'RIO CLARO ENTRADA AL GUABO FRET', 'A PULP SAN CAYETANO', '7899097', ''),
(4642, 'Cedula Fisica', 602010583, 'SOTO SANCHEZ ESTER', 'Veracruz   casa Nº 6', '', '8608-3524', ''),
(4643, 'Cedula Fisica', 601460040, 'SOTO SANCHEZ MARGARITA', 'RIO CLARO SAN RAMON DETRAS DE ESCUE', '200 MTS OESTE ÚLTIMA CASA *1 C/MES*', '', ''),
(4644, 'Cedula Fisica', 600850965, 'SOTO UMAÑA ANASTACIO', 'P Jiménez   150 Sur Bomba AYA.', 'Cel 8505-2201.', '2206-5096', ''),
(4645, 'Cedula Fisica', 600760756, 'SOTO UMAÑA BIENVENIDA', 'PUERTO JIMENEZ   BOCA GALLARDO', '100 METROS SUR DE LA ESCUELA', '', ''),
(4646, 'Cedula Fisica', 600760756, 'SOTO UMAÑA BIENVENIDA', 'P Jiménez  Boca Gallardo  60m Sur de', 'la Escuela. Cel 8751-4358.', '8658-2264', ''),
(4647, 'Cedula Fisica', 603290027, 'STELLER FALLAS MAURICIO', 'La Palma de Pto jimenez de la escue', 'la 200 mts Este y 50 Norte.', '7351608', ''),
(4648, 'Cedula Fisica', 603290027, 'STELLER FALLAS MAURICIO', 'P Jiménez   La Palma   200m E 50m N', 'Escuela. Madre Soda Nallely.', '2735-1066', ''),
(4649, 'Cedula Fisica', 601010870, 'SUARES RIVAS NORMA', 'GOLFITO BELLA VISTA CASAN. 4449', 'TRAB. EN EL HOSPITAL', '7750480', ''),
(4650, 'Cedula Fisica', 270584482, 'SUAREZ OROZCO ENCARNACION', 'CAUCHO DE LAUREL CASA No.19 FRENTE', 'A LA ESCUELA A COSTADO DE LA PLAZA', '2780-0502', ''),
(4651, 'Cedula Fisica', 600940508, 'SUAREZ OROZCO OLGA', 'Caucho   1km Oeste Club de trabaj', 'Finca Caucho      2780-0571', '8546-0717', ''),
(4652, 'Cedula Fisica', 601010870, 'SUAREZ RIVAS NORMA', 'Golfito; SOLAMENTE COBRAR EN EL', 'HOSPITAL.', '', ''),
(4653, 'Cedula Fisica', 601010870, 'SUAREZ RIVAS NORMA', 'GOLFITO HOSP.O EN Km 1 1era FILA', 'CASA # 4449 P.08 Y 22 C/M', '755-', ''),
(4654, 'Cedula Fisica', 602560709, 'SUAREZ VARGAS LUIS ALBERTO', 'PIEDRAS BLANCAS FRET A CASAS DE', 'COOPERATIVA <P> 19 C/M', '', ''),
(4655, 'Cedula Fisica', 104250743, 'TAPIA ALVARADO MARIA ALBERTINA', 'PLAYA ZANCUDO DE FERRETERIA 130 SUR', '* CANCELA 13 CADA MES *', '', ''),
(4656, 'Cedula Fisica', 102100668, 'TAPIA FALLAS JUAN', 'LA VIQUILLA  3 KMT 29 300 MTS', 'MANO. IZQUIERAD DE LA ESCUELA', '', ''),
(4657, 'Cedula Fisica', 102100668, 'TAPIA FALLAS JUAN MATIAS (C.C.JUAN)', 'KM 30 L´ LOTES 150 MTS OEST. DE PUL', 'PAJARO AZUL P.16 C/M.', '', ''),
(4658, 'Cedula Fisica', 601580076, 'TAPIA TREJOS ROSA', '', '', '', ''),
(4659, 'Cedula Fisica', 600700858, 'TAPIA ZUÑIGA JUAN', 'Pavones   Pilón 2km antes MI.', '', '8985-3990', ''),
(4660, 'Cedula Fisica', 602410123, 'TAYLOR FRANCO AURORA', 'PASO CANOAS ENTRADA CONTG. AL', 'MALINCHE** FECHA DE PAGO 15 C/MES**', '7321926', ''),
(4661, 'Cedula Fisica', 602410123, 'TAYLOR FRANCO AURORA', 'PASO CANOAS ENTRADA CONTG. AL', 'MALINCHE ** CANCELA 15 C/MES **', '7321926', ''),
(4662, 'Cedula Fisica', 603130158, 'TAYLOR FRANCO NERI GLORIELA', 'LA CUESTA ENTRADA CONTIGUO AL', 'MALINCHE FECHA DE DE PAGO 15 C/MES', '7322323', ''),
(4663, 'Cedula Fisica', 600480266, 'TEJADA BATISTA HERNAN', 'Pto JIMENEZ   DIAGONAL BOMBA OSA', '<P> 11 C/M', '7355270', ''),
(4664, 'Cedula Fisica', 600480266, 'TEJADA BATISTA HERNAN', '150mts ESTE DEL SUPER BM CARRETERA', 'A KARATE', '7355583', ''),
(4665, 'Cedula Fisica', 900390671, 'TELLES CUBILLO CELEDONIA', 'La Palma   calle a cerrito; 800 m de', 'Almacén la Palma.', '', ''),
(4666, 'Cedula Fisica', 700260381, 'TELLES PEÑA GERARDO.', 'KILOMETRO 1 FRENTE A LA ESCUELA CA-', 'SA.N.4462.', '775', ''),
(4667, 'Cedula Fisica', 700260381, 'TELLEZ PEÑA GERARDO', 'Golfito   Km 1 segunda F frent esc', 'casa Nº 4462 2775-1685', '', ''),
(4668, 'Cedula Fisica', 602970652, 'TELLO FUENTES VIRGINIA', 'P Jiménez   Cañaza  1km este hacia la', 'playa.', '8766-9742', ''),
(4669, 'Cedula Fisica', 601620484, 'TELLO NUÑEZ JOSE', '', '', '', ''),
(4670, 'Cedula Fisica', 602270847, 'TENORIO CORTES JORGE', 'San Juan de 4 bocas   de la Cuesta', '1 km sur de la Escuela Labrador', '', ''),
(4671, 'Cedula Fisica', 601600734, 'TENORIO OBANDO JUAN', 'LA MONA GOLFITO FTE FINCA', 'HASTECOS', '7756204', ''),
(4672, 'Cedula Fisica', 601660317, 'TENORIO SEGURA CARMEN', 'Laurel   200m calle a Peral por la', 'antigua Bananera. 8658-5193.', '2780-0228', ''),
(4673, 'Cedula Fisica', 602000807, 'THOMPSON CUBILLO JOSE LUIS', 'Laurel  Vereh   1km norte fca Caimito', '', '8896-0270', ''),
(4674, 'Cedula Fisica', 500860556, 'TIFFER CHAVEZ ADELA', 'GOLFITO B. SAN JUAN   DETRAS DEL', 'COLEGIO', '7751974', ''),
(4675, 'Cedula Fisica', 500860556, 'TIFFER CHAVEZ ADELA', 'GOLFITO DETRAS DEL COLE', '** CANCELA 03 C/MES', '', ''),
(4676, 'Cedula Fisica', 500860556, 'TIFFER CHAVEZ ADELA', 'Golfito  Bº S juan detr colegio del', 'Puente a M/D al fondo 8720-4194', '8869-9829', ''),
(4677, 'Cedula Fisica', 601530507, 'TIJERINO CORTES WILDAN', 'PTO JIMENEZ LA CAÑASA O EN GOLFI..', 'A 11 C/MES', '8447538', ''),
(4678, 'Cedula Fisica', 601530507, 'TIJERINO CORTES WILDAN', 'CAÑAZA  ESCUELA 1K A NORT CARRETERA', 'DIREC A FINAL PORTON ROJO O MUELLE', '8844-7538', ''),
(4679, 'Cedula Fisica', 800610747, 'TIJERINO LOPEZ MARIA TERESA', 'Laurel   Bambito   Costado Sur de la', 'entrada a la Escuela. Cel 8819-3842', '2780-1771', ''),
(4680, 'Cedula Fisica', 601550315, 'TIJERINO SIRIAS ROBERTO', 'GOLF i.c.e.', '', '', ''),
(4681, 'Cedula Fisica', 601550315, 'TIJERINO SIRIAS ROBERTO', 'GOLF i.c.e.', '', '', ''),
(4682, 'Cedula Fisica', 601550315, 'TIJERINO SIRIAS ROBERTO', 'GOLF Bº BELLA VISTA FRENTE', 'AL ESTADIO.', '*-*-*-*', ''),
(4683, 'Cedula Fisica', 601550315, 'TIJERINO SIRIAS ROBERTO', 'GOLF i.c.e.', 'COBRAR EL 16 DE CADA MES.', '7750538', ''),
(4684, 'Cedula Fisica', 601550315, 'TIJERINO SIRIAS ROBERTO', 'Golfito   Bº Bella Vista frente', 'al estadio', '7750538', ''),
(4685, 'Cedula Fisica', 600951414, 'TORRENTE CARRILLO RIGOBERTO', 'LA CAMPIÑA   1 KMT NORTE DE LA', 'ESCUELA DE L ACAMPIÑA.', '', ''),
(4686, 'Cedula Fisica', 600951414, 'TORRENTE CARRILLO RIGOBERTO', 'LA CAMPIÑA   1 KMT NORTE DE LA', 'ESCUELA DE L ACAMPIÑA.', '', ''),
(4687, 'Cedula Fisica', 500680143, 'TORRES  CALDERON BEATRIZ', '', '', '', ''),
(4688, 'Cedula Fisica', 280759493, 'TORRES ALMENGOR OLGA', '', '', '8747-4813', ''),
(4689, 'Cedula Fisica', 101900408, 'TORRES BERMUDEZ AUDILIO', 'LA VIRGEN DE COMTE', '', '', ''),
(4690, 'Cedula Fisica', 101920408, 'TORRES BERMUDEZ AUDILIO', 'LA FORTUNA DE PAVONES', '', '7801472', ''),
(4691, 'Cedula Fisica', 501900164, 'TORRES BERMUDEZ IDALY', 'JARDIN DE CONTE   Cs fte a Escuela.', 'La Esperanza. Enid Ortega Torres.', '8517-5303', ''),
(4692, 'Cedula Fisica', 601240955, 'TORRES BERMUDEZ MARIA LUZ', 'Golfito   El Civil   fte Acueductos  ', 'cc blanca   porton blanco.', '8663-9068', ''),
(4693, 'Cedula Fisica', 102200451, 'TORRES DOBLES EXPEDITO', 'RIO BONITO   FRENTE A LA PLAZA', '', '7834170', ''),
(4694, 'Cedula Fisica', 602460400, 'TORRES DURAN ANGELA', 'LAUREL FINCA CAUCHO   DIAGONAL A LA', 'PLAZA DE DEPORTES.', '7355723', ''),
(4695, 'Cedula Fisica', 601160506, 'TORRES DURAN ANTONIA', 'MUNICIPALIDAD GOLF. O CONTG A PULP', 'ADELACAN. <P> 03 Y 16 C/M', '7750302', ''),
(4696, 'Cedula Fisica', 601160506, 'TORRES DURAN ANTONIA', 'GOLFITO MUNICIP. O CONTG. A', 'PULPERIA ADELACAN', '7750302', ''),
(4697, 'Cedula Fisica', 900790836, 'TORRES GOMEZ AIDEE', 'B` 22 DE OCTUBRE CASA # 13 BLOQUE F', 'P. 15 DE C/M', '', ''),
(4698, 'Cedula Fisica', 155805921, 'TORRES GUZMAN IMELDA', 'Golfito   Bo LLano Bonito c.4911', 'o chinamo refre entrada deposito', '2775-1754', ''),
(4699, 'Cedula Fisica', 101870834, 'TORRES HERRERA ARCENIO', '', '', '', ''),
(4700, 'Cedula Fisica', 102860061, 'TORRES JIMENEZ FERMIN', 'Laurel   Jobo Antigua La Campesina', 'fte Tel. Público.', '2780-1186', ''),
(4701, 'Cedula Fisica', 603390446, 'TORRES LEAL BAIRON BRUS', 'P. Blancas   Villas del Sur casa 142', '', '8968-8982', ''),
(4702, 'Cedula Fisica', 602820424, 'TORRES MARIN CARLOS', 'Rio Claro Km 30 frente entrada', 'trogones 300 Mts E. 8427-4603', '8967-4294', ''),
(4703, 'Cedula Fisica', 602750947, 'TORRES NAVAS YORLENNY', 'Las Alturas de Coton   Diagonal a la', 'Fonda   8716-7030', '8517-8595', ''),
(4704, 'Cedula Fisica', 102220451, 'TORRES ROBLES EXPEDITO', 'CIUDAD NEILY   RIO BONITO', 'CONTIGUOA A LA PLAZA', '', ''),
(4705, 'Cedula Fisica', 102200451, 'TORRES ROBLES EXPEDITO', 'RIO BONITO FRENTE A LA PLAZA', '', '7834170', ''),
(4706, 'Cedula Fisica', 104650784, 'TORRES SOTO CARLOS ALBERTO', '', '', '', ''),
(4707, 'Cedula Fisica', 602370032, 'TORRES SUAREZ CARLOS LUIS', 'R Claro   bambel 2  500 E   Esc Brunca', 'Cte Paga en San Vito  2789-7295', '8884-3372', ''),
(4708, 'Cedula Fisica', 602450239, 'TORRES TORRES ENRIQUE CC MARLON', 'La Escuadra de Comte   Casa 51.', 'Guaymí Pulpería.', '2762-2609', ''),
(4709, 'Cedula Fisica', 602150259, 'TORRES TORRES SANTOS', '', '', '', ''),
(4710, 'Cedula Fisica', 600530637, 'TORRES VALLEJOS TOMAS', 'ESPERANZA DE SABALO FTE', 'A LA ENTRADA DE LA ESCUADRA', '7768007', ''),
(4711, 'Cedula Fisica', 601310832, 'TORREZ ORTIZ FLOR', 'Bº lourdes 800 M entrada S  Teresa', 'Cs Madera Color Crema.2784-0042', '8348-1177', ''),
(4712, 'Cedula Fisica', 501481216, 'TREJOS ARAYA SERBULO', '', '', '', ''),
(4713, 'Cedula Fisica', 603630168, 'TREJOS ARIAS DANNY', 'F.C.A 2-4 ENTRANDO EN LA SEGUNDA', 'CASA   TRABAJA EN CONTRUCCION.', '8633-9978', ''),
(4714, 'Cedula Fisica', 601420012, 'TREJOS CALDERON LUIS ANGEL', 'NO CONSTA', '', '', ''),
(4715, 'Cedula Fisica', 102130434, 'TREJOS CALDERON SOCORRO', 'CONTROL DE LA CUESTA CASA DERECHA', 'ANTES DE LLEGAR AL PUENTECITO', '', ''),
(4716, 'Cedula Fisica', 103180979, 'TREJOS ESPINOZA MANUEL', 'Cañaza   1 km de Testigos de Jehová', '', '', ''),
(4717, 'Cedula Fisica', 103180979, 'TREJOS ESPINOZA MANUEL', 'CAÑASA 1KM DE TESTIGO DE JEHOVA', '**  CANCELA 11 C/MES **', '8385-8001', ''),
(4718, 'Cedula Fisica', 600000000, 'TREJOS HERRERA BERNARDO', 'FINCA JALACA DEL TELEF PUBLICO', 'DE LA PULP 1300 MTS CASA BLANCA', '7833588', ''),
(4719, 'Cedula Fisica', 102990476, 'TREJOS JIMENEZ SOR MARIA', 'Sabalito  100 Oest plaza Bº S Rafael', 'Cs Al fondo Amarilla. 2784-0357', '', ''),
(4720, 'Cedula Fisica', 602830668, 'TREJOS LEIVA GEOVANNY', 'Golfito   Km 20 Pulp   La Guaria', '2789-9749', '8756-0401', ''),
(4721, 'Cedula Fisica', 501450020, 'TREJOS MUÑOZ PAULINO.', 'CAUCHO 1Kmt CALLE A TAMARINDO CASA', 'MANO IZQ PARCELA # 30 <P> 30 C/M', '', ''),
(4722, 'Cedula Fisica', 600940506, 'TREJOS PRENDAS JUANA INES', 'RIO CLARO CONTIGUO A PULP', 'EL CORRAL', '7899704', ''),
(4723, 'Cedula Fisica', 501490778, 'TREJOS VILLALOBOS HUGO', 'PALMAR NORTE LICORERA PROWIN', '<P> 06 C/M', '786', ''),
(4724, 'Cedula Fisica', 501490778, 'TREJOS VILLALOBOS HUGO.', 'PALMAR NORTE   LICORERA PROWIN.', '', '756170', ''),
(4725, 'Cedula Fisica', 102960368, 'TREJOS ZUÑIGA CARMEN', 'KILOMETRO 37   CONTG A RIO ORO.', '', '775', ''),
(4726, 'Cedula Fisica', 502530884, 'TRIGUEROS MORERA MARIZETH', 'C.Neily Soda Cori contiguo al Dolar', '', '8942-8161', ''),
(4727, 'Cedula Fisica', 602260469, 'TRUJILLO QUINTERO FERNANDO', 'CEIBO ENT.HOGAR DE ANCIANOS 2º CASA', 'LLAMAR AL 8819-3623 PAGA OFICINA.', '8819-3623', ''),
(4728, 'Cedula Fisica', 601990737, 'TRUJILLO QUINTERO RODRIGO', 'La Cuesta 400m Sur del Colegio fte', 'cs Loco Vargas. Cel Cel 8741-8548.', '2732-3442', ''),
(4729, 'Cedula Fisica', 270170141, 'UBEDA RUGAMA DAVID', 'Viquilla Nº 1;', '', '', ''),
(4730, 'Cedula Fisica', 270170141, 'UBEDA RUGAMA PETRONILA.', 'VIQUILLA Nº1  DIAGONAL A LA IGLESIA', 'ASAMBLEAS DE DIOS.P-16 C/M.', '', ''),
(4731, 'Cedula Fisica', 270170141, 'UBEDA RUGAMA PETRONILA.', 'VIQUILLA Nº1  DIAGONAL A LA IGLESIA', 'ASAMBLEAS DE DIOS.P-16 C/M.', '', ''),
(4732, 'Cedula Fisica', 270170141, 'UBEDA RUGAMA PETRONILA.', 'VIQUILLA Nº1  DIAGONAL A LA IGLESIA', 'ASAMBLEAS DE DIOS.P-16 C/M.', '', ''),
(4733, 'Cedula Fisica', 270170141, 'UBEDA RUGAMA PETRONILA.', 'VIQUILLA Nº1  DIAGONAL A LA IGLESIA', 'ASAMBLEAS DE DIOS.P-16 C/M.', '', ''),
(4734, 'Cedula Fisica', 201900451, 'UGALDE CAMACHO ELIETH', '', '', '', ''),
(4735, 'Cedula Fisica', 501530382, 'UGALDE CAMPOS JORGE ANTONIO', 'km.36 la julieta entrada santiago', '', '', ''),
(4736, 'Cedula Fisica', 501530382, 'UGALDE CAMPOS JORGE ANTONIO', 'KM 37 LA JULIETA ENTRADA SANTIAGO', '* CANCELA 11 CADA MES *', '', ''),
(4737, 'Cedula Fisica', 502420762, 'UGALDE G MARIA ISABEL', 'P Jiménez  Palo Seco detrás Iglesia', 'Católica. Cel 8657-8441.', '8949-3677', ''),
(4738, 'Cedula Fisica', 502420762, 'UGALDE GOMEZ MARIA ISABEL', 'PALO SECO DE PUERTO JIMENEZ', 'DETRAS DE IGLESIA CATOLICA MANO IZQ', '', ''),
(4739, 'Cedula Fisica', 500890467, 'UGALDE HERRERA RAFAEL', 'Fca GUANC P EN OFICINA DE', 'COOPEFUTURO R.L. <P> 19 C/M', '3807317', ''),
(4740, 'Cedula Fisica', 500890467, 'UGALDE HERRERA RAFAEL', 'Finca Guanacaste de la Escuela 400m', 'al oeste.', '', ''),
(4741, 'Cedula Fisica', 500890467, 'UGALDE HERRERA RAFAEL', 'Fca Guanacaste   400 oeste Escuela', '', '2786-3072', ''),
(4742, 'Cedula Fisica', 602040586, 'UGALDE MORA WALTER', 'Laurel  Comte   500m Sur Super Comte.', 'Cel 8808-7370', '2776-8129', ''),
(4743, 'Cedula Fisica', 170460979, 'UGALDE MORALES SHIRLEY', 'Fca GUANC CONTG A ABASTECEDOR', 'COOPEFUTURO R.L. <P> 19 C/M', '*-*-*-*', ''),
(4744, 'Cedula Fisica', 603110488, 'UGALDE VILLALOBOS CINDY', 'S Vito  Las brisas 250 S   de palenqu', 'Cs cemento papaya M/D   8548-8511', '8650-8638', ''),
(4745, 'Cedula Fisica', 601310938, 'UGARTE BONILLA JOSE MANUEL(CALAMAN)', 'Km 1 HOSP. GOLF. CITAS CONTIGUO A', 'FARMACIA.', '', ''),
(4746, 'Cedula Fisica', 601430620, 'UGARTE VILLALTA MARVIN', 'Laurel  Km31  150 oeste de Escuela.', 'Cel 8792-5750.', '2780-0065', ''),
(4747, 'Cedula Fisica', 107400295, 'ULATE MACHADO ERMINIA', 'MOTEL LAS VEGAS O FRENTE A PARADAS', 'DE TAXIS', '7835553', ''),
(4748, 'Cedula Fisica', 107400295, 'ULATE MACHADO HERMINIA', 'CIUDAD NEILY', 'CONTIGUO A PANADERIA EL AGUILA', '', ''),
(4749, 'Cedula Fisica', 501920089, 'ULATE ROJAS MARLENY', 'la cañaza pto jimenez pulperia diag', 'onal a la plaza', '7708200', ''),
(4750, 'Cedula Fisica', 500970345, 'ULATE SILVA MAXIMA MATILDE', 'Bº Carmen de Abrojo   antiguo bar la', 'Flor.', '', ''),
(4751, 'Cedula Fisica', 500970345, 'ULATE SILVA MAXIMA MATILDE', 'Bº Carmen de Abrojo   antiguo bar la', 'Flor.', '', ''),
(4752, 'Cedula Fisica', 500970345, 'ULATE SILVA MAXIMA MATILDE', 'Carmen de Abrojo   Antiguo Bar la', 'Flor.', '', ''),
(4753, 'Cedula Fisica', 500970345, 'ULATE SILVA MAXIMA MATILDE', 'Carmen de Abrojo   contiguo Maderín', 'desp. puente.', '8313-3933', ''),
(4754, 'Cedula Fisica', 500970345, 'ULATE SILVA MAXIMA MATILDE', 'C Neily   contiguo a Maderín Eco.', '', '8313-3933', ''),
(4755, 'Cedula Fisica', 108060731, 'ULLOA MADRIZ GUILLERMINA', 'COOPERATIVA DE COTO 63', 'CASA Nº 15488', '7899784', ''),
(4756, 'Cedula Fisica', 302070049, 'ULLOA MORALES MARIA ELENA', 'GOLFITO   RESIDENCIAL UREÑA X EL', 'PARQUESITO U HOSPITAL GOLFITO', '7751211', ''),
(4757, 'Cedula Fisica', 302070049, 'ULLOA MORALES MARIA ELENA', 'Golfito   Residencial Ureña Casa Y4.', '', '7751211', ''),
(4758, 'Cedula Fisica', 109220057, 'UMAÑA ARROYO CARLOS ENRIQUE', 'CAÑAZO AUN COSTADO DE LA PLAZA PULE', 'RIA 8756/2323', '8756-0975', ''),
(4759, 'Cedula Fisica', 601380033, 'UMAÑA ATENCIO IDALIE', 'GOLFITO Bº PARROQUIAL CASA 4519', '<P>  PAGO BISEMANAL', '', ''),
(4760, 'Cedula Fisica', 602210926, 'UMAÑA ATENCIO OLMAN', 'Ciudad Neilly La Colina 100 mts', 'oeste Carniceria c. la Cuevita #1', '', ''),
(4761, 'Cedula Fisica', 202310828, 'UMAÑA BRENES MIGUEL ANGEL.', 'ENTRADA DE BELLO HORIENTE AGUA', 'BUENA COTO BRUS.', '', ''),
(4762, 'Cedula Fisica', 201530728, 'UMAÑA CAMPOS CARLOS', '', '', '', ''),
(4763, 'Cedula Fisica', 201530728, 'UMAÑA CAMPOS CARLOS', 'GOLFITO   PURRUJA DE PULP PEJIVALLE', '300 MTS M.DEREC KMT 8 ENTRADA ULT C', '7750215', ''),
(4764, 'Cedula Fisica', 601710560, 'UMAÑA CEDEÑO MARTA', 'CARACOL DE LA VACA CONTIG. A LA', 'PULP.', '7838227', ''),
(4765, 'Cedula Fisica', 602120688, 'UMAÑA FERNANDEZ WILLIAM', 'Golfito   Cerro Adam', '', '8767-3927', ''),
(4766, 'Cedula Fisica', 601081262, 'UMAÑA JIMENEZ ELOIZA', '', '', '', ''),
(4767, 'Cedula Fisica', 609510290, 'UMAÑA MENDEZ JESUS OTON', 'RIO CLARO BAMBEL 1   700 M DE PULP.', 'LOCAL POR LA IGLESIA.', '7897842', ''),
(4768, 'Cedula Fisica', 600951290, 'UMAÑA MENDEZ JESUS OTON', 'R Claro   Bambel 1   800 de Pulp. El', 'Jardín. Cel 8781-9319.', '2789-8162', ''),
(4769, 'Cedula Fisica', 600710712, 'UMAÑA MORA CARLOS LUIS', 'GOLFITO   Kmt UNO CUARTA CALLE CASA', '# 4494 <P> 02 C/M', '775', ''),
(4770, 'Cedula Fisica', 600710712, 'UMAÑA MORA CARLOS LUIS', 'GOLFITO   Kmt UNO CUARTA CALLE CASA', '# 4494 <P> 02 C/M', '775', ''),
(4771, 'Cedula Fisica', 600660287, 'UMAÑA MORA MARINA', 'Kmt 1 CONTG CARLOS LUIS UMAÑA', '<P> 02 C/M', '7750737', ''),
(4772, 'Cedula Fisica', 601250464, 'UMAÑA OSORIO ANDRES', 'GOLFITO Kmt 5 CONTIGUO ANDRES', 'TORRENTES <P> 03 C/M', '7751641', ''),
(4773, 'Cedula Fisica', 601250464, 'UMAÑA OSORIO ANDRES', 'GOLFITO Kmt 5 CONTIGUO ANDRES', 'TORRENTES <P> 03 C/M', '7751641', ''),
(4774, 'Cedula Fisica', 601320970, 'UMAÑA OSORIO MARIA LUISA', 'Golfito   Daniel Herrera de la pulp', 'Buen Precio   3 casas 2775-6123', '', ''),
(4775, 'Cedula Fisica', 601750314, 'UMAÑA OSORIO OSCAR', 'Golfito   La Mona casa D5.', 'Cel 8817-4744', '2775-6270', ''),
(4776, 'Cedula Fisica', 601330165, 'UMAÑA RIVERA ROGER', 'VILLA BONITA D   PULP EL GUABO 500', 'MTS SUR', '', ''),
(4777, 'Cedula Fisica', 601330165, 'UMAÑA RIVERA ROGER', 'VILLA BONITA D` PULP EL GUABO 500', 'Mts SUR <P> 06 C/M', '', ''),
(4778, 'Cedula Fisica', 601330065, 'UMAÑA RIVERA ROGER', 'Villa Bonita  Pulp. El Guabo 500 sur', '', '8337-3379', ''),
(4779, 'Cedula Fisica', 501190614, 'UMAÑA TORRENTES ANDRES', 'GOLFITO   KILOMETRO 5 ENTRADA A', 'LA CEIBA.', '7750715', ''),
(4780, 'Cedula Fisica', 501190614, 'UMAÑA TORRENTEZ ANDRES', 'KMT 5 PAGA 16 C/M', '', '750715', ''),
(4781, 'Cedula Fisica', 501190614, 'UMAÑA TORRENTEZ ANDRES', 'KMT 5 PAGA 16 C/M', '', '775', ''),
(4782, 'Cedula Fisica', 601690021, 'UMAÑA VILLARREAL GUILLERMO', 'Comte   Tigritos entrada fte Chicos', 'Bar 800 mts.', '', ''),
(4783, 'Cedula Fisica', 602610208, 'UMAÑA VILLEGAS ANA GUISENIA', 'San Vito Bº Orotina 400 M S y 350 O', 'de pulp la Liga    2773-5576', '8563-2884', ''),
(4784, 'Cedula Fisica', 601670331, 'URBINA BLANCO DUNIA', 'La Cuesta   300m este de la plaza  ', 'casa celeste. Cel 8767-4813', '2732-3046', ''),
(4785, 'Cedula Fisica', 601130089, 'URBINA CALDERON LINO', 'PUERTO JIMENEZ   FRENTE AL COLEGIO', '', '7355226', ''),
(4786, 'Cedula Fisica', 601420967, 'URBINA JUARES MERCEDES', 'GOLFITO KM.3 CASA .N.2', '', '7751804', ''),
(4787, 'Cedula Fisica', 601420967, 'URBINA JUAREZ MERCEDES', 'Golfito   Invu Km3 casa Nº 2', 'Cel 8313-4641.', '2775-1804', ''),
(4788, 'Cedula Fisica', 601810309, 'URBINA SEVILLA FRANCISCO', 'RIO CLARO   DE PULP EL ALMENDRO 300', 'SUR U HOSPITAL GOLFITO EMERGENCIAS', '7898596', ''),
(4789, 'Cedula Fisica', 901050005, 'URBINA VASQUEZ JUDITH', 'pto jimenez   frte al colegio casas', 'color natural.', '7355438', ''),
(4790, 'Cedula Fisica', 601040049, 'UREÑA AGUILAR DARIO ( PELON )', 'LAUREL DE PULP EL JOBO 500 Mts', 'CAMINO A LAUREL <P> 15 C/M', '', ''),
(4791, 'Cedula Fisica', 601040049, 'UREÑA AGUILAR DARIO CC PELON', 'P Jiménez   El Bambú  1º ent ult casa', 'MD. A la par del Torno. Cab Jiménez', '2789-7041', ''),
(4792, 'Cedula Fisica', 107120780, 'UREÑA ARIAS PASTORA', 'B* BETANIA CANOAS ENTRADA PURISCAL', '3CERA CASA COLOR NATURAL CEMENTO', '8949-7072', ''),
(4793, 'Cedula Fisica', 603680486, 'UREÑA CASTRO RICARDO', 'Km 37   La Gamba   La Bolsa.', '', '', ''),
(4794, 'Cedula Fisica', 603710034, 'UREÑA CERDAS ALVARO', 'DRAKE PROGRESO PULP. PROGRESEÑA', '* CANCELA 11 CADA MES **', '', ''),
(4795, 'Cedula Fisica', 600990526, 'UREÑA CHINCHILLA MIGUEL', 'CIUDAD CORTES 150 MTS DE LA', 'MUNICIPALIDAD CANCELA 8 C/MES.', '7888264', ''),
(4796, 'Cedula Fisica', 114140767, 'UREÑA HERNANDEZ MARGARITA CC MAGA', 'Cortés Bª 1 Marzo. Pulp. Farith ul-', 'tima casa al fondo.', '7866398', ''),
(4797, 'Cedula Fisica', 104060467, 'UREÑA MORA GERMAN.', 'CIUDAD NEILY.', '', '7755119', ''),
(4798, 'Cedula Fisica', 602200063, 'UREÑA VARGAS MINOR', 'Piedras Blancas  Santa Rosa  Miramar', '600 Este Iglesiua Católica. Llamar.', '8745-9127', ''),
(4799, 'Cedula Fisica', 500970065, 'URTECHO VILLAREAL TERESITA', 'BARRIO UREÑA GOLFITO CASA I14', '', '2775-1706', ''),
(4800, 'Cedula Fisica', 500970065, 'URTECHO VILLARREAL TERESITA', 'GOLFITO REC UREÑA  PULPERIA LA ESPER', 'ANZA.<P> 16 C/M', '7751706', ''),
(4801, 'Cedula Fisica', 500970065, 'URTECHO VILLARREAL TERESITA', 'GOLFITO REC UREÑA  PULPERIA LA ESPER', 'ANZA.<P> 16 C/M', '7751706', ''),
(4802, 'Cedula Fisica', 500970065, 'URTECHO VILLARREAL TERESITA', 'Golfito   Residencial Ureña; Pulp.', 'La Esperanza', '7751706', ''),
(4803, 'Cedula Fisica', 600860470, 'UVA BEITA JUANA', 'Sierpe de la entrada Picola 200 Oes', 'frent calle princ Cs Verde', '2788-1074', ''),
(4804, 'Cedula Fisica', 107990309, 'UVA MARIN MIGUEL ANGEL', 'SASTRERIA UVA BARRIO EL PROGRESO', '', '8433-3046', ''),
(4805, 'Cedula Fisica', 602800667, 'VALDEZ GONZALEZ NOEMY', 'LA NUBIA KM25 A UN COSTADO SUR DE', 'LA PLAZA CASA AL FONDO CELESTE', '8648-8221', ''),
(4806, 'Cedula Fisica', 800800637, 'VALDEZ SANCHEZ AIDA CC PATRICIA', 'La Esperanza   de Ciudad Neily.', 'Cobrar en Soda del Colegio.', '8998-6452', ''),
(4807, 'Cedula Fisica', 601280732, 'VALDEZ VILLALTA WALTER.', 'CIUDAD NEILY.', '', '', ''),
(4808, 'Cedula Fisica', 601280732, 'VALDEZ VILLALTA WALTER.', 'CIUDAD NEILY.', '', '', ''),
(4809, 'Cedula Fisica', 601280732, 'VALDEZ VILLALTA WALTER.', 'CIUDAD NEILY.', '', '', ''),
(4810, 'Cedula Fisica', 602290052, 'VALENCIA MUÑOZ BETZAIDA', 'R Claro   fte al MOPT Trab Hosp Gol-', 'fito.', '8822-8680', ''),
(4811, 'Cedula Fisica', 601430697, 'VALENCIA MUÑOZ VIRGINIA', 'R. Claro   a un costado de la Agenci', 'a Tracopa.', '', ''),
(4812, 'Cedula Fisica', 601430697, 'VALENCIA MUÑOZ VIRGINIA', 'RION CLARO 50 MTS N. DE LA CASA DE', 'LA JUVENTUD **  CANCELA 30 C/MES **', '', ''),
(4813, 'Cedula Fisica', 601430697, 'VALENCIA MUÑOZ VIRGINIA', 'Rio Claro   100 S de CocaCola contg', 'taller Cs Verde / 8950-2318', '', ''),
(4814, 'Cedula Fisica', 501840632, 'VALENCIA ROJAS ALFREDO', 'CARACOL DE LA  VACA X ENTRADA DE', 'FCA DE LOS BARBOSA EN EL CRUSE', '7838201', ''),
(4815, 'Cedula Fisica', 900400877, 'VALENCIA VALENCIA EZEQUIEL', 'KM 24 CONTIGUO A LA BODEGA DE AGROO', '** FECHA DE PAGO 12 C/MES  **', '8381556', ''),
(4816, 'Cedula Fisica', 501740396, 'VALENCIA VALENCIA JUAN FELIX', 'Laurel  La Nuvia  a un costado de la', 'Iglesia Católica   cel 8629-8217.', '2780-1940', ''),
(4817, 'Cedula Fisica', 500920199, 'VALENCIA VALENCIA MARCELO', 'Fca 63 CASA # 15460 <P> 03 C/M', '', '', ''),
(4818, 'Cedula Fisica', 500920199, 'VALENCIA VALENCIA MARCELO', 'Río Claro   Coto 63 casa 15460', '', '', ''),
(4819, 'Cedula Fisica', 500700038, 'VALERIN BONILLA JUAN.', 'GOLFITO KMT 5 CERRO PARTIDO ULTIMA', 'CASA AP Nº40.', '', ''),
(4820, 'Cedula Fisica', 109740506, 'VALERIO MURILLO VICTOR', 'C Cortés   Ojo de Agua   Urb. Pacheco', '400m sur Alfa & Omega.Cel 8558-6687', '2786-4194', ''),
(4821, 'Cedula Fisica', 502150781, 'VALERIO VEGA JOSE LUIS', '', '', '', ''),
(4822, 'Cedula Fisica', 502150781, 'VALERIO VEGA JOSE LUIS', 'La Cuesta   en el Bar Tigrillo', '', '', ''),
(4823, 'Cedula Fisica', 600880293, 'VALLE LOPEZ VICTORIA', 'SANTA LUCIA DE LAUREL 600 MTS. DE', 'PULP. EL PARQUESITO CANCELA 14 C/ME', '', ''),
(4824, 'Cedula Fisica', 600880293, 'VALLE LOPEZ VICTORIA', 'Sta Lucía entrada Monte Verde 500 m', 'Pulp. El Parquecito.', '', ''),
(4825, 'Cedula Fisica', 500510693, 'VALLE VARGAS VICTOR.', 'TAMARINDO DEL SUPER 2000   300 METRO', 'NORESTE.', '789', ''),
(4826, 'Cedula Fisica', 500510693, 'VALLE VARGAS VICTOR.', 'TAMARINDO DEL SUPER 2000   300 METRO', 'NORESTE.', '7899417', ''),
(4827, 'Cedula Fisica', 800680212, 'VALLECILLO CALDERON JUAN', 'GOLFITO   CIUDADELA DANIEL HERRERA L', 'A MONA CASA# G-6.', '', ''),
(4828, 'Cedula Fisica', 800680212, 'VALLECILLOS CALDERON JUAN', 'LA MONA DE GOLFITO CASA COLOR BLANC', 'CON AZUL', '2775-6409', ''),
(4829, 'Cedula Fisica', 800620567, 'VALLECILLOS MANZANARES DENNIS.', 'GOLFITO   Bº BELLA VISTA 2 da.', 'FILA DETRAS DEL ESTADIO CASA 879.', '775', ''),
(4830, 'Cedula Fisica', 800570294, 'VALLEJO DE CHAVEZ EUGENIA JOSEFA', 'Golfito; barrio parroquial pulperia', 'aledacan.P. 16 C/M', '408251', ''),
(4831, 'Cedula Fisica', 500257447, 'VALLEJOS ANGULO JUAN CARLOS', 'pto jimenez   Urb el San Lazaro   cas', 'No 10 Abastecedor mini super sol', '7355830', ''),
(4832, 'Cedula Fisica', 602120047, 'VALLEJOS CASTRO MARIA IRENE', 'COTO 52 CASA Nº 11530 COSTADO SUR', 'DE PLAZA FECHA DE PAGO 7 y 22 C/M', '8745-8099', ''),
(4833, 'Cedula Fisica', 601130866, 'VALLEJOS CASTRO RAFAEL MARTIN', 'Rio Claro   G.A.R', '', '7899029', ''),
(4834, 'Cedula Fisica', 601620814, 'VALLEJOS GONZALEZ RODOLFO', 'Pto Jiménez   La Amapola   Entrada an', 'tes Pulp Anais. Telf: 8612-8817.', '', ''),
(4835, 'Cedula Fisica', 603420210, 'VALLEJOS JAEN ALEXANDER', 'La Gamba 100m 25m MD del Puesto de', 'Policia. Doña Bellanira Castro.', '8669-0128', ''),
(4836, 'Cedula Fisica', 900540921, 'VALLEJOS VALLEJOS EZEQUIEL RAMON', 'Golfito  Kmt 7  Urban 300 Mts N d la', 'Esc   Cs Azul de madera   5010-5952', '', ''),
(4837, 'Cedula Fisica', 600380256, 'VALLEJOS VALLEJOS JULIA', 'P Jiménez   La Amapola   dos brazos.', '', '2735-', ''),
(4838, 'Cedula Fisica', 600510346, 'VALLEJOS VALLEJOS PATROCINIO', 'GOLFITO   CONTG. AL CEMENTERIO', 'PAGA EL 03 DE C/M.', '', ''),
(4839, 'Cedula Fisica', 601480424, 'VALLEJOS VALLEJOS TERESA', 'Golf  Bº be vist PIC-NIC C Nº4388-A', 'C Nº 4388-A ( cobro Rest Samoa )', '8898-4776', ''),
(4840, 'Cedula Fisica', 301210596, 'VALVERDE ALVARADO ALFREDO.', 'I.N.V.U. KM 3 DE PULPERIA EL', 'BOTECITO 150 MTS SUR.', '7750252', ''),
(4841, 'Cedula Fisica', 310210596, 'VALVERDE ALVARADO ALFREDO.', 'I.N.V.U. LA MONA CIUDADELA HERRERA', 'CASA D-1 CONTG PULP BUEN PRECIO.', '', ''),
(4842, 'Cedula Fisica', 310210596, 'VALVERDE ALVARADO ALFREDO.', 'I.N.V.U. LA MONA CIUDADELA HERRERA', 'CASA D-1 CONTG PULP BUEN PRECIO.', '', ''),
(4843, 'Cedula Fisica', 104320009, 'VALVERDE ARAYA GERARDO', 'GOLFITO   KMT 7 LA MONA POR LA', 'CURTIEMBRE.', '7751573', ''),
(4844, 'Cedula Fisica', 602290329, 'VALVERDE AVILES MARIA ESTER', 'PALMAR NORTE   100M NORTE Y 25M SUR', 'ABAST. NURY  8647-2257. 854-4311.', '8341-4727', ''),
(4845, 'Cedula Fisica', 603160237, 'VALVERDE AVILES VICTOR GERARDO', 'Palmar Sur   Fca 5   detrás Club   2º', 'fila   3º casa.', '8798-1083', ''),
(4846, 'Cedula Fisica', 601071062, 'VALVERDE BERMUDEZ THOMAS', 'PUERTO JIMENEZ   LA PALMA 400 ESTE', 'DE LA ESCUELA INDEPENDENCIA', '', ''),
(4847, 'Cedula Fisica', 103010622, 'VALVERDE CAMPOS ODULIO', 'Palmar Sur   Fca 5 en el bache.', '', '7297036', ''),
(4848, 'Cedula Fisica', 201920514, 'VALVERDE CASTRO HERIBERTO.', 'EL GUABO DE RIO CLARO 125 MTS AL', 'NORTE FRENTE A PULPERIA ONEY.P 2C/M', '7899154', ''),
(4849, 'Cedula Fisica', 303570175, 'VALVERDE CERVANTES KARLA', 'San Gabriel de Agua Buena   400 Oest', 'de esc Rio Salto Cs Color verde Soc', '8418-0647', ''),
(4850, 'Cedula Fisica', 601160948, 'VALVERDE CERVANTES MARTA', 'golfito bº bella vista soda domino', '', '7751363', ''),
(4851, 'Cedula Fisica', 102790487, 'VALVERDE CORDERO HUGO', 'GOLFITO   KMT 20 ENTRADA AGROINDUS-', 'TRIAL CASA AL FONDO DE DOS PISOS', '7898163', ''),
(4852, 'Cedula Fisica', 601750684, 'VALVERDE CORDERO OMAR', 'PTO JIMENEZ BARRIO MONTE REY', '100 MTS DE LA ENTRADA', '', ''),
(4853, 'Cedula Fisica', 104690884, 'VALVERDE FALLAS TERESA', 'LA CUESTA BARRIO LA AURORA COSTADO', 'DE LA PLAZA CONTIGUO A TALLER DIAZ', '2732-1628', ''),
(4854, 'Cedula Fisica', 113250692, 'VALVERDE FONSECA MICHAEL', 'Fca Limón 300 oeste del cementerio.', '', '2741-1310', ''),
(4855, 'Cedula Fisica', 601600834, 'VALVERDE GONZALEZ GERARDO', 'LA PALMA A UN KM DE LA ARROCERA', 'CASA ANTES DE PUL LA CHIRIPA.', '', ''),
(4856, 'Cedula Fisica', 602370580, 'VALVERDE GONZALEZ RONALD', 'GOLFITO   KMT 18 CASA DE DOS PISOS', 'ANTIGUA LINEA DEL TREN', '', ''),
(4857, 'Cedula Fisica', 107330339, 'VALVERDE JIMENEZ NORBERTO', 'Bº Carmen   detrás del Rancho Burica', '60 m. Deposita en el Banco.', '8892-2456', ''),
(4858, 'Cedula Fisica', 104010161, 'VALVERDE MADRIGAL EDWIN', 'LA VIGEN DE SABALO CONTIGUO A', 'G.A.R  <P> 20 C/M', '', ''),
(4859, 'Cedula Fisica', 109920238, 'VALVERDE MARIN YUDIETH.', 'Cortes   Bo la Laguna.', '8759-9357.', '2788-7012', ''),
(4860, 'Cedula Fisica', 601340591, 'VALVERDE MENDEZ VIRGINIA', 'PTO JIMENEZ   CAÑAZA CALLE A LA', 'PLAYA.', '6390006', ''),
(4861, 'Cedula Fisica', 601990979, 'VALVERDE MORA IRMA', 'conte  200este y 400norte de la escu', 'ela conte casa color verde', '2776-8008', ''),
(4862, 'Cedula Fisica', 900520446, 'VALVERDE MORA RAFAEL ANGEL', 'Golfito   km 18 Calle a las Trenzas', 'P.27 C/M', '8659-9581', ''),
(4863, 'Cedula Fisica', 104970787, 'VALVERDE NAVARRO LUIS FERNANDO', 'Golfito   Km5 cs zócalo barnizada.', 'Trabaja Bar la Rueda   La Mona.', '2775-1812', ''),
(4864, 'Cedula Fisica', 502020094, 'VALVERDE PICADO JULIO CESAR', 'Osa   Dominicalito  Bº pozo azul   Cs', 'Nº6. Porton en madera.', '8730-1346', ''),
(4865, 'Cedula Fisica', 603470448, 'VALVERDE QUIROS JAIME GERARDO', 'Golfito   Km 5   antiguo rastro 4º ca', 'sa Nº 35.', '8767-4600', ''),
(4866, 'Cedula Fisica', 106620377, 'VALVERDE RETANA EDWIN', 'CIUDAD NEILY  LA FORTUNA COSTADO ES', 'TE DE PULP. FRANDY', '', ''),
(4867, 'Cedula Fisica', 600690028, 'VALVERDE RODRIGUEZ VICTOR MANUEL', 'R CLARO   Bº SANTIAGO 300 MTS ANTES', 'DE PULP AMIGA <P> 02 C/M', '7899422', ''),
(4868, 'Cedula Fisica', 600690028, 'VALVERDE RODRIGUEZ VICTOR MANUEL', 'LA JULIETA   600 NORTE DE LA ESCUELA', 'GOLFITO', '', ''),
(4869, 'Cedula Fisica', 108620383, 'VALVERDE ROJAS ELICINIO', 'UVITA BAHIA BALLENA DEL HOTEL CANTO', 'BALLENA 250MTS OESTE', '8916-3379', ''),
(4870, 'Cedula Fisica', 602300981, 'VALVERDE ROJAS GREIVIN', 'CENIZO DE LAUREL 200M ESTE DE LA', 'PLAZA', '', ''),
(4871, 'Cedula Fisica', 201570812, 'VALVERDE ROJAS GUILLERMO', 'Golfito   Las Trenzas   Entrada Naza-', 'ret 100m después del puente.', '', ''),
(4872, 'Cedula Fisica', 201570812, 'VALVERDE ROJAS GUILLERMO.', 'Las trenzas entrada Nazaret despues', 'del puente de madera 100 mts.', '', ''),
(4873, 'Cedula Fisica', 601750357, 'VALVERDE VALVERDE MARLENE', 'Laurel   El INVU 100m norte Gimnasio', 'casa rosada. Cel 8347-9470   2780-04', '2780-1690', ''),
(4874, 'Cedula Fisica', 601130793, 'VALVERDE VALVERDE ZULEMA', 'Golfito Bº Bella Vista contiguo al', 'Taller Orozco casa #4217 C.Hospital', '7751001', ''),
(4875, 'Cedula Fisica', 601130793, 'VALVERDE VALVERDE ZULEMA', 'Golfito   Barrio Bella Vista casa #', '4217.Trabaja en Hospital de Golfito', '', ''),
(4876, 'Cedula Fisica', 601130793, 'VALVERDE VALVERDE ZULEMA', 'Golfito   Bella Vista casa #4217.', 'Trab. Hospital Golfito.', '7752197', ''),
(4877, 'Cedula Fisica', 601130793, 'VALVERDE VALVERDE ZULEMA', 'Golfito   Bella Vista casa #4217.', 'Trab. Hospital Golfito.', '7752197', ''),
(4878, 'Cedula Fisica', 601130793, 'VALVERDE VALVERDE ZULEMA', 'GOLFITO BELLA VISTA CASA N.4217', '', '7752197', ''),
(4879, 'Cedula Fisica', 602800180, 'VALVERDE VENEGAS JHONNY', 'R Claro   Bambel 2   frente a Escuela', '', '8946-1476', ''),
(4880, 'Cedula Fisica', 114120330, 'VALVERDE VENEGAS MILEY', 'R Claro   Bambel 2   fte Escuela.', '', '5759-8411', ''),
(4881, 'Cedula Fisica', 602450490, 'VANEGAS D LEON JACKELINE', 'Laurel Bambito costado sur de plaza', 'Cobrar en Laurel Bazar Keyla.', '8971-1034', ''),
(4882, 'Cedula Fisica', 202640297, 'VARELA JIMENEZ MARINO', 'Ciud. 22 Octubre Bloque G   casa Nº2', 'Rosado con blanco.', '2783-3899', ''),
(4883, 'Cedula Fisica', 202970609, 'VARELA JIMENEZ MARINO.', 'CIUDAD NEILY.', '', '', ''),
(4884, 'Cedula Fisica', 202970609, 'VARELA JIMENEZ MARINO.', 'CIUDAD NEILY.', '', '', ''),
(4885, 'Cedula Fisica', 202640297, 'VARELA JIMENEZ MARINO.', 'CIUDAD NEILY   22 DE OCTUBRE', 'CASA 2- BLOKE G', '7833899', ''),
(4886, 'Cedula Fisica', 112010687, 'VARELA MURILLO JOSE EMILIO', 'Drake   El progreso   25 Sur y 25 Oes', '8987-5435  8632-0860', '', ''),
(4887, 'Cedula Fisica', 600700266, 'VARELA PICARTE RANDALL', 'San Vito   Los Pinares Contg  Pulp ç', 'RIGO  8619-4469 P En OFICINA S vito', '8618-8277', ''),
(4888, 'Cedula Fisica', 103460644, 'VARGAS AGUILAR ARTURO', 'RIO CLARO   VIVE EN NUEVA CIUDADELA', 'POR EL I.C.E. 16 Y 03 C/M.', '*-*-*-*', ''),
(4889, 'Cedula Fisica', 202640882, 'VARGAS ALVARADO EZEQUIEL', 'Golfito   Km 20 Agroindustrial', '', '8848-5460', ''),
(4890, 'Cedula Fisica', 900930554, 'VARGAS ARAYA GERARDO', 'barrio alemania de la calle princip', 'al del porton grande 100 mts al fon', '7866738', ''),
(4891, 'Cedula Fisica', 603150581, 'VARGAS ARCE TATIANA', 'P Canoas   Veracruz   casa 27A amari-', 'lla.', '8623-7046', ''),
(4892, 'Cedula Fisica', 203570599, 'VARGAS ARROYO CARLOS', 'LA PALMA DE PEREZ ZELEDON   COBRAR', 'EN EL COMANDO.', '', ''),
(4893, 'Cedula Fisica', 106870113, 'VARGAS BADILLA CARLOS LUIS', 'San Vito   frente a la delegacion de', 'changuena  ', '8479-4942', ''),
(4894, 'Cedula Fisica', 602170347, 'VARGAS BEITA PATRICIA', 'COSTADO ESTE CERVECERIA COSTA RICA.', 'CARTONERA: <P> 15 C/M', '', ''),
(4895, 'Cedula Fisica', 602170347, 'VARGAS BEITA PATRICIA', 'Ciudad Neily   Costado Oeste de Cer-', 'vecería. Cel 8869-7262.', '2783-3564', ''),
(4896, 'Cedula Fisica', 601630441, 'VARGAS BERMUDEZ FAUSTINO', 'Bambel Río Claro   Contiguo al', 'Angar', '8840-1800', ''),
(4897, 'Cedula Fisica', 601630441, 'VARGAS BERMUDEZ FAUSTINO', 'Rio Claro   Bambel   contigo antiguo', 'angar cobra el 16 de cada mes.', '', ''),
(4898, 'Cedula Fisica', 601570160, 'VARGAS BOLAÑOS GERARDO', 'Caracol Norte cs 32.', '', '8473-6702', ''),
(4899, 'Cedula Fisica', 601570760, 'VARGAS BOLAÑOS JORGE GERARDO', 'CARACOL RIO CLARO P.EN VETERINARIA', 'RODRIGUEZ Y JOHANSSON <P> 03 C/M', '759027', ''),
(4900, 'Cedula Fisica', 601570760, 'VARGAS BOLAÑOS JORGE GERARDO', 'CARACOL  R CLARO <P> EN VETERINARIA', 'RODRIGUEZ Y JOHANSSON. <p> 16 C/M', '789', ''),
(4901, 'Cedula Fisica', 102830278, 'VARGAS BUSTAMANTE LIGIA.', 'GOLFITO BARRIO PARROQUIAL CASA', 'Nº4555.FTE BNCR 2da  FILA CASA ROSAD', '', ''),
(4902, 'Cedula Fisica', 602690436, 'VARGAS CABALLERO KAROL', 'LA 22 DE OCTUBRE CASA BLOQUE B *22', '', '8780-2702', ''),
(4903, 'Cedula Fisica', 701030290, 'VARGAS CASTELLON GILBERTO', 'Golfito   La Gamba   fte MINAET cs', 'blanca.', '8766-3140', ''),
(4904, 'Cedula Fisica', 701030290, 'VARGAS CASTELLON GILBERTO', 'SEGUNDA ENTRADA DESPUES DEL PUENTE', 'MD SEGUNDA CASA SAN RAMON', '8766-3140', ''),
(4905, 'Cedula Fisica', 207650510, 'VARGAS CASTRO GABELO', 'GOLFITO   BARRIO PARROQUIAL FRTE', 'A BANCO NACIONAL CASA 4578 2 fila', '7750890', ''),
(4906, 'Cedula Fisica', 602110694, 'VARGAS CERCEÑO GEOVANNY', '', '', '', ''),
(4907, 'Cedula Fisica', 202420477, 'VARGAS CHAVES TITO LUIS', 'GOLFITO KILOMETRO 7   EN PULPERIA LA', 'DEPORTIVA (PURRUJA).P. 27 C/M', '750144', ''),
(4908, 'Cedula Fisica', 202420477, 'VARGAS CHAVES TITO LUIS', 'GOLFITO KILOMETRO 7   EN PULPERIA LA', 'DEPORTIVA (PURRUJA).P. 27 C/M', '750144', ''),
(4909, 'Cedula Fisica', 202420477, 'VARGAS CHAVES TITO LUIS', 'GOLFITO KILOMETRO 7   EN PULPERIA LA', 'DEPORTIVA (PURRUJA)', '7751298', ''),
(4910, 'Cedula Fisica', 601950603, 'VARGAS CHAVEZ ALFREDO', 'SALON SUPER 2000 DE TAMARINDO 500 N', 'CSA VERDE CON MARRON. P 30 C/M.', '7750970', ''),
(4911, 'Cedula Fisica', 104700986, 'VARGAS CHINCHILLA ALLEM.', 'FINCA GUANACASTE   PULPERIA MARY.', 'P.19 C/M.', '', ''),
(4912, 'Cedula Fisica', 900290592, 'VARGAS CHINCHILLA CARMELO', 'LA ESPERANZA D`PARADA 500 M.N Y 500', 'E.CASA CONTG ARROZAL <P> 09 C/M', '', ''),
(4913, 'Cedula Fisica', 900290592, 'VARGAS CHINCHILLA CARMELO', 'Río Claro   la Esperanza 500 N y 500', 'E de la parada. Contigua a arrozal.', '', ''),
(4914, 'Cedula Fisica', 900290592, 'VARGAS CHINCHILLA CARMELO', 'R Claro  La Esperanza   150m sur  300m', 'este casa esquinero.', '2789-7141', ''),
(4915, 'Cedula Fisica', 900290592, 'VARGAS CHINCHILLA CARMELO', 'Rio Claro   la esperanza   150 Sur  ', '300 E   Cs Esquinera   2789-7141', '', ''),
(4916, 'Cedula Fisica', 500720396, 'VARGAS DIAZ JUAN', 'La Cuesta   200m Sur y 100E del Cole', 'gio de la Cuesta.', '', ''),
(4917, 'Cedula Fisica', 500750396, 'VARGAS DIAZ JUAN', 'LA CUESTA   200 MTS SUR DEL COLEGIO', 'Y 100 ESTE CASA COLOR AZUL', '2732-1651', ''),
(4918, 'Cedula Fisica', 500720396, 'VARGAS DIAZ JUAN', 'La Cuesta   200m Sur y 100 Este del', 'colegio. cc azul.', '2732-1651', ''),
(4919, 'Cedula Fisica', 500720396, 'VARGAS DIAZ JUAN.', 'La Cuesta 200 mts sur del Colegio.', '', '', ''),
(4920, 'Cedula Fisica', 500720396, 'VARGAS DIAZ JUAN.', 'LA CUESTA   200 MTS DEL COLEGIO', '<P> 30 C/M', '732', ''),
(4921, 'Cedula Fisica', 103510049, 'VARGAS ELIZONDO ROGELIO.', 'CARIARI DE LAUREL  125 MTS DE LA PLA', 'ZA CARRETERA A CIUDAD NEILY.', '', ''),
(4922, 'Cedula Fisica', 600940530, 'VARGAS ESPINOZA SOCORRO', 'LA PALMA DE LA CUESTA BAR EL GUAY', '', '', ''),
(4923, 'Cedula Fisica', 601490131, 'VARGAS ESPINOZA VILMA', 'Rio Claro   contiguo a la plaza  ', 'casa No. 22 telefono 27898475', '7898475', ''),
(4924, 'Cedula Fisica', 600380610, 'VARGAS GOMEZ JESUS', 'P Jiménez   Escondido   50m sur Feria', 'del Maíz. Cel 8617-0220', '2735-1625', ''),
(4925, 'Cedula Fisica', 205160129, 'VARGAS GONZALEZ MARIA DEL ROCIO', 'LA PALAMA CENTRO 50 SUR DEL EBAIS', '', '8558-3495', ''),
(4926, 'Cedula Fisica', 600890092, 'VARGAS GUEVARA ADRIAN.', 'ABROJO.', '', '', ''),
(4927, 'Cedula Fisica', 600890092, 'VARGAS GUEVARA ADRIAN.', 'ABROJO.', '', '', ''),
(4928, 'Cedula Fisica', 500400231, 'VARGAS GUEVARA ANGELICA C.C. AMALIA', 'ABROJO DE LA ESCUELA 600 MTS CALLE', 'A PASO CANOAS C. MANO IZQUIERDA', '7833683', ''),
(4929, 'Cedula Fisica', 102790037, 'VARGAS GUEVARA Mª LUPE.', 'Bº SAN JORGE   C.E.N.C.I.N.A.E.', 'COBRO 30- 15 Y 16 DE C.MES.', '782437', ''),
(4930, 'Cedula Fisica', 102290959, 'VARGAS GUZMAN HORTENCIA', 'LA MONA DETRAS DEL ESTADIO CASA CON', 'MALLA * FECHA DE PAGO 02 C/MES *', '7750326', ''),
(4931, 'Cedula Fisica', 202690087, 'VARGAS JIMENEZ GERARDO', '', '', '', ''),
(4932, 'Cedula Fisica', 202160800, 'VARGAS MADRIGAL ZENEIDA', 'Copabuena   Soda el Kiosko  fte Salón', 'comunal.', '', ''),
(4933, 'Cedula Fisica', 202160800, 'VARGAS MADRIGAL ZENEIDA', 'Copa Buena   Soda el Kiosco.', '2734-0069.', '2734-0169', ''),
(4934, 'Cedula Fisica', 601620991, 'VARGAS MENA DORA ELMICE', 'RIO CLARO   BAMBEL 3 ALBERGUE PANI', 'CIUDAD NEILY.', '', ''),
(4935, 'Cedula Fisica', 109660336, 'VARGAS MONTIEL ISMAEL', 'COTO 52 CASA Nº 10525', '** FECHA DE PAGO 16 CADA MES **', '7811393', ''),
(4936, 'Cedula Fisica', 109660336, 'VARGAS MONTIEL ISMAEL', 'COTO 52 FRENTE AL TANQUE DE AGUA CA', 'SA 10525', '2781-1393', ''),
(4937, 'Cedula Fisica', 601350647, 'VARGAS MORA ERMELINDA', 'COTO 52 FRENTE AL TANQUE DE AGUA', 'CASA 10525', '2781-1393', ''),
(4938, 'Cedula Fisica', 502460726, 'VARGAS MORA MARIA PATRICIA', 'Pto Escondido Frente al la Escuela', '', '', ''),
(4939, 'Cedula Fisica', 600940342, 'VARGAS OBANDO FLOR', 'C. Meily   400 m norte Cervecería', 'Costa Rica.', '2783-3411', ''),
(4940, 'Cedula Fisica', 600630161, 'VARGAS OBANDO PEDRO ALBERTO', 'Sierpe  Ecoturístico Guarumal  cobrar', 'cs Maria Felix. 50 oeste cab margar', '8315-8373', ''),
(4941, 'Cedula Fisica', 201690046, 'VARGAS OCAMPO ANALY', 'OLLA CERO ENTRADA FRENTE A CANTINA', '200 MTS MANO IZQUIERDA', '', ''),
(4942, 'Cedula Fisica', 603160113, 'VARGAS ORTIZ YEIMI.', 'Bereh de Laurel   800 mts Oeste', 'de la Escuela   tel 27801561', '2780156', ''),
(4943, 'Cedula Fisica', 105580069, 'VARGAS OTAROLA GUILLERMO', 'CAÑAZA 400 MTS ESTE DE LA ESCUELA', '', '', ''),
(4944, 'Cedula Fisica', 600690639, 'VARGAS PALACIOS LUZMILDA', 'GOLFITO LA MONA', '', '', ''),
(4945, 'Cedula Fisica', 600690639, 'VARGAS PALACIOS LUZMILDA', '', '', '', ''),
(4946, 'Cedula Fisica', 600690639, 'VARGAS PALACIOS LUZMILDA', 'Golfito   La Mona   km 12 Entrada Mar', 'vin Carrión ultima casa.', '2775-2290', ''),
(4947, 'Cedula Fisica', 602660218, 'VARGAS PARRA LUIS ANGEN', 'BARRIO SAN RAFAEL 500MTS NORESTE DE', 'L SALON CUMUNAL', '7834884', ''),
(4948, 'Cedula Fisica', 602540212, 'VARGAS RAMIREZ JUAN CARLOS', 'ESPERANZA RIO CLARO P.EN RODRIGUEZ', 'JOHANSSON <P> 03 Y 16 C/M', '759027', ''),
(4949, 'Cedula Fisica', 601570421, 'VARGAS ROJAS NELLY', 'Comte  La Esperanza  100m oeste  plaza', 'de deportes   cs amarilla.', '8772-7298', ''),
(4950, 'Cedula Fisica', 102350372, 'VARGAS SALAZAR GONZALO.', 'LA ESPERANZA   BAR LA ALEGRIA.', 'PAGA EL 20 DE CADA MES.', '', ''),
(4951, 'Cedula Fisica', 102350372, 'VARGAS SALAZAR GONZALO.', 'LA ESPERANZA   BAR LA ALEGRIA.', '', '', ''),
(4952, 'Cedula Fisica', 601580723, 'VARGAS SALAZAR MARTHA', 'FLORIDA PIEDRAS BLANCAS RANCHO', 'GUIRI GUIRI P.10 Y 19 C/M', '', ''),
(4953, 'Cedula Fisica', 601580723, 'VARGAS SALAZAR MARTHA', 'FLORIDA RANCHO GUIRI GUIRI', '<P> 19 C/M', '', ''),
(4954, 'Cedula Fisica', 110250718, 'VARGAS SANDI JESSENIA', 'GOLFITO LA PURRUJA Bº TUCLER', '** CANCELA 16 CADA MES **', '7753225', ''),
(4955, 'Cedula Fisica', 501290739, 'VARGAS SOLORZANO ANGEL TOBIAS', 'GOLFITO Bº LLANO BONITO EN PULP. LA', 'CENTRAL.*  CANCELA 17 CADA MES *', '7753075', ''),
(4956, 'Cedula Fisica', 104300626, 'VARGAS UMAÑA LUIS ANGEL', 'CONADO DE OSA COSTADO E. DE LA', 'ESCUELA.', '7888049', ''),
(4957, 'Cedula Fisica', 602840682, 'VARGAS VALVERDE CARLOS GERARDO', 'PUERTO ESCONDIDO DIAGONAL A SODA', 'CARLOS ALBERTO EL CORRAL SE RAFAEL', '', ''),
(4958, 'Cedula Fisica', 602660553, 'VARGAS VALVERDE ZULAY', 'Pto Jiménez   El Tigre contiguo Pulp', 'El Tucán o cobrar en la Pulpería.', '7037026', ''),
(4959, 'Cedula Fisica', 602100736, 'VARGAS VARGAS ANIBAL', 'La Cuesta  Cuervito  Bº Aurora  150m S', 'Pulp. Ahorro. Cel 5711-9199.', '2732-1404', ''),
(4960, 'Cedula Fisica', 602300253, 'VARGAS VARGAS GERBER', 'CAMPO TRES AGUA BUENA.COMANDO GOLF.', '', '', ''),
(4961, 'Cedula Fisica', 602380017, 'VARGAS VARGAS JOSE HERNESTO', 'CORTES OJO CHAL CONTG. AL PUENTE', '', '', ''),
(4962, 'Cedula Fisica', 202130420, 'VARGAS VARGAS JUAN BAUTISTA', 'RIO CLARO  PULP. RANDALL FRENTE AL', 'INA. P. 02 C/M', '', ''),
(4963, 'Cedula Fisica', 202130424, 'VARGAS VARGAS JUAN BAUTISTA', 'RIO CLARO  PULP. RANDALL FRENTE AL', 'INA. P. 02 C/M', '7899706', ''),
(4964, 'Cedula Fisica', 104690270, 'VARGAS VARGAS MARTIN', 'LA ESPERANZA DE R CLARO FRENTE GAR', 'PAGA LOS 16 Y 28 DE C/M', '', ''),
(4965, 'Cedula Fisica', 601210830, 'VARGAS VILLALOBOS ALBERTO', '', '', '', ''),
(4966, 'Cedula Fisica', 502590539, 'VARGAS VILLALOBOS JAIME', 'PUNTA BANCO DE PAVONES', '500 SUR DE QUEGRADA NICARAGUA', '', ''),
(4967, 'Cedula Fisica', 601970025, 'VARQUERO PEREZ LUIS.', 'ABROJO PULPERIA PEREZ.PAGA LOS 30CM', '', '7833860', ''),
(4968, 'Cedula Fisica', 603170139, 'VASQUES PORRAS ROY', 'HEREDIA R.GUARARY URB.', 'LILIAM SANCHEZ', '2626076', ''),
(4969, 'Cedula Fisica', 500570829, 'VASQUEZ ALVARADO MARIA MATILDE', 'C Cortés   Bº Renacim. cs 10. contig', 'parque de juegos.', '', ''),
(4970, 'Cedula Fisica', 603280515, 'VASQUEZ APARICIO LINO', 'LA PALMA DE PUERTO JIMENEZ', '', '7351165', ''),
(4971, 'Cedula Fisica', 600580160, 'VASQUEZ APARICIO MARTA', 'GOLFITO', '', '', ''),
(4972, 'Cedula Fisica', 600580160, 'VASQUEZ APARICIO MARTA MAXIMA', 'GOLFITO KM 1 CUARTA FILA CASA 4491', 'A UN COSTADO DE BAZAR ANGIE 3er cas', '7750843', ''),
(4973, 'Cedula Fisica', 600580160, 'VASQUEZ APARICIO MARTA MAXIMINA', 'GOLFITO   KMT UNO CASA 4491 FRT AL', 'VIDEO 4ta FILA.', '', ''),
(4974, 'Cedula Fisica', 600580160, 'VASQUEZ APARICIO MARTHA', 'GOLFITO   KM1 CASA 4491 CONTIGUO', 'AL VIDEO 4TA. FILA', '7752328', ''),
(4975, 'Cedula Fisica', 601990874, 'VASQUEZ BARRANTES ROSA', 'C Neily   C González   a un costado', 'Iglesia Evangélica.', '8883-3726', ''),
(4976, 'Cedula Fisica', 601801481, 'VASQUEZ BLANCO LUIS', 'GOLFITO   EL INVU   LA ROTONDA CONTIG', 'AL BARBERO APT. PLANTA BAJA', '2775-1827', ''),
(4977, 'Cedula Fisica', 700210327, 'VASQUEZ CHAVARRIA  CARLOS', 'NARANJO DE ESCUELA 2 KM AL SUR', 'HACIA ZARAGOZA * CANCELA 10 C/MES', '', ''),
(4978, 'Cedula Fisica', 700210327, 'VASQUEZ CHAVARRIA  CARLOS', 'NARANJO DE ESCUELA 2 KM AL SUR', 'HACIA ZARAGOZA', '2780-1540', ''),
(4979, 'Cedula Fisica', 603300091, 'VASQUEZ ESPINOZA DENIA', 'R Claro   Viquilla 2   fte a Pulp.', 'Guanacasteca.', '8602-3073', ''),
(4980, 'Cedula Fisica', 501380948, 'VASQUEZ GARCIA OMAR', 'Pto JIMENEZ CONTG AL CEMENTERIO', 'COMISARIATO ESQUINA <P> 11 C/M', '735', ''),
(4981, 'Cedula Fisica', 203490948, 'VASQUEZ GOMEZ VICTOR HUGO', 'GOLFITO   KMT 3 EN TALLER DE', 'MILTON VASQUEZ', '7751850', ''),
(4982, 'Cedula Fisica', 602690804, 'VASQUEZ GUEVARA MARIA', 'R Claro  Km31  La unión de Coto 100m', 'Desp. Iglesia Católica.', '8765-3766', ''),
(4983, 'Cedula Fisica', 900740369, 'VASQUEZ GUZMAN DOLORES', 'Golfito   Km 14 casa mano derecha', 'entrando al final de la bajada.', '', ''),
(4984, 'Cedula Fisica', 602540759, 'VASQUEZ LESCANO MARISOL.', 'PALMAR NORTE.', '', '', ''),
(4985, 'Cedula Fisica', 602540759, 'VASQUEZ LESCANO MARISOL.', 'PALMAR NORTE.', '', '', ''),
(4986, 'Cedula Fisica', 110770364, 'VASQUEZ LOPEZ ADRIANA', 'S Vito   S Rita   350 este pulp. El', 'Porvenir   camino a limoncito.', '8973-2858', ''),
(4987, 'Cedula Fisica', 900910047, 'VASQUEZ MIRANDA ISABEL', 'CIUDAD NEILY EN ALTOS DE JOYERIA', 'GOLFITO ESTETICA* 2 C/MES **', '7833247', ''),
(4988, 'Cedula Fisica', 900910047, 'VASQUEZ MIRANDA ISABEL', 'C Neily   Sala de Belleza   Altos Doc', 'Luna   CASA PALMA REAL 28-G', '2783-3247', ''),
(4989, 'Cedula Fisica', 601590926, 'VASQUEZ MORALES FRANCISCO', 'PTO JIMENEZ LA PALMA   DE ALMACEN', 'LA PALMA 300 MTS NORTE', '7351079', ''),
(4990, 'Cedula Fisica', 602250853, 'VASQUEZ MORALES LORENA', 'Puntarenas Esparza   de la torrre', 'de celulares 150 mts este', '9958529', ''),
(4991, 'Cedula Fisica', 606550549, 'VASQUEZ PALACIOS MARIA ISOLINA', 'CIUDAD CORTES   LA FUENTE DE PULP', 'EL ALMENDRO 1 MT DIAGONAL ABSTECER', '', ''),
(4992, 'Cedula Fisica', 603170139, 'VASQUEZ PORRAS ROY', 'LA GAMBA SE TRASLDO HEREDIA TELEFON', 'DE TRABAJO 2611108 EXT 16', '2786087', ''),
(4993, 'Cedula Fisica', 602430112, 'VASQUEZ RAMIREZ JOSE A.', 'Golfito km20 Agroindustrial 150m', 'Este.', '8629-2462', ''),
(4994, 'Cedula Fisica', 201880705, 'VASQUEZ SANCHEZ EDGAR', 'LA CUESTA   125 MTS SURESTE DE LA', 'ESCUELA JUNA LARA ALFARO', '7322285', ''),
(4995, 'Cedula Fisica', 201880705, 'VASQUEZ SANCHEZ EDGAR', 'La Cuesta   125m Sureste Escuela.', 'Cel 8321-4650.', '2732-2285', ''),
(4996, 'Cedula Fisica', 600960749, 'VASQUEZ TELLEZ ROBERTO', 'RIO CLARO   BAMBEL SECTOR 3 PULP', 'EL COQUITO.', '7898167', ''),
(4997, 'Cedula Fisica', 201420355, 'VASQUEZ VARGAS BOLIVAR', 'KMT 1 CASA 4467 TERCER FILA', 'FRTE A LA ESCUELA', '7751690', ''),
(4998, 'Cedula Fisica', 601080590, 'VASQUEZ VARGAS FREDDY.', 'GOLFITO LAVANDERIA O EN BELLA VISTA', 'CASA # 4466 (P) 03 C/M', '7750458', ''),
(4999, 'Cedula Fisica', 502370460, 'VASQUEZ VASQUEZ DAGOBERTO', 'LA VIQUILLA #2 COBRAR EN  PULP.', 'GUANACASTE PAGA EL 22 CADA DE MES', '', ''),
(5000, 'Cedula Fisica', 601842289, 'VASQUEZ VASQUEZ FLORY', 'KMT 1 CASA 4491 POR EL VIDEO 4ta', 'FILA.', '7751559', '');
INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Documento`, `Nombres`, `Direccion`, `Direccion2`, `Telefono`, `Email`) VALUES
(5001, 'Cedula Fisica', 201060294, 'VASQUEZ ZUÑIGA EDUVINO', '', '', '', ''),
(5002, 'Cedula Fisica', 603490939, 'VAZQUEZ ALMENGOR RONNY', 'UVITA CENTRO REST BIG BAMBUO', '', '8556-3885', ''),
(5003, 'Cedula Fisica', 600960749, 'VAZQUEZ TELLEZ ROBERTO', 'BAMBEL 3 CONT. 1 PUENTE', '', '2789-8167', ''),
(5004, 'Cedula Fisica', 602150242, 'VEGA ACUÑA ESTELA', 'CIUDAD CORTES   URB JEANETH PACHECO', 'CSA 227 CASA CON MAYA', '7888919', ''),
(5005, 'Cedula Fisica', 103900816, 'VEGA ACUÑA RAFAEL', 'C. CORTES URB. YANET PACHECO', 'CASA Nº 131 CANCELA 8 C/MES.', '7888914', ''),
(5006, 'Cedula Fisica', 900450507, 'VEGA ARGUEDAS ANA LORENA.', 'HOTEL LAS GAVIOTAS O KM 3 CASA #113', 'DE MISAEL QUESADA P.03 Y 16 C/M', '775-', ''),
(5007, 'Cedula Fisica', 900450507, 'VEGA ARGUEDAS ANA LORENA.', 'HOTEL LAS GAVIOTAS O KM 3 CASA #113', '', '7751585', ''),
(5008, 'Cedula Fisica', 900470507, 'VEGA ARGUEDAS LORENA', 'quepos', '', '', ''),
(5009, 'Cedula Fisica', 900280579, 'VEGA ARROYO SIGIFREDO', '', '', '', ''),
(5010, 'Cedula Fisica', 800640613, 'VEGA BUSTOS DORIS', 'GOLF Bº BELLA VISTA FRENT TRACOPA', 'C # 8137 CABINA NAVARRETE <P> 16', '7750197', ''),
(5011, 'Cedula Fisica', 602560716, 'VEGA CHAVARRIA AMIRA', 'PTO JIMENEZ LA PALMA POR EL', 'AYA', '7750033', ''),
(5012, 'Cedula Fisica', 602560716, 'VEGA CHAVARRIA AMIRA', 'PTO JIMENEZ LA PALMA POR EL', 'AYA', '7351142', ''),
(5013, 'Cedula Fisica', 602560716, 'VEGA CHAVARRIA AMIRA', 'PTO JIMENEZ LA PALMA POR EL', 'AYA', '7351142', ''),
(5014, 'Cedula Fisica', 602560716, 'VEGA CHAVARRIA AMIRA', 'La Palma   P.Jiménez; Cabinas Josami', 'Cel: 8869-4518.', '2735-1142', ''),
(5015, 'Cedula Fisica', 602560716, 'VEGA CHAVARRIA AMIRA', 'P Jiménez   Cabinas Josami.', 'Cel 8868-4518', '2735-1142', ''),
(5016, 'Cedula Fisica', 601310172, 'VEGA CORTES ELBERTH', '\"GOLF BºIMAS SAN ANDRES   PULP \"\" 5K \"\"\"', '<P> 02 C/M', '', ''),
(5017, 'Cedula Fisica', 101310172, 'VEGA CORTES ELBERTH', 'GOLF BºIMAS SAN ANDRES   CASA 27', '', '7751781', ''),
(5018, 'Cedula Fisica', 600981284, 'VEGA CRUZ CLAUDIO.', '25 MTRS AL ESTE DE LA PULPERIA LA', 'FORTUNA C.N.P.2 O 3 C/M.', '783', ''),
(5019, 'Cedula Fisica', 600981284, 'VEGA CRUZ CLAUDIO.', '25 MTRS AL ESTE DE LA PULPERIA LA', 'FORTUNA C.N.P.2 O 3 C/M.', '7835234', ''),
(5020, 'Cedula Fisica', 600460661, 'VEGA CRUZ JOSE', 'Comte   La Estrella   Cll a Tigritos', '700 N del Zarpe cs verde.', '2776-8368', ''),
(5021, 'Cedula Fisica', 603650581, 'VEGA DURAN NELSY', 'SANTA LUCIA FRENTE A LA PLAZA', 'CASA VERDE * 10 C/MES *', '3506547', ''),
(5022, 'Cedula Fisica', 602130648, 'VEGA HIDALGO SHIRLEY ROCIO', 'GOLF LA ROTONDA CONTG A LI OLIVAREZ', 'O DEP LIBRE LOCAL # 8 <P> 03 C/M', '775', ''),
(5023, 'Cedula Fisica', 601790699, 'VEGA LARA DUNIA', 'B*SAN ANTONNIO DEL ANTIGUO SUR OEST', 'E DEL ANTIGUO SUR OSSA ANARANDA', '2788-8547', ''),
(5024, 'Cedula Fisica', 602390606, 'VEGA LEITON AIDA MERY', 'LA FORTUNA 500 Mts AL OESTE', 'PAGA 20 C/M', '', ''),
(5025, 'Cedula Fisica', 600550192, 'VEGA MENDEZ JUAN JOSE', 'RIO CLARO BAMBEL 3 150MTS OESTE DE', 'BAR RANCHITOS.', '7898985', ''),
(5026, 'Cedula Fisica', 600550192, 'VEGA MENDEZ JUAN JOSE', 'R Claro   Bambel 3   400m Oeste   400', 'Sur del Ranchito..', '2789-8985', ''),
(5027, 'Cedula Fisica', 601770197, 'VEGA ORTIZ ALBERTO', 'PALMAR NORTE OFICIAL DE TRANSITO', '300 CALLE A BUENOS AIRES', '7867183', ''),
(5028, 'Cedula Fisica', 600570569, 'VEGA PEREZ NELSON', 'BERE LAUREL 700 Mts N FINCA CAIMITO', '<P> 15 C/M', '', ''),
(5029, 'Cedula Fisica', 600850387, 'VEGA PRENDAS DOLORES', 'GOLFITO   Bº BELLA VISTA CASA Nº8128', '6ta  FILA FRENTE A PULPERIA', '7750310', ''),
(5030, 'Cedula Fisica', 600850387, 'VEGA PRENDAS DOLORES', 'Golfito   Bº Bella Vista casa Nº8128', '6º fila fre Pulp.', '2775-2029', ''),
(5031, 'Cedula Fisica', 601420897, 'VEGA SALAS JOSE MANUEL', 'BAMBEL TRES DE RIO CLARO ENTRADA TR', 'ILLIZAS 600MTS CASA VERDE EN MADERA', '8589-3572', ''),
(5032, 'Cedula Fisica', 600270681, 'VEGA SOLORZANO ADELINA', '', '', '', ''),
(5033, 'Cedula Fisica', 601820359, 'VEGA TORRES CARMEN', 'BELLA LUZ DE LA VACA FRENTE A LA', 'ESCUELA', '7716347', ''),
(5034, 'Cedula Fisica', 602250952, 'VEGA TORRES YAMILETH', 'CIUDAD NEILY   LA COLINA DIAGONAL', 'AL SALON COMUNAL CASA Nº 35', '7833779', ''),
(5035, 'Cedula Fisica', 601310821, 'VEGA VARELA MARIA ANTONIA', 'PTO JIMENEZ LA PALMA FTE A SODA', 'MAYELI * CANCELA 11 CADA MES **', '7351129', ''),
(5036, 'Cedula Fisica', 601310821, 'VEGA VARELA MARIA ANTONIA', 'P Jiménez   La Palma Centro   Cabinas', 'Mary. Cel 8784-2312.', '2732-1129', ''),
(5037, 'Cedula Fisica', 501090658, 'VEGA VEGA AURELIA TIMOTEA', 'PIEDRAS BLANCASURB. VILLAS DEL SUR', 'CASA Nº 67  8 C/MES ***', '', ''),
(5038, 'Cedula Fisica', 500750843, 'VEGA VILLAGRA MODESTA', 'Alto San antonio  1Km al sur de esc', 'San Isidro   8646-9846', '', ''),
(5039, 'Cedula Fisica', 600990885, 'VEGA ZUMBADO ARACELY', 'Bº SAN MARTIN FRET AL SAMBAR MARINA', 'PELUQ VANESA <P>  03 C/M', '', ''),
(5040, 'Cedula Fisica', 602670892, 'VENEGAS ABARCA NIDIA', 'P Jiménez  Ñeque  cs cont Escuela.', 'Cel 8567-9515.', '8614-3127', ''),
(5041, 'Cedula Fisica', 155800830, 'VENEGAS CALERO MARITZA YAMILETH', 'P Jiménez  Pulp Monterrey 100 E', 'Cobrar Bar Las Tilapias. 8688-3076.', '8669-7874', ''),
(5042, 'Cedula Fisica', 600860213, 'VENEGAS CHAVES EUGENIA', 'GOLFITO   KMT 5 FRENTE A CASITAS DE', 'MADERA A LA ORILLA DEL MANGLAR.', '7750907', ''),
(5043, 'Cedula Fisica', 600860213, 'VENEGAS CHAVEZ MARIA EUGENIA.', 'GOLFITO HOTEL SIERRA LAVANDERIA', 'PAGA O3 Y 16 DE C/MES', '', ''),
(5044, 'Cedula Fisica', 501620123, 'VENEGAS DURAN ELIAS', 'COPA BUENA   Bº KENNEDY 120M SUR I-', 'GLESIA EVANGELICA.', '2734-0302', ''),
(5045, 'Cedula Fisica', 501100568, 'VENEGAS DURAN LIDIA', 'Copa Buena  300m Pulp. El Cometa cs', 'celeste.', '2734-0902', ''),
(5046, 'Cedula Fisica', 601520711, 'VENEGAS FERNADEZ LIDIA', 'COTO 42', '', '7811408', ''),
(5047, 'Cedula Fisica', 601520711, 'VENEGAS FERNANDEZ LIDIA ISABEL', 'COTO 42CONTIGUO A LA ESCUELA', '87626426', '2781-1226', ''),
(5048, 'Cedula Fisica', 601041444, 'VENEGAS HERRERA JOSE LUIS', 'GOLFITO   DE BAR EL RODEO 50 MTS', 'CALLE A LAS TRENZAS 27 DE C/M.', '750411', ''),
(5049, 'Cedula Fisica', 601370435, 'VENEGAS HERRERA JUAN LUIS', 'LAS TRENZAS CONTIGUO A IGLESIA', 'ASAMBLEAS DE DIOS.P 16 C/M.', '', ''),
(5050, 'Cedula Fisica', 601370435, 'VENEGAS HERRERA JUAN LUIS', 'GOLFITO LAS TRENSAS CONTIGUO A IGLE', 'SIA CATOLICA', '8692961', ''),
(5051, 'Cedula Fisica', 600480223, 'VENEGAS PARRA TEODORO', 'LA VIQUILLA #2 2da CASA DE LA IGLES', 'CATOLICA 200 Mts <P> 03 C/M', '', ''),
(5052, 'Cedula Fisica', 201250471, 'VENEGAS SUARES JUAN MARIA', 'GOLFITO KMT 23 DEL PUENTE COTO 1er', 'ENTRADA A MANO IZQ 400 MTS A M.DERE', '', ''),
(5053, 'Cedula Fisica', 600860213, 'VENEGAS VENEGAS MARIA EUGENIA', 'KM 5 DE GOLFITO   Casa blanca con ma', 'lla o bien en el Hotel Sierra.', '7750907', ''),
(5054, 'Cedula Fisica', 500880387, 'VIDAURRE GOMEZ PURA', 'La Cuesta   Ciudadela Tamayo Bloque', 'C casa No. 3 telefono 2732-23-47', '7322347', ''),
(5055, 'Cedula Fisica', 602070241, 'VIDAURRE GOMEZ SHIRLEY', 'RIO CLARO DE LA CRUZ ROJA 75 Mts E.', '<P> 02 C/M', '789', ''),
(5056, 'Cedula Fisica', 601090877, 'VIGIL FLORES FELIPA MARIA', 'Laurel  Km 27   1km sur de la escuela', '', '2780-1024', ''),
(5057, 'Cedula Fisica', 602580886, 'VIGIL MITRE AZUCENA.', 'Bereh de Laurel   1 kmt ESte de casa', 'de Manuel Masis. tel 83273040', '3273040', ''),
(5058, 'Cedula Fisica', 602750430, 'VIGIL MITRE NICANOR', 'Bereh de Laurel   a un kilometro', 'de Manurl Masis   88411375', '', ''),
(5059, 'Cedula Fisica', 600520005, 'VIGIL VASQUEZ LIDIA', 'LA CUESTA CAÑASA.', 'CANCELA PALMEROS', '', ''),
(5060, 'Cedula Fisica', 600520005, 'VIGIL VASQUEZ LIDIA', 'LA CUESTA CAÑAZA.', '', '2732-1826', ''),
(5061, 'Cedula Fisica', 600600081, 'VIGIL VASQUEZ MARIA', 'Colorado   de la Escuela 1 kilometro', 'y medio.', '8638-1280', ''),
(5062, 'Cedula Fisica', 601280687, 'VIGIL VIGIL JOSE MARIA', 'Laurel   Jobo   700 norte Pulp. Campe', 'sina. Cel 8803-6367.', '-', ''),
(5063, 'Cedula Fisica', 601550309, 'VIGÑETS ROJAS SONIA.', 'GOLFITO   Km. 3 CASA 17 FRENTE A', 'CASA DE TERESA ANDURAI.', '750254', ''),
(5064, 'Cedula Fisica', 110870920, 'VILCHEZ JIMENEZ HELLEN', 'San Vito   San Joaquin   Cs Nº 38', '8474-9054', '', ''),
(5065, 'Cedula Fisica', 500780032, 'VILLAFUERTE RAMIRES DIONICIO', 'FINCA 2-4 5TA FILA PENULTIMA CASA', '** 8 C/MES **', '7866601', ''),
(5066, 'Cedula Fisica', 600690275, 'VILLAFUERTE RAMIREZ MARIA B', 'Finca Puntarenas contiguo al', 'Pulperia de Chuta', '', ''),
(5067, 'Cedula Fisica', 600390164, 'VILLAGRA CARBALLO GERMAN', 'GOLFITO   DETRAS DEL ESTADIO', 'CASA Nº 4210 CASA ESQUINERA.', '7750030', ''),
(5068, 'Cedula Fisica', 600390164, 'VILLAGRA CARBALLO GERMAN', 'GOLFITO   DETRAS DEL ESTADIO', 'CASA Nº 4210 CASA ESQUINERA.', '7750038', ''),
(5069, 'Cedula Fisica', 600390164, 'VILLAGRA CARBALLO GERMAN', 'GOLFITO   DETRAS DEL ESTADIO', 'CASA Nº 4210 CASA ESQUINERA.', '7750038', ''),
(5070, 'Cedula Fisica', 601061360, 'VILLAGRA MORALES ALFREDO', 'GOLFITO   BELLA VISTA CASA 4570', '', '', ''),
(5071, 'Cedula Fisica', 601061360, 'VILLAGRA MORALES ALFREDO', 'GOLFITO   BELLA VISTA CASA 4570', '', '7750645', ''),
(5072, 'Cedula Fisica', 602550902, 'VILLAGRA MORALES ELIZABETH', 'COBRO EN HOSP GOLFO PREGUNTAR', 'RONALD BARRANTES OCAMPO ROPERIA', '7898161', ''),
(5073, 'Cedula Fisica', 602550902, 'VILLAGRA MORALES ELIZABETH', 'R CLARO   BAMBEL 03 400 M OESTE BAR', 'RANCHITO. BUSCAR EN HOSPITAL.', '8443433', ''),
(5074, 'Cedula Fisica', 601200199, 'VILLAGRA SIRIAS DINORAH.', 'CIUDAD CORTES   Bº EL EMBARCADERO', 'CONTG ANTG SEDE DE FUNDACOOP.', '', ''),
(5075, 'Cedula Fisica', 600390164, 'VILLAGRA VASQUEZ VICTORIA', 'GOLFITO DETRAS DEL ESTADIO CASA', 'N.4210 CASA ESQUINERA', '', ''),
(5076, 'Cedula Fisica', 500950567, 'VILLAGRA VIDAUBRE ELIZABETH', 'SAN JUAN BERE DEL CRUZE 350 SUR', 'PAGA EL 30 DE CADA MES', '', ''),
(5077, 'Cedula Fisica', 500950567, 'VILLAGRA VIDAUBRE ELIZABETH', 'SAN JUAN BERE DEL CRUCE 300 Mts', 'SUR <P> 15 C/M', '', ''),
(5078, 'Cedula Fisica', 900250234, 'VILLAGRA VILLAGRA AGRIPINA (PINA)', 'GOLF kmt 3 DETRAS DEL ABAST.', 'CASTILLO ENTR CONTG IGLESIA 16 C/M', '', ''),
(5079, 'Cedula Fisica', 601200989, 'VILLAGRA VILLAGRA CARMEN', 'pto jimenez barrio agujas en pulper', '', '3688278', ''),
(5080, 'Cedula Fisica', 601200989, 'VILLAGRA VILLAGRA CARMEN', 'PTO JIMINEZ AGUJAS Bº BONITO DEL', 'BAR ATLETICO 200 N. PULP KARLEN', '', ''),
(5081, 'Cedula Fisica', 601200989, 'VILLAGRA VILLAGRA CARMEN', 'PTO JIMENEZ   AGUJAS Bº BONITO', 'DEL BAR ATLETICO 200 N. PULP KARLEN', '', ''),
(5082, 'Cedula Fisica', 601081087, 'VILLAGRA VILLAGRA LUZ MARINA', 'GOLFITO DETRAS DE IGLESIA CATOLICA', 'Kmt 3 <P> 03 Y 16 C/M', '', ''),
(5083, 'Cedula Fisica', 501700657, 'VILLALOBOS ARAGON VIRGINIA CC XINIA', 'RESIDENCIAL UREÑA   CASA SECTOR 20', 'GOLFITO', '8604-0934', ''),
(5084, 'Cedula Fisica', 600300647, 'VILLALOBOS ARAYA JOSE FRANCISCO.', 'KMT 33  CONTIGUO A LA ESCUELA.RIO --', 'CLARO.', '', ''),
(5085, 'Cedula Fisica', 601360786, 'VILLALOBOS BLANCO ULISES', 'PUERTA DEL SOL PUEBLO NUEVO DEL', 'PUENTE LA BONITA 50MTS SUR', '8660-8852', ''),
(5086, 'Cedula Fisica', 700950078, 'VILLALOBOS CABALLARI XINIA.', 'FRENTE A INTERSECCION LAS TUCAS  ', 'BANBEL.', '7899478', ''),
(5087, 'Cedula Fisica', 202430021, 'VILLALOBOS HERNANDEZ MARIA DEL SOCO', 'SAN VITO   Bº EL SEGURO ENTRADA A', 'MANO IZQUIERADA 5ta CASA M.IZQUIERD', '2410672', ''),
(5088, 'Cedula Fisica', 501060864, 'VILLALOBOS JIMENEZ HECTOR', 'Fca ALAJUELA 300 Mts N D` ESC CONTG', 'A OFI ASBEPROFA <P> 19 C/M', '', ''),
(5089, 'Cedula Fisica', 501060864, 'VILLALOBOS JIMENEZ HECTOR', 'FICA ALAJUELA DE LA ESCUELA NAVIDAD', '300MTS NORTE', '2741-1135', ''),
(5090, 'Cedula Fisica', 600590053, 'VILLALOBOS MENDEZ FAUSTINO', 'R Claro   Km30   Parada 800 sur 250', 'Oeste fte Campo aterrizaje.', '8938-2381', ''),
(5091, 'Cedula Fisica', 600240407, 'VILLALOBOS MORERA ALBERTO.', 'DE ESCUELA LA ESCUADRA 1KM CAMINO A', 'CONTE.', '', ''),
(5092, 'Cedula Fisica', 602740744, 'VILLALOBOS NUÑEZ ESTHER', 'Bº RIO NUEVO CASA Nº 21 BLOQUE A', 'Cel 8627-0905.', '2783-6582', ''),
(5093, 'Cedula Fisica', 601480346, 'VILLALOBOS OVARES EVA', 'Chacarita   La Lucha   100 m entrada  ', '2º casa 2 pisos de cemento.', '2741-1340', ''),
(5094, 'Cedula Fisica', 500440936, 'VILLALOBOS PICADO HERIBERTO', 'GOLFITO BARRIO BELLA VISTA CASA #', '4376 BNCR 2DA. CASA', '', ''),
(5095, 'Cedula Fisica', 500440936, 'VILLALOBOS PICADO HERIBERTO', 'GOLFITO FRENTE AL JUSGADO 50 MTS', 'HACIA EL PIC-NIC.', '7751246', ''),
(5096, 'Cedula Fisica', 501160504, 'VILLALOBOS PICADO SARA', '', '', '', ''),
(5097, 'Cedula Fisica', 500730434, 'VILLALOBOS PICADO VICTOR JULIO', 'GOLFITO.', '', '', ''),
(5098, 'Cedula Fisica', 500730434, 'VILLALOBOS PICADO VICTOR JULIO', 'GOLFITO.', '', '', ''),
(5099, 'Cedula Fisica', 500730434, 'VILLALOBOS PICADO VICTOR JULIO', 'GOLFITO.', '', '', ''),
(5100, 'Cedula Fisica', 500730434, 'VILLALOBOS PICADO VICTOR JULIO', 'GOLFITO   EL CIVIL A UN COSTADO DE', 'LA ESCUELA ALVARO PARIS', '7750076', ''),
(5101, 'Cedula Fisica', 601520340, 'VILLALOBOS PIEDRA FELIX', '', '', '', ''),
(5102, 'Cedula Fisica', 600951122, 'VILLALOBOS RAMIREZ FLORA', 'B*ALEMANIA PALMAR NORTE BAZAR', 'PAVOREAL', '07  -', ''),
(5103, 'Cedula Fisica', 201900671, 'VILLALOBOS RODRIGUEZ MIGUEL ANGEL', 'BERE DE LA ESCUELA 500 N Y 100 OEST', 'D`LA ESC <P> 15 C/M', '', ''),
(5104, 'Cedula Fisica', 601940247, 'VILLALOBOS ROSALES LORENA', 'Palmar Norte   contiguo al templo', 'Asambleas de Dios.', '7866458', ''),
(5105, 'Cedula Fisica', 601940247, 'VILLALOBOS ROSALES LORENA', 'Palmar Norte   contiguo al templo', 'Asambleas de Dios.', '7866458', ''),
(5106, 'Cedula Fisica', 602420647, 'VILLALOBOS ROSALES MIGUEL', 'Laurel Vereh 500n de la escuela y', '100 este', '7800531', ''),
(5107, 'Cedula Fisica', 602420647, 'VILLALOBOS ROSALES MIGUEL', 'LAUREL VEREH DE LA ESCUELA 500 N. Y', '300 E. TIPO  *** CIENTE EXELENTE***', '7800531', ''),
(5108, 'Cedula Fisica', 602420647, 'VILLALOBOS ROSALES MIGUEL ANGEL', 'LAUREL   VEREH 500 N 1000 OESTE DE.', 'LA ESCUELA', '7800531', ''),
(5109, 'Cedula Fisica', 601030184, 'VILLALOBOS SALAS ANTONIO', 'Ciudad Cortés 125 Sur de la cantina', 'Barrio Lourdes.', '', ''),
(5110, 'Cedula Fisica', 601030184, 'VILLALOBOS SALAS ANTONIO.', 'CIUDAD CORTES   125 SUR DE LA CANTIN', 'EL JARDIN CERVECERIA B. CANADA 6CM.', '', ''),
(5111, 'Cedula Fisica', 900280135, 'VILLALOBOS SALAS ELIDA', 'Urbanización cont. Al Colegio 100 O', 'de Cablecentro.', '7355258', ''),
(5112, 'Cedula Fisica', 900280135, 'VILLALOBOS SALAS ELIDA', 'Pto jimenez  Cañaza entrada la cuna', '2 Km X la playa   8756-7368', '-', ''),
(5113, 'Cedula Fisica', 601210513, 'VILLALOBOS SALAS ERROL', 'GOLFITO   BARRIO BELLA VISTA CASA', '4388-B CALLE AL PIC-NIC', '7751331', ''),
(5114, 'Cedula Fisica', 602940057, 'VILLALOBOS SANCHEZ JHOANNY', 'Comte   La Esperanza   150m O Iglesia', 'Evangélica. 8722-0583', '2776-8010', ''),
(5115, 'Cedula Fisica', 600820918, 'VILLALOBOS SEGURA JOSE FELIPE', 'KL 16 GOLFITO TALLER B V Z PAGA EL', '<16> DE CADA MES.', '', ''),
(5116, 'Cedula Fisica', 600820918, 'VILLALOBOS SEGURA JOSE FELIPE', 'KL 16 GOLFITO TALLER KM14', '<16> DE CADA MES.', '', ''),
(5117, 'Cedula Fisica', 600820918, 'VILLALOBOS SEGURA JOSE FELIPE', 'Golfito  Km 16   75 m oeste Pulp. La', 'Flor; Taller Km14 Tel 2775-6112.', '2775-6098', ''),
(5118, 'Cedula Fisica', 601410763, 'VILLALOBOS SOLIS CLARA', 'oficinas del M.I.N.A.E Piedras', 'Blancas. o Cartonera Neily.', '7831631', ''),
(5119, 'Cedula Fisica', 601410763, 'VILLALOBOS SOLIS CLARA.', 'BARRIO LA CARTONERA   FRET A COMANDO', 'CASA 24102   C.N.P CONTIGUO AL I.C.E', '7835464', ''),
(5120, 'Cedula Fisica', 601320765, 'VILLALOBOS UMAÑA MARIA DE LOS ANGEL', 'C Cortés   Bº El Mango', 'Cel 8617-9164.', '2788-8546', ''),
(5121, 'Cedula Fisica', 900340767, 'VILLALOBOS VALVERDE FLORENCIA', '', '', '', ''),
(5122, 'Cedula Fisica', 900340767, 'VILLALOBOS VALVERDE FLORICELDA', 'CORTES ENTRADA AL MANGO 1er CASA', 'A LA PAR DE LA ROTONDA', '7888050', ''),
(5123, 'Cedula Fisica', 900340767, 'VILLALOBOS VALVERDE FLORICELDA', 'CORTES ENTRADA AL MANGO 1er CASA', 'A LA PAR DE LA ROTONDA', '7888050', ''),
(5124, 'Cedula Fisica', 600480782, 'VILLALOBOS VILLALOBOS ANDRES', 'NARANJO 500 SUR CALLE', 'SARAGOZA', '7830309', ''),
(5125, 'Cedula Fisica', 600930021, 'VILLALOBOS VILLEGAS ESTELA', 'Laurel   San Juan   de Iglesia', 'Asamableas de Dios 1300 m a Bereh N', '8796-0678', ''),
(5126, 'Cedula Fisica', 602210926, 'VILLALTA BONILLA JUAN', 'Ciudad Neily   Frente a Pensión Elvi', 'ra; Casa esquinera.', '', ''),
(5127, 'Cedula Fisica', 601710995, 'VILLALTA CAMARERO VIRGINIA', 'LA MONA GOLFITO   DE LA PARADA', 'MADRIGAL AL FONDO', '7755303', ''),
(5128, 'Cedula Fisica', 601190451, 'VILLALTA JIMENEZ ALFREDO', 'P Canoas  cobrar en U.N.A. casetilla', 'vive Bº S Juan frente a RTV.', '8534-3483', ''),
(5129, 'Cedula Fisica', 601400097, 'VILLALTA RODRIGUEZ ALMA NUVIA', 'PUERTO JIMENEZ   LA PALMA', 'TIENDA ROKY', '', ''),
(5130, 'Cedula Fisica', 601640097, 'VILLALTA RODRIGUEZ ALMA NUVIA', 'PUERTO JIMENEZ    LA PALMA TIENDA RO', 'KI', '7351001', ''),
(5131, 'Cedula Fisica', 601640097, 'VILLALTA RODRIGUEZ ALMA NUVIA', 'LA PALMA   PTO JIMENEZ', '', '2735-1001', ''),
(5132, 'Cedula Fisica', 601600770, 'VILLALTA SANCHEZ GENOVEVA', 'Golfito Barrio Bella Vista casa', '#4321', '7751212', ''),
(5133, 'Cedula Fisica', 601600770, 'VILLALTA SANCHEZ GENOVEVA', 'GOLFITO   I.D.E.M.', '', '7751212', ''),
(5134, 'Cedula Fisica', 601600770, 'VILLALTA SANCHEZ GENOVEVA', 'Golfito   Bella Vista   Calle al Pic-', 'nic. cs 4321 50m BNac.', '8967-0038', ''),
(5135, 'Cedula Fisica', 601600770, 'VILLALTA SANCHEZ GENOVEVA', 'Golfito   Bº bella vista Cs Nº4321', '75 Mts N Banco Nacional  ', '8967-0038', ''),
(5136, 'Cedula Fisica', 602510943, 'VILLALTA SANCHEZ MARIA', 'Finca 50 por la mulera  ', 'Cel 8850-5170.', '2775-0601', ''),
(5137, 'Cedula Fisica', 901010611, 'VILLANUEVA MORALES BRUNO', 'C Neily   S Rafael  500 oeste Escuela', '', '', ''),
(5138, 'Cedula Fisica', 602590679, 'VILLANUEVA MORALES MARUJA', 'P Canoas   Veracruz   150m Pulpería', '100m arriba de ciudadela.', '8764-9417', ''),
(5139, 'Cedula Fisica', 105450632, 'VILLANUEVA MORALES OLGA', 'San Vito   Urba san Joaquin   casa 59', 'esq verde   2773-4705 P OFICINA', '8814-9106', ''),
(5140, 'Cedula Fisica', 106510437, 'VILLANUEVA UMAÑA NIDIA', 'P Jiménez   150 oeste colegio. Ciclo', 'Paniagua.', '2735-5836', ''),
(5141, 'Cedula Fisica', 602030363, 'VILLANUEVA UMAÑA XINIA', 'pto jimenez gallardo contiguo a', 'pulp o urba ¿ x nidia la de piteroº', '', ''),
(5142, 'Cedula Fisica', 601440515, 'VILLAREAL DE GRACIA NORMA', 'PASO CANOAS DE IGLECIA METODISTA', '200 M SURESTE   2  DE  CADA MES', '2732-2397', ''),
(5143, 'Cedula Fisica', 603410629, 'VILLAREAL GUITIERREZ ODALVIS', 'San Martin 300 norte de la esc.', '(soda don juan) 89517521', '2732-1947', ''),
(5144, 'Cedula Fisica', 601690865, 'VILLARREAL AYALA BRIGIDO', 'CANOAS   Bº SAN MARTIN DEL CORRAL A', 'X ENTRADA M.DERCHA C. DE DOS PISOS', '7321384', ''),
(5145, 'Cedula Fisica', 601690865, 'VILLARREAL AYALA BRIGIDO', 'CANOAS   Bº SAN MARTIN DEL CORRAL A', 'ENTRADA M.DERCHA CANCELA 15 CADA ME', '7322275', ''),
(5146, 'Cedula Fisica', 501381256, 'VILLARREAL CARBALLO VICTORIA', 'P Norte   Bº Alemania   cs k4   x av21', 'cll 45A. Cel 8766-1597.', '2786-7317', ''),
(5147, 'Cedula Fisica', 601570514, 'VILLARREAL CONCEPCION ESPERANZA', 'PASO CANOAS 300 Mts OESTE DEL C.N.P', 'CONTG PULP.HACIA CABIN.AZTECA P.30', '', ''),
(5148, 'Cedula Fisica', 600970363, 'VILLARREAL LOPEZ DOMINGA', 'COBRAR EN COMISARIATO COTO 58', '<P> 02 C/M', '', ''),
(5149, 'Cedula Fisica', 600970363, 'VILLARREAL LOPEZ DOMINGA', 'Barrio el Carmen de Abrojo   Casa Nº', '45   Pulpería Yessenia.', '7898863', ''),
(5150, 'Cedula Fisica', 600970363, 'VILLARREAL LOPEZ DOMINGA', 'RIO CLARO DE LA G.A.R. 100N. Y', '100 AL ESTE CASA ESQUINERA.', '7898863', ''),
(5151, 'Cedula Fisica', 600970363, 'VILLARREAL LOPEZ DOMINGA', 'R Claro   Detrás Guardia Rural   dos', 'casas verdes. Cel 8854-4181.', '2789-8863', ''),
(5152, 'Cedula Fisica', 600900335, 'VILLARREAL ORTEGA FELICITA', 'PASO CANOAS   EL TRIUNFO despues del', 'puente 5ta casa mano derecha.', '2732-3155', ''),
(5153, 'Cedula Fisica', 500580442, 'VILLARREAL ORTEGA ISIDORA', 'GOLFITO KM.16 FTE A LA PLAZA', '**  CANCELA 5 C/MES PENCIONADA **', '7756083', ''),
(5154, 'Cedula Fisica', 501260105, 'VILLARREAL RUIZ AYDEN.', 'DEL DISPENSARIO 100 MTS A MANO IZQ-', 'COTO Nº58.', '', ''),
(5155, 'Cedula Fisica', 602950565, 'VILLARREAL UMAÑA GIOVANNY', 'Bº Carmen Abrojo   Casa 21   2º entra', 'da al Oeste MD. Papá de Pollino.', '8970-7403', ''),
(5156, 'Cedula Fisica', 800600057, 'VILLARREAL VILLARREAL AGUSTINA', 'La Cuesta 300 mts antes hacienda', 'La Palma carret a Colorado P.25 C/M', '', ''),
(5157, 'Cedula Fisica', 500630563, 'VILLARREAL VILLARREAL AYSI', 'golfito', '', '', ''),
(5158, 'Cedula Fisica', 500630563, 'VILLARREAL VILLARREAL DAYSI', '', '', '', ''),
(5159, 'Cedula Fisica', 500630563, 'VILLARREAL VILLARREAL DAYSI', 'GOLFITO KM 1 CASA #44-65 FTE A ES-', 'CUELA O EN CABINAS EL TUCAN 2c/mes', '7750553', ''),
(5160, 'Cedula Fisica', 500630563, 'VILLARREAL VILLARREAL DAYSI', 'Golfito   Km1   Hotel el Tucán.', '', '2775-0553', ''),
(5161, 'Cedula Fisica', 600520742, 'VILLARREAL VILLARREAL FANNY', 'Caracol de la Vaca', '', '2783-8379', ''),
(5162, 'Cedula Fisica', 600520740, 'VILLARREAL VILLARREAL FANNY', 'CARACOL DE LA VACA 600 MTS DE LA', 'ESCUELA. Cel 8383-4703.', '2783-8379', ''),
(5163, 'Cedula Fisica', 600260098, 'VILLARREAL VILLARREAL MARCOS', 'CIUDADELA MADRIGAL CONTIGUO A VIDEO', 'CALLE  PAVIMENTADA AL FONDO C MADER', '', ''),
(5164, 'Cedula Fisica', 601280835, 'VILLARREAL VILLARREAL PEDRO ANT.', 'CANOAS   CASA 500 MTS OESTE DE C.N.P', 'CONTIGUO A ADENICIA CONCEPCION.', '', ''),
(5165, 'Cedula Fisica', 603600266, 'VILLATORO MOYA HANSEL', 'Coto 52   la Zonita   50 m sur de Esc', 'Cs color verde. pasar en la tarde.', '2781-1107', ''),
(5166, 'Cedula Fisica', 602070260, 'VILLEDA GONZALEZ LEDA.', 'PALMAR NORTE 50 M SUR DEL BAZAR EL', 'BOTONCITO.', '756108', ''),
(5167, 'Cedula Fisica', 602070260, 'VILLEDA GONZALEZ LEDA.', 'PALMAR NORTE 50 M SUR DEL BAZAR EL', 'BOTONCITO.', '756108', ''),
(5168, 'Cedula Fisica', 600250334, 'VILLEGAS BUSTOS PEDRO', 'Del Almacen Kingo Ltda', '100 mts al este.', '7355233', ''),
(5169, 'Cedula Fisica', 600250334, 'VILLEGAS BUSTOS PEDRO', 'Del Almacen Kingo Ltda', '100 mts al este.', '7355233', ''),
(5170, 'Cedula Fisica', 601300390, 'VILLEGAS CARVAJAL CECILIA', 'GOLFITO LA MONA DEL 1er PUENTE', 'ENTRADA M. IZQ 400 M CASA EN CERRO', '', ''),
(5171, 'Cedula Fisica', 601300390, 'VILLEGAS CARVAJAL CECILIA', 'GOLFITO LA MONA DEL 1er PUENTE', 'ENTRADA M. IZQ 400 M CASA EN CERRO', '', ''),
(5172, 'Cedula Fisica', 601030390, 'VILLEGAS CARVAJAL CECILIA', 'GOLFITO LA MONA DEL 1er PUENTE', 'ENTRADA M. IZQ 400 M CASA EN CERRO', '', ''),
(5173, 'Cedula Fisica', 601300390, 'VILLEGAS CARVAJAL CECILIA', 'GOLFITO LA MONA DEL 1er PUENTE', 'ENTRADA M. IZQ 400 M CASA EN CERRO', '', ''),
(5174, 'Cedula Fisica', 601300390, 'VILLEGAS CARVAJAL CECILIA', 'GOLFITO LA MONA DEL 1er PUENTE', 'ENTRADA M. IZQ 400 M CASA EN CERRO', '7756297', ''),
(5175, 'Cedula Fisica', 601300390, 'VILLEGAS CARVAJAL CECILIA', 'Gofito La Mona   del 1º puente entra', 'da mano izq. 400 m casa en cerro.', '7756297', ''),
(5176, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'LA MUNICIPALIDAD DE GOLFITO.', 'AL OESTE TREB EN COOPEGAMBA <P> 16', '', ''),
(5177, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'LAS GAMBAS KMT 37 O EN MUNCIPALIDAD', 'DE GOLFITO.', '7750015', ''),
(5178, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'LAS GAMBAS KMT 37 O EN MUNCIPALIDAD', 'DE GOLFITO.', '7750015', ''),
(5179, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'RIO CLARO 50M DE CAB. PEREZ CASA', 'BLANCA ESQUIN.O MUNI GOLTO.8384827', '7750343', ''),
(5180, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'RIO CLARO 150M DE CABNINAS PEREZ', 'MUNICIP.GOLFITO *CANCELA 16', '7897140', ''),
(5181, 'Cedula Fisica', 601880394, 'VILLEGAS CASTRO ROXANA', 'R Claro  200 m Norte Cabinas Pérez.', 'o Munic. Golfito.', '', ''),
(5182, 'Cedula Fisica', 600510001, 'VILLEGAS CONTRERAS LORENA', 'C. NEILY   Bº 22 OCTUBRE', 'BLOQUE A-CASA # <P> 15 C/M', '', ''),
(5183, 'Cedula Fisica', 600510001, 'VILLEGAS CONTRERAS LORENA', 'C. NEILY   Bº 22 OCTUBRE', 'BLOQUE A-CASA # <P> 15 C/M', '', ''),
(5184, 'Cedula Fisica', 600510001, 'VILLEGAS CONTRERAS LORENA', 'C. NEILY   Bº 22 OCTUBRE', 'BLOQUE A-CASA # <P> 15 C/M', '', ''),
(5185, 'Cedula Fisica', 500690290, 'VILLEGAS GONZALEZ ANGEL', 'Bª EL BAMBU DE LA PULPERIA AMISTAD', '300 SUR Y 25 AL ESTE.', '8281265', ''),
(5186, 'Cedula Fisica', 600610853, 'VILLEGAS GONZALEZ MARIA CECILIA', 'C. González 200 m Escuela al fondo', 'en la vuelta m derecha.', '7831742', ''),
(5187, 'Cedula Fisica', 600870481, 'VILLEGAS GONZALEZ RAMON', 'Bº SAN JORGE   150 Mts ESTE DE LA', 'ESCUELA. <P> 25 C/M', '', ''),
(5188, 'Cedula Fisica', 603300638, 'VILLEGAS JIMENEZ JAIME', 'LA GUARIA DE PIEDRAS BLANCAS', 'Cel 8340-3283.', '8340-8396', ''),
(5189, 'Cedula Fisica', 502220372, 'VILLEGAS RAMIREZ ANGELA', 'R Claro   Coto 63   Pulpería González', 'Cel 8976-3608.', '2789-8364', ''),
(5190, 'Cedula Fisica', 600760750, 'VILLEGAS RAMIREZ FERNANDO', 'C Neily   Caracol Norte  a un costado', 'de la Escuela.', '2783-3458', ''),
(5191, 'Cedula Fisica', 501300433, 'VILLEGAS RAMIREZ GERARDO', 'RIO CLARO CARACOL 100 NORTE DE LA', 'ESCUELA MANO IZQUIERDA', '', ''),
(5192, 'Cedula Fisica', 501300433, 'VILLEGAS RAMIREZ GERARDO', 'Caracol Norte; 100 m Norte Escuela.', 'HERMANO SE VA A HACER CARGO.', '8723-5080', ''),
(5193, 'Cedula Fisica', 601290305, 'VILLEGAS RAMIREZ LEONICIA', 'Caracol Norte; 100 m Norte Escuela.', '', '-', ''),
(5194, 'Cedula Fisica', 601290305, 'VILLEGAS RAMIREZ LEONICIA', 'C Neily   Caracol Norte   300m antes', 'de la interamericana. Cel 8656-7964', '2783-1645', ''),
(5195, 'Cedula Fisica', 500600698, 'VILLEGAS SEQUEIRA JUAN', 'LA CAMPIÑA    700 MTS AL OESTE DE LA', 'PLAZA DE LA CAMPIÑA.', '', ''),
(5196, 'Cedula Fisica', 500600698, 'VILLEGAS SEQUEIRA JUAN', 'LA CAMPIÑA    700 MTS AL OESTE DE LA', 'PLAZA DE LA CAMPIÑA.', '2776-6120', ''),
(5197, 'Cedula Fisica', 601490343, 'VILLEGAS VALENCIANO IRIS', 'Bº SAN JORGE CONTG PULP LA AMISTAD', '1º ENTRADA S JORGE <P> 30 C/M', '7322228', ''),
(5198, 'Cedula Fisica', 600430876, 'VILLEGAS VILLEGAS FLORENCIO', 'La Campiña   1800m clle hacia Laurel', '', '8699-6035', ''),
(5199, 'Cedula Fisica', 501510196, 'VILLEGAS VILLEGAS VICTORIA', 'ROBLE   COSTADO SUR ESTE DE LA PLAZA', '1º CASA.', '7800094', ''),
(5200, 'Cedula Fisica', 603170707, 'VINDAS FERRETO YIRLANY', 'LA ESCUADRA DE CONTE SODA EL', 'ROBLE', '2776-6094', ''),
(5201, 'Cedula Fisica', 15490609, 'VINDAS MADRIGAL MARCO TULIO', 'PTO  JIMENEZ BARRIO EL BAMBU', 'PULPERIA JESLYN', '7355862', ''),
(5202, 'Cedula Fisica', 604180902, 'VINDAS MEXICANO YARELY', 'Golfito  B Vista  75 NO BNCR   Balcón', 'del Marisco. Cel 8946-7795.', '2775-0671', ''),
(5203, 'Cedula Fisica', 601850127, 'VINDAS ROJAS MARIA', 'GOLFITO   DETRAS COLEGIO', '<P> 16 C/M', '', ''),
(5204, 'Cedula Fisica', 104041443, 'VINDAS RUBI CARLOS LUIS', 'JARDIN   1 Kmt SUR DE LA ESCUELA', '<P> 30 C/M', '', ''),
(5205, 'Cedula Fisica', 104041443, 'VINDAS RUBI CARLOS LUIS', 'EL JARDIN 1 KM SUR DE LA ESCUELA', '', '', ''),
(5206, 'Cedula Fisica', 104041443, 'VINDAS RUBI CARLOS LUIS', 'EL JARDIN 1 KM SUR DE LA ESCUELA', 'inicia 06/11 paga por internet', '7801705', ''),
(5207, 'Cedula Fisica', 104041443, 'VINDAS RUBI CARLOS LUIS', 'Comte  El Jardín  1km Sur de Escuela.', '', '2780-1705', ''),
(5208, 'Cedula Fisica', 105070366, 'VINDAS RUBI GERARDO', 'La Cuesta   La Palma   800mts norte', 'de la Escuela.', '8798-6859', ''),
(5209, 'Cedula Fisica', 600940254, 'VINDAS VINDAS CARMEN.', 'LA ESPERANZA 800MTS NORTE DE LA', 'ESCUELA. P> 02 C/M', '', ''),
(5210, 'Cedula Fisica', 802072693, 'VIQUEZ CABALLERO LORENZO', 'Bº EL CARMEN PARADA DE PAMPERO', '100 MTS N. O DP GOLFITO VENDEDOR AM', '', ''),
(5211, 'Cedula Fisica', 601001167, 'VIQUEZ SIMSON JOSE JOAQUIN', 'CEIBO DE SAN VITO 50 NORTE DE', 'PLAZA DEPORTES', '7734882', ''),
(5212, 'Cedula Fisica', 600250287, 'VIUDA DE AGUERO MARIA ANDREA', 'NAZARET DE GOLFITO   DE LA ESCUELA', '200 MTS', '', ''),
(5213, 'Cedula Fisica', 103160164, 'WEBB CASASOLA ELMER NELSON', 'Ciudad Comte un kilometro al Noroes', 'te', '8305-3906', ''),
(5214, 'Cedula Fisica', 602410711, 'WONG MIRANDA JORGE', 'Ciudad Cortés   Centro.', '', '8825-4294', ''),
(5215, 'Cedula Fisica', 602980138, 'WONG MIRANDA LILLIAM LISETH', 'C Cortés   El Embarcadero   300 sur', 'Super el Pozo. cel 8983-6426.', '2788-7755', ''),
(5216, 'Cedula Fisica', 603770643, 'WUANDIKE CORTES BOANERGE', 'SANTA LUCIA CLIENTE CONOSIDO', '** CANCELA PAGO PALMEROS **', '', ''),
(5217, 'Cedula Fisica', 103360560, 'XXXXXX GUILARTE LUIS ALBERTO', 'PASO CANOAS AL FRENTE DE LA ADUANA', 'TICA EN CABINAS EL HOGAR P.15 C/M', '782301', ''),
(5218, 'Cedula Fisica', 102040661, 'ZAENZ CHINCHILLA TERESA', 'GOLFITO INVU  LA ROTONDA FRENTE', 'CANAL TV. 32 P. 03 C/M', '', ''),
(5219, 'Cedula Fisica', 102040661, 'ZAENZ CHINCHILLA TERESA', 'GOLFITO INVU  LA ROTONDA DIAGONNAL', 'RADIO GOLFITO CASA Nº 6', '7750436', ''),
(5220, 'Cedula Fisica', 102010981, 'ZALAZAR ZUÑIGA CARLOS ALBERTO', 'BAMBEL   SOBRE LA CARRETERA A M.DERE', 'EN UN BAJO   100 ANTES DE PUL GARBAN', '7899717', ''),
(5221, 'Cedula Fisica', 501230638, 'ZAMBRANO ZAMBRANO CARLOS ALBERTO', 'Sierpe   Pueblo Nuevo   contiguo al', 'Pool.', '2788-1334', ''),
(5222, 'Cedula Fisica', 203110077, 'ZAMORA CALVO LIGIA', 'La puerta del Sol de Tinoco. Abast.', 'Zamora contiguo al punte la Bonita.', '', ''),
(5223, 'Cedula Fisica', 203110077, 'ZAMORA CALVO LIGIA.', 'LA PUERTA DEL SOL DE TINOCO ABSTECE', 'DOR ZAMORA CONTIGUO AL Pte la bonit', '7866140', ''),
(5224, 'Cedula Fisica', 602080082, 'ZAMORA GUSTAVINO BENJAMIN', 'LAS CARRETASALA DERECHA  HACIA SANT', 'LUCIA A LA DECHA.', '7838231', ''),
(5225, 'Cedula Fisica', 602200569, 'ZAMORA GUSTAVINO LIDIA', 'LAUREL  BELLA LUZ ENTRADA ANTIGUA CA', 'RRETERA', '7838392', ''),
(5226, 'Cedula Fisica', 602520508, 'ZAMORA GUSTAVINO MIRNA', 'LAS CARRETAS 2 KM CALLE A SANTA', 'LUCIA MANO ISQ.', '', ''),
(5227, 'Cedula Fisica', 601450157, 'ZAMORA JIMENEZ ALVARO', 'naranjo  urbanizacion naranjal casa', 'n121 casa color verde', '8635-5078', ''),
(5228, 'Cedula Fisica', 603000255, 'ZAMORA JIMENEZ ROGER', 'DOMINICALITO POZO AZUL CASA *32', '86954915', '8973-7969', ''),
(5229, 'Cedula Fisica', 501290879, 'ZAMORA PEREZ BLANCA ROSA', 'CORONADO POR EL PUENTE', '', '', ''),
(5230, 'Cedula Fisica', 603210023, 'ZAPATA MARTINEZ DAISY', 'P Canoas   Ent Tunel cs esquinera.', '', '8656-0527', ''),
(5231, 'Cedula Fisica', 900420954, 'ZAPATA ZAPATA PASCUAL', 'PASO CANOAS CALLE MATIAS 100MTS DE', 'LA INTERAMERICANA CONTIGUO ALCIBIAD', '8608-6545', ''),
(5232, 'Cedula Fisica', 800340656, 'ZAVALA ORTEGA DANIEL', 'CANOAS TONO PELON TERCERA CASA DESP', 'UES DE PLAZA DEL BANCO NACIONAL', '7833296', ''),
(5233, 'Cedula Fisica', 602210386, 'ZELAYA CHAVARRIA TOMAS', 'Golfito  La Mona. Afiliado por Paola', 'Cel 8790-2721.', '8620-6950', ''),
(5234, 'Cedula Fisica', 500410927, 'ZELAYA VISCAI LUISA', 'Bº San Jorge entrada los tanques', '100 Mts Oeste y 25 Norte  ', '2732-2701', ''),
(5235, 'Cedula Fisica', 500410927, 'ZELAYA VIZCAL LUISA', 'Bº San Jorge   100 m Oeste Tanques', '25 Norte.', '2732-2701', ''),
(5236, 'Cedula Fisica', 110940626, 'ZELEDON FALLAS LUIS ANGEL', 'C Neily   Caracol Norte   300m norte', 'de la Escuela.', '8633-1745', ''),
(5237, 'Cedula Fisica', 601860055, 'ZEPEDA CHAMORRO Mª JESUS', '', '', '', ''),
(5238, 'Cedula Fisica', 601860055, 'ZEPEDA CHAMORRO MARIA DE JESUS', 'C Neily   C González   100 n de Escue', 'la.', '8748-9726', ''),
(5239, 'Cedula Fisica', 600610427, 'ZEQUEIRA DIAZ JOSEFA AURELIA', 'COTO 49    CONTIGO A TELEFONO PUBLIC', 'CASA DE ALTO COLOR VERDE', '', ''),
(5240, 'Cedula Fisica', 501080486, 'ZUMBADO ARGUEDAS EVELIO', 'Palmar Sur   Bº Alemania   cs J14.', '', '8674-3447', ''),
(5241, 'Cedula Fisica', 602370586, 'ZUÑIGA ALVAREZ ELGA LETICIA', 'GOLF   km 5 del Castillo 4ta Cs M/I', 'color melon    8312-9247', '8507-2623', ''),
(5242, 'Cedula Fisica', 601910471, 'ZUÑIGA ARAYA MIGUEL', 'LA ESPERANZA DE RIO CLARO 100 OESTE', 'DE LA DELEGACION', '7897341', ''),
(5243, 'Cedula Fisica', 601910471, 'ZUÑIGA ARAYA MIGUEL', 'R Claro   La Esperanza   100m O Dele-', 'gación.', '8616-3369', ''),
(5244, 'Cedula Fisica', 103990115, 'ZUÑIGA ARIAS ADELIA', 'Chacarita   del servicentro 150 mts', 'calle a palmar   reparacion llantas', '', ''),
(5245, 'Cedula Fisica', 601450351, 'ZUÑIGA BERROCAL Mª LUISA', 'TINOCO CONTIGUO AL PUENTE.', 'PAGA OFICINA', '', ''),
(5246, 'Cedula Fisica', 600600542, 'ZUÑIGA BERROCAL MARGARITA', 'Coyoche a un costado de la Escuela.', '', '2783-8433', ''),
(5247, 'Cedula Fisica', 600600542, 'ZUÑIGA BERROCAL MARGARITA', 'Coyoche de laurel   detras de la', 'Escuela   2783-8433', '8783-8551', ''),
(5248, 'Cedula Fisica', 300770809, 'ZUÑIGA CALDERON BOLIVAR.', 'Golfito  Barrio San Juan contiguo a', 'Colegio cruzando el puente P.16 C/m', '', ''),
(5249, 'Cedula Fisica', 800350661, 'ZUÑIGA CHAMORRO CARLOS ALBERTO', 'Km 37 fte Testigos Jehová. Paga', 'Nidia SJ.Ent Rec a Blanca Z. Km 37.', '2511691', ''),
(5250, 'Cedula Fisica', 203840213, 'ZUÑIGA CHAVES DINORAH CC NORA', 'JIMENEZ 50MT SUR DE LA ESCUELA LA A', 'MAPOLA', '7351334', ''),
(5251, 'Cedula Fisica', 204390055, 'ZUÑIGA CHAVEZ SONIA', 'LA AMAPOLA   5O SUR DE LA ESCUELA', '', '7351334', ''),
(5252, 'Cedula Fisica', 602200295, 'ZUÑIGA CORDERO WILLIAM', 'CIUDAD NEILY   EBANISTERIA CONTIGUO', 'AL PUENTE C-N ANTIGUOA RASTRO.', '7833802', ''),
(5253, 'Cedula Fisica', 180071475, 'ZUÑIGA DELGADO ARTURO', 'Fca 1 de telef publico 2da Cs hacia', 'el fondo Cs Color verde de Madera.', '8910-0162', ''),
(5254, 'Cedula Fisica', 602040104, 'ZUÑIGA FONCECA RODOLFO', 'KM. 27 150M SUR  DE LA ESCUELA .', '** CANCELA PAGO DE PALMEROS  **', '7801052', ''),
(5255, 'Cedula Fisica', 602040104, 'ZUÑIGA FONSECA RODOLFO', 'Laurel   Km 27 150 Mts N de la Esc', '', '8609-8119', ''),
(5256, 'Cedula Fisica', 501570936, 'ZUÑIGA GARCIA GILVIADES', 'SAN BUENAS A UN COSTADO SODA CARMEN', '80 MTS CASA', '8977-6074', ''),
(5257, 'Cedula Fisica', 502090045, 'ZUÑIGA GONZALEZ ALVARO', 'Agua Buena  1km E 75m S Igl catolica', 'cs blanca tapia roja. 8819-0347.', '2734-0135', ''),
(5258, 'Cedula Fisica', 603340805, 'ZUÑIGA GUTIERREZ FLORIBETH', 'C. Neily   La Fortuna   contiguo a la', 'plaza . Pulp. Fortuna Cel 8793-4362', '2783-5003', ''),
(5259, 'Cedula Fisica', 500490671, 'ZUÑIGA GUTIERREZ LEONARDO', 'COLORADO PULP Y CANTINA LA', 'CONCEPCION <P> OFICINA.', '', ''),
(5260, 'Cedula Fisica', 500490671, 'ZUÑIGA GUTIERREZ LEONARDO', 'COLORADO PULP Y CANTINA LA', 'CONCEPCION <P> OFICINA.', '', ''),
(5261, 'Cedula Fisica', 602950228, 'ZUÑIGA GUTIERREZ WILBERTH', 'RIO NUEVO   CASA NUEVA ENTRADA PULP', 'Y PULES   300 N. CASA 14 G.', '7836914', ''),
(5262, 'Cedula Fisica', 102340889, 'ZUÑIGA HERNANDEZ CARMEN', '', '', '', ''),
(5263, 'Cedula Fisica', 108060069, 'ZUÑIGA JIMENEZ CARLOS LUIS', 'CIUDAD NEILLY BARRIO SAN JUAN', 'SURTIDOR EL DIAMANTE', '', ''),
(5264, 'Cedula Fisica', 602160322, 'ZUÑIGA LOPEZ AURELIO', 'Venecia   cs fte a Iglesia Católica.', '', '2786-3300', ''),
(5265, 'Cedula Fisica', 602160322, 'ZUÑIGA LOPEZ AURELIO', 'Venecia   cs fte a Iglesia Católica.', '', '2786-3300', ''),
(5266, 'Cedula Fisica', 501100563, 'ZUÑIGA MOLINA ALBANO', 'Palmar Sur   costado sur de Asamnble', 'as de Dios  ', '7866507', ''),
(5267, 'Cedula Fisica', 501510814, 'ZUÑIGA MOLINA ALEJANDRO', 'SANTA LUCIA   200 O DE LA ESCUELA', 'DESPUES DEL PUENTE. 18 C-MES', '', ''),
(5268, 'Cedula Fisica', 603690756, 'ZUÑIGA MOLINA JAVIER', 'LA MONA DETRAS ESCUELA GUARDA', 'GOLFITO', '8685-7162', ''),
(5269, 'Cedula Fisica', 201400439, 'ZUÑIGA MONGE FRANCISCO', 'GOLFITO KM.7 DIAGONAL A LA PULPERIA', 'DEL RETORNO 200 MTS. HACIA GOLFITO', '7751089', ''),
(5270, 'Cedula Fisica', 103931211, 'ZUÑIGA MORA VIRGINIA', 'SANTA ROSA PULPERIA EL CRUCE', '', '', ''),
(5271, 'Cedula Fisica', 502270850, 'ZUÑIGA NOGUERA MARIA', 'RIO CLARO   300 MTRS NORTE DEL', 'PLANTEL DEL MOPT', '2789-8679', ''),
(5272, 'Cedula Fisica', 601570230, 'ZUÑIGA OSEGEDA ARGENTINA', 'Rio Claro   La Esperanza   Ciud Pérez', 'Cs Nº12.', '2789-9862', ''),
(5273, 'Cedula Fisica', 601370055, 'ZUÑIGA OSEGUEDA MARVIN', 'Golfito Km1. Quinta Fila Casa #8101', 'Trabaja en el I.C.E. Oficinas', '750123', ''),
(5274, 'Cedula Fisica', 600230671, 'ZUÑIGA PERAZA VICTOR.', 'SANTA LUCIA   200 O DE LA ESCUELA', 'DESPUES DEL PUENTE. 18 C-MES', '', ''),
(5275, 'Cedula Fisica', 601100243, 'ZUÑIGA PEREZ RAFAEL ANGEL', 'Km 37   Villa Briceño  fte salon test', 'de Jehova. 8701-8525', '2741-8171', ''),
(5276, 'Cedula Fisica', 901030063, 'ZUÑIGA ROMAN CECILIA', 'AGUAS CLARAS CONTIGUO AL TALLER', 'NAVARRO 85153329', '2773-3132', ''),
(5277, 'Cedula Fisica', 600560656, 'ZUÑIGA ROSALES JOSE DANIEL.', 'LA BOLSA KMT 01.', '', '775', ''),
(5278, 'Cedula Fisica', 501140411, 'ZUÑIGA ROSALES JOSE FORTUNO', 'CUIDADELA TAMAYO FRENTE AL SALON', 'COMUNAL PULP. MADISON', '2732-3805', ''),
(5279, 'Cedula Fisica', 601470378, 'ZUÑIGA SALAS DOMINGO', 'AGUA BUENA   400 Mts ANTES DE LA', 'ESCUELA Sta MARTHA <P> 05 C/M', '', ''),
(5280, 'Cedula Fisica', 601280491, 'ZUÑIGA SOLANO ELIZABETH', 'Paso Canoas   Veracruz.', '', '8632-9306', ''),
(5281, 'Cedula Fisica', 501310620, 'ZUÑIGA SOLORZANO GERARDO', 'Coto 47  cs 11224 x entrada a labora', 'torio.', '', ''),
(5282, 'Cedula Fisica', 602970234, 'ZUÑIGA VALERIN MAIKEL', 'B GUAICARA RIO CLARO', '', '8632-0229', ''),
(5283, 'Cedula Fisica', 602970234, 'ZUÑIGA VALERIN MAIKEL ANTONIO', 'R Claro  400 N 300 O Parque infantil', 'Cobrar Deposito local 28', '2789-8792', ''),
(5284, 'Cedula Fisica', 601580960, 'ZUÑIGA VALLEJOS JOSE ANGEL', 'Cortés   1km Sur Escuela Ojo de Agua', 'calle a las parcelas. Cel 8983-9053', '2786-8693', ''),
(5285, 'Cedula Fisica', 105890297, 'ZUÑIGA VARGAS FLOR.', 'RIO CLARO 150 MTS NORTE SALON', 'COMUNAL. P 03 c/m', '7899518', ''),
(5286, 'Cedula Fisica', 602980414, 'ZUÑIGA VARGAS LEANDRO', 'COTO 52 X LA PULPERIA', '** FECHA DE PAGO 30 C/MES **', '7811393', ''),
(5287, 'Cedula Fisica', 104850341, 'ZUÑIGA VARGAS LUIS.', 'RIO CLARO   CONTG A LA CASONA DE LOS', 'MARISCOS.', '2789-9125', ''),
(5288, 'Cedula Fisica', 600520964, 'ZUÑIGA VEGA TERESA.', 'NO SE REGISTRO.', '', '', ''),
(5289, 'Cedula Fisica', 600520964, 'ZUÑIGA VEGA TERESA.', 'NO SE REGISTRO.', '', '', ''),
(5290, 'Cedula Fisica', 600520964, 'ZUÑIGA VEGA TERESA.', 'RIO CLARO 500 MTS SUR ESTE DEL', 'TRANSITO', '7899128', ''),
(5291, 'Cedula Fisica', 600390771, 'ZUÑIGA VILLANUEVA AGAPITO', 'TAMARINDO CENTRO <P> 30 C/M', '', '', ''),
(5292, 'Cedula Fisica', 600390771, 'ZUÑIGA VILLANUEVA AGAPITO', 'TAMARINDO CENTRO <P> 30 C/M', '', '7800243', ''),
(5293, 'Cedula Fisica', 603090400, 'ZUÑIGA ZELEDON RUTH', 'CORONADO SAN BUENAS AUN COSTADO', 'SODA CARMEN 8MTS 8778/7377', '8977-6074', ''),
(5294, 'Cedula Fisica', 604050141, 'ZUÑIGA ZUNIGA WILBERT', 'Ciudad Neily   Bº la fortuna 75 oest', 'de pulp   frandy   8545-7891', '', ''),
(5295, 'Cedula Fisica', 601430886, 'ZUÑIGA ZUÑIGA ABELINO', 'VENECIA CASA FRTE A IGLESIA C.COLOR', 'VERDE', '7186539', ''),
(5296, 'Cedula Fisica', 500640411, 'ZUÑIGA ZUÑIGA FIDELIA C.C. SELINA', 'Bº EL CARMEN EL INVU 2DA CASA DEP.', 'DE LA PANADERIA..', '2783-2281', ''),
(5297, 'Cedula Fisica', 800410692, 'ZUÑIGA ZUÑIGA FRANCISCO', 'La Cuesta 200 mts sur del Gimnacio.', '', '7322960', ''),
(5298, 'Cedula Fisica', 800410692, 'ZUÑIGA ZUÑIGA FRANCISCO', 'La Cuesta 200 mts sur del Gimnacio.', '', '7322960', ''),
(5299, 'Cedula Fisica', 600590978, 'ZUÑIGA ZUÑIGA GUMERCINDO', '1 Kmt D`ENTRADA Fca ALAJL C COLOR', 'NATURAL SOBRE ITERAM <P> 19 C/M', '-', ''),
(5300, 'Cedula Fisica', 600590978, 'ZUÑIGA ZUÑIGA GUMERCINDO', 'FCA ALAJUELA DE LA ENTRADA 1KM.', 'AL ESTE CASA COLOR NATURAL', '', ''),
(5301, 'Cedula Fisica', 602810336, 'ZUÑIGA ZUÑIGA JEFFRY', 'R Claro   La Esperanza   Ciud Pérez.', 'cs 24. Cel 8638-2410.', '2775-1404', ''),
(5302, 'Cedula Fisica', 502580518, 'ZUÑIGA ZUÑIGA LIDIA', 'R Claro   Santiago   contiguo a Plan-', 'tel del ICE.', '8741-6890', ''),
(5303, 'Cedula Fisica', 600790805, 'ZUÑIGA ZUÑIGA MARIA E.', 'P Jimenez   La Amapola 150 m Norte', 'de Lechería.', '2735-5451', ''),
(5304, 'Cedula Fisica', 600790805, 'ZUÑIGA ZUÑIGA MARIA ELSIE', 'pto jimenez la amapola 150 mts nort', 'de la lecheria', '3648418', ''),
(5305, 'Cedula Fisica', 600610916, 'ZUÑIGA ZUÑIGA MARIA ESTEBANA', 'HATILLO 8', '', '', ''),
(5306, 'Natural', 604140385, 'yoel cerdas villalobos', 'ciudad cortes', 'osa', '87109682', 'yoel1202');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `Codigo_color` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`Codigo_color`, `descripcion`) VALUES
(1, 'Selecciona una opción'),
(2, 'azul'),
(3, 'cafe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Codigo_Compras` int(11) NOT NULL,
  `Codigo_Proveedor` int(11) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Serie` char(3) NOT NULL,
  `Nro_Documento` varchar(7) NOT NULL,
  `Total` decimal(19,4) NOT NULL,
  `Tipo_Compra` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `Codigo_Detalle_Compras` int(11) NOT NULL,
  `Codigo_Compras` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Precio_Compra` decimal(19,4) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Igv` decimal(19,4) NOT NULL,
  `Sub_Total` decimal(19,4) NOT NULL,
  `utillidad` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_item`
--

CREATE TABLE `detalle_item` (
  `Codigo_Detalle_Item` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Material` varchar(20) NOT NULL,
  `Stock` int(11) NOT NULL,
  `RutaImagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_item`
--

INSERT INTO `detalle_item` (`Codigo_Detalle_Item`, `Codigo_Item`, `Descripcion`, `Color`, `Material`, `Stock`, `RutaImagen`) VALUES
(1, 10, 'ataud de madera', 'cafe', 'madera', 0, 'C:\\Funeraria\\Producto\\Ataud-10.jpg'),
(2, 15, 'de madera', 'cafe', 'madera', 0, 'C:\\Funeraria\\Producto\\Ataud-15.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_plan_funerario`
--

CREATE TABLE `detalle_plan_funerario` (
  `Codigo_Detalle_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_plan_funerario`
--

INSERT INTO `detalle_plan_funerario` (`Codigo_Detalle_Plan_Funerario`, `Codigo_Plan_Funerario`, `Codigo_Item`) VALUES
(1, 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `CodigoDetalleVenta` int(11) NOT NULL,
  `Codigo_Ventas` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Venta` decimal(19,4) NOT NULL,
  `Igv` decimal(19,4) NOT NULL,
  `Dscto` decimal(19,4) DEFAULT 0.0000,
  `Sub_Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difunto`
--

CREATE TABLE `difunto` (
  `Codigo_Difunto` int(11) NOT NULL,
  `Dni` char(8) NOT NULL,
  `Nombres` varchar(60) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Fecha_Fallecimiento` date NOT NULL,
  `Hora` time NOT NULL,
  `Causa_Muerte` varchar(200) DEFAULT NULL,
  `Lugar_Fallecimiento` varchar(100) DEFAULT NULL,
  `Estado_Civil` varchar(15) NOT NULL,
  `Ruta_Acta_Difunto` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_venta`
--

CREATE TABLE `informacion_venta` (
  `Codigo_Informacion_Venta` int(11) NOT NULL,
  `Codigo_Ventas` int(11) NOT NULL,
  `Dirección_Velatorio` varchar(120) NOT NULL,
  `Cementerio` varchar(120) NOT NULL,
  `Dirección_Sepelio` varchar(120) NOT NULL,
  `Fecha_Sepelio` date NOT NULL,
  `Hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `Codigo_Item` int(11) NOT NULL,
  `Codigo_Tipo_Item` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`Codigo_Item`, `Codigo_Tipo_Item`, `Nombre`, `Precio`) VALUES
(3, 1, 'ataud', '0'),
(10, 1, 'ataud', '0'),
(11, 2, 'to', '0'),
(14, 2, 'TRANSPORTE A DOMINICAL', '36000'),
(15, 1, 'ataul', '0'),
(17, 2, 'flores rosa', '1'),
(18, 2, 'flores', '10000'),
(19, 2, 'flores verde', '20000'),
(20, 2, 'cepelio', '1000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `Codigo_material` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`Codigo_material`, `descripcion`) VALUES
(1, 'Selecciona una opción'),
(2, 'cemento'),
(3, 'madera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `Codigo_Parentesco` int(11) NOT NULL,
  `Codigo_Cliente` int(11) NOT NULL,
  `Codigo_Difunto` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `personal` varchar(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `plan` varchar(20) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `difunto` varchar(20) NOT NULL,
  `provedor` varchar(20) NOT NULL,
  `compra` varchar(20) NOT NULL,
  `venta` varchar(20) NOT NULL,
  `fk_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `personal`, `producto`, `plan`, `cliente`, `difunto`, `provedor`, `compra`, `venta`, `fk_usuario`) VALUES
(17, 'Todos', 'Todos', 'Todos', 'Todos', 'Todos', 'Todos', 'Todos', 'Todos', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Codigo_Personal` int(11) NOT NULL,
  `Dni` char(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(70) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`Codigo_Personal`, `Dni`, `Nombre`, `Apellidos`, `Cargo`, `Direccion`, `Telefono`, `Email`, `Estado`) VALUES
(3, '604140385', 'Yoel Andrey', 'Cerdas Villalobos', 'vendedor', 'ciudad cortes', '87109682', 'yoel1202', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_funerario`
--

CREATE TABLE `plan_funerario` (
  `Codigo_Plan_Funerario` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Precio` decimal(19,4) NOT NULL,
  `RutaImagen` varchar(100) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plan_funerario`
--

INSERT INTO `plan_funerario` (`Codigo_Plan_Funerario`, `Descripcion`, `Precio`, `RutaImagen`, `Estado`) VALUES
(1, 'a', '36000.0000', 'C:\\Funeraria\\Planes Funerarios\\Planes-1.jpg', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Codigo_Proveedor` int(11) NOT NULL,
  `RUC` char(11) NOT NULL,
  `Razon_Social` varchar(200) NOT NULL,
  `Representante` varchar(150) NOT NULL,
  `Celular_Representante` varchar(12) DEFAULT NULL,
  `Telefono_Empresa` varchar(70) DEFAULT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Codigo_Proveedor`, `RUC`, `Razon_Social`, `Representante`, `Celular_Representante`, `Telefono_Empresa`, `Direccion`, `Email`) VALUES
(1, '3101111305', 'componentes el orbe s.a', 'carlos', '604140385', '25072585', 'osas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `codigo_servicio` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `km` decimal(10,0) NOT NULL,
  `precio_km` decimal(10,0) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`codigo_servicio`, `Codigo_Item`, `tipo`, `km`, `precio_km`, `precio`) VALUES
(3, 14, 'Transporte', '60', '500', '30000'),
(4, 17, 'Floristeria', '1', '1', '0'),
(5, 18, 'Floristeria', '0', '0', '0'),
(6, 20, 'Floristeria', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_item`
--

CREATE TABLE `tipo_item` (
  `Codigo_Tipo_Item` int(11) NOT NULL,
  `Descripción` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_item`
--

INSERT INTO `tipo_item` (`Codigo_Tipo_Item`, `Descripción`) VALUES
(1, 'Producto'),
(2, 'Servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo_Usuario` int(11) NOT NULL,
  `Codigo_Personal` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo_Usuario`, `Codigo_Personal`, `Usuario`, `Clave`) VALUES
(10, 3, 'administrador', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Codigo_Ventas` int(11) NOT NULL,
  `Codigo_Cliente` int(11) NOT NULL,
  `Codigo_Personal` int(11) NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Serie` char(3) NOT NULL,
  `NroComprobante` char(7) NOT NULL,
  `FechaVenta` date NOT NULL,
  `Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codigo_Cliente`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`Codigo_color`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Codigo_Compras`),
  ADD KEY `FK__Compras__Codigo___45F365D3` (`Codigo_Proveedor`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`Codigo_Detalle_Compras`),
  ADD KEY `FK__Detalle_C__Codig__49C3F6B7` (`Codigo_Compras`),
  ADD KEY `FK__Detalle_C__Codig__4AB81AF0` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_item`
--
ALTER TABLE `detalle_item`
  ADD PRIMARY KEY (`Codigo_Detalle_Item`),
  ADD KEY `FK__Detalle_I__Codig__29572725` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  ADD PRIMARY KEY (`Codigo_Detalle_Plan_Funerario`),
  ADD KEY `FK__Detalle_P__Codig__2F10007B` (`Codigo_Plan_Funerario`),
  ADD KEY `FK__Detalle_P__Codig__300424B4` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`CodigoDetalleVenta`),
  ADD KEY `FK__Detalle_V__Codig__52593CB8` (`Codigo_Ventas`),
  ADD KEY `FK__Detalle_V__Codig__534D60F1` (`Codigo_Item`);

--
-- Indices de la tabla `difunto`
--
ALTER TABLE `difunto`
  ADD PRIMARY KEY (`Codigo_Difunto`);

--
-- Indices de la tabla `informacion_venta`
--
ALTER TABLE `informacion_venta`
  ADD PRIMARY KEY (`Codigo_Informacion_Venta`),
  ADD UNIQUE KEY `Codigo_Ventas` (`Codigo_Ventas`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Codigo_Item`),
  ADD KEY `FK__Item__Codigo_Tip__267ABA7A` (`Codigo_Tipo_Item`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`Codigo_material`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`Codigo_Parentesco`),
  ADD UNIQUE KEY `Codigo_Difunto` (`Codigo_Difunto`),
  ADD KEY `FK__Parentesc__Codig__403A8C7D` (`Codigo_Cliente`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `fk_ondelete` (`fk_usuario`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Codigo_Personal`);

--
-- Indices de la tabla `plan_funerario`
--
ALTER TABLE `plan_funerario`
  ADD PRIMARY KEY (`Codigo_Plan_Funerario`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Codigo_Proveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`codigo_servicio`),
  ADD UNIQUE KEY `Codigo_Item` (`Codigo_Item`);

--
-- Indices de la tabla `tipo_item`
--
ALTER TABLE `tipo_item`
  ADD PRIMARY KEY (`Codigo_Tipo_Item`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo_Usuario`),
  ADD UNIQUE KEY `Codigo_Personal` (`Codigo_Personal`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Codigo_Ventas`),
  ADD KEY `FK__Ventas__Codigo_C__4D94879B` (`Codigo_Cliente`),
  ADD KEY `FK__Ventas__Codigo_P__4E88ABD4` (`Codigo_Personal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Codigo_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5307;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `Codigo_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `Codigo_Compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `Codigo_Detalle_Compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_item`
--
ALTER TABLE `detalle_item`
  MODIFY `Codigo_Detalle_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  MODIFY `Codigo_Detalle_Plan_Funerario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `CodigoDetalleVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `difunto`
--
ALTER TABLE `difunto`
  MODIFY `Codigo_Difunto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informacion_venta`
--
ALTER TABLE `informacion_venta`
  MODIFY `Codigo_Informacion_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `Codigo_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `Codigo_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `Codigo_Parentesco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `Codigo_Personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `plan_funerario`
--
ALTER TABLE `plan_funerario`
  MODIFY `Codigo_Plan_Funerario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Codigo_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_item`
--
ALTER TABLE `tipo_item`
  MODIFY `Codigo_Tipo_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Codigo_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Codigo_Ventas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK__Compras__Codigo___45F365D3` FOREIGN KEY (`Codigo_Proveedor`) REFERENCES `proveedor` (`Codigo_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `FK__Detalle_C__Codig__49C3F6B7` FOREIGN KEY (`Codigo_Compras`) REFERENCES `compras` (`Codigo_Compras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_C__Codig__4AB81AF0` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_item`
--
ALTER TABLE `detalle_item`
  ADD CONSTRAINT `FK__Detalle_I__Codig__29572725` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  ADD CONSTRAINT `FK__Detalle_P__Codig__2F10007B` FOREIGN KEY (`Codigo_Plan_Funerario`) REFERENCES `plan_funerario` (`Codigo_Plan_Funerario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_P__Codig__300424B4` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `FK__Detalle_V__Codig__52593CB8` FOREIGN KEY (`Codigo_Ventas`) REFERENCES `ventas` (`Codigo_Ventas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_V__Codig__534D60F1` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informacion_venta`
--
ALTER TABLE `informacion_venta`
  ADD CONSTRAINT `FK__Informaci__Codig__5812160E` FOREIGN KEY (`Codigo_Ventas`) REFERENCES `ventas` (`Codigo_Ventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK__Item__Codigo_Tip__267ABA7A` FOREIGN KEY (`Codigo_Tipo_Item`) REFERENCES `tipo_item` (`Codigo_Tipo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `FK__Parentesc__Codig__403A8C7D` FOREIGN KEY (`Codigo_Cliente`) REFERENCES `cliente` (`Codigo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Parentesc__Codig__412EB0B6` FOREIGN KEY (`Codigo_Difunto`) REFERENCES `difunto` (`Codigo_Difunto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_ondelete` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`Codigo_Usuario`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `ondelete` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK__Usuario__Codigo` FOREIGN KEY (`Codigo_Personal`) REFERENCES `personal` (`Codigo_Personal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK__Ventas__Codigo_C__4D94879B` FOREIGN KEY (`Codigo_Cliente`) REFERENCES `cliente` (`Codigo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Ventas__Codigo_P__4E88ABD4` FOREIGN KEY (`Codigo_Personal`) REFERENCES `personal` (`Codigo_Personal`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
