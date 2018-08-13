<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Unit Price</title>
</head>

<script>
//---------------
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
 
 var    
    iCol_TAC_CRCOST_UP_PK           = 0,
    iCol_Month                      = 1,
    iCol_Day                        = 2,
    iCol_TAC_ABACCTCODE_PK          = 3,
    iCol_Acc_Code                   = 4,
    iCol_Acc_Name                   = 5,
    iCol_TCO_ITEM_PK                = 6,
    iCol_Item_Code                  = 7,
    iCol_Item_Name                  = 8,
    iCol_UOM                        = 9,
    iCol_CCY                        = 10,
    iCol_UPrice_USD                 = 11,
    iCol_UPrice_VND                 = 12,
    iCol_TCO_COMPANY_PK             = 13,
	iCol_WH_PK             			= 14,
	iCol_WH_NM             			= 15,
	iCol_Out_YN						= 16;
 
//----------------------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
 		
//----------------------------------------------------------------------
	        
function BodyInit()
{  
    System.Translate(document);
    BindingData();
    txtTac_abacctcode_pk.SetEnable(false);
    txtAccCode.SetEnable(false);
    txtAccName.SetEnable(false);
    txtTco_item_pk.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    idGrid.GetGridControl().ColWidth(iCol_Day) = 1000;
    //lstOpt.value = "1";
    OnChangeOption();
    OnFormatGrid();
	idBtnNew.SetEnable(false);
	idBtnSave.SetEnable(false);	
}
//----------------------------------------------------------------------
function BindingData()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 ")%>";
    lstCompany.SetDataText(ls_data);    
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    lstBook_ccy.SetDataText(ls_Book_ccy);
    <%=CtlLib.SetGridColumnComboFormat("idGrid", 10,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;    
    var fg = idGrid.GetGridControl();
    fg.FrozenCols = 8;    
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name as wh_name FROM tlg_in_warehouse  WHERE del_if = 0 ORDER BY wh_name  ASC" )%>||ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = '';       
    var l_option = "<%=CtlLib.SetDataSQL("select d.code from tac_commcode_detail d, tac_commcode_master a where a.pk =  d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id = 'ACBG0184' and d.def_yn = 'Y' ")%>";
    lstOpt.value = l_option ; 
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
	
}

//----------------------------------------------------------------------
function OnReset(iCase)
{
    switch(iCase)
    {
        case 'account':
            txtTac_abacctcode_pk.text = "";
            txtAccCode.text = "";
            txtAccName.text = "";
        break ;            
        case 'item':
            txtTco_item_pk.text = "";
            txtItemCode.text = "";
            txtItemName.text = "";
        break ;       
		case 'PL':
			txtPLPK.SetDataText("") ;     // PK
			txtPLCD.SetDataText("");     // PL code
			txtPLNM.SetDataText("");     // PL Name			
		break ;
    }
}
//----------------------------------------------------------------------
function OnFormatGrid()
{
    var ctrl = idGrid.GetGridControl();
    ctrl.ColFormat(iCol_UPrice_USD) = "###,###,###.#####R";
	ctrl.ColFormat(iCol_UPrice_VND) = "###,###,###.#####R";
	/*if(lstBook_ccy.value == "USD")
	    ctrl.ColFormat(iCol_UPrice_VND) = "###,###,###.#####R";    
	else
	    ctrl.ColFormat(iCol_UPrice_VND) = "###,###,###R"; */
}
//----------------------------------------------------------------------
function OnPopUp(iCase)
{
    switch(iCase)
    {
        case 'Account':
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }            
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_code=&comm_nm=&dsqlid=ac_sel_60170150_pp&val1=" + lstCompany.value + "&val2=&val3=" ;

            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccCode.text = object[0];
                txtAccName.text = object[1];
                txtTac_abacctcode_pk.text = object[3];
            }            
        break ;
        case 'Item':          
            var path = System.RootURL + "/standard/forms/60/17/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItemCode.text = object[1];
                txtItemName.text = object[2];
                txtTco_item_pk.text = object[0];
            }                    
        break ;
    }
}
//----------------------------------------------------------------------
function OnSearch()
{
    fmgf00140.Call("SELECT");
}
//----------------------------------------------------------------------
function OnAddNew()
{
    var lNewRow;
    idGrid.AddRow();
    lNewRow = idGrid.rows - 1;
    idGrid.SelectRow(lNewRow);
    idGrid.SetRowStatus(lNewRow, Number("0x20")); // inserted status
	/*
    if(lstOpt.value == "0")
    {
        idGrid.SetGridText(lNewRow, iCol_Month, dbMonth.value); // month
    }
    else
    {
        idGrid.SetGridText(lNewRow, iCol_Day, dbDay.value); //day
    } 
	*/
    idGrid.SetGridText(lNewRow, iCol_TCO_COMPANY_PK, lstCompany.value); // company
    if(txtTac_abacctcode_pk.text != '')
    {
        idGrid.SetGridText(lNewRow, iCol_TAC_ABACCTCODE_PK, txtTac_abacctcode_pk.GetData()); // account pk
        idGrid.SetGridText(lNewRow, iCol_Acc_Code, txtAccCode.GetData()); // account code
        idGrid.SetGridText(lNewRow, iCol_Acc_Name, txtAccName.GetData()); // account name
    }            
    if(lstWH.value != '')
    {
        idGrid.SetGridText(lNewRow, iCol_WH_PK, lstWH.value); // warehouse pk
        idGrid.SetGridText(lNewRow, iCol_WH_NM, lstWH.GetText()); // warehouse name
    }        
}
//----------------------------------------------------------------------
function OnGridDblClick()
{
    var lrow = event.row ;
    var lcol = event.col ;
    if(lcol == iCol_Item_Code)
    {        
        var path = System.RootURL + "/standard/forms/fm/gf/fmgf00130_popup.aspx?purchase_yn=&item_code=" + idGrid.GetGridData(lrow, iCol_Item_Code) + "&item_name=" ;
        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
        if(object != null)
        {
            var atemp = object[0];
            idGrid.SetGridText(lrow, iCol_Item_Code, atemp[1]);
            idGrid.SetGridText(lrow, iCol_Item_Name, atemp[2]);
            idGrid.SetGridText(lrow, iCol_TCO_ITEM_PK, atemp[0]);
            idGrid.SetGridText(lrow, iCol_UOM, atemp[5]);
            for(var i = 1; i < object.length; i++)
            {
                var atemp = object[i];
                idGrid.AddRow();        
                lrow = idGrid.rows - 1 ;
                idGrid.SetGridText(lrow, iCol_Month, dbMonth.value);
                idGrid.SetGridText(lrow, iCol_TCO_COMPANY_PK, lstCompany.value);
                if(txtTac_abacctcode_pk.text != '')
                {
                    idGrid.SetGridText(lrow, iCol_TAC_ABACCTCODE_PK, txtTac_abacctcode_pk.text);
                    idGrid.SetGridText(lrow, iCol_Acc_Code, txtAccCode.text);
                    idGrid.SetGridText(lrow, iCol_Acc_Name, txtAccName.text);
                }                        
                idGrid.SetGridText(lrow, iCol_Item_Code, atemp[1]);
                idGrid.SetGridText(lrow, iCol_Item_Name, atemp[2]);
                idGrid.SetGridText(lrow, iCol_TCO_ITEM_PK, atemp[0]);
                idGrid.SetGridText(lrow, iCol_UOM, atemp[5]);        
            }
        }                                 
    } //
    else if(lcol ==iCol_Acc_Code )
    {
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }            
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_code=&comm_nm=&dsqlid=ac_sel_60170150_pp&val1=" + lstCompany.value + "&val2=&val3=" ;

            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                idGrid.SetGridText(lrow, iCol_TAC_ABACCTCODE_PK, object[3]);
                idGrid.SetGridText(lrow, iCol_Acc_Code, object[0]);
                idGrid.SetGridText(lrow, iCol_Acc_Name, object[1]);
            }                
    }
	else if(lcol == iCol_WH_NM)
	{
        var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetWarehouse.aspx" ;
        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
        if(object != null)
         {
			idGrid.SetGridText(lrow, iCol_WH_PK, object[0] );
			idGrid.SetGridText(lrow, iCol_WH_NM, object[2] );
		}	
	}
}
//----------------------------------------------------------------------
function OnDelete()
{
    var ctrl = idGrid.GetGridControl();
    for(var i = 1; i < idGrid.rows; i++)
    {
        if(ctrl.isSelected(i)==true)
            idGrid.SetRowStatus(i, 0x40);    
    }    
}
//----------------------------------------------------------------------
function OnSave()
{
    var i;
    for(i = 1; i < idGrid.rows; i++)
    {
        if(Trim(idGrid.GetGridData(i, iCol_TAC_CRCOST_UP_PK))=="")
        {            
            idGrid.SetGridText(i, iCol_TCO_COMPANY_PK, lstCompany.value); // company
            if(idGrid.GetGridData(i, iCol_WH_NM) == '')
            {
                idGrid.SetGridText(i, iCol_WH_NM, lstWH.GetText());  // warehouse name
                idGrid.SetGridText(i, iCol_WH_PK, lstWH.value);  // warehouse pk
            }
            /*if(idGrid.GetGridData(i, iCol_Month) == '')    
            {
                idGrid.SetGridText(i, iCol_Month, dbMonth.value);  // month
            }*/
            if(idGrid.GetGridData(i, iCol_Acc_Code) == '')    
            {
                idGrid.SetGridText(i, iCol_TAC_ABACCTCODE_PK, txtTac_abacctcode_pk.GetData());  // account code pk
                idGrid.SetGridText(i, iCol_Acc_Code, txtAccCode.GetData());  // account code 
                idGrid.SetGridText(i, iCol_Acc_Name, txtAccName.GetData());  // account name
            }    
			if(idGrid.GetGridData(i, iCol_Out_YN) == '') 
			{
				if(rbType.value == '0')
				{
					idGrid.SetGridText(i, iCol_Out_YN, 'Y');
				}
				else
				{
					idGrid.SetGridText(i, iCol_Out_YN, 'N');
				}
			}
		    //idGrid.SetRowStatus(i, Number("0x20"));            
        }
    }
	if(confirm('Are you sure you want to save data?'))
	{
		fmgf00140.Call();
	}	
}
//----------------------------------------------------------------------
function OnUpdatePrice()
{
    /*if(Trim(txtTac_abacctcode_pk.text) == '')
    {
        alert('Please user choose the account code ');
        return ;
    }*/
    
    fmgf00140_1.Call();
}
//----------------------------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        case 'fmgf00140_1':
            fmgf00140.Call('SELECT');
        break ;
		case 'dso_update_price_In':
			alert(txtReturn.GetData());
		break;
    }
}
//----------------------------------------------------------------------
function OnChangeRate()
{
	if(event.col == iCol_UPrice_USD)
	{
	    var ls_rate = Trim(txtRate.text) ;
	    var lrow = event.row ;
	    var lcol = event.col ;
	    if(ls_rate != '')
	    {
	        ls_rate = Number(ls_rate);        
	    }            
	    var ls_ccy = idGrid.GetGridData(lrow, iCol_CCY); // tien trans 
	    var trans_uprice = idGrid.GetGridData(event.row, iCol_UPrice_USD) ;                
	    if(ls_ccy == lstBook_ccy.value )
	    {
	        idGrid.SetGridText(event.row, iCol_UPrice_VND, trans_uprice);
	    }
	    else
	    {
	        if(!isFinite(ls_rate))
	        {
	            alert('Please input exchange rate ');
	            return ;
	        }
	        idGrid.SetGridText(event.row, iCol_UPrice_VND, trans_uprice * ls_rate  );
	    }
	}		
}

//----------------------------------------------------------------------
function OnChangeOption()
{
    var fg = idGrid.GetGridControl();
    
    if(lstOpt.value == "0")
    {
        fg.ColWidth(iCol_Month) = 1000;
        fg.ColWidth(iCol_Day) = 0;            
        dbDay.style.display = "none";
        dbDayto.style.display = "none"; 
        dbMonth.style.display = "";
    }
    else if(lstOpt.value == "1")
    {
        fg.ColWidth(iCol_Month) = 0;
        fg.ColWidth(iCol_Day) = 1000;       
        dbMonth.style.display = "none";        
        dbDay.style.display = "";
        dbDayto.style.display = "none"; 
    }
    else if(lstOpt.value == "2")
    {
        dbDay.style.display = ""; 
        dbDayto.style.display = ""; 
        dbMonth.style.display = "none"; 
        fg.ColWidth(iCol_Month) = 0;
        fg.ColWidth(iCol_Day) = 1000;               
    }
}
//----------------------------------------------------------------------
function OnUpdate_PriceIn()
{
	if(confirm('Are you sure you want to update In-Price?'))
	{
		dso_update_price_In.Call();
	}
}
//----------------------------------------------------------------------
function OnChangePriceType()
{
	if(rbType.value == "0")
	{
		idBtnNew.SetEnable(false);
		idBtnSave.SetEnable(false);
	}
	else
	{
		idBtnNew.SetEnable(true);
		idBtnSave.SetEnable(true);	
	}	
	OnSearch();
}
//----------------------------------------------------------------------
function OnPopUp_PL()
{
	var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60170150_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME"; //lay tac_abplcenter_pk
	var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
	if ( object != null )  
	{
		if (object[0] != 0)
		{
			txtPLPK.SetDataText(object[2]) ;     // PK
			txtPLCD.SetDataText(object[0]);     // PL code
			txtPLNM.SetDataText(object[1]);     // PL Name
		}
		//txtSEQ.GetControl().focus();
	}
	else
	{
		//txtSEQ.GetControl().focus();
	}            
}
//----------------------------------------------------------------------
</script>
<body>
    <gw:data id="fmgf00140" onreceive=""> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,6,7,8,9,10,11,12,13,14,15,16" function="ac_sel_60170150_idgrd" procedure="ac_upd_60170150_idgrd" > 
                <input bind="idGrid" >
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
                    <input bind="txtTac_abacctcode_pk" /> 
                    <input bind="txtTco_item_pk" /> 
                    <input bind="dbDay" />
                    <input bind="lstOpt" />
                    <input bind="dbDayto" />
					<input bind="rbType" />
					<input bind="lstWH" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>    
 <gw:data id="fmgf00140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_upd_60170150_avg_uprice_">
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="lstWH"/>
                     <input bind="txtTac_abacctcode_pk"/>
                     <input bind="dbDay"/>   
                     <input bind="dbDayto"/>                     
                     <input bind="dbMonth"/>  
                     <input bind="lstOpt"/>                                        					 
                </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>

 <gw:data id="dso_update_price_In" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170150_list_comp">
                <input> 
                     <input bind="lstCompany"/>                     
                     <input bind="dbMonth"/>  
					 <input bind="lstWH"/>
                </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
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
<!--------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0" >
        <tr>
            <td>
                <table width = "100%" border="0" cellpadding="0" cellspacing="0" style="height:100%; ">
                <tr>
                    <td style="width:10%"></td>
                    <td style="width:15%"></td>
                    <td style="width:12%"></td>
                    <td style="width:10%" ></td>
                    <td style="width:15%" ></td>
                    <td style="width:4%" ></td>
                    <td style="width:6%" ></td>
                    <td style="width:13%"></td>
                    <td style="width:3%"></td>
                    <td style="width:3%"></td>
                    <td style="width:3%"></td>
                    <td style="width:3%"></td>
                </tr>                                        
                <tr style="height:4%">
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>            
                    <td  align="right"><a title="Click here to select account code" onclick="OnPopUp('Account')" href="#tips">Account</a></td>
                    <td align="left"><gw:textbox id="txtAccCode" styles="width: 100%" /></td>
                    <td colspan="1" align="left"><gw:textbox id="txtAccName" styles="width: 100%" /></td>                                                    
                    <td align="left"><gw:imgbtn id="idBtnReset" img="reset" alt="Reset" text="Reset" onclick="OnReset('account')" /></td>
                    <td align="right">WH</td>
                    <td ><gw:list id="lstWH" styles="width: 100%" /></td>
                    <td align="right"><gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
                    <td align="right"><gw:imgbtn id="idBtnNew" img="new" alt="New" text="New" onclick="OnAddNew()" /></td>
                    <td align="right"><gw:imgbtn id="idBtnSave" img="save" alt="Save" text="Save" onclick="OnSave()" /></td>
                    <td align="right"><gw:imgbtn id="idBtnDel" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" /></td>
                </tr>
                <tr style="height:4%">
                    <td align="right" >Time</td>
                    <td align="left" ><gw:datebox id="dbMonth" type="month" lang="1" onchange="OnSearch()" style="display:none;" />
                    <gw:datebox id="dbDay" type="day" lang="1" onchange="OnSearch()" /><gw:datebox id="dbDayto" type="day" lang="1" style="display:none;" /></td>            
                    <td align="right"><a title="Click here to select item" onclick="OnPopUp('Item')" href="#tips">Item</a></td>
                    <td align="left"><gw:textbox id="txtItemCode" styles="width: 100%" /></td>
                    <td align="left"><gw:textbox id="txtItemName" styles="width: 100%" /></td>   
                    <td align="left"><gw:imgbtn id="idBtnReset_2" img="reset" alt="Reset" text="Reset" onclick="OnReset('item')" /></td>
                    <td align="right">Rate</td>         
                    <td align="left"><gw:textbox id="txtRate" styles="width: 100%; text-align:right " csstype="mandatory" /></td>                             
                    <td>Option</td>
                    <td colspan="2"><gw:list id="lstOpt" onchange="OnChangeOption()" >
                        <data>DATA|0|Month|1|Day|2|Period</data></gw:list>
                    </td>
                    <td colspan="1"><gw:icon id="btnProcess" text="Update Price" styles="width: 100%; " onclick="OnUpdatePrice()" /></td>                                        
                </tr>
					<tr>
						<td align="right">Price Type</td>
						<td><gw:radio id="rbType" value="0" onchange="OnChangePriceType()" >
							<span value="0">Out</span>
							<span value="1">In</span>
						</gw:radio>
						</td>						
						<td align="right"><a title="Click here to select PL" onclick="OnPopUp_PL()" href="#tips">PL</a></td>		
						<td colspan="1"><gw:textbox id="txtPLCD" styles="width:100%;" /></td>
						<td colspan="1"><gw:textbox id="txtPLNM" styles="width:100%;" /></td>
						<td colspan="1"><gw:imgbtn id="btnReset" img="reset" onclick="OnReset('PL')" /></td>
						<td align="left"><gw:imgBtn id="btnProcess" img="process" alt="Auto Update In-Price" onclick="OnUpdate_PriceIn()" /></td>
						<td colspan="5"></td>
						
					</tr>				
                </table>
            </td>                
        </tr>
        <tr style="height:88%" >
            <td>
                <gw:grid id="idGrid"                 
                    header="_TAC_CRCOST_UP_PK|Month|Day|_TAC_ABACCTCODE_PK|Acc.Code|Acc.Name|_TCO_ITEM_PK|Item Code|Item Name|UOM|CCY|Trans Price|Book Price|_TCO_COMPANY_PK|_WH_PK|WH Name|OUT_YN"
                    format="0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|1|1|0|1|2|0|1|2|1|1|3|3|0|0|0|1" 
					defaults="||||||||||||||||" 
					editcol="0|1|1|0|1|0|0|1|0|0|1|1|1|0|0|1|0"
                    widths="0|1000|1000|0|1500|4500|0|2000|4000|1000|800|1500|1500|0|0|1500|500" 
					styles="width:100%; height:100%; " 
					sorting="T"
                    parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" 
                    onafteredit="OnChangeRate()"
                    oncelldblclick="OnGridDblClick()"
                    acceptNullDate="T" />                
            </td>
        </tr>
    </table>
<!---------------------------------------------------------->
<gw:textbox id="txtTac_abacctcode_pk" styles="display:none; " />
<gw:textbox id="txtTco_item_pk" styles="display:none; " />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:list    id="lstBook_ccy" 		 style="width:50%;display:none"></gw:list>
<gw:textbox id="txtPLPK" styles="width:100%;" />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>