<!-- #include file="../../lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<script type="text/javascript" language="javascript">
var sStatus =0;

function BodyInit()
{
    grdMenu.GetGridControl().FrozenCols = 4;
    grdMenu.SetComboFormat(11 , "<%=CtlLib.SetGridColumnDataSQL("select null as code, null as name  from dual union all select * from (select code, code ||'-'||name from ctl.tes_sector order by ord) ")%>");
    grdMenu.SetComboFormat(12 , "<%=CtlLib.SetGridColumnDataSQL("select null as code, null as name  from dual union all select * from (select version_no, version_no ||'-'||name from ctl.tes_version order by ord) ")%>");
    dsoMenuTree.Call("SELECT");
}

function OnNewItemBtnClick( bFolder )
{
	MenuEntry.StatusInsert();
	var node = idMenu.GetCurrentNode();

// node.img = 1 la item 
// mode.img = 0 la folder    
	if ( node == null ) return;
	
	if ( node.img == 1 ) 
	{
		node = idMenu.GetParentNode( node );
	}
	
	idParentID.text = node.oid;

	//OnNew();
	sStatus = 2;
	
	if ( bFolder )
	{
		
		idType.text = "M";
		idImage.text = "images/iconFolderClosed.png";
	} else
	{
		
		idType.text = "I";
		idUrl.text = "form/.../.../filename"
		idImage.text = "images/iconAutoForm.png";
	}
	
	SetIconState();
	
}

function  SetIconState( )
{
	var bDisabled = ( sStatus == 0 );
	
	idBtnModify.SetEnable(!  bDisabled );
	idBtnDelete.SetEnable(! ( sStatus == 0 || sStatus == 2 ));
	
	if ( idType.text == "M" )
	 	idUrl.style.display = "none";
	else
		idUrl.style.display = "";
	
}

function FileClick()
{
	var node = idFile.GetCurrentNode();

	if ( sStatus == 0 ) return;
	if ( node == null ) return;
	
	
	if ( node.item == "FILE" )
	{

		var path = node.oid;
	
		path =  path.substr( idDir.text.length + 1 , path.length - idDir.text.length - 1 );
        		
		re = /\\/g; 
	   	path = path.replace(re, "/");    
		
		idUrl.text = path;
	}		

}
var node;

function MenuClick()
{
	node = idMenu.GetCurrentNode();
    
	idBtnMenuFolderAdd.SetEnable( false );
	idBtnMenuAdd.SetEnable ( false);

	//alert(node.img); 		 
	if ( node == null ) return;
	
	if ( node.oid != "0" )
	{
		idID.text = node.oid ;
		txtParentPK.text = node.oid ;
		MenuEntry.Call("SELECT");
		 
	}
	
	 idBtnMenuFolderAdd.SetEnable(! ( node.img != 0 ));
	 idBtnMenuAdd.SetEnable(! ( node.img != 0 ));
	
	
}

function OnModifyBtnClick()
{
    	MenuEntry.Call();
}

function OnDeleteBtnClick()
{
    if(confirm("Do you want to delete this menu?\n If you delete it. \nThe role object and object entity which has related with this menu will be deleted too."))
    {
        MenuEntry.StatusDelete();
        sStatus = 3;
        MenuEntry.Call();        
	}
}


function OnDataReceive( dsoinfo )
{
	
	if (  dsoinfo.id == "dsoUpDown" )
	{
	    
		dsoMenuTree.Call("SELECT");
	}  
	
	if (  dsoinfo.id == "MenuEntry" )
	{
	  
	    if(sStatus == 2 ||  sStatus == 3)
	    {
	        sStatus = 0;
	        idBtnModify.SetEnable(true);
	        idBtnDelete.SetEnable(true);
	        //dsoMenuTree.Call("SELECT");
	    }
		
		dsoMenu.Call("SELECT");
	}  
	if(dsoinfo.id =="dsoMenu"){
	    lblRows.text = grdMenu.rows-1;
	    if(g_Save == "SAVE"){
		    g_Save=""; 
			dsoMenuTree.Call("SELECT");
		}
	}
}

function RefreshNode( nodeid )
{
	var nd = idMenu.FindNode( nodeid );
    
    
	if ( nd )
	{
		idMenu.RefreshNode( nd );
	} 	
	
}
var g_Save="";
function OnSaveMenu(){
	g_Save="SAVE";
	dsoMenu.Call();
}
function OnAddMenu(p_type){
    if(node == null){
        alert("Please select the parent node fisrtly.");
        return;
    }
    if(node.img != 0){
        alert("Please select the parent node fisrtly.");
        return;
    }
    if(node.oid > 0){ 
        grdMenu.AddRow();
		lblRows.text = grdMenu.rows-1;
        grdMenu.SetGridText(grdMenu.rows-1,9,node.oid);//set parent pk
        if(grdMenu.rows <= 2){
            grdMenu.SetGridText(grdMenu.rows-1,6,"images/iconAutoForm.png");//set icon path
            grdMenu.SetGridText(grdMenu.rows-1,0,1);//set sequence
        }    
        else{
            grdMenu.SetGridText(grdMenu.rows-1,6,grdMenu.GetGridData(grdMenu.rows-2,6));//set icon path   
            grdMenu.SetGridText(grdMenu.rows-1,0,Number(grdMenu.GetGridData(grdMenu.rows-2,0))+1);//set sequence
        }
		grdMenu.SetGridText(grdMenu.rows-1,8,p_type);//menu type parent or child(M, I)
    }
    
}
function OnDeleteMenu(){
	grdMenu.DeleteRow();
}

function OnMoveMenu()
{
    if(idID.text=="")
    {
        alert("Please select menu to move");
        return;
    }
            var fpath = System.RootURL + "/system/sde/ab/MenuManager_popup.aspx?p_menu_pk="+idID.text;
            var obj  = System.OpenModal(  fpath , 1000 , 500 , 'resizable:yes;status:yes');
            if(obj==1)
            {
                grdMenu.ClearData();
                dsoMenuTree.Call("SELECT");
            }
}

function OnReport(rptId)
{
    var url=System.RootURL;
                
		if(rptId==1)
		{
			url+="/reports/sys/auth/rpt_menu.aspx";
		}
		else
		{
			url+="/reports/sys/auth/rpt_menu_2.aspx";
		}
        window.open(url); 
}



</script>


<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
<gw:data id="dsoMenuTree"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="tree" function="sp_es_SEL_menu" > 
                <input bind="idMenu" > 
                </input> 
                <output bind="idMenu" /> 
            </dso> 
        </xml> 
</gw:data> 


<gw:data id="MenuEntry"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9" function = "sp_ES_SEL_menu_entry" procedure="sp_es_upd_menu_entry"> 
            <inout> 
                <inout bind="idID" />
                <inout bind="idName" /> 
                <inout bind="idLocalName" />
                <inout bind="idForeignName" />
                <inout bind="idUrl" /> 
                <inout bind="idMenuID" />
                <inout bind="idImage" />
                <inout bind="idParentID" />
                <inout bind="idType" />
				<inout bind="idObjectID" />
             </inout>
        </dso> 
    </xml> 
</gw:data> 
<gw:data id="dsoMenu"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="sp_es_sel_manager_menu" procedure="sp_es_upd_manager_menu"> 
			<input bind="grdMenu" > 
			    <input bind="txtParentPK" />
		    </input> 
			<output bind="grdMenu" /> 
		</dso> 
	</xml> 
</gw:data> 
   
 <table width="100%" height="100%"> <tr>

<td rowspan="2" valign="top" width="25%">

	<table width="100%" height="100%" border= 1>
	<tr>
		<td>
				
				<table width="100%"  cellspacing="0" style="margin:5 2 5 2;">
				<tr>
				<td  bgcolor="white" width="90%" height="20">
					<b>Menu</b>
				</td>
			
				<td align="right" bgcolor="white"  >
					<gw:icon text="Add Folder" img="in" id="idBtnMenuFolderAdd"  disabled=true onclick="OnNewItemBtnClick(true)" />		
				</td>
				<td align="right" bgcolor="white"  >
					<gw:icon text="Add Menu" img="in" id="idBtnMenuAdd"  disabled=true  onclick="OnNewItemBtnClick(false)" />		
				</td>
				<td align="right" bgcolor="white"  >
					<gw:icon text="Report" img="in" id="Report"  onclick="OnReport(1)" />		
				</td>
				<td align="right" bgcolor="white"  >
					<gw:icon text="Report 2" img="in" id="Report2"  onclick="OnReport(2)" />		
				</td>
				</tr>
				</table>
		</td>
	</tr>
	<tr >
	    <td height="100%">
	        <gw:tree id="idMenu" style="width:100%; height:100%;overflow:auto;" onclicknode="MenuClick()"/>
		</td>
	</tr>
	</table>

</td>
<td rowspan="2" valign="top" width="10">
</td>
<td  width="75%" valign="top">
	<table width="100%">
		<tr>
		    <td>
				<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td width="10%">Name</td>
						<td width="70%">
							<gw:textbox styles="width:100%" id="idName"/>
						</td>
						<td width="10%"  bgcolor="white" >
							<gw:icon text="Save" img="in"  id="idBtnModify" onclick="OnModifyBtnClick()" />		
						</td>
						<td width="10%"  bgcolor="white" >
							<gw:icon text="Delete" img="in" id="idBtnDelete" onclick="OnDeleteBtnClick()" />		
						</td>
					</tr>
				</table>
			</td>
			
		</tr>
		<tr>
		    <td>
				<table  width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td width="10%">LName</td>
							<td width="40%">
								<gw:textbox styles="width:100%" id="idLocalName"/>
							</td>
							<td width="10%">FName</td>
							<td width="40%">
								<gw:textbox styles="width:100%" id="idForeignName"/>
							</td>	
					</tr>
				</table>
			</td>
			
		</tr>
		
		<tr>
		    <td>
				<table width=100% cellspacing=0 cellpadding=0>
						<tr>
							<td><b>URL</b></td>
							<td width=90%>
								<gw:textbox styles="width:100%" id="idUrl"/>
							</td>
						</tr>
				</table>
			</td>
			
		</tr>
		<tr>
		   <td>
				<table width=100% cellspacing=0 cellpadding=0>
						<tr>
							<td><b>MenuID</b></td>
							<td width=45%>
							<gw:textbox styles="width:100%"  id="idMenuID"/>
						</td>
						<td><b>Object Id</b></td>
							<td width=45%>
							<gw:textbox styles="width:100%"  id="idObjectID"/>
						</td>
						</tr>
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width=100% cellspacing=0 cellpadding=0>
				<tr>
								<td><b>Icon</b></td>
				<td width=90%>
					<gw:textbox id="idImage" styles="width:100%"/>
				</td>
							</tr>
					</table>
	     </td>		
		</tr>
		
	</table>

    <table width=100% cellspacing=0 cellpadding=0>
		<tr>
		    <td width=5%>Rows:</td>
			<td width=10%><gw:label id="lblRows" />
		    <td width=10%><gw:icon text="Add Parent" onclick="OnAddMenu('M')" /></td>
		    <td width=10%><gw:icon text="Move To" onclick="OnMoveMenu()" /></td>
		    <td width=45%>&nbsp;</td>
			<td width=15%></td>
			<td width=5%><gw:imgBtn img="new" alt="add new menu" onclick="OnAddMenu('I')" /></td>
		    <td width=5%><gw:imgBtn img="delete" alt="delete menu"  onclick="OnDeleteMenu()" /></td>
			<td width=5%><gw:imgBtn img="save" alt="save menu" onclick="OnSaveMenu()" /></td>
		</tr>
		<tr>
			<td colspan=9>
			<div style="width:100%; height:365; overflow:auto;">
					<gw:grid   
					    id="grdMenu"  
					    header="No|Menu ID|Menu Name|File Path|Menu LName|Menu FName|Icon Path|Active|Type|ParentPK|_PK|Sector|Version|Object Id"
					    format="0|0|0|0|0|0|0|3|0|0|0|0|0|0"  
					    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
					    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
					    styles="width:100%; height:350"   
					    sorting="T" autosize="true"
					    /> 
			</div>		    
			</td>
		</tr>
    </table>	
	
</td>
</tr>
</table>

    <gw:label id="idID" style="display:none" />
	<gw:label id="idType" style="display:none" />
	<gw:textbox id="txtParentPK" style="display:none" />
	<gw:label id="idFunc" style="display:none" />
	<gw:label id="idParentID" style="display:none"  text="" />
   
</body>
</html>
