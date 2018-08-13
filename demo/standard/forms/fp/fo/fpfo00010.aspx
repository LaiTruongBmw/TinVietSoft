<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Defect Type Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//----------------------------------------------------------------

function BodyInit()
{
    BindingDataList();
    //-------------------------
	chkActive.value = "-1"; 	
	//-------------------------
	itemGroupTree.Call("SELECT");
}

//----------------------------------------------------------------

 function BindingDataList()
{    
          
	lstIntype.SetDataText("|1|Table|2|Manual||Select All") ;
	lstIntype.value="" ;
	
	var data1 = "<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM tco_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompanyList.SetDataText(data1+"|-1|SELECT ALL");
    cboCompanyList.value='-1';
}
 
//----------------------------------------DefectType-----------------------
function OnSearchDefectType()
{
    fpfo00010_1.Call("SELECT");
}
//----------------------------------------DefectType-----------------------
function OnNewDefectType()
{ 
    grdDefectType.AddRow();
}
//-----------------------------Delete ----------------------------------
function OnDeleteDefectType()
 {
    var ctrl = grdDefectType.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if ( n > 1 ) 
	{		
		if ( row < 0 ) 
		{			
				alert("Please select a Defect Type to delete .");
		}			
		else 
		{
			if ( grdDefectType.GetGridData( ctrl.row, 0 ) == "" ) 
		    {						
			
					grdDefectType.RemoveRow();					
			}			
			else 
			{
				if ( confirm( "Do you want to mark this row to delete?" ) ) 
				{
					grdDefectType.DeleteRow();
				}
				checkData();
			}
		}
	}
	else 
	{
		alert("Please select a Defect Type to delete .");
	}
 }
 //-----------------------------Undelete----------------------------
 function OnUnDeleteDefectType() {

	var ctrl = grdDefectType.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if ( n > 1 ) {
	
		if ( row < 0 ) {		
		}		
		else {
		
			if ( grdDefectType.GetGridData( ctrl.row, 0) == "" ) {
			}
			else {
				
				if ( confirm ( "Do you want to undelete?" ) ) {				
					grdDefectType.UnDeleteRow()
				}
				checkData();
			}
		}
	}
}
//----------------------------------------------------------------
function checkData() 
{
    
	var ctrl = grdDefectType.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;	
	
	if ( n > 1 ) 
	{	
		if ( row < 0 ) 
		{
		}
		else 
		{			
			if ( grdDefectType.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				btnDleteDefectType.SetEnable(false);
				btnUnDeleteDefectType.SetEnable(true);
			}
			else 
			{
				btnDleteDefectType.SetEnable(true);
				btnUnDeleteDefectType.SetEnable(false);
			}
		}	
	}	
}
//----------------------Check input duplicate value ------------------------------
function checkDup(gridId,col)
{
    var ctrl = gridId.GetGridControl();
	var n    = ctrl.Rows;
	
	if ( n==1 ) {
   		return false;
	}
	for ( i=1; i<n -1 ; i++ ) 
	{
	    var data_1 = gridId.GetGridData( i, col );
		for (j=i+1; j< n ; j ++)
		{
			var data_2 = gridId.GetGridData( j, col );			
			if ( ( data_1.length != 0 ) && ( data_1.toUpperCase() == data_2.toUpperCase() ) ) 
			{
				alert("'" + data_1 + "' ID already in use, please re-enter");				
				return false;		
		    }
	    }
	}
	return true;
}
//-------------------------Check id or name is not null-----------------------------------
function checkNullId_Name(gridId,col)
{
    var ctrl = gridId.GetGridControl();
	var n    = ctrl.Rows;	
	if ( n==1 ) {
   		return false;
	}
	for ( i=1; i<n ; i++ ) 
	{
	    var data_1 = gridId.GetGridData( i, col );
		if (  data_1.length == 0 ) 
		{
			alert("ID or Name is null, please enter !");				
			return false;		
	    }
	}
	return true;
}
//----------------------------------------------------------------------
function OnSaveDefectType()
{
    if(checkDup(grdDefectType,1) && checkNullId_Name(grdDefectType,1) && checkNullId_Name(grdDefectType,2))
    {
        fpfo00010_1.Call();
    }
}
//----------------------------------------------------End of DefectType-----------------------------------------------------------------
function checkValue_Tab()
{	 	
	switch ( idTab.GetCurrentPageNo() )
	{
		case 0:
			OnSearchDefectType();
			break;
		case 1:
			//OnSearchDefectTypeList();
			//grdMapping.ClearData();
			break;
	}
}	
//---------------------------------------------------- Function for mapping-----------------------------------------------------------

function OnSearch()
{
    fpfo00010_2.Call("SELECT");
}

//---------------------------------------------------------------------
function loadObjectList()
{
    txtItemGroupName.text = event.srcElement.GetCurrentNode().text
    txtItemGroupPK.text   = event.srcElement.GetCurrentNode().oid
    //grdObjList.ClearData()
    fpfo00010_3.Call("SELECT")
}
//---------------------------------------------------------------------

function OnAddTo() 
{
	var objCtrl = grdObjList.GetGridControl();
	var mapCtrl = grdMapping.GetGridControl();
	var strDefectTypePK = txtItemGroupPK.text;
	var i = 0;
	
	if (Trim(strDefectTypePK) != "") 
	{
		//get selected row
		if (objCtrl.SelectedRows >0) 
		{
			for (i=objCtrl.Rows-1;i>0;i--) 
			{
				//Add row to mapping grid
				if (objCtrl.IsSelected(i)) 
				{
					grdMapping.AddRow();
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 1) = strDefectTypePK; //DefectType pk
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 2) = txtItemGroupName.text; // pk
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 3) = objCtrl.TextMatrix(i,0); //Defect Type pk				
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 4) =  objCtrl.TextMatrix(i,1);//Defect TypeID
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 5) =  objCtrl.TextMatrix(i,2);//Defect Type name
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 6) =  objCtrl.TextMatrix(i,3);//Defect Type name
					mapCtrl.TextMatrix(mapCtrl.Rows-1 , 7) =  objCtrl.TextMatrix(i,4)	//DefectType name
					objCtrl.RemoveItem(i);
				}
			}
			
		} 
		else 
		{
			alert ("Please select Object for mapping.");
		} 
	} 
	else 
	{
		alert ("Please select DefectType for mapping.");
	}
}
//---------------------------------------------------------------------

function removeFrom() 
{
	var objCtrl = grdObjList.GetGridControl();
	var mapCtrl = grdMapping.GetGridControl();
	var i = 0;
	//get selected row
	if (mapCtrl.SelectedRows >0) 
	{
	     if(confirm("Are you sure to delelet this rows!!"))
		{
		    for (i=mapCtrl.Rows-1;i>0;i--) 
		    {
			    //Add row to mapping grid
			    if (mapCtrl.IsSelected(i)) 
			    {
			        if (mapCtrl.TextMatrix(i ,0)=="")
			        {
			           grdObjList.AddRow();
				        objCtrl.TextMatrix(objCtrl.Rows -1 ,0) = mapCtrl.TextMatrix(i , 3);  //Defect pk				
				        objCtrl.TextMatrix(objCtrl.Rows -1 ,1) = mapCtrl.TextMatrix(i , 4); //Defect ID
				        objCtrl.TextMatrix(objCtrl.Rows -1 ,2) = mapCtrl.TextMatrix(i , 5); //Defect name
				        objCtrl.TextMatrix(objCtrl.Rows -1 ,3) = mapCtrl.TextMatrix(i , 6);	//Local Name
				        objCtrl.TextMatrix(objCtrl.Rows -1 ,4) = mapCtrl.TextMatrix(i , 7);	//Foreign name		
				        mapCtrl.RemoveItem(i)//RemoveItem(i);
				    }
    				    				
			    }
		    }
		     grdMapping.DeleteRow()
		}
	} 
	else 
	{
		alert ("Please select ObjectDefectType for removing.");			
	}
}
//---------------------------------------------------------------------

function UnRemoveFrom() 
{

	var objCtrl = grdObjList.GetGridControl();
	var mapCtrl = grdMapping.GetGridControl();
	var i = 0;
    var j = 0;
	//get selected row
	if (mapCtrl.SelectedRows >0) 
	{
		for (i=mapCtrl.Rows-1;i>0;i--) 
		{
			//Add row to mapping grid
			if (mapCtrl.IsSelected(i)) 
			{
			     if(confirm("Are you sure to Un delete this rows!!"))
		        {
				    grdMapping.UnDeleteRowAt(i)//RemoveItem(i);
				}
			}
		}
	} 
	else 
	{
		alert ("Please select deleted ObjectDefectType for unRemoving.");
	}
}
//---------------------------------------------------------------------

function saveMapping()
{
	fpfo00010_3.Call()

}
//---------------------------------------------------------------------

function mappingDbClick() 
{
	var mapCtrl = grdMapping.GetGridControl();
	if (mapCtrl.TextMatrix(event.row ,0)=="") 
	{
		removeFrom();
	}
}
//---------------------------------------------------------------------

function OnDataReceive(p_obj)
{
    if(p_obj.id=="fpfo00010_3")
    {
        fpfo00010_2.Call("SELECT");
    }
}

//---------------------------------------------------------------------

</script>

<body>
    <!-------------------------------------------------------->
    <gw:data id="fpfo00010_1" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fpfo00010_1" procedure="<%=l_user%>lg_upd_fpfo00010_1"  > 
			<input bind="grdDefectType" > 
			    <input bind="txtDefectTypeName" />
			    <input bind="lstIntype" />	
			    <input bind="chkActive" />				
			</input> 
			<output bind="grdDefectType" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:data id="fpfo00010_2" onreceive=""> 
	<xml> 
		<dso type="grid"  function="<%=l_user%>lg_sel_fpfo00010_2"  > 
			<input bind="grdObjList" > 
			    <input bind="txtItemGroupPK" />			 
			    <input bind="txtDefectTypeName" />
			</input> 
			<output bind="grdObjList" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:data id="itemGroupTree" onreceive=""> 
        <xml> 
            <dso id="1" type="tree"    function="<%=l_user%>lg_sel_fpfo00010" > 
                 <input>
                    <input bind="cboCompanyList"/>
                </input>
                <output bind="trvGroupItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:data id="fpfo00010_3" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="0,1,3,8" function="<%=l_user%>lg_sel_fpfo00010_3" procedure="<%=l_user%>lg_upd_fpfo00010_3"  > 
			<input bind="grdMapping" > 
			    <input bind="txtItemGroupPK" />		
			</input> 
			<output bind="grdMapping" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:tab id="idTab" onpageactivate="checkValue_Tab()"> 
    <table name="Defect Type Entry" style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table width="100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            <b>Defect Name</b></td>
                        <td style="width: 30%">
                            <gw:textbox id="txtDefectTypeName" csstype="filter" text="" onenterkey="OnSearchDefectType()" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b>In Type</b></td>
                        <td style="width: 20%">
                            <gw:list id="lstIntype"> </gw:list>
                        </td>
                        <td style="width: 10%" align="right">
                            <b>Used</b></td>
                        <td style="width: 10%">
                            <gw:checkbox id="chkActive" mode="01" value="-1" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearchDefectType" img="search" alt="Search" onclick="OnSearchDefectType()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNewDefectType" img="new" alt="New" onclick="OnNewDefectType()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDleteDefectType" img="delete" alt="Delete" onclick="OnDeleteDefectType()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUnDeleteDefectType" img="udelete" alt="UnDelete" onclick="OnUnDeleteDefectType()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSaveDefectType" img="save" alt="Save" onclick="OnSaveDefectType()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id="grdDefectType" header="_PK|Type ID|Type Name|Name (VIE)|Name (KOR)|In Type|Used"
                    format="0|0|0|0|0|0|3" aligns="0|0|0|0|0|0|0" defaults="||||||-1" editcol="0|1|1|1|1|1|1"
                    widths="0|2000|3000|2000|2000|2000|2000" styles="width:100%; height:100%" sorting="T"
                    param="0,1,2,3,4,5,6" oncellclick="checkData()" />
            </td>
        </tr>
    </table>
    <table name="Defect Type Object Mapping" style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company</td>
                        <td style="width: 40%">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="itemGroupTree.Call('SELECT');"></gw:list>
                        </td>
                        <td style="width: 40%">
                        </td>
                    </tr>
                    <tr style="height: 39%">
                        <td colspan="3">
                            <gw:tree id="trvGroupItem" style="width: 100%; height: 100%; overflow: auto;" onclicknode="loadObjectList()" />
                        </td>
                    </tr>
                    <tr style="height: 60%">
                        <td colspan="3">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 10%">
                                        <b>Defect</b>
									</td>                                    
                                    <td style="width: 88%">
                                        <gw:textbox id="txtFilter" styles="width:100%" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="ibtnAddTo" img="select" alt="Select Defect Type" onclick="OnAddTo()" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <gw:grid id="grdObjList" header="_PK|Type ID|Type Name|_Name 01|_Name 02"
                                            format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="|||||" editcol="0|0|0|0|0" widths="0|1500|2000|2000|2000"
                                            styles="width:100%; height:100%" sorting="T" param="0" oncelldblclick="OnAddTo()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 97%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idDelete" img="delete" alt="Remove" text="Delete" onclick="removeFrom()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idUDelete" img="udelete" alt="UnRemove" text="UnDelete" onclick="UnRemoveFrom()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idBtnUpdate" img="save" alt="Save" text="Save" onclick="saveMapping()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id="grdMapping" header="_PK|_item_group_pk|Item Group|_defect_type_pk|Defect Type ID|Defect Type Name|_Defect Type Name(Loc)|_Defect Type Name(Eng)|Used"
                                format="0|0|0|0|0|0|0|0|3" aligns="0|0|0|0|0|0|0|0|0" defaults="||||||||-1" editcol="0|0|0|0|0|0|0|0"
                                widths="0|1000|2000|2000|2000|2000|2000|2000|800" styles="width:100%; height:100%"
                                sorting="T" sendoldvalue="T" oncelldblclick="mappingDbClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </gw:tab>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtDefectTypePK" text="" styles="display:none" />
    <gw:textbox id="txtItemGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtItemGroupName" text="" styles="display:none" />
    <!------------------------------------------------------------------>
</body>
</html>
