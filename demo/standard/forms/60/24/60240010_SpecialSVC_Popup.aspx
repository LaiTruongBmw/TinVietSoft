<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>popup</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script> 
//G2 is grdServiceFeeAll
//G3 is grdSpecialSVC
var G1_PK=0,
	G1_SERVICE_CODE=1,  
	G1_SERVICE_NAME=2,
	G1_QUANTITY=3,
	G1_PRICE=4,
	G1_CCY=5,
	G1_OPEN_YN=6,
	G1_USE_YN=7,
	G1_SERVICE_LNAME=8;  

var G2_PK=0,
	G2_THT_BOOKINGD_PK=1,
	G2_THT_SPECIAL_SERVICE_PK=2,   
	G2_SERVICE_CODE=3,  
	G2_SERVICE_NAME=4,
	G2_QUANTITY=5,
	G2_PRICE=6,
	G2_AMOUNT=7,
	G2_CCY=8;
function BodyInit()
{
	txt_bookingd_pk.text = '<%=Request.QueryString("p_bookingd_pk") %>';
	dso_htbk00010_SpecialSVC.Call('SELECT');
}
function OnSearch(n)
{
	switch(n)
	{
		case 'All_Services':
			dso_htbk00010_all_fees.Call();   
		break;
	}
}
function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
	{
		grdSpecialSVC.DeleteRow();
		dso_htbk00010_SpecialSVC.Call();	
	}
}
function OnSave()
{
	/*if(CheckAmount())
	{*/
		dso_htbk00010_SpecialSVC.Call();
	//}
}
function CheckAmount()
{
	for (var i = 0; i < grdSpecialSVC.rows; i++)
	{
		if(Number(grdSpecialSVC.GetGridData(i,G2_PRICE)) > 1000)
		{
			alert("Input value to large.");
			return false;
		}
	}
	return true;
}
function OnSelectServices()
{	
		if (grdServiceFeeAll.row == '-1')
		{
			return;
		}
		
		if (txt_bookingd_pk.text != '')
		{		
				grdSpecialSVC.AddRow();
				
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_THT_BOOKINGD_PK, txt_bookingd_pk.text);//
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_THT_SPECIAL_SERVICE_PK, grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_PK));//
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_QUANTITY,		       '1');//
				      
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_SERVICE_CODE, grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_SERVICE_CODE));//
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_SERVICE_NAME, grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_SERVICE_NAME));//
				
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_PRICE, grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_PRICE));//
				
				
				grdSpecialSVC.SetGridText(grdSpecialSVC.rows-1, G2_CCY, grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_CCY));//
				
				grdServiceFeeAll.RemoveRowAt(grdServiceFeeAll.row);   
				
		}				
}
function OnRemoveRoom()
{
	for(row = grdSpecialSVC.rows-1; row > 0; row--)
	{
		if (grdSpecialSVC.GetGridControl().isSelected(row) == true)
		{
			if (grdSpecialSVC.GetGridData(row, G2_PK) == '')
			{
						grdSpecialSVC.RemoveRowAt(row);
						OnSearch('All_Services');
			}
		}
	}
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htbk00010_SpecialSVC':
				dso_htbk00010_all_fees.Call('SELECT');	
		break; 
	}
}
function OnInputPrice()//event in grid: onentercell --->not yet!
{
		if(grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_OPEN_YN) == "N" && event.col == G1_PRICE)
		{
			//alert(grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row,G2_OpenYN));
			grdServiceFeeAll.row = -1;
		}
}
</script> 	

<body>
<gw:data id="dso_htbk00010_all_fees" onreceive="">
	<xml> 
		<dso type="grid" parameter="1" function="st_ht_sel_60240010_special_svc">
			<input bind="grdServiceFeeAll">
				 <input bind="txt_bookingd_pk" />
			</input> 
			<output bind="grdServiceFeeAll" /> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_htbk00010_SpecialSVC" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="CRM.sp_sel_htbk00010_dtl_svc" procedure="CRM.sp_upd_htbk00010_dtl_svc">
			<input bind="grdSpecialSVC">
				<input bind="txt_bookingd_pk" />
			</input> 
			<output bind="grdSpecialSVC" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
        <tr style="width: 100%; height: 1%">
            
        </tr>
        
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width: 10%">
							 
                        </td>
						<td style="width: 23%" align="right">
							
                        </td>
                        <td style="width: 15%" align="right">
                        </td>
                        <td style="width: 10%">
							
                        </td>
                        <td style="width: 16%">
						
                        </td>
                        <td style="width: 10%">

                        </td>
                       <td style="width: 7%">
							
						</td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
						 <td width="3%" align="right">
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 98%; background: #BDE9FF">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
						<td width="48%">
                            <gw:grid id="grdServiceFeeAll" header="_PK|SERVICE CODE|SERVICE NAME|_QUANTITY|PRICE|_CCY|OPEN YN|_USE_YN|_SERVICE_LNAME"
                                format="0|0|0|-0|-2|0|0|0|0" 
								aligns="0|0|0|0|0|0|0|0|0"                                
                                defaults="||||||||" 
								editcol="0|0|0|0|1|0|0|0|0"
                                widths="2000|2000|1000|1500|1000|1000|1000|1000|1000" 
								styles="width:100%;height:100%" 
                                autosize="T" onentercell="OnInputPrice()" oncelldblclick="" />
                        </td>
                        
                        <td style="width: 3%" align="center"> 
                            <gw:icon id="ibtnSelect" img="in" text=">>" onclick="OnSelectServices()" />
                            </br>
                            <gw:icon id="ibtnRemove" img="in" text="<<" onclick="OnRemoveRoom()" />
                        </td>
                        <td style="width: 59%; height: 5%;"> 
                            <gw:grid id="grdSpecialSVC" header="_PK|_THT_BOOKINGD_PK|_THT_SPECIAL_SERVICE_PK|SERVICE CODE|SERVICE NAME|QUANTITY|PRICE|AMOUNT|_CCY"
                                format="0|0|0|0|0|-0|-2|-2|0" 
								aligns="0|0|0|0|0|0|0|0|0"                                
                                defaults="||||||||" 
								editcol="0|0|0|0|0|1|0|0|0"
                                widths="2000|2000|1000|1500|1000|1000|1000|1000|1000" 
								styles="width:100%;height:100%" 
                                autosize="T"   />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txt_bookingd_pk" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
