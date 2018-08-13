<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>S/O Checking</title>
</head>
<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;

var G_BILL_TO_NAME  = 0,  
    G_SO_M_PK       = 1,
    G_ORDER_DT      = 2,
    G_PO_NO         = 3,	          
    G_ORD_QTY       = 4,
    G_CANCEL_QTY    = 5,
	G_OUT_QTY		= 6,
	G_RETURN_QTY    = 7,
    G_BAL_QTY       = 8,
    G_DELI_RATE     = 9;

//================================================================================  
	
function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="70%";
                imgArrow.src = "../../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}
	
//================================================================================  
	        
function BodyInit()
{  
    System.Translate(document);
    //--------------------	 
    FormatGrid();      
	//-------------------- 
}
  
//================================================================================  

function FormatGrid()
{
	var data = '';	
	 
	//---------------------------------------
	data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>||";
	lstCompany.SetDataText(data);	
	lstCompany.value = "";
	 
    data = "data|1|by P/O|2|by BUYER|3|by DIVISION||";
    lstType.SetDataText(data);
	lstType.value = 1 ;
	
	//---------------------------------------
    var ctrl = grdDetail.GetGridControl();
                   
    ctrl.ColFormat(G_ORD_QTY)    = "###,###,###.##" ;      
	ctrl.ColFormat(G_CANCEL_QTY) = "###,###,###.##" ;
    ctrl.ColFormat(G_OUT_QTY)    = "###,###,###.##" ;
    ctrl.ColFormat(G_RETURN_QTY) = "###,###,###.##" ;
    ctrl.ColFormat(G_BAL_QTY)    = "###,###,###.##" ;
 
	 //---------------------------------------
	var ctrl = grdDetail.GetGridControl() ;
      
    ctrl.MergeCells  = 2 ;	
      
    ctrl.MergeCol(0) = true ;	
    ctrl.MergeCol(1) = true ;   	
    ctrl.MergeCol(2) = true ;	
    ctrl.MergeCol(3) = true ;
}
//================================================================================  

 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {		 
            case 'data_dsbs00062' :
                //-------------------
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_ORD_QTY, grdDetail.rows-1, G_ORD_QTY, true);  
					grdDetail.SetCellBold( 1, G_OUT_QTY, grdDetail.rows-1, G_OUT_QTY, true);
                                        
                    grdDetail.SetCellBgColor( 1, G_BAL_QTY, grdDetail.rows-1, G_BAL_QTY, 0xCCFFFF );
                   
					grdDetail.Subtotal( 0, 2, -1, '4!5!6!7!8','###,###,###.##');
					 
                }								
                //-------------------                                
            break; 
      }  
 }
  
//================================================================================  

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdDetail' :				    			 
            data_dsbs00062.Call("SELECT");
            
        break;       
    }
}
  
//================================================================================
function OnReport()
{
 var url  = System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00062.aspx?p_company="+lstCompany.value; 
     url += "&p_dt_from=" + dtFrom.value + "&p_dt_to=" + dtTo.value;
     url += "&p_item=" + txtPOItem.text + "&p_bill_to=" + txtBillTo.text + "&p_type=" + lstType.value;
 System.OpenTargetPage(url); 
}
</script>
<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_dsbs00062" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" function="st_lg_sel_dsbs00062"  > 
                    <input bind="grdDetail" > 
						<input bind="lstCompany" />						                          
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
                        <input bind="txtPOItem" />                        
                        <input bind="txtBillTo" />
						<input bind="lstType" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 20%; white-space: nowrap" align="right">
                <gw:list id="lstCompany" styles="width:100%" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Ord Date
            </td>
            <td style="width: 15%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                ~
                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Item
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtPOItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Buyer
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtBillTo" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Type
            </td>
            <td style="width: 10%">
                <gw:list id="lstType" styles="width:100%" />
            </td>
            <td style="width: 4%">
                <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
				<gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
                
            </td>
        </tr>
        <tr style="height: 98%">
            <td style="width: 100%" id="right" colspan="12">
                <gw:grid id='grdDetail' header='Buyer|_SO_PK|Ord Date|P/O No|Ord Qty|Cancel Qty|Out Qty|Rtn Qty|Bal Qty|Deli (%)'
                    format='0|0|4|0|0|0|0|0|0|0' aligns='0|0|1|0|3|3|3|3|3|3' editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='3000|0|1200|1500|1500|1500|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
