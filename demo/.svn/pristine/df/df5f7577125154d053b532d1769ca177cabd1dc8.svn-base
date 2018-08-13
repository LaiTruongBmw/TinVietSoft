<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>P/O Process Balance</title>
</head>

<script>
    
var G1_ORDPLAN_PK   = 0,
    G1_Array_SO_PK  = 1,
    G1_PO_No        = 2,    
    G1_STYLE_PK     = 3,
    G1_Style_Code   = 4,
    G1_Style_Name   = 5,
    G1_Plan_Qty     = 6,    
    G1_PROCESS_PK   = 7,
    G1_Seq          = 8,
    G1_Process      = 9,    
    G1_Prod_Qty     = 10,
    G1_Defect_Qty   = 11,
    G1_Bal_Qty      = 12;  
    
var G_OrdPlanPK = 0,
    G_SO_PO     = 1,
    G_ETD       = 2,
    G_Style_PK  = 3,
    G_Style_ID  = 4,
    G_Ord_Qty   = 5,
    G_Prod_Qty  = 6,
    G_Bal_Qty   = 7,
    G_D1        = 8, 
    G_D2        = 9, 
    G_D3        = 10,
    G_D4        = 11, 
    G_D5        = 12,
    G_D6        = 13,
    G_D7        = 14,
    G_D8        = 15,
    G_D9        = 16,
    G_D10       = 17;       
    
 //========================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //-----------------------------------------------------
    FormatGrid();
    OnPreviousDate();
    BindingDataList();    
    
    OnChangePage();
}
//========================================================================
function BindingDataList()
{    
    var data="";    
    //----------------------- 
              
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, process_id || ' - ' || process_name FROM tlg_pb_process WHERE del_if = 0 and use_yn = 'Y' ORDER BY process_id ") %>||Select ALL" ;    
    lstProcess.SetDataText(data);
    lstProcess.value = '';  
        
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	               
} 
//========================================================================
function FormatGrid()
{    
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G1_Plan_Qty)    = "###,###,###,###";
    ctrl.ColFormat(G1_Prod_Qty)    = "###,###,###,###";
    ctrl.ColFormat(G1_Defect_Qty)  = "###,###,###,###";
    ctrl.ColFormat(G1_Bal_Qty)     = "###,###,###,###";  
   
    //-----------------------------------    

    grdOrdPlan.GetGridControl().MergeCells  = 2 ;	
    grdOrdPlan.GetGridControl().MergeCol(0) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(1) = true ;   	
    grdOrdPlan.GetGridControl().MergeCol(2) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(3) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(4) = true ;
    grdOrdPlan.GetGridControl().MergeCol(5) = true ;
    grdOrdPlan.GetGridControl().MergeCol(6) = true ;
       
    //-----------------------------------
      var trl ;
      
      trl = grdView.GetGridControl();
      	
      trl.ColFormat(G_Ord_Qty ) = "###,###,###,###,###";
      trl.ColFormat(G_Prod_Qty) = "###,###,###,###,###";
      trl.ColFormat(G_Bal_Qty)  = "###,###,###,###,###"; 
      trl.ColFormat(G_D1)       = "###,###,###,###,###";     
      trl.ColFormat(G_D2)       = "###,###,###,###,###";
      trl.ColFormat(G_D3)       = "###,###,###,###,###";
      trl.ColFormat(G_D4)       = "###,###,###,###,###";
      trl.ColFormat(G_D5)       = "###,###,###,###,###";
      trl.ColFormat(G_D6)       = "###,###,###,###,###";
      trl.ColFormat(G_D7)       = "###,###,###,###,###";
      trl.ColFormat(G_D8)       = "###,###,###,###,###";
      trl.ColFormat(G_D9)       = "###,###,###,###,###";
      trl.ColFormat(G_D10)      = "###,###,###,###,###";    
}     

 //========================================================================
 function OnSearch()
 {
      var strRad = radPage.GetData();
      
      switch (strRad)         
      {
            case '1' :
                data_fpgm00090.Call("SELECT");
            break; 
            
            case '2' :
                data_fpgm00090_1.Call("SELECT");
            break;            
      }  
 }
 
 //========================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "data_fpgm00090" :
                var p_ordplan_pk ;
                
                if ( grdOrdPlan.rows > 1 )
                {
                    grdOrdPlan.SetCellBold( 1, G1_PO_No,    grdOrdPlan.rows - 1, G1_PO_No,    true);
                    grdOrdPlan.SetCellBold( 1, G1_Plan_Qty, grdOrdPlan.rows - 1, G1_Plan_Qty, true);
                    grdOrdPlan.SetCellBold( 1, G1_Prod_Qty, grdOrdPlan.rows - 1, G1_Bal_Qty,  true);
                    
                    p_ordplan_pk = grdOrdPlan.GetGridData( 1, G1_ORDPLAN_PK);
                }
                
                //-------------------
                
                for ( var i=1; i<grdOrdPlan.rows; i++ )
                {
                    if ( p_ordplan_pk != grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK) )
                    {
                        p_ordplan_pk = grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK);
                    
                        while ( grdOrdPlan.rows > i && p_ordplan_pk == grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK))
                        {
                            grdOrdPlan.SetCellBgColor( i, 1, i, grdOrdPlan.cols - 1, 0xCCFFFF );                             
                            i++;
                        }
                        
                        if ( grdOrdPlan.rows > i )
                        {
                            p_ordplan_pk = grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK);
                        }                           
                    }                    
                }   
                //-------------------              
            break;  
            
            case 'data_fpgm00090_1':           
                SetHeader();
                
                data_fpgm00090_2.Call("SELECT");
            break; 
            
            case 'data_fpgm00090_2':           
                if ( grdView.rows > 1 )
                {
                    grdView.SetCellBold( 1, G_SO_PO, grdView.rows-1, G_SO_PO, true);
                    grdView.SetCellBold( 1, G_Style_ID, grdView.rows-1, G_Style_ID, true);
                    
                    grdView.GetGridControl().Cell( 7, 1, G_Ord_Qty, grdView.rows-1, G_Prod_Qty ) = 0x3300cc;
                    
                    grdView.SetCellBgColor( 1, G_Bal_Qty, grdView.rows-1, G_Bal_Qty, 0xCCFFFF );
                    
                    grdView.Subtotal( 0, 2, -1, '5!6!7!8!9!10!11!12!13!14!15!16!17','###,###,###');
                }                
            break; 
      }
 }       
//========================================================================
function OnPopUp(pos)
{    
    switch(pos)
    {        
        case 'ViewDetail':
            var strRad = radPage.GetData();

            switch (strRad)
            {
                case '1':
                    if ( grdOrdPlan.row > 0 )
                    {
                         var path = System.RootURL + '/form/fp/gm/fpgm00091.aspx?ordplan_pk=' + grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK) + '&process_pk=' + grdOrdPlan.GetGridData( grdOrdPlan.row, G1_PROCESS_PK) ;
                         var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');
                    }
                    else
                    {
                        alert('Pls select a P/O first.');
                    }            
                break;
                
                case '2':
                    if ( ( grdView.row > 0 ) && ( grdView.col > G_Bal_Qty ) )
                    {
                        var fpath = System.RootURL + "/form/fp/gm/fpgm00092.aspx?ordplan_pk=" + grdView.GetGridData( grdView.row , G_OrdPlanPK) +"&prod_date=" + grdTmp.GetGridData( 3, grdView.col-8) ; 
                        var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1000px;dialogHeight:500px');	
                    }
                    else
                    {
                        alert('Pls select a P/O first.');
                    }            
                break;        
            }            
        break;
     }        
}
//========================================================================
function OnCellDoubleClick(obj)
{
    switch(obj.id)
    {
        case 'grdOrdPlan':
            if ( event.col == G1_Process )
            {
                OnPopUp('ViewDetail');
            }
        break;
        
        case 'grdView' :
            var col_event = event.col;
            var row_event = event.row;
            
            if ( col_event > G_Prod_Qty )
            {
                var fpath = System.RootURL + "/form/fp/gm/fpgm00092.aspx?ordplan_pk=" + grdView.GetGridData( row_event , G_OrdPlanPK) +"&prod_date=" + grdTmp.GetGridData( 3, col_event-8) ; 
                var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1000px;dialogHeight:500px');	
            }         
        break;
    }
}

//========================================================================
function OnChangePage()
{
    var strRad = radPage.GetData();
             
	switch (strRad)
	{
		case '1':
		    page1.style.color = "cc0000"; 
		    page2.style.color = ""; 
		    
		    lbDate.style.display    = "none";
		    dtDate.style.display    = "none"; 
		    imgArrow.style.display  = "none";
		    imgArrow1.style.display = "none";		   
		    
		    grdOrdPlan.style.display = "";		     
		    grdView.style.display    = "none";
        break;
        
        case '2':
		    page1.style.color = ""; 
		    page2.style.color = "cc0000";
		    		    
		    lbDate.style.display    = "";
		    dtDate.style.display    = ""; 
		    imgArrow.style.display  = "";
		    imgArrow1.style.display = "";		    		    
		    
		    grdOrdPlan.style.display = "none";
		    grdView.style.display    = ""; 	  
        break;	
        case '3':
		    page1.style.color = ""; 
		    page2.style.color = "";
		    		    
		    lbDate.style.display    = "none";
		    dtDate.style.display    = "none"; 
		    imgArrow.style.display  = "none";
		    imgArrow1.style.display = "none";	    		    
		    
		    grdOrdPlan.style.display = "none";
		    grdView.style.display    = "none"; 	   		    		    
        break;	
    } 
}

//==========================================================================
function OnPreviousDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),-5));
    OnSearch();
}
//==========================================================================
function OnNextDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),+5));
    OnSearch();
}
//==========================================================================

function SetHeader()
{
     for( var j = 0; j < grdTmp.cols; j++ )
     {
          //------------------------
          if ( grdTmp.GetGridData( 1, j ) == "SUNDAY   " ) // Bat buoc phai co khoang trong phia sau cua chu SUNDAY
          {        
                grdView.GetGridControl().Cell( 7, 0, j + 8, 0, j + 8)   = 0x3300cc;                        
          }
          else
          {
                grdView.GetGridControl().Cell( 7, 0, j + 8, 0, j + 8)   = 0x000000;
          }
          
          //------------------------      
          grdView.GetGridControl().Cell( 0, 0, j + 8, 0, j + 8 ) = grdTmp.GetGridData( 2, j );
          //------------------------
     }     
}

//========================================================================
function OnPrint()
{
     //------------------
     switch(lstReportType.value)
     {
            case '10' :
                var url =System.RootURL + "/reports/fp/gm/rpt_fpgm00090_bkvina.aspx?process_pk=" + lstProcess.value + "&process_name=" + lstProcess.GetText();
	            System.OpenTargetPage(url); 
            break;
     }
     
}
//=========================================================================
function OnExcel()
{
     if ( grdView.row > 0 && ( grdView.col >= G_D1 || grdView.col <= G_D10 ))
     {
        txtDate.text = grdTmp.GetGridData( 3, grdView.col - 8 );
     }   
     else
     {
        txtDate.text= dtDate.value;
     }
     
     var url =System.RootURL + "/reports/fp/gm/rpt_fpgm00090_bkvina.aspx?process_pk=" + lstProcess.value + "&process_name=" + lstProcess.GetText() +"&day="+ txtDate.text;
     System.OpenTargetPage(url); 
}
//=========================================================================

</script>

<body>
    <!--------------------SO List------------------------------------->
    <gw:data id="data_fpgm00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fpgm00090" > 
                <input> 
					<input bind="lstFactory" /> 
                    <input bind="lstProcess" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00090_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00090_1"  > 
                <input> 
                    <input bind="dtDate" /> 
                </input> 
                <output bind="grdTmp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00090_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00090_2"  > 
                <input> 
                    <input bind="lstFactory" /> 
                    <input bind="lstProcess" />
                    <input bind="txtPOStyle" />
					<input bind="dtDate" />
                </input> 
                <output bind="grdView" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Total">
        <tr style="height: 1%">
            <td style="background-color: CCFFFF; width: 10%; white-space: nowrap" align="center">
                <gw:radio id="radPage" value="1" styles="width:100%" onchange="OnChangePage()">                   
                    <span value="1" id="page1">Total</span>                       
                    <span value="2" id="page2">Daily</span>		                                
                </gw:radio>
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Fac</td>
            <td style="width: 20%">
                <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Process</td>
            <td style="width: 20%">
                <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtPOStyle" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                <b id="lbDate">Date</b></td>
            <td style="width: 5%">
                <gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="back" id="imgArrow" style="cursor: hand" alt="back" onclick="OnPreviousDate()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="next" id="imgArrow1" style="cursor: hand" alt="back" onclick="OnNextDate()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnReport" img="excel" alt="PO Sheet" onclick="OnExcel()" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnViewDetail" img="2" text="View Detail" onclick="OnPopUp('ViewDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="14">
                <gw:grid id='grdOrdPlan' header='_PP_ORDPLAN_PK|_Array_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|Plan Qty|_PB_PROCESS_PK|Seq|Process ID|Prod Qty|Defect Qty|Prod Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|3|0|1|0|3|3|3' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|1500|0|1500|3500|1500|0|800|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)" />
                <gw:grid id='grdView' header='_SO_PK|P/O|ETD|_Style_PK|Style ID|Plan Qty|Prod Qty|Bal Qty|D1|D2|D3|D4|D5|D6|D7|D8|D9|D10'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    defaults='|||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|1200|0|2000|1200|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)"
                    acceptnulldate="T" />                 
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
<!------------------------------------------------------->
<gw:textbox id="txtDate" styles='width:100%;display:none' />
<gw:grid id='grdTmp' header='D1|D2|D3|D4|D5|D6|D7|D8|D9|D10' format='0|0|0|0|0|0|0|0|0|0'
    aligns='0|0|0|0|0|0|0|0|0|0' defaults='|||||||||' editcol='1|1|1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%;display:none' />
<!--------------------------------------------------------------------------->
</html>
