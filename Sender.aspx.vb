
Partial Class Sender
    Inherits System.Web.UI.Page

    Protected Sub SendButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SendButton.Click
        If FileUpload.HasFile = True AndAlso FileUpload.FileName IsNot Nothing AndAlso Len(FileUpload.FileName) > 0 Then
            ErrorLabel.Text = ""
            'Dim FileNamePath As String = String.Format("C:\Users\Shane Kunkle\Documents\Visual Studio 2008\WebSites\Shaneykakes\uploadedfiles\{0}", FileUpload.FileName)
            Dim FileNamePath As String = String.Format("C:\Inetpub\WWWroot\shaneykakes\uploadedfiles\{0}", FileUpload.FileName)
            FileUpload.SaveAs(FileNamePath)
            SuccessPanel.Visible = True
            SendNewFileNotification(FileNamePath)
        Else
            ErrorLabel.Text = "Please select a file"
            SuccessPanel.Visible = False
        End If
    End Sub

    Private Sub SendNewFileNotification(ByVal FileName As String)
        Dim objMailMessage As New aspNetEmail.EmailMessage
        objMailMessage.ValidateAddress = False
        Dim Subject As String = "New file uploaded shanekunkle.com"
        Dim Body As String = String.Format("Notice of new file upload: {0}", FileName)
        Dim FromAddress As String = "DoNotReply@FanFoc.us"
        Dim ToAddress As String = "shane@caudillweb.com"
        With objMailMessage
            .ClearMimeBodyParts()
            .ContentTransferEncoding = aspNetEmail.MailEncoding.QuotedPrintable
            .CharSet = "utf-8"
            .Subject = Subject
            .IgnoreRecipientErrors = True
            .FromAddress = FromAddress
            .To = ToAddress
            ' Create message body
            ' Text-only or HTML-only email
            .Body = Body
            .BodyFormat = aspNetEmail.MailFormat.Text
            ' SMTP server is defined in web.config
            .Server = "localhost"
            objMailMessage.Port = 25
        End With
        objMailMessage.Send()
    End Sub
End Class
