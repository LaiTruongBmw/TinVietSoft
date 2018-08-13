<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Pop Up Get Many Item</title>
</head>


<script type="text/javascript" language="javascript" >

var G_TCO_ITEM_PK = 0,
    G_ITEM_CODE   = 1,
    G_ITEM_NAME   = 2,
    G_UOM         = 3,
    G_UNIT_PRICE  = 4,
    G_CCY         = 5,
    G_PRICE_TYPE  = 6,
    G_BILL_TO_PK  = 7,
    G_PARTNER 	  = 8;

	var G3_PK 						= 0,
		G3_TLG_IT_ITEM_PK 			= 1,
		G3_TLG_PB_WORK_PROCESS_PK 	= 2,
		G3_WP_ID 					= 3,
		G3_WP_NAME 					= 4,
		G3_REMARKS			 		= 5;
	
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
	var group_type = "<%=Request.querystring("group_type")%>";	
	//-------------------------		
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) order by grp_nm ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";
	//-------------------------	
    data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
    lstPriceType.SetDataText(data);    
    lstPriceType.value = '' ;
    //---------------------------------------	
	var partner_pk = "<%=Request.querystring("p_partner_pk")%>";
	
	if ( Number(partner_pk) > 0 )
	{
	    txtPartnerPK.text = partner_pk;
	    txtPartnerName.SetEnable(false);
	    
	    data_fpab00072.Call("SELECT");
	}  
	else
	{
	    var PARTNER = document.all("PARTNER"); 	    	
	    PARTNER.style.display = "none";	
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
    trl.ColFormat(G_UNIT_PRICE)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_UNIT_PRICE)           = "###,###,###,###,###.##";        
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00072_1.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_TCO_ITEM_PK);
    
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
      if(p_oGrid.GetGridData( i, G_TCO_ITEM_PK) == p_col_val)
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
              if(p_oGrid.GetGridData(i, G_TCO_ITEM_PK) == p_value)
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
            var col_val = oGrid.GetGridData(event.row, G_TCO_ITEM_PK );
            
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
function OnGridCellClick(objGrid)
{
	var row = event.row;
	var col = event.col;
	if(objGrid.id == "idGrid" )
    {
		txtMasterPK.text = objGrid.GetGridData(row, G_TCO_ITEM_PK);
		data_fpab00072_3.Call();
	}
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
        case 'data_fpab00072_1':
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
        var col_val = oGrid.GetGridData( row, G_TCO_ITEM_PK);		
		
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
function OnClearCus()
{
    txtPartnerPK.text   = "";
    txtPartnerName.text = "";
}
//================================================================================================
function OnDelete(index)
 {        
    switch (index)
    {
		case 'WORK_PROCESS':
			if( confirm('Do you want to delete this W/P ?'))
            {   
                grdItemWP.DeleteRow();   
            } 
	break;          

    }     
}
//================================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'WProccess':
			if(grdItemWP.row > 0)
			{
				for(var i=1; i< grdItemWP.row; i++)
				{
					if(grdItemWP.GetGridData(i, G3_TLG_IT_ITEM_PK)!='')
						grdItemWP.SetGridText(i,G3_TLG_IT_ITEM_PK, txtMasterPK.text);
				}
				data_fpab00072_3.Call();
			}
        break; 
    }
}
//================================================================================================
function OnPopUp(pos)
{
	switch(pos)
    {
		case 'WORK_PROCESS':
            var fpath = System.RootURL + '/form/fp/ab/fpab00250.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes;scroll:no;');
            
            if ( aValue != null )
            {      
                for(var i =0; i< aValue.length; i++)
                {
                    var l_ArrTmp = aValue[i];
                    grdItemWP.AddRow();
                    
                    grdItemWP.SetGridText(grdItemWP.rows-1,G3_TLG_IT_ITEM_PK, txtMasterPK.text);
                    grdItemWP.SetGridText(grdItemWP.rows-1,G3_TLG_PB_WORK_PROCESS_PK, l_ArrTmp[0]);
                    grdItemWP.SetGridText(grdItemWP.rows-1,G3_WP_ID, l_ArrTmp[3]);
                    grdItemWP.SetGridText(grdItemWP.rows-1,G3_WP_NAME,l_ArrTmp[4]);
                    
                }
            }
        break; 
	}
}
//================================================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00072" onreceive="OnReceiveData(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="st_lg_sel_fpab00072"  > 
                <inout> 
                    <inout bind="txtPartnerPK" />  
                    <inout bind="txtPartnerName" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00072_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00072_1" > 
                  <input bind="idGrid" >
				  	<input bind="txtPartnerPK" />
				  	<input bind="lstGroup" />                     
                    <input bind="txtItem" />
					<input bind="lstPriceType" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
	 <!------------------------------------------------------------------>
    <gw:data id="data_fpab00072_3" onreceive="OnReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5" function="st_lg_sel_fpab00072_3"  procedure="st_lg_upd_fpab00072_3" > 
                <input bind="grdItemWP">
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdItemWP" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="PARTNER">
            <td style="width: 5%; white-space: nowrap" align="right">
                Partner
            </td>
            <td style="width: 44%" colspan="5">
                <gw:textbox id="txtPartnerPK" styles="display: none" />
                <gw:textbox id="txtPartnerName" styles="width:100%" csstype="mandatory" />
            </td>
            <td style="width: 1%">
                <gw:button id="ibtnReset" img="reset" alt="Clear Customer" onclick="OnClearCus()" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 34%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Price Type
            </td>
            <td style="width: 25%">
                <gw:list id="lstPriceType" styles='width:100%' />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
			<td style="width: 1%" align="right">
				<gw:button id="btnNewW" img="new" alt="New Work Process" text="New Work Process" onclick="OnPopUp('WORK_PROCESS')" />
			</td>
			<td  style="width: 1%" align="right">
				<gw:button id="btnDeletew" img="delete" alt="Delete Work Process" text="Delete Work Process" onclick="OnDelete('WORK_PROCESS')" />
			</td>
			<td style="width: 1%" align="right">
				<gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('WProccess')" />
			</td>
        </tr>
        <tr style="height: 48%">
            <td colspan="5" style="width: 60%" >
                <gw:grid id='idGrid' header='_tco_item_pk|Item Code|Item Name|UOM|U/Price|CCY|_Price Type|_bill_to_pk|Partner'
                    format='0|0|0|0|1|0|0|0|0' aligns='0|0|0|1|0|1|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3500|1000|1500|1000|0|0|1000' sorting='T' oncelldblclick="OnGridCellDoubleClick(this)"
                    styles='width:100%; height:100%' oncellclick="OnGridCellClick(this)"  />
            </td>
			<td colspan="5" style="width:40%" >				
				<gw:grid id='grdItemWP'
					header='_PK|_TLG_IT_ITEM_PK|_TLG_PB_WORK_PROCESS_PK|ID|W/P Name|Remarks'
					format='0|0|0|0|0|0'
					aligns='0|0|0|1|0|0'
					check='|||||'
					editcol='0|0|0|0|0|1'
					widths='1000|1000|1000|1000|3500|1000'
					sorting='T'
					styles='width:100%; height:100%'
					/>
			</td>
        </tr>
        <tr style="height: 1%">
            <td colspan="10">
                <table>
                    <tr>
                        <td style="width: 50%" align="center">
                            <gw:label id="lblRecord2" styles="color: blue; white-space:nowrap"></gw:label>
                        </td>
                        <td style="width: 46%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
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
            <td colspan="10">
                <gw:grid id='idGrid2' header='_tco_item_pk|Item Code|Item Name|UOM|U/Price|CCY|_Price Type|_bill_to_pk|Partner'
                    format='0|0|0|0|1|0|0|0|0' aligns='0|0|0|1|0|1|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3500|1000|1500|1000|0|0|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
	<gw:textbox id="txtMasterPK" styles="display:none " />
</body>
</html>
