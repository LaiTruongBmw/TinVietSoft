<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Budget Item</title>
</head>
<%  ESysLib.SetUser("prod")%>

<script type="text/javascript" language="javascript">
var sStatus =0;
//============================================================================
function BodyInit()
{
    BindingDataList();
    OnSearch();
}
//============================================================================
function BindingDataList()
{
    <%=ESysLib.SetGridColumnComboFormat("grdBudgetItem", 5,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0002' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
    data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0002' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>||Select All"; 
    lstCategory.SetDataText(data);
    lstCategory.value="";
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT acnt.sf_a_get_company('') FROM DUAL")%>";   
    lstCompany.SetDataText(data);
}
//============================================================================
function MenuClick()
{
	var node = idMenu.GetCurrentNode();		 
	if ( node == null ) return;
	
	else
	{
		txtMasterPK.text = node.oid ;
		dso_kpbm00090.Call("SELECT");	 
	}
}

//============================================================================
function OnSearch()
{
    dsoMenuTree.Call("SELECT");
}
//============================================================================
function OnPopUp()
{
    var col=event.col;
    if(col==4)
    {
	    var fpath   = System.RootURL + "/form/gf/bm/gfbm00020_popup.aspx?comm_code=&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_budget";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
        if(aValue != null)
        {   
            var temp=aValue[0];
            grdBudgetItem.SetGridText(grdBudgetItem.row,3,temp[3]);
            grdBudgetItem.SetGridText(grdBudgetItem.row,4,temp[1]);
        }   
    }
    
}
//============================================================================
function OnAddNew()
{
    if(txtMasterPK.text!="")
    {
        grdBudgetItem.AddRow();
        grdBudgetItem.SetGridText(grdBudgetItem.rows-1,9,txtMasterPK.text);
    }
    else
    {
        alert("Please Select Budget Item Master");
    }
}

//============================================================================
function OnSave()
{
    dso_kpbm00090.Call();
}
//============================================================================
function OnDelete()
{
     if ( grdBudgetItem.row > 0 )
     {
        if ( grdBudgetItem.GetGridData( grdBudgetItem.row, 0) == '' ) //pk
        {
	        grdBudgetItem.RemoveRowAt( grdBudgetItem.row ); 			
	    }
	    else			
	    {
	        grdBudgetItem.DeleteRow();
	    }
	}
}
//=============================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
       // imgArrow.src = "../../../images/right-arrow.ico";
        imgArrow.src = "../../../system/images/next_orange.gif";

    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="60%";
        //imgArrow.src = "../../../images/left-arrow.ico";
        imgArrow.src = "../../../system/images/prev_orange.gif";

    }
 }
//=============================================================================
function OnUnDelete()
{
    grdBudgetItem.UnDeleteRow(); 
}
//============================================================================
function OnNewFoder()
{
    var fpath = System.RootURL + "/form/kp/bm/kpbm00091.aspx";
    var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    OnSearch();
//    if(aValue != null)
//    {
//            txtProject_Pk.text = aValue[0];
//            txtProject_Cd.text = aValue[1];
//            txtProject_Nm.text = aValue[2];  
//    } 
}
//============================================================================
function OnDataReceive( dsoinfo )
{
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
}


</script>

<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="dsoMenuTree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="ec111.SP_SEL_KPBM00090_ITEM_TREE" > 
                <input bind="idMenu" > 
                    <input bind="lstCategory" />
                </input> 
                <output bind="idMenu" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="dso_kpbm00090" onreceive=""> 
    <xml> 
        <dso id="1" type="grid" procedure="ec111.sp_upd_kpbm00090"   parameter="0,1,2,3,4,5,6,7,8,9" function="ec111.sp_sel_kpbm00090"> 
            <input bind="grdBudgetItem">                    
                <input bind="txtMasterPK" /> 
            </input> 
            <output bind="grdBudgetItem" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table width="100%" height="100%" border="1">
        <tr>
            <td rowspan="2" valign="top" width="35%" id="left">
                <table width="100%" height="100%" border="0">
                    <tr>
                        <td bgcolor="white" width="90%" height="20" align="center" colspan="2">
                            <b>Budget Item</b>
                        </td>
                        <%--<td align="right" bgcolor="white">
                            <gw:icon text="Add Folder" img="in" id="idBtnMenuFolderAdd" onclick="OnNewFoder()" />
                        </td>--%>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap">
                                        Unit Price Category
                                    </td>
                                    <td style="width: 40%">
                                        <gw:list id="lstCategory" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="100%" colspan="2">
                            <gw:tree id="idMenu" style="width: 100%; height: 100%; overflow: auto;" onclicknode="MenuClick()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="65%" valign="top" id="right">
                <table width="100%" cellspacing="0" cellpadding="0" style="width: 100%; height: 100%">
                    <tr>
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap">
                                        Company
                                    </td>
                                    <td style="width: 60%">
                                        <gw:list id="lstCompany" styles='width:100%' />
                                    </td>
                                    <td style="width: 30%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="new" alt="Free Item" id="btnAddDetail" onclick="OnAddNew()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDeleteDetail" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDeleteDetail" onclick="OnUnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="save" alt="Free Item" id="btnSave" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 100%">
                        <td style="width: 100%">
                            <gw:grid id='grdBudgetItem' header='_PK|Budget Item Code|Budget Item Name|_Ac_pk|Account Code Name|Category|Use Y/N|Mod By|Mod Date|_Parent_pk'
                                format='0|0|0|0|0|0|3|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' check='|||||||||' editcol='1|1|1|1|1|1|1|1|1|1'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                styles='width:100%; height:100%' oncelldblclick="OnPopUp()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:label id="idID" style="display: none" />
    <gw:label id="idType" style="display: none" />
    <gw:textbox id="txtMasterPK" style="display: none" />
    <gw:label id="idFunc" style="display: none" />
    <gw:label id="idParentID" style="display: none" text="" />
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
</body>
</html>
