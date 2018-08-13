<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Logistic Code</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_PK               = 0,
    G1_LG_CODE_GROUP_PK = 1,
    G1_ORD              = 2,
    G1_Default          = 3,
    G1_Code             = 4,
    G1_Code_Name        = 5,
    G1_Num1             = 6,
    G1_Num2             = 7,
    G1_Num3             = 8,
    G1_Var1             = 9,
    G1_Var2             = 10,
    G1_Var3             = 11,
    G1_USE              = 12,
    G1_Description      = 13;
    
var G2_Level        = 0,
    G2_PK           = 1,
    G2_PARENT_PK    = 2, 
    G2_Group_ID     = 3,
    G2_Group_Name   = 4,
    G2_Code_Length  = 5,
    G2_Num1         = 6,
    G2_Num2         = 7,
    G2_Num3         = 8,
    G2_Var1         = 9,
    G2_Var2         = 10,
    G2_Var3         = 11,
    G2_USE          = 12,
    G2_Remark       = 13;
    
var G3_PK               = 0,
    G3_LG_CODE_GROUP_PK = 1,
    G3_ORD              = 2,
    G3_Default          = 3,
    G3_Code             = 4,
    G3_Code_Name        = 5,
    G3_USE              = 6,
    G3_Description      = 7;    

//=======================================================================
function BodyInit()
{
    System.Translate(document); 
    BindingDataList();
    txtGroupCode.SetEnable(false);
    txtGroupName.SetEnable(false);
    //------------------------------
	OnSearch('treeMaster');	
}

//===============================================================
function treeItemOnclick()
{
    var obj = treeMaster.GetCurrentNode();
    
	txtMasterPK.text = obj.oid;

	OnSearch('data_agds00050_1');	    
}
//===============================================================

function BindingDataList()
{
    var data="";
    
    data = "<%=CtlLib.SetListDataSQL("SELECT     pk, GROUP_ID || ' - ' || group_name FROM tlg_lg_code_group WHERE del_if = 0 AND LEVEL < 3 CONNECT BY PRIOR pk = parent_pk START WITH pk = 1 ORDER SIBLINGS BY GROUP_ID" )%>" ; 
    lstParentGroup.SetDataText(data);
    
    data = "data|1|Var Val 1|2|Var Val 2|3|Var Val 3";
    lstDetailVal.SetDataText(data);
}
//===============================================================
function OnAddNew(pos)
{    
    switch ( pos )
    {
        case 'grdDetailCode' :
            if ( txtGroupPK.GetData() == "")
            {
		        alert("Please select one Saved Group Name")
	        }
	        else
	        {
		        grdDetailCode.AddRow();

		        grdDetailCode.SetGridText( grdDetailCode.rows -1  , G3_LG_CODE_GROUP_PK, txtGroupPK.GetData());
	        }        
        break;
        case 'grdMasterCode' :
            if ( txtGroupPK.GetData() == "")
            {
		        alert("Please select one Saved Group Name")
	        }
	        else
	        {
		        grdMasterCode.AddRow();

		        grdMasterCode.SetGridText( grdMasterCode.rows -1  , G2_PARENT_PK, txtGroupPK.GetData());
	        }        
        break;
        case 'grdCode' :
            if ( txtMasterPK.GetData() == "")
            {
		        alert("Please select one group name")
	        }
	        else
	        {
		        grdCode.AddRow();

		        grdCode.SetGridText( grdCode.rows -1  , G1_LG_CODE_GROUP_PK, txtMasterPK.GetData());
	        }       
        break;        
    }
        
}
//===============================================================

function OnSearch(pos)
{
    switch (pos)
    {
        case 'treeMaster' :
            data_agds00050.Call("SELECT");
        break;
        
        case 'data_agds00050_1' :
            data_agds00050_1.Call("SELECT");
        break;   
          
        case 'grdCode' :
            data_agds00050_2.Call("SELECT");
        break; 
        
        case 'grdMasterCode' :
            data_agds00050_3.Call("SELECT");
        break;  
        
        case 'grdDetailCode' :
            if ( grdMasterCode.row > 0 )
            {
                txtGroupPK.text = grdMasterCode.GetGridData( grdMasterCode.row, G2_PK );
            }
            else
            {
                txtGroupPK.text = '' ;
            }
            //----------------------
            data_agds00050_4.Call("SELECT");
        break;                             
    }
}
//===============================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_agds00050_1" :
             OnSearch('grdCode');
        break;
        
        case "data_agds00050_4" :
             lblRecord_D.text=grdDetailCode.rows-1 + " record(s)."; 
        break;
        
        case "data_agds00050_3" :
        //--------------------------------
            lblRecord_M.text=grdMasterCode.rows-1 + " record(s)."; 
            var i;
            var ctl = grdMasterCode.GetGridControl();
            var old_row = 0;
            
            ctl.OutlineBar = 5;
            var j;
            
            for ( i=1; i<grdMasterCode.rows; i++)
            {   
                j = Find_Heigher_Level(grdMasterCode.GetGridData(i,G2_Level),i);
                
                ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;               
            }
        //--------------------------------
        OnSearch('grdDetailCode');
        //--------------------------------
        
        break;  
            
    }    
}
//===============================================================
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( grdMasterCode.GetGridData(row,G2_Level) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( grdMasterCode.GetGridData(i,G2_Level) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
}
//===========================================================================

function OnSave( pos )
{
    switch (pos)
    {
        case 'grdCode' :
            if ( CheckSave('grdCode') )
            {
                if (confirm("Do you want to save?"))
                {
                    data_agds00050_2.Call();
                }
            }        
        break;
        
        case 'grdDetailCode' :
            if ( CheckSave('grdDetailCode') )
            {
                if (confirm("Do you want to save?"))
                {
                    data_agds00050_4.Call();
                }
            }        
        break;  
        
        case 'grdMasterCode' :
            if ( CheckSave('grdMasterCode') )
            {
                if (confirm("Do you want to save?"))
                {
                    data_agds00050_3.Call();
                }
            }        
        break;            
    }    
}
//===============================================================
function CheckSave(pos)
{
    switch (pos)
    {
        case 'grdCode' :
            for ( var i = 1; i < grdCode.rows ; i ++ )
            {
                if ( grdCode.GetGridData( i, G1_ORD ) == '' )
                {
                    alert('Pls input ORD ');
                    return false;
                }
                else if ( grdCode.GetGridData( i, G1_Code ) == '' || grdCode.GetGridData( i, G1_Code_Name ) == '' )        
                {
                    alert('Pls input Code and Name ');
                    return false;        
                }
            }
        break;
        
        case 'grdDetailCode' :
            for ( var i = 1; i < grdDetailCode.rows ; i ++ )
            {
                if ( grdDetailCode.GetGridData( i, G3_ORD ) == '' )
                {
                    alert('Pls input ORD ');
                    return false;
                }
                else if ( grdDetailCode.GetGridData( i, G3_Code ) == '' || grdDetailCode.GetGridData( i, G3_Code_Name ) == '' )        
                {
                    alert('Pls input Code and Name ');
                    return false;        
                }
            }
        break;        
    }    

    return true;
}
//===============================================================
function OnDelete(pos)
{
    switch (pos)
    {
        case 'grdCode' :
            //----------------------------------------------------
            var ctrl = grdCode.GetGridControl();

	        var row  = ctrl.row;
        		
	        if ( row < 0 ) 
	        {			
			        alert("Please select one row to delete .");
	        }			
	        else 
	        {
		        if ( grdCode.GetGridData( ctrl.row, G1_PK ) == "" ) 
	            {						
        		
				        grdCode.RemoveRow();					
		        }			
		        else 
		        {
			        grdCode.DeleteRow();
                }	   
        		
	        }
	        break;
	        //-----------------------------------------------------
	        case 'grdDetailCode' :
	        
                var ctrl = grdDetailCode.GetGridControl();

	            var row  = ctrl.row;
	        	        
	             if ( grdDetailCode.GetGridData( ctrl.row, G3_PK ) == "" ) 
	            {						
        		
				        grdDetailCode.RemoveRow();					
		        }			
		        else 
		        {
			        grdDetailCode.DeleteRow();
                }	   
		    break;
		    //-----------------------------------------------------
		    case 'grdMasterCode' :
		         var ctrl = grdMasterCode.GetGridControl();

	            var row  = ctrl.row;
	            
	             if ( grdMasterCode.GetGridData( ctrl.row, G2_PK ) == "" ) 
	            {						
        		
				        grdMasterCode.RemoveRow();					
		        }			
		        else 
		        {
			        grdMasterCode.DeleteRow();
                }	   
		    break;
        }
 }
//===============================================================

function OnUnDelete(pos)
{
    switch (pos)
    {
    case 'grdCode' :
    var ctrl = grdCode.GetGridControl();

	var row  = ctrl.row;
	if(row>0)
    {
        if(grdCode.GetGridData( ctrl.row, G1_PK ) == "")
        {
            grdCode.UnDeleteRow();
            return false;
        }
    }
    break;
    case 'grdDetailCode' : 
          if(confirm ("Do you want to Undelete this record?")) 
          {   
            grdDetailCode.UnDeleteRow();
            data_agds00050_4.Call();
          }
     break;
     case 'grdMasterCode' : 
          if(confirm ("Do you want to Undelete this record?")) 
          {   
            grdMasterCode.UnDeleteRow();
          }
     break;
 }
 return true;
}

//===========================================================================

function OnPopUp()
{
	var fpath = System.RootURL + "/standard/forms/ag/ds/agds00051.aspx";
	var aValue  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');

    if ( aValue == 'N' )
    {
	    OnSearch('treeMaster');	
	}
}

//===========================================================================
function OnReport(obj)
{
    if(obj==1)
    {
        var fpath = System.RootURL + "/reports/ag/ds/rpt_agds00050_master.aspx?code_grp="+lstParentGroup.value;
	    System.OpenTargetPage(fpath);
    }else
    {
        var fpath = System.RootURL + "/reports/ag/ds/rpt_agds00050_detail.aspx?code_grp="+lstParentGroup.value+"&codegrp_nm="+txtGroup.text;
	    System.OpenTargetPage(fpath);
    }
    
}
</script>

<body>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agds00050"> 
        <xml> 
            <dso id="1" type="tree" function="st_lg_sel_agds00050" > 
                <input> 
                </input> 
                <output bind="treeMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agds00050_1" onreceive="OnDataReceive(this)">                 
        <xml> 
            <dso type="control"  function="st_lg_sel_agds00050_1" >
                <inout> 
                    <inout  bind="txtMasterPK" /> 
                    <inout  bind="txtGroupCode" /> 
                    <inout  bind="txtGroupName" /> 
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agds00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_agds00050_2" procedure="st_lg_upd_agds00050_2"> 
                <input bind="grdCode" >
                    <input bind="txtMasterPK" />
                </input>
                <output  bind="grdCode" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agds00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agds00050_3" procedure="st_lg_upd_agds00050_3"> 
                <input bind="grdMasterCode" >
                    <input bind="lstParentGroup" />
                    <input bind="txtGroup" />
                </input>
                <output  bind="grdMasterCode" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agds00050_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_agds00050_4" procedure="st_lg_upd_agds00050_4"> 
                <input bind="grdDetailCode" >
                    <input bind="txtGroupPK" />
                    <input bind="lstDetailVal" />
                    <input bind="txtVarTmp" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <!--<gw:tab> -->
                <gw:tab>
                <table name="Tree" style="width: 100%; height: 100%" border="1">
                    <tr>
                        <td style="width: 25%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 45%">
                                    </td>
                                    <td style="width: 10%" align="center">
                                        <gw:icon id="icoMaster" img="in" text="Code Group Entry" onclick="OnPopUp()" styles='width:100%' />
                                    </td>
                                    <td style="width: 45%">
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="3">
                                        <gw:tree id="treeMaster" style="width: 100%; height: 100%; overflow: auto;" onclicknode="treeItemOnclick()"
                                            dragmode="false">
									    </gw:tree>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 75%">
                            <table id="RightTopTB" style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 10%; white-space: nowrap">
                                        Code Group</td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtGroupCode" csstype="mandatory" text="" styles='width:100%' />
                                    </td>
                                    <td style="width: 60%">
                                        <gw:textbox id="txtGroupName" csstype="mandatory" text="" styles='width:100%' />
                                    </td>
                                    <td style="width: 6%" align="right">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew" img="new" onclick="OnAddNew('grdCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" onclick="OnDelete('grdCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" onclick="OnUnDelete('grdCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" onclick="OnSave('grdCode')" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="8">
                                        <gw:grid id='grdCode' header='_PK|_LG_CODE_GROUP_PK|ORD|Default|Code|Code Name|NUM VAL1|NUM VAL2|NUM VAL3|VAR VAL1|VAR VAL2|VAR VAL3|USE|Description'
                                            format='0|0|0|3|0|0|1|1|1|0|0|0|3|0' aligns='0|0|1|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                            widths='1000|1000|1000|1000|2000|3000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table name="List" style="width: 100%; height: 100%" border="1">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 15%; white-space: nowrap" align="right">
                                        Parent Group
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstParentGroup" styles='width:100%' onchange="OnSearch('grdMasterCode')" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Group
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtGroup" csstype="mandatory" text="" styles='width:100%' onenterkey="OnSearch('grdMasterCode')" />
                                    </td>
                                    <td style="width: 25%" align="center">
                                        <gw:label img="new" id="lblRecord_M" style="font-weight: bold; color: red; font-size: 12"
                                            text="0 record(s)" />
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('grdMasterCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew1" img="new" onclick="OnAddNew('grdMasterCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete1" img="delete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete1" img="udelete" onclick="OnUnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave1" img="save" onclick="OnSave('grdMasterCode')" />
                                    </td>
                                     <td style="width: 1%">
                                        <gw:imgbtn id="btnReport1" img="excel" onclick="OnReport(1)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnReport2" img="excel" onclick="OnReport(2)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td>
                            <gw:grid id='grdMasterCode' header='Level|_PK|_PARENT_PK|Group ID|Group Name|Code Length|NUM COL1|NUM COL2|NUM COL3|VAR COL1|VAR COL2|VAR COL3|Active|Remark'
                                format='0|0|0|0|0|1|0|0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='2000|1000|1000|2000|3000|2000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdDetailCode')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td width="20%" style="border: 0;" align="right">
                                        <gw:label img="new" id="lblRecord_D" style="font-weight: bold; color: red; font-size: 12"
                                            text="0 record(s)" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 15%"><gw:list id="lstDetailVal" styles='width:100%' /></td>
                                    <td style="width: 15%" align="right"><gw:textbox id="txtVarTmp" csstype="mandatory" text="" styles='width:100%' onenterkey="OnSearch('grdDetailCode')" /></td>
                                    <td style="width: 16%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew2" img="new" onclick="OnAddNew('grdDetailCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete2" img="delete" onclick="OnDelete('grdDetailCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete2" img="udelete" onclick="OnUnDelete('grdDetailCode')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave2" img="save" onclick="OnSave('grdDetailCode')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 49%"> 
                        <td>
                           <gw:grid id='grdDetailCode' header='_PK|_LG_CODE_GROUP_PK|ORD|Default|Code|Code Name|NUM VAL1|NUM VAL2|NUM VAL3|VAR VAL1|VAR VAL2|VAR VAL3|USE|Description'
                                    format='0|0|0|3|0|0|1|1|1|0|0|0|3|0' aligns='0|0|1|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                    widths='1000|1000|1000|1000|2000|3000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
                </gw:tab>
                <!--</gw:tab> -->
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" text="" styles='width:100%;display:none' />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtGroupPK" text="" styles='width:100%;display:none' />
</body>
</html>
