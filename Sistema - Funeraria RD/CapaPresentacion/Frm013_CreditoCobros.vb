Imports CapaLogicaNegocio

Public Class Frm013_CreditoCobros
    Dim C As New clsContratos 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim CR As New ClsCredito 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim Codigo_contrato As Integer
    Dim selecionar_credito As Boolean
    Private Sub txtDatos_TextChanged(sender As Object, e As EventArgs)

    End Sub
    Private Sub Listar_Contratos()
        Llenar_Grilla(C.Listar_Contratos())
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        Try
            Dgv_contratos.Rows.Clear()

            For i = 0 To dt.Rows.Count - 1
                Dgv_contratos.Rows.Add(dt.Rows(i)(0))
                Dgv_contratos.Rows(i).Cells(0).Value = CInt(dt.Rows(i)(0).ToString())
                Dgv_contratos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                Dgv_contratos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                Dgv_contratos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                Dgv_contratos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                Dgv_contratos.Rows(i).Cells(5).Value = CDec(dt.Rows(i)(5).ToString())
                Dgv_contratos.Rows(i).Cells(6).Value = CInt(dt.Rows(i)(6).ToString())
                Dgv_contratos.Rows(i).Cells(7).Value = CDec(dt.Rows(i)(7).ToString())
                Dgv_contratos.Rows(i).Cells(8).Value = dt.Rows(i)(8).ToString()
                Dgv_contratos.Rows(i).Cells(9).Value = dt.Rows(i)(9).ToString()
                Dgv_contratos.Rows(i).Cells(10).Value = dt.Rows(i)(10).ToString()
                Dgv_contratos.Rows(i).Cells(11).Value = dt.Rows(i)(11).ToString()
                Dgv_contratos.Rows(i).Cells(12).Value = Format(dt.Rows(i)(12), "dd/MM/yyyy")
                Dgv_contratos.Rows(i).Cells(13).Value = dt.Rows(i)(13).ToString()
                Dgv_contratos.Rows(i).Cells(14).Value = dt.Rows(i)(14).ToString()

                Dgv_contratos.Rows(i).Cells(15).Value = dt.Rows(i)(15).ToString()
                Dgv_contratos.Rows(i).Cells(16).Value = dt.Rows(i)(16).ToString()
                Dgv_contratos.Rows(i).Cells(17).Value = dt.Rows(i)(17).ToString()
            Next
            Me.Dgv_contratos.ClearSelection()

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try

    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Try
                C.dato = CStr(txtDatos.Text)
                Llenar_Grilla(C.Buscar_Contratos())
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else
            Listar_Contratos()
        End If
    End Sub

    Private Sub Frm013_CreditoCobros_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Listar_Contratos()
        tb_fecha.Text = DateTime.Now
    End Sub

    Private Sub Dgv_contratos_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles Dgv_contratos.CellContentClick
        Try

            'If (Me.dgv_creditos.Columns(e.ColumnIndex).Name.Equals("Opción")) Then
            '    Dim frm As Frm009iiii_Listado_abonos_Ventas = New Frm009iiii_Listado_abonos_Ventas
            '    frm.V.CodigoVentass = dgv_creditos.CurrentRow.Cells(0).Value.ToString()
            '    frm.Show()
            'Else
            Codigo_contrato = Dgv_contratos.CurrentRow.Cells(0).Value.ToString()
            tb_monto_abono.Text = Dgv_contratos.CurrentRow.Cells(7).Value.ToString()
            txt_direccion.Text = Dgv_contratos.CurrentRow.Cells(17).Value.ToString()
            txt_Cliente.Text = Dgv_contratos.CurrentRow.Cells(1).Value.ToString()
            txt_numero_C.Text = Dgv_contratos.CurrentRow.Cells(3).Value.ToString()
            txt_monto_contrato.Text = Dgv_contratos.CurrentRow.Cells(5).Value.ToString()
            lb_total.Text = Dgv_contratos.CurrentRow.Cells(5).Value.ToString()
            lb_subtotal.Text = CDec(Dgv_contratos.CurrentRow.Cells(5).Value.ToString()) / 1.13
            lb_iva.Text = (CDec(Dgv_contratos.CurrentRow.Cells(5).Value.ToString()) / 1.13) * 0.13
            CR.CodigoContrato = Dgv_contratos.CurrentRow.Cells(0).Value.ToString()
            txt_ahorrado.Text = CR.Devolver_monto_credito()
            txt_periodo.Text = CDate(Dgv_contratos.CurrentRow.Cells(12).Value.ToString()).ToString("MMMM yyyy")
            txt_cuotas_ahorradas.Text = (CDec(txt_ahorrado.Text) / CDec(tb_monto_abono.Text)) - CDec(Dgv_contratos.CurrentRow.Cells(6).Value.ToString())
            txt_saldo_cuotas.Text = (CDec(txt_ahorrado.Text) / CDec(tb_monto_abono.Text))
            selecionar_credito = True
            'End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btn_abonar_Click(sender As Object, e As EventArgs) Handles btn_abonar.Click

    End Sub
End Class