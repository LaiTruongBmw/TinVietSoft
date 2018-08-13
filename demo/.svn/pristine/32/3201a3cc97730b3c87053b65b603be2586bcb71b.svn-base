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

var flag_save  = 'N';
var flag_s_bal = 'N';

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
    G1_Net_Qty      = 13,
    G1_Loss_Rate    = 14,
    G1_Gross_Qty    = 15,
    G1_Remark       = 16;   

var G2_SPEC01_PK    = 0,
    G2_Spec_01      = 1,
    G2_SPEC02_PK    = 2,
    G2_Spec_02      = 3,  
    G2_SPEC03_PK    = 4,
    G2_Spec_03      = 5,
    G2_SPEC04_PK    = 6,
    G2_Spec_04      = 7,
    G2_SPEC05_PK    = 8,    
    G2_Spec_05      = 9,
    G2_Lot_ID       = 10,
    G2_WI_Qty       = 11, 
    G2_Net_Qty      = 12,
    G2_Loss_Rate    = 13,
    G2_Gross_Qty    = 14,
    G2_Remark       = 15,
    G2_WI_MASTER_PK = 16;
    G2_WI_DETAIL_PK = 17;
    
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
            
            left.style.width   ="45%";
            right.style.width  ="53%";
            
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
                    
            left.style.width   ="45%";
            right.style.width  ="53%";
            
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
        
    ctrl.ColFormat(G2_WI_Qty)    = "###,###,###" ;
    
    ctrl.ColFormat(G2_Net_Qty)   = "###,###,###.#####" ;
    ctrl.ColFormat(G2_Loss_Rate) = "###,###,###.##" ;
    ctrl.ColFormat(G2_Gross_Qty) = "###,###,###.##" ;
    
    var ctrl = grdCutReq.GetGridControl();    
    
    ctrl.ColFormat(G1_Req_Qty) = "###,###,###" ;
    ctrl.ColFormat(G1_WI_Qty)  = "###,###,###" ;
    ctrl.ColFormat(G1_Bal_Qty) = "###,###,###" ;
    
    ctrl.ColFormat(G1_Net_Qty)   = "###,###,###.#####" ;
    ctrl.ColFormat(G1_Loss_Rate) = "###,###,###.##" ;
    ctrl.ColFormat(G1_Gross_Qty) = "###,###,###.#####" ;
    
    grdWIDetail.GetGridControl().FrozenCols = G2_Lot_ID ;
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
    
    ctrl = grdCutReq.GetGridControl() ;
      
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
    
}
//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_fpcw00061':
            OnSearch('CutReq');
        break;        
        
        case 'data_fpcw00061_2' :
            flag_save = 'N';
            
            if ( grdWIDetail.rows > 1 )
            {
                grdWIDetail.SetCellBgColor( 1, G2_Lot_ID, grdWIDetail.rows -1, G2_Lot_ID, 0xd4d2ff );
                
                lbRecord.text = grdWIDetail.rows -1 + ' record(s)';
            }
            
            if ( flag_s_bal == 'Y' )
            {
                OnSearch('CutReq');
            }        
        break;  
         
        case 'data_fpcw00061_3' : 
            if ( flag_save == 'Y' ) 
            {
                if ( Number(txtWIPK.text)>0 )
                {
                    for ( var i=1; i<grdWIDetail.rows; i++ )                
                    {
                        if ( grdWIDetail.GetGridData( i, G2_WI_MASTER_PK) == '' )
                        {
                            grdWIDetail.SetGridText( i, G2_WI_MASTER_PK, Number(txtWIPK.text) );
                        }    
                    }
                    
                    OnSave('Detail');
                }    
            }
            else
            {
                OnSearch('Detail');
            }    
        break;
        
        case 'pro_fpcw00061_1':
            alert(txtReturnValue.text);
            
            OnSearch('Master');
        break;
        
        case 'data_fpcw00061':
            flag_s_bal = 'N';
        break;
    }
}

//=======================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'WIList':
            var fpath = System.RootURL + "/form/fp/cw/fpcw00062.aspx" ;
            var obj = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:500px');	
            
            if ( obj != null )
            {
                txtWIPK.SetDataText(obj[0]);
                
                flag_s_bal = 'Y' ;
                
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
                    
                    OnSearch('CutReq');
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
            pro_fpcw00061.Call();
        break;
        
        case 'CutReq':
            data_fpcw00061.Call('SELECT');
        break;
        
        case 'Detail':
            data_fpcw00061_2.Call('SELECT');
        break;
        
        case 'Master':
            data_fpcw00061_3.Call('SELECT');
        break;
    }
}
//=======================================================================================

function OnDelete(obj)
{
    switch(obj)
    {
        case 'MST':
            if(confirm('Are you sure delete ?'))
            {
                data_fpcw00061_3.StatusDelete();
                
                OnSave('Master');
            }
        break;
        
        case 'DTL':
	        if ( grdWIDetail.GetGridData( grdWIDetail.row, G2_WI_DETAIL_PK ) == "" ) 
            {						
    		
			        grdWIDetail.RemoveRow();					
	        }			
	        else 
	        {
		        if ( confirm( "Do you want to mark this row to delete?" ) ) 
		        {
			        grdWIDetail.DeleteRow();
		        }
	        }
        break;
    }  
}
//=======================================================================================

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
            flag_save  = 'Y';
            flag_s_bal = 'Y';
            
            data_fpcw00061_3.Call();
        break;
        
        case 'Detail':
            data_fpcw00061_2.Call();
        break;
    }
}
//=========================================================================
function OnConfirm()
{
    if ( txtWIPK.text == '')
    {
        if( confirm('Do you want to confirm this W/I ?'))
        {
            alert('Please select Cutting WI!!!');
            return;
        }    
    }  
    
    pro_fpcw00061_1.Call();   
}
//=========================================================================

function OnPrint()
{
    if ( txtWIPK.text != '' )
    {
        var url = System.RootURL + '/reports/fp/cw/rpt_fpcw00061_simone.aspx?wi_pk=' + txtWIPK.text;
	    window.open(url);	
	}
	else
	{
	    alert('Pls select a W/I first.');
	}    
}
       
//=========================================================
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Master':
            data_fpcw00061_3.StatusInsert();
            
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
            for ( int i = 0; i < grdCutReq.rows-1; i++)
            {
                if ( grdCutReq.GetGridControl().isSelected(i) == true )
                {
                    grdWIDetail.AddRow();
                    
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Lot_ID ,  grdWIDetail.rows-1 );
                    
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC01_PK , grdCutReq.GetGridData( i, G1_SPEC01_PK));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_01 ,   grdCutReq.GetGridData( i, G1_Spec_01  ));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC02_PK , grdCutReq.GetGridData( i, G1_SPEC02_PK));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_02 ,   grdCutReq.GetGridData( i, G1_Spec_02  ));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC03_PK , grdCutReq.GetGridData( i, G1_SPEC03_PK));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_03 ,   grdCutReq.GetGridData( i, G1_Spec_03  ));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC04_PK , grdCutReq.GetGridData( i, G1_SPEC04_PK));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_04 ,   grdCutReq.GetGridData( i, G1_Spec_04  ));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_SPEC05_PK , grdCutReq.GetGridData( i, G1_SPEC05_PK));
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Spec_05 ,   grdCutReq.GetGridData( i, G1_Spec_05  ));                                                                 

                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_WI_Qty , grdCutReq.GetGridData( i, G1_Bal_Qty  ));                                                                 
                                  
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Net_Qty ,   grdCutReq.GetGridData( i, G1_Net_Qty  )); 
                    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Loss_Rate , grdCutReq.GetGridData( i, G1_Loss_Rate )); 
                    
                    CalGrossQty(grdWIDetail.rows-1);
                    
                    //-----------------------
                    grdWIDetail.SetCellBgColor( grdWIDetail.rows-1, G2_Lot_ID, grdWIDetail.rows-1, G2_Lot_ID, 0xCCFF99 );               
                } 
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

function CalGrossQty(p_row)
{
    var cons_qty  = grdWIDetail.GetGridData( p_row, G2_WI_Qty ) * grdWIDetail.GetGridData( p_row, G2_Net_Qty )
    var loss_qty = cons_qty * grdWIDetail.GetGridData( p_row, G2_Loss_Rate ) / 100;
    var gross_qty = cons_qty + loss_qty ;
    
    grdWIDetail.SetGridText( grdWIDetail.rows-1, G2_Gross_Qty, parseFloat(gross_qty+"").toFixed(2) );  
}
//=========================================================

function CheckInput()
{
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
   
    if ( col == G2_WI_Qty  || col == G2_Net_Qty || col == G2_Loss_Rate || col == G2_Gross_Qty )
    {      
        var dQuantiy;
        
        dQuantiy =  grdWIDetail.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {                
                if(col == G2_WI_Qty)
                {
                     grdWIDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0))
                }
                else if(col == G2_Net_Qty)
                { 
                     grdWIDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(5));
                }               
                else
                {
                     grdWIDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                }
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText(row,col,"");
            }
        }
    } 
    //-----------------------------
    if ( col == G2_WI_Qty  || col == G2_Net_Qty || col == G2_Loss_Rate )
    {
        CalGrossQty(row);
    }
    //-----------------------------
 }

//=========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00061" > 
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
    <gw:data id="data_fpcw00061_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30"  function="<%=l_user%>lg_sel_fpcw00061_3" procedure="<%=l_user%>lg_upd_fpcw00061_3">
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
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_fpcw00061" > 
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
    <gw:data id="data_fpcw00061_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="<%=l_user%>lg_sel_fpcw00061_2" procedure="<%=l_user%>lg_upd_fpcw00061_2"> 
                <input> 
                    <input bind="txtWIPK" />                                    
                </input> 
                <output bind="grdWIDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00061_1" > 
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
                        <td id="t-left" style="width: 45%; white-space: nowrap" align="left">
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
                                        <gw:grid id='grdCutReq' header='_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|_Spec 04|_SPEC05_PK|_Spec 05|Req Qty|W/I Qty|Bal Qty|Net Qty|Loss(%)|Gross Qty|Remark'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|1|0|1|0|1|0|1|3|3|3|3|3|3|0'
                                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='||||||||||||||||' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
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
                        <td id="t-right" style="width: 53%; white-space: nowrap;" align="right">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap; color: Purple" align="right">
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 70%; white-space: nowrap; color: Purple" align="right">
                                    </td>
                                    <td style="width: 1%" align="left">
                                    </td>
                                    <td style="width: 18%" align="center">
                                        <gw:label id="lbRecord" styles="color: Blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDeleteDTL" onclick="OnDelete('DTL')" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <gw:grid id='grdWIDetail' header='_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|_Spec 04|_SPEC05_PK|_Spec 05|Lot ID|W/I Qty|Net Qty|Loss(%)|Gross Qty|Description|_WI_CUT_INS_SPEC_PK|_WI_CUT_INSD_SPEC_PK'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|1|0|1|0|1|0|1|1|3|3|3|3|0|0|0'
                                            editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0' widths='0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|1200|1200|1000|0|0'
                                            sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles='width:5%; display:none' />
<!--------------------------------------------------------------------------->
</html>
