<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Report Option</title>
</head>

<script type="text/javascript">
var formStatus = '';
var ACTION = {
    SELECT : '1',
    UPDATE : '2'
};

function BodyInit()
{
    System.Translate(document);
    txtGroupId.text = '<%= Request.QueryString("group_id") %>';
    txtFormId.text = '<%= Request.QueryString("cha_value2") %>';
    OnSearch();
}

function OnSearch()
{
    data_fpab00790.Call('SELECT');
}

function OnDataReceive(obj)
{
    if (obj.id == "data_fpab00790")      
        pro_report_list.Call();
}

function OnSave()
{
    data_fpab00790.StatusUpdate();
    data_fpab00790.Call();
}

function OnClose()
{
    var data = 'DATA';
    if (lstReportType != null && lstReportType.GetControl() != null && lstReportType.GetControl().options != null)
    {
        for (i=0; i<lstReportType.GetControl().options.length; i++)
        {
            data += '|' + lstReportType.GetControl().options.item(i).value;
            data += '|' + lstReportType.GetControl().options.item(i).text;
        }
    }
    
    window.returnValue = data;
    window.close();
}
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="pro_report_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="list" procedure="st_lg_PRO_REPORT_LIST" >
                <input>
                    <input bind="txtGroupId" />
                    <input bind="txtFormId" />
                </input>
                <output>
                    <output bind="lstReportType" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpab00790" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="0,1,2,3" function="st_lg_sel_fpab00790" procedure="st_lg_upd_fpab00790" >
                <input bind="grdDetail" >
					<input bind="txtGroupId" />
					<input bind="txtFormId" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->	
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 0%">
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="100" style="text-align: center;">REPORT OPTION</td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="96"></td>
            <td colspan="2"><gw:button img="save" id="btnSave" alt="Save" onclick="OnSave()"/></td>
            <td colspan="2"><gw:button img="cancel" id="btnClose" alt="Close" onclick="OnClose()" /></td>
        </tr>
        <tr style="height: 99%">
            <td colspan="100">
                <gw:grid id='grdDetail' 
                    header='_PK|_Report Source|Report Name|Use'
                    format='0|0|0|3'
                    aligns='0|0|0|0'
                    editcol='0|0|0|1' 
                    widths='0|0|5000|100'
                    sorting='T'
                    styles='width:100%; height:100%'
                />
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtGroupId" style="display: none;" ></gw:textbox>
<gw:textbox id="txtFormId" style="display: none;" ></gw:textbox>
<gw:list id="lstReportType" styles="display: none;" />
</html>

