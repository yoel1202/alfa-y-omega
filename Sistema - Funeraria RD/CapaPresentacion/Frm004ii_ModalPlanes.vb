Public Class Frm004ii_ModalPlanes


    Private Sub lkb_min_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_min.LinkClicked
        'If (Me.Size.Width = Screen.PrimaryScreen.Bounds.Width And Me.Height = Screen.PrimaryScreen.Bounds.Height) Then
        If (Me.WindowState = FormWindowState.Maximized) Then
            Me.WindowState = FormWindowState.Normal
            Me.Size = New Size(950, 600)
            Centrar_Form()
        Else
            Me.WindowState = FormWindowState.Maximized
        End If

    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()

    End Sub

    Private Sub Frm004i_ModalPlanes_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'ptImagen.ImageLocation = Frm004_PlanesFunerarios.RutaImgen
        Centrar_Form()
    End Sub

    Private Sub Centrar_Form()
        Me.Location = New Point((Screen.PrimaryScreen.Bounds.Width + 105 - Me.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - Me.Height) / 2)
    End Sub

End Class