<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Purchasing Request Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    
var G_PR_M_PK       = 0,
    G_PR_NO         = 1,
    G_REQ_DATE      = 2,
    G_STATUS        = 3,
    G_REF_PO_NO     = 4,
    G_PR_D_PK       = 5,
    G_SEQ           = 6,
    G_TCO_ITEM_PK   = 7,
    G_ITEM_CODE     = 8,
    G_ITEM_NAME     = 9,
    G_REQ_QTY       = 10, 
    G_PO_QTY        = 11,
    G_BAL_QTY       = 12,
    G_REQ_UOM       = 13,   
    G_UNIT_PRICE    = 14,
    G_NULL_01       = 15, 
    G_DEPT_PK       = 16,   
    G_DEPT_NAME     = 17,
    G_PL_PK         = 18,
    G_DESCRIPTION   = 19;
    
//======================================================================

function BodyInit()
{
    System.Translate(document);
	
	var data = "<%=CtlLib.SetListDataSQL("select pk ,DEPT_ID || ' * ' || DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
	
    lstDept.SetDataText(data); 
	lstDept.value = '';
	
    //---------------------------------------
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {           
    var ctrl = idGrid.GetGridControl(); 
    
    ctrl.ColFormat(G_REQ_QTY)	 = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_PO_QTY)  	 = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_BAL_QTY) 	 = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_UNIT_PRICE) = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_NULL_01)    = "#,###,###,###,###,###.###";
    
    ctrl = idGrid2.GetGridControl(); 
    ctrl.ColFormat(G_REQ_QTY)    = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_PO_QTY)     = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_BAL_QTY) 	 = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_UNIT_PRICE) = "#,###,###,###,###,###.###";
    ctrl.ColFormat(G_NULL_01)    = "#,###,###,###,###,###.###";
     
    
    idGrid.GetGridControl().MergeCells  = 2 ;	
    idGrid.GetGridControl().MergeCol(0) = true ;	
    idGrid.GetGridControl().MergeCol(1) = true ;   	
    idGrid.GetGridControl().MergeCol(2) = true ;	
    idGrid.GetGridControl().MergeCol(3) = true ;	
    idGrid.GetGridControl().MergeCol(4) = true ; 
 } 
//======================================================================

function OnSearch()
{
    data_epbp00111.Call("SELECT");
}        
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   var l_pr_no = "";
    var l_pr_pk = "";
    var l_abpl_pk = "";
    
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         //------------------------------------
         if ( l_pr_pk != idGrid.GetGridData(i,G_PR_M_PK) )
             {
                 l_pr_no = l_pr_no + idGrid.GetGridData(i,G_PR_NO) + ',';
                 l_pr_pk = idGrid.GetGridData(i,G_PR_M_PK);
                 
                 l_abpl_pk = idGrid.GetGridData(i,G_PL_PK);
             }
          //-------------------------------------
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
	     var callerWindowObj = dialogArguments;    
            
            callerWindowObj.txtRefNo.text      = l_pr_no.substring( 0, l_pr_no.length-1 );
            
            if ( l_abpl_pk != '' )
            {
                callerWindowObj.txtPLPK.text = l_abpl_pk;                           
            }    
	  
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}


//======================================================================
function OnDataReceive(obj)
{
    if ( idGrid.rows > 1 )
    {
         idGrid.SetCellBgColor( 1, G_ITEM_CODE, idGrid.rows-1, G_ITEM_NAME, 0xCCFFFF );
         idGrid.SetCellBgColor( 1, G_BAL_QTY, idGrid.rows-1, G_BAL_QTY, 0xCCFFFF );
       
         
         idGrid.SetCellBold( 1, G_REF_PO_NO, idGrid.rows - 1, G_REF_PO_NO, true); 
         idGrid.SetCellBold( 1, G_ITEM_CODE, idGrid.rows - 1, G_ITEM_CODE, true);        
          
    }
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val_1 = oGrid.GetGridData(event.row, G_PR_D_PK );
     if(event.row > 0 && ( !CheckDataExist( idGrid2, col_val_1) ) )
    {
        SetRowBackGroundColor( oGrid, col_val_1, 0x0000FF);		
		idGrid2.AddRow();
		 for(var i=0;i<oGrid.cols;i++)
            {
             idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
            }
		
     }
  }
  
  countItem();
  
}

//======================================================================

function OnAdd()
{
      for(var r = 1; r < idGrid.rows; r++ )
        {
            if ( idGrid.GetGridControl().isSelected(r) == true )
            {
                var col_val_1 = idGrid.GetGridData(r, G_PR_D_PK );
                 if(!CheckDataExist( idGrid2, col_val_1)  )
                {
                    SetRowBackGroundColor( idGrid, col_val_1, 0x0000FF);		
		            idGrid2.AddRow();
		             for(var i=0;i<idGrid.cols;i++)
                        {
                         idGrid2.SetGridText(idGrid2.rows-1,i,idGrid.GetGridData(r,i));
                        }
		
                 }
            }
        }
        countItem();
}

//======================================================================

function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_PR_D_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}

//======================================================================

function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}

//================================================================================================

function CheckDataExist(p_oGrid,p_value_1)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
      for(var i=1;i<p_oGrid.rows;i++)
       {
          if(p_oGrid.GetGridData(i, G_PR_D_PK) == p_value_1)
          {
             return true;
          }
       }
       return false;
}

//================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val_1, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if( p_oGrid.GetGridData( i, G_PR_D_PK) == p_col_val_1 )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//======================================================================

</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_epbp00111" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00111" > 
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtSearchNo" />
                    <input bind="chkBalance" />
					<input bind="lstDept" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date</td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                            ~
                            <gw:datebox id="dtTo" lang="1" width="10%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Request Dept</td>
                        <td style="width: 30%">
                            <gw:list id="lstDept" styles="width:100%" onchange="OnSearch()" />
                        </td>                        
                        <td style="width: 15%" align="center" colspan=2>
							Bal
                            <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch()" />
                        </td>                                       
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" >
                            <gw:button id="btnExit" img="cancel" alt="Exit" text="Exit" onclick="OnClose()" />
                        </td>                       
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id='idGrid' header='_M_PK|P/R No|Req Date|Status|_P/O No|_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item name|Req Qty|P/O Qty|Bal Qty|UOM|U/Price|_P/O Qty 2|_Dept_PK|Dept Name|_PL_PK|Remark'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|1|0|0|1|0|0|0|3|3|3|1|3|3|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1200|1200|1000|1500|0|800|0|2000|3000|1200|1200|1200|800|1200|1200|0|1500|1500|1000'
                    sorting='T' styles='width:100%; height:100%' 
                    oncelldblclick="OnGridCellDoubleClick(this)"
                    />
            </td>
        </tr>
         <tr style="height: 1%">
            <td colspan="10">
                <table border="0">
                    <tr>
                        <td align="center" style="width: 10%;white-space: nowrap">
                            
                        </td>
						
						<td align="center" style="width: 40%">
                          
                        </td>
						
						<td align="center" style="width: 40%">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
						
                        <td style="width: 7%" align="right" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnRemove" img="delete" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%" align="right"  >
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id='idGrid2' header='_M_PK|P/R No|Req Date|Status|_P/O No|_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item name|Req Qty|P/O Qty|Bal Qty|UOM|U/Price|_P/O Qty 2|_Dept_PK|Dept Name|_PL_PK|Remark'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|1|0|0|1|0|0|0|3|3|3|1|3|3|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1200|1200|1000|1500|0|800|0|2000|3000|1200|1200|1200|800|1200|1200|0|1500|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
