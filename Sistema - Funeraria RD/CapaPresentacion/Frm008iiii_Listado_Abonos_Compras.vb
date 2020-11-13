Imports CapaLogicaNegocio

Public Class Frm008iiii_Listado_Abonos_Compras

    Public C As New clsCompras
    Private Sub Frm008iiii_Listado_Abonos_Compras_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call Listar_abonos
    End Sub
    Private Sub Listar_abonos()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla(C.Listar_Abonos_Compras())
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable) 'Método para realizar el listado de todos los Productos
        dgv_abonos.Rows.Clear() 'Limpiamos el control DataGridView1
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            dgv_abonos.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            dgv_abonos.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            dgv_abonos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            dgv_abonos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            dgv_abonos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            dgv_abonos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()


        Next
        dgv_abonos.ClearSelection() 'Limpiamos la selección del DataGridView1
    End Sub

    Private Sub Panel_cabecera_Paint(sender As Object, e As PaintEventArgs) Handles Panel_cabecera.Paint

    End Sub

    Private Sub lkb_cerrar_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Me.Close()
    End Sub
End Class