<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportEngine.aspx.cs" Inherits="ReportEngine" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=12.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Report viewer</title>
</head>
<body >
    
    <form id="form1" runat="server">
    <div style="width:100%" id="PrintArea">
        &nbsp;<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
            ToolPanelView="None" />
    
    </div>
    </form>
</body>
</html>