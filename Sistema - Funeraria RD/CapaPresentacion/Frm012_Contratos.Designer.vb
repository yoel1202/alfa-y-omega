<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm012_Contratos
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim DataGridViewCellStyle4 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle5 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle6 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Frm012_Contratos))
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.btnRegistrar = New System.Windows.Forms.Button()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.Label20 = New System.Windows.Forms.Label()
        Me.txt_vendedor = New System.Windows.Forms.TextBox()
        Me.lk_buscarpersonal = New System.Windows.Forms.LinkLabel()
        Me.txt_monto = New System.Windows.Forms.TextBox()
        Me.Label19 = New System.Windows.Forms.Label()
        Me.txt_fecha_cobro = New System.Windows.Forms.TextBox()
        Me.Label18 = New System.Windows.Forms.Label()
        Me.txt_lugar = New System.Windows.Forms.TextBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.pb_contrato = New System.Windows.Forms.PictureBox()
        Me.rtxt_obserbaciones = New System.Windows.Forms.RichTextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.chk_university = New System.Windows.Forms.CheckBox()
        Me.chk_alfa = New System.Windows.Forms.CheckBox()
        Me.txtNroDocumento = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtCliente = New System.Windows.Forms.TextBox()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.lkbBuscar = New System.Windows.Forms.LinkLabel()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.txtplazo = New System.Windows.Forms.TextBox()
        Me.txt_cuota = New System.Windows.Forms.TextBox()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.dtpFechacontrato = New System.Windows.Forms.DateTimePicker()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Dgv_contratos = New System.Windows.Forms.DataGridView()
        Me.Column1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.client = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Vendedor = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Numero = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.condicion = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Monto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Plazo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cuota = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Zona = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.lugar = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Fechac = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Observacion = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.fecha = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Imagen = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Estado = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Eliminar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.Editar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.CodigoClient = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigoPer = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.txtDatos = New System.Windows.Forms.TextBox()
        Me.rbnNDoc = New System.Windows.Forms.RadioButton()
        Me.rbnNombre = New System.Windows.Forms.RadioButton()
        Me.Panel_cabecera = New System.Windows.Forms.Panel()
        Me.lkbCerrar = New System.Windows.Forms.Label()
        Me.lblTitulo = New System.Windows.Forms.Label()
        Me.ptbIcon = New System.Windows.Forms.PictureBox()
        Me.ErrorProvider1 = New System.Windows.Forms.ErrorProvider(Me.components)
        Me.cb_zona = New System.Windows.Forms.ComboBox()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        CType(Me.pb_contrato, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        CType(Me.Dgv_contratos, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.Panel_cabecera.SuspendLayout()
        CType(Me.ptbIcon, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl1.Location = New System.Drawing.Point(0, 40)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(985, 570)
        Me.TabControl1.TabIndex = 256
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.btnRegistrar)
        Me.TabPage1.Controls.Add(Me.GroupBox5)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(977, 544)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Realizar Contratos"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'btnRegistrar
        '
        Me.btnRegistrar.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(122, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.btnRegistrar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnRegistrar.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnRegistrar.ForeColor = System.Drawing.SystemColors.Window
        Me.btnRegistrar.Location = New System.Drawing.Point(40, 362)
        Me.btnRegistrar.Name = "btnRegistrar"
        Me.btnRegistrar.Size = New System.Drawing.Size(146, 45)
        Me.btnRegistrar.TabIndex = 0
        Me.btnRegistrar.Text = "Registrar"
        Me.btnRegistrar.UseVisualStyleBackColor = False
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.cb_zona)
        Me.GroupBox5.Controls.Add(Me.Label20)
        Me.GroupBox5.Controls.Add(Me.txt_vendedor)
        Me.GroupBox5.Controls.Add(Me.lk_buscarpersonal)
        Me.GroupBox5.Controls.Add(Me.txt_monto)
        Me.GroupBox5.Controls.Add(Me.Label19)
        Me.GroupBox5.Controls.Add(Me.txt_fecha_cobro)
        Me.GroupBox5.Controls.Add(Me.Label18)
        Me.GroupBox5.Controls.Add(Me.txt_lugar)
        Me.GroupBox5.Controls.Add(Me.Label8)
        Me.GroupBox5.Controls.Add(Me.Label5)
        Me.GroupBox5.Controls.Add(Me.pb_contrato)
        Me.GroupBox5.Controls.Add(Me.rtxt_obserbaciones)
        Me.GroupBox5.Controls.Add(Me.Label3)
        Me.GroupBox5.Controls.Add(Me.Label4)
        Me.GroupBox5.Controls.Add(Me.chk_university)
        Me.GroupBox5.Controls.Add(Me.chk_alfa)
        Me.GroupBox5.Controls.Add(Me.txtNroDocumento)
        Me.GroupBox5.Controls.Add(Me.Label2)
        Me.GroupBox5.Controls.Add(Me.Label1)
        Me.GroupBox5.Controls.Add(Me.txtCliente)
        Me.GroupBox5.Controls.Add(Me.Label14)
        Me.GroupBox5.Controls.Add(Me.lkbBuscar)
        Me.GroupBox5.Controls.Add(Me.Label15)
        Me.GroupBox5.Controls.Add(Me.txtplazo)
        Me.GroupBox5.Controls.Add(Me.txt_cuota)
        Me.GroupBox5.Controls.Add(Me.Label16)
        Me.GroupBox5.Controls.Add(Me.dtpFechacontrato)
        Me.GroupBox5.Controls.Add(Me.Label17)
        Me.GroupBox5.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox5.Location = New System.Drawing.Point(40, 12)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(887, 344)
        Me.GroupBox5.TabIndex = 0
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Información de Contratos"
        '
        'Label20
        '
        Me.Label20.AutoSize = True
        Me.Label20.Location = New System.Drawing.Point(487, 58)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(63, 15)
        Me.Label20.TabIndex = 293
        Me.Label20.Text = "Vendedor:"
        '
        'txt_vendedor
        '
        Me.txt_vendedor.BackColor = System.Drawing.SystemColors.Window
        Me.txt_vendedor.Location = New System.Drawing.Point(556, 56)
        Me.txt_vendedor.Name = "txt_vendedor"
        Me.txt_vendedor.ReadOnly = True
        Me.txt_vendedor.Size = New System.Drawing.Size(252, 21)
        Me.txt_vendedor.TabIndex = 294
        '
        'lk_buscarpersonal
        '
        Me.lk_buscarpersonal.AutoSize = True
        Me.lk_buscarpersonal.Location = New System.Drawing.Point(827, 59)
        Me.lk_buscarpersonal.Name = "lk_buscarpersonal"
        Me.lk_buscarpersonal.Size = New System.Drawing.Size(45, 15)
        Me.lk_buscarpersonal.TabIndex = 295
        Me.lk_buscarpersonal.TabStop = True
        Me.lk_buscarpersonal.Text = "Buscar"
        '
        'txt_monto
        '
        Me.txt_monto.Location = New System.Drawing.Point(148, 72)
        Me.txt_monto.MaxLength = 400
        Me.txt_monto.Name = "txt_monto"
        Me.txt_monto.Size = New System.Drawing.Size(112, 21)
        Me.txt_monto.TabIndex = 291
        '
        'Label19
        '
        Me.Label19.AutoSize = True
        Me.Label19.Location = New System.Drawing.Point(49, 77)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(45, 15)
        Me.Label19.TabIndex = 292
        Me.Label19.Text = "Monto:"
        '
        'txt_fecha_cobro
        '
        Me.txt_fecha_cobro.Location = New System.Drawing.Point(358, 107)
        Me.txt_fecha_cobro.Name = "txt_fecha_cobro"
        Me.txt_fecha_cobro.Size = New System.Drawing.Size(71, 21)
        Me.txt_fecha_cobro.TabIndex = 289
        '
        'Label18
        '
        Me.Label18.AutoSize = True
        Me.Label18.Location = New System.Drawing.Point(265, 108)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(95, 15)
        Me.Label18.TabIndex = 290
        Me.Label18.Text = "Fecha de cobro:"
        '
        'txt_lugar
        '
        Me.txt_lugar.Location = New System.Drawing.Point(148, 136)
        Me.txt_lugar.Name = "txt_lugar"
        Me.txt_lugar.Size = New System.Drawing.Size(294, 21)
        Me.txt_lugar.TabIndex = 287
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(6, 142)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(93, 15)
        Me.Label8.TabIndex = 288
        Me.Label8.Text = "Lugar de cobro:"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(478, 123)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(59, 15)
        Me.Label5.TabIndex = 286
        Me.Label5.Text = " Contrato:"
        '
        'pb_contrato
        '
        Me.pb_contrato.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.pb_contrato.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.pb_contrato.Location = New System.Drawing.Point(556, 123)
        Me.pb_contrato.Margin = New System.Windows.Forms.Padding(2)
        Me.pb_contrato.Name = "pb_contrato"
        Me.pb_contrato.Size = New System.Drawing.Size(249, 158)
        Me.pb_contrato.TabIndex = 285
        Me.pb_contrato.TabStop = False
        '
        'rtxt_obserbaciones
        '
        Me.rtxt_obserbaciones.Location = New System.Drawing.Point(126, 221)
        Me.rtxt_obserbaciones.Margin = New System.Windows.Forms.Padding(2)
        Me.rtxt_obserbaciones.MaxLength = 500
        Me.rtxt_obserbaciones.Name = "rtxt_obserbaciones"
        Me.rtxt_obserbaciones.Size = New System.Drawing.Size(316, 96)
        Me.rtxt_obserbaciones.TabIndex = 284
        Me.rtxt_obserbaciones.Text = ""
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(18, 236)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(78, 15)
        Me.Label3.TabIndex = 283
        Me.Label3.Text = "Observacion:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(58, 173)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(38, 15)
        Me.Label4.TabIndex = 282
        Me.Label4.Text = "Zona:"
        '
        'chk_university
        '
        Me.chk_university.AutoSize = True
        Me.chk_university.Location = New System.Drawing.Point(318, 17)
        Me.chk_university.Margin = New System.Windows.Forms.Padding(2)
        Me.chk_university.Name = "chk_university"
        Me.chk_university.Size = New System.Drawing.Size(78, 19)
        Me.chk_university.TabIndex = 280
        Me.chk_university.Text = "University"
        Me.chk_university.UseVisualStyleBackColor = True
        '
        'chk_alfa
        '
        Me.chk_alfa.AutoSize = True
        Me.chk_alfa.Location = New System.Drawing.Point(155, 20)
        Me.chk_alfa.Margin = New System.Windows.Forms.Padding(2)
        Me.chk_alfa.Name = "chk_alfa"
        Me.chk_alfa.Size = New System.Drawing.Size(46, 19)
        Me.chk_alfa.TabIndex = 279
        Me.chk_alfa.Text = "Alfa"
        Me.chk_alfa.UseVisualStyleBackColor = True
        '
        'txtNroDocumento
        '
        Me.txtNroDocumento.Location = New System.Drawing.Point(558, 83)
        Me.txtNroDocumento.MaxLength = 7
        Me.txtNroDocumento.Name = "txtNroDocumento"
        Me.txtNroDocumento.Size = New System.Drawing.Size(250, 21)
        Me.txtNroDocumento.TabIndex = 278
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(487, 87)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(73, 15)
        Me.Label2.TabIndex = 277
        Me.Label2.Text = "N° Contrato:"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(487, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(48, 15)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Cliente:"
        '
        'txtCliente
        '
        Me.txtCliente.BackColor = System.Drawing.SystemColors.Window
        Me.txtCliente.Location = New System.Drawing.Point(556, 30)
        Me.txtCliente.Name = "txtCliente"
        Me.txtCliente.ReadOnly = True
        Me.txtCliente.Size = New System.Drawing.Size(252, 21)
        Me.txtCliente.TabIndex = 5
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(0, 20)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(100, 15)
        Me.Label14.TabIndex = 267
        Me.Label14.Text = "Tipo de Contrato:"
        '
        'lkbBuscar
        '
        Me.lkbBuscar.AutoSize = True
        Me.lkbBuscar.Location = New System.Drawing.Point(827, 33)
        Me.lkbBuscar.Name = "lkbBuscar"
        Me.lkbBuscar.Size = New System.Drawing.Size(45, 15)
        Me.lkbBuscar.TabIndex = 7
        Me.lkbBuscar.TabStop = True
        Me.lkbBuscar.Text = "Buscar"
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(280, 77)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(41, 15)
        Me.Label15.TabIndex = 268
        Me.Label15.Text = "Plazo:"
        '
        'txtplazo
        '
        Me.txtplazo.Location = New System.Drawing.Point(327, 75)
        Me.txtplazo.MaxLength = 300
        Me.txtplazo.Name = "txtplazo"
        Me.txtplazo.Size = New System.Drawing.Size(115, 21)
        Me.txtplazo.TabIndex = 1
        '
        'txt_cuota
        '
        Me.txt_cuota.Location = New System.Drawing.Point(148, 106)
        Me.txt_cuota.Name = "txt_cuota"
        Me.txt_cuota.Size = New System.Drawing.Size(112, 21)
        Me.txt_cuota.TabIndex = 2
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Location = New System.Drawing.Point(51, 110)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(42, 15)
        Me.Label16.TabIndex = 270
        Me.Label16.Text = "Cuota:"
        '
        'dtpFechacontrato
        '
        Me.dtpFechacontrato.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtpFechacontrato.Location = New System.Drawing.Point(148, 44)
        Me.dtpFechacontrato.Name = "dtpFechacontrato"
        Me.dtpFechacontrato.Size = New System.Drawing.Size(294, 21)
        Me.dtpFechacontrato.TabIndex = 3
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.Location = New System.Drawing.Point(49, 46)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(47, 15)
        Me.Label17.TabIndex = 271
        Me.Label17.Text = "Fecha :"
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.Dgv_contratos)
        Me.TabPage2.Controls.Add(Me.GroupBox1)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(977, 544)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Listado de Contratos"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Dgv_contratos
        '
        Me.Dgv_contratos.AllowUserToAddRows = False
        Me.Dgv_contratos.BackgroundColor = System.Drawing.SystemColors.Window
        Me.Dgv_contratos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Dgv_contratos.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.client, Me.Vendedor, Me.Numero, Me.condicion, Me.Monto, Me.Plazo, Me.cuota, Me.Zona, Me.lugar, Me.Fechac, Me.Observacion, Me.fecha, Me.Imagen, Me.Estado, Me.Eliminar, Me.Editar, Me.CodigoClient, Me.CodigoPer})
        Me.Dgv_contratos.Location = New System.Drawing.Point(34, 91)
        Me.Dgv_contratos.Name = "Dgv_contratos"
        Me.Dgv_contratos.RowHeadersWidth = 51
        Me.Dgv_contratos.Size = New System.Drawing.Size(913, 323)
        Me.Dgv_contratos.TabIndex = 55
        '
        'Column1
        '
        Me.Column1.HeaderText = "CodigoContrato"
        Me.Column1.MinimumWidth = 6
        Me.Column1.Name = "Column1"
        Me.Column1.ReadOnly = True
        Me.Column1.Visible = False
        Me.Column1.Width = 125
        '
        'client
        '
        Me.client.HeaderText = "Cliente"
        Me.client.Name = "client"
        '
        'Vendedor
        '
        Me.Vendedor.HeaderText = "Vendedor"
        Me.Vendedor.Name = "Vendedor"
        '
        'Numero
        '
        Me.Numero.HeaderText = "Numero de Contrato"
        Me.Numero.MinimumWidth = 6
        Me.Numero.Name = "Numero"
        Me.Numero.Width = 125
        '
        'condicion
        '
        Me.condicion.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
        Me.condicion.HeaderText = "Tipo Contrato"
        Me.condicion.MinimumWidth = 6
        Me.condicion.Name = "condicion"
        Me.condicion.ReadOnly = True
        Me.condicion.Width = 88
        '
        'Monto
        '
        DataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter
        Me.Monto.DefaultCellStyle = DataGridViewCellStyle4
        Me.Monto.HeaderText = "Monto"
        Me.Monto.MinimumWidth = 6
        Me.Monto.Name = "Monto"
        Me.Monto.ReadOnly = True
        Me.Monto.Width = 70
        '
        'Plazo
        '
        Me.Plazo.HeaderText = "Plazo"
        Me.Plazo.Name = "Plazo"
        '
        'cuota
        '
        DataGridViewCellStyle5.Format = "C2"
        DataGridViewCellStyle5.NullValue = Nothing
        Me.cuota.DefaultCellStyle = DataGridViewCellStyle5
        Me.cuota.HeaderText = "Cuota"
        Me.cuota.MinimumWidth = 6
        Me.cuota.Name = "cuota"
        Me.cuota.ReadOnly = True
        Me.cuota.Width = 125
        '
        'Zona
        '
        DataGridViewCellStyle6.Format = "C2"
        DataGridViewCellStyle6.NullValue = Nothing
        Me.Zona.DefaultCellStyle = DataGridViewCellStyle6
        Me.Zona.HeaderText = "Zona"
        Me.Zona.MinimumWidth = 6
        Me.Zona.Name = "Zona"
        Me.Zona.ReadOnly = True
        Me.Zona.Width = 125
        '
        'lugar
        '
        Me.lugar.HeaderText = "Lugar de cobro"
        Me.lugar.MinimumWidth = 6
        Me.lugar.Name = "lugar"
        Me.lugar.Width = 125
        '
        'Fechac
        '
        Me.Fechac.HeaderText = "Fecha de cobro"
        Me.Fechac.MinimumWidth = 6
        Me.Fechac.Name = "Fechac"
        Me.Fechac.Width = 125
        '
        'Observacion
        '
        Me.Observacion.HeaderText = "Observacion"
        Me.Observacion.MinimumWidth = 6
        Me.Observacion.Name = "Observacion"
        Me.Observacion.Width = 125
        '
        'fecha
        '
        Me.fecha.HeaderText = "Fecha"
        Me.fecha.MinimumWidth = 6
        Me.fecha.Name = "fecha"
        Me.fecha.ReadOnly = True
        Me.fecha.Width = 125
        '
        'Imagen
        '
        Me.Imagen.HeaderText = "Imagen"
        Me.Imagen.MinimumWidth = 6
        Me.Imagen.Name = "Imagen"
        Me.Imagen.Width = 125
        '
        'Estado
        '
        Me.Estado.HeaderText = "Estado"
        Me.Estado.Name = "Estado"
        '
        'Eliminar
        '
        Me.Eliminar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Eliminar.HeaderText = "Opción"
        Me.Eliminar.MinimumWidth = 6
        Me.Eliminar.Name = "Eliminar"
        Me.Eliminar.ReadOnly = True
        Me.Eliminar.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.Eliminar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.Eliminar.Width = 90
        '
        'Editar
        '
        Me.Editar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Editar.HeaderText = "Editar"
        Me.Editar.Name = "Editar"
        '
        'CodigoClient
        '
        Me.CodigoClient.HeaderText = "CodigoCliente"
        Me.CodigoClient.Name = "CodigoClient"
        Me.CodigoClient.Visible = False
        '
        'CodigoPer
        '
        Me.CodigoPer.HeaderText = "CodigoPersonal"
        Me.CodigoPer.Name = "CodigoPer"
        Me.CodigoPer.Visible = False
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.txtDatos)
        Me.GroupBox1.Controls.Add(Me.rbnNDoc)
        Me.GroupBox1.Controls.Add(Me.rbnNombre)
        Me.GroupBox1.Location = New System.Drawing.Point(35, 10)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(858, 75)
        Me.GroupBox1.TabIndex = 56
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Consultar"
        '
        'txtDatos
        '
        Me.txtDatos.Location = New System.Drawing.Point(19, 40)
        Me.txtDatos.Name = "txtDatos"
        Me.txtDatos.Size = New System.Drawing.Size(610, 20)
        Me.txtDatos.TabIndex = 3
        '
        'rbnNDoc
        '
        Me.rbnNDoc.AutoSize = True
        Me.rbnNDoc.Checked = True
        Me.rbnNDoc.Location = New System.Drawing.Point(44, 16)
        Me.rbnNDoc.Name = "rbnNDoc"
        Me.rbnNDoc.Size = New System.Drawing.Size(128, 17)
        Me.rbnNDoc.TabIndex = 4
        Me.rbnNDoc.TabStop = True
        Me.rbnNDoc.Text = "Número Identificacion"
        Me.rbnNDoc.UseVisualStyleBackColor = True
        '
        'rbnNombre
        '
        Me.rbnNombre.AutoSize = True
        Me.rbnNombre.Location = New System.Drawing.Point(228, 15)
        Me.rbnNombre.Name = "rbnNombre"
        Me.rbnNombre.Size = New System.Drawing.Size(115, 17)
        Me.rbnNombre.TabIndex = 5
        Me.rbnNombre.Text = "Nombre / Apellidos"
        Me.rbnNombre.UseVisualStyleBackColor = True
        '
        'Panel_cabecera
        '
        Me.Panel_cabecera.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.Panel_cabecera.Controls.Add(Me.lkbCerrar)
        Me.Panel_cabecera.Controls.Add(Me.lblTitulo)
        Me.Panel_cabecera.Controls.Add(Me.ptbIcon)
        Me.Panel_cabecera.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel_cabecera.Location = New System.Drawing.Point(0, 0)
        Me.Panel_cabecera.Name = "Panel_cabecera"
        Me.Panel_cabecera.Size = New System.Drawing.Size(985, 40)
        Me.Panel_cabecera.TabIndex = 257
        '
        'lkbCerrar
        '
        Me.lkbCerrar.BackColor = System.Drawing.Color.Transparent
        Me.lkbCerrar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.lkbCerrar.Dock = System.Windows.Forms.DockStyle.Right
        Me.lkbCerrar.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkbCerrar.ForeColor = System.Drawing.SystemColors.Window
        Me.lkbCerrar.Location = New System.Drawing.Point(954, 0)
        Me.lkbCerrar.Name = "lkbCerrar"
        Me.lkbCerrar.Size = New System.Drawing.Size(31, 40)
        Me.lkbCerrar.TabIndex = 206
        Me.lkbCerrar.Text = "X"
        Me.lkbCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'lblTitulo
        '
        Me.lblTitulo.AutoSize = True
        Me.lblTitulo.Font = New System.Drawing.Font("Arial", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTitulo.ForeColor = System.Drawing.SystemColors.Window
        Me.lblTitulo.Location = New System.Drawing.Point(44, 10)
        Me.lblTitulo.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblTitulo.Name = "lblTitulo"
        Me.lblTitulo.Size = New System.Drawing.Size(72, 17)
        Me.lblTitulo.TabIndex = 205
        Me.lblTitulo.Text = "Contratos"
        '
        'ptbIcon
        '
        Me.ptbIcon.Image = CType(resources.GetObject("ptbIcon.Image"), System.Drawing.Image)
        Me.ptbIcon.Location = New System.Drawing.Point(11, 4)
        Me.ptbIcon.Name = "ptbIcon"
        Me.ptbIcon.Size = New System.Drawing.Size(25, 26)
        Me.ptbIcon.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.ptbIcon.TabIndex = 162
        Me.ptbIcon.TabStop = False
        '
        'ErrorProvider1
        '
        Me.ErrorProvider1.ContainerControl = Me
        '
        'cb_zona
        '
        Me.cb_zona.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest
        Me.cb_zona.FormattingEnabled = True
        Me.cb_zona.Items.AddRange(New Object() {"01 C Neily y alrededores", "02 Las Fincas, Cotos", "03 Abrojo,Canoas y alrededores", "04 La cuesta Y lugares Aledaños", "05 Golfito desde Puente 24 al Ferry y Golfo Centro", "06 Desde Puente Caracol hasta Pte Km 31 y Rio Claro", "07 Desde Km 40 Hasta Sierpe y Palmar Sur", "08 Palmar Norte y Cortes y Lugares Aledaños", "09 San Vito de Coto Brus", "10 Clientes que pagan en oficina de Ciudad Neily", "11 Clientes que pagan en Oficina San Vito", "15 Laurel y alrededores ctes pago de palma(Palmeros)", "16 Desde Chacarita hasta Pto Jimenez y Drake"})
        Me.cb_zona.Location = New System.Drawing.Point(145, 173)
        Me.cb_zona.Name = "cb_zona"
        Me.cb_zona.Size = New System.Drawing.Size(215, 23)
        Me.cb_zona.TabIndex = 296
        '
        'Frm012_Contratos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.Window
        Me.ClientSize = New System.Drawing.Size(985, 610)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.Panel_cabecera)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Margin = New System.Windows.Forms.Padding(2)
        Me.Name = "Frm012_Contratos"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Frm012_Contratos"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox5.PerformLayout()
        CType(Me.pb_contrato, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        CType(Me.Dgv_contratos, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.Panel_cabecera.ResumeLayout(False)
        Me.Panel_cabecera.PerformLayout()
        CType(Me.ptbIcon, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents TabControl1 As TabControl
    Friend WithEvents TabPage1 As TabPage
    Friend WithEvents GroupBox5 As GroupBox
    Friend WithEvents chk_university As CheckBox
    Friend WithEvents chk_alfa As CheckBox
    Friend WithEvents txtNroDocumento As TextBox
    Friend WithEvents Label2 As Label
    Friend WithEvents Label1 As Label
    Friend WithEvents txtCliente As TextBox
    Friend WithEvents Label14 As Label
    Friend WithEvents lkbBuscar As LinkLabel
    Friend WithEvents Label15 As Label
    Friend WithEvents txtplazo As TextBox
    Friend WithEvents txt_cuota As TextBox
    Friend WithEvents Label16 As Label
    Friend WithEvents dtpFechacontrato As DateTimePicker
    Friend WithEvents Label17 As Label
    Friend WithEvents btnRegistrar As Button
    Friend WithEvents TabPage2 As TabPage
    Friend WithEvents GroupBox1 As GroupBox
    Private WithEvents Panel_cabecera As Panel
    Private WithEvents lkbCerrar As Label
    Private WithEvents lblTitulo As Label
    Private WithEvents ptbIcon As PictureBox
    Friend WithEvents Label5 As Label
    Friend WithEvents pb_contrato As PictureBox
    Friend WithEvents rtxt_obserbaciones As RichTextBox
    Friend WithEvents Label3 As Label
    Friend WithEvents Label4 As Label
    Friend WithEvents txt_monto As TextBox
    Friend WithEvents Label19 As Label
    Friend WithEvents txt_fecha_cobro As TextBox
    Friend WithEvents Label18 As Label
    Friend WithEvents txt_lugar As TextBox
    Friend WithEvents Label8 As Label
    Friend WithEvents Label20 As Label
    Friend WithEvents txt_vendedor As TextBox
    Friend WithEvents lk_buscarpersonal As LinkLabel
    Friend WithEvents Dgv_contratos As DataGridView
    Friend WithEvents ErrorProvider1 As ErrorProvider
    Friend WithEvents txtDatos As TextBox
    Friend WithEvents rbnNDoc As RadioButton
    Friend WithEvents rbnNombre As RadioButton
    Friend WithEvents Column1 As DataGridViewTextBoxColumn
    Friend WithEvents client As DataGridViewTextBoxColumn
    Friend WithEvents Vendedor As DataGridViewTextBoxColumn
    Friend WithEvents Numero As DataGridViewTextBoxColumn
    Friend WithEvents condicion As DataGridViewTextBoxColumn
    Friend WithEvents Monto As DataGridViewTextBoxColumn
    Friend WithEvents Plazo As DataGridViewTextBoxColumn
    Friend WithEvents cuota As DataGridViewTextBoxColumn
    Friend WithEvents Zona As DataGridViewTextBoxColumn
    Friend WithEvents lugar As DataGridViewTextBoxColumn
    Friend WithEvents Fechac As DataGridViewTextBoxColumn
    Friend WithEvents Observacion As DataGridViewTextBoxColumn
    Friend WithEvents fecha As DataGridViewTextBoxColumn
    Friend WithEvents Imagen As DataGridViewTextBoxColumn
    Friend WithEvents Estado As DataGridViewTextBoxColumn
    Friend WithEvents Eliminar As DataGridViewButtonColumn
    Friend WithEvents Editar As DataGridViewButtonColumn
    Friend WithEvents CodigoClient As DataGridViewTextBoxColumn
    Friend WithEvents CodigoPer As DataGridViewTextBoxColumn
    Friend WithEvents cb_zona As ComboBox
End Class
