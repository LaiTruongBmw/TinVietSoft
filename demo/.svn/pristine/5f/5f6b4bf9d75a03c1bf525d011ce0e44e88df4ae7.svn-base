<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Version PopUp</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
        System.Translate(document);
        var   _txtProject_Pk = "<%=Request.querystring("Project_Pk")%>";  
        txtProject_Pk.SetDataText(_txtProject_Pk); 
	    OnSearch();
}
function OnSearch()
{
        dso_search.Call("SELECT");
}   
function DblClick()
{
        var code_data=new Array()
	    var ctrl = Grid_Mst.GetGridControl();
	    
        code_data[0] = Grid_Mst.GetGridData( ctrl.row , 0 );
		code_data[1] = Grid_Mst.GetGridData( ctrl.row , 1 );
		
		window.returnValue = code_data; 
	   	this.close(); 	
}    
</script>
<body>
 <gw:data id="dso_search" >
        <xml>
            <dso type="grid" function="pm_sel_61030030_3" >
                <input bind="Grid_Mst">
                        <input bind="txtVersion"/>
                        <input bind="chkConfirm"/> 
                        <input bind="txtProject_Pk"/>  
                </input>
                <output bind="Grid_Mst"/>
            </dso>
        </xml>
    </gw:data>
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                        <td width="10%" align="right">Version&nbsp;</td> 
                                                        <td width="75%"><gw:textbox id="txtVersion" onenterkey="OnSearch()" styles='width:100%' /></td> 
                                                        <td width="" style="display:none"><gw:checkbox id="chkConfirm" onchange="OnSearch()" value="Y" defaultvalue="Y|N" /></td> 
                                                        <td width="15%" align="left" style="display:none">Confirm&nbsp;</td> 
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
								                    <gw:grid   
													            id="Grid_Mst"  
													            header="_PK|Version No"   
													            format  ="0|0"  
													            aligns  ="0|0"  
													            defaults="|"  
													            editcol ="0|0"  
													            widths  ="0|1500"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "DblClick()" /> 
										        </td>
                    </tr>
                </table>
<gw:textbox id="txtProject_Pk"  text="" style="display:none" />      

</body>
</html>
