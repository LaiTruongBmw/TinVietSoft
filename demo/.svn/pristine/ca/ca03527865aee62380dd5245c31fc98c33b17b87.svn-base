<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM TAKE OUT REQUEST</title>
</head>

<script>
// grdReqItemList
var  iColReq_Qty        = 14,
     iColReserved_Qty   = 15,
     iColOut_Qty        = 16;
   
var G1_TSA_SALEORDER_PK    = 0,     
    G1_PARTNER             = 1,  
    G1_SLIP_NO             = 2,  
    G1_PO                  = 3,  
    G1_ETD                 = 4,  
    G1_PK                  = 5,  
    G1_TCO_ITEM_PK         = 6,  
    G1_ITEM_CODE           = 7,  
    G1_ITEM_NAME           = 8,
    G1_UOM                 = 9,      
    G1_OUT_TCO_ITEM_PK     = 10,  
    G1_OUT_ITEM_CODE       = 11,  
    G1_OUT_ITEM_NAME       = 12, 
    G1_OUT_UOM             = 13,
    G1_ORD_QTY             = 14,  
    G1_UNIT_PRICE          = 15,   
   G1_amount	     = 16,
    G1_TAKEOUT_QTY         = 17,  
    G1_BALANCE_QTY         = 18,   
    G1_NULL                = 19,  
    G1_TCO_STITEM_PK       = 20,  
    G1_DELI_TO_PK          = 21,
    G1_THICKNESS           = 22 ;    
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
    var callerWindowObj = dialogArguments;  
    var data="";  
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
    OnFormatGrid();
    txtCustName.SetEnable(false);
    txtCustPK.text = callerWindowObj.txtCustPK.text;
    txtCustName.text = callerWindowObj.txtCustName.text;
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
            dscd00022.Call("SELECT");
        break;
        case 2 :         
            if ( grdReqList.row > 0 )
            {
                txtRequestPK.text = grdReqList.GetGridData(grdReqList.row,G1_TCO_STITEM_PK);     
                dscd00022_1.Call("SELECT");
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
        case "dscd00022" :
            if(grdReqList.row > 0)
            {
                txtRequestPK.text = grdReqList.GetGridData(grdReqList.row,G1_TCO_STITEM_PK);     
                dscd00022_1.Call("SELECT");
            }
        break;
      }  
 }
 
 //---------------------------------------------------------
 function OnPopUp(pos)
 {
      switch (pos)         
      {	 
            case 'Cust'  :
                         var path = System.RootURL + '/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR';
	                     var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	       
	                     if ( object != null )
	                     {       
	                        txtCustPK.text   = object[0];
	                        txtCustCode.text = object[1];
                            txtCustName.text = object[2];            
	                     }
	        break;
	  }
 }
 //---------------------------------------------------------


//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,2); 
    var col_val_2 = grdItemSelect.GetGridData(grdItemSelect.row,6);
    var col_val_3 = grdItemSelect.GetGridData(grdItemSelect.row,0);
    
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    
   for (var i=1; i<grdReqItemList.rows; i++ )
   {
      if ( grdReqItemList.GetGridData(i,2) == col_val && grdReqItemList.GetGridData(i,6) ==  col_val_2&& grdReqItemList.GetGridData(i,0) ==  col_val_3)
      {
         countItem();
         grdReqItemList.SetCellBgColor( i, 1 , i, 7 , 0x000000 );
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
      if(p_oGrid.GetGridData(i,G1_TSA_SALEORDER_PK) == p_value)
      {
         return true;
      }
      if(p_oGrid.GetGridData(i,G1_TCO_ITEM_PK) == p_value)
      {
         return true;
      }
      if(p_oGrid.GetGridData(i,G1_TCO_STITEM_PK) == p_value)
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
            
                var col_val = oGrid.GetGridData(event.row,G1_TSA_SALEORDER_PK); // item code 2 
                var col_val_2 = oGrid.GetGridData(event.row,G1_TCO_ITEM_PK);    // lot no 6 
                var col_val_3 = oGrid.GetGridData(event.row,G1_TCO_STITEM_PK); // w/h 0
                
                if ( (event.row > 0 && ((!CheckDataExist(grdItemSelect,col_val)) || (!CheckDataExist(grdItemSelect,col_val_2)) || (!CheckDataExist(grdItemSelect,col_val_3)))))
                {
                    oGrid.SetCellBgColor( event.row, G1_TSA_SALEORDER_PK , event.row, G1_DELI_TO_PK , 0x99DDFF);
		            grdItemSelect.AddRow();
            		
		            for(var i=0;i<oGrid.cols;i++)
		            {
		              grdItemSelect.SetGridText(grdItemSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		            }
                 }
                 else if((CheckDataExist(grdItemSelect,col_val)) && (CheckDataExist(grdItemSelect,col_val_2)) &&(CheckDataExist(grdItemSelect,col_val_3)))
                 {
                    alert('This request detail has already take out!');
                 }
                countItem();
            break;
            
            case "grdItemSelect" :
            
                var event_col = event.col ;
                var event_row = event.row ;
                 
                 //------------------------
                if ( event_col == G1_OUT_ITEM_CODE || event_col == G1_OUT_ITEM_NAME )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdItemSelect.SetGridText( event_row, G1_OUT_TCO_ITEM_PK  ,   object[0] );
                            grdItemSelect.SetGridText( event_row, G1_OUT_ITEM_CODE,   object[1] );
                            grdItemSelect.SetGridText( event_row, G1_OUT_ITEM_NAME,   object[2] );
                            grdItemSelect.SetGridText( event_row, G1_OUT_UOM,   object[5] );
                       }                       
                 }                                 
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
            col_val = oGrid.GetGridData(row,G1_TSA_SALEORDER_PK); // item code 2 
            col_val_2 = oGrid.GetGridData(row,G1_TCO_ITEM_PK);    // lot no 6 
            col_val_3 = oGrid.GetGridData(row,G1_TCO_STITEM_PK); // w/h 0
            
            if ((!CheckDataExist(grdItemSelect,col_val)) || (!CheckDataExist(grdItemSelect,col_val_2)) || (!CheckDataExist(grdItemSelect,col_val_3)))
            {
                oGrid.SetCellBgColor( row, G1_TSA_SALEORDER_PK , row, G1_DELI_TO_PK , 0x99DDFF);
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
	  
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dscd00022" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="st_lg_sel_dscd00022" > 
                <input>
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
                    <input bind="txtRequestNo" />
                    <input bind="txtCustPK" />
                    <input bind="chkBalance" />
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
            <tr style="width: 100%">
                <td style="width: 100%; height: 50%">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td align="right" style="width: 5%">
                                <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Cust')">Customer</b>
                            </td>
                            <td style="width: 17%">
                                <gw:textbox id="txtCustPK" styles='display:none' />
                                <gw:textbox id="txtCustCode" styles='display:none' />
                                <gw:textbox id="txtCustName" styles='width:100%' />
                            </td>
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
                                <gw:checkbox id="chkBalance" styles="color:red" defaultvalue="Y|N" value="Y">Balance</gw:checkbox>
                            </td>
                            <td align="right" style="width: 5%">
                                <gw:button img="select" alt="Select Multi Item" id="btnSelect1" onclick="OnSelectMultItem(grdReqList)" />
                            </td>
                            <td align="right" style="width: 5%">
                                <gw:button img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr id='top' style="height: 99%">
                            <td colspan="11">                          
 		<gw:grid id='grdReqList' header='_tsa_saleorder_pk|Partner|Slip No|PO|Etd|_pk|_tco_item_pk|_Item Code|_Item Name|_UOM|_out_tco_item_pk|Out Item Code|Out Item Name|UOM|Ord Qty|Unit Price|_amount|TakeOut Qty|Balance Qty|_null|tco_stitem_pk|_deli_to_pk|_thickness'
                                    format='0|0|0|0|4|0|0|0|0|0|0|0|0|0|1|-2|1|1|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0'
                                    check='||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|3000|1000|1000|1200|0|0|1500|2000|1000|0|1500|2000|800|1500|0|1500|1500|1500|0|0|0|0'
                                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDoubleClick(this)' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; height: 50%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 80%" align="center">
                                <gw:label id="txtCount" styles='width:100%;color:cc0000;font:9pt' />
                            </td>
                            <td align="right" style="width: 10%">
                                <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                            </td>
                            <td align="right" style="width: 10%" colspan="9">
                                <gw:button img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect)" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td colspan="7">
                                <gw:grid id='grdItemSelect' header='_tsa_saleorder_pk|Partner|Slip No|PO|Etd|_pk|_tco_item_pk|_Item Code|_Item Name|_UOM|_out_tco_item_pk|Out Item Code|Out Item Name|UOM|Ord Qty|Unit Price|_amount|TakeOut Qty|Balance Qty|_null|tco_stitem_pk|_deli_to_pk|_thickness'
                                    format='0|0|0|0|4|0|0|0|0|0|0|0|0|0|1|-2|1|1|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0'
                                    check='||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|3000|1000|1000|1200|0|0|1500|2000|1000|0|1500|2000|800|1500|0|1500|1500|1500|0|0|0|0'
                                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDoubleClick(this)' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <img status="expand" id="imgArrow" src="../../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtRequestPK" maxlen="100" styles='width:100%;display:none ' />
</body>
</html>
