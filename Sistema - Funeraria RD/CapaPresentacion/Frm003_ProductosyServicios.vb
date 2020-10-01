Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio

Public Class Frm003_ProductosyServicios

    Dim S As New clsItem 'Instanciamos la clase clsItem de la Capa Logica de Negocio para usar sus funciones
    Dim se As New clsServicios
    Dim P As New clsProducto
    Dim C As New clsColor
    Dim M As New clsMaterial
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Dim Imagen As New CopiarImagen
    Dim Codigo As Integer = 0 'Variable para almacenar el código del servicio
    Dim Valor As Integer = 0 'Variable para verificar si se va a registrar o actualizar la información
    Dim rutaAntigua As String = ""

    '========================== TabPage Productos =========================================
    Private Sub FrmProducto_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        Call Listar_Productos()
        ptbImagen.ImageLocation = Imagen.loadImagen
        Call Listar_Servicios() 'Llamamos al método listar servicios

        Call Listar_Material()
        Call Listar_Colores()
        cb_tipo_servicio.SelectedIndex = 0
        'cbxMaterial.SelectedIndex = 0
        'cbxColor.SelectedIndex = 0

    End Sub

    Private Sub Listar_Productos() 'Método para realizar el listado de todos los servicios
        Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable

        Try 'Manejamos una excepción de errores
            dt = P.Listar_Productos() 'Poblamos el DataTable
            dtgProductos.Rows.Clear() 'Limpiamos el control DataGridView1

            'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
            For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
                dtgProductos.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
                dtgProductos.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                dtgProductos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                dtgProductos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                dtgProductos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                dtgProductos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                dtgProductos.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()

            Next
            dtgProductos.ClearSelection() 'Limpiamos la selección del DataGridView1

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
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
            clsMensaje.mostrar_mensaje("Debe elegir una imagen", "error")
        End Try
    End Sub

    Private Sub dtgProductos_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgProductos.CellClick
        'Evento para seleccionar la fila del control DataGridView1
        If (dtgProductos.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            dtgProductos.Rows(dtgProductos.CurrentRow.Index).Selected = True 'True para seleccionar la fila
        End If
    End Sub

    Private Sub dtgProductos_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgProductos.CellDoubleClick
        'Evento para pasar los datos de la fila seleccionada del DataGridView1 a las cajas de Texto y realizar la actualización de la información
        If (dtgProductos.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            Codigo = CInt(dtgProductos.CurrentRow.Cells(0).Value.ToString())
            txtNombreProducto.Text = dtgProductos.CurrentRow.Cells(1).Value.ToString()
            txtDescripcionProducto.Text = dtgProductos.CurrentRow.Cells(2).Value.ToString()
            cbxColor.Text = dtgProductos.CurrentRow.Cells(3).Value.ToString()
            cbxMaterial.Text = dtgProductos.CurrentRow.Cells(4).Value.ToString()
            ptbImagen.ImageLocation = dtgProductos.CurrentRow.Cells(5).Value.ToString()
            rutaAntigua = dtgProductos.CurrentRow.Cells(5).Value.ToString()
            dtgProductos.Rows(dtgProductos.CurrentRow.Index).Selected = True 'True para mantener seleccionada la fila
            Valor = 1 'Asignamos valor uno para indicarle que va a actualizar la información
        End If
    End Sub

    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            'Evento para guardar cambios, para registrar y/o actualizar información
            ErrorProvider1.Clear()
            If (txtNombreProducto.Text.Trim = "") Then
                ErrorProvider1.SetError(txtNombreProducto, "Ingrese Nombres")
            ElseIf (txtDescripcionProducto.Text.Trim = "") Then
                ErrorProvider1.SetError(txtDescripcionProducto, "Ingrese Descripción del Producto")
            ElseIf (cbxMaterial.SelectedIndex = 0) Then
                ErrorProvider1.SetError(cbxMaterial, "Debe Seleccionar un Material")
            ElseIf (cbxColor.SelectedIndex = 0) Then
                ErrorProvider1.SetError(cbxColor, "Debe Seleccionar un Color")

            Else
                Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD
                Dim RutaImgen = ""
                Try 'Manejamos una excepción de errores
                    If (Valor = 0) Then 'Si es valor cero, registramos
                        S.Codigo_Tipo = 1
                        S.Nombre = txtNombreProducto.Text

                        Mensaje = S.Registrar_Item() 'Ejecutamos la función Registrar Servicio

                        If (Mensaje = "Registrado Correctamente") Then 'Varificamos si se registró correctamente

                            Dim NombreFoto As String = "Ataud-" & S.Devolver_Codigo_Item()
                            RutaImgen = Imagen.copiarImagen(ptbImagen.ImageLocation, NombreFoto, "", 1)
                            P.Codigo_Item = S.Devolver_Codigo_Item()
                            P.Descripcion = txtDescripcionProducto.Text
                            P.Color = cbxColor.Text
                            P.Material = cbxMaterial.Text

                            P.RutaImagen = RutaImgen
                            P.Registrar_Producto()
                            Call Listar_Productos() 'Llamamos al método listar Productos
                            clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            Call Limpiar_Controles() 'Llamamos el método limpiar controles
                        Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                            clsMensaje.mostrar_mensaje(Mensaje, "error")
                        End If

                    Else 'Si es valor 1 actualizamos la información
                        S.Codigo_Item = Codigo
                        S.Codigo_Tipo = 1
                        S.Nombre = txtNombreProducto.Text
                        Mensaje = S.Actualizar_Item() 'Ejecutamos la función Actualizar Servicio
                        MsgBox(Mensaje)
                        If (Mensaje = "Actualizado Correctamente") Then 'Varificamos si se actualizó correctamente
                            Dim NombreFoto As String = "Ataud-" & Codigo
                            RutaImgen = Imagen.copiarImagen(ptbImagen.ImageLocation, NombreFoto, rutaAntigua, 1)
                            P.Codigo_Item = Codigo
                            P.Descripcion = txtDescripcionProducto.Text
                            P.Color = cbxColor.Text
                            P.Material = cbxMaterial.Text
                            P.RutaImagen = RutaImgen
                            P.Actualizar_Producto()
                            clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            Call Listar_Productos() 'Llamamos al método listar Productos
                            Call Limpiar_Controles() 'Llamamos el método limpiar controles
                        Else 'Si no se realizó la actualización correctamente, mostramos el mensaje de error de la BD
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
        txtNombreProducto.Clear()
        txtNombreProducto.Focus()
        txtDescripcionProducto.Clear()
        cbxMaterial.SelectedIndex = 0

        cbxColor.SelectedIndex = 0
        ptbImagen.ImageLocation = Imagen.loadImagen()
        dtgProductos.ClearSelection()
        ErrorProvider1.Clear()
    End Sub

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        Close()
    End Sub

    Private Sub btnNuevoProductos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevoProductos.Click
        Limpiar_Controles()
        Valor = 0
    End Sub
    '========================== Fin TabPage Productos =========================================


    '************************************************************************************************

    '====================================== TabPage Servicios =========================================

    Private Sub btnGuardarServicios_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardarServicios.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            'Evento para guardar cambios, para registrar y/o actualizar información

            ErrorProvider1.Clear()
            If (txtNombreServicio.Text.Trim = "") Then
                ErrorProvider1.SetError(txtNombreServicio, "Ingrese Nombre de Servicio")
            ElseIf (txtPrecioServicio.Text.Trim = "") Then
                ErrorProvider1.SetError(txtPrecioServicio, "Ingrese Precio de Servicio")
            ElseIf (tb_precio_km.Text.Trim = "") Then
                ErrorProvider1.SetError(tb_precio_km, "Ingrese Precio de Servicio")
            ElseIf (tb_km.Text.Trim = "") Then
                ErrorProvider1.SetError(tb_km, "Ingrese Precio de Servicio")
            Else
                    Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

                    Try 'Manejamos una excepción de errores

                        If (Valor = 0) Then 'Si es valor cero, registramos
                            S.Codigo_Tipo = 2
                            S.Nombre = txtNombreServicio.Text
                            S.precio = txtPrecioServicio.Text
                            Mensaje = S.Registrar_Item() 'Ejecutamos la función Registrar Servicio
                            If (Mensaje = "Registrado Correctamente") Then 'Varificamos si se registró correctamente

                                se.Codigo_Item = S.Devolver_Codigo_Item()
                                se.tipo = cb_tipo_servicio.SelectedItem
                                se.km = tb_km.Text
                                se.precio_km = tb_precio_km.Text
                            se.precio = txtPrecioServicio.Text

                            se.Registrar_servicio()
                                Call Listar_Servicios() 'Llamamos al método listar servicios
                                Call Limpiar_Controles_Servicios() 'Llamamos el método limpiar controles
                                clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            Else 'Si no se realizó el registro correctamente, mostramos el mensaje de error de la BD
                                clsMensaje.mostrar_mensaje(Mensaje, "error")
                            End If

                        Else 'Si es valor 1 actualizamos la información
                            S.Codigo_Item = Codigo
                            S.Codigo_Tipo = 2
                            S.Nombre = txtNombreServicio.Text
                            S.precio = txtPrecioServicio.Text
                            Mensaje = S.Actualizar_Item() 'Ejecutamos la función Actualizar Servicio
                            If (Mensaje = "Actualizado Correctamente") Then 'Varificamos si se actualizó correctamente
                                se.Codigo_Item = S.Devolver_Codigo_Item()
                                se.tipo = cb_tipo_servicio.SelectedItem
                                se.km = tb_km.Text
                                se.precio_km = tb_precio_km.Text

                                se.Actualizar_servicio()
                                Listar_Servicios() 'Llamamos al método listar servicios
                                Limpiar_Controles_Servicios() 'Llamamos el método limpiar controles
                                clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            Else 'Si no se realizó la actualización correctamente, mostramos el mensaje de error de la BD
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

    Private Sub Listar_Servicios() 'Método para realizar el listado de todos los servicios
        Dim dt As New DataTable 'Instanciamos o asignamos memoria al DataTable

        Try 'Manejamos una excepción de errores
            dt = se.Listar_Servicios() 'Poblamos el DataTable
            DtgServicios.Rows.Clear() 'Limpiamos el control DataGridView1

            'Llenamos el DataGridView1 con todos los elementos que contiene el DataTable
            For i = 0 To dt.Rows.Count - 1 'Recorremos el DataTable
                DtgServicios.Rows.Add(dt.Rows(i)(0)) 'Agregamos una nueva fila en blanco
                DtgServicios.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                DtgServicios.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                DtgServicios.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                DtgServicios.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                DtgServicios.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                DtgServicios.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
            Next
            DtgServicios.ClearSelection() 'Limpiamos la selección del DataGridView1

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub


    Private Sub Limpiar_Controles_Servicios() 'Método para limpiar los controles (Cajas de Texto)
        txtNombreServicio.Clear()
        txtPrecioServicio.Clear()
        txtNombreServicio.Focus()
        tb_km.Clear()
        tb_precio_km.Clear()
        cb_tipo_servicio.SelectedIndex = 0

        DtgServicios.ClearSelection()
        Valor = 0 'Inicializamos variable valor en cero
    End Sub

    Private Sub DtgServicios_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DtgServicios.CellClick
        'Evento para seleccionar la fila del control DtgServicios
        If (DtgServicios.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            DtgServicios.Rows(DtgServicios.CurrentRow.Index).Selected = True 'True para seleccionar la fila
        End If
    End Sub

    Private Sub DtgServicios_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DtgServicios.CellDoubleClick
        'Evento para pasar los datos de la fila seleccionada del DataGridView1 a las cajas de Texto y realizar la actualización de la información
        If (DtgServicios.Rows.Count > 0) Then 'Verificamos que exista por lo menos un registro
            Codigo = CInt(DtgServicios.CurrentRow.Cells(0).Value.ToString())
            txtNombreServicio.Text = DtgServicios.CurrentRow.Cells(1).Value.ToString()
            cb_tipo_servicio.SelectedItem = DtgServicios.CurrentRow.Cells(2).Value.ToString()
            tb_km.Text = DtgServicios.CurrentRow.Cells(3).Value.ToString()
            tb_precio_km.Text = DtgServicios.CurrentRow.Cells(4).Value.ToString()
            txtPrecioServicio.Text = DtgServicios.CurrentRow.Cells(5).Value.ToString()
            DtgServicios.Rows(DtgServicios.CurrentRow.Index).Selected = True 'True para mantener seleccionada la fila
            Valor = 1 'Asignamos valor uno para indicarle que va a actualizar la información
        End If
    End Sub

    '========================== Fin TabPage Servicios =========================================

    Private Sub TabControl1_Selecting(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlCancelEventArgs) Handles TabControl1.Selecting
        Call Limpiar_Controles()
        Call Limpiar_Controles_Servicios()
    End Sub


    Private Sub Frm003_ProductosyServicios_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub Frm003_ProductosyServicios_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub txtPrecio_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        Validar.Numeros_con_Decimales(e)
    End Sub

    Private Sub txtStock_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)
        Validar.Numeros(e)
    End Sub

    Private Sub btnNuevoServicios_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNuevoServicios.Click
        Call Limpiar_Controles_Servicios()
    End Sub

    Private Sub txtPrecioServicio_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtPrecioServicio.KeyPress
        Validar.Numeros_con_Decimales(e)
    End Sub

    Private Sub lkbAddMaterial_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbAddMaterial.LinkClicked
        Dim frm As New Frm003i_addMaterial
        frm.ShowDialog()
    End Sub

    Private Sub lkbAddColor_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbAddColor.LinkClicked
        Dim frm As New Frm003ii_addColor
        frm.ShowDialog()
    End Sub

    Private Sub Listar_Colores()
        Dim dt As New DataTable

        Try
            dt = C.Listar_Colores()
            cbxColor.ValueMember = "Codigo_color"
            cbxColor.DisplayMember = "descripcion"
            cbxColor.DataSource = dt

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub Listar_Material()
        Dim dt As New DataTable

        Try
            dt = M.Listar_Material()
            cbxMaterial.ValueMember = "Codigo_material"
            cbxMaterial.DisplayMember = "descripcion"
            cbxMaterial.DataSource = dt

        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub cbxMaterial_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxMaterial.Click
        Listar_Material()
    End Sub

    Private Sub cbxColor_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbxColor.Click
        Listar_Colores()
    End Sub

    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        If (keyData = Keys.Escape) Then
            Cerrar_Form()
            Return True
        End If
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function

    Private Sub Cerrar_Form()
        If (txtNombreProducto.Text.Trim = "" And txtDescripcionProducto.Text.Trim = "" And txtNombreServicio.Text.Trim = "" And txtPrecioServicio.Text.Trim = "") Then
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

    Private Sub tb_km_TextChanged(sender As Object, e As EventArgs) Handles tb_km.TextChanged
        If (tb_km.Text = "" Or tb_precio_km.Text = "") Then

        Else
            Dim resultado = 0

            resultado = Integer.Parse(tb_km.Text) * Integer.Parse(tb_precio_km.Text)
            txtPrecioServicio.Text = resultado.ToString()
        End If

    End Sub

    Private Sub tb_km_KeyPress(sender As Object, e As KeyPressEventArgs) Handles tb_km.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub tb_precio_km_KeyPress(sender As Object, e As KeyPressEventArgs) Handles tb_precio_km.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub tb_precio_km_TextChanged(sender As Object, e As EventArgs) Handles tb_precio_km.TextChanged
        If (tb_km.Text = "" Or tb_precio_km.Text = "") Then

        Else
            Dim resultado = 0

            resultado = Integer.Parse(tb_km.Text) * Integer.Parse(tb_precio_km.Text)
            txtPrecioServicio.Text = resultado.ToString()
        End If
    End Sub

    Private Sub cb_tipo_servicio_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cb_tipo_servicio.SelectedIndexChanged
        If (cb_tipo_servicio.SelectedIndex = 1) Then
            tb_km.Enabled = False
            tb_precio_km.Enabled = False
            tb_km.Text = 0
            tb_precio_km.Text = 0
        ElseIf (cb_tipo_servicio.SelectedIndex = 0) Then
            tb_km.Enabled = True
            tb_precio_km.Enabled = True
            tb_km.Clear()
            tb_precio_km.Clear()
        End If
    End Sub
End Class
