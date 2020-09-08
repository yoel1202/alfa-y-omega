Public Class Frm010_Mensaje

    Private Sub Frm010_MensajeOk_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Centrar_Controles()
    End Sub

    Private Sub Centrar_Controles()
        Panel_msj.Location = New Point((Me.Width - Panel_msj.Width) / 2, Panel_msj.Location.Y)
        btnAceptar.Location = New Point((Me.Width - btnAceptar.Width) / 2, btnAceptar.Location.Y)
    End Sub

    Private Sub btnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAceptar.Click
        Close()
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub
End Class