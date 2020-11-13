Imports CapaAccesoDatos
Imports MySql.Data.MySqlClient

Public Class ClsCredito
    Dim M As New clsManejador 'Instanciamos la clase clsManejador
    Public Property CodigoContrato As Integer
    Public Property CodigoCliente() As Integer
    Public Property segundadireccion() As String
    Public Property Documento() As String
    Public Property Nombres() As String
    Public Property Direccion() As String
    Public Property Telefono() As String
    Public Property Email() As String
    Public Function Devolver_monto_credito() As Integer
        Dim monto As Decimal = 0

        Dim lst As New List(Of clsParametro) 'Instanciamos nuestra lista genérica con la clase clsParametro
        Try 'Manejamos una excepción de errores
            'Agregamos a la lista genérica el nombre y valor de los parámetros

            lst.Add(New clsParametro("@Codigo_contratos", CodigoContrato))
            lst.Add(New clsParametro("@montos", "", MySqlDbType.Decimal, ParameterDirection.Output, 5)) 'Especificamos que el parámetro @Mensaje es de tipo salida
            M.EjecutarSP("Devolver_monto_credito_cobros", lst) 'Enviamos el nombre de nuestro Procedimiento almacenado con la lista de los parámetros para su ejecución
            monto = lst(1).Valor.ToString() 'Recuperamos el monto de la Base de Datos
        Catch ex As Exception
            Throw New Exception("Error al devolver el código de la compra, verifique clase clsVentas") 'Creamos una nueva excepción de errores
        End Try
        Return monto 'Retornamos el monto recuperado
    End Function
End Class
