<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO REVISION CHECKING</title>
</head>

<script>
 var iColRevisionStatus = 2;
 
 var    SO_Note                 = 3,
        SO_Ord_Status           = 7,
        SO_Deli_Method          = 14,
        SO_Deli_Term            = 15,
        SO_Ex_Nation            = 18,
        SO_Dest_Nation          = 19,
        SO_Export               = 21,
        SO_Dest_Port            = 22,
        SO_Sale_Type            = 24,
        SO_Ccy_Unit             = 25,
        SO_Tax_Rate             = 29,
        SO_Oder_Type            = 30,
        SO_Pay_Form             = 31,
        SO_Ord_Priority         = 34,
        SO_Pay_Term             = 35,
        SO_Price_Type           = 41,
        SO_Stock_Type           = 42;
        
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
      dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-5)); 
      
      BindingDataList()
      GridFormat()
 } 
 //---------------------------------------------------------
 function BindingDataList()
{
    var data 
   // idGrid.GetGridControl().FrozenCols = 4 ;
    data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0190','','') FROM DUAL" )%>|ALL|Select All";    
    lstStatus.SetDataText(data);   
    lstStatus.value = 'ALL' ;
    
    var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0190' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdRevisonList.SetComboFormat(2,data);
     //---------------------------------------------  
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='ACAB0110' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Ccy_Unit,data); 
        
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Ord_Status,data);        

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0030' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Deli_Method,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0040' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Deli_Term,data);

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='COAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Ex_Nation,data);        

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='COAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Dest_Nation,data);

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0010' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Export,data);                
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0020' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Dest_Port,data);
                          
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0050' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Oder_Type,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0070' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Sale_Type,data);         
            
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0100' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Price_Type,data);          
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0110' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Ord_Priority,data);     

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0120' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Stock_Type,data); 

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0170' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Pay_Form,data); 
                    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0180' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSOMaster.SetComboFormat(SO_Pay_Term,data);  
  //-----------------------------------------------   
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0030' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSODetail.SetComboFormat(20,data); 

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSODetail.SetComboFormat(29,data); 
                    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0090' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdSODetail.SetComboFormat(19,data);

}
function GridFormat()
{
     //Merge Column
      grdSOMaster.GetGridControl().FrozenCols  = 8 ;
      grdSOMaster.GetGridControl().MergeCells  = 3 ;	
      grdSOMaster.GetGridControl().MergeCol(0) = true ;	
      grdSOMaster.GetGridControl().MergeCol(1) = true ; 
      grdSOMaster.GetGridControl().MergeCol(2) = true ;  	
      //------------------------------------------------
      grdSODetail.GetGridControl().FrozenCols  = 11 ;
      grdSODetail.GetGridControl().MergeCells  = 3 ;	
      grdSODetail.GetGridControl().MergeCol(0) = true ;	
      grdSODetail.GetGridControl().MergeCol(1) = true ; 
      grdSODetail.GetGridControl().MergeCol(2) = true ;  	
      //------------------------------------------------
      trl = grdSODetail.GetGridControl();
      	
      trl.ColFormat(12)           = "###,###,###,###,###.###";
      trl.ColFormat(14)           = "###,###,###,###,###.###";
      trl.ColFormat(16)           = "###,###,###,###,###.###";
      trl.ColFormat(17)           = "###,###,###,###,###.###";  
      trl.ColFormat(18)           = "###,###,###,###,###.###";  
}
 //---------------------------------------------------------
 function OnSearch(id)
 {
    switch (id)
    {
        case 1: 
            dsbs00080.Call('SELECT')
        break;
        case 2:
            txtRevisionPK.text = grdRevisonList.GetGridData(event.row,0);
            dsbs00070_3.Call('SELECT')
        break;
    }
    
 }
  //------------------------------------------------------------------------------

 function SetHightLight(grid)
 {
     for ( var i = 1 ; i <= grid.rows - 1 ; i ++ )
        {
            if ( i % 2 != 0 )
            {
	            //grid.GetGridControl().Cell( 7 , i , 1 , i, grid.cols - 1 ) = 0x808080;
            }
            else
            {
              grid.GetGridControl().Cell( 7 , i , SO_Note , i, SO_Note ) = 0x3300cc; 
                for ( var j = 1; j <= grid.cols - 1 ; j++)
                {
                    if ( grid.GetGridData( i, j) != grid.GetGridData( i-1, j) )
                    {
                        grid.SetCellBold( i, j, i, j, true);
                        grid.GetGridControl().Cell( 6 , i , j , i, j ) = 0xCCFFFF;
                    }    
                }                    
            }
        }
}
 //---------------------------------------------------------
 function OnDataReceive(obj)
 {
    if(obj.id=="dsbs00070_3")
    {
         dsbs00070_4.Call('SELECT')
    }
    if(obj.id=="dsbs00070_4")
    {
        SetHightLight(grdSOMaster)
        dsbs00070_5.Call('SELECT')
    }
    if(obj.id=="dsbs00070_5")
    {
        SetHightLight(grdSODetail)
    }
 }
 //---------------------------------------------------------------

function OnApprove()
{
    for ( i = 1 ; i < grdRevisonList.rows ; i++ )
    {
        if ( grdRevisonList.GetGridControl().isSelected(i) == true )
        {

            grdRevisonList.SetGridText( i, iColRevisionStatus, '02') ;

        } 
    } 

}
 //---------------------------------------------------------------

function OnSaveApprove()
{
    dsbs00080.Call()
}

 //---------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00080" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00080" parameter="0,2" procedure="sale.sp_upd_dsbs00080_1"   > 
                <input> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                    <input bind="lstStatus" /> 
                    <input bind="txtSONo" /> 
                </input> 
                <output bind="grdRevisonList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="sale.sp_sel_dsbs00070_3" > 
                <inout> 
                    <inout bind="txtRevisionPK" />
                    <inout bind="txtDescription" />  
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00070_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00070_4"   > 
                <input> 
                    <input bind="txtRevisionPK" /> 
                </input> 
                <output bind="grdSOMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00070_5" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00070_5"   > 
                <input> 
                    <input bind="txtRevisionPK" /> 
                </input> 
                <output bind="grdSODetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width='100%' style="height: 100%" border="1" cellpadding="0">
        <tr style="height: 2%">
            <td>
                <table>
                    <tr>
                        <td style="width: 10%" align="right">
                            <b>From date</b>
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFromDate" lang="1" styles="width:100%" onchange="OnSearch(1)" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" styles="width:100%" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 15%" align="right">
                            <b>Revision Status</b>
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstStatus" styles="width:100%" onchange="OnSearch(1)" />
                        </td>
                        <td align="right" style="width: 10%">
                            <b>SO No</b>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSONo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 12%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="save" alt="Save" id="btnSave1" onclick="OnSaveApprove()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button text="Approve" onclick="OnApprove()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 33%">
            <td>
                <table style="width: 100%; height: 100%" border="1" cellspacing="0">
                    <tr>
                        <td style="width: 50%">
                            <gw:grid id='grdRevisonList' header='_PK|Revision Date|Revision Status|Subject|_CHARGER_EMP_PK|Charger ID|Charger Name|_Att01|_Att02|_Att03|_Att04|_Att05'
                                format='0|0|2|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1' widths='0|1500|1500|3000|0|1500|2000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch(2)" />
                        </td>
                        <td style="width: 50%">
                            <p>
                                Revision Description
                            </p>
                            <gw:textarea rows="6" id="txtDescription" styles="width:100%;height:89%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 20%">
            <td>
                <p>
                    SO Revision</p>
                <gw:grid id="grdSOMaster" header="_PK|_tsa_revision_pk|Seq|Reason|_re_tsa_saleorder_pk|Order Date|Slip No|Ord Status|_BILL_TO_PK|Bill To Id|Bill To Name|_DELI_TO_PK|Deli To Id|Deli To Name|Deli Method|Deli Term|_DELI_LOC_PK|Deli Loc|Ex Nation|Dest Nation|PO No|Export|Dest Port|Description|Sale Type|Ccy Unit|_EMP_PK|Emp Id|Emp Name|Tax Rate|Oder Type|Pay Form|Sale Rep|Buy Rep|Ord Priority|Pay Term|Ord AMT|Total AMT|ETD|ETA|Exchange Rate|Price Type|Stock Type|Att01|Att02|Att03|Att04|Att05|Att06|Att07|_Original_data_yn|_Hightlight"
                    format='0|0|1|0|1|4|0|0|1|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0|0|1|0|0|1|0|0|0|0|0|0|1|1|4|4|1|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|3|0|0|0|0|0|0|3|3|1|1|3|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|600|1500|1000|1200|1500|1500|0|1500|2500|0|1500|2500|1500|1500|0|1500|1500|1500|1500|1500|1500|2000|1500|1000|0|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|1200|1500|1500|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    styles='width:100%; height:88%' sorting="F" />
            </td>
        </tr>
        <tr style="height: 30%">
            <td>
                <p>
                    SO Detail Revision</p>
                <gw:grid id='grdSODetail' header='_PK|_TSA_REVISION_PK|Seq|Reason|_TSA_SALEORDERD_PK|_TSA_SALEORDER_PK|So Item No|Seq Num|_TCO_ITEM_PK|Item Code|Item Name|Cust Item NM|ST Order Qty|ST Unit|Order Qty|Item Unit|Unit Price|Vate Rate|Amount|Ord Item Type|Deli Item Method|Item ETD|Item ETA|_T/O Req Qty|_T/O Plan Qty|_Prod Plan Qty|_T/O Qty|_Prod Qty|Description|Ord Item Status|Att01|Att02|Att03|Att04|Att05|Att06|Att07|Att08|Att09|Att10|Att11|_reserve_qty|_bc_qty|_original_data_yn|_hight_light_seq'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|1|1|0|0|4|4|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|600|1500|1000|0|1500|1000|0|1500|2500|2000|1500|1000|1500|1000|1500|1500|1500|1500|1500|1200|1200|1500|1500|1500|1500|1500|2000|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0|0'
                    styles='width:100%; height:90%' sorting="F" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtRevisionPK" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
