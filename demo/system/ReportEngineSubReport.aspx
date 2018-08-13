<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportEngineSubReport.aspx.cs" Inherits="ReportEngineSubReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=12.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Report viewer</title>
</head>
<body >
    
    <form id="form1" runat="server">
    <asp:TextBox ID="txtPrinter" runat="server"></asp:TextBox>        
    <asp:Button ID="cmdPrint" runat="server" Text="Print" OnClick="cmdPrint_Click" />
    <div style="width:100%" id="PrintArea">
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server"  AutoDataBind="False" Height="100%" ReportSourceID="CrystalReportSource1" Width="100%" DisplayGroupTree="False" OnUnload="CrystalReportViewer1_Unload" />
    </div>
    </form>
</body>
</html>