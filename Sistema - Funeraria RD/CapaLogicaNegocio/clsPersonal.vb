Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsPersonal
    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property Codigo_Personal As Integer
    Public Property DNI() As String    
    Public Property Nombres() As String
    Public Property Apellidos() As String
    Public Property Cargo() As String
    Public Property Direccion() As String
    Public Property Telefono() As String
    Public Property Email() As String
    Public Property Estado() As String
    Public Property Datos() As String

    Public Function Listar_Personal() As DataTable 'Función para listar Personal    
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listado_Personal", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Filtrar_Personal() As DataTable 'Función para filtrar Personal por Nro DNI o Nombres
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Personal_DNI_Nombre", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Usuario_Dni() As DataTable 'Función para filtrar Usuarios por Nro DNI
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@dni", DNI))
            Return M.Listado("Buscar_Usuario_Dni", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al buscar Usuario, verifique clase clsPersonal /n" + ex.Message) 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Codigo_Dni() As DataTable 'Función para filtrar Codigo de Usuarios por Nro DNI
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@dni", DNI))
            Return M.Listado("Devolver_Codigo_Dni", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al buscar Codigo Usuario, verifique clase clsPersonal /n" + ex.Message) 'Creamos una nueva excepción de errores
        End Try
    End Function


    Public Function Registrar_Personal() As String 'Función para registrar Cliente
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Dni", DNI))
            lst.Add(New clsParametro("@Nombre", Nombres))
            lst.Add(New clsParametro("@Apellidos", Apellidos))
            lst.Add(New clsParametro("@Cargo", Cargo))
            lst.Add(New clsParametro("@Direccion", Direccion))
            lst.Add(New clsParametro("@Telefono", Telefono))
            lst.Add(New clsParametro("@Email", Email))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Personal", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(7).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Personal() As String 'Función para actualizar Personal
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Personal", Codigo_Personal))
            lst.Add(New clsParametro("@Dni", DNI))
            lst.Add(New clsParametro("@Nombre", Nombres))
            lst.Add(New clsParametro("@Apellidos", Apellidos))
            lst.Add(New clsParametro("@Cargo", Cargo))
            lst.Add(New clsParametro("@Direccion", Direccion))
            lst.Add(New clsParametro("@Telefono", Telefono))
            lst.Add(New clsParametro("@Email", Email))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Personal", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(8).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al Actualizar el Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Estado_Personal() As String 'Función para actualizar el estado del Personal
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Personal", Codigo_Personal))
            lst.Add(New clsParametro("@Estado", Estado))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Estado_Personal", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(2).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al Actualizar el Personal, verifique clase clsPersonal") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
End Class
