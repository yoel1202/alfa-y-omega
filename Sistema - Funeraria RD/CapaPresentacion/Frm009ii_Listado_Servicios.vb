Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm009ii_Listado_Servicios

    Dim IT As New clsItem
    Public Property Caller() As IPlanServicio

    Private Sub FrmListado_Servicios_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Call Listar_Item_Tipo()
        Validar.Centrar_Form(Me)
    End Sub

    Private Sub Listar_Item_Tipo()
        Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable

        Try 'Manejamos una excepción de errores
            IT.Codigo_Tipo = 2
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
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub DataGridView1_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellDoubleClick
        Try
            'Si el row en el que hicimos doble click es el encabezado del DataGridView, nos retornamos.
            If e.RowIndex = -1 Then
                Return
            End If

            Dim descripcion As String = String.Empty
            Dim titulo As String = String.Empty
            Dim RptaDefecto As String = String.Empty

            Dim Rpta As Object
            'Asignamos una breve descripción al InputBox
            descripcion = "Ingrese la Cantidad a Vender"
            'Título del InputBox
            titulo = "Sistema para Funeraria"
            'Asignamos un valor por defecto
            RptaDefecto = 1
            'Mostramos la descripción, el título y el valor por defecto
            Rpta = InputBox(descripcion, titulo, RptaDefecto)

            If (Rpta <> "") Then
                'Obtenemos el row en el cual se hizo doble Click
                Dim row As DataGridViewRow = DataGridView1.Rows(e.RowIndex)

                'Instanciamos la clase EProveedor para cargar los datos tomandolos de las celdas del row
                'Recuerde convertir al tipo de dato correcto
                Dim item As New EPlanServicio()
                item.Codigo = Convert.ToInt32(row.Cells("Codigo").Value)
                item.Descripcion = Convert.ToString(row.Cells("Descripcion").Value)
                item.Precio = Convert.ToDecimal(row.Cells("Precio").Value)
                item.Cantidad = Convert.ToInt32(Rpta)

                'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
                If Caller Is Nothing Then
                    Return
                End If

                'Si el FrmCompras devolvio false por haber encontrado el Proveedor dentro de la lista
                'Informamos de lo sucedido al usuario
                If Not Caller.LoadDataRow1(item) Then
                    MessageBox.Show("El Servicio Funerario ya existe en la lista", "Atención", MessageBoxButtons.OK, MessageBoxIcon.[Stop])
                End If
                Close()
            Else
                Return 'Si es vacío retornamos al mismo formulario
            End If
        Catch ex As Exception
            MessageBox.Show(String.Format("Error : {0}", ex.Message), "Error Inesperado", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub
End Class