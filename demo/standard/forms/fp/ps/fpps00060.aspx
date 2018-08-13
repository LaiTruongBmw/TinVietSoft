<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Point Scan Checking</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var G_WORK_DT   = 0,
    G_TAG_NO    = 1,
    G_POINT_ID  = 2,
    G_FROM_TIME = 3,
    G_TO_TIME   = 4, 
    G_DURATION  = 5;
    
//=====================================================================================
function BodyInit()
 { 
      //----------------------
      OnFormatGrid();      
      //----------------------
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var trl ;
    
    trl = grdDetail.GetGridControl();

    trl.ColFormat(G_DURATION)  = "###,###,###,###,###";
        
    grdDetail.GetGridControl().Cell( 7, 0, G_FROM_TIME,  0, G_TO_TIME  ) = 0x3300cc;
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                 data_fpps00060.Call("SELECT");   
            break;                       
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fpps00060" :
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G_TAG_NO,  grdDetail.rows - 1, G_TAG_NO,  true);
                    
		            grdDetail.SetCellBgColor( 1, G_FROM_TIME, grdDetail.rows-1, G_TO_TIME,  0xCCFFFF ); 
		            
		            grdDetail.SetCellBold( 1, G_DURATION,  grdDetail.rows - 1, G_DURATION,  true);                                
                }

		        lblCount.text = grdDetail.rows-1 + ' s';
            break;   
            
            case "pro_fpps00060" :
                alert(txtReturnValue.text);
                
                OnSearch('Detail');
            break;                              
      }  
 }
//=====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'RESET':
            if ( confirm("Do you want to reset data ? "))
            {
                pro_fpps00060.Call();
            }    
        break;
    }
}
//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpps00060" > 
                <input>
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpps00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="" function="<%=l_user%>lg_sel_fpps00060"   > 
                <input>  
                    <input bind="txtPointID" />
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
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Point ID
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtPointID" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Tag No
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtTagNo" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 23%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td align="center" style="width: 1%">
                            <gw:icon id="btnLoadData" img="1" text="Load Data" onclick="OnProcess('RESET')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='Date|Tag No|Point|From Time|To Time|Duration' format='4|0|0|0|0|0'
                    aligns='1|1|1|1|1|1' check='|||||' editcol='0|0|0|0|0|0' widths='1500|1500|1500|1500|1500|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
