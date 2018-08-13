 <!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Transaction Checking</title>
</head>

<script>
   
    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var  user_id   = "<%=Session("USER_ID")%>" ;
    var  vPage =0;
//-----------------------------------------------------

var iTR_pk          = 0,
    iTR_Status      = 3,
    iTR_InType      = 20,
    iTR_In_Qty      = 21,
    iTR_In_UPrice   = 22,
    iTR_In_AMT      = 23,
    iTR_In_TRAMT    = 25,
    iTR_OutType     = 26,
    iTR_Out_Qty     = 27,
    iTR_Out_UPrice  = 28,
    iTR_Out_AMT     = 29,
    iTR_Out_TRAMT   = 31,
    iTR_BAL_Qty     = 34,
    iTR_Process_Qty = 35;
//---------------------------------------------------------

function BodyInit()
{
    BindingDataList() ;
    //dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
     //setPage(vPage)
 }
//-----------------------------------------------------
 function BindingDataList()
 {
     var data = "";    
       
    data = "<%=CtlLib.SetListDataSQL("select to_char(to_number(A.code)) code, A.code_nm from tac_commcode_detail A, tac_commcode_master B where A.del_if = 0 AND B.del_if = 0 and A.tac_commcode_master_pk = B.PK AND B.ID = 'ACBG0010' " )%>|ALL|Select All";    
    lstStatus.SetDataText(data);
    lstStatus.value = "ALL" ;
    
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM TLG_IN_WAREHOUSE  WHERE del_if = 0 ORDER BY wh_name  ASC" )%>|ALL|Select ALL";    
    lstWH.SetDataText(data);    
    lstWH.value = 'ALL';
    
//    data = "<%=CtlLib.SetListDataSQL("select A.code, A.code_nm from tac_commcode_detail A, tac_commcode_master B where A.del_if = 0 AND B.del_if = 0 and A.tac_commcode_master_pk = B.PK AND B.ID = 'ACBG0130' and A.code in ('AP', 'AR', 'XNL', 'XDC', 'NTP') order by ord" )%>|ALL|Select All";    
//    lstTransType.SetDataText(data);
    lstTransType.value = "ALL" ;
    
    data = "<%=CtlLib.SetGridColumnDataSQL("select A.code, A.code_nm from tac_commcode_detail A, tac_commcode_master B where A.del_if = 0 AND B.del_if = 0 and A.tac_commcode_master_pk = B.PK AND B.ID = 'ACBG0010' order by ord" ) %> ";       
    grdTrans.SetComboFormat(iTR_Status,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE  b.ID='ACFC0020' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    grdTrans.SetComboFormat(iTR_InType,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE  b.ID='ACFC0030' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    grdTrans.SetComboFormat(iTR_OutType,data);
    
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    lstCompany.value = '2';
    
  var ctrl = grdTrans.GetGridControl();
  
    ctrl.ColFormat(iTR_In_Qty)      = "###,###,###.##" ;   
    ctrl.ColFormat(iTR_In_UPrice)   = "###,###,###.##" ;
    ctrl.ColFormat(iTR_In_AMT)      = "###,###,###.##" ;
    ctrl.ColFormat(iTR_In_TRAMT)    = "###,###,###.##" ;
    ctrl.ColFormat(iTR_Out_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(iTR_Out_UPrice)  = "###,###,###.##" ;
    ctrl.ColFormat(iTR_Out_AMT)     = "###,###,###.##" ;
    ctrl.ColFormat(iTR_Out_TRAMT)   = "###,###,###.##" ;
    ctrl.ColFormat(iTR_BAL_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(iTR_Process_Qty) = "###,###,###.##" ; 
    ctrl.FrozenCols = 4;
    var ls_first_day = dtFromDate.value ;
    ls_first_day = ls_first_day.substr(0, 4) + ls_first_day.substr(4, 2) + '01';
    dtFromDate.value = ls_first_day ;
}
 //-----------------------------------------------------
 
function OnSearch(pos)
{
    switch (pos)
    {
        case 1 :        
            fmgf00070.Call("SELECT") ;
        break;
        case 2 :        
            fmgf00070.Call('SELECT') ;
        break;
       
    }
}

//----------------------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        case 'fmgf00070':
        var l_Input_qty = 0, l_Input_tramt = 0, l_Input_amt = 0;
        var l_Output_qty = 0, l_Output_tramt = 0, l_Output_amt = 0;
        var i;
        for(i = 1; i < grdTrans.rows; i++)
        {
            if(grdTrans.GetGridData(i, iTR_In_Qty) != "")
            {
                l_Input_qty += Number(grdTrans.GetGridData(i, iTR_In_Qty));                
            }
            if(grdTrans.GetGridData(i, iTR_In_AMT) != "")
            {
                l_Input_amt += Number(grdTrans.GetGridData(i, iTR_In_AMT));
            }
            if(grdTrans.GetGridData(i, iTR_In_TRAMT) != "")
            {
                l_Input_tramt += Number(grdTrans.GetGridData(i, iTR_In_AMT));
            }
            if(grdTrans.GetGridData(i, iTR_Out_Qty) != "")
            {
                l_Output_qty += Number(grdTrans.GetGridData(i, iTR_Out_Qty));
            }
            if(grdTrans.GetGridData(i, iTR_Out_AMT) != "")
            {
                l_Output_amt += Number(grdTrans.GetGridData(i, iTR_Out_AMT));
            }
            if(grdTrans.GetGridData(i, iTR_Out_TRAMT) != "")
            {
                l_Output_tramt += Number(grdTrans.GetGridData(i, iTR_Out_TRAMT));
            }            
        }
        grdTrans.AddRow();
        grdTrans.SetCellBgColor(grdTrans.rows-1, 0,grdTrans.rows-1,grdTrans.cols-1,0xA9EBD7);
        grdTrans.SetGridText(grdTrans.rows - 1, 1, 'Total');
        grdTrans.SetGridText(grdTrans.rows - 1, 2, '');
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_In_Qty, l_Input_qty);
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_In_AMT, l_Input_amt);
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_In_TRAMT, l_Input_tramt);
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_Out_Qty, l_Output_qty);
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_Out_AMT, l_Output_amt);
        grdTrans.SetGridText(grdTrans.rows - 1, iTR_Out_TRAMT, l_Output_tramt);

//            vPage = Math.ceil(lblRecord.text / 200) 
//            setPage(vPage)
//            lblRecord.text = lblRecord.text + " record(s)";
//            txtPage.text = 1;
//            page1.innerText = '1';
//            currentPage = 1
//            LoadDataPage(page1,1)
        break ;    
    }
}
//--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    ObjectStatus(page1,0)
                    ObjectStatus(page2,1)
                    ObjectStatus(page3,1)
                    currentPage =1
                }
            break;
            case 'page2':
                ObjectStatus(page1,1)
                ObjectStatus(page2,0)
                ObjectStatus(page3,1)
                currentPage =2
            break;
            case 'page3':
                ObjectStatus(page1,1)
                ObjectStatus(page2,1)
                ObjectStatus(page3,0)
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        OnSearch(2)
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
        ObjectStatus(pagePrev,2)
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,2)
                 ObjectStatus(pageNext,2)
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,0)   
                 ObjectStatus(pageNext,2)   
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 ObjectStatus(pageNext,2)   
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 ObjectStatus(pageNext,2)   
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                ObjectStatus(pageNext,1)            
        }
}
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                ObjectStatus(pageNext,1)
            }
             if (page1.innerText == 1)
            {
                ObjectStatus(pagePrev,2)
            }
        }
     
}
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                ObjectStatus(pageNext,2)
                }
             if (page1.innerText != '1')
            {
                ObjectStatus(pagePrev,1)
            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
          ObjectStatus(obj,0)
    }else
    {
        ObjectStatus(obj,1)
    }
}
function ObjectStatus(obj,status)
{
    if (status==0)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        if (status==1)
        {
            obj.style.cursor ='hand';
            obj.style.color = 'blue';
        }else
        {
            obj.style.cursor ='none';
            obj.style.color = 'gray';
        }
    }
}
//----------------------------------------------------------------
function OnPopUpAcct()
{
	var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCT_POPUP";
	var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	if (o != null)
	{
		if(o[0] != 0)
		{
			txtAccPK.text = o[3]; // account pk
			txtAcctCode.text = o[0]; // account code
			txtAcctName.text = o[1] ; // account name
		}		
	}
    
    
}
function OnPopUpItem()
{
    var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + "&item_name=" ;
    var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
    if(object != null)
    {
        txtItemPK.text = object[0] ;
        txtItemName.text = object[1] + ' - ' + object[2]; // ItemName                
    }                        
}
function OnReset()
{
    txtItemPK.SetDataText('');
    txtItemName.SetDataText('');
    txtAccPK.SetDataText('');
    txtAcctCode.SetDataText('');
    txtAcctName.SetDataText('');
}
</script>

<body>
    <!------------------------------------------------------------------------>
    <!------------------------------------------------------------------------>
    <gw:data id="fmgf00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60170240" > 
                <input bind="grdTrans" > 
                     <input bind="dtFromDate" /> 
                     <input bind="dtToDate" /> 
                     <input bind="lstStatus" /> 
                     <input bind="lstTransType" />
                     <input bind="lstWH" />
                     <input bind="txtAccPK" />
                     <input bind="txtItemPK" />
                     <input bind="txtAcctCode" />
                     <input bind="txtItemName" />
                     <input bind="txtVoucherNo" />
                  </input> 
                <output bind="grdTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table class="table" width="100%" cellpadding="0" cellspacing="0" border="0" style="height: 100%">
        <tr style="height: 5%">
            <td>
                <table border="0" width="100%" cellpadding=0 cellspacing=0>
                    <tr>
                        <td style="width: 10%" align="right">Trans Date</td>                        
                        <td style="width: 8%" align="left"><gw:datebox id="dtFromDate" lang="1" styles="width:100%" /></td>                                                    
                        <td style="width: 10%" align="left">~<gw:datebox id="dtToDate" lang="1" styles="width:100%" /></td>                                                    
                        <td style="width: 5%" align="right">Status</td>                            
                        <td style="width: 15%" align="left"><gw:list id="lstStatus" styles="width: 100%" onchange="OnSearch(1)" /></td>                                                    
                        <td style="width: 8%" align="right">Trans Type</td>                                                    
                        <td style="width: 15%" align="left"><gw:list id="lstTransType" styles="width: 100%" onchange="OnSearch(1)" >
                            <data>DATA|I10|Input AP|O10|Takeout Mat|I20|FG Incoming|O20|Takeout FG|I11|Move In|O11|Move Out|ALL|Select All</data>
                       </gw:list>     
                        </td>                                                    
                         <td style="width: 6%" align="right">WH</td>                                                    
                        <td style="width: 15%" align="left"><gw:list id="lstWH" styles="width: 100%" onchange="OnSearch(1)" /></td>                                                    
                        <td style="width: 3%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
                        </td>                                                    
                    </tr>
                    <tr>
                        <td align=right><a title="Click here to select Account Code" href="#tips" onclick="OnPopUpAcct()">Account</a></td>
                        <td align=left><gw:textbox id="txtAcctCode" styles="width:100%;" /></td>
                        <td align=left colspan="1"><gw:textbox id="txtAcctName" styles="width:100%;" /></td>
                        <td align=right><a title="Click here to select item" href="#tips" onclick="OnPopUpItem()" />Item</a></td>
                        <td align=left><gw:textbox id="txtItemName" styles="width:100%;" /></td>
                        <td align=right>VoucherNo</td>
                        <td align=left><gw:textbox id="txtVoucherNo" styles="width:100%;" /></td>
                        <td colspan="2"></td>
                        <td ><gw:imgBtn id="btnReset" alt="Reset" img="reset" onclick="OnReset()" /></td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr style="height: 90%;">
            <td>
                <table border="1" width="100%" style="height: 100%;">
                    <tr>
                           <td id="tRIGHT" style="width: 100%;">
                            <gw:grid id='grdTrans' 
							header='_PK|Slip No|Trans Date|Status|_TPR_LINE_PK|_Line Name|_TCO_BUSPARTNER_PK|_BUS Partner|_TAC_ABPL_PK|PL Name|_TIN_WAREHOUSE_PK|WH Name|Month|_TAC_ABACCTCODE_PK|AC CD|AC NM|_TCO_ITEM_PK|Item Code|Item Name|UOM|In Type|Input Qty|In UPrice|In Book AMT|In CCY|In Trans AMT|Out Type|Output Qty|Out UPrice|Out Book AMT|Out CCY|Out Trans AMT|Remark|_Remak 2|_BAL Qty|_Process Qty|Description|_TR_TABLE_NM|_TR_TABLE_PK'
                            format='0|0|4|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|1|0|1|1|1|0|1|0|0|1|1|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|0|0|0'
                            defaults='||||||||||||||||||||||||||||||||||||||' 
							editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='0|0|1500|1500|0|2000|0|2000|0|2000|0|1500|1200|0|1500|2000|0|1500|2000|1000|1000|1500|1500|1500|1000|1500|1000|1500|1500|1500|1000|1500|1000|1000|1500|1500|1000|0|0'
                            sorting='T' 
                            acceptNullDate="T"
							styles='width:100%; height:100%;' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>    
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtPage" styles="display: none" />
    <gw:textbox id="txtAccPK" styles="display: none" />
    <gw:textbox id="txtItemPK" styles="display: none" />
    <gw:list id="lstCompany" styles="display: none" />
    
    
</html>
