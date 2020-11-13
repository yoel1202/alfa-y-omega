Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos
Imports MySql.Data.MySqlClient

Public Class clsVentas

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Propiedades de la Venta
    Public Property CodigoCliente() As Integer
    Public Property CondicionVenta() As String
    Public Property Cuotas() As Decimal
    Public Property Plazo() As Decimal
    Public Property FechaVenta() As Date
    Public Property Total() As Decimal
    Public Property TipoDocumento() As String
    Public Property NumeroDocumento() As String
    'Propiedades del Detalle de Compras
    Public Property CodigoVenta() As Integer
    Public Property CodigoItem() As String
    Public Property Cantidad() As Integer
    Public Property PrecioVenta() As Decimal
    Public Property Igv() As Decimal
    Public Property Descuento() As Decimal
    Public Property SubTotal() As Decimal

    'Propiedades de Información de Venta
    Public Property CodigoInformacion() As Integer
    Public Property DireccionVelatorio() As String
    Public Property Cementerio() As String
    Public Property DireccionSepelio() As String
    Public Property FechaSepelio() As Date
    Public Property Hora() As Date

    'Propiedades para Consultar Ventas por Rangos de Fecha
    Public Property Fecha1() As Date
    Public Property Fecha2() As Date
    Public Property CodigoVentass() As Integer
    Public Property datos() As String

    Public Property MontoAbono() As Decimal
    Public Property MontoActual() As Decimal
    Public Property NComprobante() As String
    Public Property FechaAbono() As Date
    Public Function Generar_Serie() As String
        Dim Serie As String = "" 'Declaramos la variable para recuperar la Serie de la BD
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Serie", "", MySqlDbType.VarChar, ParameterDirection.Output, 3)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Serie_Documento", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Serie = lst(0).Valor.ToString() 'Recuperamos el código de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver la Serie del documento, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
        Return Serie
    End Function

    Public Function Generar_Correlativo() As String
        Dim Serie As String = "" 'Declaramos la variable para recuperar la Serie de la BD
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@TipoDocumentos", TipoDocumento))
            lst.Add(New clsParametro("@NroCorrelativos", "", MySqlDbType.VarChar, ParameterDirection.Output, 7)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Numero_Correlativo", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Serie = lst(1).Valor.ToString() 'Recuperamos el código de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el número correlativo del documento, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
        Return Serie
    End Function

    Public Function Registrar_Ventas() As String 'Función para registrar Ventas
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros

            lst.Add(New clsParametro("@Codigo_Clientes", CodigoCliente))
            lst.Add(New clsParametro("@Tipo_Documentos", TipoDocumento))
            lst.Add(New clsParametro("@Condicion_ventas", CondicionVenta))
            lst.Add(New clsParametro("@Cuotass", Cuotas))
            lst.Add(New clsParametro("@Plazos", Plazo))
            lst.Add(New clsParametro("@FechaVentas", FechaVenta))
            lst.Add(New clsParametro("@Totals", Total))
            lst.Add(New clsParametro("@numero_documentos", NumeroDocumento))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Ventas", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(8).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos

        Catch ex As Exception
            Throw New Exception("Error al registrar ventas, verifique clase clsVentas" + ex.Message) 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Devolver_Codigo_Ventas() As Integer
        Dim Codigo As Integer = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@CodigoVenta", "", SqlDbType.Int, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_Codigo_Ventas", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Codigo = lst(0).Valor.ToString() 'Recuperamos el código de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código de la Venta, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
        Return Codigo 'Retornamos el código recuperado
    End Function

    Public Function Registrar_Detalle_Ventas() As String 'Función para registrar Detalle de  Ventas
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Ventass", CodigoVenta))
            lst.Add(New clsParametro("@Codigo_Items", CodigoItem))
            lst.Add(New clsParametro("@Cantidads", Cantidad))
            lst.Add(New clsParametro("@Precio_Ventas", PrecioVenta))
            lst.Add(New clsParametro("@Igvs", Igv))
            lst.Add(New clsParametro("@Dsctos", Descuento))
            lst.Add(New clsParametro("@Sub_Totals", SubTotal))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Detalle_Venta", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(7).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar detalle de Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Registrar_Informacion_Venta() As String 'Función para registrar Información de  Venta
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Ventas", CodigoVenta))
            lst.Add(New clsParametro("@Dirección_Velatorio", DireccionVelatorio))
            lst.Add(New clsParametro("@Cementerio", Cementerio))
            lst.Add(New clsParametro("@Dirección_Sepelio", DireccionSepelio))
            lst.Add(New clsParametro("@Fecha_Sepelio", FechaSepelio))
            lst.Add(New clsParametro("@Hora", Hora))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Informacion_Venta", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(6).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar Información de Venta, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Informacion_Venta() As String 'Función para Actualizar Información de  Venta
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Informacion_Venta", CodigoInformacion))
            lst.Add(New clsParametro("@Codigo_Ventas", CodigoVenta))
            lst.Add(New clsParametro("@Dirección_Velatorio", DireccionVelatorio))
            lst.Add(New clsParametro("@Cementerio", Cementerio))
            lst.Add(New clsParametro("@Dirección_Sepelio", DireccionSepelio))
            lst.Add(New clsParametro("@Fecha_Sepelio", FechaSepelio))
            lst.Add(New clsParametro("@Hora", Hora))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Informacion_Venta", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(7).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al actualizar Información de Venta, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Listar_Ventas() As DataTable 'Función para listar Ventas
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Ventas", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Listar_Detalle_Ventas() As DataTable 'Función para listar Detalle de Ventas
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Venta", CodigoVenta))
            Return M.Listado("Listar_Detalle_Venta", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Detalle de Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Listar_Ventas_porFecha() As DataTable 'Función para listar Ventas Por rangos de Fecha
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Fecha1", Fecha1))
            lst.Add(New clsParametro("@Fecha2", Fecha2))
            Return M.Listado("Listar_Ventas_PorFechas", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Listar_Informacion_Venta() As DataTable 'Función para listar Información de Ventas
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Venta", CodigoVenta))
            Return M.Listado("Ver_Informacion_Venta", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Información de Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Listar_Detalle_Item_Venta() As DataTable 'Función para listar Color y Marca del Item vendido
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@CodigoItems", CodigoItem))
            Return M.Listado("Mostrar_Detalle_Item", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Información de Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Listar_creditos() As DataTable 'Función para listar Compras
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", datos))
            Return M.Listado("Buscar_facturas_credito_Ventas", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar Personal, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Devolver_monto_credito() As Integer
        Dim monto As Decimal = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros

            lst.Add(New clsParametro("@Codigo_Ventass", CodigoVentass))
            lst.Add(New clsParametro("@monto", "", MySqlDbType.Decimal, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_monto_credito_Venta", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            monto = lst(1).Valor.ToString() 'Recuperamos el monto de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código de la compra, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
        Return monto 'Retornamos el monto recuperado
    End Function
    Public Function Registrar_Abono() As String 'Función para registrar Compras
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Ventass", CodigoVentass))
            lst.Add(New clsParametro("@Monto_abonos", MontoAbono))
            lst.Add(New clsParametro("@Monto_actuals", MontoActual))
            lst.Add(New clsParametro("@Fecha_abonos", FechaAbono))
            lst.Add(New clsParametro("@NComprobantes", NComprobante))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Abono_Ventas", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(5).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar compras, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
    Public Function Listar_Abonos_Ventas() As DataTable 'Función para listar Compras
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigoventas", CodigoVentass))
            Return M.Listado("Listar_Abonos_Ventas", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar compras, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function
End Class
