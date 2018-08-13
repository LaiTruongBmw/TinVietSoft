<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Suplier Price</title>
</head>

<script>
var G_M_PK=0,
G_item_pk=1,
G_Item_code=2,
G_Item_Name=3,
G_Unit=4,
G_Laudry=5,
G_Dry_Cleaning=6,
G_Pressing_Only=7,
G_Gender=8,
G_Description=9;
function BodyInit()
{
    //dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-7));
        var data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' ' || grp_nm from tlg_it_itemgrp where del_if = 0 and grp_cd = 'SLD'") %>";     
        lstItemGroup.SetDataText(data);   
        //lstItemGroup.value="4944";  
		data = "DATA|10|Gentlemen|20|Lady|ALL|Select All";
		lstGender.SetDataText(data); 
		lstGender.value='ALL'; 
		data = "#10;Gentlemen|#20;Lady";
		grdMenuM.SetComboFormat(G_Gender,data);  
		OnSearch('1'); 		
}
function OnSearch(pos) 
{
    switch (pos)
    {
        case '2' :        
			dso_htrt00150_item.Call("SELECT");            
        break;
        case '1' : 
                 dso_htrt00150.Call("SELECT"); 
        break;
    }
}
function CheckDataExist(p_oGrid,p_value)
{
	return false;
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, 1) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, 0) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
function CheckValidateDetail()
{
	for(var i=1;i<grdMenuM.rows;i++)
          {
            if(grdMenuM.GetGridData(i,G_Gender) == '')
             {
                alert("Please, choose gender at row "+ i);
                return false;
             }
          }
          return true;
}
function OnSave()
{
    if(CheckValidateDetail())
	{
		dso_htrt00150.Call();
	}
}
function OnDataReceive(obj)
{
  switch (obj.id)
    {
        case "dso_htrt00150" :
		//alert(grdMenuM.GetGridData(18,G_Gender));
            dso_htrt00150_item.Call("SELECT"); 
        break;      
     }
}
function OnGridCellDoubleClick(oGrid)
{
	
      if(oGrid.id == 'grdItemMenu' && event.row > 0)
      {
           var col_val = oGrid.GetGridData(event.row, 0 );
            
            if(event.row > 0 && ( !CheckDataExist(grdMenuM,col_val)) )
            {
                    SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		            grdMenuM.AddRow();
		            for(var i=0;i<4;i++)
		            {
		              grdMenuM.SetGridText(grdMenuM.rows-1,i+1,oGrid.GetGridData(event.row,i));
		            } 
					//grdMenuM.SetGridText(grdMenuM.rows-1,8,lstGender.GetData());
            }
      }
}
function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
			{
				grdMenuM.DeleteRow();
				dso_htrt00150.Call();
			}
}
</script>

<body>
   
    <gw:data id="dso_htrt00150_item" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_ht_sel_60270080"> 
                <input bind="grdItemMenu" > 
                     <input bind="lstItemGroup" /> 
                     <input bind="txtItem" />
                </input> 
                <output bind="grdItemMenu" />  
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_htrt00150" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_ht_sel_60270080_1"  procedure="st_ht_upd_60270080_1" > 
                <input> 
                    <input bind="lstGender" />  
                </input> 
                <output bind="grdMenuM" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" width="5%">
                            <b>Gender</b>
                        </td>
                        <td width="15%">
                            <gw:list id="lstGender" styles="width: 100%" onchange="OnSearch('1')" />
                        </td>
						<td style="width: 8%" align="right">
                           
                        </td>
                        <td align="right" width="3%">
							 <gw:imgbtn id="btnInvSearch" img="search" onclick="OnSearch('1')" />
                        </td>
                        <td width="3%" align='right'>
                           <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 3%" align="right">
                           <gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="OnSave()" /> 
                        </td>
						<td style="width: 60%" align="right">
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 33%">
            <td>
                <gw:grid 	id		='grdMenuM' 
							header	='_PK|_item_pk|Item code|Item Name|Unit|Laudry|Washing|Ironing|Gender|Description'
							format	='0|0|0|0|0|-2|-2|-2|0|0' 
							aligns	='0|0|0|0|0|3|3|3|0|0' 
							defaults='|||||||||' 
							editcol	='1|1|1|1|1|1|1|1|1|1'
							widths='0|1000|1000|1700|1000|1400|1400|1000|1400|1400' 
							autosize="T" sorting='T' styles=' width:100%; height:100%'
							oncellclick='OnSearch("grdSearchD")' 
							 />
            </td>
        </tr>
        <tr style="height: 2%">
            <td colspan="11">
                <fieldset>
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 18%">
                                Item Group
                            </td>
                            <td style="width: 30%">
                                <gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('2')" />
                            </td>
                            <td style="width: 3%" align="right">
                                Item
                            </td>
                            <td style="width: 30%" align="right">
                                <gw:textbox id="txtItem" onenterkey="OnSearch('2')" styles='width:100%' />
                            </td>
                            <td style="width: 3%" align="right">
                            </td>
                            <td style="width: 3%" align="right">
                            </td>
                            <td style="width: 3%" align="right">
                                <gw:imgbtn id="btnSearchItem" img="search" onclick="OnSearch('2')" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 32%">
            <td>
                <gw:grid id='grdItemMenu' header='_PK|Item Code|Item Name|Unit|_Item Group|_Price|_Currency|_Quantity|_Amount|Description'
                    format='0|0|0|0|0|-2|0|0|0|0' aligns='0|0|0|0|0|3|0|3|3|0' defaults='|||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000'
                    autosize="T" sorting='F' acceptnulldate="T" styles="width:100%;height:100%" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
