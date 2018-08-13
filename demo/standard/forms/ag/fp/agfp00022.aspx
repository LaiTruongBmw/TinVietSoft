<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>User Setting</title>
</head>

<script type="text/javascript">
var _bLoad = false;

var G1_PK       = 0,
    G1_WH_ID    = 1,
    G1_WH_NAME  = 2;

var G2_PK           = 0,
    G2_ITEM_CODE    = 1,
    G2_ITEM_NAME    = 2;   

var G3_PK                   = 0,
    G3_TLG_IN_WAREHOUSE_PK  = 1,
    G3_TCO_ITEMGRP_PK       = 2,
    G3_TCO_ITEMGRP_ID       = 3,
    G3_TCO_ITEMGRP_NAME     = 4,
    G3_DESCRIPTION          = 5;   
//=========================================================================================
function BodyInit()
{	
    System.Translate(document); 
}
//=========================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case'WH':
            agfp00022_list_wh.Call("SELECT");
        break;
		
        case'GroupUser_Item':
            agfp00022_list_item_group.Call("SELECT");
        break;		
		
        case'MAPWH':
            dso_agfp00022_3.Call("SELECT");
        break;		
    }
}
//==========================================================================================
function OnSaveMap(p_tab)
{
    if (p_tab == 'GroupUser')
	{
		 dso_agfp00022_3.Call();
	}
}
//==========================================================================================
function OnDataReceive(obj)
{
   switch (obj.id)
    {
        case 'dso_agfp00022_3':         
            agfp00022_list_item_group.Call('SELECT');
        break;
   }
}
//==========================================================================================
function OnDelete(p_obj)
{
    if (p_obj=='GroupUser')
    {
        var mapCtrl = grdMapping.GetGridControl();
	    var i = 0;
	    if (mapCtrl.SelectedRows >0) 
	    {
	        for(i=mapCtrl.Rows -1; i>0; i --)
	        {
	            if (mapCtrl.IsSelected(i))
	            {
                     if(grdMapping.GetGridData(i,G3_PK)=="")
	                 {
	                    grdGroup.AddRow();
		   	            grdGroup.SetGridText(grdGroup.rows-1,G2_PK          ,grdMapping.GetGridData(i,G3_TCO_ITEMGRP_PK))
		   	            grdGroup.SetGridText(grdGroup.rows-1,G2_ITEM_CODE   ,grdMapping.GetGridData(i,G3_TCO_ITEMGRP_ID))
		   	            grdGroup.SetGridText(grdGroup.rows-1,G2_ITEM_NAME   ,grdMapping.GetGridData(i,G3_TCO_ITEMGRP_NAME))
    		   	    
                        grdMapping.RemoveRowAt(i)
                     }
                     else
                     {
                        grdMapping.DeleteRowAt(i)
                     }
                }
           }
        }  
    }
}
//==========================================================================================
function OnUnDelete(p_obj)
{
    if (p_obj=='GroupUser')
    {
        grdMapping.UnDeleteRow()
    }
}
//==========================================================================================
function  OnSelectUser(p_tap)
{
    if(p_tap == 'WH')
    {
        if(grdWarehouse.row >0)
        {
            txtWH_PK.text  = grdWarehouse.GetGridData(grdWarehouse.row,G1_PK);
            txtWH_ID.text  = grdWarehouse.GetGridData(grdWarehouse.row,G1_WH_ID);
            txtWH_NAME.text = grdWarehouse.GetGridData(grdWarehouse.row,G1_WH_NAME);
            OnSearch('MAPWH'); 
        }
    }
}
//==========================================================================================
function OnMSelect(obj)
{
	if(obj=='Item')
    {
        
        var mapCtrl = grdMapping.GetGridControl();
	    var WhCtrl = grdGroup.GetGridControl();
	    var i = 0;
    	
        if(txtWH_PK.text !="")    
        {
            if (WhCtrl.SelectedRows >0) 
            {
			    for (i=WhCtrl.Rows-1;i>0;i--)
			    {
				    //Add row to mapping grid
				    if (WhCtrl.IsSelected(i))
				    {        
            
		   	        grdMapping.AddRow();
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_TCO_ITEMGRP_PK, grdGroup.GetGridData(i,G2_PK))
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_TCO_ITEMGRP_ID, grdGroup.GetGridData(i,G2_ITEM_CODE))
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_TCO_ITEMGRP_NAME, grdGroup.GetGridData(i,G2_ITEM_NAME))
        		   	
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_TLG_IN_WAREHOUSE_PK,txtWH_PK.text)
    		   	    
		   	        grdGroup.RemoveRowAt(i)	
                    } //end if
                } //for
            }// end if
        }       
        else
        {
            alert("Please select warehouse first!");
        }
    }
}

</script>

<body>
    <gw:data id="agfp00022_list_wh" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agfp00022_wh"  > 
			<input bind="grdWarehouse" >	
			    <input bind="txtWHFilter" />	
			</input> 
			<output bind="grdWarehouse" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agfp00022_list_item_group" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agfp00022_item_group"  > 
			<input bind="grdGroup" >	
			    <input bind="txtGroupFilter_t3" />	
                <input bind="txtWH_PK" />				    							
			</input> 
			<output bind="grdGroup" /> 
		</dso> 
	</xml> 
    </gw:data>
        <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agfp00022_3" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agfp00022" parameter="0,1,2,3,4,5"  procedure="st_lg_upd_agfp00022" > 
			<input bind="grdMapping" >		
			     <input bind="txtWH_PK" />							
			</input> 
			<output bind="grdMapping" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <table name="User Item Group Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>Warehouse</b></td>
                        <td width="100%">
                            <gw:textbox id="txtWHFilter" styles="width:100%" onenterkey="OnSearch('WH')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('WH')" />
                        </td>
                        <td align="right">
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="5">
                            <gw:grid id='grdWarehouse' header='_PK|W/H ID|W/H Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|1000|1500' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSelectUser('WH')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="15%" align="right">
                            ID</td>
                        <td width="25%">
                            <gw:textbox id="txtWH_ID" text="" />
                        </td>
                        <td width="10%">
                            Name</td>
                        <td width="40%">
                            <gw:textbox id="txtWH_NAME" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_t3" img="delete" alt="Remove" text="Delete" onclick="OnDelete('GroupUser')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_t3" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('GroupUser')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_t3" img="save" alt="Save" text="Save" onclick="OnSaveMap('GroupUser')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping' header='_MAP_PK|_wh_pk|_grp_PK|Group Code|Group Name|Description'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' check='||||||||||'
                                editcol='0|0|0|0|0|1' widths='0|0|0|1200|1500|2000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            Group</td>
                        <td width="100%">
                            <gw:textbox id="txtGroupFilter_t3" styles="width:100%" onenterkey="OnSearch('GroupUser_Item')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t3" img="search" alt="Search" onclick="OnSearch('GroupUser_Item')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect_t3" img="Select" alt="Search" onclick="OnMSelect('Item')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="4">
                            <gw:grid id='grdGroup' header='_PK|Group Code|Group Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|1500|1500' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------->
    <gw:textbox id="txtWH_PK" text="" styles="display:none"/>
</body>
</html>
