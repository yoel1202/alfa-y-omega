Imports CapaLogicaNegocio 'Importamos la capa lógica de negocio


Public Class Frm009_Ventas

    Implements ICliente
    'Implements IItem
    Implements IPlanServicio

    Dim V As New clsVentas
    Dim descri As New DescripcionMonto
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    Private Shared ReadOnly Cliente As New List(Of ECliente)()
    Private Shared ReadOnly Plan As New List(Of EPlanServicio)()
    'Private Shared ReadOnly Producto As New List(Of EProducto)()
    'Private Shared ReadOnly Item As New List(Of EItem)()
    Dim Tipo_Dato As Integer = 0 'Variable para verificar si el texto Ingresado es Letra o Número (0=Letras | 1=Números)
    Dim CodigoCliente As Integer = 0
    Dim DireccionCliente As String = ""
    Dim TipoDocumento As String = ""
    Dim Documento As String = ""
    Dim SubTotal As Decimal = 0
    Dim Igv As Decimal = 0
    Dim CodigoVenta As Integer = 0
    Dim selecionar_credito = False
    Private Sub FrmVentas_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        tb_fecha.Text = DateTime.Now
        Call Listar_Ventas()
        If (Plan IsNot Nothing) Then 'Verificamos si la lista genérica es diferente a vacía
            Call Listar_Productos() 'Llamamos al método Listar_Productos
        End If
    End Sub


    Private Sub rbnBoleta_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnBoleta.CheckedChanged

    End Sub

    Private Sub rbnFactura_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbnFactura.CheckedChanged

    End Sub

    Public Function LoadDataRow1(ByVal planServico As EPlanServicio) As Boolean Implements IPlanServicio.LoadDataRow1
        'Busca si el Cliente ya se encuentra en la lista
        Dim exists As Boolean = Plan.Any(Function(x) x.Codigo.Equals(planServico.Codigo))
        'Preguntamos por el resultado de la busqueda del Cliente dentro de la lista
        If Not exists Then
            Plan.Add(planServico)

            Try
                Call Listar_Productos() 'Llamamos al método Listar_Productos

                lblTotal.Text = CalcularTotal()
                lblIgv.Text = CalcularIgv()
                lblSubTotal.Text = CalcularSubTotal()
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try

            'Retornamos True
            Return True
        End If
        'Si la condicion exists es igual a False, es decir, que el Cliente SI existe en la lista
        'retornamos FALSE para mostrar un mensajde informacion
        Return False
    End Function

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

    Private Sub lkbBuscar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbBuscar.LinkClicked
        'Instanciamos el FrmPersonalPrincipal
        Dim frm As New Frm005_Cliente()
        frm.Cliente = 1
        'Le indicamos quien lo mando a llamar usando la Propiedad Caller
        frm.Caller1 = Me
        'Mostramos el FrmPersonalPrincipal
        Frm00_Login.FormActive = 2
        frm.ShowDialog()
    End Sub

    Private Sub lkbBuscar1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbBuscar1.LinkClicked
        If (rbnPlanFunerario.Checked = True) Then
            Dim frm As New Frm009i_Listado_Planes()
            frm.Caller = Me
            frm.ShowDialog()
        Else
            Dim frm As New Frm009ii_Listado_Servicios()
            frm.Caller = Me
            frm.ShowDialog()
        End If
    End Sub

    Private Function verificar(ByVal CodigoProducto As Integer) As Boolean
        For i = 0 To DataGridView1.RowCount - 1
            If (DataGridView1.Rows(i).Cells(0).Value = CodigoProducto) Then
                Return True
            End If
        Next
        Return False
    End Function

    Private Function CalcularTotal() As String
        Dim Total As Decimal = 0
        For i = 0 To DataGridView1.RowCount - 1
            Total += CDec(DataGridView1.Rows(i).Cells(6).Value)
        Next
        Return Total
    End Function

    Private Function CalcularIgv() As String
        Dim igv As Decimal = 0
        For i = 0 To DataGridView1.RowCount - 1
            igv += ((CDec(DataGridView1.Rows(i).Cells(2).Value) * CInt(DataGridView1.Rows(i).Cells(3).Value)) / 1.18) * 0.18
        Next
        Return Math.Round(igv, 2)
    End Function

    Private Function CalcularSubTotal() As String
        Dim SubTotal As Decimal = 0
        For i = 0 To DataGridView1.RowCount - 1
            SubTotal += (CDec(DataGridView1.Rows(i).Cells(2).Value) * CInt(DataGridView1.Rows(i).Cells(3).Value)) / 1.18
        Next
        Return Math.Round(SubTotal, 2)
    End Function

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick

        Try
            If (Me.DataGridView1.Columns(e.ColumnIndex).Name.Equals("Eliminar")) Then
                Dim CodigoPlan As Integer = CInt(DataGridView1.CurrentRow.Cells(0).Value)
                Dim removeList As List(Of EDetalleItem) = lst
                removeList.RemoveAll(Function(DI As EDetalleItem) DI.CodigoPlan = CodigoPlan)

                Dim i As Integer = DataGridView1.CurrentRow.Index
                DataGridView1.Rows.RemoveAt(i)
                Plan.RemoveAt(i)

                Dim Total As Double = 0
                lblTotal.Text = CalcularTotal()
                lblIgv.Text = CalcularIgv()
                lblSubTotal.Text = CalcularSubTotal()

            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub FrmVentas_Activated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Frm00_Login.FormActive = 1
    End Sub

    Private Sub FrmVentas_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Frm00_Login.FormActive = 0
        Validar.Cerrar_form = 0
    End Sub

    Private Sub lkbCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lkbCerrar.Click
        Close()
    End Sub

    Private Sub btnBorrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBorrar.Click
        DataGridView1.Rows.Clear()
        lst.Clear()
        Plan.Clear()
    End Sub

    Private Sub btnRegistrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRegistrar.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            ErrorProvider1.Clear()

            If (txt_plazo.Text.Trim = "") Then
                ErrorProvider1.SetError(txt_plazo, "Ingreso nombre del Cementerio")
            ElseIf (txt_cuota.Text.Trim = "") Then
                ErrorProvider1.SetError(txt_cuota, "Ingreso Dirección del Sepelio")
            ElseIf (txtCliente.Text.Trim = "") Then
                ErrorProvider1.SetError(txtCliente, "Seleccione Cliente")
            ElseIf (DataGridView1.Rows.Count < 1) Then
                clsMensaje.mostrar_mensaje("No hay ningún Ítem en el Carrito de Ventas", "error")
            Else
                Dim Mensaje As String = ""
                Try
                    V.CodigoCliente = CInt(CodigoCliente)
                    V.TipoDocumento = If(rbnBoleta.Checked = True, "Boleta", "Factura")
                    V.Cuotas = CDec(txt_cuota.Text)
                    V.Plazo = CDec(txt_plazo.Text)
                    V.CondicionVenta = If(chk_contado.Checked = True, "Contado", "Credito")
                    V.Total = CDec(lblTotal.Text)
                    V.FechaVenta = CDate(dtpFecha.Value)
                    V.NumeroDocumento = txtNroDocumento.Text
                    Mensaje = V.Registrar_Ventas()
                    If (Mensaje = "Venta Registrada correctamente") Then
                        'Registramos el detalle de la venta            
                        For i = 0 To lst.Count - 1
                            V.CodigoVenta = CInt(V.Devolver_Codigo_Ventas())
                            V.CodigoItem = CInt(lst(i).CodigoItem)
                            V.Cantidad = CInt(lst(i).Cantidad)
                            V.PrecioVenta = Math.Round(CDec(lst(i).Precio), 2)
                            V.Igv = Math.Round(CDec(lst(i).Igv), 2)
                            V.Descuento = CDec(0)
                            V.SubTotal = Math.Round(CDec(lst(i).SubTotal), 2)
                            V.Registrar_Detalle_Ventas()
                        Next

                        ''Registramos la información de la venta
                        'V.CodigoVenta = CInt(V.Devolver_Codigo_Ventas())
                        'V.Cementerio = CStr(txt_plazo.Text)
                        'V.DireccionSepelio = CStr(txt_cuota.Text)
                        'V.FechaSepelio = CDate(dtpFecha.Value)
                        'V.Registrar_Informacion_Venta()

                        clsMensaje.mostrar_mensaje(Mensaje, "ok")
                        GenerarDocumento() 'Llamamos al método para generar el comprobante de pago (BOLETA Y/O FACTURA)
                        Limpiar_controles()
                    Else
                        clsMensaje.mostrar_mensaje(Mensaje, "error")
                    End If
                Catch ex As Exception
                    clsMensaje.mostrar_mensaje(ex.Message, "error")
                End Try
            End If
        Else
            clsMensaje.mostrar_mensaje("no  tiene permisos para esta Opción", "error")
        End If
    End Sub

    Private Sub Limpiar_controles()
        lblIgv.Text = ""
        lblSubTotal.Text = ""
        lblTotal.Text = ""
        DataGridView1.Rows.Clear()
        txtCliente.Clear()


        CodigoCliente = 0
        'CodigoProducto = 0
        lst.Clear()
        Plan.Clear()
        txt_plazo.Clear()
        txt_cuota.Clear()

        dtpFecha.Value = Now
    End Sub

    Private Sub Listar_Productos()
        Try
            DataGridView1.Rows.Clear()
            For i = 0 To Plan.Count - 1
                DataGridView1.Rows.Add()
                Me.DataGridView1.Rows(i).Cells(0).Value = CInt(Plan(i).Codigo)
                Me.DataGridView1.Rows(i).Cells(1).Value = CStr(Plan(i).Descripcion)
                Me.DataGridView1.Rows(i).Cells(2).Value = CDec(Plan(i).Precio)
                Me.DataGridView1.Rows(i).Cells(3).Value = CInt(Plan(i).Cantidad)
                SubTotal = (CDec(Plan(i).Precio) * CInt(Plan(i).Cantidad)) / 1.18
                Igv = SubTotal * 0.18
                Me.DataGridView1.Rows(i).Cells(4).Value = Math.Round(Igv, 2)
                Me.DataGridView1.Rows(i).Cells(5).Value = Math.Round(SubTotal, 2)
                Me.DataGridView1.Rows(i).Cells(6).Value = Math.Round(CDec(SubTotal + Igv), 2)
                Me.DataGridView1.Rows(i).Cells(7).Value = "Eliminar"
            Next
            Me.DataGridView1.ClearSelection()
            Call asignar_color_boton()
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub asignar_color_boton()
        For Each row As DataGridViewRow In DataGridView1.Rows
            Dim button1 As DataGridViewButtonCell = CType(row.Cells(7), DataGridViewButtonCell)
            button1.Style.BackColor = Color.FromArgb(217, 83, 79)
            button1.Style.ForeColor = Color.White
            button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
        Next
    End Sub

    Private Sub GenerarDocumento()
        'Hacemos una instancia de la clase EDocumento para
        'llenarla con los valores contenidos en los controles del Formulario
        Dim invoice As New EDocumento()
        invoice.Cliente = CStr(txtCliente.Text)
        invoice.Direccion = CStr(DireccionCliente)
        invoice.TipoIdentificacion = CStr(TipoDocumento)
        invoice.Documento = CStr(Documento)

        invoice.TipoDocumento = If(rbnBoleta.Checked = True, "BOLETA DE VENTA", "FACTURA")
        'invoice.Serie = CStr(lblSerie.Text)
        'invoice.NroCorrelativo = CStr(lblNroDocumento.Text)
        invoice.Igv = CDec(lblIgv.Text)
        invoice.SubTotal = CDec(lblSubTotal.Text)
        invoice.Total = CDec(lblTotal.Text)
        invoice.DescripcionMonto = CStr(descri.enletras(lblTotal.Text))

        'Recorremos las filas existentes actualmente en el control DataGridView
        'para asignar los datos a las propiedades
        Dim contador As Integer = 0
        For Each row As DataGridViewRow In DataGridView1.Rows
            contador += 1
            Dim article As New EArticulo()
            'Vamos tomando los valores de las celdas del row que estamos 
            'recorriendo actualmente y asignamos su valor a la propiedad de la clase intanciada
            article.Item = CInt(contador)
            article.Descripcion = CStr(row.Cells("Descripcion").Value)
            article.Precio = CStr(row.Cells("Precio").Value)
            article.Cantidad = CInt(row.Cells("Cantidad").Value)
            article.Igv = CDec(row.Cells("ColumnIgv").Value)
            article.SubTotal = CDec(row.Cells("ColumnSubTotal").Value)
            article.Total = CDec(row.Cells("Importe").Value)

            'Vamos agregando el Item a la lista del detalle
            invoice.Detalle.Add(article)
        Next

        'Creamos una instancia del Formulario que contiene nuestro ReportViewer
        Dim frm As New FrmDocumento()
        'Usamos las propiedades publicas del formulario, aqui es donde enviamos el valor
        'que se mostrara en los parametros creados en el LocalReport, para este ejemplo
        'estamos Seteando los valores directamente pero usted puede usar algun control
        frm.Titulo = "Recibo de pago"
        frm.Empresa = "Funeraria Alfa & Omega"
        frm.Direccion = "Enfrente Megasuper - Corredores Ciudad Neily"
        frm.Telefonos = "Teléfono: 27833753 / Celular: 87077545 "

        'Usamos el metod Add porque Invoice es una lista e invoice es una entidad simple
        frm.Invoice.Add(invoice)

        'Enviamos el detalle de la Factura, como Detail es una lista e invoide.Details tambien
        'es un lista del tipo EArticulo bastara con igualarla
        frm.Detail = invoice.Detalle
        frm.ShowDialog()
    End Sub

    Private Sub Listar_Ventas()
        Llenar_Grilla(V.Listar_Ventas())
    End Sub

    Private Sub Llenar_Grilla(ByVal dt As DataTable)
        Try
            dtgvListadoVentas.Rows.Clear()

            For i = 0 To dt.Rows.Count - 1
                dtgvListadoVentas.Rows.Add(dt.Rows(i)(0))
                dtgvListadoVentas.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                dtgvListadoVentas.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                dtgvListadoVentas.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                dtgvListadoVentas.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                dtgvListadoVentas.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                dtgvListadoVentas.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
                dtgvListadoVentas.Rows(i).Cells(6).Value = dt.Rows(i)(6).ToString()
                dtgvListadoVentas.Rows(i).Cells(7).Value = Format(dt.Rows(i)(7), "dd/MM/yyyy")
                dtgvListadoVentas.Rows(i).Cells(8).Value = Math.Round(dt.Rows(i)(8), 2)
                dtgvListadoVentas.Rows(i).Cells(9).Value = "Ver Información"
            Next
            Me.dtgvListadoVentas.ClearSelection()
            For Each row As DataGridViewRow In dtgvListadoVentas.Rows
                Dim button1 As DataGridViewButtonCell = CType(row.Cells(9), DataGridViewButtonCell)
                button1.Style.BackColor = Color.FromArgb(92, 184, 92)
                button1.Style.ForeColor = Color.White
                button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
            Next
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btnConsultar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConsultar.Click
        Try
            V.Fecha1 = CDate(dtpFechaInicial.Value)
            V.Fecha2 = CDate(dtpFechaFinal.Value)
            Llenar_Grilla(V.Listar_Ventas_porFecha())
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub dtgvListadoVentas_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvListadoVentas.CellDoubleClick

    End Sub

    Private Sub Listar_Detalle_Ventas()
        V.CodigoVenta = CInt(Me.dtgvListadoVentas.CurrentRow.Cells(0).Value)
        Llenar_Grilla_Detalle(V.Listar_Detalle_Ventas())
    End Sub

    Private Sub Llenar_Grilla_Detalle(ByVal dt As DataTable)
        Dim Total As Decimal = 0
        Dim SubTotal As Decimal = 0
        Dim Igv As Decimal = 0

        Dim dt2 As New DataTable

        Try
            Me.dtgvListadoDetalle.Rows.Clear()
            For i = 0 To dt.Rows.Count - 1
                dtgvListadoDetalle.Rows.Add(dt.Rows(i)(0))
                dtgvListadoDetalle.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                dtgvListadoDetalle.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                V.CodigoItem = CInt(dt.Rows(i)(0))
                dt2 = V.Listar_Detalle_Item_Venta()
                If (dt2.Rows.Count > 0) Then
                    dtgvListadoDetalle.Rows(i).Cells(2).Value = dt2.Rows(0)(0).ToString()
                    dtgvListadoDetalle.Rows(i).Cells(3).Value = dt2.Rows(0)(1).ToString()
                Else
                    dtgvListadoDetalle.Rows(i).Cells(2).Value = "-"
                    dtgvListadoDetalle.Rows(i).Cells(3).Value = "-"
                End If
                dtgvListadoDetalle.Rows(i).Cells(4).Value = Math.Round(dt.Rows(i)(2), 2)
                dtgvListadoDetalle.Rows(i).Cells(5).Value = dt.Rows(i)(3).ToString()
                dtgvListadoDetalle.Rows(i).Cells(6).Value = Math.Round(dt.Rows(i)(4), 2)
                dtgvListadoDetalle.Rows(i).Cells(7).Value = Math.Round(dt.Rows(i)(5), 2)
                dtgvListadoDetalle.Rows(i).Cells(8).Value = Math.Round(dt.Rows(i)(6), 2)
                Total += dt.Rows(i)(6)
            Next
            Me.dtgvListadoDetalle.ClearSelection()
            lblTotal2.Text = Math.Round(Total, 2)
            SubTotal = Total / 1.13
            lblSubTotal2.Text = Math.Round(SubTotal, 2)
            Igv = SubTotal * 0.13
            lblIgv2.Text = Math.Round(Igv, 2)
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub ckbConsultar_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ckbConsultar.CheckedChanged
        If (ckbConsultar.Checked = True) Then
            dtpFechaInicial.Enabled = True
            dtpFechaFinal.Enabled = True
            btnConsultar.Enabled = True
            dtgvListadoVentas.Rows.Clear()
            Me.dtgvListadoDetalle.Rows.Clear()
            lblIgv.Text = ""
            lblSubTotal.Text = ""
            lblTotal.Text = ""
        Else
            dtpFechaInicial.Enabled = False
            dtpFechaFinal.Enabled = False
            btnConsultar.Enabled = False
            Call Listar_Ventas()
        End If
    End Sub

    Private Sub dtgvListadoVentas_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvListadoVentas.CellContentClick
        If (Me.dtgvListadoVentas.Columns(e.ColumnIndex).Name.Equals("VerInformacion")) Then
            'Dim frm As New Frm009iii_VerInformacion()
            'frm.CodigoVenta = CInt(Me.dtgvListadoVentas.CurrentRow.Cells(0).Value)
            'frm.ShowDialog()
        End If
    End Sub

    Private Sub dtgvListadoVentas_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dtgvListadoVentas.CellClick
        If (Me.dtgvListadoVentas.Rows.Count > 0) Then
            Me.dtgvListadoVentas.Rows(Me.dtgvListadoVentas.CurrentRow.Index).Selected = True
            Me.dtgvListadoVentas.Rows(Me.dtgvListadoVentas.CurrentRow.Index).Selected = True
            Listar_Detalle_Ventas()
        End If
    End Sub

    Private Sub TabControl1_Selected(ByVal sender As System.Object, ByVal e As System.Windows.Forms.TabControlEventArgs) Handles TabControl1.Selected
        If (TabControl1.SelectedTab Is TabPage2) Then
            Listar_Ventas()
            'panelComprobante.Visible = False
        Else
            'panelComprobante.Visible = True
        End If
    End Sub

    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        If (keyData = Keys.Escape) Then
            Cerrar_Form()
            Return True
        End If
        Return MyBase.ProcessCmdKey(msg, keyData)
    End Function

    Private Sub Cerrar_Form()
        If (txt_plazo.Text.Trim = "" And txt_cuota.Text.Trim = "" And txtCliente.Text.Trim = "") Then
            Close()
        Else
            Dim fr As New Frm011_MensajedeConfirmación2
            fr.ShowDialog()
            If (Validar.Cerrar_form = 1) Then
                Close()
            End If
        End If
    End Sub

    Private Sub TabPage1_Click(sender As Object, e As EventArgs) Handles TabPage1.Click

    End Sub

    Private Sub GroupBox5_Enter(sender As Object, e As EventArgs) Handles GroupBox5.Enter

    End Sub

    Private Sub txt_cuota_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txt_cuota.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txtplazo_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txt_plazo.KeyPress
        Validar.Numeros(e)
    End Sub

    Private Sub txtplazo_TextChanged(sender As Object, e As EventArgs) Handles txt_plazo.TextChanged
        If (lblTotal.Text.Length > 3 And txt_plazo.Text <> "" And txt_plazo.Text <> "0") Then
            txt_cuota.Text = CDec(lblTotal.Text) / CDec(txt_plazo.Text)
        End If
    End Sub

    Private Sub lblTotal_TextChanged(sender As Object, e As EventArgs) Handles lblTotal.TextChanged
        If (lblTotal.Text.Length > 3 And txt_plazo.Text <> "" And txt_plazo.Text <> "0") Then
            txt_cuota.Text = CDec(lblTotal.Text) / CDec(txt_plazo.Text)
        End If
    End Sub

    Private Sub txtDatos_TextChanged(sender As Object, e As EventArgs) Handles txtDatos.TextChanged
        If (txtDatos.Text.Trim() <> "") Then
            Try
                V.datos = txtDatos.Text
                Listar_Creditos()
            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try
        Else

        End If
    End Sub
    Private Sub Listar_Creditos()
        Llenar_Grilla_credito(V.Listar_creditos())
    End Sub
    Private Sub Llenar_Grilla_credito(ByVal dt As DataTable)
        Try
            dgv_creditos.Rows.Clear()

            For i = 0 To dt.Rows.Count - 1
                dgv_creditos.Rows.Add(dt.Rows(i)(0))
                dgv_creditos.Rows(i).Cells(0).Value = dt.Rows(i)(0).ToString()
                dgv_creditos.Rows(i).Cells(1).Value = dt.Rows(i)(1).ToString()
                dgv_creditos.Rows(i).Cells(2).Value = dt.Rows(i)(2).ToString()
                dgv_creditos.Rows(i).Cells(3).Value = dt.Rows(i)(3).ToString()
                dgv_creditos.Rows(i).Cells(4).Value = dt.Rows(i)(4).ToString()
                dgv_creditos.Rows(i).Cells(5).Value = dt.Rows(i)(5).ToString()
                dgv_creditos.Rows(i).Cells(6).Value = dt.Rows(i)(6).ToString()
                dgv_creditos.Rows(i).Cells(7).Value = Format(dt.Rows(i)(7), "dd/MM/yyyy")
                dgv_creditos.Rows(i).Cells(8).Value = Math.Round(dt.Rows(i)(8), 2)
                dgv_creditos.Rows(i).Cells(9).Value = "Ver Información"
            Next
            Me.dgv_creditos.ClearSelection()
            For Each row As DataGridViewRow In dgv_creditos.Rows
                Dim button1 As DataGridViewButtonCell = CType(row.Cells(9), DataGridViewButtonCell)
                button1.Style.BackColor = Color.FromArgb(92, 184, 92)
                button1.Style.ForeColor = Color.White
                button1.Style.Font = New Font("Arial", 9, FontStyle.Bold)
            Next
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub txtDatos_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txtDatos.KeyPress
        If (Tipo_Dato = 0) Then
            Validar.Numeros(e)
        Else
            Validar.Letras(e)
        End If
    End Sub

    Private Sub rbnNombre_CheckedChanged(sender As Object, e As EventArgs) Handles rbnNombre.CheckedChanged
        Listar_Creditos()
        txtDatos.MaxLength = 256
        txtDatos.Clear()
        Tipo_Dato = 1
        txtDatos.Focus()

    End Sub

    Private Sub rbnNDoc_CheckedChanged(sender As Object, e As EventArgs) Handles rbnNDoc.CheckedChanged

        Listar_Creditos()
        txtDatos.MaxLength = 8
        txtDatos.Clear()
        Tipo_Dato = 0
        txtDatos.Focus()
    End Sub

    Private Sub dgv_creditos_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgv_creditos.CellContentClick
        Try

            If (Me.dgv_creditos.Columns(e.ColumnIndex).Name.Equals("Opción")) Then
                Dim frm As Frm009iiii_Listado_abonos_Ventas = New Frm009iiii_Listado_abonos_Ventas
                frm.V.CodigoVentass = dgv_creditos.CurrentRow.Cells(0).Value.ToString()
                frm.Show()
            Else
                CodigoVenta = dgv_creditos.CurrentRow.Cells(0).Value.ToString()
                tb_monto_abono.Text = dgv_creditos.CurrentRow.Cells(4).Value.ToString()
                lb_total.Text = dgv_creditos.CurrentRow.Cells(8).Value.ToString()
                lb_subtotal.Text = CDec(dgv_creditos.CurrentRow.Cells(8).Value.ToString()) / 1.13
                lb_iva.Text = (CDec(dgv_creditos.CurrentRow.Cells(8).Value.ToString()) / 1.13) * 0.13
                V.CodigoVentass = dgv_creditos.CurrentRow.Cells(0).Value.ToString()
                tb_monto_actual.Text = V.Devolver_monto_credito()
                selecionar_credito = True
            End If
        Catch ex As Exception
            clsMensaje.mostrar_mensaje(ex.Message, "error")
        End Try
    End Sub

    Private Sub btn_abonar_Click(sender As Object, e As EventArgs) Handles btn_abonar.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos") Then
            ErrorProvider1.Clear()

            If (tb_monto_abono.Text.Trim() = "") Then
                ErrorProvider1.SetError(tb_monto_abono, "Debe Ingresar el Monto del Abono")
            ElseIf (tb_monto_actual.Text.Trim() = "") Then
                ErrorProvider1.SetError(tb_monto_actual, "Debe Ingresar monto actual")
            ElseIf (tb_comprobante.Text.Trim() = "") Then
                ErrorProvider1.SetError(tb_comprobante, "Debe Ingresar Número de Comprobante")

            ElseIf (dgv_creditos.Rows.Count < 1) Then
                clsMensaje.mostrar_mensaje("No hay ningún Ítem agregado al carrito de Compra", "error")
            Else
                If (selecionar_credito) Then
                    Dim Mensaje As String = ""
                    Try
                        Dim resultado = 0
                        resultado = CDec(tb_monto_actual.Text) - CDec(tb_monto_abono.Text)
                        If (resultado >= 0) Then
                            V.MontoAbono = tb_monto_abono.Text
                            V.MontoActual = resultado
                            V.FechaAbono = CDate(tb_fecha.Text)
                            V.NComprobante = tb_comprobante.Text
                            Mensaje = V.Registrar_Abono()
                            clsMensaje.mostrar_mensaje(Mensaje, "ok")
                            tb_monto_actual.Text = V.Devolver_monto_credito()
                        Else
                            clsMensaje.mostrar_mensaje("el monto del abono supera el monto actual", "error")
                        End If

                    Catch ex As Exception
                        clsMensaje.mostrar_mensaje(ex.Message, "error")
                    End Try
                End If

            End If

        End If
    End Sub

    Private Sub chk_credito_CheckedChanged(sender As Object, e As EventArgs) Handles chk_credito.CheckedChanged
        If (chk_contado.Checked) Then
            chk_contado.Checked = False
        End If
        txt_cuota.Show()
        txt_plazo.Show()
        lb_plazo.Show()
        lb_cuota.Show()
    End Sub

    Private Sub chk_contado_CheckedChanged(sender As Object, e As EventArgs) Handles chk_contado.CheckedChanged
        If (chk_credito.Checked) Then
            chk_credito.Checked = False
        End If
        txt_cuota.Hide()
        txt_plazo.Hide()
        lb_plazo.Hide()
        lb_cuota.Hide()
    End Sub

    Private Sub TabPage2_Click(sender As Object, e As EventArgs) Handles TabPage2.Click

    End Sub

    Private Sub Panel_cabecera_Paint(sender As Object, e As PaintEventArgs) Handles Panel_cabecera.Paint

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs)
        GenerarDocumento()
    End Sub
End Class