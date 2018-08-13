<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
//var g_compk = "";
function BodyInit()
{
   var g_compk    = "<%=Request.querystring("compk")%>";   
   //alert(g_compk);
    
    txtcompk.text = g_compk;
	OnSearch();
}
function OnSearch()
{
    dsoAccountT.Call("SELECT");
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	window.returnValue = code_data; 
	this.close();
}
function Select()
{
	
	var code_data=new Array()
	var ctrl = idGrid.GetGridControl();
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an account.");
        return ;
    }
    else
	{
        //code
        code_data[0] = idGrid.GetGridData( idGrid.row , 0 );
        //code nm
        code_data[1] = idGrid.GetGridData( idGrid.row , 1 );
		//pk
    	code_data[3] = idGrid.GetGridData( idGrid.row , 3 );
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
}



</script>
<body>

<gw:data id="dsoAccountT" > 
    <xml> 
        <dso id="1" type="grid" function="AC_SEL_60010080_popup_Onnew" > 
            <input bind="idGrid" > 
                <input bind="txtCode"/> 
                <input bind="txtName"/> 
                <input bind="txtUpperAccount"/> 
                <input bind="txtleaf_yn"/> 
                <input bind="txtuse_yn"/> 
                <input bind="txtcompk"/> 
                <input bind="txtlang"/> 
            </input> 
            <output bind="idGrid" /> 
        </dso> 
    </xml> 
</gw:data> 

    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr> 
        <td width="100%" height="100%">
    	    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
            <tr height="15%">
	            <td > 
                    <table  width="100%" height="100%" border="0">
					<tr>
						<td width="25%" align="right">Account Code</td>
						<td><gw:textbox id="txtCode" styles="width:90%;height:20" onenterkey="OnSearch()"/></td>
		            </tr>
		            <tr>
						<td width="25%" align="right">Account Name</td>
						<td><gw:textbox id="txtName" styles="width:90%;height:20" onenterkey="OnSearch()"/></td>
					</tr>  
		            
					<tr>
						<td width="25%" align="right">Upper Account Name</td>
						<td><gw:textbox id="txtUpperAccount" styles="width:90%;height:20" onenterkey="OnSearch()"/></td>
						
					</tr>	        
				    </table>
		        </td>
	    	</tr>

	    	<tr height="80%"> 
	    		<td>
	    			<table  width="100%" height="100%" border="0">
                    <tr>
			    	    <td height="80%">   
					        <div style="width:100%; height:94%; overflow:auto;">
					<gw:datagrid    
					            id="idGrid"  
					            header="Account Code|Account Name|Upper Account Name|_PK|_value|_|_|_|_"
					            format="0|0|0|0|0|0|0|0|0"
					            aligns="0|0|0|0|0|0|0|0|0"  
					            defaults="||||||||"  
					            editcol="0|0|0|0|0|0|0|0|0"  
					            widths="150|250|250|0|0|0|0|0|0"  
					            styles="width:100%; height:100%"   
					            sorting="T"   
                                paging="true" pageview="20"
					            param="0,1,2,3,4,5,6,7,8"  
					            oncelldblclick="Select()" />
                                </div>
		                </td>
		            </tr>
		            </table>
            	</td>
	    	</tr>

		    <tr height="5">
				<td>
					<table border="0"  width="100%" height="100%" >
					<tr align="center"> 
					    <td>
						    <table>
						    <tr>
							    <td><gw:icon id="btnSelect" img="in" text="OK"      styles="width:100"  onclick="Select()" /></td>
							    <td><gw:icon id="btnCancel" img="in" text="EXIT"    styles="width:100"  onclick="OnCancel()" /></td> 
						    </tr>
						    </table>	
					    </td>	
					</tr>
					</table>
				</td>
			</tr>
		    </table>  
        </td>
	</tr>
    </table>

 
 <gw:textbox id="txtcompk"  text=""  styles='display:none'  />
 <gw:textbox id="txtlang"  text=""  styles='display:none'  />
 <gw:textbox id="txtleaf_yn"  text=""  styles='display:none'  />
 <gw:textbox id="txtuse_yn"  text=""  styles='display:none'  />
</body>
</html>