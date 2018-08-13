<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>

<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString()); %>

<script>
var idAction;
function BodyInit()
{
    System.Translate(document); 
	var idCompany    = "<%=Request["Company"]%>";
    var idDsqlid  = "<%=Request["dsqlid"]%>";
	var idItemType    = "<%=Request["ItemType"]%>";
    var idItemValue    = "<%=Request["ItemValue"]%>";
	
	idAction    = "<%=Request["Action"]%>";
    
	if(idAction == "UPDATE")
	{
		lblNote.text = "Double click on row for select";
		btnSelect.SetEnable(false);
		btnSelectAll.SetEnable(false);
	}
	txtCompany.text = idCompany;
    txtItemType.text    = idItemType;
	txtItemValue.text    = idItemValue;
	
	OnSearch();
}

function OnSearch()
{
    dsoAccountT.Call("SELECT");
}

function OnCancel()
{
	window.returnValue = null; 
	this.close();
}

function SelectAll()
{
	for(i=1; i<idGrid.rows; i++)
	{
		idGrid.SetGridText( i, 0, "-1" );			
	}
}

function Select()
{
	
    if(idAction == "ADDNEW")
	{
		return;
	}
	
	var code_data=new Array()
	var ctrl = idGrid.GetGridControl();
	var rowNo
	index = 1;
	rowNo = 0;
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an account.");
        return ;
    }
    else
	{
		rowNo = ctrl.SelectedRow(0);
		code_data[code_data.length] = idGrid.GetGridData(rowNo, 0 );
		code_data[code_data.length] = idGrid.GetGridData( rowNo, 1 );
		code_data[code_data.length] = idGrid.GetGridData( rowNo, 2 );
		code_data[code_data.length] = idGrid.GetGridData( rowNo, 3 );
	}
	window.returnValue = code_data; 
	this.close(); 	
}

function SelectMulti()
{
    var code_data=new Array()
	
	if(idAction == "UPDATE")
	{
		return;
	}
	
	for(i=1; i<idGrid.rows; i++)
	{
		if(idGrid.GetGridData( i, 0 ) ==  -1  )
		{
			var tmp =new Array()
			tmp[tmp.length] = idGrid.GetGridData(i, 0 );
			tmp[tmp.length] = idGrid.GetGridData( i, 1 );
			tmp[tmp.length] = idGrid.GetGridData( i, 2 );
			tmp[tmp.length] = idGrid.GetGridData( i, 3 );
			code_data[code_data.length]= tmp;
		}			
	}
	
	window.returnValue = code_data; 
	this.close(); 	
}

</script>
<body>

<gw:data id="dsoAccountT"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid" function="<%=Request["dsqlid"]%>" > 
            <input bind="idGrid" > 
				<input bind="txtCompany"/> 
                <input bind="txtCode"/> 
                <input bind="txtName"/> 
                <input bind="txtItemType"/>
                <input bind="txtItemValue"/>
            </input> 
            <output bind="idGrid" /> 
        </dso> 
    </xml> 
</gw:data> 

<form id="form1" runat="server">
    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr> 
        <td width="100%" height="100%">
    	    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
            <tr >
	            <td > <fieldset style="padding: 5"><legend>Search infomation</legend>
                    <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
					<tr>
						<td width="25%" align="right"><b>Account Code&nbsp;&nbsp;</b></td>
						<td><gw:textbox id="txtCode" onenterkey="OnSearch()"/></td>
		            </tr>
		            <tr>
						<td width="25%" align="right"><b>Account Name&nbsp;&nbsp;</b></td>
						<td><gw:textbox id="txtName" onenterkey="OnSearch()"/></td>
					</tr>         
				    </table> </fieldset>
		        </td>
	    	</tr>
	    	<tr >
				<td>
					<table border="0" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td><fieldset style="padding: 5">
						    <table>
						    <tr>
								<td width="10%" align="left"><gw:icon id="btnSelectAll" img="in" text="Select All"      styles="width:100"  onclick="SelectAll()" /></td>
								<td><gw:label id="lblNote" text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" /></td>
								<td></td>
							    <td width="10%" align="right"><gw:icon id="btnSelect" img="in" text="Select"      styles="width:100"  onclick="SelectMulti()" /></td>
							    <td width="10%" align="right"><gw:icon id="btnCancel" img="in" text="EXIT"    styles="width:100"  onclick="OnCancel()" /></td> 
						    </tr>
						    </table>	</fieldset>
					    <td>	
					</tr>
					</table>
				</td>
			</tr>
		    <tr height="80%"> 
	    		<td>
	    			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
                    <tr>
			    	    <td height="80%">   
					        <gw:grid   
					            id="idGrid"  
					            header="Select|Account Code|Account Name|_PK"
					            format="3|0|0|0"
					            aligns="0|0|0|0"
					            defaults="|||"
					            editcol="0|0|0|0"
					            widths="1000|2000|3000|0"
					            styles="width:100%; height:100%"   
					            sorting="T"   
					            param="0,1,2,3"  
					            oncelldblclick="Select()" />
		                </td>
		            </tr>
		            </table>
            	<td>
	    	</tr>
		    </table>  
        </td>
	</tr>
    </table>
</form>

<gw:textbox id="txtItemType"              style="display:none"/>
<gw:textbox id="txtItemValue"              style="display:none"/>
<gw:textbox id="txtCompany"              style="display:none"/>

</body>
</html>