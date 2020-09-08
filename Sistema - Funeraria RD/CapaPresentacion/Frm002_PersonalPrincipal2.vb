Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm002_PersonalPrincipal
    Dim P As New clsPersonal 'Instanciamos la clase clsPersonal de la Capa Logica de Negocio para usar sus funciones
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim Tipo_Dato As Integer = 0 'Variable para verificar si el texto Ingresado es Letra o Número (0=Letras | 1=Números)
    Dim CodigoP As Integer = 0 'Variable para almacenar el código del Personal
    Dim Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim ValorUsuario As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información

    Dim contador_controles = 0
    Private Sub FrmPersonalPrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Listar_Personal()
        Listar_Usuario()
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
            DataGridView1.Rows(i).Cells(8).Value = dt.Rows(i)(8).ToString()
            DataGridView1.Rows(i).Cells(9).Value = "Editar"

            'Verificar si este personal ya tiene cuenta de usuario
            'U.CodigoPersona = CInt(dt.Rows(i)(0))
            'dt2 = U.Verificar_Existe_Usuarios()
            'If (Convert.ToInt32(dt2.Rows(0)(0)) = 1) Then
            '    DataGridView1.Rows(i).Cells(10).Value = "Asignado"
            'Else
            '    DataGridView1.Rows(i).Cells(10).Value = "Asignar Usuario"
            'End If
        Next
        DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1

        For Each row As DataGridViewRow In DataGridView1.Rows
            Dim button1 As DataGridViewButtonCell = CType(row.Cells(9), DataGridViewButtonCell)
            'Dim button2 As DataGridViewButtonCell = CType(row.Cells(10), DataGridViewButtonCell)
            Dim button3 As DataGridViewButtonCell = CType(row.Cells(8), DataGridViewButtonCell)
            button1.Style.BackColor = Color.FromArgb(92, 184, 92)
            button1.Style.ForeColor = Color.White
            button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)

            'If (row.Cells(10).Value = "Asignar Usuario") Then
            '    button2.Style.BackColor = Color.FromArgb(91, 192, 222)
            'Else
            '    button2.Style.BackColor = Color.FromArgb(0, 122, 204)
            'End If
            'button2.Style.ForeColor = Color.White
            'button2.Style.Font = New Font("Arial", 9, FontStyle.Bold)

            If (row.Cells(8).Value = "Activo") Then
                button3.Style.BackColor = Color.FromArgb(92, 184, 92)
            Else
                button3.Style.BackColor = Color.FromArgb(217, 83, 79)
            End If
            button3.Style.ForeColor = Color.White
            button3.Style.Font = New Font("Arial", 9, FontStyle.Bold)
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
        Close()
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
        ElseIf (txtUser.Text.Trim = "") Then
            ErrorProvider1.SetError(txtUser, "Ingrese Usuario")
        ElseIf (txtClaveUsu.Text.Trim = "") Then
            ErrorProvider1.SetError(txtClaveUsu, "Ingrese Clave")
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
                        P.DNI = txtDNI.Text
                        Dim DtP As New DataTable
                        DtP = P.Buscar_Codigo_Dni()
                        Registrar_Usuario(DtP.Rows(0)(0).ToString())
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Valor = 0
                        contador_controles = 0
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
                    If (Mensaje = "Actualizado Correctamente") Then 'Verificamos si se registró correctamente
                        P.DNI = txtDNI.Text
                        Dim DtP As New DataTable
                        DtP = P.Buscar_Codigo_Dni()
                        Modificar_Usuario(DtP.Rows(0)(0).ToString())
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
            'Call Limpiar_Controles_Usuario()
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
        txtUser.Clear()
        txtClaveUsu.Clear()
        ErrorProvider1.Clear()
    End Sub

    Private Sub Frm002_PersonalPrincipal_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        'Frm001_MenuPrincipal.FormActive = 0
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub Registrar_Usuario(ByVal CodigoP As String)
        U.CodigoPersona = CodigoP
        U.Usuario = CStr(txtUser.Text)
        U.Clave = CStr(txtClaveUsu.Text)
        Dim Mensaje As String = U.Registrar_Usuarios()
        If (Mensaje = "Registrado correctamente") Then
            Listar_Usuario()
            ValorUsuario = 0
        End If
    End Sub

    Private Sub Modificar_Usuario(ByVal CodigoPe As String)
        U.CodigoPersona = CodigoPe
        U.Usuario = CStr(txtUser.Text)
        U.Clave = CStr(txtClaveUsu.Text)
        Dim Mensaje As String = U.Actualizar_Usuarios()
        If (Mensaje = "Actualizado correctamente") Then
            Listar_Usuario()
            ValorUsuario = 0
        End If
    End Sub

    'Private Sub btnGuardarUsuario_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '    'Evento para guardar cambios, para registrar y/o actualizar información
    '    ErrorProvider1.Clear()
    '    If (txtUsuario.Text.Trim = "") Then
    '        ErrorProvider1.SetError(txtUsuario, "Ingrese Usuario")
    '    ElseIf (txtClave.Text.Trim = "") Then
    '        ErrorProvider1.SetError(txtClave, "Ingrese Clave")
    '    Else
    '        Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

    '        Try
    '            If (ValorUsuario = 1) Then
    '                ' U.CodigoPersona = CInt(txtCodigo.Text)  :p
    '                U.Usuario = CStr(txtUsuario.Text)
    '                U.Clave = CStr(txtClave.Text)
    '                Mensaje = U.Registrar_Usuarios()
    '                If (Mensaje = "Registrado correctamente") Then
    '                    Listar_Usuario()
    '                    ValorUsuario = 0
    '                    clsMensaje.mostrar_mensaje(Mensaje, "ok")
    '                    TabControl1.SelectTab(TabPage1)
    '                Else
    '                    clsMensaje.mostrar_mensaje(Mensaje, "error")
    '                End If

    '            ElseIf (ValorUsuario = 2) Then 'Si es valor 1 actualizamos la información

    '                ' U.CodigoPersona = CInt(txtCodigo.Text)  :p
    '                U.Usuario = CStr(txtUsuario.Text)
    '                U.Clave = CStr(txtClave.Text)
    '                Mensaje = U.Actualizar_Usuarios()
    '                If (Mensaje = "Actualizado correctamente") Then
    '                    Listar_Usuario()
    '                    ValorUsuario = 0
    '                    clsMensaje.mostrar_mensaje(Mensaje, "ok")
    '                    TabControl1.SelectTab(TabPage1)
    '                Else
    '                    clsMensaje.mostrar_mensaje(Mensaje, "error")
    '                End If
    '            End If
    '        Catch ex As Exception
    '            clsMensaje.mostrar_mensaje(ex.Message, "error")
    '        End Try
    '    End If
    'End Sub

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

    'Private Sub dtgvUsuario_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs)
    '    If (Me.dtgvUsuario.Rows.Count > 0) Then
    '        'txtCodigo.Text = dtgvUsuario.CurrentRow.Cells(0).Value.ToString() :p
    '        'txtDatosPersonal.Text = dtgvUsuario.CurrentRow.Cells(1).Value.ToString() :p
    '        txtUsuario.Text = dtgvUsuario.CurrentRow.Cells(2).Value.ToString()
    '        txtClave.Text = dtgvUsuario.CurrentRow.Cells(3).Value.ToString()
    '        ValorUsuario = 2
    '    End If
    'End Sub

    'Private Sub Limpiar_Controles_Usuario()
    '    'Limpiamos los controles del usuario
    '    'txtCodigo.Clear() :p
    '    'txtDatosPersonal.Clear() :p
    '    txtUsuario.Clear()
    '    txtClave.Clear()
    '    ValorUsuario = 0
    '    ErrorProvider1.Clear()
    'End Sub

    Private Sub dtgvUsuario_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs)
        If (Me.dtgvUsuario.Rows.Count > 0) Then
            Me.dtgvUsuario.Rows(Me.dtgvUsuario.CurrentRow.Index).Selected = True
        End If
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Button")) Then
            Me.DataGridView1.ClearSelection()
            CodigoP = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString()
            txtDNI.Text = Me.DataGridView1.CurrentRow.Cells(1).Value.ToString()
            txtNombres.Text = Me.DataGridView1.CurrentRow.Cells(2).Value.ToString()
            txtApellidos.Text = Me.DataGridView1.CurrentRow.Cells(3).Value.ToString()
            txtCargo.Text = Me.DataGridView1.CurrentRow.Cells(4).Value.ToString()
            txtDireccion.Text = Me.DataGridView1.CurrentRow.Cells(5).Value.ToString()
            txtTelefono.Text = Me.DataGridView1.CurrentRow.Cells(6).Value.ToString()
            txtEmail.Text = Me.DataGridView1.CurrentRow.Cells(7).Value.ToString()

            P.DNI = Me.DataGridView1.CurrentRow.Cells(1).Value.ToString()
            Dim dtU As New DataTable
            dtU = P.Buscar_Usuario_Dni()
            'txtUser.Text = "hosting"
            'MsgBox(Me.DataGridView1.CurrentRow.Cells(1).Value.ToString())
            If (dtU.Rows.Count > 0) Then
                txtUser.Text = dtU.Rows(0)(0).ToString()
                txtClaveUsu.Text = dtU.Rows(0)(1).ToString()
            End If
            Valor = 1
            TabControl1.SelectTab(TabPage2)

            'ElseIf (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Usuario")) Then
            '    If (DataGridView1.CurrentRow.Cells(10).Value <> "Asignado") Then
            '        'txtCodigo.Text = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString() :p
            '        'txtDatosPersonal.Text = Me.DataGridView1.CurrentRow.Cells(2).Value.ToString() & " " & Me.DataGridView1.CurrentRow.Cells(3).Value.ToString() :p
            '        'ValorUsuario = 1
            '        'TabControl1.SelectTab(TabPage3)
            '    End If

        ElseIf (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Estado")) Then
            P.Codigo_Personal = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString()
            P.Estado = Me.DataGridView1.CurrentRow.Cells(8).Value.ToString()
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
        contador_controles = 0
        Limpiar_Controles()
        txtDNI.Focus()
    End Sub

    Private Sub txtUsuario_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        Validar.Espacio(e)
    End Sub

    Private Sub txtClave_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        Validar.Espacio(e)
    End Sub

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


End Class