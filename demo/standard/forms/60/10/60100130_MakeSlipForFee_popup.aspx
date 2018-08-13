<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>
var glag="";
function BodyInit()
{
   
	//txtval4.text   = "<%=Session("SESSION_LANG") %>";
	var user_id = "<%=Session("LOGIN_ID")%>"; 
	txtcompany_pk.text= "<%=session("COMPANY_PK")%>";
	
	txtthr_employee_pk.text= "<%=session("EMPLOYEE_PK")%>";
	txuser_pk.text= "<%=session("USER_PK")%>";
	txuser_name.text= "<%=session("USER_NAME")%>";
	
	System.Translate(document);
	//txt_userid.SetDataText(user_id);
	//OnSearch();
	dso_pro_get_partner_PL.Call();
}
function OnSearch()
{
    glag="";
	dso_transaction_his_D.Call("SELECT");
}
function OnReset(obj)
{
	if(obj=='Partner')
	{
		txtcustpk.text = "";
		txtcustid.text = "";
		txtcustnm.text = "";
	}
	if(obj=='PL')
	{
		txtABPL_PK.text="";//pk
		txtABPL_CD.text="";//id
		txtABPL_NM.text="";//nm
	}
}
function OnPopup(obj)
{
	if(obj=='Partner')
	{
		var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk=' + txtcompany_pk.text;
		var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		if ( object != null )
		{
			if (object[0] != 0)
			{
				txtcustpk.text = object[0];
				txtcustid.text = object[1];
				txtcustnm.text = object[2];
			}
		}
	}
	//==================
	if(obj=='PL')
	{
		var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + txtcompany_pk.text + '&dsqlid=ac_sel_60130120_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
		var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
		if ( object != null ) 
		{
			if (object[0] != 0)
			{
				txtABPL_PK.SetDataText(object[2]);//pk
				txtABPL_CD.SetDataText(object[0]);//id
				txtABPL_NM.SetDataText(object[1]);//nm
			}
		}
	}
}
//================
function OnDataReceive(obj)
{
	if(obj.id=='dso_process_data' && glag=="process")
	{
		dso_upd_his_book.Call("SELECT");
	}
	if(obj.id=='dso_upd_his_book' && glag=="process")
	{
		 dso_transaction_his_D.Call("SELECT")
	}
	if(obj.id=='dso_transaction_his_D' && glag=="")
	{
		dso_upd_his_book.Call("SELECT");
	}
	if(obj.id=='dso_upd_his_book' && glag=="remove")
	{
		 dso_transaction_his_D.Call("SELECT")
	}
	if(obj.id=='dso_make_Slip_data')
	{
		dso_sel_all_slip_seq.Call("SELECT");
	}
	
	if(obj.id=='dso_transaction_his_D')
	{
		dso_sel_all_slip_seq.Call("SELECT");
	}
	
	//===========
	if(obj.id=='dso_sel_all_slip_seq')
	{
		glag="STOP";
		dso_upd_his_book.Call("SELECT");
	}
}
//================================================
function OnCopy()
{
	var arr_pk="";
	var ctrl=idGridHistoryD.GetGridControl();
		for(var i=1;i<ctrl.rows;i++)
		{ 
			if (ctrl.isSelected(i) == true)//checked
			{
				arr_pk += idGridHistoryD.GetGridData(i,0)+",";//master pk
			}
		}
		txtArrPK.text=arr_pk;
		//alert(txtArrPK.text);
		if(txtArrPK.text !="")
		{
			//if(confirm('Are you sure you want copy data ?'))
			//{
				glag="process";
				dso_process_data.Call();
			//}
		}
}
function OnRemove()
{
	var ctrl=idGridHistoryD_Book.GetGridControl();
	if(confirm('Are you sure you want remove data here ?'))
	{
		for (var i =1;i<ctrl.Rows;i++ )
		{
			if (ctrl.isSelected(i) == true)
			{
				//alert(i);
				idGridHistoryD_Book.SetGridText(i,8,'N');
			}
			
		}
		glag="remove";
		dso_upd_his_book.Call();
	}
}
//Make Slip====================
function OnMakeSlip()
{
	if(idGridHistoryD_Book.rows >1)
	{
		if(confirm('Are you sure you want make slip data ?'))
		{
			dso_make_Slip_data.Call();
		}
	}
}
//ac_pro_60100130_his_book_copy
function OnShowDetailSlip()
{
	txtSeq.text = idGridAutoSlip.GetGridData(idGridAutoSlip.row, 0);
	dso_sel_his_book_dtl.Call('SELECT');
}
//==========================onshow======slip_entry================
function OnShowslipEntry()
{
	
	var ls_seq = idGridAutoSlip.GetGridData(idGridAutoSlip.selrow, 0);
	if ( ls_seq != '')
	{
		var pk = ls_seq;
		var status = '2';

		var fpath = System.RootURL + '/standard/forms/gf/ep/gfep00050_popup_TAcc.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
		var wWidth = 950;
		var wHeight = 570;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);

		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		"scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		"lef="+ x +",top=" + y;

		var object = System.OpenModal(fpath, wWidth, wHeight, features);
	}
}
//==================================================
function OnSetDateFollowMonth()
{
	var v_month=txtMonth.value;
	var v_month_value = v_month.substring(4, 6);
	var v_year_value = v_month.substring(0, 4);
	var v_dtfrm="",v_dtto="";
	if(v_month_value =='01')
	{
		v_dtfrm="0101";
		v_dtto="0131";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='02')
	{
		v_dtfrm="0201";
		v_dtto="0229";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='03')
	{
		v_dtfrm="0301";
		v_dtto="0331";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='04')
	{
		v_dtfrm="0401";
		v_dtto="0430";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='05')
	{
		v_dtfrm="0501";
		v_dtto="0531";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='06')
	{
		v_dtfrm="0601";
		v_dtto="0631";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='07')
	{
		v_dtfrm="0701";
		v_dtto="0730";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='08')
	{
		v_dtfrm="0801";
		v_dtto="0831";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='09')
	{
		v_dtfrm="0901";
		v_dtto="0930";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='10')
	{
		v_dtfrm="1001";
		v_dtto="1031";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='11')
	{
		v_dtfrm="1101";
		v_dtto="1130";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
	if(v_month_value =='12')
	{
		v_dtfrm="1201";
		v_dtto="1231";
		dtFrom.value=v_year_value+""+v_dtfrm;
		dtTo.value=v_year_value+""+v_dtto;
		OnSearch();
	}
}
</script>
<body>
<gw:data id="dso_transaction_his_D" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ac_sel_60100130_his_d_pop" procedure=""> 
                <input bind="idGridHistoryD" >
                    <input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtAccNo" />
					<input bind="txtSenderNote" />
				</input>
                <output  bind="idGridHistoryD" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dso_upd_his_book" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60100130_his_book_pop" procedure="ac_upd_60100130_his_book_pop">
			<input bind="idGridHistoryD_Book">
				<input bind="txtNoPara"/>
			</input>
			<output bind="idGridHistoryD_Book"/>
		</dso>
	</xml>
</gw:data>

<!--------------copy-------data------------>
<gw:data id="dso_process_data" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" procedure="ac_pro_60100130_his_book_copy" > 
		<input>
			<input bind="txtArrPK" />
		</input> 
		<output>
		<output bind="txtReturn" />
		</output>
		</dso> 
	</xml> 
</gw:data>
<!--------------make-slip-----data------------>
<gw:data id="dso_make_Slip_data" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" procedure="ac_pro_60100130_make_slip" > 
		<input>
			<input bind="txtcompany_pk" />
			<input bind="txtcustpk" />
			<input bind="txtABPL_PK" />
			<input bind="txtthr_employee_pk" />
			<input bind="txuser_pk" />
			<input bind="txuser_name" />
			<input bind="lstMakeType" />
			
		</input> 
		<output>
		<output bind="txtReturn" />
		</output>
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_sel_all_slip_seq" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0" function="ac_sel_60100130_all_slip" procedure="">
			<input bind="idGridAutoSlip">
				<input bind="txtNoPara"/>
			</input>
			<output bind="idGridAutoSlip"/>
		</dso>
	</xml>
</gw:data>

<gw:data id="dso_sel_his_book_dtl" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0" function="ac_sel_60100130_his_seq_dtl" procedure="">
			<input bind="idGridHistoryD_Book2">
				<input bind="txtSeq"/>
			</input>
			<output bind="idGridHistoryD_Book2"/>
		</dso>
	</xml>
</gw:data>


<gw:data id="dso_pro_get_partner_PL" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" procedure="ac_pro_60100130_partner_pl" > 
		<input> 
			<input bind="txtNoPara"/>
		</input>
		<output>
			<output bind="txtcustpk"/>
			<output bind="txtcustid"/>
			<output bind="txtcustnm"/>
			<output bind="txtABPL_PK"/>
			<output bind="txtABPL_CD"/>
			<output bind="txtABPL_NM"/>
		</output> 
		</dso> 
	</xml> 
</gw:data>


    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr height="100%"> 
        <td width="100%" height="100%">
    	    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
            <tr height="4%">
	            <td > 
                    <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
					<tr>
						<td width="5%" align="right">Month</td>
						<td width="10%"><gw:datebox id="txtMonth" styles='width:100%;' type=month onchange="OnSetDateFollowMonth()" lang="<%=Session("Lang")%>"/></td>
						<td width="2%" align="right"><//td>
						<td width="8%" align="right"><gw:datebox id="dtFrom" onchange="" styles='width:85%' lang="1"/></td>
						<td width="2%" align="right">~</td>
						<td width="8%" align="right"><gw:datebox id="dtTo" onchange="" styles='width:85%' lang="1"/></td>
						<td width="5%" align="right">Acc No</td>
						<td width="10%" align="right"><gw:textbox id="txtAccNo" styles="width:100%" onenterkey="OnSearch()" /></td>
						<td width="5%" align="right">Sender/Note</td>
						<td width="10%" align="right"><gw:textbox id="txtSenderNote" styles="width:100%" onenterkey="OnSearch()" /></td>
						<td width="15%" align="right"><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /></td>
						<td width="3%" align="right"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick ="OnSearch()" /></td>
		            </tr>
		            	        
				    </table>
		        </td>
	    	</tr>
	    	<tr height="32%"> 
	    		<td>
	    			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
                    <tr>
			    	    <td height="80%">   
					        <gw:grid   
					            id="idGridHistoryD"  
					            header="PK|Transfer Date|Transfer Time|Acc No|Tran Amount|Sender Receiver Name|Note"
					            format="0|4|0|0|-0|0|0"
					            aligns="0|0|0|0|0|0|0"  
					            defaults="||||||"  
					            editcol="0|0|0|0|0|0|0"  
					            widths="1800|6000|4000|1000|1000|1000|1000"  
					            styles="width:100%; height:100%"   
					            sorting="T"
								autosize="T"
					            oncelldblclick="OnCopy()" />
		                </td> 
		            </tr>
		            </table>
            	<td>
	    	</tr>
			
			<tr height="32%"> 
	    		<td>
	    			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
					<tr height="4%">
						<td > 
							<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
							<tr>
								<td width="5%" align="right"><a onclick="OnPopup('Partner')" href="#" title="Get customer">Partner&nbsp;</a></td>
								<td width="10%"><gw:textbox id="txtcustid" /></td>
								<td width="20%"><gw:textbox id="txtcustnm" /></td>
								<td width="5%"><gw:imgbtn id="btnResetCust" img="reset" alt="Reset" onclick="OnReset('Partner')" /></td>
								
								<td width="10%"><a title="Click here to show PL Unit" onClick="OnPopup('PL')" href="#tips" ><b>PL Unit&nbsp;</b></a></td>
								<td width="10%" ><gw:textbox id="txtABPL_CD" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
								<td width="20%" ><gw:textbox id="txtABPL_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
								<td width="5%"><gw:imgBtn id="ibtnResetdeptPL" styles="width:100%;" img="reset" alt="reset Department" onclick="OnReset('PL')" /></td>
								<td width="0%" ><gw:textbox id="txtABPL_PK" styles='width:100%;display:none' /></td>
								<td width="10%"><gw:list id="lstMakeType" styles='width:100%'  " >
										<data>DATA|1|Bank charge|2|LC fees</data>
									</gw:list>
									</td>
								<td width="5%" align="right"><gw:icon id="btnMakeSlip" img="in" text="Make Slip" styles='width:100%' onclick="OnMakeSlip()"/></td>
								<td width="5%" align="right"><gw:icon id="btnRemove" img="in" text="Remove" styles='width:100%' onclick="OnRemove()"/></td>
								<td width="5%" align="right"><gw:icon id="btnCopy" img="in" text="Copy" styles='width:100%' onclick="OnCopy()"/></td>
							</tr>
										
							</table>
						</td>
					</tr>
                    <tr>
			    	    <td height="80%">   
					        <gw:grid   
					            id="idGridHistoryD_Book"  
					            header="_PK|_TSI_TRANSACTION_HISTORY_D_PK|Transfer Date|Transfer Time|Acc No|Tran Amount|Sender Receiver Name|Note|Remark"
					            format="0|0|4|0|0|-0|0|0|0"
					            aligns="0|0|0|0|0|0|0|0|0"  
					            defaults="||||||||"  
					            editcol="0|0|0|0|0|0|0|0|0"  
					            widths="1800|6000|1000|4000|1000|1000|1000|1000|1000"  
					            styles="width:100%; height:100%"   
					            sorting="T"
								autosize="T"
					            oncellclick="" />
		                </td> 
		            </tr>
		            </table>
            	<td>
	    	</tr>
			<tr height="32%"> 
	    		<td>
	    			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
                    <tr>
			    	    <td width="49%">   
					        <gw:grid   
					            id="idGridAutoSlip"  
					            header="Seq|Transfer Date|Voucher No|_Item"
					            format="0|4|0|0"
					            aligns="0|0|0|0"  
					            defaults="|||||"  
					            editcol="0|0|0|0"  
					            widths="6000|4000|1000|1000"  
					            styles="width:100%; height:100%"   
					            sorting="T"
								autosize="T"
								oncelldblclick = "OnShowslipEntry()"
					            oncellclick="OnShowDetailSlip()" />
		                </td> 
						<td width="2%"> </td>
						 <td width="49%">   
					       <gw:grid   
					            id="idGridHistoryD_Book2"  
					            header="_PK|_TSI_TRANSACTION_HISTORY_D_PK|Transfer Date|Transfer Time|Acc No|Tran Amount|Sender Receiver Name|Note|Remark"
					            format="0|0|4|0|0|-0|0|0|0"
					            aligns="0|0|0|0|0|0|0|0|0"  
					            defaults="||||||||"  
					            editcol="0|0|0|0|0|0|0|0|0"  
					            widths="1800|6000|1000|4000|1000|1000|1000|1000|1000"  
					            styles="width:100%; height:100%"   
					            sorting="T"
								autosize="T"
					            oncelldblclick="" />
		                </td> 
		            </tr>
		            </table>
            	<td>
	    	</tr>

		    
		    </table>  
        </td>
	</tr>
    </table>
<gw:textbox id="txtcustpk"              style="display:none"/>
<gw:textbox id="txtcompany_pk"              style="display:none"/>
<gw:textbox id="txtArrPK"              style="display:none"/>
<gw:textbox id="txtReturn"              style="display:none"/>
<gw:textbox id="txtNoPara"              style="display:none"/>
<gw:textbox id="txt_userid"   text="" styles="display:none" />

<gw:textbox id="txtthr_employee_pk"              style="display:none"/>
<gw:textbox id="txuser_pk"              style="display:none"/>
<gw:textbox id="txuser_name"   text="" styles="display:none" />
<gw:textbox id="txtSeq"   text="" styles="display:none" />
</body>
</html>