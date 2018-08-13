<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Standard level code</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';
var G_1_PK=0,
G_1_Upper_Level_Code=1,
G_1_Level_code=2,
G_1_level_Name=3,
G_1_Foreign_Name=4,
G_1_Local_Name=5,
G_1_Level=6,
G_1_Leaf_Y_N=7,
G_1_Project=8,  
G_1_Projectpk=9,
G_1_tco_company_pk=10,
G_1_parent_pk=15;
//======================================================================
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
}
//=======================================================================
function BindingDataList()
{
	var ls_Company = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by 1")%>";
	lstCompanyM.SetDataText(ls_Company);
	lstCompany_inq.SetDataText(ls_Company);
	lstCompany.SetDataText(ls_Company); 
	ls_Level = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB052') FROM DUAL")%>"; 
	lstLevel.SetDataText(ls_Level);  
	<%=ESysLib.SetGridColumnComboFormat("idGridInq",14,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0045' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
    var data;  //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0002') FROM DUAL")%>";
	 lstPrjcategory_9.SetDataText(data);
	 lstPrjcategory_s.SetDataText(data);
	 idGridInq.GetGridControl().FrozenCols = 4;
	 idGridInq.GetGridControl().WordWrap = true;
     idGridInq.GetGridControl().RowHeight(0) = 450 ;
}

//=======================================================================

function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
//=======================================================================
function OnNew()
{
	  if((idGridInqHide.GetGridData(idGridInqHide.rows -1, 1)=='T'))
	  {
		  alert("You cannot add the level code at node!!");
	  }  
	  else
	  {  
		var getparentPK="", parentID="",parentName="";
		getparentPK = txtPK.text;
		parentName = txtUpper_Level.GetData();
		parentID = txtLevel_Cd.GetData();
		dso_update.StatusInsert();
		txtParentPK.text = getparentPK;
		txtUpper_Level.SetDataText(parentID);
	  
	   
	 /*  txtProject_Cd.SetDataText(txtProjectM_Cd.text);
	   txtProject_Nm.SetDataText(txtProjectM_Nm.text);
	   txtProject_Pk.SetDataText(txtProjectM_Pk.text);*/

	   var l_level = 0;
		l_level = Number(lstLevel.value);
		if(l_level <= 5)
		{
				lstLevel.SetDataText(l_level + 1);
		}  
		else
		{
				return;
		} 
		Insert = 'T';
	} 
}
//=======================================================================
function OnSearch()
{  
    dso_tree.Call("SELECT");
}
//=======================================================================
function OnDataReceive(obj)
{
		if (obj.id=="dso_generate_item")
		{
			alert(txtstatus.GetData());
		}
        if(obj.id=="dso_update")
        {
 
              if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                     Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                  dso_tree.Call("SELECT");
              }
              else
              {
                     dso_gridhide.Call("SELECT");
              } 
        }
		if(obj.id=="dso_gridInquiry")
		{
			var ctrl 	= idGridInq.GetGridControl();
			for (i=1; i<ctrl.Rows; i++)
			{
				if(idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBold(i,G_1_PK,i,G_1_parent_pk,true);
				}
				else
				{   
					idGridInq.SetCellBold(i,G_1_PK,i,G_1_PK,false);
				}
				
				
			    if (idGridInq.GetGridData(i,G_1_Level)== "0" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XF4E6E0'));
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "1" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X99CCFF'));
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "2" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCCFFCC'));
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "3" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCCFF00'));//3 00CCFF
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "4" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XFF99CC'));//4
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "5" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCC9999'));//5
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "6" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X009933'));//6m
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "7" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCC6633'));//7
				}
				else if (idGridInq.GetGridData(i,G_1_Level)== "8" && idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X006666'));//8
				}
				else if (idGridInq.GetGridData(i,G_1_Leaf_Y_N)== "-1")
				{
					idGridInq.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XEFFFFF'));
				}
				
			}
		}
     
}
//=======================================================================
function OnClick()
{
    var obj = event.srcElement.GetCurrentNode();
	txtPK.SetDataText( obj.oid );
    dso_update.Call("SELECT");
}
//=======================================================================
function OnDelete()
{
     if(confirm("Are you sure you want to delete ?"))
    {
        dso_update.StatusDelete();
        dso_update.Call();
        Delete='T';
    }
}
//=======================================================================
function onValidate()
{
    if(txtLevel_Cd.GetData()=="")
    {
        alert('Please input Level code !!');
        txtLevel_Cd.GetControl().focus();
        return false;
    }
    else if(txtLevel_Nm.GetData()=="")
    {
        alert('Please input Level name !!');
        txtLevel_Nm.GetControl().focus();
        return false;
    }
	
    return true;
}
//=======================================================================
function onSave()
{
    if(onValidate())
    {
        dso_update.Call();
    }
}
//-----------------------------------------------------------------------
function onGridSearch()
{
	dso_gridInquiry.Call('SELECT');
}
//=======================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'GroupCode':
                            var fpath = System.RootURL + "/form/kp/ac/kpac104_pitemgrp.aspx";
                            var aValue = System.OpenModal( fpath , 800 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
								
								txtGroup_pk.text = aValue[0];
								txtGroup_Nm.text = aValue[1] + '-' + aValue[2] ;
                               
                            } 
                break;
				case 'ProjectM':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                   /* txtProjectM_Pk.text = aValue[0];
                                    txtProjectM_Cd.text = aValue[1];
                                    txtProjectM_Nm.text = aValue[2]; */
									//dso_tree.Call("SELECT");
                            } 
                break;
				case 'Project1':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                   txtProjectM_Pk1.text = aValue[0];
                                    txtProjectM_Cd1.text = aValue[1];
                                    txtProjectM_Nm1.text = aValue[2];
									onGridSearch();
                            } 
                break;
		}
}
function OnNewInquiry()
{
    if(txtProjectM_Pk1.text =="")
    {
        alert('Please choose project to add new !!');
        return;
    }
	var i = 1;
	var level_code = '';
	
	idGridInq.AddRow();
	idGridInq.SetGridText(idGridInq.rows-1, G_1_tco_company_pk, lstCompany_inq.GetData()); 
	idGridInq.SetGridText(idGridInq.rows-1, G_1_Projectpk, txtProjectM_Pk1.text);
		
	if (idGridInq.rows-1 > 1)
	    level_code = idGridInq.GetGridData(idGridInq.row, G_1_Level_code);
    
    idGridInq.SetGridText(idGridInq.rows-1, G_1_Upper_Level_Code, level_code);
	//idGridInq.SetGridText(idGridInq.rows-1, 2, idGridInq.GetGridData(idGridInq.row,2) + i);	
}
function OnCheckInquiry()
{
    var ctrl 	= idGridInq.GetGridControl();
	var i;
	var j;
	var codei;
	
	i = 1;
	while (i < ctrl.Rows)
    {
        if (idGridInq.GetGridData(i, G_1_Level_code) == '')
        {
            alert('   Level Code in row '+ i +' is not null. Please check again!!!'+'\n'+'Level Code ở dòng '+ i +' không được rỗng. Bạn hãy kiểm tra lại!!!');
	        return false;
        }
       
        i = i + 1;
    }
    
	i = 1;
	if (ctrl.Rows > 2)
	{
	    while (i < ctrl.Rows - 1)
	    {
	        j = i + 1;
	        var codej;
	        codei = idGridInq.GetGridData(i, G_1_Level_code);
	        while (j < ctrl.Rows)
	        {
	            codej = idGridInq.GetGridData(j, G_1_Level_code);
	            if (codei == codej)
	            {
	                alert('  Level Code in row '+ j +' exists. Please check again!!!'+'\n'+'Level Code ở dòng '+ j +' đã tồn tại. Bạn hãy kiểm tra lại!!!')
	                return false;
	            }
	            j = j + 1;
	        }
	        i = i + 1;
        }
    }
	return true;
}
//============================================================================================
function OnSaveInquiry()
{
    var ctrl 	= idGridInq.GetGridControl();
    if (OnCheckInquiry())
    { 
		for (i=1; i < ctrl.Rows; i++ )
		{
			if (idGridInq.GetGridData(i, G_1_Projectpk) == '')
			{
				idGridInq.SetGridText(i, G_1_tco_company_pk, lstCompany_inq.GetData()); 
				//idGridInq.SetGridText(i, G_1_Projectpk, txtProjectM_Pk1.GetData());
			}
		}
		dso_gridInquiry.Call();
	}
}
//============================================================================================
function OnDelInquiry()
{
    var ctrl 	= idGridInq.GetGridControl();
	var rownum  = ctrl.Rows - 1;
	
	if (ctrl.Row < 0) 
	{
	    if (rownum > 0)
	    {
	        alert('Please select Level Code for delete.'+'\n'+'Yêu cầu lựa chọn tài khoản để xóa');
	        return;
	    }
	}
	else
	{
	    if (confirm('Are you sure you want to delete Level Code?'+'\n'+'  Bạn có chắc muốn xóa tài khoản này?'))
	    {
	        for (i=1; i < ctrl.Rows; i++ )
	        {
                if (ctrl.isSelected(i) == true)
                {
                    if(idGridInq.GetGridData(i, 0) == "")
	                {
			            idGridInq.RemoveRowAt(i);
			            i = i - 1;
		            }
		            else
		            {
						idGridInq.DeleteRow();
						dso_gridInquiry.Call();
		            }
		        }
            }
        }
	}
}
function OnRefressInquiry()
{
    idGridInq.ClearData();
}
function onReportInquiry()
{
	 if(idGridInq.rows > 1)                                                 
	 {
		 /*var url = '/reports/kp/bp/rpt_kpbp107_level_code_inquiry.aspx?p_company='+ lstCompany_inq.value + '&p_Project_pk='+txtProjectM_Pk1.text+'&p_level_code='+txtLevelCode.text;
			 System.OpenTargetPage( System.RootURL+url , "newform" );  */
	}
}
//--------------------------------------------------------------------------------
function onGenerateItem()
{
	dso_generate_item.Call();
}
//--------------------------------------------------------------------------------
</script>
<body>
<!------------------------------------------------------------------------------->
<gw:data id="dso_generate_item" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_upd_kpbp107_2"> 
                <input> 
                     <input bind="lstPrjcategory_9"/>
                     
                </input>
                <output>
                     <output bind="txtstatus"/>
                 
               </output> 
            </dso> 
        </xml> 
    </gw:data>   
<!------------------------------------------------------------------------------->
<gw:data id="dso_update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="sp_sel_kpbp00070"   procedure="sp_upd_kpbp00070"> 
            <inout> 
                <inout bind="txtPK"/>
                <inout bind="txtParentPK" /> 
                <inout bind="lstCompany" /> 
                <inout bind="txtUpper_Level" />
                <inout bind="txtLevel_Cd" />
                <inout bind="chkLeaf_YN" />
                <inout bind="txtLevel_Nm" />
                <inout bind="txtLevelF_Nm" />
                <inout bind="txtLevelL_Nm" />
                <inout bind="lstLevel" />
               
            </inout>
        </dso> 
    </xml> 
</gw:data>
<!--------------------------------------------------------------------------------------->
  <gw:data id="dso_tree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="sp_sel_kpbp00070_1" > 
                <input>
                    <input bind="lstCompanyM" />   
                    <input bind="lstPrjcategory_9" />    
                    <input bind="txtLevel" />  
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------->
 <gw:data id="dso_gridhide" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="sp_sel_kpbp00070_2" > 
                <input>
                    <input bind="txtPK" />                    
                </input> 
                <output bind="idGridInqHide" /> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------->
 <gw:data id="dso_gridInquiry" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="sp_sel_kpbp107_1" procedure="sp_upd_kpbp107_1" > 
                <input>
					<input bind="lstCompany_inq" />   
                    <input bind="txtProjectM_Pk1" /> 
					<input bind="txtLevelCode" />	
					<input bind="txtLevel_s" />	
		         </input> 
                <output bind="idGridInq" /> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------->
 <gw:tab id="idTab_Child"  onclick ="">
	
        <table  name="Level Code Entry" style="background: #BDE9FF; height: 100%; width: 100%">
          <tr>
            <td style="background: white; width: 40%" id="idLEFT">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%">
                                    <tr>
                                            <td width="23%" align="right">Company</td>
                                            <td width="77%" ><gw:list id="lstCompanyM" text="" styles="width:100%" /></td>
                                    </tr>
                                    <tr>
                                    		<td align="right" width="">Project field</a></td>
                                            <td width="" colspan="4"><gw:list id="lstPrjcategory_s" styles="width:100%;" /></td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="">Level</td>
                                        <td width="" >
											<table cellpadding="0" cellspacing="0" width="100%">
												<tr>
													 <td width="100%"><gw:textbox id="txtLevel" onenterkey="OnSearch()" style="width:100%" /></td>
													 <td ><gw:imgbtn id="btSave1" img="search" alt="Search" onclick="OnSearch()" /></td> 
												</tr>
											</table> 
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                      <td  valign="top" width="100%"><gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree></td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 60%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="width: 100%;height:100%" border="0">
                   <tr style="width:100%;height:100%" valign="top">
                        <td width="100%">
                            <table style="width:100%" cellpadding="0" cellspacing="3" border="0">
                                <tr>
                                        <td width="22%" align="right">Company</td>
                                        <td width="79%" ><gw:list id="lstCompany" text="" styles="width:100%" /></td>
                                        <td ><gw:imgbtn id="btnSave1" img="new" alt="New" onclick="OnNew()" /></td>
                                        <td ><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                                        <td ><gw:imgbtn id="btnSave2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                    </tr>
                                    <tr>
                                    		<td align="right" width="">Project field</td>
                                            <td width="" colspan="4"> <gw:list id="lstPrjcategory_9" styles="width:100%;" /></td>
                                    </tr>
                                   <tr>
                                        <td width="" align="right">Upper Level</td>
                                        <td width="" colspan="4">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="66%"><gw:textbox id="txtUpper_Level"  readonly="true" text="" styles="width:100%" /></td>
                                                                <td style="width:14%" align="right">Level&nbsp;</td>
                                                                <td style="width:20%"><gw:list id="lstLevel" text="" styles="width:100%" /></td>
                                                            </tr>
                                                    </table>
                                        </td>
                                   </tr> 
                                    <tr>
                                            <td  width="" align="right">Level Code</td>
                                            <td width="" colspan="4">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="70%"><gw:textbox id="txtLevel_Cd" csstype="mandatory" text="" styles="width:100%" /></td>
                                                                <td style="width:30%" align="right">Leaf Y/N</td>
                                                                <td ><gw:checkbox id="chkLeaf_YN" value="F" /></td>
                                                            </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width:">Level Name</td>
                                            <td width="" colspan="4"><gw:textbox id="txtLevel_Nm" csstype="mandatory" styles="width:100%" /></td>
                                        </tr>
                                        <tr>
                                            <td  align="right" width="">Foreign Name</td>
                                            <td colspan="4" width="">
                                                <gw:textbox id="txtLevelF_Nm"   style="width:100%"  />
                                            </td> 
                                        </tr>
                                        <tr>
                                            <td  align="right" width="">Local Name</td>
                                            <td colspan="4" width="">
                                                <gw:textbox id="txtLevelL_Nm"   style="width:100%"  />
                                            </td> 
                                        </tr> 
										 <tr>
                                            <td  align="right" width=""><a title="Click here to select Group Code" onClick="OnPopUp('GroupCode')"
                                href="#tips" style="text-decoration: none; color=#0000ff"><b>Group Code</b></a></td>
                                            <td colspan="4" width=""><gw:textbox id="txtGroup_Nm"   style="width:100%"  /></td> 
                                        </tr> 
										 <tr>
                                            <td  align="right" width="">Budget Name</td>
                                            <td colspan="4" width="">
                                                <gw:textbox id="txtBudget_Nm"   style="width:100%"  />
                                            </td> 
                                        </tr> 
                            </table>
                        </td>
                   </tr>     
                </table>
            </td>
        </tr>
    </table>
    <table name="Level Code Inquiry"  align ="top"  cellspacing=0 cellpadding=0 border=0  style="height:100%;width:100%">
		<tr>
			<td  width="7%"></td>
			<td  width="19%"></td>
			<td  width="10%"></td>
			<td  width="19%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
			<td  width="12%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
			<td  width="3%"></td>
		</tr>
		<tr>
			 <td align="center" width="5%"> Company</td>
             <td colspan="4"><gw:list id="lstCompany_inq" styles='width:100%' /> </td>
			 <td colspan="1"></td>
			 <td align="right"><gw:imgbtn id="btnPrint" img="create" alt="Generate Item" onclick="onGenerateItem()" /></td>
            <td width="3%"><gw:imgbtn id="btnsearch" img="search" alt="Search" onclick="onGridSearch()" /></td>  
			<td width="3%"><gw:imgBtn img="refresh"     id="idBtnRefresh"	    alt="Refresh"       onclick="OnRefressInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="new"    		id="idBtnAddInq" 		alt="New"    		onclick="OnNewInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="save"    	id="idBtnUpdateInq" 	alt="Save"   		onclick="OnSaveInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="delete"  	id="idBtnDeleteInq" 	alt="Delete"  		onclick="OnDelInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="excel"  	id="idBtnPrintInq" 	    alt="Export to excel"  		onclick="onReportInquiry()" /> </td>	
	  </tr>
	  <tr>
			<td align="right" width=""><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project1')">Project</a>&nbsp;</td>
			<td colspan="4"><gw:textbox id="txtProjectM_Cd1" readonly="true" styles='width:35%' /><gw:textbox id="txtProjectM_Nm1"  readonly="true" styles='width:64%' /></td>
			<td ><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProjectM_Cd1.text='';txtProjectM_Nm1.text='';txtProjectM_Pk1.text='';" /></td>
			<td align="right">Level Code&nbsp;</td>
			<td colspan="7">
				<gw:textbox id="txtLevelCode" styles='width:95%' onenterkey="onGridSearch()" />&nbsp;&nbsp;
			</td>
	  </tr>
	    <tr>
			<td align="right" width=""></td>
			<td colspan="4"></td>
			<td ></td>
			<td align="right">Level&nbsp;</td>
			<td colspan="7">
				<gw:textbox id="txtLevel_s" styles='width:95%' onenterkey="onGridSearch()" />&nbsp;&nbsp;
			</td>
	  </tr>
	   <tr>
			<td colspan="15" style="height:100%;padding-top:3px">
				<!--0_PK|1.Upper Level Code|2.Level code|3.Level Name|4.Foreign Name|5.Local Name|6.Level|7.Leaf Y/N|8_Project|9_Project_pk|10_tco_company_pk|11_parent_pk|12.Print Level 1|13.Print Level2|14.Type-->
				<gw:grid
				id="idGridInq"
				header  ="_PK|Upper Level Code|Level code|Level Name|Foreign Name|Local Name|Level|Leaf Y/N|_Project|_Project_pk|_tco_company_pk|_parent_pk|Print Level 1|Print Level2|Type|Print budget status Y/N"
				format  ="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0"
				aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				defaults="|||||||||||||||"
				editcol ="1|1|1|1|1|1|1|1|1|0|0|0|1|1|1|1"
				widths  ="0|2000|2000|2300|2300|2300|800|800|3500|0|0|0|800|800|1500|800"
				styles  ="width:100%; height:100%"
				sorting ="T" 
				debug   ="false"
				/>
		   </td>
		</tr>   
    </table> 
</gw:tab>
    <!---------------------------------------------------------------------->
    <!--img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" /-->
       <gw:grid id="idGridInqHide" header="pk|Y/N" 
                                        format="0|0"
                                        aligns="0|0" 
                                        defaults="|" 
                                        editcol="0|0" 
                                        widths="500|500"
                                        style="display:none;width:200; height:200"/>
 
<gw:textbox id="txtParentPK"  text="" style="display:" />      
<gw:textbox id="txtPK"  text="" style="display:" /> 
<gw:textbox id="txtProjectM_Pk1" styles='width:100%;display:none' /> 
<gw:textbox id="txtstatus" styles='width:100%;display:none' /> 
<gw:textbox id="txtGroup_pk"   style="width:100%"  />
</body>
</html>
