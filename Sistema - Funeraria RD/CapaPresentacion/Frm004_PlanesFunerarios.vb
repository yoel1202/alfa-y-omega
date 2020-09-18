Imports System.IO
Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio
Imports Syncfusion.Pdf
Imports Syncfusion.Pdf.Parsing
Imports Syncfusion.Pdf.Graphics
Imports Syncfusion.Pdf.Grid

Public Class Frm004_PlanesFunerarios
    Implements IItem
    Private Shared ReadOnly Item As New List(Of EItem)()
    Dim PF As New clsPlanFunerario 'Instanciamos la clase clsPlanFunerario de la Capa Logica de Negocio para usar sus funciones
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
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
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then

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
        Else
            clsMensaje.mostrar_mensaje("no  tiene permisos para esta Opción", "error")
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

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'If dtgDetallesPlanes.Rows.Count > 0 Then
        '    Dim sfd As SaveFileDialog = New SaveFileDialog()
        '    sfd.Filter = "PDF (*.pdf)|*.pdf"
        '    sfd.FileName = "Output.pdf"
        '    Dim fileError As Boolean = False

        '    If Not fileError Then

        '        Try
        '            Dim pdfTable As PdfPTable = New PdfPTable(dtgDetallesPlanes.Columns.Count)
        '            pdfTable.DefaultCell.Padding = 3
        '            pdfTable.WidthPercentage = 100
        '            pdfTable.HorizontalAlignment = iTextSharp.text.Element.ALIGN_LEFT

        '            For Each column As DataGridViewColumn In dtgDetallesPlanes.Columns
        '                Dim cell As PdfPCell = New PdfPCell(New iTextSharp.text.Phrase(column.HeaderText))
        '                pdfTable.AddCell(cell)
        '            Next

        '            For Each row As DataGridViewRow In dtgDetallesPlanes.Rows

        '                For Each cell As DataGridViewCell In row.Cells
        '                    pdfTable.AddCell(cell.Value.ToString())
        '                Next
        '            Next

        '            Using stream As FileStream = New FileStream(sfd.FileName, FileMode.Create)
        '                Dim pdfDoc As iTextSharp.text.Document = New iTextSharp.text.Document(iTextSharp.text.PageSize.A4.Rotate(), 10.0F, 20.0F, 20.0F, 10.0F)
        '                PdfWriter.GetInstance(pdfDoc, stream)
        '                pdfDoc.Open()
        '                Dim image1 As iTextSharp.text.Image = iTextSharp.text.Image.GetInstance("rh.png")
        '                image1.ScaleAbsoluteWidth(150)
        '                image1.ScaleAbsoluteHeight(45)
        '                pdfDoc.Add(image1)
        '                Dim title As iTextSharp.text.Paragraph = New iTextSharp.text.Paragraph()
        '                title.Alignment = iTextSharp.text.Element.ALIGN_CENTER
        '                title.Font = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.TIMES, 20.0F, iTextSharp.text.BaseColor.BLACK)
        '                title.Add("Ploforma")
        '                title.SpacingAfter = 20
        '                pdfDoc.Add(title)
        '                pdfDoc.Add(pdfTable)
        '                pdfDoc.Close()
        '                stream.Close()
        '            End Using

        '            System.Diagnostics.Process.Start(sfd.FileName)
        '            MessageBox.Show("Informacion se exporto correctamente !!!", "Info")
        '        Catch ex As Exception
        '            MessageBox.Show("Error :" & ex.Message)
        '        End Try
        '    End If
        'End If



        'Creates a new PDF document
        Dim document As New PdfDocument()
        'Adds page settings
        document.PageSettings.Orientation = PdfPageOrientation.Landscape
        document.PageSettings.Margins.All = 50
        'Adds a page to the document
        Dim page As PdfPage = document.Pages.Add()
        'Loads the image from disk 
        Dim image As PdfImage = PdfImage.FromFile("C:\Funeraria\alfa-y-omega-logo.png")
        'Draws the image to the PDF page
        Dim g As PdfGraphics = page.Graphics
        page.Graphics.DrawImage(image, New RectangleF(176, 0, 390, 130))
        Dim result As PdfLayoutResult = New PdfLayoutResult(page, New RectangleF(0, 0, page.Graphics.ClientSize.Width / 2, 95))
        Dim subHeadingFont As PdfFont = New PdfStandardFont(PdfFontFamily.TimesRoman, 14)
        'Draw Rectangle place on location
        g.DrawRectangle(New PdfSolidBrush(New PdfColor(126, 151, 173)), New RectangleF(0, (result.Bounds.Bottom + 40), g.ClientSize.Width, 30))
        Dim dayNumber As Integer = Date.Today.Day
        Dim mesNumber As Integer = Date.Today.Month
        Dim anoNumber As Integer = Date.Today.Year
        Dim element As PdfTextElement = New PdfTextElement(("Factura " + dayNumber.ToString() + mesNumber.ToString() + anoNumber.ToString()), subHeadingFont)
        element.Brush = PdfBrushes.White
        result = element.Draw(page, New PointF(10, (result.Bounds.Bottom + 48)))
        Dim currentDate As String = ("Fecha " + DateTime.Now.ToString("MM/dd/yyyy"))
        Dim textSize As SizeF = subHeadingFont.MeasureString(currentDate)
        g.DrawString(currentDate, subHeadingFont, element.Brush, New PointF((g.ClientSize.Width - (textSize.Width - 10)), result.Bounds.Y))
        'Draw Bill header
        element = New PdfTextElement("FUNERALES ALFA Y OMEGA", New PdfStandardFont(PdfFontFamily.TimesRoman, 10))
        element.Brush = New PdfSolidBrush(New PdfColor(126, 155, 203))
        result = element.Draw(page, New PointF(10, (result.Bounds.Bottom + 25)))
        'Draw Bill address
        element = New PdfTextElement(String.Format("{0}, {1}, {2}", "Tel: 2783 3753", " Ciudad Neily ", " "), New PdfStandardFont(PdfFontFamily.TimesRoman, 10))
        element.Brush = New PdfSolidBrush(New PdfColor(89, 89, 93))
        result = element.Draw(page, New RectangleF(10, (result.Bounds.Bottom + 3), (g.ClientSize.Width / 2), 100))
        'Draw Bill line
        g.DrawLine(New PdfPen(New PdfColor(126, 151, 173), 0.7!), New PointF(0, (result.Bounds.Bottom + 3)), New PointF(g.ClientSize.Width, (result.Bounds.Bottom + 3)))
        'Creates the datasource for the table


        Dim Font As PdfStandardFont = New PdfStandardFont(PdfFontFamily.TimesRoman, 14)




        'Create a PDF grid
        Dim grid As New PdfGrid()
        'Dim column1 As New PdfGridColumn(grid)
        'column1.Width = 100
        'Dim column2 As New PdfGridColumn(grid)
        'column2.Width = 200
        'Dim column3 As New PdfGridColumn(grid)
        'column3.Width = 100
        'Dim column4 As New PdfGridColumn(grid)
        'column4.Width = 100
        'Dim column5 As New PdfGridColumn(grid)
        'column5.Width = 100
        ''Add three columns.
        'grid.Columns.Add(column1)
        'grid.Columns.Add(column2)
        'grid.Columns.Add(column3)
        'grid.Columns.Add(column4)
        'grid.Columns.Add(column5)
        'Add header.


        'grid.Headers.Add(1)

        'Dim pdfGridHeader As PdfGridRow = grid.Headers(0)


        grid.Columns.Add(dtgDetallesPlanes.Columns.Count - 1)
        grid.Headers.Add(1)
        Dim pdfGridHeader As PdfGridRow = grid.Headers(0)
        For Each column As DataGridViewColumn In dtgDetallesPlanes.Columns
            If (column.HeaderText = "Eliminar") Then

            Else
                pdfGridHeader.Cells(column.Index).Value = column.HeaderText
            End If
        Next

        'Dim pdfGridRow As PdfGridRow = grid.Rows.Add()
        For Each row As DataGridViewRow In dtgDetallesPlanes.Rows
            grid.Rows.Add()
            For Each cell As DataGridViewCell In row.Cells
                If (cell.Value.ToString() = "Eliminar") Then

                Else
                    grid.Rows(row.Index).Cells(cell.ColumnIndex).Value = cell.Value.ToString()
                End If
            Next
        Next
        'Adds the data source
        grid.DataSource = dtgDetallesPlanes.DataSource
        'creates the grid cell styles
        Dim cellStyle As New PdfGridCellStyle()
        cellStyle.Borders.All = PdfPens.White
        Dim header As PdfGridRow = grid.Headers(0)
        'Creates the header style
        Dim headerStyle As New PdfGridCellStyle()
        headerStyle.Borders.All = New PdfPen(New PdfColor(126, 151, 173))
        headerStyle.BackgroundBrush = New PdfSolidBrush(New PdfColor(126, 151, 173))
        headerStyle.TextBrush = PdfBrushes.White
        headerStyle.Font = New PdfStandardFont(PdfFontFamily.TimesRoman, 14.0F, PdfFontStyle.Regular)
        'Adds cell customizations
        For i As Integer = 0 To header.Cells.Count - 1
            If i = 0 OrElse i = 1 Then
                header.Cells(i).StringFormat = New PdfStringFormat(PdfTextAlignment.Left, PdfVerticalAlignment.Middle)
            Else
                header.Cells(i).StringFormat = New PdfStringFormat(PdfTextAlignment.Right, PdfVerticalAlignment.Middle)
            End If
        Next
        'Applies the header style
        header.ApplyStyle(headerStyle)
        cellStyle.Borders.Bottom = New PdfPen(New PdfColor(217, 217, 217), 0.7F)
        cellStyle.Font = New PdfStandardFont(PdfFontFamily.TimesRoman, 12.0F)
        cellStyle.TextBrush = New PdfSolidBrush(New PdfColor(131, 130, 136))
        'Creates the layout format for grid
        Dim layoutFormat As New PdfGridLayoutFormat()
        'Layout format settings to allow the table pagination
        layoutFormat.Layout = PdfLayoutType.Paginate
        'Draws the grid to the PDF page.
        Dim gridResult As PdfGridLayoutResult = grid.Draw(page, New RectangleF(New PointF(0, result.Bounds.Bottom + 40), New SizeF(g.ClientSize.Width, g.ClientSize.Height - 100)), layoutFormat)
        g.DrawString("Total: " + lblTotal.Text, Font, PdfBrushes.Black, New PointF(result.Bounds.Right + 250, result.Bounds.Bottom + 100))
        document.Save("Sample.pdf")
        document.Close(True)
        System.Diagnostics.Process.Start("Sample.pdf")
        MessageBox.Show("Informacion se exporto correctamente !!!", "Info")
    End Sub
End Class