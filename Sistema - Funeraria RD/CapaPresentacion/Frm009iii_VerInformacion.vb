Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm009iii_VerInformacion

    Dim V As New clsVentas
    Public CodigoVenta As Integer = 0

    Private Sub FrmVerInformacion_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Mostrar_Informacion()
        Validar.Centrar_Form(Me)
    End Sub

    Private Sub Mostrar_Informacion()
        Dim dt As New DataTable
        Try
            V.CodigoVenta = CodigoVenta
            dt = V.Listar_Informacion_Venta()
            lblDireccionVelatorio.Text = dt.Rows(0).ItemArray(0).ToString()
            lblCementerio.Text = dt.Rows(0).ItemArray(1).ToString()
            lblFechaSepelio.Text = Format(dt.Rows(0).ItemArray(2), "dd/MM/yyyy")
            lblDireccionSepelio.Text = dt.Rows(0).ItemArray(3).ToString()
            lblHoraSepelio.Text = Format(dt.Rows(0).ItemArray(4).ToString().Substring(0, 7), "Medium Time")
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    Private Sub lkb_min_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_min.LinkClicked
        WindowState = FormWindowState.Minimized
    End Sub
End Class