<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    txtADDRESS.SetEnable(false);
    txtTAX_NO.SetEnable(false);
    rdoSTATUS.SetDataText("2");
    //OnChangeCompany();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
}

function BindingDataList()
{
    var ls_comp     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_lang      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('HRAB0180','02','') FROM DUAL")%>";
      

    lstCOMPANY.SetDataText(ls_comp);
    lstLANG.SetDataText(ls_lang);
    
}

function OnChangeCompany()
{
    dso_get_company_name.Call();
}

function OnSearch()
{
    dso_sel_grd_vat_sumary.Call("SELECT");
}

function ChangeColor()
{
    var ctrl = grid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grid.GetGridData(i,6)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 7) = false;
	        grid.SetCellBold(i, 1, i, 7, true);
        }
        else if (grid.GetGridData(i,6)== "I")
        {
	        grid.SetCellBold(i, 1, i, 7, false);
	        ctrl.Cell(14, i, 1, i, 7) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 7) = false;
	        grid.SetCellBold(i, 1, i, 7, false);
	    }
	    grid.SetCellBgColor(i, 0, i, 7, Number(grid.GetGridData(i, 7)));
	}
}

function OnReport()
{
    if(confirm("Are you sure you want to report ?" ))
    {
        if(lstLANG.GetData() == "VIE") 
        {
            var url = '/standard/reports/gf/lv/gflv00030_VAT_Sum_VN.aspx?com=' + lstCOMPANY.GetData() + '&yyyymm=' + txtMonth.GetData() + '&status=' + rdoSTATUS.GetData();
        }
        if(lstLANG.GetData() == "ENG") 
        {
            var url = '/standard/reports/gf/lv/gflv00030_VAT_Sum_EN.aspx?com=' + lstCOMPANY.GetData() + '&yyyymm=' + txtMonth.GetData() + '&status=' + rdoSTATUS.GetData();
        }
    
        System.OpenTargetPage( System.RootURL+url , 'newform' )
    }

}
</script>
<body style="margin:0; padding:0;">
 
 <gw:data id="dso_get_company_name"> 
        <xml> 
            <dso type="process" procedure="SP_GET_COMPANY_NAME" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="lstLANG"/>
                </input>
                <output>
                     <output bind="txtCOMPANY_NM"/>
                     <output bind="txtADDRESS"/>
                     <output bind="txtTAX_NO"/>                     
               </output> 
            </dso> 
        </xml> 
    </gw:data>   
    
    <gw:data id="dso_sel_grd_vat_sumary"  onreceive="ChangeColor()">
        <xml>
            <dso type="grid" function="SP_SEL_GRD_VAT_SUMARY">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="txtMonth"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstLANG"/>
                    
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
	 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_6008180_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------->

<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="15%"></td>
                    <td width="15%"></td>
                    <td width="35%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCOMPANY" onchange="OnChangeCompany()" styles='width:100%'> </gw:list></td>
                    <td align="right">Tax code</td>
                    <td ><gw:textbox id="txtTAX_NO"  styles='width=50%'></gw:textbox></td>
                    <td ><gw:imgBtn id="ibtnSearch" img="search"   alt="Search"         onclick="OnSearch()"/></td>
                    <td width="2%"><gw:button id="ibtnReport" img="excel"   text="Print" alt="Print  Out Report"         onclick="OnReport()"/></td>
		        </tr>
		        
		        <tr>
                    <td align="right">BIZ. Place</td>
                    <td colspan="3"><gw:list id="lstBIZ" styles='width:100%' /></td>
                    <td align="right">Address</td>
                    <td colspan="3"><gw:textarea id="txtADDRESS"  styles='width=100%'></gw:textarea></td>
                    <td></td>
                    <td></td>
		        </tr>
		        <tr>
		            <td align="right">Month</td>
                    <td ><gw:datebox id="txtMonth" styles='width:100%' type=month onchange="OnSearch()" lang="<%=Session("Lang")%>"/></td>
		            <td align="right">Status</td>
                    <td ><gw:radio id="rdoSTATUS" value="1" onchange="OnSearch()">
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>
                                    </gw:radio ></gw:list></td>
                    <td align="right">Language</td>
					<td ><gw:list id="lstLANG" styles="width:50%;display:" onchange="OnSearch()"  style="height:25px">
									</gw:list></td>
					<td></td>
					<td></td>
		        </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="100%">
	        <gw:grid   
		        id="grid"
		        header  ="_prn_Seq|Code|No|Description|Amount (Before VAT)|VAT|_Font|_Color"
		        format  ="0|0|0|0|1|1|0|0"   
		        aligns  ="0|0|0|0|3|3|0|0"  
		        defaults="0|0|0|0|0|0|0|0"  
		        editcol ="0|0|0|0|0|0|0|0"   
		        widths  ="0|0|800|8000|3000|3000"  
		        styles  ="width:100%; height:400"
		        sorting ="F"
		        />
        </td>
    </tr>
   
</table>

	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
<gw:textbox id="txtCOMPANY_NM"         style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>