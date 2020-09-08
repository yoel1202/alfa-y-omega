Public Module Validar
    Public usuario_online As String = ""
    Public Codigo_Personal_Online As Integer = 0
    Public Cerrar_form As Integer = 0

    Public Sub Centrar_Form(ByVal frm As Form)
        frm.Location = New Point((Screen.PrimaryScreen.Bounds.Width + 105 - frm.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - frm.Height) / 2)
    End Sub
    
    Public Sub Numeros(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        e.Handled = Not (Char.IsDigit(e.KeyChar) Or (Char.IsControl(e.KeyChar)))
    End Sub

    Public Sub Numeros_con_Numeral(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        e.Handled = Not (Char.IsDigit(e.KeyChar) Or (Char.IsControl(e.KeyChar)) Or e.KeyChar = "#")
    End Sub

    Public Sub Numeros_con_Decimales(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        e.Handled = Not (Char.IsDigit(e.KeyChar) Or (Char.IsControl(e.KeyChar)) Or e.KeyChar = ".")
    End Sub

    Public Sub Letras(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        e.Handled = Not (Char.IsLetter(e.KeyChar) Or (Char.IsControl(e.KeyChar)) Or (Char.IsSeparator(e.KeyChar)))
    End Sub

    Public Sub LetrasconPunto(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        e.Handled = Not (Char.IsLetter(e.KeyChar) Or (Char.IsControl(e.KeyChar)) Or (Char.IsSeparator(e.KeyChar)) Or e.KeyChar = ".")
    End Sub

    Public Sub Espacio(ByVal e As System.Windows.Forms.KeyPressEventArgs)
        If (Char.IsSeparator(e.KeyChar)) Then
            e.Handled = True
        Else
            e.Handled = False
        End If

    End Sub

End Module
