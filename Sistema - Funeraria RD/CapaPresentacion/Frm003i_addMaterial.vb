Imports CapaLogicaNegocio
Public Class Frm003i_addMaterial
    Dim M As New clsMaterial

    Private Sub lkb_cerrar_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles lkb_cerrar.LinkClicked
        Close()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Close()
    End Sub

    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        ErrorProvider1.Clear()
        If (txtDescripcion.Text.Trim = "") Then
            ErrorProvider1.SetError(txtDescripcion, "Ingrese Descripción")
        Else

            Dim Mensaje As String = "" 'Variable para recuperar el mensaje del procedimiento almacenado de la BD

            Try 'Manejamos una excepción de errores

                M.Descripcion = txtDescripcion.Text
                Mensaje = M.Registrar_Material() 'Ejecutamos la función Registrar
                If (Mensaje = "Material Registrado Correctamente") Then 'Verificamos si se registró correctamente
                    Close()
                Else
                    clsMensaje.mostrar_mensaje(Mensaje, "error")
                End If

            Catch ex As Exception
                clsMensaje.mostrar_mensaje(ex.Message, "error")
            End Try

        End If
    End Sub

    Private Sub Frm003i_addMaterial_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class