<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ST Item Entry without Spec</title>
</head>

<script>
 
    var lastrow = -1 ;
        
    var G1_item_pk          = 0, 
        G1_item_code        = 1, 
        G1_item_name        = 2,   
        G1_item_lname       = 3, 
        G1_item_fname       = 4,
        G1_uom              = 5, 
        G1_unit_price       = 6,
        G1_pur_price        = 7, 
        G1_prod_price       = 8,
        G1_CCY              = 9,
        G1_use_yn           = 10, 
        G1_description      = 11,
        G1_tco_itemphoto_pk = 12,
        G1_tco_itemgrp_pk   = 13;
        
 //---------------------------------------------------------
 function OnToggle(direction)
 {
    if ( direction == 'SearchList' )
    {
        var left  = document.all("left");    
        var right = document.all("right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left.style.display="none";       
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../../system/images/button/next.gif";
        }
        else
        {
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../../system/images/button/previous.gif";
        }
     }
     else if ( direction == 'Picture' )
     {
        var left  = document.all("t-left");    
        var right = document.all("t-right");   
        var imgArrow = document.all("img1");   
        
        if(imgArrow.status == "expand")
        {
            right.style.display="none";       
            imgArrow.status = "collapse";
            left.style.width="99%";
            imgArrow.src = "../../../../system/images/button/previous.gif";
        }
        else
        {
            right.style.display="";
            imgArrow.status = "expand";
            //left.style.width="75%";
            imgArrow.src = "../../../../system/images/button/next.gif";
        }     
     }    
 }        
//------------------------------------------------------------ 

function BodyInit()
{   
    System.Translate(document); 
	
    txtParentNm.SetEnable(false);
    //------------------------------
    SetGridFormat();
    OnToggle('Picture');
    //------------------------------    
    OnSearch('Group');	 
	
} 
 
//------------------------------------------------------------
function SetGridFormat()
{

	var data = "<%=CtlLib.SetGridColumnDataSQL("select  UOM_CODE, UOM_CODE UOM_CODE1 from TLG_IT_UOM where del_if=0  order by 1")%>";   
    grdItem.SetComboFormat(G1_uom,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdItem.SetComboFormat(G1_CCY,data);   
	
    var ctr = grdItem.GetGridControl(); 
    ctr.ColFormat(G1_unit_price) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_pur_price)  = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_prod_price) = "#,###,###,###,###,###.##";
}

//------------------------------------------------------------ 
function OnSave(pos)
{
    switch (pos)
    {
        case 'Item':
            grdItem.SetGridText(grdItem.row, G1_tco_itemphoto_pk, imgItem.oid );// luu photo_pk cho dong cuoi cung
            
            if( ValidateData() )
            {
                data_agci00180_2.Call('');
            }        
        break;
        
        case 'Group':
            data_agci00180_1.Call();
        break;     
    }   
}
//------------------------------------------------------------ 
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Item' :
            if ( txtGroup_PK.text != '' )
            {
                if ( txtLeafYN.text == 'Y' )
                {
                    grdItem.AddRow();
                    grdItem.SetGridText(grdItem.rows-1, G1_tco_itemgrp_pk, txtGroup_PK.text );
                    grdItem.SetGridText(grdItem.rows-1, G1_uom,            txtGrpUOM.text   );
                    grdItem.SetGridText(grdItem.rows-1, G1_use_yn        , '-1'             );
                }
                else
                {
                    alert("Add new for Leaf Group only.");
                }    
            }
            else
            {
                alert('Pls Select Group first !!!');
            }    
        break;
        
        case 'group' :
            data_agci00180_1.StatusInsert();
                        
            txtParentPK.text = oTree.GetCurrentNode().oid; 
            txtParentNm.text = oTree.GetCurrentNode().text;            
            
            txtGrpCD.text = '<< New Code >>' ;
            txtGrpNm.text = '<< New Name >>' ;
        break;  
        
        case 'update_group' :
            txtGroupNew_PK.text = oTree.GetCurrentNode().oid;
            data_agci00180_1.Call("SELECT");
        break;      
    }    
}
//------------------------------------------------------------ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_agci00180_3":
             data_agci00180_2.Call("SELECT");
        break;
        
        case 'data_agci00180_2':
            lblRecord.text = grdItem.rows-1 + ' row(s)';
        break;
                
        case 'data_agci00180_1':
            OnSearch('Group');
        break;        
    }
}
//------------------------------------------------------------
function OncellClickGrd()
{
    if(lastrow!='-1')
    {
        grdItem.SetGridText(lastrow, G1_tco_itemphoto_pk, imgItem.oid);
    }
   
    txttco_itemphoto_pk.SetDataText(grdItem.GetGridData(grdItem.GetGridControl().row, G1_tco_itemphoto_pk));
    imgItem.SetDataText(txttco_itemphoto_pk.text );  
    lastrow = grdItem.GetGridControl().row;
   
}
//------------------------------------------------------------
function OnDelete(pos)
{
    switch (pos)
    {
        case 'Item' :
            if( confirm('Do you want to delete this item ?'))
	        {
	            grdItem.DeleteRow();
	        }        
        break;
        
        case 'Group':
            if(confirm('Do you want to delete selected group?'))
            {                
                data_agci00180_1.StatusDelete();
                data_agci00180_1.Call('');
	        }        
        break;
    }
}
//------------------------------------------------------------
function ValidateData()
{
    for(i=1; i<grdItem.rows;i++)
    {
        if((grdItem.GetGridData(i, G1_item_code ) =='')&& (grdItem.GetRowStatus(i)!=64))
        {
            alert("You must input item code at row " + i + "!");
            return false;
        }
        if(grdItem.GetGridData(i, G1_item_name ) =='')
        {
            alert("You must input item name at row " + i + "!");
            return false;
        }
        if(grdItem.GetGridData(i, G1_uom ) =='')
        {
            alert("You must input uom at row " + i + "!");
            return false;
        }
    }
    return true;
}

 //------------------------------------------------------------------
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
        
    if ( col == G1_unit_price || col == G1_pur_price || col == G1_prod_price )
    {      
        var dQuantiy
        
        dQuantiy =  grdItem.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdItem.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdItem.SetGridText(row,col,"")
            }
        }
        else
        {
            grdItem.SetGridText(row,col,"")
        }
         //---------------------------------------------
    } 
 } 
//============================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Group':
            data_agci00180.Call("SELECT");
        break;
        
        case 'ItemList': 
            txtGroup_PK.SetDataText(oTree.GetCurrentNode().oid);
            
            data_agci00180_3.Call("SELECT");                              
        break;    
    }
}

//============================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="st_lg_sel_agci00180" > 
                <input>
                    <input bind="txtGroupSearch" />
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00180_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4" function="st_lg_sel_agci00180_1"  procedure="st_lg_upd_agci00180_1"> 
                <inout> 
                     <inout  bind="txtGroupNew_PK" /> 
                     <inout  bind="txtParentPK" />
                     <inout  bind="txtParentNm" />
                     <inout  bind="txtGrpCD" />
                     <inout  bind="txtGrpNm" />                	                 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00180_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3" function="st_lg_sel_agci00180_3"> 
                <inout> 
                     <inout  bind="txtGroup_PK" /> 
                     <inout  bind="lbGroupName" />
                     <inout  bind="txtGrpUOM" /> 
                     <inout  bind="txtLeafYN" />              	                 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00180_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_agci00180_2" procedure="st_lg_upd_agci00180_2" > 
                <input bind="grdItem" > 
                    <input bind="txtItem" /> 
                    <input bind="txtGroup_PK" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr valign="top" style="height: 100%">
            <td style="width: 35%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search
                        </td>
                        <td style="width: 96%">
                            <gw:textbox id="txtGroupSearch" styles='width:100%' onenterkey="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnAddNew" img="new" alt="New" text="New" onclick="OnAddNew('group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUpdate" img="update" alt="Update" text="Update" onclick="OnAddNew('update_group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave01" img="save" alt="Save" text="Save" onclick="OnSave('Group')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Parent
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtParentPK" styles='width:100%; display:none' />
                            <gw:textbox id="txtParentNm" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Group
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtGrpCD" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtGrpNm" styles='width:70%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%;" colspan="7">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnSearch('ItemList')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
									<td style="width: 5%" align="left">
                                        <img status="expand" id="imgArrow"  src="../../../../system/images/button/previous.gif" 
											style="cursor: hand" onclick="OnToggle('SearchList')" />
                                    </td>								     
                                    <td style="width: 50%" align="left">
                                        <gw:label id="lbGroupName" styles="color: red">-</gw:label>
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Item</td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('ItemList')" />
                                    </td>
                                    <td style="width: 16%" align="center">
                                        <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 1%" valign="bottom" align="right">
                                        <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('ItemList')" />
                                    </td>
                                    <td style="width: 1%" valign="bottom" align="right">
                                        <gw:imgbtn id="ibtnAdd" img="new" alt="Add New Item" text="Add New Item" onclick="OnAddNew('Item')" />
                                    </td>
                                    <td style="width: 1%" valign="bottom" align="right">
                                        <gw:imgbtn id="ibtnDel" img="delete" alt="Delete Item" text="Delete Item" onclick="OnDelete('Item')" />
                                    </td>
                                    <td style="width: 1%" valign="bottom" align="right">
                                        <gw:imgbtn id="ibtnSave" img="save" alt="Save Item" text="Save Item" onclick="OnSave('Item')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 100%" valign="top">
                                    <td style="width: 98%" id="t-left">
                                        <gw:grid id="grdItem" header='_Pk|Item Code|Item Name|Item Lname|Item Fname|UOM|Sale Price|Pur Price|Prod Price|CCY|Use Y/N|Description|_tco_Itemphoto_Pk|_tco_Itemgrp_Pk'
                                            format='0|0|0|0|0|2|0|0|0|0|3|0|0|0' aligns='0|0|0|0|0|1|3|3|3|0|0|0|0|0' defaults='|||||||||||||'
                                            editcol='1|1|1|1|1|1|1|1|1|1|1|1|0|0' widths='0|1800|2500|2000|2000|800|1300|1300|1300|1000|800|2000|0|0'
                                            styles="width:100%; height:100%" sorting="F" oncellclick="OncellClickGrd()" onafteredit="CheckInput()" />
                                    </td>
                                    <td style="width: 1%">
                                        <img status="expand" id="img1" src="../../../../system/images/button/next.gif" style="cursor: hand;
                                            position: fixed" onclick="OnToggle('Picture')" />
                                    </td>
                                    <td style="width: 1%" id="t-right">                                         
											<gw:image id="imgItem" table_name="TLG_IT_STITEMPHOTO" procedure="st_lg_SYS_INSERT_PICTURE_STITEM"
                                            styles="width:200;height:200" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" />
											
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table> 
    <!------------------------------------------->
    <gw:textbox id="txtGroupNew_PK" styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtGroup_PK" styles='display:none' />
    <gw:textbox id="txtGrpUOM" styles='display:none' />
    <gw:textbox id="txtLeafYN" styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txttco_itemphoto_pk" styles="display: none" />
    <!------------------------------------------------------------------------------>
</body>
</html>
