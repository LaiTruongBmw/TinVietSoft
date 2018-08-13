<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var G_pk=0,
	G_Select=1,
	G_Folio=2,
	G_Total_Amount=3,
	G_Guest_Name=4,
	G_Customer=5,
	G_tax_code=6,
	G_Invoice_No=7,
	G_tac_crca_pk=8,
	G_acc_slip_pk=9,
	G_partner_pk=10;
function BodyInit()
{
	var data="";
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE     DEL_IF = 0 AND PARENT_CODE = 'POINT' AND code IN('POINT-01','POINT-02','POINT-03','POINT-04')" )%>|ALL|ALL F&B"; 
	lstLocation.SetDataText(data);
	lstLocation.value = 'ALL';
	txt_employee_pk.text = "<%=Session("EMPLOYEE_PK")%>";
	data ="data|1|User1|2|User 2"
	lstReportType.SetDataText(data); 
	lstReportType.value='1';
    OnSearch();
}
function OnSearch()
{
    dso_Issue_Invoice.Call("SELECT");
}
function OnProcess(obj)
{
   if(obj=='process')
   {
	   if(grdIssueInvoice.rows >1  )
		{
			var pk="";
			var l_customer_pk="",l_crca_acnt_pk="";
			
		   if(grdIssueInvoice.row != -1){
				for(var i=1;i<grdIssueInvoice.rows-1;i++){ 
					if(grdIssueInvoice.GetGridData(i,G_Select) == -1){
					  if(grdIssueInvoice.GetGridData(i,G_partner_pk) != ""){
							if(l_customer_pk == ""){
									l_customer_pk=grdIssueInvoice.GetGridData(i,G_partner_pk);
									//l_crca_acnt_pk=grdIssueInvoice.GetGridData(i,G_tac_crca_pk);
							}
							
							if(grdIssueInvoice.GetGridData(i,G_partner_pk)==l_customer_pk) 
							//&& grdIssueInvoice.GetGridData(i,G_tac_crca_pk) == l_crca_acnt_pk)
							{	
								pk += grdIssueInvoice.GetGridData(i,G_pk)+ ",";//master_pk
							}
							else{
								alert("these bills are not the same invoice.So can not select together.");
								return;
							}
					  }
					  else{
						alert("Please input customer name row at " + i + " to process.");
						return;
					  }
				   }
				}
				
				if(txtInvoiceNo.text == ""){
					alert("You must input invoice no");
					txtInvoiceNo.GetControl().focus();
					return;
				}else if(txtInvoiceNo.text.length != 7){
					alert("Invoice no must be 7 number.");
					txtInvoiceNo.GetControl().focus();
					return;
				}
				
				if(confirm("Are you sure to process ?")){
					txtPK.text = pk;
					idBtnProcess.SetEnable(false);
					dso_process_inv.Call();
				}
			}
			else{
				alert("You must check guest to process.");
			}

		}
	}
	else if(obj=='cancel')
	{
		if(grdIssueInvoice.rows >1  )
		{
			if(grdIssueInvoice.row >0  )
			{
				txt_crca_pk.text=grdIssueInvoice.GetGridData(grdIssueInvoice.row, G_tac_crca_pk);
				if(confirm("Are you sure you want cancel this Location?"))
				{
					dso_cancel_inv.Call();
				}
			}
		}
	}
}
function OnPrint(obj)
 {
	if(obj=='invoice')
	{	
		 if(grdIssueInvoice.rows > 1)
		 {
			if(grdIssueInvoice.row >0)
			{
				if(grdIssueInvoice.GetGridData(grdIssueInvoice.row, G_Invoice_No)=="")
				{
				    alert("This room has not create invoice yet. So no thing to print invoice.");
					return;
				}
				var p_tac_crca_pk=grdIssueInvoice.GetGridData(grdIssueInvoice.row, G_tac_crca_pk);
				if(lstReportType.value=='1')//user 1 Ms.Mai
				{
					var url = System.RootURL + "/reports/60/25/rpt_60250300_vat_invoice.aspx?p_tac_crca_pk="+ p_tac_crca_pk;
				   System.OpenTargetPage(url);

				}
				if(lstReportType.value=='2')
				{
					var url = System.RootURL + "/reports/60/25/rpt_60250300_vat_invoice.aspx?p_tac_crca_pk="+ p_tac_crca_pk;
				    System.OpenTargetPage(url);

				}
					
			}
		 }
	}
	if(obj=='acc_slip')
	{	
		 if(grdIssueInvoice.rows > 1)
		 {
			if(grdIssueInvoice.row >0)
			{
				if(grdIssueInvoice.GetGridData(grdIssueInvoice.row, G_Invoice_No)=="")
				{
					return;
				}
				var url =System.RootURL + '/standard/reports/gf/hg/60080010_envn.aspx?seq='+grdIssueInvoice.GetGridData(grdIssueInvoice.row,G_acc_slip_pk);
			    System.OpenTargetPage( url , 'newform' );
			}
		 }
	}  
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='dso_process_inv')
	{
	    idBtnProcess.SetEnable(true);
		if(grdIssueInvoice.rows>1)
		{
			lblRecord.text=Number(grdIssueInvoice.rows-1) +" "+"row(s).";
			alert(txtReturn.text);
			dso_Issue_Invoice.Call("SELECT");
		}
	}
	if(obj.id=='dso_Issue_Invoice')
	{
		if(grdIssueInvoice.rows>1)
		{
			lblRecord.text=Number(grdIssueInvoice.rows-1) +" "+"row(s).";
			//grdIssueInvoice.Subtotal( 1, 2, -1, '3');
			for (i = 1; i < grdIssueInvoice.rows; i++)
			{
				if (grdIssueInvoice.GetGridData(i, G_tac_crca_pk) > 0 )
				{
					grdIssueInvoice.SetCellBgColor(i,0, i,8,0XEE82EE);//0xB3B3D7  0x336633  0x0000CE
				}
			}
			grdIssueInvoice.Subtotal( 0, 2, -1, '3');
		}
	}
	if(obj.id=='dso_cancel_inv')
	{
		OnSearch();
	}
 }
function OnSave()
{
	if(grdIssueInvoice.rows >1)
	{
		if(grdIssueInvoice.row >0)
		{
			dso_Issue_Invoice.Call();
		}
	}
}
function OnPopup()
{
	if(grdIssueInvoice.col==G_Customer)//Company
	{
	if(grdIssueInvoice.GetGridData(grdIssueInvoice.row,G_Select) != -1){
		alert("You must select at least a bill to update customer.");
		return;
	}
	
		var path = System.RootURL + "/form/ht/bk/htbk00010_bus.aspx?";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{//alert(object)
			    for(var i=1;i<grdIssueInvoice.rows;i++){ 
					if(grdIssueInvoice.GetGridData(i,G_Select) == -1){
					  //if(grdIssueInvoice.GetGridData(i,G_partner_pk) == ""){
						grdIssueInvoice.SetGridText(i,G_partner_pk, object[0]);//company_pk object[0];
						grdIssueInvoice.SetGridText(i,G_Customer, object[2]);//company name object[4];
						grdIssueInvoice.SetGridText(i,G_tax_code, object[6]);//company name object[4];					  
					  //}
					}
				}	
				
			}
 
	}
}

</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dso_Issue_Invoice" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,10" function="st_ht_sel_60250330" procedure="st_ht_upd_60250330">
            <input bind="grdIssueInvoice">                    
                <input bind="dtFromDate" />
    		    <input bind="dtTo" />
				<input bind="lstLocation" />
            </input> 
            <output bind="grdIssueInvoice" />
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_process_inv" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="st_ht_pro_60250330" > 
            <input>
				<input bind="lstLocation" />
				<input bind="txtPK" />
                <input bind="dtFromDate" />
				<input bind="txtInvoiceNo" />
            </input> 
            <output>
                <output bind="txtReturn" />
            </output>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_cancel_inv" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="st_ht_pro_60250330_cancel" > 
            <input>
				<input bind="txt_crca_pk" />
            </input> 
            <output>
                <output bind="txtReturn" />
            </output>
        </dso> 
    </xml> 
</gw:data>

    <!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td style="width: 5%">
                                                        Date
                                                    </td>
                                                    <td style="width:15%; white-space: nowrap">
                                                        <gw:datebox id="dtFromDate" lang="1" onchange="OnSearch()" />
														~
                                                       <gw:datebox id="dtTo" lang="1" onchange="OnSearch()" />
                                                    </td>
													<td style="width: 7%">
														Invoice No</td>
													<td style="width:5%">
														<gw:textbox id="txtInvoiceNo" styles='width:100%' maxlen=7 />
													</td>
													<td style="width: 8%">
														Location(Outlet)</td>
													<td style="width:10%">
														<gw:list id="lstLocation" styles='width:100%' onchange="OnSearch()" />
													</td>
                                                    <td width="30%" align="right" style="color:red">
														Khi nhan nut process thi tu ngay va den ngay phai bang nhau. 
                                                     </td> 
													
													<td width="5%" align="right">
														Total:
                                                     </td>
													<td style="width: 5%; white-space: nowrap">
														<gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
													</td>
													<td width="3%"> 
                                                        <gw:imgbtn id="btnSearch" img="search" width="100%" img="in" text="Search" onclick="OnSearch()" />
                                                    </td>
                                                    
                                                    <td style="width: 10%" align="center">
														<gw:list id="lstReportType" styles="width: 100%" />
                                                    </td>
                                                    
                                                    <td width="3%">
														<gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />                     
                                                    </td>
													<td><gw:icon id="idBtnProcess" img="2" text="Process" alt="Process" styles='width:100%' onclick="OnProcess('process')" /></td>
													<td><gw:icon id="idBtnPrintInvoice" img="2" text="Print Invoice" alt="Print Invoice" styles='width:100%' onclick="OnPrint('invoice')" /></td>
													<td><gw:icon id="idBtnPrintAccSlip" img="2" text="Print Acc Slip" alt="Print Acc Slip" styles='width:100%' onclick="OnPrint('acc_slip')" /></td>
													<td><gw:icon id="idBtnCancel" img="2" text="Cancel" alt="Cancel" styles='width:100%' onclick="OnProcess('cancel')" /></td>	
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%"> 
                            <gw:grid id='grdIssueInvoice'
							header='_pk|Select|Folio#|Total Amount|Guest Name|Customer|Tax Code|Invoice No|_tac_crca_pk|_acc_slip_pk|_tco_buspartner_pk|Location'
							format='0|3|0|-0|0|0|0|0|0|0|0|0'
							aligns='0|0|0|0|0|0|0|0|0|0|0|0'
							check='|||||||||||'
							editcol='0|0|0|0|0|0|0|0|0|0|0|0'
							widths='0|0|0|0|0|0|0|0|0|0|0|0'
							sorting='T'
							autosize='T' 
							styles='width:100%; height:100%'
							oncelldblclick="OnPopup()"
							/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtPK" style="display: none" />
	<gw:textbox id="txtReturn" style="display: none" />
	<gw:textbox id="txt_crca_pk" style="display: none" />
	<gw:textbox id="txt_employee_pk" style="display: none" />
	
</body>
</html>
