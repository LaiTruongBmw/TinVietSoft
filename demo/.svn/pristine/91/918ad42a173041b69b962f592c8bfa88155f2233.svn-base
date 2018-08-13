<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Product Result Entry</title>
</head>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
    var G1_PK           = 0,
        G1_WI_No        = 1,
        G1_Status       = 2,
        G1_Date         = 3,
        G1_Shift        = 4,
        G1_Line         = 5,
        G1_Description  = 6;
        
    var G2_Chk              = 0,
        G2_PK               = 1,
        G2_TPR_WORKINS_PK   = 2,
        G2_TPR_WORKINSD_PK  = 3,
        G2_TCO_STITEM_PK    = 4,       
        G2_ST_Code          = 5,
        G2_ST_Name          = 6,
        G2_ITEM_PK          = 7,
        G2_Item_Code        = 8,
        G2_Item_Name        = 9,
        G2_UOM              = 10,
        G2_TPR_LOTNO_PK     = 11,
        G2_Lot_No           = 12,
        G2_Need_Qty         = 13,
        G2_SPEC1            = 14,
        G2_SPEC2            = 15,
        G2_SPEC3            = 16,
        G2_SPEC4            = 17,
        G2_SPEC5            = 18,
        G2_SPEC6            = 19,
        G2_SPEC7            = 20,
        G2_SPEC8            = 21,
        G2_SPEC9            = 22,
        G2_SPEC10           = 23,
        G2_Description      = 24;
              
    var G4_PK                   = 0,
        G4_TPR_PRODRESULT_PK    = 1,
        G4_TPR_WORKINSD_PK      = 2,
        G4_Seq                  = 3,
        G4_TCO_ITEM_PK          = 4,
        G4_SPEC1                = 5,
        G4_SPEC2                = 6,
        G4_SPEC3                = 7,  
        G4_SPEC4                = 8,
        G4_SPEC5                = 9,
        G4_SPEC6                = 10,
        G4_SPEC7                = 11,
        G4_SPEC8                = 12,
        G4_SPEC9                = 13,
        G4_SPEC10               = 14,
        G4_Prod_Qty             = 15,
        G4_Grade                = 16,
        G4_Tape                 = 17,
        G4_Defect_Qty           = 18,
        G4_Arm_No               = 19;
         
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
     dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
     //--------------------------------------
     BindingDataList();
     
     OnFormatGrid();
     //--------------------------------------     
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
 {
      grdMatCons.GetGridControl().MergeCells  = 2 ;	
      grdMatCons.GetGridControl().MergeCol(0) = true ;	
      grdMatCons.GetGridControl().MergeCol(1) = true ;   	
      grdMatCons.GetGridControl().MergeCol(2) = true ;	
      grdMatCons.GetGridControl().MergeCol(3) = true ;	
 }

 //---------------------------------------------------------
 
 function BindingDataList()
 {
        var data ;
        
        data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT PK, shift || ' : ' || start_time || ' -> ' || end_time FROM HR.thr_work_shift WHERE DEL_IF = 0 AND USE_YN = 'Y' order by shift " ) %> ";       
        grdWI.SetComboFormat(G1_Shift,data);
        
        data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT   pk, line_id || ' - ' || line_name line FROM prod.tpr_line WHERE del_if = 0 ORDER BY line " ) %> ";       
        grdWI.SetComboFormat(G1_Line,data);
        
        
        data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRBP0090' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
        grdWI.SetComboFormat(G1_Status,data); }        
 
 //------------------------------------------------------------------------------------------------
 function OnFormatGrid()
 {
    var trl ;
    
    trl = grdMatCons.GetGridControl();
    trl.ColFormat(G2_Need_Qty)              = "###,###,###,###,###.##";
 
 }

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdWI' :
                data_fpep00042.Call("SELECT");
            break;    
            
            case 'grdMatCons' :
                if ( grdWI.row > 0 )
                {
                    txtWIMasterPK.text = grdWI.GetGridData( grdWI.row, G1_PK );
                }
                else
                {
                    txtWIMasterPK.text = '' ;
                }
                
                data_fpep00042_1.Call("SELECT");
            break;                    
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 /*
      switch (po_oData.id)         
      {
            case "data_fpep00042" :
                txtMaster_PK.text = '' ;
                data_fpep00042_1.Call('SELECT');
            break;                
      }  */
 }
 
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                data_fpep00042.Call();
            break;
            case 'Detail' :
                data_fpep00042_1.Call();
            break;
      }  
 }
 
//------------------------------------------------------------------------------------------------

function OnGridCellClick(oGrid)
{
    switch (oGrid.id)
	{
		case 'grdMaster':
		    if ( grdMaster.row > 0 && grdMaster.GetGridData( grdMaster.row, iM_tpr_prodresult_pk ) != '' )
		    {		    		   
		        txtMaster_PK.text = grdMaster.GetGridData( grdMaster.row, iM_tpr_prodresult_pk ); 
            }
            else
            {
                txtMaster_PK.text = '' ;
            }
            //data_fpep00042_1.Call("SELECT");
		break;			
	}
}

//-------------------------------------------------------------------------------------------------

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdMaster" :
            break;            
      }         
}   

//------------------------------------------------------------------------------------------------

function OnAddNew(pos)
{
    switch (pos)
	{
		case 'Master':
			grdMaster.AddRow();
		break;			
	}
}

 //---------------------------------------------------------

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

//---------------------------------------------------------

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

//------------------------------------------------------------------------------------------------

 function CheckInput()
 {   
    var col, row
    
    col = event.col
    row = event.row        
      
    if ( col == iD_Prod_Qty || col == iD_Defect_Qty || col == iD_TakeIn_Qty || col == iD_QC_Qty )
    {                
    //------------------------------------------                
        var dQuantiy ;
 
        dQuantiy =  grdDetail.GetGridData(row,col)
        
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
    //------------------------------------------        
    } 

 }
 //------------------------------------------------------------------
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpep00042" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="prod.sp_sel_fpep00042"  > 
                <input>
                    <input bind="txtSlipNo" />  
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                </input> 
                <output bind="grdWI" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpep00042_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="prod.sp_sel_fpep00042_1"  > 
                <input>
                    <input bind="txtWIMasterPK" />  
                </input> 
                <output bind="grdMatCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpep00042_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,7,10,11,12,14,15,16,17,18,19,20,21,22,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43" function="prod.sp_sel_fpep00042_3" procedure="prod.sp_upd_fpep00042_3"> 
                <inout> 
                    <inout bind="txtProdResultMasterPK" />
                    <inout bind="txtNo" />  
                    <inout bind="txtItem" />
                    <inout bind="txtWidth" />
                    <inout bind="txtTrimWidth" />
                    <inout bind="txtTape" />
                    <inout bind="txtServiceM" />           
                    <inout bind="txtCurrentBlock" />
                    <inout bind="txtTotalBlock" />                  
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr id='top' style="height: 45%">
            <td style="width: 45%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('Master')" />
                        </td>
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 39%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('grdWI')" />
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="12">
                            <gw:grid id='grdWI' header='_PK|WI No|Status|Date|Shift|Line|Description' format='0|0|0|4|0|0|0'
                                aligns='0|0|0|1|0|0|0' defaults='||||||' editcol='0|0|0|0|0|0|0' widths='1000|1500|1500|1200|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdMatCons')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 55%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 98%">
                        <td colspan="12">
                            <gw:grid id='grdMatCons' header='Chk|_PK|_TPR_WORKINS_PK|_TPR_WORKINSD_PK|_TCO_STITEM_PK|_ST_Code|_ST_Name|_ITEM_PK|Item Code|Item Name|UOM|_TPR_LOTNO_PK|Lot No|Need Qty|_SPEC1|_SPEC2|_SPEC3|_SPEC4|_SPEC5|_SPEC6|_SPEC7|_SPEC8|_SPEC9|_SPEC10|Description'
                                format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|3|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='500|1000|1000|1000|1000|1000|1000|1000|1500|2000|800|1000|1200|1200|100|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncellclick="" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='middle' style="height: 1%">
            <td colspan="2">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            Roll ID
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtNo" csstype="mandatory" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Current Block
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtCurrentBlock" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Total Block
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtTotalBlock" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Item
                        </td>
                        <td style="width: 10%" colspan="3">
                            <gw:textbox id="txtItem" styles="width:100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">
                            Width
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtWidth" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Trim Width
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtTrimWidth" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Tape
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtTape" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Service M
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtServiceM" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Balance
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtBlance" csstype="mandatory" styles="width:100%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='bottom' style="height: 54%">
            <td colspan="2">
                <gw:grid id='grdProdDetail' header='_PK|_TPR_PRODRESULT_PK|_TPR_WORKINSD_PK|Seq|_TCO_ITEM_PK|SPEC1|SPEC2|_SPEC3|_SPEC4|_SPEC5|_SPEC6|_SPEC7|_SPEC8|_SPEC9|_SPEC10|Prod Qty|Grade|Tape|Defect Qty|Arm No'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIMasterPK" style="display: none" />
    <gw:textbox id="txtProdResultMasterPK" style="display: none" />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
