Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm008ii_ListadoProductos

    Dim P As New clsProducto
    Public Property Caller() As IProveedor
    'Public Property Caller1() As ICliente
    Public Producto As Integer = 0

    Private Sub FrmListadoProductos_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Call Listar_Productos()
        Validar.Centrar_Form(Me)
    End Sub

    Private Sub Listar_Productos()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla(P.Listar_Productos())
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable) 'Método para realizar el listado de todos los Productos
        dtgProductos.Rows.Clear() 'Limpiamos el control DataGridView1
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            dtgProductos.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            dtgProductos.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            dtgProductos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            dtgProductos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            dtgProductos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            dtgProductos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
            dtgProductos.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
            dtgProductos.Rows(i).Cells(6).Value = Math.Round(CDec(dt.Rows(i)(6)), 2)
            dtgProductos.Rows(i).Cells(7).Value = dt.Rows(i)(7).ToString()
        Next
        dtgProductos.ClearSelection() 'Limpiamos la selección del DataGridView1
    End Sub

    Private Sub txtDatos_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            P.Datos = CStr(txtDatos.Text)
            Llenar_Grilla(P.Buscar_Productos())
        Else
            Listar_Productos()
        End If
    End Sub

    Private Sub dtgProductos_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgProductos.CellClick
        If (Me.dtgProductos.Rows.Count > 0) Then
            Me.dtgProductos.Rows(Me.dtgProductos.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub dtgProductos_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgProductos.CellDoubleClick
        Try
            'Si el row en el que hicimos doble click es el encabezado del DataGridView, nos retornamos.
            If e.RowIndex = -1 Then
                Return
            End If

            'Obtenemos el row en el cual se hizo doble Click
            Dim row As DataGridViewRow = dtgProductos.Rows(e.RowIndex)

            'Instanciamos la clase EProveedor para cargar los datos tomandolos de las celdas del row
            'Recuerde convertir al tipo de dato correcto
            Dim item As New EProducto()
            item.CodigoProducto = Convert.ToInt32(row.Cells("Codigo").Value)
            item.NombreProducto = Convert.ToString(row.Cells("Nombre").Value)
            item.Stock = Convert.ToInt32(row.Cells("Stock").Value)
            item.PrecioCompra = Convert.ToDecimal(row.Cells("Precio").Value)

            'If (Producto = 0) Then
            'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
            If Caller Is Nothing Then
                Return
            End If

            'Si el FrmCompras devolvio false por haber encontrado el Proveedor dentro de la lista
            'Informamos de lo sucedido al usuario
            If Not Caller.LoadDataRow1(item) Then
                MessageBox.Show("El Productos ya existe en la lista", "Atención", MessageBoxButtons.OK, MessageBoxIcon.[Stop])
            End If
            'Else
            ''Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
            'If Caller1 Is Nothing Then
            '    Return
            'End If

            ''Si el FrmCompras devolvio false por haber encontrado el Proveedor dentro de la lista
            ''Informamos de lo sucedido al usuario
            'If Not Caller1.LoadDataRow(item) Then
            '    MessageBox.Show("El Productos ya existe en la lista", "Atención", MessageBoxButtons.OK, MessageBoxIcon.[Stop])
            'End If
            'End If
            Close()
        Catch ex As Exception
            MessageBox.Show(String.Format("Error : {0}", ex.Message), "Error Inesperado", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    Private Sub txtDatos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDatos.KeyPress
        Validar.Letras(e)
    End Sub
End Class