<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Point Checking</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var G_Line_ID   = 0,
    G_Style     = 1,
    G_Size      = 2,
    G_Color     = 3,
    G_Part      = 4, 
    G_Numbering = 5,
    G_Scan_Date = 6,
    G_Round     = 7,
    G_Tag_No    = 8,
    G_Point_ID  = 9,
    G_Scan_Fr_Time = 10,
    G_Scan_To_Time = 11,
    G_AC_TT     = 12,
    G_ST_TT     = 13,
    G_TT_Gap    = 14;
    
//=====================================================================================
function BodyInit()
 {
   OnFormatGrid();
 }
//===================================================================================== 
  function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
 }
//=====================================================================================
  function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                grdDetail.ClearData();
                data_fpps00040.Call("SELECT"); 
            break;  
            case 'Line':
                pro_fpps00040.Call(); 
            break;                             
      }  
 }
//=====================================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		                    
            case 'data_fpps00040':
                if ( grdDetail.rows > 1 )
		        {
                    grdDetail.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11','#,###,###');
                }
            break;
      }  
 }
//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00040" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
   
    <!------------------------------------------------------------------>
    <gw:data id="data_fpps00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_SEL_FPPS00040" >
                <input> 
                    <input bind="lstLine" />
                    <input bind="dtFrom" />
                </input> 
                <inout bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%; background-color: #CCFFFF" border="0">
                    <tr>
                        <td style="width: 5%" align="left">
                            Fac
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch('Line')" />
                        </td>
                        <td style="width: 5%" align="left">
                            Line
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstLine" styles='width:100%' onchange="OnSearch('Point')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                        </td>
                        <td align="right" style="width: 19%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='_POINT_SEQ|Point ID|07:30 ~ 08:30|08:30 ~ 09:30|09:30 ~ 10:30|10:30 ~ 11:30|12:30 ~ 13:30|13:30 ~ 14:30|14:30 ~ 15:30|15:30 ~ 16:30|16:30 ~ 18:20|18:50 ~ 20:20|Total Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|1|1|1|1|1|1|1|1|1|1|1|1' check='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1400|1400|1400|1400|1400|1400|1400|1400|1400|1400|1400'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
