Imports CapaAccesoDatos
Imports MySql.Data.MySqlClient

Public Class clsContratos

    Dim M As New clsManejador 'Instanciamos la clase clsManejador
    'Declaramos nuestras propiedades
    Public Property CodigoContrato() As Integer
    Public Property CodigoCliente() As Integer
    Public Property CodigoPersonal() As Integer
    Public Property TipoContrato() As String
    Public Property Monto() As Decimal
    Public Property Plazo() As Integer
    Public Property Cuota() As Decimal
    Public Property Zona() As String
    Public Property LugarCobro() As String
    Public Property FechaCobro() As String
    Public Property Observacion() As String
    Public Property NumeroContrato() As String
    Public Property Contrato() As String
    Public Property FechaContrato() As Date
    Public Property dato() As String
    Public Function Registrar_Contrato() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@CodigoClientes", CodigoCliente))
            lst.Add(New clsParametro("@CodigoPersonals", CodigoPersonal))
            lst.Add(New clsParametro("@TipoContratos", TipoContrato))
            lst.Add(New clsParametro("@Montos", Monto))
            lst.Add(New clsParametro("@Plazos", Plazo))
            lst.Add(New clsParametro("@Cuotas", Cuota))
            lst.Add(New clsParametro("@Zonas", Zona))
            lst.Add(New clsParametro("@LugarCobros", LugarCobro))
            lst.Add(New clsParametro("@FechaCobros", FechaCobro))
            lst.Add(New clsParametro("@Observacions", Observacion))
            lst.Add(New clsParametro("@NumeroContratos", NumeroContrato))
            lst.Add(New clsParametro("@FechaContratos", FechaContrato))
            lst.Add(New clsParametro("@Contratos", Contrato))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Contratos", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(13).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el contrato, verifique clase clsContratos") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
    Public Function Actualizar_Contrato() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@CodigoContratos", CodigoContrato))
            lst.Add(New clsParametro("@CodigoClientes", CodigoCliente))
            lst.Add(New clsParametro("@CodigoPersonals", CodigoPersonal))
            lst.Add(New clsParametro("@TipoContratos", TipoContrato))
            lst.Add(New clsParametro("@Montos", Monto))
            lst.Add(New clsParametro("@Plazos", Plazo))
            lst.Add(New clsParametro("@Cuotas", Cuota))
            lst.Add(New clsParametro("@Zonas", Zona))
            lst.Add(New clsParametro("@LugarCobros", LugarCobro))
            lst.Add(New clsParametro("@FechaCobros", FechaCobro))
            lst.Add(New clsParametro("@Observacions", Observacion))
            lst.Add(New clsParametro("@NumeroContratos", NumeroContrato))
            lst.Add(New clsParametro("@FechaContratos", FechaContrato))
            lst.Add(New clsParametro("@Contratos", Contrato))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Contratos", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(14).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el contrato, verifique clase clsContratos") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
    Public Function Devolver_Codigo_cliente() As Integer
        Dim Codigo As Integer = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigoclientes", CodigoCliente))
            lst.Add(New clsParametro("@Codigo", "", MySqlDbType.Int32, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_Codigo_cliente", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Codigo = lst(0).Valor.ToString() 'Recuperamos el código de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código del Item, verifique clase clsItem") 'Creamos una nueva excepción de errores
        End Try
        Return Codigo 'Retornamos el código recuperado
    End Function
    Public Function Listar_Contratos() As DataTable 'Función para listar Ventas
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Contratos", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Ventas, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
    End Function
    Public Function Buscar_Contratos() As DataTable 'Función para filtrar Difuntos
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@datos", dato))
            Return M.Listado("Buscar_contrato", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al buscar difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try
    End Function
End Class

