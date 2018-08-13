<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ADJUST SLIP ENTRY</title>
</head>

<script type="text/javascript" language="javascript">
var flag;

var G0_MASTER_PK	            = 0,
	G0_SLIP_NO		            = 1,
	G0_SLIP_DATE		        = 2,	 
	G0_STATUS	                = 3,
	G0_TLG_CO_CC_ALLO_RULE_M_PK = 4,
	G0_TLG_CO_CC_ALLO_RULE_M_ID = 5,
	G0_TLG_CO_CC_ALLO_RULE_M_NM = 6,
	G0_CHARGER_PK		        = 7,
	G0_FULL_NAME                = 8,
	G0_REF_NO                   = 9,
	G0_SLIP_AMOUNT              = 10,
	G0_DESCRIPTION              = 11;

var G1_TLG_CO_CC_ALLO_SLIP_M_PK     = 0,
    G1_TLG_CO_CC_ALLO_SLIP_D_PK     = 1,
    G1_SEQ                          = 2,
    G1_TLG_CO_COST_CENTER_PK        = 3,
    G1_CENTER_ID                    = 4,
    G1_CENTER_NAME                  = 5,
	G1_ALLO_VALUE		            = 6,    
	G1_ALLO_QTY 		            = 7,
    G1_TOTAL_VALUE                  = 8,
	G1_ALLO_AMOUNT                  = 9,
    G1_DESCRIPTION                  = 10;
	
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
	txtSlipNo.SetReadOnly(true);
	txtRuleID.SetReadOnly(true);
	txtRuleNM.SetReadOnly(true);
	txtSlipAmt.SetReadOnly(true);
	txtRefNo.SetReadOnly(true);
	txtDesc.SetReadOnly(true);
    OnSearch('Master');
}
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_bico00071_1': //MASTER
                data_bico00071_2.Call('SELECT'); 
        break;
        
		case 'data_bico00071_2':
			if ( grdDetail.rows > 1 )
			{
				grdDetail.SetCellBold( 1, G1_CENTER_ID, grdDetail.rows - 1, G1_CENTER_ID, true);
			}
		break;
        case 'pro_bico00071': // APPROVE
            alert(txtValueReturn.text);
            window.returnValue =  1;
            window.close();
        break;
        case 'pro_bico00071_1': // CANCEL
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
        case 'Master':
            if(txtMasterPK.text != "")
            {
           	 	data_bico00071_1.Call('SELECT');
			}	
        break;
    }
}  
//========================================================================================
function OnSubmit(pos)
{
	switch(pos)
	{
		case 'Approve':
			if(txtMasterPK.text != '')
		    {
		        pro_bico00071.Call();
		    }		
		break;
		case 'Cancel':
			if(txtMasterPK.text != '')
		    {
		        pro_bico00071_1.Call();
		    }		
		break;		
	}    
}
//=================================================================================
</script>

<body>
    <!--============================================= Master =====================================-->
    <gw:data id="data_bico00071_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8,9,10,11"	function="<%=l_user%>lg_sel_bico00071_1"	procedure="<%=l_user%>LG_UPD_bico00071_1">	
				<input>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="txtSlipNo"	/>	
						<inout	bind="dtSlipDate"	/>
						<inout	bind="lblStatus"	/>	
						<inout	bind="txtRulePK"	/>
						<inout	bind="txtRuleID"	/>
						<inout	bind="txtRuleNM"	/>
						<inout	bind="txtChargerPK"	/>											
						<inout	bind="txtChargerName"	/>
						<inout	bind="txtRefNo"	/>
						<inout	bind="txtSlipAmt"	/>												 						 
						<inout	bind="txtDesc"	/>				 											 
				</input>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_bico00071_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_bico00071_2" procedure="<%=l_user%>LG_UPD_bico00071_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Approve =====================================-->
    <gw:data id="pro_bico00071" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>LG_PRO_bico00071"> 
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
    <gw:data id="pro_bico00071_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>LG_PRO_bico00071_1"> 
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
            <td style="width: 100%; height: 100%" align="center" valign="top" id="right">
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
                                        Charger
                                    </td>
                                    <td style="width: 55%">
                                        <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtChargerName" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ref No
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtRefNo" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Rule
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtRulePK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtRuleID" styles='width:30%' />
                                        <gw:textbox id="txtRuleNM" styles='width:70%' />
                                    </td>
                                    <td style="white-space: nowrap">
                                        Slip Amount
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtSlipAmt" styles='width:100%' type="number" format="###,###.##" />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Desc
                                    </td>
                                    <td style="width: 95%" colspan="3">
                                        <gw:textbox id="txtDesc" styles='width:100% ' />
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
                            <gw:grid id='grdDetail' header='_tlg_co_cc_allo_slip_m_pk|_pk|Seq|_tlg_co_cost_center_pk|Center ID|Center Name|Allo Value|Allo Qty|Total Value|Allo Amount|Description'
                                format='0|0|0|0|0|0|1|1|1|1|0' aligns='0|0|1|0|0|0|0|0|0|0|0' check='||||||n||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0' widths='0|0|600|0|1200|2000|1200|1200|1200|1800|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' />
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
