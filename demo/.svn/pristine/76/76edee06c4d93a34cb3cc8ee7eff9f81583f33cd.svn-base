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

<script>
var G_tco_group_pk =0,
G_tco_item_pk = 1 ;
//------------------------------------------------------------ 
function BodyInit()
{
    System.Translate(document);
    var p_group_type = "<%=Request.querystring("group_type")%>";
    /*
    case p_group_type =0 then  all
    case p_group_type =1 then  material (MAT_YN ='Y' or SUB_MAT_YN ='Y' or SEMI_PROD_YN ='Y' or PUR_YN ='Y')
    case p_group_type =2 then  product (PROD_YN = 'Y' or SALE_YN ='Y' )
    case p_group_type =... then  ... khi nao can them tiep trong store
    
    */
    txtGroup_Type.text = p_group_type;
    var data = "";  
    
    BindingDataList();
    //----------------------
    data_fpab00070.Call();
    //----------------------    
} 

//------------------------------------------------------------

function BindingDataList()
{
	var data = '';
	
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk, grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn = 'Y' " ) %> ";       
    grdItem.SetComboFormat(0,data);	
    grdItem1.SetComboFormat(0,data);	
  
}	
//------------------------------------------------------------
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode(); 
      
   txtGroup_PK.text  = '' + obj.oid; 

   OnSearch();
}

//-------------------------------------------------------------- 
function OnDataReceive(p_oData)
{
    switch (p_oData.id)
    {
       /* case 'data_fpab00070':
            OnSearch();
        break;
        */
        case 'pro_agci00060' :
            alert( txtReturnValue.text );
        break;
    }
}
//--------------------------------------------------------
function OnSearch()
{ 
    //if ( txtGroup_PK.text != '' )
  //  {	        
        data_agci00060_1.Call("SELECT");
   // }    
}

//--------------------------------------------------------
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}

//-------------------------------------------------------
 function OnBFEdit(grid)
 {
    col = event.col ;
    
    if ( col == 1 )
    {
        grid.GetGridControl().Col = 2;
    }    
 }
 //-----------------------------------------------------------------
 //======================================================================
/*function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=1 ; j<oGrid.cols ; j++ )
            {
                code_data[j-1] = oGrid.GetGridData(oGrid.row , j );//lam cho giong voi fpab00110.aspx
            } 
	    }
	    else
	    {
            for( j=1 ; j<oGrid.cols ; j++ ) 
            {
                code_data[j-1] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}*/
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
	    lblCount.text=grdItem1.rows-1 + " item(s)."
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
   
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_tco_item_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItem1.row > 0)
  {
    var col_val = grdItem1.GetGridData( grdItem1.row, G_tco_item_pk);
    
    grdItem1.RemoveRowAt(grdItem1.row);
    
    //SetRowBackGroundColor(grdItem1,col_val,0x000000); 
    
  }
    lblCount.text=grdItem1.rows-1 + " item(s)."
}
//-------------------------------------------------------------------------------------------------
function OnSelectItem(oGrid)
{
      if(oGrid.id == "grdItem" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_tco_item_pk );
            
            if(event.row > 0 && ( !CheckDataExist(grdItem1,col_val)) )
            {
                grdItem1.AddRow();
		        for(var i=0;i<oGrid.cols-1;i++)
		        {
		          grdItem1.SetGridText(grdItem1.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
		         grdItem1.SetGridText(grdItem1.rows-1 ,oGrid.cols-1, radSearchPage.value); //item type
		      }
      }
     lblCount.text=grdItem1.rows-1 + " item(s)."
}
</script>

<body>
    <!------------------------------------------------------------------------------->
  
    <gw:data id="data_fpab00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree"  function="st_lg_sel_fpab00070_tree_0" > 
            <input>
               <input bind="txtGroup_Type" />
            </input> 
               <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_agci00060_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="comm"  function="st_lg_sel_fpab00070_tree"  > 
                    <input bind="grdItem" > 
                        <input bind="radSearchPage" />
                        <input bind="txtItem" /> 
                        <input bind="txtGroup_PK" />
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td style="width: 30%">
                <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
            </td>
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 80%">
                            <table style="width: 100%; background-color: 81d7f3" cellpadding="4" cellspacing="1"
                                id="RightTopTB">
                                <tr>
                                    <td style="width: 20%; background-color: bde9ff">
                                        <font color="black"><b>Item</b></font></td>
                                    <td style="width: 80%; background-color: #FFFFFF">
                                        <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch()" onkeypress="Upcase()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 17%; white-space: nowrap">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnSearch()"> 
                                <span value="1">Item</span> 
                                <span value="2">ST Item</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        </tr>
                    <tr style="height:55%">
                        <td colspan="5">
                            <gw:grid id="grdItem" header="Group|_pk|Item Code|Item Name|_Item Local Name|_Item Foreign Name|Unit|Active|Spec1|Spec2|Spec3|Spec4|Spec5|Spec6|Spec7|Spec8|Spec9|Spec10"
                                format="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="0|2000|2000|2500|2000|2000|800|800|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="F" 
                                oncelldblclick="OnSelectItem(this)" 
                                />
                        </td>
                    </tr>
                    <tr style="height: 4%">
                         <td colspan="2">
                            <gw:label id="lblCount" styles="color: blue">record(s)</gw:label>
                        </td>
                         <td colspan="2">
                             <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnRemove()" />
                            
                        </td>
                        <td >
                             <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdItem1)" />
                            
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="5">
                            <gw:grid id="grdItem1" header="Group|_pk|Item Code|Item Name|_Item Local Name|_Item Foreign Name|Unit|Active|Spec1|Spec2|Spec3|Spec4|Spec5|Spec6|Spec7|Spec8|Spec9|Spec10|_item_st_(1/2)"
                                format="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="0|2000|2000|2500|2000|2000|800|800|0|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="F" 
                                oncelldblclick="OnSelect(this)" 
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtGroup_PK" styles='width:100%;display:none;' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
   <gw:textbox id="txtGroup_Type" styles='width:100%;display:none;' />
</body>
</html>
