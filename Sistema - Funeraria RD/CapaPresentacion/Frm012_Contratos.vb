Imports CapaLogicaNegocio

Public Class Frm012_Contratos

    Implements ICliente
    Implements IPersonal


    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim C As New clsContratos 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Private Shared ReadOnly Cliente As New List(Of ECliente)()
    Private Shared ReadOnly Personal As New List(Of EPersonal)()
    Dim Imagenes As New CopiarImagen
    Dim Tipo_Dato As Integer = 0 'Variable para verificar si el texto Ingresado es Letra o Número (0=Letras | 1=Números)
    Dim CodigoCliente As Integer = 0
    Dim DireccionCliente As String = ""
    Dim TipoDocumento As String = ""
    Dim Documento As String = ""
    Dim Codigopersonal As Integer = 0
    Dim nombre As String = ""
    Dim cedula As String = ""
    Dim telefono As String = ""
    Dim CodigoContrato
    Dim valor As Integer = 0
    Private Sub lkbBuscar_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs)

    End Sub

    Private Sub rbnFactura_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub rbnBoleta_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub lkbBuscar1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs)

    End Sub

    Private Sub btnBorrar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnRegistrar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub lkbBuscar_LinkClicked_1(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lkbBuscar.LinkClicked
        'Instanciamos el FrmPersonalPrincipal
        Dim frm As New Frm005_Cliente()
        frm.Cliente = 1
        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller1 = Me
        'Mostramos el FrmPersonalPrincipal
        Frm00_Login.FormActive = 2
        frm.ShowDialog()
    End Sub

    Public Function LoadDataRow(ByVal Client As ECliente) As Boolean Implements ICliente.LoadDataRow
        'Busca si el Cliente ya se encuentra en la lista
        Dim exists As Boolean = Cliente.Any(Function(x) x.CodigoCliente.Equals(Client.CodigoCliente))
        'Preguntamos por el resultado de la busqueda del Cliente dentro de la lista
        If Not exists Then
            CodigoCliente = Client.CodigoCliente
            txtCliente.Text = Client.Datos
            DireccionCliente = Client.Direccion
            TipoDocumento = Client.TipoDocumento
            Documento = Client.Documento
            'Retornamos True
            Return True
        End If
        'Si la condicion exists es igual a False, es decir, que el Cliente SI existe en la lista
        'retornamos FALSE para mostrar un mensajde informacion
        Return False
    End Function

    Private Sub txt_monto_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txt_monto.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txtplazo_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txtplazo.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txt_cuota_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txt_cuota.KeyPress
        Validar.Numeros(e)
    End Sub

    Public Function LoadDataRow(personales As EPersonal) As Boolean Implements IPersonal.LoadDataRow
        'Busca si el Cliente ya se encuentra en la lista
        Dim exists As Boolean = Personal.Any(Function(x) x.CodigoPersonal.Equals(personales.CodigoPersonal))

        'Preguntamos por el resultado de la busqueda del Cliente dentro de la lista
        If Not exists Then
            Codigopersonal = personales.CodigoPersonal
            txt_vendedor.Text = personales.Nombre
            cedula = personales.Cedula
            telefono = personales.Telefono

            'Retornamos True
            Return True
        End If
        'Si la condicion exists es igual a False, es decir, que el Cliente SI existe en la lista
        'retornamos FALSE para mostrar un mensajde informacion
        Return False
    End Function

    Private Sub lk_buscarpersonal_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lk_buscarpersonal.LinkClicked
        'Instanciamos el FrmPersonalPrincipal
        Dim frm As New Frm002_PersonalPrincipal()

        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller = Me
        'Mostramos el FrmPersonalPrincipal
        Frm00_Login.FormActive = 2
        frm.ShowDialog()
    End Sub

    Private Sub chk_university_CheckedChanged(sender As Object, e As EventArgs) Handles chk_university.CheckedChanged
        If chk_alfa.Checked Then
            chk_alfa.Checked = False
        End If
    End Sub

    Private Sub chk_alfa_CheckedChanged(sender As Object, e As EventArgs) Handles chk_alfa.CheckedChanged
        If chk_university.Checked Then
            chk_university.Checked = False
        End If
    End Sub

    Private Sub pb_contrato_Click(sender As Object, e As EventArgs) Handles pb_contrato.Click
        Dim OpenFile As New OpenFileDialog()
        Try
            If OpenFile.ShowDialog() = Windows.Forms.DialogResult.OK Then
                pb_contrato.ImageLocation = OpenFile.FileName
            Else
                pb_contrato.ImageLocation = Imagenes.loadImagen()
                pb_contrato.SizeMode = PictureBoxSizeMode.StretchImage



            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje("Debe elegir una imagen", "error")
        End Try
    End Sub

    Private Sub btnRegistrar_Click_1(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            'Evento para guardar cambios, para registrar y/o actualizar información
            ErrorProvider1.Clear()
            If (txtplazo.Text.Trim = "") Then
                ErrorProvider1.SetError(txtplazo, "Ingrese Nombres")
            ElseIf (txt_cuota.Text.Trim = "") Then
                ErrorProvider1.SetError(txt_cuota, "Ingrese Descripción del Producto")
            ElseIf (txt_cuota.Text.Trim = "") Then
                ErrorProvider1.SetError(txt_cuota, "Debe Seleccionar un Material")
            ElseIf (txtplazo.Text.Trim = "") Then
                ErrorProvider1.SetError(txtplazo, "Debe Seleccionar un Color")

            Else
                Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD
                Dim RutaImgen = ""
                Try 'Manejamos una excepción de errores

                    If valor = 0 Then


                        Dim NombreFoto As String = "Contrato-" & C.Devolver_Codigo_cliente()
                        RutaImgen = Imagenes.copiarImagen(pb_contrato.ImageLocation, NombreFoto, "", 1)
                        C.CodigoCliente = CInt(CodigoCliente)
                        C.CodigoPersonal = CInt(Codigopersonal)
                        C.TipoContrato = If(chk_alfa.Checked = True, "Alfa", "University")
                        C.Monto = CDec(txt_monto.Text)
                        C.Plazo = CInt(txtplazo.Text)
                        C.Cuota = CDec(txt_cuota.Text)
                        C.Zona = cb_zona.SelectedItem
                        C.LugarCobro = txt_lugar.Text
                        C.FechaCobro = txt_fecha_cobro.Text
                        C.Observacion = rtxt_obserbaciones.Text
                        C.NumeroContrato = txtNroDocumento.Text
                        C.FechaContrato = CDate(dtpFechacontrato.Value)
                        C.Contrato = RutaImgen
                        C.Registrar_Contrato()
                        'Call Listar_Contratos() 'Llamamos al método listar contratos
                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_controles() 'Llamamos el método limpiar controles
                    Else
                        Dim NombreFoto As String = "Contrato-" & C.Devolver_Codigo_cliente()
                        RutaImgen = Imagenes.copiarImagen(pb_contrato.ImageLocation, NombreFoto, "", 1)
                        C.CodigoContrato = CodigoContrato
                        C.CodigoCliente = CInt(CodigoCliente)
                        C.CodigoPersonal = CInt(Codigopersonal)
                        C.TipoContrato = If(chk_alfa.Checked = True, "Alfa", "University")
                        C.Monto = CDec(txt_monto.Text)
                        C.Plazo = CInt(txtplazo.Text)
                        C.Cuota = CDec(txt_cuota.Text)
                        C.Zona = cb_zona.SelectedItem
                        C.LugarCobro = txt_lugar.Text
                        C.FechaCobro = txt_fecha_cobro.Text
                        C.Observacion = rtxt_obserbaciones.Text
                        C.NumeroContrato = txtNroDocumento.Text
                        C.FechaContrato = CDate(dtpFechacontrato.Value)
                        C.Contrato = RutaImgen
                        C.Actualizar_Contrato()

                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        Call Limpiar_controles() 'Llamamos el método limpiar controles
                    End If


                    Call Listar_Contratos()

                Catch ex As Exception
                    clsMensaje.mostrar_mensaje(ex.Message, "error")
                End Try
            End If
        Else
            clsMensaje.mostrar_mensaje("no  tiene permisos para esta Opción", "error")
        End If
    End Sub

    Private Sub Limpiar_controles()

        chk_alfa.Checked = False
        chk_university.Checked = False
        txt_monto.Clear()
        txtplazo.Clear()
        txt_cuota.Clear()
        cb_zona.SelectedIndex = 0
        txt_lugar.Clear()
        txt_fecha_cobro.Clear()
        rtxt_obserbaciones.Clear()
        txtNroDocumento.Clear()
        Dgv_contratos.Rows.Clear()
        txtCliente.Clear()


        CodigoCliente = 0
        Codigopersonal = 0
        'CodigoProducto = 0
        lst.Clear()

    End Sub
    Private Sub Listar_Contratos()
        Llenar_Grilla(C.Listar_Contratos())
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        Try
            Dgv_contratos.Rows.Clear()

            For i = 0 To dt.Rows.Count - 1
                Dgv_contratos.Rows.Add(dt.Rows(i)(0))
                Dgv_contratos.Rows(i).Cells(0).Value = CInt(dt.Rows(i)(0).ToString())
                Dgv_contratos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                Dgv_contratos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                Dgv_contratos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                Dgv_contratos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                Dgv_contratos.Rows(i).Cells(5).Value = CDec(dt.Rows(i)(5).ToString())
                Dgv_contratos.Rows(i).Cells(6).Value = CInt(dt.Rows(i)(6).ToString())
                Dgv_contratos.Rows(i).Cells(7).Value = CDec(dt.Rows(i)(7).ToString())
                Dgv_contratos.Rows(i).Cells(8).Value = dt.Rows(i)(8).ToString()
                Dgv_contratos.Rows(i).Cells(9).Value = dt.Rows(i)(9).ToString()
                Dgv_contratos.Rows(i).Cells(10).Value = dt.Rows(i)(10).ToString()
                Dgv_contratos.Rows(i).Cells(11).Value = dt.Rows(i)(11).ToString()
                Dgv_contratos.Rows(i).Cells(12).Value = Format(dt.Rows(i)(12), "dd/MM/yyyy")
                Dgv_contratos.Rows(i).Cells(13).Value = dt.Rows(i)(13).ToString()
                Dgv_contratos.Rows(i).Cells(14).Value = dt.Rows(i)(14).ToString()
                Dgv_contratos.Rows(i).Cells(15).Value = "Ver Información"
                Dgv_contratos.Rows(i).Cells(16).Value = "Editar"
                Dgv_contratos.Rows(i).Cells(17).Value = dt.Rows(i)(15).ToString()
                Dgv_contratos.Rows(i).Cells(18).Value = dt.Rows(i)(16).ToString()

            Next
            Me.Dgv_contratos.ClearSelection()
            For Each row As DataGridViewRow In Dgv_contratos.Rows
                Dim button1 As DataGridViewButtonCell = CType(row.Cells(15), DataGridViewButtonCell)
                Dim button2 As DataGridViewButtonCell = CType(row.Cells(16), DataGridViewButtonCell)
                button1.Style.BackColor = Color.FromArgb(92, 184, 92)
                button1.Style.ForeColor = Color.White
                button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
                button2.Style.BackColor = Color.FromArgb(92, 184, 92)
                button2.Style.ForeColor = Color.White
                button2.Style.Font = New Font("Arial", 9, FontStyle.Bold)
            Next
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try

    End Sub

    Private Sub Frm012_Contratos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call Listar_Contratos()
        cb_zona.SelectedIndex = 0
    End Sub

    Private Sub Dgv_contratos_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles Dgv_contratos.CellContentClick
        If (Me.Dgv_contratos.Columns(e.ColumnIndex).Name.Equals("Editar")) Then
            Me.Dgv_contratos.ClearSelection()
            CodigoContrato = Me.Dgv_contratos.CurrentRow.Cells(0).Value.ToString()
            txtCliente.Text = Me.Dgv_contratos.CurrentRow.Cells(1).Value.ToString()
            txt_vendedor.Text = Me.Dgv_contratos.CurrentRow.Cells(2).Value.ToString()
            txtNroDocumento.Text = Me.Dgv_contratos.CurrentRow.Cells(3).Value.ToString()
            If (Me.Dgv_contratos.CurrentRow.Cells(4).Value.ToString() = "Alfa") Then
                chk_alfa.Checked = True
            Else
                chk_university.Checked = True
            End If
            txt_monto.Text = Me.Dgv_contratos.CurrentRow.Cells(5).Value.ToString()
            txt_cuota.Text = Me.Dgv_contratos.CurrentRow.Cells(7).Value.ToString()
            txtplazo.Text = Me.Dgv_contratos.CurrentRow.Cells(6).Value.ToString()
            cb_zona.SelectedItem = Me.Dgv_contratos.CurrentRow.Cells(8).Value.ToString()
            txt_lugar.Text = Me.Dgv_contratos.CurrentRow.Cells(9).Value.ToString()
            txt_fecha_cobro.Text = Me.Dgv_contratos.CurrentRow.Cells(10).Value.ToString()
            rtxt_obserbaciones.Text = Me.Dgv_contratos.CurrentRow.Cells(11).Value.ToString()
            dtpFechacontrato.Value = Me.Dgv_contratos.CurrentRow.Cells(12).Value.ToString()
            pb_contrato.ImageLocation = Me.Dgv_contratos.CurrentRow.Cells(13).Value.ToString()
            pb_contrato.SizeMode = PictureBoxSizeMode.StretchImage
            CodigoCliente = CInt(Me.Dgv_contratos.CurrentRow.Cells(17).Value.ToString())
            Codigopersonal = CInt(Me.Dgv_contratos.CurrentRow.Cells(18).Value.ToString())
            valor = 1
            TabControl1.SelectTab(TabPage1)
        End If
    End Sub

    Private Sub rbnNombre_CheckedChanged(sender As Object, e As EventArgs) Handles rbnNombre.CheckedChanged
        Listar_Contratos()
        txtDatos.MaxLength = 256
        txtDatos.Clear()
        Tipo_Dato = 1
        txtDatos.Focus()
    End Sub

    Private Sub rbnNDoc_CheckedChanged(sender As Object, e As EventArgs) Handles rbnNDoc.CheckedChanged
        Listar_Contratos()
        txtDatos.MaxLength = 8
        txtDatos.Clear()
        Tipo_Dato = 0
        txtDatos.Focus()
    End Sub

    Private Sub rbnNDoc_KeyPress(sender As Object, e As KeyPressEventArgs) Handles rbnNDoc.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub rbnNombre_KeyPress(sender As Object, e As KeyPressEventArgs) Handles rbnNombre.KeyPress
        Validar.Letras(e)
    End Sub

    Private Sub txtDatos_TextChanged(sender As Object, e As EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Try
                C.dato = CStr(txtDatos.Text)
                Llenar_Grilla(C.Buscar_Contratos())
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else
            Listar_Contratos()
        End If
    End Sub

    Private Sub txtplazo_TextChanged(sender As Object, e As EventArgs)
        If (txt_monto.Text.Length > 3 And txtplazo.Text <> "" And txtplazo.Text <> "0") Then
            txt_cuota.Text = CDec(txt_monto.Text) / CDec(txt_monto.Text)
        End If
    End Sub

    Private Sub txt_monto_TextChanged(sender As Object, e As EventArgs) Handles txt_monto.TextChanged
        If (txt_monto.Text.Length > 3 And txtplazo.Text <> "" And txtplazo.Text <> "0") Then
            txt_cuota.Text = CDec(txt_monto.Text) / CDec(txtplazo.Text)
        End If
    End Sub

    Private Sub txtplazo_TextChanged_1(sender As Object, e As EventArgs) Handles txtplazo.TextChanged
        If (txt_monto.Text.Length > 3 And txtplazo.Text <> "" And txtplazo.Text <> "0") Then
            txt_cuota.Text = CDec(txt_monto.Text) / CDec(txtplazo.Text)
        End If
    End Sub
End Class