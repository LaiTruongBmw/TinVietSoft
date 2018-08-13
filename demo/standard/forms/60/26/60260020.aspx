<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Line Result Incoming</title>
</head>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>";
    var  user_name = "<%=Session("USER_NAME")%>"  ;
	var  tco_company_pk = "<%=Session("COMPANY_PK")%>"  ;
	
	var COL2_TCO_ITEM_PK	        = 0,
		COL2_ITEMCODE	            = 1,
		COL2_ITEMNAME		        = 2,
		COL2_UNIT	                = 3,
		COL2_GENDER					= 4,
		COL2_PRICE_LAUNDRY          = 5,
		COL2_PRICE_CLEANING         = 6,
		COL2_PRICE_PRESSING         = 7,
		
		COL1_PK                     = 0,
		COL1_THT_INVOICE_PK         = 1,
		COL1_TCO_ITEM_PK            = 2,
		COL1_ITEMCODE	            = 3,
		COL1_ITEMNAME		        = 4,
		COL1_UNIT	                = 5,
		COL1_GENDER					= 6,
		COL1_QTY_LAUNDRY            = 7,
		COL1_PRC_LAUNDRY            = 8,
		COL1_QTY_DRYCLEAN           = 9,
		COL1_PRC_DRYCLEAN           = 10,
		COL1_QTY_PRESS              = 11,
		COL1_PRC_PRESS              = 12,
		COL1_TOTALAMT               = 13
		;
//-----------------------------------------------------
var flag = '' ;

//-----------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display      = "none";       
        imgArrow.status         = "collapse";
        right.style.width       = "100%";
        imgArrow.src            = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display      = "";
        imgArrow.status         = "expand";
        right.style.width       = "80%";
        imgArrow.src            = "../../../../system/images/prev_orange.gif";
    }
 }
 
//==========================================================================

function BodyInit()
{
	chkConfirm.value = '-1';
    OnAddNew();
    left.style.display="none";
    OnToggle();
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-7));
    data ="DATA|USD|USD|VND|VND|EUR|EUR|KRW|KRW"; 
	lstCurrency.SetDataText(data);
	lstCurrency.value = "VND";
	lstCurrency.SetEnable(false);
	
	
	data ="DATA|ALL|ALL|10|GENTLEMEN|20|LADIES"; 
	lstItemGroup.SetDataText(data);
	
	
	data = "<%=CtlLib.SetListDataSQL("Select 'POINT-09', 'LAUNDRY' from dual ") %>";
	lstPOINT.SetDataText(data);
	lstPOINT.value = 'POINT-09';
	lstPOINT.SetEnable(false);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT num1, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='VAT'" )%>"; 
	lstVat.SetDataText(data);
	lstVat.value = 10;
	lstVat.SetEnable(false);
	
	grdItemLaundry.SetComboFormat(COL2_GENDER, "#10;GENTLEMEN|#20;LADIES");
	grdLaundry.SetComboFormat(COL1_GENDER, "#10;GENTLEMEN|#20;LADIES");
	
	dtDate.SetEnable(false);
	EnableButton(true);
	txtTCO_COMPANY_PK.text=tco_company_pk;
	dso_htfo00070.Call("SELECT");
}
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch' :        
            dso_htfo00070_searchM.Call("SELECT")
        break;
        case 'grdSearchItem' :        
            dso_htfo00070.Call("SELECT")            
        break;
        case 'Master' :
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( event.row, 0);                
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            dso_htfo00071.Call("SELECT");
        break;
    }
}
function CheckDataExist(p_oGrid, p_value_pk, p_value_gender)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {if(p_oGrid.GetGridData(i, COL1_TCO_ITEM_PK) == p_value_pk && p_oGrid.GetGridData(i, COL1_GENDER) == p_value_gender){return true;}}
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == 'grdItemLaundry' && event.row > 0)
      {     
            if(event.row > 0 && (!CheckDataExist(grdLaundry, oGrid.GetGridData(event.row, COL2_TCO_ITEM_PK), oGrid.GetGridData(event.row, COL2_GENDER))))
            {
                //SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        grdLaundry.AddRow();
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_TCO_ITEM_PK, oGrid.GetGridData(event.row, COL2_TCO_ITEM_PK));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_ITEMCODE,            oGrid.GetGridData(event.row, COL2_ITEMCODE));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_ITEMNAME,            oGrid.GetGridData(event.row, COL2_ITEMNAME));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_UNIT,                oGrid.GetGridData(event.row, COL2_UNIT));
				grdLaundry.SetGridText(grdLaundry.rows-1, COL1_GENDER,              oGrid.GetGridData(event.row, COL2_GENDER));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_QTY_LAUNDRY,         0);
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_PRC_LAUNDRY,         oGrid.GetGridData(event.row, COL2_PRICE_LAUNDRY));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_QTY_DRYCLEAN,        0);
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_PRC_DRYCLEAN,        oGrid.GetGridData(event.row, COL2_PRICE_CLEANING));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_QTY_PRESS,           0);
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_PRC_PRESS,           oGrid.GetGridData(event.row, COL2_PRICE_PRESSING));
		        grdLaundry.SetGridText(grdLaundry.rows-1, COL1_TOTALAMT,            0);
            }else{
                alert("Item "+oGrid.GetGridData(event.row, COL2_ITEMNAME)+" is exist!"); return;
            }
      }
      SumAmount();
}
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, 0) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//==========================================================================
function EnableButton(obj)
{
	btnDelete.SetEnable((obj || '<%=System.DateTime.Now.ToString("yyyyMMdd") %>' == dtDate.GetData()) && txtMasterPK.text != '');
	btnConfirm.SetEnable(obj);
	btnSendBill.SetEnable(obj);
	btnDelete_1.SetEnable((obj || '<%=System.DateTime.Now.ToString("yyyyMMdd") %>' == dtDate.GetData()) && txtMasterPK.text != '' && grdLaundry.rows > 1);	
	btnUpdate.SetEnable(obj);
}

function OnDataReceive(obj)
{
  switch (obj.id)
    {
        case "dso_htfo00071" :
			if (CONFIRM_YN.text == 'Y')
				EnableButton(false);
			else
				EnableButton(true);

            if ( flag == 'save'|| flag == 'delete')
            {
               if(flag == 'save')
               {
                   for(var i=0; i < grdLaundry.rows;i++)
                    {
                        if ( grdLaundry.GetGridData( i, COL1_THT_INVOICE_PK) == '' )
                        {
                            grdLaundry.SetGridText( i, COL1_THT_INVOICE_PK, txtMasterPK.text);
                        }    
                    }
                    flag = 'save';
                   dso_htfo00072.Call(); 
                } 
                else
                {
                    flag = 'select';
					OnSearch('grdSearch');
                   
                   // OnAddNew();
                }              
            }
            else
            {
                //grdItemLaundry.ClearData();
                dso_htfo00072.Call("SELECT"); 
            }             
        break;
        case "dso_htfo00072" :
            SumAmount();
            if(flag == 'save' || flag == 'Delete')
            {
                if(flag == 'save')
                {
                    OnSearch('grdSearch'); 
                    flag = 'select';
                }
                else
                {
                    dso_htfo00071.Call();
                    flag = 'break OnDataReceive';
                }
            }
            if(CONFIRM_YN.text == 'Y'){
                EnableButton(false);
                btnUpdate.SetEnable(false);
            }else btnUpdate.SetEnable(true);
        break;
        case "dso_htfo00070":
            OnSearch('grdSearch');
        break;
     }
}
//==========================================================================
function OnAddNew()
{
	EnableButton(true);
    dso_htfo00071.StatusInsert();
	txtTCO_COMPANY_PK.text=tco_company_pk;
    lstVat.value = 10;
	lstCurrency.value = "VND";
    CONFIRM_YN.text = 'N';
    PAYED_YN.text = 'N';
    grdLaundry.ClearData();
}
//==========================================================================
function OnSend(obj){
    CONFIRM_YN.text = 'Y';
    if(obj=='1')
	{
		if ( confirm( "Are you sure to collector this Invoice ?"))
		{
			PAYED_YN.text = 'Y';
			flag = 'save';
			OnSave();
		}
	}
	if(obj=='2')
	{
		if ( confirm( "Are you sure to send bill this Invoice ?"))
		{
			flag = 'save';
			OnSave();
		}
	}
}
//==========================================================================

function OnSave()
{
	flag = 'save';
	SumAmount();
	if(txtRoomPK.text == '' || txtRoomPK.text == '0'){
	    alert('Please select Room!');return false;
	}
	dso_htfo00071.Call();
}

function OnConfirm()
{
	flag = 'save';
	CONFIRM_YN.text = '20';
	dso_htfo00071.Call();
}
function OnDelete(index)
 {
    switch(index)
    {
        case'Master':
			if (txtMasterPK.text != '')
			{
				if ( confirm( "Do you want to delete this Invoice " + txtSlipNo.text + " ?" ) ) 
				{
					flag = 'delete';
					dso_htfo00071.StatusDelete();
					dso_htfo00071.Call(); 
				}
			}        
        break;
        
        case 'Detail':
			if (grdLaundry.rows > 1 && grdLaundry.GetGridData(grdLaundry.row, 0)!="")
			{
				flag ='Delete';
				grdLaundry.DeleteRow();
				dso_htfo00072.Call();
			}
			else
			{
			    dso_htfo00072.Call("SELECT");
			    flag ='end';
			}
        break;
    }         
 }
function OnUnDelete() 
{
    grdLaundry.UnDeleteRow();
}
function OnPopUp(pos)
{
      switch (pos)         
      {		        
            case 'RoomSearch' :
               var path = System.RootURL + '/standard/forms/60/26/60260010_popup.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtRoomSearch.text = obj[2];
                    txtRoomSearchPK.text = obj[0]; 
               }	
            break;
            case 'RoomM' :
               var path = System.RootURL + '/standard/forms/60/26/60260010_popup.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtRoomPK.text = obj[0];
                    txtRoomM.text = obj[2]; 
                    txtCustName.text = obj[4]; 
               }
           break;   	
      }
}
function SumAmount()
{
	var basic = 0,
	    total_amt=0,
		vat_rate=10,
		vat_amt=0,
		svc_amt=0,
		dc_rate= Number(txtDiscount.text), 
		dc_amt=0,
		total_net=0;
    for(var i=1; i < grdLaundry.rows;i++)
	{
        grdLaundry.SetGridText(i, COL1_TOTALAMT, 
		    Number(grdLaundry.GetGridData(i, COL1_QTY_LAUNDRY)) *Number(grdLaundry.GetGridData(i, COL1_PRC_LAUNDRY))    + 
		    Number(grdLaundry.GetGridData(i, COL1_QTY_DRYCLEAN))*Number(grdLaundry.GetGridData(i, COL1_PRC_DRYCLEAN))   + 
		    Number(grdLaundry.GetGridData(i, COL1_QTY_PRESS))   *Number(grdLaundry.GetGridData(i, COL1_PRC_PRESS))
		);
        basic=basic+Number(grdLaundry.GetGridData(i, COL1_TOTALAMT));
	}
	
	dc_amt = basic * dc_rate * 0.01;
	total_amt = basic*1.155*(1-dc_rate*0.01);
	svc_amt = basic*0.05*(1-dc_rate*0.01);
	vat_amt = basic*0.105*(1-dc_rate*0.01);
	
	txtTotal.SetDataText(""+ basic);	
	txtServiceCharge.SetDataText(""+ svc_amt);
	txtVatAmt.SetDataText(""+ vat_amt);
    txtPayment.SetDataText(""+ total_amt);
    
}
function CheckInput()
{   
    SumAmount();
	/*var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == COL1_QTY_LAUNDRY || col == COL1_QTY_DRYCLEAN || col == COL1_QTY_PRESS){
        if (!Number(grdLaundry.GetGridData(row,col)))
			grdLaundry.SetGridText(row,col,0); 
		else{
		    if(Number(grdLaundry.GetGridData(row,col)) < 0) 
		        grdLaundry.SetGridText(row,col,0); 
		}
		SumAmount();
    }*/
}
function ChangeCurrency()
{
    SumAmount();
}
function OnDiscount()
{
	 SumAmount();
}
function OnReportClick()
{
    if ( txtMasterPK.text != ''  )
	{
		var url =System.RootURL + '/standard/reports/60/26/rpt_60260020.aspx?tcm_invoice_pk='+ txtMasterPK.text ;
		window.open(url);    
	}
}
</script>

<body>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htfo00070_searchM" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_ht_sel_60260020_search" > 
                <input bind="grdSearch" > 
                     <input bind="dtFromDate" /> 
                     <input bind="dtToDate" /> 
                     <input bind="txtInvoiceNo" /> 
                     <input bind="txtRoomSearch" /> 
                     <inout bind="lstPOINT"/>
                     <input bind="chkConfirm" /> 
                 </input> 
                <output bind="grdSearch" />   
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htfo00071" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="st_ht_sel_60260020_mst" procedure="st_ht_upd_60260020_mst" > 
                <inout> 
                     <inout bind="txtMasterPK" /> 
                     <inout bind="txtSlipNo" /> 
                     <inout bind="dtDate" />
                     <inout bind="txtRoomPK" />
                     <inout bind="txtTotal"/>
                     <inout bind="txtPayment"/>
                     <inout bind="lstVat"/>
                     <inout bind="txtVatAmt"/>
                     <inout bind="PAYED_YN"/>
                     <inout bind="CONFIRM_YN"/>
                     <inout bind="lstPOINT"/>
                     <inout bind="txtDescription" />
					 <inout bind="txtServiceCharge" />
                     <inout bind="txtDiscount"/>
					 <inout bind="txtDiscountAmt"/>
					 <inout bind="txtCustName" />
					 <inout bind="txtGuestQty"/>
                     <inout bind="txtCreatorVotes" />
                     <inout bind="lstCurrency"/>
					 <inout bind="txtTCO_COMPANY_PK"/>
                     <inout bind="txtTotal"/>
                     <inout bind="txtRoomM"/>
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htfo00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_ht_sel_60260020_item"> 
                <input bind="grdItemLaundry" > 
                     <input bind="lstItemGroup" /> 
                     <input bind="txtItem" />
                </input> 
                <output bind="grdItemLaundry" />  
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htfo00072" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_ht_sel_60260020_dtl"  procedure="st_ht_upd_60260020_dtl" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdLaundry" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 15%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Date
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:datebox id="dtFromDate" lang="1" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 25%; white-space: nowrap">
                            Invoice No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtInvoiceNo" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%" nowrap>
                            Room</b>
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="2">
                            <gw:textbox id="txtRoomSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                            <!--<gw:list id="lstLineGroup" styles="width: 100%" onchange="OnSearch('grdSearch')" />-->
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%" nowrap>Confirm Y/N</b>
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="2">
							<gw:checkbox id="chkConfirm" mode="01" value='-1' onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" 
                                header  ="_PK|Date|Invoice No|Room" 
                                format  ="0|4|0|0" 
                                aligns  ="0|0|0|0"
                                defaults="||||" 
                                editcol ="0|0|0|0" 
                                widths  ="0|1500|1200|1000" 
                                styles  ="width:100%; height:100%"
                                autosize="T" sorting="T" acceptnulldate="true" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 85%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 7%; white-space: nowrap" align="right"><b>Invoice No</b></td>
                        <td style="width: 17%"><gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" readonly="true" /></td>
                        <td style="width: 5%" align="center"><b>Date</b></td>
                        <td style="width: 10%"><gw:datebox id="dtDate" lang="1" /></td>
                        <td style="width: 10%" align="right" nowrap>Creator votes</td>
                        <td style="width: 30%"><gw:textbox id="txtCreatorVotes" styles='width:100%' readonly="true" /></td>
                       
                        <td style="width: 1%" align="right"><gw:imgbtn id="btnNew" img="new" alt="New Take Out Goods" text="Add" onclick="OnAddNew()" /></td>
                        <td style="width: 1%" align="right"><gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" /></td>
                        <td style="width: 1%" align="right"><gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" /></td>
                        <td style="width: 1%" align="right"><gw:imgbtn id="btnReport" img="excel" alt="Print" text="Print" onclick="OnReportClick()" /></td>
						<td style="width: 1%;" align="right"><gw:icon id="btnConfirm" alt="Collector" text="Collector" onclick="OnSend('1');" styles='width:100%;' /></td>
						<td style="width: 1%" align="right"><gw:icon id="btnSendBill" alt="SendBill" text="Send" onclick="OnSend('2');" /></td>
                    </tr>
                    <tr style="height: 1%">                        
                        <td align="right"><b>Point</b></td>
                        <td colspan="3"><gw:list id="lstPOINT" styles='width:100%' /></td>
                        <td align="right">Total</td>
                        <td colspan="1"><gw:textbox id="txtTotal" styles='width:100%' type="number" format="###,###,###,###" readonly="true" /></td>
                        <td colspan="3" align="right">Currency</td>
                        <td colspan="4"><gw:list id="lstCurrency" styles='width:100%' /></td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right"><b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('RoomM')">Room</b></td>
                        <td colspan="1"><gw:textbox id="txtRoomM" styles="width:100%" /></td>
						<td>Guest Qty</td>
						<td colspan="1"><gw:textbox id="txtGuestQty" styles="width:100%" /></td>
						<td align="right"><b>Service Charge</b></td>
                        <td align="left"><gw:textbox id="txtServiceCharge" styles='width:100%' type="number" format="###,###,###,###" readonly="true" /></td>
                        <td colspan="3" align="right">VAT</td>
                        <td colspan="4"><gw:list id="lstVat" styles='width:100%' onchange="ChangeCurrency()" /></td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">Customer</td>
                        <td colspan="3"><gw:textbox id="txtCustName" styles='width:100%' /></td>
                         <td align="right">Vat.Amt</td>
                        <td><gw:textbox id="txtVatAmt" type="number" format="###,###,###,###" styles='width:100%' readonly="true" /></td>
                        <td colspan="3" align="right"><b>Discount</b></td>
                        <td colspan="4" align="left"><gw:textbox id="txtDiscount" styles='width:80%' type="number" format="###,###,###" onenterkey="OnDiscount()" /><gw:textbox id="txtPercent" readonly="true" text="%" styles='width:20%' /></td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right">Description</td>
                        <td colspan="5"><gw:textbox id="txtDescription" styles='width:100%'  /></td>
						<td></td>
						<td></td>
                        <td align="right"><b>Payment</b></td>
                        <td align="left" colspan="5"><gw:textbox id="txtPayment" type="number" format="###,###,###,###" styles='width:100%' readonly="true" /></td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <fieldset>
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 1%">
                                        <td style="width: 10%; white-space: nowrap" align="left">
                                            <!--<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />-->
                                        </td>
                                        <td style="width: 30%">
                                        </td>
                                        <td style="width: 10%" align="right">
                                        </td>
                                        <td style="width: 20%">
                                        </td>
                                        <td style="width: 20%">
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                        <td style="width: 1%" align="left">
                                        </td>
                                        <td style="width: 1%" align="right">
                                        </td>
                                        <td style="width: 1%" align="right">
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <!--<gw:imgbtn id="btnUnDelete_1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />-->
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 42%">
                        <td colspan="14">
                            <gw:grid id='grdLaundry' 
                                header  ='_PK|_THT_INVOICE_PK|_TCO_ITEM_PK|ITEM CODE|ITEM NAME|UNIT|GENDER|Q.TY LAUNDRY|PRICE LAUNDRY|Q.TY WASHING|PRICE WASHING|Q.TY IRONING|PRICE IRONING|TOTAL AMOUNT'
                                format  ='0|0|0|0|0|0|0|-0|-2|-0|-2|-0|-2|-2'
                                aligns  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                defaults='|||||||||||||'
                                editcol ='0|0|0|0|0|0|0|1|0|1|0|1|0|0' 
                                widths  ='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000|1000|1000|1000|0'
                                check   ="||||||||||||"
                                autosize="T" sorting='F' acceptnulldate="T"  styles="width:100%;height:100%"
								onafteredit="SumAmount()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <fieldset>
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 1%">
                                        <td style="width: 18%">
                                            Item Group
                                        </td>
                                        <td style="width: 30%">
                                            <gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('grdSearchItem')" />
                                        </td>
                                        <td style="width: 3%" align="right">
                                            Item
                                        </td>
                                        <td style="width: 30%" align="right">
                                            <gw:textbox id="txtItem" onenterkey="OnSearch('grdSearchItem')" styles='width:100%' />
                                        </td>
                                        <td style="width: 3%" align="right">
                                        </td>
                                        <td style="width: 3%" align="right">
                                        </td>
                                        <td style="width: 3%" align="right">
                                            <gw:imgbtn id="btnSearchItem" img="search" onclick="OnSearch('grdSearchItem')" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 43%">
                        <td colspan="14">
                            <gw:grid 	id='grdItemLaundry' 
										header  ='_PK|Item Code|Item Name|Unit|GENDER|LAUDRY|WASHING|IRONING'
										format  ='0|0|0|0|0|-2|-2|-2' 
										aligns  ='0|0|0|1|0|0|0|0' 
										defaults='|||||||' 
										editcol ='0|0|0|0|0|0|0|0'
										widths  ='1000|1000|1000|1000|1000|1100|1000|0' 
										autosize="T" sorting='T' acceptnulldate="T"
										styles="width:100%;height:100%" 
										oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!-------------------------------------------------------------->
    <gw:textbox id="txtDiscountAmt" styles='width:100%;display:none' />
	<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtRoomSearchPK" styles='width:100%;display:none' />
    <gw:textbox id="txtRoomPK" styles='width:100%;display:none' />
    <gw:textbox id="CONFIRM_YN" styles='width:100%;display:none' text='N' />
    <gw:textbox id="PAYED_YN" styles='width:100%;display:none' text='N'/>
	<gw:textbox id="txtTCO_COMPANY_PK" styles='width:100%;display:none' text='N'/>
    <!-------------------------------------------------------------->
</body>
</html>
