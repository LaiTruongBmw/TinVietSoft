<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Deli Voucher / Invoice Checking</title>
</head>

<script>
 var G_ORD_DATE		= 0,
    G_SLIP_NO		= 1,
	G_CUST_ID		= 2,
	G_CUST_NAME		= 3,
	G_ITEM_CD		= 4,
	G_ITEM_NAME     = 5,
	G_UOM           = 6,
	G_ORD_QTY       = 7,
	G_PROD_QTY      = 8,
	G_OUT_QTY       = 9,
	G_BALANCE       = 10;
  
 //===============================================================
 function BodyInit()
 { 
 	System.Translate(document);  // Translate to language session

    //----------------
    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
    grdDetail.GetGridControl().ColFormat(G_ORD_QTY)  	= "###,###,###,###,###.##";
	grdDetail.GetGridControl().ColFormat(G_PROD_QTY)    = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_OUT_QTY)  	= "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_BALANCE)		= "###,###,###,###,###.##"; 
	 	
 
	grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;
	grdDetail.GetGridControl().MergeCol(3) = true ;
	grdDetail.GetGridControl().MergeCol(4) = true ;
	grdDetail.GetGridControl().MergeCol(5) = true ;
	grdDetail.GetGridControl().MergeCol(6) = true ;
	grdDetail.GetGridControl().MergeCol(7) = true ;
 }

 //===============================================================
 function OnSearch(pos)
 {
 	switch (pos)
	{
		case 'Detail' :			 
			data_dsbs00120.Call("SELECT");			 
		break;		 		
	}       
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
	  		case 'data_dsbs00120':
	  		    lblrecord.text = (grdDetail.rows -1) +' record(s)'
				if (grdDetail.rows >1)
				{				
				    grdDetail.SetCellBold( 1, G_CUST_ID,      grdDetail.rows-1, G_ITEM_NAME,      true);  
				    
					grdDetail.Subtotal( 0, 2, -1, '7!8!9!10');
				}
			break;						
      }	 
 }
 //===============================================================
 
function OnReport()
{ 
           var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00120.aspx?p_partner_pk='+ txtPartnerPK.text 
           + '&p_from_date=' + dtFrom.value 
           + '&p_to_date=' + dtTo.value 
           + '&p_po=' + txtPOTab1.text
           + '&p_item=' + txtItemTab1.text;
		   
           System.OpenTargetPage(url);  
}
 
 
 
</script>

<body>
	
	
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00120" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00120" > 
                <input bind="grdDetail" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
					<input bind="txtCust" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>

    <!--------------------------------------------------------------------------> 
	
    <table style="width: 100%; height: 100%" name="By All Customer"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>			 						
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 15%; white-space: nowrap">
			                            <gw:datebox id="dtFrom" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
								  		~
			                            <gw:datebox id="dtTo" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
			                        </td>
									
									<td style="width: 5%" align="right" >
			                            Cust
			                        </td>
			                        <td style="width: 15%">
			                            <gw:textbox id="txtCust" styles='width:100%' onenterkey="OnSearch('Detail')" />
			                        </td>
			                         <td style="width: 15%">
			                            <gw:label id="lblrecord" styles='width:100%; color:red' text="" />
			                        </td>								
									<td style="width: 3%">			                            
			                        </td>	 
			                       	 
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                             <gw:grid id='grdDetail'
                                header='Order Date|Partner ID|Partner Name|Slip No|Item Code|Item Name|UOM|Ord Qty|Prod Qty|Out Qty|Balance'
                                format='4|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|1|3|3|3|3'
                                check='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|1500|1500|2000|1500|2000|800|1500|1500|1500|1500'
                                sorting='T'
                                 styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>                
    </table>	 
 
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
	<gw:textbox id="txtDivisionPK" styles="width:100%;display:none"  />
	<!-------------------------------------------------------------------------->
</body>
</html>
