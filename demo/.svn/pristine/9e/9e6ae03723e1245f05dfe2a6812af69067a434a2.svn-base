<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostFileSubmit.aspx.cs" Inherits="Ctl.PostFileSubmit" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script>
    function getReturnPK()
    {
        return window.document.all("hiddenImgPK").value;
    }
    function OnPreview()
    {
        var url = window.document.all("FileInput").value;
        if(url != "")
        {
            parent.window.document.all("imgPreview").src = url;
        }
        else
        {
            parent.window.document.all("imgPreview").src = "";
        }
    }
   
    </script>
</head>
<body  bgcolor="#33cc66" >
    <form id="photoUpload" enctype="multipart/form-data" method="post" runat="server">
      <INPUT id="FileInput" style="visibility:visible; width:300px" type="file"  name="FileInput" runat="server" onpropertychange="OnPreview()" >
      &nbsp;&nbsp;<input id="btnUpload" type="button" value="Upload" />
      <input  type=hidden id="hiddenImgPK" name="hiddenImgPK" runat="server" />
      <input  type=hidden id="hiddenTableName" name="hiddenTableName" runat="server" />
      <input  type=hidden id="hiddenMaster_pk" name="hiddenMaster_pk" runat="server" />
      <input  type=hidden id="hiddenProcedure" name="hiddenProcedure" runat="server" />
      <input  type=hidden id="hiddenFilePath" name="hiddenFilePath" runat="server" />
    </form>
  </body>
</html>
