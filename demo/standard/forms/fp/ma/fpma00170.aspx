<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <titleP/Transaction Checking</title>
</head>

<script type="text/javascript" language="javascript">

//=========================================================================================
var G1_TYPE   		= 0,
    G1_TRANS_DT     = 1,
    G1_SLIP_NO      = 2,
    G1_STATUS       = 3,
    G1_ASSET_PK     = 4,
    G1_ASSET_ID     = 5,
    G1_ASSET_NM     = 6,
    G1_UOM    		= 7,
	G1_FR_DEPT_PK   = 8,
	G1_FR_DEPT_NM   = 9,	
	G1_TO_DEPT_PK   = 10, 
	G1_TO_DEPT_NM   = 11,
	G1_FR_EMP_PK    = 12,
	G1_FR_EMP_NM    = 13,
	G1_TO_EMP_PK    = 14,
	G1_TO_EMP_NM    = 15;

//=================================================================================

function BodyInit()
{     
    System.Translate(document);
    BindingDataList();         
}
//=================================================================================

function BindingDataList()
{    
    var data="";    
	
    data = "<%=ESysLib.SetListDataSQL("select trans_code,trans_name factory_name from tlg_in_trans_code where del_if = 0 and close_yn='N' and trans_type='A' order by trans_code")%>||";
    lstTransType.SetDataText( data);
    lstTransType.value = '' ;	
	
    data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||";
    lstFrDept.SetDataText( data);
    lstFrDept.value = '' ;		
	lstToDept.SetDataText( data); 	
	lstToDept.value = '' ;	

} 
//=================================================================================
function OnSearch()
{
     data_fpma00170.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_fpma00170':			 
			if ( grdMaster.rows > 1 )
			{   				
   				grdMaster.SetCellBold( 1, G1_TYPE,     grdMaster.rows - 1, G1_TYPE,     true); 
   				grdMaster.SetCellBold( 1, G1_SLIP_NO,  grdMaster.rows - 1, G1_SLIP_NO,  true); 
   				grdMaster.SetCellBold( 1, G1_ASSET_ID, grdMaster.rows - 1, G1_ASSET_ID, true);  
				
				grdMaster.SetCellBgColor( 1, G1_ASSET_ID, grdMaster.rows - 1, G1_ASSET_NM, 0xFFFFCC );	
				
				grdMaster.SetCellBgColor( 1, G1_FR_DEPT_NM, grdMaster.rows - 1, G1_FR_DEPT_NM, 0xCCFFFF );
				grdMaster.SetCellBgColor( 1, G1_TO_DEPT_NM, grdMaster.rows - 1, G1_TO_DEPT_NM, 0xFFFFCC );
				grdMaster.SetCellBgColor( 1, G1_FR_EMP_NM,  grdMaster.rows - 1, G1_FR_EMP_NM,  0xCCFFFF );
				grdMaster.SetCellBgColor( 1, G1_TO_EMP_NM,  grdMaster.rows - 1, G1_TO_EMP_NM,  0xFFFFCC );		
			}	
		break;
	}
}

//=========================================================================================================
function OnViewDetail()
{
    var path = System.RootURL + '/form/fp/ma/fpma00071.aspx';
	var obj = System.OpenModal( path ,800 , 500, 'resizable:yes;status:yes');
}

//======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        
        case 'Report':
                            
            var path = System.RootURL + '/form/fp/ma/fpma00172.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
                                 
        break;    
			 
    }	       
}
 
 
//===================================================================================================
function OnReport(para)
{
    switch(para)
    {
              
		case 'ST01':
            var url =System.RootURL + "/reports/fp/ma/rpt_fpma00170_ST01.aspx?trans_type="+ lstTransType.value +"&from_date="+ dtDateFrom.value +"&to_date="+ dtDateTo.value +"&asset="+ txtAsset.text +"&from_dept="+ lstFrDept.value +"&to_dept="+ lstToDept.value; 
            System.OpenTargetPage(url);                  
        break;  				 
    }
}
 
//=========================================================================================================


</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpma00170" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00170" > 
                <input> 
                     <input bind="lstTransType" />   
                     <input bind="dtDateFrom" />  
                     <input bind="dtDateTo" />  
                     <input bind="txtAsset" />  
					 <input bind="lstFrDept" />
					 <input bind="lstToDept" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 5%; white-space: nowrap" align="right" >
                Trans Type
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:list id="lstTransType" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right" >
                Date
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:datebox id="dtDateFrom" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtDateTo" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right" >
                Asset
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtAsset" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			<td style="width: 5%; white-space: nowrap" align="right" >
                Dept
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:list id="lstFrDept" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
			<td style="width: 15%; white-space: nowrap;">
                <gw:list id="lstToDept" text="" styles="width:100%" onchange="OnSearch()" />
            </td>			                    
            <td style="width: 3%">
            </td>
			<td style="width: 1%">
				<gw:imgbtn id="btnReport" img="excel" alt="PO Sheet" onclick="OnPopUp('Report')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 90%">
            <td colspan="15">
                <gw:grid id='grdMaster' header='Type|Trans Date|Slip no|Status|_MA_ASSET_PK|Asset Code|Asset Name|UOM|_FR_DEPT_PK|From Dept|_TO_DEPT_PK|To Dept|_FR_CHARGER_PK|From Charger|_TO_CHARGER_PK|To Charger'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|1|0|1|0|0|0|1|0|0|0|0|0|0|0|0' 
					check='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1200|1500|1000|0|1500|3000|800|0|2500|0|2500|0|2500|0|2500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtMaReqMArrPk" maxlen="100" styles='width:100%;display:none' />
</html>
