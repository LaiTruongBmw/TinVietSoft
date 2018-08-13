<!--	#include	file="../../../system/lib/form.inc"	-->
<html	xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>OQC Result Checking Popup</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var	arr_FormatNumber	=	new	Array();		
//---------------------------------------------------------------------	

function	OnToggle()
{
	var	left	=	document.all("left");	
	var	right	=	document.all("right");	
	var	imgArrow	=	document.all("imgArrow");	

	if(imgArrow.status	==	"expand"){
	left.style.display="none";
	imgArrow.status	=	"collapse";
	right.style.width="100%";
	imgArrow.src	=	"../../../system/images/button/next.gif";
	}
	else{
	left.style.display="";
	imgArrow.status	=	"expand";
	right.style.width="75%";
	imgArrow.src	=	"../../../system/images/button/previous.gif";
	}
}

//-------------------------------------------------------------------

function	BodyInit()
{
	txtUser_PK.text	= "<%=session("USER_PK")%>";	
	//----------------------------------	

	//-------------------------

	//----------------------------------
	txtPP_ORDPLAN_PK.text = "<%=Request.querystring("pp_ordplan_pk")%>";
	txtPT_COMPONENT_PK.text = "<%=Request.querystring("pt_component_pk")%>";
	lblPO.text = "<%=Request.querystring("po_name")%>";
	lblStyle.text = "<%=Request.querystring("style")%>";
	lblComp.text = "<%=Request.querystring("component")%>";
	OnSearch('grdSearch');
}
//---------------------------------------------------------------------	
	function	BindingDataList()
	{	
		
	}
	//---------------------------------------------------------------------------------------------------
	function	SetGridFormat()
	{
	}
	//===================================================================
function	OnSearch(pos)
{
	switch(pos)
	{		
		case 'grdSearch':
			fpfo00051.Call('SELECT');
		break;	
	}
}
//======================================================================
function	OnDataReceive(obj)
{
	switch(obj.id)
	{
		  	
	}
}

//======================================================================
</script>

<html>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpfo00051" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1" function="<%=l_user%>lg_sel_fpfo00051" > 
                <input> 
                    <input bind="txtPP_ORDPLAN_PK" /> 
					<input bind="txtPT_COMPONENT_PK" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------->
	<table	style="width:	100%;	height:	100%"	border="1">
		<tr>			
			<td	id="right"	style="width:100%">
				<table	style="width:	100%;	height:	100%"	border="0">	
					<tr style="height:1%">
						<td style="width: 5%; white-space:nowrap">
							P/O:
						</td>
						<td style="white-space:nowrap">
							<gw:label id="lblPO" styles='width:45%;color:cc0000;font:9pt' />
						</td>
						<td style="width: 5%; white-space:nowrap">
							Style:
						</td>
						<td style="white-space:nowrap">
							<gw:label id="lblStyle" styles='width:45%;color:cc0000;font:9pt' />
						</td>
					</tr>
					<tr style="height:1%">
						<td style="width: 5%; white-space:nowrap">
							Comp:
						</td>
						<td colspan="4"  style="white-space:nowrap">
							<gw:label id="lblComp" styles='width:45%;color:cc0000;font:9pt' />
						</td>
					</tr>
					<tr	style="height:	97%">
						<td	align="right" colspan="4">
						<gw:grid id='grdSearch'
						header='Defect ID|Defect Name|Def Qty'
						format='0|0|1'
						aligns='0|0|0'
						check='||'
						editcol='1|1|1'
						widths='1000|5500|1000'
						sorting='T'
						styles='width:100%; height:100%'
						/>
						</td>						
					</tr>			
				</table>
			</td>
		</tr>
	</table>
	<!--------------------------------------------------------------------------->
	<gw:textbox	id="txtPP_ORDPLAN_PK"	styles="width:	100%;display:	none"	/>
	<gw:textbox	id="txtPT_COMPONENT_PK"	styles="width:	100%;display:	none"	/>
	<gw:textbox	id="txtReturnValue"	styles="width:	100%;display:	none"	/>
	<!--------------------------------------------------------------------------->
	<gw:textbox	id="txtUser_PK"	styles="width:	100%;display:	none"	/>
	<gw:textbox	id="txtDefect"	styles="width:	100%;display:	none"	/>
	 <!------------------------------------------------------------------> 
</body>
</html>
