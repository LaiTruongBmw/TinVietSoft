<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Inquiry Dimension</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);
  OnSearch();
}
//-------------------------------------------
function OnSearch()
{
    
	dso_Facilities.Call("SELECT");
}

//-------------------------------------------
function OnSelect()
{
    
    var code_data=new Array()
	var ctrl = idgrid.GetGridControl();
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an code.");
        return ;
    }
    else
	{
        
        code_data[1] = idgrid.GetGridData( ctrl.row , 1 );
		code_data[2] = idgrid.GetGridData( ctrl.row , 2 );
		code_data[3] = idgrid.GetGridData( ctrl.row , 3 );
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
    
}

</script>
<body  >
<gw:data id="dso_Facilities"   > 
        <xml> 
            <dso id="1" type="grid" function="pm_sel_61020030_popup"  > 
                <input>
                    <input bind="txtFacilities" /> 
                </input> 
                <output bind="idgrid" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
  <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
              <fieldset style="padding: 2; width: 100%; height: 100%">
				<table border="0" width="100%" id="table2">
					<tr>
						<td align="right" width="27%">Facility Code</td>
						<td width="73%"><gw:textbox id="txtFacilities" onenterkey="OnSearch()" text="" styles="width:100%" /></td>
					   <td><gw:imgbtn id="btnSearch1" img="search" width="100%" alt="Search" onclick="OnSearch()"/></td>
						<td><gw:imgbtn id="btnSearch3" img="select" width="100%" alt="Select" onclick="OnSelect()" /></td>
					</tr>
				</table>
			  </fieldset>
			</td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
               <gw:grid id="idgrid" header="No|_pk|Facility Code|Facility Name"
				format="0|0|0|0" 
				aligns="1|1|0|0" 
				defaults="||||" 
				editcol="0|0|0|0"
				widths="500|0|2500|3000" 
				styles="width:100%; height:100%"
				sorting="T"  oncelldblclick="OnSelect()"/>
                   
            </td>
        </tr>
    </table>

<gw:textbox id="iduser_pk" styles="display:none; " />
</body>
</html>
