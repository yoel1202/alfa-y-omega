Imports System.Collections.Generic

Public Class EDocumento

    Public Property Serie() As String
    Public Property NroCorrelativo() As String
    Public Property FechaVenta() As Date
    Public Property Igv() As Decimal
    Public Property SubTotal() As Decimal
    Public Property Total() As Decimal
    Public Property DescripcionMonto() As String
    Public Property Cliente() As String
    Public Property Direccion() As String
    Public Property TipoIdentificacion() As String
    Public Property Documento() As String
    Public Property TipoDocumento() As String

    Public Detalle As New List(Of EArticulo)()

End Class
