<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ITEM_PK           = 0,
    G_ITEM_CODE         = 1,
    G_ITEM_NAME         = 2,
    G_GRP_PK            = 3,
    G_GRP_NAME          = 4,
    G_UOM               = 5,
    G_PUR_PRICE         = 6,
    G_PRICE             = 7,   
	G_PROD_PRICE	    = 8,
    G_REMARK            = 9;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
	
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";

    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	    
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
	OnFormatGrid();
	//---------------------------------------
	
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
	trl.ColFormat(G_PUR_PRICE)       = "###,###,###,###,###.#####";
    trl.ColFormat(G_PRICE)           = "###,###,###,###,###.#####"; 
	trl.ColFormat(G_PROD_PRICE)      = "###,###,###,###,###.#####"; 
       
    trl = idGrid2.GetGridControl();	
	trl.ColFormat(G_PUR_PRICE)       = "###,###,###,###,###.#####";
    trl.ColFormat(G_PRICE)           = "###,###,###,###,###.#####";
	trl.ColFormat(G_PROD_PRICE)      = "###,###,###,###,###.#####"; 	
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00070_1.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_ITEM_PK);
    
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
      if(p_oGrid.GetGridData( i, G_ITEM_PK) == p_col_val)
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
              if(p_oGrid.GetGridData(i, G_ITEM_PK) == p_value)
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
            var col_val = oGrid.GetGridData(event.row, G_ITEM_PK );
            
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
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpab00070_1':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_ITEM_PK);		
		
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
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00070" onreceive="OnReceiveData(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="st_lg_sel_fpab00070"  > 
                <inout> 
                    <inout bind="txtSTItemPK" />  
                    <inout bind="txtSTItem" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00070_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00070_1" > 
                  <input bind="idGrid" >
				  	<input bind="lstLang" /> 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtSTItemPK" />
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
		    <td style="width: 10%" align="right">
				<gw:list id="lstLang" styles='width:100%' onchange="OnSearch(1)" />
			</td>
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 40%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
				 <gw:grid id="idGrid" 
				    header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|Pur/Price|U/Price|Prod/Price|Remark"
                    format="0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|3|3|3|0"
                    editcol="0|0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|0|2000|800|1200|1200|1200|0"                
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
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
            <td colspan="7">
                <gw:grid id="idGrid2" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|Pur/Price|U/Price|Prod/Price|Remark"
                    format="0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|3|3|3|0"
                    editcol="0|0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|0|2000|800|1200|1200|1200|0"
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
