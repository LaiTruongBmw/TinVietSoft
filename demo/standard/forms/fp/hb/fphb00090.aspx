<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ST BOM Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
  
/*End*/
var G_BOM_PK        = 0,
    G_PARENT_PK     = 1,
    G_SEQ           = 2,
    G_ITEM_PK       = 3,
    G_ITEM_CODE     = 4,
    G_ITEM_NAME     = 5,
	G_UOM           = 6,
    G_SOURCING_TYPE = 7,    
    G_NEED_QTY      = 8,
    G_LOSS_RATE     = 9,
    G_CONS_QTY      = 10,   
    G_REMARK        = 11;   

var arr_FormatNumber = new Array(); 
 
//=========================================================================================================
function BodyInit()
{   
    txtItemName.SetEnable(false);
    
    FormatGrid();
}   
//=========================================================================================================

function FormatGrid(grid)
{ 
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT code, code FROM tlg_lg_code a, tlg_lg_code_group b  WHERE     a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0210' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, 1" )%>" ; 
    grdParentBOM.SetComboFormat(G_SOURCING_TYPE,data);    

    var trl = grdParentBOM.GetGridControl();
    trl.ColFormat(G_NEED_QTY)  = "###,###,###,###,###.#####";
    trl.ColFormat(G_CONS_QTY)  = "###,###,###,###,###.#####";
    trl.ColFormat(G_LOSS_RATE) = "###,###,###,###,###";
        
    arr_FormatNumber[G_NEED_QTY]  = 5;
    arr_FormatNumber[G_CONS_QTY]  = 5;
    arr_FormatNumber[G_LOSS_RATE] = 0;  
	//--------------------
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT code, code FROM tlg_lg_code a, tlg_lg_code_group b  WHERE     a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0210' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, 1" )%>" ; 
    grdChildBOM.SetComboFormat(G_SOURCING_TYPE,data);    

    var trl = grdChildBOM.GetGridControl();
    trl.ColFormat(G_NEED_QTY)  = "###,###,###,###,###.#####";
    trl.ColFormat(G_CONS_QTY)  = "###,###,###,###,###.#####";
    trl.ColFormat(G_LOSS_RATE) = "###,###,###,###,###";
        
    arr_FormatNumber[G_NEED_QTY]  = 5;
    arr_FormatNumber[G_CONS_QTY]  = 5;
    arr_FormatNumber[G_LOSS_RATE] = 0;	           
       
}
 
//=================================================================================

function CheckInput(obj)
{ 
 
		    var col, row;
		    
		    col = event.col
		    row = event.row  
		    
		    if ( col == G_NEED_QTY || col == G_LOSS_RATE || col == G_CONS_QTY )
		    {
		        var dQuantiy ;
		        
		        dQuantiy =  obj.GetGridData(row,col) ;
		        
		        if (Number(dQuantiy))
		        {   
		            if (dQuantiy >0)
		            {
		                obj.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
		            }
		            else
		            {
		                alert(" Value must greater than zero !!");
		                obj.SetGridText( row, col, "");
		            }
		        }
		        else
		        {
		            obj.SetGridText(row,col,"") ;
		        }  
		        //----------------------Calculate Cons Qty -----
		        if ( col == G_NEED_QTY || col == G_LOSS_RATE )
		        {
		            var dConsQty = 0 ;
		            
		            dConsQty = Number(obj.GetGridData( row, G_NEED_QTY )) + Number(obj.GetGridData( row, G_NEED_QTY )) * Number(obj.GetGridData( row, G_LOSS_RATE )) / 100 ;                
		            obj.SetGridText( row, G_CONS_QTY, System.Round( dConsQty, arr_FormatNumber[G_CONS_QTY] ) ) ;
		        } 
		    }      		
		 
}   
//=========================================================================================================
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'PARENT_ITEM':
            var path = System.RootURL + '/form/fp/hb/fphb00091.aspx'
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            
            if ( object != null)
            {
                txtItemPK.text   = object[1];
                txtItemCode.text = object[2];
                txtItemName.text = object[3];
                
                OnSearch('PARENT_BOM');
            }        
        break;
    }
}
 
//=========================================================================================================
function OnSearch(id)
{
    switch(id)
    {       
        case 'PARENT' : // grid 1 find upper item
            data_fphb00090_3.Call('SELECT');
        break;       
       
        case 'PARENT_BOM' :
            data_fphb00090_2.Call('SELECT');
        break;
		
		case 'CHILD_BOM' :
			if ( grdParentBOM.row > 0 )
			{
				txtParentPK.text = grdParentBOM.GetGridData( grdParentBOM.row, G_ITEM_PK);
				
				data_fphb00090_5.Call('SELECT');
			}
			else
			{
				alert("PLS SELECT PARENT BOM ITEM !!!");
			}	
		break;
                       
        case 'ITEM' :
            data_fphb00090_4.Call('SELECT');
        break;
    }
}
//=========================================================================================================
function OnAddNew(pos)
{
	switch (pos)
	{  
		case 'PARENT_BOM' :		 
		    if ( txtItemPK.text != "")
		    {
		            var path = System.RootURL + '/form/fp/hb/fphb00092.aspx'
		            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		                                    
		            if ( object != null)
		            {
		                var arrTemp;
		                for( var i=0; i < object.length; i++)	  
		                {                
		                    arrTemp = object[i];
		                    
		                    grdParentBOM.AddRow();
		                    grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_SEQ,       grdParentBOM.rows-1 );
		                    grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_PARENT_PK, txtItemPK.text );
		                    grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_ITEM_PK,   arrTemp[1] );
		                    grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_ITEM_CODE, arrTemp[2] );
		                    grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_ITEM_NAME, arrTemp[3] );
							grdParentBOM.SetGridText( grdParentBOM.rows - 1, G_UOM      , arrTemp[4] );
		                }    
		            } 
		     }
		    else
		    {
		        alert("Please, Select item to make bom!! ")
		    }		
		break;
		
		case 'CHILD_BOM' :
			if ( grdParentBOM.row > 0 )
			{
				txtParentPK.text = grdParentBOM.GetGridData( grdParentBOM.row, G_ITEM_PK);
			}
			else
			{
				txtParentPK.text = '' ;
			}
			//-----		 
		    if ( txtParentPK.text != "")
		    {
		            var path = System.RootURL + '/form/fp/hb/fphb00092.aspx'
		            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		                                    
		            if ( object != null)
		            {
		                var arrTemp;
		                for( var i=0; i < object.length; i++)	  
		                {                
		                    arrTemp = object[i];
		                    
		                    grdChildBOM.AddRow();
		                    grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_SEQ,       grdChildBOM.rows-1 );
		                    grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_PARENT_PK, txtParentPK.text );
		                    grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_ITEM_PK,   arrTemp[1] );
		                    grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_ITEM_CODE, arrTemp[2] );
		                    grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_ITEM_NAME, arrTemp[3] );
							grdChildBOM.SetGridText( grdChildBOM.rows - 1, G_UOM      , arrTemp[4] );
		                }    
		            } 
		     }
		    else
		    {
		        alert("PLS SELECT PARENT BOM ITEM !!! ");
		    }		
		break;		
	}
}
//=========================================================================================================
function OnAddSub(grid)
{
    if ( grid.rows-1>0 )
    {
        txtItemPK.text   = grid.GetGridData( grid.row, G_ITEM_PK   );
        txtItemCode.text = grid.GetGridData( grid.row, G_ITEM_CODE );
        txtItemName.text = grid.GetGridData( grid.row, G_ITEM_NAME );
 
        OnSearch('PARENT_BOM');
     }
}
//=========================================================================================================
function OnDelete(obj)
{
    var ctrl = obj.GetGridControl()
	        var row  = ctrl.row;
	        if(row>0)
	        {
	            if (obj.GetGridData(row,G_BOM_PK)=="")
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
//=========================================================================================================
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
     
//=========================================================================================================
function OnSave(pos)
{
    switch(pos)
    {
        case 'PARENT_BOM' ://save from grdParentBOM
            data_fphb00090_2.Call();
        break;
		
		case 'CHILD_BOM' :
			data_fphb00090_5.Call();
		break;
    }
} 

//=========================================================================================================
 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case "data_fphb00090_2":
             if ( grdParentBOM.rows > 1 )
             {
			 	   grdParentBOM.SetCellBgColor( 1, G_ITEM_CODE, grdParentBOM.rows - 1, G_ITEM_NAME, 0xCCFFFF ); 
				   	
                   grdParentBOM.SetCellBold( 1, G_NEED_QTY,  grdParentBOM.rows - 1, G_CONS_QTY,  true); 
                   grdParentBOM.SetCellBold( 1, G_ITEM_CODE, grdParentBOM.rows - 1, G_ITEM_CODE, true);   
             } 
			 
			 txtParentPK.text = '' ;
			 grdChildBOM.ClearData();
        break;

		case "data_fphb00090_5":
             if ( grdChildBOM.rows > 1 )
             {
			 	   grdChildBOM.SetCellBgColor( 1, G_ITEM_CODE, grdChildBOM.rows - 1, G_ITEM_NAME, 0xCCFFFF ); 
				   	
                   grdChildBOM.SetCellBold( 1, G_NEED_QTY,  grdChildBOM.rows - 1, G_CONS_QTY,  true); 
                   grdChildBOM.SetCellBold( 1, G_ITEM_CODE, grdChildBOM.rows - 1, G_ITEM_CODE, true);   
             } 
        break;
		
        case "data_fphb00090_4":
            if( txtItemPK.text == "")
            {
                OnPopUp('PARENT_ITEM');
            }
            else
            {
                OnSearch('PARENT_BOM');
            }
        break;
        
        case "data_fphb00090_3":
            OnSearch("PARENT_BOM");
        break;
                        
    }
 }
  
//=========================================================================================================

</script>

<body>
    <!------------grid 1----------------->
    <gw:data id="data_fphb00090_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fphb00090_5" procedure="<%=l_user%>lg_upd_fphb00090_5"> 
                <input bind="grdChildBOM"  > 
                    <input bind="txtParentPK"/> 
                </input> 
                <output bind="grdChildBOM" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------grid 1----------------->
    <gw:data id="data_fphb00090_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fphb00090_2" procedure="<%=l_user%>lg_upd_fphb00090_2"> 
                <input bind="grdParentBOM"  > 
                    <input bind="txtItemPK"/> 
                </input> 
                <output bind="grdParentBOM" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------grid 1 find upper item---------------->
    <gw:data id="data_fphb00090_3" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control"   function="<%=l_user%>lg_sel_fphb00090_3"  > 
                <inout> 
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemName"/>                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!----------- Search by item code ------->
    <gw:data id="data_fphb00090_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fphb00090_4"  > 
                <inout> 
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemName"/>                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>        
    <!---------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="BOM Entry" class="table">
        <tr style="height: 1%">            
            <td style="width: 10%" align="right" >
                <b style="color: #1b2ff2; cursor: hand; white-space: nowrap" onclick="OnPopUp('PARENT_ITEM')">
                    Parent Part </b>
            </td>
            <td style="width: 50%; white-space: nowrap">
                <gw:textbox id="txtItemPK" text="" styles="display:none" />
                <gw:textbox id="txtItemCode" text="" styles='width:30%' onenterkey="OnSearch('ITEM')" />
                <gw:textbox id="txtItemName" text="" styles='width:70%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="idBtnUpper" img="2" text="Upper" styles='width:100%' onclick="OnSearch('PARENT')" />
            </td>
            <td style="width: 19%" align="center">
                 
            </td>
            <td style="width: 14%">
            </td>
            <td style="width: 1%" align="right">				                    
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnAddNew1" img="new" alt="new" onclick="OnAddNew('PARENT_BOM')" styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnAddSub1" img="new_sub" alt="newsub" onclick="OnAddSub(grdParentBOM)"
                    styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnDelete1" img="delete" alt="delete" onclick="OnDelete(grdParentBOM)"
                    styles='width:100%' />
            </td>
            <td wstyle="width: 1%" align="right">
                <gw:imgbtn id="ibtnUDelete1" img="Udelete" alt="Udelete" onclick="OnUnDelete(grdParentBOM)"
                    styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnUpdate1" img="save" alt="save" onclick="OnSave('PARENT_BOM')" styles='width:100%' />
            </td>                   
        </tr>
        <tr style="height: 49%">
            <td colspan=11 >
                <gw:grid id='grdParentBOM' header='_PK|_PARENT_ITEM_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Sourcing Type|Need Qty|Loss (%)|Cons Qty|Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|0|3|3|3|0' 
				    editcol='0|0|1|0|0|0|0|1|1|1|1|1'
                    widths='0|0|800|0|2000|4500|800|1500|1500|1500|1000|1000' sorting='T' styles='width:100%; height:100%'
                    onafteredit="CheckInput(grdParentBOM)" />
            </td>
        </tr>
        <tr style="height: 1%">            
            <td style="width: 10%" align="right" >                
            </td>
            <td style="width: 50%; white-space: nowrap">                 
            </td>
            <td style="width: 1%" align="right">                 
            </td>
            <td style="width: 19%" align="center">                 
            </td>
            <td style="width: 14%">
            </td>
            <td style="width: 1%" align="right">
				<gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('CHILD_BOM')" styles='width:100%' />                                    
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnAddNew2" img="new" alt="new" onclick="OnAddNew('CHILD_BOM')" styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnAddSub2" img="new_sub" alt="newsub" onclick="OnAddSub(grdChildBOM)"
                    styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnDelete2" img="delete" alt="delete" onclick="OnDelete(grdChildBOM)"
                    styles='width:100%' />
            </td>
            <td wstyle="width: 1%" align="right">
                <gw:imgbtn id="ibtnUDelete2" img="Udelete" alt="Udelete" onclick="OnUnDelete(grdChildBOM)"
                    styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnUpdate2" img="save" alt="save" onclick="OnSave('CHILD_BOM')" styles='width:100%' />
            </td>                   
        </tr>		
		<tr style="height: 50%">
            <td colspan=11 >
                <gw:grid id='grdChildBOM' header='_PK|_PARENT_ITEM_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Sourcing Type|Need Qty|Loss (%)|Cons Qty|Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|0|3|3|3|0' 
				    editcol='0|0|1|0|0|0|0|1|1|1|1|1'
                    widths='0|0|800|0|2000|4500|800|1500|1500|1500|1000|1000' sorting='T' styles='width:100%; height:100%'
                    onafteredit="CheckInput(grdChildBOM)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------>
	<gw:textbox id="txtParentPK" styles="width:100%; display:none"/>
</body>
</html>
