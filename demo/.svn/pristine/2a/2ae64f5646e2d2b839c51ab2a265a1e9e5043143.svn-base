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

var 
	G_DIA_DIEM		= 0,
	G_W1_SUAT_AN	= 1,	
	G_W1_DOANH_THU	= 2,	
	G_W1_XUAT_HANG	= 3,
	G_W1_TI_LE_XH	= 4,	
	G_W2_SUAT_AN	= 5,	
	G_W2_DOANH_THU	= 6,	
	G_W2_XUAT_HANG	= 7,
	G_W2_TI_LE_XH	= 8,
	G_DF_SUAT_AN	= 9,	
	G_DF_DOANH_THU	= 10,	
	G_DF_XUAT_HANG	= 11,
	G_DF_TI_LE_XH	= 12;

 //============================================================================
 function BodyInit() 
 {
    System.Translate(document); 
	
    var data;           
		
	data = "<%=ESysLib.SetListDataSQL("select pk,branch_id || ' * '|| branch_name from tlg_co_dl_branch a where del_if=0 order by branch_id" )%>||SELECT ALL";    
    lstBranch.SetDataText(data);
	
	//-------------------------
	
	dtFrom.SetDataText(System.AddDate(dtFrom.GetData(), -13));
    //---------------------------- 
	
	var ctrl = grdDetail.GetGridControl();       
    
	ctrl.ColFormat(1) = "###,###,###" ;
	ctrl.ColFormat(2) = "###,###,###" ; 
	ctrl.ColFormat(3) = "###,###,###" ; 
	ctrl.ColFormat(4) = "###,###,###.##" ; 
	ctrl.ColFormat(5) = "###,###,###" ; 
	ctrl.ColFormat(6) = "###,###,###" ; 
	ctrl.ColFormat(7) = "###,###,###" ; 
	ctrl.ColFormat(8) = "###,###,###.##" ;
	ctrl.ColFormat(9) = "###,###,###" ; 
	ctrl.ColFormat(10)= "###,###,###" ;  	
	ctrl.ColFormat(11)= "###,###,###" ;
	ctrl.ColFormat(12)= "###,###,###.##" ;
	
	pro_bico30030_1.Call();
	
 }
 //============================================================================    
 function OnReport(pos)
 {
    switch(pos)
    {
        case 'FOSE01':
            var url =System.RootURL + '/reports/fe/04/rpt_bico30030_FOSE01.aspx?wh_type=' + lstWHType.value + '&wh_pk=' + lstBranch.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value ;
            window.open(url, "_blank");                
        break;	
		
		case 'FOSE02':
            var url =System.RootURL + '/reports/fe/04/rpt_bico30030_FOSE02.aspx?wh_type=' + lstWHType.value + '&wh_pk=' + lstBranch.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value ;
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
			    data_bico30030.Call('SELECT');
			break; 		
        }
    }
 //============================================================================    
	function OnDataReceive(obj)	
	{
		switch(obj.id)
		{
			case 'data_bico30030':
				if ( grdDetail.rows > 1 )
				{
					var fg = grdDetail.GetGridControl();
					
					fg.FixedRows  = 2 ;
					fg.MergeCells = 5 ;
					
					fg.MergeCol(G_DIA_DIEM)  	= true;	
					
					fg.Cell(0, 0, G_DIA_DIEM,  1, G_DIA_DIEM  ) 	= "Cost Center";					 
					
					fg.MergeRow(0) = true;
													
					fg.Cell( 0, 0, G_W1_SUAT_AN, 0, G_W1_TI_LE_XH ) = txtWeek01.text ;
					fg.Cell( 0, 1, G_W1_SUAT_AN, 	1 )  = "Sale Qty" ;
					fg.Cell( 0, 1, G_W1_DOANH_THU,  1 )	 = "Sale Amount" ;
					fg.Cell( 0, 1, G_W1_XUAT_HANG,  1 )	 = "Material" ;
					fg.Cell( 0, 1, G_W1_TI_LE_XH,   1 )	 = "Mat %" ;

					fg.Cell( 0, 0, G_W2_SUAT_AN, 0, G_W2_TI_LE_XH ) = txtWeek02.text ;
					fg.Cell( 0, 1, G_W2_SUAT_AN, 	1 )  = "Sale Qty" ;
					fg.Cell( 0, 1, G_W2_DOANH_THU,  1 )	 = "Sale Amount" ;
					fg.Cell( 0, 1, G_W2_XUAT_HANG,  1 )	 = "Material" ;
					fg.Cell( 0, 1, G_W2_TI_LE_XH,   1 )	 = "Mat %" ;
					
					fg.Cell( 0, 0, G_DF_SUAT_AN, 0, G_DF_TI_LE_XH ) = "Diff";
					fg.Cell( 0, 1, G_DF_SUAT_AN, 	1 )  = "Sale Qty" ;
					fg.Cell( 0, 1, G_DF_DOANH_THU,  1 )	 = "Sale Amount" ;
					fg.Cell( 0, 1, G_DF_XUAT_HANG,  1 )	 = "Material" ;
					fg.Cell( 0, 1, G_DF_TI_LE_XH,   1 )	 = "Mat %" ;
					
					grdDetail.Subtotal( 0, 2, -1, '1!2!3!5!6!7!9!10!11','###,###,###');					
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
					var path = System.RootURL + '/form/fe/04/bico30031.aspx';
					var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				 
		break; 	
	}
 }
 
 //============================================================================ 

 
</script>

<body>
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_bico30030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico30030_1" > 
                <input>
                    <input bind="dtFrom" />
                </input> 
                <output>
                    <output bind="txtWeek01" />
                    <output bind="txtWeek02" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
			
	<!------------------------------------------------------------------>
    <gw:data id="data_bico30030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid"   function = "<%=l_user%>lg_sel_bico30030"   > 
                <input >						 
					<input bind="lstBranch" />
					<input bind="dtFrom" />				 				
					
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
			                           
			                        </td>
			                        <td style="width: 5%" align="left" >
			                            
			                        </td>
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 20%; white-space: nowrap" align="left" >
			                            <gw:datebox id="dtFrom" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" onchange="pro_bico30030_1.Call();" />                                              
								  		 
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
header='Branch|Sale Qty|Sale Amount|Material|Mat %|Sale Qty|Sale Amount|Material|Mat %|Sale Qty|Sale Amount|Material|Mat %'
format='0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='1|3|3|3|3|3|3|3|3|3|3|3|3'
check='||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='2000|1500|1500|1500|1000|1500|1500|1500|1000|1500|1500|1500|1000'
sorting='T'
styles='width:100%; height:100%'
/>
						 
						 </td>
                    </tr>   
					 
                    
					 
                     			
                </table>
             
</body>
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />

<gw:textbox id="txtWeek01" styles='width:100%;display:none' />
<gw:textbox id="txtWeek02" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
