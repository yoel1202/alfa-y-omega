<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm008iiii_Listado_Abonos_Compras
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
        Me.dgv_abonos = New System.Windows.Forms.DataGridView()
        Me.Panel_cabecera = New System.Windows.Forms.Panel()
        Me.panel1 = New System.Windows.Forms.Panel()
        Me.lkb_cerrar = New System.Windows.Forms.LinkLabel()
        Me.lkb_min = New System.Windows.Forms.LinkLabel()
        Me.lblTitulo = New System.Windows.Forms.Label()
        Me.bordeDerecha = New System.Windows.Forms.Panel()
        Me.bordeIzquierda = New System.Windows.Forms.Panel()
        Me.bordeInferior = New System.Windows.Forms.Panel()
        Me.Codigo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Descripcion = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Precio = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Comprobante = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Fecha = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.dgv_abonos, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel_cabecera.SuspendLayout()
        Me.panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'dgv_abonos
        '
        Me.dgv_abonos.AllowUserToAddRows = False
        Me.dgv_abonos.AllowUserToDeleteRows = False
        Me.dgv_abonos.BackgroundColor = System.Drawing.SystemColors.Window
        Me.dgv_abonos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_abonos.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Codigo, Me.Descripcion, Me.Precio, Me.Comprobante, Me.Fecha})
        Me.dgv_abonos.Location = New System.Drawing.Point(28, 60)
        Me.dgv_abonos.Name = "dgv_abonos"
        Me.dgv_abonos.ReadOnly = True
        Me.dgv_abonos.Size = New System.Drawing.Size(611, 221)
        Me.dgv_abonos.TabIndex = 266
        '
        'Panel_cabecera
        '
        Me.Panel_cabecera.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.Panel_cabecera.Controls.Add(Me.panel1)
        Me.Panel_cabecera.Controls.Add(Me.lblTitulo)
        Me.Panel_cabecera.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel_cabecera.Location = New System.Drawing.Point(2, 0)
        Me.Panel_cabecera.Name = "Panel_cabecera"
        Me.Panel_cabecera.Size = New System.Drawing.Size(659, 31)
        Me.Panel_cabecera.TabIndex = 267
        '
        'panel1
        '
        Me.panel1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.panel1.BackColor = System.Drawing.Color.Transparent
        Me.panel1.Controls.Add(Me.lkb_cerrar)
        Me.panel1.Controls.Add(Me.lkb_min)
        Me.panel1.Location = New System.Drawing.Point(592, 0)
        Me.panel1.Name = "panel1"
        Me.panel1.Size = New System.Drawing.Size(68, 30)
        Me.panel1.TabIndex = 206
        '
        'lkb_cerrar
        '
        Me.lkb_cerrar.ActiveLinkColor = System.Drawing.Color.DarkRed
        Me.lkb_cerrar.AutoSize = True
        Me.lkb_cerrar.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkb_cerrar.LinkBehavior = System.Windows.Forms.LinkBehavior.NeverUnderline
        Me.lkb_cerrar.LinkColor = System.Drawing.Color.White
        Me.lkb_cerrar.Location = New System.Drawing.Point(39, 5)
        Me.lkb_cerrar.Name = "lkb_cerrar"
        Me.lkb_cerrar.Size = New System.Drawing.Size(15, 18)
        Me.lkb_cerrar.TabIndex = 1
        Me.lkb_cerrar.TabStop = True
        Me.lkb_cerrar.Text = "x"
        '
        'lkb_min
        '
        Me.lkb_min.ActiveLinkColor = System.Drawing.Color.Gainsboro
        Me.lkb_min.AutoSize = True
        Me.lkb_min.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkb_min.LinkBehavior = System.Windows.Forms.LinkBehavior.NeverUnderline
        Me.lkb_min.LinkColor = System.Drawing.Color.White
        Me.lkb_min.Location = New System.Drawing.Point(13, 7)
        Me.lkb_min.Name = "lkb_min"
        Me.lkb_min.Size = New System.Drawing.Size(17, 18)
        Me.lkb_min.TabIndex = 0
        Me.lkb_min.TabStop = True
        Me.lkb_min.Text = "+"
        '
        'lblTitulo
        '
        Me.lblTitulo.AutoSize = True
        Me.lblTitulo.Font = New System.Drawing.Font("Arial", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTitulo.ForeColor = System.Drawing.SystemColors.Window
        Me.lblTitulo.Location = New System.Drawing.Point(13, 9)
        Me.lblTitulo.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblTitulo.Name = "lblTitulo"
        Me.lblTitulo.Size = New System.Drawing.Size(110, 15)
        Me.lblTitulo.TabIndex = 205
        Me.lblTitulo.Text = "Listado de abonos"
        '
        'bordeDerecha
        '
        Me.bordeDerecha.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.bordeDerecha.Dock = System.Windows.Forms.DockStyle.Right
        Me.bordeDerecha.Location = New System.Drawing.Point(661, 0)
        Me.bordeDerecha.Name = "bordeDerecha"
        Me.bordeDerecha.Size = New System.Drawing.Size(2, 306)
        Me.bordeDerecha.TabIndex = 270
        '
        'bordeIzquierda
        '
        Me.bordeIzquierda.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.bordeIzquierda.Dock = System.Windows.Forms.DockStyle.Left
        Me.bordeIzquierda.Location = New System.Drawing.Point(0, 0)
        Me.bordeIzquierda.Name = "bordeIzquierda"
        Me.bordeIzquierda.Size = New System.Drawing.Size(2, 306)
        Me.bordeIzquierda.TabIndex = 269
        '
        'bordeInferior
        '
        Me.bordeInferior.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.bordeInferior.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.bordeInferior.Location = New System.Drawing.Point(0, 306)
        Me.bordeInferior.Name = "bordeInferior"
        Me.bordeInferior.Size = New System.Drawing.Size(663, 2)
        Me.bordeInferior.TabIndex = 268
        '
        'Codigo
        '
        Me.Codigo.HeaderText = "Codigo"
        Me.Codigo.Name = "Codigo"
        Me.Codigo.ReadOnly = True
        Me.Codigo.Visible = False
        '
        'Descripcion
        '
        Me.Descripcion.FillWeight = 40.0!
        Me.Descripcion.HeaderText = "Monto del Abono"
        Me.Descripcion.Name = "Descripcion"
        Me.Descripcion.ReadOnly = True
        Me.Descripcion.Width = 150
        '
        'Precio
        '
        Me.Precio.HeaderText = "Monto Actual"
        Me.Precio.Name = "Precio"
        Me.Precio.ReadOnly = True
        Me.Precio.Width = 150
        '
        'Comprobante
        '
        Me.Comprobante.HeaderText = "Nº Comprobante"
        Me.Comprobante.Name = "Comprobante"
        Me.Comprobante.ReadOnly = True
        Me.Comprobante.Width = 120
        '
        'Fecha
        '
        Me.Fecha.HeaderText = "Fecha"
        Me.Fecha.Name = "Fecha"
        Me.Fecha.ReadOnly = True
        Me.Fecha.Width = 150
        '
        'Frm008iiii_Listado_Abonos_Compras
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoSize = True
        Me.ClientSize = New System.Drawing.Size(663, 308)
        Me.Controls.Add(Me.dgv_abonos)
        Me.Controls.Add(Me.Panel_cabecera)
        Me.Controls.Add(Me.bordeDerecha)
        Me.Controls.Add(Me.bordeIzquierda)
        Me.Controls.Add(Me.bordeInferior)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Name = "Frm008iiii_Listado_Abonos_Compras"
        Me.Text = "Frm008iiii_Listado_Abonos_Compras"
        CType(Me.dgv_abonos, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel_cabecera.ResumeLayout(False)
        Me.Panel_cabecera.PerformLayout()
        Me.panel1.ResumeLayout(False)
        Me.panel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents dgv_abonos As DataGridView
    Private WithEvents Panel_cabecera As Panel
    Private WithEvents panel1 As Panel
    Private WithEvents lkb_cerrar As LinkLabel
    Private WithEvents lkb_min As LinkLabel
    Private WithEvents lblTitulo As Label
    Private WithEvents bordeDerecha As Panel
    Private WithEvents bordeIzquierda As Panel
    Private WithEvents bordeInferior As Panel
    Friend WithEvents Codigo As DataGridViewTextBoxColumn
    Friend WithEvents Descripcion As DataGridViewTextBoxColumn
    Friend WithEvents Precio As DataGridViewTextBoxColumn
    Friend WithEvents Comprobante As DataGridViewTextBoxColumn
    Friend WithEvents Fecha As DataGridViewTextBoxColumn
End Class
