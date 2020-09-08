Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm006_Difunto

    Implements IParentesco

    Dim D As New clsDifunto 'Instanciamos la clase clsDifunto de la Capa Logica de Negocio para usar sus funciones
    Dim P As New clsParentescoDifundo
    Dim Imagen As New CopiarImagen
    Dim valida As Integer = 0
    Dim CodigoD As Integer = 0 'Variable para almacenar el código del Difunto
    Public CodigoC As Integer = 0 'Variable para almacenar el código del Difunto
    Dim CodigoP As Integer = 0 'Variable para almacenar el código del Parentesco
    Public Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim ValorParent As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información del parentesco
    Dim rutaAntigua As String = ""

    Private Shared ReadOnly Cliente As New List(Of ECliente)()

    Public Property Caller() As IParentesco

    Private Sub btnNuevo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevo.Click
        Valor = 0
        TabControl1.SelectTab(TabPage2)
        txtDni.Focus()
    End Sub

    Private Sub FrmDifuntoPrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Listar_Difuntos()
        DataGridView1.RowHeadersVisible = False
        cbxParentesco.SelectedIndex = 0
        Listar_Parentesco()
        ptbActa.ImageLocation = Imagen.loadImagen()
        dtpHora.Format = DateTimePickerFormat.Custom
        dtpHora.CustomFormat = "hh:mm tt"
    End Sub

    Private Sub Listar_Difuntos()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla(D.Listar_Difuntos())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btnBuscar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub rbnNombre_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNombre.CheckedChanged
        Listar_Difuntos()
        txtDatos.MaxLength = 256
        txtDatos.Clear()
        valida = 1
        txtDatos.Focus()
    End Sub

    Private Sub rbnNDoc_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNDoc.CheckedChanged
        txtDatos.MaxLength = 8
        txtDatos.Clear()
        valida = 0
        txtDatos.Focus()
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        Dim dt2 As New DataTable
        DataGridView1.Rows.Clear() 'Limpiamos el control DataGridView1
        Dim Hora As String = ""

        'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            DataGridView1.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            DataGridView1.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            DataGridView1.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            DataGridView1.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            DataGridView1.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            DataGridView1.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
            DataGridView1.Rows(i).Cells(5).Value = Format(dt.Rows(i)(5), "dd/MM/yyyy")
            DataGridView1.Rows(i).Cells(6).Value = Format(dt.Rows(i)(6), "dd/MM/yyyy")
            DataGridView1.Rows(i).Cells(7).Value = Format(dt.Rows(i)(7).ToString().Substring(0, 7), "Medium Time")
            DataGridView1.Rows(i).Cells(8).Value = dt.Rows(i)(8).ToString()
            DataGridView1.Rows(i).Cells(9).Value = dt.Rows(i)(9).ToString()
            DataGridView1.Rows(i).Cells(10).Value = dt.Rows(i)(10).ToString()
            DataGridView1.Rows(i).Cells(11).Value = dt.Rows(i)(11).ToString()
            DataGridView1.Rows(i).Cells(12).Value = "Editar"

            P.CodigoDifunto = CInt(dt.Rows(i)(0))
            dt2 = P.Verificar_Existe_Parentesco()
            If (Convert.ToInt32(dt2.Rows(0)(0)) = 1) Then
                DataGridView1.Rows(i).Cells(13).Value = "Asignado"
            Else
                DataGridView1.Rows(i).Cells(13).Value = "Asignar"
            End If
        Next
        DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1
        For Each row As DataGridViewRow In DataGridView1.Rows
            Dim button1 As DataGridViewButtonCell = CType(row.Cells(12), DataGridViewButtonCell)
            Dim button2 As DataGridViewButtonCell = CType(row.Cells(13), DataGridViewButtonCell)
            button1.Style.BackColor = Color.FromArgb(92, 184, 92)
            button1.Style.ForeColor = Color.White
            button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)

            If (row.Cells(13).Value = "Asignar") Then
                button2.Style.BackColor = Color.FromArgb(91, 192, 222)
            Else
                button2.Style.BackColor = Color.FromArgb(0, 122, 204)
            End If
            button2.Style.ForeColor = Color.White
            button2.Style.Font = New Font("Arial", 9, FontStyle.Bold)
        Next
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Button")) Then
            Me.DataGridView1.ClearSelection()
            CodigoD = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString()
            txtDni.Text = Me.DataGridView1.CurrentRow.Cells(1).Value.ToString()
            txtNombres.Text = Me.DataGridView1.CurrentRow.Cells(2).Value.ToString()
            txtApellidos.Text = Me.DataGridView1.CurrentRow.Cells(3).Value.ToString()
            If (Me.DataGridView1.CurrentRow.Cells(4).Value.ToString() = "M") Then
                rbnMasculino.Checked = True
            Else
                rbnFemenino.Checked = True
            End If
            dtpFechaNac.Text = Me.DataGridView1.CurrentRow.Cells(5).Value.ToString()
            dtpFechaFallec.Text = Me.DataGridView1.CurrentRow.Cells(6).Value.ToString()
            dtpHora.Text = Me.DataGridView1.CurrentRow.Cells(7).Value.ToString()
            txtCausaMuerte.Text = Me.DataGridView1.CurrentRow.Cells(8).Value.ToString()
            txtLugarFallec.Text = Me.DataGridView1.CurrentRow.Cells(9).Value.ToString()
            cbxEstadoCivil.Text = Me.DataGridView1.CurrentRow.Cells(10).Value.ToString()
            ptbActa.ImageLocation = Me.DataGridView1.CurrentRow.Cells(11).Value.ToString()
            rutaAntigua = Me.DataGridView1.CurrentRow.Cells(11).Value.ToString()
            Valor = 1
            TabControl1.SelectTab(TabPage2)

        ElseIf (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Parentesco")) Then
            If (DataGridView1.CurrentRow.Cells(13).Value = "Asignar") Then
                CodigoD = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString()
                txtDatosFallecido.Text = Me.DataGridView1.CurrentRow.Cells(2).Value.ToString() & " " & Me.DataGridView1.CurrentRow.Cells(3).Value.ToString()
                ValorParent = 0
                TabControl1.SelectTab(TabPage3)
            End If
        End If
    End Sub

    Private Sub txtDatos_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Try
                D.Datos = CStr(txtDatos.Text)
                Llenar_Grilla(D.Buscar_Difuntos())
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else
            Listar_Difuntos()
        End If
    End Sub

    Private Sub txtDatos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDatos.KeyPress
        If (valida = 0) Then
            Validar.Numeros(e)
        Else
            Validar.Letras(e)
        End If
    End Sub

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        Close()
    End Sub

    Private Sub Frm007_Difunto_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub Frm007_Difunto_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub



    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        'Evento para guardar cambios, para registrar y/o actualizar información
        Dim RutaImgen = ""
        Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD
        Dim NombreFoto As String = "Acta-" & txtDni.Text

        ErrorProvider1.Clear()
        If (txtDni.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDni, "Ingrese Número de DNI")
        ElseIf (txtNombres.Text.Trim = "") Then
            ErrorProvider1.SetError(txtNombres, "Ingrese Nombres del Difunto")
        ElseIf (txtNombres.Text.Trim = "") Then
            ErrorProvider1.SetError(txtNombres, "Ingrese Nombres del Difunto")
        ElseIf (txtApellidos.Text.Trim = "") Then
            ErrorProvider1.SetError(txtApellidos, "Ingrese Apellidos del Difunto")
        ElseIf (txtLugarFallec.Text.Trim = "") Then
            ErrorProvider1.SetError(txtLugarFallec, "Ingrese Lugar de Fallecimiento del Difunto")
        ElseIf (txtCausaMuerte.Text.Trim = "") Then
            ErrorProvider1.SetError(txtCausaMuerte, "Ingrese Causa de Muerte del Difunto")
        ElseIf (cbxEstadoCivil.SelectedIndex = 0) Then
            ErrorProvider1.SetError(cbxEstadoCivil, "Seleccione Estado Civil")
        Else
            Try 'Manejamos una excepción de errores
                If (Valor = 0) Then 'Si es valor cero, registramos
                    RutaImgen = Imagen.copiarImagen(ptbActa.ImageLocation, NombreFoto, "", 3)
                    D.Dni = txtDni.Text
                    D.Nombres = txtNombres.Text
                    D.Apellidos = txtApellidos.Text
                    D.Sexo = If(rbnMasculino.Checked = True, "M", "F")
                    D.FechaNacimiento = dtpFechaNac.Value
                    D.FechaFallecimiento = dtpFechaFallec.Value
                    D.Hora = dtpHora.Value
                    D.CaudaMuerte = txtCausaMuerte.Text
                    D.LugarFallecimiento = txtLugarFallec.Text
                    D.EstadoCivil = cbxEstadoCivil.Text
                    D.RutaActa = RutaImgen
                    Mensaje = D.Registrar_Difunto() 'Ejecutamos la función Registrar Difunto
                    If (Mensaje = "Registrado correctamente") Then 'Varificamos si se registró correctamente
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Valor = 0
                        TabControl1.SelectTab(TabPage1)
                    Else
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                Else 'Si es valor 1 actualizamos la información
                    RutaImgen = Imagen.copiarImagen(ptbActa.ImageLocation, NombreFoto, rutaAntigua, 3)
                    D.CodigoDifunto = CodigoD
                    D.Dni = txtDni.Text
                    D.Nombres = txtNombres.Text
                    D.Apellidos = txtApellidos.Text
                    D.Sexo = If(rbnMasculino.Checked = True, "M", "F")
                    D.FechaNacimiento = dtpFechaNac.Value
                    D.FechaFallecimiento = dtpFechaFallec.Value
                    D.Hora = dtpHora.Value
                    D.CaudaMuerte = txtCausaMuerte.Text
                    D.LugarFallecimiento = txtLugarFallec.Text
                    D.EstadoCivil = cbxEstadoCivil.Text
                    D.RutaActa = RutaImgen
                    Mensaje = D.Actualizar_Difunto() 'Ejecutamos la función Registrar Difunto
                    If (Mensaje = "Actualizado correctamente") Then 'Varificamos si se registró correctamente
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Valor = 0
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

    Private Sub Limpiar_Controles()
        txtDni.Clear()
        txtNombres.Clear()
        txtApellidos.Clear()
        rbnMasculino.Checked = True
        rbnNDoc.Checked = True
        txtDatos.Clear()
        dtpFechaNac.Value = Now
        dtpFechaFallec.Value = Now
        dtpHora.Value = Now
        txtCausaMuerte.Clear()
        txtLugarFallec.Clear()
        cbxEstadoCivil.SelectedIndex = 0
        txtDni.Focus()
        ptbActa.ImageLocation = Imagen.loadImagen()
        Valor = 0
    End Sub

    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        Listar_Difuntos()
        If (Valor = 0) Then
            Limpiar_Controles()
            If (ValorParent > 1) Then
                Limpiar_Controles_Parentesco()
            End If
        End If
    End Sub

    Private Sub lkbBuscar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbBuscar.LinkClicked
        'Instanciamos el FrmPersonalPrincipal
        Dim frm As New Frm005_Cliente()
        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller = Me
        'Mostramos el FrmPersonalPrincipal
        Frm00_Login.FormActive = 2
        frm.ShowDialog()
    End Sub

    Public Function LoadDataRow1(ByVal client As ECliente) As Boolean Implements IParentesco.LoadDataRow1
        'Busca si el Cliente ya se encuentra en la lista
        Dim exists As Boolean = Cliente.Any(Function(x) x.CodigoCliente.Equals(client.CodigoCliente))
        'Preguntamos por el resultado de la busqueda del Cliente dentro de la lista
        If Not exists Then
            CodigoC = client.CodigoCliente
            txtDatosClientes.Text = client.Datos
            'Retornamos True
            Return True
        End If
        'Si la condicion exists es igual a False, es decir, que el Cliente SI existe en la lista
        'retornamos FALSE para mostrar un mensajde informacion
        Return False
    End Function

    Private Sub Listar_Parentesco()
        Llenar_grilla_Parentesco(P.Listar_Parentesco())
    End Sub

    Private Sub Llenar_grilla_Parentesco(ByVal dt As DataTable)
        dtgvParentesco.Rows.Clear() 'Limpiamos el control DataGridView1

        'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
        For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
            dtgvParentesco.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
            dtgvParentesco.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
            dtgvParentesco.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
            dtgvParentesco.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
            dtgvParentesco.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
            dtgvParentesco.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
            dtgvParentesco.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
        Next
        dtgvParentesco.ClearSelection() 'Limpiamos la selección del DataGridView1
    End Sub

    Private Sub btnGuardarParentesco_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardarParentesco.Click

        'Evento para guardar cambios, para registrar y/o actualizar información

        ErrorProvider1.Clear()
        If (txtDatosFallecido.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDatosFallecido, "Debe pasar este dato desde la Pestaña ''Listado Difuntos''")
        ElseIf (txtDatosClientes.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDatosClientes, "Ingrese Datos de Cliente")
        ElseIf (cbxParentesco.SelectedIndex = 0) Then
            ErrorProvider1.SetError(cbxParentesco, "Debe Seleccionar un Parentesco")
        Else
            Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

            Try 'Manejamos una excepción de errores
                If (ValorParent = 0) Then 'Si es valor cero, registramos
                    P.CodigoCliente = CInt(CodigoC)
                    P.CodigoDifunto = CInt(CodigoD)
                    P.Parentesco = CStr(cbxParentesco.Text)
                    Mensaje = P.Registrar_Parentesco() 'Ejecutamos la función Registrar Registrar Difunto
                    If (Mensaje = "Registrado correctamente") Then 'Varificamos si se registró correctamente
                        Listar_Parentesco()
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_Controles_Parentesco() 'Llamamos el método limpiar controles
                        TabControl1.SelectTab(TabPage1)
                    Else
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                Else 'Si es valor 1 actualizamos la información
                    P.CodigoParentesco = CInt(CodigoP)
                    P.CodigoCliente = CInt(CodigoC)
                    P.CodigoDifunto = CInt(CodigoD)
                    P.Parentesco = CStr(cbxParentesco.Text)
                    Mensaje = P.Actualizar_Parentesco() 'Ejecutamos la función Registrar Parentesco Difunto
                    If (Mensaje = "Actualizado correctamente") Then 'Varificamos si se registró correctamente
                        Listar_Parentesco()
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_Controles_Parentesco() 'Llamamos el método limpiar controles
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

    Private Sub Limpiar_Controles_Parentesco()
        CodigoD = 0
        CodigoP = 0
        CodigoC = 0
        txtDatosClientes.Clear()
        txtDatosFallecido.Clear()
        ValorParent = 0
        cbxParentesco.SelectedIndex = 0
        dtgvParentesco.ClearSelection()
    End Sub

    Private Sub dtgvParentesco_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvParentesco.CellDoubleClick
        If (Me.dtgvParentesco.Rows.Count > 0) Then
            CodigoP = CInt(dtgvParentesco.CurrentRow.Cells(0).Value)
            CodigoC = CInt(dtgvParentesco.CurrentRow.Cells(1).Value)
            CodigoD = CInt(dtgvParentesco.CurrentRow.Cells(2).Value)
            txtDatosClientes.Text = dtgvParentesco.CurrentRow.Cells(3).Value.ToString()
            txtDatosFallecido.Text = dtgvParentesco.CurrentRow.Cells(4).Value.ToString()
            cbxParentesco.Text = dtgvParentesco.CurrentRow.Cells(5).Value.ToString()
            Me.dtgvParentesco.Rows(Me.dtgvParentesco.CurrentRow.Index).Selected = True
            ValorParent = 1
        End If
    End Sub

    Private Sub dtgvParentesco_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvParentesco.CellClick
        If (Me.dtgvParentesco.Rows.Count > 0) Then
            Me.dtgvParentesco.Rows(Me.dtgvParentesco.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub ptbActa_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ptbActa.Click
        Dim OpenFile As New OpenFileDialog()
        Try
            If OpenFile.ShowDialog() = Windows.Forms.DialogResult.OK Then
                ptbActa.ImageLocation = OpenFile.FileName
            Else
                ptbActa.ImageLocation = Imagen.loadImagen()
            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje("Debe elegir una imagen", "error")
        End Try
    End Sub

    Private Sub txtDni_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDni.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txtNombres_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNombres.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtApellidos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtApellidos.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtLugarFallec_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtLugarFallec.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub btnLimpiar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLimpiar.Click
        Limpiar_Controles()
        txtDni.Focus()
    End Sub

    Private Sub txtDatosClientes_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDatosClientes.KeyPress
        Validar.Letras(e)
    End Sub

    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        If (keyData = Keys.Escape) Then
            Cerrar_Form()
            Return True
        End If
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function

    Private Sub Cerrar_Form()
        If (txtDatos.Text.Trim = "" And txtDni.Text.Trim = "" And txtNombres.Text.Trim = "" And txtApellidos.Text.Trim = "" And txtLugarFallec.Text.Trim = "" And txtCausaMuerte.Text.Trim = "" And txtDatosFallecido.Text.Trim = "" And txtDatosClientes.Text.Trim = "") Then
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