<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>WIP Evaluation</title>
</head>

<script>

    var  user_pk = "<%=Session("USER_PK")%>"  ;
	var  dept_pk = "<%=Session("DEPT_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
	var g_user_id = "<%=Session("USER_ID")%>" ;
    var 
        iG0_Item_Code          = 0,
        iG0_Item_Name      		= 1,
        iG0_UOM   				= 2,
        iG0_Gauge				= 3,
		iG0_Begin_Qty			= 4,
		iG0_Begin_Amt			= 5,
        iG0_Input_Qty      		= 6,
        iG0_Norm				= 7,
        iG0_Total_Norm			= 8,
        iG0_Raw_Mat_Qty		= 9,
        iG0_Raw_Mat_Amt		= 10,
        iG0_Sub_Mat_Qty		= 11,
        iG0_Labor_Cost		= 12,
        iG0_General_Cost	= 13,
		iG0_Total_Cost		= 14,
		iG0_UPrice_In		= 15,
		iG0_PK				= 16 ;
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    txtAccountCode.SetEnable(false);
    txtAccountName.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    txtUserPK.SetDataText(user_pk);
	txtDeptPK.SetDataText(dept_pk);
    OnFormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 ORDER BY wh_name ASC" )%>|ALL|ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = 'ALL';       
    var l_loading_opt = "<%=CtlLib.SetDataSQL("select d.code from tac_commcode_detail d, tac_commcode_master a where a.id = 'ACBG0183' and a.del_if = 0 and d.tac_commcode_master_pk = a.pk and d.del_if = 0 and d.def_yn = 'Y' ")%>";  
    if(l_loading_opt == 'Auto')
    {   
        btnSave.SetEnable(false);
    }
    else
    {
        btnSave.SetEnable(false);
    }
	// Set Select All
	lstGauge.value = "";
    idGrid.GetGridControl().FrozenCols = 4 ;
}
//------------------------------------------------------------------------
function OnPopUp(iObj)
{
    switch(iObj)
    {
    case 'Account':
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }            
            var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_code=&comm_nm=&dsqlid=AC_SEL_fmgf00050_3&val1=&val2=&val3=Yval4=" + lstCompany.value + "&val5=" + lstWH.value + "&val6=Y&val7=ENG&val8=" + g_user_id ;

            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccountCode.text = object[0];
                txtAccountName.text = object[1];
                txtTAC_ABACCTCODE_PK.text = object[3];
            }    
        break ;
    case 'Item':        
            var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=Y&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItemCode.text = object[1];
                txtItemName.text = object[2];
            }                        
        break;
    case 'PL':
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }              
            var path = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?dsqlid=ACNT.SP_SEL_fmgf00050_2&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name&comm_nm=" +  + "&val1=" + lstWH.value ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txttac_abplcenter_pk.text = object[2];
                txtPLCode.text = object[0];
                txtPLName.text = object[1];
            }
            break;
    }
}
//------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'fmgf00250' :        
		if(lstWH.value == 'ALL')
		{
			alert("Please select warehouse!");
		}
		else
		{
            fmgf00250.Call("SELECT")            
		}	
        break;
    }
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    var lOpenQty = 0, lOpenAmt = 0, lInQty = 0, lTotalNorm = 0, lRawMatQty = 0, lRawMatAmt = 0, lSubMatAmt = 0, lLaborCost = 0, lGeneralCost = 0, lTotalCost = 0;          
    switch (obj.id)
    {
        case "fmgf00250" :            
            //CalcuSubTotal();       
          
		  var ctr = idGrid.GetGridControl()          
           if(ctr.rows > 1)
           {
                for( i =1 ; i< ctr.rows; i++)
               {
					lOpenQty = lOpenQty + Number(idGrid.GetGridData(i, iG0_Begin_Qty));                    
					lOpenAmt = lOpenAmt + Number(idGrid.GetGridData(i, iG0_Begin_Amt));
					lInQty = lInQty + Number(idGrid.GetGridData(i, iG0_Input_Qty));
					lTotalNorm = lTotalNorm + Number(idGrid.GetGridData(i, iG0_Total_Norm));
					lRawMatQty = lRawMatQty + Number(idGrid.GetGridData(i, iG0_Raw_Mat_Qty));
					lRawMatAmt = lRawMatAmt + Number(idGrid.GetGridData(i, iG0_Raw_Mat_Amt));
					lSubMatAmt =  lSubMatAmt + 	Number(idGrid.GetGridData(i, iG0_Sub_Mat_Qty));
					lLaborCost = lLaborCost + Number(idGrid.GetGridData(i, iG0_Labor_Cost));
					lGeneralCost = lGeneralCost + Number(idGrid.GetGridData(i, iG0_General_Cost));
					lTotalCost = lTotalCost + Number(idGrid.GetGridData(i, iG0_Total_Cost));
                }
			  idGrid.AddRow();
			  idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
			  idGrid.SetGridText(i, iG0_Item_Name, "TOTAL");
			  idGrid.SetGridText(idGrid.rows-1, iG0_Begin_Qty, lOpenQty) ;
			  idGrid.SetGridText(idGrid.rows-1, iG0_Begin_Amt, lOpenAmt) ;
			  idGrid.SetGridText(idGrid.rows-1, iG0_Input_Qty, lInQty) ;			  
			  idGrid.SetGridText(idGrid.rows-1, iG0_Total_Norm, lTotalNorm) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_Raw_Mat_Qty, lRawMatQty) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_Raw_Mat_Amt, lRawMatAmt) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_Sub_Mat_Qty, lSubMatAmt) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_Labor_Cost, lLaborCost) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_General_Cost, lGeneralCost) ;	
			  idGrid.SetGridText(idGrid.rows-1, iG0_Total_Cost, lTotalCost) ;	
			  ctr.TopRow = idGrid.rows-1; 			  
          }   
		  else
			{
				idGrid.ClearData();
			}
		  ctr.FrozenCols = 4 ;
		  if(idGrid.rows > 1)
		  {
				btnRemove.SetEnable(true);				
				btnInOut.SetEnable(true);
		  }
		  else
		  {
				btnRemove.SetEnable(false);					  
				btnInOut.SetEnable(true);
		  }
		  dso_search_seq.Call();
		  
		break;
        case 'dso_inout_upd':
            fmgf00250.Call("SELECT");
        break ;
		case 'dso_cancel_slip':
			txtSeq.SetDataText("");
			btnMakeSlip.SetEnable(true);
		break ;
		case "dso_make_slip":
			//dso_search_seq.Call();
			btnCancel.SetEnable(true);
		break ;
		case 'dso_remove_data':
			fmgf00250.Call('SELECT');
		break ;
		case "dso_search_seq":
		  if(txtSeq.GetData() != "")
		  {
				btnMakeSlip.SetEnable(true);
				btnCancel.SetEnable(true);
		  }
		  else
		  {
				btnMakeSlip.SetEnable(true);
				btnCancel.SetEnable(false);		  
		  }
		break ;
    }    
}
//------------------------------------------------------------------------
function OnExcel(obj)
{
    var url = System.RootURL + "/standard/reports/fm/gf/rpt_fmgf00250.aspx?comp_pk=" + lstCompany.value + "&from_date=" + dtFrom.value + "&to_date=" + dtTo.value + "&wh_pk=" + lstWH.value ;
    System.OpenTargetPage(url);            
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var trl ;
    trl = idGrid.GetGridControl();	
    trl.ColFormat(iG0_Begin_Qty)                 = "###,###,###,###,###R";
    trl.ColFormat(iG0_Begin_Amt)            = "###,###,###,###,###R";
	trl.ColFormat(iG0_Input_Qty)            = "###,###,###,###,###R";
	trl.ColFormat(iG0_Norm)            = "###,###,###,###,###.###R";
	trl.ColFormat(iG0_Total_Norm)            = "###,###,###,###,###.###R";
	trl.ColFormat(iG0_Raw_Mat_Qty)            = "###,###,###,###,###.###R";
	trl.ColFormat(iG0_Raw_Mat_Amt)            = "###,###,###,###,###,###R";
	trl.ColFormat(iG0_Sub_Mat_Qty)            = "###,###,###,###,###,###R";
	trl.ColFormat(iG0_Labor_Cost)            = "###,###,###,###,###,###R";
	trl.ColFormat(iG0_General_Cost)            = "###,###,###,###,###,###R";
	trl.ColFormat(iG0_Total_Cost)            = "###,###,###,###,###,###R";
	trl.ColFormat(iG0_UPrice_In)            = "###,###,###,###,###,###.####R";
}
//-----------------------------------------------------
function OnReset(iObj)
{
    switch(iObj)
    {
        case 'Account':
            txtAccountCode.text = "" ;
            txtAccountName.text = "" ;
            txtTAC_ABACCTCODE_PK.text = "" ;
        break;
        case 'Item':
            txtItemCode.text = '' ;
            txtItemName.text = '' ;                    
            txtTCO_ITEM_PK.text = '' ;
        break ;   
        case 'PL':         
            txtPLCode.text = '';
            txtPLName.text = '';
            txttac_abplcenter_pk.text = '' ;
        break ;            
    }
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}
//-----------------------------------------------------
//-----------------------------------------------------
function MergeColumn()
{
//      idGrid.GetGridControl().MergeCells  = 2 ;	
//      idGrid.GetGridControl().MergeCol(0) = true ;	
//      idGrid.GetGridControl().MergeCol(1) = true ;   	
//      idGrid.GetGridControl().MergeCol(2) = true ;	
//      idGrid.GetGridControl().MergeCol(3) = true ;	
//      idGrid.GetGridControl().MergeCol(4) = true ;		
//      idGrid.GetGridControl().MergeCol(5) = true ;	
//      idGrid.GetGridControl().MergeCol(6) = true ;	
}
//-----------------------------------------------------
function CalcuSubTotal()
{                
        var ctr=idGrid.GetGridControl(); 
        ctr.OutlineBar = 2 ;
        //ctr.SubtotalPosition=0;
        var color;
        var caption;
        var operator;        
        for (var igroup=0;igroup<=1;igroup++)
        {
            switch (igroup)
            {
                case 0:
                {
                    color=0xCCFFFF ;
                    caption='Grand Total';
                    break;
                }
                case iG0_Acc_Cd:
                {
                    color = 0xCCFFFF ;
                    caption='%s';
                    break;
                }                
            }
            for(var itotal = iG0_Open_Qty; itotal <= iG0_End_Amt; itotal++)
            {                
                ctr.SubTotal(2, igroup, itotal, '', color, 0x000000, '1', caption, '', true);
            }
        auto_resize_column(idGrid, 0, idGrid.cols-1, 10); 
    }            
}
//-----------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-----------------------------------------------------
function OnSave()
{
	fmgf00120.Call();	
}
//-----------------------------------------------------
function OnChange(iObj)
{
	/*
	var lcol, lrow, lOut_Qty, lIn_Qty, lOpen_Qty, lEnd_Qty ;    
    lcol = event.col ;
    lrow = event.row ;
    var ltac_stockmm_pk = idGrid.GetGridData(lrow, iG0_tac_stockmm_pk);
    switch(iObj.id)
    {
        case 'idGrid':
            if(Trim(ltac_stockmm_pk) == "")
            {
                return ;
            }
            if( lcol == iG0_End_Qty && Trim(ltac_stockmm_pk) != "" )
            {
                if( Trim(idGrid.GetGridData(lrow, iG0_IN_Qty)) != "" )
                    lIn_Qty = idGrid.GetGridData(lrow, iG0_IN_Qty);
                else
                    lIn_Qty = "0";                                        
                if( Trim(idGrid.GetGridData(lrow, iG0_Open_Qty)) != "" )                    
                    lOpen_Qty = idGrid.GetGridData(lrow, iG0_Open_Qty);
                else
                    lOpen_Qty = "0" ;                                        
                if( Trim(idGrid.GetGridData(lrow, iG0_End_Qty)) != "" )                    
                    lEnd_Qty = idGrid.GetGridData(lrow, iG0_End_Qty);                                
                else
                    lEnd_Qty = "0";                                        
                lOut_Qty = parseFloat(lOpen_Qty) + parseFloat(lIn_Qty) - parseFloat(lEnd_Qty);
                idGrid.SetGridText(lrow, iG0_OUT_Qty, lOut_Qty);
                idGrid.SetRowStatus(event.row, Number('0x10')) ;
            }
        break;
    }
	*/
}
//-----------------------------------------------------
function OnUpdInOut()
{
    if(confirm('Are you sure you want to process Wip Evaluation data?'))
    {
        dso_inout_upd.Call();
    }        
}
//-----------------------------------------------------
function OnRemove()
{
	if(lstWH.value == 'ALL')
	{
		alert('Please select a warehouse!');
		return ;
	}
	if(confirm('Are you sure you want to remove Wip Evaluation?'))
	{
		dso_remove_data.Call();
	}
}
//-----------------------------------------------------
function OnMakeSlip()
{
	if(lstWH.value == 'ALL')
	{
		alert('Please select a warehouse!');
		return ;
	}
	if(confirm('Are you sure you want to make slip?'))
	{		
		dso_make_slip.Call();
	}
}
//-----------------------------------------------------
function OnCancelSlip()
{
	if(lstWH.value == 'ALL')
	{
		alert('Please select a warehouse!');
		return ;
	}
	if(confirm('Are you sure you want to cancel seq?'))
	{
		dso_cancel_slip.Call();
	}
}
//-----------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="fmgf00250" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_FMGF00250" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany" />                    
                    <input bind="dtFrom" />                    
                    <input bind="dtTo" />                                        
                    <input bind="lstWH" />             
					<input bind="txtItemCode" /> 		   					
					<input bind="txtTAC_ABACCTCODE_PK" />
					<input bind="lstGauge" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
    <!-------------------------------------------------------------------->
     <gw:data id="dso_inout_upd" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_FMGF00250" > 
                <input>
                   <input bind="lstCompany" />
                   <input bind="dtFrom"/>
                   <input bind="dtTo"/>
                   <input bind="lstWH"/>              					
                 </input>
                <output>
                    <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->   
     <gw:data id="dso_remove_data" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_FMGF00250_1" > 
                <input>
                   <input bind="lstCompany" />
                   <input bind="dtFrom"/>
                   <input bind="dtTo"/>
                   <input bind="lstWH"/>              					
                 </input>
                <output>
                    <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->   	
     <gw:data id="dso_make_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_FMGF00250_MAKE_SLIP" > 
                <input>
                   <input bind="lstCompany" />
				   <input bind="txtUserPK" />
				   <input bind="txtDeptPK" />                   
                   <input bind="dtTo"/>
                   <input bind="lstWH"/>  
					<input bind="txtVoucherNo"/>		
					<input bind="chkAuto"/>
					<input bind="txtVoucherType"/>
                 </input>
                <output>
                    <output bind="txtSeq"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->   
    <gw:data id="dso_cancel_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_FMGF00250_CANCEL_SLIP" > 
                <input>
                   <input bind="lstCompany" />
                   <input bind="txtSeq"/>
				   <input bind="lstWH"/>
				   <input bind="dtTo"/>
                 </input>
                <output>
                    <output bind="txtSeq"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->   
    <gw:data id="dso_search_seq" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_FMGF00250_2" > 
                <input>
                   <input bind="lstCompany" />
				   <input bind="dtTo"/>
				   <input bind="lstWH"/>
                 </input>
                <output>
                    <output bind="txtSeq"/>
					<output bind="txtTotal"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->   
	
<table style="width:100%;height:100%;" border="1" cellpadding="0" cellspacing="0" >
    <tr style="height:10%;" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%;" >
                <tr >
                    <td style="width: 8%; " align="right">Company</td>
                    <td style="width: 20%;" >
                        <gw:list id="lstCompany" styles="width:100%;" />
                    </td>
                    <td style="width: 8%;" align="right" ><a title="Click here to select account" onclick="OnPopUp('Account')" href="#tips">Account Dr</a>
                    </td>
                    <td style="width:8%;"><gw:textbox id="txtAccountCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtAccountName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset('Account')" />
                    </td>                                        
                    <td style="width: 8%;" align="right" ><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips">PL</a>
                    </td>
                    <td style="width:8%;"><gw:textbox id="txtPLCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtPLName" text="" styles="width:100%; " csstype="mandatory" /></td>                    
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset('PL')" />
                    </td>                    
                    <td style="width: 2%; " align="right">
                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('fmgf00250')" />
                    </td>
                    <td style="width: 3%;" align="right">
                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
                    </td>
                    <td style="width: 3%;" align="right">
                        <gw:imgbtn img="excel" alt="Print" id="btnExcel" onclick="OnExcel()" />
                    </td>
                </tr>
                <tr>
                    <td style="width:8%; " align="right" >Period</td>
                    <td style="width:20%; " align="left" >
                        <table width="100%" style="height:100%">
                            <tr>
                                <td style="width:50%" ><gw:datebox id="dtFrom" type="date" lang="1" /></td>
                                <td style="width:50%"><gw:datebox id="dtTo" type="date" lang="1" /></td>
                            </tr>
                        </table>                    
                    </td>
                    <td style="width: 8%;" align="right" ><a title="Click here to select Product Item" onclick="OnPopUp('Item')" href="#tips">Item</a></td>
                    <td style="width:8%;"><gw:textbox id="txtItemCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtItemName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset3" onclick="OnReset('Item')" />
                    </td>                                                            
                    <td style="width: 8%;" align="right" >Out WH</td>
                    <td style="width:22%;" colspan="3" ><gw:list id="lstWH" styles="width:100%; " onchange="OnSearch('fmgf00250')" /></td>
                    <td colspan="3" align="right"><gw:icon id="btnInOut" text="Process" img="in" styles="width:100%" onclick="OnUpdInOut()" /></td>
                </tr> 
				<tr>
					<td align="right">Gauge</td>
					<td colspan="1"><gw:list id="lstGauge" styles="width:100%;" onchange="OnSearch('fmgf00250')" >
									<data>DATA|0.47|0.47|0.57|0.57|0.67|0.67|0.77|0.77|1.0|1.0|1.2|1.2||ALL</data>
									</gw:list>
					</td>
					<td align="right">VoucherNo</td>
					<td colspan="1"><gw:checkbox id="chkAuto" styles="width:100%;" /></td>
					<td colspan="2"><gw:textbox id="txtVoucherNo" styles="width:100%;" csstype="mandatory" /></td>
					<td align="right">Seq</td>
					<td align="left" ><gw:textbox id="txtSeq" styles="width:100%;" /></td>					
					<td align="center" ><gw:icon id="btnRemove" img="in" text="Remove" onclick="OnRemove()" /></td>
					<td ><gw:icon id="btnMakeSlip" img="in" text="Make Slip" onclick="OnMakeSlip()" /></td>
					<td colspan="3" align="center"><gw:icon id="btnCancel" img="in" text="Cancel Slip" onclick="OnCancelSlip()" /></td>
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:90%;">
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%;" >
                <tr>
                    <td>
                        <gw:grid id="idGrid" 
                            header="Item Code|Item Name|UOM|Gauge|_Begin Qty|_Begin Amt|Input Qty|Norm (kg/pcs)|Total Norm|Raw Mat(Qty)|Raw Mat(Amt)|Sub Mat(Qty)|Labor Cost|General Cost|Total Cost|UPrice (In)|_PK"
                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            aligns="2|2|1|1|3|3|3|3|3|3|3|3|3|3|3|3|0"
                            defaults="||||||||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="1500|2500|800|800|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="T" 
                            />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>            
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
<gw:textbox id="txttac_abplcenter_pk" styles="display:none; " />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtUserPK" styles="display:none; " />
<gw:textbox id="txtDeptPK" styles="display:none; " />
<gw:textbox id="txtVoucherType" text="NTP" styles="display:none; " />
<gw:textbox id="txtTotal" text="NTP" styles="display:none; " />
</body>
</html>