<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  ESysLib.SetUser("prod")
  
%>

<script>

var G_tco_item_pk       = 0,
    G_Item_Code         = 1,
    G_Item_Name         = 2,
    G_tco_itemgrp_pk    = 3,
    G_Item_Group        = 4,
    G_Unit              = 5,
    G_Quantity          = 6,
    G_Price             = 7,
    G_LisPrice          = 8,
    G_StPrice           = 9,
    G_LmPrice           = 10,
    G_MkPrice           = 11,
    G_pur_type          = 12,   
    G_volume            = 13,
    G_tin_warehouse_pk  = 14,
    G_partner_pk        = 15,
    G_partner_id        = 16,
    G_partner_name      = 17,
    G_Description       = 18,
    G_tac_abacctcode_pk = 19,
    G_Acc_Code          = 20,
    G_Acc_Name          = 21,
    G_HS_CODE           = 22,
    G_cnv_ratio         = 23,
    G_uom_packing       = 24,
    G_tran_rate         = 25,
    G_weight_rate       = 26,
    G_LOT_UOM           = 27,
    G_WT_UOM            = 28,
    G_Lot_WT            = 29;


var vPage = 0 ;
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	
	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    var p_yn = "<%=Request.querystring("purchase_yn")%>";
    var sale_yn = "<%=Request.querystring("sale_yn")%>";
    txtpur_yn.text = p_yn;
    txtsale_yn.text=sale_yn;
    data = "<%=ESysLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (PROD_YN ={0} or SALE_YN ={1} or MAT_YN ={2} or SUB_MAT_YN ={3} or SEMI_PROD_YN ={4} or PUR_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>";     
   
    
     var data="";  
       if ( txtpur_yn.text == 'Y' )
        {
            data = "<%=ESysLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y'  AND pur_yn = 'Y' order by grp_cd ") %>" ;    
        }    
        if ( txtsale_yn.text == 'Y' )
        {
            data = "<%=ESysLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y'  AND sale_yn = 'Y' order by grp_cd ") %>" ;    
        }   
        else
        {
            data = "<%=ESysLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y'  and pur_yn='N' order by grp_cd ") %>" ;    
        }    
    
     lstGroup.SetDataText(data+'|ALL|SELECT ALL');   
     lstGroup.value='ALL'
    
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
	setPage(vPage);
	//---------------------------------------
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##";        
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00070_2.Call();
        break;
        
        case 2:
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_tco_item_pk);
    
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
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, G_tco_item_pk );
    
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
        case 'data_fpab00070_2':
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;
    }
}
//--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    page1.style.cursor = 'none' ;
                    page1.style.color = 'red';
                    page2.style.cursor = 'hand' ;
                    page2.style.color = 'blue';
                    page3.style.cursor = 'hand' ;
                    page3.style.color = 'blue';
                    currentPage =1
                }
            break;
            case 'page2':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'none' ;
                page2.style.color = 'red';
                page3.style.cursor = 'hand' ;
                page3.style.color = 'blue';
                currentPage =2
            break;
            case 'page3':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'hand' ;
                page2.style.color = 'blue';
                page3.style.cursor = 'none' ;
                page3.style.color = 'red';
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage  = page
        
        OnSearch(2);
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
       pagePrev.style.cursor = 'none' ;
       pagePrev.style.color = 'gray';
       
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'gray';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'red';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';
            
        }
}
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';

            }
             if (page1.innerText == 1)
            {
                pagePrev.style.cursor = 'none' ;
                pagePrev.style.color = 'gray';

            }
        }
     
}
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                pageNext.style.cursor ='none';
                pageNext.style.color = 'gray';

            }
             if (page1.innerText != '1')
            {
                pagePrev.style.cursor ='hand';
                pagePrev.style.color = 'blue';

            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        obj.style.cursor ='hand';
        obj.style.color = 'blue';
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_tco_item_pk);		
		
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
            <dso id="1" type="control" user="prod" function="PROD.sp_sel_fpab00070"  > 
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
           <dso id="1" type="grid" function="PROD.sp_sel_fpfo00090_popup" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtPage" />
					<input bind="txtSTItemPK" />
					<input bind="txtpur_yn" />
					<input bind="txtsale_yn" />
					
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00070_2" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso  type="process" procedure="PROD.sp_sel_fpfo00090_2" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtSTItemPK" />
					<input bind="txtpur_yn" />
					<input bind="txtsale_yn" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
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
            <td style="width: 44%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 44%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="9">
                <table width="100%" style="height: 100%">
                    <tr align="right">
                        <td style="width: 5%;" align="right">
                        </td>
                        <td style="width: 80%;" align="left">
                            <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 3%;" align="right">
                            <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                        </td>
                        <td width="3%" align="center" style="color: gray; cursor: none">
                            <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                            </u></b>
                        </td>
                        <td width="3%" align="center">
                            <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                            </b>
                        </td>
                        <td width="3%" align="center">
                            <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                            </b>
                        </td>
                        <td style="width: 3%;" align="left">
                            <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id="idGrid" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_tac_abacctcode_pk|Acc Code|Acc Name|_HS_CODE|_cnv_ratio|_uom_packing|_tran_rate|_weight_rate|_LOT UOM|WT UOM|Lot WT|Item Weight"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="0|2000|4000|0|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="2" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="2" align="right" style="white-space: nowrap">
                <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                Duplicate
            </td>
            <td colspan="1" align="right">
                <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
            </td>
            <td align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
            <td>
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id="idGrid2" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|_Lot Qty|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_tac_abacctcode_pk|Acc Code|Acc Name|_HS_CODE|_cnv_ratio|_uom_packing|_tran_rate|_weight_rate|_LOT UOM|_WT UOM|_Lot WT|Item Weight"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="0|2000|4000|0|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtPage" styles="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <gw:textbox id="txtpur_yn" styles="display: none" />
    <gw:textbox id="txtsale_yn" styles="display: none" />
    <!---------------------------------------------------------------->
</body>
</html>
