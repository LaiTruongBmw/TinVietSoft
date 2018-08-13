<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Breakfast Revenue</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;
    

 //===================================================================    

 function BodyInit()
 {
    //dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-0));
    //----------------------
	OnSearch();
 }
 
 function Binding()
{
	
}
  //===================================================================    
function OnReport()
 {
	if(grdBraekfastRV.rows >1) 
	{		
		 var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/htrt00180.rpt&procedure=sp_rpt_htrt00180&parameter="+dtFrom.value+","+dtTo.value;              
	    System.OpenTargetPage(url); 
	}
 }
 function OnSearch()
 {
	data_htrt00180.Call("SELECT");
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='data_htrt00180')
	{
		lblRecord.text=grdBraekfastRV.rows -1 +" Guest(s)."
		grdBraekfastRV.Subtotal( 1, 2, -1,'3!4!5!6!7!8!9!10');

	}
 }
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htrt00180" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60270100">
                <input  bind="grdBraekfastRV">
					<input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="chkUseYN" />
                </input> 
                <output bind="grdBraekfastRV" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 100%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style=" height: 2%">
                         <td >
                             <fieldset>
						        <table style="width: 100%; height: 100%">
							        <tr>
							            <td width="5%" align="center">
									        Date
								        </td>
								        <td width="20%">
									        <gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" /> 
											~
									        <gw:datebox id="dtTo" lang="1" onchange="OnSearch()" /> 
								        </td>
										<td style="width1%"><gw:checkbox id="chkUseYN" defaultvalue="Y|N" value="N" onchange="OnSearch()" /></td>
										<td style="width:5%;padding-left:5px">Actual</td>
										<td style="width:5%">Total:</td>
										<td style="width:25%">
											<gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
										</td>
										<td width="3%">
									        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
								        </td>
										<td style="width: 3%" align="right">
											<gw:imgbtn id="ibtnReport2" img="printer" alt="Print" onclick="OnReport()" />
										</td>
										<td style="width: 29%" align="right"></td>
							        </tr>
						        </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="7">
                            <gw:grid id='grdBraekfastRV' 
								header	='Room No|Room Type|Last Name|Adult|Child|Nights|Amount|Service  Amt|Vat Amt|Total Due|Total Due(USD)|Checkin Date|Checkout Date'
                                format	='0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|4|4' 
                                aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                check	='||||||||||||'
                                editcol	='0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                widths	='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                sorting	='T' autosize='T' acceptnulldate='F' styles='width:100%; height:100%'  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
    <gw:textbox id="txtInvoices" styles='width:100%;display:none' />
    <gw:textbox id="txtExRate" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
