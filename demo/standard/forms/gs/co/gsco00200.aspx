<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<% CtlLib.SetUser("comm")%>

<script>
//test svn
var addFlag = 'F';
var codeadmin_yn;
codeadmin_yn ="<%=Session("CODEADMIN_YN")%>";
//codeadmin_yn="Y";
function BodyInit()
{
    System.Translate(document); 
    ibtnUpdate.SetEnable(false);
	ibtnAdd.SetEnable(false);
	ibtnDelete.SetEnable(false);
	ibtnDelete1.SetEnable(false);
	
	if(codeadmin_yn == "Y")
	{
		icoMaster.style.display = ''; 
		//idData_Dsql_TCode_MST.Call('SELECT');
	}
	else
	{
		icoMaster.style.display = 'none'; 
		//idData_Dsql_TCode_MST_SYS.Call('SELECT');
	}
	txtInput_SYS.text=codeadmin_yn;
	datCodeGroupTree.Call("SELECT");	
}
//------------------------------------------------------
function checkItemLength()
{
    var ctrl 	= grdDTL.GetGridControl();
    var rownum 	= ctrl.Rows;

    if(rownum == 1)return false;

    var i;
    for(i=1; i<rownum; i++)
    {
	    if(grdDTL.GetGridData(i, 0) != "")
	    {
		    if(grdDTL.GetGridData(i, 2)==""  )
		    {
			    alert("Please enter ORD at row " + i + " ...");
			    return false;
		    }
		    if(grdDTL.GetGridData(i, 4)==""  )
		    {
			    alert("Please enter Code at row " + i + " ...");
			    return false;
		    }
		    else
		    {
			    if(grdDTL.GetGridData(i, 5)=="" )
			    {
				    alert("Please enter Code Name at row " + i + " ...");
				    return false;
			    }
		    }
		    if(grdDTL.GetGridData(i, 4).length > txtCODE_LEN.GetData())
		    {
			    alert("Please enter Code length at row " + i + " less or equal " + txtCODE_LEN.GetData() + " character ...");
			    return false;
		    }
    		
	    }
	    else
	    {
		    if(grdDTL.GetGridData(i, 4)!=""  )
		    {
			    if(grdDTL.GetGridData(i, 5)=="" )
			    {
				    alert("Please enter Code Name at row " + i + " ...");
				    return false;
			    }
			    if(grdDTL.GetGridData(i, 4).length > txtCODE_LEN.GetData())
			    {
				    alert("Please enter Code length at row " + i + " less or equal " + txtCODE_LEN.GetData() + " character ...");
				    return false;
			    }
			    if(grdDTL.GetGridData(i, 2)==""  )
			    {
				    alert("Please enter ORD at row " + i + " ...");
				    return false;
			    }
		    }
	    }
    }
    return true;
}
//------------------------------------------------------
function checkNumber()
{
	var ctrl 	= grdDTL.GetGridControl(); 
	var rownum 	= ctrl.Rows;
	
	if(rownum == 1)return false;
	
	var i;
	for(i=1; i<rownum; i++)
	{
	 	for(j=11; j <= 13; j++)
		{
			var ij_num 	= grdDTL.GetGridData(i, j);
			ij_num		= ij_num.toUpperCase();
			if (isNaN(ij_num))
			{
				alert("Please enter is number at col " + i + " and " + j);
				return false;
			}
			if (parseInt(ij_num) < -1)
			{
				alert("Please enter is number >= -1 at col " + i + " and " + j);
				return false;
			}
		}	
	}
	return true;
}
//------------------------------------------------------
function checkDupItems()
{
    var ctrl 	= grdDTL.GetGridControl();
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
  	    var i_code 	= grdDTL.GetGridData(i, 4);
	    i_code		= i_code.toUpperCase();
	    var j_code 	= grdDTL.GetGridData(j, 4);
	    j_code		= j_code.toUpperCase();
    	
	    if(j_code == i_code)
	    {
		    if(j_code == "" ){	}
		    else
		    {
			    alert("Code already in use, please re-enter at rows " + i + " and " + j);
			    return false;
		    }
	    }
      }	
    }
    return true;
}
//-----------------------------------------------------
function checkDupItem()
{
   var ctrl 	= grd3.GetGridControl();
   var rownum 	= ctrl.Rows;
   if(rownum == 1)
   		return true;
   var i;
   
   for(i=1; i<rownum; i++)
   {
      	var i_code 	= grd3.GetGridData(i, 4);
		i_code		= i_code.toUpperCase();
		
		var ctrl_1	= grdDTL.GetGridControl();
		var row_1 	= ctrl_1.Rows;
		var cnt = 0;
		for(j=1; j<row_1; j++)
		{
			var j_code 	= grdDTL.GetGridData(j, 4);
			j_code		= j_code.toUpperCase();
			
			if(grdDTL.GetGridData(j, 1) == grd3.GetGridData(i, 1))
			{
				if(j_code == i_code)
				{
					cnt = cnt + 1;
					if(cnt >=2 )
					{
						alert("Code code already in use, please re-enter at rows " + i );
						return false;
					}
				}
			}
	 	}
	}
   	return true;
}
//------------------------------------------------------
function TabPopUp(fnameFile)
{
	var fpath = System.RootURL + "/standard/forms/gs/co/" + fnameFile  ;
	var aValue  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
}
//------------------------------------------------------
function treeItemOnclick()
{
    var obj = treMaster.GetCurrentNode();	
	txtInput_PK.text = obj.oid;
	datCode_MST_Value.Call("SELECT");
	    
}
//------------------------------------------------------
function OnRecv_Value()
{
    idData_Dsql_Code_DTL_Value.Call("SELECT"); 
}
//------------------------------------------------------
function AddOnClick()
{
    
    if(txtInput_PK.GetData() == "")
    {
		alert("Please select one group name")
	}
	else
	{
		if(txtInput_USEYN.GetData() == 0)
		{
			
			var control = grdDTL.GetGridControl();
			grdDTL.AddRow();
			var row = control.Rows  - 1;
			grdDTL.SetGridText( row , 1, txtInput_PK.GetData());
			preparedModify();
			
			
		}
		else
		{
			txtInput_USEYN.SetDataText("0");
			addFlag = "T";
			OnChange_Use();
		}
	}
}
function preparedModify()
{
	var ipos = 1 ;
	var jpos = 10;
	for (i=1; i<grdDTL.rows; i++)
	{
		if(grdDTL.GetRowStatus(ipos) != 64)
		{
		    
			grdDTL.SetGridText( ipos, 2, jpos  );
			jpos = jpos+10;
		}
		ipos ++;
	}	
	
}
//--------------------------------------------------------
//--------------------------------
function DeleteOnClick()
{
    if(confirm("Do you want to delete?"))
    {    
        grdDTL.DeleteRow();
        ibtnDelete.SetEnable(false);
		ibtnDelete1.SetEnable(true);
    }
        
}
//--------------------------------------------------------
function UnDeleteOnClick()
{
    if(confirm("Do you want to undelete?"))
    {
        grdDTL.UnDeleteRow();
        ibtnDelete.SetEnable(true);
		ibtnDelete1.SetEnable(false);
    }    
}

//-----------------------------------------------------------
function UpdateOnClick()
{
    if(checkItemLength() && checkDupItems() && checkDupItem() && checkNumber()   && checkORD())
	{
		datCode_DTLs.Call(); 
	}	
		
}
//------------------------------------------------------
function checkORD()
{
	var ctrl	= grdDTL.GetGridControl();
	var row 	= ctrl.Rows;
	var cnt = 0;
	if(ctrl.Row >1 )
	{
		for(i=1; i<row; i++)
		{
			var data = grdDTL.GetGridData(i, 2);
			if(isNaN(data))
			{
				alert("Please enter at col " + i + " and " + j + " is number");
				return false;
			}
			if (parseInt(data) < 0)
			{
				alert("Please enter at col " + i + " and " + j + " is number");
				return false;
			}
		}
	}
	return true;
}
//------------------------------------------------------
function checkData()
{
	var ctrl 	= grdDTL.GetGridControl();
	var rownum 	= ctrl.Row;
	var rownums 	= ctrl.Rows;
	if(rownum < 0){
		if(rownums > 1){}
	}
	else
	{
		if(codeadmin_yn == "Y")
		{
			if(txtDTL_TYPE.GetData() == 1) {
				ibtnUpdate.SetEnable(false);
				ibtnAdd.SetEnable(false);
				ibtnDelete.SetEnable(false);
				ibtnDelete1.SetEnable(false);
			}
			else
			{
				ibtnUpdate.SetEnable(true);
				ibtnAdd.SetEnable(true);
				if(grdDTL.GetRowStatus(ctrl.Row) >= 64)
				{
					ibtnDelete.SetEnable(false);
					ibtnDelete1.SetEnable(true);
				}
				else
				{
					ibtnDelete.SetEnable(true);
					ibtnDelete1.SetEnable(false);
				}
			}
		}
		else
		{
			if((txtDTL_TYPE.GetData() == 1) || (txtSYS_YN.GetData() =="Y"))
			{
				ibtnUpdate.SetEnable(false);
				ibtnAdd.SetEnable(false);
				ibtnDelete.SetEnable(false);
				ibtnDelete1.SetEnable(false);
			}
			else
			{	
				ibtnUpdate.SetEnable(true);
				ibtnAdd.SetEnable(true);
				if(grdDTL.GetRowStatus(ctrl.Row) >= 64)
				{
					ibtnDelete.SetEnable(false);
					ibtnDelete1.SetEnable(true);
				}
				else
				{
					ibtnDelete.SetEnable(true);
					ibtnDelete1.SetEnable(false);
				}
			}
		}
	}
}
function checkDefault()
{
    var ctrl	= grdDTL.GetGridControl();
	var row 	= ctrl.Rows;
	
	if(ctrl.Row >=1 && event.col == 3)
	{
		for(i=1; i<row; i++)
		{
			grdDTL.SetGridText( i , 3, "0");
		}
		grdDTL.SetGridText( ctrl.Row , 3, "-1");
	}
}
//--------------------------------
function Search()
{
    
	if(rdoDTL_KIND1.value == 1)
		txtnput_CODE_NM.SetDataText("");
	else
	{
		txtnput_CODE_NM.SetDataText(txtInput_CODE.GetData());
		txtInput_CODE.SetDataText("");
	}
	datCode_DTLs.Call("SELECT");
}
//--------------------------------
function OnChange_Use()
{
	datCode_DTLs.Call("SELECT");
}
//--------------------------------
function OnDataReceive(obj)
{
    if (obj.id=="datCode_MST_Value")
    {
        var ctrl 	= grdDTL.GetGridControl();
	    grdDTL.SetGridText( 0 , 11, txtREM_NUM1.GetData());
	    grdDTL.SetGridText( 0 , 12, txtREM_NUM2.GetData());
	    grdDTL.SetGridText( 0 , 13, txtREM_NUM3.GetData());	
	    grdDTL.SetGridText( 0 , 14, txtREM_CHA1.GetData());
	    grdDTL.SetGridText( 0 , 15, txtREM_CHA2.GetData());
	    grdDTL.SetGridText( 0 , 16, txtREM_CHA3.GetData());
    	
	    datCode_DTL_lChkUnique.Call('SELECT');
    }    
    if (obj.id=="datCode_DTL_lChkUnique")
    {
        
        txtInput_USEYN.SetDataText("1");
	    datCode_dMSTs.Call("SELECT");
    }
    if (obj.id=="datCode_dMSTs")
    {
        
        var control = grddMST.GetGridControl();
	    var row = control.Row;
	    if(row > 1)
	    {
		    txtmCODE.SetDataText(grddMST.GetGridData(row, 1));
		    txtmREAMRK.SetDataText(grddMST.GetGridData(row, 4));
		    txtCODE_GRP.text 	= (grddMST.GetGridData(row, 5));
		    txtCODE_GRP_NM.text 	= (grddMST.GetGridData(row, 6));
    		
		    txtPK.SetDataText(grddMST.GetGridData(row, 7));
	    }
	    else
	    {
		    txtmCODE.SetDataText(grddMST.GetGridData(1, 1));
		    txtmREAMRK.SetDataText(grddMST.GetGridData(1, 4));
		    txtCODE_GRP.text 	= (grddMST.GetGridData(1, 5));
		    txtCODE_GRP_NM.text 	= (grddMST.GetGridData(1, 6));
    		
		    txtPK.SetDataText(grddMST.GetGridData(1, 7));
	    }
	    datCombo_Sub.Call();
    }
    if (obj.id=="datCombo_Sub")
    {
        
        var flag;
        if(txtData.text == "")
	    {
		    flag = 0;
		    grdDTL.SetColEdit(8, flag);
		    
	    }
	    else
	    {
		    flag = 1;
		    grdDTL.SetColEdit(8, flag);
		    grdDTL.SetColComboData (8, txtData.text);
		   
	    }
	   datCode_DTLs.Call("SELECT");
    }
    if (obj.id=="datCode_DTLs")
    {
        if(codeadmin_yn == "Y")
	    {
	        if(txtDTL_TYPE.GetData() == 1) {
			    ibtnUpdate.SetEnable(false);
			    ibtnAdd.SetEnable(false);
			    ibtnDelete.SetEnable(false);
			    ibtnDelete1.SetEnable(false);
		    }
		    else
		    {
			    ibtnUpdate.SetEnable(true);
			    ibtnAdd.SetEnable(true);
			    ibtnDelete.SetEnable(true);
			    ibtnDelete1.SetEnable(false);
		    }
	    }
	    else
	    {
		    if((txtDTL_TYPE.GetData() == 1) || (txtSYS_YN.GetData() =="Y"))
		    {
			    ibtnUpdate.SetEnable(false);
			    ibtnAdd.SetEnable(false);
			    ibtnDelete.SetEnable(false);
			    ibtnDelete1.SetEnable(false);
    			
		    }
		    else
		    {
			    ibtnUpdate.SetEnable(true);
			    ibtnAdd.SetEnable(true);
			    ibtnDelete.SetEnable(true);
			    ibtnDelete1.SetEnable(false);
		    }
	    }  
	    if(addFlag == "T")
	    {
		    grdDTL.AddRow();// Set Insert Status to true by call idGrid.StatusInsert()
		    var control = grdDTL.GetGridControl();
		    var row = control.Rows  - 1;
		    grdDTL.SetGridText( row , 1, txtInput_PK.GetData());
		    addFlag = "F";
		    preparedModify();
	    } 
    }
}
function OnDataError(oData)
{
  //alert(eval(oData).errmsg);
    if (eval(oData).errno == 20001)
    {
		alert("Database problem 1: "+ eval(oData).errmsg);
    }
    else if (eval(oData).errno == 20002)
    {
		alert("Database problem 2: "+ eval(oData).errmsg);
    }
	else if (eval(oData).errno > 0)
	{
		alert("Unexpected error: "+ eval(oData).errmsg);
	}	
	
}
</script>

<body>
    <!------------------------------>
    <gw:data id="datCodeGroupTree"> 
        <xml> 
            <dso id="1" type="tree" function="st_hr_sel_gsco00200_0" > 
                <input>
                    <input bind="txtInput_SYS" /> 
                </input> 
                <output bind="treMaster" /> 
            </dso> 
        </xml> 
</gw:data>
    <!------------------------------>
    <gw:data id="datCode_MST_Value" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="control" function="st_hr_sel_gsco00200_1" > 
                <inout> 
                    <inout  bind="txtInput_PK" /> 
                    <inout  bind="txtREM_NUM1" /> 
                    <inout  bind="txtREM_NUM2" /> 
                    <inout  bind="txtREM_NUM3" /> 
                    <inout  bind="txtREM_CHA1" /> 
                    <inout  bind="txtREM_CHA2" /> 
                    <inout  bind="txtREM_CHA3" /> 
                    <inout  bind="txtCODE_TYPE" /> 
                    <inout  bind="txtCODE_LEN" /> 
				    <inout  bind="txtDTL_TYPE" /> 
                    <inout  bind="txtSYS_YN" /> 
                </inout> 
                
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------>
    <gw:data id="datCode_DTL_lChkUnique" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="" function="st_hr_sel_gsco00200_2" > 
                <input bind="grd3"   > 
                    <input bind="txtInput_PK" /> 
                </input> 
                <output bind="grd3" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------>
    <gw:data id="datCode_dMSTs" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_hr_sel_gsco00200_3"> 
                <input bind="grddMST"   > 
                    <input bind="txtInput_PK" /> 
                </input> 
                <output bind="grddMST" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------>
    <gw:data id="datCombo_Sub" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_hr_pro_gsco00200_0" > 
                <input >
                    <input bind="txtPK"  />
                </input>
                <output>
                    <output bind="txtData"  /> 
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------>
    <gw:data id="datCode_DTLs" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_hr_sel_gsco00200_4" procedure="st_hr_upd_gsco00200_4"> 
                <input bind="grdDTL"  > 
                    <input bind="txtInput_PK" /> 
                    <input bind="txtInput_CODE" /> 
                    <input bind="txtnput_CODE_NM" /> 
                    <input bind="txtInput_USEYN" /> 
                    <input  bind="txtInput_SYS" /> 
                </input> 
                <output bind="grdDTL" /> 
            </dso> 
            
        </xml> 
    </gw:data>
    <!-- MainTable -->
    <table width="100%" cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td width="25%">
                <!-- Table1 contain master buttons and text box -->
                <table id="LeftTopTB" height="100%" width="100%">
                    <tr>
                        <td width="100%">
                            <table id="LeftTopTB1" height="100%" width="100%" border="0">
                                <tr>
                                    <td width="45%">
                                    </td>
                                    <td width="10%" align="center">
                                        <gw:icon id="icoMaster" img="in" text="Code Group Entry" onclick="TabPopUp('gsco00201.aspx')"
                                            styles='width:100%' />
                                    </td>
                                    <td width="45%">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- End of Table1--->
            </td>
            <td width="75%">
                <!-- Table2 contain detail buttons and text box -->
                <table id="RightTopTB" width="100%">
                    <tr>
                        <td width="100%">
                            <table id="RightTopTB1" width="100%" border="0">
                                <tr>
                                    <td width="100%">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td width="10%">
                                                    <gw:textbox id="txtmCODE" csstype="mandatory" text="" styles='width:98%' onenterkey="OnEnterTextBox()" />
                                                </td>
                                                <td width="39%" class="kk">
                                                    &nbsp;<gw:textbox id="txtmREAMRK" csstype="mandatory" text="" styles='width:88%'
                                                        onenterkey="OnEnterTextBox()" /></td>
                                                <td width="5%">
                                                    <font color="black"><b>Type</b></font></td>
                                                <td width="20%">
                                                    <table width="100%" border="0">
                                                        <tr>
                                                            <td width="100%">
                                                                <gw:radio id="rdoDTL_KIND1" value="1"> 
																		<span value="1" > <font color="black" >Code </font></span>
																		<span value="2" > <font color="black" >Code NM </font> </span>
																	</gw:radio>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="22%">
                                                    &nbsp;<gw:textbox id="txtInput_CODE" csstype="filter" styles='width:95%' onenterkey="OnEnterTextBox1()" />&nbsp;</td>
                                                <td width="4%" align="right">
                                                    <gw:imgbtn id="ibtnSearch" alt="search" img="search" onclick="Search()" />
                                                    <td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- End of Table2 -->
            </td>
        </tr>
        <tr>
            <td width="25%">
                <!-- Table1 contain master grid -->
                <table id="LeftBottomTB" width="100%" align="top">
                    <tr>
                        <td>
                            <gw:tree id="treMaster" style="width: 100%; height: 440; overflow: auto;" onclicknode="treeItemOnclick()"
                                dragmode="false">
									</gw:tree>
                        </td>
                    </tr>
                </table>
                <!-- End of Table1-->
            </td>
            <td width="75%">
                <!-- Table2 contain detail grid -->
                <table id="RightBottomTB" width="100%" height="100%" align="top" border="1">
                    <tr>
                        <td width="100%">
                            <table width="100%" border="0">
                                <tr>
                                    <td width="10%">
                                        <gw:textbox id="txtCODE_GRP" styles='width:100%' />
                                    </td>
                                    <td width="33%">
                                        <gw:textbox id="txtCODE_GRP_NM" styles='width:100%' />
                                    </td>
                                    <td width="7%" align="right">
                                        <font color="black"><b>Type</b></font></td>
                                    <td width="8%">
                                        <gw:textbox id="txtCODE_TYPE" styles='width:100%' csstype="mandatory" />
                                    </td>
                                    <td width="6%" align="right">
                                        <font color="black"><b>Length</b></font></td>
                                    <td width="8%">
                                        <gw:textbox id="txtCODE_LEN" styles='width:100%' csstype="mandatory" />
                                    </td>
                                    <td width="6%" align="right">
                                        <font color="black"><b>Active</b></font></td>
                                    <td width="4%">
                                        <gw:checkbox id="txtInput_USEYN" value="1" defaultvalue="1|0" onchange="OnChange_Use()" />
                                    </td>
                                    <td width="4%">
                                        <gw:imgbtn img="new" alt="new" id="ibtnAdd" onclick="AddOnClick()" />
                                    </td>
                                    <td width="4%">
                                        <gw:imgbtn img="delete" alt="delete" id="ibtnDelete" onclick="DeleteOnClick()" />
                                    </td>
                                    <td width="4%">
                                        <gw:imgbtn img="udelete" alt="undelete" id="ibtnDelete1" onclick="UnDeleteOnClick()" />
                                    </td>
                                    <td width="4%">
                                        <gw:imgbtn img="save" alt="save" id="ibtnUpdate" onclick="UpdateOnClick()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td width="100%">
                                        <gw:grid id="grdDTL" header="_PK|_TC_ABCODE_MST_PK|ORD|DEF YN|Code|Code Name|Code Local Name|Code Foreign Name|Group Code|SYS Y/N|Use|NUM_VALUE1|NUM_VALUE2|NUM_VALUE3|CHA_VALUE1|CHA_VALUE2|CHA_VALUE3|_DEL_IF|_"
                                            format="0|0|0|3|0|0|0|0|2|3|3|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            defaults="||||||||||-1||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                            widths="0|0|600|800|0|2000|2000|2000|2000|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:420"
                                            sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" oncellclick="checkData();checkDefault()" />
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
    <gw:textbox id="txtInput_PK" style="display: none" />
    <!-- End of MainTable-->
    <gw:textbox id="txtREM_NUM1" style="display: None" />
    <gw:textbox id="txtREM_NUM2" style="display: None" />
    <gw:textbox id="txtREM_NUM3" style="display: None" />
    <gw:textbox id="txtREM_CHA1" style="display: None" />
    <gw:textbox id="txtREM_CHA2" style="display: None" />
    <gw:textbox id="txtREM_CHA3" style="display: None" />
    <gw:textbox id="txtSYS_YN" style="display: None" />
    <gw:textbox id="txtDTL_TYPE" style="display: None" />
    <gw:textbox id="txtnput_CODE_NM" style="display: None" />
    <gw:grid id="grddMST" header="PK|ID|Code Type|Code Len|Remark|CODE_GRP|CODE_GRP_NM|CODE_GRP_PK"
        format="0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0" defaults="|||||||" editcol="1|1|1|1|1|1|1|0"
        widths="0|0|0|0|0|0|0|0" styles="width:100%; height:0" sorting="F" param="0,1,2,3,4,5,6, 7" />
    <gw:grid id="grd3" header="PK|TC_ABCODE_MST_PK|P_PK|CODE" format="0|0|0|0" aligns="0|0|0|0"
        defaults="|||" editcol="1|1|1|1" widths="0|0|0|0" styles="width:100%; height:0"
        sorting="F" param="0,1,2,3" />
    <gw:textbox id="txtPK" text="" style="display: None" />
    <gw:textbox id="txtData" text="" style="display: None" />
    <gw:textbox id="txtInput_SYS" text="" style="display: None" />
</body>
</html>
