<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head>
    <title>LOT NO ITEM ENTRY</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript" language="javascript">

var flag;

var G2_PK			= 0,
	G2_LOT_NO		= 1,
	G2_LOT_DATE		= 2,
	G2_EXPIRE_DAYS	= 3,
	G2_ITEM_PK		= 4,
	G2_ITEM_CODE	= 5,
	G2_ITEM_NAME	= 6,
	G2_UOM			= 7,
	G2_PARTNER_PK	= 8,
	G2_PARTNER_ID	= 9,
	G2_PARTNER_NAME	= 10,
	G2_REMARK		= 11,
	G2_CLOSE_YN		= 12,
	G2_REF_NO		= 13, 
	G2_ATT01		= 14,
	G2_ATT02		= 15,
	G2_ATT03		= 16,
	G2_ATT04		= 17,
	G2_ATT05		= 18;
     
//===========================================================================

function BodyInit()
{
   	System.Translate(document); 
    
	BindingDataList();
       
}

//===========================================================================

function BindingDataList()
{     
    var data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>||Select ALL";   
    lstGroup.SetDataText(data);
    lstGroup.value = '' ;        
}

//===========================================================================

function OnGridCellDblClick()
{
    var row,col 
    
    row = event.row;
    col = event.col;
    
    switch (col)
    {
        case G2_UOM :
        {
            var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            
            if ( object != null )
            {
                grdDetail.SetGridText( row, G2_UOM, object[2]);
            }
            else
            {
                alert("Invalid Item!")
            }              
        }  
        break;        
    } 
}

//===========================================================================

function OnSearch(pos)
{
    switch (pos)
    {
         
        case 'grdDetail':            
            
            data_bisl00010_4.Call("SELECT");                    
        break;
       
    }
}

//===========================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bisl00010_4":
            if(grdDetail.rows - 1>0)
            {
               grdDetail.SetCellBgColor( 1, 1 , grdDetail.rows - 1, 1 , 0xCCFFFF ); 
            }
        break;
       
    }
}

//===========================================================================

function OnAddNew()
{
   if(txtItemPK.text=="")
   {
        alert("please Select Item !");
   }
   else
   {
        grdDetail.AddRow();
        grdDetail.SetGridText(grdDetail.rows-1,4,txtItemPK.text)
        grdDetail.SetCellBgColor( 1, 1 , grdDetail.rows - 1, 1 , 0xCCFFFF );
   }
    
    flag="view"; 
}  

//===========================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
             if(txtItemPK.text=="")
             {
                alert("Please select Item !");
             }
             data_bisl00010_4.Call();
        break;
    }
}

//===========================================================================

 function OnDelete()
{
    if( grdDetail.row >= 1 )
    { 
        if ( grdDetail.GetGridData( grdDetail.row,0 ) == '' ) 
        {
            grdDetail.RemoveRow();
        }
        else
        {
            grdDetail.DeleteRow();
        }  
    }
}

//===========================================================================
 
function OnUnDelete()
{              
     grdSpec.UnDeleteRow();
}

 
//===========================================================================

    
</script>

<body>     
    <!---------------------------------------------------------------------->
    <gw:data id="data_bisl00010_4" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="<%=l_user%>lg_sel_bisl00010" parameter="0,1,2,3,4,5,6,9,10,11,12,13,14,15" procedure="<%=l_user%>lg_upd_bisl00010_4" >
                <input bind="grdDetail" > 
					<input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtLotNo" />                   
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">        
                    <tr>
						<td style="width: 5%" align="left"  >                             
                            Date                                                   
                        </td>
						<td style="width: 20%; white-space: nowrap">
			                <gw:datebox id="dtFrom" styles="width:100%" lang=1 />
			                ~
			                <gw:datebox id="dtTo" styles="width:100%" lang=1 />
			            </td>
					 	<td style="width: 5%" align="left"  >                             
                            Item                                                   
                        </td>
						<td style="width: 20%" align="left" >
							<gw:list id="lstGroup" styles='width:100%' onchange="OnSearch('grdDetail')" />
						</td>
                        <td style="width: 15%" align="left"  >                             
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />                                                         
                        </td>
						<td style="width: 5%; white-space: nowrap" align="left"  >                             
                            Lot No                                                   
                        </td>
                        <td style="width: 20%" align="left"  >                             
                            <gw:textbox id="txtLotNo" styles="width:100%" onenterkey="OnSearch('grdDetail')"  />                                                         
                        </td>
						<td style="width: 5%">
			            </td>
			            <td style="width: 1%">
			                <gw:imgbtn id="btSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
			            </td>
			            <td style="width: 1%">
			                <gw:imgbtn id="btNew" img="new" alt="Add" onclick="OnAdd()" />
			            </td>
			            <td style="width: 1%">
			                <gw:imgbtn id="btDel" img="delete" alt="Delete" onclick="OnDelete()" />
			            </td>
			            <td style="width: 1%">
			                <gw:imgbtn id="btUnDel" img="udelete" alt="UnDelete" onclick="OnUDelete()" />
			            </td>
			            <td style="width: 1%">
			                <gw:imgbtn id="btSave" img="save" alt="Save" onclick="OnSave()" />
			            </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">                             
                            <gw:grid id='grdDetail' header='_PK|Lot No|Lot Date|Expire Days|_ITEM_PK|Item Code|Item Name|UOM|_TCO_BUSPARTNER_PK|Partner ID|Partner Name|Remark|Close YN|REF NO|ATT01|ATT02|ATT03|ATT04|ATT05'
                                format='0|0|4|4|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='||||||||||||||||||' 
								editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' 
								widths='0|1200|1300|1300|0|2000|3000|1000|0|1200|1400|1300|1000|1200|1200|1200|1200|1200|1200'
                                sorting='T' styles='width:100%; height:100%'oncelldblclick='OnGridCellDblClick()' />
                        </td>
                    </tr>
                
    </table>
</body> 
<!--------------------------------------------------------------------------->
</html>
