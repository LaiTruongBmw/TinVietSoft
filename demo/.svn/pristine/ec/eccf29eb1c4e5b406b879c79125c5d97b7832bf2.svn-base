<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    txtUser.text="<%=Session("User_ID") %>"; 
    BindingData(); 
    OnFormat();
     OnChangeColor();
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    //dso_ctl_getProposedBy.Call("SELECT");
	dso_getCompany.Call();
    
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
       lstCompany.SetDataText(ls_data);
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
	dataStatus = "Data|1H|Operating cost 1|17|Operating cost 2"; 
    lstReport.SetDataText(dataStatus); 
    
}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
   {
        var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=AC_SEL_ACCD_PL";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
    {
        txtACPK.SetDataText(object[3]);
        txtACCD.SetDataText(object[0]);
        txtACNM.SetDataText(object[1]);
    }
   }
   if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00220_plcenter.aspx?";
        var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLC_PK.text = object;     // Center PK
				dat_gfka00220_1.Call();
			}            
		}        
   }
   if (pname=='PL')
   {
       var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00220_plunit.aspx?";
       var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
	   var tmp;
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLPK.text=object;     // Center PK
				dat_gfka00220_2.Call();
			}            
		}    
   }
    
}
//------------------------------------------------------------------------------------------
function OnSearch()
{
   dso_sel_pl.Call("SELECT");
}
//-------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dso_sel_pl":
            
        break; 
    }
}

function OnPrint()
{
    var url ='/standard/reports/60/08/60080220_1.aspx?kind=' + lstReport.value +'&status=' + lstStatus.value + '&tco_company_pk=' + lstCompany.value + '&date_fr='+txtFROM_DATE.value + '&user=' + txtUser.text + '&Acc_pk=' + txtACPK.text + '&date_to=' + txtTO_DATE.value;
    System.OpenTargetPage( System.RootURL+url , 'newform' );
      
}
function OnDataReceive(obj)
{
        if(obj.id=='dso_sel_pl')
       {
                OnFormat();
                OnChangeColor();
       } 
}
function OnChangeColor()
{
    var ctrl = grdDetail.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grdDetail.GetGridData(i,17)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, 0, i, 18, true);
        }
        else if (grdDetail.GetGridData(i,17)== "I")
        {
	        grdDetail.SetCellBold(i, 1, i, 18, false);
	        ctrl.Cell(14, i, 1, i, 18) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, 1, i, 18, false);
	    }
	    grdDetail.SetCellBgColor(i, 0, i, 18, Number(grdDetail.GetGridData(i, 18)));
	}
}
function OnFormat()
{
            var fg = grdDetail.GetGridControl();
            fg.ColFormat(2) = "###,###.##R"; 
            fg.ColFormat(3) = "###,###.##R"; 
            fg.ColFormat(4) = "###,###.##R"; 
            fg.ColFormat(5) = "###,###.##R"; 
            fg.ColFormat(6) = "###,###.##R"; 
            fg.ColFormat(7) = "###,###.##R"; 
            fg.ColFormat(8) = "###,###.##R"; 
            fg.ColFormat(9) = "###,###.##R";        
}
</script>
  <body>
     <!------------------------------------------------------------------------>
  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_pl" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080220_1">
                <input bind="grdDetail">
				    <input bind="lstReport"/>
					<input bind="lstStatus"/>
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
					 <input bind="txtTO_DATE"/>
                    <input bind="txtUser"/> 
                    <input bind="txtACPK"/> 
                </input>
                <output bind="grdDetail"/>
        </dso>
        </xml>
    </gw:data>
            <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="width:100;height:10%">
                   <td>
                        <fieldset >
                             <table width="100%" border="0" cellpadding="0" cellspacing="1" >
							   <tr >
									<td align="right" width="10%" >Company&nbsp;</td>
									<td  colspan="1" width="15%"><gw:list id="lstCompany" styles="width:100%" /></td>
									<td align="right" width="15%"><a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">Account Code</a>&nbsp;</td>
									<td  width="10%"><gw:textbox id="txtACCD"  text="" styles="width:100%" /><gw:textbox id="txtACPK"  text="" styles="width:100%;display:none" /></td>
									<td width="20%" colspan="4" ><gw:textbox id="txtACNM"  text="" styles="width:100%" /></td>
									<td align="right"  width="1%"   ><gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="txtACCD.text='';txtACNM.text='';txtACPK.text='';" /></td>
									<td align="right"  width="1%" ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
									<td align="right"  width="1%" ><gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" /></td>        
								</tr>
								<tr>
									<td align="right" >Month&nbsp;</td> 
									<td align="left" colspan="1" >
									        <table cellpadding="0" cellspacing="0">
									                <tr>
									                        <td><gw:datebox id="txtFROM_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>" type="month" /></td>  
									                        <td>~</td>
									                      <td align="left" colspan="1" ><gw:datebox id="txtTO_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>" type="month" /></td>  
									                </tr>
									        </table>
									</td>
									
									<td align="right">Status</td>
									<td colspan="1"  ><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()"/></td>
                                    <td align="right"  width="15%">Report&nbsp;</td>
									<td width="15%" colspan="6"><gw:list id="lstReport" styles="width:100%" onchange="OnSearch()" /></td> 
									</td> 
							 	</tr>
							</table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:70%">
                    <td >
                    <!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
                                <gw:grid id='grdDetail'
                                    header='Account code|Account name|AP|OF|GY|RC|OT|C1|C2|Total|_|_|_|_|_|_|_|_|_'
                                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                     aligns='0|0|3|3|3|3|3|3|3|3|0|0|0|0|0|0|0|0|0'
                                    defaults='||||||||||||||||||'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='1200|2000|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|0|0|0|0|0|0'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                />
                            </td>
                </tr>
                 
            </table>
          
<gw:textbox id="txtUser"  text="" styles="width:100%" />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
  </body>
</html>