<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get ST BOM Item</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_GRP_CD     = 0,   
    G_ITEM_PK    = 1,
    G_ITEM_CODE  = 2,
    G_ITEM_NAME  = 3,
    G_STATUS     = 4;   

var vPage = 0 ;
//======================================================================
function BodyInit()
{
	//-------------------------
    
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( PROD_YN = 'Y' or SALE_YN = 'Y' or SEMI_PROD_YN = 'Y' ) order by grp_nm " ) %>||Select ALL";     
    lstGroup.SetDataText(data);   
    lstGroup.value = '';
	//---------------------------------------
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 'grdDetail':
	            data_fphb00091.Call("SELECT");
        break;
    }
   
}
//======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fphb00091':
            lblRecord.text = grdDetail.rows-1 + " record(s)";
        break;
    }
}

//---------------------------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fphb00091" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fphb00091" > 
                  <input bind="grdDetail" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 44%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('grdDetail')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 44%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="9">
                <table width="100%" style="height: 100%">
                    <tr align="right">
                        <td style="width: 5%;" align="right">
                        </td>
                        <td style="width: 95%;" align="left">
                            <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 47%">
            <td colspan="6">
                <gw:grid id="grdDetail" header="Group|_PK|Item Code|Item Name|UOM" format="0|0|0|0|0"
                    aligns="0|0|0|0|1" editcol="0|0|0|0|0" widths="2000|0|2000|3500|1000" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(grdDetail)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
