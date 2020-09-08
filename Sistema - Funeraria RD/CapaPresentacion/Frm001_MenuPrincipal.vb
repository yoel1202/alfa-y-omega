Public Class Frm001_MenuPrincipal

    Private Sub FrmMenuPrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Maximizar_Form()
        lblNombre_app.Location = New Point((Screen.PrimaryScreen.Bounds.Width - lblNombre_app.Width) / 2, (lblNombre_app.Location.Y))
        'lkbUsuario.Text = lkbUsuario.Text & Frm00_Login.usuario_online
        lkbUsuario.Text = lkbUsuario.Text & Validar.usuario_online
    End Sub

    Private Sub lkb_min_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_min.LinkClicked
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Frm011_MensajedeConfirmación.ShowDialog()
    End Sub

    Private Sub Maximizar_Form()
        If (Me.Width = Screen.PrimaryScreen.Bounds.Width And Me.Height = Screen.PrimaryScreen.Bounds.Height - 40) Then
            Me.Size = New Size(1000, 810)
            Me.Location = New Point((Screen.PrimaryScreen.Bounds.Width - Me.Width) / 2, (Screen.PrimaryScreen.Bounds.Height - Me.Height) / 2)
        Else
            Me.Size = New Size(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height - 40)
            Me.Location = New Point()
        End If
    End Sub

    Private Sub btn1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn1.Click
        If (usuario_online = "administrador") Then
            If (Frm00_Login.FormActive = 0) Then
                comprobar_focus(1)
                Dim frm As New Frm002_PersonalPrincipal()
                frm.MdiParent = Me
                frm.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("Solo el administrador tiene acceso a esta Opción", "error")
        End If

    End Sub

    Private Sub btn2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn2.Click


        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(2)
            Dim frm As New Frm003_ProductosyServicios()
            frm.MdiParent = Me
            frm.Show()
        End If
        
    End Sub

    Private Sub btn3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn3.Click
        If (usuario_online = "administrador") Then
            If (Frm00_Login.FormActive = 0) Then
                comprobar_focus(3)
                Dim frm As New Frm004_PlanesFunerarios()
                frm.MdiParent = Me
                frm.Show()
            End If
        Else
            clsMensaje.mostrar_mensaje("Solo el administrador tiene acceso a esta Opción", "error")
        End If
    End Sub

    Private Sub btn4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn4.Click
        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(4)
            Dim frm As New Frm005_Cliente()
            frm.MdiParent = Me
            frm.Show()
        End If
    End Sub

    Private Sub btn5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn5.Click
        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(5)
            Dim frm As New Frm006_Difunto()
            frm.MdiParent = Me
            frm.Show()
        End If
    End Sub

    Private Sub btn6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn6.Click
        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(6)
            Dim frm As New Frm007_Proveedor()
            frm.MdiParent = Me
            frm.Show()
        End If
    End Sub

    Private Sub btn7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn7.Click
        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(7)
            Dim frm As New Frm008_Compras()
            frm.MdiParent = Me
            frm.Show()
        End If
    End Sub

    Private Sub btn8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn8.Click
        If (Frm00_Login.FormActive = 0) Then
            comprobar_focus(8)
            Dim frm As New Frm009_Ventas()
            frm.MdiParent = Me
            frm.Show()
        End If
    End Sub

    Private Sub comprobar_focus(ByVal valor As Integer)
        Select Case (valor)
            Case 1
                pintar_buttons()
                btn1.BackColor = Color.FromArgb(0, 122, 204)
            Case 2
                pintar_buttons()
                btn2.BackColor = Color.FromArgb(0, 122, 204)
            Case 3
                pintar_buttons()
                btn3.BackColor = Color.FromArgb(0, 122, 204)
            Case 4
                pintar_buttons()
                btn4.BackColor = Color.FromArgb(0, 122, 204)
            Case 5
                pintar_buttons()
                btn5.BackColor = Color.FromArgb(0, 122, 204)
            Case 6
                pintar_buttons()
                btn6.BackColor = Color.FromArgb(0, 122, 204)
            Case 7
                pintar_buttons()
                btn7.BackColor = Color.FromArgb(0, 122, 204)
            Case 8
                pintar_buttons()
                btn8.BackColor = Color.FromArgb(0, 122, 204)

        End Select

    End Sub

    Private Sub pintar_buttons()
        btn1.BackColor = Color.FromArgb(103, 103, 103)
        btn2.BackColor = Color.FromArgb(103, 103, 103)
        btn3.BackColor = Color.FromArgb(103, 103, 103)
        btn4.BackColor = Color.FromArgb(103, 103, 103)
        btn5.BackColor = Color.FromArgb(103, 103, 103)
        btn6.BackColor = Color.FromArgb(103, 103, 103)
        btn7.BackColor = Color.FromArgb(103, 103, 103)
        btn8.BackColor = Color.FromArgb(103, 103, 103)
    End Sub

    Private Sub pictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ptbIcon.Click
        'comprobar_focus(7)
        'Dim frm As New frmPl()
        'frm.MdiParent = Me
        'frm.Show()
    End Sub

    Private Sub lkbUsuario_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkbUsuario.LinkClicked
        clsMensaje.mostrar_mensaje(Validar.Codigo_Personal_Online & " " & Validar.usuario_online, "ok")
    End Sub

End Class