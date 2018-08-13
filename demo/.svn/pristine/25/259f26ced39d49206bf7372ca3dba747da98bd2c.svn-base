<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POP UP Get Many BUSINESS P/L CENTER : LOGISTIC </title>
</head>

<script type="text/javascript" language="javascript">

var G_GROUP_PK      = 0,
    G_GROUP_ID      = 1,
    G_GROUP_NAME    = 2,
	G_CENTER_PK     = 3,
    G_CENTER_ID     = 4,
    G_CENTER_NAME   = 5,
    G_PLCENTER_PK   = 6;

//------------------------------------------------------

function BodyInit()
{ 
	System.Translate(document);
    //-----------------------------------    

    idGrid.GetGridControl().MergeCells  = 2 ;	
    idGrid.GetGridControl().MergeCol(0) = true ;	
    idGrid.GetGridControl().MergeCol(1) = true ;   	
    idGrid.GetGridControl().MergeCol(2) = true ;	
    
    //----------------------------    
    data_fpab00380.Call("SELECT") ; 
    //---------------------------- 
}
 
//------------------------------------------------------
function OnSearch()
{
    data_fpab00380.Call("SELECT") ;      
     
}
//=======================================================================
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

//=======================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fpab00380": 
            lblRecord.text = idGrid.rows-1 + " (s)";
            if ( idGrid.rows > 1 )
            {        
	            idGrid.SetCellBold( 1, G_CENTER_ID, idGrid.rows - 1, G_CENTER_ID, true);
	            idGrid.SetCellBold( 1, G_GROUP_ID,  idGrid.rows - 1, G_GROUP_ID,  true);
            }	            
        break;
    }
}  

//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_GROUP_PK );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}

//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_GROUP_PK);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_GROUP_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}
//-----------------------------------------------------------------------------------------------
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
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_tco_item_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_tco_item_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//=======================================================================
      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00380" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00380" > 
                  <input bind="idGrid" > 
                    <input bind="txtPLCenter" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                Center
            </td>
            <td style="width: 50%">
                <gw:textbox id="txtPLCenter" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 37%">
                <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="6">
                <gw:grid id="idGrid" header="_PL_PK|Group ID|Group Name|_CenterPK|Center ID|Center Name|_PLCenterPK"
                    format="0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0" editcol="0|0|0|0|0|0|0" widths="0|1500|3000|0|1500|3000|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"/>
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="6">
                <table>
                    <tr>
                        <td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="6">
                <gw:grid id="idGrid2" header="_PL_PK|Group ID|Group Name|_CenterPK|Center ID|Center Name|_PLCenterPK"
                    format="0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0" editcol="0|0|0|0|0|0|0" widths="0|1500|3000|0|1500|3000|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------>
</body>
</html>
