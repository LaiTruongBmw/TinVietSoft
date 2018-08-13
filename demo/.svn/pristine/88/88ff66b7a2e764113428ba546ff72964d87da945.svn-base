<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Work Instruction PopUp</title>
</head>

<script>
var v_language      = "<%=Session("SESSION_LANG")%>";
var emp_pk          = "<%=Session("EMPLOYEE_PK") %>";
var full_name       = "<%=Session("USER_NAME") %>";
var po              = "<%=Request.QueryString("po_no") %>";
var so              = "<%=Request.QueryString("so_pk") %>";
var wi_cutting_ins  = "<%=Request.QueryString("wi_cutting") %>";
var p_style_pk      = "<%=Request.QueryString("style_pk") %>";
var p_style_code    = "<%=Request.QueryString("style_code") %>";
var p_style_name    = "<%=Request.QueryString("style_name") %>";

var flag_new = '';
var flag_save = 'N';
var rate = '';
var flag_recall = 'N';
var lot_id = 1 ;

var grdDataL_Check                  = 0,
    grdDataL_TPR_PATTERN_GROUP_PK   = 1,
    grdDataL_MAT_PK                 = 2,
    grdDataL_ITEM_CODE              = 3,
    grdDataL_ITEM_NAME              = 4,
    grdDataL_COLOR_SPEC_PK          = 5,
    grdDataL_COLOR                  = 6,
    grdDataL_PLAN_QTY               = 7,
    grdDataL_WI_QTY                 = 8,
    grdDataL_BALANCE                = 9,
    grdDataL_MAT_QTY                = 10;    
    
var grdDataR_COLOR                  = 0,
    grdDataR_LOT_ID                 = 1,
    grdDataR_LOT_QTY                = 2,
    grdDataR_LOT_TYPE               = 3,
    grdDataR_SIZE_1                 = 4,
    grdDataR_SIZE_2                 = 5,
    grdDataR_SIZE_3                 = 6,
    grdDataR_SIZE_4                 = 7,
    grdDataR_SIZE_5                 = 8,
    grdDataR_SIZE_6                 = 9,
    grdDataR_SIZE_7                 = 10,
    grdDataR_SIZE_8                 = 11,
    grdDataR_SIZE_9                 = 12,
    grdDataR_SIZE_10                = 13,
    grdDataR_TOTAL_WI_QTY           = 14,
    grdDataR_Mat_Code               = 15,
    grdDataR_Mat_Name               = 16,
    grdDataR_NET_UNIT_QTY           = 17,
    grdDataR_GROSS_QTY              = 18,
    grdDataR_DESCRIPTION            = 19,
    grdDataR_SEQ_NUM                = 20,
    grdDataR_PK                     = 21,
    grdDataR_WI_CUTTING_INS_PK      = 22,
    grdDataR_TPR_PATTERN_GROUP_PK   = 23,
    grdDataR_MAT_PK                 = 24;
    
var grdTemp_COL_1               = 0,
    grdTemp_COL_2               = 1,
    grdTemp_COL_3               = 2,
    grdTemp_COL_4               = 3,
    grdTemp_COL_5               = 4,
    grdTemp_COL_6               = 5,
    grdTemp_COL_7               = 6,
    grdTemp_COL_8               = 7,
    grdTemp_COL_9               = 8,
    grdTemp_COL_10              = 9,
    grdTemp_COL_11              = 10,
    grdTemp_COL_12              = 11,
    grdTemp_COL_13              = 12,
    grdTemp_COL_14              = 13,
    grdTemp_COL_15              = 14,
    grdTemp_COL_16              = 15,
    grdTemp_COL_17              = 16,
    grdTemp_COL_18              = 17,
    grdTemp_COL_19              = 18,
    grdTemp_COL_20              = 19;
    
var grdTemp_1_COL_1               = 0,
    grdTemp_1_COL_2               = 1,
    grdTemp_1_COL_3               = 2,
    grdTemp_1_COL_4               = 3,
    grdTemp_1_COL_5               = 4,
    grdTemp_1_COL_6               = 5,
    grdTemp_1_COL_7               = 6,
    grdTemp_1_COL_8               = 7,
    grdTemp_1_COL_9               = 8,
    grdTemp_1_COL_10              = 9,
    grdTemp_1_COL_11              = 10,
    grdTemp_1_COL_12              = 11,
    grdTemp_1_COL_13              = 12,
    grdTemp_1_COL_14              = 13,
    grdTemp_1_COL_15              = 14,
    grdTemp_1_COL_16              = 15,
    grdTemp_1_COL_17              = 16,
    grdTemp_1_COL_18              = 17,
    grdTemp_1_COL_19              = 18,
    grdTemp_1_COL_20              = 19,
    grdTemp_1_MAT_PK              = 20,
    grdTemp_1_LOT_ID              = 21;
//===============================================================================
   
function BodyInit()
{
    //-----------------------------
    txtChargerName.SetEnable(false);    
    txtPONo.SetEnable(false);
    txtStyleCode.SetEnable(false);
    txtStyleName.SetEnable(false);
    txtMatCode.SetEnable(false);
    txtMatName.SetEnable(false);
    txtGroupName.SetEnable(false);
    //-----------------------------
    var callerWindowObj = dialogArguments;    
      
    txtArraySOPK.text = callerWindowObj.txtArraySOPK.text ;
    txtPONo.text      = callerWindowObj.txtPONo.text ;
    txtStylePK.text   = callerWindowObj.txtStylePK.text;
    txtStyleCode.text = callerWindowObj.txtStyleCode.text ;
    txtStyleName.text = callerWindowObj.txtStyleName.text ;  
    
    txtGroupPK.text = callerWindowObj.txtGroupPK.text ;
    txtGroupName.text = callerWindowObj.txtGroupName.text ;  
    //-----------------------------
    OnSearch('PatternList'); 
    //-----------------------------   
}
//===============================================================================
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display     = "none";
            right.style.display    = "";                              
            
            right.style.width  ="99%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display     = "";
            right.style.display    = "";
            
            left.style.width   ="48%";
            right.style.width  ="48%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="99%";
            
            right.style.display    = "";       
            right.style.display    = "none";            
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";            
                    
            left.style.width   ="48%";
            right.style.width  ="48%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//===============================================================================

function FormatGrid()
{
    
    var ctrl = grdDataR.GetGridControl();    
    ctrl.ColFormat(grdDataR_LOT_QTY)      = "###,###,###" ;
    ctrl.ColFormat(grdDataR_TOTAL_WI_QTY) = "###,###,###" ;
    ctrl.ColFormat(grdDataR_NET_UNIT_QTY) = "###,###,###.###" ;
    ctrl.ColFormat(grdDataR_GROSS_QTY)    = "###,###,###.###" ;
    
    ctrl.ColFormat(grdDataR_SIZE_1)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_2)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_3)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_4)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_5)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_6)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_7)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_8)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_9)       = "###,###,###" ;
    ctrl.ColFormat(grdDataR_SIZE_10)      = "###,###,###" ;
    
    var ctrl = grdDataL.GetGridControl();    
    ctrl.ColFormat(grdDataL_PLAN_QTY)    = "###,###,###" ;
    ctrl.ColFormat(grdDataL_WI_QTY)      = "###,###,###" ;
    ctrl.ColFormat(grdDataL_BALANCE)     = "###,###,###" ;
}
//===============================================================================

function MergeColumn()
{
    var ctrl = grdDataR.GetGridControl() ;
      
    ctrl.MergeCells  = 2 ;	
    
    ctrl.MergeCol(grdDataR_COLOR)            = true ;
    ctrl.MergeCol(grdDataR_LOT_ID)           = true ;
    ctrl.MergeCol(grdDataR_LOT_QTY)          = true ;
}

function OnChangeGrid()
{

}

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_fpcw00141':
        break;
        
        case 'data_sel_fpcw00121':
            if (flag_new == 'N')
            {
                // select gridDataL
                if (flag_save == 'Y')   // Save or Delete                
                {
                    for(i = 1 ; i < grdDataR.rows; i++)
                    {
                        // set WI_PK for gridDataR
                        grdDataR.SetGridText( i, grdDataR_WI_CUTTING_INS_PK, txtPK_Cutting.text);
                    }
                    data_sel_fpcw00121_3.Call();
                }
                else
                    data_sel_fpcw00121_1.Call('SELECT');
            }
            else
            {
                if (grdDataR.rows <= 1)
                    return;
                else
                {
                    for(i = 1 ; i < grdDataR.rows; i++)
                    {
                        // set WI_PK for gridDataR
                        grdDataR.SetGridText( i, grdDataR_WI_CUTTING_INS_PK, txtPK_Cutting.text);
                    }
                    data_sel_fpcw00121_3.Call();
                }
            }
            
            if ( txtPK_Cutting.text != '' )
            {
                lstPattern.SetEnable(false);
            }
            else
            {
                lstPattern.SetEnable(true);
            }
            
        break;
        case 'data_pro_fpcw00121_1':
            data_pro_fpcw00121_2.Call();
        break;
        case 'data_pro_fpcw00121_2':
            data_sel_fpcw00121_1.Call('SELECT');
        break;
        case 'data_sel_fpcw00121_1':
            grdDataR.ClearData();
            grdDataTemp.ClearData();
            
            if (flag_new == 'N')
            {
                if ( grdDataL.rows > 1 )
                {
                    data_sel_fpcw00121_3.Call('SELECT');
                }
            }
        break;
        case 'data_sel_fpcw00121_2':
            var first = 0;
            var count= 4;
            var max = 4;
            
            if (grdDataTemp.rows <= 1)
                return;
                
            for (rowTemp = 1; rowTemp < grdDataTemp.rows; rowTemp++) 
            {
                // Add data to grdTempData
                grdDataTemp_1.AddRow();
                for(colTemp = 0; colTemp < grdDataTemp.cols - 1; colTemp++)
                {
                    // set data cols qty, mat_pk
                    grdDataTemp_1.SetGridText(grdDataTemp_1.rows-1, colTemp, grdDataTemp.GetGridData(rowTemp, colTemp));
                }
                
                lot_id = grdDataR.GetGridData(grdDataR.rows-1, grdDataR_LOT_ID);
                
                if (isNaN(lot_id))
                    lot_id = 0;
                
                lot_id++;
                    
                // set data col lot_id
                grdDataTemp_1.SetGridText(grdDataTemp_1.rows-1, grdDataTemp.cols, lot_id);
                
                // set data col MAT_PK from grdDataL to grdDataR
                grdDataTemp_1.SetGridText(grdDataTemp_1.rows-1, grdTemp_1_MAT_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK));
                
                /* Plan Qty */
                grdDataR.AddRow();
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_MAT_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_TPR_PATTERN_GROUP_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_TPR_PATTERN_GROUP_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_COLOR, grdDataL.GetGridData(grdDataL.row , grdDataL_COLOR));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_TYPE, 'Plan Qty');
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SEQ_NUM,  1        );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_ID,   lot_id   );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_QTY,  0        );
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_1,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_1 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_2,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_2 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_3,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_3 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_4,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_4 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_5,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_5 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_6,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_6 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_7,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_7 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_8,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_8 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_9,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_9 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_10, grdDataTemp.GetGridData( rowTemp, grdTemp_COL_10));
                
                /* Balance Qty */
                grdDataR.AddRow();
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_MAT_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_TPR_PATTERN_GROUP_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_TPR_PATTERN_GROUP_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_COLOR, grdDataL.GetGridData(grdDataL.row , grdDataL_COLOR));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_TYPE, 'Balance Qty');
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SEQ_NUM,  2         );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_ID,   lot_id    );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_QTY,  0        );

                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_1,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_1 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_11 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_2,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_2 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_12 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_3,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_3 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_13 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_4,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_4 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_14 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_5,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_5 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_15 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_6,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_6 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_16 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_7,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_7 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_17 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_8,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_8 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_18 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_9,  grdDataTemp.GetGridData( rowTemp, grdTemp_COL_9 ) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_19 ));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SIZE_10, grdDataTemp.GetGridData( rowTemp, grdTemp_COL_10) - grdDataTemp.GetGridData( rowTemp, grdTemp_COL_20 ));
                
                /* Assort */                
                grdDataR.AddRow();
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_MAT_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_TPR_PATTERN_GROUP_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_TPR_PATTERN_GROUP_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_COLOR, grdDataL.GetGridData(grdDataL.row , grdDataL_COLOR));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_TYPE, 'Assort');
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SEQ_NUM,  3        );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_ID,   lot_id   );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_QTY,  0        );
                
                /* WI Qty */                
                grdDataR.AddRow();
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_MAT_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_TPR_PATTERN_GROUP_PK, grdDataL.GetGridData(grdDataL.row, grdDataL_TPR_PATTERN_GROUP_PK));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_COLOR, grdDataL.GetGridData(grdDataL.row , grdDataL_COLOR));
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_TYPE, 'WI Qty');
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_SEQ_NUM,  4       );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_ID,   lot_id  );
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_LOT_QTY,  0        );
                
                grdDataR.SetGridText( grdDataR.rows-1, grdDataR_NET_UNIT_QTY, grdDataL.GetGridData( grdDataL.row, grdDataL_MAT_QTY));
                
                /* Lot ID */
//                        alert(grdDataR.GetGridData( grdDataR.rows-1, grdDataR_LOT_ID ));
//                        lot_id = grdDataR.GetGridData( grdDataR.rows-1, grdDataR_LOT_ID );
                lot_id++;
            }
            
            lbRecord.text = grdDataR.rows - 1 + ' record(s)';
            
            //---------------------------------set Balance------------------------------------------------------
            for(t = 1; t < grdDataTemp_1.rows; t++)
            {
                if (grdDataR.GetGridData(grdDataR.rows-4, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(t, grdTemp_1_MAT_PK) 
                 && grdDataR.GetGridData(grdDataR.rows-4, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(t, grdTemp_1_LOT_ID))
                {
                    p_row = grdDataR.rows - 2;
                    
                    for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
                    {   
                        t_wi_qty = 0;
                        
                        // set row WI_QTY
                        grdDataR.SetGridText(p_row, col, Number(grdDataR.GetGridData(p_row-1, col)) * Number(grdDataR.GetGridData(grdDataR.rows-4, grdDataR_LOT_QTY)));                    
                    
                        p_color    = grdDataR.GetGridData(grdDataR.rows-4, grdDataR_COLOR);
                        p_lot_id   = grdDataR.GetGridData(grdDataR.rows-4, grdDataR_LOT_ID);
                        p_plan_qty = grdDataR.GetGridData(grdDataR.rows-4, col);
                        p_bal_qty  = 0;
                        
                        for(row = 1; row <= grdDataR.rows - 1; row++)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                            {
                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 4)
                                {
                                    t_wi_qty = Number(t_wi_qty) + Number(grdDataR.GetGridData(row, col));
                                }
                            }
                        }
                            
                        for(row = 1; row <= grdDataR.rows - 1; row++)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                            {
                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 2)
                                {
                                    for(rowTemp_1 = 1; rowTemp_1 < grdDataTemp_1.rows; rowTemp_1++)
                                    {
                                        if (grdDataR.GetGridData(row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_MAT_PK)
                                        && grdDataR.GetGridData(row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_LOT_ID))
                                            {
                                            switch(col)
                                            {
                                                case grdDataR_SIZE_1:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_11));
                                                break;
                                                
                                                case grdDataR_SIZE_2:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_12));
                                                break;
                                                
                                                case grdDataR_SIZE_3:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_13));
                                                break;
                                                
                                                case grdDataR_SIZE_4:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_14));
                                                break;
                                                
                                                case grdDataR_SIZE_5:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_15));
                                                break;
                                                
                                                case grdDataR_SIZE_6:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_16));
                                                break;
                                                
                                                case grdDataR_SIZE_7:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_17));
                                                break;
                                            }
                                        }
                                    }
                                    grdDataR.SetGridText(row, col, p_bal_qty);
                                }
                            }
                        }
                    }
                }
            }
            SetQty();
            //-----------------------------------------------------------------------------------------------------
            flag_save = 'N';
            
            AutoResizeCols();
        break;
        case 'data_sel_fpcw00121_3':            
            if (flag_save == 'Y')
            {
                lbStatus.text = 'Save Successfull';
                flag_save = 'N';                
            }
            AutoResizeCols();
            data_sel_fpcw00121_4.Call('SELECT');
        break;
        
        case 'data_sel_fpcw00121_4':
            //data_sel_fpcw00121_3.Call('SELECT');
        break;
    }
}

//=======================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Charger':
            var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
            var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:700px;dialogHeight:550px');	
            
            if ( obj != null )
            {
                txtChargerPK.SetDataText(obj[0]);
                txtChargerName.SetDataText(obj[2]);
            }
        break;
    }
}
//=======================================================================================

function OnSearch(obj)
{
    switch(obj)
    {
        case 'PatternList' :
            pro_fpcw00141.Call();
        break;
        
        case 'MST':
            txtPK_Cutting.SetDataText(txtWI_No.text);
            data_sel_fpcw00121.Call('SELECT');
        break;
        
        case 'DTL':
        
        break;
    }
}
//=======================================================================================

function OnDelete(obj)
{
    var n = 4;
    switch(obj)
    {
        case 'MST':
            if(confirm('Are you sure delete ?'))
            {
                flag_save = 'T';
                data_sel_fpcw00121.StatusDelete();
                data_sel_fpcw00121.Call();
            }
        break;
        case 'DTL':
            for(i = 1; i < grdDataR.rows; i++)
            {
                if (grdDataR.col == grdDataR_COLOR || grdDataR.col == grdDataR_LOT_ID || grdDataR.col == grdDataR_LOT_QTY)
                {   
                    if (grdDataR.GetGridControl().isSelected(i))
                    {
                        for(j = i; j < i + n; j++)
                        {
                            grdDataR.DeleteRowAt(j);    
                        }
                    }
                }
            }
        break;
    }  
}

function OnUnDelete(obj)
{
    var n = 4;
    switch(obj)
    {
        case 'DTL':
            for(i = 1; i < grdDataR.rows; i++)
            {
                if (grdDataR.col == grdDataR_COLOR || grdDataR.col == grdDataR_LOT_ID || grdDataR.col == grdDataR_LOT_QTY)
                {   
                    if (grdDataR.GetGridControl().isSelected(i))
                    {
                        for(j = i; j < i + n; j++)
                        {
                            grdDataR.UnDeleteRowAt(j);    
                        }
                    }
                }
            }
        break;  
    }
}

function OnRemoveRows()
{
    alert('Not yet.');
}

function OnSave(obj)
{
    switch(obj)
    {
        case 'MST':
            flag_save = 'Y';
            data_sel_fpcw00121.Call();
        break;
    }
}

function OnPrint()
{
    var url = System.RootURL + '/reports/fp/cw/fpcw00121.aspx?wi_pk=' + txtPK_Cutting.text;
	window.open(url);
	
}

function OnDBClick()
{
    txtCOLOR_SPEC_PK.text = grdDataL.GetGridData(grdDataL.row, grdDataL_COLOR_SPEC_PK);
    txtMatPKGRD.text = grdDataL.GetGridData(grdDataL.row, grdDataL_MAT_PK);
    data_sel_fpcw00121_2.Call('SELECT');
}

function OnClick()
{
    if (grdDataR.col != grdDataR_LOT_QTY)
    {
        if (grdDataR.GetGridData(grdDataR.row, grdDataR_SEQ_NUM) != '3')
            grdDataR.row = -1;
    }
}

function AfterEdit()
{
    var t_wi_qty = 0;
    var total = 0;
    var count = 0;
    var m = 4;    
    var p_row = 0;
    var t_run = 1 ;
    
    // edit rows Assort
    if (grdDataR.col == grdDataR_LOT_QTY || grdDataR.col == grdDataR_SIZE_1 || grdDataR.col == grdDataR_SIZE_2
     || grdDataR.col == grdDataR_SIZE_3 || grdDataR.col == grdDataR_SIZE_4  
     || grdDataR.col == grdDataR_SIZE_5 || grdDataR.col == grdDataR_SIZE_6
     || grdDataR.col == grdDataR_SIZE_7 || grdDataR.col == grdDataR_SIZE_8  
     || grdDataR.col == grdDataR_SIZE_9 || grdDataR.col == grdDataR_SIZE_10)    
    {
        if (isNaN(grdDataR.GetGridData(grdDataR.row, grdDataR.col)))
        {
            grdDataR.SetGridText(grdDataR.row, grdDataR.col, '');
            alert('You must input number.');
            return;
        }
        
        // edit row Assort        
        // check again
        
        if (grdDataR.col == grdDataR_LOT_QTY)
        {
            for(t = 1; t < grdDataTemp_1.rows; t++)
            {
                if (grdDataR.GetGridData(grdDataR.row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(t, grdTemp_1_MAT_PK) 
                 && grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(t, grdTemp_1_LOT_ID))
                {
                    p_row = grdDataR.row + 3;
                    
                    for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
                    {   
                        t_wi_qty = 0;
                        
                        // set row WI_QTY
                        grdDataR.SetGridText(p_row, col, Number(grdDataR.GetGridData(p_row-1, col)) * Number(grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_QTY)));                    
                    
                        p_color    = grdDataR.GetGridData(grdDataR.row + 2, grdDataR_COLOR);
                        p_lot_id   = grdDataR.GetGridData(grdDataR.row + 2, grdDataR_LOT_ID);
                        p_plan_qty = grdDataR.GetGridData(grdDataR.row, col);
                        p_bal_qty  = 0;
                        
                        for(row = 1; row <= grdDataR.rows - 1; row++)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                            {
                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 4)
                                {
                                    t_wi_qty = Number(t_wi_qty) + Number(grdDataR.GetGridData(row, col));
                                }
                            }
                        }
                            
                        for(row = 1; row <= grdDataR.rows - 1; row++)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                            {
                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 2)
                                {
                                    for(rowTemp_1 = 1; rowTemp_1 < grdDataTemp_1.rows; rowTemp_1++)
                                    {
                                        if (grdDataR.GetGridData(row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_MAT_PK)
                                        && grdDataR.GetGridData(row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_LOT_ID))
                                            {
                                            switch(col)
                                            {
                                                case grdDataR_SIZE_1:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_11));
                                                break;
                                                
                                                case grdDataR_SIZE_2:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_12));
                                                break;
                                                
                                                case grdDataR_SIZE_3:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_13));
                                                break;
                                                
                                                case grdDataR_SIZE_4:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_14));
                                                break;
                                                
                                                case grdDataR_SIZE_5:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_15));
                                                break;
                                                
                                                case grdDataR_SIZE_6:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_16));
                                                break;
                                                
                                                case grdDataR_SIZE_7:
                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_17));
                                                break;
                                            }
                                        }
                                    }
                                    grdDataR.SetGridText(row, col, p_bal_qty);
                                }
                            }
                        }
                    }
                }
            }
        }
        else
        {
            var p_lot_id, p_color, p_plan_qty, p_wi_qty, t_wi_qty = 0;
            var row_click = grdDataR.row;
            var col_click = grdDataR.col;
                                 
            for(t = 1; t < grdDataTemp_1.rows; t++)
            {
                if (grdDataR.GetGridData(grdDataR.row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(t, grdTemp_1_MAT_PK)
                 && grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(t, grdTemp_1_LOT_ID) )
                {
                    if (grdDataR.GetGridData(row_click-2, col_click) != '0')
                    {
                        // set row WI_QTY
                        grdDataR.SetGridText(row_click + 1, col_click, Number(grdDataR.GetGridData(row_click, col_click)) * Number(grdDataR.GetGridData(row_click, grdDataR_LOT_QTY)));
                    }
                }
            }
            
            // set rows Balance
            p_color    = grdDataR.GetGridData(grdDataR.row, grdDataR_COLOR);
            p_lot_id   = grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_ID);
            p_plan_qty = grdDataR.GetGridData(grdDataR.row-2, grdDataR.col);
            p_bal_qty  = 0;
            
            for(row = 1; row <= grdDataR.rows - 1; row++)
            {
                if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                {
                    if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 4)
                    {
                        t_wi_qty = Number(t_wi_qty) + Number(grdDataR.GetGridData(row, grdDataR.col));
                    }
                }
            }
                
            for(row = 1; row <= grdDataR.rows - 1; row++)
            {
                if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                {
                    if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 2)
                    {
                        for(rowTemp_1 = 1; rowTemp_1 < grdDataTemp_1.rows; rowTemp_1++)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_MAT_PK)
                            && grdDataR.GetGridData(row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_LOT_ID))
                                {
                                switch(grdDataR.col)
                                {
                                    case grdDataR_SIZE_1:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_11));
                                    break;
                                    
                                    case grdDataR_SIZE_2:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_12));
                                    break;
                                    
                                    case grdDataR_SIZE_3:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_13));
                                    break;
                                    
                                    case grdDataR_SIZE_4:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_14));
                                    break;
                                    
                                    case grdDataR_SIZE_5:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_15));
                                    break;
                                    
                                    case grdDataR_SIZE_6:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_16));
                                    break;
                                    
                                    case grdDataR_SIZE_7:
                                        p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_17));
                                    break;
                                }
                            }
                        }
                        grdDataR.SetGridText(row, grdDataR.col, p_bal_qty);
                    }
                }
            }
        }
    }
    SetQty();
}

function SetQty()
{
    // set all gridDataR
    // need mofify
    var m = 4;
    for(i = 1; i < grdDataR.rows; i++)
    {
        total = Number(grdDataR.GetGridData(i, grdDataR_SIZE_1)) + Number(grdDataR.GetGridData(i, grdDataR_SIZE_2))
              + Number(grdDataR.GetGridData(i, grdDataR_SIZE_3)) + Number(grdDataR.GetGridData(i, grdDataR_SIZE_4))
              + Number(grdDataR.GetGridData(i, grdDataR_SIZE_5)) + Number(grdDataR.GetGridData(i, grdDataR_SIZE_6))
              + Number(grdDataR.GetGridData(i, grdDataR_SIZE_7)) + Number(grdDataR.GetGridData(i, grdDataR_SIZE_8))
              + Number(grdDataR.GetGridData(i, grdDataR_SIZE_9)) + Number(grdDataR.GetGridData(i, grdDataR_SIZE_10));
              
        // set col Total Qty
        grdDataR.SetGridText(i, grdDataR_TOTAL_WI_QTY, total);
        
        if (i == m)
        {
            // set col Gross Qty
            grdDataR.SetGridText(i, grdDataR_GROSS_QTY, total * Number(grdDataR.GetGridData(i, grdDataR_NET_UNIT_QTY)));
            m = m + 4;
        }
    }
}

//=========================================================
function OnSetSizeRatio()
{
    if (txtSize01.text == '' && txtSize02.text == '' && txtSize03.text == '' && txtSize04.text == '' &&
        txtSize05.text == '' && txtSize06.text == '' && txtSize07.text == '')
    {
        alert('You must input qty.');
        return;
    }
    
    if (chkProcess.GetData() == 'Y')
    {    
        var n = 4;
        var i = 1;
        
        for(j = 1; j <= grdDataR.rows-1; j++)
        {
            if (grdDataTemp_1.GetGridData(i, grdTemp_1_MAT_PK) == grdDataR.GetGridData(j, grdDataR_MAT_PK)  
             && grdDataTemp_1.GetGridData(i, grdTemp_1_LOT_ID) == grdDataR.GetGridData(j, grdDataR_LOT_ID))
            {                
                if (j == n)
                {
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_1) != '0')
                    {                
                        // set rows ASSORT grdData                        
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_1, Number(txtSize01.text) );
                        // set rows WI_QTY
                        grdDataR.SetGridText( j, grdDataR_SIZE_1, Number(txtSize01.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        // set rows Balance grdData
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_1, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_1)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_11)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_1)) );
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_1, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_1, '0');
                    }
                    
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_2) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_2, Number(txtSize02.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_2, Number(txtSize02.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_2, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_2)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_12)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_2)) );                
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_2, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_2, '0');
                    }
                    
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_3) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_3, Number(txtSize03.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_3, Number(txtSize03.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_3, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_3)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_13)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_3)) );
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_3, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_3, '0');
                    }
                    
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_4) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_4, Number(txtSize04.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_4, Number(txtSize04.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_4, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_4)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_14)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_4)) );                
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_4, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_4, '0');
                    }
                        
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_5) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_5, Number(txtSize05.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_5, Number(txtSize05.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_5, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_5)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_15)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_5)) );
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_5, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_5, '0');
                    }
                    
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_6) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_6, Number(txtSize06.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_6, Number(txtSize06.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_6, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_6)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_16)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_6)) );
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_6, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_6, '0');
                    }
                    
                    if (grdDataR.GetGridData(j-3, grdDataR_SIZE_7) != '0')
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_7, Number(txtSize07.text) );
                        grdDataR.SetGridText( j, grdDataR_SIZE_7, Number(txtSize07.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                        grdDataR.SetGridText( j-2, grdDataR_SIZE_7, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_7)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_17)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_7)) );                
                    }
                    else
                    {
                        grdDataR.SetGridText( j-1, grdDataR_SIZE_7, '0' );
                        grdDataR.SetGridText( j, grdDataR_SIZE_7, '0');
                    }
                                                        
                    n = n + 4;
                    i++; // row grdDataTemp_1
                }
            }
        }
        
        // -------------------------------------set Balance-------------------------------------
        var aColor;
        var p_n = 1;
        var p_temp = 0;
        var count = 0;
                
        for(i = 1; i < grdDataL.rows; i++)
        {
            aColor = new Array();
            
            for(j = 1; j < grdDataR.rows; j++)
            {
                if (grdDataL.GetGridData(i, grdDataL_COLOR) == grdDataR.GetGridData(j, grdDataR_COLOR))
                {
                    count++;
                    
                    // duplicate color in grdDataR
                    if (count == 5)
                    {
                        aColor[0] = grdDataL.GetGridData(i, grdDataL_COLOR);
                    }
                }
            }
            
            count = 0;
            
            var p_start = 0;
            var p_end   = 0;
            
            if (aColor.length != 0)
            {
                for(i = 1; i < grdDataR.rows; i++)
                {
                    if ( aColor[0] == grdDataR.GetGridData(i, grdDataR_COLOR))
                    {
                        if (p_start == 0)
                            p_start = i;
                        
                        if (i == p_start)
                        {
                            // ------------------                            
                            for(t = 1; t < grdDataTemp_1.rows; t++)
                            {
                                if (grdDataR.GetGridData(p_n, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(t, grdTemp_1_MAT_PK) 
                                 && grdDataR.GetGridData(p_n, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(t, grdTemp_1_LOT_ID))
                                {
                                    for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
                                    {   
                                        t_wi_qty = 0;
                                  
                                        p_color    = grdDataR.GetGridData(p_start, grdDataR_COLOR);
                                        p_lot_id   = grdDataR.GetGridData(p_start, grdDataR_LOT_ID);
                                        p_plan_qty = grdDataR.GetGridData(p_start, col);
                                        p_bal_qty  = 0;
                                        
                                        for(row = 1; row <= grdDataR.rows - 1; row++)
                                        {
                                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                                            {
                                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 4)
                                                {
                                                    t_wi_qty = Number(t_wi_qty) + Number(grdDataR.GetGridData(row, col));
                                                }
                                            }
                                        }
                                            
                                        for(row = 1; row <= grdDataR.rows - 1; row++)
                                        {
                                            if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                                            {
                                                if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 2)
                                                {
                                                    for(rowTemp_1 = 1; rowTemp_1 < grdDataTemp_1.rows; rowTemp_1++)
                                                    {
                                                        if (grdDataR.GetGridData(row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_MAT_PK)
                                                        && grdDataR.GetGridData(row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_LOT_ID))
                                                            {
                                                            switch(col)
                                                            {
                                                                case grdDataR_SIZE_1:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_11));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_2:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_12));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_3:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_13));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_4:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_14));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_5:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_15));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_6:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_16));
                                                                break;
                                                                
                                                                case grdDataR_SIZE_7:
                                                                    p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_17));
                                                                break;
                                                            }
                                                        }
                                                    }
                                                    grdDataR.SetGridText(row, col, p_bal_qty);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            SetQty();
                            // ------------------
                            p_start = p_start + 4;
                        }
                    }
                }
            }
        }
        // -------------------------------------------------------------------------------------
    }
    else
    {
        if (grdDataR.row == '-1')
            return;
                
        if (grdDataR.col != grdDataR_LOT_QTY)
            return;
        
        for(t = 1; t < grdDataR.rows; t++)
        {   
            if (grdDataR.GetGridControl().isSelected(t))
            {
                var n = 4;
                var i = 1;
                var p_start = t;
                var p_end   = p_start + 3;
                
                for(j = p_start; j <= p_end; j++)
                {
                    for( i = 1; i < grdDataTemp_1.rows; i++)
                    {
                        if (grdDataTemp_1.GetGridData(i, grdTemp_1_MAT_PK) == grdDataR.GetGridData(j, grdDataR_MAT_PK)  
                         && grdDataTemp_1.GetGridData(i, grdTemp_1_LOT_ID) == grdDataR.GetGridData(j, grdDataR_LOT_ID))
                        {
                            if (j == p_end)
                            {
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_1) != '0')
                                {                
                                    // set rows ASSORT grdData                        
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_1, Number(txtSize01.text) );
                                    // set rows WI_QTY
                                    grdDataR.SetGridText( j, grdDataR_SIZE_1, Number(txtSize01.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    // set rows Balance grdData
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_1, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_1)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_11)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_1)) );
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_1, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_1, '0');
                                }
                                
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_2) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_2, Number(txtSize02.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_2, Number(txtSize02.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_2, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_2)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_12)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_2)) );                
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_2, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_2, '0');
                                }
                                
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_3) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_3, Number(txtSize03.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_3, Number(txtSize03.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_3, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_3)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_13)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_3)) );
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_3, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_3, '0');
                                }
                                
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_4) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_4, Number(txtSize04.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_4, Number(txtSize04.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_4, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_4)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_14)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_4)) );                
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_4, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_4, '0');
                                }
                                    
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_5) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_5, Number(txtSize05.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_5, Number(txtSize05.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_5, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_5)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_15)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_5)) );
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_5, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_5, '0');
                                }
                                
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_6) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_6, Number(txtSize06.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_6, Number(txtSize06.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_6, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_6)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_16)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_6)) );
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_6, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_6, '0');
                                }
                                
                                if (grdDataR.GetGridData(j-3, grdDataR_SIZE_7) != '0')
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_7, Number(txtSize07.text) );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_7, Number(txtSize07.text) * Number(grdDataR.GetGridData(j, grdDataR_LOT_QTY)) );
                                    grdDataR.SetGridText( j-2, grdDataR_SIZE_7, Number(grdDataR.GetGridData(j-3, grdDataR_SIZE_7)) - Number(grdDataTemp_1.GetGridData(i, grdTemp_COL_17)) - Number(grdDataR.GetGridData(j, grdDataR_SIZE_7)) );                
                                }
                                else
                                {
                                    grdDataR.SetGridText( j-1, grdDataR_SIZE_7, '0' );
                                    grdDataR.SetGridText( j, grdDataR_SIZE_7, '0');
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // ------------set Balance------------------
        for(t = 1; t < grdDataTemp_1.rows; t++)
        {
            if (grdDataR.GetGridData(grdDataR.row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(t, grdTemp_1_MAT_PK) 
             && grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(t, grdTemp_1_LOT_ID))
            {
                p_row = grdDataR.row + 3;
                
                for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
                {   
                    t_wi_qty = 0;
                    
                    // set row WI_QTY
                    grdDataR.SetGridText(p_row, col, Number(grdDataR.GetGridData(p_row-1, col)) * Number(grdDataR.GetGridData(grdDataR.row, grdDataR_LOT_QTY)));                    
                
                    p_color    = grdDataR.GetGridData(grdDataR.row + 2, grdDataR_COLOR);
                    p_lot_id   = grdDataR.GetGridData(grdDataR.row + 2, grdDataR_LOT_ID);
                    p_plan_qty = grdDataR.GetGridData(grdDataR.row, col);
                    p_bal_qty  = 0;
                    
                    for(row = 1; row <= grdDataR.rows - 1; row++)
                    {
                        if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 4)
                            {
                                t_wi_qty = Number(t_wi_qty) + Number(grdDataR.GetGridData(row, col));
                            }
                        }
                    }
                        
                    for(row = 1; row <= grdDataR.rows - 1; row++)
                    {
                        if (grdDataR.GetGridData(row, grdDataR_COLOR) == p_color)
                        {
                            if (grdDataR.GetGridData(row, grdDataR_SEQ_NUM) == 2)
                            {
                                for(rowTemp_1 = 1; rowTemp_1 < grdDataTemp_1.rows; rowTemp_1++)
                                {
                                    if (grdDataR.GetGridData(row, grdDataR_MAT_PK) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_MAT_PK)
                                    && grdDataR.GetGridData(row, grdDataR_LOT_ID) == grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_LOT_ID))
                                        {
                                        switch(col)
                                        {
                                            case grdDataR_SIZE_1:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_11));
                                            break;
                                            
                                            case grdDataR_SIZE_2:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_12));
                                            break;
                                            
                                            case grdDataR_SIZE_3:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_13));
                                            break;
                                            
                                            case grdDataR_SIZE_4:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_14));
                                            break;
                                            
                                            case grdDataR_SIZE_5:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_15));
                                            break;
                                            
                                            case grdDataR_SIZE_6:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_16));
                                            break;
                                            
                                            case grdDataR_SIZE_7:
                                                p_bal_qty = Number(p_plan_qty) - Number(t_wi_qty) - Number(grdDataTemp_1.GetGridData(rowTemp_1, grdTemp_1_COL_17));
                                            break;
                                        }
                                    }
                                }
                                grdDataR.SetGridText(row, col, p_bal_qty);
                            }
                        }
                    }
                }
            }
        }        
        // -----------------------------------------
    }
    //----------------------------------------------------------------------------------------
    n = 4;
    for(j = 1; j < grdDataR.rows; j++)
    {
        total = Number(grdDataR.GetGridData(j, grdDataR_SIZE_1)) + Number(grdDataR.GetGridData(j, grdDataR_SIZE_2))
             +  Number(grdDataR.GetGridData(j, grdDataR_SIZE_3)) + Number(grdDataR.GetGridData(j, grdDataR_SIZE_4))
             +  Number(grdDataR.GetGridData(j, grdDataR_SIZE_5)) + Number(grdDataR.GetGridData(j, grdDataR_SIZE_6))
             +  Number(grdDataR.GetGridData(j, grdDataR_SIZE_7));
             
        // set col TOTAY_QTY
        grdDataR.SetGridText(j, grdDataR_TOTAL_WI_QTY, total);
        
        if ( j == n)
        {
            // set col GROSS_QTY
            grdDataR.SetGridText(j, grdDataR_GROSS_QTY, total * Number(grdDataR.GetGridData(j, grdDataR_NET_UNIT_QTY)));
        
            n = n + 4;
        }
    }        
}

function AutoResizeCols()
{
    grdDataR.GetGridControl().AutoSize(grdDataR_COLOR, grdDataR_MAT_PK, false, 0);
}

function CheckRate(e)
{
    if (String.fromCharCode(e.keyCode) == rate )
        btnApply.SetEnable(false);
    else
        btnApply.SetEnable(true);
}

function OnChangeRate()
{    
/*
    rate = txtLossRate.text;
    var first = 0;
    var n = 0;
    
    for(row = 1; row < grdDataR.rows; row++)
    {
        if (row == 2)
        {   
            for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
            {    
                grdDataR.SetGridText(row, col, Number(grdDataR.GetGridData(row-1, col)) + (Number(grdDataR.GetGridData(row-1, col))*(rate/100))) ;
            }    
        }
        else
        {
            if (row > 2)
            {
                first++;
                
                if (first%4 == 0)
                {
                    n = first + 2;
                    
                    for(col = grdDataR_SIZE_1; col <= grdDataR_SIZE_10; col++)
                    {    
                        grdDataR.SetGridText(n, col, Number(grdDataR.GetGridData(n-1, col)) + (Number(grdDataR.GetGridData(n-1, col))*(rate/100))) ;
                    }    
                }
            }   
        }
    }    
    btnApply.SetEnable(false);
*/
}
//=========================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00141" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00141" > 
                <input>
                    <input bind="txtStylePK" />
                    <input bind="txtGroupPK" /> 
                </input> 
                <output>
                    <output bind="txtMatPK" />
                    <output bind="txtMatCode" />
                    <output bind="txtMatName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/I No</td>
            <td style="width: 25%">
                <gw:textbox id="txtWI_No" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line</td>
            <td style="width: 25%">
                <gw:list id="lstLine" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                W/I Date</td>
            <td style="width: 25%" align="left">
                <gw:datebox id="dtWI_Date" maxlen="10" text="" styles='width:100%' lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 10%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="width: 100%; height: 100%">
                        <td style="width: 96%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearchMST" onclick="OnSearch('MST')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDeleteMST" onclick="OnDelete('MST')" />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdateMST" onclick="OnSave('MST')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Charger')">Charger</b>
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtChargerPK" styles='width:100%;display: none' />
                <gw:textbox id="txtChargerName" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%" align="right">
                Desc</td>
            <td colspan="3">
                <gw:textbox id="txtDes" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 10%" align="center">
                <gw:label id="lbStatus" styles="color: cc0000; font: 9pt">Status</gw:label>
            </td>
        </tr>
        <tr style="height: 1%; background-color: #CCFFFF">
            <td colspan="7">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td colspan="6">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        P/O No</td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtArraySOPK" styles='width:100%;display: none' />
                                        <gw:textbox id="txtPONo" maxlen="100" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Style</td>
                                    <td style="width: 65%; white-space: nowrap">
                                        <gw:textbox id="txtStylePK" styles='width:100%;display: none' />
                                        <gw:textbox id="txtStyleCode" maxlen="100" styles='width:20%' />
                                        <gw:textbox id="txtStyleName" maxlen="100" styles='width:80%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Group</td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtGroupPK" styles='width:100%;display: none' />
                                        <gw:textbox id="txtGroupName" maxlen="100" styles='width:100%' csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Material</td>
                                    <td style="white-space: nowrap">
                                        <gw:textbox id="txtMatPK" styles='width:100%;display: none' />
                                        <gw:textbox id="txtMatCode" maxlen="100" styles='width:20%' />
                                        <gw:textbox id="txtMatName" maxlen="100" styles='width:80%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 60%; white-space: nowrap" align="right">
                            S
                            <gw:textbox id="txtSize01" styles='width:5%' />
                            &nbsp;&nbsp; M
                            <gw:textbox id="txtSize02" styles='width:5%' />
                            &nbsp;&nbsp; L
                            <gw:textbox id="txtSize03" styles='width:5%' />
                            &nbsp;&nbsp; XL
                            <gw:textbox id="txtSize04" styles='width:5%' />
                            &nbsp;&nbsp; 2XL
                            <gw:textbox id="txtSize05" styles='width:5%' />
                            &nbsp;&nbsp; 3XL
                            <gw:textbox id="txtSize06" styles='width:5%' />
                            &nbsp;&nbsp; 4XL
                            <gw:textbox id="txtSize07" styles='width:5%' />
                        </td>
                        <td style="width: 3%" align="left">
                            <gw:imgbtn img="process" alt="Set Size Ratio" id="btnSetSizeRatio" onclick="OnSetSizeRatio()" />
                        </td>
                        <td style="width: 20%" align="center">
                            <gw:label id="lbRecord" styles="color: Blue">record(s)</gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDeleteDTL" onclick="OnDelete('DTL')" />
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDeleteDTL" onclick="OnUnDelete('DTL')" />
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:icon id="btnRemove" img="2" text="Remove" onclick="OnRemoveRows()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 96%">
            <td colspan="7" style="border: 1px solid #034D72">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 100%">
                        <td id="t-left" style="width: 49%; white-space: nowrap" align="left">
                            <gw:grid id='grdDataL' header='_Select|_TPR_PATTERN_GROUP_PK|_MAT_PK|_Mat Code|_Mat Name|_COLOR_SPEC_PK|COLOR|Plan Qty|WI Qty|Blance|_Mat Qty'
                                format='3|0|0|0|0|0|0|1|1|1|1' aligns='0|0|0|0|0|0|0|3|3|3|3' defaults='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1500|8300|1000|1000|1000|1000|1000|0'
                                sorting='F' styles='width:100%; height:100%' oncelldblclick='OnDBClick()' />
                        </td>
                        <td style="width: 2%; white-space: nowrap" align="center">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('1')" />
                            <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('2')" />
                        </td>
                        <td id="t-right" style="width: 49%; white-space: nowrap" align="right">
                            <gw:grid id='grdDataR' header='Color|Lot ID|Lot Qty||S|M|L|XL|2XL|3XL|4XL|_size_8|_size_9|_size_10|Total Qty|_Mat Code|_Mat Name|Net Unit Qty|Gross Qty|Description|_seq_num|_pk|_wi_cutting_ins_pk|_tpr_pattern_group_pk|_mat_pk'
                                format='0|0|1|0|1|1|1|1|1|1|1|1|1|1|1|0|0|1|1|0|0|0|0|0|0' aligns='0|1|3|0|3|3|3|3|3|3|3|3|3|3|3|0|0|3|3|0|0|0|0|0|0'
                                editcol='0|1|1|0|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|1|0|0|0|0|0' defaults='||||||||||||||||||||||||'
                                widths='1500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|1500'
                                sorting='F' styles='width:100%; height:100%' onafteredit='AfterEdit()' oncellclick='OnClick()'
                                autosize='F' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtPK_Cutting" styles='width:100%;display: none' />
<gw:textbox id="txtPO" styles='width:100%;display: none' />
<gw:textbox id="txtMatPKGRD" styles='width:100%;display: none' />
<gw:textbox id="txtCOLOR_SPEC_PK" styles='width:100%;display: none' />
<!--------------------------------------------------------------------------->
<gw:grid id='grdDataTemp' header='1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
    defaults='|||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' sorting='T' styles='width:100%; height:200;display:none' />
<!--------------------------------------------------------------------------->
<gw:grid id='grdDataTemp_1' header='1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|mat_pk|lot_id'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
    defaults='|||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' sorting='T' styles='width:100%; height:200;display:none' />
<!--------------------------------------------------------------------------->
</html>
