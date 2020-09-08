Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsParentescoDifundo

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property CodigoParentesco() As Integer
    Public Property CodigoCliente() As Integer
    Public Property CodigoDifunto() As Integer
    Public Property Parentesco() As String

    Public Function Listar_Parentesco() As DataTable 'Función para listar Parentesco Difuntos
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Parentesco", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar parentesco, verifique clase clsParentescoDifundo") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Parentesco() As String 'Función para registrar Parentesco Difunto
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Cliente", CodigoCliente))
            lst.Add(New clsParametro("@Codigo_Difunto", CodigoDifunto))
            lst.Add(New clsParametro("@Descripcion", Parentesco))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registrar_Parentesco", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(3).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el parentesco, verifique clase clsParentescoDifundo") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Parentesco() As String 'Función para actualizar Parentesco Difunto
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Parentesco", CodigoParentesco))
            lst.Add(New clsParametro("@Codigo_Cliente", CodigoCliente))
            lst.Add(New clsParametro("@Codigo_Difunto", CodigoDifunto))
            lst.Add(New clsParametro("@Descripcion", Parentesco))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Parentesco", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(4).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el parentesco, verifique clase clsParentescoDifundo") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Verificar_Existe_Parentesco() As DataTable 'Función para verificar Parentesco
        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Codigo_Difunto", CodigoDifunto))
            Return M.Listado("Verificar_Existe_Parentesco", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al verificar parentesco, verifique clase clsParentescoDifunto") 'Creamos una nueva excepción de errores
        End Try
    End Function
End Class
