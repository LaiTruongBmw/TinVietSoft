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

//=========================================================================================
var G1_CHK          = 0,
	G1_INV_PK       = 1,
    G1_TYPE   		= 2,    
    G1_TRANS_DT     = 3,    
    G1_ASSET_PK     = 4,
    G1_ASSET_ID     = 5,
    G1_ASSET_NM     = 6,    
	G1_FR_DEPT_PK   = 7,	
	G1_FR_DEPT_ID   = 8,
	G1_FR_DEPT_NM   = 9,	
	G1_TO_DEPT_PK   = 10, 
	G1_TO_DEPT_ID   = 11,
	G1_TO_DEPT_NM   = 12,	 
	G1_PROCESS_YN   = 13,
	G1_PROCESS_TIME = 14;

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
	
    data = "data|1|MOVING|2|EVALUATION";
    lstTransType.SetDataText( data);
    lstTransType.value = '1' ;	
    
    OnChangeType();
      
    data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||";
    lstFrDept.SetDataText( data);
    lstFrDept.value = '' ;		
	lstToDept.SetDataText( data); 	
	lstToDept.value = '' ;	

} 
//=================================================================================
function OnSearch()
{
     data_fpma00190.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_fpma00190':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
   				grdMaster.SetCellBold( 1, G1_ASSET_ID, grdMaster.rows - 1, G1_ASSET_ID, true);  
				
				grdMaster.SetCellBgColor( 1, G1_TYPE,  grdMaster.rows - 1, G1_TYPE,  0xCCFFFF );
				
				grdMaster.SetCellBgColor( 1, G1_ASSET_ID, grdMaster.rows - 1, G1_ASSET_NM, 0xFFFFCC );	
				
				grdMaster.SetCellBgColor( 1, G1_FR_DEPT_ID, grdMaster.rows - 1, G1_FR_DEPT_NM, 0xCCFFFF );
				grdMaster.SetCellBgColor( 1, G1_TO_DEPT_ID, grdMaster.rows - 1, G1_TO_DEPT_NM, 0xFFFFCC );						
			}	
		break;
	}
}

//=========================================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Process':
            var income_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdMaster.rows; i++)
            {
                var a = grdMaster.GetGridData(i,G1_CHK);
                var b = grdMaster.GetGridData(i,G1_PK);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtInComePK.text = income_pk;
            
            if(txtInComePK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Evaluation ?') )
                 {
                        pro_fpma00190_EVA.Call();
                 }       
            }            
        break;
        
        case 'MB':
            if ( confirm ('Do you want to Approve ?') )
            {
                        pro_fpma00190_MB.Call();
            }
        break;
    }   
}
//=========================================================================================================

function OnChangeType()
{
    if ( lstTransType.value == 1 )
    {
        dBtnEVA.SetEnable(false);
        dBtnMB.SetEnable(true);
    }    
    else
    {
        dBtnEVA.SetEnable(true);
        dBtnMB.SetEnable(false);    
    }
}

 
//=========================================================================================================

</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpma00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00190" > 
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
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00190_EVA" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00190_EVA" > 
                <input>
                    <input bind="txtInComePK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00190_MB" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00190_MB" > 
                <input>
                    <input bind="txtInComePK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
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
                <gw:list id="lstTransType" text="" styles="width:100%" onchange="OnChangeType()" />
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
            <td style="width: 2%">
            </td>		                    
            <td style="width: 1%">
                <gw:icon id="dBtnMB" img="2" text="Moving" styles='width:100%' onclick="OnProcess('MB')" />
            </td>
            <td style="width: 1%">
                <gw:icon id="dBtnEVA" img="2" text="Evaluation" styles='width:100%' onclick="OnProcess('Process')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 90%">
            <td colspan="14">
                <gw:grid id='grdMaster' 
                    header='Chk|_PK|Type|Trans Date|_MA_ASSET_PK|Asset Code|Asset Name|_FR_DEPT_PK|Fr Dept ID|Fr Dept Name|_TO_DEPT_PK|To Dept ID|To Dept Name|Process|Process Time'
                    format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|1|0|0|0|0|1|0|0|0|0|1|1' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='800|0|1200|1400|0|1500|2500|0|1500|2500|0|1500|2500|1000|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none"  />
    <gw:textbox id="txtInComePK" styles="width:100%;display:none"  />
</body>
 </html>