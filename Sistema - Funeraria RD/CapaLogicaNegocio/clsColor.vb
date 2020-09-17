Imports CapaAccesoDatos
Imports MySql.Data.MySqlClient

Public Class clsColor
    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Propiedades del Color
    Public Property Descripcion() As String

    Public Function Registrar_Color() As String 'Función para registrar Colores
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Descripcions", Descripcion))
            lst.Add(New clsParametro("@msj", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Color", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(1).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar Color, verifique clase clsColor") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Listar_Colores() As DataTable 'Función para listar Colores
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listado_Color", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Colores, verifique clase clsColor") 'Creamos una nueva excepción de errores
        End Try
    End Function

End Class
