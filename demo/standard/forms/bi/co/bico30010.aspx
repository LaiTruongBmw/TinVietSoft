<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Reports 2</title>
</head>

 
<script type="text/javascript">

var G_NGAY		= 0,
	G_DIA_DIEM	= 1,	 
	G_DOANH_THU	= 2,	
	G_NHAP_HANG	= 3,
	G_TI_LE_NH	= 4,
	G_XUAT_NVL	= 5,
	G_XUAT_PTP  = 6,
	G_XUAT_TOTAL= 7,
	G_TI_LE_XH	= 8,	
	G_KHAC_NHAU = 9,
	G_TI_LE_KHAC= 10;

 //============================================================================
 function BodyInit() 
 {
    System.Translate(document); 
	
    var data;           
		
	data = "<%=ESysLib.SetListDataSQL("select pk,branch_id || ' * '|| branch_name from tlg_co_dl_branch a where del_if=0 order by branch_id" )%>||SELECT ALL";    
    lstBranch.SetDataText(data);
	
	var ctrl = grdDetail.GetGridControl();       
    
	ctrl.ColFormat(2) = "###,###,###" ; 
	ctrl.ColFormat(3) = "###,###,###" ; 
	ctrl.ColFormat(4) = "###,###,###.##" ; 
	ctrl.ColFormat(5) = "###,###,###" ; 
	ctrl.ColFormat(6) = "###,###,###" ; 
	ctrl.ColFormat(7) = "###,###,###" ; 
	ctrl.ColFormat(8) = "###,###,###.##" ;
	ctrl.ColFormat(9) = "###,###,###" ; 
	ctrl.ColFormat(10)= "###,###,###.##" ;  	
	
	pro_bico30010_1.Call();
 }
 //============================================================================    
 function OnReport(pos)
 {
    switch(pos)
    {
        case 'FOSE01':
            var url =System.RootURL + '/reports/fe/04/rpt_bico30010_FOSE01.aspx?wh_type=' + lstWHType.value + '&wh_pk=' + lstBranch.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value ;
            window.open(url, "_blank");                
        break;	
		
		case 'FOSE02':
            var url =System.RootURL + '/reports/fe/04/rpt_bico30010_FOSE02.aspx?wh_type=' + lstWHType.value + '&wh_pk=' + lstBranch.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value ;
            window.open(url, "_blank");                
        break;
    } 
 }
 
   //==============================================================================
    function OnSearch(objV)
    {    
        switch(objV)
        { 
	        case 'DETAIL':
			    data_bico30010.Call('SELECT');
			break; 		
        }
    }
 //============================================================================    
	function OnDataReceive(obj)	
	{
		switch(obj.id)
		{
			case 'data_bico30010':
				if ( grdDetail.rows > 1 )
				{
					var fg = grdDetail.GetGridControl();
					
					fg.FixedRows  = 2 ;
					fg.MergeCells = 5 ;
					
					fg.MergeCol(G_NGAY)  		= true;	
					fg.MergeCol(G_DIA_DIEM)  	= true;	
					fg.MergeCol(G_DOANH_THU)  	= true;	
					
					fg.Cell(0, 0, G_NGAY,  1, G_NGAY  ) 			= "Date";
					fg.Cell(0, 0, G_DIA_DIEM,  1, G_DIA_DIEM  ) 	= "Cost Center";					 
					fg.Cell(0, 0, G_DOANH_THU,  1, G_DOANH_THU  ) 	= "Revenue";
					
					fg.MergeRow(0) = true;
													
					fg.Cell( 0, 0, G_NHAP_HANG, 0, G_TI_LE_NH ) = "Income";
					fg.Cell( 0, 1, G_NHAP_HANG, 1 )  = "Amount" ;
					fg.Cell( 0, 1, G_TI_LE_NH, 1 )	 = "Ratio %" ;

					fg.Cell( 0, 0, G_XUAT_NVL, 0, G_TI_LE_XH ) = "Outgo";
					
					fg.Cell( 0, 1, G_XUAT_NVL, 1 )	 = "Material" ;
					fg.Cell( 0, 1, G_XUAT_PTP, 1 )	 = "Sub-Material" ;
					fg.Cell( 0, 1, G_XUAT_TOTAL, 1 ) = "Total" ;
					
					fg.Cell( 0, 1, G_TI_LE_XH, 1 )	 = "Ratio %" ;	
					
					fg.Cell( 0, 0, G_KHAC_NHAU, 0, G_TI_LE_KHAC ) = "Difference";
					fg.Cell( 0, 1, G_KHAC_NHAU, 1 )  = "Amount" ;
					fg.Cell( 0, 1, G_TI_LE_KHAC, 1 ) = "Ratio %" ;
														
					grdDetail.SetCellBgColor( 2, G_DOANH_THU, 	grdDetail.rows - 1, G_DOANH_THU,  0xFFFFCC );					
					grdDetail.SetCellBgColor( 2, G_NHAP_HANG,   grdDetail.rows - 1, G_NHAP_HANG,  0xCCFFFF );
					grdDetail.SetCellBgColor( 2, G_XUAT_NVL, 	grdDetail.rows - 1, G_XUAT_TOTAL, 0xCCFFFF );					
					grdDetail.SetCellBgColor( 2, G_KHAC_NHAU,   grdDetail.rows - 1, G_KHAC_NHAU,  0xCCFFFF );	
					
					grdDetail.Subtotal( 0, 2, -1, '2!3!5!6!7!9','###,###,###');					
				}
			break;
		}
	}
	
//============================================================================  
 function OnPopUp(pos)
 {
	switch(pos)
	{
		case 'Report':			 					 
					var path = System.RootURL + '/form/fe/04/bico30011.aspx';
					var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				 
		break; 	
	}
 }
 
 //============================================================================ 

 
</script>

<body>
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_bico30010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico30010_1" > 
                <input>
                    <input bind="dtMonth" />
                </input> 
                <output>
                    <output bind="dtFrom" />
                    <output bind="dtTo" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
			
	<!------------------------------------------------------------------>
    <gw:data id="data_bico30010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid"   function = "<%=l_user%>lg_sel_bico30010"   > 
                <input >						 
					<input bind="lstBranch" />
					<input bind="dtFrom" />	
					<input bind="dtTo" />						
					
                </input> 
                 <output bind="grdDetail" />                      
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------------APPROVE CUT result----------------------------------->
   
                <table style="width: 100%; height: 100% ">
                  
                    <tr style="height: 1%">
                        <td  style="">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 5%" align="right" >
                                        Branch
                                    </td>									
									<td  style="width: 50%"  >
                                        <gw:list id="lstBranch" styles="width:100%"   />                         
                                    </td>									
                                    								
									<td style="width: 5%" align="right" >
			                            Month
			                        </td>
			                        <td style="width: 5%" align="left" >
			                            <gw:datebox id="dtMonth" text="" maxlen="10" type="month" lang="<%=Session("Lang")%>"
			                                onchange="pro_bico30010_1.Call();" />
			                        </td>
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 20%; white-space: nowrap" align="left" >
			                            <gw:datebox id="dtFrom" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
								  		~
			                            <gw:datebox id="dtTo" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
			                        </td>
									
									<td style="width: 40%"  align="right" >
                                         
                                    </td>
									
									<td style="width: 1%"  align="right" >
                                        <gw:imgbtn id="btnExcel" img="excel" alt="Report" onclick="OnPopUp('Report')" />
                                    </td>	
									
									<td style="width: 40%"  align="right" >
                                        <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                                    </td>	 
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                         <td>
						 
						<gw:grid id='grdDetail'
header='Date|Branch|Revenue|Income|Ti Le|Xuat Hang|PTP|TOTAL|Ti Le|Loi nhuan|Ti le'
format='4|0|0|0|0|0|0|0|0|0|0'
aligns='1|0|3|3|3|3|3|3|3|3|3'
check='||||||||||'
editcol='1|1|1|1|1|1|1|1|1|1|1'
widths='1400|4000|1500|1500|1000|1500|1500|1500|1000|1500|1000'
sorting='T'
styles='width:100%; height:100%'
/>
						 
						 </td>
                    </tr>   
					 
                    
					 
                     			
                </table>
             
</body>
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
