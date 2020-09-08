Imports CapaAccesoDatos
Public Class clsMaterial
    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Propiedades del Color
    Public Property Descripcion() As String

    Public Function Registrar_Material() As String 'Función para registrar Colores
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Descripcion", Descripcion))
            lst.Add(New clsParametro("@msj", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Material", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(1).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar Material, verifique clase clsMaterial") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Listar_Material() As DataTable 'Función para listar Colores
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listado_Material", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Material, verifique clase clsMaterial") 'Creamos una nueva excepción de errores
        End Try
    End Function

End Class
