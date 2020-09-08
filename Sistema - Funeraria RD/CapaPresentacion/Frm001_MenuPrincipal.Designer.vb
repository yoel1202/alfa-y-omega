<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm001_MenuPrincipal
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Frm001_MenuPrincipal))
        Me.Head = New System.Windows.Forms.Panel()
        Me.panel1 = New System.Windows.Forms.Panel()
        Me.lkb_cerrar = New System.Windows.Forms.LinkLabel()
        Me.lkb_min = New System.Windows.Forms.LinkLabel()
        Me.lblNombre_app = New System.Windows.Forms.Label()
        Me.ptbIcon = New System.Windows.Forms.PictureBox()
        Me.botonera_izq = New System.Windows.Forms.Panel()
        Me.btn8 = New System.Windows.Forms.Button()
        Me.btn7 = New System.Windows.Forms.Button()
        Me.btn6 = New System.Windows.Forms.Button()
        Me.btn5 = New System.Windows.Forms.Button()
        Me.btn4 = New System.Windows.Forms.Button()
        Me.btn3 = New System.Windows.Forms.Button()
        Me.btn2 = New System.Windows.Forms.Button()
        Me.btn1 = New System.Windows.Forms.Button()
        Me.barra_estado = New System.Windows.Forms.Panel()
        Me.lkbUsuario = New System.Windows.Forms.LinkLabel()
        Me.Head.SuspendLayout()
        Me.panel1.SuspendLayout()
        CType(Me.ptbIcon, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.botonera_izq.SuspendLayout()
        Me.barra_estado.SuspendLayout()
        Me.SuspendLayout()
        '
        'Head
        '
        Me.Head.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.Head.Controls.Add(Me.panel1)
        Me.Head.Controls.Add(Me.lblNombre_app)
        Me.Head.Controls.Add(Me.ptbIcon)
        Me.Head.Dock = System.Windows.Forms.DockStyle.Top
        Me.Head.Location = New System.Drawing.Point(0, 0)
        Me.Head.Name = "Head"
        Me.Head.Size = New System.Drawing.Size(1000, 50)
        Me.Head.TabIndex = 3
        '
        'panel1
        '
        Me.panel1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.panel1.BackColor = System.Drawing.Color.Transparent
        Me.panel1.Controls.Add(Me.lkb_cerrar)
        Me.panel1.Controls.Add(Me.lkb_min)
        Me.panel1.Location = New System.Drawing.Point(932, 0)
        Me.panel1.Name = "panel1"
        Me.panel1.Size = New System.Drawing.Size(68, 30)
        Me.panel1.TabIndex = 3
        '
        'lkb_cerrar
        '
        Me.lkb_cerrar.ActiveLinkColor = System.Drawing.Color.DarkRed
        Me.lkb_cerrar.AutoSize = True
        Me.lkb_cerrar.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkb_cerrar.LinkBehavior = System.Windows.Forms.LinkBehavior.NeverUnderline
        Me.lkb_cerrar.LinkColor = System.Drawing.Color.White
        Me.lkb_cerrar.Location = New System.Drawing.Point(40, 5)
        Me.lkb_cerrar.Name = "lkb_cerrar"
        Me.lkb_cerrar.Size = New System.Drawing.Size(20, 24)
        Me.lkb_cerrar.TabIndex = 1
        Me.lkb_cerrar.TabStop = True
        Me.lkb_cerrar.Text = "x"
        '
        'lkb_min
        '
        Me.lkb_min.ActiveLinkColor = System.Drawing.Color.Gainsboro
        Me.lkb_min.AutoSize = True
        Me.lkb_min.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkb_min.LinkColor = System.Drawing.Color.White
        Me.lkb_min.Location = New System.Drawing.Point(15, 4)
        Me.lkb_min.Name = "lkb_min"
        Me.lkb_min.Size = New System.Drawing.Size(17, 18)
        Me.lkb_min.TabIndex = 0
        Me.lkb_min.TabStop = True
        Me.lkb_min.Text = "_"
        '
        'lblNombre_app
        '
        Me.lblNombre_app.AutoSize = True
        Me.lblNombre_app.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblNombre_app.ForeColor = System.Drawing.Color.White
        Me.lblNombre_app.Location = New System.Drawing.Point(374, 13)
        Me.lblNombre_app.Name = "lblNombre_app"
        Me.lblNombre_app.Size = New System.Drawing.Size(204, 24)
        Me.lblNombre_app.TabIndex = 1
        Me.lblNombre_app.Text = "Sistema para Funeraria"
        '
        'ptbIcon
        '
        Me.ptbIcon.BackColor = System.Drawing.Color.Transparent
        Me.ptbIcon.Image = Global.CapaPresentacion.My.Resources.Resources.app_icon
        Me.ptbIcon.Location = New System.Drawing.Point(12, 4)
        Me.ptbIcon.Name = "ptbIcon"
        Me.ptbIcon.Size = New System.Drawing.Size(40, 40)
        Me.ptbIcon.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.ptbIcon.TabIndex = 0
        Me.ptbIcon.TabStop = False
        '
        'botonera_izq
        '
        Me.botonera_izq.BackColor = System.Drawing.Color.FromArgb(CType(CType(103, Byte), Integer), CType(CType(103, Byte), Integer), CType(CType(103, Byte), Integer))
        Me.botonera_izq.Controls.Add(Me.btn8)
        Me.botonera_izq.Controls.Add(Me.btn7)
        Me.botonera_izq.Controls.Add(Me.btn6)
        Me.botonera_izq.Controls.Add(Me.btn5)
        Me.botonera_izq.Controls.Add(Me.btn4)
        Me.botonera_izq.Controls.Add(Me.btn3)
        Me.botonera_izq.Controls.Add(Me.btn2)
        Me.botonera_izq.Controls.Add(Me.btn1)
        Me.botonera_izq.Dock = System.Windows.Forms.DockStyle.Left
        Me.botonera_izq.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.botonera_izq.ForeColor = System.Drawing.SystemColors.Window
        Me.botonera_izq.Location = New System.Drawing.Point(0, 50)
        Me.botonera_izq.Name = "botonera_izq"
        Me.botonera_izq.Size = New System.Drawing.Size(105, 738)
        Me.botonera_izq.TabIndex = 4
        '
        'btn8
        '
        Me.btn8.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn8.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn8.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn8.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Ventas
        Me.btn8.Location = New System.Drawing.Point(0, 525)
        Me.btn8.Name = "btn8"
        Me.btn8.Size = New System.Drawing.Size(105, 75)
        Me.btn8.TabIndex = 12
        Me.btn8.Text = "Ventas"
        Me.btn8.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn8.UseVisualStyleBackColor = True
        '
        'btn7
        '
        Me.btn7.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn7.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn7.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn7.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Compras
        Me.btn7.Location = New System.Drawing.Point(0, 450)
        Me.btn7.Name = "btn7"
        Me.btn7.Size = New System.Drawing.Size(105, 75)
        Me.btn7.TabIndex = 11
        Me.btn7.Text = "Compras"
        Me.btn7.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn7.UseVisualStyleBackColor = True
        '
        'btn6
        '
        Me.btn6.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn6.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn6.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn6.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Proveedores
        Me.btn6.Location = New System.Drawing.Point(0, 375)
        Me.btn6.Name = "btn6"
        Me.btn6.Size = New System.Drawing.Size(105, 75)
        Me.btn6.TabIndex = 10
        Me.btn6.Text = "Proveedores"
        Me.btn6.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn6.UseVisualStyleBackColor = True
        '
        'btn5
        '
        Me.btn5.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn5.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn5.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn5.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Difuntos
        Me.btn5.Location = New System.Drawing.Point(0, 300)
        Me.btn5.Name = "btn5"
        Me.btn5.Size = New System.Drawing.Size(105, 75)
        Me.btn5.TabIndex = 9
        Me.btn5.Text = "Difuntos"
        Me.btn5.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn5.UseVisualStyleBackColor = True
        '
        'btn4
        '
        Me.btn4.BackColor = System.Drawing.Color.FromArgb(CType(CType(103, Byte), Integer), CType(CType(103, Byte), Integer), CType(CType(103, Byte), Integer))
        Me.btn4.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn4.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn4.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn4.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Clientes
        Me.btn4.Location = New System.Drawing.Point(0, 225)
        Me.btn4.Name = "btn4"
        Me.btn4.Size = New System.Drawing.Size(105, 75)
        Me.btn4.TabIndex = 8
        Me.btn4.Text = "Clientes"
        Me.btn4.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn4.UseVisualStyleBackColor = False
        '
        'btn3
        '
        Me.btn3.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn3.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn3.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn3.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Planes
        Me.btn3.ImageAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btn3.Location = New System.Drawing.Point(0, 150)
        Me.btn3.Name = "btn3"
        Me.btn3.Size = New System.Drawing.Size(105, 75)
        Me.btn3.TabIndex = 7
        Me.btn3.Text = "Planes Funerarios"
        Me.btn3.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn3.UseVisualStyleBackColor = True
        '
        'btn2
        '
        Me.btn2.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn2.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn2.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Productos
        Me.btn2.ImageAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btn2.Location = New System.Drawing.Point(0, 75)
        Me.btn2.Name = "btn2"
        Me.btn2.Size = New System.Drawing.Size(105, 75)
        Me.btn2.TabIndex = 5
        Me.btn2.Text = "Productos | Servicios"
        Me.btn2.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn2.UseVisualStyleBackColor = True
        '
        'btn1
        '
        Me.btn1.BackColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(122, Byte), Integer), CType(CType(204, Byte), Integer))
        Me.btn1.Dock = System.Windows.Forms.DockStyle.Top
        Me.btn1.FlatAppearance.BorderColor = System.Drawing.Color.White
        Me.btn1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn1.Image = Global.CapaPresentacion.My.Resources.Resources.ic_Personal
        Me.btn1.Location = New System.Drawing.Point(0, 0)
        Me.btn1.Name = "btn1"
        Me.btn1.Size = New System.Drawing.Size(105, 75)
        Me.btn1.TabIndex = 4
        Me.btn1.Text = "Personal"
        Me.btn1.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btn1.UseVisualStyleBackColor = False
        '
        'barra_estado
        '
        Me.barra_estado.BackColor = System.Drawing.Color.FromArgb(CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer), CType(CType(77, Byte), Integer))
        Me.barra_estado.Controls.Add(Me.lkbUsuario)
        Me.barra_estado.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.barra_estado.Location = New System.Drawing.Point(105, 748)
        Me.barra_estado.Name = "barra_estado"
        Me.barra_estado.Size = New System.Drawing.Size(895, 40)
        Me.barra_estado.TabIndex = 5
        '
        'lkbUsuario
        '
        Me.lkbUsuario.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lkbUsuario.AutoSize = True
        Me.lkbUsuario.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lkbUsuario.LinkColor = System.Drawing.Color.White
        Me.lkbUsuario.Location = New System.Drawing.Point(700, 16)
        Me.lkbUsuario.Name = "lkbUsuario"
        Me.lkbUsuario.Size = New System.Drawing.Size(92, 15)
        Me.lkbUsuario.TabIndex = 0
        Me.lkbUsuario.TabStop = True
        Me.lkbUsuario.Text = "Usuario Actual: "
        '
        'Frm001_MenuPrincipal
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImage = Global.CapaPresentacion.My.Resources.Resources.fondo_principal
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1000, 788)
        Me.Controls.Add(Me.barra_estado)
        Me.Controls.Add(Me.botonera_izq)
        Me.Controls.Add(Me.Head)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.IsMdiContainer = True
        Me.Name = "Frm001_MenuPrincipal"
        Me.Text = "FrmMenuPrincipal"
        Me.Head.ResumeLayout(False)
        Me.Head.PerformLayout()
        Me.panel1.ResumeLayout(False)
        Me.panel1.PerformLayout()
        CType(Me.ptbIcon, System.ComponentModel.ISupportInitialize).EndInit()
        Me.botonera_izq.ResumeLayout(False)
        Me.barra_estado.ResumeLayout(False)
        Me.barra_estado.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Private WithEvents Head As System.Windows.Forms.Panel
    Private WithEvents panel1 As System.Windows.Forms.Panel
    Private WithEvents lkb_cerrar As System.Windows.Forms.LinkLabel
    Private WithEvents lkb_min As System.Windows.Forms.LinkLabel
    Private WithEvents lblNombre_app As System.Windows.Forms.Label
    Private WithEvents ptbIcon As System.Windows.Forms.PictureBox
    Private WithEvents botonera_izq As System.Windows.Forms.Panel
    Private WithEvents btn8 As System.Windows.Forms.Button
    Private WithEvents btn7 As System.Windows.Forms.Button
    Private WithEvents btn6 As System.Windows.Forms.Button
    Private WithEvents btn5 As System.Windows.Forms.Button
    Private WithEvents btn4 As System.Windows.Forms.Button
    Private WithEvents btn3 As System.Windows.Forms.Button
    Private WithEvents btn2 As System.Windows.Forms.Button
    Private WithEvents btn1 As System.Windows.Forms.Button
    Private WithEvents barra_estado As System.Windows.Forms.Panel
    Private WithEvents lkbUsuario As System.Windows.Forms.LinkLabel
End Class
