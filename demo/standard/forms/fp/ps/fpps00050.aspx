<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Line Result Confirm</title>
</head>
<%  ESysLib.SetUser("prod")%>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             

var G_TS2_LINE_RESULT_M_PK   = 0,
    G_WP_ID                  = 1,
    G_LINE_PK                = 2,
    G_LINE_ID                = 3,
    G_PROD_DATE              = 4, 
    G_TARGET_QTY             = 5,
    G_PROD_QTY               = 6,
    G_STATUS                 = 7,
    //---------------------------
    G1_T_TIME                  =   0,
    G1_PROD_QTY                =   1,
    G1_PP_ORDPLAN_PK           =   2,
    G1_REF_PO_NO               =   3,
    G1_STYLE_ID                =   4,
    G1_SPEC01_PK               =   5,
    G1_SPEC01_ID               =   6,
    G1_SPEC02_PK               =   7,
    G1_SPEC02_ID               =   8,
    G1_SPEC03_PK               =   9,
    G1_SPEC03_ID               =   10,
    G1_POP_PROD_QTY            =   11,
    G1_ACT_PROD_QTY            =   12,
    G1_ADJ_PROD_QTY            =   13,
    G1_POP_DEF_QTY             =   14,
    G1_ACT_DEF_QTY             =   15,
    G1_ADJ_DEF_QTY             =   16,
    G1_TS2_LINE_RESULT_D_PK    =   17,
    G1_TS2_LINE_RESULT_M_PK    =   18;
    
//=====================================================================================
function BodyInit()
 {  
    System.Translate(document);

    OnFormatGrid();
        
    var ctr1 = grdDetail.GetGridControl(); 
    
    //-----------------------------------    

    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;	
    grdDetail.GetGridControl().MergeCol(3) = true ;	
    grdDetail.GetGridControl().MergeCol(4) = true ;
    grdDetail.GetGridControl().MergeCol(5) = true ;
    grdDetail.GetGridControl().MergeCol(6) = true ;
	
    ctr1.MergeCol(G1_T_TIME) = true ;	
 }
//===================================================================================== 
  function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
 }
//=====================================================================================
  function OnSearch(pos)
 {
      switch (pos)         
      {		   
            case 'LineGroup':
                pro_fpps00050.Call();
            break; 
            //--------------
            case 'Search':
                data_fpps00050.Call('SELECT');
            break;
            //-------------
            case 'Master':
                if ( grdSearch.row > 0 )
                {
                        var event_row = grdSearch.row ;
                        //----------------------
                  txtTrs2_line_result_m_pk.text = grdSearch.GetGridData( event_row, G_TS2_LINE_RESULT_M_PK);          
                                 txtLinePK.text = grdSearch.GetGridData( event_row, G_LINE_PK);
                               lblLineText.text = grdSearch.GetGridData( event_row, G_LINE_ID);
                                 lblWPText.text = grdSearch.GetGridData( event_row, G_WP_ID);
                               dtProdDate.value = grdSearch.GetGridData( event_row, G_PROD_DATE);
                           lblProdDateText.text = grdSearch.GetGridData( event_row, G_PROD_DATE).substr(6,2) + '/' + grdSearch.GetGridData( event_row, G_PROD_DATE).substr(4,2) + '/' + grdSearch.GetGridData( event_row, G_PROD_DATE).substr(0,4)    ;       
                          lblTargetQtyText.text = grdSearch.GetGridData( event_row, G_TARGET_QTY);
                            lblProdQtyText.text = grdSearch.GetGridData( event_row, G_PROD_QTY);
                             lblStatusText.text = grdSearch.GetGridData( event_row, G_STATUS);

                        data_fpps00050_1.Call('SELECT');    
                }
            break;
      }  
 }
//=====================================================================================
 function OnProcess(pos)
 { 
      switch (pos)         
      {		        
            case 'Load':
                pro_fpps00050_1.Call();
            break;
            //-----
            case 'Approve':
                pro_fpps00050_2.Call();
            break;
            //-----
            case 'Cancel':
                pro_fpps00050_3.Call();
            break;

            case 'AddNew':

                 var path = System.RootURL + '/form/fp/ps/fpps00051.aspx?work_process_pk=';// + grdMaster.GetGridData( grdMaster.row, G1_WORK_PROCESS_PK ) ;
                 var object = System.OpenModal( path ,900 , 600 , 'resizable:yes;status:yes', this); 
                 
                 if ( object != null )
                 { 
                        var arrTemp;                        
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];

                                if(grdDetail.rows > 0)
                                {
                                    grdDetail.Cleartotal()
                                    grdDetail.AddRow();
                                }
                                else
								{
                                    grdDetail.AddRow();
                                }
                                                                 
                                grdDetail.SetGridText(grdDetail.rows-1, G1_TS2_LINE_RESULT_M_PK, txtTrs2_line_result_m_pk.text); //master_pk            
                                	    
                                grdDetail.SetGridText(grdDetail.rows-1, G1_STYLE_ID,    arrTemp[3]); //style id	    	    
                                  
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC01_PK, arrTemp[5]); //spec pk
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC01_ID, arrTemp[6]); //spec name
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC02_PK, arrTemp[7]); //spec pk   
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC02_ID, arrTemp[8]); //spec name   
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC03_PK, arrTemp[9]); //spec pk   
                                grdDetail.SetGridText(grdDetail.rows-1, G1_SPEC03_ID, arrTemp[10]); //spec name  
                                                                                            
                                grdDetail.SetGridText(grdDetail.rows-1, G1_POP_PROD_QTY , arrTemp[17]); // bal qty
                                grdDetail.SetGridText(grdDetail.rows-1, G1_REF_PO_NO ,   arrTemp[1]); // ref_po_no  
                                
                                grdDetail.SetGridText(grdDetail.rows-1, G1_PP_ORDPLAN_PK,   arrTemp[0] );  // WI Table PK                                                                          
                        }                  
                 }               
                
            break;
      }
 } 
//=====================================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		       
            case 'data_fpps00050_1':
                if ( grdDetail.rows > 1 )
		        {
                    grdDetail.SetCellBgColor( 0, G1_POP_PROD_QTY,   grdDetail.rows-1, G1_ADJ_PROD_QTY,    0xCCFFFF ); 
                    grdDetail.Subtotal( 0, 2, -1, '11!12!13!14!15!16');
                }                
            break;
            //---------             
            case 'pro_fpps00050_1':
                alert(txtReturnValue.text);
                
                OnSearch('Master');
            break;
            //-----
            case 'pro_fpps00050_2':
                alert(txtReturnValue.text);
                
                OnSearch('Master');
            break;
            //-----
            case 'pro_fpps00050_3':
                alert(txtReturnValue.text);
                
                OnSearch('Master');
            break;                        
      }  
 }
//=====================================================================================
function OnSave()
{
    data_fpps00050_1.Call();
} 
//=====================================================================================
function OnPrint()
{
    var url =System.RootURL + '/reports/fp/ps/rpt_fpps00050.aspx?p_ts2_line_result_m_pk='+ txtTrs2_line_result_m_pk.text ;
    window.open(url); 
}
//=====================================================================================

</script>

<body>
    <!-------------********** SEARCH *******--------------------->
    <gw:data id="data_fpps00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2" function="<%=l_user%>lg_sel_fpps00050" > 
                <input>
                    <input bind="lstLineGroup" />
                    <input bind="dtFrom" />                       
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------********* DETAIL ******------------------------->
    <gw:data id="data_fpps00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="<%=l_user%>lg_sel_fpps00050_1" procedure="<%=l_user%>lg_upd_fpps00050_1" > 
                <input>
					<input bind="txtLinePK" />
                    <input bind="dtProdDate" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------********* PROCESS ******------------------------->
    <gw:data id="pro_fpps00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00050" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstLineGroup" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="pro_fpps00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpps00050_1" > 
                <input>
                    <input bind="txtLinePK" />
                    <input bind="txtLineID" />
                    <input bind="dtProdDate" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="pro_fpps00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpps00050_2" > 
                <input>
                    <input bind="txtLinePK" />
                    <input bind="dtProdDate" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="pro_fpps00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpps00050_3" > 
                <input>
                    <input bind="txtLinePK" />
                    <input bind="dtProdDate" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td>
                            Factory
                        </td>
                        <td colspan="2">
                            <gw:list id="lstFactory" styles='width:100%' csstype="mandatory" onchange="OnSearch('LineGroup')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap">
                            Line Group
                        </td>
                        <td colspan="2">
                            <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch('Search')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            Date
                        </td>
                        <td style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Search')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_ts2_line_result_m_pk|_Wp ID|_pb_line_pk|Line ID|Prod Date|Target Qty|Prod Qty|Status'
                                format='0|0|0|0|4|0|0|0' aligns='0|0|0|0|1|3|3|1' check='||||||' editcol='1|0|0|0|0|0|0|0'
                                widths='0|1000|0|1000|1200|1000|1000|1200' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <gw:label id="lblLine" styles='width:100%; font:10pt' text='Line' />
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtLinePK" styles="display:none" />
                            <gw:textbox id="txtLineID" styles="display:none" />
                            <gw:label id="lblLineText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 5%">
                            <gw:label id="lblWP" styles='width:100%; font:10pt' text='W/P' />
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblWPText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <gw:label id="lblProdDate" styles='width:100%; font:10pt' text='Prod Date' />
                        </td>
                        <td style="width: 15%">
                            <gw:datebox id="dtProdDate" lang="1" style="display: none" />
                            <gw:label id="lblProdDateText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Detail')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            <gw:label id="lblTargetQty" styles='width:100%; font:10pt' text='Target Qty' />
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblTargetQtyText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <gw:label id="lblProdQty" styles='width:100%; font:10pt' text='Prod Qty' />
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblProdQtyText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <gw:label id="lblStatus" styles='width:100%; font:10pt' text='Status' />
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblStatusText" styles='width:100%; height:100%; font:15pt; background-color:AFF8F6; color:0D0DF8'
                                text='-' />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="7">
                            <table>
                                <tr>
                                    <td style="width: 100%">
                                    </td>
                                    <td>
                                        <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="OnProcess('AddNew')" />
                                    </td>
                                    <td>
                                        <gw:icon id="idBtnLoad" img="2" text="Load" styles='width:100%' onclick="OnProcess('Load')" />
                                    </td>
                                    <td>
                                        <gw:icon id="idBtnApprove" img="2" text="Approve" styles='width:100%' onclick="OnProcess('Approve')" />
                                    </td>
                                    <td>
                                        <gw:icon id="idBtnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' header='Times|Prod Qty|_PP_ORDPLAN_PK|Ref Po No|Style ID|_SPEC01_PK|_SPEC01_ID|_SPEC02_PK|Color|_SPEC03_PK|Size|Pop Prod Qty|Act Prod Qty|Adj Prod Qty|Pop Def Qty|Act Def Qty|Act Def Qty|_TS2_LINE_RESULT_D_PK|_TS2_LINE_RESULT_M_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|3|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|0|0'
                                check='||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1200|1200|1200|1200|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtTrs2_line_result_m_pk" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
