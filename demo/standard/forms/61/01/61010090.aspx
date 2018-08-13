<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Size Code Entry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
        System.Translate(document);
		var UOM = "<%=ESysLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tlg_it_uom a where del_if=0" ) %> "; 
     	Grid_Mst.SetComboFormat(4,UOM);
		<%=ESysLib.SetGridColumnComboFormat("Grid_Mst", 5,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0190' AND A.USE_IF = 1 ORDER BY A.CODE")%>; 
	    OnSearch();
} 
//==============================================================================================  
function OnSearch()
{
        dso_search.Call("SELECT");
} 
//==============================================================================================  
function DblClick()
{
        var code_data=new Array()
	    var ctrl = Grid_Mst.GetGridControl();
        code_data[0] = Grid_Mst.GetGridData( ctrl.row , 0 );//pk
		code_data[1] = Grid_Mst.GetGridData( ctrl.row , 1 );//code
		code_data[2] = Grid_Mst.GetGridData( ctrl.row , 2 );//name
		window.returnValue = code_data; 
	   	this.close(); 	
}   
//==============================================================================================  
function OnPopUp()
{
	var fpath = System.RootURL + "/form/61/01/61010090_popup.aspx";
	var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	if(aValue != null)
	{
			txtFacility_Pk.text = aValue[0];
			txtFacility_Cd.text = aValue[1];
			txtFacility_Nm.text = aValue[3]; 
	} 	
} 
//==============================================================================================  
function OnNew()
{
		if(txtFacility_Pk.text=='')
		{
			alert('Please select Facility first !!');	
		}
		else
		{
				Grid_Mst.AddRow();
				Grid_Mst.SetGridText(Grid_Mst.rows-1, 1, txtFacility_Cd.text);
				Grid_Mst.SetGridText(Grid_Mst.rows-1, 8, txtFacility_Pk.text);
		} 	
}
//==============================================================================================  
function OnSave()
{
	dso_Update.Call();
}
//==============================================================================================  
function OnDelete()
{
	Grid_Mst.DeleteRow();	
}
//==============================================================================================  
function OnSearch()
{
	dso_Update.Call('SELECT');	
}
</script>
<body>
 <gw:data id="dso_Update"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8" function="pm_sel_61010090" procedure="pm_upd_61010090"   > 
            <input bind="Grid_Mst">                    
                <input bind="txtFacility_Pk" /> 
            </input> 
            <output bind="Grid_Mst" /> 
        </dso> 
    </xml> 
</gw:data>  
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                        <td width="10%" align="right"><a href="#" title="Click here to show Facility Code" style="text-decoration:none" onClick="OnPopUp()">Facility Code&nbsp;</a></td> 
                                                        <td width="40%">
                                                        	<table style="width:100%" cellpadding="0" cellspacing="0">
                                                            	<tr>
                                                                	<td width="40%"><gw:textbox id="txtFacility_Cd" readonly="true"  styles='width:100%' /></td>
                                                                    <td width="60%"><gw:textbox id="txtFacility_Nm" readonly="true"  styles='width:100%' /></td>
                                                                    <td><gw:textbox id="txtFacility_Pk" readonly="true"  styles='width:100%;display:none' /></td>
                                                                    <td ><gw:imgbtn id="bve2" img="reset" alt="Reset"  onclick="txtFacility_Cd.text='';txtFacility_Nm.text='';txtFacility_Pk.text='';" /></td>
                                                                </tr>
                                                            </table>
                                                        </td> 
                                                        <td width="50%"></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:imgbtn id="btve2" img="new" alt="New"  onclick="OnNew()" /></td>
                                                        <td ><gw:imgbtn id="btvhe2" img="save" alt="Save"  onclick="OnSave()" /></td>
                                                        <td ><gw:imgbtn id="btuve2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
								                    <gw:grid   
													            id="Grid_Mst"  
													            header="_PK|Facility Code|Dimension Code|Dimension Name|UOM|Data Type|Modified By|Modified Date|_Facility_pk"   
													            format  ="0|0|0|0|0|0|0|0|0"  
													            aligns  ="0|0|0|0|0|0|0|0|0"  
													            defaults="||||||||"  
													            editcol ="0|1|1|1|1|1|0|0|0"  
													            widths  ="0|1500|1500|2000|1500|1500|2000|1500|0"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													             /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
