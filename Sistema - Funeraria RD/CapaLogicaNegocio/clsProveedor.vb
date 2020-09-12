Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos
Imports MySql.Data.MySqlClient

Public Class clsProveedor

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property CodigoProveedor() As String
    Public Property Ruc() As String
    Public Property RazinSocial() As String
    Public Property Representante() As String
    Public Property Celular() As String
    Public Property Telefono() As String
    Public Property Direccion() As String
    Public Property Email() As String
    Public Property Datos() As String

    Public Function Listar_Proveedores() As DataTable 'Función para listar Proveedores
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Proveedores", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar proveedores, verifique clase clsProveedores") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Proveedor() As DataTable 'Función para filtrar Proveedores
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Proveedores", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al buscar difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Proveedores() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@RUCs", Ruc))
            lst.Add(New clsParametro("@Razon_Socials", RazinSocial))
            lst.Add(New clsParametro("@Representantes", Representante))
            lst.Add(New clsParametro("@Celular_Representantes", Celular))
            lst.Add(New clsParametro("@Telefono_Empresas", Telefono))
            lst.Add(New clsParametro("@Direccions", Direccion))
            lst.Add(New clsParametro("@Emails", Email))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Proveedor", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(7).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el proveedores, verifique clase clsProveedores") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Proveedores() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Proveedors", CodigoProveedor))
            lst.Add(New clsParametro("@RUCs", Ruc))
            lst.Add(New clsParametro("@Razon_Socials", RazinSocial))
            lst.Add(New clsParametro("@Representantes", Representante))
            lst.Add(New clsParametro("@Celular_Representantes", Celular))
            lst.Add(New clsParametro("@Telefono_Empresas", Telefono))
            lst.Add(New clsParametro("@Direccions", Direccion))
            lst.Add(New clsParametro("@Emails", Email))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Proveedor", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(8).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el proveedores, verifique clase clsProveedores") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

End Class
