<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PopUp Modify P/O by Dept</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;

    var G1_DEPT_ID		= 0,
		G1_DEPT_NAME	= 1,
		G1_REQ_QTY		= 2,
		G1_PO_NO		= 3,
		G1_PO_DATE		= 4,
		G1_PO_D_PK		= 5,
		G1_SEQ			= 6,
		G1_REF_NO		= 7,
		G1_PO_QTY		= 8,
		G1_UPRICE		= 9,
		G1_ITEM_AMT		= 10,
		G1_TAX_RATE		= 11,
		G1_TAX_AMT		= 12,
		G1_OTHERS_EXP	= 13,
		G1_TOTAL_AMT	= 14,
		G1_REMARK		= 15;
		
 var arr_FormatNumber = new Array();		
 //=========================================================================
 function BodyInit()
 {
      System.Translate(document);
      //----------------------
	  var p_from_date = "<%=Request.querystring("from_date")%>";
	  var p_to_date   = "<%=Request.querystring("to_date")%>";
      var p_item_pk   = "<%=Request.querystring("item_pk")%>";
	  
	  txtFromDate.text = p_from_date;
	  txtToDate.text   = p_to_date;
	  
	  if ( Number(p_item_pk) > 0 )
	  {
	  		txtItemPK.text = p_item_pk;
	  }
      //-----------------------
      OnFormatGrid(); 
	  
	  OnSearch();   
 }   
 
 //=========================================================================
 function OnFormatGrid()
 {
    var trl ;
 
    //--------------------------------------------------------
      grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
      grdDetail.GetGridControl().MergeCol(3) = true ;	
 	  grdDetail.GetGridControl().MergeCol(4) = true ;	
    //--------------------------------------------------------
    
      trl = grdDetail.GetGridControl();
    
	  trl.ColFormat(G1_REQ_QTY)   = "###,###,###,###,###.##";	
      trl.ColFormat(G1_PO_QTY)    = "###,###,###,###,###.##";
      trl.ColFormat(G1_UPRICE)    = "###,###,###.##";
	  trl.ColFormat(G1_ITEM_AMT)  = "###,###,###.##";
	  trl.ColFormat(G1_TAX_RATE)  = "###,###,###.##";
	  trl.ColFormat(G1_TAX_AMT)   = "###,###,###.##";
	  trl.ColFormat(G1_OTHERS_EXP)= "###,###,###.##";
	  trl.ColFormat(G1_TOTAL_AMT) = "###,###,###.##";
	  
      arr_FormatNumber[G1_PO_QTY]    = 2;
	  arr_FormatNumber[G1_UPRICE]    = 2;
	  arr_FormatNumber[G1_ITEM_AMT]  = 2;   
	  arr_FormatNumber[G1_TAX_RATE]  = 0;  
	  arr_FormatNumber[G1_TAX_AMT]   = 2;
	  arr_FormatNumber[G1_OTHERS_EXP]= 2;  
	  arr_FormatNumber[G1_TOTAL_AMT] = 2; 	  
            
 }
//=========================================================================
 function OnSearch()
 {
    	data_epbp00271.Call('SELECT');        
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00271' :               
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_DEPT_ID, grdDetail.rows - 1, G1_DEPT_ID, true);
                    
					grdDetail.SetCellBgColor( 1, G1_REQ_QTY , grdDetail.rows - 1, G1_REQ_QTY , 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G1_SEQ     , grdDetail.rows - 1, G1_REMARK  , 0xCCFFFF );
					
					loadSum();
                }                               
            break;         
      }      
}          

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_PO_QTY || col == G1_UPRICE || col == G1_ITEM_AMT || col == G1_TAX_RATE || col == G1_TAX_AMT || col == G1_TOTAL_AMT || col == G1_OTHERS_EXP )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
        //------------------------
		var dAmount, dVATAmount, dTotalAmount;
		
        if ( col == G1_PO_QTY || col == G1_UPRICE )
        {                       
            dAmount = Number(grdDetail.GetGridData( row, G1_PO_QTY )) * Number(grdDetail.GetGridData( row, G1_UPRICE ));                       
            grdDetail.SetGridText( row, G1_ITEM_AMT, System.Round(dAmount+"", arr_FormatNumber[G1_ITEM_AMT]) );
			
			dVATAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100;
			grdDetail.SetGridText( row, G1_TAX_AMT, System.Round(dVATAmount+"", arr_FormatNumber[G1_TAX_AMT]) );
			
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) + Number(grdDetail.GetGridData( row, G1_OTHERS_EXP)) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );
        }
		else if ( col == G1_ITEM_AMT || col == G1_TAX_RATE )
		{
			dVATAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100;
			grdDetail.SetGridText( row, G1_TAX_AMT, System.Round(dVATAmount+"", arr_FormatNumber[G1_TAX_AMT]) );
			
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) + Number(grdDetail.GetGridData( row, G1_OTHERS_EXP)) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );			
		}
		else if ( col == G1_TAX_AMT || col == G1_OTHERS_EXP )
		{
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) + Number(grdDetail.GetGridData( row, G1_OTHERS_EXP)) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );			
		}
        //------------------------ 
		
		loadSum();	
    }			
}      
//=========================================================================

function OnSave()
{
	data_epbp00271.Call();
}
//====================================================================================
function loadSum()
{
		var t_item_amount  = 0;
		var t_tax_amount   = 0;
		var t_total_amount = 0;
		
		for ( var i=1; i<grdDetail.rows; i++)				
		{						 
			t_item_amount  = Number(t_item_amount)  + Number(grdDetail.GetGridData( i, G1_ITEM_AMT))  + "" ;
			t_tax_amount   = Number(t_tax_amount)   + Number(grdDetail.GetGridData( i, G1_TAX_AMT))   + "" ;		
			t_total_amount = Number(t_total_amount) + Number(grdDetail.GetGridData( i, G1_TOTAL_AMT)) + "" ;	
		}
		
		lbItemAmount.text   = addCommas(t_item_amount)  ;
		lbTaxAmount.text    = addCommas(t_tax_amount)   ;
		lbTotalAmount.text  = addCommas(t_total_amount) ;
}

//====================================================================================

function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
//=================================================================================
//========================================================================= 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00271" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_epbp00271" procedure="st_lg_upd_epbp00271" >
                <input  bind="grdDetail">
					<input bind="txtFromDate" />
					<input bind="txtToDate" />
                    <input bind="txtItemPK" />          
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" >
		<tr style="height: 1%">
			<td style="width: 10%" align="right">	
				Item Amt			 
			</td>
			<td style="width: 20%; white-space: nowrap" align="center">
				<gw:label id="lbItemAmount" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
			</td>
			<td style="width: 10%" align="right">	
				Tax Amt			 
			</td>
			<td style="width: 20%; white-space: nowrap" align="center">
				<gw:label id="lbTaxAmount" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
			</td>
			<td style="width: 10%" align="right">	
				Total Amt			 
			</td>
			<td style="width: 20%; white-space: nowrap" align="center">
				<gw:label id="lbTotalAmount" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
			</td>
			<td style="width: 8%">				 
			</td>
			<td style="width: 1%">
				<gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
			</td>
			<td style="width: 1%">
				<gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
			</td>
		</tr>
        <tr style="height: 99%">
            <td colspan=9 >
               <gw:grid id='grdDetail'
					header='Dept ID|Dept Name|Req Qty|P/O No|P/O Date|_PO_D_PK|Seq|Ref No|P/O Qty|U/Price|Item Amt|Tax(%)|Tax Amt|Others Ex|Total Amt|Remark'
					format='0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0'
					aligns='0|0|3|0|1|0|1|0|3|3|3|3|3|3|3|0'
					check='|||||||||||||||'
					editcol='0|0|0|4|0|1|1|1|1|1|1|1|1|1|1'
					widths='1500|2500|1200|1500|1200|0|800|1200|1300|1200|1200|1200|1000|1200|1200|1000'
					sorting='T'
					onafteredit="CheckInput()"
					acceptnulldate="T"
					styles='width:100%; height:100%'
					/>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtItemPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtFromDate" styles="width: 100%;display: none" />
	<gw:textbox id="txtToDate" styles="width: 100%;display: none" />
</body>
</html>
