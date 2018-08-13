<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Issue Invoice(Hotel)</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var l_crt_by;
var G1_PK=0,
G1_Select=1,
G1_Room=2,
G1_Invoice_No=3,
G1_Last_Name=4,
G1_First_Name=5,
G1_Checkin=6,
G1_Checkout=7,
G1_Night=8,
G1_Total_Due=9,
G1_Actual_Payed=10,
G1_Return_VND=11,
G1_Cash_VND=12,
G1_Cash_USD=13,
G1_Credit_Card_VND=14,
G1_Credit_Card_USD=15,
G1_AR_VND=16,
G1_Room_Charge=17,
G1_Restaurant=18,
G1_Minibar=19,
G1_Laudry=20,
G1_Biz_Center=21,
G1_Others=22,
G1_Other_Golf=23,
G1_Package_Golf=24,
G1_Advance=25,
G1_Adjust=26,
G1_Pay_Method=27,
G1_Customer=28,
G1_tco_buspartner_pk=29,
G1_Invoice_No_Acnt=30,
G1_tac_crca_pk=31;

var G2_pk=0,
G2_Issue_YN=1,
G2_Invoice_No=2,
G2_Invoice_Date=3,
G2_Book_Amt=4,
G2_Service_Rate=5,
G2_Service_Amt=6,
G2_SCT_Rate=7,
G2_SCT_Amt=8,
G2_VAT_Rate=9,
G2_VAT_Amt=10,
G2_Total_Due=11,
G2_Description=12,
G2_Local_Description=13,
G2_PL_Code_Name=14,
G2_Debit_Acc=15,
G2_Credit_Acc=16,
G2_Customer_Name=17,
G2_tac_crca_pk=18,
G2_Invoice_No_Acnt=19;
function BodyInit()
{
    grdSummaryReport.GetGridControl().FrozenCols = 4;
	grd2.GetGridControl().FrozenCols = 4;
    l_crt_by = "<%=Session("User_ID")%>";
	txt_employee_pk.text = "<%=Session("EMPLOYEE_PK")%>";
	chkAllGrid2.value ='N';
	//alert("Form nay dang bao tri. Co gi lien he Mr Thai(08-38122472). Thanks");
	
    dat_SummaryReport.Call("SELECT");
}
var g_lag='';
function OnSearch(obj)
{
	var pk_search="";
    var ctrl=grdSummaryReport.GetGridControl();
	if(obj=='1')
	{
		dat_SummaryReport.Call("SELECT");
	}
	if(obj=='2')
	{
		var l_customer_pk="",l_crca_acnt_pk="";
		if(grdSummaryReport.row !='-1')
		{
			for(var i=1;i<grdSummaryReport.rows;i++)
			{  
				if(grdSummaryReport.GetGridData(i,G1_Select) == -1)//checked
				{
					//pk_search += grdSummaryReport.GetGridData(i,G1_PK)+",";//master pk
					if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk) != "")//customer_pk
					  {
							if(l_customer_pk == "")
								{
									l_customer_pk=grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk);
									l_crca_acnt_pk=grdSummaryReport.GetGridData(i,G1_tac_crca_pk);
								}
							if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk)==l_customer_pk && grdSummaryReport.GetGridData(i,G1_tac_crca_pk)== l_crca_acnt_pk)	
							{
								pk_search += grdSummaryReport.GetGridData(i,G1_PK)+",";//master pk
							}
							else
							{
								alert("these bills are not the same invoice.So can not select together.");
								return;
							}
						}
				  else
				  {
					alert("Please input customer name row at " +i+ " to process.");
					return;
				  }
					
				}
			}
			if(pk_search =="")
			{
				alert("please choose golfer name to search.");
				return;
			}
			chkAllGrid2.value ='N';
			txtGolferPK.text = pk_search;
			dat_sel_grid2.Call("SELECT");
		}
		else
		{
			alert("please choose golfer name to search.");
		}		
	}
}
function OnPrintInvoice(){
  
		if(grdDone.rows > 1)
		{
			if(grdDone.GetGridData(1,G2_tac_crca_pk) != "")
			{
			    var p_tac_crca_pk = grdDone.GetGridData(1,G2_tac_crca_pk);
				var url = System.RootURL + "/reports/60/25/rpt_60250300_vat_invoice.aspx?p_tac_crca_pk="+ p_tac_crca_pk;
				System.OpenTargetPage(url);
			}else{
					alert("cannot get tac_crca_pk. Please ask software provider for help.");
			}
		}
		else
		{
			alert("No thing to print. Please create invoice firstly.");	
		}
	
}
function OnDataReceive(obj)
{
    switch(obj.id)
	{
		case 'dat_SummaryReport':
		        txtCount.text=grdSummaryReport.rows-1 + " item(s).";
				for (i = 1; i < grdSummaryReport.rows; i++)
				{
					if (grdSummaryReport.GetGridData(i,G1_tac_crca_pk) > 0 )
					{
						grdSummaryReport.SetCellBgColor(i, G1_PK, i,G1_tac_crca_pk,0XEE82EE);//0xB3B3D7  0x336633  0x0000CE
					}
				}
				
		break;
		case 'dso_process_inv'://process grid 1
			OnSearch('2');
		break;
		case 'dso_process_cancel_inv':
		    alert(txtReturn.text); 
			OnSearch('2');
		break;
		case 'dso_process_preview_inv':
			OnSearch('2');
		break;
		case 'dat_sel_grid2'://remain list
		    TotalPaymentDetail();
			dat_done.Call("SELECT");
		break;
		
    }
}

function OnProcess(obj)
{
	if(obj == '1')//process grid 1
	{
		var pk="";
		var l_customer_pk="",l_crca_acnt_pk="";
		
	   if(grdSummaryReport.row != -1){
			for(var i=1;i<grdSummaryReport.rows;i++){ 
				if(grdSummaryReport.GetGridData(i,G1_Select) == -1){
				  if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk) != ""){
						if(l_customer_pk == ""){
								l_customer_pk=grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk);
								l_crca_acnt_pk=grdSummaryReport.GetGridData(i,G1_tac_crca_pk);
						}
						
						if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk)==l_customer_pk 
						&& grdSummaryReport.GetGridData(i,G1_tac_crca_pk) == l_crca_acnt_pk){	
							pk += grdSummaryReport.GetGridData(i,G1_PK)+ ",";//master_pk
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
			if(confirm("Are you sure to process these rooms?")){
				txtGolferPK.text = pk;
				txtAction.text = "PROCESS";
				dso_process_inv.Call();
			}
		}
		else{
			alert("You must select room to process.");
		}
	}
}
function OnCancelProcess()
{
		var pk="";
		var l_customer_pk="",l_crca_acnt_pk="";
		
	   if(grdSummaryReport.row != -1){
			for(var i=1;i<grdSummaryReport.rows;i++){ 
				if(grdSummaryReport.GetGridData(i,G1_Select) == -1){
				  if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk) != ""){
						if(l_customer_pk == ""){
								l_customer_pk=grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk);
								l_crca_acnt_pk=grdSummaryReport.GetGridData(i,G1_tac_crca_pk);
						}
						
						if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk)==l_customer_pk 
						&& grdSummaryReport.GetGridData(i,G1_tac_crca_pk) == l_crca_acnt_pk){	
							pk += grdSummaryReport.GetGridData(i,G1_PK)+ ",";//master_pk
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
			if(confirm("Are you sure to cancel these rooms?")){
				txtGolferPK.text = pk;
				txtAction.text = "CANCEL";
				dso_process_inv.Call();
			}
		}
		else{
			alert("You must select room to process.");
		}
	
}
function CreateInvoice(){

    if(txtInvoiceNo.text == ""){
		alert("Please input your invoice.");
		txtInvoiceNo.GetControl().focus();
		return;
	}
	else if(txtInvoiceNo.text.length != 7){
		alert("Your invoice must be 7 digit.");	
		txtInvoiceNo.GetControl().focus();
		return;
	}
    if(grdDone.rows > 1){
	    alert("This room was printed invoice. You cannot print more. Only print one invoice for one room.");
		return;
	}
	
    var master_pk_grid2 = "";
		if(grd2.rows > 1){
			for(var i=1;i<grd2.rows;i++){
				if(grd2.GetGridData(i,G2_Issue_YN) == -1){
					master_pk_grid2 += grd2.GetGridData(i,G2_pk)+ ",";//pk
				}
			}
			if(master_pk_grid2 == ""){
				alert("You must check issue YN to create invoice.");
				return;
			}
			else{
				if(confirm("Do you want to create invoice?")){
					txtInvoiceIssuePK.text = master_pk_grid2;
					dso_process_preview_inv.Call();
				}
			}
		} 
		else{
		    alert("Please select room, process and check items that you want to create invoice then click create invoice button.");
			return;
		}
}


function OnPopup()
{		
	var l_customer_pk="",l_crca_acnt_pk="",l_tco_buspartner_pk_popup="",l_G1_Customer_Name_popup="",l_acnt_no="";
		if((grdSummaryReport.rows > 1) && (grdSummaryReport.col==G1_Customer))
		{
			if(grdSummaryReport.GetGridData(grdSummaryReport.row,G1_Select) == -1)
			{
				    var path = System.RootURL + "/form/60/24/60240010_bus.aspx?p_company_pk=<%=session("COMPANY_PK") %>";
					var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
					if ( object != null )
					{ 
						l_tco_buspartner_pk_popup= object[0]; //pk
						l_G1_Customer_Name_popup=object[2];//name
					}
			}
			else
			{
				alert("please,check invoice to choose customer!!!");
				return;
			}
		}
		else
		{
			//alert("please,check invoice to choose customer!!!");
			return;
		}
		if(l_tco_buspartner_pk_popup !="")
		{
			for(var i=1;i<grdSummaryReport.rows;i++)
			{ 
				
				if(grdSummaryReport.GetGridData(i,G1_Select) == -1)//checked
				{
					if(grdSummaryReport.GetGridData(i,G1_Invoice_No_Acnt) !="")
					{
						l_tco_buspartner_pk_popup = ""; //pk
						l_G1_Customer_Name_popup ="";//name
						l_acnt_no=grdSummaryReport.GetGridData(i,G1_Invoice_No_Acnt);
					}
					if(l_acnt_no =="")
					{
						grdSummaryReport.SetGridText(i, G1_tco_buspartner_pk, l_tco_buspartner_pk_popup); //pk
						grdSummaryReport.SetGridText(i, G1_Customer, l_G1_Customer_Name_popup);//name
					}
					else
					{
						//alert("these bills are not the same invoice.So can not select together.");
						alert("these bills are not change customer.So can not select invoice sent to accouting.");
						grdSummaryReport.SetGridText(i, G1_tco_buspartner_pk, l_tco_buspartner_pk_popup); //pk
						grdSummaryReport.SetGridText(i, G1_Customer, l_G1_Customer_Name_popup);//name
						grdSummaryReport.SetGridText(i, G1_Select,0); //uncheck
					}
				}
			}
		}
}
function OnSave()
{
	if(grdSummaryReport.row != "-1")
	{
		if((grdSummaryReport.GetGridData(grdSummaryReport.row,G1_Select) == -1)&& (grdSummaryReport.GetGridData(grdSummaryReport.row,G1_tco_buspartner_pk) !=""))
		{
			//alert(grdSummaryReport.GetGridData(grdSummaryReport.row,G1_Customer));
			dat_SummaryReport.Call();
		}
		else
		{
			alert("Please,check and choose the customer to save.");
			return;
		}
	}
}
function OnCancel()
{
	if(grdDone.rows > 1)
	{
        var tac_crca_pk = grdDone.GetGridData(1, 18);
		
    	if(confirm("Are you sure to cancel this invoice?")){
				txtTAC_CRCA_PK.text = tac_crca_pk;
				dso_process_cancel_inv.Call();
		}
	}else{
		alert("Nothing to cancel.");
	}
}
function OnCheck()
{
	if(grd2.rows>1)
	{
		if(chkAllGrid2.value =='Y')
		{
			for (i = 1; i < grd2.rows; i++)
			{
				if(grd2.GetGridData(i,G2_Invoice_No) !="")
				{
					grd2.SetGridText(i,G2_Issue_YN,-1);
				}
			}
			TotalPaymentDetail();
		}
		else
		{
				for (i = 1; i < grd2.rows; i++)
				{
					if(grd2.GetGridData(i,G2_Invoice_No) !="")
					{
						grd2.SetGridText(i,G2_Issue_YN,0);
					}
				}
				TotalPaymentDetail();
		}
	}
}
function TotalPayment()
{
	var l_customer_pk="",l_crca_acnt_pk="",TotalPay=0;
		if(grdSummaryReport.rows > 1)
		{
			for(var i=1;i<grdSummaryReport.rows;i++)
			{  
				if(grdSummaryReport.GetGridData(i,G1_Select) == -1)//checked
				{
					if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk) != "")//customer_pk
					  {
							if(l_customer_pk == "")
								{
									l_customer_pk=grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk);
									l_crca_acnt_pk=grdSummaryReport.GetGridData(i,G1_tac_crca_pk);
								}
							if(grdSummaryReport.GetGridData(i,G1_tco_buspartner_pk)==l_customer_pk && grdSummaryReport.GetGridData(i,G1_tac_crca_pk)== l_crca_acnt_pk)	
							{
								TotalPay += Number(grdSummaryReport.GetGridData(i,G1_Total_Due));//master pk
							}
							else
							{
								//alert("these bills are not the same invoice.So can not select together.");
								//grdSummaryReport.SetGridText(i, G1_Select,0); //uncheck
								//return;
							}
						}
				  else
				  {
					//customers is null
				  }
					
				}
			}
			//sum total pay master!
			txtTotalPayment.text=TotalPay;
		}
		else
		{
			//not data
		}		
}
function TotalPaymentDetail()
{
	var TotalPayDetail=0;
		if(grd2.rows > 1)
		{
			for(var i=1;i<grd2.rows;i++)
			{  
				if(grd2.GetGridData(i,G2_Issue_YN) == -1)//checked
				{
					TotalPayDetail += Number(grd2.GetGridData(i,G2_Total_Due));
				}
			}
			//sum total pay detail!
			txtTotalPaymentDetail.text=TotalPayDetail;
		}
		else
		{
			//not data
		}		
}
function OnPrintAcctSlip(){
  
  if(grdDone.row <= 0){
	 alert("Please select data in the grid at the bottom right to print.");	
	 return;
  }
  
  var tac_hgtrh_pk=grdDone.GetGridData(grdDone.row,20);
 
 if(tac_hgtrh_pk == ""){
	 alert("Please print invoice fisrtly then print accounting slip.");	
	 return;
  }
  
  var url =System.RootURL + '/standard/reports/gf/hg/60080010_envn.aspx?seq='+ tac_hgtrh_pk;
  System.OpenTargetPage( url , 'newform' );
		
}

function OnChangeCustomer(){
   
	var path = System.RootURL + "/form/60/24/60240010_bus.aspx?p_company_pk=<%=session("COMPANY_PK") %>";
	var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
	if ( object != null ){ 
		for(var i=1;i<grdDone.rows;i++){
		    if(grdDone.GetGridData(i,19) == ""){
			   grdDone.SetGridText(i,21,object[0]);//pk customer
			   grdDone.SetGridText(i,17,object[2]);//customer name
			}
		}
	}

}
function OnPrint()
{
	var url = '/standard/reports/ht/fo/rpt_htfo00340_issue_invoice.aspx?p_dt_frm='+ dtTranTo.value;
			System.OpenTargetPage( System.RootURL+url , "newform" );  
}
</script>

<body>
    <gw:data id="dat_SummaryReport" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,29"  function="st_ht_sel_60250300" procedure="st_ht_upd_60250300" > 
            <input bind="grdSummaryReport">                    
                <input bind="dtTranTo" /> 
                <input bind="txtLockerNo" /> 
            </input> 
            <output bind="grdSummaryReport"></output>
        </dso> 
    </xml> 
</gw:data> 
<!-----------------------process----grid--1------------------------->
<gw:data id="dso_process_inv" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="st_ht_pro_60250300" > 
            <input>
                <input bind="txtGolferPK" />
				<input bind="txtAction" />
            </input> 
            <output>
                <output bind="txtReturn" />
            </output>
        </dso> 
    </xml> 
</gw:data>
<!-----------------------process----preview-----invoice----grid--2-------------->
<gw:data id="dso_process_preview_inv" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="st_ht_pro_60250300_create_inv" > 
            <input>
                <input bind="txtInvoiceIssuePK" />
				<input bind="txtInvoiceNo" />
            </input> 
            <output>
                <output bind="txtReturn" />
            </output>
        </dso> 
    </xml> 
</gw:data>

<!-------select-----grid-----2-------------------->
<gw:data id="dat_sel_grid2" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid"   function="st_ht_pro_60250300_detail_remain" > 
            <input bind="grd2">                    
                <input bind="txtGolferPK" /> 
            </input> 
            <output bind="grd2"></output>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_done" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,19,21"  function="st_ht_sel_60250300_detail"  procedure="st_ht_upd_60250300_detail"> 
            <input bind="grdDone">                    
                <input bind="txtGolferPK" /> 
            </input> 
            <output bind="grdDone"></output>
        </dso> 
    </xml> 
</gw:data>
<!--------------cancel----invoice------------>
<gw:data id="dso_process_cancel_inv" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="st_ht_pro_60250300_cancel" > 
            <input>
                <input bind="txtTAC_CRCA_PK" />
            </input> 
            <output>
                <output bind="txtReturn" />
            </output>
        </dso> 
    </xml> 
</gw:data>

<!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 2%">
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
                                                    <td align="right" width="5%">
                                                        Date</td>
                                                    <td width="10%">
                                                        <gw:datebox id="dtTranTo" lang="1" onchange="OnSearch('1')" />
                                                    </td>
                                                    <td align="right" width="13%"> 
                                                        Invoice/Room#</td>
                                                    <td width="13%">
                                                        <gw:textbox id="txtLockerNo" lang="1" onenterkey="OnSearch('1')" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="search" onclick="OnSearch('1')" />
                                                    </td>
													<td style="width: 3%" align="right">
                                                        <gw:icon id="btnSave" img="2" text="Process" styles='width:100%' onclick="OnProcess('1')" />
                                                    </td>
													<td style="width: 3%" align="right">
                                                        <gw:icon id="btnSave" img="2" text="Cancel" styles='width:100%' onclick="OnCancelProcess()" />
                                                    </td>
													<td style="width: 3%" align="right">
														<gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
													</td>
                                                    <td width="10%">Total Pay</td>
													<td width="15%"><gw:textbox id="txtTotalPayment" type="number" format="###,###,###" styles="text-align:right;width:100%;" /></td>
                                                    <td align="right" style="width: 12%">
                                                        <b>Total Record</b></td>
                                                    <td style="width: 25%" align="center">
                                                        <gw:label id="txtCount" />
                                                    </td>
													<td style="width: 3%" align="center">
                                                        <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnPrint()" />
                                                    </td>
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
		
        <tr style="width: 100%; height: 48%">
            <td width="100%" >
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdSummaryReport" header="_PK|Select|RM#|Invoice No|Last Name|First Name|Checkin|Checkout|Night|Total Due|Actual Payed|Bank transfer(VND)|Cash (VND)|Cash(USD)|Credit Card(VND)|Credit Card(USD)|AR(VND)|Room Charge|Restaurant|Minibar|Laudry|Telephone|Others|Spa Amt|Special Svc Amt|Advance|Adjust|Pay Method|Customer|_tco_buspartner_pk|Invoice No Acnt|_tac_crca_pk" 
								format="0|3|0|0|0|0|4|4|-0|-0|-0|-0|-0|1|-0|1|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0"
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 	
								styles="width:100%;height:100%"
								autosize='T'
								debug='false'
								acceptnulldate="T" oncellclick="TotalPayment()"
								oncelldblclick="OnPopup()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
		
		<tr style="width: 100%; height: 50%">
            <td width="100%" >
                <table valign='top'  cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
					<tr style="height: 2%">
							<td style="width: 11%"><gw:checkbox id="chkAllGrid2" defaultvalue="Y|N" onchange="OnCheck()"  />Select All</td>
							<td style="width: 33%">
								<b style="color: Red; font-weight: bold">Select Room----->Process------->Create Invoice------->Print Invoice---->Print Acc.Slip</b>		
							</td>
							<td style="width: 10%" align="right">
								Total Due&nbsp;
							</td>
							<td style="width: 15%" align="right">
								<gw:textbox id="txtTotalPaymentDetail" type="number" format="###,###,###" styles="text-align:right;width:80%;" />&nbsp;&nbsp;
							</td>
							<td style="width: 15%" align="right">
								Invoice#
							</td>
							<td style="width: 10%" align="right">
								<gw:textbox id="txtInvoiceNo" maxlen="7" />
							</td>
							<td style="width: 3%" align="right">
								<gw:imgbtn id="btnSearch2" img="search" width="100%" img="in" text="search" onclick="OnSearch('2')" />
							</td>
							<td style="width: 2%" align="right">
							   <gw:icon id="btnCreateInvoice" img="2" text="Create Invoice" styles='width:100%' onclick="CreateInvoice()" />
							</td>
							<td style="width: 2%" align="right">
							<gw:icon id="idBtnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnCancel()" />
							</td>
							<td style="width: 2%" align="right">
							</td>
							<td style="width: 8%" align="right">
								<gw:icon id="idBtnPrintBill" img="2" text="Print Invoice" styles='width:100%' onclick="OnPrintInvoice()" />
							</td>
							
							<td style="width: 5%" align="right">
								<gw:icon id="idBtnAcctSlip" img="2" text="Acc.Slip" styles='width:100%' onclick="OnPrintAcctSlip()" />
							</td>
							
					</tr>
				<tr valign="top" style="height: 98%">
					<td colspan="14" >
					   <table style="width:100%;height: 100%">
						    <tr>
							    <td width="50%">
								<gw:grid id="grd2" header="_pk|Issue YN|Invoice No|Invoice Date|Book Amt|Service Rate|Service Amt|SCT Rate|SCT Amt|VAT Rate|VAT Amt|Total Due|Description|Local Description|PL Code Name|Debit Acc|Credit Acc|Customer Name|_tac_crca_pk|_Invoice No(Acnt)|_tac_hgtrh_pk"
									format="0|3|0|0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0|0|0|0|0" 
									aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
									styles="width:100%; height:100%" oncellclick="TotalPaymentDetail()"
									sorting="T" autosize="T"  />
								</td>
								<td width="50%">
									<gw:grid id="grdDone" header="_pk|_IssueYN|Invoice No|Invoice Date|Book Amt|Service Rate|Service Amt|SCT Rate|SCT Amt|VAT Rate|VAT Amt|Total Due|Description|Local Description|PL Code Name|Debit Acc|Credit Acc|Customer Name|_tac_crca_pk|Invoice No(Acnt)|_tac_hgtrh_pk|_tco_buspartner_pk"
									format="0|3|0|0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0|0|0|0|0|0" 
									aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
									styles="width:100%; height:100%"
									sorting="T" autosize="T"  oncelldblclick="OnChangeCustomer()"/>
								</td>
							</tr>
					   </table>
				    </td>
				</tr>
			</table>
		</td>
	</tr>
</table>

    <gw:textbox id="txtAction" style="display: none" /> 
    <gw:textbox id="txtGolferPK" style="display: none" /> 
	<gw:textbox id="txtInvoiceIssuePK" style="display: none" /> 
	<gw:textbox id="txtTAC_CRCA_PK" style="display: none" /> 
	<gw:textbox id="txtReturn" style="display: none" />
	<gw:textbox id="txtInvoiceNo_ACNT" style="display: none" />
	<gw:textbox id="txt_Cancel_crca_pk" style="display: none" /> 
	<gw:textbox id="txt_employee_pk" style="display: none" />
	<gw:textbox id="txtPrint_Param" text="1,2,3" styles="display:none;" />
</body>
</html>