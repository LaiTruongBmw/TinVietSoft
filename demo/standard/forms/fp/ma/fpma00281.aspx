<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>LIQUIDATION SLIP</title>
</head>

<script type="text/javascript" language="javascript">
var flag;

var G1_SLIP_D_PK    = 0,
    G1_SLIP_M_PK    = 1,
    G1_SEQ          = 2,
    G1_ASSET_PK     = 3,
    G1_ASSET_CODE   = 4,
    G1_ASSET_NAME   = 5,
	G1_UOM		    = 6,    
    G1_ADJ_AMOUNT   = 7,
	G1_TR_CCY       = 8,
    G1_REMARK       = 9;
	
var arr_FormatNumber = new Array();	
 
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	txtMasterPK.text = "<%=Request.querystring("po_pk")%>"; 
	var status = "<%=Request.querystring("type")%>"; 
	
	if(status == "APPROVE")
	{
	    document.getElementById('idBtnCancel').style.display = "none";
	}
	else
	{
	    document.getElementById('idBtnApprove').style.display = "none";
	}
	
	txtChargerName.SetReadOnly(true);
	txtDeprSDID.SetReadOnly(true);
	txtSlipNo.SetReadOnly(true);
	
	FormFormat();   
	data_fpma00281_1.Call('SELECT');
}
//=================================================================================
function FormFormat()
{  
     var data="";  	
   
     //--------STATUS
	 
	 grdDetail.GetGridControl().ColFormat(G1_ADJ_AMOUNT) = "###,###,###.##";  
	 
	 arr_FormatNumber[G1_ADJ_AMOUNT] = 2;
}
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
		
        case 'data_fpma00281_1': //MASTER
            data_fpma00281_2.Call('SELECT'); 
        break;
        
		case 'data_fpma00281_2':
			if ( grdDetail.rows > 1 )
			{
				grdDetail.SetCellBold( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_CODE, true);
				grdDetail.SetCellBold( 1, G1_ADJ_AMOUNT, grdDetail.rows - 1, G1_ADJ_AMOUNT, true);
				grdDetail.SetCellBgColor( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_NAME, 0xCCFFFF );
			}
		break;
        case 'pro_fpma00281': // APPROVE
            alert(txtValueReturn.text);
            window.returnValue =  1;
            window.close();
        break;
        case 'pro_fpma00281_1': // CANCEL
            alert(txtValueReturn.text);
            window.returnValue =  1;
            window.close();
        break;
    }  
}
//=================================================================================
function OnSearch(pos)
{ 
    switch(pos)
    {
        case 'grdSearch':
            data_fpma00281.Call('SELECT');
        break;
		
        case 'Master':
			if ( grdSearch.row > 0 )
			{
            	txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G0_MASTER_PK);
			
           	 	data_fpma00281_1.Call('SELECT');
			}	
        break;
    }
}
//========================================================================================
function OnSubmit(para)
{
    if(txtMasterPK.text != '')
    {
        if(para == "Approve")
        {
            pro_fpma00281.Call();
        }
        else
        {
            pro_fpma00281_1.Call();
        }
    }
}
//=================================================================================
</script>

<body>
    <!--============================================= Master =====================================-->
    <gw:data id="data_fpma00281_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7"	function="<%=l_user%>lg_sel_fpma00281">	
				<input>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="txtSlipNo"	/>	
						<inout	bind="dtSlipDate"	/>
						<inout	bind="lblStatus"	/>	
						<inout	bind="txtChargerPK"	/>
						<inout	bind="txtChargerName"	/>												 						 
						<inout	bind="txtDeprSDID"	/>				 											 
						<inout	bind="txtRemark"	/>					
				</input>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpma00281_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpma00281_1">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Approve =====================================-->
    <gw:data id="pro_fpma00281" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpma00281"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!--============================================= Cancel =====================================-->
    <gw:data id="pro_fpma00281_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpma00281_1"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 10%; white-space: nowrap">
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" styles='width:100%' />
                        </td>
                        <td style="width: 5%">
                            Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtSlipDate" lang="1" width="10%" />
                        </td>
                        <td style="width: 25%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td align="right" style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnApprove" img="2" text="Approve" styles='width:15%' onclick="OnSubmit('Approve')" />
                            <gw:icon id="idBtnCancel" img="2" text="Cancel" styles='width:15%' onclick="OnSubmit('Cancel')" />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">
                        <td colspan="11">
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF" border="0">
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Depr SD
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtDeprSDID" styles='width:100% ' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Charger
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtChargerName" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap">
                                        Remark
                                    </td>
                                    <td style="width: 45%" colspan="3">
                                        <gw:textbox id="txtRemark" styles='width:100%'"' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 100%; white-space: nowrap" align="center">
                                    </td>
                                    <td style="width: 15%; white-space: nowrap" align="center">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 94%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_SLIP_D_PK|_SLIP_M_PK|Seq|_ASSET_PK|Asset Code|Asset Name|UOM|Adj Amount|CCY|Remark'
                                format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|1|3|1|0' check='|||||||||' editcol='0|0|1|0|1|2|0|1|0|1'
                                widths='0|0|800|0|2000|3500|800|1400|800|1000' sorting='T' styles='width:100%; height:100%'
                                onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
