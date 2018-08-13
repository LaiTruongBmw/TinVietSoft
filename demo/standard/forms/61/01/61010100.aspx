<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Facilities Entry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	<%=ESysLib.SetGridColumnComboFormat("Grid_Facilities", 5,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0024' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
	OnSearch();
}
//============================================================================================
function OnNew()
{
	Grid_Facilities.AddRow();
}
//============================================================================================
function OnDelete()
{
	Grid_Facilities.DeleteRow();	
}
//============================================================================================
function OnSearch()
{
	dso_Facilities.Call('SELECT');
}
//============================================================================================
function OnSave()
{
	dso_Facilities.Call();
}
//============================================================================================
function OnDblClick()
{
		var code_data=new Array()
	    var ctrl = Grid_Facilities.GetGridControl();
        code_data[0] = Grid_Facilities.GetGridData( ctrl.row , 0 );//pk
		code_data[1] = Grid_Facilities.GetGridData( ctrl.row , 1 );//code
		code_data[3] = Grid_Facilities.GetGridData( ctrl.row , 3 );//name
		window.returnValue = code_data; 
	   	this.close(); 	
}
</script>
<body>
<gw:data id="dso_Facilities"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7" function="sp_sel_kpbp00130" procedure="sp_upd_kpbp00130"   > 
            <input bind="Grid_Facilities">                    
                <input bind="txtFacilities" /> 
            </input> 
            <output bind="Grid_Facilities" /> 
        </dso> 
    </xml> 
</gw:data>  
<table style="width:100%;height:100%">
	<tr style="height:4%">
    	<td>
        	<fieldset style="padding:0">
            	<table width="100%" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td align="right" width="5%">Facilities&nbsp;</td>
                        <td width="45%"><gw:textbox id="txtFacilities" onenterkey="OnSearch()" styles='width:100%' /></td>
                        <td width="50%"></td>
                        <td ><gw:imgBtn id="ibtnUpdte" img="search" alt="Search" 	onclick="OnSearch()" 	 /></td>  
                        <td ><gw:imgBtn id="ibtUpdte" img="new" alt="New" 	onclick="OnNew()" 	 /></td>   
                        <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="save" 	onclick="OnSave()" 	 /></td>
                        <td ><gw:imgBtn id="ibUpde" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>    
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:96%">
    	<td width="100%">
            <gw:grid   
            id="Grid_Facilities"  
            header="_PK|Facility Code|Facility Name|Facility Name (ENG)|Facility Name (KOR)|Control Type|Modified By|Modified Date"   
            format  ="0|0|0|0|0|0|0|0"  
            aligns  ="0|0|0|0|0|0|0|0"  
            defaults="|||||||"  
            editcol ="0|1|1|1|1|1|0|0"  
            widths  ="0|2000|3000|3000|3000|1500|2000|1000"  
            styles="width:100%; height:100%"   
            sorting="T" 
            oncelldblclick="OnDblClick()"  
             /> 
        </td>
    </tr>
</table>

</body>
</html>
