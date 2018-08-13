<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Price History</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_PARTNER_ID   = 0,
    G1_PARTNER_NAME = 1,    
    G1_PO_DATE      = 2,
	G1_PO_QTY	    = 3,	
    G1_UPRICE       = 4,
	G1_PO_CCY	    = 5;
	
//==================================================================
         
function BodyInit()
{       
    //---------------------------------- 
    System.Translate(document);
	//---------------------------------- 	
	
	txtItemPK.text = "<%=Request.querystring("item_pk")%>";
	
	dtFrom.SetDataText(System.AddDate(dtFrom.GetData(), -700));     
    //---------------------------------- 
    FormatGrid();
    //-----------------------------------
	OnSearch('grdSearch');
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdSearch.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_UPRICE, 0, G1_UPRICE) = 0x3300cc;
    //--------------------- 
	ctrl.ColFormat(G1_UPRICE) = "###,###,###.##";
	ctrl.ColFormat(G1_PO_QTY) = "###,###,###.##";
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdSearch':
            data_colg00400.Call('SELECT');
        break;
    }
}
//==================================================================   
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_colg00400":             
			if ( grdSearch.rows > 1 )
			{ 
            	grdSearch.SetCellBgColor( 1, G1_PO_DATE, grdSearch.rows - 1, G1_PO_DATE, 0xCCFFFF ); 
			
            	grdSearch.SetCellBold( 1, G1_PARTNER_ID, grdSearch.rows - 1, G1_PARTNER_ID, true);   
				grdSearch.SetCellBold( 1, G1_UPRICE,     grdSearch.rows - 1, G1_UPRICE,     true);                         			           
			}		
        break;
		 
    }
}    
 
//==================================================================      
</script>

<body>
	<!--------------------------------------------------------------------->
    <gw:data id="data_colg00400" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_colg00400_0"  >
                <input bind="grdSearch" >
					<input bind="txtItemPK" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />			        
					<input bind="txtPartner" />
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>    
	<!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>                        					
						<td style="width: 5%; white-space: nowrap" align="right">
                            Partner
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>	
						<td style="width: 9%">                             
                        </td>												                                                
						<td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">
                            <gw:grid id='grdSearch' header='Partner ID|Partner Name|Price date|Qty|U/Price|CCY'
                                format='0|0|4|0|0|0' 
								aligns='0|0|1|3|3|1' check='|||||' 
								editcol='0|0|0|0|0|0'
                                widths='2000|4000|1200|1500|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-----------------------------------------------------------> 
	<gw:textbox id="txtItemPK" maxlen="100" styles='width:100%;display:none'  />
    <!----------------------------------------------------------->
</body>
</html>
