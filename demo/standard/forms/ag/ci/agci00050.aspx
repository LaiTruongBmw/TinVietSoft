<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM PARTNER NAME</title>
</head>

<script>

var G_ITEM_PK           = 0,
	G_GRP_NAME          = 1,
	G_ITEM_CODE         = 2,
	G_ITEM_NAME         = 3,
	G_UOM               = 4,
	G_PARTNER_PK        = 5,
	G_PARTNER_NAME      = 6
	G_IT_PARTNER_PK     = 7,
	G_PARTNER_ITEM_NAME = 8,
	G_ATT01				= 9,
	G_ATT02				= 10,
	G_ATT03				= 11;
	
//=================================================================================
function BodyInit()
{
    System.Translate(document); 
	txtPartnerName.SetEnable(false);
	
    data_agci00050.Call('SELECT')
    
} 

//=================================================================================
function OnToggle(direction)
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }   
 }  
//------------------------------------------------------------
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode(); 
   
   txtGroup_PK.text  = '' + obj.oid; 

   OnSearch();
}

//-------------------------------------------------------------- 
function OnDataReceive(p_oData)
{
    switch (p_oData.id)
    {
        case 'data_agci00050':
            OnSearch();
        break;
		
		case 'data_dspc00050_1':

        break;
    }
}
//====================================================================== 
function OnSearch()
{               
        data_dspc00050_1.Call("SELECT");         
} 
 
//====================================================================== 

 function OnSave()
 {
        if ( confirm("Are you want to save change of item ?") )
        {
            data_dspc00050_1.Call();
        }     
 }
//======================================================================
function OnCellDoubleClick()
{
    var col=event.col;
    var row=event.row;
    if(row>0 && col==G_PARTNER_NAME)
    {
         var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
         if ( object != null )
         {	         
            grdItem.SetGridText(row,G_PARTNER_PK,object[0]);
            grdItem.SetGridText(row,G_PARTNER_NAME,object[2]);                                   
         }
    }
}
//====================================================================== 
function OnAddNew()
{
    var i_row = grdItem.row;
	
    if (i_row >0) 
    {
        grdItem.AddRow();
		
        grdItem.SetGridText( grdItem.rows -1, G_ITEM_PK,   grdItem.GetGridData( i_row, G_ITEM_PK   ));
        grdItem.SetGridText( grdItem.rows -1, G_GRP_NAME,  grdItem.GetGridData( i_row, G_GRP_NAME  ));
        grdItem.SetGridText( grdItem.rows -1, G_ITEM_CODE, grdItem.GetGridData( i_row, G_ITEM_CODE )); 
        grdItem.SetGridText( grdItem.rows -1, G_ITEM_NAME, grdItem.GetGridData( i_row, G_ITEM_NAME ));
        grdItem.SetGridText( grdItem.rows -1, G_UOM,       grdItem.GetGridData( i_row, G_UOM       ));
		
		if ( txtPartnerPK.text != '' )
		{
			grdItem.SetGridText( grdItem.rows -1, G_PARTNER_PK,   txtPartnerPK.text   );
			grdItem.SetGridText( grdItem.rows -1, G_PARTNER_NAME, txtPartnerName.text );
		}
		
		grdItem.SetCellBgColor( grdItem.rows -1, 1, grdItem.rows -1, grdItem.cols - 1, 0xCCFFFF ); 
    }
	else
    {
        alert("Please select this an item to add new partner name !")
    }
}
//==========================================================================
 function OnDeleteItem()
 {
    var ctrl = grdItem.GetGridControl();

	var row  = ctrl.row;
		
	if ( row < 0 ) 
	{			
			alert("Please select one row to delete .");
	}			
	else 
	{
		if ( grdItem.GetGridData( ctrl.row, 0 ) == "" ) 
	    {						
		
				grdItem.RemoveRow();					
		}			
		else 
		{
			if ( confirm( "Do you want to mark this row to delete?" ) ) 
			{
				grdItem.DeleteRow();
			}
		}
	}

 }
//==========================================================================
 function OnUnDeleteItem() 
 {
		
	grdItem.UnDeleteRow()
		
 }
//==========================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
           case 'Custom' :
                 var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( object != null )
	             {	         
	                txtPartnerPK.text   = object[0];
                    txtPartnerName.text =  object[1]+"-"+ object[2];                                              
	             }
	        break;
    }
}
//==========================================================================
function OnClearCus()
{
    txtPartnerPK.text = ""
    txtPartnerName.text =""
}
//==========================================================================
function window_onunload() {

}
//==========================================================================
</script>

<body onunload="return window_onunload()">
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="sale" function="st_lg_sel_agci00050" > 
                <input />
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_dspc00050_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_agci00050_1"  procedure="st_lg_upd_agci00050_1"  > 
                    <input bind="grdItem" > 
						<input bind="txtGroup_PK" />
						<input bind="txtPartnerPK" />						
                        <input bind="txtItem" />                      
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
            </td>
            <td style="width: 70%" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Custom')">Customer</b>
                        </td>
                        <td style="width: 40%" colspan="3">
                            <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
                            <gw:textbox id="txtPartnerName" styles='width:100%'  />
                        </td>
                        <td style="width: 5%" align="left">
                            <gw:imgbtn id="ibtnReset" img="reset" alt="Clear Customer" onclick="OnClearCus()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item
                        </td>
                        <td style="width: 23%" colspan="3">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch()"   />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtNew" img="new" alt="Add New" text="Add New" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDeleteItem()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUDelete" img="udelete" alt="Un Delete" text="UnDelete" onclick="OnUnDeleteItem()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" text="OnSave" onclick="OnSave()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Export to Excel" text="Export to Excel"
                                onclick="onExcel()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">
                             
                            <gw:grid id='grdItem' header='_PK|Group|Item Code|Item Name|UOM|_PK|Partner|_IT_PARTNER_ITEM_PK|Partner Item Name|Att 01|Att 02|Att 03'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|0|0|0|0|0|0|0' 
								check='|||||||||||' 
								editcol='0|0|0|0|0|0|0|0|1|1|1|1'
                                widths='0|2500|2000|3000|800|0|2000|0|2000|1200|1200|1200' sorting='T'  
                                styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle('SearchList')" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtGroup_PK" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
</body>
</html>
