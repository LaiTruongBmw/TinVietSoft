<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Asset Evaluation</title>
</head>

<script type="text/javascript" language="javascript">

var G_CHK   		    = 0,
    G_MA_REQ_M_PK	    = 1,
    G_ASSET_PK		    = 2,
    G_ASSET_CODE		= 3,
    G_ASSET_NAME		= 4,
    G_ASSET_TYPE		= 5,
    G_UOM		        = 6,
    G_PROCESS_PK        = 7,
    G_PROCESS_ID		= 8,
    G_PROCESS_NAME		= 9,
    G_REQ_DATE		    = 10,
    G_REQ_TYPE		    = 11,
    G_STATUS		    = 12,
    G_STATUS_NAME		= 13,
    G_REQ_DESC		    = 14,
    G_TODAYS		    = 15;

//=========================================================================================
function BodyInit()
{     
    System.Translate(document);
    BindingDataList();   
      
}
//=================================================================================

function BindingDataList()
{    
    var data="";    
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_FACTORY where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	
	 	
    //-----------
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1110') FROM DUAL")%>||";
    lstAssType.SetDataText( data);
    lstAssType.value = '' ;	             
	
	//-----------
	data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' order by grp_nm ")%>||";     
    lstAssGroup.SetDataText(data); 
	lstAssGroup.value = '' ;
} 
//=================================================================================
function OnSearch()
{
     data_fpma00070.Call('SELECT');
    
}

//=================================================================================

function OnDataReceive(p_oData)
{
   lblRecord.text = (grdMaster.rows - 1) + ' record(s)';
   grdMaster.SetCellBold( 1, 1,     grdMaster.rows - 1, 1,     true); 
   grdMaster.SetCellBold( 1, 3,     grdMaster.rows - 1, 3,     true); 
   grdMaster.SetCellBold( 1, 5,     grdMaster.rows - 1, 5,     true); 
   grdMaster.SetCellBold( 1, 7,     grdMaster.rows - 1, 12,     true); 
   grdMaster.SetCellBgColor( 1, 7, grdMaster.rows - 1, grdMaster.cols - 1, 0xCCFFFF ); 
}

//=========================================================================================================
function OnViewDetail()
{
    var path = System.RootURL + '/form/fp/ma/fpma00071.aspx';
	var obj = System.OpenModal( path ,800 , 500, 'resizable:yes;status:yes');
}

</script>

<body>
     <!------------------------------------------------------------------->
    <gw:data id="data_fpma00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00070" > 
                <input>                     
                    <input bind="lstAssGroup" />
                    <input bind="lstAssType" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------> 
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 5%; white-space:nowrap">
                Factory
            </td>
            <td style="width: 20%; white-space:nowrap;">
                <gw:list id="lstFactory" text="" styles="width:100%" onchange="" />
            </td>
			<td style="width: 5%; white-space:nowrap">
                Asset Group
            </td>
			<td style="width: 20%; white-space:nowrap;">
                <gw:list id="lstAssGroup" text="" styles="width:100%" onchange="" />
            </td>
            <td style="width: 5%; white-space:nowrap">
                Asset Type
            </td>
			<td style="width: 20%; white-space:nowrap;">
                <gw:list id="lstAssType" text="" styles="width:100%" onchange="" />
            </td>
			<td style="width: 16%; white-space:nowrap;">
		       <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='0 record(s)' />
        	</td>            
            <td style="width: 1%">
 
            </td>
            <td style="width: 1%">
 
            </td>
			<td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnExcel" img="save" alt="Save" text="Save" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 90%">
            <td colspan="11">
                <gw:grid id='grdMaster' 
                header='PROPERTY|BRAND|PROPERTY QTY|BUY COST|MAINTENANCE TIME|MAINTENANCE COST|DOWN TIME(Day)|QUALITY|EVA. 1|EVA. 2|EVA. 3|RANK'
                    format='0|0|0|0|0|1|0|0|3|3|3|0' 
                    aligns='1|0|3|3|3|3|3|1|1|1|1|1' 					 
                 	widths='1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                 	autosize ='T'
                    sorting='T' styles='width:100%; height:100%' 
                    oncelldblclick ="OnViewDetail()"
                    />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtMaReqMArrPk" maxlen="100" styles='width:100%;display:none' />
</html>
