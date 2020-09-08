Imports System.Data 'Importamos la librería System.Data
Imports System.Data.SqlClient 'Importamos la librería System.Data.SqlClient para utilizar datos tipo SQL

Public Class clsParametro

    Public Property Nombre() As String 'Declaramos la propiedad para los nombre de los parámetros
    Public Property Valor() As Object 'Declaramos la propiedad para asignar el valor de los parámetros
    Public Property TipoDato() As SqlDbType 'Declaramos la propiedad para saber que tipo de dato del parámetro
    Public Property Direccion() As ParameterDirection 'Declaramos la propiedad para la direción del parámetro (ENTRADA , SALIDA)
    Public Property Tamaño() As Integer 'Declaramos la propiedad para especificar el tamaño del parámetro (SALIDA)

    Public Sub New(ByVal objNombre As String, ByVal objValor As Object) 'Constructor para pasar los parámetros de tipo entrada
        Nombre = objNombre
        Valor = objValor
        Direccion = ParameterDirection.Input
    End Sub

    'Constructor para pasar los parámetros de tipo salida
    Public Sub New(ByVal objNombre As String, ByVal objValor As Object, ByVal objTipoDato As SqlDbType, ByVal objDireccion As ParameterDirection, ByVal objTamaño As Integer)
        Nombre = objNombre
        Valor = objValor
        Tamaño = objTamaño
        TipoDato = objTipoDato
        Direccion = objDireccion
    End Sub

End Class
