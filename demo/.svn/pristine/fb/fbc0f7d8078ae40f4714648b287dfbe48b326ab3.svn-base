<!-- #include file="../../../system/lib/form.inc"  -->
<script >
var G_1_Level = 8,
    G_1_Leaf_Y_N = 9,
    G_1_PK = 0,
    G_1_parent_pk = 11;
function BodyInit()
{
	System.Translate(document);
	ls_Level = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB052') FROM DUAL")%>"; 
	lstLevel.SetDataText(ls_Level);  
	lstLevel2.SetDataText(ls_Level);  
    <%=ESysLib.SetGridColumnComboFormat("Grid_Detail",8,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'EACAB052' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
}	
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
                            } 
                break;
              case 'Project_M':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProjectM_Pk.text = aValue[0];
                                    txtProjectM_Cd.text = aValue[1];
                                    txtProjectM_Nm.text = aValue[2]; 
                            } 
                break;  
              case 'Project_2':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject2_Pk.text = aValue[0];
                                    txtProject2_Cd.text = aValue[1];
                                    txtProject2_Nm.text = aValue[2]; 
                            } 
                break;    
        }
}          
function OnCheck()
{
        if(txtProject_Pk.text == '')
       {
                alert('Please select Project !! ');
              return true;  
       }
       else if(txtProgress_Id.text == '')
       {
            alert('Please input Progress Id !! ');
            txtProgress_Id.GetControl().focus();
            return true;
       }
       else if(txtProgress_Nm.text == '')
       {
            alert('Please input Progress Name !! ');
            txtProgress_Nm.GetControl().focus();
            return true;
       }
       return false;
}
function OnNew(obj)
{
        switch(obj)
       {
                case 'Tab1':
                            var getparentPK="", parentID="",parentName="";
		                    getparentPK = txtPk.text;
		                    parentName = txtParent_Cd.GetData();
		                    parentID = txtProgress_Id.GetData();
		                    dso_update.StatusInsert();
                                txtParent_Pk.text = getparentPK;
		                    txtParent_Cd.SetDataText(parentID); 
		                    txtProject_Cd.SetDataText(txtProjectM_Cd.text);
	                       txtProject_Nm.SetDataText(txtProjectM_Nm.text);
	                       txtProject_Pk.SetDataText(txtProjectM_Pk.text);
                break;  
                case 'Tab2':
                        if(txtProject2_Pk.GetData()=="")
                        {
                            alert('Please select Project !!');
                        }
                       else
                       {   
	                            Grid_Detail.AddRow();
	                            Grid_Detail.SetGridText(Grid_Detail.rows-1, 1, txtProject2_Pk.text);
                                Grid_Detail.SetGridText(Grid_Detail.rows-1, 8, lstLevel2.value);
                                
	                          for(i=1;i<Grid_Detail.rows;i++)
                              {
                                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 2, i);
                              } 
                              if(txtParent_Pk.text != '')
                              {
                                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 3, Grid_Detail.GetGridData(Grid_Detail.row,4));
	                                Grid_Detail.SetGridText(Grid_Detail.rows-1, 4, Grid_Detail.GetGridData(Grid_Detail.row,4) + 1);  
                              }
	                    } 
	
              break;  
       } 
}

function OnSelect()
{
    txtParent_Pk.text = Grid_Detail.GetGridData(Grid_Detail.row,11);
}
var flag='';
function OnSave(obj)
{
        switch(obj)
       {
            case 'Tab1':
                    if(!OnCheck())
                    {
                            flag='Save';
                            dso_update.Call();
                    } 
              break;
              case 'Tab2':
                    var ctrl 	= Grid_Detail.GetGridControl();
                    if (OnCheckInquiry())
                    { 
		                for (i=1; i < ctrl.Rows; i++ )
		                {
			                if (Grid_Detail.GetGridData(i, 1) == '')
			                {
				                Grid_Detail.SetGridText(i, 1, txtProject2_Pk.GetData());
			                }
		                }
		                dso_tab2.Call();
	                }  
              break;  
       } 
        
}

function OnCheckInquiry()
{
    var ctrl 	= Grid_Detail.GetGridControl();
	var i;
	var j;
	var codei;
	
	i = 1;
	while (i < ctrl.Rows)
    {
        if (Grid_Detail.GetGridData(i, 4) == '')
        {
            alert('   Item Code in row '+ i +' is not null. Please check again!!!'+'\n'+'Item Code ở dòng '+ i +' không được rỗng. Bạn hãy kiểm tra lại!!!');
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
	        codei = Grid_Detail.GetGridData(i, 4);
	        while (j < ctrl.Rows)
	        {
	            codej = Grid_Detail.GetGridData(j, 4);
	            if (codei == codej)
	            {
	                alert('  Item Code in row '+ j +' exists. Please check again!!!'+'\n'+'Level Code ở dòng '+ j +' đã tồn tại. Bạn hãy kiểm tra lại!!!')
	                return false;
	            }
	            j = j + 1;
	        }
	        i = i + 1;
        }
    }
	return true;
}

function OnDelete(obj)
{
    switch(obj)
    {
        case 'Tab1':
            if(confirm('Are you sure you want to delete ?'))
            {
                flag='Delete';
                dso_update.StatusDelete();
                dso_update.Call();
            } 
        break;
        case 'Tab2':
            var ctrl 	= Grid_Detail.GetGridControl();
	        var rownum  = ctrl.Rows - 1;
	        if (ctrl.Row < 0) 
	        {
	            if (rownum > 0)
	            {
	                alert('Please select Item Code for delete.'+'\n'+'Yêu cầu lựa chọn tài khoản để xóa');
	                return;
	            }
	        }
	        else
	        {
	            if (confirm('Are you sure you want to delete Item Code?'+'\n'+'  Bạn có chắc muốn xóa tài khoản này?'))
	            {
	                for (i=1; i < ctrl.Rows; i++ )
	                {
                        if (ctrl.isSelected(i) == true)
                        {
                            if(Grid_Detail.GetGridData(i, 0) == "")
	                        {
			                    Grid_Detail.RemoveRowAt(i);
			                    i = i - 1;
		                    }
		                    else
		                    {
						        Grid_Detail.DeleteRow();
						        dso_tab2.Call();
		                    }
		                }
                    }
                }
	        }
        break;
    }
       
}

function OnSearch(obj)
{
    switch(obj)
    {
        case 'Tab1':
           flag='Search';
           if(txtProjectM_Pk.text != '')
           { 
                dso_tree.Call('SELECT');
            }
           else
           {
                alert('Please select Project !!');
           } 
        break;
        case 'Tab2':
            dso_tab2.Call('SELECT');
        break;
    }
}

function OnDataReceive(obj)
{
        switch(obj.id)
       {
            case 'dso_tree':
                    
            break;
            case 'dso_update':
                if(flag!='Search')
              {
                    flag='Search';
                    dso_tree.Call('SELECT');
              }  
            break;
            case 'dso_tab2':
                for(i=1;i<Grid_Detail.rows;i++)
                {
                    Grid_Detail.SetGridText(i, 2, i);
                    if(Grid_Detail.GetGridData(i,9)== "0")
				    {
					    Grid_Detail.SetCellBold(i,0,i,9,true);
				    }
				    else
				    {   
					    Grid_Detail.SetCellBold(i,0,i,9,false);
				    }

                    if (Grid_Detail.GetGridData(i,G_1_Level)== "0" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XF4E6E0'));
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "1" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X99CCFF'));
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "2" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCCFFCC'));
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "3" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCCFF00'));//3 00CCFF
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "4" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XFF99CC'));//4
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "5" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCC9999'));//5
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "6" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X009933'));//6m
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "7" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XCC6633'));//7
				}
				else if (Grid_Detail.GetGridData(i,G_1_Level)== "8" && Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "0")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0X006666'));//8
				}
				else if (Grid_Detail.GetGridData(i,G_1_Leaf_Y_N)== "-1")
				{
					Grid_Detail.SetCellBgColor(i,G_1_PK,i,G_1_parent_pk, Number('0XEFFFFF'));
				}
                }   
            break;
            case 'dso_getitem':
                alert(txtstatus.text);
                dso_tab2.Call('SELECT');
            break;
       } 
}

function OnClick()
{
    var obj = event.srcElement.GetCurrentNode();
	txtPk.SetDataText( obj.oid );
    dso_update.Call("SELECT");
}

function OnGetItem()
{
    if(txtProject2_Pk.text != '')
    {
        dso_getitem.Call();
    }
    else
    {
        alert('Please select Project !!');
    }
}

function OnPrint()
{
    if(Grid_Detail.rows > 1)                                                 
	 {
		 var url = '/reports/61/07/61070020_item_code_inquiry.aspx?p_Project_pk=' + txtProject2_Pk.text + '&p_level_code='+txtProgress_Item.text + '&Project_Nm=' + txtProject2_Nm.text;
			 System.OpenTargetPage( System.RootURL+url , "newform" );  
	}
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Progress Plan Item</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<body>
<gw:data id="dso_getitem" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="PM_PRO_61070020_TAB2_GETITEM"> 
                <input> 
                     <input bind="txtProject2_Pk"/>
                </input>
                <output>
                     <output bind="txtstatus"/>
                 
               </output> 
            </dso> 
        </xml> 
    </gw:data>  

<gw:data id="dso_tree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="PM_SEL_61070020_TREE" > 
                <input>
                    <input bind="txtProjectM_Pk" />    
                    <input bind="txtItem" />  
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    
<gw:data id="dso_update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="PM_SEL_61070020"   procedure="PM_UPD_61070020"> 
            <inout> 
                <inout bind="txtPk"/>
                <inout bind="txtParent_Pk" /> 
                <inout bind="txtProject_Pk" /> 
              <inout bind="txtProject_Cd" />
                <inout bind="txtProject_Nm" />  
                <inout bind="txtParent_Cd" />
                <inout bind="lstLevel" />
                <inout bind="txtProgress_Id" />
                <inout bind="chkLeaf_YN" />
                <inout bind="txtProgress_Nm" />
                <inout bind="txtLocal_Nm" />
                <inout bind="txtForeign_Nm" />
                <inout bind="txtDescription" />
            </inout>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_tab2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="PM_SEL_61070020_TAB2" procedure="PM_UPD_61070020_TAB2" > 
                <input>
					<input bind="txtProject2_Pk" />   
                    <input bind="txtProgress_Item" /> 
		         </input> 
                <output bind="Grid_Detail" /> 
            </dso> 
        </xml> 
    </gw:data>
 <gw:tab id="idTab_Child"  onclick ="">
   <table name="Progress Item Entry" style="width: 100%; height: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1"  cellpadding="0" cellspacing="0">
        <tr style="height:100%" valign="top">
            <td id="left" style="width: 35%">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:4%">
                            <td>
                                    <fieldset style="padding:0">
                                        <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1">
                                                    <tr style="height: " >
                                                        <td align="right" width="20%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project_M')">Project</a></td>
                                                        <td width="80%" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="40%"><gw:textbox id="txtProjectM_Cd" readonly="true" styles='width:100%' /></td>
                                                                    <td width="60%"><gw:textbox id="txtProjectM_Nm"  readonly="true" styles='width:100%' /></td>
                                                                    <td width=""><gw:textbox id="txtProjectM_Pk" styles='width:100%;display:none' /></td>
                                                                    <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProjectM_Cd.text='';txtProjectM_Nm.text='';txtProjectM_Pk.text='';" /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: " >
                                                        <td style="width: 10%; white-space: nowrap" align="right">Item</td>
                                                        <td width="90%"><gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('Tab1')" /></td>
                                                        <td ><gw:imgbtn id="btnS" img="search" alt="Search" onclick="OnSearch('Tab1')" /></td>
                                                    </tr>
                                        </table>
                                      </fieldset>  
                            </td>
                    </tr>
                    <tr style="height: 96%" valign="top">
                        <td  valign="top" width="100%"><gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree></td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 65%;height:100%" valign="top">
                    <table style="width: 100%; height: " cellpadding="1" cellspacing="1">
                            <tr>
                                    <td align="right" width="20%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">Project</a></td>
                                    <td width="80%" colspan="3">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="40%"><gw:textbox id="txtProject_Cd" csstype="mandatory" readonly="true" styles='width:100%' /></td>
                                                <td width="60%"><gw:textbox id="txtProject_Nm" csstype="mandatory" readonly="true" styles='width:100%' /></td>
                                                <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
                                                <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                               <td ><gw:imgbtn id="btnSave1" img="new" alt="New" onclick="OnNew('Tab1')" /></td>
                                                <td ><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Tab1')" /></td>
                                                <td ><gw:imgbtn id="btnSave2" img="delete" alt="Delete"  onclick="OnDelete('Tab1')" /></td> 
                                            </tr>
                                        </table>
                                    </td>
                            </tr>
                            <tr>
                                    <td align="right"  width="15%">Parent Code</td>
                                    <td width="55%"><gw:textbox id="txtParent_Cd"  readonly="true" styles='width:100%' /></td>
                                   <td align="right" width="11%">Level</td>
                                   <td style="width:15%"><gw:list id="lstLevel" text="" styles="width:100%" /></td> 
                            </tr>
                            <tr>
                                    <td align="right"  width="">Progress Id</td>
                                    <td width=""><gw:textbox id="txtProgress_Id" csstype="mandatory" styles='width:100%' /></td>
                                   <td align="right" width="">Leaf  Y/N</td>
                                   <td align="left"><gw:checkbox id="chkLeaf_YN" value="N" defaultvalue="Y|N"/></td>
                            </tr>
                            <tr>
                                    <td align="right"  width="">Progress Name</td>
                                    <td width="" colspan="3"><gw:textbox id="txtProgress_Nm" csstype="mandatory" styles='width:100%' /></td>
                            </tr> 
                            <tr>
                                    <td align="right"  width="">Local Name</td>
                                    <td width="" colspan="3"><gw:textbox id="txtLocal_Nm" styles='width:100%' /></td>
                            </tr> 
                            <tr>
                                    <td align="right"  width="">Foreign Name</td>
                                    <td width="" colspan="3"><gw:textbox id="txtForeign_Nm" styles='width:100%' /></td>
                            </tr> 
                            <tr>
                                    <td align="right"  width="">Description</td>
                                    <td width="" colspan="3"><gw:textbox id="txtDescription" styles='width:100%' /></td>
                            </tr> 
                   </table> 
            </td>
    </tr>
</table>        
<table name="Progress Item Inquyiry" style="width: 100%; height: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1"  cellpadding="0" cellspacing="0">
        <tr style="height:4%" valign="top">
                 <td>
                        <fieldset style="padding:0">
                                <table cellpadding="1" cellspacing="1" width="100%" style="height:100%">
                                        <tr style="height:">
                                                <td align="right" width="13%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project_2')">Project</a></td>
                                                <td width="87%" colspan="">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td width="40%"><gw:textbox id="txtProject2_Cd"  readonly="true" styles='width:100%' /></td>
                                                            <td width="60%"><gw:textbox id="txtProject2_Nm"  readonly="true" styles='width:100%' /></td>
                                                            <td width=""><gw:textbox id="txtProject2_Pk" styles='width:100%;display:none' /></td>
                                                            <td><gw:imgbtn id="btfve2" img="reset" alt="Reset" onclick="txtProject2_Cd.text='';txtProject2_Nm.text='';txtProject2_Pk.text='';" /></td>
                                                           
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td ><gw:imgbtn id="btnSfave1" img="search" alt="Search" onclick="OnSearch('Tab2')" /></td>
                                               <td ><gw:imgbtn id="btnSfavde1" img="create" alt="Get Data from Main Contract" onclick="OnGetItem()" /></td> 
                                               <td ><gw:imgbtn id="btnSfave1" img="new" alt="New" onclick="OnNew('Tab2')" /></td>
                                                <td ><gw:imgbtn id="btnSsave" img="save" alt="Save" text="Save" onclick="OnSave('Tab2')" /></td>
                                                <td ><gw:imgbtn id="btnSavse2" img="delete" alt="Delete"  onclick="OnDelete('Tab2')" /></td> 
                                               <td ><gw:imgbtn id="btnSavse3" img="excel" alt="Print"  onclick="OnPrint()" /></td>  
                                        </tr>  
                                        <tr style="height:">
                                                <td align="right">Progress Item</td>
                                                 <td width="" colspan="">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                                <td width="70%"><gw:textbox id="txtProgress_Item"  styles='width:100%' /></td>
                                                                <td width="10%" align="right">Level&nbsp;</td>
                                                                <td style="width:20%"><gw:list id="lstLevel2" text="" styles="width:100%" /></td> 
                                                        </tr>
                                                    </table>
                                                </td>  
                                        </tr>
                                       
                                </table>  
                        </fieldset>  
                 </td>
       </tr> 
        <tr style="height:96%;width:100%">
                    <td colspan="" >
                        <!--header  ="_PK|No|Parent Code|Progress Item Code|Progress Item Name|Local Name|Foreign Name|Level|Leaf Y/N|Description"-->
                                <gw:grid
                                id="Grid_Detail"
                                header  ="_PK|_Project_pk|No|Parent Code|Progress Item Code|Progress Item Name|Local Name|Foreign Name|Level|Leaf Y/N|Description|_parent_pk"
                                format  ="0|0|0|0|0|0|0|0|0|3|0|0"
                                aligns  ="0|0|1|0|0|0|0|0|1|3|0|0"
                                defaults="|||||||||||"
                                editcol ="1|1|1|1|1|1|1|1|1|1|1|1"
                                widths  ="0|0|600|1500|2000|2500|2500|2500|1000|1000|2500|0"
                                styles  ="width:100%; height:100%"
                                sorting ="T" 
                                oncellclick="OnSelect()"
                                />
		            </td>
            </tr>
</table>         
</gw:tab>
   <gw:textbox id="txtPk" styles='width:100%;display:none' />
    <gw:textbox id="txtParent_Pk" styles='width:100%;display:none' />
        <gw:textbox id="txtstatus" styles='width:100%;display:none' />

</body>
</html>
