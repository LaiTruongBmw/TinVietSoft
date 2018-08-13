<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP CREATE ITEM FROM ITEM MAPPING</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
/*Start Check if it call from fphb00090.aspx form*/

  var pop_stitem_code = "<%=Request.querystring("item_code")%>"; 
  
/*End*/
//--------------------------
var G1_Select       = 0,
    G1_temp_item_pk = 1,
    G1_stitem_pk    = 2,
    G1_stitem_code  = 3,
    G1_stitem_name  = 4,
    G1_stuom        = 5,
    G1_item_pk      = 6;
    
/*G1_col_2
G1_col_4
G1_col_6
G1_col_8
G1_col_10
G1_col_12
G1_col_14
G1_col_16
G1_col_18
G1_col_20
*/
    
//=================================================================
function BodyInit()
{
    System.Translate(document); 
    //----------------------
    txtItemName.SetEnable(false);
    //----------------------
    if ( pop_stitem_code != "" )
    {
        txtItemCode.text = pop_stitem_code;

        data_agci00091_2.Call('SELECT');
    }
}
//=================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Item':// get Item
            var path = System.RootURL + '/form/fp/ab/PopUpGetOneSTItem.aspx?'
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            
            if( object != null )
            {
                txtItemPK.text   = object[0];
                txtItemCode.text = object[1];
                txtItemName.text = object[2];
                //-----------------
                OnSearch('grdTmp');
            }
        break;
    }

}
//=================================================================
function OnCheck(id)
{
    var ctrl = grdItemList.GetGridControl();
        if(id==1)//1 select
        {
             for(var i =0 ; i< ctrl.SelectedRows; i ++)
            {
                grdItemList.SetGridText(ctrl.SelectedRow(i),G1_Select,-1)
            }
        }else // 0 unselect
        {
             for(var i =0 ; i< ctrl.SelectedRows; i ++)
            {
                grdItemList.SetGridText(ctrl.SelectedRow(i),G1_Select,0)
            }
        }
   
}
//=================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdTmp': 

            if ( txtItemPK.text != '' )
            {
                data_agci00091.Call("SELECT");
            }    
        break;
    }
}

//=================================================================
function OnSave()
{
    for(var i =1 ; i< grdItemList.rows ; i ++)
    {
        if(grdItemList.GetGridData(i,G1_Select)==-1)
        {
             grdItemList.SetRowStatus(i,48) //insert
        }
    }

}
//=================================================================

  function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case "data_agci00091":
        
             for( var j = 1; j < grdTmp.rows; j++ )
             {
                 grdItemList.GetGridControl().ColHidden(j + 6) = false ;
                 grdItemList.GetGridControl().Cell( 0, 0, j + 6, 0, j + 6 ) = grdTmp.GetGridData( j, 1 );           
             }
             data_agci00091_1.Call("SELECT");
        break;             
        
        case "data_agci00091_1":
             //--------------------
             grdItemList.GetGridControl().AutoSize(0,15,false,0); 
             //-------- Set color------------
             /*for( var j = 1; j < grdItemList.rows; j++ )
             {
                 if ( grdItemList.GetGridData( j, G1_item_pk) > 0 )
                 {
                     grdItemList.SetCellBold( j,  0, j, grdItemList.cols, true);
                    // grdItemList.SetGridText( j,0, -1);
                 }
             } */
             //--------------------
        break;
        case "data_agci00091_2":
            if ( txtItemPK.text == "")
            {
                OnPopUp("Item");
            }
            else
            {
                OnSearch('grdTmp');
            }
        break;
    }
 }
 
//=================================================================
function OnDelete(obj)
{
    var ctrl = obj.GetGridControl()
	        var row  = ctrl.row;
	        if(row>0)
	        {
	            if (obj.GetGridData(row,col_pk)=="")
	            {
	                obj.RemoveRow();
	            }else
	            {
	                 if ( confirm ( "Do you want to delete this record?" ) )
                         {
                            obj.DeleteRow();             
                         }
	            }
	        }else
	        {
	            alert("Select a record to delete!")
	        }
}
//=================================================================
 function OnUnDelete(obj)
 {
        var ctrl = obj.GetGridControl()
        var row  = ctrl.row;
        if(row>0)
        {
             if ( confirm ( "Do you want to Undelete this record?" ) )
                 {
                    obj.UnDeleteRow();             
                 }
        }else
        {
            alert("Select a marked record  !")
        }
 }      
     
//=================================================================
 function SetCellColor(grid,col)
 {
        if(grid.rows>1)
                grid.SetCellBgColor( 1, col, grid.rows - 1, col, 0xd4d2ff );
 }
//=================================================================
 function ItemByCode()
 {
    data_agci00091_2.Call('SELECT');
 }
//=================================================================
 function onAutoClick()
 {
    data_agci00091_1.Call();
 }
//=================================================================

</script>

<body>
    <!----------------------------------------------------------------------------->
    <gw:data id="data_agci00091" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_agci00091" > 
                <input bind="grdTmp" > 
                    <input bind="txtItemPK"/> 
                </input> 
                <output bind="grdTmp" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------------->
    <gw:data id="data_agci00091_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter='0,1,2,6,17' function="st_lg_sel_agci00091_1"  procedure="st_lg_upd_agci00091"> 
                <input bind="grdItemList" > 
                    <input bind="txtItemPK"/> 
                </input> 
                <output bind="grdItemList" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------- Search by item code --------->
    <gw:data id="data_agci00091_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="st_lg_sel_agci00091_2"  > 
                <inout> 
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemName"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" class="table">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 100%">
                        <td>
                            <gw:icon id="btnSel" text="Check" styles='width:100%' onclick="OnCheck(1)" />
                        </td>
                        <td>
                            <gw:icon id="btnUnSel" text="UnCheck" styles='width:100%' onclick="OnCheck(0)" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Item')">Item </b>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItemPK" text="" styles="display:none" />
                            <gw:textbox id="txtItemCode" text="" styles='width:100%' onenterkey="ItemByCode()" />
                        </td>
                        <td style="width: 65%">
                            <gw:textbox id="txtItemName" text="" styles='width:100%' />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="ibtnAuto" img="auto" alt="Auto Generate Item" text="Auto Generate Item"
                                onclick="onAutoClick()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('grdTmp')"
                                styles='width:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdItemList' header='Select|_TMP_CREATE_ITEM_PK|_TCO_STITEM_PK|Item Code|Item Name|UOM|_TCO_ITEM_PK|_COLUMN2|_COLUMN4|_COLUMN6|_COLUMN8|_COLUMN10|_COLUMN12|_COLUMN14|_COLUMN16|_COLUMN18|_COLUMN20|_item_group_pk'
                    format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1500|3500|800|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:grid id='grdTmp' header='TCO_SPECGRP_PK|SPECGRP_NM' format='0|0' aligns='0|0'
        defaults='|' editcol='1|1' widths='1000|1000' sorting='T' styles='width:100%; height:460; display:none' />
    <!-------------------------------------------------------------------------->
</body>
</html>
