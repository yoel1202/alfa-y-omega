Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm004_PlanesFunerarios
    Implements IItem
    Private Shared ReadOnly Item As New List(Of EItem)()
    Dim PF As New clsPlanFunerario 'Instanciamos la clase clsPlanFunerario de la Capa Logica de Negocio para usar sus funciones
    Dim Imagen As New CopiarImagen
    Dim Codigo As Integer = 0 'Variable para almacenar el código del servicio
    Dim Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim rutaAntigua As String = ""
    'Public RutaImgen = ""

    Private Sub PlanesFunerarios_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Call Listar_Planes_Funerarios() 'Llamamos al método listar_Planes_Funerarios
        ptbImagen.ImageLocation = Imagen.loadImagen
        Cargar_Combo_Planes()
    End Sub

    Private Function contar()
        Dim cont = 0
        For i = 0 To Me.DataGridView1.RowCount
            cont += 1
        Next
        Return cont
    End Function

    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        'Evento para guardar cambios, para registrar y/o actualizar información

        ErrorProvider1.Clear()
        If (txtDescripcion.Text.Trim() = "") Then
            ErrorProvider1.SetError(txtDescripcion, "Ingrese Descripción")
        ElseIf (txtPrecio.Text.Trim = "") Then
            ErrorProvider1.SetError(txtPrecio, "Ingrese Precio")
        Else
            Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD
            Dim RutaImgen = ""

            Try 'Manejamos una excepción de errores

                If (Valor = 0) Then 'Si es valor cero, registramos
                    Dim NombreFoto As String = "Planes-" & contar()
                    RutaImgen = Imagen.copiarImagen(ptbImagen.ImageLocation, NombreFoto, "", 2)
                    PF.Descripcion = txtDescripcion.Text
                    PF.Precio = CDec(txtPrecio.Text)
                    PF.RutaImagen = RutaImgen
                    Mensaje = PF.Registrar_Plan_Funerario() 'Ejecutamos la función Registrar Plan Funerario
                    If (Mensaje = "Registrado Correctamente") Then 'Varificamos si se registró correctamente
                        Call Listar_Planes_Funerarios() 'Llamamos al método listar Plan Funerario
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_Controles() 'Llamamos el método limpiar controles
                    Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If

                Else 'Si es valor 1 actualizamos la información
                    Dim NombreFoto As String = "Planes-" & Codigo
                    RutaImgen = Imagen.copiarImagen(ptbImagen.ImageLocation, NombreFoto, "", 2)
                    PF.Codigo = Codigo
                    PF.Descripcion = txtDescripcion.Text
                    PF.Precio = CDec(txtPrecio.Text)
                    PF.RutaImagen = RutaImgen
                    Mensaje = PF.Actualizar_Plan_Funerario() 'Ejecutamos la función Registrar Plan Funerario
                    If (Mensaje = "Actualizado Correctamente") Then 'Varificamos si se registró correctamente
                        Call Listar_Planes_Funerarios() 'Llamamos al método listar Plan Funerario
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_Controles() 'Llamamos el método limpiar controles
                    Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                End If
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        End If
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("VerPlan")) Then
            Me.DataGridView1.ClearSelection()
            Dim Frm As New Frm004ii_ModalPlanes()
            Frm.ptImagen.ImageLocation = Me.DataGridView1.CurrentRow.Cells(3).Value.ToString()
            Frm.ShowDialog()
        End If
    End Sub

    Private Sub Listar_Planes_Funerarios()
        Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable

        Try 'Manejamos una excepción de errores
            dt = PF.Listar_Planes_Funerarios() 'Poblamos el DataTable
            DataGridView1.Rows.Clear() 'Limpiamos el control DataGridView1

            'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
            For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
                DataGridView1.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
                DataGridView1.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                DataGridView1.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                DataGridView1.Rows(i).Cells(2).Value = Math.Round(CDec(dt.Rows(i)(2)), 2)
                DataGridView1.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                DataGridView1.Rows(i).Cells(4).Value = "Ver Plan"
            Next
            DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1
            For Each row As DataGridViewRow In DataGridView1.Rows
                Dim button1 As DataGridViewButtonCell = CType(row.Cells(4), DataGridViewButtonCell)
                button1.Style.BackColor = Color.FromArgb(92, 184, 92)
                button1.Style.ForeColor = Color.White
                button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
            Next
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub Limpiar_Controles()
        txtDescripcion.Clear()
        txtDescripcion.Focus()
        txtPrecio.Clear()
        ptbImagen.ImageLocation = Imagen.loadImagen()
        Valor = 0
        DataGridView1.ClearSelection()
        ErrorProvider1.Clear()
    End Sub

    Private Sub ptbImagen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ptbImagen.Click
        Dim OpenFile As New OpenFileDialog()
        Try
            If OpenFile.ShowDialog() = Windows.Forms.DialogResult.OK Then
                ptbImagen.ImageLocation = OpenFile.FileName
            Else
                ptbImagen.ImageLocation = Imagen.loadImagen()
            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje("Debe elegir una Imagen", "error")
        End Try
    End Sub

    Private Sub DataGridView1_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellDoubleClick
        'Evento para pasar los datos de la fila seleccionada del DataGridView1 a las cajas de Texto y realizar la actualización de la información
        If (DataGridView1.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            Codigo = CInt(DataGridView1.CurrentRow.Cells(0).Value.ToString())
            txtDescripcion.Text = DataGridView1.CurrentRow.Cells(1).Value.ToString()
            txtPrecio.Text = Math.Round(CDec(DataGridView1.CurrentRow.Cells(2).Value), 2)
            ptbImagen.ImageLocation = DataGridView1.CurrentRow.Cells(3).Value.ToString()
            rutaAntigua = DataGridView1.CurrentRow.Cells(3).Value.ToString()
            DataGridView1.Rows(DataGridView1.CurrentRow.Index).Selected = True 'True para mantener seleccionada la fila
            Valor = 1 'Asignamos valor uno para indicarle que va a actualizar la información
        End If
    End Sub

    Private Sub DataGridView1_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        'Evento para seleccionar la fila del control DataGridView1
        If (DataGridView1.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            DataGridView1.Rows(DataGridView1.CurrentRow.Index).Selected = True 'True para seleccionar la fila
        End If
    End Sub

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        Close()
    End Sub

    '==================== Tab Page 2 ======================

    Private Sub Cargar_Combo_Planes()
        Dim dt As New DataTable

        Try
            dt = PF.Listar_Planes_Funerarios()
            cbxPlanesFunerarios.ValueMember = "Codigo_Plan_Funerario"
            cbxPlanesFunerarios.DisplayMember = "Descripcion"
            cbxPlanesFunerarios.DataSource = dt

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub lkbAgregarItem_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbAgregarItem.LinkClicked
        Dim frm As New Frm004i_ListadoItem
        'frm.Show()
        '
        'Instanciamos el Form2
        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller = Me
        '
        'Mostramos el Form2
        frm.ShowDialog()
    End Sub

    Public Function LoadDataRow(ByVal product As EItem) As Boolean Implements IItem.LoadDataRow
        'Busca si el Item ya se encuentra en la lista
        Dim exists As Boolean = Item.Any(Function(x) x.CodigoItem.Equals(product.CodigoItem))

        'Preguntamos por el resultado de la busqueda del Items dentro de la lista
        If Not exists Then
            'Agregamos a la lista de items el Item enviado por el Form2
            Item.Add(product)
            Dim Total As Double = 0

            dtgDetallesPlanes.Rows.Clear()
            For i = 0 To Item.Count - 1
                dtgDetallesPlanes.Rows.Add()
                dtgDetallesPlanes.Rows(i).Cells(0).Value = Item(i).CodigoItem
                dtgDetallesPlanes.Rows(i).Cells(1).Value = Item(i).CodigoDetalle
                dtgDetallesPlanes.Rows(i).Cells(2).Value = Item(i).Nombre
                dtgDetallesPlanes.Rows(i).Cells(3).Value = Item(i).Precio
                dtgDetallesPlanes.Rows(i).Cells(4).Value = "Eliminar"
                Total += (Item(i).Precio)
                
            Next
            Me.DataGridView1.ClearSelection()
            For Each row As DataGridViewRow In dtgDetallesPlanes.Rows
                Dim button1 As DataGridViewButtonCell = CType(row.Cells(4), DataGridViewButtonCell)
                button1.Style.BackColor = Color.FromArgb(217, 83, 79)
                button1.Style.ForeColor = Color.White
                button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
            Next
            lblTotal.Text = FormatNumber(CDbl(Total), 2)
            'Retornamos True
            Return True
        End If
        '
        'Si la condicion exists es igual a False, es decir, que el item SI existe en la lista
        'retornamos FALSE para mostrar un mensajde informacion
        Return False
    End Function

    Private Sub dtgDetallesPlanes_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgDetallesPlanes.CellClick
        If (Me.dtgDetallesPlanes.Rows.Count > 0) Then
            Me.dtgDetallesPlanes.Rows(Me.dtgDetallesPlanes.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub dtgDetallesPlanes_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgDetallesPlanes.CellContentClick
        Try
            If (Me.dtgDetallesPlanes.Columns(e.ColumnIndex).Name.Equals("Button")) Then
                Dim Total As Double = 0
                Dim i As Integer = dtgDetallesPlanes.CurrentRow.Index
                If (Me.dtgDetallesPlanes.CurrentRow.Cells(1).Value = 0) Then
                    dtgDetallesPlanes.Rows.RemoveAt(i)
                    Item.RemoveAt(i)
                Else 'Eliminamos el Detalle del Plan Funerario de la BD
                    PF.Codigo = CInt(Me.dtgDetallesPlanes.CurrentRow.Cells(1).Value)
                    PF.Eliminar_Detalle_Plan_Funerario()
                    Item.RemoveAt(i)
                    dtgDetallesPlanes.Rows.RemoveAt(i)
                End If

                For i = 0 To Me.dtgDetallesPlanes.RowCount - 1
                    Total += CDbl(dtgDetallesPlanes.Rows(i).Cells(3).Value)
                Next
                lblTotal.Text = FormatNumber(CDbl(Total), 2)
            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btnGuardarTabPage2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardarTabPage2.Click
        Dim Mensaje As String = ""
        Try
            If (Me.dtgDetallesPlanes.Rows.Count > 0) Then
                For i = 0 To Me.dtgDetallesPlanes.RowCount - 1
                    If (Me.dtgDetallesPlanes.Rows(i).Cells(1).Value = 0) Then
                        PF.Codigo = CInt(cbxPlanesFunerarios.SelectedValue)
                        PF.CodigoItem = CInt(dtgDetallesPlanes.Rows(i).Cells(0).Value)
                        PF.Precio = CDec(lblTotal.Text)
                        Mensaje = PF.Registrar_Detalle_Plan_Funerario()
                    End If
                Next
                Listar()
                If (Mensaje <> "") Then
                    Call Listar_Planes_Funerarios() 'Llamamos al método listar Plan Funerario
                    Call Limpiar_Controles() 'Llamamos el método limpiar controles
                    clsMensaje.mostrar_mensaje(Mensaje, "ok")
                    TabControl1.SelectTab(TabPage1)
                End If
            Else
                clsMensaje.mostrar_mensaje("No agregado ningún ítem", "error")
            End If

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub cbxPlanesFunerarios_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxPlanesFunerarios.SelectedIndexChanged
        Listar()
    End Sub

    Private Sub Listar()
        Try
            PF.CodigoItem = cbxPlanesFunerarios.SelectedValue
            Listar_Detalle_Plan(PF.Listar_Detalle_Plane_Funerario())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub Listar_Detalle_Plan(ByVal dt As DataTable)
        Dim t As New EItem()
        Dim Total As Double = 0
        Item.Clear()
        For i = 0 To dt.Rows.Count - 1
            Item.Add(New EItem With {.CodigoItem = dt.Rows(i)(0), .CodigoDetalle = dt.Rows(i)(1), .Nombre = dt.Rows(i)(3), .Precio = dt.Rows(i)(4)})
        Next

        Me.dtgDetallesPlanes.Rows.Clear()
        For i = 0 To Item.Count - 1
            Me.dtgDetallesPlanes.Rows.Add()
            dtgDetallesPlanes.Rows(i).Cells(0).Value = Item(i).CodigoItem
            dtgDetallesPlanes.Rows(i).Cells(1).Value = Item(i).CodigoDetalle
            dtgDetallesPlanes.Rows(i).Cells(2).Value = Item(i).Nombre
            dtgDetallesPlanes.Rows(i).Cells(3).Value = FormatNumber(Item(i).Precio, 2)
            dtgDetallesPlanes.Rows(i).Cells(4).Value = "Eliminar"
            Total += Item(i).Precio
        Next
        Me.dtgDetallesPlanes.ClearSelection()
        For Each row As DataGridViewRow In dtgDetallesPlanes.Rows
            Dim button1 As DataGridViewButtonCell = CType(row.Cells(4), DataGridViewButtonCell)
            button1.Style.BackColor = Color.FromArgb(217, 83, 79)
            button1.Style.ForeColor = Color.White
            button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
        Next
        lblTotal.Text = FormatNumber(CDbl(Total), 2)

    End Sub

    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        Limpiar_Controles()
        Listar()
        Cargar_Combo_Planes()
    End Sub

    Private Sub Frm004_PlanesFunerarios_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub Frm004_PlanesFunerarios_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub txtPrecio_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtPrecio.KeyPress
        Validar.Numeros_con_Decimales(e)
    End Sub

    Private Sub btnNuevo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevo.Click
        Limpiar_Controles()
    End Sub

    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        If (keyData = Keys.Escape) Then
            Cerrar_Form()
            Return True
        End If
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function

    Private Sub Cerrar_Form()
        If (txtDescripcion.Text.Trim = "") Then
            Close()
        Else
            Dim fr As New Frm011_MensajedeConfirmación2
            fr.ShowDialog()
            If (Validar.Cerrar_form = 1) Then
                Close()
            End If
        End If
    End Sub

End Class