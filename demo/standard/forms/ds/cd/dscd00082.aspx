<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>BOOKING DETAIL</title>
</head>

<script type="text/javascript">
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
 
var G_STATUS		= 0, 
	G_LOT_NO		= 1,	
	G_BOOK_QTY		= 2,	 
	G_SO_ITEM_NO	= 3,
	G_PARTNER_NAME	= 4,
	G_CRT_BY		= 5,	 	 
	G_MOD_BY		= 6,
	G_MASTER_PK		= 7;

var callerWindowObj = dialogArguments;
		
var arr_FormatNumber = new Array();	
		
//==========================================================================================
	        
function BodyInit()
{
    System.Translate(document);
  	txtWH_PK.text  = callerWindowObj.grdBook.GetGridData( callerWindowObj.grdBook.row, callerWindowObj.GB_WH_PK      ); 
	txtItemPK.text = callerWindowObj.grdBook.GetGridData( callerWindowObj.grdBook.row, callerWindowObj.GB_BK_ITEM_PK );
	txtSOD_PK.text = callerWindowObj.txtSOD_PK.text;
	
	OnFormatGrid();
	
	OnSearch();
}
//==========================================================================================
function OnFormatGrid()
{    
	 grdDetail.GetGridControl().MergeCells  = 2 ;
	 grdDetail.GetGridControl().MergeCol(1) = true ;
	 grdDetail.GetGridControl().MergeCol(2) = true ;	
     grdDetail.GetGridControl().MergeCol(3) = true ;
	 grdDetail.GetGridControl().MergeCol(4) = true ;	
	 grdDetail.GetGridControl().MergeCol(5) = true ;		
        	 	   
	 grdDetail.GetGridControl().ColFormat(G_BOOK_QTY)  = "###,###,###";	
	 
	 arr_FormatNumber[G_BOOK_QTY] = 0; 
}
	 
//====================================================================================================
function OnSave()
{
	data_dscd00082.Call();
}

//====================================================================================================
function OnSearch()
{
    data_dscd00082.Call('SELECT');
}
//====================================================================================================

 function OnDelete()
 {    	 
	grdDetail.DeleteRow();		     
 }
//====================================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
	{
		case 'data_dscd00082':
			if ( grdDetail.rows > 1 )			
			{
				grdDetail.SetCellBold( 1, G_LOT_NO, grdDetail.rows-1, G_LOT_NO, true);
				
				grdDetail.SetCellBgColor( 1, G_BOOK_QTY , grdDetail.rows - 1, G_BOOK_QTY , 0xCCFFFF );
			}
		break;
	}
}
//====================================================================================================
function OnCheckInput()
{	 
	    var col, row
	    
	    col = event.col
	    row = event.row  
	
	    if ( col == G_BOOK_QTY )
		{
	 		var dQuantiy ;
	        
	        dQuantiy =  grdDetail.GetGridData(row,col) ;
	        
	        if (Number(dQuantiy))
	        {   
	            if (dQuantiy >0)
	            {
	                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
	            }
	            else
	            {
	                alert(" Value must greater than zero !!");
	                grdDetail.SetGridText( row, col, "");
	            }
	        }
	        else
	        {
	            grdStock.SetGridText(row,col,"") ;
	        }  	
		}	    
}

//====================================================================================================

</script>
<html>
<body>
   <!--------------------------------Data Control------------------------------------>
    <gw:data id="data_dscd00082" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_dscd00082" parameter="0,1,2,3,4,5,6,7" procedure="st_lg_upd_dscd00082"  > 
                    <input bind="grdDetail" > 
                        <input bind="txtWH_PK" /> 
                        <input bind="txtSOD_PK" />  
                        <input bind="txtItemPK" />  
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!--------------------------------Data Control------------------------------------>  
  
    <table style="height: 100%; width: 100%" >
        <tr style="height:1%">
            <td>
                <table style="height: 100%; width: 100%" border="0">
                    <tr>
                        <td style="width: 5%">                             
                        </td>
                        <td style="width: 10%">                             
                        </td>
                        <td style="width: 1%">                             
                        </td>
                        <td style="width: 10%">                             
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">                             
                        </td>
                        <td style="width: 15%">                            
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">                             
                        </td>
                        <td style="width: 15%">                             
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">                             
                        </td>
                        <td style="width: 15%">                             
                        </td>                       
                        <td style="width: 1%" align="center"> 
							<gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />                                   
                        </td>
                        <td style="width: 1%"> 
							<gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />                                    
                        </td>
                        <td style="width: 1%" align="left">
							<gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />                            
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:99%">
            <td>
                <gw:grid id='grdDetail'
                header='From|Lot No|Book Qty|S/O Item No|Partner|Crt By|Mod By|_MASTER_PK'
                format='0|0|0|0|0|0|0|0'
                aligns='1|1|3|1|0|1|1|0'                 
                editcol='0|0|1|0|0|0|0|0'
                widths='1200|1500|1200|1500|2000|2000|2000|0'
                sorting='T'                     
				onafteredit="OnCheckInput(this)"                     
                styles='width:100%; height:100%'
                />            
            </td>
        </tr>
    </table>
<!------------------------------------------------------------------>
<gw:textbox id="txtWH_PK" styles="width:100%;display:none" />
<gw:textbox id="txtSOD_PK" styles="width:100%;display:none" />
<gw:textbox id="txtItemPK" styles="width:100%;display:none" />
<!------------------------------------------------------------------>        
</body>
</html>
