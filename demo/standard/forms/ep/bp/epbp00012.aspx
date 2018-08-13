<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item - Budget </title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ITEM_PK     = 0,
    G_ITEM_CODE   = 1,
    G_ITEM_NAME   = 2,
    G_GROUP_PK    = 3,
    G_GRP_NAME    = 4,
    G_UOM         = 5,
    G_QTY         = 6,
    G_UPRICE      = 7,    
    G_REMARK      = 8;
    
var G1_ITEM_GRP_PK  = 2,
    G1_ITEM_PK      = 3,
    G1_BUDGET_AMT   = 4,
    G1_BUDGET_QTY   = 7,
    G1_AMT_BAL 		= 9,
    G1_QTY_BAL 		= 10,
    G1_SEL_AMT     	= 11,
    G1_SEL_QTY     	= 12,
    G1_ITEM_NM     	= 13,
    G1_GRP_NM      	= 14;
//------------------------------------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);
	
	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
	
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) order by grp_nm ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";

     //-------------------------   
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    txtPRDept.text = "<%=request.QueryString("dept_pk")%>" ;
   
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
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
    trl.ColFormat(G_UPRICE)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_UPRICE)           = "###,###,###,###,###.##";        
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_epbp00012.Call("SELECT");
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
function OnInputQty()
{
    var strHTML =" ";
     var obj = document.getElementById('idMessage');    
     obj.innerHTML = strHTML;       
     strHTML = "<table style='with:100%' cellpadding='1' cellspacing='0'>";
     strHTML += "<tr> <th style='border: 1px solid deepskyblue'>    ITEM       </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Budget(AMT)    </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Sum(AMT)       </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Remain(AMT)    </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Budget(QTY)    </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Sum(QTY)       </th>";
     strHTML += "<th style='border: 1px solid deepskyblue'>    Remain(QTY)    </th>";
     strHTML += "</tr>";
     
     var l_sum_amt = 0,l_sum_qty = 0;
     var l_group_pk, l_item_pk ;
     var l_count =0;
    
    for (var i =1; i< grdTemp.rows; i++)
    {    
        l_sum_amt = 0;
        l_sum_qty = 0;
        l_group_pk = grdTemp.GetGridData(i,G1_ITEM_GRP_PK);
        l_item_pk  = grdTemp.GetGridData(i,G1_ITEM_PK);
        
        for ( var j =1; j< idGrid2.rows; j++)
        {
            if (l_item_pk != "" )
            {
                if(l_item_pk == idGrid2.GetGridData(j,G_ITEM_PK))
                {
                    if(!isNaN(idGrid2.GetGridData(j,G_QTY)))
                    {
                        l_sum_amt += Number(idGrid2.GetGridData(j,G_QTY)) * Number(idGrid2.GetGridData(j,G_UPRICE))
                        l_sum_qty += Number(idGrid2.GetGridData(j,G_QTY))
                    }
                }                
            } 
			else if (l_group_pk != "" )
            {
                if(l_group_pk == idGrid2.GetGridData(j,G_GROUP_PK))
                {
                    if(!isNaN(idGrid2.GetGridData(j,G_QTY)))
                    {
                        l_sum_amt += Number(idGrid2.GetGridData(j,G_QTY)) * Number(idGrid2.GetGridData(j,G_UPRICE))
                        l_sum_qty += Number(idGrid2.GetGridData(j,G_QTY))
                    }
                }                
            }              
            else
			{ 
					if ( !isNaN(idGrid2.GetGridData(j,G_QTY)))
                    {
                        l_sum_amt += Number(idGrid2.GetGridData(j,G_QTY)) * Number(idGrid2.GetGridData(j,G_UPRICE))
                        l_sum_qty += Number(idGrid2.GetGridData(j,G_QTY))
                    }
			}                        
        }
		
        if(l_sum_amt !=0 || l_sum_qty != 0)
        {          
         strHTML += " <tr style='height:23px'> ";          
         strHTML += " <td style='color:deepskyblue ;border: 1px solid deepskyblue'>  "+ grdTemp.GetGridData(i,G1_GRP_NM) +"  "+ grdTemp.GetGridData(i,G1_ITEM_NM) ;                       
         strHTML += " </td> "; 
         l_count ++;
           if(!isNaN(grdTemp.GetGridData(i,G1_AMT_BAL)))
           { 
                strHTML += " <td style='border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += " " + Number(grdTemp.GetGridData(i,G1_AMT_BAL))
                strHTML += " </td> "; 
                strHTML += " <td style='color:#FF0000 ;border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += " " +  l_sum_amt 
                strHTML += " </td> ";
                strHTML += " <td style='color:#FF0000 ;border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += " " + ( Number(grdTemp.GetGridData(i,G1_AMT_BAL)) - l_sum_amt)
                strHTML += " </td> "; 
           }else
           {            
                strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += "  ";
                strHTML += " </td> "; 
                 strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += "  "
                strHTML += " </td> "; 
                strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
                strHTML += "  "
                strHTML += " </td> "; 
           }
         
         
          if ( !isNaN( grdTemp.GetGridData( i, G1_QTY_BAL)) )
          {
		  		var t_bal_qty = "";
				
		  		if  ( Number(grdTemp.GetGridData(i,G1_QTY_BAL)) > 0 )
				{
				 	 t_bal_qty = ( Number(grdTemp.GetGridData(i,G1_QTY_BAL)) - l_sum_qty) ;
				}
				//-------------
				
            	strHTML += " <td style='border: 1px solid deepskyblue'  align='right'>  " ;  
            	strHTML += " " +  Number(grdTemp.GetGridData(i,G1_QTY_BAL))
            	strHTML += " </td> "; 
            
            	strHTML += " <td style='color:#FF0000 ;border: 1px solid deepskyblue'  align='right'>  " ;  
            	strHTML += " " + l_sum_qty 
            	strHTML += " </td> "; 
            
            	strHTML += " <td style='color:#FF0000 ;border: 1px solid deepskyblue'  align='right'>  " ;  
            	strHTML += " " + t_bal_qty
            	strHTML += " </td> "; 
          }
		  else
          {
            	strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
            	strHTML += "  ";
            	strHTML += " </td> "; 
             	strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
            	strHTML += "  ";
            	strHTML += " </td> ";
            	strHTML += " <td style='color:red ;border: 1px solid deepskyblue' align='right'> "  ;  
            	strHTML += "  ";
            	strHTML += " </td> "; 
          }             
        
         strHTML += " </tr> ";    
        }
        
    }
    strHTML += " </table>";
    if(l_count==0)
    {
        obj.innerHTML = ""; 
    }else
    {
        obj.innerHTML = strHTML; 
    }
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    if(idGrid2.rows>1)
    {
    idGrid2.SetCellBgColor( 1, G_QTY , idGrid2.rows - 1, G_UPRICE , 0xCCFFFF );           
    }
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_epbp00012':
            lblRecord2.text = idGrid.rows-1 + " (s)";
            data_epbp00012_1.Call('SELECT')
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
   
     <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00012" onreceive="OnReceiveData(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_lg_sel_epbp00012" >
                <input  bind="idGrid">                    
                    <input bind="txtPRDept" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />					
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00012_1" onreceive="OnReceiveData(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_lg_sel_epbp00012_1" >
                <input  bind="grdTemp">                    
                    <input bind="txtPRDept" />
                </input> 
                <output bind="grdTemp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%;"   >        
        <tr style="height: 1%">		    
            <td style="display:none">
                 <gw:textbox id="txtPRDept" styles="width: 100%" />
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
                <gw:grid id="idGrid" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|_Quantity|U/Price|Remark"
                    format="0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|0|3|0"
                    editcol="0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|0|2500|800|0"
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
        <tr style="height: 40%">
            <td colspan="7">
                 <gw:grid id="idGrid2" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|Quantity|U/Price|Remark"
                    format="0|0|0|0|0|0|1|1|0" 
					aligns="0|0|0|0|0|1|3|3|0"
                    editcol="0|0|0|0|0|0|1|1|0" 
					widths="0|2000|4000|0|2500|800|0"
                    styles="width:100%; height:100%" sorting="T" onafteredit="OnInputQty()" />
            </td>
        </tr>
        <tr>
            <td colspan="7" align="center">    
                 <div id="idMessage" >
                
                 </div>
            </td>
        </tr>
        
    </table>
    <!---------------------------------------------------------------->   
    <gw:grid id='grdTemp'
        header='PK|PO_DEPT_PK|TCO_ITEMGRP_PK|TCO_ITEM_PK|BUDGET_AMOUNT|FROM_DATE|TO_DATE|BUDGET_ITEM|TR_CCY|AMOUNT_BAL|QTY_BAL|Select_amt|select_qty|item name|group '
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        check='||||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0'
        sorting='T'
        autosize='T' 
        styles='width:100%; height:100%; display:none'
        />
  </body>
 
</html>
