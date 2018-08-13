<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_tco_item_pk       = 0,
    G_Item_Code         = 1,
    G_Item_Name         = 2,
    G_tco_itemgrp_pk    = 3,
    G_Item_Group        = 4,
    G_Unit              = 5,
    G_NULL_01           = 6,
    G_Price             = 7,    
    G_Description       = 8;


var vPage = 0 ;
//======================================================================
function BodyInit()
{
    System.Translate(document);
	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
    txtItemCD.text = "<%=Request.querystring("item_cd")%>";
    txtItemNM.text = "<%=Request.querystring("item_nm")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from  tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN ={5} ) order by grp_cd ", Request.querystring("group_type")) %>||Select All";     
    lstGroup.SetDataText(data);  
    lstGroup.value="";
    
    //-------------------------  
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( group_pk != '' )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
    //---------------------------------------	
	var tco_stitem_pk = "<%=Request.querystring("tco_stitem_pk")%>";
	
	if ( Number(tco_stitem_pk) > 0 )
	{
	    txtSTItemPK.text = tco_stitem_pk;
	    txtSTItem.SetEnable(false);
	    
	    lstGroup.value = '' ;	    
	    lstGroup.SetEnable(false);
	    
	    data_fpab00110.Call("SELECT");
	}  
	else
	{
	    var STITEM = document.all("STITEM"); 	    	
	    STITEM.style.display = "none";	
	}  
	
	//---------------------------------------
	OnFormatGrid();
	
	//OnSearch('idGrid');
	//---------------------------------------
}
//======================================================================
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##"; 
}
//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        
        case 'idGrid':
	            data_fpab00110_1.Call("SELECT");
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
        case 'data_fpab00110_1':
            lblRecord.text = idGrid.rows-1 + " record(s)";
        break;
    }
}
//======================================================================
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    for( j=0 ; j < oGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00110" onreceive="OnReceiveData(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="st_lg_sel_fpab00110"  > 
                <inout> 
                    <inout bind="txtSTItemPK" />  
                    <inout bind="txtSTItem" />
                    <inout bind="lstGroup" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00110_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00110_1" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItemCD" />
                    <input bind="txtItemNM" />
					<input bind="txtSTItemPK" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
                ST Item
            </td>
            <td style="width: 44%" colspan="6">
                <gw:textbox id="txtSTItemPK" styles="display: none" />
                <gw:textbox id="txtSTItem" styles="width:100%" csstype="mandatory" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 44%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('idGrid')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 44%;white-space:nowrap">
                <gw:textbox id="txtItemCD" styles="width:30%" onenterkey="OnSearch('idGrid')" />
                <gw:textbox id="txtItemNM" styles="width:70%" onenterkey="OnSearch('idGrid')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('idGrid')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="10">
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
            <td colspan="7">
                <gw:grid id="idGrid" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|_Quantity|U/Price|Remark"
                    format="0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|0|3|0"
                    editcol="0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|0|2500|800|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
