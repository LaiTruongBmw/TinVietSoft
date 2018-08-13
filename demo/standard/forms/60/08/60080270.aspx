<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>

var emp_id = "<%=Session("LOGIN_ID")%>";
function BodyInit()
{
    var data;
    System.Translate(document);
    data  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(data);
    //lstCompany.value = "<%=session("company_pk") %>";
    data  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstCurrency.SetDataText(data);
    data     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(data);
    data  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(data);
    grdDetail.AddRow();
    MergeHeaderGrid();
    FormatGridCol();
}
function FormatGridCol()
{
   var ctrl = grdDetail.GetGridControl();    
   for (i=2;i<grdDetail.cols;i++)
     {
         ctrl.ColFormat(i) = "#,###.##";    
     }   
}
function MergeHeaderGrid()
{
	var fg=grdDetail.GetGridControl(); 	    
        fg.FixedRows = 2
        fg.MergeCells =5	
		fg.MergeRow(0) = true
        fg.Cell(0, 0, 5,0, 9)  = "Direct Cost Of TurnOver"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 6, 1) = "Material"
	    fg.Cell(0, 1, 7, 1) = "Labour"
	    fg.Cell(0, 1, 8, 1) = "Outside Order"
	    fg.Cell(0, 1, 9, 1) = "Expenses"
	    
	    fg.Cell(0, 0, 12,0, 13)  = "Gross Margin"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 12, 1) = "Direct"
	    fg.Cell(0, 1, 13, 1) = "Indirect"
	    
	    fg.Cell(0, 0, 14,0, 15)  = "Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 14, 1) = "Amount"
	    fg.Cell(0, 1, 15, 1) = "Budget"
	    
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Code"	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Project"	
	    fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Turnover"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Turnover"	
	    fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Total"	
		fg.MergeCol(11) = true
		fg.Cell(0, 0, 11, 1, 11) = "Indirect Cost Of Turnover"			
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Provision cost"			
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4; 
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold				
   
}
function OnReport()
{
    if(confirm('Do you want to open report?'))
    {
         var url = '/standard/reports/60/08/60080270.aspx?p_tco_company_pk=' + lstCompany.GetData()+ '&p_date_fr=' + dtSMonth.GetData() + '&p_date_to=' + dtEMonth.GetData();
         System.OpenTargetPage( System.RootURL+url , "newform" ); 
    }     
}
function OnSearch()
{
    dso_gfka00260_1.Call('SELECT');
}
</script>

<body style="margin: 0; padding: 0;">
<gw:data id="dso_gfka00260_1" onreceive="MergeHeaderGrid()">
        <xml>
            <dso type="grid" function="AC_SEL_60080270_1">
                <input bind="grdDetail">
                    <input bind="dtSMonth"/>
                    <input bind="dtEMonth"/>
                    <input bind="lstCompany"/>
                </input>
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>
   
 <table style="width:100%;height:100%" cellpadding=0 border=0 cellspacing=0>
	     <tr style="width:100%;height:5%">
	                <td>
	                         <fieldset style="padding: 2">
        <table border="0" width="100%" cellpadding=0 cellspacing=0>
	        <tr>
		        <td width="10%">Company</td>
		        <td width="40%" colspan=3 > <gw:list id="lstCompany" styles='width:100%' /> </td>
		        <td width="10%" align=right >Currency</td>
		        <td width="10%"><gw:list id="lstCurrency" styles="width:100%" value="VND" onchange="SetRate()" onclick="SetRate()"  /></td>
		        <td width="10%" align=right>Ex. Rate</td>
		        <td width="5%"><gw:textbox id="txtRate1" text="1" styles='width:100%' type="number" format="###,###.##R"/></td>
		        <td width="13%"><gw:textbox id="txtRate2" text="1" styles='width:100%' type="number" format="###,###.##R"/>	     </td>
		        
		        <td width="1%" align=right><gw:imgBtn id="ibtnReport" img="excel" alt="Report"  Onclick="OnReport()" /></td>
	            <td width="1%"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" Onclick="OnSearch()" /></td>
	        </tr>
	        <tr>
	            <td width="10%">Month</td>
		        <td width="10%"><gw:datebox id="dtSMonth"  type=month  lang="<%=session("lang")%>" /> </td>
		        <td width="1%">~</td>
		        <td width="29%"><gw:datebox id="dtEMonth"  type=month  lang="<%=session("lang")%>" /> </td>
		        <td width="10%" align=right >Status</td>
		        <td width="10%" colspan=1><gw:radio id="idInput_STATUS" value="<%=request.QueryString("Status")%>"> 										
					    <span value="0" > Approved&nbsp;</span>												
			      </gw:radio >					</td>
			    <td width="15%" align =Right >Language</td>		
		        <td width="15%" align=left colspan=4><gw:list id="lstLanguage" styles="width:100%;display:" style="height:25px" /></td>   
	        </tr>
        </table>
    </fieldset>
	                </td>
	     </tr>
   	   
	   <tr style="width:100%;height:90%">
	     <td width=100% colspan=9>
	     <!--header="0._pk|1.Code|2.project|3._turnover|4.Turnover|5.total|6.material|7.labor|8.out_side_order|9.expenses|10.indirect_costofturnover|11.direct|12.Indirect|13.amount|14.budget"   --->
	       <gw:grid   
            id="grdDetail"  
            header="_pk|Code|project|_turnover|Turnover|total|material|labor|out_side_order|expenses|Provision cost|indirect_costofturnover|direct|Indirect|amount|budget "   
            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            aligns="2|2|2|3|3|3|3|3|3|3|3|3|3|3|3|3"  
            defaults="|||||||||||||||"  
            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            widths="0|0|3000|2000|1000|2000|1700|1700|1700|1700|1700|2500|1700|1700|2100|1000"  
            styles="width:100%; height:100%"   
            sorting="F"   
            param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14"/>
	     </td>
	   </tr>	   
	</table>	 
	 <gw:textbox id="txtEMonth" styles="width:100%;display:none"/>   
</body>
</html>
