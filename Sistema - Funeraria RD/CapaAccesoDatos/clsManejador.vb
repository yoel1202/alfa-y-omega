Imports System.Data 'Importamos la librería System.Data
Imports System.Data.SqlClient 'Importamos la librería System.Data.SqlClient para realizar consultas SQL
Imports System.Configuration 'Importamos la librería System.Configuration para usar la conexión del App.config
Imports MySql.Data.MySqlClient

Public Class clsManejador


    Public conexion = New MySqlConnection("Server=192.168.0.11; Database=funeraria; Uid=root; Pwd=PassworD1")

    'Método para abrir la conexión de la Base de Datos
    Sub abrir()

        Try
            If (conexion.State = 0) Then 'Verificamos si la conexión se encuentra cerrada
                conexion.Open() 'Abrimos la conexión

            End If
        Catch ex As Exception
            MsgBox("Can't load Web page" & ex.Message)

        End Try

    End Sub

    'Método para cerrar la conexión de la Base de Datos
    Sub cerrar()
        If (conexion.State = 1) Then 'Verificamos si la conexión se encuentra abierta
            conexion.Close() 'Cerramos la conexión
        End If
    End Sub

    'Función que utilizaremos para realizar listados de las diferentes tablas que tenemos en nuestra BD
    Public Function Listado(ByVal NombreSP As String, ByVal lst As List(Of clsParametro)) As DataTable
        Dim dt As New DataTable 'Declaramos e instanciamos nuestra variable DataTable
        Dim da As MySqlDataAdapter  'Declaramos nuestro adaptador para consultas de SQL

        Try 'Manejamos una excepción de errores
            Call abrir() 'Llamamos al método abrir conexión
            Dim cmd As MySqlCommand = New MySqlCommand(NombreSP, conexion)
            da = New MySqlDataAdapter(cmd) 'Asignamos el nombre de nuestro procedimiento almacenado en nuestro adaptador
            da.SelectCommand.CommandType = CommandType.StoredProcedure 'Especificamos que es de tipo StoredProcedure
            If (Not lst Is Nothing) Then 'Verificamos si nuestra lista genérica tiene datos
                For i As Integer = 0 To lst.Count - 1 'Recorremos los elementos de nuestra lista genérica
                    da.SelectCommand.Parameters.AddWithValue(lst(i).Nombre, lst(i).Valor) 'Pasamos los parámetros de nuestra lista genérica
                Next
            End If
            da.Fill(dt) 'Poblamos nuestro DataTable con los elementos del SqlDataAdapter

            Call cerrar() 'Llamamos al método cerrar la conexión
        Catch ex As Exception
            Throw New Exception("Error al listar la información de la BD") 'Creamos una nueva excepción de errores
        End Try
        Return dt 'Retornamos el DataTable

    End Function

    'Método para ejecutar sentencias de tipo (INSERT , UPDATE Y DELETE)
    Public Sub EjecutarSP(ByVal NombreSP As String, ByVal lst As List(Of clsParametro))
        Dim cmd As MySqlCommand 'Declaramos una variable de tipo SqlCommand

        Try 'Manejamos una excepción de errores
            Call abrir() 'Llamamos al método abrir conexión
            cmd = New MySqlCommand(NombreSP, conexion) 'Asignamos el nombre de nuestro procedimiento almacenado al SqlCommand
            cmd.CommandType = CommandType.StoredProcedure 'Especificamos que es de tipo StoredProcedure
            If (Not lst Is Nothing) Then 'Verificamos si nuestra lista genérica tiene datos

                For i = 0 To lst.Count - 1 'Recorremos los elementos de nuestra lista genérica
                    If (lst(i).Direccion = ParameterDirection.Input) Then 'Verificamos si es un parámetro de tipo entrada
                        cmd.Parameters.AddWithValue(lst(i).Nombre, lst(i).Valor) 'Agregamos el parámetro
                    End If

                    If (lst(i).Direccion = ParameterDirection.Output) Then 'Verificamos si es un parámetro de tipo salida
                        cmd.Parameters.Add(lst(i).Nombre, lst(i).TipoDato, lst(i).Tamaño).Direction = ParameterDirection.Output 'Agregamos el parámetro
                    End If
                Next
                cmd.ExecuteNonQuery() 'Ejecutamos la sentencia SQL

                For i = 0 To lst.Count - 1 'Recorremos la lista genérica
                    If (cmd.Parameters(i).Direction = ParameterDirection.Output) Then 'Verificamos si hay parámetros de tipo salida
                        lst(i).Valor = cmd.Parameters(i).Value.ToString() 'Recuperamos el valor del parámetro de salida y lo pasamos a la lista genérica
                    End If
                Next

            End If
            Call cerrar() 'Llamamos al método cerrar la conexión
        Catch ex As Exception
            Throw New Exception("Error al Ejecutar el Ejecutar SP") 'Creamos una nueva excepción de errores
        End Try

    End Sub

End Class
