-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2020 a las 04:59:46
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente` (`Codigo_Clientes` INT, `Tipo_Personas` VARCHAR(15), `Tipo_Documentos` CHAR(6), `Documentos` VARCHAR(11), `Nombress` VARCHAR(150), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Cliente Where Documento=Documentos and Codigo_Cliente<>Codigo_Clientes))then

 		Set Mensaje = 'El N° de documento: '+Documentos+' ya existe';

 		Else

 			

 				Update Cliente set Tipo_Persona=Tipo_Personas,Tipo_Documento=Tipo_Documentos,Documento=Documentos,

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Item` (`Codigo_Items` INT, `Codigo_Tipo_Items` INT, `Nombres` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Not Exists(Select * From Item Where Codigo_Item=Codigo_Items))then

 		Set Mensaje = 'El Producto: '+Nombres+' no existe';

 		Else

 			

 				Update Item Set Codigo_Tipo_Item=Codigo_Tipo_Items,

 				Nombre=Nombres Where Codigo_Item=Codigo_Items;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Servicio` (`Codigo_Items` INT, `tipos` VARCHAR(30), `kms` DECIMAL, `precio_kms` DECIMAL, `precios` DECIMAL, OUT `Mensaje` VARCHAR(100))  BEGIN
	Update servicios Set tipo=tipos,km=kms,precio_km=precio_kms,

 		precio=precios Where Codigo_Item=Codigo_Items;

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

 		Select * from Cliente where (Documento like concat(datos,'%')) or (Nombres like concat(datos,'%'));

 	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Difunto` ()  BEGIN
 declare Datos Varchar(60);
	
Select * From Difunto Where Dni like CONCAT(Datos, '%') Or Nombres Like CONCAT(Datos, '%') Or Apellidos Like CONCAT(Datos, '%') Or Nombres+' '+Apellidos Like CONCAT(Datos, '%') Or Apellidos +' '+Nombres Like CONCAT(Datos, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Personal_DNI_Nombre` (`Datos` VARCHAR(50))  begin

 		Select * from Personal Where Dni like concat(Datos,'%') or Nombre Like concat(Datos,'%') Or Apellidos Like concat(Datos,'%') Or

 		Nombre+' '+Apellidos Like concat(Datos,'%') Or Apellidos+' '+Nombre Like concat(Datos,'%');

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

 	Select * from Cliente;
    
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Compr` ()  Begin

 		Select C.Codigo_Compr,P.RUC,P.Razon_Social,concat(concat(C.Serie,' - '),C.Nro_Documento) as Comprobante ,C.Fecha_Compra,C.Total 

 		From Proveedor P Inner Join Compr C on P.Codigo_Proveedor=C.Codigo_Proveedor;

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

 	Where D.Codigo_Plan_Funerario=@Codigo_Plan;
    
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Item_Tipo` (`Codigo_Tipo_Item` INT)  begin

 		Select Codigo_Item,Nombre,Precio from Item

 		where Codigo_Tipo_Item=@Codigo_Tipo_Item;

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
 

 

 	Select * from Plan_Funerario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Productos` ()  Begin

 		Select  I.Codigo_Item,I.Nombre,D.Descripcion,D.Color,D.Material,D.RutaImagen

 		From Item I Inner Join Detalle_Item D On I.Codigo_Item=D.Codigo_Item

 		Where I.Codigo_Tipo_Item = 1;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Proveedores` ()  Begin

 		Select * From Proveedor;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Listar_Servicios` ()  Begin

 		Select it.Codigo_Item,it.Nombre,tipo,km,precio_km,se.precio From Item as  it inner join servicios as se on se.Codigo_Item =it.Codigo_Item Where Codigo_Tipo_Item=2;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Cliente` (`Tipo_Personas` VARCHAR(15), `Tipo_Documentos` CHAR(6), `Documentos` VARCHAR(11), `Nombress` VARCHAR(150), `Direccions` VARCHAR(100), `Telefonos` VARCHAR(70), `Emails` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Cliente Where Documento=Documentos))then

 		Set Mensaje = 'El N° de documento: '+Documentos+' ya existe';

 		Else

 			

 				Insert into Cliente (Tipo_Persona,Tipo_Documento,Documento,Nombres,Direccion,

 				Telefono,Email) Values(Tipo_Personas,Tipo_Documentos,Documentos,Nombress,Direccions,

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Compras` (`Codigo_Proveedors` INT, `Fecha_Compras` DATE, `Tipo_Documentos` VARCHAR(20), `Series` CHAR(3), `Nro_Documentos` VARCHAR(7), `Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin

 		if(not exists(Select * from Proveedor where Codigo_Proveedor=Codigo_Proveedors))then

 		set Mensaje='Código de Proveedor no Existe';

 		else

 			

 				Insert into Compras (Codigo_Proveedor,Fecha_Compra,Tipo_Documento,Series,

 						Nro_Documento,Total) Values(Codigo_Proveedors,Fecha_Compras,Tipo_Documentos,Series,

 						Nro_Documentos,Totals);

 						Set @Mensaje = 'Compra Registrada correctamente' ;

 			End if;

 	End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Detalle_Compras` (`Codigo_Comprass` INT, `Codigo_Items` INT, `Precio_Compras` DOUBLE, `Cantidads` INT, `Igvs` DOUBLE, `Sub_Totals` DOUBLE, OUT `Mensaje` VARCHAR(100))  Begin
declare Stock  int;
 		Set Stock=(Select Stock From Detalle_Item Where Codigo_Item=Codigo_Items);

 		Insert into Detalle_Compras (Codigo_Compras,Codigo_Item,Precio_Compra,Cantidad,Igv,Sub_Total) Values(Codigo_Comprass,Codigo_Items,Precio_Compras,Cantidads,Igvs,Sub_Totals);

 		Set Mensaje = 'Detalle de Compra Registrado correctamente' ;

 		Update Detalle_Item Set Stock=Stock+Cantidads Where Codigo_Item=Codigo_Items;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Item` (`Codigo_Tipo_Items` INT, `Nombres` VARCHAR(100), OUT `Mensaje` VARCHAR(100))  Begin

 		If(Exists(Select * From Item Where Nombre=Nombres))then 

 		Set Mensaje = 'El Producto: '+Nombres+' ya existe';

 		Else

 			

 				Insert into Item (Codigo_Tipo_Item,Nombre) Values(Codigo_Tipo_Items,Nombres);

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Servicio` (`Codigo_Items` INT, `tipos` VARCHAR(30), `kms` DECIMAL, `precio_kms` DECIMAL, `precios` DECIMAL, OUT `Mensaje` VARCHAR(100))  Begin

 		Insert into servicios (Codigo_Item,tipo,km,precio_km,precio) Values(Codigo_Items,tipos,kms,precio_kms,precios);

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
  `Tipo_Documento` char(6) NOT NULL,
  `Documento` varchar(11) NOT NULL,
  `Nombres` varchar(150) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(70) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Codigo_Cliente`, `Tipo_Persona`, `Tipo_Documento`, `Documento`, `Nombres`, `Direccion`, `Telefono`, `Email`) VALUES
(1, 'Natural', 'D.N.I.', '65434653', 'dfggfd', 'dfggfd', '46463', 'dfg');

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
(2, 'azul');

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
  `Total` decimal(19,4) NOT NULL
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
  `Sub_Total` decimal(19,4) NOT NULL
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
(1, 10, 'dd', 'azul', 'cemento', 0, 'C:\\Funeraria\\Producto\\foto.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_plan_funerario`
--

CREATE TABLE `detalle_plan_funerario` (
  `Codigo_Detalle_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`Codigo_Item`, `Codigo_Tipo_Item`, `Nombre`) VALUES
(3, 1, 'ataud'),
(10, 1, 'bb'),
(11, 2, 'to'),
(14, 2, 'TRANSPORTE A DOMINICAL');

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
(2, 'cemento');

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
(3, 14, 'Transporte', '60', '500', '20000');

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
  MODIFY `Codigo_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `Codigo_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Codigo_Detalle_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  MODIFY `Codigo_Detalle_Plan_Funerario` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `Codigo_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `Codigo_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Codigo_Plan_Funerario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Codigo_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
