<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Inquiry Dimension</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var flag='search';
//------------------------------------------------------------------
function BodyInit() {
    System.Translate(document);
}
function OnNew()
{
	Grid1.AddRow();
	
}
//---------------------------------------------------------------------    
function OnSearch(idx)
{
	switch(idx)
	{
		case 0:
		 flag='search';
         dso_kpac00070.Call("SELECT");
        break;
    }
}   
function onDelete()
{
	 if(confirm("Do you want to delete selected row ?"))
	 {
		Grid1.DeleteRow();
		dso_kpac00070.Call();
     }
}
//-------------------------------------------------------------
function onSave()
{
		dso_kpac00070.Call();
}
//======================================================================
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case "dso_kpac00070":
		  
		break;
	}
}

//--------------------------------------------------------------
function OnSelect() {
    var code_data = new Array()
    var ctrl = Grid1.GetGridControl();
    code_data[0] = Grid1.GetGridData(ctrl.row, 0); //pk
    code_data[1] = Grid1.GetGridData(ctrl.row, 1); //code
    code_data[2] = Grid1.GetGridData(ctrl.row, 2); //pk
    window.returnValue = code_data;
    this.close(); 	
}
</script>
<body>
<gw:data id="dso_kpac00070" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  parameter="0,1,2,3,4,5,6"  function="pm_sel_61010030"  procedure="pm_upd_61010030">
                <input bind="Grid1">
                   <input bind="txtCode" />
                </input>
                <output bind="Grid1"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------->
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
	<tr style="height:2%">
	  <td >
		<fieldset style="padding:0"> 
		  <table cellpadding="0" cellspacing="0" width="100%" >
			<tr>
			   <td width="10%" align="right">Code&nbsp;</td>
               <td width="40%"><gw:textbox id="txtCode" onenterkey="OnSearch(0)" styles='width:100%' /></td>
			   <td width="50%"></td> 
			   <td align="right"><gw:imgbtn id="btInquiry" img="search" alt="Inquiry"  onclick="OnSearch(0)" /></td> 
			   <td align="right"><gw:imgbtn id="btIncreaseversion" img="new" alt="New"  onclick="OnNew()" /></td>
			   <td align="right"><gw:imgbtn id="btSave" img="save" alt="Save"  onclick="onSave()" /></td> 
			   <td align="right"><gw:imgbtn id="btDelete" img="delete" alt="Delete"  onclick="onDelete()" /></td>
			 </tr>
			</table> 
		</fieldset>
	  </td>  
	</tr>
	<tr style="height:98%">
	    <!--0_pk|1.Reversion No|2.Main Contract Date|3.Starting Date|4.End Date|5.Main Contract Amount|6.Integrated Unit Price (Y/N)|	7.Remark|8.Confirm Y/N|9._project_pk|10._status-->
		<td>
			<gw:grid   
				id="Grid1"  
				header="_pk|Code|Name|Local Name|Korean Name|Description|Use Y/N"   
				format  ="0|0|0|0|0|0|3"  
				aligns  ="0|0|0|0|0|0|1"  
				defaults="||||||-1"  
				editcol ="1|1|1|1|1|1|1"  
				widths  ="0|1500|2500|2500|2500|4000|0"  
				styles="width:100%; height:100%"   
				sorting="T"   
				oncelldblclick="OnSelect()"
			 /> 
		</td>
	</tr> 
</table>  
 <!--------------------------------------------------------------------------->
    <gw:textbox id="txt_tps_prjconversion_pk" styles='display:none;width:100%' />
    <gw:textbox id="txtexrate_dt" styles='display:none;width:100%' />
	<gw:textbox id="txtccy" styles='display:none;width:100%' />
	<gw:textbox id="txtexrate" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->
</body>

</html>
