Public Class DescripcionMonto

    Public Function enletras(ByVal num As String) As String
        Dim res As String
        Dim dec As String = ""

        Dim entero As Integer
        Dim decimales As Integer
        Dim nro As Decimal

        Try
            nro = Convert.ToDouble(num)
        Catch ex As Exception
            Return ""
        End Try

        entero = Convert.ToInt64(Math.Truncate(nro))
        decimales = Convert.ToInt32(Math.Round((nro - entero) * 100, 2))
        If (decimales > 0) Then
            dec = " CON " + decimales.ToString() + "/100 NUEVOS SOLES"
        End If

        If (String.IsNullOrEmpty(dec)) Then
            res = toText(Convert.ToDouble(entero)) + " CON " + "00/100 NUEVOS SOLES"
        Else
            res = toText(Convert.ToDouble(entero)) + dec
        End If
        Return res
    End Function

    Private Function toText(ByVal value As Double) As String
        Dim Num2Text As String = ""
        value = Math.Truncate(value)
        If (value = 0) Then
            Num2Text = "CERO"
        ElseIf (value = 1) Then
            Num2Text = "UNO"
        ElseIf (value = 1) Then
            Num2Text = "UNO"
        ElseIf (value = 2) Then
            Num2Text = "DOS"
        ElseIf (value = 3) Then
            Num2Text = "TRES"
        ElseIf (value = 4) Then
            Num2Text = "CUATRO"
        ElseIf (value = 5) Then
            Num2Text = "CINCO"
        ElseIf (value = 5) Then
            Num2Text = "CINCO"
        ElseIf (value = 6) Then
            Num2Text = "SEIS"
        ElseIf (value = 7) Then
            Num2Text = "SIETE"
        ElseIf (value = 8) Then
            Num2Text = "OCHO"
        ElseIf (value = 9) Then
            Num2Text = "NUEVE"
        ElseIf (value = 10) Then
            Num2Text = "DIEZ"
        ElseIf (value = 11) Then
            Num2Text = "ONCE"
        ElseIf (value = 12) Then
            Num2Text = "DOCE"
        ElseIf (value = 13) Then
            Num2Text = "TRECE"
        ElseIf (value = 14) Then
            Num2Text = "CATORCE"
        ElseIf (value = 15) Then
            Num2Text = "QUINCE"
        ElseIf (value < 20) Then
            Num2Text = "DIECI" + toText(value - 10)
        ElseIf (value = 20) Then
            Num2Text = "VEINTE"
        ElseIf (value < 30) Then
            Num2Text = "VEINTI" + toText(value - 20)
        ElseIf (value = 30) Then
            Num2Text = "TREINTA"
        ElseIf (value = 40) Then
            Num2Text = "CUARENTA"
        ElseIf (value = 50) Then
            Num2Text = "CINCUENTA"
        ElseIf (value = 60) Then
            Num2Text = "SESENTA"
        ElseIf (value = 70) Then
            Num2Text = "SETENTA"
        ElseIf (value = 80) Then
            Num2Text = "OCHENTA"
        ElseIf (value = 90) Then
            Num2Text = "NOVENTA"
        ElseIf (value < 100) Then
            Num2Text = toText(Math.Truncate(value / 10) * 10) + " Y " + toText(value Mod 10)
        ElseIf (value = 100) Then
            Num2Text = "CIEN"
        ElseIf (value < 200) Then
            Num2Text = "CIENTO " + toText(value - 100)
        ElseIf ((value = 200) Or (value = 300) Or (value = 400) Or (value = 600) Or (value = 800)) Then
            Num2Text = toText(Math.Truncate(value / 100)) + "CIENTOS"
        ElseIf (value = 500) Then
            Num2Text = "QUINIENTOS"
        ElseIf (value = 700) Then
            Num2Text = "SETECIENTOS"
        ElseIf (value = 900) Then
            Num2Text = "NOVECIENTOS"
        ElseIf (value < 1000) Then
            Num2Text = toText(Math.Truncate(value / 100) * 100) + " " + toText(value Mod 100)
        ElseIf (value = 1000) Then
            Num2Text = "MIL"
        ElseIf (value < 2000) Then
            Num2Text = "MIL " + toText(value Mod 1000)
        ElseIf (value < 1000000) Then
            Num2Text = toText(Math.Truncate(value / 1000)) + " MIL"
            If ((value Mod 1000) > 0) Then
                Num2Text = Num2Text + " " + toText(value Mod 1000)
            End If
        ElseIf (value = 1000000) Then
            Num2Text = "UN MILLON"
        ElseIf (value < 2000000) Then
            Num2Text = "UN MILLON " + toText(value Mod 1000000)
        ElseIf (value < 1000000000000) Then
            Num2Text = toText(Math.Truncate(value / 1000000)) + " MILLONES "
            If ((value - Math.Truncate(value / 1000000) * 1000000) > 0) Then
                Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000) * 1000000)
            End If
        ElseIf (value = 1000000000000) Then
            Num2Text = "UN BILLON"
        ElseIf (value < 2000000000000) Then
            Num2Text = "UN BILLON " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000)
        Else
            Num2Text = toText(Math.Truncate(value / 1000000000000)) + " BILLONES"
            If ((value - Math.Truncate(value / 1000000000000) * 1000000000000) > 0) Then
                Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000)
            End If
        End If

        Return Num2Text

    End Function

End Class
