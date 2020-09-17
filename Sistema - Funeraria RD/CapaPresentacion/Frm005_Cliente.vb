Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm005_Cliente

    Dim C As New clsCliente
    'Dim frm As New FrmCliente
    Dim Valida As Integer = 0
    Dim CodigoC As Integer = 0 'Variable para almacenar el código del Cliente
    Dim Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Public Property Caller() As IParentesco
    Public Property Caller1() As ICliente
    Public Cliente As Integer = 0

    Private Sub FrmClientePrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Listar_Clientes()
        If (Frm00_Login.FormActive = 2) Then
            Centrar_Form()
        End If

    End Sub

    Private Sub Listar_Clientes()
        Try 'Manejamos una excepción de errores
            Llenar_Grilla(C.Listar_Clientes())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btnNuevo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevo.Click
        Valor = 0
        TabControl1.SelectTab(TabPage2)

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
            DataGridView1.Rows(i).Cells(8).Value = "Editar"
        Next
        DataGridView1.ClearSelection() 'Limpiamos la selección del DataGridView1

        For Each row As DataGridViewRow In DataGridView1.Rows
            Dim button As DataGridViewButtonCell = CType(row.Cells(8), DataGridViewButtonCell)
            button.Style.BackColor = Color.FromArgb(92, 184, 92)
            button.Style.ForeColor = Color.White
            button.Style.Font = New Font("Arial", 9, FontStyle.Bold)
        Next
    End Sub

    Private Sub rbnNDoc_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNDoc.CheckedChanged
        txtDatos.MaxLength = 11
        txtDatos.Clear()
        Valida = 0
    End Sub

    Private Sub rbnNombre_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnNombre.CheckedChanged
        Listar_Clientes()
        txtDatos.MaxLength = 256
        txtDatos.Clear()
        Valida = 1
    End Sub


    Private Sub txtDatos_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtDatos.KeyPress
        If (Valida = 0) Then
            Validar.Numeros(e)
        Else
            Validar.Letras(e)
        End If
    End Sub

    Private Sub txtDatos_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable
            Try 'Manejamos una excepción de errores
                C.Datos = txtDatos.Text
                Llenar_Grilla(C.Filtrar_Clientes())
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else
            Listar_Clientes()
        End If
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick

        If (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Button")) Then
            Me.DataGridView1.ClearSelection()
            CodigoC = Me.DataGridView1.CurrentRow.Cells(0).Value.ToString()
            If (Me.DataGridView1.CurrentRow.Cells(1).Value.ToString() = "Natural") Then
                rbnNatural.Checked = True
            Else
                rbnJuridica.Checked = True
            End If
            cbxTipoDoc.Text = Me.DataGridView1.CurrentRow.Cells(2).Value.ToString()
            txtNroDoc.Text = Me.DataGridView1.CurrentRow.Cells(3).Value.ToString()
            txtNombres.Text = Me.DataGridView1.CurrentRow.Cells(4).Value.ToString()
            txtDireccion.Text = Me.DataGridView1.CurrentRow.Cells(5).Value.ToString()
            txtTelefono.Text = Me.DataGridView1.CurrentRow.Cells(6).Value.ToString()
            txtEmail.Text = Me.DataGridView1.CurrentRow.Cells(7).Value.ToString()
            Valor = 1
            TabControl1.SelectTab(TabPage2)
        End If
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
            Dim item As New ECliente()
            item.CodigoCliente = Convert.ToInt32(row.Cells("Codigo").Value)
            item.Datos = Convert.ToString(row.Cells("Nombres").Value)
            item.Direccion = Convert.ToString(row.Cells("Direccion").Value)
            item.TipoDocumento = Convert.ToString(row.Cells("TipoDoc").Value)
            item.Documento = Convert.ToString(row.Cells("NroDoc").Value)

            If (Cliente = 0) Then 'Si es valor cero, enviamos los datos al formulario parentesco
                'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
                If Caller Is Nothing Then
                    Return
                End If

                'Si el FrmUsuario devolvio false por haber encontrado el Cliente dentro de la lista
                'Informamos de lo sucedido al usuario
                If Not Caller.LoadDataRow1(item) Then
                    clsMensaje.mostrar_mensaje("El Cliente ya existe en la lista", "error")
                End If

            Else 'Si es valor uno, enviamos los datos al formulario Ventas
                'Si no existe llamador para nuestro formulario nos retornamos sin hacer ninguna accion
                If Caller1 Is Nothing Then
                    Return
                End If

                ''Si el FrmUsuario devolvio false por haber encontrado el Cliente dentro de la lista
                ''Informamos de lo sucedido al usuario
                If Not Caller1.LoadDataRow(item) Then
                    clsMensaje.mostrar_mensaje("El Cliente ya existe en la lista", "error")
                End If
            End If
            Close()
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        Close()
    End Sub

    '==================== Tab Page 2 ======================

    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            'Evento para guardar cambios, para registrar y/o actualizar información
            ErrorProvider1.Clear()
            If (cbxTipoDoc.SelectedIndex = 0) Then
                ErrorProvider1.SetError(cbxTipoDoc, "Debe Seleccionar un Tipo de Documento")
            ElseIf (txtNroDoc.Text.Trim = "") Then
                ErrorProvider1.SetError(txtNroDoc, "Ingrese Número de Documento")
            ElseIf (txtNombres.Text.Trim = "") Then
                ErrorProvider1.SetError(txtNombres, "Ingrese Nombres del Cliente")
            ElseIf (txtDireccion.Text.Trim = "") Then
                ErrorProvider1.SetError(txtDireccion, "Ingrese Dirección")
            ElseIf (txtTelefono.Text.Trim = "") Then
                ErrorProvider1.SetError(txtTelefono, "Ingrese Teléfono")
            Else
                Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

                Try 'Manejamos una excepción de errores

                    If (Valor = 0) Then 'Si es valor cero, registramos
                        C.TipoPersona = If(rbnNatural.Checked = True, "Natural", "Jurídica")
                        C.TipoDoc = cbxTipoDoc.SelectedItem
                        C.Documento = txtNroDoc.Text
                        C.Nombres = txtNombres.Text
                        C.Direccion = txtDireccion.Text
                        C.Telefono = txtTelefono.Text
                        C.Email = txtEmail.Text
                        Mensaje = C.Registrar_Cliente() 'Ejecutamos la función Registrar Cliente
                        If (Mensaje = "Registrado Correctamente") Then 'Varificamos si se registró correctamente
                            clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            TabControl1.SelectTab(TabPage1)
                            Valor = 0
                            'Dim frm As New FrmCliente
                            Call Limpiar_Controles() 'Llamamos el método limpiar controles
                        Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                            clsMensaje.mostrar_mensaje(Mensaje, "error")
                        End If

                    Else 'Si es valor 1 actualizamos la información
                        C.Codigo_Cliente = CodigoC
                        C.TipoPersona = If(rbnNatural.Checked = True, "Natural", "Jurídica")
                        C.TipoDoc = cbxTipoDoc.SelectedItem
                        C.Documento = txtNroDoc.Text
                        C.Nombres = txtNombres.Text
                        C.Direccion = txtDireccion.Text
                        C.Telefono = txtTelefono.Text
                        C.Email = txtEmail.Text
                        Mensaje = C.Actualizar_Item() 'Ejecutamos la función Registrar Cliente
                        If (Mensaje = "Actualizado Correctamente") Then 'Varificamos si se registró correctamente
                            clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            TabControl1.SelectTab(TabPage1)
                            Valor = 0
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

    Private Sub Limpiar_Controles()
        txtDatos.Clear()
        rbnNatural.Checked = True
        rbnNDoc.Checked = True
        cbxTipoDoc.SelectedIndex = 0
        txtNroDoc.Clear()
        txtNombres.Clear()
        txtDireccion.Clear()
        txtTelefono.Clear()
        txtEmail.Clear()
        Valor = 0
        ErrorProvider1.Clear()
    End Sub


    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        Listar_Clientes()
        If (Valor = 0) Then
            Limpiar_Controles()
        End If
    End Sub

    '==================== Fin Tab Page 2 ======================
    Private Sub FrmClientePrincipal_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub Frm005_Cliente_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub Centrar_Form()
        Me.Location = New Point((Screen.PrimaryScreen.Bounds.Width + 105 - Me.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - Me.Height) / 2)
    End Sub

    Private Sub txtNroDoc_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNroDoc.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub cbxTipoDoc_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxTipoDoc.SelectedIndexChanged
        If (cbxTipoDoc.SelectedIndex = 1) Then
            txtNroDoc.MaxLength = 8
        ElseIf (cbxTipoDoc.SelectedIndex = 2) Then
            txtNroDoc.MaxLength = 11
        End If
    End Sub

    Private Sub txtNombres_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtNombres.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtTelefono_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtTelefono.KeyPress
        Validar.Numeros_con_Numeral(e)
    End Sub

    Private Sub txtEmail_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtEmail.KeyPress
        Validar.Espacio(e)
    End Sub

    Private Sub btnLimpiar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLimpiar.Click
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
        If (txtDatos.Text.Trim = "" And txtNroDoc.Text.Trim = "" And txtNombres.Text.Trim = "" And txtDireccion.Text.Trim = "" And txtTelefono.Text.Trim = "" And txtEmail.Text.Trim = "") Then
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