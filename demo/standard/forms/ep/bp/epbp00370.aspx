<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>P/R CHECKING 3</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
var G_DEPT_NAME       	= 0,
	G_DATE   	     	= 1,
	G_ITEM_PK   		= 2,
    G_ITEM_CODE       	= 3,
    G_ITEM_NAME       	= 4,
    G_PO_UOM         	= 5,
	G_PO_U_PRICE		= 6,
    G_REQ_QTY         	= 7,
    G_REQ_AMOUNT       	= 8,
	G_IN_UOM         	= 9,
	G_IN_U_PRICE		= 10,
    G_IN_QTY          	= 11, 
	G_IN_AMOUNT		   	= 12,
	G_DIFF_QTY			= 13,
	G_DIFF_AMOUNT		= 14,
	G_QUO_PO_PRICE		= 15,
    G_QUO_IN_PRICE		= 16,	
	G_PO_SUPPLIER_PK	= 17,
	G_PO_SUPPLIER_NAME	= 18,
	G_IN_SUPPLIER_PK	= 19,
	G_IN_SUPPLIER_NAME	= 20;
   
 //=========================================================================
 function BodyInit()
 {
      System.Translate(document);
	  
	  txtUserPK.text = "<%=session("USER_PK")%>";
      //---------------------- 
	  
      var now = new Date(); 
      var lmonth, ldate;
    
      ldate=dtFrom.value ;         
      ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
      dtFrom.value=ldate ;	 	 
      //----------------------  
	  
      OnFormatGrid();	  	  
 } 
  
 //=========================================================================
 function OnFormatGrid()
 {   
 	  grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;
	  grdDetail.GetGridControl().MergeCol(3) = true ;
	  grdDetail.GetGridControl().MergeCol(4) = true ;
	    
	  var ctr = grdDetail.GetGridControl(); 
	  
	  ctr.ColFormat(G_PO_U_PRICE)  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G_REQ_QTY) 	   = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G_REQ_AMOUNT)  = "#,###,###,###,###,###";  
	  ctr.ColFormat(G_IN_U_PRICE)  = "#,###,###,###,###,###.##"; 
      ctr.ColFormat(G_IN_QTY)  	   = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G_IN_AMOUNT)   = "#,###,###,###,###,###";    
	  ctr.ColFormat(G_DIFF_QTY)    = "#,###,###,###,###,###.##";
	  ctr.ColFormat(G_DIFF_AMOUNT) = "#,###,###,###,###,###";
	  ctr.ColFormat(G_QUO_PO_PRICE)= "#,###,###,###,###,###.##";
	  ctr.ColFormat(G_QUO_IN_PRICE)= "#,###,###,###,###,###.##";
	 //--------DEPT 
	var data;
	  
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
	lstWHType.SetDataText(data);
	lstWHType.value = '';
		
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y' ORDER BY wh_id  ASC" )%>||SELECT ALL";    
    lstWarehouse.SetDataText(data);
	lstWarehouse.value = '';	
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-') || ' ' || a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and a.group_type is not null connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd " )%>||SELECT ALL";       
    lstGroup.SetDataText(data);  
	
	pro_EPBP00370_1.Call();
	
 }
//=========================================================================
 function OnSearch(pos)
 {
 		switch(pos)
		{
			case 'DETAIL' :
				data_epbp00370.Call("SELECT");
			break;
		}        	    	   		                           
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00370' :      
                if ( grdDetail.rows > 1 )
                {                   
					grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_NAME, 0xCCFFFF );
					
					grdDetail.SetCellBgColor( 1, G_PO_U_PRICE, grdDetail.rows-1, G_REQ_AMOUNT, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_IN_U_PRICE, grdDetail.rows-1, G_IN_AMOUNT,  0xCCFFFF );
					
					grdDetail.GetGridControl().Cell( 7, 1, G_DIFF_QTY,  	grdDetail.rows - 1, G_DIFF_QTY	  )  = 0x3300cc; 
					grdDetail.GetGridControl().Cell( 7, 1, G_QUO_PO_PRICE,  grdDetail.rows - 1, G_QUO_IN_PRICE )  = 0x3300cc; 
					
					grdDetail.Subtotal( 1, 2,-1, '7!8!11!12!13!14');
                }                 
            break; 

				
      }      
}   
//=========================================================================
function OnPopUp(pos)
{
	switch (pos)
	{
		case 'VIEW_DETAIL':
			if ( grdDetail.row > 0 )
			{
				if ( grdDetail.col == G_PO_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00371.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
				}
				else if ( grdDetail.col == G_IN_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00372.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');
				}																		
			}	
		break;
		
		case 'Report':			 			
			var path = System.RootURL + '/standard/formsep/bp/epbp00373.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);					 
		break; 	
	}	 
} 
//====================================================
 function OnReport(para)
 {
    switch(para)
    {
 
		case 'FOSE01':
            
            var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00370_FOSE01.aspx?p_date_type=' + lstDateType.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_dept_pk=' + lstDept.value + '&p_item=' + txtItem.text + '&p_partner=' + txtPartner.text + '&p_lang=' + lstLang.value + '&p_bal_yn=' + chkBal.value + '&p_status=' + lstStatus.value;
            window.open(url, "_blank");  
			
        break;	
		
		case 'FOSE02':
		
            var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00370_FOSE02.aspx?p_date_type=' + lstDateType.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_dept_pk=' + lstDept.value + '&p_item=' + txtItem.text + '&p_partner=' + txtPartner.text + '&p_lang=' + lstLang.value + '&p_bal_yn=' + chkBal.value + '&p_status=' + lstStatus.value;
            window.open(url, "_blank");
                     
        break;

	 	
    }
 }
        
//========================================================================= 
 
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_EPBP00370" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_EPBP00370" >
                <input>
                    <input bind="lstWHType" />
                </input>
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso>
        </xml>
    </gw:data>	
	<!---------------------------------------------------------------->
    <gw:data id="pro_EPBP00370_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_EPBP00370_1" >
                <input>
                    <input bind="dtFrom" />
                    <input bind="dtTo" /> 
                </input>
                <output>
                    <output bind="lstPartner" />
                </output>
            </dso>
        </xml>
    </gw:data>		
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00370" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="st_lg_SEL_epbp00370" >
                <input  bind="grdDetail">					 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />                    
                    <input bind="lstWHType" />
					<input bind="lstWarehouse" />
					<input bind="lstGroup" />					
                    <input bind="txtItem" />
					<input bind="lstPartner" />
					<input bind="txtPartner" />						
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 40%" align="left" colspan=2 >
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="pro_EPBP00370_1.Call()" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="pro_EPBP00370_1.Call()" />
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap">
                            W/H
                        </td>
                        <td  style="width: 20%"  >
                            <gw:list id="lstWHType" styles="width:100%" onchange="pro_EPBP00370.Call()"  />                         
                        </td>									
                        <td  style="width: 20%"  >
                            <gw:list id="lstWarehouse" styles="width:100%" />                         
                        </td>
                        <td style="width: 8%" align="right">                            
                        </td>	 						 							
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPopUp('Report')" />
                        </td>						 
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>						
                    </tr>
					<tr>                         
                        <td style="width: 5%" align="right">
                            Item
                        </td>
						<td style="width: 25%" align="right">							
                            <gw:list id="lstGroup" styles="width:100%" />
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 1%" align="right">
                            Partner
                        </td>
						<td style="width: 20%" align="right">							
                            <gw:list id="lstPartner" styles="width:100%" />
                        </td>
                        <td style="width: 20%" align="right">							
                            <gw:textbox id="txtPartner" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>	
						<td style="width: 8%" align="right">                            
                        </td>						
                        <td style="width: 1%" align="right">
                            
                        </td>						 
                        <td style="width: 1%" align="right">
                            
                        </td>						
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>                				
					<gw:grid id='grdDetail' 
					header='Dept Name|Date|_item_pk|Item Code|Item Name|P/O UOM|P/O Price|P/O Qty|P/O Amount|In UOM|In Price|In Qty|In Amount|Diff Qty|Diff Amount|Quo P/O|Quo In|_supplier_pk|P/O Supplier|_in_supplier|In Supplier'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|3|3|3|1|3|3|3|3|3|3|3|0|0|0|0' 				 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2500|1200|0|1500|3000|800|1200|1200|1500|800|1200|1200|1500|1200|1500|1200|1200|0|2000|0|2000'
                    sorting='T' styles='width:100%; height:100%' acceptnulldate="T"/>
					
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
	
</body>
</html>
