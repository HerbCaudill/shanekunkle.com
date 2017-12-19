<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Sender.aspx.vb" Inherits="Sender" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShaneKunkle.com | software, sports and more software</title>
    <link rel="stylesheet" type="text/css" href="css/Main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server" EnablePartialRendering="true" />
        <AjaxToolkit:RoundedCornersExtender ID="rce" runat="server" TargetControlID="RoundedCorndersPanel" Radius="30" Corners="All" />
        <div class="ContentWrapper">
            <asp:Panel runat="server" ID="RoundedCorndersPanel" Style="background-color: White;">
                <div class="Content" runat="server" id="ContentPanel">
                    <div class="LeftImageHeader">
                        <a href="Default.aspx"><img src="images/logo100.gif" style="border:none;" alt="shanekunkle.com: home" /></a>
                    </div>
                    <h1>Send a file to me</h1>    
                    <p>Simply select the file and then press the <em>send button</em> - <strong>Note:</strong> most uploads will take a good bit of time so please be patient!</p>
                    <asp:fileupload id="FileUpload" runat="server" class="FormField" />
                    <p><asp:LinkButton runat="server" ID="SendButton" Text="Upload File" /></p>
                    <asp:Label runat="server" ID="ErrorLabel" CssClass="Error" />
                    <div id="UploadProgress" class="Hidden">
                        <img src="images/spinner.tiny.2.gif" />
                        Uploading...
                    </div>
                    <asp:Panel runat="server" ID="SuccessPanel" Visible="false" CssClass="MessageBox">
                        <h3>File received successfully</h3>
                        <p>The file was uploaded successfully and a notification has been sent.  If you would like to upload another file simply repeat the steps above again.  Thanks!</p>
                    </asp:Panel>
                </div>
            </asp:Panel>
        </div>
        <script type="text/javascript">
            uploadFile = function() {
                // Show progress
                var uploadProgress = $get("UploadProgress");
                Sys.UI.DomElement.removeCssClass(uploadProgress, "Hidden");    
                Sys.UI.DomElement.addCssClass(uploadProgress, "Visible");    
            }

            var uploadButton = $get('<%=SendButton.ClientID %>');
            $addHandler(uploadButton, "click", uploadFile);
        </script>
    </form>
</body>
</html>
