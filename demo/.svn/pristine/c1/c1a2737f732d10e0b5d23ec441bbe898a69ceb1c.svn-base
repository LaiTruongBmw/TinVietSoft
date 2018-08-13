<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Item Barcode</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
// cols of idGrid
var iCol_BC01_Qty  = 9 , 
    iCol_BC02_Qty  = 11 ;
    
var iCol_ItemBC_PK = 5;    

 //---------------------------------------------------------
 
function BodyInit()
{
    System.Translate(document);
    var data = "";
    
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' order by grp_cd ")%>|ALL|Select all";     
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL' ;
         
    OnMerge();    
 
    OnFormatGrid();
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-60));
}

//------------------------------------------------------------------------------------------------

function OnMerge()
{
	//used merge follow parent child type 	
	idGrid.GetGridControl().MergeCells  = 2 ;
	idGrid.GetGridControl().MergeCol(0) = true ;	
	idGrid.GetGridControl().MergeCol(1) = true ;	
	idGrid.GetGridControl().MergeCol(2) = true ;
	idGrid.GetGridControl().MergeCol(3) = true ;
	idGrid.GetGridControl().MergeCol(4) = true ;
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
   var trl;   
   trl = idGrid.GetGridControl();	
   trl.ColFormat(iCol_BC01_Qty)  = "###,###,###,###,###.##";
   trl.ColFormat(iCol_BC02_Qty)  = "###,###,###,###,###.##";
   trl = idGrid2.GetGridControl();	
   trl.ColFormat(iCol_BC01_Qty)  = "###,###,###,###,###.##";   
   trl.ColFormat(iCol_BC02_Qty)  = "###,###,###,###,###.##"; 
}
//------------------------------------------------------------------------------------------------
function OnSearch()
{ 
	dsoGetItem.Call("SELECT");
}
//------------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  	  
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
    var lRow ;
  if(idGrid2.row > 0)
  {           
       idGrid2.RemoveRowAt(idGrid2.row);
       SetRowBackGroundColor(idGrid,idGrid2.cols,0x000000); 
       countItem();
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,iCol_ItemBC_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//-------------------------------------------------------------------------------------------------

function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,iCol_ItemBC_PK) == p_value)
      {
         return true;
      }
   }
   return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
    var lRow;
    switch(oGrid.id)
    {
        case "idGrid":
            var col_val = oGrid.GetGridData(event.row,iCol_ItemBC_PK);
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
             }
             countItem();
             break;                            
    }
} 
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
</script>

<body>
    <!---------------------------------------------------------------------------------->
    <gw:data id="dsoGetItem" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00130" > 
                  <input bind="idGrid" >                  
                    <input bind="dtFromDate" />
                    <input bind="dtToDate" />                  
                    <input bind="lstGroup" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="txtItemBC" />	
                    <input bind="chkBalYN" />					                    
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td colspan="2">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item Group
                        </td>
                        <td style="width: 50%" align="right">
                            <gw:list id="lstGroup" styles="width:100%" value='ALL' onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 30%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFromDate" lang="1" styles="width:100%" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 8%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 50%; white-space: nowrap" align="left">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item BC
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtItemBC" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td colspan="3" align="center">
                            Balance Y/N<gw:checkbox id="chkBalYN" defaultvalue="Y|N" value="Y" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 60%">
            <td colspan="2">
                <gw:grid id="idGrid" header='_item_pk|Item Code|Item Name|_wh_pk|_WH Name|_item_bc_pk|Item BC|_wh_loc_pk|Loc ID|Qty 1|UOM|Qty 2|UOM'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|3|1|3|1' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|2000|2500|0|2000|0|2000|0|1000|1200|1000|1200|1000'
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 99%" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
        </tr>
        <tr style="height: 38%">
            <td colspan="2">
                <gw:grid id="idGrid2" header='_item_pk|Item Code|Item Name|_wh_pk|_WH Name|_item_bc_pk|Item BC|_wh_loc_pk|Loc ID|Qty 1|UOM|Qty 2|UOM'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|3|1|3|1' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|2000|2500|0|2000|0|2000|0|1000|1200|1000|1200|1000'
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------------------------->
    <gw:textbox id="txtPurchase_YN" style="display: none" />
    <gw:textbox id="txttpr_item_bc" style="display: none" />
    <!--------------------------------------------------------------------------------------------->
</body>
</html>
