<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO Closing </title>
</head>

<script type="text/javascript">
 //---------------------------------------------------------
 // columns of grdOrder
 var	iColMCloseYN		= 0,	
		iColMPK				= 1,
        iColMSlip_No        = 2,
		iColMOrderDate		= 3,
		iColMBillTo			= 4,
		iColMOrderStatus	= 5,
		iColMOrderType		= 6,
		iColMOrder_AMT       = 7,
        iColMTotal_AMT      = 8,
        iColMDescription    = 9;

//--------------------------------------------------------------------------        
 function BodyInit()
 {
    System.Translate(document); 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-90));      
      OnChangeClose()
      //---------------------------
      BindingDataList();
      FormatGrid()
      //---------------------------
      //grdDetail.GetGridControl().FrozenCols = 7;
      //---------------------------      
      
      OnSearch(1)
 } 
//--------------------------------------------------------------------------        

 function BindingDataList()
 {         
    System.Translate(document);
    var sData="";
        
    sData = "DATA|O|Order Date|E|ETD";
    idList.SetDataText(sData);
     
      
    sData = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, (code || ' ' || code_nm) code_nm  FROM tlg_lg_code a, tlg_lg_code_group b  WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGSA1020' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord")%>";
    grdOrder.SetComboFormat(iColMOrderType,sData);
   
 } 
 //--------------------------------------------------------------------------        
    
 function OnSearch()  
 {
       dsbs00040.Call("SELECT")    
 }
 //--------------------------------------------------------------------------        

  function OnPopUp(pos)
 {
	switch(pos)
	{
		case 'Bill_To':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	             txtBillToCode.text = object[1];               

              }
		break;
		//------
		case 'View_Detail':
		    if(grdOrder.row>0)
		    {
			var path = System.RootURL + '/standard/forms/ds/bs/dsbs00042.aspx?p_tsa_saleorder_pk=' + grdOrder.GetGridData(grdOrder.row,iColMPK) ;
			var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
			    if ( object != null )                    
                {
                    OnSearch();
                }
             }else
               {
                alert("Please select a SO to view detail!");
               }
		break;	
	} 
 }
 
 //--------------------------------------------------------------------------        

 function OnDataReceive(obj)
 {
    if(obj.id=="dsbs00040")
    {
        if(grdOrder.rows>1)
      {
        grdOrder.SetCellBold( 1, iColMSlip_No, grdOrder.rows - 1, iColMSlip_No, true);
      }
        lblRecord.text= grdOrder.rows-1 + " record(s)"		
    }
    if(obj.id=="dsbs00040_1")
    {   if(grdOrder.rows>1)
      {
        grdOrder.SetCellBold( 1, iColMSlip_No, grdOrder.rows - 1, iColMSlip_No, true);
      }
        lblRecord.text= grdOrder.rows-1 + " record(s)"
    }

 }
 //--------------------------------------------------------------------------        

 function OnGridCellClick(obj)
 {
    if(obj.id =="grdOrder")
    {
        
        txtOrderPK.SetDataText(grdOrder.GetGridData(event.row,0));
        dsbs00040_1.Call("SELECT")
    }  
 }
 //--------------------------------------------------------------------------        

 function FormatGrid()
 {          
        var trl ;      
        //-----------------------------
        trl = grdOrder.GetGridControl();
        trl.ColFormat(iColMOrder_AMT)           = "###,###,###,###,###.##";
        trl.ColFormat(iColMTotal_AMT)           = "###,###,###,###,###.##";  
        trl.FrozenCols = 1;  
		
 }
 //--------------------------------------------------------------------------        

 function OnSave(obj)
 {
    if(obj==1)
    {
	    dsbs00040.Call();
	}else
	{
	     dsbs00040_1.Call();
	}
 }
 
 //==================================================================

function OnChangeClose()
{
    if ( chkClose.value == "Y" ) 
    {
        btnClose.style.display   = "none" ;
        btnUnClose.style.display = "" ;
    }
    else
    {
        btnClose.style.display   = "" ;
        btnUnClose.style.display = "none" ;
    } 
    OnSearch();
}
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">   
    <gw:data id="dsbs00040" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_dsbs00040" parameter="0,1" procedure="st_lg_upd_dsbs00040"> 
                    <input bind="grdOrder" > 
                        <input bind="idList" /> 
                        <input bind="dtFrom" /> 
                        <input bind="dtTo" />  
                        <input bind="txtOrderNo" />
                        <input bind="chkBalance" />
                        <input bind="txtBillToCode" /> 
                        <input bind="chkClose" /> 
                     </input> 
                    <output bind="grdOrder" /> 
                </dso> 
            </xml> 
        </gw:data>
   
    <!------------------------------------------------------------------>
     <gw:data id="dsbs00040_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_dsbs00040" parameter="0,1" procedure="st_lg_upd_dsbs00040_1"> 
                    <input bind="grdOrder" > 
                        <input bind="idList" /> 
                        <input bind="dtFrom" /> 
                        <input bind="dtTo" />  
                        <input bind="txtOrderNo" />
                        <input bind="chkBalance" />
                        <input bind="txtBillToCode" /> 
                        <input bind="chkClose" /> 
                     </input> 
                    <output bind="grdOrder" /> 
                </dso> 
            </xml> 
        </gw:data>
        
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 4%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 15%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%; white-space: nowrap;" align="right">
                            <b>SO No/PO</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 9%" align="right">
                            <b style="cursor: hand" onclick="OnPopUp('Bill_To')" class="eco_link">Bill To </b>
                        </td>
                        <td style="width: 20%; white-space: nowrap;">
                            <gw:textbox id="txtBillToCode"  styles='width:100%' onenterkey="OnSearch(1)" />
                         </td>   
                                           
                        <td style="width: 1%" >
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 1%" >
                            <gw:button id="btnClose" img="lock" text="Close" onclick="OnSave(1)" />
                            <gw:button id="btnUnClose" img="lock_open" text="Open" onclick="OnSave(2)" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%" colspan="8">
                             <table style="width:100%; height:100%">
                                <tr>
                                <td style="width: 15%" align="left">
                                <b>Delivery</b>
                                <gw:checkbox id="chkBalance" defaultvalue="Y|N" value="Y" onchange="OnSearch(1)" />
                                </td>  
                                 <td style="width: 15%" align="left">
                                    <b>Close YN</b>
                                    <gw:checkbox id="chkClose" defaultvalue="Y|N" value="N" onchange="OnChangeClose()" />
                                </td>
                                 <td style="width: 5%" align="right">
                                   
                                </td>
                                <td style="width: 30%">
                                </td>
                                 <td style="width: 20%" align="right" colspan="3">
                                    <gw:label id="lblRecord" styles='width:100%;color:Red' text="0 record(s)" />
                                </td>
                                <td style="width: 1%; white-space: nowrap" colspan="2">
                                   
                                </td>
								<td style="width: 5%" >
                                    
                                </td>
                                </tr>
                             </table>   
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40%">
            <td style="width: 100%">
                <gw:grid 
                    id='grdOrder' 
                    header='Select|_PK|Slip No/PO|Order Date|Bill To|Order Status|Order Type|Order AMT|Total AMT|Description'
                    format='3|0|0|4|0|2|2|1|1|0' 
                    aligns='0|0|0|1|0|1|1|3|3|0' 
                    defaults='|||||||||'
                    editcol='1|0|0|0|0|0|0|0|0|0' 
                    widths='1000|0|1500|1200|3200|1500|1500|1600|1600|1200'
                    sorting='T' 
                    param='0,1,2,3,4,5,6,7,8,9' 
                    styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------------->
    <gw:textbox id="txtOrderPK" csstype="mandatory" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtOutGoPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
