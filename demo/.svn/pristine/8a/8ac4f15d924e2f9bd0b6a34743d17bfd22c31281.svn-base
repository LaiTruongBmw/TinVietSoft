<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser("acnt")%>
<script>
function BodyInit()
{
        System.Translate(document);
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
		code_data[2] = Grid_Mst.GetGridData( ctrl.row , 2 );
		window.returnValue = code_data; 
	   	this.close(); 	
}    
</script>
<body>
 <gw:data id="dso_search" >
        <xml>
            <dso type="grid" function="acnt.sp_sel_kpbp00080_1" >
                <input bind="Grid_Mst">
                        <input bind="txtWorkDivision"/>
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
                                                        <td width="15%" align="right">Work Division&nbsp;</td> 
                                                        <td width="85%"><gw:textbox id="txtWorkDivision" onenterkey="OnSearch()" styles='width:100%' /></td> 
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
													            header="_PK|Division Code|Division Name"   
													            format  ="0|0|0"  
													            aligns  ="0|0|0"  
													            defaults="||"  
													            editcol ="0|0|0"  
													            widths  ="0|1500|3000"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "DblClick()" /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
