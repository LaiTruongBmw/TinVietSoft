<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>MR Result Status</title>
</head>

<script>
var G1_NO           = 0,
    G1_Roll_ID      = 1,
    G1_Item_Code    = 2,
    G1_Item_Name    = 3,
    G1_Group        = 4,
    G1_Shift        = 5,
    G1_Line_Speed   = 6,
    G1_Prod_Qty     = 7,
    G1_Weight       = 8,
    G1_Loss_m       = 9,
    G1_Loss_kg      = 10,
    G1_ST_Date      = 11,
    G1_ST_Time      = 12,
    G1_End_Date     = 13,
    G1_End_Time     = 14,
    G1_Prod_Duration = 15,
    G1_Bobbin_No    = 16,
    G1_Next_Group   =  17,
    G1_Next_Shift   =  18,
    G1_Change_Time  =  19,
    G1_Hand_Over    = 20,
    G1_Defect_Name  = 21,
    G1_Def_ST_Time  = 22,
    G1_Def_EN_Time  = 23,
    G1_Duration     = 24,
    G1_Defect_Qty   = 25;

var G2_Dur = 7;  
//------------------------------------------------------------------------------------------------------    
function BodyInit()
{           
    System.Translate(document);  // Translate to language session
      
    //-----------------------        
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-1));
    //-----------------------------
    data = "<%=ESysLib.SetListDataSQL(" SELECT code, code || ' - ' || code_nm code_nm FROM sale.lg_code a, sale.lg_code_group b  WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0010'    AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord  ") %>|-|---|ALL|Select ALL";
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL';
   

    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE||' '||a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdProdStatus.SetComboFormat(G1_Shift,data); 
    
    grdProdStatus.SetComboFormat(G1_Next_Shift,data); 
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT code, code || ' - ' || code_nm code_nm FROM sale.lg_code a, sale.lg_code_group b  WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0010'    AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord " ) %> ";       
    grdProdStatus.SetComboFormat(G1_Group,data); 
    
    grdProdStatus.SetComboFormat(G1_Next_Group,data); 
    
    //-----------------------
    MergeColumn();        
}

//------------------------------------------------------------------------------------------------------
function OnSearch()
{
    data_fpep00060.Call('SELECT');
}
//------------------------------------------------------------------------------------------------------

 function MergeColumn()
{
      grdProdStatus.GetGridControl().MergeCells  = 2 ;	
      grdProdStatus.GetGridControl().MergeCol(0) = true ;	
      grdProdStatus.GetGridControl().MergeCol(1) = true ;   	
      grdProdStatus.GetGridControl().MergeCol(2) = true ;	
      grdProdStatus.GetGridControl().MergeCol(3) = true ;	
      grdProdStatus.GetGridControl().MergeCol(4) = true ;
      grdProdStatus.GetGridControl().MergeCol(5) = true ;
      grdProdStatus.GetGridControl().MergeCol(6) = true ;
      grdProdStatus.GetGridControl().MergeCol(7) = true ;
      grdProdStatus.GetGridControl().MergeCol(8) = true ;
      grdProdStatus.GetGridControl().MergeCol(9) = true ;
      grdProdStatus.GetGridControl().MergeCol(10) = true ;
      grdProdStatus.GetGridControl().MergeCol(11) = true ;
      grdProdStatus.GetGridControl().MergeCol(12) = true ;
      grdProdStatus.GetGridControl().MergeCol(13) = true ;
      grdProdStatus.GetGridControl().MergeCol(14) = true ;
      grdProdStatus.GetGridControl().MergeCol(15) = true ;
      grdProdStatus.GetGridControl().MergeCol(16) = true ;
      grdProdStatus.GetGridControl().MergeCol(17) = true ;
      grdProdStatus.GetGridControl().MergeCol(18) = true ;
       grdProdStatus.GetGridControl().MergeCol(19) = true ;
      
    var trl ;   
    trl = grdProdStatus.GetGridControl();
    trl.ColFormat(G1_Weight) = "###,###,###,###,###.##";
    trl.ColFormat(G1_Loss_kg) = "###,###,###,###,###.##";
   // trl.FrozenCols = G1_Item_Code

}
//------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    if ( obj.id == "data_fpep00060" )
    {
        data_fpep00060_1.Call("SELECT");
        SumResult('2')
    }
    else if ( obj.id == "data_fpep00060_1" )
    {            
            
            setsequence();
            var fg = grdProdStatus.GetGridControl();                  

            grdProdStatus.SetCellBold( 1, 0, 1, G1_Defect_Qty, true);
            
            fg.FixedRows  = 2;
            fg.MergeCells = 2;
            
            fg.MergeCol(G1_NO) = true ;
            fg.Cell(0, 0, G1_NO, 1, G1_NO) = "No";
            
            fg.MergeCol(G1_Item_Code)   = true ;
            fg.Cell(0, 0, G1_Item_Code  , 1, G1_Item_Code  ) = "Item Code";
            
            fg.MergeCol(G1_Item_Name)   = true ;
            fg.Cell(0, 0, G1_Item_Name  , 1, G1_Item_Name  ) = "Item Name";
            fg.MergeCol(G1_Shift)       = true ;
             fg.Cell(0, 0, G1_Shift      , 1, G1_Group     ) = "Group";
            fg.MergeCol(G1_Line_Speed)  = true ;
            fg.Cell(0, 0, G1_Shift      , 1, G1_Shift      ) = "Shift";
            fg.MergeCol(G1_Line_Speed)  = true ;
            fg.Cell(0, 0, G1_Line_Speed , 1, G1_Line_Speed ) = "Line Speed";
            fg.MergeCol(G1_Roll_ID)     = true ;
            fg.Cell(0, 0, G1_Roll_ID    , 1, G1_Roll_ID    ) = "Roll ID";
            fg.MergeCol(G1_Prod_Qty)    = true ;
            fg.Cell(0, 0, G1_Prod_Qty   , 1, G1_Prod_Qty   ) = "Prod Qty";
            fg.MergeCol(G1_Weight)      = true ;
            fg.Cell(0, 0, G1_Weight     , 1, G1_Weight     ) = "Weight";
            
            fg.MergeCol(G1_Prod_Qty)    = true ;
            fg.Cell(0, 0, G1_Loss_m   , 1, G1_Loss_m   ) = "Loss qty(M)";
            fg.MergeCol(G1_Weight)      = true ;
            fg.Cell(0, 0, G1_Loss_kg     , 1, G1_Loss_kg     ) = "Loss qty(KG)";
            
            fg.MergeCol(G1_Prod_Duration) = true ;
            fg.Cell(0, 0, G1_Prod_Duration , 1, G1_Prod_Duration ) = "Duration";
            fg.MergeCol(G1_Bobbin_No)   = true ;  
            fg.Cell(0, 0, G1_Bobbin_No  , 1, G1_Bobbin_No  ) = "Bobbin No";
            
            fg.MergeCol(G1_Next_Group)   = true ;
            fg.Cell(0, 0, G1_Next_Group , 1, G1_Next_Group  ) = "Changed Group";
            
            fg.MergeCol(G1_Next_Shift)   = true ;
            fg.Cell(0, 0, G1_Next_Shift  , 1, G1_Next_Shift  ) = "Changed Shift";
            fg.MergeCol(G1_Change_Time)   = true ;
            fg.Cell(0, 0, G1_Change_Time  , 1, G1_Change_Time  ) = "Changed Time";
            fg.MergeCol(G1_Hand_Over)   = true ;
            fg.Cell(0, 0, G1_Hand_Over  , 1, G1_Hand_Over  ) = "Hand Over";
            
            fg.MergeCol(G1_ST_Date) = true ;
            fg.Cell(0, 0, G1_ST_Date  , 1, G1_ST_Date  ) = "ST DT";
            fg.MergeCol(G1_ST_Time) = true ;
            fg.Cell(0, 0, G1_ST_Time  , 1, G1_ST_Time  ) = "ST Time";
            
            fg.MergeCol(G1_End_Date) = true ;
            fg.Cell(0, 0, G1_End_Date  , 1, G1_End_Date  ) = "End DT";
            fg.MergeCol(G1_End_Time) = true ;
            fg.Cell(0, 0, G1_End_Time  , 1, G1_End_Time  ) = "End Time";                       
            
            fg.MergeRow(0) = true;
            fg.Cell(0, 0, G1_Defect_Name, 0, G1_Defect_Qty) = "Defect"; 
            fg.Cell(0, 1, G1_Defect_Name , 1 ) = "Name"; 
            fg.Cell(0, 1, G1_Def_ST_Time , 1 ) = "Start Time";
            fg.Cell(0, 1, G1_Def_EN_Time , 1 ) = "End Time";
            fg.Cell(0, 1, G1_Duration    , 1 ) = "Duration";
            fg.Cell(0, 1, G1_Defect_Qty  , 1 ) = "Qty"; 
                     
            //---Set Font Size---
            fg.Cell(12, 1, 0, 1, grdProdStatus.cols - 2 ) = 8;            
            //---Auto Size---
            fg.AutoSize( 0, 18, false, 0 );                                               
            //-----------------------
         //---Tinh Tong----
        
         SumResult('1')
    }     
}   
//------------------------------------------------------------------------------------------------------
function SumResult(id)
{
    if(id=="1")
    {
       if(grdProdStatus.rows >2)
        {
            var value =0 
            var sum_qty_m =0, sum_qty_kg=0, sum_prod_dur=0, sum_def_dur=0, sum_def_qty=0, sum_spe_X_dur =0,sum_loss_m=0,sum_loss_kg=0;
            var temp_lotno, temp_shift;
            for(var i =1 ; i<grdProdStatus.rows; i++)
            {
                
                temp_lotno = grdProdStatus.GetGridData(i,G1_Roll_ID)
                temp_shift = grdProdStatus.GetGridData(i,G1_Shift)
                if(i==1|| temp_lotno != grdProdStatus.GetGridData(i-1,G1_Roll_ID) || temp_shift != grdProdStatus.GetGridData(i-1,G1_Shift) )
                    {
                         value = grdProdStatus.GetGridData(i,G1_Prod_Qty)
                        if(Number(value))
                        {
                            sum_qty_m = sum_qty_m + Number(value)
                        }
                        //-----------------
                        value = grdProdStatus.GetGridData(i,G1_Weight)
                       
                        if(Number(value))
                        {
                            sum_qty_kg = sum_qty_kg + Number(value)
                        }
                        //-----------------
                         value = grdProdStatus.GetGridData(i,G1_Prod_Duration)
                       
                         if(Number(value))
                        {
                            sum_prod_dur = sum_prod_dur + Number(value)
                        }
                        
                        
                        //-----------------
                         value = grdProdStatus.GetGridData(i,G1_Loss_m)
                       
                         if(Number(value))
                        {
                            sum_loss_m = sum_loss_m + Number(value)
                        }
                       //---------------------
                         value = grdProdStatus.GetGridData(i,  G1_Loss_kg)
                       
                         if(Number(value))
                        {
                            sum_loss_kg = sum_loss_kg + Number(value)
                        }
                                            
                        value = grdProdStatus.GetGridData(i, G1_Line_Speed)* grdProdStatus.GetGridData(i, G1_Prod_Duration)
                         if(Number(value))
                        {
                            sum_spe_X_dur = sum_spe_X_dur + Number(value)
                        } 
                     }
                        //-----------------
                        value = grdProdStatus.GetGridData(i,G1_Defect_Qty)
                         if(Number(value))
                        {
                            sum_def_qty = sum_def_qty + Number(value)
                        }
                         //-----------------
                        value = grdProdStatus.GetGridData(i,G1_Duration)
                         if(Number(value))
                        {
                            sum_def_dur = sum_def_dur + Number(value)
                        }
               
          }
        }
        grdProdStatus.AddRow();
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Line_Speed, (sum_spe_X_dur/sum_prod_dur).toFixed(2) )
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Prod_Qty,sum_qty_m)
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Weight,sum_qty_kg)
        
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Loss_m,sum_loss_m)
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Loss_kg,sum_loss_kg)
        
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Prod_Duration,sum_prod_dur)
        
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Duration,sum_def_dur)
        grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Defect_Qty,sum_def_qty)
        grdProdStatus.SetCellBold( 1, G1_Prod_Qty, grdProdStatus.rows - 1, G1_Loss_kg, true);
        grdProdStatus.SetCellBold( 1, G1_Prod_Duration, grdProdStatus.rows - 1, G1_Prod_Duration, true);
        grdProdStatus.SetCellBold( 1, G1_Duration, grdProdStatus.rows - 1, G1_Duration, true);
        grdProdStatus.SetCellBold( 1, G1_Defect_Qty, grdProdStatus.rows - 1, G1_Defect_Qty, true);
        
        grdProdStatus.SetCellBold( grdProdStatus.rows - 1, 0, grdProdStatus.rows - 1, grdProdStatus.cols - 1, true);
        grdProdStatus.SetCellBgColor( grdProdStatus.rows - 1, 0, grdProdStatus.rows - 1, grdProdStatus.cols - 1, 0xFFFFCC );
        var fg = grdProdStatus.GetGridControl(); 
        fg.MergeRow(grdProdStatus.rows - 1) = true ;
        fg.Cell(0, grdProdStatus.rows - 1, 0, grdProdStatus.rows - 1, G1_Shift) = "TOTAL";
    }else
    {
         if(grdNoneOperation.rows >1)
         {
             var value =0 
             var sum_non_dur =0
            for(var i =1 ; i<grdNoneOperation.rows ; i++ )
            {
                value = grdNoneOperation.GetGridData(i,G2_Dur)
                if(Number(value))
                {
                    sum_non_dur = sum_non_dur + Number(value);
                }
            }
            grdNoneOperation.AddRow();
            grdNoneOperation.SetGridText(grdNoneOperation.rows-1,G2_Dur,sum_non_dur)
            grdNoneOperation.SetCellBold( 1, G2_Dur, grdNoneOperation.rows - 1, G2_Dur, true);
            grdNoneOperation.SetCellBgColor( grdNoneOperation.rows - 1, 0, grdNoneOperation.rows - 1, grdNoneOperation.cols - 1, 0xFFFFCC );
            
            var fg = grdNoneOperation.GetGridControl();
            fg.MergeCells = 2; 
            fg.MergeRow(grdNoneOperation.rows - 1) = true ;
            fg.Cell(0, grdNoneOperation.rows - 1, 0, grdNoneOperation.rows - 1, 6) = "TOTAL";
         }
    }
}
function beforeSort(id)
{
    if(id ==1)
    {
        grdProdStatus.RemoveRowAt(grdProdStatus.rows - 1)
     }
    else
    {
        grdNoneOperation.RemoveRowAt(grdNoneOperation.rows - 1)
    }
}
function afterSort(id)
{
    SumResult(id)
}
function OnReport()
{
      var url =System.RootURL + '/reports/fp/ep/fpep00060.aspx?fromdt=' + dtFrom.value + '&todt='+ dtTo.value + '&group=' + lstGroup.value+ '&roll=' + txtRollID.text+ '&item=' + txtItem.text ;
      System.OpenTargetPage(url);  
}
function setsequence()
{
    for(var i =2; i< grdProdStatus.rows; i++)
    {
        grdProdStatus.SetGridText(i,G1_NO ,i-1);
    }
}

</script>

<body>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="prod.sp_sel_fpep00060_1"  > 
                <input bind="grdProdStatus">                    
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="txtRollID" />
                </input> 
                <output bind="grdProdStatus" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="prod.sp_sel_fpep00060"  > 
                <input bind="grdNoneOperation">                    
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                </input> 
                <output bind="grdNoneOperation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%">
            <tr style="height: 5%">
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 50%">
                            <td style="width: 10%;" align="right">
                               Prod Date</td>
                            <td style="width: 30%; white-space: nowrap" align="left">
                                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                                ~
                                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                            </td>
                            <td style="width: 10%;" align="right">
                                Group
                            </td>
                            <td style="width: 20%;">
                                <gw:list id="lstGroup" styles='width:100%' onchange="OnSearch()" />
                            </td>
                            <td style="width: 30%;">
                            </td>
                            <td style="width: 9%;">
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnSearch" img="Search" alt="Search" text="Search" onclick="OnSearch()" />
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnExcel" img="excel" alt="Print Result" text="Print" onclick="OnReport()" />
                           </td>
                        </tr>
                       <tr style="height: 50%">
                             <td style="width: 10%" align="right"> Item</td>
                               <td style="width: 30%;"><gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch()" /></td>
                                <td style="width: 10%;" align="right">
                               Roll ID</td>
                               <td style="width: 20%"><gw:textbox id="txtRollID" styles='width:100%' onenterkey="OnSearch()"  /></td>
                              
                       </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 95%">
                <td>
                    <!--<gw:tab id="tab">-->
                    <gw:tab id="tab">
                    <table style="width: 100%; height: 100%" name="Production Status">
                        <tr>
                            <td>
                                <gw:grid id='grdProdStatus' 
                                    header="NO|Roll ID|Item Code|Item Name|Group|Shift|Line Speed|Prod Qty|Weight|Loss Qty(M)|Loss Qty(KG)|ST Date|ST Time|End Date|End Time|Duration|Bobbin No|Next Group|Next Shift|Change Time|Hand Over|Defect Name|ST Time|ST Time|Duration|Defect Qty"
                                    aligns="0|0|0|0|0|0|0|3|3|0|0|1|1|1|1|3|0|0|0|0|3|0|1|1|3|3" 
                                    format="0|0|0|0|0|0|1|1|1|1|1|4|0|4|0|1|0|0|0|1|1|0|0|0|1|1"
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='1000|1000|1500|2500|1500|2000|1500|1500|1500|1500|1500|1200|1200|1200|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                    sorting='F' styles='width:100%; height:100%' acceptNullDate= 'T'
                                    onbeforesort="beforeSort('1')" onaftersort="afterSort('1')" />
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%; height: 100%" name="None Operation">
                        <tr>
                            <td>
                                <gw:grid id='grdNoneOperation' header='Seq|_PK|Reason|From Date|Start Time|To Date|End Time|Duration|Description'
                                    format='0|0|0|4|0|4|0|0|0' aligns='0|0|0|0|1|0|1|3|0' defaults='|||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                    widths='800|1000|2000|1200|1500|1200|1500|1500|1000' sorting='T' styles='width:100%; height:100%'
                                    onbeforesort="beforeSort('2')" onaftersort="afterSort('2')"  />
                            </td>
                        </tr>
                    </table>
                    </gw:tab>
                    <!-- </gw:tab> -->
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
