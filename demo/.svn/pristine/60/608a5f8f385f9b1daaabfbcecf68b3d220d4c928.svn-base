<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Return to Supplier Checking</title>
</head>

<script>

 var G_DATE      = 0,
     G_SLIP_NO   = 1,
     G_REF_NO    = 2,
     G_SEQ       = 3,
     G_REQ_ITEM  = 4,
     G_RTN_ITEM  = 5,
	 G_REQ_QTY	 = 6,
	 G_REQ_UOM   = 7
     G_RTN_QTY   = 8,
     G_RTN_UOM   = 9,
	 G_UPRICE	 = 10,	
	 G_ITEM_AMT  = 11,
	 G_TAX_RATE  = 12,
	 G_TAX_AMT   = 13,
	 G_TOTAL_AMT = 14,
	 G_SUPPLIER	 = 15,    
     G_WH    	 = 16,     
     G_PL    	 = 17,     
     G_REMARK    = 18;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    //----------------    
    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn='Y' order by wh_id ")%>||";   
        lstWH.SetDataText(data);
        lstWH.value = '' ;		    	 
             
        grdDetail.GetGridControl().MergeCells  = 2 ;	
        grdDetail.GetGridControl().MergeCol(0) = true ;	
        grdDetail.GetGridControl().MergeCol(1) = true ;   	
        grdDetail.GetGridControl().MergeCol(2) = true ;	
        grdDetail.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdDetail.GetGridControl();
        ctrl.ColFormat(G_RTN_QTY) = "###,###,###.###" ;   
		ctrl.ColFormat(G_REQ_QTY) = "###,###,###.###" ; 
		
		ctrl.ColFormat(G_UPRICE)    = "###,###,###.##" ;
		ctrl.ColFormat(G_ITEM_AMT)  = "###,###,###.##" ;
		ctrl.ColFormat(G_TAX_RATE)  = "###,###,###" ;
		ctrl.ColFormat(G_TAX_AMT)   = "###,###,###.##" ;
		ctrl.ColFormat(G_TOTAL_AMT) = "###,###,###.##" ;    
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Detail':
            data_bias00170.Call("SELECT");
        break;     
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bias00170' :
			    if ( grdDetail.rows > 1 )
		        {      
		            grdDetail.SetCellBold( 1, G_REF_NO,   grdDetail.rows-1, G_REF_NO,   true);      
		            grdDetail.SetCellBold( 1, G_REQ_ITEM, grdDetail.rows-1, G_REQ_ITEM, true);
					
		            grdDetail.SetCellBold( 1, G_RTN_QTY,   grdDetail.rows-1, G_RTN_QTY,   true); 		 
					grdDetail.SetCellBold( 1, G_TOTAL_AMT, grdDetail.rows-1, G_TOTAL_AMT, true); 		            
		            		            
		            grdDetail.Subtotal( 0, 2, -1, '6!8!11!13!14');
		            
		        }    
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport(pos)
{         
	switch(pos)
	{
		case '1' :
		
			var url =System.RootURL + '/reports/bi/as/rpt_bias00170.aspx?p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_wh_pk='+ lstWH.value +'&p_supplier='+ txtSupplier.text +'&p_item='+txtItem.text;
			window.open(url); 
		
		break;               
    }   
} 
 //===============================================================

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bias00170" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00170" > 
                <input bind="grdDetail" >                    
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                                    
					<input bind="lstWH" />
					<input bind="txtSupplier" />
					<input bind="txtItem" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>     
    <!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">            
			<td style="width: 5%" align="right">
				Date
			</td>
			<td style="width: 15%; white-space: nowrap">
				<gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
				~
				<gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
			</td>
			<td style="width: 5%; white-space: nowrap" align="right">
				Out W/H
			</td>
			<td style="width: 20%; white-space: nowrap">
				<gw:list id="lstWH" styles="width:100%" onchange="OnSearch('Detail')"/>	
			</td>
			<td style="width: 5%; white-space: nowrap" align="right">
				Supplier
			</td>
			<td style="width: 20%; white-space: nowrap">
				<gw:textbox id="txtSupplier" styles="width:100%" onenterkey="OnSearch('Detail')" />	
			</td>						
			<td style="width: 5%" align="right">
				Item
			</td>
			<td style="width: 15%; white-space: nowrap">
				<gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
			</td>
			<td style="width: 8%"></td>  
			<td >
				<gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
			</td> 
			<td >
				<gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport('1')" />
			</td>			
        </tr>
        <tr style="height: 98%">
            <td colspan=20 >
                <gw:grid id='grdDetail' header='Rtn Date|Slip No|Ref No|Seq|Req Item|Rtn Item|Req Qty|UOM|Rtn Qty|UOM|U/Price|Item Amt|Tax (%)|Tax Amt|Total Amt|Supplier|W/H|P/L|Remark'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|0|0|1|0|0|3|1|3|1|3|3|3|3|3|0|0|0|0'
                    check='||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|1200|1200|800|4000|4000|1500|800|1500|800|1200|1500|1200|1500|1500|2000|2000|2000|1000'
                    sorting='T' styles='width:100%; height:100%' />                 
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
