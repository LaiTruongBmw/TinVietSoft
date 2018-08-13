<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Line Stock Transfer</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;    
         
var G1_Tran_pk  = 0,
    G1_Status   = 1,
    G1_Tran_DT  = 2,
    G1_Out_WH   = 3,
    G1_In_WH    = 4,
    G1_Ordplan_pk = 5,
    G1_PO_No      = 6,
    G1_Item_Nm    = 7,
    G1_Charger_Pk = 8,
    G1_Charger    = 9,
    G1_Desc       = 10;
   
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
    G2_OUT_QTY          = 17,       
    G2_DESCRIPTION      = 18,
	G2_TOTAL_OUT		= 19;    
    
//=====================================================================================
function BodyInit()
 {
    System.Translate(document); 
       var data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' - ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||Select ALL";   
       lstInWH_S.SetDataText(data)
       lstOutWH_S.SetDataText(data)
       lstInWH_S.value =''
       lstOutWH_S.value =''      
      //---------------------- 
      
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));      
      //----------------------
      OnHiddenGrid();
      OnFormatGrid(); 
	  
	  OnSearch('header');
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;
    //---------------------- 
   data = "<%=ESysLib.SetGridColumnDataSQL("SELECT pk, wh_id || ' - ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id " )%> " ; 
   grdMaster.SetComboFormat(G1_Out_WH,data);
   grdMaster.SetComboFormat(G1_In_WH,data);                      
    
    grdMaster.GetGridControl().Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;  
    
    var trl ;
    trl = grdDetail.GetGridControl();
    trl.ColFormat(G2_OUT_QTY)    = "###,###,###,###,###.##";
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                data_fppr00120.Call("SELECT");
            break; 
            
            case 'Detail' :
                if ( grdMaster.row > 0 )
                {
                    txtMasterPK.text  = grdMaster.GetGridData( grdMaster.row, G1_Tran_pk );                 
                }
                else
                {
                    txtMasterPK.text = '' ;
                } 
                   
                data_fppr00120_1.Call("SELECT");   
            break; 
            
            case 'header':
                data_fppr00120_header.Call("SELECT");
            break;            
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case 'data_fppr00120_header':
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
                    grdDetail.SetGridText(0,G2_SPEC05_ID,col4);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_ID,col5);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ;
                    
                }
            }
        break;
            case "data_fppr00120" :
                //--------------------------------
                if ( grdMaster.rows > 1 )
                {
                    grdMaster.SetCellBold( 1, G1_PO_No, grdMaster.rows - 1, G1_PO_No, true);

                    grdMaster.SetCellBold( 1, G1_Out_WH, grdMaster.rows - 1, G1_Out_WH, true);
                    grdMaster.SetCellBold( 1, G1_In_WH, grdMaster.rows - 1, G1_In_WH, true);
                }                
                //--------------------------------                            
                OnSearch('Detail');
                //--------------------------------                
            break;  
            
            case "data_fppr00120_1" :
                if ( grdDetail.rows > 1 )
                {
					lblRecord.text = grdDetail.GetGridData(1,G2_TOTAL_OUT);
					
                    grdDetail.SetCellBold( 1, G2_OUT_QTY, grdDetail.rows - 1, G2_OUT_QTY, true);
                    grdDetail.SetCellBold( 1, G2_COMP_ID, grdDetail.rows - 1, G2_COMP_ID, true);                    
                }
            break; 
            
            case "pro_fppr00120":
                alert(txtReturnValue.text);
                data_fppr00120.Call('SELECT')
            break;   
            
            case "pro_fppr00120_1":
                alert(txtReturnValue.text);
                data_fppr00120.Call('SELECT')
            break;                                     
      }  
 }
 
//=====================================================================================
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                if(CheckValid())
                {
                    data_fppr00120.Call();
                }
            break;
            
            case 'Detail' :
                data_fppr00120_1.Call();
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
                 if ( event.col == G1_Charger && event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 {
                         grdMaster.SetGridText( event_row, G1_Charger_Pk,   obj[0] ); //emp_pk
                         grdMaster.SetGridText( event_row, G1_Charger, obj[2] ); //emp_name           	                          
                     }	                
                }
                else if ( ( event.col == G1_PO_No || event.col == G1_Item_Nm ) && event.row > 0 )
                {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/fp/ab/fpab00360.aspx' ;
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 { 
	                     grdMaster.SetGridText( event_row, G1_Ordplan_pk, obj[0] ); // PLAN_PK
                         
                         grdMaster.SetGridText( event_row, G1_PO_No,     obj[2] ); // REF_PO_NO
                         grdMaster.SetGridText( event_row, G1_Item_Nm,         obj[6] + ' - ' + obj[7] ); // STYLE           	                          
                     }	                
                }                                                                     
            break; 
            
            case "grdDetail" :            
                if ( event.col == G2_SPEC01_ID || event.col == G2_SPEC02_ID || event.col == G2_SPEC03_ID || event.col == G2_SPEC04_ID || event.col == G2_SPEC05_ID )   
                { 
                     var event_col = event.col ;
                     var event_row = event.row ;
                                     
                     var path = System.RootURL + '/form/fp/ab/fpab00090.aspx?group_type=1';
                     var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                    
                     if ( obj != null )
                     {                                                                               
                         grdDetail.SetGridText( event_row, event_col  , obj[4] );
                         grdDetail.SetGridText( event_row, event_col-1, obj[2] );  
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
			
			grdMaster.SetGridText( grdMaster.rows-1 ,G1_Charger_Pk ,   user_pk   );
			grdMaster.SetGridText( grdMaster.rows-1 ,G1_Charger , user_name );			
			//--------
		break;			 			 		 
		
		case 'ProdPlan' :
		    if ( grdMaster.row > 0 && grdMaster.GetGridData( grdMaster.row, 0 ) != '' ) 
		    {
		         if ( Number (grdMaster.GetGridData( grdMaster.row, G1_Ordplan_pk ) ) > 0 )
		         {
                     var path = System.RootURL + '/form/fp/pr/fppr00121.aspx?pp_ordplan_pk=' + grdMaster.GetGridData( grdMaster.row, G1_Ordplan_pk ) ;
                     var object = System.OpenModal( path ,950 , 600 , 'resizable:yes;status:yes', this); 
                     
                     if ( object != null )
                     { 
                            var arrTemp;                        
                            for( var i=0; i < object.length; i++)	  
                            {	
                                    arrTemp = object[i];
                                        
                                    grdDetail.AddRow();
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);                                
                                    grdDetail.SetGridText(grdDetail.rows-1, G2_MASTER_PK, grdMaster.GetGridData( grdMaster.row, 0 )); //master_pk                                
                                    
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
	            alert("Pls Select one Tranfer Master saved !!! ");
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
      
    if ( col == G2_OUT_QTY )
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
 }
//=====================================================================================
function CheckValid()
{
    for(i =1; i< grdMaster.rows ; i++)
    {
        if (grdMaster.GetGridData( i, G1_Ordplan_pk)=="")
        {
            alert('Please select Style at Line '+ (i))
            return false;
        }
    }
    
    for(var i =1; i< grdMaster.rows ; i++)
    {
        if (grdMaster.GetGridData( i, G1_Out_WH)==grdMaster.GetGridData( i, G1_In_WH) )
        {
            alert('Out Warehouse must be different from In Warehouse!Please, check again!')
            return false;
        }
    }
    for(i =1; i< grdMaster.rows ; i++)
    {
        if (grdMaster.GetGridData( i, G1_Tran_DT)=="")
        {
            alert('Please insert Tranfer Date at Line '+ (i))
            return false;
        }
    }
    return true;
}
//=====================================================================================
function OnProcess(pos)
{
    switch (pos)
    {
                
        case 'ConfirmResult':
            if ( grdMaster.row > 0 ) 
            {
                if ( confirm("Do you want to confirm result") )
                {
                    txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_Tran_pk);
                    pro_fppr00120.Call();
                }
            }        
        break;      
        
        case 'CancelResult':
            if ( grdMaster.row > 0 ) 
            {
                if ( confirm("Do you want to cancel transfer!") )
                {
                    txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_Tran_pk);
                    pro_fppr00120_1.Call();
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
         var url =System.RootURL + '/reports/fp/pr/rpt_fppr00120.aspx?from_date=' + dtFrom.value + '&to_date=' + dtTo.value;
         //window.open(url); 
     } 
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
//=========================================================================
</script>

<body>
      <!---------------------------------------------------------------->
    <gw:data id="data_fppr00120_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00120_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00120" > 
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
    <gw:data id="pro_fppr00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00120_1" > 
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
    <gw:data id="data_fppr00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fppr00120" procedure="<%=l_user%>lg_upd_fppr00120" > 
                <input>
                    <input bind="lstInWH_S" />
                    <input bind="lstOutWH_S" />  
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="<%=l_user%>lg_sel_fppr00120_1" procedure="<%=l_user%>lg_upd_fppr00120_1"  > 
                <input> 
                    <input bind="txtMasterPK" /> 
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
                         <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td style="width: 25%" align="right">
                            <gw:list id="lstOutWH_S" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            In W/H
                        </td>
                        <td style="width: 25%" align="right">
                            <gw:list id="lstInWH_S" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>                                              
                        <td style="width: 9%">
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
                            <gw:grid id='grdMaster'
                            header='_PK|Status|Trans DT|Out WH|In WH|_PP_ORDPLAN_PK|P/O NO|Style|_CHARGER_PK|Charger|Description'
                            format='0|0|4|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0'
                            defaults='||||||||||'
                            editcol='0|0|1|1|1|0|0|0|0|0|1'
                            widths='0|1000|1200|2000|2000|0|2000|2500|0|2000|1000'
                            sorting='T'
                            styles='width:100%; height:100%' 
                            oncellclick="OnGridCellClick(this)"
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
                        <td style="width: 15%; white-space: nowrap; color: Blue" align="left">
                        </td>
                        <td style="width: 10%; white-space: nowrap; color: Blue" align="left">
                            <gw:label id="lbl01" styles="color: Blue"> Trans Qty:&nbsp </gw:label>
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:label id="lblRecord" styles="color: Red"></gw:label>
                        </td>
                        <td style="width: 10%; white-space: nowrap; color: Blue" align="left">
                            
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                           
                        </td>
                        <td style="width: 30%" align="right">
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
                <gw:grid id='grdDetail' header='_DETAIL_PK|_MASTER_PK|Seq|_COMP_PK|Comp ID|Comp Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Lot ID|Trans Qty|Remark|_Total_Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    
                    aligns='0|0|1|0|0|0|0|1|0|1|0|1|0|1|0|1|1|3|0|0'
                    editcol='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0' 
                    widths='0|0|1000|0|2000|3000|0|1500|0|1500|0|1500|0|1500|0|1500|1200|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
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
        
    </body>
</html>
