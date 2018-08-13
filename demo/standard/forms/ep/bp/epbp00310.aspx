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
    
 var G_TLG_PO_DEPT_PK  = 0,    
     G_DEPT_NAME       = 1,
	 G_REQ_DATE        = 2,
	 G_PR_NO		   = 3,
	 G_SEQ             = 4,
     G_TLG_IT_ITEM_PK  = 5,
     G_ITEM_CODE       = 6,
     G_ITEM_NAME       = 7,
     G_REQ_UOM         = 8,
     G_REQ_QTY         = 9,
     G_PO_QTY          = 10,
     G_IN_QTY          = 11, 
	 G_IN_BAL		   = 12,
     G_TR_QTY          = 13,
     G_OUT_QTY         = 14,
	 G_OUT_BAL         = 15,
	 G_PR_D_PK		   = 16;
   
 //=========================================================================
 function BodyInit()
 {
      System.Translate(document);
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
	  
	  ctr.ColFormat(G_REQ_QTY) = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G_PO_QTY)  = "#,###,###,###,###,###.##";  
      ctr.ColFormat(G_IN_QTY)  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G_IN_BAL)  = "#,###,###,###,###,###.##";    
	  ctr.ColFormat(G_TR_QTY)  = "#,###,###,###,###,###.##";
	  ctr.ColFormat(G_OUT_QTY) = "#,###,###,###,###,###.##";
	  ctr.ColFormat(G_OUT_BAL) = "#,###,###,###,###,###.##";
	 //--------DEPT 
	  var data;
	  
	  data = "<%=CtlLib.SetListDataSQL("select pk, DEPT_ID || ' * ' || DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||";       
      lstDept.SetDataText(data);
      lstDept.value = '';
 }
//=========================================================================
 function OnSearch(pos)
 {
 		switch(pos)
		{
			case 'DETAIL' :
				data_epbp00310.Call("SELECT");
			break;
		}        	    	   		                           
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00310' :      
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_CODE, true);	
					
					grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_NAME, 0xCCFFFF );
					
					grdDetail.SetCellBgColor( 1, G_PO_QTY, grdDetail.rows-1, G_IN_BAL,  0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_TR_QTY, grdDetail.rows-1, G_OUT_BAL, 0xFFFFCC );		
					
					grdDetail.GetGridControl().Cell( 7, 0, G_REQ_QTY, grdDetail.rows - 1, G_REQ_QTY)  = 0x3300cc; 
					grdDetail.GetGridControl().Cell( 7, 1, G_IN_BAL,  grdDetail.rows - 1, G_IN_BAL )  = 0x3300cc; 
					grdDetail.GetGridControl().Cell( 7, 1, G_OUT_BAL, grdDetail.rows - 1, G_OUT_BAL ) = 0x3300cc;		 										
					
					grdDetail.Subtotal( 0, 2,-1, '9!10!11!12!13!14!15');
                }                 
            break;             
      }      
}   
//=========================================================================
function OnPopUp(pos)
{
	switch (pos)
	{
		case 'DETAIL':
			if ( grdDetail.row > 0 )
			{
				if ( grdDetail.col == G_PO_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00311.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
				}
				else if ( grdDetail.col == G_IN_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00312.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');
				}
				else if ( grdDetail.col == G_TR_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00313.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');
				}
				else if ( grdDetail.col == G_OUT_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00314.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');
				}												
			}	
		break;
	}	 
}        
//========================================================================= 
function OnReport()
{
	var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00310.aspx?p_from_dt="+dtFrom.value+"&p_to_dt="+dtTo.value+"&p_dept="+lstDept.value+"&p_item="+txtItem.text+"&p_in_bal="+chkInBal.value+"&p_out_bal="+chkOutBal.value; 
	System.OpenTargetPage(url); 
}
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00310" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="st_lg_SEL_EPBP00310" >
                <input  bind="grdDetail">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />                    
                    <input bind="lstDept" />
                    <input bind="txtItem" />
					<input bind="chkInBal" />
					<input bind="chkOutBal" />
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
                        <td style="width: 15%" align="right">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Dept
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:list id="lstDept" styles="width:100%" onclick="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 10%" align="center">
							<gw:checkbox id="chkInBal" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch('DETAIL')">
								In Bal
							</gw:checkbox>
                        </td>
						<td style="width: 10%" align="center">
							<gw:checkbox id="chkOutBal" styles="color:red" defaultvalue="Y|N" value="Y" onclick="OnSearch('DETAIL')">
								Out Bal
							</gw:checkbox>
                        </td>
                        <td>
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>
						<td style="width: 1%" align="right">
							<gw:button img="select" alt="Select" id="btnSelect1" onclick="OnPopUp('DETAIL')" />
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdDetail' 
					header='_dept_pk|Dept Name|Req Date|P/R No|Seq|_tlg_it_item_pk|Item Code|Item Name|UOM|Req Qty|P/O Qty|In Qty|In Bal|Tr Qty|Out Qty|Out Bal|_PO_PR_PK'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|1|0|0|0|1|3|3|3|3|3|3|3|0' 
					check='|||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|2500|1200|1500|800|0|1500|3000|800|1200|1200|1200|1200|1200|1200|1200|0'
                    sorting='T' styles='width:100%; height:100%' acceptnulldate="T"/>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
