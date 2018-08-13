<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP MAKE WORK INSTRUCTION</title>
</head>

<script>

    var  user_pk   =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name =  "<%=Session("USER_NAME")%>" ; 
    
    var flag =0;
  //----grdOrdPlan-------
var G1_ORDPLAN_PK   = 0,
    G1_ARRAY_SO_PK  = 1,
    G1_PO_No        = 2,
    G1_STYLE_PK     = 3,
    G1_Style_Code   = 4,
    G1_Style_Name   = 5,
    G1_Plan_Qty     = 6,
    G1_PROCESS_PK   = 7,
    G1_Process      = 8,
    G1_WI_Qty       = 9,
    G1_Prod_Qty     = 10,
    G1_Bal_Qty      = 11;        
 
var callerWindowObj = dialogArguments;     
   
var G2_LineGrpPK      = 0,
    G2_LineGrpID      = 1,
    G2_LineGrpName    = 2,    
    G2_thr_group_pk   = 3;
    
var G3_Chk              = 0,
    G3_Line_Group_PK    = 1,
    G3_Line_Group_Name  = 2,
    G3_Date             = 3,
    G3_Day              = 4,
    G3_Shift            = 5,
    G3_Line_Capa_Qty    = 6,
    G3_WI_Qty           = 7,
    G3_Bal_Qty          = 8;        

var G4_No               = 0,
    G4_ORDPLAN_PK       = 1,
    G4_ARRAY_SO_PK      = 2,
    G4_PO_No            = 3,
    G4_STYLE_PK         = 4,
    G4_Style_Code       = 5,
    G4_Style_Name       = 6,
    G4_Process_PK       = 7,
    G4_Process_Name     = 8,
    G4_Line_Group_PK    = 9,
    G4_Line_Group_Name  = 10,
    G4_WI_Date          = 11,
    G4_Shift            = 12,
    G4_WI_Qty           = 13,
    G4_Description      = 14,
    G4_WI_PK            = 15; 
     
 //=========================================================================
 function BodyInit()
 {
    System.Translate(document);
    dtWorkTo.SetDataText(System.AddDate(dtWorkFrom.GetData(),+7));
    //-----------------------------------------------------
    BindingDataList();
    FormatGrid();
    
    SetSOList();
    //------------------------------------------------------
    OnSearch('lstProcess');
    //------------------------------------------------------
 } 
//=========================================================================

function BindingDataList()
{    
    var data="";    

    data = "<%=ESysLib.SetListDataSQL("SELECT pk, factory_name FROM prod.tpr_factory WHERE del_if = 0 ORDER BY factory_name")%>";
    lstFactory.SetDataText(data);
            
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT   pk, shift || ' ( ' || start_time || ' - ' || end_time || ' )' FROM hr.thr_work_shift WHERE del_if = 0 ORDER BY shift " )  %> " ; 
    grdCalendar.SetComboFormat( G3_Shift, data);    
    grdDetail.SetComboFormat( G4_Shift, data);
}  
//=========================================================================

function FormatGrid()
{    
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G1_Plan_Qty) = "###,###,###,###";
    ctrl.ColFormat(G1_Bal_Qty)  = "###,###,###,###";
    //-----------------------------------
    ctrl = grdCalendar.GetGridControl();
    
    ctrl.ColFormat(G3_Line_Capa_Qty) = "###,###,###,###";
    ctrl.ColFormat(G3_WI_Qty)        = "###,###,###,###";
    ctrl.ColFormat(G3_Bal_Qty)       = "###,###,###,###";    
    //-----------------------------------
    ctrl = grdDetail.GetGridControl();
    
    ctrl.ColFormat(G4_WI_Qty)  = "###,###,###,###";

} 
//=========================================================================

function SetSOList()
{
    var strSOPK = ""; 
    var strCon   = "";
            
    for ( var i = 1 ; i < callerWindowObj.grdOrdPlan.rows; i++ )
    {
        if ( callerWindowObj.grdOrdPlan.GetGridControl().isSelected(i) == true )
        {
            strSOPK = strSOPK + strCon + callerWindowObj.grdOrdPlan.GetGridData( i, callerWindowObj.G1_ORDPLAN_PK );
            strCon  = ","; 
        }
    } 
    //-----------------------------
    txtOrdPlanPK.text = strSOPK ;
    //-----------------------------
  
}
//=========================================================================

 function OnSearch(pos)
 {
     switch(pos)
     {
            case 'lstProcess' :
                pro_fppw00071.Call();
            break;
                 
            case 'grdOrdPlan' :
                data_fppw00071.Call("SELECT");
            break;
                 
            case 'grdDetail' :
                data_fppw00071_3.Call("SELECT");
            break;
                 
            case 'grdLineGroup' :
                data_fppw00071_1.Call("SELECT");
            break;
            
            case 'grdCalendar' : 
            
                SetLineList();    
                
                data_fppw00071_2.Call('SELECT');
      
            break;       
     }
 }
//=========================================================================

function SetLineList()
{    
    var strLinePK = ""; 
    var strCon   = "";
    
    if ( grdLineGroup.GetGridControl().SelectedRows > 0 )
    {
		for ( i=0; i< grdLineGroup.GetGridControl().SelectedRows ; i++)
		{
			var row = grdLineGroup.GetGridControl().SelectedRow(i);
			
            strLinePK = strLinePK + strCon + grdLineGroup.GetGridData( row, G2_LineGrpPK );
            strCon   = ","; 
		}
    }
    //-----------------------------
    txtLineGroupPK.text = strLinePK ;
    //-----------------------------
  
}

 //=========================================================================
function CalBalance()
{
    var sum_wi_qty = 0; 

    for ( var i=1; i < grdOrdPlan.rows - 1; i++ )
    {
        sum_wi_qty = 0 ;
        
        for ( var j = 1; j < grdDetail.rows; j++ )
        {
            if ( grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK) == grdDetail.GetGridData( j, G4_ORDPLAN_PK) && grdOrdPlan.GetGridData( i, G1_PROCESS_PK) == grdDetail.GetGridData( j, G4_Process_PK) )
            {
                sum_wi_qty = sum_wi_qty + Number(grdDetail.GetGridData( j, G4_WI_Qty)) ;
            }
        }
        //------------
        grdOrdPlan.SetGridText( i, G1_WI_Qty, Number(sum_wi_qty) );
        var t_qty = Number(grdOrdPlan.GetGridData( i, G1_Plan_Qty)) - Number(sum_wi_qty);
        grdOrdPlan.SetGridText( i, G1_Bal_Qty, t_qty );
        //------------
    }
    //------------------------    
}
 //=========================================================================
function OnToggle(direction)
{
   
    if ( direction == 'UP')
    {
        if ( grdOrdPlan.row != grdOrdPlan.rows-1  )
        { 
            grdOrdPlan.UpRow();
        }    
    }
    else if ( direction == 'DOWN' )
    {
        if ( grdOrdPlan.row < grdOrdPlan.rows-2 )
        {
            grdOrdPlan.DownRow();
        }
    }
    else if ( direction == 'Line' ) 
    {   
    
        var left  = document.all("t-left");    
        var right = document.all("t-right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left.style.display="none";       
            imgArrow.status = "collapse";
            right.style.width="99%";
            imgArrow.src = "../../../system/images/button/next.gif";
        }
        else
        {
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../system/images/button/previous.gif";
        }
    }        
}
 //=========================================================================

function OnPopUp(pos)    
{
    switch(pos)
    {
        case 'LineCapacity' :
            var p_line_grp_pk = '' ;
            
            if ( grdLineGroup.row > 0 )
            {
                p_line_grp_pk = grdLineGroup.GetGridData( grdLineGroup.row, G2_LineGrpPK );
            }
            
            var fpath = System.RootURL + "/form/fp/ab/fpab00060.aspx?linegroup_pk=" + p_line_grp_pk ;
            var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:500px');	
        break;
    }
}
    

 //=========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    { 
        case "pro_fppw00071" :
            //----------------------------
            if ( callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G1_PROCESS_PK ) != '' )
            {
                lstProcess.value = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G1_PROCESS_PK ) ;
            }
            else
            {
                lstProcess.value = '' ;
            }
            //----------------------------        
            OnSearch('grdDetail');
        break;
        
        case "data_fppw00071" :
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBold( 1, G1_PO_No,    grdOrdPlan.rows - 1, G1_PO_No,    true);
                grdOrdPlan.SetCellBold( 1, G1_Plan_Qty, grdOrdPlan.rows - 1, G1_Plan_Qty, true);
                grdOrdPlan.SetCellBold( 1, G1_WI_Qty,   grdOrdPlan.rows - 1, G1_Bal_Qty,  true);

                grdOrdPlan.Subtotal( 0, 2, -1, '6!9!10!11','###,###,###');
            }
            //------------------------------------
            OnSearch('grdLineGroup');   
        break;
        
        case "data_fppw00071_3" :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G4_PO_No,  grdDetail.rows - 1, G4_PO_No,  true);
                grdDetail.SetCellBold( 1, G4_WI_Qty, grdDetail.rows - 1, G4_WI_Qty, true);
            }        
            //------------------------------------
            OnSearch('grdOrdPlan');            
        break;
                           
        case "data_fppw00071_1" :

            OnSearch('grdCalendar');
        break;

        case "data_fppw00071_2" :
        break;        
    }
}
 //=========================================================================
function OnSave(pos)
{
    switch(pos)
    { 
        case 'grdDetail' :
            data_fppw00071_3.Call();;
        break;        
    }    

}
 //=========================================================================

 function OnUnDelete() 
 {
        grdDetail.UnDeleteRow() ;
 }
 
 //=========================================================================
 function  OnDelete()
 {
    var ctrl = grdDetail.GetGridControl();
    
    if ( grdDetail.GetGridData( ctrl.row, G4_WI_PK  ) == "" ) 
    {						
	     grdDetail.RemoveRow();					
    }			
    else 
    {
        if ( confirm( "Do you want to mark this row to delete?" ) ) 
        {
	        grdDetail.DeleteRow();
        }
     }
 }
//====================================================================================
 
 function OnProcess(pos)
 {
    switch (pos)
    {            
        case 'Refresh' :
            OnSearch('grdDetail');
        break;
        
        case 'SetLine' :
            if ( grdLineGroup.row > 0 )
            {
            }
            else
            {
                alert('PLS SELECT ONE LINE GROUP.');
                return;
            }
            //----------------------------------------
            
            for ( var i = 1 ; i < grdOrdPlan.rows - 1 ; i++ )
            {
                var wi_bal_qty = Number(grdOrdPlan.GetGridData( i, G1_Bal_Qty )) ;
                
                if ( wi_bal_qty > 0 )
                {
                    for ( var t = 1; t < grdCalendar.rows ; t++ )
                    {
                        var line_bal = Number(grdCalendar.GetGridData( t, G3_Bal_Qty ));  
                      
                        while ( wi_bal_qty > 0 && grdCalendar.GetGridData( t, G3_Chk ) == '-1' && line_bal > 0 )
                        {
                            var wi_qty ;
                            //-------------
                            if ( wi_bal_qty > line_bal )
                            {
                                wi_qty = line_bal ;
                            }
                            else
                            {
                                wi_qty = wi_bal_qty ;
                            }
                            //----------------------------------------------------             
                            grdDetail.AddRow();
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G4_ORDPLAN_PK,  grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK  ) ); 
                            grdDetail.SetGridText( grdDetail.rows-1, G4_ARRAY_SO_PK, grdOrdPlan.GetGridData( i, G1_ARRAY_SO_PK ) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_PO_No,       grdOrdPlan.GetGridData( i, G1_PO_No       ) );
                             
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Process_PK,   grdOrdPlan.GetGridData( i, G1_PROCESS_PK ) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Process_Name, grdOrdPlan.GetGridData( i, G1_Process    ) );
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G4_STYLE_PK,   grdOrdPlan.GetGridData( i, G1_STYLE_PK   ) );                             
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Code, grdOrdPlan.GetGridData( i, G1_Style_Code ) ); 
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Name, grdOrdPlan.GetGridData( i, G1_Style_Name ) );
                             
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_PK,   grdCalendar.GetGridData( t, G3_Line_Group_PK   ) ); 
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_Name, grdCalendar.GetGridData( t, G3_Line_Group_Name ) );
                             
                            grdDetail.SetGridText( grdDetail.rows-1, G4_WI_Date, grdCalendar.GetGridData( t, G3_Date  ) ); 
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Shift,   grdCalendar.GetGridData( t, G3_Shift ) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_WI_Qty,  wi_qty                                );                         
                            
                            grdDetail.SetCellBgColor( grdDetail.rows-1, 0, grdDetail.rows-1, grdDetail.cols-1, 0xCCFF99 );
                            //-------------------------------------                
                            wi_bal_qty = wi_bal_qty - wi_qty ;
                            
                            line_bal   = line_bal - wi_qty ;
                            //===================================== 
                            grdCalendar.SetGridText( t, G3_Bal_Qty, line_bal );
                            grdCalendar.SetGridText( t, G3_WI_Qty,  Number(grdCalendar.GetGridData( t, G3_WI_Qty)) + wi_qty );
                            //=====================================                   
                        }
                    }
                    //-----------------------------
                 }    
            } 
            //--------------------------------
            CalBalance();
            //--------------------------------
        break;
    }    
 }
//====================================================================================
 function CheckInput(obj)
 { 
    switch (obj.id)
    {
        case "grdDetail":
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            

            if ( col == G4_WI_Qty )
            {
                var dQuantiy
                
                dQuantiy =  grdDetail.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdDetail.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdDetail.SetGridText(row,col,"")
                }
            }
        break;
        
        case "grdCalendar":
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            

            if ( col == G3_Line_Capa_Qty || col == G3_Bal_Qty )
            {
                var dQuantiy
                
                dQuantiy =  grdCalendar.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdCalendar.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdCalendar.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdCalendar.SetGridText(row,col,"")
                }
                //-------------------------------------
                if ( col == G3_Line_Capa_Qty )
                {
                    var bal_qty ;
                    
                    bal_qty = Number( grdCalendar.GetGridData( row, G3_Line_Capa_Qty)) - Number( grdCalendar.GetGridData( row, G3_WI_Qty))  ;
                    
                    grdCalendar.SetGridText( row, G3_Bal_Qty, parseFloat(bal_qty+"").toFixed(0));
                
                }             
                //-------------------------------------
            }
        break;        
    }       
}     
//============================================================================

function OnAddNew()
{
        //---------------------------------------------------- 
        for ( var i = 1 ; i < grdOrdPlan.rows - 1 ; i++ )
        {
            for ( var t = 1; t < grdCalendar.rows ; t++ )
            {
                if ( grdCalendar.GetGridData( t, G3_Chk ) == '-1' )
                {
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G4_ORDPLAN_PK,  grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK  ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_ARRAY_SO_PK, grdOrdPlan.GetGridData( i, G1_ARRAY_SO_PK ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_PO_No,       grdOrdPlan.GetGridData( i, G1_PO_No       ) ); 

                    grdDetail.SetGridText( grdDetail.rows-1, G4_Process_PK,   grdOrdPlan.GetGridData( i, G1_PROCESS_PK ) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Process_Name, grdOrdPlan.GetGridData( i, G1_Process    ) );
                                        
                    grdDetail.SetGridText( grdDetail.rows-1, G4_STYLE_PK,   grdOrdPlan.GetGridData( i, G1_STYLE_PK   ) );                   
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Code, grdOrdPlan.GetGridData( i, G1_Style_Code ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Name, grdOrdPlan.GetGridData( i, G1_Style_Name ) );
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_PK,   grdCalendar.GetGridData( t, G3_Line_Group_PK   ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_Name, grdCalendar.GetGridData( t, G3_Line_Group_Name ) );
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G4_WI_Date, grdCalendar.GetGridData( t, G3_Date ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Shift,   grdCalendar.GetGridData( t, G3_Shift ) );                    
                    
                    grdDetail.SetCellBgColor( grdDetail.rows-1, 0, grdDetail.rows-1, grdDetail.cols-1, 0xCCFFFF );
                }                    
            }                
        } 
        //--------------------------------      
}

//============================================================================

function OnMapItem()
{
        //---------------------------------------------------- 
	if ( grdLineGroup.row > 0 )
        {

        	for ( var i = 1 ; i < grdOrdPlan.rows - 1 ; i++ )
        	{
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G4_ORDPLAN_PK,  grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK  ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_ARRAY_SO_PK, grdOrdPlan.GetGridData( i, G1_ARRAY_SO_PK ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_PO_No,       grdOrdPlan.GetGridData( i, G1_PO_No       ) ); 

                    grdDetail.SetGridText( grdDetail.rows-1, G4_Process_PK,   grdOrdPlan.GetGridData( i, G1_PROCESS_PK ) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Process_Name, grdOrdPlan.GetGridData( i, G1_Process    ) );
                                        
                    grdDetail.SetGridText( grdDetail.rows-1, G4_STYLE_PK,   grdOrdPlan.GetGridData( i, G1_STYLE_PK   ) );                   
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Code, grdOrdPlan.GetGridData( i, G1_Style_Code ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Style_Name, grdOrdPlan.GetGridData( i, G1_Style_Name ) );
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_PK,   grdLineGroup.GetGridData( grdLineGroup.row, G2_LineGrpPK   ) ); 
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Line_Group_Name, grdLineGroup.GetGridData( grdLineGroup.row, G2_LineGrpName ) );
                                         
                    grdDetail.SetCellBgColor( grdDetail.rows-1, 0, grdDetail.rows-1, grdDetail.cols-1, 0xCCFFFF );              
        	} 
	}
        else
        {
		alert('Pls Select one Work Group.');
        }
        //--------------------------------      
}

//============================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00071" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00071" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------grdOrdPlan------------------------------------->
    <gw:data id="data_fppw00071" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1" function="<%=l_user%>lg_sel_fppw00071" > 
                <input> 
                    <input bind="txtOrdPlanPK" />
                    <input bind="lstProcess" />  
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------grdDetail------------------------------------->
    <gw:data id="data_fppw00071_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_fppw00071_3" procedure="<%=l_user%>lg_upd_fppw00071_3" > 
                <input> 
                    <input bind="txtOrdPlanPK" />  
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------Line------------------------------------->
    <gw:data id="data_fppw00071_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppw00071_1" > 
                <input> 
                    <input bind="lstFactory" />
                    <input bind="lstProcess" />  
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------Canlendar------------------------------------->
    <gw:data id="data_fppw00071_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppw00071_2" > 
                <input> 
                    <input bind="txtLineGroupPK" /> 
                    <input bind="dtWorkFrom" /> 
                    <input bind="dtWorkTo" /> 
                </input> 
                <output bind="grdCalendar" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='top' style="height: 20%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 100%">
                        <td style="width: 99%">
                            <gw:grid id='grdOrdPlan' header='_PP_ORDPLAN_PK|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|Plan Qty|_PB_PROCESS_PK|_Process|W/I Qty|Prod Qty|Bal Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|3|0|0|3|3|3' defaults='|||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|2000|0|1500|4000|1500|0|1500|1500|1500|1500'
                                sorting='F' styles='width:100%; height:100%' />
                        </td>
                        <td style="width: 1%">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td>
                                        <img status="expand" id="imgUp" src="../../../system/images/up.gif" style="cursor: hand"
                                            onclick="OnToggle('UP')" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img status="expand" id="imgDown" src="../../../system/images/down.gif" style="cursor: hand"
                                            onclick="OnToggle('DOWN')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch('grdDetail')"
                                csstype="mandatory" />
                        </td>
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 19%">
                            <gw:datebox id="dtWorkFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtWorkTo" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" onclick="OnSearch('grdCalendar')" />
                        </td>
                        <td style="width: 28%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnCapacity" img="2" text="Capacity" styles='width:100%' onclick="OnPopUp('LineCapacity')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnAdd" img="3" text="Set Line" styles='width:100%' onclick="OnProcess('SetLine')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 24%" id="t-left">
                                        <table style="width: 100%; height: 100%">
                                            <tr style="height: 1%">
                                                <td style="width: 99%">
                                                    <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdLineGroup')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnSearch3" img="search" onclick="OnSearch('grdLineGroup')" />
                                                </td>
                                            </tr>
                                            <tr style="height: 99%">
                                                <td colspan="2">
                                                    <gw:grid id='grdLineGroup' header='_PK|Line Group|Name|_thr_group_pk' format='0|0|0|0'
                                                        aligns='0|0|0|0' defaults='|||' editcol='0|0|0|0' widths='1000|1500|1000|1000'
                                                        sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdCalendar')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 1%">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand; position: center" onclick="OnToggle('Line')" />
                                    </td>
                                    <td style="width: 75%" id="t-right">
                                        <gw:grid id='grdCalendar' header='Chk|_LineGroupPK|Line Group|Date|Day|Shift|Line Capa|WI Qty|Bal Qty'
                                            format='3|0|0|4|0|0|0|0|0' aligns='0|0|0|1|0|0|3|3|3' editcol='0|0|0|0|0|0|1|0|1'
                                            widths='800|0|2000|1200|1500|1500|1200|1200|1200' sorting='T'
                                            styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%">
                            <gw:icon id="idBtnRefresh" img="2" text="Refresh" styles='width:100%' onclick="OnProcess('Refresh')" />
                        </td>
                        <td style="width: 94%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="new1" img="2" text="Add Item" styles='width:100%' onclick="OnMapItem()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="new" alt="Add New" id="btnNew" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="UDelete" alt="UnDelete" id="btnUdelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="save" alt="Save" id="btnSave3" onclick="OnSave('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='No|_PP_ORDPLAN_PK|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|_PB_PROCESS_PK|Process|_Line_Group_PK|Line Group|W/I Date|Shift|W/I Qty|Description|_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|1|0|3|0|0' defaults='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0' widths='1000|0|0|1500|0|1500|3000|0|1500|0|1500|1200|1200|1200|1000|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" styles="width:100%;display:none" />
<!------------------------------------------->
<gw:textbox id="txtLineGroupPK" styles='width:100%;display:none' />
<!------------------------------------------->
</html>
