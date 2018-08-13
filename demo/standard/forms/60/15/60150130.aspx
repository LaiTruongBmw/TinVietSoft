<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{   
	System.Translate(document);
	BindingDataList();
	FormatGrid(); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
function BindingDataList()
{
        var ls_ReportType = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFJA0002') FROM DUAL")%>";
        lstReportType.SetDataText(ls_ReportType);
}
//-----------------------------------------------------------------------------------------
function OnSearch()
{
        dso_search.Call("SELECT");
}
//-------------------------------------------------------------------------------
function OnPopUp()
{
//         var aValue;
//         var tmp;
//        var fpath   = System.RootURL + "/standard/forms/gf/ja/gfja00010_1.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW";
//       aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
//        if ( aValue != null )
//        { 
//        
//                tmp = aValue[0]; 
//                
//                txtAC_pk.text = tmp[0]; 
//                txtAC_CD.text   = tmp[2];
//                txtAC_NM.text   = tmp[3];		  
//        }
      
			 var fpath = System.RootURL + "/standard/forms/60/09/60090050_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090050_popup";
                          var  o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
                            if (o != null)
	                        {
		                        if(o[0] != 0)
		                        {
		                            txtAC_CD.SetDataText(o[0]);
			                        txtAC_NM.SetDataText(o[1]);
			                        txtAC_pk.SetDataText(o[3]);
		                        }
                            }
}
//----------------------------------------------------
function FormatGrid()
{
            var trl;
    trl = grdDetail.GetGridControl();	
    trl.ColFormat(7)                  = "###,###,###,###,###";    
    trl.ColFormat(8)                  = "###,###,###,###,###";    
    trl.ColFormat(9)              = "###,###,###,###,###";
    trl.ColFormat(10)              = "###,###,###,###,###";
}
function OnPrint()
{
          
                    if(lstReportType.value == '02')
                  {  
                                var url = System.RootURL + "/standard/reports/gf/ja/gfja00020.aspx?Company=" +lstCompany.value  + '&Voucherno=' + txtVoucher_no.text + '&Acc_pk=' + txtAC_pk.text + '&Month_fr=' + txtMonth_fr.value + '&Month_to=' + txtMonth_to.value ;
                               
                  }
                  else
                  {
                           var url = System.RootURL + "/standard/reports/gf/ja/gfja00030.aspx?Company=" +lstCompany.value  + '&Voucherno=' + txtVoucher_no.text + '&Acc_pk=' + txtAC_pk.text + '&Month_fr=' + txtMonth_fr.value + '&Month_to=' + txtMonth_to.value ;                       
                  }
                     System.OpenTargetPage(url);      
}
</script>

<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_60150130" > 
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

<gw:data id="dso_search">
        <xml>
            <dso type="grid" function="ac_sel_60150130_1" onreceive="">
                <input >
                    <input bind="lstCompany"/>
                    <input bind="txtMonth_fr"/>
                    <input bind="txtMonth_to"/>
                    <input bind="txtAC_pk"/>
                    <input bind="txtVoucher_no"/>
                </input>
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>
    <table style="background: #BDE9FF; height: 100%; width: 100%" >
        <tr>
      
            <td style="background: white; width: 100%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="height: 100%; width: 100%" border="0">
                    <tr style="height: 5%" width="100%">
                        <td width="100%">
                            <fieldset>
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" width="16%">Company&nbsp;</td>
                                        <td  width="15%"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                            </gw:list>
                                         </td>
                                        
                                        <td align="right" width="19%"><a title="Click here to show Code" onclick="OnPopUp()" href="#tips"><b>Code &nbsp;</b></a></td>
                                        <td width="50%" colspan="3">
                                            
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                                <td width="40%"><gw:textbox id="txtAC_CD" readonly="true" styles='width:100%;' /></td>
                                                                                <td width="60%"><gw:textbox id="txtAC_NM" readonly="true" styles='width:100%;' /></td>
                                                                                <td ><gw:textbox id="txtAC_pk"  styles='width:100%;display:none' /></td>
                                                                               <td><gw:imgbtn id="ibtndeprAccReset" img="reset" alt="reset code" onclick="txtAC_CD.text='';txtAC_NM.text='';txtAC_pk.text='';" /></td> 
                                                                    </tr>
                                                        </table> 
                                        </td>
                                        <td>
                                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                        <td>
                                            <gw:button img="excel" text="Print" alt="Print Out Report" onclick="OnPrint()" />
                                        </td>
                                    </tr>
                                    <tr>
                                                <td align="right" width="16%" >Month from</td>
                                                <td width="15%" >
                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                                        <td width="50%"><gw:datebox id="txtMonth_fr" type="month" styles='width:100%;' lang="<%=Session("Lang")%>" /></td> 
                                                                                        <td>~</td>
                                                                                        <td width="50%"><gw:datebox id="txtMonth_to"  type="month" styles='width:100%;' lang="<%=Session("Lang")%>" /></td> 
                                                                        </tr>
                                                            </table>  
                                                </td> 
                                                
                                                <td align="right" width="19%" >Voucher No&nbsp;</td>
                                                <td width="15%" ><gw:textbox id="txtVoucher_no" styles='width:100%;' /></td>
                                               <td align="right" width="15%" >Report type&nbsp;</td> 
                                               <td width="30%" colspan="3"><gw:list id="lstReportType" style="width:100%" /></td>  
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%" width="100%">
                        <td>
                            <!--   header='0._pk|1.Description|2.Local Description|3.PIS Date|4.Original Cost|5.Monthly Allocate|6.Accum.Allocate|7.Remain.Allocate'-->
                            <gw:grid id="grdDetail" header='Month|Trans Date|No|Code|Description|Local Description|PIS Date|Original Cost|Monthly Allocate|Accum.Allocate|Remain.Allocate'
                                format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|3|3|3|3' defaults='||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1'
                                widths='800|1100|400|1500|3500|3500|1500|2000|2000|2000|2000' sorting='T' styles="width:100%;height:100%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <!---------------------------------------------------------------------->
	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
