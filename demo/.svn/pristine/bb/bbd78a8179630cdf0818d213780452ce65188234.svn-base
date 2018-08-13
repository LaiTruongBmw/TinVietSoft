<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Suplier Price</title>
</head>

<script>

function BodyInit()
{
    var data = "<%=CtlLib.SetGridColumnDataSQL("select '10' pk, 'Food' nm from dual union all select '20', 'Beverage' from dual union all select '30', 'Others' from dual union all   SELECT grp_cd, grp_cd || ' - ' || grp_nm FROM tlg_it_itemgrp WHERE del_if = 0 AND use_yn = 'Y' AND grp_cd IN ('SCB','SGF','SKR','SLD','SMI','SML','SMR','SSH','SSP','STO') ORDER BY 2 ") %>||";     
	grdMenuM.SetComboFormat(9,data);  
}
function OnSearch(pos) 
{
    switch (pos)
    {
        case 'grdSearchM' :        
            dso_htrt00070_1.Call("SELECT")            
        break;
        case 'grdSearchD' : 
            if ( grdMenuM.row > 0 )
            {
                txtMasterPK.text = grdMenuM.GetGridData( event.row, 0);  
                if(grdMenuM.GetGridData(grdMenuM.row, 0)!="")
                {
                    dso_htrt00070_2.Call("SELECT");
                }             
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            //dso_htrt00070_2.Call("SELECT");            
        break;
        case 'grdSearchItem' :
            dso_htrt00070.Call("SELECT");
        break;
    }
}
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, 2) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == 'grdItemMenu' && event.row > 0)
      {
           var col_val = oGrid.GetGridData(event.row, 0 );
            
            if(event.row > 0 && ( !CheckDataExist(grdMenuD,col_val)) )
            {
                if(txtMasterPK.GetData() !="")
                {
                    SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		            grdMenuD.AddRow();
		            for(var i=0;i<oGrid.cols-1;i++)
		            {
		              grdMenuD.SetGridText(grdMenuD.rows-1,i+2,oGrid.GetGridData(event.row,i));
		            }
		            grdMenuD.SetGridText(grdMenuD.rows-1,12,-1)//active_yn
		        }
		        else
		        {
		            alert("Please,Select the item in Master");
		        }
            }
      }
}
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
function OnNew()
{
    grdMenuM.AddRow();
    grdMenuM.SetGridText(grdMenuM.rows-1, 5, '0');
}
function OnSave()
{
    for(var idx = 1; idx < grdMenuD.rows; idx++){
        if(Number(grdMenuD.GetGridData( idx, 7)) > 1000000000){
            alert("You input for price value to large!");
            return false;
        }
    }
    dso_htrt00070_1.Call();
}
function OnDataReceive(obj)
{
  switch (obj.id)
    {
        case "dso_htrt00070_1" :
            if(grdMenuM.rows-1 < 1)
            {
              grdMenuD.ClearData();  
            }
            else
            {
                SetPK();
                dso_htrt00070_2.Call();  
            }
        break;   
		case "dso_htrt00070_2":
			txtMainGroupCode.text = grdMenuM.GetGridData( grdMenuM.row, 9);
			grdItemMenu.ClearData();
				dso_htrt00070_Item_Group.Call();
		break;
		case "dso_htrt00070_Item_Group":
			dso_htrt00070.Call('SELECT');
		break;
     }
}
function SetPK()
{
    for(var i=0; i < grdMenuD.rows;i++)
        if ( grdMenuD.GetGridData( i, 1) == '' )
        {
            grdMenuD.SetGridText( i, 1, txtMasterPK.text);
        }    
}
function AmountSum()
{
    if(grdMenuD.col== 7 || grdMenuD.col== 9)
    {
        var price_Qty;
        price_Qty=(grdMenuD.GetGridData(grdMenuD.row, 7)*(grdMenuD.GetGridData(grdMenuD.row, 9)));
        grdMenuD.SetGridText(grdMenuD.row, 10,price_Qty);
    }
}
function OnDelete(index)
 {
    switch(index)
    {
        case'master':
            if ( confirm( "Do you want to delete item ?" ) ) 
		    {
		        grdMenuM.DeleteRow();
                //dso_htrt00070_1.Call();
	        }        
        break;
        
        case 'detail':
	        {  
		        grdMenuD.DeleteRow();
		        dso_htrt00070_2.Call();
	        }
        break;
    }         
 }
 function OnUnDelete() 
{
    grdMenuM.UnDeleteRow();
}
</script>

<body>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htrt00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ht_sel_60270010"> 
                <input bind="grdItemMenu" > 
                     <input bind="lstItemGroup" /> 
                     <input bind="txtItem" />
                </input> 
                <output bind="grdItemMenu" />  
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htrt00070_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="ht_sel_60270010_1"  procedure="ht_upd_60270010_1" > 
                <input> 
                    <input bind="txtMenu" /> 
                    <input bind="chkUseYN" />  
                </input> 
                <output bind="grdMenuM" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htrt00070_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ht_sel_60270010_2"  procedure="ht_upd_60270010_2" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdMenuD" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
	<gw:data id="dso_htrt00070_Item_Group" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="list" procedure="ht_sel_60270010_3" > 
                <input> 
                    <input bind="txtMainGroupCode" /> 
                </input> 
				<output>
                    <output bind="lstItemGroup" />
                </output>
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
                            <b>Menu</b>
                        </td>
                        <td width="35%">
                            <gw:textbox id="txtMenu" styles="width:100%" onenterkey="OnSearch('grdSearchM')" />
                        </td>
                        <td align="right" width="2%">
                        </td>
                        <td width="15%">
                            <gw:checkbox id="chkUseYN" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearchM')" />
                            <b>Use YN</b>
                        </td>
                        <td width="10%" align='right'>
                            <gw:imgbtn id="btnInvSearch" img="search" onclick="OnSearch('grdSearchM')" />
                        </td>
                        <td style="width: 3%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="OnNew()" />
                        </td>
                        <td style="width: 3%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('master')" />
                        </td>
                        <td style="width: 3%" align="right">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 3%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 33%">
            <td>
                <gw:grid 	id		='grdMenuM' 
							header	='_PK|Menu ID|Menu Name|Menu LName|Menu FName|_Menu Price|_Valid From|_Valid To|Use YN|Type'
							format	='0|0|0|0|0|-0|4|4|3|0' 
							aligns	='0|0|0|0|0|3|0|0|0|0' 
							defaults='|||||||||' 
							editcol	='1|1|1|1|1|1|1|1|1|1'
							widths='0|1000|1000|1700|1000|1400|1400|1000|1400|0' 
							autosize="T" sorting='T' styles=' width:100%; height:100%'
							oncellclick='OnSearch("grdSearchD")' 
							check="|0|0|0|0|0n||||" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDeleteD" onclick="OnDelete('detail')" />
            </td>
        </tr>
        <tr style="height: 32%">
            <td>
                <gw:grid id='grdMenuD' 
					header='_PK|_THT_MINIBAR_PK|_TCO_ITEM_PK|Item Code|Item Name|Item Group|Unit|Price|_Currency|_Quantity|_Amount|_Description|Active|Create By|Create Date|Modify By|Modify Date'
                    format='0|0|0|0|0|0|0|-2|0|-2|-2|0|3|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|3|0|3|3|0|0|0|0|0|0' 
					defaults='||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|1|0|1|1|1|1|0|0|0|0' 
					widths='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    autosize="T" sorting='T' acceptnulldate="T" check="|||||||0-||||||||" styles="width:100%;height:100%"
                    onafteredit="AmountSum()" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="11">
                <fieldset>
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 18%">
                                Item Group
                            </td>
                            <td style="width: 30%">
                                <gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('grdSearchItem')" />
                            </td>
                            <td style="width: 3%" align="right">
                                Item
                            </td>
                            <td style="width: 30%" align="right">
                                <gw:textbox id="txtItem" onenterkey="OnSearch('grdSearchItem')" styles='width:100%' />
                            </td>
                            <td style="width: 3%" align="right">
                            </td>
                            <td style="width: 3%" align="right">
                            </td>
                            <td style="width: 3%" align="right">
                                <gw:imgbtn id="btnSearchItem" img="search" onclick="OnSearch('grdSearchItem')" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 32%">
            <td>
                <gw:grid id='grdItemMenu' header='_PK|Item Code|Item Name|Item Group|Unit|Price|Currency|_Quantity|_Amount|Description'
                    format='0|0|0|0|0|-2|0|0|0|0' aligns='0|0|0|0|0|3|0|3|3|0' defaults='|||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000'
                    autosize="T" sorting='F' acceptnulldate="T" styles="width:100%;height:100%" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
	<gw:textbox id="txtMainGroupCode" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
