<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>P/R CHECKING</title>
</head>
<%  
    CtlLib.SetUser("SALE")
    Dim l_user As String
    l_user = "SALE."
%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
    var  G1_TLG_PO_PR_D_PK  = 0,      
         G1_DEPT            = 1,
         G1_REQ_DATE        = 2,
	     G1_PR_NO           = 3,
         G1_STATUS          = 4,     
         G1_SEQ             = 5,
         G1_ITEM_CODE       = 6,
         G1_ITEM_NAME       = 7,
         G1_REQ_QTY         = 8,
	     G1_UOM             = 9, 
         G1_UPRICE          = 10,
         G1_ITEM_AMT        = 11,
         G1_TAX_RATE        = 12,
         G1_TAX_AMT         = 13,
         G1_TOTAL_AMT       = 14,
         G1_PO_QTY          = 15,
		 G1_PO_PRICE		= 16,
		 G1_PO_AMT			= 17,
         G1_TI_QTY          = 18,
         G1_REMARK          = 19,
		 G1_CRT_BY			= 20,
	     G1_APPROVE		    = 21,
	     G1_CANCEL		    = 22;
  
 //=========================================================================
 function BodyInit()
 {
    System.Translate(document);
      //---------------------- 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
      //----------------------
      BindingDataList();
      OnFormatGrid();
      //----------------------
      OnChangeTab();
      //----------------------      
 } 
 //=========================================================================
 function BindingDataList()
 {
        var data ;      
		
		data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
        lstDept.SetDataText(data);
        lstDept.value = ""; 
		
        data = "data|1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL||"; 
        lstStatus.SetDataText(data);
        lstStatus.value = "";               
 }        
 
 //=========================================================================
 function OnFormatGrid()
 {
    var trl ;
    
    grdPR.GetGridControl().Cell( 7, 0, G1_STATUS, 0, G1_STATUS) = 0x3300cc;
    //--------------------------------------------------------
      grdPR.GetGridControl().MergeCells  = 2 ;	
      grdPR.GetGridControl().MergeCol(0) = true ;	
      grdPR.GetGridControl().MergeCol(1) = true ;   	
      grdPR.GetGridControl().MergeCol(2) = true ;	
      grdPR.GetGridControl().MergeCol(3) = true ;	
      grdPR.GetGridControl().MergeCol(4) = true ;		
      grdPR.GetGridControl().MergeCol(5) = true ;	
      grdPR.GetGridControl().MergeCol(6) = true ;	
      grdPR.GetGridControl().MergeCol(7) = true ;   	
      grdPR.GetGridControl().MergeCol(8) = true ;	
      grdPR.GetGridControl().MergeCol(9) = true ;	
      grdPR.GetGridControl().MergeCol(10) = true ;		
      grdPR.GetGridControl().MergeCol(11) = true ;	
    //--------------------------------------------------------
    
      trl = grdPR.GetGridControl();
    
      trl.ColFormat(G1_REQ_QTY)   = "###,###,###.##";
      trl.ColFormat(G1_UPRICE)    = "###,###,###.##";
      trl.ColFormat(G1_ITEM_AMT)  = "###,###,###";
      trl.ColFormat(G1_TAX_RATE)  = "###,###,###";
      trl.ColFormat(G1_TAX_AMT)   = "###,###,###";
	  trl.ColFormat(G1_TOTAL_AMT) = "###,###,###";
      trl.ColFormat(G1_PO_QTY)    = "###,###,###.##";
      trl.ColFormat(G1_PO_PRICE)  = "###,###,###.##";
	  trl.ColFormat(G1_PO_AMT)    = "###,###,###";
      trl.ColFormat(G1_TI_QTY)    = "###,###,###.##";
	  	 

    //--------------------------------------------------------
               
 }
//=========================================================================
 function OnSearch(pos)
 {
        switch (pos)
        {
	        case '1':		    
	            data_epbp00090.Call("SELECT");		    
            break;            	       
        }                 
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00090' :
                if ( grdPR.rows > 1 )
                {
                    grdPR.SetCellBold( 1, G1_PR_NO,     grdPR.rows - 1, G1_PR_NO,     true);
                    grdPR.SetCellBold( 1, G1_ITEM_CODE, grdPR.rows - 1, G1_ITEM_CODE, true);

					for (i = 1; i < grdPR.rows; i++) 
					{
						if ( Number(grdPR.GetGridData(i, G1_REQ_QTY)) > Number(grdPR.GetGridData(i, G1_PO_QTY)) ) 
						{
							grdPR.SetCellFontColor(i, G1_ITEM_CODE, i, G1_REMARK, 0x3300cc);
						}						 
					}
					
					grdPR.Subtotal(0, 2, -1, '8!11!13!14!15!17!18');
                }                 
            break;
               
      }      
}            
//=========================================================================
function OnPopup(pos)
{
	switch(pos)
	{
		case 'Report':			 
			 
		    var path = System.RootURL + '/standard/formsep/bp/epbp00093.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	 	        	        
		break;     
	}
} 

//============================================================================= 
function OnReport(pos)
{    
	switch(pos)
	{
		case '1' :
			var url = System.RootURL + "/standard/reports/ep/bp/rpt_epbp00091.aspx?p_dept_pk=" + lstDept.value + "&p_search_no=" + txtSearchNo.text  + "&p_from_date=" + dtFrom.value + "&p_to_date=" + dtTo.value;
			System.OpenTargetPage(url); 		
		break;				
	}	
} 
 
//=========================================================================
function OnSelect()
{
    if(grdPR.col == G1_PO_QTY)
    {
        var path   = System.RootURL + '/standard/formsep/bp/epbp00091.aspx?p_tlg_po_pr_d_pk=' + grdPR.GetGridData( grdPR.row, G1_TLG_PO_PR_D_PK ) + "&p_req_dt=" + grdPR.GetGridData( grdPR.row, G1_REQ_DATE )  + "&p_ref_no=" + grdPR.GetGridData( grdPR.row, G1_PR_NO );
        var object = System.OpenModal( path ,800 , 350 ,  'resizable:yes;status:yes');
    }
    else if(grdPR.col == G1_TI_QTY)
    {
        var path   = System.RootURL + '/standard/formsep/bp/epbp00092.aspx?p_tlg_po_pr_d_pk=' + grdPR.GetGridData( grdPR.row, G1_TLG_PO_PR_D_PK ) + "&p_req_dt=" + grdPR.GetGridData( grdPR.row, G1_REQ_DATE )  + "&p_ref_no=" + grdPR.GetGridData( grdPR.row, G1_PR_NO );
        var object = System.OpenModal( path ,800 , 350 ,  'resizable:yes;status:yes');        
    }
}
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00090" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod"  function="st_lg_sel_epbp00090" >
                <input  bind="grdPR">
					<input bind="lstStatus" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />                    
                    <input bind="lstDept" />
                    <input bind="txtSearchNo" />
                </input> 
                <output bind="grdPR" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td>
				<td style="width: 10%; white-space: nowrap">
                    <gw:list id="lstStatus" styles="width: 100" onchange="OnSearch('1')" /> 
                </td>				
                <td align="right" style="width: 5%; white-space: nowrap">
                    Date
                </td>
                <td style="width: 20%; white-space: nowrap">
                    <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                    ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                </td>
                <td style="width: 5%" align="right">
                    Dept
                </td>
                <td style="width: 30%" align="right">
                    <gw:list id="lstDept" styles="width: 100%" onchange="OnSearch('1')" />
                </td>
                <td style="width: 5%" align="right">
                    No
                </td>
                <td style="width: 15%" align="right">
                    <gw:textbox id="txtSearchNo" styles="width:100%" onenterkey="OnSearch('1')" />
                </td>
				<td style="width: 6%; white-space: nowrap" align="right">                    
                </td>
                <td style="width: 1%; white-space: nowrap" align="right">
                    <gw:button img="select" alt="Select" id="btnSelect1" onclick="OnSelect()" />
                </td>
				<td style="width: 1%" align="right">
					<gw:button img="excel" alt="Excel" id="btnExcel" onclick="OnPopup('Report')" />
                </td>
                <td style="width: 1%" align="right">
                    <gw:button id="ibtnPopup" img="P/R Entry" alt="Create MR Entry" text='P/R Entry' onclick="OnPopup()" />
                </td>
                <td style="width: 1%" align="right">
                    <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('1')" />
                </td>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="14">
                <gw:grid id='grdPR' header='_tlg_po_pr_d_pk|Dept|Req Date|P/R No|Status|Seq|Item Code|Item Name|Req Qty|UOM|U/Price|Item Amount|Tax(%)|Tax Amount|Total Amount|P/O Qty|U/Price|P/O Amount|T/I Qty|Remark|Crt|Approve|Cancel'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|1|1|0|0|3|1|3|3|3|3|3|3|3|3|3|0|0|0|0'
                    defaults='||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|1200|1200|1200|800|1500|3000|1300|800|1200|1300|1000|1300|1300|1200|1200|1300|1200|2000|2000|2000|2000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
