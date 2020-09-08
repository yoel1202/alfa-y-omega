Imports Microsoft.Reporting.WinForms

Public Class FrmDocumento

    'Cree dos listas una para el Encabezado y otra para el detalle
    '
    Public Invoice As New List(Of EDocumento)()
    Public Detail As New List(Of EArticulo)()

    'Cree las propiedades publicas Titulo y Empresa
    Public Property Titulo() As String
    Public Property Empresa() As String
    Public Property Direccion() As String
    Public Property Telefonos() As String

    Private Sub FrmDocumento_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Validar.Centrar_Form(Me)
        'Limpiemos el DataSource del informe
        ReportViewer1.LocalReport.DataSources.Clear()

        'Establezcamos los parametros que enviaremos al reporte
        'recuerde que son dos para el titulo del reporte y para el nombre de la empresa
        Dim parameters As ReportParameter() = New ReportParameter(3) {}
        parameters(0) = New ReportParameter("parameterTitulo", Titulo)
        parameters(1) = New ReportParameter("parameterEmpresa", Empresa)
        parameters(2) = New ReportParameter("parameterDireccion", Direccion)
        parameters(3) = New ReportParameter("parameterTelefonos", Telefonos)

        'Establezcamos la lista como Datasource del informe
        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("Encabezado", Invoice))
        ReportViewer1.LocalReport.DataSources.Add(New ReportDataSource("Detalle", Detail))

        'Enviemos la lista de parametros
        ReportViewer1.LocalReport.SetParameters(parameters)

        'Hagamos un refresh al reportViewer
        Me.ReportViewer1.RefreshReport()
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    Private Sub lkb_min_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_min.LinkClicked
        WindowState = FormWindowState.Minimized
    End Sub
End Class