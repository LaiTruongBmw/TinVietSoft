<!-- Popup dung de get customer tuong tu popupgetpartnet.aspx -->
<!-- #include file="../../../../system/lib/form.inc"  -->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{  
    System.Translate(document);
    var l_company_pk  = "<%=Request.QueryString("com_pk")%>";
	txtCompanyPk.text = l_company_pk;
	dso_search.Call('SELECT')
}
function DblClick()
{
        var code_data=new Array()
	    var ctrl = idGrid.GetGridControl();
        code_data[0] = idGrid.GetGridData( ctrl.row , 0 ); //pk
		code_data[1] = idGrid.GetGridData( ctrl.row , 1 );// Project Code
		code_data[2] = idGrid.GetGridData( ctrl.row , 2 ); //3.Project Name
		window.returnValue = code_data; 
	   	this.close(); 	
}   
</script>
<body style="margin:0; padding:0;">

    
    <gw:data id="dso_search" >
	<xml>
		<dso type="grid" function="ac_sel_60060010_BizPlace_popup" >
			<input bind="idGrid">
				<input bind="txtBiz_Place" />
				<input bind="txtCompanyPk" />
			</input>
			<output bind="idGrid"/>
		</dso>
	</xml>
  </gw:data>

    <table  width=100%>
	<tr>
	    <td width=10% align='right'>Biz Place</td>
		<td width=90%><gw:textbox id="txtBiz_Place"    	  styles="width:100%" onenterkey="dso_search.Call('SELECT')"  /></td>
		<td width=><gw:imgBtn id="idSearch" img="search" alt="Search" onclick="dso_search.Call('SELECT')" /></td>					
	</tr>
	<tr>
	    <!--0_c.PK|1.Cust ID|2.Cust Name|3.Local Name|4_FOREIGN_NM|5_PARTNER_TYPE|6.TAX CODE|7.SERIAL NO|8.FORM NO|9.ADDRESS|10_ADD_2|11_ADD_3|12_PHONE_NO|13_EMAIL|14_FAX|15_WEBSITE|16_SALE_PRESENT|17_COM_YN|18_CUS_YN|19_CUS_ACTIVE_YN|20_VEN_YN|21_VEN_ACT_YN|22_ACT_YN|23_VALID_F|24_VALID_T|25_DESCRIPT--->
	    <td colspan=4>
			
			<gw:grid   
			id="idGrid"  
			header="_PK|Biz Place Code|Biz Place Name"   
			format="0|0|0"  
			aligns="0|0|0"  
			defaults="||"  
			editcol="1|1|1"  
			widths="0|0|0"  
			styles="width:100%; height:530"   
			sorting="T"
			autosize="T"
			oncelldblclick= "DblClick()" /> 
	    </td>
	</tr>
</table >
<gw:textbox id="txtCompanyPk" styles="display:none" />
</body>
</html>
