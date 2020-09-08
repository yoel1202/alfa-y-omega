Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsProducto : Inherits clsItem 'Hereda propiedades y Atributos de la clase Padre

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property Descripcion() As String
    Public Property Color() As String
    Public Property Material() As String
    Public Property Stock() As Integer
    Public Property RutaImagen() As String
    Public Property Datos() As String

    Public Function Listar_Productos() As DataTable 'Función para listar servicios
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Productos", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar productos, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Productos() As DataTable 'Función para listar servicios
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Productos", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al filtrar productos, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Producto() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Item", Codigo_Item))
            lst.Add(New clsParametro("@Descripcion", Descripcion))
            lst.Add(New clsParametro("@Color", Color))
            lst.Add(New clsParametro("@Material", Material))
            lst.Add(New clsParametro("@Stock", Stock))
            lst.Add(New clsParametro("@RutaImagen", RutaImagen))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Detalle_Item", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(6).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el producto, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Producto() As String
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Item", Codigo_Item))
            lst.Add(New clsParametro("@Descripcion", Descripcion))
            lst.Add(New clsParametro("@Color", Color))
            lst.Add(New clsParametro("@Material", Material))
            lst.Add(New clsParametro("@Stock", Stock))
            lst.Add(New clsParametro("@RutaImagen", RutaImagen))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Detalle_Item", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(6).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al actualizar el producto, verifique clase clsProducto") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

End Class
