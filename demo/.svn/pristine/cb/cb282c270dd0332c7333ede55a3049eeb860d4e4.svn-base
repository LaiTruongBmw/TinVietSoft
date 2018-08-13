<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
 
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
 

<head>
    <title>POP UP GET SCAN DATA</title>
</head>

<script type="text/javascript" language="javascript">

//=========================================================================================
var G1_PACKAGES_PK 	= 0,
	G1_SEQ			= 1,
	G1_ITEM_BC		= 2,
	G1_ITEM_PK		= 3,
	G1_ITEM_CODE	= 4,
	G1_ITEM_NAME	= 5,
	G1_UOM			= 6,
	G1_BC_QTY		= 7,
	G1_LOT_NO		= 8,
	G1_ROLL_NO		= 9,
	G1_PRINT_TIMES	= 10,	
	G1_TABLE_NAME	= 11,
	G1_PROCESS_TIME	= 12;
//=================================================================================

function BodyInit()
{     
    System.Translate(document);
    BindingDataList();         
}
//=================================================================================

function BindingDataList()
{    
	//-------------------------------------------
    var data="";    
	
    var p_group_type = "<%=Request.querystring("group_type")%>";
	    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) order by grp_cd ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";
	
    data = "data|I|INCOME|O|OUTGO";
	lstTransType.SetDataText(data); 	
	lstTransType.value = "<%=Request.querystring("trans_type")%>";	
	//-------------------------------------------
	var ctr = grdMaster.GetGridControl();     
    ctr.ColFormat(G1_BC_QTY) = "#,###,###,###,###,###.##";	
	//-------------------------------------------	 

} 
//=================================================================================
function OnSearch()
{
     data_fpab00700.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_fpab00700':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
				grdMaster.SetCellBgColor( 1, G1_ITEM_CODE, grdMaster.rows - 1, G1_ITEM_NAME, 0xFFFFCC );					
			}	
		break;
		 
	}
}

//=========================================================================================================

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdMaster" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G1_PACKAGES_PK );
            
            if(event.row > 0 && ( !CheckDataExist(grdSelect,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        grdSelect.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          grdSelect.SetGridText(grdSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}

//=========================================================================================================
function OnRemove()
{
  	if(grdSelect.row > 0)
  	{
    	var col_val = grdSelect.GetGridData( grdSelect.row, G1_PACKAGES_PK);
    
    	grdSelect.RemoveRowAt(grdSelect.row);
    
    	SetRowBackGroundColor(grdMaster,col_val,0x000000); 
    
    	countItem();
  	}
}
 
//=========================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G1_PACKAGES_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//=========================================================================================================
 
function countItem()
{
    lblCount.text=grdSelect.rows-1 + " item(s)."
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G1_PACKAGES_PK);		
		
        if ( row > 0 && ( !CheckDataExist( grdSelect, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        grdSelect.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            grdSelect.SetGridText( grdSelect.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}
//=========================================================================================================
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G1_PACKAGES_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//=========================================================================================================

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

//=========================================================================================================


</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpab00700" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00700" > 
                <input> 
                     <input bind="lstGroup" />  
					 <input bind="txtItem" />
					 <input bind="txtBCLotNo" />
                     <input bind="dtDateFrom" />  
                     <input bind="dtDateTo" /> 
					 <input bind="lstTransType" />
					 <input bind="chkNotProcess" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">   
			<td style="width: 5%; white-space: nowrap" align="right" >
                Group
            </td>            
			<td style="width: 30%; white-space: nowrap;">
                <gw:list id="lstGroup" text="" styles="width:100%" onchange="OnSearch()" />
            </td>	
			<td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right" >
                Type
            </td>  			            	
            <td style="width: 20%">
				<gw:list id="lstTransType" text="" styles="width:100%"  />
            </td>	
			<td style="width: 20%" align="center">
				Not Process
				<gw:checkbox id="chkNotProcess" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch()">
				</gw:checkbox>
            </td>	
			<td style="width: 4%">				 
            </td>
			
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%; white-space: nowrap;">   
			 
			<td style="width: 5%; white-space: nowrap" align="right" >
                Date
            </td>
            <td style="width: 45%; white-space: nowrap;" colspan=2 >
                <gw:datebox id="dtDateFrom" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtDateTo" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right" >
                BC/Lot No
            </td>
            <td style="width: 45%; white-space: nowrap;" colspan=3 >
                <gw:textbox id="txtBCLotNo" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			                        			
            <td style="width: 4%">
				 
            </td>		                                        
            <td style="width: 1%">
                 
            </td>
        </tr>		
        <tr style="width: 100%; height: 49%">
            <td colspan="17">
                <gw:grid id='grdMaster' 
                    header='_PACKAGES_PK|Seq|Item BC|_ITEM_PK|Item Code|Item Name|UOM|B/C Qty|Lot No|Roll No|Print times|_Table_name|Process Time'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|3|1|3|3|0|1' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|800|1500|0|1500|3000|800|1200|1500|1200|1000|0|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)"  />
            </td>
        </tr>
		<tr style="width: 100%; height: 1%" >
			<td colspan="17" >
				<table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSelect)" />
                        </td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="width: 100%; height: 49%" >
			<td colspan="17">               					
					<gw:grid id='grdSelect' 
                    header='_PACKAGES_PK|Seq|Item BC|_ITEM_PK|Item Code|Item Name|UOM|B/C Qty|Lot No|Roll No|Print times|_table_name|Process Time'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|3|1|3|3|0|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|800|1500|0|1500|3000|800|1200|1500|1200|1000|0|1000'
                    sorting='T' styles='width:100%; height:100%'   />
					
            </td>
		</tr>
    </table>
   
</body>

 <!--------------------------------------------------------->	
 </html>