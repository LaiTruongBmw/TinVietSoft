<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Evaluation Group Entry</title>
</head>

<script>
var arrArea = "<%=CtlLib.SetGridColumnDataSQL("SELECT NAME ||'     '|| code||'-'||parent_code  cl1, NAME ||'     '|| code||'-'||parent_code cl2 FROM tco_commcode WHERE parent_code in (SELECT code FROM tco_commcode WHERE parent_code = 'POINT' and del_if = 0) ")%>";
function BodyInit()
{
    Binding();
	OnSearch();
}
function Binding()
{
	var data; 
	data = "<%=CtlLib.SetListDataSQL("SELECT replace(cl1,' ','') cl1, cl2 FROM (SELECT ' ' cl1, 'ALL' cl2 FROM DUAL union SELECT code, NAME FROM tco_commcode WHERE parent_code = 'POINT' and del_if = 0 ) a")%>";
	lstLocation.SetDataText(data);

    data ="#10;Empty|#20;Busy|#30;Damage"; 
    grdTableName.SetComboFormat(6,data);
    
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, code||'-'||NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 order by CODE")%>";
    grdTableName.SetComboFormat(1,data);
    
    grdTableName.SetComboFormat(2,arrArea);
}
function Grid_OnClick(){
    if(grdTableName.col != 2)return;
    if(grdTableName.GetGridData(grdTableName.row,grdTableName.col-1) == ""){
        alert("Please choose Location!"); return;
    }
    var arrNArea;
    var strNArea = "";
    if(arrArea.indexOf('|') != -1){
        arrNArea = arrArea.split("|");
        for(var idx = 0; idx < arrNArea.length; idx++)
            if(arrNArea[idx].indexOf(grdTableName.GetGridData(grdTableName.row,grdTableName.col-1)) != -1)
                strNArea += arrNArea[idx] + "|";
        strNArea = strNArea.substring(0,strNArea.length-1);
        grdTableName.SetComboFormat(2,strNArea);
    }
}
function OnSearch()
{
    dsoGroupEntry.Call("SELECT");
}
function OnDelete()
{
    grdTableName.DeleteRow();  
}
function OnNew()
{
    grdTableName.AddRow();
}
function OnSave()
{
    if(CheckDataIsValid())
    {          
        dsoGroupEntry.Call();    
    }
}
function OnUnDelete()
{
    grdTableName.UnDeleteRow();
}
function CheckDataIsValid()
{
    for(var i= 1;i<grdTableName.rows;i++)
    {
        if(grdTableName.GetGridData(i,1)=="")
        {
            alert("Please choose Location.");
            return false;
        }
        if(grdTableName.GetGridData(i,2).length == 5)
        {
            alert("Please choose Area.");
            return false;
        }
        if(grdTableName.GetGridData(i,3)=="")
        {
            alert("Please input Table Name.");
            return false;
        }
        if(Number(grdTableName.GetGridData(i,4)).toString() == "NaN"){
            alert("Please input number at row " + i + " of Column Position."); 
            return false;
        }else if (grdTableName.GetGridData(i,4).replace(/ /g, '').length == 0){
            alert("Please input number at row " + i + " of Column Position."); 
            return false;
        }else if(Number(grdTableName.GetGridData(i,4)) < 0 || Number(grdTableName.GetGridData(i,4)) > 142){
            alert("Start position from 0 to 142"); return false;
        }
    }
   return true;
}
</script>

<body bgcolor='#F5F8FF'>
    <gw:data id="dsoGroupEntry"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ht_sel_60290020" procedure="ht_upd_60290020">  
                <input bind="grdTableName">  
                    <input bind="txtName" />
                    <input bind="lstLocation" />
                </input> 
                <output bind="grdTableName" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                <tr style=" height: 2%">
                     <td>
                     <fieldset>
						<table style="width: 100%; height: 100%">
							<tr>
								<td width="15%" align="center">
									Table Name 
								</td>
								<td width="25%">
									<gw:textbox id="txtName" onenterkey="OnSearch()" />
								</td>
								<td width="15%" align="center">
									Location
								</td>
								<td width="20%">
									<gw:list id="lstLocation"  />
								</td>
								<td width="10%"></td>
								<td width="3%">
									<gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
								</td>
							</tr>
						</table>
                    </fieldset>
                </td>
                </tr>
                <tr style=" height: 98%">
                     <td>
                    <table style="width: 100%; height: 100%">
                            <tr style="height: 98%">
                        <td colspan="8">
                            <gw:grid id='grdTableName' header='_PK|Location|Area|Table Name|Position|Total Chairs|Status|Description|Active_YN'
                                format  ='0|0|0|0|0|0|0|0|3' 
                                aligns  ='0|0|0|0|1|1|1|0|0' 
                                editcol ='1|1|1|1|1|1|1|1|1'
                                defaults='||||||||' 
                                widths='1000|3500|2900|1500|1000|1090|800|4200|900'
                                onclick='Grid_OnClick();'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>  
                    </table>
                </td>
                </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
