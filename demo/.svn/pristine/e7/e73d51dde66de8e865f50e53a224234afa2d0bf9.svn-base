<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Main Manual</title>
  </head>
  
 <%  ESysLib.SetUser(Session("APP_DBUSER"))%>
 
 <script>
var userID = "<%=Session("USER_PK")%>";

function BodyInit()
{
    txtUserPK.text = userID; 
    OnSearch();
}

function OnSearch()
{
    dsoMenuTree.Call("SELECT");
}

function OnGetData()
{
    idFrame.document.location.href = "/gasp/system/Manual.aspx?url=/gasp/" + grdMST.GetGridData(grdMST.row, 5).replace("form","manual");
}
function MenuClick()
{
	var node = idMenu.GetCurrentNode();
    

	//alert(node.img); 		 
	if ( node == null ) return;
	
	if ( node.oid != "0" )
	{
		idFrame.document.location.href = "/gasp/system/Manual.aspx?url=/gasp/" + node.oid.replace("form","manual");
	}
	
}
function OnDataReceive(dso){

}
</script>

<body>

<gw:data id="dsoMenuTree"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="tree" function="comm_sel_user_manual" > 
                <input bind="idMenu" > 
                   <input bind="txtUserPK" />
                </input> 
                <output bind="idMenu" /> 
            </dso> 
        </xml> 
</gw:data> 
<!--
  <gw:data id="grd_sp_sel_user_manual"  > 
    <xml> 
        <dso id="1" type="grid" parameter="0,1" function="comm.sp_sel_user_manual"> 
            <input bind="grdMST"  > 
                <input bind="txtUserPK" />
                <input bind="txtForm" />
            </input> 
            <output bind="grdMST" /> 
        </dso>             
    </xml> 
</gw:data> 
-->
<!------------------------------------------------------------------------------------------->

<table  width="100%" height="100%" cellpadding="0" cellspacing="0" border="1" align="center">
	<tr>
		<td width="25%" valign="top">
             <gw:tree id="idMenu" style="width:100%; height:500;overflow:auto;" onclicknode="MenuClick()"/>
                       
		</td>
		<td width="75%" valign="top">
		    <iframe id="idFrame" frameborder="0" style="width:100%; height: 100%"></iframe>
		</td>
	</tr>
</table>
<gw:textbox id="txtUserPK" text="" style="Display:None" />					
</body>
</html>
