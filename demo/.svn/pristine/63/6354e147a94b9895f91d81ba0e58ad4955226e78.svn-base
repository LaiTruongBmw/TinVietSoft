<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReadExcelSubmit.aspx.cs" Inherits="Ctl.ReadExcelSubmit" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script>
    function getReturnPK()
    {
        return window.document.all("hiddenRecord").value;
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
      <input  type=hidden id="hiddenImgPK" 			name="hiddenImgPK" 			runat="server" />
      <input  type=hidden id="hiddenTableName" 		name="hiddenTableName" 		runat="server" />
      <input  type=hidden id="hiddenMaster_pk" 		name="hiddenMaster_pk" 		runat="server" />
      <input  type=hidden id="hiddenProcedure" 		name="hiddenProcedure" 		runat="server" />
      <input  type=hidden id="hiddenType1" 			name="hiddenType1" 			runat="server" />
      <input  type=hidden id="hiddenType2" 			name="hiddenType2" 			runat="server" />
      <input  type=hidden id="hiddenType3" 			name="hiddenType3" 			runat="server" />
      <input  type=hidden id="hiddenType4" 			name="hiddenType4" 			runat="server" />
      <input  type=hidden id="hiddenType5" 			name="hiddenType5" 			runat="server" />
      <input  type=hidden id="hiddenStart" 			name="hiddenStart" 			runat="server" />
      <input  type=hidden id="hiddenCols" 			name="hiddenCols" 			runat="server" />
      <input  type=hidden id="hiddenErrorCont" 		name="hiddenErrorCont" 		runat="server" />
      <input  type=hidden id="hiddenProcedureFile" 	name="hiddenProcedureFile" 	runat="server" />
      <input  type=hidden id="hiddenImportSeq" 		name="hiddenImportSeq" 		runat="server" />
      <input  type=hidden id="hiddenRecord" 		name="hiddenRecord" 		runat="server" />
    </form>
  </body>
</html>
