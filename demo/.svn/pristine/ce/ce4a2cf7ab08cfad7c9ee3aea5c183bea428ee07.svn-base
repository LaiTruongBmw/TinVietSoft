<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Point Scanlog</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var G_Line_ID   = 0,
    G_Style     = 1,
    G_Size      = 2,
    G_Color     = 3,
    G_Part      = 4,     
    G_Scan_Date = 5,    
    G_Tag_No    = 6,
    G_Point_ID  = 7,
    G_Scan_Fr_Time = 8,
    G_Scan_To_Time = 9;
    
//=====================================================================================
function BodyInit()
 {
      //---------------------- 
      //dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));      
      //----------------------
      OnFormatGrid();      
      //----------------------
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
     
    var trl ;
    
    trl = grdDetail.GetGridControl();

        
    grdDetail.GetGridControl().Cell( 7, 0, G_Scan_Fr_Time ,  0, G_Scan_To_Time ) = 0x3300cc;
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                data_fpps00020.Call("SELECT");   
            break;  
            
            case 'Line':
                pro_fpps00020.Call(); 
            break; 
            
            case 'Point':
                pro_fpps00020_1.Call(); 
            break;                       
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fpps00020" :
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G_Line_ID,  grdDetail.rows - 1, G_Line_ID,  true);
                    grdDetail.SetCellBold( 1, G_Point_ID, grdDetail.rows - 1, G_Point_ID, true);
                    
		            grdDetail.SetCellBgColor( 1, G_Style, grdDetail.rows-1, G_Part, 0xCCFFFF ); 
		            grdDetail.SetCellBgColor( 1, G_Scan_Fr_Time , grdDetail.rows-1, G_Scan_To_Time ,  0xCCFFFF );		                                                                                          
                }

		        lblCount.text = grdDetail.rows-1 + ' s';
            break;                         
      }  
 }

//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00020" > 
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
    <gw:data id="pro_fpps00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00020_1" > 
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
    <gw:data id="data_fpps00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="" function="<%=l_user%>lg_sel_fpps00020"   > 
                <input> 
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="txtTagNo" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%; background-color: CCFFFF">
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
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 19%; white-space: nowrap" align="right">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Tag No
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:textbox id="txtTagNo" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="left">
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 5%" align="left">
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                        </td>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                        </td>
                        <td style="width: 19%; white-space: nowrap" align="right">
                        </td>
                        <td align="right" style="width: 1%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' 
                header='Line ID|Style|Size|Color|_Part|Scan Date|Tag No|Point ID|Fr Time|To Time'
                    format='0|0|0|0|0|4|0|0|0|0' 
                    aligns='0|0|0|0|0|1|1|1|1|1'
                    check='|||||||||' 
                    editcol='0|0|0|0|0|0|0|0|0' 
                    widths='1200|2500|1200|1200|1200|1200|1200|1000|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
