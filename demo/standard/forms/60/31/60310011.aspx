<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Outgoing Req Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G1_PK=0,
	G1_M_PK=1,
	G1_Seq=2,
	G1_Tr_Date=3,
	G1_Tr_Type=4,
	G1_Tr_Amount=5,
	G1_Credit_Line=6,  
	G1_Balance=7,
	G1_Del_Req_Bal=8,
	G1_Charger=9,
	G1_Remark=10,
	G1_CCY =11;

var	f_lag=false;
var p_master_pk, p_type, p_partner_pk,p_ccy;
function BodyInit()
{ 
	p_master_pk  = "<%=Request.querystring("p_master_pk")%>";
	p_partner_pk  = "<%=Request.querystring("p_partner_pk")%>";
	p_type  = "<%=Request.querystring("p_type")%>";
	p_ccy  = "<%=Request.querystring("p_ccy")%>";
	
	OnNew('1');
	txtPartnerPK.text=p_partner_pk;
	
   var ls_TYPE = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACAB6010') FROM DUAL")%>";
   lstType.SetDataText(ls_TYPE);
   lstType.value=p_type;
   
   var ls_CCY = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   lstCCY.SetDataText(ls_CCY);
   lstCCY.value=p_ccy;
   
   <%=CtlLib.SetGridColumnComboFormat("grdDetail", 11, "select d.code,d.code_nm from tac_commcode_master a, tac_commcode_detail d where a.pk = d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id like 'ACAB0110' AND d.def_yn = 'Y' ")%>;
   <%=CtlLib.SetGridColumnComboFormat("grdDetail",  4, "select d.code,d.code_nm from tac_commcode_master a, tac_commcode_detail d where a.pk = d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id like 'ACAB6010' AND d.def_yn = 'Y' ")%>;
   
   dso_Load_Partner.Call();	
    //data_user_warehouse.Call();	
}
//===================================================================================
/*function OnSearch(pos) 
{  
    switch (pos)
    {    
        case 'master':     
            dso_fppw00121_master.Call("SELECT");
        break;
        
        case 'grd_arr_master_pk':            
            data_fppw00121_arr_pk.Call("SELECT");
        break;
    }
}*/
//===================================================================================
function OnNew(obj)
{
	//alert("aa"); 
	if(obj=='1')
	{
		dso_fppw00121_master.StatusInsert();
		/*txtMasterPK.text = txt_p_wi_line_d_pk.text
		txt_wi_line_d_pk.text = txt_p_wi_line_d_pk.text
		txtItem_PK.text = p_item_pk;
		txtItemCode.text = p_item_code;*/
	}
	else if(obj=='2')
	{		
		grdDetail.AddRow(); 
		grdDetail.SetGridText(grdDetail.rows-1, G1_Tr_Type, lstType.value);
		grdDetail.SetGridText(grdDetail.rows-1, G1_CCY, lstCCY.value);					
	}
}
//===================================================================================
function ValidateDetail()
{
	for (i = 1; i < grdDetail.rows; i++)
	{			
		//grdDetail.SetGridText(i, G1_M_PK, txtMasterPK.text);
		if(grdDetail.GetGridData(i, G1_Tr_Date) == "")
		{
			alert("Please select column Tr.Date to save.");
			return false ; 			
		}
	}
	return true;
}	
//===================================================================================
function OnSave(obj)
{
	if(obj=='1' && txtMasterPK.text=="")
	{
		f_lag=true;
		dso_fppw00121_master.Call();
	}
	if(obj=='1' && txtMasterPK.text!="")
	{
		if(ValidateDetail())
		{
			for (i = 1; i < grdDetail.rows; i++)
			{			
				grdDetail.SetGridText(i, G1_M_PK, txtMasterPK.text); 
				//alert(txtMasterPK.text);
				dso_fppw00121_QC_Defect.Call();
			}
		}		
	}
	if(obj=='2')
	{
		if(ValidateDetail())
		{
			dso_fppw00121_QC_Defect.Call();
		}
	}
}
function OnDelete(obj)
{
	if(obj=='1')
	{
		 if (confirm('Are you sure delete data ?'))
			{
				f_lag=true;
				dso_fppw00121_master.StatusDelete();
				dso_fppw00121_master.Call();
			}

	}
	if(obj=='2')
	{
		 if (confirm('Are you sure delete data ?'))
			{
				f_lag==true;
				grdDetail.DeleteRow();
				dso_fppw00121_QC_Defect.Call();
			}

	}
}
function OnDataReceive(obj)
{
	var tt_defect_qty=0;
    switch(obj.id)
    {
	   case 'dso_fppw00121_master': 
			if(f_lag==true)
			{
				if(ValidateDetail())
				{
					for (i = 1; i < grdDetail.rows; i++)
					{
						
						grdDetail.SetGridText(i, G1_M_PK, txtMasterPK.text); 
						//alert(txtMasterPK.text);
						dso_fppw00121_QC_Defect.Call();
					}
				}				
			}
			else
			{
				dso_fppw00121_QC_Defect.Call("SELECT");
			}
        break;
		case 'dso_Load_Partner': 
			if(txtMasterPK!="")
			{
				dso_fppw00121_QC_Defect.Call("SELECT");
			}
        break;
		case 'dso_fppw00121_QC_Defect':
			if(f_lag==false)
			{
				OnNew("2");
			}
        break;
	}
}	
function OnCopy()
{
	f_lag=1;
	dso_fppw00121_copy.Call();
}	

//================================================================= 
function OnPrint()
{
	/*if( txtMasterPK.text != "" )
	{
		var path = System.RootURL + '/standard/forms/fp/pr/fppr00023.aspx';
		var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
	}*/
}
function OnReport()
{  
	var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00021.aspx?master_pk='+ txtMasterPK.text;
	window.open(url);      
}
//======================================================================
</script>
<body>
 <!------------------------------------------------------------------>
    <gw:data id="dso_fppw00121_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="ac_sel_60310010_mst" procedure="ac_upd_60310010_mst"> 
                <inout> 
                    <inout bind="txtMasterPK" />					
                    <inout bind="txtPartnerPK" /> 
					<inout bind="txtPartnerID" />					
                    <inout bind="txtPartnerName" /> 		
                    <inout bind="lstCCY" /> 
					<inout bind="txtCreditLine" />					
                    <inout bind="txtBalance" /> 
					<inout bind="txtDelReqBalance" />					
                    <inout bind="txtTaxCode" /> 		
                    <inout bind="txtTel" /> 
					<inout bind="txtAddress" /> 		
                    <inout bind="txtEmail" />
                </inout>
            </dso> 
			  
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dso_fppw00121_QC_Defect" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="ac_sel_60310010_dtl"   procedure="ac_upd_60310010_dtl"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
					<input bind="lstType" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
	<gw:data id="dso_Load_Partner" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="ac_pro_60310010_partner" > 
		<input> 
			<input bind="txtPartnerPK" />
			<input bind="lstCCY" />
		</input>
		<output>
			<output bind="txtMasterPK"/>
			<output bind="txtPartnerID"/>
			<output bind="txtPartnerName"/>
			<output bind="txtCreditLine"/>
			<output bind="txtDelReqBalance"/>
			<output bind="txtBalance"/> 
			<output bind="txtTaxCode"/>
			<output bind="txtTel"/>
			<output bind="txtAddress"/>
			<output bind="txtEmail"/>  	
		</output> 
		</dso> 
		</xml> 
	</gw:data>

<!---------------------------------------------------------------->

   <table style="width: 100%; height: 100%" border="0">
	   <tr style="height: 2%" valign="top">
			<td>
				<table style="height: 100%; width: 100%">
					<tr>
						<td width="97%"><gw:imgbtn id="btnDeleteItem1" img="delete" alt="Delete" text="Delete" onclick="OnNew('1')" /></td>
						<td align="right" width="1%">
							<gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('1')" />
						</td>
						<td align="right" width="1%">
							<gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('1')" />
						</td>
						<td align="right" width="1%">
							<gw:button id="btnPrint" img="excel"text="Print" alt="In report"  onclick="OnPrint()" />
						</td>
						<td width="1%"></td>
					</tr>
				</table> 
			</td>
		</tr>
	   <tr style="height: 98%">
			<td>
				<table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 2%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                               <tr>
                                    <td style="width: 7%" align="right">
											Partner
                                    </td>
                                    <td style="width: 20%">
										<gw:textbox id="txtPartnerID" styles="width:100%" /> 
                                    </td>
									<td style="width: 30%">
										<gw:textbox id="txtPartnerName" styles="width:100%" />
                                    </td>									
									<td  style="width: 5%" align="right">Type</td>		
                                    <td style="width: 17%" align="center">
										<gw:list id="lstType" styles="width:100%;" />																			
                                    </td>
                                    <td style="width: 7%" align="right">
                                        CCY
                                    </td>
                                    <td style="width: 13%">
                                        <gw:list id="lstCCY" styles="width:100%;" />
                                    </td>
									
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">	
						 <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td align="right" style="width: 7%">
										Credit Line
									</td>
									<td style="width: 20%"> 
										<gw:textbox id="txtCreditLine" styles="width:100%" type="number" format="###,###,###,###.#" />  
									</td>
									<td align="right" style="width: 14%; white-space: nowrap">
										Balance
									</td>
									<td style="width: 15%">
										<gw:textbox id="txtBalance" styles="width:100%" type="number" format="###,###,###,###.#" />
									</td>                       
									<td align="right" style="width: 28%">
										Delivery Request Balance
									</td>
									<td style="width: 16%">
										<gw:textbox id="txtDelReqBalance" styles="width:100%" type="number" format="###,###,###,###.#" />
									</td>
								</tr>
							</table>																
						</td>
                    </tr> 
					<tr style="height: 2%">	
						 <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
								
									<td align="right" style="width: 7%">
										Tax Code
									</td>
									<td style="width: 20%"> 
										<gw:textbox id="txtTaxCode" styles="width:100%" />  
									</td>
									<td align="right" style="width: 14%; white-space: nowrap">
										Tel
									</td>	
									<td style="width: 16%">
										<gw:textbox id="txtTel" styles="width:100%" />
									</td>                       
									<td align="right" style="width: 6%">
										Address
									</td>
									<td style="width: 16%">
										<gw:textbox id="txtAddress" styles="width:100%" />
									</td>
									<td align="right" style="width: 5%">
										Email
									</td>
									<td style="width: 18%">
										<gw:textbox id="txtEmail" styles="width:100%" />
									</td>
								</tr>
							</table>																
						</td>
                    </tr> 
                    <tr style="height: 2%"> 
						<td>
							<table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td style="width: 5%" align="left">
			                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
			                                style="cursor: hand" onclick="OnToggle()" />
			                        </td>
			                        <td align="right" style="width: 5%; white-space: nowrap">
			                          Tr.Date 
			                        </td>
			                        <td align="right" style="width: 20%" >
			                            <gw:datebox id="dtFrom" lang="1" />
										~<gw:datebox id="dtTo" lang="1" />
			                        </td>
			                        <td  style="width: 1%" >
			                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('detail')" />
			                        </td>
			                        <td style="width: 21%" >
			                            
			                        </td>										
									<td style="width: 46%">			                            
			                        </td>																			
									<td style="width: 1%">
			                          <gw:imgbtn id="btnDeleteItem2" img="delete" style="display:none" alt="Delete" text="Delete" onclick="OnNew('2')" />
			                        </td>																		 
			                        <td align="right" width="1%">
										<gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('2')" />
									</td>										
								</tr>
							</table>	
						</td>                       																
                    </tr>
                    <tr style="height: 92%">
                        <td>
                            <gw:grid id='grdDetail' header='_PK|_M_PK|_Seq|Tr.Date|Tr.Type|Tr.Amount|_Credit Line|_Balance|_Del.Req.Bal|Charger|Remark|CCY'
                                format='0|0|0|4|0|-2|-2|-2|-2|0|0|0' 
								aligns='0|0|0|0|0|3|3|3|3|0|0|0'
                                editcol='0|0|1|1|1|1|1|1|1|1|1|1' 
								widths='0|0|800|1200|1500|1500|1500|1500|1500|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' autosize="F" onafteredit="" />
                        </td>
                    </tr>
                </table>
			</td>
		</tr>
	   
	</table> 
<gw:textbox id="txt_p_wi_line_d_pk" styles='width:100%;display:none' />
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
<gw:textbox id="txtItem_PK" styles='width:100%;display:none' />	
<gw:textbox id="txtCharger_PK" styles='width:100%;display:none' />
<gw:textbox id="txt_saleorder_d_pk" styles='width:100%;display:none' />
<gw:textbox id="txt_wi_line_d_pk" styles='width:100%;display:none' />
<gw:textbox id="txtUser_PK"  text="" style="display:none" />
<gw:textbox id="txtPartnerPK"  text="" style="display:none" />
<gw:textbox id="txtLineStr"  text="" style="display:none" />
</body>

</html>
