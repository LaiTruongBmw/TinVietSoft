<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ADD NEW MAINTAIN SCHEDULING</title>
</head>

<script type="text/javascript" language="javascript">
    
 var  assetPK    = "<%=request.QueryString("AssetPk")%>" ;   
        
 var G_PK                       =0,
     G_MA_ASSET_PART_PK         =1,
     G_PART_ID_PART_NAME        =2,
     G_MA_TASK_PK               =3,
     G_MA_TASK_ID               =4,
     G_MA_TASK_NAME             =5,
     G_MAINTAIN_DATE            =6,
     G_ATT01                    =7,
     G_ATT02                    =8,
     G_DESCRIPTION              =9;
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    BindingDataList();
    data_fpma00030.Call("SELECT");
    txtAssetPK.text=assetPK ;
    data_fpma00030_3.Call("SELECT");
}
//=================================================================================
function BindingDataList()
{
    data = "<%=ESysLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGPC1120') FROM DUAL")%>";  //payment term
    cboTaskType.SetDataText(data);
    cboTaskType.value='';
        
 
}
//=================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case'cboTaskList':
        data_fpma00030_2.Call('SELECT')
        break;
    }
}
//=================================================================================
function OnSelect()
{
    
}
//================================================================================
function OnSave()
{
    data_fpma00030.Call();
}
//================================================================================
function OnAddNew()
{
    grdTaskSchedule.AddRow();
    grdTaskSchedule.SetGridText(grdTaskSchedule.rows-1,G_MA_TASK_PK,cboTaskList.value);
    grdTaskSchedule.SetGridText(grdTaskSchedule.rows-1,G_MA_TASK_NAME,cboTaskList.GetText());
    grdTaskSchedule.SetGridText(grdTaskSchedule.rows-1,G_MA_ASSET_PART_PK,cboPartList.value);
    //grdTaskSchedule.SetGridText(grdTaskSchedule.rows-1,G_PART_ID_PART_NAME,cboPartList.GetText());
}
//=================================================================================
function  OnUndelete(pos)
{
    switch (pos)
     { 
          case 'grdTaskSchedule' :
            if(grdTaskSchedule.rows-1>0) 
            {   
                grdTaskSchedule.UnDeleteRow();
            }  
           break;
     }
}
//=================================================================================
function OnDelete(pos) 
{
    switch (pos)
    {
        
	        //-----------------------------------------------------
	        case 'grdTaskSchedule' :
	        if(grdTaskSchedule.rows-1>0)
	        { 	        
	             if ( grdTaskSchedule.GetGridData( grdTaskSchedule.row, G_PK ) == "" ) 
	            {						
        		
				    grdTaskSchedule.RemoveRow();					
		        }			
		        else 
		        {
			        grdTaskSchedule.DeleteRow();
                }
            }	   
		    break;
    }
}
//=================================================================================
function OnPopUp()
{
   
}   
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00030"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00030" parameter="0,1,2,3,4,5,6,7,8,9" procedure="<%=l_user%>lg_upd_fpma00030"> 
                <input bind="grdTaskSchedule" >
                </input>
                <output  bind="grdTaskSchedule" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00030_2" > 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_sel_fpma00030_2" > 
                <input>
                    <input bind="cboTaskType" /> 
                </input> 
                <output>
                    <output bind="cboTaskList" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00030_3" > 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_sel_fpma00030_3" > 
                <input>
                    <input bind="txtAssetPK" /> 
                </input> 
                <output>
                    <output bind="cboPartList" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" >
        <tr style="height: 1%; width: 100%">
            <td style="width: 5%">
                Asset
            </td>
            <td style="width: 18%">
                <gw:textbox id="txtAsset" csstype="mandatory" text="" styles='width:100%' />
            </td>
            <td style="width: 5%">
                Part
            </td>
            <td style="width:18%">
                <gw:list id="cboPartList" styles='width:100%' />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                Task Type</td>
            <td style="width: 18%">
                <gw:list id="cboTaskType" styles="width:100%;" onchange="OnSearch('cboTaskList')" />
            </td>
            <td style="width: 8%; white-space: nowrap" align="left">
                Task List</td>
            <td style="width: 20%">
                <gw:list id="cboTaskList" styles="width:100%;" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('grdTaskSchedule')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnUnDelete1" img="udelete" onclick="OnUndelete('grdTaskSchedule')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="13">
                <gw:grid id='grdTaskSchedule' header='_PK|_MA_ASSET_PART_PK|Part ID  Part Name|_MA_TASK_PK|Ma Task ID|Ma Task Name|Maintain Date|ATT01|ATT02|Description'
                    format='0|0|0|0|0|0|4|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' defaults='|||||||||'
                    editcol='1|1|1|1|1|1|1|1|1|1' widths='0|0|2500|0|1700|1700|1500|1500|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
<gw:textbox id="txtParentPK" text="" styles='width:100%;display:none' />
<gw:textbox id="txtAssetPK" text="" styles='width:100%;display:none' />
</html>
