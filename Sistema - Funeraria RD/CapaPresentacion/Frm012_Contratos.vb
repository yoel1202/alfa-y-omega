Public Class Frm012_Contratos
    Private Sub lkbBuscar_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs)

    End Sub

    Private Sub rbnFactura_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub rbnBoleta_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub lkbBuscar1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs)

    End Sub

    Private Sub btnBorrar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnRegistrar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub lkbBuscar_LinkClicked_1(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lkbBuscar.LinkClicked
        'Instanciamos el FrmPersonalPrincipal
        Dim frm As New Frm005_Cliente()
        frm.Cliente = 1
        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller1 = Me
        'Mostramos el FrmPersonalPrincipal
        Frm00_Login.FormActive = 2
        frm.ShowDialog()
    End Sub
End Class