<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One STItem</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var vPage = 0 ;

var G_PK                = 0,
    G_STItem_Code       = 1,
    G_STItem_Name       = 2,
    G_tco_itemgrp_pk    = 3,
    G_Item_Group        = 4,
    G_Unit              = 5,
    G_Lot_Qty           = 6,
    G_Price             = 7,
    G_LisPrice          = 8,
    G_StPrice           = 9,
    G_LmPrice           = 10,
    G_MkPrice           = 11,
    G_pur_type          = 12,
    G_volume            = 13,
    G_tin_warehouse_pk  = 14,
    G_partner_pk        = 15,
    G_partner_id        = 16,
    G_partner_name      = 17,
    G_Description       = 18,
    G_LOT_UOM           = 19,
    G_WT_UOM            = 20,
    G_Lot_WT            = 21,
    G_Weight            = 22,
    G_LName             = 23,
    G_FName             = 24;
//-------------------------------------------

function BodyInit()
{
    System.Translate(document);	

	//-------------------------
    var company_pk      = "<%=request.QueryString("company_pk")%>";
     //-------------------------    
    
    if ( Number(company_pk) > 0 )
    {
        txtCompanyPK.text = company_pk ;
        
		OnSearch('GROUP');
    }
    	 
	//----------------------------------
}

//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 'GROUP' :
                lst_agci00172.Call();
        break;
		
        case 'ITEM' :
	            data_agci00172_1.Call("SELECT");
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
//======================================================================

function OnDataReceive(obj)
{
   	switch(obj.id)
    {
        case 'data_agci00172_1' :
                   
        break;
		
		case 'lst_agci00172' :
			var group_pk = "<%=request.QueryString("group_pk")%>";
			
			if ( Number(group_pk)>0 )
			{
				lstGroup.value = group_pk ;
			}
			
			OnSearch('ITEM');
		break;
    }
}
 
//======================================================================


</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="lst_agci00172" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00172" > 
                <input>                      
                    <input bind="txtCompanyPK" />
                </input>
	           <output>
	                <output bind="lstGroup" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->   
    <gw:data id="data_agci00172_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="comm" function="st_lg_sel_agci00172_1"  > 
                <input>
				    <input bind="txtCompanyPK" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>	
    <!---------------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 44%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('ITEM')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 42%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('ITEM')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('ITEM')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
            </td>
			<td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>         
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 98%">
            <td colspan="7">
                <gw:grid id="idGrid" header="_PK|SI Item Code|ST Item Name|_tco_itemgrp_pk|Item Group|UOM|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Remark|_LOT UOM|_WT UOM|_Lot WT|_Weight|_item_lname|_item_fname"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|2500|1500|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtCompanyPK" styles="display: none" />
      <!---------------------------------------------------------------------------------------------->
</body>
</html>
