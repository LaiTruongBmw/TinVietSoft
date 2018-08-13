<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>REVENUE DETAILS</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G1_COST_CENTER	= 0,
	G1_ITEM_CODE	= 1,
	G1_ITEM_NAME	= 2,
	G1_PRE_QTY		= 3,
	G1_ACT_QTY		= 4,
	G1_UNIT_PRICE	= 5,
	G1_AMOUNT 		= 6; 
//============================================================================== 
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtMasterPK.text = "<%=Request.querystring("p_master_pk")%>";
		
	var ctr = grdSummary.GetGridControl(); 
    
    ctr.ColFormat(G1_PRE_QTY) 	 = "###,###,###,###";
    ctr.ColFormat(G1_ACT_QTY)  	 = "###,###,###,###";
	ctr.ColFormat(G1_UNIT_PRICE) = "###,###,###,###";
	ctr.ColFormat(G1_AMOUNT)     = "###,###,###,###";
	
	data_bico20041_1.Call("SELECT");
}
//============================================================================== 
 function BindingDataList(){      
	var str = "1";
 }
//============================================================================== 
function OnClick(event){
	pro_bico20040_labor_search.Call("SELECT");
}
//============================================================================== 
function OnDataReceive(obj)
{
	switch(obj.id)
	{		
		case "data_bico20041_1":
			if (grdSummary.rows > 1)
			{
				grdSummary.Subtotal(1, 2, -1, '3!4!6','###,###,###');
			}
		break;
	}
}
//============================================================================== 
</script>

<body>
	 
	<!------------------------------------------------------------------------------------->
	<gw:data id="data_bico20041_1" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20041_1"> 
				<input>
					<input bind="txtMasterPK" /> 
				 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------------->
	<table style="width: 100%; height: 100%" border="0">
        <tr>
            <td id="right" style="width: 100%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            
                        </td>
                        <td align="right" style="width:5%; white-space: nowrap;">
                           
                        </td>
                        <td style="width: 20%" colspan="2">
                            
                        </td>
						<td align="right" style="width:1%; white-space: nowrap;">
                           
                        </td>
						<td style="width: 30%" colspan="2">
                             
                        </td>
						<td align="right">
							<table style="height: 100%;width:1%" border="0">
								<tr>
									<td width="1%"><gw:button img="search"     	alt="Search"     	id="btnSearch"  		onclick="OnClick('search')" /> </td>
								</tr>
							</table>
						</td>
                    </tr>
					<tr style="height:100%">
						<td colspan="15" style="padding-top:5px">
								<table name="Summary" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td>
											<gw:grid id="grdSummary" header="Cost Center|Item Code|Item Name|Pre Qty|Act Qty|Unit Price|Amount" 
												format="0|0|0|0|0|0|0"
												aligns="0|0|0|3|3|3|3" 
												defaults="||||||" 
												editcol="0|0|0|0|0|0|0" 
												widths="2000|1500|2000|1500|1500|1500|1500"
												styles="width:100%; height:100%" sorting="T""
												/>
										</td>
									</tr>
								</table>
						</td>
					</tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtGroup" styles="width: 100%;display: none" />
	<!------------------------------------------------------------------------------------->
</body>
</html>