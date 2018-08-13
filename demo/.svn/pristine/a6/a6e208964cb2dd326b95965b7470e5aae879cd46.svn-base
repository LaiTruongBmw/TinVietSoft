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
    txtLogin_id.SetDataText(emp_id);
    data  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(data);
    lstCompany.value = "<%=session("company_pk") %>";
    data  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstCurrency.SetDataText(data);
    data     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	txtbccy.SetDataText(arr[1]);
	
    lstStatus.SetDataText("0");
    grdDetail.AddRow();
    MergeHeaderGrid();
    FormatGrid();
}
function FormatGrid()
{
    var fg=grdDetail.GetGridControl(); 	    
    if(txtbccy.GetData() == 'VND')
    {
      for (i=4;i<grdDetail.cols;i++)
      {
         fg.ColFormat(i) = "#,###,###,###,###,###,###,###,###R";    
      }
       
    }
    else
    {
      for (i=4;i<grdDetail.cols;i++)
      {
         fg.ColFormat(i) = "#,###,###,###,###,###,###,###,###.##R";    
      }
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
	    
	    fg.Cell(0, 0, 11,0, 12)  = "Gross Margin"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 11, 1) = "Direct"
	    fg.Cell(0, 1, 12, 1) = "Indirect"
	    
	    fg.Cell(0, 0, 13,0, 14)  = "Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 13, 1) = "Amount"
	    fg.Cell(0, 1, 14, 1) = "Budget"
	    
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
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Indirect Cost Of Turnover"			
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4; 
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold				
   
}
function OnReport()
{
    if(confirm('Do you want to open report?'))
    {
         var url = '/standard/reports/60/08/60080270.aspx';
         System.OpenTargetPage( System.RootURL+url , "newform" ); 
    }     
}
function OnSearch()
{
    dso_gfka00270_1.Call('SELECT');
}
function OnProcess()
{
    dso_gfka00270_2.Call('SELECT');
}
</script>
  
<body style="margin: 0; padding: 0;">
<!---------------Cash flow(indirect method)-------------------------------------------------->
    <gw:data id="dso_gfka00270_1" onreceive="MergeHeaderGrid()">
        <xml>
            <dso type="grid" function="ac_sel_60080270_1">
                <input bind="grdDetail">
                    <input bind="dtEMonth"/>
                </input>
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>
 <!----------------------------------------------------------------------------------------->   
   <gw:data id="dso_gfka00270_2"  onreceive="MergeHeaderGrid()" > 
    <xml> 
        <dso  type="grid"  function="ac_sel_60080280" > 
            <input>
                <input bind="dbPro_from" />
                <input bind="dbPro_to" /> 
				<input bind="lstCompany" />
				<input bind="txtLogin_id" />
            </input> 
           <output bind="grdDetail" />
         
        </dso> 
    </xml> 
  </gw:data>
 <!----------------------------------------------------------------------------------------->
    <fieldset style="padding: 2">
        <table border="0" width="100%" cellpadding=0 cellspacing=0>
	        <tr>
		        <td width="10%">Company</td>
		        <td width="20%" colspan=1 > <gw:list id="lstCompany" styles='width:100%' /> </td>
		        <td width="10%" align=right >Status</td>
		        <td width="15%" colspan=4>
		                                   <gw:list id="lstStatus" styles="width:100%;" onchange="OnChangeQuater()" >
                                                    <data>Data|0|Approved</data>
                                                </gw:list>
		        </td>
		        
		        <td align="right" width="15%">Month Process</td>
				<td width="10%" colspan=1><gw:datebox id="dbPro_from"  type=month  lang="<%=session("lang")%>" /></td>
				<td width="1%"> ~ </td>
				<td width="10%" colspan=2><gw:datebox id="dbPro_to"  type=month  lang="<%=session("lang")%>" /></td>
				<td width="1%" colspan=2><gw:icon   img="in" text="Process"  id="idBtnConfirm"	styles="width:100%"	onclick="OnProcess()"/></td>
		       
	            
	        </tr>
	        <tr>
	            <td width="10%"  colspan=1 >Language</td>		
		        <td width="20%" align=left colspan=1><gw:list id="lstLanguage" styles="width:100%;display:" style="height:25px" /></td>   
		         <td width="10%" align=right  colspan=1>Currency</td>
	            <td width="10%"><gw:list id="lstCurrency" styles="width:100%" value="VND" onchange="SetRate()" onclick="SetRate()"  /></td>
	            <td width="10%" align=right>Ex. Rate</td>
	            <td width="1%"><gw:textbox id="txtRate1" text="1" styles='width:100%' type="number" format="###,###.##R"/></td>
		        <td width="10%"><gw:textbox id="txtRate2" text="1" styles='width:100%' type="number" format="###,###.##R"/>	     </td>
	            <!--td width="10%" align=right >Currency</td>
	            <td width="10%"><gw:list id="lstCurrency" styles="width:100%" value="VND" onchange="SetRate()" onclick="SetRate()"  /></td>
	            <td width="10%" align=right>Ex. Rate</td>
	            <td width="1%"><gw:textbox id="txtRate1" text="1" styles='width:100%' type="number" format="###,###.##R"/></td>
		        <td width="10%"><gw:textbox id="txtRate2" text="1" styles='width:100%' type="number" format="###,###.##R"/>	     </td>
		        <td width="15%" align =Right colspan=2 >Language</td>		
		        <td width="15%" align=left colspan=3><gw:list id="optLang" styles="width:100%;display:" style="height:25px" /></td-->  
		        <!--td width="10%" colspan=2></td-->
		        <td width="10%" align=right>Month</td>
	            <td width="10%"><gw:datebox id="dtSMonth"  type=month  lang="<%=session("lang")%>" /> </td>
	            <td width="1%">~</td>
	            <td width="10%" colspan=2><gw:datebox id="dtEMonth"  type=month  lang="<%=session("lang")%>" /> </td>
		        <td width="1%"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" Onclick="OnSearch()" /></td>
		         <td width="1%" align=right><gw:imgBtn id="ibtnReport" img="excel" alt="excel"  Onclick="OnReport()" /></td>
	        </tr>
	        <!--tr>
	            <td width="10%">Month</td>
		        <td width="10%"><gw:datebox id="dtSMonth"  type=month  lang="<%=session("lang")%>" /> </td>
		        <td width="1%">~</td>
		        <td width="10%"><gw:datebox id="dtEMonth"  type=month  lang="<%=session("lang")%>" /> </td>
		        <td width="1%" colspan=5></td>
		        <td width="10%" align=right >Currency</td>
		        <td width="10%"><gw:list id="lstCurrency" styles="width:100%" value="VND" onchange="SetRate()" onclick="SetRate()"  /></td>
			    <td width="10%" align=right>Ex. Rate</td>
		        <td width="5%"><gw:textbox id="txtRate1" text="1" styles='width:100%' type="number" format="###,###.##R"/></td>
		        <td width="13%"><gw:textbox id="txtRate2" text="1" styles='width:100%' type="number" format="###,###.##R"/>	     </td>
		          
			    
		        <td width="15%" align =Right >Language</td>		
		        <td width="15%" align=left colspan=4><gw:list id="optLang" styles="width:100%;display:" style="height:25px" /></td>   
	        </tr-->
        </table>
    </fieldset>
 <table width="100%" cellpadding=0 border=0 cellspacing=0>
	<tr>
	    <!--0._pk|1.Code|2.project|3._turnover|4.Turnover|5.total|6.material|7.labor|8.out_side_order|9.expenses|10.indirect_costofturnover|11.direct|12.Indirect|13.amount|14.budget-->
	     <td width=100% colspan=9>
	       <gw:grid   
            id="grdDetail"  
            header="_pk|Code|project|_turnover|Turnover|total|material|labor|out_side_order|expenses|indirect_costofturnover|direct|Indirect|amount|budget"   
            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            aligns="2|2|2|3|3|3|3|3|3|3|3|3|3|3|3"  
            defaults="||||||||||||||"  
            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            widths="0|0|3000|2000|1000|2000|1700|1700|1700|1700|1700|1700|1700|2100|1000"  
            styles="width:100%; height:400"   
            sorting="F"   
            />
	     </td>
	   </tr>	   
	</table>	 
	 <gw:textbox id="txtEMonth" styles="width:100%;display:none"/>   
	 <gw:textbox id="txtLogin_id" styles="width:100%;display:none"/>   
	 <gw:textbox id="txtbccy" styles="width:100%;display:none"/>   
</body>
</html>
