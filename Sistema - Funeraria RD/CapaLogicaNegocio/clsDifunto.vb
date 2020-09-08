Imports CapaAccesoDatos 'Importamos la Capa Acceso a Datos

Public Class clsDifunto

    Dim M As New clsManejador 'Instanciamos la clase clsManejador

    'Declaramos nuestras propiedades
    Public Property CodigoDifunto() As Integer
    Public Property Dni() As String
    Public Property Nombres() As String
    Public Property Apellidos() As String
    Public Property Sexo() As String
    Public Property FechaNacimiento() As Date
    Public Property FechaFallecimiento() As Date
    Public Property Hora() As Date
    Public Property CaudaMuerte() As String
    Public Property LugarFallecimiento() As String
    Public Property EstadoCivil() As String
    Public Property Datos() As String
    Public Property RutaActa() As String

    Public Function Listar_Difuntos() As DataTable 'Función para listar Difuntos
        Try 'Manejamos una excepción de errores
            Return M.Listado("Listar_Difuntos", Nothing) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al listar difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Buscar_Difuntos() As DataTable 'Función para filtrar Difuntos
        Dim lst As New List(Of clsParametro)
        Try 'Manejamos una excepción de errores
            lst.Add(New clsParametro("@Datos", Datos))
            Return M.Listado("Buscar_Difunto", lst) 'Pasamos el nombre de nuestro procedimiento almacenado sin ningún parámetro
        Catch ex As Exception
            Throw New Exception("Error al buscar difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try
    End Function

    Public Function Registrar_Difunto() As String 'Función para registrar Difunto
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Dni", Dni))
            lst.Add(New clsParametro("@Nombres", Nombres))
            lst.Add(New clsParametro("@Apellidos", Apellidos))
            lst.Add(New clsParametro("@Sexo", Sexo))
            lst.Add(New clsParametro("@Fecha_Nacimiento", FechaNacimiento))
            lst.Add(New clsParametro("@Fecha_Fallecimiento", FechaFallecimiento))
            lst.Add(New clsParametro("@Hora", Hora))
            lst.Add(New clsParametro("@Causa_Muerte", CaudaMuerte))
            lst.Add(New clsParametro("@Lugar_Fallecimiento", LugarFallecimiento))
            lst.Add(New clsParametro("@Estado_Civil", EstadoCivil))
            lst.Add(New clsParametro("@Ruta_Acta_Difunto", RutaActa))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Registra_Difunto", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(11).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function

    Public Function Actualizar_Difunto() As String 'Función para registrar Difunto
        Dim Mensaje As String = "" 'Declaramos la variable para recuperar el Mensaje

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro

        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros
            lst.Add(New clsParametro("@Codigo_Difunto", CodigoDifunto))
            lst.Add(New clsParametro("@Dni", Dni))
            lst.Add(New clsParametro("@Nombres", Nombres))
            lst.Add(New clsParametro("@Apellidos", Apellidos))
            lst.Add(New clsParametro("@Sexo", Sexo))
            lst.Add(New clsParametro("@Fecha_Nacimiento", FechaNacimiento))
            lst.Add(New clsParametro("@Fecha_Fallecimiento", FechaFallecimiento))
            lst.Add(New clsParametro("@Hora", Hora))
            lst.Add(New clsParametro("@Causa_Muerte", CaudaMuerte))
            lst.Add(New clsParametro("@Lugar_Fallecimiento", LugarFallecimiento))
            lst.Add(New clsParametro("@Estado_Civil", EstadoCivil))
            lst.Add(New clsParametro("@Ruta_Acta_Difunto", RutaActa))
            lst.Add(New clsParametro("@Mensaje", "", SqlDbType.VarChar, ParameterDirection.Output, 100)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Actualizar_Difunto", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            Mensaje = lst(12).Valor.ToString() 'Recuperamos el mensaje de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al registrar el difunto, verifique clase clsDifunto") 'Creamos una nueva excepción de errores
        End Try

        Return Mensaje 'Retornamos el mensaje recuperado
    End Function
End Class
