Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos
Imports MySql.Data.MySqlClient

Public Class clsServicios : Inherits clsItem 'Hereda propiedades y Atributos de la clase Padre

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property tipo() As String
    Public Property precio_km() As Decimal
    Public Property km() As Decimal
    Public Property precio() As Decimal

    Public Property Datos() As String

    Public Function Listar_Servicios() As DataTable 'Función para listar servicios
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Servicios", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar productos, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Productos() As DataTable 'Función para listar servicios
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Servicios", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar productos, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_servicio() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros

            lst.Add(New clsParametro("@Codigo_Items", Codigo_Item))
            lst.Add(New clsParametro("@tipos", tipo))
            lst.Add(New clsParametro("@kms", km))
            lst.Add(New clsParametro("@precio_kms", precio_km))
            lst.Add(New clsParametro("@precios", precio))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Servicio", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(5).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el servicio, verifique clase clsservicio") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_servicio() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Items", Codigo_Item))
            lst.Add(New clsParametro("@tipos", tipo))
            lst.Add(New clsParametro("@kms", km))
            lst.Add(New clsParametro("@precio_kms", precio_km))
            lst.Add(New clsParametro("@Mensaje", "", MySqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Servicio", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(4).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al actualizar el producto, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

End Class
