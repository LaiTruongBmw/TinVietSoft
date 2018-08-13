<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Cost of FG Sold</title>
</head>

<script>
//---------------
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
  		
//----------------------------------------------------------------------
	        
function BodyInit()
{  
   BindingData();
   OnFormatGrid();
}
//----------------------------------------------------------------------
function BindingData()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 ")%>";
    lstCompany.SetDataText(ls_data);
    var ls_tr_type		= "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0120','01','') FROM DUAL ")%>|ALL|Select all";
    lstTR_TYPE.SetDataText(ls_tr_type);
	lstTR_TYPE.value = "ALL" ;
	txtTac_acctcode_pk_cost.text = "632100";
	txtVCType.text = "XTP"; 
}
//----------------------------------------------------------------------
function OnFormatGrid()
{
    var ctrl = idGridVC.GetGridControl();
    ctrl.ColFormat(9) = "#,###,###";
    ctrl.ColFormat(11) = "#,###,###,###,###,###.##R";
    ctrl.ColFormat(10) = "#,###,###,###,###,###.##R";
    
    ctrl = idGridItem.GetGridControl();
    ctrl.ColFormat(5) = "#,###,###,###,###,###.##R";
    ctrl.ColFormat(6) = "#,###,###,###,###,###.##R";
    ctrl.ColFormat(7) = "#,###,###,###,###,###.##R"; 
}

//---------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dat_60170350":
            for(i=1;i<idGridVC.rows;i++)
            {
                idGridVC.SetGridText(i,0,i);
            }
            if(idGridVC.rows > 1)
            {
                idBtnCancel.SetEnable(true);
	            idBtnProcess.SetEnable(false);
            }
            else
            {
                idBtnCancel.SetEnable(false);
	            idBtnProcess.SetEnable(true);            
            }	     
			if(idGridVC.rows > 1)
			{
				txtSeq.SetDataText(idGridVC.GetGridData(1, 2));	 // Seq
			}
			else
			{
				txtSeq.SetDataText("");
			}
			dat_60170350_1.Call("SELECT") ;	
        break;
        case "dat_60170350_1":
            for(i = 1; i < idGridItem.rows; i++)
            {
                idGridItem.SetGridText(i,0,i);
            }
			var v_tot_qty = 0 , v_tot_amt = 0 ;
			for(i = 1 ; i < idGridItem.rows; i++)
			{
				v_tot_qty += Number( idGridItem.GetGridData(i , 5 ));
				v_tot_amt += Number( idGridItem.GetGridData(i , 7 ));
			}			
			idGridItem.AddRow();
			idGridItem.SetGridText(idGridItem.rows - 1 , 5 , v_tot_qty ) ;
			idGridItem.SetGridText(idGridItem.rows - 1 , 7 , v_tot_amt ) ;
			idGridItem.SetGridText(idGridItem.rows - 1 , 1 , "TOTAL" ) ;
			idGridItem.SetCellBgColor(idGridItem.rows-1, 0, idGridItem.rows-1, idGridItem.cols-1, 0xA9EBD7);
        break;
        case "dat_60170350_2":
            onSearch(0);
        break;
		case "dat_60170350_3":		
			dat_60170350.Call("SELECT") ;
		break;
    }    
}
//----------------------------------------------------------------------
function onSearch(index)
{
    switch(index)
    {
        case 0:
            dat_60170350.Call("SELECT");
        break;
    }
}
//----------------------------------------------------------------------
function OnGridDblClick()
{
    
}
//----------------------------------------------------------------------
function OnGridClick()
{
    var tmp = idGridVC.GetGridData(idGridVC.row,1);
    txtTac_crca_pk.SetDataText(tmp);
    dat_60170350_1.Call("SELECT");
}
//----------------------------------------------------------------------
function OnUpdate()
{
	if(confirm("Are you sure you want to make slip for cost of product sold in " + dbMonth.value + " ?"))
	{
	    var ctrl = idGridVC.GetGridControl();
		txtCRCA_PK.text = '';
		var num_pk = 0;
		for(i = 1; i< ctrl.rows; i++)
		{
			txtCRCA_PK.text = txtCRCA_PK.text + idGridVC.GetGridData(i,2) + ',';
			num_pk++;
			txtNUM_PK.text = num_pk;
		}
		dat_60170350_2.Call();
	}
}
//----------------------------------------------------------------------
function OnPopupSlipEntry()
{
 
    var ctrl 	= idGridVC.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = idGridVC.GetGridData(ctrl.row, 2);
			var status  = idGridVC.GetGridData(ctrl.row, 14);
			var ls_arr = "";
			for (i = 1; i < idGridVC.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + idGridVC.GetGridData(i, 2);
			}
			
			var fpath   = System.RootURL + '/standard/forms/60/06/60060030_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}
//----------------------------------------------------------------------
function OnCancel()
{
	if(confirm("Are you sure you want to cancel cost of FG Sold?"))
	{
	    if(idGridVC.row > 0)
	    {
	        txtTacHgtrh.SetDataText(idGridVC.GetGridData(idGridVC.row, 2));
	        idBtnCancel.SetEnable(false);
	        idBtnProcess.SetEnable(true);
		    dat_60170350_3.Call();
        }		    
	}	
}
//----------------------------------------------------------------------
</script>

<body>
    <gw:data id="dat_60170350" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,5,6,7,8,9,10,11" function="ac_sel_60170350"  > 
                <input bind="idGridVC" >
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
                    <input bind="rbstatus" /> 
                    <input bind="lstTR_TYPE" /> 
                </input>
                <output  bind="idGridVC" />
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="dat_60170350_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,5,6,7,8,9,10,11" function="ac_sel_60170350_1"  > 
                <input bind="idGridItem" >
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
                    <input bind="txtTac_crca_pk" /> 
                 </input>
                <output  bind="idGridItem" />
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="dat_60170350_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ac_pro_60170350_ar_costing" > 
                <input>                   
                    <input bind="lstCompany" />					
					<input bind="dbMonth" />
                 </input>
                <output>
                    <output bind="txtSeq"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="dat_60170350_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ac_pro_60170350_ar_costing_2" > 
                <input>
                    <input bind="lstCompany" />                    
                    <input bind="dbMonth" />
					<input bind="txtSeq" />
                 </input>
                <output>
                    <output bind="txtSeq"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <table style="width: 100%; height:100%" border="1"   >
        <tr style="height:10%" >
            <td>
                <table width = "100%" style="height:100%" border="0" cellspacing="0" cellpadding="0" >
                <tr style="height:50%" >
                    <td style="width:10%" align="right">Company&nbsp;</td>
                    <td style="width:15%" align="left"><gw:list id="lstCompany" styles="width:100%" /></td>            
                    <td style="width:12%" align="right">Slip Status&nbsp;</td>
                    <td style="width:10%" colspan="5" align="left">
                        <gw:radio id="rbstatus" value="2" onchange="onSearch(0)"> 
			                <span value="2">Confirmed&nbsp;</span>
			                <span value="0">Approved&nbsp;</span>
			            </gw:radio>
                    </td> 
                    <td style="width:3%" align="right"><!--gw:imgbtn id="idBtnDel" img="delete" alt="Delete" text="Delete" onclick="" /--></td>
                    <td style="width:1%" align="right"><gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="onSearch(0)" /></td>
                    <td style="width:1%" align="right"><gw:icon id="idBtnProcess" text="Make Slip" onclick="OnUpdate()" /></td>                   
                </tr>
                <tr style="height:50%" >
                    <td style="width:10%" align="right" >Monthly&nbsp;</td>
                    <td style="width:15%" align="left" ><gw:datebox id="dbMonth" type="month" lang="1" onchange="" /></td>            
                    <td style="width:12%" align="right">Type&nbsp;</td>
                    <td style="width:10%" align="left"><gw:list id="lstTR_TYPE" styles='width:100%' onchange="onSearch(0)"/></td>
                    <td style="width:28%" align="right">Seq</td>            
					<td style="width:10%" align="left"><gw:textbox id="txtSeq" /></td>
                    <td style="width:3%" align="left"></td>
                    <td colspan="3" style="width:15%"></td>
					<td style="width:1%" align="right"><gw:icon id="idBtnCancel" text="Cancel Slip" onclick="OnCancel()" /></td>
                </tr>
                </table>
            </td>                
        </tr>
        <tr style="height:45%" >
            <!--No|0.Pk|1.Seq|2.Voucher no|3.Voucher date|4.Serial no|5.Invoice date|6.Invoice no|7.CCY|8.Rate|9.Trans. Amt|10.Book amt|11.Description|12.Local Description|14. Status-->
            <td>
                <gw:grid id="idGridVC"                 
                    header="No.|_Pk|Seq|Voucher no|Voucher date|_Serial no|_Invoice date|_Invoice no|CCY|Rate|_Trans. Amt|Book amt|Description|Local Description|_Status"
                    format="0|0|0|0|4|0|4|0|0|0|0|0|0|0|0" 
                    aligns="3|3|1|0|1|0|1|0|1|3|3|3|0|0|0" 
                    defaults="||||||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="700|700|1000|1600|1300|1000|1200|1200|500|800|1500|1900|2500|2000|0" 
                    styles="width:100%;height:220; " 
                    sorting="T"
                    onafteredit="OnGridDblClick()"
                    oncelldblclick="OnPopupSlipEntry()"
                    oncellclick="OnGridClick()"
                    onselchange="OnGridClick()"
                    acceptNullDate="T" />                
            </td>
        </tr>
         <tr style="height:45%" >
            <!---0.No|1.Item Code|2.Item Name|3.Hs Code|4.Unit|5.Quantity|6.U/Price|7.Amount|8.Warehouse-->
            <td>
                <gw:grid id="idGridItem"                 
                    header="No|Item Code|_Item Name|_Hs Code|Unit|Quantity|U/Price|Amount|Sample"
                    format="0|0|0|0|0|0|0|0|3" 
                    aligns="3|0|0|0|1|3|3|3|0" 
                    defaults="||||||||" 
                    editcol="0|0|0|0|0|0|1|0|0"
                    widths="700|2500|3500|1200|600|1500|1700|2000|2500" 
                    styles="width:100%;height:100%; " 
                    sorting="T"
                    onafteredit="OnGridDblClick()"
                    oncelldblclick="OnGridDblClick()"
                    acceptNullDate="T" />                
            </td>
        </tr>
    </table>
<!---------------------------------------------------------->
<gw:textbox id="txtTac_abacctcode_pk" styles="display:none; " />
<gw:textbox id="txtTco_item_pk" styles="display:none; " />
<gw:textbox id="txtTac_crca_pk" styles="display:none; " />
<gw:textbox id="txtNUM_PK" styles="display:none; " />
<gw:textbox id="txtCRCA_PK" styles="display:none; " />
<gw:textbox id="txtStatus" styles="display:none; " />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtTac_acctcode_pk_cost" styles="display:none; " />
<gw:textbox id="txtVCType" styles="display:none; " />
<gw:textbox id="txtTacHgtrh" styles="display:none; " />
</body>
</html>
