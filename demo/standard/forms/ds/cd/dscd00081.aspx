<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP G/D Plan Detail</title>
</head>

<script type="text/javascript">
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;

//alias for grid master
var GS_WH_PK		= 0,
	GS_WH_ID		= 1,
	GS_BK_ITEM_PK	= 2,
	GS_ITEM_CODE	= 3,
	GS_ITEM_NAME	= 4,
	GS_UOM			= 5,
	GS_LOT_NO		= 6,
	GS_STOCK_QTY	= 7,
	GS_BOOK_QTY		= 8,
	GS_ISSUE_QTY	= 9,	
	GS_RES_QTY		= 10,
	GS_COMM_QTY		= 11,
	GS_NEW_BOOK_QTY	= 12,
	GS_BOOK_DATE    = 13,
	GS_BOOK_SO_D_PK = 14,
	GS_SO_ITEM_NO	= 15,
	GS_PARTNER_NAME	= 16;
	GS_CHK          = 17;

//alias for grid booking

var GB_WH_PK	    = 0,
	GB_WH_ID		= 1,
	GB_BK_ITEM_PK	= 2,
	GB_ITEM_CODE	= 3,
	GB_ITEM_NAME	= 4,
	GB_UOM			= 5,
	GB_LOT_NO		= 6,	
	GB_BOOK_QTY		= 7,
	GB_ISSUE_QTY	= 8,
	GB_RES_QTY		= 9,	
	GB_SO_ITEM_NO	= 10,
	GB_PARTNER_NAME	= 11;

var callerWindowObj = dialogArguments;

var arr_FormatNumber = new Array();	

var flag = "";	
//==========================================================================================
	        
function BodyInit()
{       	
    System.Translate(document);
	 txtSOD_PK.text = callerWindowObj.grdMaster.GetGridData( callerWindowObj.grdMaster.row, callerWindowObj.G1_REQ_SO_D_PK );
     txtItem.text   = callerWindowObj.grdMaster.GetGridData( callerWindowObj.grdMaster.row, callerWindowObj.G1_ITEM_CODE   );	 	                     
     
	 //----------------------
	 OnFormatGrid();
	 
	 OnChangeTab();	
	 
	 OnChangeSpec(); 	        	      
}

//==========================================================================================
function OnFormatGrid()
{
     var data ;     
     data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_IN_WAREHOUSE where del_if = 0 and use_yn='Y' and wh_type = '04' order by wh_id ")%>"; 
     lstWH.SetDataText(data);
	 
	 grdBook.GetGridControl().MergeCells  = 2 ;
	 grdBook.GetGridControl().MergeCol(1) = true ;
	 grdBook.GetGridControl().MergeCol(2) = true ;	
     grdBook.GetGridControl().MergeCol(3) = true ;
	 grdBook.GetGridControl().MergeCol(4) = true ;	
	 grdBook.GetGridControl().MergeCol(5) = true ;		
        	 	   
	 grdBook.GetGridControl().ColFormat(GB_BOOK_QTY)  = "###,###,###";	
	 grdBook.GetGridControl().ColFormat(GB_ISSUE_QTY) = "###,###,###";	
	 grdBook.GetGridControl().ColFormat(GB_RES_QTY)   = "###,###,###";	
	 	 
	 grdBook.GetGridControl().Cell( 7, 0, GB_RES_QTY, 0, GB_RES_QTY ) = 0x3300cc;
	 
	 //----------------------------------------------------------
     grdStock.GetGridControl().MergeCells  = 2 ;	
     grdStock.GetGridControl().MergeCol(0) = true ;	
     grdStock.GetGridControl().MergeCol(1) = true ;   	
     grdStock.GetGridControl().MergeCol(2) = true ;
	 grdStock.GetGridControl().MergeCol(3) = true ;	
	 grdStock.GetGridControl().MergeCol(4) = true ;	
	 grdStock.GetGridControl().MergeCol(5) = true ;		
        	     
     grdStock.GetGridControl().ColFormat(GS_STOCK_QTY) = "###,###,###";	 	
	 grdStock.GetGridControl().ColFormat(GS_BOOK_QTY)  = "###,###,###";	
	 grdStock.GetGridControl().ColFormat(GS_ISSUE_QTY) = "###,###,###";	
	 grdStock.GetGridControl().ColFormat(GS_RES_QTY)   = "###,###,###";	
	 grdStock.GetGridControl().ColFormat(GS_COMM_QTY)  = "###,###,###";
	 
	 arr_FormatNumber[GS_NEW_BOOK_QTY] = 0; 
			 
	 grdStock.GetGridControl().Cell( 7, 0, GS_COMM_QTY, 0, GS_COMM_QTY ) = 0x3300cc;
	 //-----------------------------------------   	     	 	     	     	  
} 
//========================================================================================== 
 function OnDataReceive(obj)
 {
 
      switch (obj.id)         
      {		        
        	case 'data_dscd00081' :
				if (flag == "BOOK")
				{
					flag = "";
					radTab.value = '1';	
					OnChangeTab();		
				}
				else
				{		 
					if ( grdStock.rows > 1 )
		        	{					
		            	grdStock.SetCellBold( 1, GS_ITEM_CODE,    grdStock.rows - 1, GS_ITEM_CODE,    true);		
						grdStock.SetCellBold( 1, GS_NEW_BOOK_QTY, grdStock.rows - 1, GS_NEW_BOOK_QTY, true);					 
					
						grdStock.SetCellBgColor( 1, GS_ITEM_CODE, grdStock.rows - 1, GS_ITEM_NAME,    0xCCFFFF );
						grdStock.SetCellBgColor( 1, GS_COMM_QTY,  grdStock.rows - 1, GS_NEW_BOOK_QTY, 0xCCFFFF );
					
						grdStock.GetGridControl().Cell( 7, 1, GS_COMM_QTY, grdStock.rows - 1, GS_COMM_QTY ) = 0x3300cc;										 					    
		        	} 
				}	 	                   
        	break;   
			 
        	case 'data_dscd00081_1':				
        	    	if ( grdBook.rows > 1 )
		        	{					 
		            	grdBook.SetCellBold( 1, GB_ITEM_CODE, grdBook.rows - 1, GB_ITEM_CODE, true);
						grdBook.SetCellBold( 1, GB_BOOK_QTY,  grdBook.rows - 1, GB_BOOK_QTY,  true);
					
						grdBook.SetCellBgColor( 1, GB_ITEM_CODE, grdBook.rows - 1, GB_ITEM_NAME, 0xCCFFFF );
						grdBook.SetCellBgColor( 1, GB_BOOK_QTY,  grdBook.rows - 1, GB_RES_QTY,   0xCCFFFF );
						grdBook.GetGridControl().Cell( 7, 1, GB_RES_QTY, grdBook.rows - 1, GB_RES_QTY ) = 0x3300cc;										 
		        	}				  			        				
        	break;    
			
        	case 'pro_dscd00081_1':
              	OnSearch("Spec02");         
       		break;
		
        	case 'pro_dscd00081_2':
              	OnSearch("Spec03");         
        	break;		
		
        	case 'pro_dscd00081_3':
              	OnSearch("Spec04");         
        	break;		
		
        	case 'pro_dscd00081_4':
              	OnSearch("Spec05");         
        	break;		  
      }  
 }
 
//==========================================================================================

function OnSearch(pos)
{    
    switch (pos)
    {
        case 'Detail' :
			if ( radTab.value == '1' )
			{        
            	data_dscd00081_1.Call("SELECT");            
			}
			else
			{
				data_dscd00081.Call('SELECT');
			}	
        break;     
		
		case 'Spec01': 		    
			pro_dscd00081_1.Call();
		break;
		
		case 'Spec02':
			pro_dscd00081_2.Call();			
		break;

		case 'Spec03':
			pro_dscd00081_3.Call();			
		break;	
		
		case 'Spec04':
			pro_dscd00081_4.Call();			
		break;
		
		case 'Spec05':
			pro_dscd00081_5.Call();			
		break;					
    }
}
//==========================================================================================
function OnSelect(pos)
{
    var arr_data = new Array();
    var t = 0 ;
	
    switch(pos)
    {
        case 'ONE':
            var arrTemp;
            for(var i = 1; i < grdBook.rows; i++ )
            {
                if ( grdBook.GetGridControl().isSelected(i) == true )
               {
                     arrTemp = new Array();
                         
                     for( var j = 0; j < grdBook.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdBook.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
					 
					 t = t + 1 ;
               }
            }
			
			if ( t == 0 )
			{
				alert("PLS SELECT ONE ROW AT LEAST !!!");
				return;
			}
        break;
		
        case 'MULTI':
             var arrTemp;
             for(var i = 1; i < grdBook.rows; i++ )
            {
                     arrTemp = new Array();
                         
                     for( var j = 0; j < grdBook.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdBook.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
              }
        break;
    }
                 
    window.returnValue =  arr_data;
    window.close();
            
}
//==========================================================================================

function OnChangeTab()
{ 
    var strRad = radTab.GetData();
         
	switch (strRad)
	{
		case '1'://stock booking
			tab_chkSpec.style.display  = "none";
			btnBooking.style.display   = "none";			
		    btnSelectALL.style.display = "";
		    btnSelect.style.display    = "";
			
		    grdStock.style.display     = "none"		    
		    grdBook.style.display      = "";

		    lstSpec01.style.display      = "none";
		    lstSpec02.style.display      = "none";
		    lstSpec03.style.display      = "none";
		    lstSpec04.style.display      = "none";
		    lstSpec05.style.display      = "none";		    			
			
		    tab_stock_booking.style.color  = 0xCC0000; 
		    tab_stock_avaiable.style.color = "";
			
			txtItem.text = '';
			
		    OnSearch('Detail');
        break;
		
        case '2'://stock avaliable
			tab_chkSpec.style.display  = "";
			btnBooking.style.display   = "";			
		    btnSelectALL.style.display = "none";
		    btnSelect.style.display    = "none";
			
		    grdStock.style.display     = ""		    
		    grdBook.style.display      = "none";
		    
		    lstSpec01.style.display      = "";
		    lstSpec02.style.display      = "";
		    lstSpec03.style.display      = "";
		    lstSpec04.style.display      = "";
		    lstSpec05.style.display      = "";
		    
		    tab_stock_booking.style.color  = ""; 
		    tab_stock_avaiable.style.color = 0xCC0000;
			
			txtItem.text = callerWindowObj.grdMaster.GetGridData( callerWindowObj.grdMaster.row, callerWindowObj.G1_ITEM_CODE );
			
		    OnSearch('Detail');		    
        break;
     }
     
}

//================================================================================
function OnBooking()
{ 
	var t = 0 ; 
    for(var i=1; i < grdStock.rows; i++)
    {
        if ( grdStock.GetGridData(i, GS_CHK) == -1 )
		{
			t = t + 1 ;
			
			if ( grdStock.GetGridData(i, GS_NEW_BOOK_QTY) == '')
        	{          
               	alert('BOOK QTY MUST GREATER THAN 0 ! PLS CHECK AGAIN !');   
			   	return;               
        	}	
		}		     
    }
    
	if ( t == 0 )
	{
		alert("NO STOCK SELECTED !!!");
		return;
	}
	
	if ( confirm("Are you sure to book this stock ?"))
	{	
		flag = "BOOK";
    	data_dscd00081.Call();
	}	
}
//============================================================================================================
function OnCheckInput(obj)
{
	if (obj.id == "grdStock")
	{
	    var col, row
	    
	    col = event.col
	    row = event.row  
	
	    if ( col == GS_CHK && grdStock.GetGridData( row, GS_CHK) == -1 )
	    {
			grdStock.SetGridText( row, GS_NEW_BOOK_QTY, Number(grdStock.GetGridData( row, GS_COMM_QTY)) );
		} 
		else if ( col == GS_NEW_BOOK_QTY )
		{
	 		var dQuantiy ;
	        
	        dQuantiy =  grdStock.GetGridData(row,col) ;
	        
	        if (Number(dQuantiy))
	        {   
	            if (dQuantiy >0)
	            {
	                grdStock.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
	            }
	            else
	            {
	                alert(" Value must greater than zero !!");
	                grdStock.SetGridText( row, col, "");
	            }
	        }
	        else
	        {
	            grdStock.SetGridText(row,col,"") ;
	        }  	
		}	
	}	    
}
 
//============================================================================================================

function OnChangeSpec()
{
    if ( chkSpec.value == "Y" ) 
    {
		document.all("tab_Spec").style.display = "" ;
		 
		OnSearch("Spec01");
    }
    else
    {
		document.all("tab_Spec").style.display = "none" ;
		
		lstSpec01.value = "";
		lstSpec02.value = "";
		lstSpec03.value = "";
		lstSpec04.value = "";
		lstSpec05.value = "";
    }
}

//============================================================================================================

function OnGridCellDoubleClick(obj)
{
	switch(obj.id)
	{
		case 'grdBook':
			if ( grdBook.row > 0 )
			{
				var row = event.row;
				var col = event.col;
				
				if ( col == GB_BOOK_QTY )
				{
					var path = System.RootURL + '/standard/forms/ds/cd/dscd00082.aspx';         		
					var aValue = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:20');	
				}
			}	
		break;
	}	
}
//============================================================================================================
</script>

<body>
    <!--------------------------------Data Control------------------------------------>
    <gw:data id="data_dscd00081" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_dscd00081"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" procedure="st_lg_upd_dscd00081" > 
                    <input bind="grdStock" > 
                        <input bind="lstWH" /> 
                        <input bind="txtItem" />  
                        <input bind="txtCust" />
						<input bind="chkBalance" />						
						<input bind="txtSOD_PK" />
					    <input bind="lstSpec01" />
                        <input bind="lstSpec02" />
                        <input bind="lstSpec03" />
                        <input bind="lstSpec04" />
                        <input bind="lstSpec05" />                    
                     </input> 
                    <output bind="grdStock" /> 
                </dso> 
            </xml> 
    </gw:data>
    
    <!-------------------------------------------------------------------->
    <gw:data id="data_dscd00081_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid"  function="st_lg_sel_dscd00081_1"  > 
                    <input bind="grdBook" > 
                    	<input bind="txtSOD_PK" />
                        <input bind="lstWH" /> 
                        <input bind="txtItem" />  
                        <input bind="txtCust" />
						<input bind="chkBalance" />
                     </input> 
                    <output bind="grdBook" /> 
                </dso> 
            </xml> 
    </gw:data>         
    <!-------------------------------Layout form------------------------------------->
    <gw:data id="pro_dscd00081_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_pro_dscd00081_1" > 
                <input>
                     <input bind="lstWH" /> 
                     <input bind="chkBalance" />                    
                </input> 
                <output>
                    <output bind="lstSpec01" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------Layout form------------------------------------->
    <gw:data id="pro_dscd00081_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_pro_dscd00081_2" > 
                <input>
                     <input bind="lstWH" /> 
                     <input bind="chkBalance" />                    
                </input> 
                <output>
                    <output bind="lstSpec02" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------Layout form------------------------------------->
    <gw:data id="pro_dscd00081_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_pro_dscd00081_3" > 
                <input>
                     <input bind="lstWH" /> 
                     <input bind="chkBalance" />                    
                </input> 
                <output>
                    <output bind="lstSpec03" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------Layout form------------------------------------->
    <gw:data id="pro_dscd00081_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_pro_dscd00081_4" > 
                <input>
                     <input bind="lstWH" /> 
                     <input bind="chkBalance" />                    
                </input> 
                <output>
                    <output bind="lstSpec04" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------Layout form------------------------------------->
    <gw:data id="pro_dscd00081_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_pro_dscd00081_5" > 
                <input>
                     <input bind="lstWH" /> 
                     <input bind="chkBalance" />                    
                </input> 
                <output>
                    <output bind="lstSpec05" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!----------------------------Process--------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">            
            <td style="width:75%">
                <table style="height: 100%; width: 100%" >
                    <tr>
                        <td style="width:20%; background-color: #CCFFFF" align="center" >
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="tab_stock_booking">Booked</span> 
                                <span value="2" id="tab_stock_avaiable">Common</span> 
                            </gw:radio>
                        </td>       
                        <td style="width: 5%" align="right" >
                            W/H
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Cust
                        </td>
                        <td style="width: 15%" >
                            <gw:textbox id="txtCust" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 8%; white-space: nowrap" align="center">
                            Bal
                            <gw:checkbox id="chkBalance" defaultvalue="Y|N" value="Y" onclick="OnSearch('Detail')" />							
                        </td>
						<td style="width: 8%; white-space: nowrap" align="center">
                            <b id="tab_chkSpec">Spec<gw:checkbox id="chkSpec" defaultvalue="Y|N" value="N" onclick="OnChangeSpec()" />	</b>                            						
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:button id="btnSelect" img="Select" text="Select" onclick="OnSelect('ONE')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSelectALL" img="Select All" text="Select ALL" onclick="OnSelect('MULTI')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnBooking" img="Booking" text="Booking" onclick="OnBooking()" />
                        </td>                        
                    </tr>
                    <tr id="tab_Spec">
						<td colspan=13 >
							<table style="height: 100%; width: 100%; background-color: #CCFFFF">
								<tr>
									<td style="width: 20%">
			                            <gw:list id="lstSpec01" styles="width:100%" onchange="OnSearch(radTab)" />
			                        </td>		                      
			                        <td style="width: 20%">
			                            <gw:list id="lstSpec02" styles="width:100%" onchange="OnSearch(radTab)" />
			                        </td>			                        
			                        <td style="width: 20%">
			                            <gw:list id="lstSpec03" styles="width:100%" onchange="OnSearch(radTab)" />
			                        </td>			                      
			                        <td style="width: 20%">
			                            <gw:list id="lstSpec04" styles="width:100%" onchange="OnSearch(radTab)" />
			                        </td>			                       
			                        <td style="width: 20%">
			                            <gw:list id="lstSpec05" styles="width:100%" onchange="OnSearch(radTab)" />
			                        </td>                      								
								</tr>
							</table>
						</td>                                                                     
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="2">
                <gw:grid id='grdBook'
                    header='_WH_PK|_W/H|_BOOK_ITEM_PK|Item Code|Item Name|UOM|Lot No|Book Qty|Issue Qty|Remain Qty|S/O Item No|Partner Name'
                    format='0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|0|0|0|1|1|3|3|3|0|0'
                    check='|||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|0|1500|3500|800|1500|1200|1200|1200|1500|1000'
                    sorting='T'
                    acceptnulldate='true'
					oncelldblclick="OnGridCellDoubleClick(this)"
                    styles='width:100%; height:100%' 
                    />
					
                <gw:grid id='grdStock'
                    header='_WH_PK|_W/H|_BK_ITEM_PK|Item Code|Item Name|UOM|Lot No|_Stock Qty|_Book Qty|_Issue Qty|_Res Qty|Comm Qty|Book Qty|Book Date|_book_so_d_pk|S/O Item No|Partner Name|Chk'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|3'
                    aligns='0|0|0|0|0|1|1|0|0|0|0|3|3|1|0|1|0|0'
                    check='|||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|1'
                    widths='0|1500|0|1500|3500|800|1200|1200|1200|1000|1200|1200|1200|1200|0|1500|2500|400'
                    sorting='T'
                    acceptnulldate='true'
                    styles='width:100%; height:100%'             
                    onafteredit="OnCheckInput(this)"
                    />                
            </td>
        </tr>
    </table>
    <!----------------------------Hindden control---------------------------------------->
    <gw:textbox id="txtSOD_PK" styles="width:100%;display:none" />
    
    <gw:textbox id="txt_speclist1_pk" styles="width:100%;display:none" />
    <gw:textbox id="txt_speclist2_pk" styles="width:100%;display:none" />
    <gw:textbox id="txt_speclist3_pk" styles="width:100%;display:none" />
    <gw:textbox id="txt_speclist4_pk" styles="width:100%;display:none" />
    <gw:textbox id="txt_speclist5_pk" styles="width:100%;display:none" />
	<!----------------------------Hindden control---------------------------------------->
</body>
</html>
