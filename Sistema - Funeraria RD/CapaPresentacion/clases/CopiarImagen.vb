Public Class CopiarImagen

    Public Function loadImagen() As String
        Dim reportPath As String = Application.StartupPath

        Dim cadenas() As Char = New Char() {"b", "i", "n", "D", "e", "u", "g", "\"}
        Dim urlfinal As String = reportPath.Trim(cadenas) & "n" & "\Resources\foto.jpg"
        Return urlfinal
    End Function

    Public Function nombreImagen(ByVal ruta As String) As String
        Dim nombre_Imagen As String = ""
        Dim split = ruta.Split(New Char() {"", "\"})
        Dim item As String
        For Each item In split
            If (item.Trim() <> "") Then
                nombre_Imagen = item
            End If
        Next
        Return nombre_Imagen
    End Function

    Public Function copiarImagen(ByVal ruta As String, ByVal nombre As String, ByVal rutaAntigua As String, ByVal Valor As Integer) As String
        Dim rutaDestino As String = "C:\Funeraria"
        Dim archivoOrigen As String = ruta
        Dim nombreFoto As String = ""

        Call crearDirectoriosBlanco(rutaDestino)

        If (nombreImagen(ruta) = "foto.jpg") Then
            nombreFoto = nombreImagen(ruta)
        Else
            nombreFoto = nombre + ".jpg"
        End If

        If (Valor = 1) Then
            rutaDestino = rutaDestino + "\Producto"
        ElseIf (Valor = 2) Then
            rutaDestino = rutaDestino + "\Planes Funerarios"
        Else
            rutaDestino = rutaDestino + "\Actas"
        End If

        Dim archivoDestino As String = System.IO.Path.Combine(rutaDestino, nombreFoto)

        If (rutaAntigua <> ruta) Then
            If (System.IO.File.Exists(archivoDestino) = False) Then
                System.IO.File.Copy(archivoOrigen, archivoDestino, True)
            Else
                If (System.IO.File.Exists(archivoDestino) = True And rutaAntigua <> "") Then
                    borrarFoto(rutaAntigua, Valor) 'Verificar valor booleano a enviar (OJO)
                    System.IO.File.Copy(archivoOrigen, archivoDestino)
                End If
            End If
        End If

        Return archivoDestino

    End Function

    Public Sub crearDirectoriosBlanco(ByVal directorioRaiz As String)
        If (System.IO.Directory.Exists(directorioRaiz) = False) Then
            System.IO.Directory.CreateDirectory(directorioRaiz)
            System.IO.Directory.CreateDirectory(directorioRaiz + "\Producto")
            System.IO.Directory.CreateDirectory(directorioRaiz + "\Planes Funerarios")
            System.IO.Directory.CreateDirectory(directorioRaiz + "\Actas")
        End If
    End Sub

    Private Sub borrarFoto(ByVal ruta As String, ByVal Valor As Integer)
        Dim rutaDestino As String = "C:\Funeraria"
        Dim archivoOrigen As String = ruta

        If (Valor = 1) Then
            rutaDestino = rutaDestino + "\Producto"
        ElseIf (Valor = 2) Then
            rutaDestino = rutaDestino + "\Planes Funerarios"
        Else
            rutaDestino = rutaDestino + "\Actas"
        End If

        If (System.IO.File.Exists(ruta) = True) Then
            System.IO.File.Delete(ruta)
        End If

    End Sub

End Class
