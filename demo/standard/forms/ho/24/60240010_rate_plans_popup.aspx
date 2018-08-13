<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

var G1_pk=0,
    G1_tht_rate_plans_pk=1,
    G1_Room_Type=2,
    G1_Single_Amt=3,
    G1_Double_Amt=4,
    G1_Triple_Amt=5,
    G1_Quad_Amt=6,
    G1_Extra_Adult_Amt=7,
    G1_Child_Amt=8,
    G1_Extra_Child_Amt=9;
var G2_pk=0,
    G2_tht_rate_plans_pk=1,
    G2_Room_Type=2,
    G2_Single_Amt=3,
    G2_Double_Amt=4,
    G2_Triple_Amt=5,
    G2_Quad_Amt=6,
    G2_Extra_Adult_Amt=7,
    G2_Child_Amt=8,
    G2_Extra_Child_Amt=9;
//------------------------------------------------------------------------------------------------
function BodyInit()
{
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE'" )%>"; 
    idGrid.SetComboFormat(G1_Room_Type, data);
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE'" )%>"; 
    idGrid2.SetComboFormat(G2_Room_Type, data);
    data = "<%=CtlLib.SetListDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0" )%>"; 
	lstPriceType.SetDataText(data);//rate plans
    lstPriceType.value="";
    var lstPriceType_pk = "<%=request.QueryString("lstPriceType_pk")%>";
    if ( lstPriceType_pk != "")
    {
        lstPriceType.value = lstPriceType_pk ;
        lstPriceType.SetEnable(false);
    }
	OnSearch(1);	
}
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G2_pk);
    
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
      if(p_oGrid.GetGridData( i, G1_Room_Type) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
/*function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G2_Room_Type) == p_value)
              {
                 return true;
              }
       }
       return false;
}*/
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G1_Room_Type );
            
            if(event.row > 0) //&& ( !CheckDataExist(idGrid2,col_val)) )
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
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpab00070_1':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
    }
}
</script>
<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00070_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="ht_sel_60240010_by_price" > 
                  <input bind="idGrid" > 
                    <input bind="lstPriceType" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
            </td>
            <td style="width: 44%" colspan="5">
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 40%">
                <gw:list id="lstPriceType" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
            </td>
            <td style="width: 35%">
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id="idGrid" header="_pk|_tht_rate_plans_pk|Room Type|Single Amt|Double Amt|Triple Amt|Quad Amt|Extra Adult Amt|Child Amt|_Extra Child Amt"
                    format="0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|3|3|3|3|3|3|3" defaults="|||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0" widths="0|0|0|0|0|0|0|0|0|0" styles="width:100%;height:100%"
                    autosize='T' sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
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
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id="idGrid2" header="_pk|_tht_rate_plans_pk|Room Type|Single Amt|Double Amt|Triple Amt|Quad Amt|Extra Adult Amt|Child Amt|_Extra Child Amt"
                    format="0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|3|3|3|3|3|3|3" defaults="|||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0" widths="0|0|0|0|0|0|0|0|0|0" styles="width:100%;height:100%"
                    autosize='T' sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
