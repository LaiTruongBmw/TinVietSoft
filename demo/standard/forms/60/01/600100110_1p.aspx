<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  CtlLib.SetUser("acnt")%>
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
        code_data[0] = Grid_Mst.GetGridData( ctrl.row , 0 ); //pk
		code_data[1] = Grid_Mst.GetGridData( ctrl.row , 2 );// Project Code
		code_data[2] = Grid_Mst.GetGridData( ctrl.row , 3 ); //3.Project Name
		window.returnValue = code_data; 
	   	this.close(); 	
}    
</script>
<body>
 <gw:data id="dso_search" >
        <xml>
            <dso type="grid" function="acnt.sp_sel_gfac00100_1p" >
                <input bind="Grid_Mst">
                        <input bind="txtProject"/>
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
                                                        <td width="10%" align="right">Project&nbsp;</td> 
                                                        <td width="90%"><gw:textbox id="txtProject" onenterkey="OnSearch()" styles='width:100%' /></td> 
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
					   <!--0_PK|1.No|2.Project Code|3.Project Name|4.Representative Customer|5.Starting Date|6.End Date-->
                       <td width="100%">
						   <gw:grid   
							id="Grid_Mst"  
							header="_PK|No|Company ID|Company Name"   
							format  ="0|0|0|0"  
							aligns  ="2|2|2|2"  
							defaults="|||"  
							editcol ="0|0|0|0"  
							widths  ="0|800|1500|2500"  
							styles="width:100%; height:100%"   
							sorting="T"   
							acceptNullDate
							oncelldblclick= "DblClick()" /> 
				      </td>
                    </tr>
                </table>
</body>
</html>
