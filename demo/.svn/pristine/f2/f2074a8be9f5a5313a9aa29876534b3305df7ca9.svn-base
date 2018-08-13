<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One Item</title>
</head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
  


<script>

var iCols_tco_item_pk = 0 ;

function BodyInit()
{
    txtPartnerID.SetEnable(false);
	txtPartnerName.SetEnable(false);	
	txtPageNum.text = "1";
	var p_yn = "<%=Request.querystring("purchase_yn")%>";
	
    var data = "";  
          
    if ( p_yn == 'Y' )
    {
        data = "<%=CtlLib.SetListDataSQL("select pk, grp_nm from tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and pur_yn = 'Y' ")%>|ALL|Select all";     
        lstGroup.SetDataText(data);
        lstGroup.value = 'ALL' ;
    }
    else if ( p_yn == 'N' )
    {
        data = "<%=CtlLib.SetListDataSQL("select pk, grp_nm from tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and pur_yn = 'N' ")%>|ALL|Select all";     
        lstGroup.SetDataText(data);
        lstGroup.value = 'ALL' ;
    }
    else
    {
        data = "<%=CtlLib.SetListDataSQL("select pk, grp_nm from tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y'  ")%>|ALL|Select all";     
        lstGroup.SetDataText(data);
        lstGroup.value = 'ALL' ;
    }

    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( group_pk != '' )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
	
	txtPur_YN.text = p_yn;
}
//------------------------------------------------------------------------------------------------
function TabPopUp(fnameFile)
{
	var fpath = System.RootURL + "/standard/forms/fm/gf/" + fnameFile; 	
	var a = new Array();
	aValue  = System.OpenModal(  fpath , 800 , 550 , 'resizable:no;status:yes');	
	if ( aValue != null )  
	{
	    txtPartnerName.text = aValue[2];
		txtPartnerID.text = aValue[1];					
		txtPartnerPK.text = aValue[0];
	}
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{ 
	    dsoGetItem.Call("SELECT");
}
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
    OnGridCellDoubleClick(oGrid);	  
}

//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
        var code_data=new Array()
        
	    var ctrl = idGrid.GetGridControl();
	    
	    var index, rowNo
	    index = 0 ;
	    rowNo = 0 ;
	    if( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
	    {
	        for( i=0 ; i<ctrl.SelectedRows ; i++ )
		    {	  
	            rowNo = ctrl.SelectedRow(i) ;
	            
	            for( j=0 ; j<idGrid.cols -1 ; j++ )
	            {
                    code_data[index] = idGrid.GetGridData(rowNo , j );
                    index ++;
                } 
                
		    }
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
}
//------------------------------------------------------------------------------------------------

</script>

<body>
    <gw:data id="dsoGetItem" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="ac_sel_get_one_item_popup" > 
                  <input bind="idGrid" > 
                    <input bind="txtPartnerPK" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtPur_YN" />
					<input bind="txtPageNum" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%">
        <tr>
            <td width="5%" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="TabPopUp('PopUpGetPartner.aspx',1)">
                    Partner </b>
            </td>
            <td width="10%">
                <gw:textbox id="txtPartnerID" styles="width:100%" />
            </td>
            <td width="20%">
                <gw:textbox id="txtPartnerName" styles="width:100%" />
            </td>
            <td width="5%" align="right">
                <b>Group</b>
            </td>
            <td width="20%">
                <gw:list id="lstGroup" styles="width:100%" value='ALL' onchange="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <b>Item</b>
            </td>
            <td width="25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr>
            <td colspan="13">
                <gw:grid id="idGrid" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|2500|1500|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:400"
                    sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtPartnerPK" style="display: none" />
    <gw:textbox id="txtPur_YN" style="display: none" />
	<gw:textbox id="txtPageNum" style="display: none" />
</body>
</html>
