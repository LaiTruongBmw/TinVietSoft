<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>

<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PL popup</title>
</head>


<script>

function BodyInit()
{
    	lstCompany.SetDataText("<%=CtlLib.SetListDataSQL("select PK,PARTNER_NAME from TCO_COMPANY where DEL_IF = 0 AND ACTIVE_YN='Y'")%>");
  		txtCompany.text =lstCompany.value ;
		
  
	OnSearch();
}

function OnSearch()
{
  	idData_Dsql.Call("SELECT");
}

function Select()
{
	var code_data=new Array();
	var ctrl = idGrid.GetGridControl();
	if(ctrl.SelectedRows == 0)
	{
	   alert("Please Select an Item.");
	   return ;
	}
	else
	{
		//code
		code_data[0] = idGrid.GetGridData( ctrl.row , 0 );
		//code name
		code_data[1] = idGrid.GetGridData( ctrl.row , 1 );
		// value1 --> PK
		code_data[2] = idGrid.GetGridData( ctrl.row , 2 );
		
		//code_data[7] = idGrid.GetGridData( ctrl.row , 7 );	
		window.returnValue = code_data;
		this.close();
	}
}

function OnCancel()
{
	var code_data=new Array()
	    code_data[0] = 0;
		window.returnValue = code_data; 
		this.close();
}
</script>
<body>

    <gw:data id="idData_Dsql" onreceive="" >
        <xml>
            <dso type="grid" parameter="0,1" function="ac_sel_60170001_pl_popup">
                <input bind="idGrid" >
                    <input bind="idcode"/>
					<input bind="txtCompany"/>
                </input>
                <output bind="idGrid" />
            </dso>
        </xml>
    </gw:data>
    
<table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
  <tr> 
    <td width="100%" height="100%">
    	<table width="100%" height="100%" cellpadding=0 cellspacing=0 border=1>
            <tr height="5%">
	          		<td  width="10%" align="right"><b><gw:label id="idcode1" styles="width:100%;" text ="Search"/></b></td>
					<td width="80%"><gw:textbox id="idcode" styles="width:100%" onenterkey="OnSearch()"/></td>							
					<td  width="10%" align="right"> <gw:imgbtn id="btnSearch" text="Search" alt="Search" img="search" onclick="OnSearch()" /></td>
		                
	    	</tr>
	    	<tr height="90%"> 
	    		<td colspan='3'>
	    			<table class="table" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
	    				<tr>
					    	<td class="itable_content" height="80%">   
							<gw:grid   
							    id="idGrid"  
							    header="_PK|PL Code|PL Name"
							    format="0|0|0"  
							    aligns="0|0|0"  
							    defaults="||"  
							    editcol="0|0|0"
							    widths="0|2000|2500"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2"
								oncelldblclick="Select()"		/> 					    		    
				            </td>
		            	</tr>
		            </table>
            	<td>
	    	</tr>
	    	
		    <tr height="5%">
				<td colspan = 3>
			    <table class="table" border=1 CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td>
					    	<table>
					    	    <tr>
									<td> 
									<gw:icon id="idBtnSelect" img="in" text="OK" styles="width:100"  onclick="Select()" />  
									</td> 
									<td> 
									<gw:icon id="idBtnSelect2" img="in" text="EXIT" styles="width:100"  onclick="OnCancel()" />  
									</td> 
								</tr>
							</table>	
						<td>	
					</tr>
				</table>
				</td>
			</tr>
	
		</table>  
		
    </td>
	</tr>
</table>
<gw:textbox id="txtCompany" styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtItem"    styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtVal"     styles="width:100%;height:25" style="display:none"/>
<gw:list id="lstCompany" styles="width:100%" />
</body>

</html>
