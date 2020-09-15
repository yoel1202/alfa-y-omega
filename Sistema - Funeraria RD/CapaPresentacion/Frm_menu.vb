Imports CapaLogicaNegocio

Public Class Frm_menu
    Public paso As Boolean = True
    Public pasar As Boolean = True
    Dim U As New clsUsuario 'Instanciamos la clase clsUsuario de la Capa Logica de Negocio para usar sus funciones
    'Private Sub comprobar_focus(ByVal valor As Integer)
    '    Select Case (valor)
    '        Case 1
    '            pintar_buttons()
    '            pn_personal.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 2
    '            pintar_buttons()
    '            btn2.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 3
    '            pintar_buttons()
    '            btn3.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 4
    '            pintar_buttons()
    '            btn4.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 5
    '            pintar_buttons()
    '            btn5.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 6
    '            pintar_buttons()
    '            btn6.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 7
    '            pintar_buttons()
    '            btn7.BackColor = Color.FromArgb(0, 122, 204)
    '        Case 8
    '            pintar_buttons()
    '            btn8.BackColor = Color.FromArgb(0, 122, 204)

    '    End Select

    'End Sub
    'Private Sub pintar_buttons()
    '    btn1.BackColor = Color.FromArgb(103, 103, 103)
    '    btn2.BackColor = Color.FromArgb(103, 103, 103)
    '    btn3.BackColor = Color.FromArgb(103, 103, 103)
    '    btn4.BackColor = Color.FromArgb(103, 103, 103)
    '    btn5.BackColor = Color.FromArgb(103, 103, 103)
    '    btn6.BackColor = Color.FromArgb(103, 103, 103)
    '    btn7.BackColor = Color.FromArgb(103, 103, 103)
    '    btn8.BackColor = Color.FromArgb(103, 103, 103)
    'End Sub
    Private Sub Panel1_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub pn_personal(sender As Object, e As EventArgs) Handles Panel1.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "personal"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then
            If (Frm00_Login.FormActive = 0) Then
                'comprobar_focus(1)
                Dim myForm As Frm002_PersonalPrincipal = New Frm002_PersonalPrincipal()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()

                pn_principal.Show()

            End If
        Else
            clsMensaje.mostrar_mensaje("Solo el administrador tiene acceso a esta Opción", "error")
        End If

    End Sub

    Private Sub PictureBox3_Click(sender As Object, e As EventArgs) Handles PictureBox3.Click
        Application.Exit()


    End Sub

    Private Sub Frm_menu_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Timer2.Start()
        PictureBox1.SetBounds(Screen.PrimaryScreen.Bounds.Width - 150, 15, PictureBox1.Width, PictureBox1.Height)
        PictureBox2.SetBounds(0, Screen.PrimaryScreen.Bounds.Height - 70, PictureBox2.Width, PictureBox2.Height)
        PictureBox3.SetBounds(Screen.PrimaryScreen.Bounds.Width - 60, 15, PictureBox3.Width, PictureBox3.Height)
        PictureBox4.SetBounds(10, 30, PictureBox4.Width, PictureBox4.Height)
        PictureBox5.SetBounds(Me.Width - 200, Me.Height - 170, PictureBox5.Width + 20, PictureBox5.Height + 20)
        Label1.SetBounds(100, 30, Label1.Width, Label1.Height)
        Label2.SetBounds(Screen.PrimaryScreen.Bounds.Width - 290, PictureBox1.Height - 20, Label2.Width, Label2.Height)
        Label3.SetBounds(Screen.PrimaryScreen.Bounds.Width - 250, PictureBox1.Height - 20, Label3.Width, Label3.Height)
        Label11.SetBounds(Me.Width - 245, Me.Height - 120, Label11.Width, Label11.Height)
        Label12.SetBounds(Screen.PrimaryScreen.Bounds.Width - 60, PictureBox3.Height + 15, Label12.Width, Label12.Height)
        Label4.SetBounds(Screen.PrimaryScreen.Bounds.Width - 220, PictureBox1.Height, Label4.Width, Label4.Height)


        pn_principal.SetBounds(PictureBox4.Width + 50, PictureBox4.Height + 40, Panel1.Width + Pn_planes.Width + pn_clientes.Width + 600, pn_difuntos.Height + Panel1.Height + 100)
        Panel1.SetBounds(PictureBox4.Width + 50, PictureBox4.Height + 40, Panel1.Width, Panel1.Height)

        pn_productos.SetBounds(Panel1.Width + 200, PictureBox4.Height + 40, pn_productos.Width, pn_productos.Height)
        Pn_planes.SetBounds(pn_productos.Width + 500, PictureBox4.Height + 40, Pn_planes.Width, Pn_planes.Height)
        pn_clientes.SetBounds(pn_productos.Width + 800, PictureBox4.Height + 40, Pn_planes.Width, Pn_planes.Height)
        pn_difuntos.SetBounds(PictureBox4.Width + 50, Panel1.Height + 200, pn_difuntos.Width, pn_difuntos.Height)
        pn_provedor.SetBounds(pn_difuntos.Width + 200, Panel1.Height + 200, pn_provedor.Width, pn_provedor.Height)
        pn_configuracion.SetBounds(pn_provedor.Width + 500, Panel1.Height + 200, pn_provedor.Width, pn_provedor.Height)
        Panel3.SetBounds(pn_provedor.Width + 800, Panel1.Height + 200, pn_provedor.Width, pn_provedor.Height)
        pn_principal.Hide()


        Timer1.Start()
        'Dim ds As DataSet = conexion.sqlconsulta("Select id_empleado,nombre,apellido,cedula,telefono,foto from tbl_empleados INNER JOIN tbl_usuarios on id_empleado=fk_empleado where id_usuario='" + ID.ToString() + "'")
        'Label2.Text = ds.Tables(0).Rows(0).Item(1).ToString()
        'Label3.Text = ds.Tables(0).Rows(0).Item(2).ToString()

        'Try
        '    PictureBox1.BackgroundImage = Image.FromFile(ds.Tables(0).Rows(0).Item(5).ToString())
        '    PictureBox1.BackgroundImageLayout = ImageLayout.Stretch
        'Catch ex As Exception
        '    PictureBox1.BackgroundImage = Image.FromFile("perfiles\profile.png")
        '    PictureBox1.BackgroundImageLayout = ImageLayout.Stretch
        'End Try


        'Dim busqueda = New StreamReader("configuracion.cfg")

        'Dim cadena
        'cadena = busqueda.ReadLine
        'Do While (Not cadena Is Nothing)
        '    Dim campos As String() = cadena.Split(":")
        '    If campos(0).Equals("Fondo") Then
        '        Me.BackgroundImage = Image.FromFile("fondo/" + campos(1))
        '        Me.BackgroundImageLayout = ImageLayout.Stretch
        '    End If
        '    cadena = busqueda.ReadLine
        'Loop


        'busqueda.Close()
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        If pn_principal.Visible = True Then
            pn_principal.Controls.RemoveAt(0)

            pn_principal.Hide()
            If pasar = True Then
                Panel1.Show()
                pn_productos.Show()
                Pn_planes.Show()
                pn_difuntos.Show()
                pn_provedor.Show()
                pn_configuracion.Show()
            Else
                Panel1.Show()
                pn_difuntos.Show()
            End If
            paso = False

        End If

        If paso = True Then

            If pasar = True Then
                Panel1.Hide()
                pn_productos.Hide()
                Pn_planes.Hide()
                pn_difuntos.Hide()
                pn_provedor.Hide()
                pn_configuracion.Hide()

            Else
                Panel1.Hide()
                pn_difuntos.Hide()
            End If
            paso = False
        Else
            If pasar = True Then
                Panel1.Show()
                pn_productos.Show()
                Pn_planes.Show()
                pn_difuntos.Show()
                pn_provedor.Show()
                pn_configuracion.Show()
            Else
                Panel1.Show()
                pn_difuntos.Show()
            End If

            paso = True


        End If
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Label11.Text = DateTime.Now.ToLongDateString()
        Label12.Text = DateTime.Now.ToLongTimeString()
    End Sub

    Private Sub pn_empleados_Click(sender As Object, e As EventArgs) Handles pn_productos.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "producto"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then
            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm003_ProductosyServicios = New Frm003_ProductosyServicios()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()

                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub Pn_pagos_Click(sender As Object, e As EventArgs) Handles Pn_planes.Click

        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "plan"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then

            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm004_PlanesFunerarios = New Frm004_PlanesFunerarios()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub Panel2_Click(sender As Object, e As EventArgs) Handles pn_clientes.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "producto"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "cliente") Then
            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm005_Cliente = New Frm005_Cliente()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub Panel4_Click(sender As Object, e As EventArgs) Handles pn_difuntos.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "difunto"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then
            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm006_Difunto = New Frm006_Difunto()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub Panel5_Click(sender As Object, e As EventArgs) Handles pn_provedor.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "producto"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "provedor") Then
            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm007_Proveedor = New Frm007_Proveedor()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub pn_configuracion_Click(sender As Object, e As EventArgs) Handles pn_configuracion.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "compra"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then
            If (Frm00_Login.FormActive = 0) Then

                Dim myForm As Frm008_Compras = New Frm008_Compras()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub Panel3_Click(sender As Object, e As EventArgs) Handles Panel3.Click
        U.CodigoPersona = CStr(Codigo_Personal_Online)
        U.tipo = "venta"
        Dim permiso As String = U.Devolver_permisos()

        If (permiso = "Todos" Or permiso = "Visualizar") Then
            If (Frm00_Login.FormActive = 0) Then


                Dim myForm As Frm009_Ventas = New Frm009_Ventas()

                myForm.TopLevel = False
                myForm.AutoScroll = True
                pn_principal.Controls.Add(myForm)
                myForm.Show()
                pn_principal.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("no cuenta con permisos tiene acceso a esta Opción", "error")
        End If
    End Sub
End Class