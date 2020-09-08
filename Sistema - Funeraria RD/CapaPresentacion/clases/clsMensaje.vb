Public Module clsMensaje

    Public Sub mostrar_mensaje(ByVal mensaje As String, ByVal Tipo As String)
        Dim frm As New Frm010_Mensaje
        frm.lblmsj.Text = mensaje
        'Frm010_MensajeOk.Centrar_Controles()
        If (Tipo = "ok") Then
            frm.lblTitulo.Text = "Mensaje"
            frm.btnAceptar.BackColor = Color.FromArgb(0, 122, 204)
            frm.ptbIcono.Image = My.Resources.ic_ok
            My.Computer.Audio.PlaySystemSound(System.Media.SystemSounds.Asterisk)
        Else
            My.Computer.Audio.PlaySystemSound(System.Media.SystemSounds.Hand)
        End If
        frm.ShowDialog()

    End Sub

End Module
