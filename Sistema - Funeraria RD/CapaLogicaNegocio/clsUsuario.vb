Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsUsuario

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property CodigoPersona() As String
    Public Property Usuario() As String
    Public Property Clave() As String

    Public Function Listar_Usuarios() As DataTable 'Función para listar Usuarios
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Usuarios", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar usuarios, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Usuarios() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Personal", CodigoPersona))
            lst.Add(New clsParametro("@Usuario", Usuario))
            lst.Add(New clsParametro("@Clave", Clave))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Usuario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(3).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el usuario, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Usuarios() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Personal", CodigoPersona))
            lst.Add(New clsParametro("@Usuario", Usuario))
            lst.Add(New clsParametro("@Clave", Clave))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Usuario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(3).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al actualizar el usuario, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Verificar_Existe_Usuarios() As DataTable 'Función para verificar Usuarios
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Personal", CodigoPersona))
            Return M.Listado("Verificar_Existe_Usuario", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al verificar usuarios, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Loguear() As String 'Función para loguear
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Usuario", Usuario))
            lst.Add(New clsParametro("@Clave", Clave))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Loguear", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(2).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al Loguear, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Devolver_Codigo_Personal() As Integer 'Función para devolver codigo de Personal por nombre de usuario
        Dim Codigo_Personal As Integer
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Usuario", Usuario))
            lst.Add(New clsParametro("@codigo_personal", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            'lst.Add(New clsParametro("@Codigo_personal", "", SqlDbType.Int, ParameterDirection.Output, 0))
            M.EjecutarSP("Devolver_Codigo_Personal", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Codigo_Personal = lst(1).Valor 'Recuperamos el mensaje de la Base de Datos
            'Return M.Listado("Devolver_Codigo_Personal", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al devolver Código Personal, verifique clase clsUsuario") 'Creamos una nueva excepción de errores
        End Try
        Return Codigo_Personal
    End Function
End Class
