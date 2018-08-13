<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM SO</title>
</head>

<script>
// grdReqItemList   
var G1_TSA_SALEORDERD_PK    = 0,  
    G1_PARTNER              = 1,
    G1_PO_NO               = 2,  
    G1_SO                  = 3,  
    G1_ETD                 = 4,  
    G1_TCO_ITEM_PK         = 5,  
    G1_ITEM_CODE           = 6,  
    G1_ITEM_NAME           = 7,
    G1_UOM                 = 8,      
    G1_ORD_QTY             = 9,  
    G1_TABLE_NM            = 10 ;   
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
    
    txtUser_PK.text = "<%=session("USER_ID")%>";    
    var callerWindowObj = dialogArguments;  
    var data="";  
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
    OnFormatGrid();
   
 } 

//-------------------------------------------------------------------------------------------

function OnFormatGrid()
{
//    var trl;
//    trl = grdReqItemList.GetGridControl();	
//    trl.ColFormat(iColReq_Qty)              = "###,###,###,###,###.##";    
//    trl.ColFormat(iColReserved_Qty)         = "###,###,###,###,###.##";    
//    trl.ColFormat(iColOut_Qty)              = "###,###,###,###,###.##";    
//    trl = grdItemSelect.GetGridControl();	
//    trl.ColFormat(iColReq_Qty)              = "###,###,###,###,###.##";    
//    trl.ColFormat(iColReserved_Qty)         = "###,###,###,###,###.##";    
//    trl.ColFormat(iColOut_Qty)              = "###,###,###,###,###.##";    

}
//-------------------------------------------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            fppr00021.Call("SELECT");
        break;
        case 2 :         
            if ( grdReqList.row > 0 )
            {
                txtRequestPK.text = grdReqList.GetGridData(grdReqList.row,G1_TCO_STITEM_PK);     
                fppr00021_1.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 Request !!!');
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
        case "fppr00021" :
            if(grdReqList.row > 0)
            {
                txtRequestPK.text = grdReqList.GetGridData(grdReqList.row,G1_TCO_STITEM_PK);     
                fppr00021_1.Call("SELECT");
            }
        break;
        case "data_fppr00251_1" :
            data_fppr00251_2.Call("SELECT");
        break;
      }  
 }
 
 
 //---------------------------------------------------------
function OnProcess()
{
    if(grdItemSelect.rows > 1)
    {
        for(var i=1;i<grdItemSelect.rows;i++)
          {
             grdTemp.AddRow();
             grdTemp.SetGridText(i,0,grdItemSelect.GetGridData(i,0));
             grdTemp.SetGridText(i,1,grdItemSelect.GetGridData(i,5));
             grdTemp.SetGridText(i,2,grdItemSelect.GetGridData(i,9));
          }
          data_fppr00251_1.Call();
    }
    else
    {
        alert("Please Select Item !!!");
    }
}

//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,G1_TSA_SALEORDERD_PK);       
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    
   for (var i=1; i<grdReqList.rows; i++ )
   {
      if ( grdReqList.GetGridData(i,2) == col_val )
      {
         countItem();
         grdReqList.SetCellBgColor( i, 1 , i, G1_TABLE_NM  , 0x000000 );
         return;
      }
   }    
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
      if(p_oGrid.GetGridData(i,G1_TSA_SALEORDERD_PK) == p_value)
      {
         return true;
      }
      
   }
   return false;
}
//---------------------------------------------------------
    var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdReqList" :
            
                var col_val = oGrid.GetGridData(event.row,G1_TSA_SALEORDERD_PK); // item code 2 
                   
                if (event.row > 0 && !CheckDataExist(grdItemSelect,col_val) )
                {
                    oGrid.SetCellBgColor( event.row, G1_PO_NO , event.row, G1_ORD_QTY , 0x99DDFF);
		            grdItemSelect.AddRow();
            		
		            for(var i=0;i<oGrid.cols;i++)
		            {
		              grdItemSelect.SetGridText(grdItemSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		            }
                 }
                 else if(CheckDataExist(grdItemSelect,col_val))
                 {
                    alert('This request detail has already take out!');
                 }
                countItem();
            break;            
           
      }            
   
}
//-----------------------------------------------------------------------------------------------
function OnSelectMultItem(oGrid)
{
    var l_rows = oGrid.GetGridControl().SelectedRows 
    if (l_rows >0)
    {
         var col_val ;
         var col_val_2 ;
         var col_val_3 ;
        for (var i = 0 ; i< l_rows; i++)
        {
            var row = oGrid.GetGridControl().SelectedRow(i);    
            col_val = oGrid.GetGridData(row,G1_TSA_SALEORDERD_PK); // item code 2 
                
            if (!CheckDataExist(grdItemSelect,col_val))
            {
                oGrid.SetCellBgColor( row, G1_TSA_SALEORDERD_PK , row, G1_BALANCE_QTY , 0x99DDFF);
                grdItemSelect.AddRow();
        		
                for(var j=0;j<oGrid.cols;j++)
                {
                  grdItemSelect.SetGridText(grdItemSelect.rows-1,j,oGrid.GetGridData(row,j));
                }
             }
          }
     }
   countItem();
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
   else
   {
    alert("You have not selected data yet.");
   }	  
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00251_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppr00251_1"   procedure="<%=l_user%>lg_upd_fppr00251_1"> 
                <input bind="grdTemp">                    
                    <input bind="txtUser_PK" /> 
                </input> 
                <output bind="grdTemp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00251_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppr00251_2"> 
                <input bind="grdItemSelect1">                    
                    <input bind="txtUser_PK" /> 
                </input> 
                <output bind="grdItemSelect1" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fppr00021" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_fppr00251" > 
                <input>
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
                    <input bind="txtRequestNo" />
                    <input bind="dtETDFrom" /> 
                    <input bind="dtETDTo" />  
                </input> 
                <output bind="grdReqList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
        <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0" border="1">
            <tr style="height: 30%">
                <td style="width: 100%">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td align="right" style="width: 3%">
                                SO/PO
                            </td>
                            <td style="width: 15%">
                                <gw:textbox id="txtRequestNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
                            </td>
                            <td align='right' style="width: 4%; white-space: nowrap">
                                Doc Date
                            </td>
                            <td style="width: 20%">
                                <gw:datebox id="dtFromDate" lang="1" />
                                &nbsp;&nbsp;&nbsp<gw:datebox id="dtToDate" lang="1" />
                            </td>
                            <td align='right' style="width: 4%; white-space: nowrap">
                                ETD</td>
                            <td style="width: 20%">
                                <gw:datebox id="dtETDFrom" lang="1" nullaccept />
                                &nbsp;&nbsp;&nbsp<gw:datebox id="dtETDTo" lang="1" nullaccept />
                            </td>
                            <td style="width: 5%">
                            </td>
                            <td align="right" style="width: 5%">
                                <gw:imgbtn img="select" alt="Select Multi Item" id="btnSelect1" onclick="OnSelectMultItem(grdReqList)" />
                            </td>
                            <td align="right" style="width: 5%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr id='top' style="height: 99%">
                            <td colspan="11">
                                <gw:grid id='grdReqList' header='_tsa_saleorderd_pk|Partner|PO|SO No|Etd|_tco_item_pk|Item Code|Item Name|UOM|Ord Qty|_TABLE'
                                    format='0|0|0|0|4|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0' check='||||||||||'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0' widths='0|2500|1500|1500|1200|0|1500|1500|800|1500|0'
                                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDoubleClick(this)' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 30%">
                <td style="width: 100%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 80%" align="center">
                                <gw:label id="txtCount" styles='width:100%;color:cc0000;font:9pt' />
                            </td>
                            <td align="right" style="width: 1%">
                                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                            </td>
                            <td align="right" style="width: 1%">
                                <gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td colspan="3">
                                <gw:grid id='grdItemSelect' header='_tsa_saleorderd_pk|Partner|PO|SO No|Etd|_tco_item_pk|Item Code|Item Name|UOM|Ord Qty|_TABLE'
                                    format='0|0|0|0|4|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0' check='||||||||||'
                                    editcol='0|0|0|0|0|0|0|0|0|1|0' widths='0|2500|1500|1500|1200|0|1500|1500|800|1500|0'
                                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDoubleClick(this)' />
                                <gw:grid id='grdTemp' header='tsa_saleorderd_pk|item_pk|qty|crt_by' format='0|0|0|0'
                                    aligns='0|0|0|0' check='|||' editcol='0|0|0|0' widths='0|2500|1500|1500' sorting='T'
                                    styles='width:100%; height:50%;display:none' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 40%">
                <td style="width: 100%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 80%" align="center">
                            </td>
                            <td align="right" style="width: 10%">
                            </td>
                            <td align="right" style="width: 10%" colspan="9">
                                <gw:imgbtn img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect1)" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td colspan="7">
                                <gw:grid id='grdItemSelect1' header='_Item_pk|Item Code|Item Name|Uom|Qty' format='0|0|0|0|1'
                                    aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='0|2500|1500|1500|1200'
                                    sorting='T' styles='width:100%; height:100%' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
</html>
