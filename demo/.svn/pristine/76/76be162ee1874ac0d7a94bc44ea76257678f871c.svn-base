<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>Cutting Status</title>
</head>

<script>
var 
    G1_NO           = 0,
    G1_Lot_pk       = 1,
    G1_Roll_ID      = 2,
    G1_Item_Name    = 3,
    G1_Roll_Len     = 4,
    G1_Comb_Roll_Id = 5,
    G1_Combine_Item = 6,
    G1_Combine_Len  = 7,
    G1_Total_Roll_Len  = 8,
    G1_Cut_length      = 9,
    G1_Server_M     = 10,
    G1_Loss_Len     = 11,
    G1_Trim_Width   = 12,
    G1_Prod_dt      = 13,
    G1_Shift        = 14,
    G1_Out_Item     = 15,
    G1_Finish       = 16,
    G1_Min          = 17,
    G1_C_Reason     = 18,
    G1_C_Grade      = 19,
    G1_D_Reason     = 20,
    G1_D_Grade      = 21,
    G1_Total_Qty    = 22;        
    
     
//------------------------------------------------------------------------------------------------------    
function BodyInit()
{           
    System.Translate(document);  // Translate to language session
      
    //-----------------------        
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-1));
    //-----------------------------
    data = "<%=ESysLib.SetListDataSQL("SELECT a.CODE, a.CODE||' '||a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM  ") %>|ALL|Select ALL";
    lstShift.SetDataText(data);
    lstShift.value = 'ALL';
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE||' '||a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdProdStatus.SetComboFormat(G1_Shift,data); 
    //-----------------------
    MergeColumn();        
}

//------------------------------------------------------------------------------------------------------
function OnSearch()
{
    txtCutType.text = radSearchPage.value;
    data_fpep00060.Call('SELECT');
}
//------------------------------------------------------------------------------------------------------

 function MergeColumn()
{
     grdProdStatus.GetGridControl().FrozenCols = 3
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
    

}
//------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    if ( obj.id == "data_fpep00060" )
    {
        if(grdNoneOperation.rows >1)
         {
            var G2_Dur = 7;
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
         data_fpep00060_1.Call("SELECT");
    }else
    {
                var value =0 
                var sum_cut=0, sum_service =0, sum_loss=0, sum_trim =0, sum_finish =0, sum_min =0, sum_c=0, sum_d=0
                var work_ins,roll_id, roll_no,prod_date,prod_shift
                for(var i =1 ; i<grdProdStatus.rows; i++)
                {
                    work_ins = grdProdStatus.GetGridData(i,G1_NO),
                    roll_id = grdProdStatus.GetGridData(i,G1_Lot_pk),
                    roll_no = grdProdStatus.GetGridData(i,G1_Roll_ID),
                    prod_date = grdProdStatus.GetGridData(i,G1_Prod_dt),
                    prod_shift = grdProdStatus.GetGridData(i,G1_Shift)
                    if(i==1|| work_ins != grdProdStatus.GetGridData(i-1,G1_NO) || roll_id != grdProdStatus.GetGridData(i-1,G1_Lot_pk) || roll_no != grdProdStatus.GetGridData(i-1,G1_Roll_ID) || prod_date != grdProdStatus.GetGridData(i-1,G1_Prod_dt) || prod_shift != grdProdStatus.GetGridData(i-1,G1_Shift))
                    {
                        value = grdProdStatus.GetGridData(i,G1_Cut_length)
                        if(Number(value))
                        {
                            sum_cut = sum_cut + Number(value)
                        }
                        //-----------------
                        value = grdProdStatus.GetGridData(i,G1_Server_M)
                       
                        if(Number(value))
                        {
                            sum_service = sum_service + Number(value)
                        }
                        //-----------------
                         value = grdProdStatus.GetGridData(i,G1_Loss_Len)
                       
                         if(Number(value))
                        {
                            sum_loss = sum_loss + Number(value)
                        }
                        //-----------------
                        value = grdProdStatus.GetGridData(i,G1_Trim_Width)
                         if(Number(value))
                        {
                            sum_trim = sum_trim + Number(value)
                        }
                    }
                    
                    //-----------------
                    value = grdProdStatus.GetGridData(i,G1_Finish)
                     if(Number(value))
                    {
                        sum_finish = sum_finish + Number(value)
                    }
                     //-----------------
                    value = grdProdStatus.GetGridData(i,G1_Min)
                     if(Number(value))
                    {
                        sum_min = sum_min + Number(value)
                    }
                     //-----------------
                    value = grdProdStatus.GetGridData(i,G1_C_Grade)
                     if(Number(value))
                    {
                        sum_c = sum_c + Number(value)
                    }
                     //-----------------
                    value = grdProdStatus.GetGridData(i,G1_D_Grade)
                     if(Number(value))
                    {
                        sum_d = sum_d + Number(value)
                    }
              }
            grdProdStatus.AddRow();
            
            var sum_input = sum_cut + sum_service + sum_loss;
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Total_Roll_Len, sum_input)
            
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Cut_length,sum_cut)
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Server_M,sum_service)
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Loss_Len,sum_loss)
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Finish,sum_finish)
            
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Min,sum_min)
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_C_Grade,sum_c)
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_D_Grade,sum_d)
            var sum_total = sum_c + sum_d + sum_min + sum_finish;
            grdProdStatus.SetGridText(grdProdStatus.rows-1,G1_Total_Qty,sum_total )
            
            
            grdProdStatus.SetCellBold( 1, G1_Finish, grdProdStatus.rows - 1, G1_Min, true);
            grdProdStatus.SetCellBold( 1, G1_Roll_Len, grdProdStatus.rows - 1, G1_Roll_Len, true);
            grdProdStatus.SetCellBold( 1, G1_Total_Qty, grdProdStatus.rows - 1, G1_Total_Qty, true);
          
            grdProdStatus.SetCellBgColor( grdProdStatus.rows - 1, 0, grdProdStatus.rows - 1, grdProdStatus.cols - 1, 0xFFFFCC );
            grdProdStatus.SetCellBgColor( 1, G1_Out_Item, grdProdStatus.rows - 2,grdProdStatus.cols - 1, 0xCCFFFF );
            var fg = grdProdStatus.GetGridControl(); 
            fg.MergeRow(grdProdStatus.rows - 1) = true ;
            fg.Cell(0, grdProdStatus.rows - 1, 0, grdProdStatus.rows - 1, G1_Roll_ID) = "TOTAL";
            
            if(radSearchPage.value=='2')
          {
            grdProdStatus.GetGridControl().ColHidden(G1_Min)   = false ;
          }else
          {
            grdProdStatus.GetGridControl().ColHidden(G1_Min)   = true ;
          }
         // SetHeader()
    }
  
}   

function SetHeader()
{
    var fg = grdProdStatus.GetGridControl();                  

            fg.FixedRows  = 2;
            fg.MergeCells = 2;
            
            fg.MergeCol(G1_NO) = true ;
            fg.Cell(0, 0, G1_NO, 1, G1_NO) = "WI No.";
            
            fg.MergeRow(0) = true;
           // fg.Cell(0, 0, G1_Roll_ID, 0, G1_Combine_Len) = "Input Mill Roll"; 
            fg.Cell(0, 1, G1_Roll_ID , 1 ) = "Roll ID"; 
            fg.Cell(0, 1, G1_Item_Name , 1 ) = "Item Name";
            fg.Cell(0, 1, G1_Roll_Len , 1 ) = "Length";
            fg.Cell(0, 1, G1_Comb_Roll_Id    , 1 ) = "Roll Id";
            fg.Cell(0, 1, G1_Combine_Item  , 1 ) = "Item Code"; 
            fg.Cell(0, 1, G1_Combine_Len  , 1 ) = "Length";  
           
            fg.MergeRow(0) = false;
            fg.MergeCol(G1_Total_Roll_Len)  = true ;
            fg.Cell(0, 0, G1_Total_Roll_Len , 1, G1_Total_Roll_Len ) = "Length(M)";
            
            fg.MergeCol(G1_Cut_length)     = true ;
            fg.Cell(0, 0, G1_Cut_length    , 1, G1_Cut_length    ) = "Cut length(M)";
            
            fg.MergeCol(G1_Server_M)    = true ;
            fg.Cell(0, 0, G1_Server_M   , 1, G1_Server_M   ) = "Service M";
            
            fg.MergeCol(G1_Loss_Len)      = true ;
            fg.Cell(0, 0, G1_Loss_Len     , 1, G1_Loss_Len     ) = "Loss Length";
            
            fg.MergeCol(G1_Trim_Width) = true ;
            fg.Cell(0, 0, G1_Trim_Width , 1, G1_Trim_Width ) = "Trim Width";
            
            fg.MergeCol(G1_Prod_dt)   = true ;  
            fg.Cell(0, 0, G1_Prod_dt  , 1, G1_Prod_dt  ) = "Prod Date";
            
            fg.MergeCol(G1_Shift) = true ;
            fg.Cell(0, 0, G1_Shift  , 1, G1_Shift  ) = "Shift";
            
            fg.MergeCol(G1_Out_Item) = true ;
            fg.Cell(0, 0, G1_Out_Item  , 1, G1_Out_Item  ) = "Output Item ";
            
            
            
            fg.MergeRow(0) = true;
            //fg.Cell(0, 0, G1_Finish, 0, G1_Min) = "A Grade"; 
            fg.Cell(0, 1, G1_Finish , 1 ) = "Finish(Roll)"; 
            fg.Cell(0, 1, G1_Min , 1 ) = "For Min(Roll)"; 
            
            fg.MergeRow(0) = true;
           // fg.Cell(0, 0, G1_C_Reason, 0, G1_C_Grade) = "C Grade"; 
            fg.Cell(0, 1, G1_C_Reason , 1 ) = "Reason"; 
            fg.Cell(0, 1, G1_C_Grade , 1 ) = "Qty (Roll)"; 
           
            fg.MergeRow(0) = true;
           // fg.Cell(0, 0, G1_D_Reason, 0, G1_D_Grade) = "D Grade"; 
            fg.Cell(0, 1, G1_D_Reason , 1 ) = "Reason"; 
            fg.Cell(0, 1, G1_D_Grade , 1 ) = "Qty (Roll)"; 
             
            fg.MergeCol(G1_Total_Qty) = true ;
            fg.Cell(0, 0, G1_Total_Qty  , 1, G1_Total_Qty  ) = "Total (Roll) "; 
                      
            //---Set Font Size---
            fg.Cell(12, 1, 0, 1, grdProdStatus.cols - 2 ) = 8;            
            //---Auto Size---
            fg.AutoSize( 0, 18, false, 0 );                                               
            //-----------------------
}
//------------------------------------------------------------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="PROD.sp_sel_fpep00061"  > 
                <input bind="grdProdStatus">                    
                    <input bind="dtFrom" />  
                    <input bind="dtTo" /> 
                    <input bind="lstShift" />
                    <input bind="txtCutType" />
                    <input bind="txtWINO" />
                    <input bind="txtRollID" />
                </input> 
                <output bind="grdProdStatus" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="data_fpep00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="prod.sp_sel_fpep00061_1"  > 
                <input bind="grdNoneOperation">                    
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtCutType" />
                </input> 
                <output bind="grdNoneOperation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%">
            <tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td style="width: 10%;" align="right">
                                Date</td>
                            <td style="width: 25%; white-space: nowrap" align="left">
                                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                                ~
                                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                            </td>
                             <td style="width: 30%;" align="center" colspan="2">
                                <gw:radio id="radSearchPage" value="2" styles="width:100%" onchange="OnSearch()" > 
                                    <span value="2">MA Cutting</span> 
                                    <span value="3">MI Cutting</span> 
                                </gw:radio>
                            </td>
                            <td style="width: 10%;" align="right">
                                Shift
                            </td>
                            <td style="width: 20%;">
                                <gw:list id="lstShift" styles='width:100%' onchange="OnSearch()" />
                            </td>
                            <td style="width: 20%;"></td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnSearch" img="Search" alt="Search" text="Search" onclick="OnSearch()" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%;" align="right">
                                WI No</td>
                            <td style="width: 25%; white-space: nowrap" align="left">
                                <gw:textbox id="txtWINO" styles="width:100%" onenterkey="" />
                            </td>
                            <td style="width: 10%;" align="right">
                                Roll ID
                            </td>
                            <td style="width: 20%;" align="left">
                                <gw:textbox id="txtRollID" styles="width:100%" onenterkey="" />
                            </td>
                            <td style="width: 10%;" align="right">                               
                            </td>
                            <td style="width: 20%;">                                
                            </td>
                            <td style="width: 20%;"></td>
                            <td style="width: 1%;">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 99%">
                <td>
                    <!--<gw:tab id="tab">-->
                    <gw:tab id="tab">
                    <table style="width: 100%; height: 100%" name="Production Status">
                        <tr>
                            <td>
                            <gw:grid id='grdProdStatus'
                            header='WI No|_pp|Roll Id|Item|Length|Combine Roll|Combine Item|Length|Total Length|Cut Length|Service M|Loss Length|Trim With|Prod DT|Shift|Item Name|A Grade(Roll)|A Grade for Min|C Reason|C Grade (Roll)|D Reason|D Grade(Roll)|Total(Roll)|_Yeild'
                            format='0|0|0|0|1|0|0|1|1|1|1|1|1|4|0|0|1|1|0|1|0|1|1|1'
                            aligns='0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='|||||||||||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='1500|0|1500|3000|1500|1500|2500|1500|1500|1500|1500|1500|1500|1200|1500|3000|1500|1500|1000|1500|1000|1500|1000|0'
                            sorting='F' acceptNullDate='true'
                            styles='width:100%; height:100%'
                            />
                                
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%; height: 100%" name="None Operation">
                        <tr>
                            <td>
                                 <gw:grid id='grdNoneOperation' header='Seq|_PK|Reason|From Date|Start Time|To Date|End Time|Duration|Description'
                                    format='0|0|0|4|0|4|0|0|0' aligns='0|0|0|0|1|0|1|3|0' defaults='|||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                    widths='800|1000|2000|1200|1500|1200|1500|1500|1000' sorting='T' styles='width:100%; height:100%' acceptNullDate='true'
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
     <gw:textbox id="txtCutType" styles='width:100%;display:none' />
</body>
</html>
