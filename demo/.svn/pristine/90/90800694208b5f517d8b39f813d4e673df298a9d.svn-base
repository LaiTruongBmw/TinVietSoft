<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Production Card</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_Card_PK       = 0,
    G_WP_PK         = 1,
    G_WP_Name       = 2,
    G_ARRAY_SO_PK   = 3,
    G_PO_No         = 4,
    G_STYLE_PK      = 5,
    G_Style         = 6,
    G_ITEM_PK       = 7,
    G_Order_Qty     = 8,
    G_Seq           = 9,
    G_Card_ID       = 10,
    G_Card_Qty      = 11,
    G_SPEC01_PK     = 12,
    G_Spec_01       = 13,
    G_SPEC02_PK     = 14,
    G_Spec_02       = 15,
    G_SPEC03_PK     = 16,
    G_Spec_03       = 17,
    G_SPEC04_PK     = 18,
    G_Spec_04       = 19,
    G_SPEC05_PK     = 20,
    G_Spec_05       = 21,
    G_ATT01         = 22,
    G_ATT02         = 23,
    G_ATT03         = 24,
    G_ATT04         = 25,
    G_ATT05         = 26,
    G_REF_TABLE_NAME= 27,
    G_REF_TABLE_PK  = 28,
    G_Description   = 29,
    G_PARENT_PK     = 30;

//===============================================================================================
function BodyInit()
{	
	System.Translate(document);
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------
}
//===============================================================================================
function OnFormatGrid()
{
    var p_work_process_pk = "<%=Request.querystring("work_process_pk")%>";
    
    if ( Number(p_work_process_pk) > 0 )
    {
        txtWorkProcessPK.text = Number(p_work_process_pk);
        pro_fpab00320.Call();
    }
    else
    {
        data = "<%=CtlLib.SetListDataSQL("SELECT   a.pk, '(' || b.process_id || ') ' || a.wp_id || ' - ' || a.wp_name  FROM prod.pb_work_process a, prod.pb_process b WHERE a.del_if = 0 AND b.del_if = 0 AND a.pb_process_pk = b.pk AND a.use_yn = 'Y' ORDER BY b.process_id, a.wp_seq" ) %>";     
        lstWorkProcess.SetDataText(data);         
    }     
    //-------------------------------
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Order_Qty) = "###,###,###,###,###.##"; 
    trl.ColFormat(G_Card_Qty)  = "###,###,###,###,###.##";
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Order_Qty) = "###,###,###,###,###.##"; 
    trl.ColFormat(G_Card_Qty)  = "###,###,###,###,###.##"; 
    //-------------------------------
    idGrid.GetGridControl().Cell( 7, 0, G_Card_Qty, 0, G_Card_Qty) = 0x3300cc; 
    idGrid2.GetGridControl().Cell( 7, 0, G_Card_Qty, 0, G_Card_Qty) = 0x3300cc;        
}
//===============================================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00320.Call("SELECT");
        break;
    }
   
}
//===============================================================================================
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
//===============================================================================================
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_Card_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}
//===============================================================================================
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_Card_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//===============================================================================================
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_Card_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//===============================================================================================
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_Card_PK );
            
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
//===============================================================================================
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpab00320':
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
        var col_val = oGrid.GetGridData( row, G_Card_PK);		
		
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
    <gw:data id="pro_fpab00320" onreceive="OnReceiveData(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_fpab00320" > 
                <input>
                    <input bind="txtWorkProcessPK" /> 
                </input> 
                <output>
                    <output bind="lstWorkProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00320" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00320" > 
                  <input bind="idGrid" > 
                    <input bind="lstWorkProcess" />
                    <input bind="txtStylePO" />
                    <input bind="txtCard" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                W/Process
            </td>
            <td style="width: 40%">
                <gw:list id="lstWorkProcess" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Style/PO
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtStylePO" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 5%" align="right">
                Card
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtCard" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="8">
                <gw:grid id='idGrid' header='_PK|_PB_WORK_PROCESS_PK|W/P Name|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style|_ITEM_PK|Order Qty|Seq|Card ID|Card Qty|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05|_REF_TABLE_NAME|_REF_TABLE_PK|Description|_PARENT_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|3|1|1|3|0|1|0|1|0|1|0|1|0|1|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1000|1500|1000|1500|1000|1500|1000|1200|1000|1500|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles="width:100%; height:100%" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td  colspan="8">
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
            <td  colspan="8">
                <gw:grid id='idGrid2' header='_PK|_PB_WORK_PROCESS_PK|W/P Name|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style|_ITEM_PK|Order Qty|Seq|Card ID|Card Qty|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05|_REF_TABLE_NAME|_REF_TABLE_PK|Description|_PARENT_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|3|1|1|3|0|1|0|1|0|1|0|1|0|1|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1000|1500|1000|1500|1000|1500|1000|1200|1000|1500|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtWorkProcessPK" style="display: none" />
    <!---------------------------------------------------------------->
</body>
</html>
