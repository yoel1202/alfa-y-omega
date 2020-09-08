Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm004i_ListadoItem

    Private Const WM_NCLBUTTONDOWN = &HA1
    Private Const HTCAPTION = 2
    Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
                     (ByVal hwnd As Integer, ByVal wMsg As Integer, _
                      ByVal wParam As Integer, ByVal lParam As String) As Integer
    Private Declare Sub ReleaseCapture Lib "user32" ()

    Dim IT As New clsItem
    Public Property Caller() As IItem

    Private Sub FrmListadoItem_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Call Cargar_Combo_Tipo()
    End Sub

    Private Sub Cargar_Combo_Tipo()
        Dim dt As New DataTable

        Try
            dt = IT.Listar_Tipo_Item()
            cbxTipoItem.ValueMember = "Codigo_Tipo_Item"
            cbxTipoItem.DisplayMember = "Descripción"
            cbxTipoItem.DataSource = dt

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub cbxTipoItem_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxTipoItem.SelectedIndexChanged
        Listar_Item_Tipo()
    End Sub


    Private Sub Listar_Item_Tipo()
        Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable

        Try 'Manejamos una excepción de errores
            IT.Codigo_Tipo = cbxTipoItem.SelectedValue
            dt = IT.Listar_Item_x_Tipo() 'Poblamos el DataTable
            DataGridView1.Rows.Clear() 'Limpiamos el control DataGridView1

            'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
            For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
                DataGridView1.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
                DataGridView1.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                DataGridView1.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                DataGridView1.Rows(i).Cells(2).Value = Math.Round(CDec(dt.Rows(i)(2)), 2)
            Next
            DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub DataGridView1_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellDoubleClick
        Try
            'Si el row en el que hicimos doble click es el encabezado del DataGridView, nos retornamos.
            If e.RowIndex = -1 Then
                Return
            End If

            'Obtenemos el row en el cual se hizo doble Click
            Dim row As DataGridViewRow = DataGridView1.Rows(e.RowIndex)

            'Instanciamos la clase ECliente para cargar los datos tomandolos de las celdas del row
            'Recuerde convertir al tipo de dato correcto
            Dim item As New EItem()
            item.CodigoItem = Convert.ToInt32(row.Cells("Codigo").Value)
            item.CodigoDetalle = 0
            item.Nombre = Convert.ToString(row.Cells("Nombres").Value)
            item.Precio = Convert.ToDecimal(row.Cells("Precio").Value)

            'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
            If Caller Is Nothing Then
                Return
            End If

            'Si el FrmUsuario devolvio false por haber encontrado el Cliente dentro de la lista
            'Informamos de lo sucedido al usuario
            If Not Caller.LoadDataRow(item) Then
                clsMensaje.mostrar_mensaje("El Item ya existe en la lista", "error")
            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    Private Sub Panel_cabecera_MouseMove(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles Panel_cabecera.MouseMove
        Dim lHwnd As Int32
        lHwnd = Me.Handle
        If lHwnd = 0 Then Exit Sub
        ReleaseCapture()
        SendMessage(lHwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End Sub

    Private Sub lkb_min_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_min.LinkClicked
        WindowState = FormWindowState.Minimized
    End Sub
End Class