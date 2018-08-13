<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM STOCK RESERVE</title>
</head>

<script>
 var iColReserve_Qty        = 11;
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
    OnFormatGrid();        
 } 

//-------------------------------------------------------------------------------------------
 function SetStatus(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            btnUnDeleteDetail.SetEnable(false);
            btnDeleteDetail.SetEnable(false);
            txtBillToCode.SetEnable(false);
            txtBillToName.SetEnable(false);
            txtDeliToCode.SetEnable(false);
            txtDeliToName.SetEnable(false);
            txtDeliLoc.SetEnable(false);
            txtEmpCode.SetEnable(false);
            txtEmpName.SetEnable(false);
        break;
      }  
 } 

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            fpbp00031.Call("SELECT");
        break;
        case 2 :         
            if ( grdReqList.row > 0 )
            {
                txtReservePK.text = grdReqList.GetGridData(grdReqList.row,10);
                fpbp00031_1.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 Slip !!!');
            }                       
        break;         
      }  
 }

 //---------------------------------------------------------
 
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
        case "fpbp00031" :
        
            txtReservePK.text = '' ;
            fpbp00031_1.Call('SELECT');
            
        break;
      }  
 }
 
 //---------------------------------------------------------
 
 //---------------------------------------------------------


//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,0);
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    SetRowBackGroundColor(grdReqItemList,col_val,0x000000); 
    countItem()
  }
}

//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for (var i=1; i<p_oGrid.rows; i++ )
   {
      if ( p_oGrid.GetGridData(i,0) == p_col_val )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,0) == p_value)
      {
         return true;
      }
   }
   return false;
}

//-------------------------------------------------------------------------------------------------
    var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdReqItemList" :
            
                var col_val = oGrid.GetGridData(event.row,0);
                
                if ( event.row > 0 && ( !CheckDataExist(grdItemSelect,col_val) ) )
                {
                    SetRowBackGroundColor(oGrid,col_val,0x0000FF);
                    
		            grdItemSelect.AddRow();
            		
		            for(var i=0;i<oGrid.cols;i++)
		            {
		              grdItemSelect.SetGridText(grdItemSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		            }
                 }

                countItem();
            break;
      }      
   
}

//------------------------------------------------------------------------------------------------
function countItem()
{
    txtCount.text=grdItemSelect.rows-1 + " item(s)."
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
//---------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl ;
    trl = grdReqItemList.GetGridControl();	
    trl.ColFormat(iColReserve_Qty)    = "###,###,###,###,###.##";    
    trl = grdItemSelect.GetGridControl();	
    trl.ColFormat(iColReserve_Qty)    = "###,###,###,###,###.##";        
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00031" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2" function="prod.sp_sel_fpbp00031" > 
                <input> 
                    <input bind="txtReserveNo" /> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
                </input> 
                <output bind="grdReqList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0" function="prod.sp_sel_fpbp00031_1" > 
                <input> 
                    <input bind="txtReservePK" /> 
                </input> 
                <output bind="grdReqItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <!------------------------------------------------------------------>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
        <table width="100%" cellpadding="0" cellspacing="0" border="1">
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td align="right" style="width: 15%">
                                Reserve No</td>
                            <td style="width: 25%">
                                <gw:textbox id="txtReserveNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
                            </td>
                            <td align='right' style="width: 15%">
                                Doc Date</td>
                            <td style="width: 15%">
                                <gw:datebox id="dtFromDate" lang="1" />
                            </td>
                            <td style="width: 15%">
                                <gw:datebox id="dtToDate" lang="1" />
                            </td>
                            <td style="width: 5%">
                            </td>
                            <td align="right" style="width: 10%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr id='top'>
                            <td colspan="7">
                                <gw:grid id="grdReqList" header="Reserve Date|Slip No|_emp_pk|Emp ID|Emp Name|_from_tin_warehouse_pk|From WH|_to_tin_warehouse_pk|To WH|Description|_tpr_stockreserve_pk"
                                    format="4|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|1|0|0|0|0|0|0|0" defaults="||||||||||"
                                    editcol="0|0|0|0|0|0|0|0|0|0|0" widths="1500|1800|0|1500|2000|0|2000|0|2000|2000|0" styles="width:100%; height:200"
                                    sorting="T" acceptNullDate="true" param="0,1,2,3,4,5,6,7,8,9,10" oncellclick="OnSearch(2)" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <gw:grid id="grdReqItemList" header="_tpr_stockreserved_pk|_tpr_stockreserve_pk|_tsa_saleorderd_pk|_tco_item_pk|Item Code|Item Name|UOM|_from_wh_pk|From WH|_to_wh_pk|To WH|Reserve Qty|Description"
                                    format="0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|3|0" defaults="||||||||||||"
                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0" widths="0|0|0|0|1500|4000|800|0|2000|0|2000|2000" styles="width:100%; height:200"
                                    sorting="F" acceptNullDate="T" oncellclick="" param="0,1,2,3,4,5,6,7,8,9,10,11,12"
                                    oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td style="width: 80%" align="center">
                                <gw:label id="txtCount" />
                            </td>
                            <td align="right" style="width: 10%">
                                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                            </td>
                            <td align="right" style="width: 10%">
                                <gw:imgbtn img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect)" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <gw:grid id="grdItemSelect" header="_tpr_stockreserved_pk|_tpr_stockreserve_pk|_tsa_saleorderd_pk|_tco_item_pk|Item Code|Item Name|UOM|_from_wh_pk|From WH|_to_wh_pk|To WH|Reserve Qty|Description"
                                    format="0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|3|0" defaults="||||||||||||"
                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0" widths="0|0|0|0|1500|4000|800|0|2000|0|2000|2000" styles="width:100%; height:200"
                                    sorting="F" acceptNullDate="T" oncellclick="" param="0,1,2,3,4,5,6,7,8,9,10,11,12"
                                    oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtReservePK" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
