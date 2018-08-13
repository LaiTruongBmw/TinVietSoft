<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
var  user_name = "<%=Session("USER_NAME")%>"  ;


var p_update = 0; //not update data
//"_tin_warehouse_pk|WH ID|WH Name|WH Type" 
var G1_tin_warehouse_pk         = 0,
    G1_WH_ID                    = 1,
    G1_WH_Name                  = 2,
    G1_WH_Type                  = 3;
	
//"_PK|_TLG_WH_PK|Location ID|Location Name|Row|Stair|Column|Quantity|Active|Remark"      
var G2_PK         		= 0,
    G2_IN_WAREHOUSE_PK  = 1,
    G2_LOC_ID        	= 2,
    G2_LOC_NAME         = 3,
    G2_ROW_NO           = 4,
    G2_STAIR_NO         = 5,
    G2_COLUMN_NO        = 6,
    G2_QUANTITY         = 7 ,
    G2_USE_YN           = 8 ,
    G2_DESCRIPTION      = 9 ;
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document); 
    BindingDataList();   
}
//-------------------------------------------------------------------------------------------
function BindingDataList()
{ 
    var data    = "<%=CtlLib.SetListDataSQL("SELECT PK, STRG_NAME FROM TLG_IN_STORAGE WHERE DEL_IF=0")%>||";
    lstWHType.SetDataText(data);    
    lstWHType.value='';
	
	
}

//----------------------------------------------------
function OnSearch(iObj)
{
    switch(iObj)
    {
        case 'WH':
            agfp00100.Call("SELECT");
            break;
        case 'WHLocation':                        
            if ( grdWH.row > 0 )
            {
                txttin_warehouse_pk.text = grdWH.GetGridData(grdWH.row, G1_tin_warehouse_pk);
				txttin_warehouse_nm.text = grdWH.GetGridData(grdWH.row, G1_WH_ID) +" - " + grdWH.GetGridData(grdWH.row, G1_WH_Name);
				lblWHName.text = txttin_warehouse_nm.text;
            }
            agfp00100_1.Call("SELECT");
            break;
    }
}
//----------------------------------------------------
function OnAddNew()
{
    if(grdWH.row > 0)
    {
        grdWHLocation.AddRow();
        grdWHLocation.SetGridText( grdWHLocation.rows - 1 ,G2_IN_WAREHOUSE_PK, grdWH.GetGridData(grdWH.row, G1_tin_warehouse_pk) );
    }
    else
    {
        alert('Must Select Warehouse!');        
    }        
}
//----------------------------------------------------


//----------------------------------------------------
function OnSave()
{
    if(CheckSave())
        agfp00100_1.Call();
}
//----------------------------------------------------
function CheckSave()
{
    var i;
    for(i = 1; i < grdWHLocation.rows; i++)
    {
        if( Trim(grdWHLocation.GetGridData(i, G2_LOC_ID)) =='' )
        {
            alert('PLEASE INPUT LOCATION ID AT ROW ' + i);
            return false;
        }
    }
    return true;
}
//----------------------------------------------------
function OnDelete()
{
    grdWHLocation.DeleteRow();
    //btnDel.SetEnable(false);
}

function OnReport()
{
	var url = System.RootURL + "/reports/ag/fp/rpt_agfp00100_0.aspx?p_wh_pk="+ txttin_warehouse_pk.text + "&p_wh_nm=" + txttin_warehouse_nm.text ;
     	 
			System.OpenTargetPage(url);		
}
//----------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        
    }
}
//---------------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!--------------------------------------------------------------->
    <gw:data id="agfp00100" onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso type="grid" function="st_lg_sel_agfp00100"  > 
                <input bind="grdWH" >
                    <input bind="lstWHType" />
					<input bind="txtWH" />					
                </input> 
                <output bind="grdWH" /> 
            </dso> 
        </xml> 
    </gw:data>    
<!--------------------------------------------------------------->   
    <gw:data id="agfp00100_1" onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_lg_sel_agfp00100_1" procedure="st_lg_upd_agfp00100_1" > 
                <input bind="grdWHLocation" >
                    <input bind="txttin_warehouse_pk" />                 
                </input> 
                <output bind="grdWHLocation" /> 
            </dso> 
        </xml> 
    </gw:data>    
<!--------------------------------------------------------------->       
    <table border="1" style="height:100%; width:100%;" >
        <tr>
            <td id="tLEFT" style="width: 35%; height:100% " >
                <table style="width:100%; height:100%; " >
					<tr style="height: 4%">
                        <td style="width:30%;" align="right">W/H Type</td>                            
                        <td colspan=2 style="width:50%;"><gw:list id="lstWHType" styles="width:100%;" value="" onchange="OnSearch('WH')" /></td>                            
                        
                    </tr>
					<tr style="height: 4%">
                        <td style="width:30%;" align="right">W/H Name</td>                            
                        <td style="width:60%;"><gw:textbox id="txtWH" styles="width:100%;"  onchange="OnSearch('WH')" /></td>                            
                        <td style="width:10%; ">
							<gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('WH')" />
						</td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="3"  >
                            <gw:grid 
                                id="grdWH" 
                                header="_tin_warehouse_pk|WH ID|WH Name|WH Type" 
                                format="0|0|0|0"
                                aligns="0|0|0|0" 
                                defaults="|||" 
                                editcol="0|0|0|0" 
                                widths="0|1500|2500|2000" 
                                styles="width:100%; height:100%;"
                                sorting="T" 
                                oncellclick="OnSearch('WHLocation')" />                        
                        </td>
                    </tr>
                </table>            
            </td>            
            <td id="tRIGHT" style="width: 65%; height:100% " >
                <table style="width:100%; height:100%; " >
                    <tr>
                        <td width="15%" align="center">
							W/H : 
						</td>
                        <td width="35%">
							<gw:label id="lblWHName" styles='width:100%;color:cc0000;font:10pt' text=''  />	
						</td>
                        <td style="width:15%; "></td>                        
                        <td style="width:20%; "></td>                        
                        <td width="2%"><gw:button img="new"     alt="New"       id="btnNew"      onclick="OnAddNew()" /></td>
                        <td width="2%"><gw:button img="save"    alt="Save"      id="btnSave"   onclick="OnSave()" /></td>
                        <td width="2%"><gw:button img="delete"  alt="Delete"    id="btnDel"   onclick="OnDelete()" /></td>
                        <td width="2%"><gw:button img="excel"  alt="Report"    id="btnReport"   onclick="OnReport()" /></td>                     
                    </tr>
                    
                    <tr style="height:95%" >
                        <td colspan="9">
                            <table style="height:100%; width:100%" >
                                <tr>
                                    <td>
										<gw:grid id="grdWHLocation" 
										header="_PK|_TLG_WH_PK|Location ID|Location Name|Row|Stair|Mapping ID|Quantity|Active|Remark"
										format="0|0|0|0|0|0|0|-0|3|0" aligns="0|1|0|0|0|0|0|3|0|0" defaults="||||||||-1|"
										editcol="1|1|1|1|1|1|1|1|1|1" widths="0|0|1500|2500|1500|1500|1500|1500|1000|2000"
										styles="width:100%; height:100%" sorting="T" 
										param="0,1,2,3,4,5,6,7,8,9" />
                                    </td>
                                </tr>
                            </table>
                       </td>                    
                    </tr>
                </table>
            </td>            
        </tr>
    </table>
<gw:textbox id="txttin_warehouse_pk" styles="display:none; " />    
<gw:textbox id="txttin_warehouse_nm" styles="display:none; " />    
</body>
</html>