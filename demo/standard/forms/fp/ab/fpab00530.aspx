<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item (ST Item / Spec)</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ITEM_PK    = 0,
    G_ITEM_CODE  = 1,
    G_ITEM_NAME  = 2,
	G_SPEC01	 = 3,	
	G_SPEC02	 = 4,
	G_SPEC03     = 5,
	G_SPEC04     = 6,
	G_SPEC05     = 7,
    G_UOM        = 8,
    G_UNIT_PRICE = 9,
    G_CCY        = 10,
    G_PRICE_TYPE = 11,
    G_BILL_TO_PK = 12,
    G_REMARK     = 13;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);	
	//-------------------------
    txtPartnerPK.text = "<%=Request.querystring("p_partner_pk")%>";	   
    //-------------------------       
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    } 
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------	
}
//======================================================================
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_UNIT_PRICE)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_UNIT_PRICE)           = "###,###,###,###,###.##";    
	//------------------------------------
	data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>";    
    lstPriceType.SetDataText(data); 
	//------------------------------------
	var group_type = "<%=Request.querystring("group_type")%>";	
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) order by grp_nm ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";
	//------------------------------------	    
}
//======================================================================

function OnHiddenGrid()
{

	idGrid2.GetGridControl().ColHidden(G_SPEC01) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC02) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC03) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC04) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC05) = true ;
	
    idGrid.GetGridControl().ColHidden(G1_SPEC01) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC02) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC03) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC04) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC05) = true ;
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
            data_fpab000530.Call("SELECT");
        break;
    }
   
}
//======================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if ( oGrid.rows > 1 )
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
//======================================================================
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
//======================================================================
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
//======================================================================
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
//======================================================================
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
//======================================================================
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpab000530':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
		
		case 'data_fpab00520_header':
		    if(grdHeader.rows>1)
            {
                var col1=grdHeader.GetGridData(1,2);
                var dis_col1=grdHeader.GetGridData(1,3);
                var col2=grdHeader.GetGridData(1,4);
                var dis_col2=grdHeader.GetGridData(1,5);
                var col3=grdHeader.GetGridData(1,6);
                var dis_col3=grdHeader.GetGridData(1,7);
                var col4=grdHeader.GetGridData(1,8);
                var dis_col4=grdHeader.GetGridData(1,9);
                var col5=grdHeader.GetGridData(1,10);
                var dis_col5=grdHeader.GetGridData(1,11);
				
                if(dis_col1!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC01,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC01) = false ;  
					
					idGrid.SetGridText(0,G_SPEC01,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC01) = false ;  					                  
                }
                if (dis_col2!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC02,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC02) = false ;  
					
					idGrid.SetGridText(0,G_SPEC02,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC02) = false ; 
                    
                }
                if (dis_col3!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC03,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC03) = false ;  
					
					idGrid.SetGridText(0,G_SPEC03,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC03) = false ; 
                    
                }
                if (dis_col4!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC04,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC04) = false ;  
					
					idGrid.SetGridText(0,G_SPEC04,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC04) = false ;                     
                }
                if (dis_col5!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC05,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC05) = false ;  
					
					idGrid.SetGridText(0,G_SPEC05,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC05) = false ;                     
                }
            }
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
    <gw:data id="data_fpab00530_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00530_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab000530" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00530" > 
                  <input bind="idGrid" >
				  	<input bind="lstGroup" /> 
                    <input bind="txtPartnerPK" />
                    <input bind="txtItem" />
					<input bind="lstPriceType" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">        
        <tr style="height: 1%">
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
            <td style="width: 5%; white-space: nowrap" align="right">
                Price Type
            </td>
            <td style="width: 25%">
                <gw:list id="lstPriceType" styles='width:100%' />
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue; white-space:nowrap">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="8">
                <gw:grid id='idGrid' header='_tco_item_pk|Item Code|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|UOM|U/Price|CCY|_Price Type|_bill_to_pk|Description'
                    format='0|0|0|0|0|0|0|0|0|1|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|1|0|1|0|0|0' 
					check='|||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3000|1500|1500|1500|1500|1500|800|1500|1000|0|0|1000' sorting='T' oncelldblclick="OnGridCellDoubleClick(this)"
                    styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="8">
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
            <td colspan="8">
				<gw:grid id='idGrid2' header='_tco_item_pk|Item Code|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|UOM|U/Price|CCY|_Price Type|_bill_to_pk|Description'
                    format='0|0|0|0|0|0|0|0|0|1|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|1|0|1|0|0|0' 
					check='|||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3000|1500|1500|1500|1500|1500|800|1500|1000|0|0|1000' sorting='T'
                    styles='width:100%; height:100%' />					 
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" maxlen="100" styles='width:100%;display:none' />	
	<!---------------------------------------------------------------------------------------------->
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
	<!---------------------------------------------------------------------------------------------->
</body>
</html>
