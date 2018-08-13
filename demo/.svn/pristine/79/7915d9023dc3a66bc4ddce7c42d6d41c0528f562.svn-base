<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>Cutting Status</title>
</head>

<script>    
  var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name  = "<%=Session("USER_NAME")%>" ;  
  var cons_col=13, adjust =14, diff_col=15, matcons_mst_pk = 19, master_table =20;   
  var old_value=21, takeout_pk =22, takeout_dtl_pk =23,return_pk =24, return_dtl_pk =25, takeout_date=28, line_pk =29;  
  var action=''; 
//------------------------------------------------------------------------------------------------------    
function BodyInit()
{           
    
    System.Translate(document);  // Translate to language session
      
    //-----------------------        
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-1));
    //-----------------------------
    BindingDataList();
    //-----------------------
    MergeColumn();        
}
//-----------------------------------------------------------------------------------------------------
function BindingDataList()
{    
    data = "<%=ESysLib.SetListDataSQL("select pk, line_name from prod.tpr_line where del_if = 0 and use_yn = 'Y'")%>"; 
    lstLine.SetDataText(data);
    
    data= 'Data|1|Mill Roll|2|Main Cutting|3|Mini Cutting';
    lstProcess.SetDataText(data);
}
//------------------------------------------------------------------------------------------------------
function FormatGrid()
{
    var ctrl ;
    ctrl = grdMet.GetGridControl();
    
    ctrl.ColFormat(G1_Cons_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(G1_Recycle_Ratio)= "###,###,###.##" ;
    ctrl.ColFormat(G1_Need_Qty)     = "###,###,###.##" ;
    ctrl.FrozenCols = G1_Item_Code ;
    
    ctrl = grdAlter.GetGridControl();
    ctrl.ColFormat(G2_ater_qty)     = "###,###,###.##" ;
}
//-----------------------------------------------------------------------------------------------------
 function MergeColumn()
{
     grdMet.GetGridControl().FrozenCols = 3
      grdMet.GetGridControl().MergeCells  = 2 ;	
      grdMet.GetGridControl().MergeCol(0) = true ;	
      grdMet.GetGridControl().MergeCol(1) = true ;   	
      grdMet.GetGridControl().MergeCol(2) = true ;	
      grdMet.GetGridControl().MergeCol(3) = true ;	
      grdMet.GetGridControl().MergeCol(4) = true ;
      grdMet.GetGridControl().MergeCol(5) = true ;
      grdMet.GetGridControl().MergeCol(6) = true ;
      grdMet.GetGridControl().MergeCol(7) = true ;
      grdMet.GetGridControl().MergeCol(8) = true ;
      grdMet.GetGridControl().MergeCol(9) = true ;
      grdMet.GetGridControl().MergeCol(10) = true ;   

}
//------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpep00062_1' :    
            data_fpep00062.Call('SELECT');    
        break;
        case 'data_fpep00062_3': 
            if(action=='select')
            {
                data_fpep00062_4.Call('SELECT');
            }
            else
            {
                for(i=1; i< grdMet.rows; i++)
                {
                    if(grdMet.GetRowStatus(i)==16)
                    {    
                        grdMet.SetGridText(i,matcons_mst_pk,txtMasterPK.text);
                        grdMet.SetGridText(i,takeout_pk,txtTakeOutPK.text);
                        grdMet.SetGridText(i,return_pk,txtReturnPK.text);    
                        if (grdMet.GetGridData(i,takeout_date)=='')
                            grdMet.SetGridText(i,takeout_date,dtAdjDate.value);    
                        grdMet.SetGridText(i,line_pk,lstLine.value);    
                    }
                }
                data_fpep00062.Call('');
            }
        break;
    }
}   
//------------------------------------------------------------------------------------------------------
function OnAddNew()
{    
    data_fpep00062_3.StatusInsert();
    txtCharger.text = user_name;
    txtChargerPK.text = user_pk;
}
//------------------------------------------------------------------------------------------------------
function OnSave()
{
    if ((data_fpep00062_3.GetStatus() == 10)|| (data_fpep00062_3.GetStatus() == 20) )  
    {
        action ='save';
        OnCheckCrtTakeoutReturn();
        data_fpep00062_3.Call('');
    }
}
//------------------------------------------------------------------------------------------------------
function OnDelete()
{
    if ( confirm( " Do you want to delete this adjustment? " ) ) 
    {
	    data_fpep00062_3.StatusDelete();
	    data_fpep00062_3.Call('');
    }
}
//------------------------------------------------------------------------------------------------------
function OnSearch(obj)
{
    switch (obj)
    {
        case 'grdVouchers':
            data_fpep00062_2.Call();
        break;
        case 'grdMet':
            if(grdVouchers.row>0)
            {
                txtMasterPK.text = grdVouchers.GetGridData(grdVouchers.row, 0);
                data_fpep00062_3.Call('SELECT');
                action='select';
            }
        break;
    }
}
//------------------------------------------------------------------------------------------------------
function OnAfterEditting()
{
    var row = grdMet.row;
    var col = grdMet.col;
    
    if(col==adjust)
    {
        if ((txtMasterPK.text=='') && (grdMet.GetGridData(row,master_table)=='TPR_MATCONS_MST'))
        {  
            alert('This consumption has already adjusted!!!');
            grdMet.SetGridText(row,adjust,grdMet.GetGridData(row,old_value)) ;
        }
        else   
        {
            var cons_qty =0, adjust_qty=0, diff_qty =0;
            cons_qty = Number(grdMet.GetGridData(row,cons_col));
            adjust_qty = Number(grdMet.GetGridData(row,adjust));
            
            if(Number(adjust_qty) >0) 
            {
                diff_qty = Number(cons_qty) - Number(adjust_qty);
                grdMet.SetGridText(row,diff_col,diff_qty);
            }
            else
            {
                grdMet.SetGridText(row,diff_col,'');
            }
        }
    }
}
//---------------------------------------------------------------
function OnToggle()
{
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   

    if(imgArrow.status == "expand")
    {
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}
//------------------------------------------------------------------------------------------------------
function OnCheckCrtTakeoutReturn()
{
    txt_crt_takeout_flag.text='';   
    txt_crt_return_flag.text ='';
    
    for(i=1; i<grdMet.rows; i++)
    {
        if(grdMet.GetRowStatus(i)==16)
        { 
            if(( Number(grdMet.GetGridData(i,diff_col))<0) && (Number(grdMet.GetGridData(i,old_value)))>=0)
            {
                txt_crt_takeout_flag.text ='1';
            }
            if(( Number(grdMet.GetGridData(i,diff_col))>0) && (Number(grdMet.GetGridData(i,old_value)))<=0)
            {
                txt_crt_return_flag.text ='1';
            }
        }
    }
}
//------------------------------------------------------------------------------------------------------
</script>

<body>   
<!------------------------------------------------------------------>
    <gw:data id="data_fpep00062_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="prod.sp_pro_fpep00062_1" > 
                <input>
                     <input bind="dtFrom" /> 
                     <input bind="dtTo" /> 
                     <input bind="txtItem" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00062" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="14,15,16,17,18,19,21,22,23,24,25,26,27,28,29" function="prod.sp_sel_fpep00062_1"  procedure ="PROD.sp_upd_fpep00062" > 
                <input bind="grdMet">                    
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtItem" /> 
                </input> 
                <output bind="grdMet" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00062_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="prod.sp_sel_fpep00062_2" > 
                <input> 
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00062_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,6,7,8,9,10" function="prod.sp_sel_fpep00062_3"  procedure="PROD.sp_upd_fpep00062_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="dtAdjDate" />                          
                     <inout  bind="txtChargerPK" />   
                     <inout  bind="txtRemark" />   
                     <inout  bind="txtSlipNo" /> 
                     <inout  bind="txtCharger" /> 
                     <inout  bind="txtTakeOutPK" /> 
                     <inout  bind="txtReturnPK" />  
                     <inout  bind="txt_crt_takeout_flag" />  
                     <inout  bind="txt_crt_return_flag" />  
                     <inout  bind="lstLine" />                      
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00062_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="14,15,16,17,18,19,21,22,23,24,25,26,27,28,29" function="prod.sp_sel_fpep00062_4"   > 
                <input bind="grdMet">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdMet" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%">
            <tr style="height: 100%">
                <td style="width: 20%" id="left">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 2%">
                            <td style="width: 20%" align="right">
                                No.
                            </td>
                            <td style="width: 79%">
                                <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdVouchers')" />
                            </td>
                            <td style="width: 1%">
                                <gw:imgbtn id="btnAdjSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                            </td>
                        </tr>
                        <tr style="height: 2%">
                            <td style="width: 20%" align="right">
                                Date</td>
                            <td colspan="2">
                                <gw:datebox id="dtAdjFrom" lang="1" />
                                ~
                                <gw:datebox id="dtAdjTo" lang="1" />
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="3">
                                <gw:grid id="grdVouchers" header="_PK|Date|Slip No" format="0|4|0" aligns="0|1|0"
                                    defaults="||" editcol="0|0|0" widths="0|1200|1200" styles="width:100%; height:100%"
                                    sorting="T" param="0,1,2" oncellclick="OnSearch('grdMet')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 80%" id="right" >
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td>
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td colspan="9">
                                            <table>
                                                <tr>
                                                    <td style="width: 96%;"></td>
                                                    <td style="width: 1%;">
                                                        <gw:imgbtn id="btnSearch" img="Search" alt="Search" text="Search" onclick="data_fpep00062_1.Call();" />
                                                    </td>
                                                    <td style="width: 1%;">
                                                        <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                                                    </td>
                                                    <td style="width: 1%;">
                                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                                                    </td>
                                                    <td style="width: 1%;">
                                                        <gw:imgbtn id="btnUpdate" img="save" alt="Update" text="Save" onclick="OnSave()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Line
                                        </td>
                                        <td colspan="2" align="right">
                                            <gw:list id="lstLine" styles="width:100%" />
                                        </td>
                                        <td colspan="2" align="right">Process</td>
                                        <td style="width: 20%;" colspan="2" align="right">
                                            <gw:list id="lstProcess" styles="width:100%" />
                                        </td>
                                        <td style="width: 7%;" align="right">WI No.</td>
                                        <td style="width: 26%;"><gw:textbox id="txtWiNO" styles="width: 100%" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%;" align="right">Prod Date</td>
                                        <td style="width: 10%;"><gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" /></td>
                                        <td style="width: 7%;"><gw:textbox id="txtFromTime" styles="width: 100%" /></td>
                                        <td style="width: 3%;" align="center">~</td>
                                        <td style="width: 10%;"><gw:datebox id="dtTo" lang="<%=Session("Lang")%>" /></td>
                                        <td style="width: 7%;"><gw:textbox id="txtToTime" styles="width: 100%" /></td>
                                        <td  colspan="1"></td>
                                        <td align="right"  >Item</td>
                                        <td ><gw:textbox id="txtItem" styles="width: 100%" /></td>
                                    </tr>
                                    <tr>                                        
                                        <td align="right">Slip No. </td>
                                        <td align="right" colspan="2">
                                            <gw:textbox id="txtSlipNo" styles="width: 100%" />                                
                                        </td> 
                                        <td align="right" colspan="2"> 
                                            Adjusted Date                              
                                        </td>
                                        <td colspan="2" ><gw:datebox id="dtAdjDate" lang="<%=Session("Lang")%>" /></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td align="right">Charger</td>
                                        <td colspan="2"><gw:textbox id="txtCharger" styles="width: 100%" /><gw:textbox id="txtChargerPK" styles="display:none" /></td>
                                        <td colspan ="2" align="right">Remark</td>
                                        <td colspan="4"><gw:textbox id="txtRemark" styles="width: 100%" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td>
                                <!--<gw:tab id="tab">-->
                                <table style="width: 100%; height: 100%" name="Production Status">
                                    <tr>
                                        <td>
                                            <gw:grid id='grdMet'
                                                header='Wi No|Item Code|Item Name|St Date|St Time|En Date|En Time|Prod Qty|Duration|Mc Speed|Loss Qty|Meterial Item Code|Meterial Item Name|Consumption Qty|Adjusted Qty|Difference Qty|_result_pk|_matcons_pk|_mat_item_pk|_matcons_mst_pk|_master_table|_old_adj_value|_takeout_pk|_takeout_dtl_pk|_return_pk|_return_dtl_pk|_takeout_wh_pk|_return_wh_pk|_takeout_date|_line_pk'
                                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                defaults='|||||||||||||||||||||||||||||'
                                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                                                widths='2000|2000|3000|1200|750|1200|750|1200|1200|1200|1000|2000|3000|2000|1500|1800|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                sorting='F' acceptNullDate='true' onafteredit="OnAfterEditting()"
                                                styles='width:100%; height:100%'
                                            />                                
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
    </form>
</body> 
</html>     
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
<gw:textbox id="txtMasterPK" styles="width:100%;display:none" />
<gw:textbox id="txtTakeOutPK" styles="width:100%;display:none" /> 
<gw:textbox id="txtReturnPK" styles="width:100%;display:none" />
<gw:textbox id="txt_crt_takeout_flag" styles="width:100%;display:none" />
<gw:textbox id="txt_crt_return_flag" styles="width:100%;display:none" />  
<!------------------------------------------------------------------------>
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />