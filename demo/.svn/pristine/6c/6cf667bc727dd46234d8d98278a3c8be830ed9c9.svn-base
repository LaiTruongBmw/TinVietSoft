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
/*Start Check if it call from fphb00090.aspx form*/
  var pop_stitem_pk   = "<%=Request.querystring("stitem_pk")%>"; 
  var pop_stitem_code = "<%=Request.querystring("stitem_code")%>"; 
  var pop_stitem_name = "<%=Request.querystring("stitem_nm")%>"; 
  
  var pop_return      = "";  
/*End*/

var col_pk              = 0,
    col_parent_pk       = 1,
    col_parent_uom      = 2,
    col_seq             = 3,
    col_item_pk         = 4,
    col_stitem_code     = 5,
    col_stitem_name     = 6,
    col_tco_item_pk     = 7,
    col_item_code       = 8,
    col_item_name       = 9,
    col_uom             = 10,
    col_sourcing        = 11,
    col_tpr_process_pk  = 12,
    col_process         = 13,  
    col_phantom         = 14,
    col_req_qty         = 15,
    col_loss_type       = 16,
    col_loss_rate       = 17,
    col_loss_band1      = 18,
    col_loss_rate1      = 19,
    col_loss_band2      = 20,
    col_loss_rate2      = 21,
    col_description     = 22;

//grid Item 
var gridItem_status = 5

//BOM Grid
var G2_col_level        = 0 ,
    G2_col_sourcing     = 10 ,
    G2_col_qty          = 14 ,
    G2_col_loss_type    = 15 ,
    G2_loss_rate        = 16 ;
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
//------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    //------------------------------
    txtItemName.SetEnable(false);
    txtUOM.SetEnable(false);
    //------------------------------    
    FormatGrid(grid1)
    FormatGrid(grid2)
    //------------------------------
    BindingDataList();
    //------------------------------    
    
    /*this segment will be executed if this form are called as a popup*/   
    if(pop_stitem_pk!="")
    {
         tab2.style.display = 'none';
         
         txtItemPK.text   = pop_stitem_pk  ;
         txtItemCode.text = pop_stitem_code;
         txtItemName.text = pop_stitem_name;
         
         FindItemByCode();
    }
    //------------------------------    
}

 //---------------------------------------------------------
 function BindingDataList()
 {
    //----------------------
    grdBOM.GetGridControl().ColFormat(G2_col_qty)           = "###,###,###,###,###.###";
    grdBOM.GetGridControl().ColFormat(G2_loss_rate)         = "###,###,###,###,###.###";
    
    //----------------------
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grdBOM.SetComboFormat(G2_col_sourcing,data);
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0230' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grdBOM.SetComboFormat(G2_col_loss_type,data);
    //----------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and prod_yn = 'Y' ")%>|ALL|Select all";     
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL' ;
    
    lstGroupSearch.SetDataText(data);
    lstGroupSearch.value = 'ALL' ;
    //----------------------
    lstStatus.SetDataText('|0|Saved|1|Confirmed')
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select '0','Saved' from dual union select '1','Confirmed' from dual  ")%>";     
    grdItem.SetComboFormat(gridItem_status,data);
    //----------------------
 }       
 
//-------------------------------------------------------------------------------
function FormatGrid(grid)
 {
    var trl = grid.GetGridControl();
    trl.ColFormat(col_req_qty)              = "###,###,###,###,###.#####";
    trl.ColFormat(col_loss_rate)            = "###,###,###,###,###.###";
    trl.ColFormat(col_loss_rate1)           = "###,###,###,###,###.###";
    trl.ColFormat(col_loss_rate2)           = "###,###,###,###,###.###";
    
    var data="";      
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grid.SetComboFormat(col_sourcing,data);
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0230' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grid.SetComboFormat(col_loss_type,data);
    
   }
//---------------------------------------------------------
function findItem()
{
    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y'
    var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
    
    if( object != null )
    {
        txtItemPK.text   = object[0]
        txtItemCode.text = object[1]
        txtItemName.text = object[2]
        txtUOM.text = object[5]
        OnSearch('1')
    }
}
//---------------------------------------------------------

function findUOM()
{
    var path = System.RootURL + '/form/fp/ab/fpab00230.aspx?'
    var obj  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:400px;dialogHeight:300px');	

    if( obj != null )
    {
        txtUOM.text = obj[1];
        
        for ( var i = 1 ; i < grid1.rows ; i++)
        {
            grid1.SetGridText( i, col_parent_uom, txtUOM.text );
        }
    }

}
//---------------------------------------------------------
function FindItemByCode()
{
    fphb00030_4.Call('SELECT');
}
//---------------------------------------------------------
function ShowSTBOMStatus()
{
    fphb00030_5.Call();
}
//---------------------------------------------------------
function Confrim(id)
{
    if (id==1)
    {
        fphb00030_6.Call();
    }
    else
    {
        fphb00030_12.Call();
    }
}
//---------------------------------------------------------
function OnResetItem()
{
     txtItemPK.text   = "";
     txtItemCode.text = "";
     txtItemName.text = "";
     txtUOM.text      = "";
}
//---------------------------------------------------------
function OnSearch(id)
{
    switch(id)
    {
        case '1'://grid 1
            update=0
            fphb00030_1.Call('SELECT')
        break;
        case '2': // grid 2
            fphb00030_2.Call('SELECT')
        break;
        case '3': // grid 1 find upper item
            fphb00030_3.Call('SELECT')
        break;
        /******search Tab 2**********/
        case '4': //seach  stitem
            fphb00030_10.Call('SELECT')
       break;
       case '5': //seach part stbom
            fphb00030_11.Call('SELECT')
       break;
       
       case 'grdSTItemList': //search ST Item List
            fphb00030_13.Call('SELECT')
       break;
       
       case 'STBOM': //search ST Item List
            if ( grdSTItemList.row > 0)
            {
                txtItemCode.text = grdSTItemList.GetGridData(grdSTItemList.row,1);
                FindItemByCode();
            }
       break;       
    }
}
//---------------------------------------------------------
function OnAddNew(obj)
{
    var parent_pk = "", parent_uom="";
    
    //--------------------------------
    if (obj.id == "grid1")
    {
        parent_pk  = txtItemPK.text;// pk form master
        parent_uom = txtUOM.text;
    }
    else
    {
        parent_pk  = txtGridItem.text; //pk from grid 1
        parent_uom = grid1.GetGridData( grid1.row, col_parent_uom);    
    }
    //--------------------------------
    if ( parent_pk != "")
    {
        obj.AddRow();
        obj.SetGridText(obj.rows - 1 , col_seq,        getMaxSeq(obj) + 1 ) ;
        obj.SetGridText(obj.rows - 1 , col_parent_pk,  parent_pk   ) ;
        obj.SetGridText(obj.rows - 1 , col_parent_uom, parent_uom  ) ;
    }
    else
    {
        alert("Please, Select item to make bom!! ")
    }
    //--------------------------------
}
//---------------------------------------------------------
function AddSub(grid)
{
    if(grid.rows-1>0 && grid.GetGridData(grid.row,col_pk) != "")
    {
        txtItemPK.text   = grid.GetGridData( grid.row, col_item_pk    );
        txtItemCode.text = grid.GetGridData( grid.row, col_stitem_code);
        txtItemName.text = grid.GetGridData( grid.row, col_stitem_name);
        txtUOM.text      = grid.GetGridData( grid.row, col_parent_uom );
        
        ShowSTBOMStatus();
       // OnSearch(1)
     }
}
//---------------------------------------------------------
function OnDelete(obj)
{
    var ctrl = obj.GetGridControl();
    
    var row  = ctrl.row;
    if( row>0 )
    {
        if (obj.GetGridData(row,col_pk)=="")
        {
            obj.RemoveRow();
        }
        else
        {
             if ( confirm ( "Do you want to delete this record?" ) )
             {
                obj.DeleteRow();             
             }
        }
    }
    else
    {
        alert("Select a record to delete!")
    }
}
//---------------------------------------------------------
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
    }
    else
    {
        alert("Select a marked record  !")
    }
   
 }
 //----------------------------------------------------------
function checkData(grid) 
{
	var ctrl = grid.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;	
	
	if ( n > 1 ) 
	{	
		if ( row > 0 ) 
		{
	        var btnDelete,btnUnDelete
			//-------------------------------------        		
	        if (grid.id=="grid1")
            {
                btnDelete   = ibtnDelete
                btnUnDelete = ibtnUDelete
            }
		    else
            {
                btnDelete   = ibtnDelete
                btnUnDelete = ibtnUDelete
            }
			//-------------------------------------        		
			if ( grid.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				btnDelete.SetEnable(false);
				btnUnDelete.SetEnable(true);
			}
			else 
			{
				btnDelete.SetEnable(true);
				btnUnDelete.SetEnable(false);
			}
			//-------------------------------------        					
		}	
	}	
}
var update = 0
 //---------------------------------------------------------
function OnSave(obj)
{
    switch(obj.id)
    {
        case "grid1"://save from grid1
          update=1;
          fphb00030_1.Call() 
        break;
        case "grid2":
            fphb00030_2.Call() //save from grid1
        break;
    }

}
//---------------------------------------------------------
function OnGridCellClick(obj)
{
    checkData(obj)
    //-----------------------
    switch(obj.id)
    {
        case "grid1":
            if ( obj.row > 0 )
            {
                txtGridItem.text = obj.GetGridData( obj.row, col_item_pk);  
                OnSearch('2');
            }    
        break;
       case "grdItem":
            if ( obj.row > 0 )
            {       
                txtItemPK_T2.text = obj.GetGridData( obj.row, 1);  
                OnSearch('5');
            }
        break;
    }
}
 //------------------------
function OnGridCellDblClick(grid)
{
    var row,col
    
    row = event.row;
    col = event.col;

    switch (col)
    {
        case col_seq:
              AddSub(grid);
        break;
        //-----------------------------------------
        case col_stitem_code :
              var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y';
              var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
              
              if(object !=null)
              {
                     if(CheckValidItem(grid,object[0]))
                     {
                        if (object[0] != grid.GetGridData(row,col_parent_pk))
                        {
                            grid.SetGridText(row,col_item_pk,     object[0]);
                            grid.SetGridText(row,col_stitem_code, object[1]);
                            grid.SetGridText(row,col_stitem_name, object[2]);
                            grid.SetGridText(row,col_uom,         object[5]);
                        }
                        else
                        {
                            alert("Invalid Item!")
                        }
                     }
               }
        break;
        case col_stitem_name :
              var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y';
              var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	              
              
              if(object !=null)
              {
                     if(CheckValidItem(grid,object[0]))
                     {
                        if (object[0] != grid.GetGridData(row,col_parent_pk))
                        {
                            grid.SetGridText(row,col_item_pk,     object[0]);
                            grid.SetGridText(row,col_stitem_code, object[1]);
                            grid.SetGridText(row,col_stitem_name, object[2]);
                            grid.SetGridText(row,col_uom,         object[5]);
                        }
                        else
                        {
                            alert("Invalid Item!")
                        }
                     }
               }
         break;         
         //---------------------------------------
         case col_item_code :

              var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y&tco_stitem_pk='+ grid.GetGridData(row,col_item_pk);
              var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	              
              
              if ( object != null )
              {
                    grid.SetGridText( row, col_tco_item_pk, object[0]);
                    grid.SetGridText( row, col_item_code,   object[1]);
                    grid.SetGridText( row, col_item_name,   object[2]);
              }
         break; 
         case col_item_name :

              var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?item_code='+ grid.GetGridData(row,col_stitem_code);
              var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	              
              
              if ( object != null )
              {
                    grid.SetGridText( row, col_tco_item_pk, object[0]);
                    grid.SetGridText( row, col_item_code,   object[1]);
                    grid.SetGridText( row, col_item_name,   object[2]);
              }
         break; 
         //---------------------------------------         
         case col_uom :
         
                var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
                var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:400px;dialogHeight:300px');	              
                    
                if ( object != null )
                {
                    grid.SetGridText( row, col_uom, object[1] );
                }
         break; 
         //---------------------------------------         
         case col_process :
         
                var path = System.RootURL + '/form/fp/ab/fpab00250.aspx';
                var object = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');

                if ( object != null )
                {
                    grid.SetGridText( row, col_tpr_process_pk, object[0] );
                    grid.SetGridText( row, col_process,        object[4] );
                }
         break; 
         //---------------------------------------                                 	          
    }
 }    
//---------------------------------------------------------
 function CheckValidItem(grid,value)
 {  
    for(var m=1; m<=grid.rows -1 ; m++)
        {
             
            var value1 = grid.GetGridData(m,col_item_pk)
            if(value==value1)
                {
                    alert("Duplicate item!!")
                    return false;
                }
                      
        }
     return true;
 }
 //------------------------------------------------------------------

function getMaxSeq(grid)
{   
    var value = 0
    var items = grid.rows
    if (items<1)
    {
         return value;
    }else
    {
        for(var i =1 ; i<items ; i ++)
        {
            if ( Number( grid.GetGridData(i,col_seq) ) > value )
            {
                value = Number( grid.GetGridData(i,col_seq) )
            }
        }
       return value
    }
}
  //---------------------------------------------------------
 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case "fphb00030_1":
             if (update ==1)
            { 
                update =0;
                OnSave(grid2); 
            }
            else
            {
              txtGridItem.text = "";
              grid2.ClearData();  
            }   
             SetCellColor(grid1)
        break;
        case "fphb00030_2":
            SetCellColor(grid2)
        break;
        case "fphb00030_4":
             if(txtItemPK.text == "")
            {
                findItem()
            }else
            {
                OnSearch('1')
            }
        break;
        case "fphb00030_3":
            OnSearch('1')
        break;
        case "fphb00030_5":
            OnSearch('1')
        break;
        case "fphb00030_11":
        //--------------------------------
            var i;
            var ctl = grdBOM.GetGridControl();
            var old_row = 0;
            
            ctl.OutlineBar = 5;
            var j;
            
            for ( i=1; i<grdBOM.rows; i++)
            {   
                j = Find_Heigher_Level(grdBOM.GetGridData(i,G2_col_level),i);
                
                ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;               
            }
        //--------------------------------
        break;
        case "fphb00030_10":
            grdBOM.ClearData();
        break;
        case "fphb00030_6":
            pop_return = 1
            window.returnValue =  pop_return;
	    break;
    }
 }
 
 //--------------------------------------------------------------
 function SetCellColor(grid)
 {
    if ( grid.rows>1 )
    {
        grid.SetCellBgColor( 1, col_seq, grid.rows - 1, col_seq, 0xd4d2ff );
        
        grid.SetCellBgColor( 1, col_stitem_code, grid.rows - 1, col_stitem_code, 0xCCFFFF );
        grid.SetCellBgColor( 1, col_stitem_name, grid.rows - 1, col_stitem_name, 0xCCFFFF );
    }        
 }
 //--------------------------------------------------------------
 /**********************************************************************/
 /*                            BOM CONFIRM TAB                         */
 /**********************************************************************/
  
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( grdBOM.GetGridData(row,G2_col_level) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( grdBOM.GetGridData(i,G2_col_level) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
}
//---------------------------------------------------------------------
function CheckItemBOM()
{
    if ( grid1.row > 0 )
    {
        var fpath   = System.RootURL + "/form/fp/hb/fphb00071.aspx?ParentPK=" + grid1.GetGridData( grid1.row, col_parent_pk ) + "&ChildPK=" + grid1.GetGridData( grid1.row, col_item_pk ) + "&Child=" + grid1.GetGridData( grid1.row, col_stitem_code ) + " - " + grid1.GetGridData( grid1.row, col_stitem_name );
        var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:900px;dialogHeight:600px');	              

        if ( aValue != null ) 
        {	
            grid1.SetGridText( row, col_tco_item_pk, aValue[11]);//tco_item_pk
            grid1.SetGridText( row, col_item_code,   aValue[12]);//Item Code
            grid1.SetGridText( row, col_item_name,   aValue[13]);//Item Name
        } 
    }    
}
//---------------------------------------------------------------------
</script>

<body>
    <!------------grid 1------------------>
    <gw:data id="fphb00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="<%=l_user%>lg_sel_fphb00030_2" procedure="<%=l_user%>lg_upd_fphb00030_1"> 
                <input bind="grid1"  > 
                    <input bind="txtItemPK"/> 
                </input> 
                <output bind="grid1" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------grid 1 find upper item----------------->
    <gw:data id="fphb00030_3" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control"   function="<%=l_user%>lg_sel_fphb00030_3"  > 
                <inout> 
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemName"/>
                    <inout bind="txtUOM"/>
                    <inout bind="lblStatus"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------grid 2------------------>
    <gw:data id="fphb00030_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="<%=l_user%>lg_sel_fphb00030_2" procedure="<%=l_user%>lg_upd_fphb00030_1"> 
                <input bind="grid2"  > 
                    <input bind="txtGridItem"/> 
                </input> 
                <output bind="grid2" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------- Search by item code --------->
    <gw:data id="fphb00030_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fphb00030_4"  > 
                <inout> 
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemName"/>
                    <inout bind="txtUOM"/>
                    <inout bind="lblStatus"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!----------- STBOM status --------->
    <gw:data id="fphb00030_5" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_sel_fphb00030_5"> 
                <input> 
			        <input bind="txtItemPk" />  		
			    </input> 
                <output>
                    <output bind="lblStatus" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!----------- STBOM confirm --------->
    <gw:data id="fphb00030_6" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fphb00030"> 
                <input> 
			        <input bind="txtItemPk" />  		
			    </input> 
                <output>
                    <output bind="lblStatus" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------BOM CONFIRM TAB --------------------->
    <gw:data id="fphb00030_10" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fphb00030" > 
                <input bind="grdItem" > 
                    <input bind="lstGroup"/> 
                    <input bind="txtItem"/> 
                    <input bind="lstStatus"/> 
                </input> 
                <output bind="grdItem" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="fphb00030_11" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fphb00030_1" > 
                <input bind="grdBOM" > 
                    <input bind="txtItemPK_T2"/> 
                </input> 
                <output bind="grdBOM" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------- STBOM confirm --------->
    <gw:data id="fphb00030_12" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fphb00030"> 
                <input> 
			        <input bind="txtItemPK_T2" />  		
			    </input> 
                <output>
                    <output bind="lblStatus" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="fphb00030_13" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fphb00030_13" > 
                <input bind="grdSTItemList" > 
                    <input bind="lstGroupSearch"/> 
                    <input bind="txtSTItemSearch"/>
                </input> 
                <output bind="grdSTItemList" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 20%; white-space: nowrap" align="left" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 15%" align="right">
                            <b>Group </b>
                        </td>
                        <td style="width: 84%">
                            <gw:list id="lstGroupSearch" styles='width:100%' onchange="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            <b>ST Item </b>
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtSTItemSearch" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <gw:grid id='grdSTItemList' header='_PK|Item Code|_Item Name|_UOM|Order' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' defaults='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' onselchange="OnSearch('STBOM')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 80%" align="right" id="right">
                <!-- <gw:tab id="tab"> -->
                <gw:tab id="tab">
                    <table style="width: 100%; height: 100%" name="STBOM Entry" class="table">
                        <tr style="height: 1%">
                            <td style="width: 100%">
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 100%">
                                        <td style="width: 10%" >
                                            <b style="color: #1b2ff2; cursor: hand; white-space:nowrap" onclick="findItem()">Parent Part </b>
                                        </td>
                                        <td style="width: 17%" >
                                            <gw:textbox id="txtItemPK" text="" styles="display:none" />
                                            <gw:textbox id="txtItemCode" text="" styles='width:100%' onenterkey="FindItemByCode()" />
                                        </td>
                                        <td style="width: 30%" >
                                            <gw:textbox id="txtItemName" text="" styles='width:100%' />
                                        </td>
                                        <td style="width: 5%;white-space:nowrap" >
                                            <b style="color: #1b2ff2; cursor: hand" onclick="findUOM()">UOM</b>
                                        </td>
                                        <td style="width: 10%"><gw:textbox id="txtUOM" text="" styles='width:60' /></td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="ibtResetItem" img="reset" alt="Reset" onclick="OnResetItem()" styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:icon id="idBtnUpper" img="in" text="Upper" styles='width:100%' onclick="OnSearch('3')" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:icon id="idBtnCheckItemBOM" img="in" text="Map Item" styles='width:100%' onclick="CheckItemBOM()" />
                                        </td>
                                        <td style="width: 15%" align="center">
                                            <gw:label id="lblStatus" styles="color:red" />
                                        </td>
                                        <td style="width: 4%">
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:icon id="idBtnConfirm" img="in" text="Confirm" styles='width:100%' onclick="Confrim(1)" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnReset" img="new" alt="new" onclick="OnAddNew(grid1)" styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnReset_Sub" img="new_sub" alt="newsub" onclick="AddSub(grid1)"
                                                styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnDelete" img="delete" alt="delete" onclick="OnDelete(grid1)" styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnUDelete" img="Udelete" alt="Udelete" onclick="OnUnDelete(grid1)"
                                                styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnUpdate" img="save" alt="save" onclick="OnSave(grid1)" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 49%">
                            <td >
                                <gw:grid id='grid1' 
                                    header='_PK|_PARENT_PK|_Parent_uom|Item SEQ|_ITEM_PK|ST Item Code|ST Item Name|_tco_item_pk|Item Code|Item Name|UOM|Sourcing Type|_tpr_process_pk|Process|Phantom YN|REQ QTY|Loss Type|Loss Rate|Loss Band1|Loss Rate1|Loss Band2|Loss Rate2|Description'
                                    format='0|0|0|1|0|0|0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0' 
                                    aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                                    defaults='||||||||||||||||||||||' 
                                    editcol='0|0|0|1|0|0|0|0|0|1|1|1|0|0|1|1|1|1|1|1|1|1|1' 
                                    widths='0|0|0|1000|0|1500|2500|0|1500|2500|800|1500|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|2000'
                                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)'
                                    oncelldblclick='OnGridCellDblClick(this)'  />
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td >
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 100%">
                                        <td style="width: 96%">
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtReset" img="new" alt="new" onclick="OnAddNew(grid2)" styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtnReset_Sub2" img="new_sub" alt="newsub" onclick="AddSub(grid2)"
                                                styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtDelete" img="delete" alt="delete" onclick="OnDelete(grid2)" styles='width:100%' />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="ibtUDelete" img="Udelete" alt="Udelete" onclick="OnUnDelete(grid2)"
                                                styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 49%">
                            <td >             
                                <gw:grid id='grid2' 
                                    header='_PK|_PARENT_PK|_Parent_uom|Item SEQ|_ITEM_PK|ST Item Code|ST Item Name|_tco_item_pk|Item Code|Item Name|UOM|Sourcing Type|_tpr_process_pk|Process|Phantom YN|REQ QTY|Loss Type|Loss Rate|Loss Band1|Loss Rate1|Loss Band2|Loss Rate2|Description'
                                    format='0|0|0|1|0|0|0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0' 
                                    aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                                    defaults='||||||||||||||||||||||' 
                                    editcol='0|0|0|1|0|0|0|0|0|1|1|1|0|0|1|1|1|1|1|1|1|1|1' 
                                    widths='0|0|0|1000|0|1500|2500|0|1500|2500|800|1500|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|2000'
                                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)'
                                    oncelldblclick='OnGridCellDblClick(this)'
                                    
                                    />
                                    
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%; height: 100%" name="STBOM Confirm" class="table" id="tab2">
                        <tr style="height: 2%">
                            <td style="width: 5%" align="right">
                                <b>Group</b>
                            </td>
                            <td style="width: 20%">
                                <gw:list id="lstGroup" styles="width:100%" value='ALL' onchange="OnSearch('4')" />
                            </td>
                            <td style="width: 5%" align="right">
                                <b>Item</b>
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtItem" styles="width:100%" csstype="mandatory" onenterkey="OnSearch('4')" />
                            </td>
                            <td style="width: 5%" align="right">
                                Status
                            </td>
                            <td style="width: 10%">
                                <gw:list id="lstStatus" value='0' styles="width:100%" onchange="OnSearch('4')" />
                            </td>
                            <td style="width: 28%">
                            </td>
                            <td style="width: 1%" align="right">
                                <gw:icon id="idBtnConfirm2" img="in" text="Confirm" styles='width:100%' onclick="Confrim(2)" />
                            </td>
                            <td style="width: 1%" align="right">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('4')" />
                            </td>
                        </tr>
                        <tr style="height: 98%">
                            <td colspan="9">
                                <table border="1" cellpadding="0" cellspacing="0" style="height: 100%; width: 100%">
                                    <tr>
                                        <td valign="top" style="width: 40%">
                                            <table style="height: 100%; width: 100%">
                                                <tr align="left" style="height: 2%">
                                                    <td>
                                                        <b style="color: Gray; font-weight: bold">St Item</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 98%">
                                                        <gw:grid id='grdItem' header='_TPR_STBOM_PK|_TCO_STITEM_PK|ST Item Code|ST Item Name|UOM|Status|Description'
                                                            format='0|0|0|0|0|0|0' aligns='0|0|0|0|1|0|0' defaults='||||||' editcol='1|1|1|1|1|1|1'
                                                            widths='0|0|1500|2500|1000|1000|1500' sorting='T' styles='width:100%; height:100%'
                                                            oncellclick="OnGridCellClick(this)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 60%">
                                            <table style="width: 100%; height: 100%">
                                                <tr align="left" style="height: 2%">
                                                    <td>
                                                        <b style="color: Gray; font-weight: bold">Bill Of Material</b>
                                                    </td>
                                                </tr>
                                                <tr style="height: 98%">
                                                    <td>
                                                        <gw:grid id='grdBOM' header='LEVEL|_PARENT_PK|Item seq|_ITEM_PK|ST Item Code|ST Item Name|_tco_item_pk|Item Code|Item Name|UOM|Sourcing Type|_tpr_process_pk|Process|Phantom|Req Qty|Loss Type|Loss Rate|Loss Band1|Loss Rate1|Loss Band2|Loss Rate2|Description'
                                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0' 
                                                            aligns='0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                                                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                                            widths='1500|0|1000|0|1500|2000|0|1500|2000|1000|1500|0|1500|1000|1500|1500|1500|1500|1500|1500|1500|2000'
                                                            sorting='T' styles='width:100%; height:100%' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </gw:tab>
                <!-- </gw:tab> -->
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------>
    <gw:textbox id="txtGridItem" style="display: none" />
    <gw:textbox id="txtItemPK_T2" style="display: none" />
    <!------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------->
</body>
</html>
