<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item (Spec)</title>
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
	G_SPEC01_PK	 = 3,
	G_SPEC01_NM	 = 4,		
	G_SPEC02_PK	 = 5,
	G_SPEC02_NM	 = 6,	
	G_SPEC03_PK	 = 7,
	G_SPEC03_NM  = 8,	
	G_SPEC04_PK	 = 9,
	G_SPEC04_NM  = 10,	
	G_SPEC05_PK	 = 11,
	G_SPEC05_NM  = 12,	
	G_SPEC06_PK	 = 13,
    G_SPEC06_NM  = 14,	
	G_SPEC07_PK	 = 15,
    G_SPEC07_NM  = 16,	
	G_SPEC08_PK	 = 17,
    G_SPEC08_NM  = 18,	
	G_SPEC09_PK	 = 19,
    G_SPEC09_NM  = 20,	
	G_SPEC10_PK	 = 21,
    G_SPEC10_NM  = 22,
	G_UOM 		 = 23,
    G_REMARK     = 24;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);	
 
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------	
	
	OnHiddenGrid();
	
	
}
//======================================================================
function OnFormatGrid()
{
    var trl;   
	 
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

	idGrid2.GetGridControl().ColHidden(G_SPEC01_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC02_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC03_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC04_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC05_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC06_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC07_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC08_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC09_NM) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC10_NM) = true ;
	
    idGrid.GetGridControl().ColHidden(G_SPEC01_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC02_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC03_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC04_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC05_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC06_NM) = true ; 
	idGrid.GetGridControl().ColHidden(G_SPEC07_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC08_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC09_NM) = true ;
	idGrid.GetGridControl().ColHidden(G_SPEC10_NM) = true ;
	
	
	data_fpab00670_header.Call("SELECT");
	
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
            data_fpab00670.Call("SELECT");
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
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpab00670':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
		
		case 'data_fpab00670_header':
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
				
				var col6=grdHeader.GetGridData(1,12);
                var dis_col6=grdHeader.GetGridData(1,13);
				
				var col7=grdHeader.GetGridData(1,14);
                var dis_col7=grdHeader.GetGridData(1,15);
				
				var col8=grdHeader.GetGridData(1,16);
                var dis_col8=grdHeader.GetGridData(1,17);
				
				var col9=grdHeader.GetGridData(1,18);
                var dis_col9=grdHeader.GetGridData(1,19);
				
				var col10=grdHeader.GetGridData(1,20);
                var dis_col10=grdHeader.GetGridData(1,21);
				
                if(dis_col1!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC01_NM,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC01_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC01_NM,col1);
                    idGrid.GetGridControl().ColHidden(G_SPEC01_NM) = false ;  					                  
                }
                if (dis_col2!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC02_NM,col2);
                    idGrid2.GetGridControl().ColHidden(G_SPEC02_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC02_NM,col2);
                    idGrid.GetGridControl().ColHidden(G_SPEC02_NM) = false ; 
                    
                }
                if (dis_col3!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC03_NM,col3);
                    idGrid2.GetGridControl().ColHidden(G_SPEC03_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC03_NM,col3);
                    idGrid.GetGridControl().ColHidden(G_SPEC03_NM) = false ; 
                    
                }
                if (dis_col4!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC04_NM,col4);
                    idGrid2.GetGridControl().ColHidden(G_SPEC04_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC04_NM,col4);
                    idGrid.GetGridControl().ColHidden(G_SPEC04_NM) = false ;                     
                }
                if (dis_col5!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC05_NM,col5);
                    idGrid2.GetGridControl().ColHidden(G_SPEC05_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC05_NM,col5);
                    idGrid.GetGridControl().ColHidden(G_SPEC05_NM) = false ;                     
                }
				if (dis_col6!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC06_NM,col6);
                    idGrid2.GetGridControl().ColHidden(G_SPEC06_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC06_NM,col6);
                    idGrid.GetGridControl().ColHidden(G_SPEC06_NM) = false ;                     
                }
				if (dis_col7!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC07_NM,col7);
                    idGrid2.GetGridControl().ColHidden(G_SPEC07_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC07_NM,col7);
                    idGrid.GetGridControl().ColHidden(G_SPEC07_NM) = false ;                     
                }
				if (dis_col8!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC08_NM,col8);
                    idGrid2.GetGridControl().ColHidden(G_SPEC08_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC08_NM,col8);
                    idGrid.GetGridControl().ColHidden(G_SPEC08_NM) = false ;                     
                }
				if (dis_col9!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC09_NM,col9);
                    idGrid2.GetGridControl().ColHidden(G_SPEC09_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC09_NM,col9);
                    idGrid.GetGridControl().ColHidden(G_SPEC09_NM) = false ;                     
                }
				if (dis_col10!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC10_NM,col10);
                    idGrid2.GetGridControl().ColHidden(G_SPEC10_NM) = false ;  
					
					idGrid.SetGridText(0,G_SPEC10_NM,col10);
                    idGrid.GetGridControl().ColHidden(G_SPEC10_NM) = false ;                     
                }
            }
		    //---------------------------------------	
			var st_item_pk = "<%=Request.querystring("st_item_pk")%>";
			
			if ( Number(st_item_pk) > 0 )
			{
			    txtSTItemPK.text = st_item_pk;
			    txtSTItem.SetEnable(false);
			    
			    lstGroup.value = '' ;	    
			    lstGroup.SetEnable(false);
			    
			    data_fpab00670_1.Call("SELECT");
			}  
			else
			{
			    var STITEM = document.all("STITEM"); 	    	
			    STITEM.style.display = "none";	
			}  
			
			//---------------------------------------			
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
    <gw:data id="data_fpab00670_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00670_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00670" onreceive="OnDataReceive(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00670" > 
                  <input bind="idGrid" >
				  	<input bind="txtSTItemPK" />
				  	<input bind="lstGroup" />                     
                    <input bind="txtItem" />					 
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_fpab00670_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="st_lg_sel_fpab00670_1"  > 
                <inout> 
                    <inout bind="txtSTItemPK" />  
                    <inout bind="txtSTItem" />
                    <inout bind="lstGroup" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">  
		<tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
                ST Item
            </td>
            <td style="width: 44%" colspan="6">
                <gw:textbox id="txtSTItemPK" styles="display: none" />
                <gw:textbox id="txtSTItem" styles="width:100%" csstype="mandatory" />
            </td>
        </tr>      
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 50%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
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
                
					<gw:grid id='idGrid'
						header='_ITEM_PK|Item Code|Item Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|_SPEC06_PK|Spec 06|_SPEC07_PK|Spec 7|_SPEC08_PK|Spec 8|_SPEC09_PK|Spec 9|_SPEC10_PK|Spec 10|UOM|Remark'
						format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
						check='||||||||||||||||||||||||'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='0|1500|2500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|800|1000'
						sorting='T'
						oncelldblclick="OnGridCellDoubleClick(this)"  
						styles='width:100%; height:100%'
						/>

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
				 
					<gw:grid id='idGrid2'
						header='_ITEM_PK|Item Code|Item Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|_SPEC06_PK|Spec 06|_SPEC07_PK|Spec 7|_SPEC08_PK|Spec 8|_SPEC09_PK|Spec 9|_SPEC10_PK|Spec 10|UOM|Remark'
						format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|0|0|1|0|1|0|1|0|1|0|1|0|1|0|1|0|1|0|1|0|1|1|0'
						check='||||||||||||||||||||||||'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='0|1500|2500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|800|1000'
						sorting='T'			 
						styles='width:100%; height:100%'
						/>	 
            </td>
        </tr>
    </table>
	<!---------------------------------------------------------------------------------------------->
	<gw:grid id='grdHeader' 
		header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Col6 Header|Col6 Display|Col7 Header|Col7 Display|Col8 Header|Col8 Display|Col9 Header|Col9 Display|Col10 Header|Col10 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0' 
		aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
		check='||||||||||||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' 
		widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
	<!---------------------------------------------------------------------------------------------->
</body>
</html>
