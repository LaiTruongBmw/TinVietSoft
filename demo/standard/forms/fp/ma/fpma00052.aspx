<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One Asset Info</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript">

var G_PK		            = 0,
    G_ITEM_CODE		        = 1,
    G_ITEM_NAME		        = 2,
    G_UOM		            = 3,
    G_SUPPLIER_PK		    = 4,
    G_SUPPLIER_ID		    = 5,
    G_SUPPLIER_NAME		    = 6,
    G_WARRANTY_FR_DT		= 7,
    G_WARRANTY_TO_DT		= 8,
    G_BRAND		            = 9,
    G_PARTNER_PK		    = 10,
    G_PARTNER_ID		    = 11,
    G_PARTNER_NAME		    = 12,
    G_DESCRIPTION		    = 13,
    G_CHARGER_PK		    = 14,
    G_CHARGER_ID		    = 15,
    G_CHARGER_NAME		    = 16,
    G_LINE_PK		        = 17,
    G_LINE_ID		        = 18,
    G_LINE_NAME		        = 19,
    G_ASSET_TYPE		    = 20,
    G_START_DATE		    = 21,
    G_END_DATE		        = 22;


//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
	txtAssetLine.text = "<%=Request.querystring("AssetLine")%>";
    var data = "";  
    
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and GROUP_TYPE = '90' order by grp_cd  ") %>||";
    lstGroup.SetDataText(data);   
    lstGroup.value="";
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1110') FROM DUAL")%>||";  //Asset Type
     lstAssetType.SetDataText(data);
     lstAssetType.value=''; 
    //-------------------------   
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
    
    //---------------------------------------	
	var tco_stitem_pk = "<%=Request.querystring("tco_stitem_pk")%>";
	
	if ( Number(tco_stitem_pk) > 0 )
	{
	    txtSTItemPK.text = tco_stitem_pk;
	    txtSTItem.SetEnable(false);
	    
	    lstGroup.value = '' ;	    
	    lstGroup.SetEnable(false);
	    
	    data_fpab00070.Call("SELECT");
	}  
	else
	{
	    var STITEM = document.all("STITEM"); 	    	
	    STITEM.style.display = "none";	
	}  	
	//---------------------------------------	
	OnSearch(1);	
}

//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00052.Call("SELECT");
        break;
    }
   
}
//-----------------------------------------------------------------------------------------------
//thu tu cac cot duoc lay ra tren popup:
//_PK|ITEM_CODE|ITEM_NAME|UOM|_SUPPLIER_PK|SUPPLIER_ID|SUPPLIER_NAME|WARRANTY_FR_DT|WARRANTY_TO_DT|BRAND|_PARTNER_PK|PARTNER_ID|PARTNER_NAME|DESCRIPTION|_CHARGER_PK|CHARGER_ID|CHARGER_NAME|_LINE_PK|LINE_ID|LINE_NAME|ASSET_TYPE|START_DATE|END_DATE
//_PK|Asset Code|Asset Name|Uom|_SUPPLIER_PK|Supplier Id|Supplier Name|Warranty From Date|Warranty To Date|Brand|_PARTNER_PK|Partner Id|Partner Name|Description|_CHARGER_PK|Charger Id|Charger Name|_LINE_PK|Line Id|Line Name|Asset Type|Start Date|End Date
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
            arrTemp[i]= oGrid.GetGridData(i,j);
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
function OnGridCellDblClick(oGrid)
{
      if(event.row > 0 )
      {
        var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[j]= oGrid.GetGridData(event.row,j);
         }
          if ( arrTemp !=null )
	      {
		    window.returnValue =  arrTemp;
		    window.close();
	      }
	      else
	      {
	        alert("You have not selected data yet.");
	      }
      } 
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
        case 'data_fpab00052':
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
    <gw:data id="data_fpab00052" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00052" > 
                  <input bind="idGrid" >
                    <input bind="lstGroup" />
                    <input bind="lstAssetType" />
                    <input bind="txtItem" />
					<input bind="txtAssetLine" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
                ST Item
            </td>
            <td style="width: 44%" colspan="5">
                <gw:textbox id="txtSTItemPK" styles="display: none" />
                <gw:textbox id="txtSTItem" styles="width:100%" csstype="mandatory" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 35%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
             <td style="width: 5%">
                Asset Type
            </td>
            <td style="width: 30%;">
                <gw:list id="lstAssetType" styles="width:100%;" onchange="" />
            </td>
            <td style="width: 5%" align="right">
                Asset
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
             <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">0 record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="10">
                <gw:grid id='idGrid' header='_PK|Asset Code|Asset Name|Uom|_SUPPLIER_PK|Supplier Id|Supplier Name|_Warranty From Date|Warranty To Date|Brand|_PARTNER_PK|_Partner Id|_Partner Name|Description|_CHARGER_PK|_Charger Id|Charger Name|_LINE_PK|_Line Id|Line Name|Asset Type|Start Date|End Date'
                    format='0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|2|4|4' aligns='0|0|0|1|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|1|1'
                    check='||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtAssetLine" styles="width:100%;display:none" />
</body>
</html>
