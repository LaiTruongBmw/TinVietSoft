<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST ENTRY</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G1_PK   		= 0,
    G1_CLOSING_DATE = 1,    
    G1_STATUS      	= 2,
    G1_BRANCH   	= 3,
    G1_CHARGE 		= 4
	
	G5_NO   		= 1,    
    G5_ITEM_NAME    = 2,
    G5_UNIT   		= 3,
    G5_BEGIN_QTY 	= 4,
    G5_BEGIN_AMOUNT = 5,    
    G5_IN_AMOUNT    = 6,   
	G5_OUT_QTY   	= 7,	
    G5_OUT_AMOUNT   = 8,
    G5_END_QTY  	= 9,
	G5_END_AMOUNT	= 10
	
	G_TOTAL = 0; 

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	txtMasterPK.text = "<%=Request.querystring("p_pk")%>";
	bico20040_labor_list.Call(); /**/
	//OnClick("search");
}
//============================================================================== 
 function BindingDataList(){      
	var str = "1";
 }

function OnClick(event){
	pro_bico20040_labor_search.Call("SELECT");
}

function OnDataReceive(obj){
	switch(obj.id){
		case "bico20040_labor_list":
			lstGroup.SetDataText(txtGroup.text);
			lstGroup.value = '';
			pro_bico20040_labor_search.Call("SELECT");
		break;
		case "pro_bico20040_labor_search":
			if (grdSummary.rows > 1){
				grdSummary.Subtotal(1, 2, -1, '11!12!13','###,###,###.##');
			}
		break;
	}
}
</script>

<body>
	<gw:data id="bico20040_labor_list" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="list" procedure="<%=l_user%>lg_sel_bico20040_labor_list" > 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output>
					<output bind="txtGroup" />
				</output>
			</dso> 
		</xml> 
	</gw:data>
	
	<gw:data id="pro_bico20040_labor_search" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_labor_search"> 
				<input>
					<input bind="txtMasterPK" /> 
					<input bind="lstGroup" /> 
					<input bind="txtEmp" /> 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>
	<table style="width: 100%; height: 100%" border="0">
        <tr>
            <td id="right" style="width: 100%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            
                        </td>
                        <td align="right" style="width:5%; white-space: nowrap;">
                            Group
                        </td>
                        <td style="width: 20%" colspan="2">
                            <gw:list id="lstGroup" styles="width:100%" />
                        </td>
						<td align="right" style="width:1%; white-space: nowrap;">
                            Emp ID / EmpName
                        </td>
						<td style="width: 30%" colspan="2">
                            <gw:textbox id="txtEmp" styles="width:100%" />
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
											<gw:grid id="grdSummary" header="No|Group|Emp ID|Emp Name|From Hour-To Hour|WT Hours|Abs hours|OT Hours|NT hours|HT hours|ST hours| WT Pay|OT Pay|Total Pay|." 
												format="0|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|0"
												aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
												defaults="|||||||||||||" 
												editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
												widths="500|2000|1000|2000|2500|1000|1000|1000|1000|1000|1000|2000|2000|2000|100"
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
</body>
</html>