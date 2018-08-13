<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Item Entry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

var G_PK=0,
G_Upper_Level_Code=1,
G_Level_code=2,
G_Level_Name=3,
G_Local_Name=4,
G_Project=5,
G_Project_pk=6,
G_parent_pk=7;

G_1_Projectpk =6;
 function BodyInit()
 {    
    
    //OnToggle(2);
    BindingDataList();
    dso_Item.StatusInsert();
	chkActive_S.SetDataText("Y");
	chkActive.SetDataText("Y");
	var _Project_Pk =  "<%=request.QueryString("project_pk")%>";
    var _Project_Cd =  "<%=request.QueryString("project_cd")%>";
    var _Project_Nm =  "<%=request.QueryString("project_nm")%>";
	txtProjectPK.SetDataText(_Project_Pk);
    txtProjectCode.SetDataText(_Project_Cd);
    txtProjectName.SetDataText(_Project_Nm);
    txtProjectM_Pk_tab2.SetDataText(_Project_Pk);
    txtProjectM_Cd_tab2.SetDataText(_Project_Cd);
    txtProjectName_tab2.SetDataText(_Project_Nm);
 }
function BindingDataList()
{
     var ls_Company = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by 1")%>";
     lstCompany_inq.SetDataText(ls_Company);
}
var flag='';
function OnToggle(obj)
{
    if(obj==2)
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
}
function OnSearch(obj)
{
	if(obj=='tab1')
	{
		dso_Search.Call();
	}
	if(obj=='tab2')
	{
		if(txtProjectM_Pk_tab2.GetData()=="")
		{
			alert('Please choose project to search !!');
			return;
		}
		dso_gridInquiry.Call('SELECT');
	}
	
}
//===============================================================================
function GridOnCellClick()
{
	flag='';
	txtMasterPK.text = grdItemS.GetGridData(grdItemS.row,0);
	dso_Item.Call("SELECT");
}
//================================================================================
function OnNew()
{
   dso_Item.StatusInsert();
   chkActive_S.SetDataText("Y");
   chkActive.SetDataText("Y");
   txtProjectPK.text = txtProjectPK_S.text; // GROUP PK
   txtProjectCode.text   = txtProjectCode_S.text; // GROUP CODE
   txtProjectName.text   =txtProjectName_S.text;// GROUP NAME
} 
//=================================================================================
function validate()
{
	if(txtProjectPK.text == "")  
		{
			alert('Please,choose project to save!!!');
			 return false;
		}
	if(txtItemGroupPK.text == "")
		{
			alert('Please, choose group to save!!!');
			 return false;
		}	
	return true;
}
function OnSave()
{
	if(validate())
	{
		flag='update';
		dso_Item.Call();
	}
}
function OnDataReceive(obj)
{
	switch (obj.id)
    {
         case "dso_Item" :
				if(flag=='update')
				{
					OnSearch("tab1");
				}
         break;
    }
}  
function OnDelete()
{
	if(txtMasterPK.text !="")
	{
		if(confirm('Are you sure you want to delete ?'))
		{
			flag='update';
			dso_Item.StatusDelete();
			dso_Item.Call();
		}
	 }
}
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'UOM':
               var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtUOM.text = obj[1];  
               }	
        break;  
		case 'Group':
               var path = System.RootURL + '/form/61/01/61010110_popup_item_group.aspx?p_prjectPk='+txtProjectPK.text+'&p_prjectcode='+txtProjectCode.text+'&p_prjectname='+txtProjectName.text;
               var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
               
               if ( obj != null ) 
               {
                    txtItemGroupPK.text = obj[0]; // GROUP PK
                    txtGroupCode.text   = obj[1]; // GROUP CODE
                    txtGroupName.text   = obj[2]; // GROUP NAME
					txtItemCode.text   = obj[1];
				}
        break;   
		case 'Group_S':
               var path = System.RootURL + '/form/61/01/61010110_popup_item_group.aspx';
               var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
               
               if ( obj != null )  
               {
                    txtItemGroupPK_S.text = obj[0]; // GROUP PK
                    txtGroupCodeName_S.text   = obj[1]+"-"+obj[2]; // GROUP CODE - name
				
				}
        break;   
		case 'Project':
               var fpath = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
					var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
					if(aValue != null)
					{
							txtProjectPK.text = aValue[0];  
							txtProjectCode.text = aValue[1];
							txtProjectName.text = aValue[2];  
							
					} 
        break;   
		case 'Project_S': 
               var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
					var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
					if(aValue != null)
					{  
							txtProjectPK_S.text = aValue[0];  
							txtProjectCodeName_S.text = aValue[1]+"-"+aValue[2]; 
							txtProjectCode_S.text   = aValue[1];
				      	    txtProjectName_S.text   = aValue[2];
					} 
        break; 
        case 'Project_tab2': 	  
               var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
					var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
					if(aValue != null)
					{  
							txtProjectM_Pk_tab2.text = aValue[0]; 
							txtProjectM_Cd_tab2.text = aValue[1]	
							txtProjectName_tab2.text=aValue[2];
							dso_gridInquiry.Call('SELECT');	
					} 
        break;   
		case 'Group_S_inq':
		       if(event.col == 1)
			   {
				    var path = System.RootURL + '/form/61/01/61010110_popup_item_group.aspx?p_prjectPk='+txtProjectM_Pk_tab2.text+'&p_prjectcode='+txtProjectM_Cd_tab2.text+'&p_prjectname='+txtProjectName_tab2.text;
             
				  // var path = System.RootURL + '/form/61/01/61010110_popup_item_group.aspx';
				   var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
				   
				   if ( obj != null )  
				   {
						idGridInq.SetGridText(idGridInq.row,7,obj[0]);
						idGridInq.SetGridText(idGridInq.row,1,obj[1]);
									
				   }
				}
        break;   
        case 'Work_Breakdown':
            if(txtProjectM_Pk_tab2.text != '')
            {
                var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=' + txtProjectM_Pk_tab2.text;
		        var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
		        if ( obj != null )
		        {
					    txtlevelpk_tab2.SetDataText(obj[2]);
                        txtlevelcd_tab2.text = obj[0];
					    txtlevelnm_tab2.text = obj[1];
                }
            }
            else
            {
                alert('Please select Project !!');
            }
        break;

	}
}
function OnRefressInquiry()
{
    idGridInq.ClearData();
}
function OnNewInquiry()
{
    if(txtProjectM_Pk_tab2.GetData()=="")
    {
        alert('Please choose project to add new !!');
        return;
    } 
	idGridInq.AddRow();
	idGridInq.SetGridText(idGridInq.rows-1, G_Project_pk, txtProjectM_Pk_tab2.GetData());
    if(txtParent_Pk.text != '')
    {
        idGridInq.SetGridText(idGridInq.rows-1, 1, txtlevelcd_tab2.text);
	    idGridInq.SetGridText(idGridInq.rows-1, 2, idGridInq.GetGridData(idGridInq.row,2) + '1');
    }
}
function OnSelect()
{
    txtParent_Pk.text = idGridInq.GetGridData(idGridInq.row, 7);
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
        if (idGridInq.GetGridData(i, G_Level_code) == '')
        {
            alert('   Level Code in row '+ i +' is not null. Please check again!!!'+'\n'+'Level Code ở dòng '+ i +' không được rỗng. Bạn hãy kiểm tra lại!!!');
	        return false;
        }
        /*if (idGridInq.GetGridData(i, G_1_level_Name) == '')
        {
            alert(' Account name in row '+ i +' is not null. Please check again!!!'+'\n'+'Account name ở dòng '+ i +' không được rỗng. Bạn hãy kiểm tra lại!!!');
	        return false;
        }*/
        i = i + 1;
    }
    
	i = 1;
	if (ctrl.Rows > 2)
	{
	    while (i < ctrl.Rows - 1)
	    {
	        j = i + 1;
	        var codej;
	        codei = idGridInq.GetGridData(i, G_Level_code);
	        while (j < ctrl.Rows)
	        {
	            codej = idGridInq.GetGridData(j, G_Level_code);
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
function OnSaveInquiry()
{
    var ctrl 	= idGridInq.GetGridControl();
    if (OnCheckInquiry())
    { 
		for (i=1; i < ctrl.Rows; i++ )
		{
			if (idGridInq.GetGridData(i, G_Project_pk) == '')
			{
				//idGridInq.SetGridText(i, G_1_tco_company_pk, lstCompany_inq.GetData()); 
				idGridInq.SetGridText(i, G_1_Projectpk, txtProjectM_Pk_tab2.GetData());
			}
		}
		dso_gridInquiry.Call();
	}
}
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
</script>

<body>
    <gw:data id="dso_Search" onreceive=""> 
        <xml> 
            <dso id="2" type="grid" function="sp_sel_kpac1011_search" >
                <input>
                    <input bind="txtItemGroupPK_S" /> 
                    <input bind="txtItem_S" />
					<input bind="chkActive_S" />
					<input bind="txtProjectPK_S" /> 
                </input>
                <output bind="grdItemS" />  
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------->
    <gw:data id="dso_Item" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="sp_sel_kpac1011" procedure="sp_upd_kpac1011">
                <inout>
                    <inout bind="txtMasterPK" />  
					<inout bind="txtProjectPK" />
					<inout bind="txtProjectCode" />
					<inout bind="txtProjectName" />
                    <inout bind="txtItemGroupPK" />
					<inout bind="txtGroupCode" />
					<inout bind="txtGroupName" />
					<inout bind="txtItemCode" />
					<inout bind="txtItemName" />
					<inout bind="txtLocalItemName" />
					<inout bind="txtUOM" />
					<inout bind="chkActive" />
					<inout bind="dtFrom" />
					<inout bind="dtTo" />
					<inout bind="txtDescription" />
					<inout bind="txtPhotoPK" /> 
                 </inout>
            </dso>
        </xml>
    </gw:data>
	<!---------------------------------------------------------------->
	<gw:data id="dso_gridInquiry" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="sp_sel_kpac1011_tab2" procedure="sp_upd_kpac1011_tab2" > 
                <input>  
                    <input bind="txtProjectM_Pk_tab2" /> 
					<input bind="txtLevelCode" />	
                    <input bind="txtlevelpk_tab2" />	
                </input> 
                <output bind="idGridInq" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
	 <gw:tab id="idTab_Child"  onclick ="">
    <table name="Item Entry" style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 30%" id="idLEFT">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
						<td style="width: 15%"> 
                        </td>
						<td style="width: 20%"> 
                        </td>
						<td style="width: 60%"> 
                        </td>
						<td style="width: 5%"> 
                        </td>
                    </tr>
					<tr style="height: 2%"> 
                        <td >
                            <a title="Click here to select project" href="#tips" style="text-decoration: none;
                                            color=#0000ff" onclick="OnPopUp('Project_S')"><b>&nbsp;&nbsp;&nbsp;Project
                        </td>
                        <td colspan="2"> 
                            <gw:textbox id="txtProjectPK_S" styles='width:100%;display:none' />
                            <gw:textbox id="txtProjectCodeName_S" styles='width:100%' csstype="mandatory" readonly="true" />
                        </td>
						<td>
							<gw:imgbtn id="btnRsGroup_S" img="reset" alt="Reset" onclick="txtProjectCodeName_S.text='';txtProjectPK_S.text='';" />
						</td>
                    </tr>
                    <tr style="height: 2%">
                        <td >
                            <a title="Click here to select Group Code" href="#tips" style="text-decoration: none;
                                            color=#0000ff" onclick="OnPopUp('Group_S')"><b>&nbsp;Group
                        </td>
                        <td colspan="2"> 
                            <gw:textbox id="txtItemGroupPK_S" styles='width:100%;display:none' />
                            <gw:textbox id="txtGroupCodeName_S" styles='width:100%' csstype="mandatory" readonly="true" />
                        </td>
						<td>
							<gw:imgbtn id="btnRsGroup_S" img="reset" alt="Reset" onclick="txtGroupCodeName_S.text='';txtItemGroupPK_S.text='';" />
						</td>
                    </tr>
                    <tr style="height: 2%"> 
                        <td>
                            Item</td>
                        <td colspan="3">
                            <gw:textbox id="txtItem_S" styles="width: 100%" onenterkey="OnSearch('tab1')" />
                        </td>
                    </tr>
					<tr style="height: 2%">
                        <td colspan="3">
                            Active<gw:checkbox id="chkActive_S" defaultvalue="Y|N" value="Y" onchange="OnSearch('tab1')"  /></td>
						
                        <td >
                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch('tab1')" />
                        </td>
                    </tr>
                    <tr style="height: 93%">
                        <td colspan="4">
                            <gw:grid id="grdItemS" header='_pk|Group Code|Group Name' format='0|0|0'
                                aligns='0|0|0' defaults='||' editcol='0|0|0' widths='0|1500|2000' sorting='T'
                                styles="width:100%;height:100%" autosize="T" oncellclick="GridOnCellClick()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 70%" id="idRIGHT">
                <table  style="height: 100%; width: 100%" border="0">
                    <tr style="height: 2%" valign="top">
                        <td style="width: 50%" align="right">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 27%">
                                        
                                    </td>
                                    <td style="width: 40%">
                                        
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 23%; white-space: nowrap">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 50%">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 97%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnAddNew" img="new" alt="New" onclick="OnNew()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 12%" valign="top">
                        <td colspan="2">
                            <fieldset>
                                <table id="tab_Company_information" style="height: 100%; width: 100%">
                                    <tr style="height: 7%" valign="top">
                                        <td style="width: 80%" align="right">
                                            <table style="height: 100%; width: 100%">
												<tr>
													<td style="width: 19%"></td>
													<td style="width: 20%"></td>
													<td style="width: 16%"></td>
													<td style="width: 44%"></td>
													<td style="width: 3%"></td>
												</tr> 
												<tr style="height: 1%;"> 
                                                    <td > 
                                                        <a title="Click here to select Project" href="#tips" style="text-decoration: none;
														color=#0000ff" onclick="OnPopUp('Project')"><b>Project</td>
                                                    <td colspan="3">
                                                        <gw:textbox id="txtProjectCode" styles="width: 30%" csstype="mandatory" readonly="true" /><gw:textbox id="txtProjectName" styles="width: 69%" csstype="mandatory" readonly="true" />
                                                    </td>
													<td>
                                                        <gw:imgbtn id="btnRsProject" img="reset" alt="Reset" onclick="txtProjectCode.text='';txtProjectName.text='';txtProjectPK.text='';" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 1%;"> 
                                                    <td >
                                                        <a title="Click here to select Group Code" href="#tips" style="text-decoration: none;
														color=#0000ff" onclick="OnPopUp('Group')"><b>Group</td>
                                                    <td colspan="3">
                                                        <gw:textbox id="txtGroupCode" styles="width: 30%" readonly="true" csstype="mandatory" /><gw:textbox id="txtGroupName" styles="width: 69%" readonly="true" csstype="mandatory" />
                                                    </td>
													<td>
                                                        <gw:imgbtn id="btnRsGroup" img="reset" alt="Reset" onclick="txtGroupCode.text='';txtGroupName.text='';txtItemGroupPK.text='';" />
                                                    </td>
                                                </tr>
												<tr style="height: 1%;">
                                                    <td >
                                                        Item Code</td>
                                                    <td colspan="4">
                                                        <gw:textbox id="txtItemCode" styles="width: 99%" />
                                                    </td>
                                                </tr>
												<tr style="height: 1%;">
                                                    <td >
                                                        Item Name</td>
                                                    <td colspan="4">
                                                        <gw:textbox id="txtItemName" styles="width: 99%" />
                                                    </td>
                                                </tr>
												<tr style="height: 1%;">
                                                    <td >
                                                        Local Name</td>
                                                    <td colspan="4">
                                                        <gw:textbox id="txtLocalItemName" styles="width: 99%" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 1%;">
                                                    <td >
                                                        <a title="Click here to select Group Code" href="#tips" style="text-decoration: none;
														color=#0000ff" onclick="OnPopUp('UOM')"><b>UOM</td>
                                                    <td >
                                                        <gw:textbox id="txtUOM" styles="width: 100%" />
                                                    </td>
                                                    <td >
                                                        Active<gw:checkbox id="chkActive" defaultvalue="Y|N" value="Y"  /></td>
                                                    <td colspan="2">
                                                        <gw:datebox id="dtFrom" lang="1" styles="width: 45%"  />~
														<gw:datebox id="dtTo" lang="1" styles="width: 45%" nullaccept="T" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 1%;">
                                                    <td colspan="5">
                                                        <table style="height: 100%; width: 100%">
                                                            <tr style="height: 1%;">
                                                                <td style="width: 18%; white-space: nowrap" align="right">
                                                                    Description</td>
                                                                <td style="width: 82%" colspan="4">
                                                                    <gw:textbox id="txtDescription" styles="width: 100%" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 20%">
                                            <gw:image id="imgItemPerson" table_name="CRM.TGM_MEMBERPHOTO" procedure="CRM.SP_UPD_TGM_MEMBERPHOTO"
                                                styles="width:98%;height:140" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
                                                post="/binary/PostFile.aspx" style='border: 1px solid #1379AC' />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
					<tr style="height: 86%;">
					</tr>
                </table>
            </td>
        </tr>
    </table>
	<table name="Item Inquiry"  align ="top"  cellspacing=1 cellpadding=1 border=0  style="height:100%;width:100%">
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
		<tr  valign="top">
			 <td align="right" width="5%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project_tab2')">Project</a>&nbsp; </td> 
             <td  colspan="4"><gw:textbox id="txtProjectM_Cd_tab2" readonly="true" styles='width:35%' /><gw:textbox id="txtProjectName_tab2"  readonly="true" styles='width:64%' /><gw:list id="lstCompany_inq" styles='width:100%;display:none' /> </td>
			 <td colspan="2"><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProjectM_Cd_tab2.text='';txtProjectName_tab2.text='';txtProjectM_Pk_tab2.text='';" /></td>
            <td width="3%"><gw:imgbtn id="btnsearch" img="search" alt="Search" onclick="OnSearch('tab2')" /></td>  
			<td width="3%"><gw:imgBtn img="refresh"     id="idBtnRefresh"	    alt="Refresh"       onclick="OnRefressInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="new"    		id="idBtnAddInq" 		alt="New"    		onclick="OnNewInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="save"    	id="idBtnUpdateInq" 	alt="Save"   		onclick="OnSaveInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="delete"  	id="idBtnDeleteInq" 	alt="Delete"  		onclick="OnDelInquiry()" /> </td>
            <td width="3%"><gw:imgBtn img="excel"  	id="idBtnPrintInq" 	    alt="Export to excel"  		onclick="onReportInquiry()" /> </td> 
	  </tr>
	  <tr>
			<td align="right" width="5%">&nbsp;&nbsp;<a title="Click here to show Level" href="#" style="text-decoration: none" onClick="OnPopUp('Work_Breakdown')">Level Code </a>&nbsp; </td>
			<td colspan="4"><gw:textbox id="txtlevelcd_tab2" readonly="true" styles='width:35%' /><gw:textbox id="txtlevelnm_tab2"  readonly="true" styles='width:64%' /><gw:textbox id="txtlevelpk_tab2"  readonly="true" styles='width:;display:none' /> </td>
			<td ><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtlevelcd_tab2.text='';txtlevelnm_tab2.text='';txtlevelpk_tab2.text='';" /></td>
			<td align="right">Item Code&nbsp;</td>
			<td colspan="6"><gw:textbox id="txtLevelCode" styles='width:95%' onenterkey="OnSearch('tab2')" /></td>
	  </tr>
	   <tr>
			<td colspan="15" style="height:100%;padding-top:3px">
				<!--0_PK|1.Upper Level Code|2.Level code|3.Level Name|4.Foreign Name|5.Local Name|6.Project|7_Projectpk|8_tco_company_pk-->
				<gw:grid
				id="idGridInq"
				header  ="_PK|Upper Level Code|Item code|Item Name|Local Name|Project|_Project_pk|_parent_pk"
				format  ="0|0|0|0|0|0|0|0"
				aligns  ="0|0|0|0|0|0|0|0"
				defaults="|||||||"
				editcol ="1|1|1|1|1|1|1|1"
				widths  ="0|1500|1500|2500|2500|2500|800|800"
				styles  ="width:100%; height:100%"
				sorting ="T" autosize="T"
                oncellclick="OnSelect()"
				oncelldblclick="OnPopUp('Group_S_inq');"
				/>
		   </td>
		</tr>   
    </table> 
	</gw:tab>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 3; top: 20;" onclick="OnToggle(2)" />
    <!--<img status="expand" id="imgPersional" src="../../../system/images/up_orange.gif" style="cursor: hand;
                                                position: absolute; left: 228; top: 45;" onclick="OnToggle(0)" />-->
    <gw:textbox id="txtMasterPK" styles="display:none" />
    <gw:textbox id="txtPhotoPK" styles="display:none" />
	<gw:textbox id="txtItemGroupPK" styles="display:none" />
	<gw:textbox id="txtProjectPK" styles="display:none" />
	<gw:textbox id="txtProjectM_Pk_tab2" styles="display:none" />
	<gw:textbox id="txtProjectCode_S" styles="display:none" />
	<gw:textbox id="txtProjectName_S" styles="display:none" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtParent_Pk" styles="display:none" />
</body>
</html>
