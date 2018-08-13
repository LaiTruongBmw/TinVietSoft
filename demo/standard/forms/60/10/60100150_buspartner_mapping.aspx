<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser("acnt")%>

<script>
// 1, 6,10,13,14,20

var g_Save = false ;
var g_check  = false;
var g_distinct = false;
//idGrid
var g_buspartner_pk_1 = 0;

//grdDtl2
var g_pk = 0,
	g_no = 1,
	g_buspartner_pk = 2,
	g_cus_nm = 3,
	g_Sender_nm = 4;
function BodyInit()
{
    System.Translate(document);
	g_tco_company_pk = "<%=Request("tco_company_pk") %>"
	txtCompanyPk.text = g_tco_company_pk;
	var senderNm =  "<%=Request("senderNm") %>";
	txtCustomerID.text =  "<%=Request("BizPartnerCode") %>"; 
	
	//txtsender_nm.text = senderNm;
	//onSearch();
	OnSearch1();
}


/*function onSearch()
{
	dsomapping.Call();
}*/



//--------------------------------------------
function OnDataReceive(iObj)
{
	
}
//--------------------------------------------
function onSave()
{
	
	if(g_distinct == false){
		g_Save = true;
		dsomapping.Call();
	}else{
		alert('cus name distinct ');
	}
	
}

function OnSearch1()
{
	
    datGetCustomer1.Call("SELECT");
}

//-------------------------On new -------------------------
function OnNew(obj){
	switch(obj){
		case 'newRow':
				//var irow = idGrid.row;
			
				if(txtbuspartnerPk.text !=''){
						grdDtl2.AddRow();
						var senderNm =  "<%=Request("senderNm") %>";
							
						var check = true;
						var buspartner_pk ;
						var buspartner;
						if(idGrid.row >0){
							buspartner_pk= idGrid.GetGridData(idGrid.row,0);
						buspartner =  idGrid.GetGridData(idGrid.row,2);
						}else{
							buspartner_pk= idGrid.GetGridData(1,0);
							
							buspartner =  idGrid.GetGridData(1,2);
						}
						
						grdDtl2.SetGridText(grdDtl2.rows - 1, g_buspartner_pk,buspartner_pk);
						grdDtl2.SetGridText(grdDtl2.rows - 1, g_cus_nm,buspartner) ;
						
						for(var i = 1; i < grdDtl2.rows; i++){
							if(grdDtl2.GetGridData(i,g_Sender_nm) == senderNm){
								
								check = false;
								break;
							}
						}
						if(check == true){
							grdDtl2.SetGridText(grdDtl2.rows - 1, g_Sender_nm,senderNm);
						//	grdDtl2.SetGridText(grdDtl2.rows - 1, g_location_nm,senderNm);
						}
				
				}else{
					alert("you must choose buspartnet");
				}
				
			

				
				
			break;
		
	}

}

//-----------
function OnSearch(){
	if(idGrid.row >0){
	txtbuspartnerPk.text = idGrid.GetGridData(idGrid.row,0);
	g_check = true;
	}
	dsomapping.Call('select');
}

//---------------OnDataReceive
function OnDataReceive(obj){
	switch(obj.id){
				/*case "dsomapping":
				if(g_Save == false && g_check == false){
			
						if(grdDtl2.rows >1 ){
							txtbuspartnerPk.text =  grdDtl2.GetGridData(1,g_buspartner_pk);
							datGetCustomer1.Call();
						}
					}
					
					break;
				case "datGetCustomer1":
					txtbuspartnerPk.text ='';
					
					break;*/
					
				case "datGetCustomer1":
					txtbuspartnerPk.text = idGrid.GetGridData(1,g_buspartner_pk_1)
					
					//OnSearch();
					if(txtCustomerID.text !=''){
						txtbuspartnerPk.text = idGrid.GetGridData(1,0);
						dsomapping.Call('select');
					}
					break;
					
				case "dsomapping":
					g_distinct =false;
					break;
					
						
		}
}

//----------------------OnDelete
function OnDelete(){
	var i ;
	var fg = grdDtl2.GetGridControl();
	for(i = 1; i < grdDtl2.rows; i++)
	{
		if(fg.IsSelected(i) == true)
		{
			
			grdDtl2.SetRowStatus(i, Number("0x40"));
			dsomapping.Call();
		}
	}


}
//-------------------OnCheck-------------
function OnCheck(){
	var cus_nm= grdDtl2.GetGridData(grdDtl2.row,g_Sender_nm);
	
	//var loactonNm =  grdDtl2.GetGridData(grdDtl2.row,g_location_nm);
	
	for(var i = 1; i < grdDtl2.rows; i++){
	
		if( cus_nm!='' && grdDtl2.GetGridData(i,g_Sender_nm).toUpperCase() == cus_nm.toUpperCase() && i!=grdDtl2.row){
			
			alert('cus name distinct row '+grdDtl2.GetGridData(i,g_no));
			g_distinct = true;
			break;
			
			
		}
		/*else{
			if(loactonNm!='' && grdDtl2.GetGridData(i,g_location_nm).toUpperCase() == loactonNm.toUpperCase() && i!=grdDtl2.row){
				alert('cus name location'+grdDtl2.GetGridData(i,g_no));
				g_distinct = true;
				break;
			}
		}*/
	}
						
	
}
</script>
<body style="margin:0; padding:0;">
<!----------------------------------------<input bind ="txtbuspartnerPk"/>---------------------------------------------->

  
  <gw:data id="datGetCustomer1"  onreceive="OnDataReceive(this)" >
	<xml>
		<dso type="grid" function="ac_sel_60100150_sender_vendor" >
			<input bind="idGrid">
				 <input bind="txtCustomerID"/>
				 <input bind="txtCustomerName"/>
				 <input bind="chkAR_YN" />
				<input bind="chkAP_YN" />
				<input bind="chkCO_YN" />
				<input bind="txtTaxCode" />
				<input bind="txtCompanyPk" />
				
			</input>
			<output bind="idGrid"/>
		</dso>
	</xml>
  </gw:data> 
  
  <gw:data id="dsomapping"  onreceive="OnDataReceive(this)" >
	<xml>
		<dso type="grid" parameter="0,2,4"  function="ac_sel_60100150_sender"  procedure="ac_upd_60100150_sender_mapping">
			<input bind="grdDtl2">
				 <input bind="txtbuspartnerPk"/> 
				 <input bind = "txtsender_nm"/>
			</input>
			<output bind="grdDtl2"/>
		</dso>
	</xml>
  </gw:data> 
  
   

<!-------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
<!--<tr style="height:0%" >    
    <td width="8%"></td>
    <td width="12%"></td>
    <td width="8%"></td>
    <td width="10%"></td>
    <td width="3%"></td>
    <td width="10%"></td>
    <td width="5%"></td>
    <td width="27%"></td>
    <td width="12%"></td>
    <td width="3%"></td>
</tr>-->
    <tr style="height:5%; " >
         <td width=5%><b>Partner</b>
		<td width=50%>
		    <table width=100% border = 0 cellpadding= 0 cellspacing= 0 >
		    <tr>
		        <td width=25%><gw:textbox id="txtCustomerID"    	csstype="mandatory"   styles="width:100%" onenterkey="OnSearch1()"  /></td>
				  <td width=40%><gw:textbox id="txtCustomerName"    	csstype="mandatory"  styles="width:100%" onenterkey="OnSearch1()"  /></td>
				  <td width=25%><gw:textbox id="txtTaxCode"    	styles="width:100%" onenterkey="OnSearch1()" /></td>
        		<td align="left" width=10%><gw:imgBtn id="btnResetCust" img="reset" alt="Reset"         onclick="OnResetCust()"/></td>
		    </tr>
		    </table>
		</td>
		<td width=5%></td>
		
		<td width=10%><b>Vendor<b></td>
		<td width=5%><gw:checkbox id="chkAP_YN" defaultvalue="Y|N" value="Y" /></td>
		<td width=10%><b>Customer<b></td>
		<td width=5%><gw:checkbox id="chkAR_YN" defaultvalue="Y|N" value="N" /></td>
		<td width=10%><b>Company<b></td>
		<td width=5%><gw:checkbox id="chkCO_YN" defaultvalue="Y|N" value="N" /></td>		
		<td width=5%><gw:imgBtn id="idSearch" img="search" alt="Search" onclick="OnSearch1()" /></td>	
		
    </tr>
    <tr>
	    <!--0_c.PK|1.Cust ID|2.Cust Name|3.Local Name|4_FOREIGN_NM|5_PARTNER_TYPE|6.TAX CODE|7.SERIAL NO|8.FORM NO|9.ADDRESS|10_ADD_2|11_ADD_3|12_PHONE_NO|13_EMAIL|14_FAX|15_WEBSITE|16_SALE_PRESENT|17_COM_YN|18_CUS_YN|19_CUS_ACTIVE_YN|20_VEN_YN|21_VEN_ACT_YN|22_ACT_YN|23_VALID_F|24_VALID_T|25_DESCRIPT--->
	    <td colspan=12>
			
			<gw:grid   
			id="idGrid"  
			header="_c.PK|Cust ID|Cust Name|Local Name|_FOREIGN_NM|_PARTNER_TYPE|TAX CODE|SERIAL NO|FORM NO|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_EMAIL|_FAX|_WEBSITE|_SALE_PRESENT|_COM_YN|_CUS_YN|_CUS_ACTIVE_YN|_VEN_YN|_VEN_ACT_YN|_ACT_YN|_VALID_F|_VALID_T|_DESCRIPT|Due day AP|Due day AR"   
			format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			defaults="||||||||||||||||||||||||||||"  
			editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
			widths="0|1000|3000|4000|0|0|1550|1000|1000|1000|4000|0|0|0|0|0|0|0|0|0|0|0|0|0|2000|1500"  
			styles="width:100%; "   
			sorting="T"   
			acceptNullDate
			
			oncellclick= "OnSearch()" /> 
	    </td>
	</tr>
	<tr style="height:5%;">
		<td colspan="10" align="right">
            <table width="50%"  border="1" cellspacing="0" cellpadding="0" style="height:100%">
				<tr width="20%">
					<td width=25%><gw:textbox id="txtsender_nm"    	csstype="mandatory"   styles="width:100%" onenterkey="OnSearch()"  /></td>
					<td align="right" width="2%"><gw:imgBtn id="ibtnNew" img="new" alt="New Row" onclick="OnNew('newRow')" /></td>
					
					<td align="right" width="2%"><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="onSave()" /></td>
					<td align="right" width="2%"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>					
                  				
				</tr>
            </table>			
		</td>
	</tr>
    <tr style="height:45%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl2"  
                header  ="_pk|No|_buspartner_pk|Cus Name|Senser Name"
                format  ="0|0|0|0|0"
                aligns  ="0|0|0|0|0"
                defaults="||||"
                editcol ="0|0|0|1|1"
                widths  ="0|500|4000|5000|3000"
                styles  ="width:100%; height:100%"    
				onafteredit="OnCheck()"				
                sorting ="T"                				
				
            />
        </td>
    </tr>
</table>	
<gw:textbox id="txtCompanyPk" styles="display:none" />
<gw:textbox id="txtbuspartnerPk" styles="display:none" />
<gw:textbox id="txtbuspartnerCode" styles="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>