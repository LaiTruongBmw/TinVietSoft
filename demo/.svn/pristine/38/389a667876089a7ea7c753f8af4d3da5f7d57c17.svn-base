<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POP UP HS CODE</title>
</head>
<script type="text/javascript" language="javascript">

function BodyInit()
{
	System.Translate(document);
	// init value
	
	detail.Call('SELECT');  
}
function DSOReceive( dsoinfo  )
{

	if ( dsoinfo.errno > 0 )
	{
		alert( dsoinfo.errmsg );
		return ;
	}
}
// filter data 
function searchOnClick()
{
	// ....here is your source code .................
}

function RowDbClick(flag)
{
	var aValue = new Array();
	 
	if(flag==0){//reset
	aValue[1] = "";
	aValue[2] = "";
	aValue[3] = "";
	}	
	else{	
	aValue[1] = idGrid.GetGridData( idGrid.row, 0);
	aValue[2] = idGrid.GetGridData( idGrid.row, 1);
	aValue[3] = idGrid.GetGridData( idGrid.row, 2);
	}
	window.returnValue = aValue; 
	window.close();
}

</script>
<body>
<!-- This is a public source code block --> 
<gw:data id="detail"  onreceive="" > 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="st_lg_sel_fpab00390" > 
                <input> 
                    <input bind="txtInput1" /> 
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
</gw:data> 
<!-- This is our html --------------------------------------------------  -->
<table class="table" border=0 cellpadding=0 cellspacing=0 width="100%" >
<tr>
	<td>
		<table class="table" border=0 cellpadding=0 cellspacing=0 width="100%" >
		<tr> <td width="15%">	  
			 Code Prefix: 				
			 </td>
			 <td width="20%">	  
			 <gw:textbox id="txtInput1"  text="" /> 				
			 </td>
			 <td width="49%" align="right"></td>  	
			  <td width="6%" align="right" ><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="detail.Call('SELECT')" /></td>					
	          <td width="6%" align="right"><gw:button id="btnClose" img="cancel" alt="Cancel" text="Cancel" onclick="RowDbClick(0)" /></td> 			 
		</tr>
		</table>	
	</td>	
</tr>
<tr>
	<td>
		<!-- This is Grid script -->
		<table class="table" border=0 cellpadding=0 cellspacing=0 width="100%" >
			<tr>
				<td colspan="3">
			        <gw:grid
                   id="idGrid"
                   header="_PK|Code|Name"
                   format="0|0|0"
                   aligns="0|0|0"
                   defaults="||"
                   editcol="0|0|0"
                   widths="0|2000|0"
                   styles="width:100%; height:400"
                   sorting="F"
                   oncelldblclick="RowDbClick()"
                   param="0,1,2"  />
				</td>
			</tr> 
		</table>	
	</td>	
</tr>
</table>

</body>
</html>




