<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Inventory Inquiry</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;

    var 
        iG0_No          = 0,
        iG0_Acc_Cd      = 1,
        iG0_Acc_Nm      = 2,
        iG0_Item_Code   = 3,
        iG0_Item_Name   = 4,
		iG0_Item_LName	= 5,
        iG0_UOM         = 6,
        iG0_WH          = 7,
        iG0_PL_CD       = 8,
        iG0_PL_NM       = 9,
        iG0_Open_Qty    = 10,
        iG0_Open_Amt    = 11,
        iG0_IN_Qty      = 12,
        iG0_IN_Amt      = 13,
        iG0_OUT_Qty     = 14,
        iG0_OUT_Amt     = 15,
        iG0_End_Qty     = 16,
        iG0_End_Amt     = 17;
        
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
//    txtAccountCode.SetEnable(false);
    txtAccountName.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
//    idGrid.GetGridControl().FrozenCols = 2 ;
    OnFormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>|ALL|ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = 'ALL';     
	lstOpt.value = "4" ; // InOut Details
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
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
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=&comm_code=&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60170010_acct_open";
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccountCode.text = object[0];
                txtAccountName.text = object[1];
                txtTAC_ABACCTCODE_PK.text = object[3];
            }    
        break ;
    case 'Item':        
            var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtTCO_ITEM_PK.text = object[0] ;
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
        var path = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?dsqlid=ac_sel_pl_popup_plpk&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name&val1=" + lstWH.value ;
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
function OnSearch()
{
    //if(lstOpt.value == '0')
    //{
        data_60170210.Call("SELECT")            
    //}     
    //else if(lstOpt.value == '1')
    //{
    //    data_fmgf00110_2.Call("SELECT")
    //}   
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    var lOpenQty = 0, lOpenAmt = 0, lInQty = 0, lInAmt = 0, lOutQty = 0, lOutAmt = 0, lEndQty = 0, lEndAmt = 0;          
    switch (obj.id)
    {
        case "data_60170210" :            
            CalcuSubTotal();       
          var ctr = idGrid.GetGridControl()
          
           if(ctr.rows > 1)
           {
                for( i =1 ; i< ctr.rows; i++)
               {
                    if( idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Qty) != "")
                        lOpenQty = lOpenQty + parseFloat(idGrid.GetGridData(i, iG0_Open_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Amt) != "")
                        lOpenAmt = lOpenAmt + parseFloat(idGrid.GetGridData(i, iG0_Open_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Qty) != "")
                        lInQty = lInQty + parseFloat(idGrid.GetGridData(i, iG0_IN_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Amt) != "")
                        lInAmt = lInAmt + parseFloat(idGrid.GetGridData(i, iG0_IN_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Qty) != "")
                        lOutQty = lOutQty + parseFloat(idGrid.GetGridData(i, iG0_OUT_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Amt) != "")
                        lOutAmt = lOutAmt + parseFloat(idGrid.GetGridData(i, iG0_OUT_Amt));                        
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_End_Qty) != "")
                        lEndQty = lEndQty + parseFloat(idGrid.GetGridData(i, iG0_End_Qty));                        
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_End_Amt) != "")
                        lEndAmt = lEndAmt + parseFloat(idGrid.GetGridData(i, iG0_End_Amt));                        
                }
              idGrid.AddRow();
              idGrid.SetGridText(i, 0, "TOTAL");
              idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Qty, lOpenQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Amt, lOpenAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Qty, lInQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Amt, lInAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Qty, lOutQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Amt, lOutAmt) ;    
              
              idGrid.SetGridText(idGrid.rows-1, iG0_End_Qty, lEndQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_End_Amt, lEndAmt) ;    
                        
              ctr.TopRow = idGrid.rows-1;                    
          }         
        break;
        case "data_fmgf00110_2" :            
            CalcuSubTotal();       
          var ctr = idGrid.GetGridControl()
          
           if(ctr.rows > 1)
           {
                for( i =1 ; i< ctr.rows; i++)
               {
                    if( idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Qty) != "")
                        lOpenQty = lOpenQty + parseFloat(idGrid.GetGridData(i, iG0_Open_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Amt) != "")
                        lOpenAmt = lOpenAmt + parseFloat(idGrid.GetGridData(i, iG0_Open_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Qty) != "")
                        lInQty = lInQty + parseFloat(idGrid.GetGridData(i, iG0_IN_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Amt) != "")
                        lInAmt = lInAmt + parseFloat(idGrid.GetGridData(i, iG0_IN_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Qty) != "")
                        lOutQty = lOutQty + parseFloat(idGrid.GetGridData(i, iG0_OUT_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Amt) != "")
                        lOutAmt = lOutAmt + parseFloat(idGrid.GetGridData(i, iG0_OUT_Amt));                        
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_End_Qty) != "")
                        lEndQty = lEndQty + parseFloat(idGrid.GetGridData(i, iG0_End_Qty));                        
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_End_Amt) != "")
                        lEndAmt = lEndAmt + parseFloat(idGrid.GetGridData(i, iG0_End_Amt));                        
                }
              idGrid.AddRow();
              idGrid.SetGridText(i, 0, "TOTAL");
              idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Qty, lOpenQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Amt, lOpenAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Qty, lInQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Amt, lInAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Qty, lOutQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Amt, lOutAmt) ;    
              
              idGrid.SetGridText(idGrid.rows-1, iG0_End_Qty, lEndQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_End_Amt, lEndAmt) ;    
                        
              ctr.TopRow = idGrid.rows-1;                    
          }         
        break;                
    }    
}
//------------------------------------------------------------------------
function OnExcel()
{
	var v_Opt = lstOpt.value ;
	switch(v_Opt)
	{
		case '4':
			var url = System.RootURL + "/standard/reports/60/17/rpt_60170210_V3.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&item=" + txtItemCode.text + "&tac_abplcenter_pk=" + txttac_abplcenter_pk.text + "&tin_warehouse_pk=" + lstWH.value + "&acc_pk=" + txtTAC_ABACCTCODE_PK.GetData();
			System.OpenTargetPage(url);					
		break ;
		case '3':
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_3.aspx?std_ym=" + dbMonthly.value + "&ac_cd=" + txtAccountCode.text + "&tin_warehouse_pk=" + lstWH.value + "&tco_company_pk=" + lstCompany.value + "&item_code=" + txtItemCode.text ;
            System.OpenTargetPage(url);        		
		break;
		case '2':
			var url = System.RootURL + "/standard/reports/fm/gf/FMGF00220_V2.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&item=" + txtItemCode.text + "&tac_abplcenter_pk=" + txttac_abplcenter_pk.text + "&tin_warehouse_pk=" + lstWH.value + "&acc_pk=" + txtTAC_ABACCTCODE_PK.GetData();
			System.OpenTargetPage(url);					
		break ;
		case '0':
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_1.aspx?std_ym=" + dbMonthly.value + "&ac_cd=" + txtAccountCode.text + "&tin_warehouse_pk=" + lstWH.value + "&tco_company_pk=" + lstCompany.value + "&tco_item_pk=" + txtTCO_ITEM_PK.text + "&pl_cd=" + txtPLCode.text + "&std_ym_to=" + dbMonthlyto.value ;
            System.OpenTargetPage(url);        		
		break;
		case '5': // Working Process A4
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_Wip_Cost.aspx?comp_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&wh_pk=" + lstWH.value ;
            System.OpenTargetPage(url);        		
		break;
		case '6': // Working Process A5
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_Wip_Cost_A5.aspx?comp_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&wh_pk=" + lstWH.value ;
            System.OpenTargetPage(url);        		
		break;
		case '7': // Working Process A6
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_Wip_Cost_A6.aspx?comp_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&wh_pk=" + lstWH.value ;
            System.OpenTargetPage(url);        		
		break;
		case '8': // Wip In Out
			var url = System.RootURL + "/standard/reports/fm/gf/FMGF00110_A1A3.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dbMonthly.value + "01" + "&to_dt=" + dbMonthly.value + "31" + "&item=" + txtItemCode.text + "&tac_abplcenter_pk=" + txttac_abplcenter_pk.text + "&tin_warehouse_pk=" + lstWH.value + "&acc_pk=" + txtTAC_ABACCTCODE_PK.GetData();
			System.OpenTargetPage(url);					
		break;
	}
    /*switch(iObj)
    {
        case 'group':
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110.aspx?std_ym=" + dbMonthly.value + "&ac_cd=" + txtAccountCode.text + "&tin_warehouse_pk=" + lstWH.value + "&tco_company_pk=" + lstCompany.value + "&item_code=" + txtItemCode.text ;
            System.OpenTargetPage(url);        
        break ;
        case 'item':
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_1.aspx?std_ym=" + dbMonthly.value + "&ac_cd=" + txtAccountCode.text + "&tin_warehouse_pk=" + lstWH.value + "&tco_company_pk=" + lstCompany.value + "&tco_item_pk=" + txtTCO_ITEM_PK.text + "&pl_cd=" + txtPLCode.text + "&std_ym_to=" + dbMonthlyto.value ;
            System.OpenTargetPage(url);        
        break ;
        case 'details':
            var url = System.RootURL + "/standard/reports/fm/gf/fmgf00110_3.aspx?std_ym=" + dbMonthly.value + "&ac_cd=" + txtAccountCode.text + "&tin_warehouse_pk=" + lstWH.value + "&tco_company_pk=" + lstCompany.value + "&item_code=" + txtItemCode.text ;
            System.OpenTargetPage(url);        
        break ;
            
    }*/
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var trl ;
    trl = idGrid.GetGridControl();	
    trl.ColFormat(iG0_Open_Qty)                 = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_Open_Amt)                 = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_IN_Qty)                   = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_IN_Amt)                   = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_OUT_Qty)                  = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_OUT_Amt)                  = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_End_Qty)                  = "###,###,###,###,###.##R";
    trl.ColFormat(iG0_End_Amt)                  = "###,###,###,###,###.##R";
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
function CalcuSubTotal()
{                
        var ctr=idGrid.GetGridControl(); 
        ctr.OutlineBar =2 ;
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
</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="data_60170210" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170210_gCompany" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtAccountCode"/>                    
                    <input bind="txtTCO_ITEM_PK"/>                    
                    <input bind="txttac_abplcenter_pk"/>                    
                    <input bind="lstWH"/>                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      
    
  <gw:data id="data_fmgf00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="sp_sel_fmgf00110_2" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
			        <input bind="dbMonthlyto"/>
                    <input bind="txtAccountCode"/>                    
                    <input bind="txtTCO_ITEM_PK"/>                    
                    <input bind="txttac_abplcenter_pk"/>                    
                    <input bind="lstWH"/>                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      
      </gw:data>     
	 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>		
    <!-------------------------------------------------------------------->
<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
    <tr style="height:10%" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                <tr>
                    <td style="width: 8%"></td>
                    <td style="width: 14%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 16%"></td>
                    <td style="width: 2%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 16%"></td>
                    <td style="width: 2%"></td>
                    <td style="width: 3%"></td>
                    <td style="width: 5%"></td>
                    <td style="width: 2%"></td>
                </tr>
				<tr>
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>				
					<td align="right">Period</td>
					<td align="left" ><gw:datebox id="dbMonthly" type="month" lang="1" /></td>
					<td align="right" colspan="2" >
						<gw:list id="lstOpt" >
							<data>DATA|0|Item|1|STItem|2|Transaction Details|3|Details Inventory|4|InOut Details|5|Working Process(A4)|6|Working Process(A5)|7|Working Process(A6)|8|Wip In Out</data>
						</gw:list>
					</td>
                    <td align="right" ><a title="Click here to select Product Item" onclick="OnPopUp('Item')" href="#tips">Item</a></td>
                    <td align="left" ><gw:textbox id="txtItemCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td align="left" ><gw:textbox id="txtItemName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td align="right">
						<gw:imgbtn img="reset" alt="Reset" id="btnReset3" onclick="OnReset('Item')" />
                    </td>                                                            					
                    <td align="right"><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
                    <td align="right">                       
                    </td>
                    <td align="right"><gw:imgbtn img="printer" alt="Report by Item" id="btnExcel2" onclick="OnExcel()" /></td>					
				</tr>
				<tr>
                    <td align="right" >WH</td>
                    <td colspan="1" align="left" ><gw:list id="lstWH" styles="width:100%; " onchange="OnSearch()" /></td>				
                    <td align="right" ><a title="Click here to select account" onclick="OnPopUp('Account')" href="#tips">Account</a></td>
                    <td align="left"><gw:textbox id="txtAccountCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td align="left"><gw:textbox id="txtAccountName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset('Account')" />
					</td>
                    <td align="right" ><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips">PL</a></td>
                    <td align="left"><gw:textbox id="txtPLCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td align="left" ><gw:textbox id="txtPLName" text="" styles="width:100%; " csstype="mandatory" /></td>                    
                    <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset('PL')" /></td>                    					
					<td colspan="3" align="right" ><gw:icon id="btnExcel3" text="Details Inventory" style="display:none;" onclick="OnExcel()" /></td>
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:90%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
                    <td>
                        <gw:grid id="idGrid" 
                            header="|Acc.Cd|Acc.Nm|Item Code|Item Name|_Item Localname|UOM|WH|PL CD|PL NM|Begin Qty|Begin Amt|IN Qty|IN Amt|OUT Qty|OUT Amt|End Qty|End Amt"
                            format="0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1" 
                            aligns="2|1|0|2|2|2|1|2|2|2|3|3|3|3|3|3|3|3"
                            defaults="|||||||||||||||||" 
                            editcol="0|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1" 
                            widths="1000|1200|2000|1200|3000|2500|800|1800|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="T" 
                            param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>            
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtProposedByUserPk" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
<gw:textbox id="txttac_abplcenter_pk" styles="display:none; " />
<gw:imgbtn img="excel" alt="Report by Item Group" id="btnExcel" style="display:none;" onclick="OnExcel('group')" />
<gw:datebox id="dbMonthlyto" type="month" style="display:none;" lang="1" />
</body>
</html>