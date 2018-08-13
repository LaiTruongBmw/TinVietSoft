<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM W/I</title>
</head>

<script>
// grdReqItemList   
var G1_WI_D_PK       = 0,  
    G1_LINE          = 1,
    G1_SLIP_NO       = 2,       
    G1_SLIP_DATE     = 3,
	G1_SEQ           = 4,   
    G1_ITEM_PK       = 5,  
    G1_ITEM_CODE     = 6,  
    G1_ITEM_NAME     = 7,
    G1_UOM           = 8,      
    G1_WI_QTY        = 9,  
    G1_PROD_QTY      = 10,   
    G1_BALANCE_QTY	 = 11,
    G1_NULL_01       = 12,  
    G1_NULL_02       = 13,
    G1_TABLE_NM      = 14;  
	 
 //==========================================================================
 function BodyInit()
 {
    System.Translate(document); 
	
    var callerWindowObj = dialogArguments;  
	//----------------------------------    
	dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
    
	OnFormatGrid();
   
 } 

 //==========================================================================

function OnFormatGrid()
{
    var trl;
    trl = grdReqList.GetGridControl();	
    trl.ColFormat(G1_WI_QTY)       = "###,###,###,###,###.##";    
    trl.ColFormat(G1_PROD_QTY)     = "###,###,###,###,###.##";    
    trl.ColFormat(G1_BALANCE_QTY)  = "###,###,###,###,###.##"; 
	   
    trl = grdItemSelect.GetGridControl();	
    trl.ColFormat(G1_WI_QTY)       = "###,###,###,###,###.##";    
    trl.ColFormat(G1_PROD_QTY)     = "###,###,###,###,###.##";    
    trl.ColFormat(G1_BALANCE_QTY)  = "###,###,###,###,###.##"; 
	
	
	var data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>||";    
    lstLine.SetDataText(data);  
	lstLine.value = '';  	
}
 //==========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        	case 1 :
            	fppr00024.Call("SELECT");
        	break;		   
      }  
 }
 
 //===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
        	case "fppr00024" :
            
        	break;
      }  
 }
 
 
 //===================================================================

function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,G1_WI_D_PK);       
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    
   for (var i=1; i<grdReqItemList.rows; i++ )
   {
      if ( grdReqItemList.GetGridData(i,2) == col_val )
      {
         countItem();
         grdReqItemList.SetCellBgColor( i, 1 , i, G1_BALANCE_QTY  , 0x000000 );
         return;
      }
   }    
  }
}
 

 //===================================================================
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,G1_WI_D_PK) == p_value)
      {
         return true;
      }
      
   }
   return false;
}
 //===================================================================
    var gPreviousRow = -1 ;
 //===================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdReqList" :
            
                var col_val = oGrid.GetGridData(event.row,G1_WI_D_PK); // item code 2 
                   
                if (event.row > 0 && !CheckDataExist(grdItemSelect,col_val) )
                {
                    oGrid.SetCellBgColor( event.row, G1_LINE , event.row, G1_BALANCE_QTY , 0x99DDFF);
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
            col_val = oGrid.GetGridData(row,G1_WI_D_PK); // item code 2 
                
            if (!CheckDataExist(grdItemSelect,col_val))
            {
                oGrid.SetCellBgColor( row, G1_WI_D_PK , row, G1_BALANCE_QTY , 0x99DDFF);
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
    <gw:data id="fppr00024" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_fppr00024" > 
                <input>
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
					<input bind="lstLine" />
                    <input bind="txtRequestNo" />
                    <input bind="chkBalance" />                    
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
                            <td align="right" style="width: 5%; white-space: nowrap">
                                Slip No
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtRequestNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
                            </td>
                            <td align='right' style="width: 5%; white-space: nowrap">
                                Slip Date
                            </td>
                            <td style="width: 20%; white-space: nowrap">
                                <gw:datebox id="dtFromDate" lang="1" />
                                ~<gw:datebox id="dtToDate" lang="1" />
                            </td>
                            <td align='right' style="width: 5%; white-space: nowrap">
                               Line    
							</td>
                            <td style="width: 30%">
                                <gw:list id="lstLine" styles='width:100%'   />                                 
                            </td>
                            <td style="width: 8%" align="center">
                                <gw:checkbox id="chkBalance" styles="color:red" defaultvalue="Y|N" value="Y">Bal</gw:checkbox>
                            </td>							 
                            <td align="right" style="width: 1%">
                                <gw:imgbtn img="select" alt="Select Multi Item" id="btnSelect1" onclick="OnSelectMultItem(grdReqList)" />
                            </td>
                            <td align="right" style="width: 1%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr id='top' style="height: 99%">
                            <td colspan="11">                          
 		                            <gw:grid id='grdReqList' header='_wi_d_pk|Line|Slip No|Date|Seq|_tco_item_pk|Item Code|Item Name|UOM|W/I Qty|In Qty|Bal Qty|_NULL_01|_NULL_02|_TABLE'
                                    format='0|0|0|4|0|0|0|0|0|0|0|0|0|0|0' 
                                    aligns='0|0|0|1|0|0|0|0|1|3|3|3|0|0|0'
                                    check='|||||||||||||||' 
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|1500|1200|1200|800|0|1500|2500|800|1200|1200|1200|0|0|0'
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
                                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                            </td>
                            <td align="right" style="width: 10%" colspan="9">
                                <gw:imgbtn img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect)" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td colspan="7">                              																		 
									<gw:grid id='grdItemSelect' header='_wi_d_pk|Line|Slip No|Date|Seq|_tco_item_pk|Item Code|Item Name|UOM|W/I Qty|In Qty|Bal Qty|_NULL_01|_NULL_02|_TABLE'
                                    format='0|0|0|4|0|0|0|0|0|0|0|0|0|0|0' 
                                    aligns='0|0|0|1|0|0|0|0|1|3|3|3|0|0|0'
                                    check='|||||||||||||||' 
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|1500|1200|1200|800|0|1500|2500|800|1200|1200|1200|0|0|0'
                                    sorting='T' styles='width:100%; height:100%'   />
									
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>   
 </body>
</html>
