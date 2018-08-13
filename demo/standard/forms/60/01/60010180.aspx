<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
 
var Insert      = 'F';
var Modify      = 'F';
var Delelete    = 'F';
var g_next_pk , g_next_type_nm;
function BodyInit()
{
	OnSearch();
	System.Translate(document);
}

function BindingDataList()
{ 
    
	
}
function OnDataReceive(p_oData)
{
    if(p_oData.id=='dso_upd_acc_entry')
    {
		
	}
}
//--------------------------------------------------------------
function OnSearch()
{
	dso_sel_tree_account.Call("SELECT");
}
//=================================================
function OnTreeClick()
{
	var obj = event.srcElement.GetCurrentNode();
	txtMasterPK.SetDataText( obj.oid );
	Insert   = 'F';
	Modify   = 'F';
	Delelete = 'F';
	dso_upd_acc_entry.Call("SELECT");
}
//=====================================================
function OnAdd()
{
	Insert   = 'T';
	Modify   = 'F';
	Delelete = 'F';
	g_next_pk = txt_process_prior_next_pk.text;
	g_next_type_nm = txtU_PROCESS_TYPE.text;
	dso_upd_acc_entry.StatusInsert();
	txt_process_prior_next_pk.text = g_next_pk;
	txtU_PROCESS_TYPE.text=g_next_type_nm;
}

function OnAddSub()
{	
	g_next_pk = txtMasterPK.text;
	g_next_type_nm = txtPROCESS_TYPE.text;
	dso_upd_acc_entry.StatusInsert();
	txt_process_prior_next_pk.text = g_next_pk;
	txtU_PROCESS_TYPE.text = g_next_type_nm;
	
}
//============================================================================================
function OnSave()
{
	dso_upd_acc_entry.Call("");
}
//================popup=============================
function OnPopup(obj)
{
	if(obj=='PL')
	{
		var fpath =  System.RootURL + "/standard/forms/60/17/60170001_pl_popup.aspx?";
        var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null ) 
        {
            if (object[0] != 0)
            {
                txtTAC_APPL_PK.SetDataText(object[0]);//pk
                txt_PL_CD_NAME.SetDataText(object[1]+'-'+object[2]);//id
            }
        }
	}
}
//======================================
function OnDelete()
{
	if (confirm('  Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa tài khoản này?'))
	{
		dso_upd_acc_entry.StatusDelete();
		dso_upd_acc_entry.Call("");
	}
}
</script>
<body style="margin:0; padding:0;">
  <gw:data id="dso_pro_60010180_cd_duplicate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60010180_cd_duplicate" > 
                <input> 
                     <input bind="txtMasterPK"/>
                     <input bind="txtPROCESS_TYPE"/>
                </input>  
                <output>  
                     <output bind="txt_Duplicate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
 <!-------------------------------------ac_sel_60030010_acc_parent------------------------------------------------------------------>
 <gw:data id="dso_upd_acc_entry" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7" function="ac_sel_60010180" procedure = "ac_upd_60010180">
              <inout> 
                <inout bind="txtMasterPK"/>
				<inout bind="txt_process_prior_next_pk"/>
                <inout bind="txtU_PROCESS_TYPE" />
                <inout bind="txtPROCESS_TYPE" />
                <inout bind="txtTAC_APPL_PK" />
                <inout bind="txt_PL_CD_NAME" />
                <inout bind="txtSEQ" />
				<inout bind="rb_USE_YN" />		
              </inout>
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------->
<gw:data id="dso_sel_tree_account">
        <xml>
            <dso type="tree" parameter="0,1" function="ac_sel_60010180_search_tree">
                <input bind="oTreeAcCODE" > 
                    <input bind="txtSearchAccCode"/>
                </input>
                <output bind="oTreeAcCODE" />
            </dso>
        </xml>
    </gw:data>	
	<table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0" >
	<tr>
		<td id="left" width="25%" valign=top>
		    <table border="0" cellpadding=0 cellspacing=0 width="100%">
		    <tr>
			    <td colspan="3">
				    <fieldset style="padding: 2">
				     <table border="0" cellpadding=0 cellspacing=0 width="100%">
				       <tr>
						   <td width="20%">Acc.Code</td>
						   <td  width="70%"><gw:textbox id="txtSearchAccCode" onchange="OnSearch()" onenterkey="OnSearch()" styles='width:100%'/></td>
						   <td width="10%"><gw:imgBtn   id="idSearch" img="search"  alt="search"        onclick="OnSearch()"/> </td>
				       </tr>
				    </table>
			       </fieldset>
			    </td>
		    </tr>
		    <tr>
		        <td  width="100%" colspan=3><gw:tree id="oTreeAcCODE" align="top" style="width:100%; height:427; overflow:auto;" onclicknode="OnTreeClick()" ></gw:tree> </td>
	        </tr>
	    </table>	
      </td>
	  <td id="right" width="75%"  valign=top>
		<table border="0" cellpadding=0 cellspacing=0 width="100%" id="table3">
			<tr>
				<td width="25%">UPPER PROCESS TYPE</td>
				<td width="30%"><gw:textbox id="txtU_PROCESS_TYPE"  text="" maxlen = "100" styles='width:100%' readonly="true"/></td>
				<td width="8%"> </td>
				<td width="12%"> </td>
				<td width="8%"> </td>
				<td width="5%"> </td>
				<td width="7%"> </td>
				<td width="1%"><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset"     onclick="Reset_Upper()" /> </td>
				<td width="1%"><gw:imgBtn img="new"     alt="New"  text="New"    id="idBtnAdd" 		 onclick="OnAdd()" /> </td>		
			    <td width="1%"><gw:imgBtn img="new"     alt="New Sub" text="New Sub"    id="idBtnAddSub" 		 onclick="OnAddSub()" /> </td>						
		        <td width="1%"><gw:button img="save"    alt="Save"    id="idBtnUpdate"  onclick="OnSave()" /> </td>
		        <td width="1%"><gw:button img="delete"  alt="Delete"  id="idBtnDelete" 	 onclick="OnDelete()" /> </td>  
		        <td width="1%"><gw:button img="excel" text="Print" alt="Print"   id="ibtnPrint" 			onclick="OnPrint()" /> </td>	    
			</tr>
			<tr>
				<td width="17%" >PROCESS TYPE</td> 
				<td width="15%" ><gw:textbox id="txtPROCESS_TYPE"   text="" styles='width:100%' onkeypress="CheckKey()" onenterkey="Ac_CodeEnter()" csstype="mandatory"/></td>
				<td width="7%" ><a title="Click here to select PL" onclick="OnPopup('PL')" href="#tips"
                                                        style="text-decoration: none; color=#0000ff"><b>PL</b></a></td>
				<td width="28%" colspan="6" ><gw:textbox id="txt_PL_CD_NAME"   text="" styles='width:100%' onkeypress="CheckKey()" onenterkey="Ac_CodeEnter()" csstype="mandatory"/> </td>
				<td width="7%" >SEQ</td>				
		        <td width="9%" ><gw:textbox id="txtSEQ"   text="" styles='width:100%' onkeypress="CheckKey()" onenterkey="Ac_CodeEnter()" csstype="mandatory"/> </td>
		        <td width="15%"  colspan="1" ><gw:checkbox id="rb_USE_YN" onclick="OnChange_rb_USE_YN()"  value="Y" defaultvalue="Y|N"/> USE YN</td>    
			</tr> 
		</table>	
		</td>
	  
	</tr>
</table>   

 <!--img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand;
        position: absolute; left: 1; top: 20;" onclick="OnToggle('')" /-->
<gw:textbox id="txt_PAC_PK"  style="display:none"/>		
<gw:textbox id="txtMasterPK"  style="display:none"/> 
<gw:textbox id="txt_Duplicate"  style="display:none"/>
<gw:textbox id="txtTAC_APPL_PK"  style="display:none"/>
<gw:textbox id="txt_process_prior_next_pk"  style="display:none"/>
</body>
</html>
