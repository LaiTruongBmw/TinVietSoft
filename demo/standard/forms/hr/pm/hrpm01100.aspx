<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);
    btnAddSub.SetEnable(false);
    lstType.SetEnable(false);
    txtUpperPosGrp.SetEnable(false);
  	datPos_Grp_Tree.Call("SELECT");  	
}
//---------------------------------------
function AddOnClick()
{
	datPos_Grp_Entry.StatusInsert();
     var obj = tvPos_Grp.GetCurrentNode();
    txtPos_Grp_PK.text= obj.oid;
    var obj_par=tvPos_Grp.GetParentNode(obj);
    if(isNaN(obj_par.oid))
    {
        txtUpper_PK.text="";
        txtPos_Grp_PK.text= "";
        lstType.value=0;
    }
    else
    {
        txtUpper_PK.text=obj_par.oid;
        txtPos_Grp_PK.text= "";
        lstType.value=1;
    }
}
/*-----------------------------*/
function Add_subOnClick()
{
    datPos_Grp_Entry.StatusInsert();
    var obj = tvPos_Grp.GetCurrentNode();
    txtPos_Grp_PK.text= obj.oid;	
   	txtUpper_PK.text=obj.oid;
    txtPos_Grp_PK.text= "";
    lstType.value=1;
}
/*-------------------------------------*/
function DeleteOnClick()
{
    if (grdRate.rows>1) 
    {
        alert("Have several rates, delete rates first? \n Đã có dữ liệu thang lương, hãy xóa dữ liệu thang lương trước");
        return;
    }
    if(confirm("Are you sure you want to delete?" ))
	{
	    datPos_Grp_Entry.StatusDelete();
	    datPos_Grp_Entry.Call();
	}
}
/*-----------------------------*/
function UpdateOnClick()
{
    
	if (confirm("Do you want to save data?"))
	{
	    if (CheckUpdate())
	    {
		    if(datPos_Grp_Entry.GetStatus()!=20 && datPos_Grp_Entry.GetStatus()!=40)
			{			    
			        datPos_Grp_Entry.StatusUpdate();			       
			}	
		    datPos_Grp_Entry.Call();
    	}	
	}
}
//--------------------------
function OnCheckID()
{
    if (txtPosGrp_ID.text!="")
    {
        datCheckPosGrpID.Call();
    }
}
//-----------------------------
function CheckUpdate()
{
    if (txtPosGrp_ID.text=="")
    {
        alert("Please input Position Group ID!\n Vui lòng nhập Position Group ID");
        txtPosGrp_ID.GetControl.focus();
        return false;
    }
    if (txtPosGrp_Name.text=="")
    {
        alert("Please input Position Group Name!\n Vui lòng nhập Position Group Name");
        txtPosGrp_Name.GetControl.focus();
        return false;
    }
    
    return true;
}
//------------------------------------------
function treeItemOnclick()
{
    var obj = tvPos_Grp.GetCurrentNode();
    txtPos_Grp_PK.text= obj.oid;
    var obj_par=tvPos_Grp.GetParentNode(obj);
    if(isNaN(obj_par.oid))
    {
        btnAddSub.SetEnable(true);
        txtUpperPosGrp.text="";
        btnAdd_Rate.SetEnable(false);
        btnDelete_Rate.SetEnable(false);
        btnUpdate_Rate.SetEnable(false);
    }
    else
    {
        btnAddSub.SetEnable(false);
        txtUpperPosGrp.text=obj_par.text;
        btnAdd_Rate.SetEnable(true);
        btnDelete_Rate.SetEnable(true);
        btnUpdate_Rate.SetEnable(true);
    }
    
	datPos_Grp_Entry.Call("SELECT");
}
//---------------------------------------------------------------
function checkDupItems(obj_grid,obj_col,obj_col_dis)
{
    var ctrl 	= obj_grid.GetGridControl();
    var rownum 	= ctrl.Rows;
    if(rownum == 1)
    {
	    return false;
    }
    var i;
    for(i=1; i<rownum; i++)
    {
        
      for(j=i+1; j<rownum; j++)
      {
  	    var i_code 	= obj_grid.GetGridData(i, obj_col);
	    i_code		= i_code.toUpperCase();
	    var j_code 	= obj_grid.GetGridData(j, obj_col);
	    j_code		= j_code.toUpperCase();
    	
	    if(j_code == i_code)
	    {
		    if(j_code !="" )
		    {
			    alert("Code already in use, please re-enter at row " + (j) + " and column " + obj_col_dis );
			    return false;
		    }
	    }
      }	
    }
    return true;
}
//------------------------------------
function OnSearchTree()
{    
    datPos_Grp_Tree.Call();
}
//------------------------------------------
function OnDataReceive(dso)
{
    
    if (dso.id=="datPos_Grp_Entry")
    {
        if( datPos_Grp_Entry.GetStatus()==0 )
        {
            datPos_Grp_Tree.Call("SELECT");            
        }
    }
    if(dso.id=="datPos_Grp_Tree")
    {    
        datAllowance.Call("SELECT");
    }
    if(dso.id=="datAllowance")
    {        
        var icol=6; //value of allowance col
        grdRate.SetGridText(0,icol,grdAllowance.GetGridData(1,0));
        grdRate.SetGridText(0,icol+1,grdAllowance.GetGridData(1,1));
        grdRate.SetGridText(0,icol+2,grdAllowance.GetGridData(1,2));
        grdRate.SetGridText(0,icol+3,grdAllowance.GetGridData(1,3));
        grdRate.SetGridText(0,icol+4,grdAllowance.GetGridData(1,4));
        grdRate.SetGridText(0,icol+5,grdAllowance.GetGridData(1,5));
        grdRate.SetGridText(0,icol+6,grdAllowance.GetGridData(1,6));
        grdRate.SetGridText(0,icol+7,grdAllowance.GetGridData(1,7));
        grdRate.GetGridControl().ColHidden(icol)=!(Number(grdAllowance.GetGridData(1,8)));
        grdRate.GetGridControl().ColHidden(icol+1)=!(Number(grdAllowance.GetGridData(1,9)));
        grdRate.GetGridControl().ColHidden(icol+2)=!(Number(grdAllowance.GetGridData(1,10)));
        grdRate.GetGridControl().ColHidden(icol+3)=!(Number(grdAllowance.GetGridData(1,11)));
        grdRate.GetGridControl().ColHidden(icol+4)=!(Number(grdAllowance.GetGridData(1,12)));
        grdRate.GetGridControl().ColHidden(icol+5)=!(Number(grdAllowance.GetGridData(1,13)));
        grdRate.GetGridControl().ColHidden(icol+6)=!(Number(grdAllowance.GetGridData(1,14)));
        grdRate.GetGridControl().ColHidden(icol+7)=!(Number(grdAllowance.GetGridData(1,15)));        
    }
    if (dso.id=="datCheckPosGrpID")
    {        
        if (txtResult.text!="0")
        {
            alert("Duplicated Position Group Id, please input another! \n Trùng ID nhóm chức danh, vui lòng nhập ID khác!");
            var crtl=txtPosGrp_ID.GetControl();
            crtl.focus();
        }
    }
    if (dso.id=="datPos_Grp_Entry")
    {
        datSalaryRate.Call("SELECT");
    }    
}
//-------------------------------------
function OnAddRate()
{
    if (txtPos_Grp_PK.text=="")
    {
        alert("Don't have information of Position Group, please select one \n Chưa có thông tin nhóm chức danh, vui lòng chọn một nhóm")
        return;
    }    
    if (lstType.value=="0")
    {
        alert("Please select position group having Data type \n Vui lòng chọn nhóm chức danh có kiểu dữ liệu")
        return;
    }
    grdRate.AddRow();
    grdRate.SetGridText(grdRate.rows-1,5,txtPos_Grp_PK.text);
}
//-------------------------------------
function OnDeleteRate()
{
    if (confirm("Do you want to delete information of rate\n Bạn có muốn xóa thông tin về thang lương?"))
    {
        grdRate.DeleteRow();
    }
}
//-------------------------------------
function OnUpdateRate()
{
    if (confirm("Do you want to save information of rate\n Bạn có muốn cập nhật thông tin về thang lương?"))
    {
        if ( checkDupItems(grdRate,0,1))
            datSalaryRate.Call();
    }
    
}
</script>

<body>
<gw:data id="datPos_Grp_Tree" onreceive="OnDataReceive(this)"   > 
        <xml> 
            <dso id="1" type="tree" function="ST_HR_PRO_HRPM01100_0" > 
                <input>
                    <input bind="lstUpperPos_Grp" />
                </input> 
                <output bind="tvPos_Grp" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
<gw:data id="datCheckPosGrpID"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process"  procedure="ST_HR_PRO_HRPM01100_1" > 
                <input>
                    <input bind="txtPos_Grp_PK" /> 
                    <input bind="txtPosGrp_ID" /> 
                </input> 
                <output> 
                    <output bind="txtResult" />
                </output>  
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_CO_ALLOW_SALARY" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>
<!--------------------------------------->

<gw:data id="datPos_Grp_Entry"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7" function = "ST_HR_SEL_HRPM01100_0" procedure="ST_HR_UPD_HRPM01100_0"> 
            <inout> 
                <inout bind="txtPos_Grp_PK" />
                <inout bind="txtUpper_PK" />
                <inout bind="txtPosGrp_ID" />
                <inout bind="txtPosGrp_Name" />
                <inout bind="txtPosGrp_KName" /> 
                <inout bind="txtPosGrp_LName" />
                <inout bind="lstType" />
                <inout bind="txtareaDescription" /> 
             </inout>
        </dso> 
    </xml> 
</gw:data> 

<!---------------------------------------------------------->
<gw:data id="datSalaryRate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="ST_HR_SEL_HRPM01100_1" procedure="ST_HR_UPD_HRPM01100_1">
                <input bind="grdRate" >
                    <input bind="txtPos_Grp_PK" />
                </input>
                <output  bind="grdRate" />
            </dso> 
        </xml> 
</gw:data>


<!------------------------------------------------------------>
   <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
	<tr height="5%">
		<td width="30%" >
			<!-- Table1 contain master buttons and text box -->
			<table id="LeftTopTB" width="100%" height="100%" >
				<tr>
					<td width="100%">
						<table id="LeftTopTB1" height="15" width="100%" border="0" cellpadding=0 cellspacing=0>
							<tr>
								<td width="40%" align="left"><font color="black" >Position Group</font></td>
								<td width="56%">
									 <gw:list id="lstUpperPos_Grp" styles='width:100%' value='ALL' onchange="OnChange_com()"> 
										 <data><%=CtlLib.SetListDataSQL("select PK,POS_GRP_NAME from thr_position_grp where del_if=0 and upper_pk is null order by pos_grp_id")%>|ALL|Select All</data> 
									 </gw:list> 
								</td>
								<td width="4%" align="right"><gw:button id="btnSearch" img="search" text="Search" alt="search" onclick="OnSearchTree()" /> </td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
			<!-- End of Table1--->
		</td>
		<td width="70%" >
			<!-- Table2 contain detail buttons and text box -->
			<table id="RightTopTB" width="100%" style="background:#FBEFF2" >
				<tr>
					<td width="78%"></td>
					<td width="4%"><gw:button img="new"   text= "Add New" 	   alt="New"    	id="btnAdd"     onclick="AddOnClick()" /></td>		
					<td width="4%"><gw:button img="new"  text= "Add New Sub"  	alt="New Sub"    id="btnAddSub" 	onclick="Add_subOnClick()" /></td>		
					<td width="4%"><gw:button img="delete" 	 text= "Delete"  alt="Delete"     id="btnDelete" 	onclick="DeleteOnClick()" /></td>  
					<td width="4%"><gw:button img="save"   text= "Save"	   alt="Save"   	id="btnUpdate" 	onclick="UpdateOnClick()" /></td>
					
				</tr>
			</table>
		</td>
	
	</tr>
	<tr height="95%">
		<td width="30%" > 
			<table id="LeftBottomTB" width="100%" height="100%" >
				<tr>
					<td> <!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"--> 
						<gw:tree  id="tvPos_Grp" style="width:100%; height:100%;overflow:auto;" onclicknode="treeItemOnclick()" >
						</gw:tree>
					</td>
				</tr>
			</table>			
		</td>
		<td width="70%" height="95%">
			<!-- Table2 contain detail grid -->
			<table id="RightBottomTB" width="100%" height="100%"  align="top"  height="100%" border=0 cellpadding=0 cellspacing=0>
				<tr >
						<td width="100%"> 
							<table width="100%"  height="100%" border=0 >
							        <tr height="5%"> 
									    <td width="20%" align="right"  style="border:0;color:Red">Upper Position Group</td>
									    <td width="30%"><gw:textbox id="txtUpperPosGrp"  styles='width:100%;' /></td>
									   <td  width="20%" align="right"><font color="black" >Type</font></td>
								        <td width="30%">
								         <gw:list id="lstType" value="0" styles='width:100%'> 
									         <data>DATA|0|Upper|1|Data</data> 
								         </gw:list> 
								        </td>
								  </tr>
								   <tr height="5%"> 
									    <td  align="right">Position Group ID</td>
									    <td><gw:textbox id="txtPosGrp_ID" maxlen="10" styles='width:100%'    onBlur="OnCheckID()"   csstype="mandatory"/></td>
									    <td  align="right"><font color="black" >Postion Group Name</font></td>
									    <td ><gw:textbox id="txtPosGrp_Name" maxlen="100" styles='width:100%'   csstype="mandatory"/></td>
								  </tr>
								  <tr height="5%"> 
								    <td align="right"><font color="black" >Postion Group KName</font></td>
									<td ><gw:textbox id="txtPosGrp_KName" maxlen="100" styles='width:100%'  csstype=""/></td>
									<td  align="right"><font color="black" >Postion Group LName</font></td>
									<td ><gw:textbox id="txtPosGrp_LName" maxlen="100" styles='width:100%'   csstype=""/></td>
								  </tr>
								  <tr height="15%"> 
								    <td align="right"><font color="black" >Description</font></td>
									<td colspan=3> <gw:textarea id="txtareaDescription" maxlen="100" styles='width:100%' />
									  </td>
								  </tr> 
							</table>
						</td>		
					</tr>
					<tr height="70%">
					    <td height="100%">
							<table id="tblRate" border=1 style="width:100%; height:100%" cellpadding=0 cellspacing=0>
								            <tr height="10%" >
								                <td width="88%" style="border:0"></td>
					                            <td width="4%"  style="border:0"><gw:button img="new"    	text="Add New"   alt="New"    	id="btnAdd_Rate"     onclick="OnAddRate()" /></td>		
					                            <td width="4%"  style="border:0"><gw:button img="delete" 	text="Delete"   alt="Delete"     id="btnDelete_Rate" 	onclick="OnDeleteRate()" /></td>  
					                            <td width="4%"  style="border:0"><gw:button img="save"   	text="Save"   alt="Save"   	id="btnUpdate_Rate" 	onclick="OnUpdateRate()" /></td>
								            </tr>
								            <tr height="90%">
								                <td colspan=5>
								                    <gw:grid id='grdRate'
                                                    header='RATE|PERCENT|SALARY|REMARK|_RATE_PK|_POSGRP_PK|ALLOW 1|ALLOW 2|ALLOW 3|ALLOW 4|ALLOW 5|ALLOW 6|ALLOW 7|ALLOW 8'
                                                    format='0|0|1|0|0|0'
                                                    aligns='1|1|0|0|0|0'
                                                    defaults='|||||'
                                                    editcol='1|1|1|1|1|1'
                                                    widths='1000|1500|1500|1000|1000|1000'
                                                    sorting='T'
                                                    styles='width:100%; height:100%'
                                                    />
								                </td>
								            </tr>
							</table>
						</td>	
				    </tr>
			</table>
			<!-- End of Table2 -->		
		</td>
	</tr>	
</table>
<gw:textbox id="txtPos_Grp_PK" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtUpper_PK" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtResult" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 7"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0"  
    defaults="||||||||||||||"  
    editcol="0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200"  
    styles="display:none;width:100%" 
    sorting="T"    
/>
</body>
</html>
