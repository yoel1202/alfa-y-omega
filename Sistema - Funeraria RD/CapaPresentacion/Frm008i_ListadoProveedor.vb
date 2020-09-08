Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class ListadoProveedor
    Dim Tipo_Dato = 0
    Dim P As New clsProveedor 'Instanciamos la clase clsProveedor de la Capa Logica de Negocio para usar sus funciones
    Public Property Caller() As IProveedor

    Private Sub ListadoProveedor_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Listar_Proveedores()
        Validar.Centrar_Form(Me)
    End Sub

    Private Sub Listar_Proveedores()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla(P.Listar_Proveedores())
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        DataGridView1.Rows.Clear() 'Limpiamos el control DataGridView1

        'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            DataGridView1.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            DataGridView1.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            DataGridView1.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            DataGridView1.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            DataGridView1.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            DataGridView1.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
            DataGridView1.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
            DataGridView1.Rows(i).Cells(6).Value = dt.Rows(i)(6).ToString()
            DataGridView1.Rows(i).Cells(7).Value = dt.Rows(i)(7).ToString()
        Next
        DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1
    End Sub

    Private Sub DataGridView1_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellDoubleClick
        Try
            'Si el row en el que hicimos doble click es el encabezado del DataGridView, nos retornamos.
            If e.RowIndex = -1 Then
                Return
            End If

            'Obtenemos el row en el cual se hizo doble Click
            Dim row As DataGridViewRow = DataGridView1.Rows(e.RowIndex)

            'Instanciamos la clase EProveedor para cargar los datos tomandolos de las celdas del row
            'Recuerde convertir al tipo de dato correcto
            Dim item As New EProveedor()
            item.CodigoProveedor = Convert.ToInt32(row.Cells("Codigo").Value)
            item.Datos = Convert.ToString(row.Cells("RazonSocial").Value)

            'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
            If Caller Is Nothing Then
                Return
            End If

            'Si el FrmCompras devolvio false por haber encontrado el Proveedor dentro de la lista
            'Informamos de lo sucedido al usuario
            If Not Caller.LoadDataRow(item) Then
                MessageBox.Show("El Proveedor ya existe en la lista", "Atención", MessageBoxButtons.OK, MessageBoxIcon.[Stop])
            End If
            Close()
        Catch ex As Exception
            MessageBox.Show(String.Format("Error : {0}", ex.Message), "Error Inesperado", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub txtDatos_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDatos.TextChanged
        Try 'Manejamos una excepción de errores
            If (txtDatos.Text.Trim() <> "") Then
                Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable
                P.Datos = CStr(txtDatos.Text)
                Llenar_Grilla(P.Buscar_Proveedor())
            Else
                Listar_Proveedores()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub DataGridView1_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        If (Me.DataGridView1.Rows.Count > 0) Then
            Me.DataGridView1.Rows(Me.DataGridView1.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    'Private Sub Centrar_Form()
    '    Me.Location = New Point((Screen.PrimaryScreen.Bounds.Width + 105 - Me.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - Me.Height) / 2)
    'End Sub

    Private Sub rbnNDoc_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNDoc.CheckedChanged
        txtDatos.MaxLength = 8
        txtDatos.Clear()
        Tipo_Dato = 0
        txtDatos.Focus()
    End Sub

    Private Sub rbnNombre_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNombre.CheckedChanged
        txtDatos.MaxLength = 256
        txtDatos.Clear()
        Tipo_Dato = 1
        txtDatos.Focus()
    End Sub

    Private Sub txtDatos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDatos.KeyPress
        If (Tipo_Dato = 0) Then
            Validar.Numeros(e)
        Else
            Validar.Letras(e)
        End If
    End Sub
End Class