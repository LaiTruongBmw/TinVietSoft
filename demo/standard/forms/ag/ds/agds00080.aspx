<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Grid Header Setting</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var userID = "<%=Session("LoginID")%>"; 
	
//====================================================================
function BodyInit()
{  
    System.Translate(document); 
    data_agds00080.Call("SELECT");

}
//====================================================================
function FormatGrid()
{	 
	 //var data ="#10;10 Result Module|#20;20 Result Module|#3;30 Packing Module"
     //grdDetail.SetComboFormat( 1, data);
}
//====================================================================
function OnAddNew(obj)
{
     obj.AddRow();
}
//====================================================================
function OnDataReceive(obj)
{
}
//====================================================================
function OnSearch()
{
    data_agds00080.Call("SELECT");
}
//====================================================================
function OnSave()
{
    data_agds00080.Call();
}
//====================================================================

</script>

<body>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_lg_sel_agds00080" procedure="st_lg_upd_agds00080"> 
                <input bind="grdDetail"  > 
                </input> 
                <output bind="grdDetail" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------- MainTable -------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 100%; width: 100%">
            <td style="width: 100%" id="left">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 20%">
                        </td>
                        <td style="width: 75%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnSearch01" img="search" alt="Search" styles='width:100%' onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnNew01" img="new" alt="New" styles="width:100%" onclick="OnAddNew(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnUpdate01" img="save" alt="save" styles='width:100%' onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 99%; width: 100%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' header='_PK|Grid Type|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Col6 Header|Col6 Display|Col7 Header|Col7 Display|Col8 Header|Col8 Display|Col9 Header|Col9 Display|Col10 Header|Col10 Display|Remark'
                                format='0|0|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								check='||||||||||||||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------->
</html>
