<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Sale Summary</title>
</head>

<script>
 
 var G1_CUST_PK		= 0,
 	 G1_CUST_ID		= 1,
	 G1_CUST_NAME	= 2;
	  
 var G2_SLIP_NO		= 0, 
 	 G2_OUT_DATE	= 1,
	 G2_PO_NO		= 2,
	 G2_SEQ			= 3,
	 G2_ITEM_CODE	= 4,
	 G2_ITEM_NAME	= 5,
	 G2_SIZE		= 6,
	 G2_COLOR		= 7,
	 G2_UOM			= 8,
	 G2_OUT_QTY		= 9, 
	 G2_U_PRICE		= 10,
	 G2_ITEM_AMOUNT	= 11,
	 G2_TAX_AMOUNT	= 12,
	 G2_TOTAL_AMOUNT= 13,
	 G2_CCY			= 14;
 
 var G3_CUST_ID			= 0,
 	 G3_CUST_NAME		= 1,
	 G3_SALE_TYPE		= 2,
	 G3_ITEM_AMOUNT		= 3,
	 G3_TAX_AMOUNT		= 4,
	 G3_TOTAL_AMOUNT	= 5,
	 G3_CCY				= 6;
	 
 var G4_OUT_TYPE	= 0,
 	 G4_CUST_ID		= 1,
	 G4_CUST_NAME	= 2,
	 G4_TOTAL_AMT	= 3,
	 G4_COLLECT_AMT	= 4,
	 G4_BAL_AMT		= 5,
	 G4_CCY			= 6;
	 
 var G5_CUST_ID			= 0,
 	 G5_CUST_NAME		= 1,
	 G5_MONTH    		= 2,
	 G5_ITEM_AMOUNT		= 3,
	 G5_TAX_AMOUNT		= 4,
	 G5_TOTAL_AMOUNT	= 5,
	 G5_CCY				= 6;	 
  
 //============================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }
  
 //===============================================================
 function BodyInit()
 { 
 	System.Translate(document);  // Translate to language session
 	//----------------
	var v_dt =  new Date();
	 v_year = v_dt.getFullYear()+"01";
	 dtFMonTab2.SetDataText(v_year)
    //----------------
    FormatGrid();
    //----------------  
 }
 //===============================================================

 function FormatGrid()
 {
      grdDetail.GetGridControl().ColFormat(G2_OUT_QTY)  	= "###,###,###,###,###.##";
	  grdDetail.GetGridControl().ColFormat(G2_U_PRICE) 		= "###,###,###,###,###.######";
      grdDetail.GetGridControl().ColFormat(G2_ITEM_AMOUNT)  = "###,###,###,###,###.##";
      grdDetail.GetGridControl().ColFormat(G2_TAX_AMOUNT)	= "###,###,###,###,###.##"; 
	  grdDetail.GetGridControl().ColFormat(G2_TOTAL_AMOUNT)	= "###,###,###,###,###.##";		
	  
	  grdCustomer.GetGridControl().ColFormat(G3_ITEM_AMOUNT)  = "###,###,###,###,###.##";	 
	  grdCustomer.GetGridControl().ColFormat(G3_TAX_AMOUNT)   = "###,###,###,###,###.##";	
	  grdCustomer.GetGridControl().ColFormat(G3_TOTAL_AMOUNT) = "###,###,###,###,###.##";	
	  
	  grdARBalance.GetGridControl().ColFormat(G4_TOTAL_AMT)   = "###,###,###,###,###.##";	 
	  grdARBalance.GetGridControl().ColFormat(G4_COLLECT_AMT) = "###,###,###,###,###.##";	
	  grdARBalance.GetGridControl().ColFormat(G4_BAL_AMT)     = "###,###,###,###,###.##";	
	  	          
      var  data = "DATA|01|01|02|02|03|03|04|04|05|05|06|06|07|07|08|08|09|09|10|10|11|11|12|12||All Year";    
      lstMonthTab1.SetDataText(data);  
      lstMonthTab1.value = '' ;
	  
	  data = "DATA|01|01|02|02|03|03|04|04|05|05|06|06|07|07|08|08|09|09|10|10|11|11|12|12||All Year";   
	  lstInOutTypeTab3.SetDataText(data);	
	  lstInOutTypeTab3.value = '' ;      	
	  
 }

 //===============================================================
 function OnSearch(pos)
 {
 	switch (pos)
	{
		case 'Detail_Tab1' :
			if ( grdSearch.row > 0 )
			{
				txtPartnerPK.text = grdSearch.GetGridData( grdSearch.row, G1_CUST_PK );				
				data_dsbs00240_1.Call("SELECT");
			}
			else
			{
				grdDetail.ClearData();
			}
			
		break;
		
		case 'Search_Tab1' :		 
			data_dsbs00240.Call("SELECT");
		break;
		
		case 'Detail_Tab2' :
		  	data_dsbs00240_2.Call("SELECT");
		break;
		
		case 'Detail_Tab3':
			data_dsbs00240_3.Call("SELECT");
		break;
		
		case 'Detail_Tab4':
			data_dsbs00240_4.Call("SELECT");
		break;
		
	}       
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
	  		case 'data_dsbs00240_1':
				if (grdDetail.rows >1)
				{
					grdDetail.Subtotal( 0, 2, -1, '9!11!12!13');
				}
			break;
			
            case 'data_dsbs00240_2' :
				if ( grdCustomer.rows > 1 )
				{
			  		grdCustomer.Subtotal( 0, 2, -1, '3!4!5');
				}	
            break; 
			
            case 'data_dsbs00240_3' :
				if ( grdARBalance.rows > 1 )
				{				
			  		grdARBalance.Subtotal( 0, 2, -1, '3!4!5');
				}	
            break;			 
			
			case "pro_dsbs00240":
				alert(txtReturnValue.text);
			break;		         	            
      }	 
 }
 
 
 //=================================================================
 
 function OnProcess(pos)
 {
 	switch(pos)
	{
		case 'COLLECT_REQ':
			if ( confirm("Do you want to make collection request ?") )
			{
				txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
				
				pro_dsbs00240.Call();
			}			
		break;
	}
 }
 //================================================================= 
 
 function OnReport(pos)
 {
 	switch(pos)
	{
		case 'SALE_SUM':
			var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00241.aspx?p_f_out_type='+ dtFMonTab2.value +'&p_t_out_type='+dtTMonTab2.value +'&p_partner=' + txtCustTab2.text ;
		   
           System.OpenTargetPage(url); 		
		break;
		
		case 'DEBIT':
			var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00240.aspx?p_partner_pk='+ txtPartnerPK.text 
           + '&p_out_type=' + dtYearTab1.value + lstMonthTab1.value             
           + '&p_po=' + txtPOTab1.text
           + '&p_item=' + txtItemTab1.text;
		   
           System.OpenTargetPage(url); 		
		break;
		
		case 'SALE_SUM_T4':
			var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00242.aspx?p_f_out_type='+ dtFMonTab4.value +'&p_t_out_type='+dtTMonTab4.value +'&p_partner=' + txtCustTab4.text ;		   
            System.OpenTargetPage(url); 				
		break;
	}
 }
 
 //===================================================================
</script>

<body>   
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00240_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00240_2" > 
                <input bind="grdCustomer" >
				    <input bind="dtFMonTab2" />              
				    <input bind="dtTMonTab2" /> 
					<input bind="txtCustTab2" />				
                </input>
                <output bind="grdCustomer" />
            </dso>
        </xml>
    </gw:data>
	<!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00240_3" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00240_3" > 
                <input bind="grdARBalance" >
					<input bind="dtYearTab3" />
				    <input bind="lstInOutTypeTab3" />              
					<input bind="txtCustTab3" />				
                </input>
                <output bind="grdARBalance" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00240" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00240" > 
                <input bind="grdSearch" >
				    <input bind="dtYearTab1" /> 
				    <input bind="lstMonthTab1" /> 
					<input bind="txtCustTab1" />					 				
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00240_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00240_1" > 
                <input bind="grdDetail" >
                    <input bind="txtPartnerPK" />
				    <input bind="dtYearTab1" /> 
				    <input bind="lstMonthTab1" />      
                    <input bind="txtPOTab1" />  
					<input bind="txtItemTab1" />                       				 
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00240_4" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00240_4" > 
                <input bind="grdCustomerT4" >
					<input bind="dtFMonTab4" />              
				    <input bind="dtTMonTab4" />             
					<input bind="txtCustTab4" />				
                </input>
                <output bind="grdCustomerT4" />
            </dso>
        </xml>
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00240" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00240" > 
                <input>
                     <input bind="txtPartnerPK" /> 
					 <input bind="dtYearTab1" />
					 <input bind="lstMonthTab1" />
					 <input bind="txtChargerPK" />                      
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:tab>
    <table border="1" style="width: 100%; height: 100%" name="By One Customer">
        <tr style="height: 2%">
            <td style="width: 30%" id='left' >
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Month
                        </td>
                        <td style="width: 40%; white-space: nowrap" >
                            <gw:datebox id="dtYearTab1" type="year" lang="<%=Session("Lang")%>" onchange="OnSearch('Detail_Tab1')" />
                        </td>
                        <td style="width: 40%; white-space: nowrap" >
                            <gw:list id="lstMonthTab1" styles="width:100%" onchange="OnSearch('Search_Tab1')" />                            
                        </td>
						<td style="width: 10%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 10%" align="right">
                            Cust
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="3">
                            <gw:textbox id="txtCustTab1" styles='width:100%' onenterkey="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' header='_CUST_PK|Partner ID|Partner Name' format='0|0|0'
                                aligns='0|0|0' check='||' editcol='1|1|1' widths='0|1200|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Detail_Tab1')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id='right'>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%"> 
						<td style="width: 10%">
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle()" />
						</td> 
						<td style="width: 5%">
                            P/O
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPOTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>						                      
                        <td style="width: 5%">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItemTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>						 
                        <td style="width: 20%">                            
                        </td>
						<td style="width: 9%">
							<gw:button id="idBtnCollection" img="Collection Req" text="Collection Req" onclick="OnProcess('COLLECT_REQ')" />
						</td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport('DEBIT')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <gw:grid id='grdDetail' 
								header='Slip No|Out Date|P/O No|Seq|Item Code|Item Name|Size|Color|UOM|Out Qty|U/Price|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|1|1|1|3|3|3|3|3|1' 
								check='||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='1500|1200|1500|800|1500|2500|1500|1500|800|1200|1200|1500|1500|1500|800'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="1" style="width: 100%; height: 100%" name="By All Customer"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>									
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 15%; white-space: nowrap">
			                            <gw:datebox id="dtFMonTab2" type="month" lang="<%=Session("Lang")%>"  /> ~											
			                        </td>	
			                        <td style="width: 15%" align="left">
			                             <gw:datebox id="dtTMonTab2" type="month" lang="<%=Session("Lang")%>"  />											
			                        </td>
									<td style="width: 5%">
			                            Customer
			                        </td>
			                        <td style="width: 35%">
			                            <gw:textbox id="txtCustTab2" styles='width:100%' onenterkey="OnSearch('Detail_Tab2')" />
			                        </td>			                                               
			                        <td style="width: 5%">
			                           
			                        </td>
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab2')" />
			                        </td>	
									<td style="width: 1%">
			                            <gw:button id="ibtnExcel2" img="excel" alt="Report" text="Report" onclick="OnReport('SALE_SUM')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdCustomer' header='Customer ID|Customer Name|Order Type|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|0|0|0|0|0|0' aligns='0|0|1|3|3|3|1' check='||||||' editcol='0|0|0|0|0|0|0'
                                widths='1500|4000|1500|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>                
    </table>
	<table border="1" style="width: 100%; height: 100%" name="A/R Balance"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>	
									<td style="width: 5%" align="right">Year</td>								
									<td style="width: 10%"><gw:datebox id="dtYearTab3" type="year" lang="<%=Session("Lang")%>" onchange="OnSearch('Detail_Tab3')" /></td>
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 30%; white-space: nowrap">	
										<gw:list id="lstInOutTypeTab3" styles="width:100%" onchange="OnSearch('Detail_Tab3')" />		                            
			                        </td>	
									<td style="width: 5%">
			                            Customer
			                        </td>
			                        <td style="width: 30%">
			                            <gw:textbox id="txtCustTab3" styles='width:100%' onenterkey="OnSearch('Detail_Tab3')" />
			                        </td>			                                               
			                        <td style="width: 13%">
			                            &nbsp;
			                        </td>
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch3" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab3')" />
			                        </td>	
									<td style="width: 1%">
			                            <gw:button id="ibtnExcel3" img="excel" alt="Report" text="Report" onclick="OnReport('AR_BAL')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdARBalance' header='Out Type|Customer ID|Customer Name|Total Amount|Pay Amount|Bal Amount|CCY'
                                format='0|0|0|0|0|0|0' 
								aligns='1|0|0|3|3|3|1' check='||||||' 
								editcol='0|0|0|0|0|0|0'
                                widths='1500|1500|4000|1500|1500|1500|1000' 
								sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>                
    </table>
	<table border="1" style="width: 100%; height: 100%" name="In a Period"> 
                     <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>									
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 15%; white-space: nowrap">
			                            <gw:datebox id="dtFMonTab4" type="month" lang="<%=Session("Lang")%>" /> ~											
			                        </td>	
			                        <td style="width: 15%" align="left">
			                             <gw:datebox id="dtTMonTab4" type="month" lang="<%=Session("Lang")%>"  />											
			                        </td>
									<td style="width: 5%">
			                            Customer
			                        </td>
			                        <td style="width: 35%">
			                            <gw:textbox id="txtCustTab4" styles='width:100%' onenterkey="OnSearch('Detail_Tab4')" />
			                        </td>			                                               
			                        <td style="width: 5%">			                           
			                        </td>
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch4" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab4')" />
			                        </td>	
									<td style="width: 1%">
			                            <gw:button id="ibtnExcel4" img="excel" alt="Report" text="Report" onclick="OnReport('SALE_SUM_T4')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdCustomerT4' header='Customer ID|Customer Name|Month|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|0|0|0|0|0|0' aligns='0|0|1|3|3|3|1' check='||||||' editcol='0|0|0|0|0|0|0'
                                widths='1500|4000|1500|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>                   
    </table>	
    </gw:tab>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
	<gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
	<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />	
</body>
</html>
