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
}
function BindingDataList()
{
        txtCompany.text = "<%=Session("COMPANY_PK") %>";
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 11,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACDF0060'")%>; 
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 15,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110'")%>; 
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 31,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACDF0070'")%>; 
}
//-----------------------------------------------------------------------------------------
function OnSearch()
{
        dat_Update.Call("SELECT");
}
//----------------------------------------------------
function FormatGrid()
{
            var trl;
    trl = grdDetail.GetGridControl();	
    trl.ColFormat(12)                  = "###,###,###,###,###";    
    trl.ColFormat(16)                  = "###,###,###,###,###";    
    trl.ColFormat(17)              = "###,###,###,###,###";
    trl.ColFormat(18)              = "###,###,###,###,###";
    trl.ColFormat(19)              = "###,###,###,###,###";
    trl.ColFormat(20)              = "###,###,###,###,###";
    trl.ColFormat(21)              = "###,###,###,###,###";
    trl.ColFormat(22)              = "###,###,###,###,###";
    trl.ColFormat(23)              = "###,###,###,###,###";
    trl.ColFormat(24)              = "###,###,###,###,###";
    trl.ColFormat(18)              = "###,###,###,###,###";
    trl.ColFormat(25)              = "###,###,###,###,###";
    trl.ColFormat(26)              = "###,###,###,###,###";
    trl.ColFormat(27)              = "###,###,###,###,###";
}
function OnPrint()
{
          
//                    if(lstReportType.value == '02')
//                  {  
//                                var url = System.RootURL + "/standard/reports/gf/ja/gfja00020.aspx?Company=" +lstCompany.value  + '&Voucherno=' + txtVoucher_no.text + '&Acc_pk=' + txtAC_pk.text + '&Month_fr=' + txtMonth_fr.value + '&Month_to=' + txtMonth_to.value ;
//                               
//                  }
//                  else
//                  {
//                           var url = System.RootURL + "/standard/reports/gf/ja/gfja00030.aspx?Company=" +lstCompany.value  + '&Voucherno=' + txtVoucher_no.text + '&Acc_pk=' + txtAC_pk.text + '&Month_fr=' + txtMonth_fr.value + '&Month_to=' + txtMonth_to.value ;                       
//                  }
//                     System.OpenTargetPage(url);      
}
function OnNew()
{
            var i = 0;
            grdDetail.AddRow();
           for(i=1; i < grdDetail.rows; i++)
           {
                    grdDetail.SetGridText(grdDetail.rows-1, 0, i);
           } 
}

function OnSave()
{
         for(i=1; i < grdDetail.rows; i++)
           {
                   grdDetail.SetGridText(grdDetail.rows-1, 0, i);
                   if(grdDetail.GetGridData(i,38) == '')
                   { 
                        grdDetail.SetGridText(i, 38, txtCompany.text); 
                    } 
           }     
        dat_Update.Call();
}

function OnDelete()
{
        grdDetail.DeleteRow();
}
function OnRefresh()
{
        grdDetail.GridRefresh();

}
function OnDataReceive(obj)
{
        if(obj.id=='dat_Update')
       {
                FormatGrid();
       } 
}
</script>

<body>
<gw:data id="dat_Update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39" function="ac_sel_60150140" procedure="ac_upd_60150140"   > 
            <input bind="grdDetail">                    
               
                <input bind="lstCompany" /> 
                <input bind="txtVoucher" /> 
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>    
    <table style="background: #BDE9FF; height: 100%; width: 100%" >
        <tr>
      
            <td style="background: white; width: 100%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="height: 100%; width: 100%" border="0">
                    <tr style="height: 5%" width="100%">
                        <td width="100%">
                            <fieldset style="padding:4">
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" width="8%">Company&nbsp;</td>
                                        <td  width="42%"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                            </gw:list>
                                         </td>
                                        
                                        <td align="right" width="15%">Voucher&nbsp;</td>
                                        <td width="30%"> <gw:textbox id="txtVoucher" styles='width:100%;' /></td>
                                       <td width="5%"></td> 
                                       <td><gw:imgbtn img="refresh" alt="Search" onclick="OnRefresh()" /></td> 
                                        <td><gw:imgbtn img="search" alt="Search" onclick="OnSearch()" /></td>
										<td style="width: 1%"><gw:button  id="btnNew" img="new" alt="New" onclick="OnNew()" /> </td>	  
										<td style="width: 1%"><gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
										<td style="width: 1%"><gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" /> </td>
										<td style="width: 1%" align="right"><gw:button id="btnPrint"  text="Print" alt="Print Out Report" img="excel" onclick="OnPrint()" /></td>
                                      
                                    </tr>
                                   
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%" width="100%">
                        <td>
                            <!--header='0.No|1.Voucher|2.Account Code|3.Acc.Name|4.Acc.Expense Code|5.Acc.Expense Name|6.Tans.Date|7.Estime life(year)|8.Month(s)|9.Total month(s)|10.Day(s)|11.Allocate Method|12.Allocation Rate|13.Service Date|14.Allo.Date|15.CCY|16.Original Cost|17.Original Amt|18.Begin Cost|19.Begin Amt|20.Monthly Allocate|21.Monthly Amt|22.Daily Allocate|23.Daily Amt|24.Accum.Allocate|25.Accum.Amt|26.Remain Allocate|27.Remain Amt|28.P/L Unit Code|29.P/L Unit Name|30.Department|31.Status|32.Description|33.Local Description|34.pk|35.acc_pk|36.acc_exp_pk|37.pl_pk|38.company_pk'-->
                            <gw:grid id="grdDetail" 
                                header='No|Voucher|Account Code|Acc.Name|Acc.Expense Code|Acc.Expense Name|Trans.Date|Estime life(year)|Month(s)|Total month(s)|Day(s)|Allocate Method|Allocation Rate|Service Date|Allo.Date|CCY|Original Cost|Original Amt|Begin Cost|Begin Amt|Monthly Allocate|Monthly Amt|Daily Allocate|Daily Amt|Accum.Allocate|Accum.Amt|Remain Allocate|Remain Amt|P/L Unit Code|P/L Unit Name|Department|Status|Description|Local Description|_pk|_acc_pk|_acc_exp_pk|_pl_pk|_company_pk|_department_pk'
                                format='0|0|0|0|0|0|4|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                aligns ='1|0|0|0|0|0|1|3|3|3|3|1|3|1|1|1|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0|1|0|0|0|0|0|0|0|0' 
                                defaults='|||||||||||SL||||||||||||||||||||A||||||||' 
                                editcol='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='500|1500|1700|2500|1700|2500|1200|1500|1500|1500|1500|2000|1500|1200|1200|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|4000|1200|4000|4000|0|0|0|0|0|0' 
                                sorting='T' styles="width:100%;height:100%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtCompany" styles='width:100%;display:none' />
    <!---------------------------------------------------------------------->
</body>
</html>
