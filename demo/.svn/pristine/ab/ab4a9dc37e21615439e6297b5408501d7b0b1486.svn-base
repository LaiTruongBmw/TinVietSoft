<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
var user_id = "<%=Session("LOGIN_ID")%>"; 
function BodyInit()
{
    System.Translate(document);
    var idCommNm  = "";
    var idCommCd  = "";
    var idDsqlid  = "";
    var idCommNm2 = "";
    var idval1    = "";
    var idval2    = "";
    var idval3    = "";
  	txtCode.text  = idCommCd ;
	txtName.text  = idCommNm ;
	txtName2.text = idCommNm2;
	txt_val1.text = idval1;
	txt_val2.text = idval2;
	txt_val3.text = idval3;
	txt_val4.text = v_language;
	txt_userid.SetDataText(user_id);

	var col_code = "";
    var col_nm   = "";
	    
	idcode1.SetDataText(col_code);
	idname1.SetDataText(col_nm);
	
	txtType.text = "<%=Request.querystring("p_type")%>";
	if (idcode1.text == "") 
	{
    	idcode1.SetDataText("Account Code&nbsp;&nbsp;");
    }
    if (idname1.text == "")  
    {
    	idname1.SetDataText("Account Name&nbsp;&nbsp;");
    }
	OnSearch();
}
function OnSearch()
{
    dsoAccountT.Call("SELECT");
}

function OnCancel()
{
	var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0;
	tmp[1]       = 0;
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
	
}

function Selects()
{
	var aValue = new Array();

	for(i = 1; i < idGrid.rows; i++)
    {
		if(idGrid.GetGridData(i, 2) == "-1")
		{
			var tmp = new Array();
			for(j = 0; j < idGrid.cols; j++)
            {
				tmp[tmp.length] = idGrid.GetGridData(i, j);
			}
			aValue[aValue.length] = tmp;
		}
    }

	window.returnValue = aValue; 
	window.close(); 
}

function Select()
{
	var aValue = new Array();
	var ctrl = idGrid.GetGridControl();
	tmp= new Array();
	for(j=0;j<idGrid.cols;j++)
	{
		tmp[tmp.length] = idGrid.GetGridData(ctrl.row,j);
	}
	aValue[aValue.length]=tmp; 

	window.returnValue = aValue;
	window.close(); 
}

function OnCheck()
{
    for(i = 1; i < idGrid.rows; i++)
    {
        if(idGrid.GetGridData(i, 0) == "-1")
        {
            idGrid.SetGridText(i, 0,0);
            btnCheck.text = "Chk All";
        }
        else
        {
            idGrid.SetGridText(i, 0, -1);
            btnCheck.text = "Un Chk";
        }
    }
}

</script>

<body>
<gw:data id="dsoAccountT"  onreceive="" > 
	<xml> 
	   <dso type="grid" function="<%=Request.querystring("dsqlid")%>"> 
			  <input bind="idGrid" > 
				<input bind="txtCode"/> 
				<input bind="txtName"/>
				<input bind="txtType"/>
			  </input> 
			<output bind="idGrid" /> 
		</dso> 
	</xml> 
</gw:data>

<form id="form1" runat="server">
<table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr height="10%">
		<td > 
		 <fieldset style="width: 100%; height: 100%; padding: 2">
			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
			<tr>
				<td width="25%" align="right"><b><gw:label id="idcode1" styles="width:100%;height:" text =""/></b></td>
				<td width="70%"><gw:textbox id="txtCode" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
				<td width="5%"></td>
			</tr>
			<tr>
				<td width="25%" align="right"><b><gw:label id="idname1" styles="width:100%;height:" onenterkey="OnSearch()" text =""/></b></td>
				<td width="70%"><gw:textbox id="txtName" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
				<td width="5%" align="left" style="display:none"><gw:icon id="btnCheck" img="in" text="Chk All" onclick="OnCheck()"/></td>
			</tr>  
			</table>
		 </fieldset>
		</td>
	</tr>
	<tr height="85%"> 
		<td>
			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
				<tr>
					<td height="80%">   
					<gw:grid   
						id="idGrid"  
						header  ="_CHK|_PK|Account Code|Account Code|_PK_LOCAL|Local Account|Local Name"
						format  ="3|0|0|0|0|0|0"
						aligns  ="1|0|0|0|0|0|0"
						defaults="||||||"
						editcol ="0|0|0|0|0|0|0"
						widths  ="500|0|1500|3500|0|1500|3500"
						styles  ="width:100%; height:100%"   
						sorting ="T"   
						oncelldblclick="Select()" />
					</td>
				</tr>
			</table>
		<td>
	</tr>
	<tr height="5%">
		<td>
			<table border=0 CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
				<tr align="center"> 
					<td>
						<table>
							<tr>
								<td><gw:icon id="btnSelect" img="in" text="OK" styles="width:100;display:none"  onclick="Selects()" /></td>
								<td><gw:icon id="btnCancel" img="in" text="EXIT" styles="width:100;display:none"  onclick="OnCancel()" /></td> 
							</tr>
						</table>	
					<td>	
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

<gw:textbox id="txt_val1"   text="" styles="display:none" />
<gw:textbox id="txt_val2"   text="" styles="display:none" />
<gw:textbox id="txt_val3"   text="" styles="display:none" />
<gw:textbox id="txt_val4"   text="" styles="display:none" />
<gw:textbox id="txtName2"   text="" styles="display:none" />
<gw:textbox id="txt_userid"   text="" styles="display:none" />
<gw:textbox id="txtType"   text="" styles="display:none" />
</body>
</html>
