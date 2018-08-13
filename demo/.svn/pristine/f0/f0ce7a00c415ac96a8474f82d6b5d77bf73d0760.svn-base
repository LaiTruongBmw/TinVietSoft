<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script>

var check_init=0;
var c_trans_amt=6;
var c_book_amt=7;
var l_ap=0;
var l_list_ap_len=0;
function BodyInit()
{ 
	System.Translate(document);
	// Set data source to Combobox
	var lstCompany_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	var lstCostGroup_data = "<%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0092' order by code")%>" +"|ALL|Select All";
	var lstCostType_data = "<%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0093' order by code")%>" +"|ALL|Select All";
	var cboCurrency_data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";  //trade term
    
	//grdList.ColFormat(2) = "#,###,###,###,###,###,###,###,###.##";
	//grdList.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##";
	//grdList.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##";
	
	lstCompany.SetDataText(lstCompany_data); //lstCompany.value = "<%=Session("COMPANY_PK")%>";
	
	lstSearchCT.SetDataText(lstCostType_data)//;lstSearchCT.value = "ALL";
	lstSearchCT.value = "ALL";
	lstSearchCG.SetDataText(lstCostGroup_data)//;lstSearchCG.value = "ALL";
	lstSearchCG.value = "ALL";
	cboCurrency.SetDataText(cboCurrency_data); 
	
	var ls_data = "<%=CtlLib.SetListDataSQL("SELECT CODE,CODE||'-'||CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0094' ")%>"+"|ALL|SalCost All";
    lstPmCode.SetDataText(ls_data);
    lstPmCode.value="ALL";
    txtTotal_trans.SetEnable(0);
    txtTotal_from_sal.SetEnable(0);
	
	//btnPost.SetEnable(0);//temporary 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	l_list_ap_len=lstAPkind.GetControl().options.length-1;
	
    
    set_Interval(100);
	dso_getCompany.Call();
	
}

function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}

function OnProcessData(action)
{
  if(check_init==1)
  {
	    l_action=action;
    //check close data
    lblAction.text=l_action;
    //alert(l_action);
    dsoCheckCloseData.Call();
  }
}

function GetTransRate()
{
	dsoProcessGetTransRate.Call();
}

function getExRate()
{    
	/*var url =  System.RootURL + "/standard/forms/ep/bp/epbp00020_GetExRate.aspx?date=" + datPayDate.value +"&curr=" + cboCurrency.value;
	ajax_test = null;
   
	ajax_test = GetXmlHttpRequest(returnExRate);
	ajax_test.open("GET", url , true);
	ajax_test.send(null); */
}
//---------------------------------------------------------
function returnExRate()
{
	if(GetRequestState(ajax_test))
	{	
		strdata = ajax_test.responseText;	 	  
		txtBookRate.SetDataText(''+strdata);
	}
}

function OnsearchPayroll()
{
    
	dsoSearchSlipInfo.Call("SELECT");
	
}

function onGetAPType(n,obj,flag)
{
    var l_result;
    if(flag=="CODE")
        l_result= obj.options.item(n).value;
    else
        l_result= obj.options.item(n).text;
    
    return l_result;
}

function OnDataReceive(obj)
{
	if(obj.id == "dso_getCompany")
	{
		LoadCostCenter();
	}
	if(obj.id == "dsoProcessSlipData")
	{
	    clear_Interval(idInterval);
		if(lblResult.text == "0" && lblAction.text == "PROCESS")
		{
		    
		    if(l_ap<l_list_ap_len-1)
		    {
		        l_ap+=1;
		        txtAp_kind.text=onGetAPType(l_ap,lstAPkind.GetControl(),"CODE");
		        lblProStatus.text=onGetAPType(l_ap,lstAPkind.GetControl(),"NAME")+"...";
		        set_Interval(1000);
			    dsoProcessSlipData.Call();
		    }
		    else 
			{
			    lblProStatus.text="Successfull";
			    alert("Process Successfull");
			    set_Interval(1000);
			    OnsearchPayroll();
			}
		    
			        
		    
			/*if(txtAp_kind.text=="01")
			{
			    txtAp_kind.text="02";
			    lblProStatus.text="Health Ins...";
			    set_Interval(1000);
			    dsoProcessSlipData.Call();
			}
			else if(txtAp_kind.text=="02")
		    {
			    txtAp_kind.text="03";
			    lblProStatus.text="Social Ins...";
			    set_Interval(1000);
			    dsoProcessSlipData.Call();
			}
			else if(txtAp_kind.text=="03")
			{
			    txtAp_kind.text="04";
			    lblProStatus.text="Unemp Ins...";
			    set_Interval(1000);
			    dsoProcessSlipData.Call();
			}
			else if(txtAp_kind.text=="04")
			{
			    txtAp_kind.text="05";
			    lblProStatus.text="Union...";
			    set_Interval(1000);
			    dsoProcessSlipData.Call();
			}
			else if(txtAp_kind.text=="05")
			{
			    lblProStatus.text="Successfull";
			    alert("Process Successfull");
			    set_Interval(1000);
			    OnsearchPayroll();
			}
			*/
			//alert("Process successfull");
			//OnsearchPayroll();
		}
        else if(lblResult.text == "0" && lblAction.text == "CLOSE")
		{
			alert("Close successfull");
			OnsearchPayroll();
		}
		else if(lblResult.text == "0" && lblAction.text == "OPEN")
		{
			alert("Open successfull");
		}
		
	}
	else if(obj.id == "dsoGetCostCenterByCompany")
	{
	    GetTransRate();
		lstCostCenter.Value = "ALL";
	}
	else if(obj.id == "dsoProcessGetTransRate")
	{
    	 //   getExRate();
    	 check_init=1;
    	 clear_Interval(idInterval);
	}
    else if(obj.id == "dsoPostData")
    {
        //status = 'Exporting data...';
        //dsoExportInvoices.Call();  
		return;		
	}
	else if(obj.id=='dsoSearchSlipInfo')
	{
	    auto_resize_column(grdList,0,grdList.cols-1,9);  
	    check_init=1;
        clear_Interval(idInterval); 
        
        var t1=0
        var t2=0;
        for(var i=1;i<grdList.rows;i++)
        {
            t1+=Number(grdList.GetGridData(i,c_trans_amt));
           // t2+=Number(grdList.GetGridData(i,c_book_amt));
        }
        txtTotal_trans.text=t1;
        //txtTotal_from_sal.text=t2;
        lblRecord.text=grdList.rows-1 +" Round(s)";	
        
        if(grdList.rows-1>0 && lstPmCode.value!="ALL")
            dsoTotalSal.Call();
        else
            txtTotal_from_sal.text="";
        
	} 
    else if(obj.id == "dsoProcessGSlipData")
    {
        OnsearchPayroll();
		return;		
	}
	else if(obj.id == "dsoCheckCloseData")
    {
        
        if(lblResult.text == "-1" && l_action!="OPEN" && l_action!="POST")
        {
            alert("This month closed. You can't do")
            return;
        }
        set_Interval(1000);

        if(l_action == "PROCESS")
	    {
		    if(CheckDataIsValid() == false)
		    {
			    return;
		    }
		    else
		    {
		        if(confirm("Do you want to process!"))
		        {
		            l_ap=0;
			        lblAction.text = "PROCESS";
			        txtAp_kind.text=onGetAPType(l_ap,lstAPkind.GetControl(),"CODE");
			        lblProStatus.text=onGetAPType(l_ap,lstAPkind.GetControl(),"NAME")+"...";
			        dsoProcessSlipData.Call();
			    }
			    else
			        clear_Interval(idInterval);
		    }
	    }
	    else if(l_action == "DELETE")
	    {
		    if(CheckDataIsValid() == false)
		    {
			    return;
		    }
		    else
		    {		
			    lblAction.text = "DELETE";
			    dsoProcessSlipData.Call();
		    }
	    }
	    else if(l_action == "POST")
	    {
		    lblAction.text = "POST";
		    dsoPostData.Call();
	    }
        else if(l_action == "CLOSE")
	    {
		
		    lblAction.text = "CLOSE";
		    dsoProcessSlipData.Call();
		
	    }
        else if(l_action == "OPEN")
	    {
		
		    lblAction.text = "OPEN";
		    dsoProcessSlipData.Call();
		
	    }
	    else
	    {
		    return;
	    }
    }   
}

function CheckDataIsValid()
{
	if(lstCostCenter.GetData() == "")
	{
		alert("Please select Cost Center before process")
		return false;
	}
	if((txtTransRate.text == "" || txtBookRate.text == "") && lblAction.text == "PROCESS" )
	{
		alert("You must input Trans Rate and Book Rate before process")
		return false;
	}
	return true;
}

function LoadCostCenter()
{
	dsoGetCostCenterByCompany.Call();
	//OnsearchPayroll()
}

function ShowDetailPopup()
{

    var CostCenter_PK= grdList.GetGridData(grdList.row,11)	;
    var Sal_Group=grdList.GetGridData(grdList.row,12)	;
    var Cost_Group=grdList.GetGridData(grdList.row,13)	;
    var CostTypePK=grdList.GetGridData(grdList.row,14)	;
	var fpath = System.RootURL + "/standard/forms/60/14/60140120_sel_emp.aspx?";
	fpath = fpath + "Company=" + lstCompany.value + "&SalMon=" + datSalMonth.value + "&CostCenterPK=" + CostCenter_PK;
	fpath = fpath + "&Sal_Group=" + Sal_Group + "&CostTypePK=" + CostTypePK+"&CostGroup_pk="+Cost_Group ;

	//var object = System.OpenModal( fpath , 700 , 600, 'resizable:no;status:no;scroll:no;status:no'); 
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:70;dialogHeight:90;dialogLeft:220;dialogTop:260;edge:sunken;scroll:yes;unadorned:yes;help:no');

}



function OnDataError(obj)
{
	AlertDBError(obj.errmsg)
	return;
}

function AlertDBError(errmsg)
{
	var aTmp = new Array();
	aTmp = errmsg.split("ORA-");
	if(aTmp.length >= 2)
	{
		alert(aTmp[1]);
	}
	else 
	{
		alert(errmsg);
	}
}
function OnPrint()
{
    var url=System.RootURL;
        
    url=url + '/standard/reports/gf/pm/rpt_payroll_make_slip.aspx?p_1=' + lstCompany.value + '&p_2=' + datSalMonth.value + '&p_3=' + lstCostCenter.value + '&p_4=' + lstSearchCG.value + '&p_5=' + lstSearchCT.value + '&p_6=' + lstOrg.value + '&p_7=' + lstAPkind.value+ '&p_8=' + lstPmCode.value;
    window.open(url); 
    
}
function OnShowPopup()
{
    if(check_init==1)
    {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/60/14/60140110_org.aspx?";
         var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			lstOrg.value = obj;
	    }
	 }
     
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------

function OnSlipData(action)
{
    if(check_init==1)
    {
	    if(action == "PROCESS")
	    {
		    lblAction.text = "PROCESS";
		    //dsoProcessGSlipData.Call();
	    }
	    else if(action == "DELETE")
	    {
		    lblAction.text = "DELETE";
		    //dsoProcessGSlipData.Call();
	    }
	}
}

function onChange_Action(flag)
{
    
    if(flag=="COMPANY")
    {
        check_init=0;
        set_Interval(100);
        LoadCostCenter();
    }
    else if(flag=="MONTH")
    {
        check_init=0;
        set_Interval(100);
        GetTransRate();
    }
    else if(flag=="QUERY")
    {
        check_init=0;
        set_Interval(100);
        OnsearchPayroll();
    }
}
function onCheckCostCenter()
{
    if(check_init==1)
    {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/60/14/60140110_check_cost_center.aspx?p_work_mon="+datSalMonth.value;
         var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:60;dialogHeight:30;dialogLeft:200;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        
	 }
}

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Payroll Make Slip</title>
</head>
<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60140120_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<!------------------------------------------------------------------------>
<gw:data id="dsoGetCostCenterByCompany" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)"  > 
	<xml> 
		<dso  type="list" procedure="ac_pro_60140120_cost_center" > 
			<input>
				<input bind="lstCompany" /> 
			</input> 
			<output>
				<output bind="lstCostCenter" />
			</output>
		</dso> 
	</xml> 
</gw:data>


<gw:data id="dsoCheckCloseData" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ACNT_SP_CHECK_CLOSE_MAKE_SLIP" onerror="OnDataError(this)" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="datSalMonth" /> 
                    <input bind="datPayDate" /> 
					<input bind="txtTransRate" /> 
					<input bind="txtBookRate" /> 
					<input bind="lstCostCenter" /> 
					<input bind="lstSearchCG" /> 
					<input bind="lstSearchCT" /> 
                    <input bind="lblAction" />
                    <input bind="lstAPkind" />
                </input> 
                <output>
                    <output bind="lblResult" />
					<output bind="lblProStatus" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="dsoProcessSlipData" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60140120_make_slip" onerror="OnDataError(this)" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="datSalMonth" /> 
                    <input bind="datPayDate" /> 
					<input bind="txtTransRate" /> 
					<input bind="txtBookRate" /> 
					<input bind="lstCostCenter" /> 
					<input bind="lstSearchCG" /> 
					<input bind="lstSearchCT" /> 
                    <input bind="lblAction" />
                    <input bind="txtAp_kind" />
                </input> 
                <output>
                    <output bind="lblResult" />
					<output bind="lblProStatus" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dsoPostData" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60140120_ap_inv_interf" onerror="OnDataError(this)" > 
                <input>
                    <input bind="datSalMonth" /> 
					<input bind="datPayDate" /> 
					<input bind="lstAPkind" />
                </input>
                <output>
                    <output bind="lblProStatus" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dsoProcessGetTransRate" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60140120_sal_tr_rate" onerror="OnDataError(this)" > 
                <input>
                    <input bind="datSalMonth" /> 
                </input>
                <output>
                    <output bind="txtTransRate" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="dsoSearchSlipInfo" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)" > 
        <xml>
            <dso type="grid" function="ac_sel_60140120_slip_list">
                <input bind="grdList">
                    <input bind="lstCompany"/>
                    <input bind="datSalMonth"/>
                    <input bind="lstCostCenter"/>
                    <input bind="lstSearchCG"/>
                    <input bind="lstSearchCT" />
					<input bind="lstOrg" />
					<input bind="lstAPkind" />
					<input bind="lstPmCode" />
                </input>
                <output bind="grdList"/>
            </dso>
        </xml>
</gw:data>


<gw:data id="dsoTotalSal" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_pro_total_from_sal" onerror="OnDataError(this)" > 
                <input>
                    <input bind="lstCompany"/>
                    <input bind="datSalMonth"/>
                    <input bind="lstCostCenter"/>
                    <input bind="lstSearchCG"/>
                    <input bind="lstSearchCT" />
					<input bind="lstOrg" />
					<input bind="lstAPkind" />
					<input bind="lstPmCode" />
                </input>
                <output>
                    <output bind="txtTotal_from_sal" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!--gw:data id="dsoProcessGSlipData" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ACNT.SP_PAYROLL_MAKE_GSLIP" onerror="OnDataError(this)" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="datSalMonth" /> 
                    <input bind="datPayDate" /> 
					<input bind="txtTransRate" /> 
					<input bind="txtBookRate" /> 
					<input bind="lstCostCenter" /> 
					<input bind="lstSearchCG" /> 
					<input bind="lstSearchCT" /> 
                    <input bind="lblAction" />
                    <input bind="lstAPkind" />
                </input> 
                <output>
                    <output bind="lblResult" />
					<output bind="lblProStatus" />
                </output>
            </dso> 
        </xml> 
</gw:data--->


    <table width="100%" height = "100%" cellpadding="0" cellspacing="0"  border="0">
		<tr id="tr_process">
			<td><fieldset style="padding: 6;height:30%"><legend>Process Slip Information</legend>
				<table width="100%" height = "100%" cellpadding="0" cellspacing="0"  border="0">
					<tr width="100%">
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
						<td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td><td width="1%"></td>
					</tr>
					<tr height = "100%">
						<td colspan="13" align = "right">Company</td>
						<td colspan="25"><gw:list id="lstCompany" onchange="onChange_Action('COMPANY')" styles='width:100%'></gw:list></td>
						<td colspan="10" style="border:0;" align="right" ><a title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >
                            Organization</a></td>
						<td colspan="20" style="border:0;" align="left" >
							<gw:list  id="lstOrg" value="ALL" styles='width:100%' onchange=""> 
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0  order by a.seq")%>|ALL|Select All
							</data></gw:list>
						</td>
						<td colspan="10" align = "right">Month</td>
						<td colspan="10"><gw:datebox id="datSalMonth"  onchange="onChange_Action('MONTH')" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" /></td>
						<td colspan="5" align = "right">Pay Date</td>
						<td colspan="5"><gw:datebox id="datPayDate" styles="width:100%" lang="<%=Session("Lang")%>" /></td>
						<td colspan="2"><gw:button img="excel" id="ibtnSumPrinter" text="Print"   alt="detail Report"  onclick="OnPrint()"/></td>
					</tr>
					<tr height = "100%">
						<td colspan="13" align = "right">Cost Center</td>
						<td colspan="25"><gw:list id="lstCostCenter" value = "ALL" onchange="onChange_Action('QUERY')" styles='width:100%'></gw:list></td>
						<td colspan="10" align = "right">Cost Group</td>
						<td colspan="20"><gw:list id="lstSearchCG" onchange="onChange_Action('QUERY')" styles='width:100%'></gw:list></td>
						<td colspan="10" align = "right">Cost Type</td>
						<td colspan="15"><gw:list id="lstSearchCT" onchange="onChange_Action('QUERY')" styles='width:100%'></gw:list></td>
						<td colspan="7" align="center">
									<gw:icon id="btnProcess" img="in" text="Process" styles="width:100" onclick="OnProcessData('PROCESS')" />
						</td>
						
						
					</tr>
					<tr height = "100%">
						<td colspan="10" align = "right">Trans. Rate</td>
						<td colspan="7"><gw:textbox id="txtTransRate" type="number" format="#,###,###,###.##R" text="1" /></td>
						<td colspan="8" align=right>Book Rate</td>
						<td colspan="22"> 
								<table width = "100%">
									<tr>
										<td width="60%" colspan="2" ><gw:list id="cboCurrency" styles="width:100%;" onchange=""></gw:list></td>
										<td width="40%"><gw:textbox id="txtBookRate" type="number" format="#,###,###,###.##R" text="1" /></td>
									</tr>
								</table>
						</td>
						<td colspan="10" align=right>AP Type</td>
						<td colspan="12" align = "right"><gw:list id="lstAPkind" value="ALL" styles="width:100%;" onchange="onChange_Action('QUERY')">
						    <data><%=CtlLib.SetListDataSQL("select a.code,a.code||'-'||a.code_nm from vhr_hr_code a where a.id='HR0201' order by a.seq")%>|ALL|Select All</data>
						</gw:list></td>
						<td colspan="12" style="border:0;" align="center" >
							<gw:label id="lblProStatus"  text="Process Status" maxlen = "100" styles="color:blue;width:100%;font-weight: bold;font-size:12" />
					    </td>
                        <td colspan="3" style="border:0;" align="center" >
							<gw:label id="idInterval"  text="" maxlen = "100" styles="color:blue;width:100%;font-weight: bold;font-size:12" />
					    </td>
						<td colspan="16"> 
							<table width = "100%"><tr>
								<td>
									<gw:icon id="btnSearch" img="in" text="Search" styles="width:100" onclick="onChange_Action('QUERY')" />
								</td>
								<td>
									<gw:icon id="btnOpen" img="in" text="Open" styles="width:100" onclick="OnProcessData('OPEN')" />
								</td>
                                <td>
									<gw:icon id="btnClose" img="in" text="Close" styles="width:100" onclick="OnProcessData('CLOSE')" />
								</td>
							</tr></table>
						</td>
						
					</tr>
					<tr height = "100%">
                        <td colspan="10" align=right>Sal Code</td>
						<td colspan="20" align = "right"><gw:list id="lstPmCode" styles="width:100%;" onchange="onChange_Action('QUERY')"></gw:list></td>
						<td colspan="10" align = "right">Total Trans</td>
						<td colspan="15"><gw:textbox id="txtTotal_trans" type="number" format="#,###,###,###.##R" text="" /></td>
						<td colspan="10" align=right>Total(Check)</td>
                        <td colspan="15"><gw:textbox id="txtTotal_from_sal" type="number" format="#,###,###,###.##R" text="" /></td>
                        <td colspan="15" align=center><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" /></td>
                        <td colspan="5">
									<gw:icon id="btnCheckCost" img="in" text="Check CostCenter" styles="width:100" onclick="onCheckCostCenter()" />
					   </td>
					</tr>
					
				</table>
				</fieldset>
				</td>
		</tr>
		<tr height = "100%">
			<td>
				<table width="100%" height = "100%" cellpadding="0" cellspacing="0"  border = "">
					<tr>
						<td>
							<gw:grid id="grdList" 
								header="Name|Currency|BK Rate|Count emp|_PL Code|PL Name|Trans Amount|Books Amount|Account Code DR|Account Code CR|_TAC_PMCOSTTYPE_PK|_TAC_ABPL_PK|_TAC_PMHRCODE|_GRP_COST|_AP_TYPE"
                                format="0|0|1|1|0|0|-2|-2|0|0|0|0|0|0|0"
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								defaults="||||||||||||||"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								widths="4500|1500|2000|1500|2000|2000|2000|2000|1500|1500|0|1000|1000|1000|1000"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="T" oncelldblclick="ShowDetailPopup()" />
						</td>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<gw:label id="lblAction" style="display: none" />
	<gw:label id="lblResult" style="display: none" />
	<gw:textbox id="txt1" text="" styles="display: none" />
	<gw:textbox id="txt2" text="" styles="display: none" />
	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
	<gw:textbox id="txtAp_kind" text="" styles="display: none" />
	<gw:textbox id="lblTmp" text="" styles="display: none" />
	
</body>
</html>
