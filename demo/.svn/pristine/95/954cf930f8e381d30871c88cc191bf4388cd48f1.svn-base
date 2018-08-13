<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Asset</title>
    <%  
        ESysLib.SetUser(Session("APP_DBUSER"))
        Dim l_user As String
        l_user = ""
    %>
</head>

<script type="text/javascript">

var G_PK		    = 0,
    G_ASSET_CODE	= 1,
    G_ASSET_NAME	= 2,
    G_MA_QTY		= 3,
    G_UOM		    = 4,
    G_CCY		    = 5,
    G_DESCRIPTION	= 6;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
}
function BindingDataList()
{   
     var data="";  
	 //--------DEPT 
	 data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";    
     lstSearchDept.SetDataText(data+"||");
     lstSearchDept.value="";
     //--------ASSET TYPE     
     data = "<%=ESysLib.SetListDataSQL("select pk, asset_type_code || ' * '| | asset_type_name from tlg_ma_asset_type a where  del_if=0 order by asset_type_code")%>";       
	 lstSearchAssType.SetDataText(data+'||');
     lstSearchAssType.value='';
     //--------ASSET GROUP 	 	 	 		 	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>";       
	 lstSearchAssGrp.SetDataText(data+'||');
     lstSearchAssGrp.value='';   
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpma00211.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_PK);
    
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
      if(p_oGrid.GetGridData( i, G_PK) == p_col_val)
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
              if(p_oGrid.GetGridData(i, G_PK) == p_value)
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
            var col_val = oGrid.GetGridData(event.row, G_PK );
            
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
    lblCount.text=idGrid2.rows-1 + " record(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpma00211':
            lblRecord2.text = idGrid.rows-1 + " record(s)";
        break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_PK);		
		
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
</script>

<body>
    <!-----------------------------DS LAY DANH SACH TAI SAN----------------------------------->
    <gw:data id="data_fpma00211" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00211" > 
                  <input bind="idGrid" >
                    <input bind="lstSearchDept" />
                    <input bind="lstSearchAssGrp" />
                    <input bind="lstSearchAssType" />
					<input bind="txtItem" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%" id="MA_ASSET">
            <td style="width: 1%; white-space: nowrap" align="right">
                Dept
            </td>
            <td style="width: 20%">
                <gw:list id="lstSearchDept" styles="width:100%" onchange="OnSearch('1')" />
            </td>
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 20%">
                <gw:list id="lstSearchAssGrp" styles="width:100%;" onchange="OnSearch('1')" />
            </td>
            <td style="width: 5%; white-space: nowrap">
                Asset Type
            </td>
            <td style="width: 20%;">
                <gw:list id="lstSearchAssType" styles="width:100%;" onchange="OnSearch('1')" />
            </td>
            <td style="width: 5%" align="right">
                Asset
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 100%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">0 record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 20%">
            <td colspan="10">
                <gw:grid id='idGrid' header='_pk|Asset Code|Asset Name|Qty|UOM|CCY|Description'
                    format='0|0|0|1|0|0|0' aligns='0|0|0|0|1|1|0' check='||||||' editcol='0|0|0|0|0|0|0'
                    widths='0|2500|4500|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick='OnGridCellDoubleClick(this)' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="10">
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
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 20%">
            <td colspan="10">
                <gw:grid id='idGrid2' header='_pk|Asset Code|Asset Name|Qty|UOM|CCY|Description'
                    format='0|0|0|1|0|0|0' aligns='0|0|0|0|1|1|0' check='||||||' editcol='0|0|0|0|0|0|0'
                    widths='0|2500|4500|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
