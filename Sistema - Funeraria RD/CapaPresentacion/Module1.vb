Module Module1
    Public lst As New List(Of EDetalleItem)

    Public Function Generar_Nombre()
        Dim nombre_pdf As String = Now.ToString()
        nombre_pdf = nombre_pdf.Replace(":", "")
        nombre_pdf = nombre_pdf.Replace(".", "")
        nombre_pdf = nombre_pdf.Replace("/", "")
        nombre_pdf = nombre_pdf.Replace("am", "")
        nombre_pdf = nombre_pdf.Replace("pm", "")
        nombre_pdf = nombre_pdf.Replace(" ", "") + ".pdf"
        Return nombre_pdf
    End Function
End Module
