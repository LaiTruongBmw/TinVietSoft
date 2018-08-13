<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
  
%>

<script>

var G_item_m_pk     = 0,
    G_item_nm       = 1,    
    G_CP_no         = 2,
    G_Draw_No       = 3,
    G_IDMRK         = 4,
    G_MARK          = 5,
    G_SPEC_1        = 6,
    G_SPEC_2        = 7,
    G_SPEC_3        = 8,
    G_SPEC_4        = 9,
    G_SPEC_5        = 10,
    G_LENGTH        = 11,
    G_Quantity      = 12,
    G_Material      = 13;
  
var vPage = 0 ;
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	
	//-------------------------
    var project_pk = "<%=Request.querystring("p_project_pk")%>";
    txtProjectPK.text = project_pk ;
 	OnFormatGrid();	
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Quantity)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Quantity)           = "###,###,###,###,###.##";        
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpfa00303.Call('SELECT');
        break;
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
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_item_m_pk);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_item_m_pk) == p_col_val)
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
          if(p_oGrid.GetGridData(i, G_item_m_pk) == p_value)
          {
             return true;
          }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, G_item_m_pk );
    
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
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}

//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_item_m_pk);		
		
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
//================================================================================================
function OnReceiveData(obj)
{
   
}
</script>

<body>   
    <!---------------------------------------------------------------->
    <gw:data id="data_fpfa00303" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfa00303" > 
                  <input bind="idGrid" > 
                    <input bind="txtProjectPK" />
                    <input bind="txtCPno" />
                    <input bind="txtItem" />	
                    <input bind="txtSpec1" />
                    <input bind="txtSpec2" />
                    <input bind="txtSpec3" />
                    <input bind="txtSpec4" />
                    <input bind="txtSpec5" />								
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>  
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        
        <tr style="height:2%">
            <td style="width: 5%" align="right">
                CP No
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtCPno" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>    
             <td style="width: 5%" align="right">
                Spec
            </td>
            <td style="width: 8%">
                <gw:textbox id="txtSpec1" styles="width:100%" onenterkey="OnSearch(1)" />
            </td> 
            <td style="width: 2%"> - </td>            
             <td style="width: 8%">
                <gw:textbox id="txtSpec2" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 8%">
                <gw:textbox id="txtSpec3" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 8%">
                <gw:textbox id="txtSpec4" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 10%">
                <gw:textbox id="txtSpec5" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
              <td style="width: 5%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>      
        <tr style="height: 48%">
            <td colspan="15">
                <gw:grid id="idGrid"                 
                header='_Item_PK|Item Name|CP No|Dwg No|Idmk|Mark|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Length|Wi Qty|Material'
                format='0|0|0|0|0|0|1|1|0|0|0|0|0'
                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0'
                check='|||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='0|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                sorting='T'
                autosize='T' 
                oncelldblclick="OnGridCellDoubleClick(this)"
                styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 2%">
            
            <td  align="left" style="width: 80%;white-space: nowrap" colspan="7">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
             <td  colspan=2>
                 <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                Duplicate
            </td>            
            <td colspan="1" align="right" colspan=2>
                <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
            </td>           
            <td align="right" colspan=2>
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
            <td  colspan=2>
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="15">
                <gw:grid id="idGrid2" 
                header='_Item_PK|Item Name|CP No|Dwg No|Idmk|Mark|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Length|Wi Qty|Material|_Plan_PK'
                format='0|0|0|0|0|0|1|1|0|0|0|0|0|0'
                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                check='||||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='0|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|0'
                sorting='T'
                autosize='T' 
                styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtProjectPK" styles="display: none" />   
    <!---------------------------------------------------------------->
</body>
</html>
