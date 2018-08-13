<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>External Payment</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <OBJECT classid="CLSID:20E4176F-7756-4630-86AA-AB0ECD841BC3" width=0 height=0 VIEWASTEXT></OBJECT>
<script>

function Capture()
{	
  var err;
	var result = false;
	
	// Check ID is not NULL
	/*if (document.MainForm.UserID.value == "")
	{
		alert("Please enter user id!");
		return(false);
	}*/
	
	try // Exception handling
	{
		var objUCBioBSP = new ActiveXObject("UCBioBSPCOM.UCBioBSP.1");
		var objDevice = objUCBioBSP.Device;
		var objExtraction = objUCBioBSP.Extraction;
		var objMatching = objUCBioBSP.Matching;

		// Open device. [255 = AUTO_DETECT]
		// You must open device before capture.
		objDevice.Open(255);
		err = objUCBioBSP.ErrorCode;
		if (err != 0)		// Device open failed
		{
			alert("Device open failed!");
		}
		else
		{
			// Capture user's fingerprint.
			objExtraction.Capture();
			err = objUCBioBSP.ErrorCode;
			if (err != 0)		// Capture failed
			{
				alert("Capture failed! [Error : " + err + " (" + ibjUCBioBSP.ErrorDescription + ")]");
			}
			else	// Capture success
			{
				// Get text encoded FIR data from NBioBSP module.
				document.getElementById('FIRTextData').value = objExtraction.TextFIR;
				//alert(document.MainForm.FIRTextData.value);
				var fFIRTextData='AQAAAEgAAADAAQAAAQASAAEAZAAAAAAANAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/53o0AjGY1ACQYqDHIqn5USbIuZ3RTvkiOsUXYklB+Nd8PP4utwDJORrC1opsRpRYjVVaX9ASa8k9r/BqWkyf/zYgvtb3fN6GClRj89tJMLfJb3xKQZgZ6cM8qIQgUrbsff9qxC0oINDAQU7mBHXQ0Q8SJs2nMsm4yp2EKBeqLsrHgtJapiAS+keFJZnPZ3d8K3mQcu31oBsupBL4vBj5a2GSkq4V1GfZAEHW0e43XMv0IFwuBkCQTE94MiXjRI8PKotec7RVrmZVd528GInj8qV2at2boZkhGfLmlN9g6ayqo+Dzzzx41MFClSvpqsHiQWFmrVYRRp2queYIrhgOVwvdg6YWaJBqIql+PmTm7onbL9/V6ij1pYUfYCQfLkRCcAIwIlV/Yf5cAal8olNLiQNyyan4H3WpVU/iMZS9yPBJgjBcdEqBLOgVg7/p0lOf2gyj2f/tma8htGZ9dnY2ltiw5jJZQ2nt0fLDdH6REg7qPTIozFxXiiCXVN9i2uJ8oxonb1oTfMDp6xzOF9wKGbsBRJXXmO4Zem4wJNV5VRQ1hSkMD1oPSN0Asd87vuBwztuRKNYsL9Hw1XC+0Nzw=';
				// Verify Match
				objMatching.VerifyMatch(document.getElementById('FIRTextData').value, fFIRTextData)
				//result = true;
				if (objMatching.MatchingResult == 0 )	// Matching failed. [0:FALSE,Others:TRUE]
					alert("Verification failed!");
					else	// Matching success
						alert("Verification success!");
				  
			}
		
			// Close device. [AUTO_DETECT]
			objDevice.Close(255);
		}
				
		objExtraction = 0;
		objDevice = 0;		
		objUCBioBSP = 0;
	}
	catch(e)
	{
		alert(e.message);
		return(false);
	}
	
	if (result)
	{
		// Submit main form
		document.MainForm.submit();
	}
	
	return (result);
}

var click_dr = 0;
var click_cr = 0;
var flag_del = false;
var cur_before_change = "";

var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;

var g_upd_yn_dr = false;
var g_upd_yn_cr = false;
var g_user_pk = "";
var g_emp_id = "";
var g_usr_id = "";

var G1_Chk=0,
G1_Seq=1,
G1_Voucher_Type=2,
G1_Voucher_No=3,
G1_Pay_Date=4,
G1_Total_Amount=5,
G1_Bank_Code=6,
G1_Bank_Name=7,
G1_CCY=8,
G_1_Address=9,
G1_Customer_Name=10,
G1_Customer_Note=11,
G1_Aprove_Interface_YN=12,
G1_Create_By=13,
G1_Create_Date=14,
G1_Swift_Code=15,
G1_Account_No=16,
G1_Account_No_beneficiary=17,
G1_Description=18,
G1_TRANS_SOURCE=19,
G1_TRANS_TIME=20,
G1_tfn_eppaytr_pk=21,
G1_STATUS_ITF_YN=22; 

function BodyInit()
{
    System.Translate(document);
    g_user_pk = "<%=Session("USER_PK") %>";
    g_emp_id = "<%=Session("EMP_ID") %>";
    g_usr_id = "<%=Session("User_ID") %>";
    
	var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0  ")%>";
	lstCompany.SetDataText(ls_data);
	
	var ls_data2       = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
	lstVoucherType.SetDataText(ls_data2);
    lstVoucherType.value = 'BN';
	
	data ="data|ALL|-- Select All --|Y|Interface(Y)|N|Interface(N)"
	lstPaymentType.SetDataText(data); 
	lstPaymentType.SetDataText(data);

}
function OnSearch()
{
	dso_sel_grd_paid.Call("SELECT");
}
function OnPayment()
{	
		var pk="";
		var l_customer_pk="",l_crca_acnt_pk="";
		//alert(grid_paid.rows);
	   //alert(grid_paid.rows-1)
			for(var i=1;i<grid_paid.rows;i++)
			{ 
				if(grid_paid.GetGridData(i,G1_Chk) == -1)
				{
				  if(grid_paid.GetGridData(i,G1_STATUS_ITF_YN) == "N")
				  {
						pk += grid_paid.GetGridData(i,G1_Seq)+ ",";//master_pk
						//alert(pk);
				  }				  
			   }
			}
			if(pk!="")
			{			
				if(confirm("Are you sure to process ?"))
				{
					txt_pk_arr.text = pk;
					dso_upd_confirm_payment.Call();
				}
			}
		
}
function OnCheck()
{
	if(grid_paid.rows>1)
	{
		//alert(chkAllGrid2.value);
		if(chkAllGrid2.value =='Y')
		{
			for (i = 1; i < grid_paid.rows; i++)
			{
				if(grid_paid.GetGridData(i,G1_Chk) =="0")
				{
					grid_paid.SetGridText(i,G1_Chk,-1);
				}
			}
		}
		else
		{
				for (i = 1; i < grid_paid.rows; i++)
				{
					if(grid_paid.GetGridData(i,G1_Chk) !="0")
					{
						grid_paid.SetGridText(i,G1_Chk,0);
					}
				}
		}
	}
}

function OnDataReceive(obj)
{
	if(obj=='dso_upd_confirm_payment')
	{
		alert(txtStatus.text);
		OnSearch();
	}
}
</script>
<body style="margin:0; padding:0;">
<!------------------1------------------------------------------------------------>
    <gw:data id="dso_sel_grd_paid" onreceive="">
        <xml>
            <dso type="grid" function="ac_sel_60100080_payment_itf">
                <input bind="grid_paid">
                    <input bind="lstCompany"/>
					<input bind="txtvoucher_no"/>
					<input bind="txtseq"/>
					<input bind="dtPay_fr"/>
					<input bind="dtPay_to"/>
					<input bind="txtBankID_Name"/>
					<input bind="txtCustomer"/>
					<input bind="lstPaymentType"/>	
                </input>
                <output bind="grid_paid"/>
            </dso>
        </xml>
    </gw:data>

<!----------------------------------ac_pro_60100080_payment_itf-------------------------------------------->
<gw:data id="dso_upd_confirm_payment" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100080_payment_itf" > 
                <input> 
                     <input bind="txt_pk_arr"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		        <tr>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="7%"></td>
                    <td width="9%"></td>
                    <td width="10%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td><gw:list id="lstCompany" onChange="dso_get_department.Call()" styles='width:100%'></gw:list></td>
                    <td align="right">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0"> 
                        <tr>
                            <td align="right">Voucher No</td>
                            <td><gw:checkbox id="chkauto_YN" value="T"  onclick="OnAutoYN()"/></td>
                        </tr>
                        </table>
				    </td>
				    <td><gw:list id="lstVoucherType" onChange="OnChangeList()" styles="width:100%"></gw:list></td>
                    
					<td ><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()" csstype="mandatory" /></td>
					<td><gw:textbox id="txtvoucher_auto" styles="width:100%;display:none"/></td>
                    <td align="center">SEQ</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td></td> 
                    <td colspan=2>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
							<td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"     onclick="OnSearch()" /></td>
                            <td align="right">Check All</td>
                            <td><gw:checkbox id="chkAllGrid2" defaultvalue="Y|N" onchange="OnCheck()"  /></td>
				            <td><gw:icon id="btnPayment"    img="in" text="Interface"     styles='width:100%' onclick="OnPayment()"/></td>    
							<td><gw:icon id="btnGoItfPgage"    img="in" text="Go To Interface"     styles='width:100%' onclick="OnPayment()"/></td>    
                        </tr>
                        </table>
				    </td>
                </tr>
                <tr>
                    <td align="right">Pay Date</td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td> 
				    <td colspan= 5>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="15%" align="right; white-space:nowrap;">Bank ID/Name</td>
                            <td width="27%"><gw:textbox id="txtBankID_Name" styles='width:100%'/></td>
                            <td width="23%" align="right">Customer</td>
                            <td width="35%"><gw:textbox id="txtCustomer" styles='width:100%'/></td>  
                        </tr>
				        </table>
				    </td>
				    <td colspan="2">
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
							<td width="35%" align="right">Interface Y/N</td>
							<td width="65%"><gw:list id="lstPaymentType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                                                    
                        </tr>
                        </table>
				    </td>
                </tr>
                
                </table>
            </td>
        </tr>
		
        <tr >
		<td  style="height:100%">
		<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
		<tr style="height:100%">
			<td id="master" width="100%">
				<gw:grid
					id="grid_paid"
					header  ="Chk|Seq|Voucher Type|Voucher No|Pay Date|Total Amount|Bank Code|Bank Name|CCY|Address|Customer Name|Customer Note|Aprove Interface YN|_Create By|_Create Date|Swift Code|Account No|Account No(beneficiary)|Description|TRAN_SOURCE|TRANS_TIME|_tfn_eppaytr_pk|STATUS_ITF_YN|bank_code_deposit"
					format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					aligns  ="1|1|1|1|1|3|0|0|0|0|0|0|1|1|1|1|3|0|0|0|0|0|0|0"
					defaults="||||||||||||||||||||||||"
					editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths  ="400|1000|1500|1500|1500|1500|1500|1500|3500|2000|0|0|1500|1000|1500|1500|1500|1500|3500|2000|0|0|1500|1500"
					styles="width:100%;height:100%"
					sorting="T" autosize="T"
					onafteredit=""
					acceptNullDate="T"
					/>
			</td>
		</tr>	
	</table>
	</td>
	</tr>
</table>

<gw:textbox id="txtProposedByUserPk"    style="display:none"/>
<gw:textbox id="txtProposedByUserID"    style="display:none"/>
<gw:textbox id="txtProposedByUserName"  style="display:none"/>


<gw:list    id="lstBook_ccy" 		    style="width:75%;display:none"></gw:list >
<gw:textbox id="txtBookRate"            style="display:none" />
<gw:textbox id="txt_date"               style='display:none'/>
<gw:textbox id="txt_paydate"               style='display:none'/>
<gw:textbox id="txt_rowclick"         style='display:none'  />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:textbox id="txt_drcr_type"              style='display:none'/>
<gw:textbox id="txt_str"                    style='display:none'/>
<gw:textbox id="txt_eppaytrh_pk"            style='display:none'/>
<gw:textbox id="txt_index"                  style='display:none'/>
<gw:textbox id="txt_eppaytrd_pk"            style='display:none'/>
<gw:textbox id="txtacpk"                    style='display:none'/>
<gw:textbox id="txt_count"                  style='display:none'/>
<gw:textbox id="txt_tmp"                    style='display:none'/>
<gw:textbox id="txtcur"                     style="display:none"/>
<gw:textbox id="txtrate"                    style="display:none"/>
<gw:textbox id="txtAccPK_CR"                    style="display:none"/>
	
<gw:textbox id="txt_pk_arr"                    style="display:none"/>
<input type=hidden name='FIRTextData'>
<input type=button OnClick='Capture()' value=' Verify '>
</body>
</html>