<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>PURCHASE ORDER REVISION CHECKING</title>
</head>

<script>
 
 var G_MASTER_PK	= 0,
     G_SLIP_NO		= 1,
	 G_REV_DATE		= 2,
	 G_CUSTOMER     = 3
	 G_PROD_APP     = 4,
	 G_M_REF_NO		= 5,
	 G_STATUS		= 6, 
	 G_DETAIL_PK	= 7, 
	 G_SEQ			= 8, 
	 G_REV_TYPE		= 9, 
	 G_D_REF_NO		= 10,
	 G_DESC_01		= 11,
	 G_DESC_02		= 12,
	 G_DESC_03		= 13,
	 G_COLUMN		= 14,
	 G_OLD_ITEM		= 15,
	 G_NEW_ITEM		= 16,
	 G_REMARK		= 17;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------
    FormatGrid();
    //----------------    
 }
 //===============================================================

 function FormatGrid()
 {
        var data="";
		//----------------------------------------------
		data = "DATA|1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL||";
		lstStatus.SetDataText(data);
		lstStatus.value = '';
		
		lstDateType.SetDataText('DATA|1|Revision DT|2|Prod Approved DT');
             
        grdDetail.GetGridControl().MergeCells  = 2 ;	
        grdDetail.GetGridControl().MergeCol(0) = true ;	
        grdDetail.GetGridControl().MergeCol(1) = true ;   	
        grdDetail.GetGridControl().MergeCol(2) = true ;	
		grdDetail.GetGridControl().MergeCol(3) = true ;
		grdDetail.GetGridControl().MergeCol(4) = true ;
        //------------      
		
		grdDetail.GetGridControl().Cell( 7, 0, G_STATUS, 0, G_STATUS )     = 0x3300cc;
		grdDetail.GetGridControl().Cell( 7, 0, G_OLD_ITEM, 0, G_NEW_ITEM ) = 0x3300cc;
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Detail':
            data_epbp00260.Call("SELECT");
        break;      
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_epbp00260' :
			    if ( grdDetail.rows > 1 )
		        {            
		            grdDetail.SetCellBold( 1, G_SLIP_NO, grdDetail.rows-1, G_SLIP_NO, true);	
					
					grdDetail.SetCellBold( 1, G_D_REF_NO, grdDetail.rows - 1, G_D_REF_NO, true);				
				    grdDetail.SetCellBold( 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM, true);		
							
					grdDetail.GetGridControl().Cell( 7, 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM ) = 0x3300cc;
					
					var p_rev_pk;
					for ( var i=1; i<grdDetail.rows; i++ )
		            {
		                if ( p_rev_pk != grdDetail.GetGridData( i, G_MASTER_PK) )
		                {
		                    p_rev_pk = grdDetail.GetGridData( i, G_MASTER_PK);
		                
		                    while ( grdDetail.rows > i && p_rev_pk == grdDetail.GetGridData( i, G_MASTER_PK))
		                    {
		                        grdDetail.SetCellBgColor( i, 1, i, grdDetail.cols - 1, 0xCCFFFF );                             
		                        i++;
		                    }
		                    
		                    if ( grdDetail.rows > i )
		                    {
		                        p_rev_pk = grdDetail.GetGridData( i, G_MASTER_PK);
		                    }                           
		                }                    
		            }  	            		            
		        }    
            break;           	            
      }	 
 }
 //===============================================================
 
function OnReport()
{           
      var url =System.RootURL + '/standard/reports/ds/re/rpt_epbp00260.aspx?p_from_date='+ dtFrom.value + '&p_to_date=' + dtTo.value + '&p_status=' + lstStatus.value +'&p_item=' + txtSearchNo.text ;
      System.OpenTargetPage(url);   
}
 
 //=================================================================
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00260" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00260" > 
                <input bind="grdDetail" >
                    <input bind="lstDateType" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />   
					<input bind="lstStatus" />             
                    <input bind="txtSearchNo" />                    
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>     
    <!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 15%" align="right">
                            <gw:list id="lstDateType" styles='width:100%;' /> 
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:textbox id="txtSearchNo" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
						<td align="right" style="white-space: nowrap; width: 5%">
                            Status 
                        </td>
                        <td align="right" style="white-space: nowrap; width: 15%">
                            <gw:list id="lstStatus" styles='width:100%;' onchange="OnSearch('Detail')"/>
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">                       
                        </td>                       						
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="2">                
					<gw:grid id='grdDetail'
					header='_MASTER_PK|Slip No|Rev Date|Customer|Prod Date|Ref No|Status|_DETAIL_PK|Seq|Rev Type|Ref No|Desc 01|Desc 02|Desc 03|Column|Old Item|New Item|Remark|Create|Sale Approve|Prod Approve|Sale Cancel|Prod Cancel'
					format='0|0|4|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					aligns='0|0|1|0|1|0|1|0|1|0|0|1|1|1|0|0|0|0|0|0|0|0|0'
					check='||||||||||||||||||||||'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					widths='0|1200|1200|2000|1200|1500|1500|0|800|1500|1500|1200|1200|1200|1500|2500|2500|1000|2500|2500|2500|2500|2500'
					sorting='T'
					acceptnulldate='true'
					styles='width:100%; height:100%'
					/>                 
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
