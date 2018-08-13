<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST ENTRY</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>

var flag;
var  l_ex_rate   = "<%=Session("EX_RATE")%>";
var g_emp_pk = "<%=Session("EMPLOYEE_PK")%>" ;

//-------------------

    
var G_PK=0,
	G_tht_repayment_pk=1,
	G_Table_PK=2,
	G_TableName=3,
	G_REF_No=4,
	G_Invoice_Date=5,
	G_Amount_VND=6,  
	G_Ex_Rate=7,
	G_Amount_USD=8,
	G_Description=9,
	g_Local_Description=10; 

var rtnLGCode = '' ;
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="80%";
                imgArrow.src = "../../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	txtBankVND.SetEnable(false);
	var  l_company_pk   = "<%=Session("COMPANY_PK")%>";
    
	//alert(txtCompanyPK.text);
    BindingDataList();    
    //---------------------------------- 
    OnAddNew('Master'); 
	txtCompanyPK.text=l_company_pk;	
	txtEx_Rate.text= "<%=CtlLib.SetDataSQL("SELECT sf_get_current_sell_ex_rate("+Session("COMPANY_PK")+",'USD') from dual")%>";	
    data_epbp00010.Call("SELECT");	
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;    
          
     lstPaymentMethod.SetDataText("<%=CtlLib.SetListDataSQL("SELECT code,NAME FROM tco_commcode WHERE DEL_IF=0 and  parent_code='PTYPE' and use_yn='Y' and code in('PTYPE-01','PTYPE-02','PTYPE-04')" )%>");
	 lstCreditType.SetDataText("<%=CtlLib.SetListDataSQL("SELECT '', '' FROM DUAL UNION ALL SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>"); 
	 OnChangPayment();	
 }

 //===================================================================================
function OnPopUp(pos)   
{
    switch(pos)
    {                         
        case 'Room':
            var path = System.RootURL + '/standard/forms/60/25/60250020_room_inhouse_popup.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtTHT_Room_AllocatePK.text = obj[0]; 
					txtRoomNo.text = obj[2]; 
					txtLastName.text = obj[4]; 
					//txtFirstName.text = obj[5];
               }
        break; 
      }         
}   
 
 //===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':
            data_epbp00010_1.StatusInsert();
            grdDetail.ClearData();
			OnChangPayment();
			txtEx_Rate.text= "<%=CtlLib.SetDataSQL("SELECT sf_get_current_sell_ex_rate("+Session("COMPANY_PK")+",'USD') from dual")%>";
            flag = "view";     
        break;
        
        case 'Detail':
			if(txtRoomNo.text !="")
			{
				 var path = System.RootURL + "/form/60/25/60250170_all_service_popup.aspx?p_room_allocate_pk="+txtTHT_Room_AllocatePK.text;
						var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
						if ( object != null )
						{
							 for( var i=0; i < object.length; i++)	  
								{	
									arrTemp = object[i];
									grdDetail.AddRow(); 
									//grdDetail.SetGridText(grdDetail.rows-1, G_tht_repayment_pk, txtMasterPK.text);  
									grdDetail.SetGridText(grdDetail.rows-1, G_Table_PK, arrTemp[0]);
									grdDetail.SetGridText(grdDetail.rows-1, G_TableName, arrTemp[1]);
									grdDetail.SetGridText(grdDetail.rows-1, G_REF_No,arrTemp[3]);
									grdDetail.SetGridText(grdDetail.rows-1, G_Invoice_Date, arrTemp[2]);
									grdDetail.SetGridText(grdDetail.rows-1, G_Description, arrTemp[4]);//item
									grdDetail.SetGridText(grdDetail.rows-1, G_Amount_VND, arrTemp[5]);
									grdDetail.SetGridText(grdDetail.rows-1, G_Ex_Rate, arrTemp[6]);
									grdDetail.SetGridText(grdDetail.rows-1, G_Amount_USD, arrTemp[7]);		
									
								}
						}
			}
			else
			{
				alert("Please,choose Room# to add new.");
			}
        break;     
    }
}  

 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_epbp00010.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_epbp00010_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                    }
                    else
                    {
                        txtMasterPK.text = '';
                    }
                    
                    flag = 'view' ;
                    data_epbp00010_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                }
                else
                {
                    txtMasterPK.text = '';
                }  
                              
                flag = 'view' ;
                data_epbp00010_1.Call("SELECT");
            }                              
        break;
        
        case 'grdDetail':            
            data_epbp00010_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00010":
                                        
        break;
            
        case "data_epbp00010_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G_tht_repayment_pk, txtMasterPK.text);
                    }    
                }                
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }           
        break;
        
        case "data_epbp00010_2":
            TotalAmount();
			if ( flag == 'save')
            {
				data_epbp00010_1.Call("SELECT");
				flag = '';
			}
        break;                                   
    }
	OnChangPayment();
}

//==============================================================================
 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':
            if ( confirm('Do you want to delete ?'))
            {
				data_epbp00010_1.StatusDelete();
				data_epbp00010_1.Call();
            }             
        break; 
		case 'Detail':
			if ( grdDetail.GetGridData( grdDetail.row, G_Description) == '' )
			{
				alert("Please,input Description to delete.");
				return false;
			}  
            if ( confirm('Do you want to delete ?'))
            {
				grdDetail.DeleteRow();
				data_epbp00010_2.Call();
            }             
        break; 
     
    }     
}
//==============================================================================
 
function OnUnDelete()
{              
     //grdDetail.UnDeleteRow();
}

//==============================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
			if(lstPaymentMethod.value == "")
			{
				alert("Please select Payment Method to save");
				return false;
			}
			if((lstPaymentMethod.value == "PTYPE-02")&&(lstCreditType.value == ""))
			{
					alert("Please select Credit type to save!!!");
					return false;
			}
            flag='save';
            data_epbp00010_1.Call(); 
			 
        break;
        
        case 'Detail':        
             data_epbp00010_2.Call();
        break;
        
    }
} 
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumAmountVND = 0 ,sumAmountUSD =0;

    for ( i=1; i<grdDetail.rows; i++ )
    {
        sumAmountVND = sumAmountVND + Number(grdDetail.GetGridData(i,G_Amount_VND)); 
		sumAmountUSD = sumAmountUSD + Number(grdDetail.GetGridData(i,G_Amount_USD));
    }   

    txtTotalVND.text = sumAmountVND;
	txtTotalUSD.text = sumAmountUSD;
} 
//====================================================

function OnChangPayment()
{
	if(lstPaymentMethod.value =='PTYPE-01')
	{
		txtCashVND.SetEnable(true); 
		txtCashUSD.SetEnable(true); 
		txtCreditVND.SetEnable(false); 
		txtCreditUSD.SetEnable(false);
		txtCreditVND.text=0;
		txtCreditUSD.text=0;
	}
	else if(lstPaymentMethod.value =='PTYPE-02')
	{
		txtCashVND.SetEnable(false); 
		txtCashUSD.SetEnable(false); 
		txtCreditVND.SetEnable(true); 
		txtCreditUSD.SetEnable(true);
		txtCashVND.text=0;
		txtCashUSD.text=0;
	}
	
	//else if(lstPaymentMethod.value =='PTYPE-02')
//	{
	//	alert("Please select Credit Type ! . ");
	//	return false;
	//}
	else if(lstPaymentMethod.value =='PTYPE-04')
	{
		txtCashVND.SetEnable(false); 
		txtCashUSD.SetEnable(false); 
		txtCreditVND.SetEnable(false); 
		txtCreditUSD.SetEnable(false);
		txtBankVND.SetEnable(false);
		txtCashVND.text="";
		txtBankVND.text=System.Round(Number(txtTotalVND.text)*1.155,0);
		txtCashUSD.text="";
		txtCreditVND.text="";
		txtCreditUSD.text="";
	}
	else if(lstPaymentMethod.value =='PTYPE-05')
	{
		txtCashVND.SetEnable(true); 
		txtCashUSD.SetEnable(true); 
		txtCreditVND.SetEnable(true); 
		txtCreditUSD.SetEnable(true);
	}
	
}
 function OnReport()
 {
    if(grdDetail.rows > 1)
	{
		 if(Number(txtCashVND.text)==0 &&Number(txtCashUSD.text)==0 &&Number(txtCreditVND.text)==0 &&Number(txtCreditUSD.text)==0&&Number(txtBankVND.text)==0)
		 {
			alert("Please,input Receipt amout of guest to print.");
			return false;
		 }
		 var url = '/standard/reports/60/25/rpt_60250170_Guest_Invoice.aspx?p_tht_repayment_pk='+txtMasterPK.text+'&p_employee_pk='+g_emp_pk;
; 
		System.OpenTargetPage( System.RootURL+url , "newform" );
	}	
 }
function OnBalance()
{// Math.abs
	var l_balance=0;
	l_balance = System.Round(((Number(txtCashVND.text)+Number(txtCashUSD.text)*Number(l_ex_rate)+Number(txtCreditVND.text)+Number(txtCreditUSD.text)*Number(l_ex_rate))-Number(txtTotalVND.text)),0);
	txtBalnace.text=Math.abs(Number(l_balance));
	//System.Round(
}
</script>

<body>
    <gw:data id="data_epbp00010" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_ht_sel_60250170_search" >
                <input  bind="grdSearch">                    
                    <input bind="dtFrom" />
                    <input bind="dtTo" />  
					<input bind="txtSearchInvoiceNo" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_ht_sel_60250170_mst" procedure="st_ht_upd_60250170_mst">
                <input>
                    <inout bind="txtMasterPK" />              
                    <inout bind="txtTHT_Room_AllocatePK" />
					<inout bind="txtRoomNo" />
					<inout bind="txtInvoiceNo" /> 
                    <inout bind="dtDate" />
                    <inout bind="txtEx_Rate" />  
					<inout bind="txtDescription" />		
                    <inout bind="lstPaymentMethod" />
					<inout bind="txtCashVND" />                    
                    <inout bind="txtCashUSD" />
					<inout bind="txtCreditVND" /> 
					<inout bind="txtCreditUSD" />
					<inout bind="txtTotalVND" />   
					<inout bind="txtTotalUSD" />	
					<inout bind="txtLastName" />
					<inout bind="txtFirstName" /> 
					<inout bind="txtCreateBy" />
					<inout bind="txtCreateDate" />
					<inout bind="txtModifyBy" />
					<inout bind="txtModifyDate" />					
   					<inout bind="txtBankVND" />
					<inout bind="txtCompanyPK" />
					<inout bind="lstCreditType" /> 
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_ht_sel_60250170_dt" procedure="st_ht_upd_60250170_dt"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 20%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Date</td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" onchange="OnSearch('grdSearch')" />
                            ~<gw:datebox id="dtTo" lang="1" onchange="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Invoice#/Room#
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtSearchInvoiceNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Payment Date|Invoice#|Room#" format="0|4|0|0"
                                aligns="0|0|0|0" defaults="|||" editcol="0|0|0" widths="0|1200|1200|1200"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
                                autosize='T' />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 3%"></td>
						<td style="width: 10%"></td>
						<td style="width: 10%"></td>
						<td style="width: 10%"></td>
						<td style="width: 13%"></td>
						<td style="width: 14%"></td>
						<td style="width: 15%"></td>
						<td style="width: 3%"></td>
						<td style="width: 3%"></td>
						<td style="width: 3%"></td>
						<td style="width: 3%"></td>
						<td style="width: 3%"></td>
						<td style="width: 3%"></td>
					</tr>
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle('1')" />
                        </td>
                        <td  style="width: 10%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">  
                            Invoice#
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtInvoiceNo" styles="width: 100%" csstype="mandatory" readonly="T" />
                        </td>
						<td align="right" style="width: 10%; white-space: nowrap">  
                            Payment Method
                        </td>
                        <td align="right" colspan="3">
                            <gw:list id="lstPaymentMethod" styles="width:100%" onchange="OnChangPayment()" />
                        </td>                                       
                        <td style="width: 3%" align="right"> 
                            <gw:imgbtn id="btnNewMST" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 3%" align="right">
										
							<gw:imgbtn id="btnDeleteMst" img="delete" alt="Delete" onclick="OnDelete('Master')" />
						
						</td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
						<td style="width: 3%">
                            <gw:imgbtn id="btnReport" img="excel" alt="Print" onclick="OnReport()" />
                        </td>
                    </tr>
					<tr>
						<td style="width: 3%" align="right" ><b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Room')">Room#</b></td>
						<td style="width: 10%"><gw:textbox id="txtRoomNo" styles="width: 100%" readonly="T" csstype="mandatory" readonly="T" /></td>
						<td style="width: 10%" align="right">Last Name</td>
						<td colspan="2"><gw:textbox id="txtLastName" styles="width: 100%" readonly="T" csstype="mandatory" readonly="T" /></td>
						
						<td align="right" >First Name</td> 
						<td colspan="7"><gw:textbox id="txtFirstName" styles="width: 100%" readonly="T" csstype="mandatory" /></td>
						
					</tr>  
					<tr>
						<td align="right" >Description</td>
						<td colspan="4" ><gw:textbox id="txtDescription" styles="width: 100%"  /></td>
						<td align="right" >Total(VND)</td>
						<td colspan="2"><gw:textbox id="txtTotalVND" styles="width: 100%" type="number" format="###,###,###,###,###"  /></td>
						<td colspan="2" align="right" >Total(USD)</td>
						<td colspan="3" ><gw:textbox id="txtTotalUSD" styles="width: 100%" type="number" format="###,###,###,###,###.##"  /></td>	
					</tr>
					<tr style="height: 1%">
                        <td style="width: 1%">
                           Receipt:
                        </td>
                        <td  colspan="2" style="width: 10%; white-space: nowrap">
                            Cash(VND)  <gw:textbox id="txtCashVND" styles="width: 55%" type="number" format="###,###,###,###,###" onchange="OnBalance()" onenterkey="OnBalance()"  />
                        </td>
                        
                        <td align="right" style="width: 10%; white-space: nowrap"> 
                            Cash(USD)
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtCashUSD" styles="width: 100%" type="number" format="###,###,###,###,###.##" onchange="OnBalance()" onenterkey="OnBalance()"  />
                        </td>
						<td align="right" style="width: 10%; white-space: nowrap">
                            Credit(VND)
                        </td>
                        <td align="right" colspan="2">
                            <gw:textbox id="txtCreditVND" styles="width: 100%" type="number" format="###,###,###,###,###" onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>                                       
                        <td colspan="2" style="width: 3%" align="right">
                            Credit(USD)
                        </td>
                        <td colspan="3" style="width: 3%">
                            <gw:textbox id="txtCreditUSD" styles="width: 100%" type="number" format="###,###,###,###,###.##" onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>
                        
                    </tr>
					<tr style="height: 1%">
                        <td  colspan="5" style="width: 10%; white-space: nowrap">
                            
                        </td>
						<td  colspan="1" align="right" style="width: 10%; white-space: nowrap">
                            Credit Type
                        </td>
                         <td  colspan="2" style="width: 10%; white-space: nowrap">
                            <gw:list id="lstCreditType" text="" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap"> 
                            AR(VND)
                        </td>
                        <td style="width: 20%" colspan="4">
                            <gw:textbox id="txtBankVND" styles="width: 100%"  type="number" format="###,###,###,###,###" onchange="OnBalance()" onenterkey="OnBalance()"  />
                        </td>
                    </tr>
					<tr style="height: 1%">
						<td colspan="14">
							<table style="width: 100%; height: 100%" >
								<tr>
									<td style="width: 10%">
									  Create By:
									</td>
									<td   style="width: 10%; white-space: nowrap">
										<gw:label id="txtCreateBy" />
									</td>
									
									<td align="right" style="width: 10%; white-space: nowrap">
									 Create Date:   
									</td>
									<td style="width: 14%">
									   <gw:label id="txtCreateDate" />  
									</td>
									<td align="right" style="width: 10%; white-space: nowrap">
									  Modify By:
									</td>
									<td align="right" style="width: 8%; white-space: nowrap">
									   <gw:label id="txtModifyBy" />
									</td>                                       
									<td  style="width: 12%" align="right">
										Modify Date: 
									</td>
									<td  style="width: 13%" align="right">
										<gw:label id="txtModifyDate" />
									</td>
									<td style="width: 3%">  
										<gw:imgbtn id="btnDeleteDtl" img="delete" alt="Delete" onclick="OnDelete('Detail')" styles="width: 100%;display: none" />
									</td>
									<td style="width: 3%" align="right">
										<gw:imgbtn id="btnNewdtl" img="new" alt="New" onclick="OnAddNew('Detail')" />
									</td>
								</tr>
							</table>
						</td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' header='_PK|_tht_repayment_pk|_Table_PK|_TableName|REF#|Invoice Date|Amount(VND)|Ex_Rate|Amount(USD)|Description|_LocalDescription'
                                format='0|0|0|0|0|4|-0|-0|-2|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|0|1|1' autosize='T'
                                styles='width:100%; height:100%' sorting='T' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtTHT_Room_AllocatePK" styles="width: 100%;display: none" />
	<gw:textbox id="txtEx_Rate" styles="width: 100%;display: none" />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
	<gw:textbox id="txtBalnace" type="number" format="###,###,###,###,###" styles="width: 100%;display: none" />
	<gw:textbox id="txtCompanyPK" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
</body>
</html>
