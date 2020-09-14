Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Public Class Frm002_PersonalPrincipal
    Dim P As New clsPersonal 'Instanciamos la clase clsPersonal de la Capa Logica de Negocio para usar sus funciones
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim Tipo_Dato As Integer = 0 'Variable para verificar si el texto Ingresado es Letra o Número (0=Letras | 1=Números)
    Dim CodigoP As Integer = 0 'Variable para almacenar el código del Personal
    Dim Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim ValorUsuario As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información

    Private Sub FrmPersonalPrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Listar_Personal()
        Listar_Usuario()
        cb_personal.SelectedIndex = 0
        cb_productos_servicios.SelectedIndex = 0
        cb_planes.SelectedIndex = 0
        cb_cliente.SelectedIndex = 0
        cb_difunto.SelectedIndex = 0
        cb_provedores.SelectedIndex = 0
        cb_compras.SelectedIndex = 0
        cb_ventas.SelectedIndex = 0
    End Sub

    Private Sub Listar_Personal()
        Dim dt As New DataTable()

        Try 'Manejamos una excepción de errores
            Llenar_Grilla(P.Listar_Personal())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        Dim dt2 As New DataTable
        dgv_personal.Rows.Clear() 'Limpiamos el control DataGridView1

        'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            dgv_personal.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            dgv_personal.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            dgv_personal.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            dgv_personal.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            dgv_personal.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            dgv_personal.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
            dgv_personal.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
            dgv_personal.Rows(i).Cells(6).Value = dt.Rows(i)(6).ToString()
            dgv_personal.Rows(i).Cells(7).Value = dt.Rows(i)(7).ToString()
            dgv_personal.Rows(i).Cells(8).Value = dt.Rows(i)(8).ToString()
            dgv_personal.Rows(i).Cells(9).Value = "Editar"

            'Verificar si este personal ya tiene cuenta de usuario
            U.CodigoPersona = CInt(dt.Rows(i)(0))
            dt2 = U.Verificar_Existe_Usuarios()
            If (Convert.ToInt32(dt2.Rows(0)(0)) = 1) Then
                dgv_personal.Rows(i).Cells(10).Value = "Asignado"
            Else
                dgv_personal.Rows(i).Cells(10).Value = "Asignar Usuario"
            End If
        Next
        dgv_personal.ClearSelection() 'Limpiamos la selección del DataGridView1

        For Each row As DataGridViewRow In dgv_personal.Rows
            Dim button1 As DataGridViewButtonCell = CType(row.Cells(9), DataGridViewButtonCell)
            Dim button2 As DataGridViewButtonCell = CType(row.Cells(10), DataGridViewButtonCell)
            Dim button3 As DataGridViewButtonCell = CType(row.Cells(8), DataGridViewButtonCell)
            button1.Style.BackColor = Color.FromArgb(92, 184, 92)
            button1.Style.ForeColor = Color.White
            button1.Style.Font = New System.Drawing.Font("Arial", 9, FontStyle.Bold)

            If (row.Cells(10).Value = "Asignar Usuario") Then
                button2.Style.BackColor = Color.FromArgb(91, 192, 222)
            Else
                button2.Style.BackColor = Color.FromArgb(0, 122, 204)
            End If
            button2.Style.ForeColor = Color.White
            button2.Style.Font = New System.Drawing.Font("Arial", 9, FontStyle.Bold)

            If (row.Cells(8).Value = "Activo") Then
                button3.Style.BackColor = Color.FromArgb(92, 184, 92)
            Else
                button3.Style.BackColor = Color.FromArgb(217, 83, 79)
            End If
            button3.Style.ForeColor = Color.White
            button3.Style.Font = New System.Drawing.Font("Arial", 9, FontStyle.Bold)
        Next

    End Sub

    Private Sub btnNuevo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevo.Click
        Valor = 0
        TabControl1.SelectTab(TabPage2)
    End Sub

    Private Sub FrmPersonalPrincipal_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub txtDatos_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Try
                P.Datos = CStr(txtDatos.Text)
                Llenar_Grilla(P.Filtrar_Personal())
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else
            Listar_Personal()
        End If
    End Sub

    Private Sub rbnNDoc_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNDoc.CheckedChanged
        'Listar_Personal()
        txtDatos.MaxLength = 8
        txtDatos.Clear()
        Tipo_Dato = 0
        txtDatos.Focus()
    End Sub

    Private Sub rbnNombre_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNombre.CheckedChanged
        Listar_Personal()
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

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        My.Forms.Frm00_Login.frm_inicio.pn_principal.Controls.Clear()
        My.Forms.Frm00_Login.frm_inicio.pn_principal.Hide()

    End Sub


    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        'Evento para guardar cambios, para registrar y/o actualizar información
        ErrorProvider1.Clear()
        If (txtDNI.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDNI, "Ingrese DNI")
        ElseIf (txtNombres.Text.Trim = "") Then
            ErrorProvider1.SetError(txtNombres, "Ingrese Nombres")
        ElseIf (txtApellidos.Text.Trim = "") Then
            ErrorProvider1.SetError(txtApellidos, "Ingrese Apellidos")
        ElseIf (txtCargo.Text.Trim = "") Then
            ErrorProvider1.SetError(txtCargo, "Ingrese Cargo")
        ElseIf (txtDireccion.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDireccion, "Ingrese Direccion")
        ElseIf (txtTelefono.Text.Trim = "") Then
            ErrorProvider1.SetError(txtTelefono, "Ingrese Teléfono")
        Else
            Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

            Try 'Manejamos una excepción de errores

                If (Valor = 0) Then 'Si es valor cero, registramos
                    P.DNI = txtDNI.Text
                    P.Nombres = txtNombres.Text
                    P.Apellidos = txtApellidos.Text
                    P.Cargo = txtCargo.Text
                    P.Direccion = txtDireccion.Text
                    P.Telefono = txtTelefono.Text
                    P.Email = txtEmail.Text
                    Mensaje = P.Registrar_Personal() 'Ejecutamos la función Registrar Personal
                    If (Mensaje = "Registrado Correctamente") Then 'Varificamos si se registró correctamentE
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Valor = 0
                        TabControl1.SelectTab(0)
                    Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If

                Else 'Si es valor 1 actualizamos la información
                    P.Codigo_Personal = CodigoP
                    P.DNI = txtDNI.Text
                    P.Nombres = txtNombres.Text
                    P.Apellidos = txtApellidos.Text
                    P.Cargo = txtCargo.Text
                    P.Direccion = txtDireccion.Text
                    P.Telefono = txtTelefono.Text
                    P.Email = txtEmail.Text
                    Mensaje = P.Actualizar_Personal() 'Ejecutamos la función Actualizar Personal
                    If (Mensaje = "Actualizado Correctamente") Then 'Varificamos si se registró correctamentE
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Valor = 0
                        TabControl1.SelectTab(0)
                        Listar_Personal()
                    Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD            
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                End If
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        End If
    End Sub

    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        Listar_Personal()
        If Valor = 0 Then
            Call Limpiar_Controles()
        End If
        If (ValorUsuario = 0) Then
            Call Limpiar_Controles_Usuario()
        End If
    End Sub

    Private Sub Limpiar_Controles()
        txtDatos.Clear()
        txtDNI.Clear()
        txtNombres.Clear()
        txtApellidos.Clear()
        txtCargo.Clear()
        txtDireccion.Clear()
        txtTelefono.Clear()
        txtEmail.Clear()
        rbnNDoc.Checked = True
        ErrorProvider1.Clear()
    End Sub

    Private Sub Frm002_PersonalPrincipal_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        'Frm001_MenuPrincipal.FormActive = 0
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub btnGuardarUsuario_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardarUsuario.Click
        ErrorProvider1.Clear()
        If (txtUsuario.Text.Trim = "") Then
            ErrorProvider1.SetError(txtUsuario, "Ingrese Usuario")
        ElseIf (txtClave.Text.Trim = "") Then
            ErrorProvider1.SetError(txtClave, "Ingrese Clave")
        ElseIf (cb_personal.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_personal, "Escoja una opcion de permisos del modulo personal")
        ElseIf (cb_productos_servicios.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_productos_servicios, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_planes.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_planes, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_cliente.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_cliente, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_difunto.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_difunto, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_provedores.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_provedores, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_compras.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_compras, "Escoja una opcion de permisos del modulo")
        ElseIf (cb_ventas.SelectedIndex < 0) Then
            ErrorProvider1.SetError(cb_ventas, "Escoja una opcion de permisos del modulo")



        Else
            Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

            Try
                If (ValorUsuario = 1) Then
                    U.CodigoPersona = CInt(txtCodigo.Text)
                    U.Usuario = CStr(txtUsuario.Text)
                    U.Clave = CStr(txtClave.Text)
                    U.personal = CStr(cb_personal.SelectedItem)
                    U.productos = CStr(cb_productos_servicios.SelectedItem)
                    U.planes = CStr(cb_planes.SelectedItem)
                    U.cliente = CStr(cb_cliente.SelectedItem)
                    U.difunto = CStr(cb_difunto.SelectedItem)
                    U.provedores = CStr(cb_provedores.SelectedItem)
                    U.compras = CStr(cb_compras.SelectedItem)
                    U.ventas = CStr(cb_ventas.SelectedItem)


                    Mensaje = U.Registrar_Usuarios()
                    If (Mensaje = "Registrado correctamente") Then
                        Listar_Usuario()
                        ValorUsuario = 0
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        TabControl1.SelectTab(TabPage1)
                    Else
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If

                ElseIf (ValorUsuario = 2) Then 'Si es valor 1 actualizamos la información

                    U.CodigoPersona = CInt(txtCodigo.Text)
                    U.Usuario = CStr(txtUsuario.Text)
                    U.Clave = CStr(txtClave.Text)
                    U.personal = CStr(cb_personal.SelectedItem)
                    U.productos = CStr(cb_productos_servicios.SelectedItem)
                    U.planes = CStr(cb_planes.SelectedItem)
                    U.cliente = CStr(cb_cliente.SelectedItem)
                    U.difunto = CStr(cb_difunto.SelectedItem)
                    U.provedores = CStr(cb_provedores.SelectedItem)
                    U.compras = CStr(cb_compras.SelectedItem)
                    U.ventas = CStr(cb_ventas.SelectedItem)
                    Mensaje = U.Actualizar_Usuarios()
                    If (Mensaje = "Actualizado correctamente") Then
                        Listar_Usuario()
                        ValorUsuario = 0
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        TabControl1.SelectTab(TabPage1)
                    Else
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                End If
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        End If
    End Sub

    Private Sub Listar_Usuario()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla_Usuario(U.Listar_Usuarios())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub Llenar_Grilla_Usuario(ByVal dt As DataTable)
        dtgvUsuario.Rows.Clear() 'Limpiamos el control DataGridView1

        'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            dtgvUsuario.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            dtgvUsuario.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            dtgvUsuario.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            dtgvUsuario.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            dtgvUsuario.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()

        Next
        dtgvUsuario.ClearSelection() 'Limpiamos la selección del dtgvUsuario
    End Sub



    Private Sub dtgvUsuario_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvUsuario.CellDoubleClick
        If (Me.dtgvUsuario.Rows.Count > 0) Then
            txtCodigo.Text = dtgvUsuario.CurrentRow.Cells(0).Value.ToString()
            txtDatosPersonal.Text = dtgvUsuario.CurrentRow.Cells(1).Value.ToString()
            txtUsuario.Text = dtgvUsuario.CurrentRow.Cells(2).Value.ToString()
            txtClave.Text = dtgvUsuario.CurrentRow.Cells(3).Value.ToString()



            ValorUsuario = 2
        End If
    End Sub

    Private Sub Limpiar_Controles_Usuario()
        'Limpiamos los controles del usuario
        txtCodigo.Clear()
        txtDatosPersonal.Clear()
        txtUsuario.Clear()
        txtClave.Clear()
        ValorUsuario = 0

        ErrorProvider1.Clear()
    End Sub

    Private Sub dtgvUsuario_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvUsuario.CellClick
        If (Me.dtgvUsuario.Rows.Count > 0) Then
            Me.dtgvUsuario.Rows(Me.dtgvUsuario.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgv_personal.CellContentClick
        If (Me.dgv_personal.Columns(e.ColumnIndex).Name.Equals("Button")) Then
            Me.dgv_personal.ClearSelection()
            CodigoP = Me.dgv_personal.CurrentRow.Cells(0).Value.ToString()
            txtDNI.Text = Me.dgv_personal.CurrentRow.Cells(1).Value.ToString()
            txtNombres.Text = Me.dgv_personal.CurrentRow.Cells(2).Value.ToString()
            txtApellidos.Text = Me.dgv_personal.CurrentRow.Cells(3).Value.ToString()
            txtCargo.Text = Me.dgv_personal.CurrentRow.Cells(4).Value.ToString()
            txtDireccion.Text = Me.dgv_personal.CurrentRow.Cells(5).Value.ToString()
            txtTelefono.Text = Me.dgv_personal.CurrentRow.Cells(6).Value.ToString()
            txtEmail.Text = Me.dgv_personal.CurrentRow.Cells(7).Value.ToString()
            Valor = 1
            TabControl1.SelectTab(TabPage2)

        ElseIf (Me.dgv_personal.Columns(e.ColumnIndex).Name.Equals("Usuario")) Then
            If (dgv_personal.CurrentRow.Cells(10).Value <> "Asignado") Then
                txtCodigo.Text = Me.dgv_personal.CurrentRow.Cells(0).Value.ToString()
                txtDatosPersonal.Text = Me.dgv_personal.CurrentRow.Cells(2).Value.ToString() & " " & Me.dgv_personal.CurrentRow.Cells(3).Value.ToString()
                ValorUsuario = 1
                TabControl1.SelectTab(TabPage3)
            End If

        ElseIf (Me.dgv_personal.Columns(e.ColumnIndex).Name.Equals("Estado")) Then
            P.Codigo_Personal = Me.dgv_personal.CurrentRow.Cells(0).Value.ToString()
            P.Estado = Me.dgv_personal.CurrentRow.Cells(8).Value.ToString()
            P.Actualizar_Estado_Personal() 'Llamamos a la función actualizar estado del Personal
            Listar_Personal() 'Llamamos al método Listar Personal
        End If
    End Sub

    Private Sub txtDNI_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDNI.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txtNombres_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNombres.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtApellidos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtApellidos.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtCargo_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtCargo.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtTelefono_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtTelefono.KeyPress
        Validar.Numeros_con_Numeral(e)
    End Sub

    Private Sub txtEmail_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtEmail.KeyPress
        Validar.Espacio(e)
    End Sub

    Private Sub btnLimpiarPersonal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLimpiarPersonal.Click
        Valor = 0
        Limpiar_Controles()
        txtDNI.Focus()
    End Sub

    Private Sub txtUsuario_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtUsuario.KeyPress
        Validar.Espacio(e)
    End Sub

    Private Sub txtClave_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtClave.KeyPress
        Validar.Espacio(e)
    End Sub

    Private Sub btnExportar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportar.Click
        If (dgv_personal.Rows.Count <= 0) Then
            MsgBox("No hay datos para Exportar a PDF", MsgBoxStyle.Exclamation, "Sistema para Funeraria S.A.C")
        Else
            Dim rpt = MsgBox("Esta Seguro que desea Exportarlo a PDF", vbYesNo + vbExclamation, "Representaciones San Fernando S.A.C")
            If rpt = vbYes Then
                Try
                    Dim doc As New Document(PageSize.A4.Rotate(), 10, 10, 20, 20)
                    Dim filename As String = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + "\Reporte" + Module1.Generar_Nombre
                    Dim file As New FileStream(filename, FileMode.Create, FileAccess.Write, FileShare.ReadWrite)
                    PdfWriter.GetInstance(doc, file)
                    doc.Open()
                    ExportarDatosPDF(doc)
                    doc.Close()
                    Process.Start(filename)
                Catch ex As Exception
                    MessageBox.Show("No se puede generar el documento PDF.", "Sistema para Funeraria S.A.C", MessageBoxButtons.OK, MessageBoxIcon.Error)
                End Try
            Else
                rpt = vbOKCancel
            End If
        End If
    End Sub

    Public Sub ExportarDatosPDF(ByVal document As Document)
        Dim datatable As New PdfPTable(dgv_personal.ColumnCount)
        datatable.DefaultCell.Padding = 3
        Dim headerwidths As Single() = GetColumnasSize()
        datatable.SetWidths(headerwidths)
        datatable.WidthPercentage = 100
        datatable.DefaultCell.BorderWidth = 0
        datatable.DefaultCell.BackgroundColor = iTextSharp.text.BaseColor.GRAY

        datatable.DefaultCell.HorizontalAlignment = Element.ALIGN_JUSTIFIED
        Dim encabezado As New Paragraph("Sistema para Funeraria S.A.C", FontFactory.GetFont("Tahoma", 20, iTextSharp.text.Font.BOLD))
        encabezado.Alignment = Element.ALIGN_CENTER

        Dim texto As New Phrase("Reporte de Personal: " + Now.Date(), FontFactory.GetFont("Tahoma", 14, iTextSharp.text.Font.BOLD))
        For i As Integer = 0 To dgv_personal.ColumnCount - 1
            datatable.AddCell(New Phrase(dgv_personal.Columns(i).HeaderText, FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.BOLD, BaseColor.WHITE)))
        Next

        datatable.HeaderRows = 1
        datatable.DefaultCell.BorderWidth = 0
        datatable.DefaultCell.BackgroundColor = iTextSharp.text.BaseColor.WHITE
        For i As Integer = 0 To dgv_personal.Rows.Count - 1
            For j As Integer = 0 To dgv_personal.Columns.Count - 1
                datatable.AddCell(New Phrase((dgv_personal(j, i).Value).ToString, FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)))
            Next
            datatable.CompleteRow()
        Next

        datatable.CompleteRow()
        document.Add(encabezado)
        document.Add(texto)
        document.Add(datatable)
    End Sub

    Public Function GetColumnasSize() As Single()
        Dim values As Single() = New Single(dgv_personal.ColumnCount - 1) {}
        For i As Integer = 1 To dgv_personal.ColumnCount - 4
            values(i) = CSng(dgv_personal.Columns(i).Width)
        Next
        Return values
    End Function

    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        If (keyData = Keys.Escape) Then
            Cerrar_Form()
            Return True
        End If
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function

    Private Sub Cerrar_Form()
        If (txtDNI.Text.Trim = "" And txtNombres.Text.Trim = "" And txtApellidos.Text.Trim = "" And txtCargo.Text.Trim = "" And txtDireccion.Text.Trim = "" And txtEmail.Text.Trim = "" And txtDatos.Text.Trim = "") Then
            Close()
        Else
            Dim fr As New Frm011_MensajedeConfirmación2
            fr.ShowDialog()
            If (Validar.Cerrar_form = 1) Then
                Close()
            End If
        End If
    End Sub

    Private Sub Panel_cabecera_Paint(sender As Object, e As PaintEventArgs) Handles Panel_cabecera.Paint

    End Sub

    Private Sub TabPage2_Click(sender As Object, e As EventArgs) Handles TabPage2.Click

    End Sub

End Class