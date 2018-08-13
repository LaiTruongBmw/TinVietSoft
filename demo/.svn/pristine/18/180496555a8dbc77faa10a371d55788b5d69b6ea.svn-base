<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Alter Item</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">

// grdItem 
var     G1_Item_PK             = 0 ;

var     G2_pk                  = 0 ,
        G2_item_pk             = 1 ,
        G2_ALTER_ITEM_PK       = 2 ,
        G2_alter_item_code     = 3 ,
        G2_alter_item_name     = 4 ,
        G2_alter_UOM           = 5 ,
        G2_alter_qty           = 6 ,
        G2_alter_type          = 7 ,
        G2_from                = 8 ,
        G2_to                  = 9 ,
        G2_desc                = 10 ,
        G2_flag                = 11 ;
		
 var vPage =0       
//--------------------------------------------------------------        
function BodyInit()
{
    System.Translate(document);
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y'  ")%>|ALL|Select all";     
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL' ;
    //------------------------
	OnFormatGrid();

}

//----------------------------------------------------

function OnFormatGrid()
{
    var trl ;
    //---------------------------
    trl = grdAlter.GetGridControl();
    
    trl.ColFormat(G2_alter_qty)    = "###,####,###.##" ;
    //---------------------------
 
    //---------------------------
}

//----------------------------------Popup get parner----------------------------------------------------
function TabPopUp(fnameFile)
{
	var fpath = System.RootURL + "/form/fp/ab/" + fnameFile; 	
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
function OnSearch(pos)
{ 
    switch (pos)         
    {
     
         case 'grdItem' :
            fphb00060_1.Call("SELECT");
        break;
        
        case 'grdAlter' :   
            fphb00060_2.Call("SELECT");
        break;
        
    }        
}

//-----------------------------------------------------------------------------------------------

function OnGridCellClick(grid)
{
    txtItemPK.text = grdItem.GetGridData(event.row,G1_Item_PK)
    OnSearch('grdAlter')
}
//----------------------------------------------------------------
function OnSave()
{
    
    for(var i = grdAlter.rows - 1 ; i > 1; i--)
    {
        if(grdAlter.GetGridData(i,G2_ALTER_ITEM_PK)=="")
        {
             grdAlter.RemoveRowAt(i);
        }
    }
    if(OnValidateData())
        fphb00060_2.Call();
}

//-----------------------------------------------------------------------------------------------
function OnAddNew()
{
    if(txtItemPK.text!="")
    {   
       
        if (rbFlag.value==0)
                path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
          if (rbFlag.value==1)
                path = System.RootURL + '/form/fp/ab/fpab00210.aspx?group_type=Y|Y|Y|Y|Y|Y';
          var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
          if(object !=null)
          {
             for(var a = 0; a < object.length; a++)
             {
                if(CheckValidItem(grdAlter,object[a][0]))
                {
                    if (object[a][0] != grdAlter.GetGridData(grdAlter.rows-1,G2_item_pk))
                    {
                        grdAlter.AddRow();
                        grdAlter.SetGridText(grdAlter.rows-1,G2_item_pk,txtItemPK.text );
                        grdAlter.SetGridText(grdAlter.rows-1,G2_flag,rbFlag.value );
                        grdAlter.SetGridText(grdAlter.rows-1,G2_alter_qty,1 );
                    
                        grdAlter.SetGridText(grdAlter.rows-1,G2_ALTER_ITEM_PK, object[a][0]);
                        grdAlter.SetGridText(grdAlter.rows-1,G2_alter_item_code, object[a][1]);
                        grdAlter.SetGridText(grdAlter.rows-1,G2_alter_item_name, object[a][2]);
                        grdAlter.SetGridText(grdAlter.rows-1,G2_alter_UOM, object[a][5]);
                    }
                }
             }
            }
        }
        else
        {
            alert('Please select an item !')   
        }
}
//---------------------------------------------------------
function OnDelete(obj)
{
    var ctrl = obj.GetGridControl()
	        var row  = ctrl.row;
	        if(row>0)
	        {
	            if (obj.GetGridData(row,G2_pk)=="")
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
	    }else
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
			if ( grid.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				btnDelete.SetEnable(false);
				btnUDelete.SetEnable(true);
			}
			else 
			{
				btnDelete.SetEnable(true);
				btnUDelete.SetEnable(false);
			}
		}	
	}	
}
function OnValidateData()
{
    for(i=1; i<grdAlter.rows;i++)
    {
    
        if(Number(grdAlter.GetGridData(i,G2_alter_qty))<=0)
        {
            alert("Please input alter qty more than 0!!!");
            return false;
        }
    }
    return true;
}
 function OnGridCellDblClick(grid)
   {
        var row,col
        row = event.row
        col = event.col
        if(col== G2_alter_item_code || col == G2_alter_item_name )
                {
                  var path
                  if (rbFlag.value==0)
                        path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y';
                  if (rbFlag.value==1)
                        path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y';
	              var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	               if(object !=null)
	              {
	                 if(CheckValidItem(grid,object[0]))
	                 {
	                    if (object[0] != grid.GetGridData(row,G2_item_pk))
	                    {
	                        grid.SetGridText(row,G2_ALTER_ITEM_PK, object[0]);
                            grid.SetGridText(row,G2_alter_item_code, object[1]);
                            grid.SetGridText(row,G2_alter_item_name, object[2]);
                            grid.SetGridText(row,G2_alter_UOM, object[5]);
	                    }
	                  }
                    }
               }
    }
  //---------------------------------------------------------
 function CheckValidItem(grid,value)
 {  
    for(var m=1; m<=grid.rows -1 ; m++)
        {
             
            var value1 = grid.GetGridData(m,G2_ALTER_ITEM_PK)
            if(value==value1)
                {
                    alert("Duplicate item!!")
                    return false;
                }
        }
     return true;
 }
  //-----------------------------------------------------------
function OnDataReceive(obj)
{

   switch(obj.id)
    {
        case 'fphb00060_1':
            grdAlter.ClearData();
        break;
      }
}

//=============================================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'PARENT_ITEM':
			if ( grdAlter.row > 0)
			{
				var path = System.RootURL + '/form/fp/hb/fphb00061.aspx?alter_item_pk=' + grdItem.GetGridData( grdAlter.row, G1_Item_PK);
	            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');		
			}
			else
			{
				alert('Pls select one alter Item !');
			}			
		break;
	}
}

//=============================================================================================

</script>

<body>
    <!------------------------------------------------------------------------>
    <gw:data id="fphb00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
               <dso id="1" type="grid" function="<%=l_user%>lg_sel_fphb00060_1" > 
                      <input bind="grdItem" > 
                        <input bind="rbFlag" />
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
                        <input bind="chkHaveAlter"/>
                      </input> 
                    <output bind="grdItem" /> 
                </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <gw:data id="fphb00060_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11"  function="<%=l_user%>lg_sel_fphb00060_2" procedure="<%=l_user%>lg_upd_fphb00060_2"> 
                <input bind="grdAlter"> 
                    <input bind="rbFlag" /> 
                    <input bind="txtItemPK" />  
                </input> 
                <output bind="grdAlter" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table class="table" style="height: 100%; width: 100%; margin: 0 0 0 0" border="1">
        <tr style="height: 95%">
            <td style="width: 40%">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            <b>Group</b>
                        </td>
                        <td style="width: 20%" colspan="3">
                            <gw:list id="lstGroup" styles="width:100%" value='ALL' onchange="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            <b>Item</b>
                        </td>
                        <td style="width: 20%" colspan="3">
                            <gw:textbox id="txtItem" styles="width:100%" csstype="mandatory" onenterkey="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; white-space: nowrap" align="center" colspan="2">
                            <gw:radio id="rbFlag" value="0" onchange="OnSearch('count')"> 
		                    <span value="0">Item</span>
		                    <span value="1">STItem</span>
		                    </gw:radio>
                        </td>
                        <td style="width: 40%" align="center" >
						                            
							<gw:checkbox id="chkHaveAlter" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdItem')" >
								Have.Alter
							</gw:checkbox>	
							
                        </td>                        
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 25%" colspan="4">
                            <b style="color: Gray; font-weight: bold">Items</b>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 95%; width: 100%" colspan="4">
                            <gw:grid id='grdItem' header='_TCO_STITEM_PK|Item Code|Item Name|UOM|_From Date|_To Date'
                                format='0|0|0|0|4|4' aligns='0|0|0|1|1|0' defaults='||||||' editcol='0|0|0|0|0|0'
                                widths='0|1500|2500|1000|1200|1200' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr align="left" style="height: 5%">
                        <td style="width: 80%">
                            <b style="color: Gray; font-weight: bold">Alterable Items</b>
                        </td>
						
						<td style="width: 16%; white-space: nowrap" align="center">
                            <b style="color: purple; cursor: hand" onclick="OnPopUp('PARENT_ITEM')">Parent Item</b>
                        </td>
						
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReset" img="new" alt="new" onclick="OnAddNew()" styles='width:100%' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDelete" img="delete" alt="delete" onclick="OnDelete(grdAlter)"
                                styles='width:100%' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnUDelete" img="Udelete" alt="Udelete" onclick="OnUnDelete(grdAlter)"
                                styles='width:100%' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUpdate" img="save" alt="save" onclick="OnSave()" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="6">
                            <gw:grid id='grdAlter' header='_PK|_TCO_ITEM_PK|_ALTER_ITEM_PK|Item Code|Item Name|UOM|Alter Qty|_Alter Type|_Valid From|_Valid To|Description|_Flag'
                                format='0|0|0|0|0|0|1|0|4|4|0' aligns='0|0|0|0|0|1|0|0|0|0|0' editcol='0|0|0|0|0|1|1|1|1|1|1'
                                widths='0|0|0|1500|2000|1500|1500|1500|1200|1200|2000' sorting='T' styles='width:100%; height:100%'
                                acceptnulldate="true" oncellclick="checkData(this)" oncelldblclick="OnGridCellDblClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtItemPK" style="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <!------------------------------------------->
</body>
</html>
