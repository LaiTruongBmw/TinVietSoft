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
        iG0_End_Amt     = 17,
		iG0_wh_pk   	= 18,
		iG0_tac_abacctcode_pk =19,
		iG0_abplcenter_pk=20,
		iG0_tco_item_pk= 21		
		;

	var idGridDetail_ac_cd = 0,
		idGridDetail_STOCKTR_NO = 1,
		idGridDetail_TRAN_DATE = 2,
		idGridDetail_PL = 3,
		idGridDetail_WH_LNAME = 4,
		idGridDetail_ITEM_NAME = 5,
		idGridDetail_TRIN_TYPE = 6,
		idGridDetail_INPUT_QTY = 7,
		idGridDetail_IN_AMT = 8,
		idGridDetail_IN_CCY = 9,
		idGridDetail_TROUT_TYPE= 10,
		idGridDetail_OUTPUT_QTY= 11,
		idGridDetail_OUT_AMT =12,
		idGridDetail_OUT_CCY =13,
		idGridDetail_OUT_TRAMT = 14,
		idGridDetail_TABLE_NM = 15;
			
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
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	// var fg=grdDtl.GetGridControl();
	//fg.FrozenCols = 11;
	idtrGrid2.style.display = "none";
	dso_getCompany.Call();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>|ALL|ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = 'ALL';
	lstTRANS.value ='';	
	//lstOpt.value = "4" ; // InOut Details
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
            var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_code=&comm_nm=&dsqlid=SP_SEL_fmgf00050_3&val1=" + lstCompany.value + "&val2=" + lstWH.value + "&val3=" ;

            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccountCode.text = object[0];
                txtAccountName.text = object[1];
                txtTAC_ABACCTCODE_PK.text = object[3];
            }    
        break ;
    case 'Item':        
            var path = System.RootURL + "/standard/forms/60/17/60170120_popupgetonitem.aspx?purchase_yn=&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
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
			var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
			{
			if (object != null) 
				{
				if (object[0] != 0) 
					{
						txttac_abplcenter_pk.text = object[2];
						 txtPLCode.text = object[0];
						txtPLName.text = object[1];
						
						//txtpl_cd.SetDataText(object[0]);
						//txt_PLC_CD.SetDataText(object[3]);
						//l_pl_nm=object[1];
						//l_plc_nm=object[4];
					} 
				}
			}

	
        break;
    }
}
//------------------------------------------------------------------------
function OnSearch( obj )
{
	if(lstError.value =="1"){
		data_fmgf00110_5.Call("SELECT") ; 
	}else{
		data_fmgf00110.Call("SELECT")  ;
		}
	
}

function tabCurrent1(){
	
	var  idx = tab.GetCurrentPageNo();
	if(idGrid.rows> 1){
		if(idGrid.GetGridData(idGrid.row, iG0_Acc_Cd) !=""){
			txtTAC_ABACCTCODE_end_cd.text = idGrid.GetGridData(idGrid.row, iG0_tac_abacctcode_pk);
		}else{
			txtTAC_ABACCTCODE_end_cd.text = idGrid.GetGridData(idGrid.row +1, iG0_tac_abacctcode_pk);
		}
		txtTCO_ITEM_PK_end.text = idGrid.GetGridData(idGrid.row, iG0_tco_item_pk);
		txttac_abplcenter_pk_end.text = idGrid.GetGridData(idGrid.row, iG0_abplcenter_pk); 
		txt_wh_pk.text = idGrid.GetGridData(idGrid.row, iG0_wh_pk);
	}
	switch(idx){
		case 1:
			data_fmgf00110_2_end.Call("SELECT");
			break;
		case 0:
			//dbMonthly1.text =Number(dbMonthly.value) -1;
			data_fmgf00110_3_end.Call("SELECT");
			break;
		case 2:
			data_fmgf00110_4.Call("SELECT");
			break;
		
			
	}
	
	
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    var lOpenQty = 0, lOpenAmt = 0, lInQty = 0, lInAmt = 0, lOutQty = 0, lOutAmt = 0, lEndQty = 0, lEndAmt = 0;          
    switch (obj.id)
    {
        case "data_fmgf00110" :            
           
                  
        break;
        case "data_fmgf00110_2" :            
                        
                  
        break;  

		/*case "data_fmgf00110_3_end":
				idGridDetailMM.Subtotal (0,2 ,'-1', '7!8!11!12!14');
		 break;
		 */
		 case "data_fmgf00110_2_end":
				//idGridDetail.Subtotal (0,2 ,'-1', '7!8!11!12!14');
			for(var i =2 ;i< idGridDetail.rows;i++){

					if(idGridDetail.GetGridData(i,idGridDetail_ac_cd)=='' && idGridDetail.GetGridData(i,idGridDetail_TABLE_NM) !=''  )
				{
					idGridDetail.SetCellBgColor(i, 0, i,idGridDetail.cols -1,0xD6E4FC);
				}
					if( idGridDetail.GetGridData(i,idGridDetail_TABLE_NM) ==''  )
				{
					idGridDetail.SetCellBgColor(i, 0, i,idGridDetail.cols -1,0xDAEFE2);
				}
			}
		 break;
		 
		 case "data_fmgf00110_4":
			//grdDtl.Subtotal (0,2 ,'-1', '14!17!18!19!20');
			break;
    }    
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

function onChangeEror(){
	if(lstError.value == "1"){
		idtrGrid2.style.display = "";
		dtrGrid3.style.display = "none";
		idtrGrid.style.display = "none";
	}else{
		idtrGrid2.style.display = "none";
		dtrGrid3.style.display = "";
		idtrGrid.style.display = "";
	}
}
</script>

<body>
  
 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>  <!-------------------------------------------------------------------->
	
	
  <gw:data id="data_fmgf00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtAccountCode"/>                    
                    <input bind="txtTCO_ITEM_PK"/>                    
                    <input bind="txttac_abplcenter_pk"/>                    
                    <input bind="lstWH"/>   
					<input bind="lstError"/>   	
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      
	
	 <gw:data id="data_fmgf00110_2_end" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490_2" > 
                <input bind="idGridDetail" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtTAC_ABACCTCODE_end_cd"/>                    
                    <input bind="txtTCO_ITEM_PK_end"/>                    
                    <input bind="txttac_abplcenter_pk_end"/>                    
                    <input bind="txt_wh_pk"/> 
					<input bind="lstTRANS"/> 
							
                </input>
                <output  bind="idGridDetail" />
            </dso> 
        </xml> 
    </gw:data>      
	
	<!-- <gw:data id="data_fmgf00110_3_end" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490_3" > 
                <input bind="idGridDetailMM" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtTAC_ABACCTCODE_end_cd"/>                    
                    <input bind="txtTCO_ITEM_PK_end"/>                    
                    <input bind="txttac_abplcenter_pk_end"/>                    
                    <input bind="txt_wh_pk"/> 
							
                </input>
                <output  bind="idGridDetailMM" />
            </dso> 
        </xml> 
    </gw:data> -->

	 <gw:data id="data_fmgf00110_3_end" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490_3" > 
                <input bind="idGridDetailMM" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtTAC_ABACCTCODE_end_cd"/>                    
                    <input bind="txtTCO_ITEM_PK_end"/>                    
                    <input bind="txttac_abplcenter_pk_end"/>                    
                    <input bind="txt_wh_pk"/> 
							
                </input>
                <output  bind="idGridDetailMM" />
            </dso> 
        </xml> 
    </gw:data>      	
	
	<!-- <gw:data id="data_fmgf00110_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490_4" > 
                <input bind="grdDtl" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
                    <input bind="txtTAC_ABACCTCODE_end_cd"/>                    
                    <input bind="txtTCO_ITEM_PK_end"/>                    
                    <input bind="txttac_abplcenter_pk_end"/>                    
                    <input bind="txt_wh_pk"/> 
							
                </input>
                <output  bind="grdDtl" />
            </dso> 
        </xml> 
    </gw:data> -->    
	 	
    
  <gw:data id="data_fmgf00110_5" onreceive="OnDataReceive(this)">  
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170490_5" >
                <input bind="idGrid2" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbMonthly"/>
			        
                    <input bind="txtAccountCode"/>                    
                    <input bind="txtTCO_ITEM_PK"/>                    
                    <input bind="txttac_abplcenter_pk"/>                    
                    <input bind="lstWH"/>                    
                </input>
                <output  bind="idGrid2" />
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
						<gw:list id="lstError"  onchange="onChangeEror()">
							<data>DATA|0|End minus|1|Don't Have Price|2|Qty =0, Amount <>0|3|Begin <0 </data>
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
	
    <tr style="height:30%" id="idtrGrid" >
		
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr >
                    <td>
                        <gw:grid id="idGrid" 
                            header="_|Acc.Cd|Acc.Nm|Item Code|Item Name|_Item Localname|UOM|WH|PL CD|PL NM|Begin Qty|Begin Amt|IN Qty|IN Amt|OUT Qty|OUT Amt|End Qty|End Amt|_wh_pk|_pk tac_abacctcode_pk|_tac_abplcenter_pk|_pk tco_item_pk"
                            format="0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|0|0|0|0" 
                            aligns="2|1|0|2|2|2|1|2|2|2|3|3|3|3|3|3|3|3|3|0|0|0"
                            defaults="||||||||||||||||||||||" 
                            editcol="0|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
                            widths="1000|1200|2000|1200|3000|2500|800|1800|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="T" 
							oncellclick = "tabCurrent1()"
                            param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" />  
							
							

							
                    </td>
						
					    
                </tr>
				
				
            </table>
        </td>
    </tr>
	
	
	 <tr style="height:60%" id="dtrGrid3" >
        <td>
		 <gw:tab id="tab" onpageactivate="tabCurrent1()">
			
			<table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%" name="Stock MM" id="tbStockMM"  >
			 
                <tr>
                    <td>
					
                        <gw:grid id="idGridDetailMM" 
                            header="Ac Code|Item Code|Item Name|WH Name|PL Code|PL Name|Month|Last Qty|Last Amt|"
                            format="0|0|0|0|0|0|0|-0|-2" 
                            aligns="1|0|0|0|0|0|1|0|0"
                            defaults="||||||||" 
                            editcol="0|0|1|1|1|0|0|1|1" 
                            widths="2000|2000|2000|2000|3000|2500|1000|2000|3000"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
							sorting="T" 
                            />                 
                    </td>
                </tr>
            </table>
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%" name="Stock tr" id="tbStocktr"  >
				<tr  style="height:7%">
					<td  width="10%;" align="right">TR Type</td>
					<td  width="20%;"><gw:list id="lstTRANS" value="" styles="width:100%;" ><data><%= CtlLib.SetListDataSQL("SELECT  distinct A.ACC_TRANS_CODE,A.ACC_TRANS_NAME  FROM tlg_in_trans_code a WHERE a.del_if = 0 and ( type='I' or type='O' )  and acc_trans_code is not null order by a.acc_trans_name")%>||Trans All</data></gw:list></td>		
					<td ><gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="tabCurrent1()" /></td>
				</tr>
                    <td colspan="3" >
                        <gw:grid id="idGridDetail" 
                            header="Acc.Cd|STOCKTR NO|TRAN DATE|PL|WH LNAME|ITEM NAME|_TRIN TYPE|INPUT QTY|IN AMT|IN CCY|_TROUT TYPE|OUTPUT QTY|OUT AMT|_OUT_CCY|OUT TRAMT|Tran Type"
                            format="0|0|0|0|0|0|0|-0|-2|0|-0|-2|1|1|1|1" 
                            aligns="1|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0"
                            defaults="|||||||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="1000|1200|1500|1000|3000|2500|1000|2500|2500|1500|1500|1500|1500|1500|1500|1500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
							sorting="T" 
                            />                    
                    </td>
		</tr>
            </table>
		
			
			
			</gw:tab >
        </td>
	</tr>
		<tr style="height:1000%"  id="idtrGrid2">
			<td >
				<table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
				  
					
					<tr >
						<td>
							<gw:grid id="idGrid2" 
								header="Acc.Cd|STOCKTR NO|TRAN DATE|PL|WH LNAME|ITEM NAME|_TRIN TYPE|INPUT QTY|In Price|IN AMT|IN CCY|_TROUT TYPE|OUTPUT QTY|Out Price|OUT AMT|_OUT_CCY|OUT TRAMT|Tran Type"
								format="0|0|0|0|0|0|0|-2|-0|-2|0|-0|-2|-2|1|1|1|1" 
								aligns="1|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0"
								defaults="|||||||||||||||||" 
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								widths="1000|1500|1500|1500|3000|2500|1000|1000|2500|2500|1500|1500|1500|1500|1500|1500|1500|1500"
								styles="width:100%; height:100% " 
								acceptNullDate="T" 
								sorting="T" 
								/>  
						</td>
					
					</tr>
				</table>
			</td>
		</tr>
	
	
    </tr>
</table> 
 
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
<gw:textbox id="txttac_abplcenter_pk" styles="display:none; " />
<gw:imgbtn img="excel" alt="Report by Item Group" id="btnExcel" style="display:none;" onclick="OnExcel('group')" />
<gw:datebox id="dbMonthlyto" type="month" style="display:none;" lang="1" />
<gw:textbox id="txtProposedByUserPk"  style="display:none" />
<gw:textbox id="txtTAC_ABACCTCODE_end_cd" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK_end" styles="display:none; " />
<gw:textbox id="txttac_abplcenter_pk_end" styles="display:none; " />
<gw:textbox id="txt_wh_pk" styles="display:none; " /> 
<gw:textbox id="dbMonthly1" styles="display:none; " /> 
</body>
</html>