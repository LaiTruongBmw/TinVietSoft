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
	G_REQ_DATE        	= 1,
	G_PR_NO		   		= 2,
	G_PR_STATUS			= 3,
	G_SEQ             	= 4,    
    G_ITEM_CODE       	= 5,
    G_ITEM_NAME       	= 6,
    G_REQ_UOM         	= 7,
    G_REQ_QTY         	= 8,
    G_PO_QTY          	= 9,
    G_IN_QTY          	= 10, 
	G_IN_BAL		   	= 11,
	G_DELI_DATE			= 12,
	G_DELI_TIME			= 13,
	G_PO_STATUS			= 14,
	G_PARTNER			= 15,
	G_REMARK			= 16,
	G_PR_D_PK			= 17;
   
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
	  
	  pro_epbp00330_5.Call();
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
	  
	 //--------DEPT 
	  var data;
	  
	  data = "<%=CtlLib.SetListDataSQL("select pk, DEPT_ID || ' * ' || DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||";       
      lstDept.SetDataText(data);
      lstDept.value = '';
	  
	  data = "DATA|1|REQ|2|DELI";
	  lstDateType.SetDataText(data);
	  lstDateType.value = 2;
	  
	  data = "DATA|1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL||";
	  lstStatus.SetDataText(data);
	  lstStatus.value = '';	  
	  
	  data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
	  lstLang.SetDataText(data);
	  lstLang.value = "<%=Session("SESSION_LANG")%>";	
	
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
					
					grdDetail.SetCellBgColor( 1, G_REQ_QTY, grdDetail.rows-1, G_IN_QTY,  0xCCFFFF );
						
					grdDetail.GetGridControl().Cell( 7, 0, G_REQ_QTY, grdDetail.rows - 1, G_REQ_QTY)  = 0x3300cc; 
					grdDetail.GetGridControl().Cell( 7, 1, G_IN_BAL,  grdDetail.rows - 1, G_IN_BAL )  = 0x3300cc; 
					
					grdDetail.Subtotal( 0, 2,-1, '8!9!10!11');
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
					var path   = System.RootURL + '/standard/formsep/bp/epbp00311.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
				}
				else if ( grdDetail.col == G_IN_QTY ) 
				{
					var path   = System.RootURL + '/standard/formsep/bp/epbp00312.aspx?p_tlg_po_pr_d_pk=' + grdDetail.GetGridData( grdDetail.row, G_PR_D_PK ) + "&p_req_dt=" + grdDetail.GetGridData( grdDetail.row, G_REQ_DATE )  + "&p_ref_no=" + grdDetail.GetGridData( grdDetail.row, G_PR_NO ) + "&p_dept_name=" + grdDetail.GetGridData( grdDetail.row, G_DEPT_NAME );
        			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');
				}																		
			}	
		break;
		
		case 'Report':			 			
			var path = System.RootURL + '/standard/formsep/bp/epbp00333.aspx';
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
            
            var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00330_FOSE01.aspx?p_date_type=' + lstDateType.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_dept_pk=' + lstDept.value + '&p_item=' + txtItem.text + '&p_partner=' + txtPartner.text + '&p_lang=' + lstLang.value + '&p_bal_yn=' + chkBal.value + '&p_status=' + lstStatus.value;
            window.open(url, "_blank");  
			
        break;	
		
		case 'FOSE02':
		
            var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00330_FOSE02.aspx?p_date_type=' + lstDateType.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_dept_pk=' + lstDept.value + '&p_item=' + txtItem.text + '&p_partner=' + txtPartner.text + '&p_lang=' + lstLang.value + '&p_bal_yn=' + chkBal.value + '&p_status=' + lstStatus.value;
            window.open(url, "_blank");
                     
        break;

		case 'FOSE03':
		
            var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00330_FOSE03.aspx?p_date_type=' + lstDateType.value + '&p_from_date=' + dtFrom.value + '&p_dept_pk=' + lstDept.value + '&p_item=' + txtItem.text + '&p_partner=' + txtPartner.text + '&p_lang=' + lstLang.value ;
            window.open(url, "_blank");
                     
        break;			
    }
 }
        
//========================================================================= 
 
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_epbp00330_5" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_epbp00330_5" >
                <input>
                    <input bind="txtUserPK" />
                </input>
                <output>
                    <output bind="lstDept" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00310" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="st_lg_SEL_EPBP00330" >
                <input  bind="grdDetail">
					<input bind="lstDateType" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />                    
                    <input bind="lstDept" />
                    <input bind="txtItem" />
					<input bind="txtPartner" />					 
					<input bind="lstLang" />
					<input bind="chkBal" />
					<input bind="lstStatus" />
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
                            <gw:list id="lstDateType" styles="width:50"  />
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
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Partner
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtPartner" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            Bal
							<gw:checkbox id="chkBal" defaultvalue="Y|N" value="N" onchange="OnSearch('DETAIL')" />
                        </td>
						<td style="width: 8%; white-space: nowrap">
                            <gw:list id="lstStatus" styles="width:50" onclick="OnSearch('DETAIL')" />
                        </td>
						<td style="width: 8%; white-space: nowrap">
                            <gw:list id="lstLang" styles="width:50" onclick="OnSearch('DETAIL')" />
                        </td>											
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPopUp('Report')" />
                        </td>
						<td style="width: 1%" align="right">
							<gw:button img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp('VIEW_DETAIL')" />
						</td>	
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>						
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdDetail' 
					header='Dept Name|Req Date|P/R No|Status|Seq|Item Code|Item Name|UOM|Req Qty|P/O Qty|In Qty|In Bal|Deli Date|Deli Time|P/O Status|Supplier|Remark|_PR_D_PK'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0' 
					aligns='0|1|0|1|1|0|0|1|3|3|3|3|1|1|1|0|0|0' 
					check='|||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2500|1200|1500|1200|800|1500|3000|800|1200|1200|1200|1200|1200|1000|1200|3000|1000|0'
                    sorting='T' styles='width:100%; height:100%' acceptnulldate="T"/>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
	
</body>
</html>
