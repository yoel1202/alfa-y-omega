Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos
Imports MySql.Data.MySqlClient

Public Class clsCompras

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Propiedades de la Compra
    Public Property CodigoProveedor() As Integer
    Public Property FechaCompra() As Date
    Public Property TipoDocumento() As String
    Public Property TipoPago() As String
    Public Property Tipocompra() As String
    Public Property Serie() As String
    Public Property NroDocumento() As String
    Public Property cuota() As Decimal
    Public Property plazo() As Integer
    Public Property Total() As Decimal
    'Propiedades del Detalle de Compras


    Public Property CodigoCompras() As Integer
    Public Property CodigoItem() As String
    Public Property PrecioCompra() As Decimal
    Public Property utilidad() As Decimal
    Public Property Precioventa() As Decimal

    Public Property Cantidad() As Integer
    Public Property Igv() As Decimal
    Public Property SubTotal() As Decimal

    'Propiedades para Consultar Compras por Rangos de Fecha
    Public Property Fecha1() As Date
    Public Property Fecha2() As Date
    Public Property datos As String
    'Propiedades del abono
    Public Property MontoAbono() As Decimal
    Public Property MontoActual() As Decimal
    Public Property NComprobante() As String
    Public Property FechaAbono() As Date


    Public Property CodigoComprass() As Integer



    Public Function Registrar_Compras() As String 'Función para registrar Compras
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Proveedors", CodigoProveedor))
            lst.Add(New clsParametro("@Fecha_Compras", FechaCompra))
            lst.Add(New clsParametro("@Tipo_Documentos", TipoDocumento))
            lst.Add(New clsParametro("@Tipo_compras", Tipocompra))
            lst.Add(New clsParametro("@Series", Serie))
            lst.Add(New clsParametro("@Nro_Documentos", NroDocumento))
            lst.Add(New clsParametro("@Totals", Total))
            lst.Add(New clsParametro("@cuotas", cuota))
            lst.Add(New clsParametro("@plazos", plazo))
            lst.Add(New clsParametro("@tipo_pagos", TipoPago))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Compras", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(10).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos

        Catch ex As Exception
            Throw New Exception("Error al registrar compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
    Public Function Registrar_Abono() As String 'Función para registrar Compras
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_comprass", CodigoComprass))
            lst.Add(New clsParametro("@Monto_abonos", MontoAbono))
            lst.Add(New clsParametro("@Monto_actuals", MontoActual))
            lst.Add(New clsParametro("@Fecha_abonos", FechaAbono))
            lst.Add(New clsParametro("@NComprobantes", NComprobante))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Abono", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(5).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
    Public Function Devolver_Codigo_Compras() As Integer
        Dim Codigo As Integer = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@CodigoCompra", "", MySqlDbType.Int16, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_Codigo_Compras", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Codigo = lst(0).Valor.ToString() 'Recuperamos el código de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código de la compra, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
        Return Codigo 'Retornamos el código recuperado
    End Function

    Public Function Devolver_monto_credito() As Integer
        Dim monto As Decimal = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros

            lst.Add(New clsParametro("@codigo_comprass", CodigoComprass))
            lst.Add(New clsParametro("@monto", "", MySqlDbType.Decimal, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_monto_credito", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            monto = lst(1).Valor.ToString() 'Recuperamos el monto de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código de la compra, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
        Return monto 'Retornamos el monto recuperado
    End Function

    Public Function Registrar_Detalle_Compras() As String 'Función para registrar Detalle de  Compras
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Comprass", CodigoCompras))

            lst.Add(New clsParametro("@Codigo_Items", CodigoItem))
            lst.Add(New clsParametro("@Precio_Compras", PrecioCompra))
            lst.Add(New clsParametro("@utilidades", utilidad))
            lst.Add(New clsParametro("@precio_venta", Precioventa))
            lst.Add(New clsParametro("@Cantidads", Cantidad))
            lst.Add(New clsParametro("@Igvs", Igv))
            lst.Add(New clsParametro("@Sub_Totals", SubTotal))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Detalle_Compras", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(8).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar detalle de compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Listar_Compras() As DataTable 'Función para listar Compras
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Compras", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Listar_creditos() As DataTable 'Función para listar Compras
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_facturas_credito", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Listar_Abonos_Compras() As DataTable 'Función para listar Compras
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@CodigoCompras", CodigoCompras))
            Return M.Listado("Listar_Abonos_Compras", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Listar_Detalle_Compras() As DataTable 'Función para listar Detalle de Compras
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@CodigoComprass", CodigoCompras))
            Return M.Listado("Listar_Detalle_Compras", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Listar_Compras_porFecha() As DataTable 'Función para listar Compras Por rangos de Fecha
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Fecha1", Fecha1))
            lst.Add(New clsParametro("@Fecha2", Fecha2))
            Return M.Listado("Listar_Compras_PorFechas", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Compras, verifique clase clsCompras") 'Creamos una nueva excepción de errores
        End Try
    End Function
End Class
