<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Prod Daily Input 2</title>
</head>

<script>
        
   var  G0_DATE			= 0,
		G0_SHIFT		= 1,
        G0_LINE_PK      = 2,
        G0_WPROCESS_PK  = 3,	
        G0_WH_PK 		= 4,
        G0_ITEM_PK      = 5,
        G0_ITEM_CD      = 6,
        G0_ITEM_NM 		= 7,  
        G0_TYPE01_QTY 	= 8,
        G0_TYPE02_QTY 	= 9,
        G0_TYPE03_QTY 	= 10,
        G0_TYPE04_QTY 	= 11,
        G0_TYPE05_QTY 	= 12,
        G0_TYPE06_QTY 	= 13,
        G0_TYPE07_QTY 	= 14,
        G0_TYPE08_QTY 	= 15,
        G0_TYPE09_QTY 	= 16,
        G0_TYPE10_QTY 	= 17,        
		G0_CHARGER_NAME	= 18,
		G0_ACT_CAVITY	= 19,
		G0_WORK_TIME    = 20,
		G0_NONE_TIME 	= 21,
		G0_ATT_01 		= 22,
		G0_ATT_02		= 23,
		G0_ATT_03		= 24,
		G0_ATT_04		= 25,
		G0_ATT_05		= 26;	

var arr_FormatNumber = new Array();  

    //==============================================================================
     function BodyInit()
     {  
        System.Translate(document);         		      		
		
		txtUser_PK.text = "<%=session("USER_PK")%>";
	
		OnFormatGrid(); 

		OnSearch('HEADER');		
     } 

	//==============================================================================
    function OnFormatGrid()
    {   	
		var data = "";
		
		data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and product_yn = 'Y' order by wh_id")%>||";	
        lstWarehouse.SetDataText( data);
        lstWarehouse.value = '';

		data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and product_yn = 'Y' order by wh_id " ) %> ";       
		grdDetail.SetComboFormat(G0_WH_PK,data);
		
		data = "<%=ESysLib.SetListDataSQL("SELECT   a.pk, a.GROUP_ID || ' * ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0  ORDER BY 2 ") %>||" ;    
		lstLGroup.SetDataText(data); 
		lstLGroup.value = '' ; 	
		
		data = "<%=ESysLib.SetListDataSQL("SELECT   a.pk, a.line_ID || ' * ' || a.line_name FROM tlg_pb_line a WHERE a.del_if = 0  ORDER BY 2 ") %>||" ;    
		lstLine.SetDataText(data); 
		lstLine.value = '' ; 
				
		data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT   a.pk, a.line_ID || ' * ' || a.line_name  FROM tlg_pb_line a WHERE a.del_if = 0  ORDER BY 2 " ) %> ";       
		grdDetail.SetComboFormat(G0_LINE_PK,data);
 
		data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0343') FROM DUAL" )%>||";    
		lstWorkShift.SetDataText(data);   
		lstWorkShift.value = '' ;

		data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT a.CODE, a.CODE FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0343' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
		grdDetail.SetComboFormat(G0_SHIFT,data);
		
		data = "<%=ESysLib.SetListDataSQL("  SELECT pk, process_id || ' * ' || process_name FROM tlg_pb_process WHERE del_if = 0 AND use_yn = 'Y' ORDER BY seq, process_id ")%>||";
        lstProcess.SetDataText( data);
        lstProcess.value = '';
		
		data = "<%=ESysLib.SetListDataSQL(" SELECT pk, wp_id || ' * ' || wp_name FROM tlg_pb_work_process WHERE del_if = 0 AND use_yn = 'Y' AND wi_yn = 'Y' ORDER BY wp_id")%>||";
        lstWorkProcess.SetDataText( data);
        lstWorkProcess.value = '';
		
		data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT pk, wp_id || ' * ' || wp_name FROM tlg_pb_work_process WHERE del_if = 0 AND use_yn = 'Y' AND wi_yn = 'Y' ORDER BY wp_id " ) %> ";       
		grdDetail.SetComboFormat(G0_WPROCESS_PK,data);		
	
		var strFormat = "###,###,###,###";
		var strNumber = 0;
		
		var ctrl = grdDetail.GetGridControl();
		        		        
        ctrl.ColFormat(G0_TYPE01_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE02_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE03_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE04_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE05_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE06_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE07_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE08_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE09_QTY) = strFormat;
        ctrl.ColFormat(G0_TYPE10_QTY) = strFormat;
		ctrl.ColFormat(G0_ACT_CAVITY) = "###,###,###,###.##";  
		ctrl.ColFormat(G0_WORK_TIME)  = "###,###,###,###.##";
        ctrl.ColFormat(G0_NONE_TIME)  = "###,###,###,###.##";
		
		
		arr_FormatNumber[G0_TYPE01_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE02_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE03_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE04_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE05_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE06_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE07_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE08_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE09_QTY] = strNumber;
		arr_FormatNumber[G0_TYPE10_QTY] = strNumber
		arr_FormatNumber[G0_ACT_CAVITY] = 2;	
		arr_FormatNumber[G0_WORK_TIME]  = 2;	
		arr_FormatNumber[G0_NONE_TIME]  = 2;		 
		
		grdDetail.GetGridControl().Cell( 7, 0, G0_TYPE01_QTY, 0, G0_TYPE10_QTY ) = 0x3300cc;
    }	 
    //==============================================================================
    function OnSearch(objV)
    {    
        switch(objV)
        { 
	        case 'DETAIL':
			    data_fppr00310.Call('SELECT');
			break; 

			case 'HEADER':
			    data_fppr00310_slip_type.Call('SELECT');
			break; 	
			
			case 'WAREHOUSE':
				data_user_warehouse.Call();
			break;
			
        }
    }
    
    //==============================================================================
    function OnDataReceive(objV)
    {
        switch(objV.id)
        {			 
            case 'data_fppr00310': 
			    if ( grdDetail.rows > 1 )
				{            		
					grdDetail.SetCellBgColor( 1, G0_TYPE01_QTY, grdDetail.rows - 1, G0_TYPE01_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_TYPE03_QTY, grdDetail.rows - 1, G0_TYPE03_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_TYPE05_QTY, grdDetail.rows - 1, G0_TYPE05_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_TYPE07_QTY, grdDetail.rows - 1, G0_TYPE07_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_TYPE09_QTY, grdDetail.rows - 1, G0_TYPE09_QTY, 0xCCFFFF ); 					
				} 
            break;
			
			case 'data_fppr00310_slip_type':
				 
				grdDetail.GetGridControl().ColHidden(G0_TYPE01_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE02_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE03_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE04_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE05_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE06_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE07_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE08_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE09_QTY) = true ;
				grdDetail.GetGridControl().ColHidden(G0_TYPE10_QTY) = true ;
				
				if(grdHeader.rows > 1)
                { 					
                    if (  grdHeader.GetGridData( 1, 0 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE01_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE01_QTY, grdHeader.GetGridData( 1, 0 ) );
					}
					
					if (  grdHeader.GetGridData( 1, 1 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE02_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE02_QTY, grdHeader.GetGridData( 1, 1 ) );
					}
					
					if (  grdHeader.GetGridData( 1, 2 ) != '' )
					{	
						grdDetail.GetGridControl().ColHidden(G0_TYPE03_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE03_QTY, grdHeader.GetGridData( 1, 2 ) );
					}
					
					if (  grdHeader.GetGridData( 1, 3 ) != '' )
					{	
						grdDetail.GetGridControl().ColHidden(G0_TYPE04_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE04_QTY, grdHeader.GetGridData( 1, 3 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 4 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE05_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE05_QTY, grdHeader.GetGridData( 1, 4 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 5 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE06_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE06_QTY, grdHeader.GetGridData( 1, 5 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 6 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE07_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE07_QTY, grdHeader.GetGridData( 1, 6 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 7 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE08_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE08_QTY, grdHeader.GetGridData( 1, 7 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 8 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE09_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE09_QTY, grdHeader.GetGridData( 1, 8 ) );
                    }
					
					if (  grdHeader.GetGridData( 1, 9 ) != '' )
					{
						grdDetail.GetGridControl().ColHidden(G0_TYPE10_QTY) = false ;
						grdDetail.SetGridText( 0, G0_TYPE10_QTY, grdHeader.GetGridData( 1, 9 ) );						 
                    }
                }
				
				OnSearch('WAREHOUSE');
				
			break;
			
			case 'data_user_warehouse':
				
			break;
			
        }
    }
 
    //==============================================================================
    function OnReport(obj)
    {
        var url = '';
		
        switch(obj.id)
        {
            case 'btnExcel1':
                url='/reports/fp/ip/rpt_fppr00280.aspx?p_factory_pk='+ lstLGroup.value +'&p_from_date='+ dtDate.value;
            break;
            
			case 'btnExcel2':
                url='/reports/fp/ip/rpt_fppr00280_1.aspx?p_factory_pk='+ lstLGroup.value +'&p_from_date='+ dtDate.value;  
            break;
            
			default:
                return;
        }
		
        if(url != '')
        {
            window.open(System.RootURL+url);
        }
    }
    //==============================================================================
    function OnAddNew()
    {
		 
		//----------------------------
         var url = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
		 var obj= System.OpenModal( url, 1000, 600, 'resizable:yes;status:yes', this); 
		 
		 if( obj != null )
		 {
		    var arrTemp;
			
		    for ( var i = 0 ; i< obj.length ; i++)
		    {
				arrTemp = obj[i];
				  				 
				grdDetail.AddRow();
		            	
				grdDetail.SetGridText( grdDetail.rows-1, G0_DATE, 	 	dtDate.value );  
				grdDetail.SetGridText( grdDetail.rows-1, G0_SHIFT, 	 	lstWorkShift.value );
					
				grdDetail.SetGridText( grdDetail.rows-1, G0_LINE_PK, 	 lstLine.value        );  
				grdDetail.SetGridText( grdDetail.rows-1, G0_WH_PK, 		 lstWarehouse.value   );  
				grdDetail.SetGridText( grdDetail.rows-1, G0_WPROCESS_PK, lstWorkProcess.value );
				
				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_PK,    arrTemp[0]   );    
				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_CD,	arrTemp[1]   ); 
				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_NM,	arrTemp[2]   );
				 
		    }
		 }		 
		 
    }
	 
    //==============================================================================
    function OnSave()
    {
		if ( confirm("Do you want to save data ?") )
		{
			data_fppr00310.Call();
		}	
    }
    //==============================================================================
    function OnDelete()
    {
		if ( grdDetail.row > 0 )
		{
			if ( confirm("Do you want to delete this item?") )
			{
				for ( i=G0_TYPE01_QTY; i<=G0_DAY31_QTY; i++)
				{
					grdDetail.SetGridText( grdDetail.row, i, 0);       
				}	
			}	
		}	
    }
	//==============================================================================
    function OnProcess(pos)	
    {
		switch(pos)
		{
			case 'Line':
				pro_fppr00310_line.Call();
			break;
			
			case 'WorkProcess':
				pro_fppr00310_work_process.Call();
			break;
			
			case 'SET-DATE':
				if ( grdDetail.rows>1 )
				{
					if ( confirm('Do you want to reset Production Date for grid.') )
					{
						for ( var i=1; i<grdDetail.rows; i++ )
						{
							grdDetail.SetGridText( i, G0_DATE, dtDate.value );
						} 
					}
				}	
			break;
			
			case 'COPY':
				if ( grdDetail.row>0 )
				{
					if ( confirm('Do you want to copy the selected to new row ?') )
					{
						grdDetail.AddRow();
						
						for ( var i=0; i<grdDetail.cols; i++ )
						{
							grdDetail.SetGridText( grdDetail.rows-1, i, grdDetail.GetGridData( grdDetail.row, i) );
						} 
					}
				}
			break;
		}				
    }   

  	//========================================================================

	function OnCellDoubleClick(obj)
	{
		switch(obj.id)
		{
			case 'grdDetail':
				if ( ( event.col == G0_CHARGER_NAME ) && event.row > 0 )
				{
					var event_col = event.col ;
					var event_row = event.row ;
					
					if ( grdDetail.GetGridData( event.row, G0_DATE) == '' ) 
					{
						alert("PLS SELECT PRODUCTION DATE");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_SHIFT) == '' ) 
					{
						alert("PLS SELECT WORK SHIFT");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_LINE_PK) == '' ) 
					{
						alert("PLS SELECT PRODUCTION LINE");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_ITEM_PK) == '' ) 
					{
						alert("PLS SELECT PRODUCTION ITEM");
						return;
					}	 
					
					var path = System.RootURL + '/form/fp/pr/fppr00313.aspx?prod_date=' + grdDetail.GetGridData( event.row, G0_DATE) + '&prod_shift=' + grdDetail.GetGridData( event.row, G0_SHIFT) + '&line_pk=' + grdDetail.GetGridData( event.row, G0_LINE_PK) + '&work_process_pk=' + grdDetail.GetGridData( event.row, G0_WPROCESS_PK) + '&item_pk=' + grdDetail.GetGridData( event.row, G0_ITEM_PK)  ;
					var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
						 
					 
				}
				else if ( event.col == G0_NONE_TIME && event.row > 0 )
				{
					var event_col = event.col ;
					var event_row = event.row ;
						
					if ( grdDetail.GetGridData( event.row, G0_DATE) == '' ) 
					{
						alert("PLS SELECT PRODUCTION DATE");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_SHIFT) == '' ) 
					{
						alert("PLS SELECT WORK SHIFT");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_LINE_PK) == '' ) 
					{
						alert("PLS SELECT PRODUCTION LINE");
						return;
					}
					if ( grdDetail.GetGridData( event.row, G0_ITEM_PK) == '' ) 
					{
						alert("PLS SELECT PRODUCTION ITEM");
						return;
					}
					
					var path = System.RootURL + '/form/fp/pr/fppr00312.aspx?prod_date=' + grdDetail.GetGridData( event.row, G0_DATE) + '&prod_shift=' + grdDetail.GetGridData( event.row, G0_SHIFT) + '&line_pk=' + grdDetail.GetGridData( event.row, G0_LINE_PK) + '&work_process_pk=' + grdDetail.GetGridData( event.row, G0_WPROCESS_PK) + '&item_pk=' + grdDetail.GetGridData( event.row, G0_ITEM_PK)  ;
					var obj = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes');						 
							
				}
				
			break;
		}	
	}

	//==============================================================================
	
	function OnPopUp(pos)
	{
		switch(pos)
		{
			case 'REPORT':
				 
					var path = System.RootURL + '/form/fp/pr/fppr00314.aspx';
					var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				        
			break;    
		}
	}
//===================================================================================================
function OnReport( para, p_from_date, p_to_date )
{
    switch(para)
    {      
		case 'DUR01':
            var url =System.RootURL + "/reports/fp/pr/rpt_fppr00310_DUR01.aspx?p_from_date="+ p_from_date +"&p_to_date="+ p_to_date +"&p_wh_pk="+ lstWarehouse.value; 
            System.OpenTargetPage(url);                  
        break;  		
		 
		case 'DUR02':
            var url =System.RootURL + "/reports/fp/pr/rpt_fppr00310_DUR02.aspx?p_from_date="+ p_from_date +"&p_to_date="+ p_to_date +"&p_wh_pk="+ lstWarehouse.value;
            System.OpenTargetPage(url);                  
        break; 
		
		case 'DUR03':
            var url =System.RootURL + "/reports/fp/pr/rpt_fppr00310_DUR03.aspx?p_from_date="+ p_from_date +"&p_to_date="+ p_to_date +"&p_wh_pk="+ lstWarehouse.value;
            System.OpenTargetPage(url);                  
        break;
		
		case 'DUR04':
            var url =System.RootURL + "/reports/fp/pr/rpt_fppr00310_DUR04.aspx?p_from_date="+ p_from_date +"&p_to_date="+ p_to_date +"&p_wh_pk="+ lstWarehouse.value;
            System.OpenTargetPage(url);                  
        break;
    }
}
 
//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
  
    if ( col >= G0_TYPE01_QTY && col <= G0_NONE_TIME )
    {
        var dQuantiy ;
         
        dQuantiy = grdDetail.GetGridData(row,col);
         		 
        if ( Number(dQuantiy) )
        {   
            if (dQuantiy > 0)
            {   
                grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
            }
            else
            {
                grdDetail.SetGridText( row, col, "");
            }
        }
		else if ( Number(dQuantiy) == 0 )
		{ 
		}		
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }
    }
      
}

//===================================================================================================
 
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00310_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00310_line" > 
                <input>
                    <input bind="lstLGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fppr00310_work_process" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00310_work_process" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstWorkProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_fppr00310_slip_type" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00310_slip_type"> 
                <input> 					
                    <input bind="dtDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00310" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function = "<%=l_user%>lg_sel_fppr00310" procedure="<%=l_user%>lg_upd_fppr00310" > 
                <input >	
					
					<input bind="lstLGroup" />
					<input bind="lstLine" />
					<input bind="lstProcess" />
					<input bind="lstWorkProcess" />
                    <input bind="lstWarehouse" /> 					
					<input bind="dtDate" />
					<input bind="lstWorkShift" />
                    <input bind="txtItem" />                      
                </input> 
                 <output bind="grdDetail" />                      
            </dso> 
        </xml> 
    </gw:data>  
	<!---------------------------------------------------------------->
    <gw:data id="data_user_warehouse" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00310_user_wh" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="height: 100%; width: 100%; text-align: left; vertical-align: top;"
                    border="0">	
					<tr style="height: 1%">	
												 
						<td style="width: 5%; white-space: nowrap" align="right">
                            W/H
                        </td>
                        <td style="width: 35%; white-space: nowrap" align="right" colspan=2 >
                            <gw:list id="lstWarehouse" styles='width:100%' onchange="" />
                        </td>						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            <gw:datebox id="dtDate" lang="1" type='date' onchange="OnProcess('SET-DATE')" />
                        </td>
						<td style="width: 25%; white-space: nowrap" align="right">
                            <gw:list id="lstWorkShift" styles='width:100%' onchange="" />
                        </td>	
						<td style="width: 5%" align="right">
                             
                        </td>
                        
						<td style="width: 10%" align="right">
                             
                        </td>
						
						<td style="width: 1%" align="right"> 	
							<gw:imgbtn id="btnReport" img="excel" alt="Search" onclick="OnPopUp('REPORT')" />
                        </td>                                           
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>						
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnAddNew()" />
                        </td>  
						<td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnCopy" img="Copy" alt="Copy" onclick="OnProcess('COPY')" />
                        </td>	
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>                                                
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
					<tr style="height: 1%">	
						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Line
                        </td>
						<td style="width: 15%" align="right">
                            <gw:list id="lstLGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>                         
                        <td style="width: 20%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
						<td style="width: 10%" align="right">
                            <gw:list id="lstProcess" styles="width: 100%" onchange="OnProcess('WorkProcess')" />
                        </td>                         
                        <td style="width: 20%">
                            <gw:list id="lstWorkProcess" styles="width: 100%" onchange="" />
                        </td>
                        
						<td style="width: 5%" align="right">
                            Item
                        </td>						
                        <td style="width: 20%" align="right" colspan=7 >
                             <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('DETAIL')" />
                        </td>
						
						 
                    </tr>
					
                     
                    <tr style="height: 49%">
                        <td colspan="18">
                           <gw:grid id='grdDetail'
                                header='Date|Shift|Line|W/Process|W/H Name|_ITEM_PK|Item Code|Item Name|_1|_2|_3|_4|_5|_6|_7|_8|_9|_10|Emp Name|Act Cavity|Plan Time|None Time|Mold|NG Resin|_Att03|_Att04|_Att05'
                                format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='1|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|0|3|3|3|0|0|0|0|0'                                 
                                editcol='1|1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|1|1|0|1|1|0|1|1|1|1|1'
                                widths='1200|800|1800|1800|1800|0|1500|2000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|2000|1200|1200|1200|1200|0|0|0|0'
                                sorting='T'                             
                                styles='width:100%; height:100%'
								oncelldblclick="OnCellDoubleClick(this)"
								onafteredit="CheckInput()"
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </table>  
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------------------------------------------->
    <gw:grid id='grdHeader' header='COL0|COL1|COL2|COL3|COL4|COL5|COL6|COL7|COL8|COL9'
        format='0|0|0|0|0|0|0|0|0|0' 
		aligns='0|0|0|0|0|0|0|0|0|0' 
		editcol='0|0|0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
        styles='width:100%; height:50%; display:none' />
	<!------------------------------------------------------------------------------------------->
	<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
</body>
</html>
