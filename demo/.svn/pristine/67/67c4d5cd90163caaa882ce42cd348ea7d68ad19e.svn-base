<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

//--------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    OnDisplay('1');
    OnFormatGrid();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();

}
//---------------------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data2    = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
    lstVoucherType.SetDataText(ls_data2);
	
	ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCOMPANY.SetDataText(ls_data2);
}

//---------------------------------------------------------------------------------------
function OnSearch(index)
{
	switch(index)
	{
		case 0:
			txt_type.text = 'process'
		    dat_gfja00020_1.Call("SELECT");
        break;
		case 1:
			txt_type.text = 'slip'
			dat_gfja00020_1.Call("SELECT");
		break;
     }
}
//------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    trl = idgrid.GetGridControl();	
    trl.ColFormat(9)                  = "###,###,###,###,###.##";    
    trl.ColFormat(10)                  = "###,###,###,###,###.##";    
    trl.ColFormat(11)              = "###,###,###,###,###.##";
    trl.ColFormat(12)              = "###,###,###,###,###.##";
}
//--------------------------------------------------
function SetButtonStatus()
{
	 if(txt_process_yn.GetData()=='Y')
		{
			btnProcess.SetEnable(false);
			if(txt_genslip_yn.GetData()=='Y')
			{
				btnCancelP.SetEnable(false);
			}else{
				btnCancelP.SetEnable(true);
			}
			
		}
		else
		{
			btnProcess.SetEnable(true);
			btnCancelP.SetEnable(false);
				
		}
}
//--------------------------------------------------
function onProcessChecking()
{
	 dat_process_checking.Call();
}
//--------------------------------------------------
function OnDataReceive(obj)
{
    if (obj.id == 'dat_process')
    {
       onProcessChecking();
    }
    else if(obj.id=='dat_process_checking')
    {
        SetButtonStatus();
    }
}

//-------------------------------------------------------------------------
function OnPopUp(pos)
{
    var tmp;
    var aValue;
    switch(pos)
    {
        case 1:
                          var fpath = System.RootURL + "/standard/forms/60/09/60090050_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCOMPANY.GetData() + "&dsqlid=ac_sel_60090050_popup";
                          var  o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
                            if (o != null)
	                        {
		                        if(o[0] != 0)
		                        {
		                            txtAC_CD.SetDataText(o[0]);
			                        txtAC_NM.SetDataText(o[1]);
			                        txtAC_PK.SetDataText(o[3]);
		                        }
                            }
        break;
                case 2:
                                          var fpath = System.RootURL + "/standard/forms/60/09/60090050_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCOMPANY.GetData() + "&dsqlid=ac_sel_60090050_popup";
                                          var  o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
                                            if (o != null)
	                                        {
		                                        if(o[0] != 0)
		                                        {
		                                            txtEXPE_AC_CD.SetDataText(o[0]);
			                                        txtEXPE_AC_NM.SetDataText(o[1]);
			                                        txtEXPE_AC_PK.SetDataText(o[3]);
		                                        }
                                            }
        break;
         
    }        
}
//--------------------------------------------------------------
function OnDisplay()
{
    var n = rdoDISPLAY.GetData();
    
    switch(n)
    {
    	case "1":
            
            btnProcess.style.display="";
            btnCancelP.style.display="";
            btnMakeSlip.style.display="none";
            btnCancelM.style.display="none";
           btnSearch_S.style.display="none"; 
           btnSearch_P.style.display=""; 
           btnExcelP.style.display="";
           btnExcelM.style.display="none";
            
        break;
        case "2":
           
            btnProcess.style.display="none";
            btnCancelP.style.display="none";
            btnMakeSlip.style.display="";
            btnCancelM.style.display="";
            btnSearch_S.style.display=""; 
           btnExcelP.style.display="none";
           btnExcelM.style.display="";
           btnSearch_P.style.display="none"; 
            break;
    }
   
       
}
//---------------------------------------------------
function Process()
{
	txt_action.text='INSERT';
    dat_process.Call();
}
//---------------------------------------------------
function MakeSlip()
{
	txt_action.text='INSERT';
    dat_make_slip.Call();
}
//---------------------------------------------------
function MakeSlip_Cancel()
{
	txt_action.text='DELETE';
	dat_make_slip.Call();
}
//----------------------------------------------------
function process_cancel()
{
	txt_action.text='DELETE';
    dat_process.Call();
}
//-----------------------------------------------------------------------
function OnPrint()
{
//            var url = System.RootURL + "/standard/reports/gf/ja/gfja00020.aspx?Company=" +lstCOMPANY.value  + '&Month=' + txtMonth.value;
//           System.OpenTargetPage(url);       
}
</script>
<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60150120" > 
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
 <gw:data id="dat_process"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="process" parameter="0,1,2"  procedure="ac_pro_60150120"> 
                <input>   
                    <input bind="txt_action" />
                    <input bind="lstCOMPANY" />
                    <input bind="txtMonth" /> 
                </input> 
                <output>
                    <output bind="txtReturn" />
                </output>
            </dso> 
        </xml> 
</gw:data>
 <!-------------------------------------------------------------------------------->
 <gw:data id="dat_process_checking"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="process" parameter="0,1"  procedure="ac_pro_60150120_1"> 
                <input>   
				   <input bind="txtMonth" /> 
                    <input bind="lstCOMPANY" />
                </input> 
                <output>
                    <output bind="txt_process_yn" />
					<output bind="txt_genslip_yn" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------------------->
 <gw:data id="dat_make_slip"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="process" parameter="0,1,2"  procedure="ac_pro_60150120_3"> 
                <input>   
                    <input bind="txt_action" />
                    <input bind="lstCOMPANY" />
                    <input bind="txtMonth" /> 
                </input> 
                <output>
                    <output bind="txtReturn" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------------------------------------------------------------->
<gw:data id="dat_gfja00020_1"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"  function="ac_sel_60150120_1"  > 
             <input bind="idgrid">                    
                <input bind="lstCOMPANY" /> 
                <input bind="txtMonth" /> 
                <input bind="txt_type" />
                <input bind="txtAC_PK" />
                <input bind="txtEXPE_AC_PK" />
                <input bind="txtVoucher_no" />
                <input bind="txtseq" />
                <input bind="txtSlip_voucherno" />
                <input bind="txtVoucher_Description" />
                <input bind="txtVoucher_Amt" />
				
             </input> 
            <output bind="idgrid" /> 
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
     	<tr style="width:100%;height:5%">
		<td width="85%"><fieldset >
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table2">
		 
			<tr>
				<td align="right" width="13%">Company&nbsp;</td>
				<td width="30%"><gw:list id="lstCOMPANY" styles='width:100%;' onchange="OnSearch()" /></td>
               
				<td align="right" width="20%"><a title="Click here to show Account" onclick="OnPopUp(1)" href="#tips">Account Code&nbsp;</a></td>
				<td width="37%">
				            <table cellpadding="0" cellspacing="0" width="100%">
				                        <tr>
				                                    <td width="40%"><gw:textbox id="txtAC_CD" readonly="true" styles='width:100%;'/></td>
				                                    <td  width="60%"><gw:textbox id="txtAC_NM" readonly="true" styles='width:100%;' /></td>
				                                   <td><gw:textbox id="txtAC_PK"  styles='display:none' /></td> 
				                                   <td ><gw:imgBtn id="ibtndeprAccReset" img="reset"  alt="reset acc" onclick="txtAC_CD.text='';txtAC_NM.text='';txtAC_PK.text='';" /></td>
				                        </tr>
				            </table>
				</td>
			</tr>
			<tr>
			   
				<td align="right">Month&nbsp;</td>
				<td>
				    <table style="width:100%">
				        <tr>
				            <td width="10%" align="left"><gw:datebox id="txtMonth" styles='width:100%;' onchange="onProcessChecking()" type=month  lang="<%=Session("Lang")%>"/> </td>
				            
				            <td ><gw:checkbox id="chkauto_YN" defaultvalue="Y|N" value="Y" onclick=""  styles="width:100%;display:none" /></td>
				             <td align="right" width="10%"></td>
                            <td ><gw:list id="lstVoucherType" onchange="OnChangeVoucher()" styles="width:100%;display:none"/></td>
                             <td align="right" width="10%">Seq</td>
                            <td width="80%"><gw:textbox id="txtseq" styles="width:100%" onenterkey="CheckKeySeq()" onkeypress="CheckNumeric()" /></td>
				        </tr>
				    </table>
				</td>
				
				
				<td align="right"><a title="Click here to show Account" onclick="OnPopUp(2)" href="#tips">Acc.Code Expense&nbsp;</a></td>
				<td >
				            <table cellpadding="0" cellspacing="0" width="100%">
				                    <tr>
				                                <td width="40%"><gw:textbox id="txtEXPE_AC_CD" readonly="true" styles='width:100%;' /></td>
				                                <td width="60%"><gw:textbox id="txtEXPE_AC_NM" readonly="true" styles='width:100%;' /></td>
				                                 <td><gw:textbox id="txtEXPE_AC_PK" styles='display:none' /></td>
				                                 <td ><gw:imgBtn id="ibtnExpeAccReset" img="reset"  alt="reset acc" onclick="txtEXPE_AC_PK.text='';txtEXPE_AC_NM.text='';txtEXPE_AC_CD.text='';" /></td>
				                    </tr>
				            </table>
				</td>
		        
		        
			</tr>
			<tr>
			    
			    <td align="right">Slip No&nbsp;</td>
                <td align="left" >
                            <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                                    <td width="40%"><gw:textbox id="txtSlip_voucherno" styles="width:100%" /></td> 
                                                    <td width="20%" align="right">V.Amt&nbsp;</td>
			                                        <td width="40%"><gw:textbox id="txtVoucher_Amt"  styles="width:100%" /></td> 
                                        </tr>
                            </table>
                </td>
                <td align="right">V.Description&nbsp;</td>
			         <td >
			                        <table cellpadding="0" cellspacing="0" width="100%">
			                                    <tr>
			                                                 <td width="40%"><gw:textbox id="txtVoucher_Description"  styles="width:100%" /></td>
			                                                 <td width="20%" align="right">V.No&nbsp;</td>
                                                             <td width="40%"><gw:textbox id="txtVoucher_no" onkeypress="" styles="width:100%" /></td> 
			                                    </tr>
			                        </table>
			         </td> 
                
			</tr>
			
		</table>
		</fieldset> </td>
		<td width="15%">
		    <fieldset style="width:100%;height:100%">
		   
		    <table style="width:100%;height:100%" border="0"  cellpadding=0 cellspacing=0 width="100%" id="table3">
			    <tr style="width:100%;height:90%" >
				    <td width="100%" >
				                <table width="100%" cellpadding="0" cellspacing="0">
				                            <tr>
				                                            <td><gw:imgBtn id="btnSearch_P" img="search"   alt="Search process"        onclick="OnSearch(0)" /></td>
				                                            <td><gw:imgBtn id="btnSearch_S" img="search"   alt="Search slip"        onclick="OnSearch(1)" /> </td>
				                                            <td><gw:button id="btnProcess"      img="process"  alt="Process"  onclick="Process()" /> </td>
				                                            <td><gw:button id="btnCancelP" img="cancel"   alt="Cancel Process"        onclick="process_cancel()" /> </td>
				                                            <td><gw:button id="btnMakeSlip"      img="create"  alt="Make Slip"  onclick="MakeSlip()" /> </td>
				                                            <td><gw:button id="btnCancelM" img="cancel"   alt="Cancel Make Slip"        onclick="MakeSlip_Cancel()" /> </td>
				                                            <td><gw:button id="btnExcelP" img="excel"   alt="Excel Process"        onclick="OnPrint()" /> </td>
				                                            <td><gw:button id="btnExcelM" img="excel"   alt="Excel Make Slip"        onclick="OnPrint()" /> </td>
				                            </tr>
				                </table>
				    </td>
				 
			    </tr>
			    <tr style="width:100%;height:10%">
				    <td align="center" width="100%"><gw:radio id="rdoDISPLAY" value="1" onchange="OnDisplay()">
                                        <span value="1">Process</span>
                                        <span value="2">Slip</span>
                                        </gw:radio>
                    </td>
			    </tr>
			    
		    </table>
		    </fieldset>
		   
		</td>
	</tr>
        <tr style="width: 100%; height: 95%" >
            <td width="100%" colspan="2">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                           <!-- header="0._pk|1.No|2.Code|3.Description|4.Description|5.Acc.Code DR|6.Acc.Name DR|7.Acc.Code CR|8.Acc.Name CR|9.Original Amount|10.Allocate Amount|11.Accum.Allocate|12.Remain.Allocate|13._debit_Acc_pk|14._credit_Acc_pk"-->
                            <gw:grid id="idgrid" 
								header="_pk|No|Code|Description|Description|Acc.Code DR|Acc.Name DR|Acc.Code CR|Acc.Name CR|Original Amount|Allocate Amount|Accum.Allocate|Remain.Allocate|_debit_Acc_pk|_credit_Acc_pk"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="0|1|0|0|0|0|0|0|0|3|3|3|3|0|0" 
                                defaults="||||||||||||||" 
								editcol="0|0|0|0|0|1|1|1|1|0|1|0|0|1|0"
                                widths="0|500|1000|2000|2000|1500|2000|1500|2000|2000|2000|2000|2000|2000|0|0|0" 
                                styles="width:100%; height:100%"
                                sorting="T"  oncelldblclick=""/>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
 <gw:textbox id="txt_pk"      style="display:none"/>
 <gw:textbox id="txtComCodeID"  text=""  styles='display:none'  />
 <gw:textbox id="txtCodeTemp"  text=""  styles='display:none'  />
 <gw:textbox id="txtReturn"  styles='display:none;'/>
<gw:textbox id="txt_action" text="INSERT" styles='display:none;'/>

<gw:textbox id="txt_actionc" text="DELETE" styles='display:none;'/>
<gw:textbox id="txt_process_yn" text="DELETE" styles='display:none;'/>
<gw:textbox id="txt_genslip_yn" text="DELETE" styles='display:none;'/>
<gw:textbox id="txt_type" text="" styles='display:none'/>
<gw:textbox id="txt_slipvcno"      style="display:none"/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
   </body>
</html>
