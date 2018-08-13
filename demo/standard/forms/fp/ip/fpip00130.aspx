<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Order Plan Closing </title>
</head>

<script type="text/javascript">
 //---------------------------------------------------------
 // columns of grdOrdPlan
 var	iColMCloseYN		= 0,	
		iColMPK				= 1,
        iColMSlip_No        = 2,
		iColMOrderDate		= 3,
		iColMPONO           = 4,
		iColMStylePK        = 5,
		iColMStyleCode      = 6,
		iColMStyleNM        = 7,
		iColMFrom           = 8,
		iColMTo             = 9,
		iColMOrdQty         = 10,
		iColMPlanQty        = 11,
		iColMRGQty          = 12;
 //==================================================================
 function BodyInit()
 {
    System.Translate(document); 
      dtfrom.SetDataText(System.AddDate(dtTo.GetData(),-90));      
      OnChangeClose()
      //---------------------------
      BindingDataList();
      FormatGrid()
      //---------------------------
      //grdDetail.GetGridControl().FrozenCols = 7;
      //---------------------------      
      
      OnSearch(1)
 } 
 //==================================================================

 function BindingDataList()
 {         
    System.Translate(document);
    var data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	
   
 } 
 //==================================================================
    
 function OnSearch()  
 {
       fpip00130.Call("SELECT")    
 }
 //==================================================================

  function OnPopUp(pos)
 {
	switch(pos)
	{
		case 'Supplier':
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	             txtBillToCode.text = object[1];
      
              }
		break;
		//------
		case 'View_Detail':
		   if(grdOrdPlan.row>0)
		   {
			var path = System.RootURL + '/form/fp/ip/fpip00131.aspx?plan_pk=' + grdOrdPlan.GetGridData(grdOrdPlan.row,iColMPK) ;
			var object = System.OpenModal( path, 800, 500, 'resizable:yes;status:yes', this);
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

 //==================================================================

 function OnDataReceive(obj)
 {
    if(obj.id=="fpip00130")
    {
        if(grdOrdPlan.rows>1)
      {
        grdOrdPlan.SetCellBold( 1, iColMSlip_No, grdOrdPlan.rows - 1, iColMSlip_No, true);
        grdOrdPlan.SetCellBold( 1, iColMPONO, grdOrdPlan.rows - 1, iColMPONO, true);
        grdOrdPlan.SetCellBold( 1, iColMStyleCode, grdOrdPlan.rows - 1, iColMStyleNM, true);
        grdOrdPlan.SetCellBold( 1, iColMOrdQty, grdOrdPlan.rows - 1, iColMRGQty, true);
      }
        lblRecord.text= grdOrdPlan.rows-1 + " record(s)"		
    }
    if(obj.id=="fpip00130_1")
    {   if(grdOrdPlan.rows>1)
      {
        grdOrdPlan.SetCellBold( 1, iColMSlip_No, grdOrdPlan.rows - 1, iColMSlip_No, true);
        grdOrdPlan.SetCellBold( 1, iColMPONO, grdOrdPlan.rows - 1, iColMPONO, true);
        grdOrdPlan.SetCellBold( 1, iColMStyleCode, grdOrdPlan.rows - 1, iColMStyleNM, true);
        grdOrdPlan.SetCellBold( 1, iColMOrdQty, grdOrdPlan.rows - 1, iColMRGQty, true);
      }
        lblRecord.text= grdOrdPlan.rows-1 + " record(s)"
    }

 }
 //==================================================================

 function OnGridCellClick(obj)
 {
    if(obj.id =="grdOrdPlan")
    {
        
        txtOrderPK.SetDataText(grdOrdPlan.GetGridData(event.row,0));
        fpip00130_1.Call("SELECT")
    }  
 }
 //==================================================================      

 function FormatGrid()
 {          
        var trl ;      
        //-----------------------------
        trl = grdOrdPlan.GetGridControl();
        trl.ColFormat(iColMOrdQty)           = "###,###,###,###,###.##";
        trl.ColFormat(iColMPlanQty)           = "###,###,###,###,###.##";  
        trl.ColFormat(iColMRGQty)           = "###,###,###,###,###.##";  
        trl.FrozenCols = 1;  
		
 }
 //--------------------------------------------------------------------------        

 function OnSave(obj)
 {
    if(obj==1)
    {
	    fpip00130.Call();
	}else
	{
	     fpip00130_1.Call();
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
 //==================================================================
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">      
    <!------------------------------------------------------------------>
     <gw:data id="fpip00130" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00130" parameter="0,1" procedure="<%=l_user%>lg_upd_fpip00130"> 
                   <input bind="grdOrdPlan" > 
                        <input bind="lstFactory" /> 
                        <input bind="dtfrom" />  
                        <input bind="dtTo" />
                        <input bind="txtPOStyle2" /> 
                        <input bind="chkClose" /> 
                     </input> 
                    <output bind="grdOrdPlan" /> 
                </dso> 
            </xml> 
        </gw:data>
        
         <!------------------------------------------------------------------>
     <gw:data id="fpip00130_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00130" parameter="0,1" procedure="<%=l_user%>lg_upd_fpip00130_1"> 
                   <input bind="grdOrdPlan" > 
                        <input bind="lstFactory" /> 
                        <input bind="dtfrom" />  
                        <input bind="dtTo" />
                        <input bind="txtPOStyle2" /> 
                        <input bind="chkClose" /> 
                     </input> 
                    <output bind="grdOrdPlan" /> 
                </dso> 
            </xml> 
        </gw:data>
		<!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 4%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>                       	
						<td style="width: 5%; white-space: nowrap" align="right">
                			Factory</td>
            			<td style="width: 20%">
                			<gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
            			</td>
														
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Plan Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtfrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            PO/Style</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOStyle2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
                        </td>                        
                        <td style="width: 5%; white-space: nowrap" align="center">
                             
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdOrdPlan')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%" colspan="8">    
                             <table style="width:100%; height:100%">
                                <tr>
                                 <td style="width: 15%" align="left">
                                <b>Close YN</b>
                                <gw:checkbox id="chkClose" defaultvalue="Y|N" value="N" onchange="OnChangeClose()" />
                                </td>     
                                <td style="width: 5%" align="right">
                                    <gw:icon id="btnClose" img="2" text="Close" styles='width:100%' onclick="OnSave(1)" />
                                    <gw:icon id="btnUnClose" img="2" text="UnClose" styles='width:100%' onclick="OnSave(2)" />
                                </td>
                                <td style="width: 30%"></td>
                                 <td style="width: 40%" align="right" colspan="3">
                                    <gw:label id="lblRecord" styles='width:100%;color:Red' text="0 record(s)" />
                                </td>
                                <td style="width: 1%; white-space: nowrap" colspan="2">
                                    <gw:icon id="idBtnView" img="2" text="View Detail" styles='width:100%' onclick="OnPopUp('View_Detail')" />
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
                <gw:grid id='grdOrdPlan' header='SELECT|_PP_PLAN_PK|Plan No|Date|P/O No|_TCO_STITEM_PK|Style Code|Style Name|From|To|Ord Qty|Plan Qty|R/G Qty|_SPEC01_PK|Spec 01|_Spec02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Remark|_PK'
                format='3|0|0|4|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				aligns='0|0|0|1|0|0|0|0|1|1|3|3|3|0|1|0|1|0|1|0|1|0|1|0|0'
                defaults='||||||||||||||||||||||||' 
				editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1000|0|1200|1200|1500|1000|1500|2500|1200|1200|1200|1200|1200|0|1200|0|1200|0|1200|0|1200|0|1200|1000|0'
                sorting='T' acceptnulldate='T' styles='width:100%; height:100%' />
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
