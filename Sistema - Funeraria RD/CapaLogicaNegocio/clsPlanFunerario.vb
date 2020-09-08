Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsPlanFunerario

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property Codigo() As Integer
    Public Property CodigoItem() As Integer
    Public Property Descripcion() As String
    Public Property Precio() As Decimal
    Public Property RutaImagen() As String

    Public Function Listar_Planes_Funerarios() As DataTable 'Función para listar Planes Funerarios
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Plan_Funerario", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Planes Funerarios, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

    End Function

    Public Function Registrar_Plan_Funerario() As String 'Función para registrar Planes Funerarios
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Descripcion", Descripcion))
            lst.Add(New clsParametro("@Precio", Precio))
            lst.Add(New clsParametro("@RutaImagen", RutaImagen))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Plan_Funerario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(3).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Plan_Funerario() As String 'Función para actualizar  Plan Funerario
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Plan_Funerario", Codigo))
            lst.Add(New clsParametro("@Descripcion", Descripcion))
            lst.Add(New clsParametro("@Precio", Precio))
            lst.Add(New clsParametro("@RutaImagen", RutaImagen))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Plan_Funerario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(4).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al actualizar el Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Registrar_Detalle_Plan_Funerario() As String 'Función para Registrar Detalle  Plan Funerario
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Plan_Funerario", Codigo))
            lst.Add(New clsParametro("@Codigo_Item", CodigoItem))
            lst.Add(New clsParametro("@Precio", Precio))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registra_Detalle_Plan_Funerario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(3).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el Detalle del Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Listar_Detalle_Plane_Funerario() As DataTable 'Función para listar Detalle Plane Funerario
        Dim lst As New List(Of clsParametro)

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Plan", CodigoItem))
            Return M.Listado("Listar_Detalle_Plan_Funerario", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar Detalle del Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

    End Function

    Public Function Verificar_Stock_Plan() As DataTable 'Función para listar Detalle Plane Funerario
        Dim lst As New List(Of clsParametro)

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Plan", CodigoItem))
            Return M.Listado("Verificar_Stock_Plan", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al verificar Stock del Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

    End Function

    Public Function Eliminar_Detalle_Plan_Funerario() As String 'Función para Eliminar Detalle  Plan Funerario
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@CodigoDetalle", Codigo))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Eliminar_Detalle_Plan_Funerario", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(1).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al eliminar el Detalle del Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Verificar_Stock_Item() As DataTable 'Función para verificar el sotck del Item del Plan Funerario
        Dim lst As New List(Of clsParametro)

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@CodigoItem", CodigoItem))
            Return M.Listado("Verificar_Stock_Item", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al verificar el sotck del Plan Funerario, verifique clase clsPlanFunerario") 'Creamos una nueva excepción de errores
        End Try

    End Function
End Class
