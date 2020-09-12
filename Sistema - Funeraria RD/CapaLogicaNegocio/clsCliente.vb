Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos
Imports MySql.Data.MySqlClient

Public Class clsCliente
    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property Codigo_Cliente As Integer
    Public Property TipoPersona() As String
    Public Property TipoDoc() As String
    Public Property Documento() As String
    Public Property Nombres() As String
    Public Property Direccion() As String
    Public Property Telefono() As String
    Public Property Email() As String
    Public Property Datos() As String

    Public Function Listar_Clientes() As DataTable 'Función para listar Clientes
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listado_Cliente", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Clientes, verifique clase clsCliente") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Filtrar_Clientes() As DataTable 'Función para filtrar Clientes por Nro Documento o Nombres
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Cliente_NroDoc_Nombre", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar Clientes, verifique clase clsCliente") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Cliente() As String 'Función para registrar Cliente
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Tipo_Personas", TipoPersona))
            lst.Add(New clsParametro("@Tipo_Documentos", TipoDoc))
            lst.Add(New clsParametro("@Documentos", Documento))
            lst.Add(New clsParametro("@Nombress", Nombres))
            lst.Add(New clsParametro("@Direccions", Direccion))
            lst.Add(New clsParametro("@Telefonos", Telefono))
            lst.Add(New clsParametro("@Emails", Email))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Cliente", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(7).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el Cliente, verifique clase clsCliente") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Item() As String 'Función para actualizar al Cliente
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Clientes", Codigo_Cliente))
            lst.Add(New clsParametro("@Tipo_Personas", TipoPersona))
            lst.Add(New clsParametro("@Tipo_Documentos", TipoDoc))
            lst.Add(New clsParametro("@Documentos", Documento))
            lst.Add(New clsParametro("@Nombress", Nombres))
            lst.Add(New clsParametro("@Direccions", Direccion))
            lst.Add(New clsParametro("@Telefonos", Telefono))
            lst.Add(New clsParametro("@Emails", Email))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Cliente", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(8).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al Actualizar el Cliente, verifique clase clsCliente") 'Creamos una nueva excepción de errores
        End Try
        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

End Class
