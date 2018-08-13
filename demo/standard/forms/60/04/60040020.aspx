<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';
//var vnt_Click = true;
var vnt_RefreshNode = null;
var l_company_pk = "<%=Session("COMPANY_PK")%>";
 function BodyInit()
 { 
    System.Translate(document);
    //OnToggle(1);
    BindingDataList();
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
	//alert(txtUser_Pk.text);
    dso_getCompany.Call();
 }
function BindingDataList()
{ 
    var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|0|Select All";    
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('FUAB0020','','') FROM DUAL")%>";
    var ls_data2     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";
    var ls_data3     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('FUAB0030','','') FROM DUAL")%>";
    var ls_data4     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_BUSPARTNER WHERE DEL_IF=0 AND PARTNER_TYPE = '50'")%>";
    var ls_Branch    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0020') FROM DUAL")%>";
    var ls_Province    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0021') FROM DUAL")%>";
    lst_TCO_COMPANY_PK.SetDataText(ls_data);
	//lst_TCO_COMPANY_PK.value=l_company_pk;
    lst_DEPO_KIND.SetDataText(ls_data1);    
    lst_CCY.SetDataText(ls_data2);
    lst_BASINT_KIND.SetDataText(ls_data3);
    lst_BUSPARTNER_PK.SetDataText(ls_data4);    
    lst_Branch.SetDataText(ls_Branch);
    lst_Province.SetDataText(ls_Province);
  //  lst_TCO_COMPANY_PK.value = "0";
    
}

function OnTreeClick()
{
	var obj = event.srcElement.GetCurrentNode();
	txt_TAC_ABDEPOMT_PK.SetDataText( obj.oid );	
	//vnt_Click = true;
	DSO_Upd_Depo_Entry.Call("SELECT");
}
function OnAdd()
{  
  DSO_Upd_Depo_Entry.StatusInsert();
    txt_TAC_ABDEPOMT_PK.text = -1;
     Insert = 'T';
}
function OnSave()
{   
    if(CheckIsValidData())
    {
      
        DSO_Upd_Depo_Entry.Call();
    }
} 
function OnDelete()
{
	if(!vnt_RefreshNode)
	{
		if(confirm("Are you sure you want to delete deposit contract with deposit code is '"+ txt_DEPO_CD.text +"' ?"))
		{
			
			DSO_Upd_Depo_Entry.StatusDelete();
			DSO_Upd_Depo_Entry.Call();
			Delete='T';
		} 
	}
	else
	{
	    alert("First you must select a deposit contract!");	 
	}
}
function CheckIsValidData()
{       
   if(Trim(txt_DEPO_CD.text)== "")
   {
       alert("Please input deposit code");
       return false; 
   }   
   if(txt_Acc_pk.text=='')
   {
		alert("Please input account code !!");
       return false; 
   }
   if(!lst_TCO_COMPANY_PK.GetData())
   {
       alert("Please select a conpany !");
       return false; 
   }   
   if(!lst_BUSPARTNER_PK.GetData())
   {
       alert("Please select a customer !");
       return false;
   }  
   if(!lst_CCY.GetData())
   {
       alert("Please select a kind of money !");
       return false;
   }
   
   if(!lst_DEPO_KIND.GetData())
   {
       alert("Please select a deposit kind !");
       return false;
   }
   
   if(!lst_BASINT_KIND.GetData())
   {
       alert("Please select an interest kind !");
       return false;
   }
   
   if(parseFloat(txt_INT_RATE.text) > 99.9999)
   {
      alert("Interest rate must smaller 100");
      return false;
   }
   
   if(parseFloat(txt_PRINCIPAL.text) > 9999999999999.9999)
   {
      alert("Principle amount must smaller 10,000,000,000,000");
      return false;
   }
   
   if(parseFloat(txt_CUROP_GRT.text) > 9999999999999.9999)
   {
      alert("Deposit Guaranty Money  must smaller 10,000,000,000,000");
      return false;
   }
   
   if(parseFloat(txt_UNI_SETTAMT.text) > 9999999999999.9999)
   {
      alert("Settle amount each month must smaller 10,000,000,000,000");
      return false;
   }
    
   if(parseFloat(txt_SPREAD.text) > 99.9999)
   {
      alert("Spread must smaller 100");
      return false;
   }
   
   if(parseFloat(txt_DUE_AMT.text) > 9999999999999.9999)
   {
      alert("Due Amount must smaller 10,000,000,000,000");
      return false;
   }
   
   if(parseFloat(txt_INTEREST.text) > 9999999999999.9999)
   {
      alert("Interest must smaller 10,000,000,000,000");
      return false;
   }
    
   if(parseFloat(txt_REMAINDER.text) > 9999999999999.9999)
   {
      alert("Remainder must smaller 10,000,000,000,000");
      return false;
   }
   
   if(parseFloat(txt_CUROV_LITAMT.text) > 9999999999999.9999)
   {
      alert("Deposit Limit Amount must smaller 10,000,000,000,000");
      return false;
   }
   return true;
 
}
 function OnToggle(obj)
{
    if (obj==1) //master
    {
        if(imgMaster.status == "expand")
        {           
            Table4.style.display="none";
            imgMaster.status = "collapse";
            imgMaster.src = "../../../system/images/down_orange.gif";
        }
        else
        {
            Table4.style.display="";
            imgMaster.status = "expand";
            imgMaster.src = "../../../system/images/up_orange.gif";
        }
    }
}  

function Numbers(e)
{
     
    var keynum;
    var keychar;
    var numcheck;
    keynum =event.keyCode;
  
    if(window.event) // IE
     {
     	keynum = e.keyCode;
     }
    else if(e.which) // Netscape/Firefox/Opera
    {
    	keynum = e.which;
    }
    keychar = String.fromCharCode(keynum);
    numcheck = /\d/;
    return numcheck.test(keychar);
}

function OnDataReceive(p_oData)
{    
/*   if(p_oData.id == "DSO_Sel_Depo_Tree") 
    {       
        if( (vnt_Click == true) && (Number(txt_TAC_ABDEPOMT_PK.text)<=0) )
        {
            txt_TAC_ABDEPOMT_PK.text = -2;            
            DSO_Upd_Depo_Entry.Call("SELECT");
        }   
    }  /**/
    if(p_oData.id == "DSO_Upd_Depo_Entry") 
    {
       if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                     Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                  
                    txt_TAC_ABDEPOMT_PK.text = -2;
                    DSO_Sel_Depo_Tree.Call("SELECT");
                 }       
        if(Number(txt_TAC_ABDEPOMT_PK.text)==0)
        {   
            lst_CCY.SetDataText("VND");   
            DSO_Pro_Partner_ID.Call();
        }
    } 
    else if(p_oData.id == "dso_getCompany") 
    {
		dso_getCustomer.Call();
	}
}
function OnGetCyy()
{
    var vnt_BANK_ID
    txt_tmp_ACC_NO.SetDataText(txt_ACCOUNT_NO.GetData());
    txt_tmp_CYY.SetDataText(lst_CCY.GetData()); 
    vnt_BANK_ID = txt_BUSPARTNER_ID.text + ' ' + txt_tmp_CYY.text + ' ' + txt_tmp_ACC_NO.text;
	txt_BANK_ID.SetDataText(vnt_BANK_ID);	
}
function OnGetPartnerID()
{ 
    DSO_Pro_Partner_ID.Call();
}
/*function OnReceiveError()
{
    alert(DSO_Upd_Depo_Entry.errno);
    alert(DSO_Upd_Depo_Entry.errmsg);
    if(DSO_Upd_Depo_Entry.errno == 1)
    {
        alert("Deposit code '"+ txt_DEPO_CD.text +"' existed!");
        vnt_Click == true;
        DSO_Upd_Depo_Entry.Call("SELECT");
    }
    else if(Number(DSO_Upd_Depo_Entry.errno)!= 0)
    {
        alert(DSO_Upd_Depo_Entry.errmsg);
    }
}*/
//------------------------------------------------------------------
function OnReport()
{
    var url='';
    url = '/standard/reports/ag/ga/rpt_agga00020_1.aspx?company_pk=' + lst_TCO_COMPANY_PK.GetData();
    System.OpenTargetPage( System.RootURL+url , "newform" );
}
//------------------------------------------------------------------
function OnSearch()
{
    DSO_Sel_Depo_Tree.Call("SELECT");
}
//------------------------------------------------------------------
function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090020_account_popup.aspx?comm_nm=" + "" + "&comm_code=" + "112" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lst_TCO_COMPANY_PK.value + "&dsqlid=ac_sel_60090010_acn_ap_popup";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txt_Acc_pk.SetDataText("");
        txt_Acccd.SetDataText("");
        txt_Acc_pk.SetDataText(object[3]);
        txt_Acccd.SetDataText(object[0]);
		txt_Accnm.SetDataText(object[2]);
    }
}
//-----------------------------------------------------------------------
function OnChangeYN()
{
        
        if(rb_USE_YN.value=='Y')
       {
                dt_Closing.text="";
       } 
      else
     {
                dt_Closing.value = dt_Closing1.value;
     } 
}
</script>
 
<body>

<gw:data id="DSO_Sel_Depo_Tree" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="tree" parameter="0" function="ac_sel_60040020_depo_tree">
            <input bind="oTreeDepo">
                <input bind="lst_TCO_COMPANY_PK"/>
                <input bind="txtDeposit_Cd"/>
                <input bind="txtAcc_No"/>
            </input>
            <output bind="oTreeDepo" />
        </dso>
    </xml>
</gw:data>   
               
<gw:data id="DSO_Pro_Partner_ID" onreceive="OnGetCyy()"> 
    <xml> 
        <dso id="2" type="process" procedure="ac_pro_60040020_depo_get_id" > 
            <input>                  
                 <input bind="lst_BUSPARTNER_PK"/>
            </input>  
            <output>  
                 <output bind="txt_BUSPARTNER_ID"/>
           </output> 
        </dso> 
    </xml> 
</gw:data>
                           
<gw:data id="DSO_Upd_Depo_Entry" onreceive="OnDataReceive(this)" >
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33" function="ac_sel_60040020" procedure = "ac_upd_60040020">
          <inout> 
            <inout bind="txt_TAC_ABDEPOMT_PK"/>
            <inout bind="lst_TCO_COMPANY_PK"/>                        
            <inout bind="txt_DEPO_CD" />
            <inout bind="lst_DEPO_KIND" />
            <inout bind="txt_SWIST_CODE" />
            <inout bind="lst_BUSPARTNER_PK" />
            <inout bind="txt_ACCOUNT_NO" />
            <inout bind="txt_BANK_ID" />
            <inout bind="lst_CCY" />
            <inout bind="txt_DEPO_OWNER" />
            <inout bind="rb_USE_YN" />
            <inout bind="dt_CONTRACT_DT" />
            <inout bind="dt_EXPIRE_DT" />
            <inout bind="lst_BASINT_KIND" />
            <inout bind="txt_INT_RATE" />
            <inout bind="txt_SPREAD" />
            <inout bind="dt_BASINT_STDD" />
            <inout bind="txt_DUE_AMT" />
            <inout bind="txt_INT_PERIOD" />
            <inout bind="txt_INTEREST" />
            <inout bind="txt_PRINCIPAL" />
            <inout bind="txt_REMAINDER" />         
            <inout bind="txt_CUROP_GRT" />
            <inout bind="txt_CUROV_LITAMT" />
            <inout bind="txt_CUR_INSDT" />
            <inout bind="txt_TOT_SETTCNT" />
            <inout bind="dt_FIR_SETTDT" />
            <inout bind="txt_SETT_PERIOD" />
            <inout bind="txt_UNI_SETTAMT" />
            <inout bind="txt_timeDeposit" />
            <inout bind="lst_Branch" />
            <inout bind="lst_Province" />
            <inout bind="dt_Closing" /> 
            <inout bind="txt_Acc_pk" />
            <inout bind="txt_Acccd" />
            <inout bind="txt_Accnm" /> 
          </inout>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_pro_60040020_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lst_TCO_COMPANY_PK"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
	
<gw:data id="dso_getCustomer" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_pro_60040020_cus" > 
                <input> 
                     <input bind="lst_TCO_COMPANY_PK"/>
                </input>
                <output>
                     <output bind="lst_BUSPARTNER_PK"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    	
<!------------------------ Main Table -------------------------->    

<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;border-color:#6B9EB8">        
    <tr valign="top">
        <td width="35%"  align ="top">
            <table id="Table1" width="100%" align="top">
			    <tr>
				    <td width="35%" align="right">Company</td>
		            <td width="65%" colspan="2">
		                <gw:list id="lst_TCO_COMPANY_PK" value="" styles="width:100%" onchange="dso_getCustomer.Call();" ></gw:list></td>
		           
			    </tr>
			   <tr>
			        <td width="20%" align="right">Deposit Code</td> 
			       <td width="80%" colspan="2"><gw:textbox id="txtDeposit_Cd" onenterkey="OnSearch()"  styles="width:100%" /></td> 
			   </tr> 
			  <tr>
			        <td width="20%" align="right">Bank Acc No</td>
			         <td width="80%"><gw:textbox id="txtAcc_No" onenterkey="OnSearch()"  styles="width:100%" /></td> 
			         <td ><gw:imgBtn img="search"    alt="Search"    id="idBtnUpdate1" 	styles="width:100%" onclick="OnSearch()" /></td>
			  </tr> 
		    </table>
        </td>
        <td width="65%"  align ="top">
            <table id="Table2" width="100%" align="top">
                <tr>
                    <td width="24%" align=right>Deposit Code</td>
                    <td width="39%"><gw:textbox id="txt_DEPO_CD"  text=""  styles="width:100%" csstype="mandatory"/></td>
                    <td width="5%" colspan=""></td>
                    
                   
                    <td ><gw:button img="new"     alt="New"     id="idBtnAdd" 	styles="width:100%" onclick="OnAdd()" /></td>					
				    <td ><gw:button img="save"    alt="Save"    id="idBtnUpdate" 	styles="width:100%" onclick="OnSave()" /></td>
				    <td ><gw:button img="delete"  alt="Delete"  id="idBtnDelete" 	styles="width:100%" onclick="OnDelete()" /></td> 
					 <td ><gw:button img="excel"  text="Print" alt="Print Report"   id="idBtnExcel" 	styles="width:100%" onclick="OnReport()" /></td>
                </tr>
                <tr>
                     <td width="24%" align=right>Branch</td>
                    <td width="39%"><gw:list id="lst_Branch" styles="width:100%" /></td>   
                    <td width="37%" colspan="6"></td>
                </tr>
                <tr>
                    <td width=24% align=right>Province</td>
                    <td width=39%><gw:list id="lst_Province" styles="width:100%" /></td>
                   <td width="37%" colspan="6"></td> 
                </tr>
            </table>                
        </td>
    </tr>
    
    <tr valign="top">
        <td width="35%"  align ="top">
		    <table id="LeftBottomTB" width="100%" align="top">
			    <tr>
				    <td><gw:tree  id="oTreeDepo" style="width:100%;height:450;overflow:auto;display:" onclicknode="OnTreeClick()" ></gw:tree></td>
			    </tr>
		    </table>
	    </td>
        <td width="65%" align ="top">
            <table id="RightBottomTB" width="100%" height="100%" align="top">
                <tr>
                    <td width=15% align=right>Deposit Kind</td>
                    <td width=25%><gw:list id="lst_DEPO_KIND" styles="width:100%" csstype="mandatory"></gw:list></td>
                    <td width=15% align=right>Swift Code</td>
                    <td width=25%><gw:textbox id="txt_SWIST_CODE" styles="width:100%" csstype="mandatory" OnChange=""/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Customer</td>
                    <td width=25%><gw:list id="lst_BUSPARTNER_PK" styles="width:100%" csstype="mandatory" OnChange="OnGetPartnerID()"></gw:list></td>
                    <td width=15% align=right>Bank Account No</td>
                    <td width=25%><gw:textbox id="txt_ACCOUNT_NO" styles="width:100%" csstype="mandatory" OnChange="OnGetPartnerID()"/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Bank ID</td>
                    <td width=25%><gw:textbox id="txt_BANK_ID" styles="width:100%" csstype="mandatory"/></td>
                    <td width=10% align=right>Currency</td>
                    <td width=25%><gw:list id="lst_CCY" styles="width:100%" OnChange="OnGetPartnerID()"></gw:list></td>
                </tr>
				<tr>
                    <td width=15% align=right><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account code</a></b></td>
                    <td width=75% colspan="3">
					   <table border="0" cellpadding=0 cellspacing="1" width="100%">
					      <tr>
							<td  width=40%><gw:textbox id="txt_Acccd" csstype="mandatory" styles="width:100%" /></td>
							<td width=60% colspan="1"> <gw:textbox id="txt_Accnm" csstype="mandatory" styles="width:100%" /><gw:textbox id="txt_Acc_pk" styles="width:100%;display:none" /></td>
							<td width="1%"><gw:imgBtn id="ibtnReset" styles="width:100%;" img="reset"  alt="reset Department" onclick="txt_Acccd.text='';txt_Accnm.text='';txt_Acc_pk.text='';" /></td>
						  </tr>
					   </table>
					</td>
					
                </tr>
                <tr>
                    <td width=15% align=right></td>
                    <td width=25%></td>
                    <td width=10% align=right></td>
                    <td width=25%></td>
                </tr>
              </table>
              <table id="Table4" width="100%" align="top">
                <tr>
                    <td width=15% align=right>Deposit Owner</td>
                    <td width=25%><gw:textbox id="txt_DEPO_OWNER" styles="width:100%"/></td>
                    <td width=15% align=right>Use Kind</td>
                    <td width=25%>
                        <gw:radio id="rb_USE_YN" value="Y" onchange="OnChangeYN()">
                            <span value="Y" >Yes &nbsp;&nbsp;</span>
							<span value="N" >No </span>
                        </gw:radio>
                    </td>                    
                </tr>
                <tr>
                    <td width=15% align=right>Contract Date</td>
                    <td width=25%><gw:datebox id="dt_CONTRACT_DT" lang="<%=session("lang")%>" nullaccept /></td>
                    <td width=15% align=right>Closing Date</td>
                    <td width=25%><gw:datebox id="dt_Closing" lang="<%=session("lang")%>" nullaccept /></td>
                   
                </tr>
                <tr>
                        <td width=15% align=right>Expire Date</td>
                        <td width=25%><gw:datebox id="dt_EXPIRE_DT" lang="<%=session("lang")%>" nullaccept/></td>
                       <td width=15% align=right>Time Deposit</td>
                    <td width=25%><gw:textbox id="txt_timeDeposit" styles="width:100%" /></td> 
                </tr>
                <tr>
                    <td width=15% align=right>Interest Kind</td>
                    <td width=25%><gw:list id="lst_BASINT_KIND" styles="width:100%"></gw:list></td>
                    <td width=15% align=right>Interest Rate</td>
                    <td width=25%><gw:textbox id="txt_INT_RATE" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Spread</td>
                    <td width=25%><gw:textbox id="txt_SPREAD" styles="width:100%" onkeypress="return Numbers(event)" /></td>
                    <td width=15% align=right>Basic Interest Stand Date</td>
                    <td width=25%><gw:datebox id="dt_BASINT_STDD" lang="<%=session("lang")%>" nullaccept/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Due Amount</td>
                    <td width=25%><gw:textbox id="txt_DUE_AMT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>Interest Period</td>
                    <td width=25%><gw:textbox id="txt_INT_PERIOD" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Interest</td>
                    <td width=25%><gw:textbox id="txt_INTEREST" styles="width:100%"  onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>Principle Amount</td>
                    <td width=25%><gw:textbox id="txt_PRINCIPAL" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Remainder</td>
                    <td width=25%><gw:textbox id="txt_REMAINDER" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>Deposit Guaranty Money</td>
                    <td width=25%><gw:textbox id="txt_CUROP_GRT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Deposit Limit Amount</td>
                    <td width=25%><gw:textbox id="txt_CUROV_LITAMT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>Deposit Turning Date</td>
                    <td width=25%><gw:textbox id="txt_CUR_INSDT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    
                </tr>
                <tr>
                    <td width=15% align=right>Total Settle Count</td>
                    <td width=25%><gw:textbox id="txt_TOT_SETTCNT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>First Settle Date</td>
                    <td width=25%><gw:datebox id="dt_FIR_SETTDT" lang="<%=session("lang")%>" nullaccept/></td>
                </tr>
                <tr>
                    <td width=15% align=right>Settle Period</td>
                    <td width=25%><gw:textbox id="txt_SETT_PERIOD" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                    <td width=15% align=right>Settle Amount Each Month</td>
                    <td width=25%><gw:textbox id="txt_UNI_SETTAMT" styles="width:100%" onkeypress="return Numbers(event)"/></td>
                </tr>
               
            </table>            
        </td>             
    </tr>   	        
</table>
    
    <gw:textbox id="txt_TAC_ABDEPOMT_PK"                  style="display:none"/> 
    <gw:textbox id="txt_tmp_ACC_NO"                  style="display:none"/> 
    <gw:textbox id="txt_tmp_CYY"                  style="display:none"/> 
    <gw:textbox id="txt_BUSPARTNER_ID"                  style="display:none"/> 
    <gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
         <gw:textbox id="txtUser_Pk"  styles='display:none' />
           <td width=25%><gw:datebox id="dt_Closing1" lang="<%=session("lang")%>"  style="display:none" /></td>   
</body>
<img status="expand" id="imgMaster" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:34%;top:128;display:none" onclick="OnToggle(1)"  />
</html>