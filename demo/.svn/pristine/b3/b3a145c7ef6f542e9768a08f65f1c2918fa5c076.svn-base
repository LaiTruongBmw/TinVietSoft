<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Cutting W/I PopUp</title>
</head>

<script>

var flag_save = 'N';

var G1_SPEC01_PK    = 0,
    G1_Spec_01      = 1,
    G1_SPEC02_PK    = 2,
    G1_Spec_02      = 3,
    G1_SPEC03_PK    = 4,
    G1_Spec_03      = 5,
    G1_SPEC04_PK    = 6,
    G1_Spec_04      = 7,
    G1_SPEC05_PK    = 8,
    G1_Spec_05      = 9,
    G1_Req_Qty      = 10,
    G1_WI_Qty       = 11,
    G1_Bal_Qty      = 12,
    G1_Remark       = 13,
    G1_ORDPLAN_PK   = 14,
    G1_PATTERN_GROUP_PK = 15;   

var G2_CUT_INSD_PK      = 0,
    G2_CUT_INS_PK       = 1,
    G2_CUTGRP_REQ_PK    = 2,
    G2_Lot_ID           = 3,
    G2_Lot_Qty          = 4,
    G2_SPEC01_PK        = 5,
    G2_Spec_01          = 6,
    G2_SPEC02_PK        = 7,
    G2_Spec_02          = 8,  
    G2_SPEC03_PK        = 9,
    G2_Spec_03          = 10,
    G2_SPEC04_PK        = 11,
    G2_Spec_04          = 12,
    G2_SPEC05_PK        = 13,    
    G2_Spec_05          = 14,
    G2_Size00_Qty       = 15,
    G2_Size01_Qty       = 16,
    G2_Size02_Qty       = 17,
    G2_Size03_Qty       = 18,
    G2_Size04_Qty       = 19,
    G2_Size05_Qty       = 20,
    G2_Size06_Qty       = 21,
    G2_Size07_Qty       = 22,
    G2_Size08_Qty       = 23,
    G2_Size09_Qty       = 24,
    G2_Size10_Qty       = 25,
    G2_Remark           = 26,
    G2_SEQ              = 27;
    
var G3_SPEC01_PK    = 0,
    G3_SPEC01_NM    = 1,
    G3_SPEC02_PK    = 2,
    G3_SPEC02_NM    = 3,
    G3_SPEC03_PK    = 4,
    G3_SPEC03_NM    = 5,
    G3_SPEC04_PK    = 6,
    G3_SPEC04_NM    = 7,
    G3_SPEC05_PK    = 8,
    G3_SPEC05_NM    = 9,
    G3_SIZE00_QTY   = 10,
    G3_SIZE01_QTY   = 11,
    G3_SIZE02_QTY   = 12,
    G3_SIZE03_QTY   = 13,
    G3_SIZE04_QTY   = 14,
    G3_SIZE05_QTY   = 15,
    G3_SIZE06_QTY   = 16,
    G3_SIZE07_QTY   = 17,
    G3_SIZE08_QTY   = 18,
    G3_SIZE09_QTY   = 19,
    G3_SIZE10_QTY   = 20,
    G3_REMARK       = 21,
    G3_CUTGRP_REQ_PK= 22,   
    G3_SEQ          = 23;
    
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
    txtPatternGroupName.SetEnable(false);
    txtWINo.SetEnable(false);
    //-----------------------------
    FormatGrid();
    MergeColumn();
    //----------------------------- 
    OnAddNew('Master');
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
            
            left.style.width   ="35%";
            right.style.width  ="63%";
            
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
                    
            left.style.width   ="35%";
            right.style.width  ="63%";
            
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
    var data = "<%=ESysLib.SetListDataSQL(" SELECT   a.pk, a.line_id || ' - ' || a.line_name FROM tlg_pb_line a, tlg_pb_process_linegroup b, tlg_pb_process c WHERE a.del_if = 0 AND a.use_yn = 'Y' AND b.del_if = 0 AND a.tlg_pb_line_group_pk = b.tlg_pb_line_group_pk AND c.del_if = 0 AND b.tlg_pb_process_pk = c.pk AND c.process_type = '10' ORDER BY line_id ")%>";     
    lstLine.SetDataText(data); 
          
    var ctrl = grdWIDetail.GetGridControl();
        
    ctrl.ColFormat(G2_Lot_Qty)    = "###,###,###" ;
    
    ctrl.ColFormat(G2_Size00_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size01_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size02_Qty) = "###,###,###" ;    
    ctrl.ColFormat(G2_Size03_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size04_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size05_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size06_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size07_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size08_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size09_Qty) = "###,###,###" ;
    ctrl.ColFormat(G2_Size10_Qty) = "###,###,###" ;
    
    var ctrl = grdCutReq.GetGridControl();    
    
    ctrl.ColFormat(G1_Req_Qty) = "###,###,###" ;
    ctrl.ColFormat(G1_WI_Qty)  = "###,###,###" ;
    ctrl.ColFormat(G1_Bal_Qty) = "###,###,###" ;
    
    grdWIDetail.GetGridControl().FrozenCols = G2_SPEC01_PK ;
}
//===============================================================================

function MergeColumn()
{
    var ctrl = grdWIDetail.GetGridControl() ;
      
    ctrl.MergeCells  = 2 ;	
    
    ctrl.MergeCol(0) = true ;
    ctrl.MergeCol(1) = true ;
    ctrl.MergeCol(2) = true ;
    ctrl.MergeCol(3) = true ;
    ctrl.MergeCol(4) = true ;
    ctrl.MergeCol(5) = true ;
    ctrl.MergeCol(6) = true ;
    ctrl.MergeCol(7) = true ;
    ctrl.MergeCol(8) = true ;
    ctrl.MergeCol(9) = true ;
    ctrl.MergeCol(10) = true ;
    ctrl.MergeCol(11) = true ;
    ctrl.MergeCol(12) = true ;
    ctrl.MergeCol(13) = true ;
    ctrl.MergeCol(14) = true ;
    
}
//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_fpcw00151':
            OnSearch('CutReq');
        break;
        
        case 'data_fpcw00151_1':
            for ( var i=1; i<grdDetailCutReq.rows; i++ )
            {      
                grdWIDetail.AddRow();
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_CUTGRP_REQ_PK , grdDetailCutReq.GetGridData( i, G3_CUTGRP_REQ_PK));
                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Lot_ID ,  Math.ceil( (grdWIDetail.rows-1)/3 ) );
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Lot_Qty , Number(txtLotQty.text) );
                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC01_PK , grdDetailCutReq.GetGridData( i, G3_SPEC01_PK));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_01 ,   grdDetailCutReq.GetGridData( i, G3_SPEC01_NM));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC02_PK , grdDetailCutReq.GetGridData( i, G3_SPEC02_PK));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_02 ,   grdDetailCutReq.GetGridData( i, G3_SPEC02_NM));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC03_PK , grdDetailCutReq.GetGridData( i, G3_SPEC03_PK));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_03 ,   grdDetailCutReq.GetGridData( i, G3_SPEC03_NM));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC04_PK , grdDetailCutReq.GetGridData( i, G3_SPEC04_PK));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_04 ,   grdDetailCutReq.GetGridData( i, G3_SPEC04_NM));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC05_PK , grdDetailCutReq.GetGridData( i, G3_SPEC05_PK));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_05 ,   grdDetailCutReq.GetGridData( i, G3_SPEC05_NM));
                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size00_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE00_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size01_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE01_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size02_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE02_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size03_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE03_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size04_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE04_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size05_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE05_QTY));                                                                                                                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size06_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE06_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size07_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE07_QTY));                                                                                                                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size08_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE08_QTY));
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size09_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE09_QTY));                                                                                                                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Size10_Qty , grdDetailCutReq.GetGridData( i, G3_SIZE10_QTY));
                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Remark , grdDetailCutReq.GetGridData( i, G3_REMARK));
                
                grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SEQ , grdDetailCutReq.GetGridData( i, G3_SEQ));
                
                if ( grdWIDetail.GetGridData( grdWIDetail.rows-1, G2_SEQ) == 1)
                {
                    grdWIDetail.SetCellBgColor( grdWIDetail.rows-1, G2_Size00_Qty, grdWIDetail.rows-1, G2_Size10_Qty, 0xd4d2ff );
                }
                else if ( grdWIDetail.GetGridData( grdWIDetail.rows-1, G2_SEQ) ==  2 )
                {
                    grdWIDetail.SetCellBgColor( grdWIDetail.rows-1, G2_Size00_Qty, grdWIDetail.rows-1, G2_Size10_Qty, 0x99FFFF );
                } 
                
                grdWIDetail.SetCellBgColor( grdWIDetail.rows-1, G2_Lot_ID, grdWIDetail.rows-1, G2_Lot_ID, 0xCCFF99 );               
            }                         
        break;  
        
        case 'data_fpcw00151_2' :
            flag_save = 'N';
            
            for ( var i=1; i<grdWIDetail.rows ;i++ )
            {
                if ( grdWIDetail.GetGridData( i, G2_SEQ) == 1)
                {
                    grdWIDetail.SetCellBgColor( i, G2_Size00_Qty, i, G2_Size10_Qty, 0xd4d2ff );
                }
                else if ( grdWIDetail.GetGridData( i, G2_SEQ) ==  2 )
                {
                    grdWIDetail.SetCellBgColor( i, G2_Size00_Qty, i, G2_Size10_Qty, 0x99FFFF );
                }
            }        
        break;  
         
        case 'data_fpcw00151_3' : 
            if ( flag_save == 'Y' ) 
            {
                if ( Number(txtWIPK.text)>0 )
                {
                    for ( var i=1; i<grdWIDetail.rows; i++ )                
                    {
                        grdWIDetail.SetGridText( i, G2_CUT_INS_PK, Number(txtWIPK.text) );
                    }
                    
                    OnSave('Detail');
                }
                else
                {
                    alert('Master PK is null?');
                }    
            }
            else
            {
                OnSearch('Detail');
            }    
        break;
        case 'data_fpcw00151_4':
            alert(txtReturnValue.text);
        break;
    }
}

//=======================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'WIList':
            var fpath = System.RootURL + "/form/fp/cw/fpcw00152.aspx" ;
            var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:500px');	
            
            if ( obj != null )
            {
                txtWIPK.SetDataText(obj[0]);
                
                OnSearch('Master');
            }
        break;
        
        case 'Charger':
            var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
            var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:700px;dialogHeight:550px');	
            
            if ( obj != null )
            {
                txtChargerPK.SetDataText(obj[0]);
                txtChargerName.SetDataText(obj[2]);
            }
        break;
        
        case 'ORD_PLAN':
            if(txtWIPK.text =='')
            {
                var fpath = System.RootURL + "/form/fp/ab/fpab00360.aspx" ;
                var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	
                
                if ( obj != null )            
                {
                    txtOrdPlanPK.SetDataText(obj[0]);
                    txtArraySOPK.SetDataText(obj[1]);
                    txtPONo.SetDataText(obj[2]);
                    
                    txtStylePK.SetDataText(obj[5]);
                    txtStyleCode.SetDataText(obj[6]);
                    txtStyleName.SetDataText(obj[7]);
                    
                    data_fpcw00151.Call('SELECT');
                }
            }
            else
            {
                alert("WI already saved. You cannot change P/O No.!!!");
            }
        break;
        
        case 'PATTEN_GROUP':
            var fpath = System.RootURL + "/form/fp/ab/fpab00370.aspx?style_pk="+ txtStylePK.text ;
            var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	
            
            if ( obj != null )
            {
                txtPatternGroupPK.SetDataText(obj[1]);
                txtPatternGroupName.SetDataText(obj[3]);
                
                txtSTMatPK.SetDataText(obj[4]);                
                txtMatPK.SetDataText(obj[5]);
                txtMatCode.SetDataText(obj[6]);
                txtMatName.SetDataText(obj[7]);
                
                OnSearch('CutReq');
            }
        break;                   
    }
}
//=======================================================================================

function OnSearch(obj)
{
    switch(obj) 
    {
        case 'Mat' :
            pro_fpcw00151.Call();
        break;
        
        case 'CutReq':
            data_fpcw00151.Call('SELECT');
        break;
        
        case 'Detail':
            data_fpcw00151_2.Call('SELECT');
        break;
        
        case 'Master':
            data_fpcw00151_3.Call('SELECT');
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
                data_fpcw00151_3.StatusDelete();
                data_fpcw00151_3.Call();
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
    if(confirm('Are you sure remove ?'))
    {
        var row = grdWIDetail.row;
        var t = ( Math.ceil( row/3 ) * 3 ) - 1 ;           
                
        grdWIDetail.DeleteRowAt(t);
    }            
}
//=========================================================================
function OnSave(obj)
{
    switch(obj)
    {
        case 'Master':
            flag_save = 'Y';
            data_fpcw00151_3.Call();
        break;
        
        case 'Detail':
            data_fpcw00151_2.Call();
        break;
    }
}
//=========================================================================
function OnConfirm()
{
    if(txtWIPK.text=='')
    {
        alert('Please select Cutting WI!!!');
        return;
    }  
    data_fpcw00151_4.Call();   
}
//=========================================================================

function OnPrint()
{
    var url = System.RootURL + '/reports/fp/cw/fpcw00121.aspx?wi_pk=' + txtWIPK.text;
	window.open(url);
	
}

//=========================================================

function OnSetSizeRatio()
{  
    if (txtRatio_01.text == '' && txtRatio_02.text == '' && txtRatio_03.text == '' && txtRatio_04.text == '' &&
        txtRatio_05.text == '' && txtRatio_06.text == '' && txtRatio_07.text == '')
    {
        alert('Please input Size Ratio first !');
        return;
    }
            
    for(var i = 1; i<=grdWIDetail.rows-1; i++)
    {
        if ( grdWIDetail.GetGridControl().isSelected(i) == true )
        {
            var t = ( Math.ceil( i/3 ) * 3 ) - 1 ;           
            
            grdWIDetail.SetGridText( t, G2_Size00_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_00.text) );
            grdWIDetail.SetGridText( t, G2_Size01_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_01.text) );
            grdWIDetail.SetGridText( t, G2_Size02_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_02.text) );
            grdWIDetail.SetGridText( t, G2_Size03_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_03.text) );
            grdWIDetail.SetGridText( t, G2_Size04_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_04.text) );
            grdWIDetail.SetGridText( t, G2_Size05_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_05.text) );
            grdWIDetail.SetGridText( t, G2_Size06_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_06.text) );
            grdWIDetail.SetGridText( t, G2_Size07_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_07.text) );
            grdWIDetail.SetGridText( t, G2_Size08_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_08.text) );
            grdWIDetail.SetGridText( t, G2_Size09_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_09.text) );
            grdWIDetail.SetGridText( t, G2_Size10_Qty , Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_10.text) );
            
            grdWIDetail.SetGridText( t+1, G2_Size00_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size00_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_00.text) );
            grdWIDetail.SetGridText( t+1, G2_Size01_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size01_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_01.text) );
            grdWIDetail.SetGridText( t+1, G2_Size02_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size02_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_02.text) );
            grdWIDetail.SetGridText( t+1, G2_Size03_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size03_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_03.text) );
            grdWIDetail.SetGridText( t+1, G2_Size04_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size04_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_04.text) );
            grdWIDetail.SetGridText( t+1, G2_Size05_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size05_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_05.text) );
            grdWIDetail.SetGridText( t+1, G2_Size06_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size06_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_06.text) );
            grdWIDetail.SetGridText( t+1, G2_Size07_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size07_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_07.text) );
            grdWIDetail.SetGridText( t+1, G2_Size08_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size08_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_08.text) );
            grdWIDetail.SetGridText( t+1, G2_Size09_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size09_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_09.text) );
            grdWIDetail.SetGridText( t+1, G2_Size10_Qty , Number(grdWIDetail.GetGridData( t-1, G2_Size10_Qty)) - Number(grdWIDetail.GetGridData( t, G2_Lot_Qty))*Number(txtRatio_10.text) );            
        }
    }                                   
}
        
//=========================================================
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Master':
            data_fpcw00151_3.StatusInsert();
            
            txtWINo.text = '*** New W/I ***' ;
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";  
                        
            grdWIDetail.ClearData();            
                        
            var callerWindowObj = dialogArguments;    
            
            txtOrdPlanPK.text = callerWindowObj.txtOrdPlanPK.text ;  
            txtArraySOPK.text = callerWindowObj.txtArraySOPK.text ;
            txtPONo.text      = callerWindowObj.txtPONo.text ;
            
            txtStylePK.text   = callerWindowObj.txtStylePK.text;
            txtStyleCode.text = callerWindowObj.txtStyleCode.text ;
            txtStyleName.text = callerWindowObj.txtStyleName.text ;  
            
            txtPatternGroupPK.text   = callerWindowObj.txtPatternGroupPK.text ;
            txtPatternGroupName.text = callerWindowObj.txtPatternGroupName.text ;  
            //-----------------------------
            OnSearch('Mat');             
        break;
        
        case 'Detail':
            if ( grdCutReq.row > 0 )
            {
                txtSpec01_PK.text = grdCutReq.GetGridData( grdCutReq.row, G1_SPEC01_PK);
                txtSpec02_PK.text = grdCutReq.GetGridData( grdCutReq.row, G1_SPEC02_PK);
                txtSpec03_PK.text = grdCutReq.GetGridData( grdCutReq.row, G1_SPEC03_PK);
                txtSpec04_PK.text = grdCutReq.GetGridData( grdCutReq.row, G1_SPEC04_PK);
                txtSpec05_PK.text = grdCutReq.GetGridData( grdCutReq.row, G1_SPEC05_PK);
                
                data_fpcw00151_1.Call("SELECT");
            }    
        break;
    }    
}
//=========================================================
function OnCellDoubleClick(obj)
{
    switch (obj.id)
    {
        case 'grdCutReq':
            OnAddNew('Detail');
        break;
    }
}

//=========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00151" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00151" > 
                <input>
                    <input bind="txtStylePK" />
                    <input bind="txtPatternGroupPK" /> 
                </input> 
                <output>
                    <output bind="txtSTMatPK" />
                    <output bind="txtMatPK" />
                    <output bind="txtMatCode" />
                    <output bind="txtMatName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00151_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30"  function="<%=l_user%>lg_sel_fpcw00151_3" procedure="<%=l_user%>lg_upd_fpcw00151_3">
                <inout>
                    <inout bind="txtWIPK" /> 
                    <inout bind="txtWINo" />     
                    <inout bind="lstLine" />
                    <inout bind="dtWIDate" />                     
                    <inout bind="txtChargerPK" />                    
                    <inout bind="txtChargerName" />
                    <inout bind="txtRemark" />
                    <inout bind="lbStatus" />
                    <inout bind="txtOrdPlanPK" />                    
                    <inout bind="txtArraySOPK" />  
                    <inout bind="txtPONo" />                    
                    <inout bind="txtStylePK" />
                    <inout bind="txtStyleCode" />
                    <inout bind="txtStyleName" />
                    <inout bind="txtPatternGroupPK" /> 
                    <inout bind="txtPatternGroupName" /> 
                    <inout bind="txtSTMatPK" />     
                    <inout bind="txtMatPK" />  
                    <inout bind="txtMatCode" />
                    <inout bind="txtMatName" />  
                    <inout bind="txtRatio_00" />  
                    <inout bind="txtRatio_01" /> 
                    <inout bind="txtRatio_02" />    
                    <inout bind="txtRatio_03" />    
                    <inout bind="txtRatio_04" />    
                    <inout bind="txtRatio_05" />    
                    <inout bind="txtRatio_06" />    
                    <inout bind="txtRatio_07" />    
                    <inout bind="txtRatio_08" />    
                    <inout bind="txtRatio_09" />    
                    <inout bind="txtRatio_10" />                         
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00151" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_fpcw00151" > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
                    <input bind="txtPatternGroupPK" />                    
                    <input bind="chkBalance" />                                     
                </input> 
                <output bind="grdCutReq" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00151_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_fpcw00151_1" > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
                    <input bind="txtPatternGroupPK" />                    
                    <input bind="txtSpec01_PK" /> 
                    <input bind="txtSpec02_PK" />
                    <input bind="txtSpec03_PK" />
                    <input bind="txtSpec04_PK" />
                    <input bind="txtSpec05_PK" />                                    
                </input> 
                <output bind="grdDetailCutReq" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00151_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" function="<%=l_user%>lg_sel_fpcw00151_2" procedure="<%=l_user%>lg_upd_fpcw00151_2"> 
                <input> 
                    <input bind="txtWIPK" />                                    
                </input> 
                <output bind="grdWIDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpcw00151_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00151_1" > 
                <input>
                    <input bind="txtWIPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('WIList')">W/I No</b></td>
            <td style="width: 25%">
                <gw:textbox id="txtWIPK" styles='width:100%;display: none' />
                <gw:textbox id="txtWINo" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line</td>
            <td style="width: 25%">
                <gw:list id="lstLine" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Date</td>
            <td style="width: 25%" align="left">
                <gw:datebox id="dtWIDate" maxlen="10" text="" styles='width:100%' lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 10%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="width: 100%; height: 100%">
                        <td style="width: 96%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearchMST" onclick="OnSearch('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="Add New" id="btnNewMST" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDeleteMST" onclick="OnDelete('MST')" />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdateMST" onclick="OnSave('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="confirm" alt="Confirm" id="btnConfirm" onclick="OnConfirm()" />
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
                Remark</td>
            <td colspan="3">
                <gw:textbox id="txtRemark" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 10%" align="center">
                <gw:label id="lbStatus" styles="color: cc0000; font: 9pt">Status</gw:label>
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
                <table style="width: 100%; height: 100%; background-color: #CCFFFF">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('ORD_PLAN')">P/O No</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtOrdPlanPK" styles='width:100%;display: none' />
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
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('PATTEN_GROUP')">Group</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPatternGroupPK" styles='width:100%;display: none' />
                            <gw:textbox id="txtPatternGroupName" maxlen="100" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Material</td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtSTMatPK" styles='width:100%;display: none' />
                            <gw:textbox id="txtMatPK" styles='width:100%;display: none' />
                            <gw:textbox id="txtMatCode" maxlen="100" styles='width:20%' />
                            <gw:textbox id="txtMatName" maxlen="100" styles='width:80%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 97%">
            <td colspan="7">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 100%">
                        <td id="t-left" style="width: 35%; white-space: nowrap" align="left">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 9%; white-space: nowrap" align="center">
                                        Balance
                                        <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('CutReq')"></gw:checkbox>
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnAdd" img="2" text="Add" onclick="OnAddNew('Detail')" />
                                    </td>
                                    <td style="width: 90%">
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="3">
                                        <gw:grid id='grdCutReq' header='_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Req Qty|W/I Qty|Bal Qty|Remark|_PP_ORDPLAN_PK|_PT_PATTERN_GROUP_PK'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|3|3|3|0|0|0'
                                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||||' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                            sorting='T' styles='width:100%; height:100%' oncelldblclick='OnCellDoubleClick(this)' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 2%; white-space: nowrap" align="center">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('1')" />
                            <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('2')" />
                        </td>
                        <td id="t-right" style="width: 63%; white-space: nowrap;" align="right">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap; color: Purple" align="right">
                                        Lot Qty</td>
                                    <td style="width: 5%">
                                        <gw:textbox id="txtLotQty" styles='width:40;background-color:#CCFFFF; text-align:center' />
                                    </td>
                                    <td style="width: 70%; white-space: nowrap; color: Purple" align="right">
                                        S
                                        <gw:textbox id="txtRatio_01" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; M
                                        <gw:textbox id="txtRatio_02" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; L
                                        <gw:textbox id="txtRatio_03" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; XL
                                        <gw:textbox id="txtRatio_04" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; 2XL
                                        <gw:textbox id="txtRatio_05" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; 3XL
                                        <gw:textbox id="txtRatio_06" styles='width:25; text-align:center' />
                                        &nbsp;&nbsp; 4XL
                                        <gw:textbox id="txtRatio_07" styles='width:25; text-align:center' />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:imgbtn img="process" alt="Set Size Ratio" id="btnSetSizeRatio" onclick="OnSetSizeRatio()" />
                                    </td>
                                    <td style="width: 18%" align="center">
                                        <gw:label id="lbRecord" styles="color: Blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:icon id="btnRemove" img="2" text="Remove" onclick="OnRemoveRows()" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <gw:grid id='grdWIDetail' header='_WI_CUT_INSD_PK|_WI_CUT_INS_PK|_WI_CUTGRP_SIZE_REQ_PK|Lot ID|Lot Qty|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Size 00|Size 01|Size 02|Size 03|Size 04|Size 05|Size 06|Size 07|Size 08|Size 09|Size 10|Remark|_SEQ'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|0|0'
                                            defaults='|||||||||||||||||||||||||||' editcol='0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                            widths='0|0|0|800|1000|0|1200|0|1200|0|1200|0|1200|0|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0'
                                            sorting='F' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <!--  onafteredit='AfterEdit()' -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtRatio_00" styles='width:5%; display:none' />
<gw:textbox id="txtRatio_08" styles='width:5%; display:none' />
<gw:textbox id="txtRatio_09" styles='width:5%; display:none' />
<gw:textbox id="txtRatio_10" styles='width:5%; display:none' />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtSpec01_PK" styles='width:5%; display:none' />
<gw:textbox id="txtSpec02_PK" styles='width:5%; display:none' />
<gw:textbox id="txtSpec03_PK" styles='width:5%; display:none' />
<gw:textbox id="txtSpec04_PK" styles='width:5%; display:none' />
<gw:textbox id="txtSpec05_PK" styles='width:5%; display:none' />
<gw:textbox id="txtReturnValue" styles='width:5%; display:none' />
<!--------------------------------------------------------------------------->
<gw:grid id='grdDetailCutReq' header='SPEC01_PK|SPEC01_NM|SPEC02_PK|SPEC02_NM|SPEC03_PK|SPEC03_NM|SPEC04_PK|SPEC04_NM|SPEC05_PK|SPEC05_NM|SIZE00_QTY|SIZE01_QTY|SIZE02_QTY|SIZE03_QTY|SIZE04_QTY|SIZE05_QTY|SIZE06_QTY|SIZE07_QTY|SIZE08_QTY|SIZE09_QTY|SIZE10_QTY|DESCRIPTION|WI_CUTGRP_SIZE_REQ_PK|SEQ'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
    defaults='|||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' styles='width:100%; height:460;display:none'' />
<!--------------------------------------------------------------------------->
</html>
