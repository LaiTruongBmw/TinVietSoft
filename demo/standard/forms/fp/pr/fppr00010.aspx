<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Line Output Entry</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;    
         
var G1_MASTER_PK        = 0, 
    G1_Status           = 1, 
    G1_PROD_DATE        = 2,
    G1_WH_PK            = 3,
    G1_PB_LINE_PK       = 4,
    G1_LINE_ID          = 5,
    G1_LINE_NAME        = 6,
    G1_PP_ORDPLAN_PK    = 7,
    G1_REF_PO_NO        = 8,
    G1_STYLE            = 9,
    G1_CHARGER_PK       = 10,
    G1_CHARGER_ID       = 11,
    G1_CHARGER_NAME     = 12,
    G1_DESCRIPTION      = 13,
	G1_STYLE_PK			= 14;
 
var G2_DETAIL_PK        = 0,
    G2_MASTER_PK        = 1,
    G2_SEQ              = 2,
    G2_COMP_PK          = 3,
    G2_COMP_ID          = 4,
    G2_COMP_NAME        = 5,    
    G2_SPEC01_PK        = 6,
    G2_SPEC01_ID        = 7,
    G2_SPEC02_PK        = 8,
    G2_SPEC02_ID        = 9,
    G2_SPEC03_PK        = 10,
    G2_SPEC03_ID        = 11,
    G2_SPEC04_PK        = 12,
    G2_SPEC04_ID        = 13,
    G2_SPEC05_PK        = 14,
    G2_SPEC05_ID        = 15,
    G2_LOT_ID           = 16,
    G2_CARD_ID          = 17,    
    G2_PROD_QTY         = 18,
    G2_DEFECT_PK        = 19,
    G2_DEFECT_NAME      = 20,
    G2_DEFECT_QTY       = 21,
    G2_EMP_PK           = 22,
    G2_EMP_ID           = 23,
    G2_EMP_NAME         = 24,
    G2_START_TIME       = 25,
    G2_END_TIME         = 26, 
	G2_TR_TYPE			= 27,  
    G2_DESCRIPTION      = 28,  
    G2_TOTAL_PROD_QTY   = 29,
    G2_TOTAL_DEFECT_QTY = 30;    
    
//=====================================================================================
function BodyInit()
 {
    System.Translate(document); 
      //---------------------- 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));      
      //----------------------
      OnFormatGrid();      
      //----------------------
	  OnHiddenGrid();
	  
	  OnSearch('header');	  	  
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' * ' || a.group_name  FROM tlg_pb_line_group a  WHERE a.del_if = 0  ORDER BY 2 ") %>||Select ALL" ;    
    lstLineGroup.SetDataText(data); 
    lstLineGroup.value = '' ;                                           

    data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT PK, wh_id || ' * ' || wh_name FROM tlg_in_warehouse WHERE DEL_IF = 0 AND USE_YN = 'Y' order by 2 " ) %> ||";       
    grdMaster.SetComboFormat(G1_WH_PK,data); 

    data ="#1;USER|#2;ADJ|#3;AUTO"
    grdDetail.SetComboFormat(G2_TR_TYPE,data);
		     
    var trl ;
    
    trl = grdDetail.GetGridControl();
    trl.ColFormat(G2_PROD_QTY)    = "###,###,###,###,###.##";
    trl.ColFormat(G2_DEFECT_QTY)  = "###,###,###,###,###.##";
    trl.ColEditMask(G2_START_TIME) = "99:99";
    trl.ColEditMask(G2_END_TIME)   = "99:99";
    
    grdMaster.GetGridControl().Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc; 
    grdDetail.GetGridControl().Cell( 7, 0, G2_DEFECT_NAME, 0, G2_DEFECT_NAME) = 0x3300cc;    
 }
//=========================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;
}
//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                data_fppr00010.Call("SELECT");
            break; 
            
            case 'Detail' :
                if ( grdMaster.row > 0 )
                {
                    txtMasterPK.text  = grdMaster.GetGridData( grdMaster.row, G1_MASTER_PK );                 
                }
                else
                {
                    txtMasterPK.text = '' ;
                } 
                   
                data_fppr00010_1.Call("SELECT");   
            break;   
			
			case 'header':
				data_fppr00010_header.Call('SELECT');
			break;			          
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fppr00010" :
                //--------------------------------
                if ( grdMaster.rows > 1 )
                {
                    grdMaster.SetCellBold( 1, G1_LINE_ID,   grdMaster.rows - 1, G1_LINE_ID,   true);
                    grdMaster.SetCellBold( 1, G1_REF_PO_NO, grdMaster.rows - 1, G1_REF_PO_NO, true);
                }                
                //--------------------------------                            
                OnSearch('Detail');
                //--------------------------------                
            break;  
            
            case "data_fppr00010_1" :
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G2_PROD_QTY,   grdDetail.rows - 1, G2_PROD_QTY,   true);
                    grdDetail.SetCellBold( 1, G2_DEFECT_QTY, grdDetail.rows - 1, G2_DEFECT_QTY, true);
                    grdDetail.SetCellBold( 1, G2_COMP_ID,    grdDetail.rows - 1, G2_COMP_ID,    true);
                    
                    lblRecord.text  = FormatNumber(grdDetail.GetGridData( 1, G2_TOTAL_PROD_QTY)); 
                    lblRecord2.text = FormatNumber(grdDetail.GetGridData( 1, G2_TOTAL_DEFECT_QTY));                                                                                 
                }
            break; 
            
            case "pro_fppr00010_1":
                alert(txtReturnValue.text);
            break;   
            
            case "pro_fppr00010_2":
                alert(txtReturnValue.text);
            break;  
			
            case 'data_fppr00010_header':
	            if(grdHeader.rows>1)
	            {
	                var col1=grdHeader.GetGridData(1,2);
	                var dis_col1=grdHeader.GetGridData(1,3);
	                var col2=grdHeader.GetGridData(1,4);
	                var dis_col2=grdHeader.GetGridData(1,5);
	                var col3=grdHeader.GetGridData(1,6);
	                var dis_col3=grdHeader.GetGridData(1,7);
	                var col4=grdHeader.GetGridData(1,8);
	                var dis_col4=grdHeader.GetGridData(1,9);
	                var col5=grdHeader.GetGridData(1,10);
	                var dis_col5=grdHeader.GetGridData(1,11);
	                if(dis_col1!=0)
	                {
	                    grdDetail.SetGridText(0,G2_SPEC01_ID,col1);
	                    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = false ;	                    
	                }
	                if (dis_col2!=0)
	                {
	                    grdDetail.SetGridText(0,G2_SPEC02_ID,col2);
	                    grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = false ;	                    
	                }
	                if (dis_col3!=0)
	                {
	                    grdDetail.SetGridText(0,G2_SPEC03_ID,col3);
	                    grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = false ;	                    
	                }
	                if (dis_col4!=0)
	                {
	                    grdDetail.SetGridText(0,G2_SPEC04_ID,col4);
	                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdDetail.SetGridText(0,G2_SPEC05_ID,col5);
	                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ;	                    
	                }
	            }
        	break;				                                   
      }  
 }
 
//=====================================================================================
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                data_fppr00010.Call();
            break;
            
            case 'Detail' :
                data_fppr00010_1.Call();
            break;
      }  
 }
 
//=====================================================================================
function OnGridCellClick(oGrid)
{
    switch (oGrid.id)
	{
		case 'grdMaster':
		    OnSearch('Detail');
		break;			
	}
}

//=====================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdMaster" :
                if ( ( event.col == G1_LINE_ID || event.col == G1_LINE_NAME )&& event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/fp/ab/fpab00200.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 if ( obj != null )
	                 {
                         grdMaster.SetGridText(event_row, G1_PB_LINE_PK, obj[0] ); //tpr_line_pk
                         grdMaster.SetGridText(event_row, G1_LINE_ID,    obj[2] ); //line_id
                         grdMaster.SetGridText(event_row, G1_LINE_NAME,  obj[3] ); //line_name    
                     }	
                }
                else if ( ( event.col == G1_CHARGER_ID || event.col == G1_CHARGER_NAME ) && event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 {
                         grdMaster.SetGridText( event_row, G1_CHARGER_PK,   obj[0] ); //emp_pk
                         grdMaster.SetGridText( event_row, G1_CHARGER_ID,   obj[1] ); //emp_id
                         grdMaster.SetGridText( event_row, G1_CHARGER_NAME, obj[2] ); //emp_name           	                          
                     }	                
                }
                else if ( ( event.col == G1_REF_PO_NO || event.col == G1_STYLE ) && event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/fp/ab/fpab00360.aspx?line_pk=' + grdMaster.GetGridData( event_row, G1_PB_LINE_PK) ;
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 { 
                         grdMaster.SetGridText( event_row, G1_PP_ORDPLAN_PK, obj[0] ); // PLAN_PK
                         
                         grdMaster.SetGridText( event_row, G1_REF_PO_NO,     obj[2] ); // REF_PO_NO
                         grdMaster.SetGridText( event_row, G1_STYLE,         obj[6] + ' - ' || obj[7] ); // STYLE           	                          
                     }	                
                }    				 		                            
            break; 
            
            case "grdDetail" :            
                if ( ( event.col == G2_EMP_ID || event.col == G2_EMP_NAME ) && event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 {
                         grdDetail.SetGridText( event_row, G2_EMP_PK,   obj[0] ); //emp_pk
                         grdDetail.SetGridText( event_row, G2_EMP_ID,   obj[1] ); //emp_id
                         grdDetail.SetGridText( event_row, G2_EMP_NAME, obj[2] ); //emp_name           	                          
                     }	                
                }
                else if ( event.col == G2_SPEC01_ID || event.col == G2_SPEC02_ID || event.col == G2_SPEC03_ID || event.col == G2_SPEC04_ID || event.col == G2_SPEC05_ID )   
                { 
                     var event_col = event.col ;
                     var event_row = event.row ;
                                     
                     var path = System.RootURL + '/form/fp/ab/fpab00090.aspx?group_type=1&tco_stitem_pk='+ grdMaster.GetGridData( grdMaster.row, G1_STYLE_PK);
                     var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                    
                     if ( obj != null )
                     {                                                                               
                         grdDetail.SetGridText( event_row, event_col  , obj[4] );
                         grdDetail.SetGridText( event_row, event_col-1, obj[2] );  
                     }    	         
                }  
                else if ( event.col == G2_DEFECT_NAME )   
                { 
                     var event_col = event.col ;
                     var event_row = event.row ;
                                     
                     var path = System.RootURL + '/form/fp/ab/fpab00260.aspx';
                     var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                    
                     if ( obj != null )
                     {                                                                               
                         grdDetail.SetGridText( event_row, G2_DEFECT_PK  , obj[0] );
                         grdDetail.SetGridText( event_row, G2_DEFECT_NAME, obj[2] );  
                     }    	         
                }                                 
            break;             
      }         
}   

//=====================================================================================
function OnAddNew(pos)
{
    switch (pos)
	{
		case 'Master':
			grdMaster.AddRow();
			
			grdMaster.SetGridText( grdMaster.rows-1 ,G1_CHARGER_PK ,   user_pk   );
			grdMaster.SetGridText( grdMaster.rows-1 ,G1_CHARGER_NAME , user_name );
			//--------
			
			if ( lstLine.value != '' )
			{
			    grdMaster.SetGridText( grdMaster.rows-1 ,G1_PB_LINE_PK, lstLine.value );
			    grdMaster.SetGridText( grdMaster.rows-1 ,G1_LINE_NAME,  lstLine.GetText() );
			}
			//--------
		break;			 			 		 
		
		case 'ProdPlan' :
		    if ( grdMaster.row > 0 && grdMaster.GetGridData( grdMaster.row, 0 ) != '' ) 
		    {
		         if ( Number (grdMaster.GetGridData( grdMaster.row, G1_PP_ORDPLAN_PK ) ) > 0 )
		         {
                     var path = System.RootURL + '/form/fp/pr/fppr00011.aspx?pp_ordplan_pk=' + grdMaster.GetGridData( grdMaster.row, G1_PP_ORDPLAN_PK ) ;
                     var object = System.OpenModal( path ,1000 ,550 , 'resizable:yes;status:yes', this); 
                     
                     if ( object != null )
                     { 
                            var arrTemp;                        
                            for( var i=0; i < object.length; i++)	  
                            {	
                                    arrTemp = object[i];
                                        
                                    grdDetail.AddRow();
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);                                
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_MASTER_PK, grdMaster.GetGridData( grdMaster.row, 0 )); //master_pk                                
                                    
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_EMP_PK,   user_pk  ); //emp_pk
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_EMP_NAME, user_name); //emp_name
                                    
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_COMP_PK,   arrTemp[1]); //comp pk	    
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_COMP_ID,   arrTemp[2]); //comp id	    
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_COMP_NAME, arrTemp[3]); //comp name	    
                                      
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC01_PK, arrTemp[4]); //spec pk
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC01_ID, arrTemp[5]); //spec name
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC02_PK, arrTemp[6]); //spec pk   
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC02_ID, arrTemp[7]); //spec name   
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC03_PK, arrTemp[8]); //spec pk   
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC03_ID, arrTemp[9]); //spec name  
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC04_PK, arrTemp[10]); //spec pk   
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC04_ID, arrTemp[11]); //spec name  
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC05_PK, arrTemp[12]); //spec pk   
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SPEC05_ID, arrTemp[13]); //spec name  
                                                                                                
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_PROD_QTY , arrTemp[17]); // bal qty  
									
									grdDetail.SetGridText(grdDetail.rows-1, G2_START_TIME, arrTemp[18] );  // Time        
									grdDetail.SetGridText(grdDetail.rows-1, G2_END_TIME,   arrTemp[18] );  // Time 									                                                                                                                    
                            }                  
                     }
                 }
                 else
                 {
                     alert("Pls select order plan first.");
                 }                  
            }
            else
            {
	            alert("Pls Select one Result Master saved !!! ");
            }		
		break;			
	}
}

//=====================================================================================
function OnDelete(obj)
 {
    var ctrl = obj.GetGridControl();
	var row  = ctrl.row;
	
	if ( row > 0 ) 
	{
		if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		{						
			obj.RemoveRow();					
		}		
		else 
		{
			if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			{
				obj.DeleteRow();
			}
		}
	}
 }

//=====================================================================================
 function OnUnDelete(obj) 
 {
	var ctrl = obj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			obj.UnDeleteRow();
		}
	}
} 

//=====================================================================================

 function CheckInput()
 {
    var col, row
    
    col = event.col
    row = event.row        
      
    if ( col == G2_DEFECT_QTY || col == G2_PROD_QTY )
    {                
    //------------------------------------------                
        var dQuantiy ;
 
        dQuantiy =  grdDetail.GetGridData(row,col)
        if (Number(dQuantiy))
        {   
            grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
        }
        else
        {
            grdDetail.SetGridText(row,col,"")
        } 
    //------------------------------------------        
    } 
    
    cIdx = event.col;
    
    if ( cIdx == G2_START_TIME || cIdx == G2_END_TIME )
	{
		tmpIN = grdDetail.GetGridData(event.row,cIdx)
		
		if ( tmpIN.length == 0 )
		{
			grdDetail.SetGridText(event.row, cIdx, "")
			
		}
		if( ( tmpIN.length !=4 ) && ( tmpIN.length !=0 ) )
		{
			alert("Input In time is not correct type.(type: hh:mm)\nKiểu gi�?in nhập không đúng")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		{
			alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiểu gi�?in phải >=00 và <=23")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		{
			alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiểu phút phải >=00 và <=59")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpIN.length>0)
		{
		    tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		    grdDetail.SetGridText(event.row,cIdx,tmpIN)
		}    
	}

 }
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fppr00010.Call();
        break; 
        
        case 'ConfirmResult':
            if ( grdMaster.row > 0 ) 
            {
                if ( confirm("Do you want to confirm result") )
                {
                    txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_MASTER_PK);
                    pro_fppr00010_1.Call();
                }
            }        
        break;      
        
        case 'CancelResult':
            if ( grdMaster.row > 0 ) 
            {
                if ( confirm("Do you want to cancel result") )
                {
                    txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_MASTER_PK);
                    pro_fppr00010_2.Call();
                }
            }        
        break;               
    }        
}
//=========================================================================
function OnExcel()
{
     if ( grdMaster.row > 0 )
     {     
         var url =System.RootURL + "/reports/fp/pr/rpt_fppr00010_bkvina.aspx?work_process_pk=" + grdMaster.GetGridData( grdMaster.row, G1_PP_ORDPLAN_PK ) + "&work_process_name="+ grdMaster.GetGridData( grdMaster.row, G1_STYLE ) +"&day="+ grdMaster.GetGridData( grdMaster.row, G1_PROD_DATE );
         System.OpenTargetPage(url);
     } 
}
//=========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00010_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00010_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00010" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00010_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00010_2" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="<%=l_user%>lg_sel_fppr00010" procedure="<%=l_user%>lg_upd_fppr00010" > 
                <input>
                    <input bind="lstLineGroup" />
                    <input bind="lstLine" />  
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtPoStyle" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" function="<%=l_user%>lg_sel_fppr00010_1" procedure="<%=l_user%>lg_upd_fppr00010_1"  > 
                <input> 
                    <input bind="txtMasterPK" /> 
					<input bind="txtComp" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='top' style="height: 45%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Line Group
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Line
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('Master')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%" align="right">
                            PO/Style
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPoStyle" styles='width:100%' onenterkey="OnSearch('Master')" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnReport" img="excel" alt="PO Sheet" onclick="OnExcel()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnNew" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="delete" onclick="OnDelete(grdMaster)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUnDelete" img="udelete" alt="Un Delete" onclick="OnUnDelete(grdMaster)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="15">
                            <gw:grid id='grdMaster' header='_PK|Status|Prod Date|W/H|_PB_LINE_PK|Line ID|Line Name|_ORD_PLAN_PK|P/O No|Style|_Charger_PK|Emp ID|Name|Description|_STYLE_PK'
                                format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='|||||||||||||' editcol='0|0|1|1|0|0|0|0|0|0|0|0|0|1|0' widths='1000|1200|1200|1500|0|1500|2000|0|1500|3500|0|1200|2000|1000|0'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnGridCellClick(this)"
                                oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%" align="left">
                            <gw:icon id="btnConfirm" img="3" text="Confirm" onclick="OnProcess('ConfirmResult')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:icon id="btnCancel" img="3" text="Cancel" onclick="OnProcess('CancelResult')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap; color: Blue" align="left">
                            <gw:label id="lbl01" styles="color: Blue"> Prod Qty:&nbsp </gw:label>
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:label id="lblRecord" styles="color: Red"></gw:label>
                        </td>
                        <td style="width: 10%; white-space: nowrap; color: Blue" align="left">
                            <gw:label id="lbl02" styles="color: Blue">&nbsp Defect Qty:&nbsp </gw:label>
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:label id="lblRecord2" styles="color: Red"></gw:label>
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Comp
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:textbox id="txtComp" maxlen="100" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="ibtnNew5" img="2" text="Prod Plan" onclick="OnAddNew('ProdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete2" img="delete" alt="delete" onclick="OnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUnDelete2" img="udelete" alt="Un Delete" onclick="OnUnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 54%">
            <td>
                <gw:grid id='grdDetail' header='_DETAIL_PK|_MASTER_PK|Seq|_COMP_PK|Comp ID|Comp Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Lot ID|Card ID|Prod Qty|_DEFECT_PK|Defect|Def Qty|_EMP_PK|Emp ID|Emp Name|Start Time|End Time|Tr Type|Remark|_TOTAL_PROD_QTY|_TOTAL_DEFECT_QTY'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|1|0|1|0|1|0|1|0|1|1|1|3|0|0|3|0|0|0|1|1|0|0|0|0'
                    editcol='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|0|1|0|0|0|1|1|1|1|0|0' widths='0|0|1000|0|1500|2500|0|1500|0|1500|0|1500|0|1500|0|1500|1200|1500|1200|0|1500|1200|0|1200|2000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtMasterPK" style="display: none" />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
