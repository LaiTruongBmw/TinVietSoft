<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>WH Stock confirm Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_WH           = 0,           
    G1_PERIOD       = 1,
    G1_SO_SEQ       = 2,
    G1_SO           = 3,
    G1_PROD_ID      = 4,   
    G1_PROD_NM      = 5,     
    G1_MAT_ID       = 6,
    G1_MAT_NM       = 7,
    G1_UOM          = 8,
    G1_MAT_CON      = 9;

var G2_WH_NM        = 0,
    G2_PROD_ID      = 1,
    G2_PROD_NM      = 2,       
    G2_MAT_ID       = 3,     
    G2_MAT_NM       = 4,
    G2_UOM          = 5,
    G2_DATE_1       = 6,
    G2_DATE_2       = 7,
    G2_DATE_3       = 8,    
    G2_DATE_4       = 9,
    G2_DATE_5       = 10,
    G2_DATE_6       = 11,
    G2_DATE_7       = 12,
    G2_DATE_8       = 13,
    G2_DATE_9       = 14, 
    G2_DATE_10      = 15;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    //---------------------------------- 
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;   
    var now = new Date(); 
    var lmonth, ldate;    
     
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;     
	
	var data;   
	
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||SELECT ALL";   
    cboWH_Approve.SetDataText(data);
	cboWH_Approve.value = '';
	//---------------------------------- 
	cboWH.SetDataText(data);
	cboWH.value = '';           
    //-----------------------------------
    MergeColumn()
}
function MergeColumn()
{
      var ctrl = grdInquiry.GetGridControl() ;
      
      ctrl.MergeCells  = 2 ;	
      
      ctrl.MergeCol(0) = true ;	
      ctrl.MergeCol(1) = true ;   	
      ctrl.MergeCol(2) = true ;	
      ctrl.MergeCol(3) = true ;
      ctrl.MergeCol(4) = true ;
      ctrl.MergeCol(5) = true ;
      ctrl.MergeCol(6) = true ;
      //----------------------------
      ctrl = grdConsView.GetGridControl() ;      
      ctrl.MergeCells  = 2 ;	
      
      ctrl.MergeCol(0) = true ;	
      ctrl.MergeCol(1) = true ;   	
      ctrl.MergeCol(2) = true ;	
      ctrl.MergeCol(3) = true ;     
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdInquiry':
            data_fppr00240.Call('SELECT');
        break;
        
        case 'grdConsView':
            data_fppr00240_2.Call('SELECT')
        break;
    }
}


//==================================================================
function OnPrint()
{    
    txtDateFrom.text=dtFrom2.value;
    txtDateTo.text=dtTo2.value;
    
    var url =System.RootURL + "/reports/bi/ni/rpt_fppr00240.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fppr00240':
            if ( grdInquiry.rows > 1 )
            {
                lbConfirmRecord.text = grdInquiry.rows-1 + " record(s)";
                grdInquiry.SetCellBold( 1, G1_SO, grdInquiry.rows - 1, G1_SO, true);
                grdInquiry.SetCellBold( 1, G1_MAT_CON, grdInquiry.rows - 1, G1_MAT_CON, true);
            }            
        break;    
        
        case 'data_fppr00240_1':                    
            if ( grdConsView.rows > 1 )
            {
                lbRecord.text = grdConsView.rows-1 + " record(s)";
                for(var i= G2_DATE_1; i<= G2_DATE_10; i++)
                {
                    if (i%2==0)
                    {
                    grdConsView.SetCellBgColor( 1, i, grdConsView.rows - 1, i, 0xFFFFCC );	
                    }
                }
            }          
            
        break;  
                 
        case 'data_fppr00240_2' :
            var l_count = 0;        
            if(grdHeader.rows >1)
            {
                for(var i =1; i< grdHeader.rows ; i++)
                {
                    grdConsView.SetGridText(0,G2_DATE_1 + l_count,grdHeader.GetGridData(i,0));
                    grdConsView.GetGridControl().ColHidden(G2_DATE_1 + l_count) = false ;
                    l_count ++;                       
                }
                
            }
            //--------------
               for(var y = l_count + G2_DATE_1; y<= G2_DATE_10 ; y++)
                {
                    grdConsView.SetGridText(0,y,'-');
                    grdConsView.GetGridControl().ColHidden(y) = true ; 
                 }      
           data_fppr00240_1.Call('SELECT');
            
        break;
        
    }
}

//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00240" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fppr00240"  >
                <input bind="grdInquiry" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="cboWH_Approve" />
					<input bind="txtMatItem" />
			     </input>
                <output bind="grdInquiry" />
            </dso>
        </xml>
    </gw:data>  
      <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00240_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fppr00240_1"  >
                <input bind="grdConsView" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
			        <input bind="cboWH" />
					<input bind="txtProd" />
			     </input>
                <output bind="grdConsView" />
            </dso>
        </xml>
    </gw:data>
     <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00240_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fppr00240_2"  >
                <input bind="grdHeader" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
			        <input bind="cboWH" />				
			     </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
     <gw:tab id="idTab" style="width: 100%; height: 100%">	
                <table style="width: 100%; height: 100%" name="Mat. Consumption">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td>
                            W/H
                        </td>
                        <td style="width: 20%">
                            <gw:list id="cboWH_Approve" styles="width:100%;" />
                        </td>
                         <td style="width: 1%">
                            Mat. Item/SO
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtMatItem" styles="width: 100%" />
                        </td>
                        <td style="width: 37%; text-align: center; white-space: nowrap">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdInquiry')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                          
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdInquiry'
                            header='Warehouse|Period|SO NO|SO Seq|Prod Code|Prod Name|Prod Qty|Mat. Code|Mat Name|UOM|Mat Consumption'
                            format='0|0|0|0|0|0|1|0|0|0|1'
                            aligns='0|0|0|0|0|0|0|0|0|1|0'
                            check='||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0'
                            widths='1200|1500|1500|1500|1500|2000|1500|1500|2000|800|1500'
                            sorting='T'
                            autosize='T' 
                            styles='width:100%; height:100%'
                            />
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; height: 100%" name="Consumption View">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td>
                            W/H
                        </td>
                        <td style="width: 20%">
                            <gw:list id="cboWH" styles="width:100%;" />
                        </td>
                         <td style="width: 10%">
                            Prod. Item
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtProd" styles="width: 100%" />
                        </td>
                        <td style="width: 37%; text-align: center; white-space: nowrap">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdConsView')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdConsView'
                            header='Warehouse|Prod Code|Prod Name|Mat. Code|Mat Name|UOM|-|-|-|-|-|-|-|-|-|-'
                            format='0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|1|0|0|1|1|1|1|1|1|1|1'
                            check='|||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='1200|1500|1500|2000|1500|1500|2000|800|1500|1500|1500|1500|1500|1500|1500|1500'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
                        </td>
                    </tr>
                </table>
          </gw:tab>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
    <gw:textbox id="txtCloseMPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:grid id='grdHeader'
        header='date|-'
        format='0|0'
        aligns='0|0'
        check='||'
        editcol='0|0'
        widths='1500|1500'
        sorting='T'
        autosize='T' 
        styles='width:100%; height:100%; display:none'
        />
</body>
</html>
