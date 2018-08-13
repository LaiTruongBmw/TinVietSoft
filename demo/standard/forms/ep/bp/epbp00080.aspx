<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>PO Closing </title>
</head>

<script type="text/javascript">
 //---------------------------------------------------------
 // columns of grdPO
 var	iColMCloseYN		= 0,	
		iColMPK				= 1,
        iColMSlip_No        = 2,
		iColMOrderDate		= 3,
		iColMSupplier		= 4,
		iColMOrderStatus	= 5,
		iColMOrder_AMT      = 6,
        iColMTotal_AMT      = 7,
        iColMDescription    = 8;

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
   
 } 
 //--------------------------------------------------------------------------        
    
 function OnSearch()  
 {
       epbp00080.Call("SELECT")    
 }
 //--------------------------------------------------------------------------        

  function OnPopUp(pos)
 {
	switch(pos)
	{
		case 'Supplier':
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	             txtBillToCode.text = object[1];
      
              }
		break;
		//------
		case 'View_Detail':
		   if(grdPO.row>0)
		   {
			var path = System.RootURL + '/standard/formsep/bp/epbp00081.aspx?po_pk=' + grdPO.GetGridData(grdPO.row,iColMPK) ;
			var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
			    if ( object != null )                    
                {
                    OnSearch();
                }
           }else
           {
            alert("Please select a PO to view detail!");
           }
		break;	
	} 
 }

 //--------------------------------------------------------------------------        

 function OnDataReceive(obj)
 {
    if(obj.id=="epbp00080")
    {
        if(grdPO.rows>1)
      {
        grdPO.SetCellBold( 1, iColMSlip_No, grdPO.rows - 1, iColMSlip_No, true);
        grdPO.SetCellBold( 1, iColMOrderStatus, grdPO.rows - 1, iColMOrderStatus, true);
      }
        lblRecord.text= grdPO.rows-1 + " record(s)"		
    }
    if(obj.id=="epbp00080_1")
    {   if(grdPO.rows>1)
      {
        grdPO.SetCellBold( 1, iColMSlip_No, grdPO.rows - 1, iColMSlip_No, true);
        grdPO.SetCellBold( 1, iColMOrderStatus, grdPO.rows - 1, iColMOrderStatus, true);
      }
        lblRecord.text= grdPO.rows-1 + " record(s)"
    }

 }
 //--------------------------------------------------------------------------        

 function OnGridCellClick(obj)
 {
    if(obj.id =="grdPO")
    {
        
        txtOrderPK.SetDataText(grdPO.GetGridData(event.row,0));
        epbp00080_1.Call("SELECT")
    }  
 }
 //--------------------------------------------------------------------------        

 function FormatGrid()
 {          
        var trl ;      
        //-----------------------------
        trl = grdPO.GetGridControl();
        trl.ColFormat(iColMOrder_AMT)           = "###,###,###,###,###.##";
        trl.ColFormat(iColMTotal_AMT)           = "###,###,###,###,###.##";  
        trl.FrozenCols = 1;  
		
 }
 //--------------------------------------------------------------------------        

 function OnSave(obj)
 {
    if(obj==1)
    {
	    epbp00080.Call();
	}else
	{
	     epbp00080_1.Call();
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
    <gw:data id="epbp00080" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_epbp00080" parameter="0,1" procedure="st_lg_upd_epbp00080"> 
                    <input bind="grdPO" > 
                        <input bind="dtFrom" /> 
                        <input bind="dtTo" />  
                        <input bind="txtOrderNo" />
                        <input bind="txtBillToCode" /> 
                        <input bind="chkClose" /> 
                        <input bind="chkTakein" /> 
                     </input> 
                    <output bind="grdPO" /> 
                </dso> 
            </xml> 
        </gw:data>
   
    <!------------------------------------------------------------------>
     <gw:data id="epbp00080_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_epbp00080" parameter="0,1" procedure="st_lg_upd_epbp00080_1"> 
                   <input bind="grdPO" > 
                        <input bind="dtFrom" /> 
                        <input bind="dtTo" />  
                        <input bind="txtOrderNo" />
                        <input bind="txtBillToCode" /> 
                        <input bind="chkClose" /> 
                        <input bind="chkTakein" /> 
                     </input> 
                    <output bind="grdPO" /> 
                </dso> 
            </xml> 
        </gw:data>
        
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 4%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%">
                           PO Date
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%; white-space: nowrap;" align="right">
                            <b>PO No</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 9%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Supplier')">Supplier </b>
                        </td>
                        <td style="width: 25%; white-space: nowrap;">
                            <gw:textbox id="txtBillToCode"  styles='width:100%' onenterkey="OnSearch(1)" />
                         </td>   
                                      
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                       
                    </tr>
                    <tr>
                        <td style="width: 100%" colspan="8">    
                             <table style="width:100%; height:100%">
                                <tr>
                                 <td style="width: 15%" align="left">
                                <b>Take In</b>
                                <gw:checkbox id="chkTakein" defaultvalue="Y|N" value="Y" onchange="OnChangeClose()" />
                                </td>  
                                 <td style="width: 15%" align="left">
                                <b>Close YN</b>
                                <gw:checkbox id="chkClose" defaultvalue="Y|N" value="N" onchange="OnChangeClose()" />
                                </td>     
                                <td style="width: 5%" align="right">
                                    <gw:button id="btnClose" img="Close" text="Close" onclick="OnSave(1)" />
                                    <gw:button id="btnUnClose" img="UnClose" text="UnClose" onclick="OnSave(2)" />
                                </td>
                                <td style="width: 20%"></td>
                                 <td style="width: 40%" align="right" colspan="3">
                                    <gw:label id="lblRecord" styles='width:100%;color:Red' text="0 record(s)" />
                                </td>
                                <td style="width: 1%; white-space: nowrap" colspan="2">
                                    <gw:button id="idBtnView" img="View Detail" text="View Detail"  onclick="OnPopUp('View_Detail')" />
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
                    id='grdPO' 
                    header='Select|_PK|Slip No|Order Date|Supplier|PO Status|PO AMT|Total AMT|Description'
                    format='3|0|0|4|0|0|1|1|0' 
                    aligns='0|0|0|1|0|1|3|3|0' 
                    defaults='||||||||'
                    editcol='1|0|0|0|0|0|0|0|0' 
                    widths='1000|0|1500|1200|3200|1500|1600|1600|1200'
                    sorting='T' 
                    param='0,1,2,3,4,5,6,7,8' 
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
