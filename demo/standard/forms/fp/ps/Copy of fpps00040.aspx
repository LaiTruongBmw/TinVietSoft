<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Line Result Confirm</title>
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

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
 }
//=====================================================================================
  function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                data_fpps00040.Call("SELECT"); 
            break;  
            case 'Line':
                pro_fpps00040.Call(); 
            break;             
            case 'Point':
                pro_fpps00040_1.Call(); 
            break;                       
      }  
 }
//=====================================================================================
 function OnProcess(pos)
 { 
      switch (pos)         
      {		        
            case "LoadData" :
                pro_fpps00040_2.Call();
            break;
            case "Approve" :
                pro_fpps00040_3.Call();
            break;  
            case "Cancel" :
                pro_fpps00040_4.Call();
            break;                       
      }
 } 
//=====================================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		                    
            case 'pro_fpps00040_2' :
                alert(txtReturnValue.text);
                OnSearch('Detail');
            break;      
            case 'pro_fpps00040_3' :
                alert(txtReturnValue.text);
                OnSearch('Detail');
            break;     
            case 'pro_fpps00040_4' :
                alert(txtReturnValue.text);
                OnSearch('Detail');
            break; 
      }  
 }
//=====================================================================================
function OnSave(pos)
{
    data_fpps00040.Call();
} 
//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="prod.sp_pro_fpps00040" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="prod.sp_pro_fpps00040_1" > 
                <input>
                    <input bind="lstLine" /> 
                </input> 
                <output>
                    <output bind="lstPoint" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpps00040_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="prod.sp_pro_fpps00040_2" > 
                <input>
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="dtFrom" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpps00040_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="prod.sp_pro_fpps00040_3" > 
                <input>
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="dtFrom" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpps00040_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="prod.sp_pro_fpps00040_4" > 
                <input>
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="dtFrom" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>       
    <!------------------------------------------------------------------>
    <gw:data id="data_fpps00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="prod.sp_sel_fpps00040" procedure="prod.sp_upd_fpps00040"   > 
                <input> 
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
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
                <table style="width: 100%; height: 100%; background-color: CCFFFF" border="0">
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
                        <td style="width: 5%" align="left">
                            Point
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstPoint" styles='width:100%' />
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
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="width: 100%">
                        <td style="width: 100%" colspan="10">
                            <table style="width: 100%" border="0">
                                <tr>
                                    <td style="width: 98%" align="right">
                                        <gw:icon id="btnLoadData" img="1" text="Load Data" onclick="OnProcess('LoadData')" />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap">
                                        <gw:icon id="btnApprove" img="1" text="Approve" onclick="OnProcess('Approve')" />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap" align="left">
                                        <gw:icon id="btnCancel" img="1" text="Cancel" onclick="OnProcess('Cancel')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='_PK|Line ID|Point ID|_PP_ORDPLAN_PK|_STYLE_PK|_SPEC01_PK|Spec ID 01|_SPEC02_PK|Spec ID 02|_SPEC03_PK|Spec ID 03|Prod Qty|Defect Qty|Adj Prod Qty|Adf Defect Qty|Ref Po No|Description'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
