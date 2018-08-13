<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Advance Regist Popup</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var G_PK=0,
	G_Deposit_Date=1,
	G_Currency=2,
	G_BOOK_EXRATE=3,
	G_TRAN_EXRATE=4,
	G_AMT=5,//book amt
	G_Advance_Money=6,
	G_Remarks=7,
	G_project_pk=8,
	G_tecps_prepayexec_pk=9;
var v_level ='';
function BodyInit()
{   
	txt_project_PK.text = '<%=Request.QueryString("Project_Pk") %>';
	txt_master_PK.text = '<%=Request.QueryString("master_pk") %>';
	txtCurrency.text = '<%=Request.QueryString("currency") %>';
	<%=ESysLib.SetGridColumnComboFormat("grdAdvRegistPopup", 2,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACAB0110' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //currency
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	lstCOMPANY.value = "<%=session("company_pk") %>";
	var	data = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   var arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
   var ls_ccy = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   txtccy.SetDataText(ls_ccy);
   dso_get_exrate.Call();  
	//dso_AdvRegistPopup.Call("SELECT");
}
function OnSearch()
{
    dso_AdvRegistPopup.Call("SELECT");
}
function OnDelete()
{
    grdAdvRegistPopup.DeleteRow(); 
}
function OnNew()
{
    var data="";
    grdAdvRegistPopup.AddRow();
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_Currency,txtCurrency.text); 
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_project_pk,txt_project_PK.text); 
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_tecps_prepayexec_pk,txt_master_PK.text);
}
function OnSave()
{
    if(CheckDataIsValid())
    {   
        dso_AdvRegistPopup.Call();  
    }
 }
function CheckDataIsValid()
{
    for(var i=1;i<grdAdvRegistPopup.rows;i++)
          {
            if(grdAdvRegistPopup.GetGridData(i,G_Currency) == "")
             {
                alert("Please,choose currency at row "+ i);
                return false;
             }
			if(grdAdvRegistPopup.GetGridData(i,G_Advance_Money) == "")
             {
                alert("Please input advance amount at row "+ i);
                return false;
             }
          }
          return true;
}
function OnDataReceive(obj){
  if(obj.id == "dso_get_exrate"){
    dso_AdvRegistPopup.Call("SELECT");
  }
  if(obj.id == "dso_AdvRegistPopup")
  {
	if(grdAdvRegistPopup.rows >1)
	{
		grdAdvRegistPopup.Subtotal( 1, 2, -1, '6');
	}
  }
}
function BookAmt()
{
		var _Amount = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Advance_Money));
		var ccy = grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Currency);
		var tr_rate = Number(txtTR_RATE.text);
		txtccy.value = grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Currency);
		var _Bk_Amount = 0;
		var _book_rate = Number(txtBookRate.text);
		//alert(txtbookccy.text+""+_book_rate+""+ccy)
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						
						OnGetRate();
						_Bk_Amount = Math.round(_Amount * tr_rate)
				}
				else if(ccy == 'VND')
				{
						//alert(_book_rate);
						_Bk_Amount = Math.round(_Amount / _book_rate );
				}
		}
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Bk_Amount = Math.round((_Amount * _book_rate / _book_rate) * 100) / 100;
						
				}
				else if(ccy == 'VND')
				{
						_Bk_Amount = Math.round(_Amount / _book_rate *100 )/100;
				}
		}
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_AMT, _Bk_Amount);//book_amt    
}
function OnGetRate()
{
		dso_get_exrate_list.Call();	
}
</script>

<body bgcolor='#F5F8FF'>
	 <gw:data id="dso_AdvRegistPopup" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_62060010_popup" procedure="pm_upd_62060010_popup">  
                <input bind="grdAdvRegistPopup"   >  
                    <input bind="txt_master_PK" />														
                </input> 
                <output bind="grdAdvRegistPopup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------->
	<gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060010_GET_RATE"> 
                <input> 
                	 <input bind="txtUSE_DATE" />
                     <input bind="lstCOMPANY"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------->
      <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_sel_61060010_get_rate" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtccy"/>
                     <input bind="txtUSE_DATE"/>
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
                     <output bind="txtBK_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
   
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td width="20%">
                        </td>
                        <td width="20%">
                        </td>
                        <td width="51%">
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
						<td style="display:none"><gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;' /></td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="7">
                            <gw:grid id='grdAdvRegistPopup' header='_PK|Deposit Date|Currency|_BOOK_EXRATE|_TRAN_EXRATE|_AMT|Advance Money|Remarks|_project_pk|_tecps_prepayexec_pk'
                                format='0|4|0|0|0|0|-0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0' 
								defaults='|||||||||'
                                editcol='1|1|1|1|1|1|1|1|0|0' 
								widths='0|0|0|0|0|0|0|0|0|0' 
								autosize="T"
                                sorting='T' styles='width:100%; height:100%' onafteredit="BookAmt()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<gw:textbox id="txt_project_PK" styles='width:100%;display:none' />
	<gw:textbox id="txt_master_PK" styles='width:100%;display:none' />
	<gw:textbox id="txtCurrency" styles='width:100%;display:none' />
	
	<gw:list id="lstCOMPANY" styles='width:100%;display:none' />
    <gw:textbox id="txtbookccy" styles='width:100%;display:none' />
    <gw:textbox id="txt_row" styles='display:none' />
    <gw:textbox id="txtBookRate" styles='width:100%;display:none' />
    <gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' />
    <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
    <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
    <gw:textbox id="txtContrac_pk" styles="width:100%;display:none" />
	
</body>
