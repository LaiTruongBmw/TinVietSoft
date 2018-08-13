<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Process W/I Entry</title>
</head>

<script type="text/javascript">

    var user_pk   = "<%=Session("EMPLOYEE_PK")%>" 
    var user_name = "<%=Session("USER_NAME")%>" 
 
    var G1_LINE        = 0,
        G1_ORD01       = 1,
		G1_WP01        = 2,
        G1_ORD02       = 3,
		G1_WP02        = 4,
        G1_ORD03       = 5,
		G1_WP03        = 6,
        G1_ORD04       = 7,
		G1_WP04        = 8,
        G1_ORD05       = 9,
		G1_WP05        = 10,
        G1_ORD06       = 11,
		G1_WP06        = 12,
        G1_ORD07       = 13,
		G1_WP07        = 14,
        G1_ORD08       = 15,
		G1_WP08        = 16,
        G1_ORD09       = 17,
		G1_WP09        = 18,
        G1_ORD10       = 19,
		G1_WP10        = 20;  
		
	var G2_WP_01 = 0,
		G2_CL_01 = 1,
		G2_WP_02 = 2,
		G2_CL_02 = 3,
		G2_WP_03 = 4,
		G2_CL_03 = 5,
		G2_WP_04 = 6,
		G2_CL_04 = 7,
		G2_WP_05 = 8,
		G2_CL_05 = 9;	

//================================================================

 function BodyInit()
 {
      System.Translate(document);
     
      //----------------------------- 
      FormatGrid();
	  //----------------------------- 
	  OnSearch('COLOR');	              
 }
//================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------	  
	  grdWProcess.GetGridControl().RowHidden(0) = true ;	  
 
      var  data ;  
      
      data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>" ;    
      lstLineGroup.SetDataText(data);            
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'DETAIL' :
                 data_fppw00010.Call("SELECT");
            break;   
                        
            case 'COLOR' :
                 data_fppw00010_color_code.Call("SELECT");
                 //----------------------------                 
            break;                                      
      }  
 }
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {	
	  		case 'data_fppw00010_color_code' :
				if (grdWProcess.rows>1 )
				{
					var color = "";
					
					color= '0x'+grdWProcess.GetGridData(1,G2_CL_01).substring(4,6)+""+grdWProcess.GetGridData(1,G2_CL_01).substring(2,4)+""+grdWProcess.GetGridData(1,G2_CL_01).substring(0,2);
                	grdWProcess.SetCellBgColor( 1, G2_WP_01, 1, G2_WP_01, Number(color));

					color= '0x'+grdWProcess.GetGridData(1,G2_CL_02).substring(4,6)+""+grdWProcess.GetGridData(1,G2_CL_02).substring(2,4)+""+grdWProcess.GetGridData(1,G2_CL_02).substring(0,2);
                	grdWProcess.SetCellBgColor( 1, G2_WP_02, 1, G2_WP_02, Number(color));
					
					color= '0x'+grdWProcess.GetGridData(1,G2_CL_03).substring(4,6)+""+grdWProcess.GetGridData(1,G2_CL_03).substring(2,4)+""+grdWProcess.GetGridData(1,G2_CL_03).substring(0,2);
                	grdWProcess.SetCellBgColor( 1, G2_WP_03, 1, G2_WP_03, Number(color));
					
					color= '0x'+grdWProcess.GetGridData(1,G2_CL_04).substring(4,6)+""+grdWProcess.GetGridData(1,G2_CL_04).substring(2,4)+""+grdWProcess.GetGridData(1,G2_CL_04).substring(0,2);
                	grdWProcess.SetCellBgColor( 1, G2_WP_04, 1, G2_WP_04, Number(color));
										
					color= '0x'+grdWProcess.GetGridData(1,G2_CL_05).substring(4,6)+""+grdWProcess.GetGridData(1,G2_CL_05).substring(2,4)+""+grdWProcess.GetGridData(1,G2_CL_05).substring(0,2);
                	grdWProcess.SetCellBgColor( 1, G2_WP_05, 1, G2_WP_05, Number(color));															
				
					grdWProcess.GetGridControl().RowHeight(1) = 700;				
				}	
				
				OnSearch('DETAIL');							 
			break;	
			
			case 'data_fppw00010':
				if (grdDetail.rows>1)
				{
					grdDetail.SetCellBold( 1, G1_LINE, grdDetail.rows - 1, G1_LINE, true);
										
					//----------------
					for ( var i=1; i<grdDetail.rows; i++)
					{
						grdDetail.GetGridControl().RowHeight(i) = 1300;
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP01) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD01, i, G1_ORD01, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP02) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD02, i, G1_ORD02, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP03) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD03, i, G1_ORD03, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP04) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD04, i, G1_ORD04, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP05) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD05, i, G1_ORD05, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP06) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD06, i, G1_ORD06, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP07) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD07, i, G1_ORD07, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP08) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD08, i, G1_ORD08, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP09) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD09, i, G1_ORD09, Number(color));
							}
						}							 																																
						//-----------------
						for ( var j=0; j<grdWProcess.cols; j=j+2 )
						{
							if ( grdDetail.GetGridData( i, G1_WP10) == grdWProcess.GetGridData( 1, j) )
							{
								var color = "";
					
								color= '0x'+grdWProcess.GetGridData(1,j+1).substring(4,6)+""+grdWProcess.GetGridData(1,j+1).substring(2,4)+""+grdWProcess.GetGridData(1,j+1).substring(0,2);
                				grdDetail.SetCellBgColor( i, G1_ORD10, i, G1_ORD10, Number(color));
							}
						}							 																																
						//-----------------
					}	
				}												
			break;                                                                        
      }  
 }
//=========================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'DETAIL':
			var path = System.RootURL + '/form/fp/ip/fpip00031.aspx?line_group_pk=' + lstLineGroup.value ;
	    	var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this); 		
		break;
	}
}

//=========================================================================
</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_fppw00010_color_code" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppw00010_color_code" > 
			    <input bind="grdWProcess" >			         
			        <input bind="lstLineGroup" />						        			
			    </input> 
			    <output bind="grdWProcess" />
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00010" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppw00010"  > 
			    <input bind="grdDetail" >			         
			        <input bind="lstLineGroup" />						        	
			        <input bind="dtFromDate" />		
					<input bind="dtToDate" />	
			    </input> 
			    <output bind="grdDetail" />
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
 
				<table style="width: 100%; height: 100%" > 
					<tr style="height: 1%">											 								 
						<td style="width: 100%" colspan=15 >
							<gw:grid id='grdWProcess' 
			                	header='WP_01|_COLOR_01|WP_02|_COLOR_02|WP_03|_COLOR_03|WP_04|_COLOR_04|WP_05|_COLOR_05' 
			                	format='0|0|0|0|0|0|0|0|0|0'
			                	aligns='0|0|0|0|0|0|0|0|0|0' 			                	 
			                	editcol='0|0|0|0|0|0|0|0|0|0' 
			                	widths='2000|0|2000|0|2000|0|2000|0|2000|0'
			                	styles='width:100%; height:50' />
						</td>
					</tr>
					<tr style="height: 1%">					
						<td align="right" style="width: 5%; white-space: nowrap">
			                Line Grp
			            </td>
			            <td style="width: 25%; white-space: nowrap" colspan=2 >
			                <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch('COLOR')" />
			            </td>							 
						<td align="right" style="width: 5%; white-space: nowrap">
			                Date
			            </td>
			            <td style="width: 20%; white-space: nowrap">
			                <gw:datebox id="dtFromDate" lang="1" styles="width:80%" /> ~ <gw:datebox id="dtToDate" lang="1" styles="width:80%" />
			            </td>
						<td style="width: 42%" align='right'>			                
			            </td>	
						<td style="width: 1%" align='right'>
			                <gw:imgbtn img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp('DETAIL')" />
			            </td>	
			            <td style="width: 1%" align='right'>
			                <gw:imgbtn id="btnSearch" img="search" alt="Search W/I List" onclick="OnSearch('DETAIL')" />
			            </td>										 						 
					</tr>
					<tr style="height: 99%">
						<td colspan=9 >				  
			                <gw:grid id='grdDetail'
			                    header='Line|1|_WP1|2|_WP2|3|_WP3|4|_WP4|5|_WP5|6|_WP6|7|_WP7|8|_WP8|9|_WP9|10|_WP10'
			                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
			                    aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'			         
			                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
			                    widths='1500|2000|0|2000|0|2000|0|2000|0|2000|0|2000|0|2000|0|2000|0|2000|0|2000|0'
			                    sorting='T'
			                    styles='width:100%; height:100%'
			                    />           
						</td>					
					</tr>	
				</table>			
    <!------------------------------------------------------------------>
</body>
</html>
