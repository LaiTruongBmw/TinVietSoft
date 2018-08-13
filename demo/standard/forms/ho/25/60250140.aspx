<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Room Ledger Adjust</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;

var G1_pk=0,
	G1_RoomNo=1,
	G1_Last_Name=2,
	G1_First_Name=3,
	G1_Audit_Date=4,
	G1_In_Room_Amt=5,
	G1_Ex_Rate=6,
	G1_Daily_Rate_USD=7,
	G1_Adjust_Amt_VND=8;
	
var G2_PK=0,
	G2_tht_nightaudit_pk=1,
	G2_RoomNo=2,
	G2_Last_Name=3,
	G2_First_Name=4,
	G2_Adjust_Date=5,
	G2_Adj_Amt_VND=6,
	G2_Ex_Rate=7,
	G2_AdjAmt_USD=8,   
	G2_Adj_Reason=9,
	G2_Adj_By_PK=10;
	
var arr_FormatNumber = new Array();  
 //===================================================================    

 function BodyInit()
 {
	txtCompanyPK.text=  "<%=Session("COMPANY_PK")%>" ;
	//alert(txtCompanyPK.text);
	OnSearch('EX-RATE');
 }
 //===================================================================    
 
 function SetGridFormat()
 {
    var ctr = grdAdjust.GetGridControl(); 

    ctr.ColFormat(G2_Ex_Rate)     = "#,###,###,###,###,###";
    ctr.ColFormat(G2_Adj_Amt_USD) = "#,###,###,###,###,###.##";    
    ctr.ColFormat(G2_Adj_Amt_VND) = "#,###,###,###,###,###";

    arr_FormatNumber[G2_Ex_Rate]     = 0;
    arr_FormatNumber[G2_Adj_Amt_USD] = 2;
    arr_FormatNumber[G2_Adj_Amt_VND] = 0;
   
 }
  //===================================================================    
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'ADJUST':
            if ( grdRoomAllocate.row > 0 )
            {
                grdAdjust.AddRow();                   
                grdAdjust.SetGridText( grdAdjust.rows-1, G2_tht_nightaudit_pk, grdRoomAllocate.GetGridData(grdRoomAllocate.row,G1_pk) );
                grdAdjust.SetGridText( grdAdjust.rows-1, G2_RoomNo, grdRoomAllocate.GetGridData(grdRoomAllocate.row,G1_RoomNo) );
                grdAdjust.SetGridText( grdAdjust.rows-1, G2_Last_Name, grdRoomAllocate.GetGridData(grdRoomAllocate.row,G1_Last_Name) );
                grdAdjust.SetGridText( grdAdjust.rows-1, G2_First_Name, grdRoomAllocate.GetGridData(grdRoomAllocate.row,G1_First_Name) );
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Ex_Rate,txtExRate.text); 				
            }  
            else
            {
                alert("PLS SELECT ONE ROOM ALLOCATE!");
            }      	                                                                            
        break;
    }
}
//=========================================================================

function OnDelete(pos)
{
    switch (pos)
    {
        case 'ADJUST':
			if(grdAdjust.row > 0)
				if(confirm('Are you sure to delete?'))
					grdAdjust.DeleteRow();
					dso_htfo00590_1.Call();
        break;
    }    
}
//===================================================================    
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'EX-RATE':       
            pro_htfo00130.Call();  
        break;
        
        case 'ADJUST':
            txtNightAuditPK.text = '' ;            
            dso_htfo00590_1.Call("SELECT");
        break;
    
	    case 'ALLOCATE':   
            dso_htfo00590.Call("SELECT");	    
	    break;
    }    
 }
 
 //===================================================================    

 function OnDataReceive(obj)
 {
	if ( obj.id== 'dso_htfo00590')
	{
		if (grdRoomAllocate.rows > 1)	
		{
				grdRoomAllocate.Subtotal( 1, 2, -1, '5!7');
				lblRows.text = grdRoomAllocate.rows-2;
		}	    
	}
	else if ( obj.id== 'pro_htfo00130' )
	{
	    //alert(txtExRate.text);
		OnSearch('ALLOCATE');
	}
 }
 
//=========================================================================

function OnSave(pos)
{
    switch (pos)
    {
        case 'ADJUST':
            if(CheckValidate())
			{
				dso_htfo00590_1.Call();
			}
        break;
    }    
}

//=========================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_Adj_Amt_USD || col == G2_Adj_Amt_VND || col == G2_Ex_Rate )
    {
        var dQuantiy
        
        dQuantiy =  grdAdjust.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdAdjust.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }            
        }
        else
        {
            grdAdjust.SetGridText(row,col,"") ;
        }     
    }
    
    if ( col == G2_Adj_Amt_USD || col == G2_Ex_Rate )
    {
        var dQuantiy;
        
        dQuantiy = grdAdjust.GetGridData(row,G2_Adj_Amt_USD) * grdAdjust.GetGridData(row,G2_Ex_Rate);
        grdAdjust.SetGridText(row,G2_Adj_Amt_VND, System.Round( dQuantiy, arr_FormatNumber[G2_Adj_Amt_VND] ));
    }

}
function OnReport()
{
      if(grdAdjust.rows > 1)
	  {
			if(grdAdjust.row !='-1')
			{
				var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00130_adjust_voucher.rpt&procedure=sp_sel_htfo00130_rpt&parameter="+grdAdjust.GetGridData(grdAdjust.row,G2_PK);    
				System.OpenTargetPage(url); 
				//var url =System.RootURL + '/reports/ht/fo/htfo00130.aspx?p_pk='+grdAdjust.GetGridData(grdAdjust.row,G2_PK);
				//window.open(url, "_blank");	 
			}
			else
			{
				alert("Please,choose guest adjusted to print.");
			}			
	  }
}
function CheckValidate()
{
	for(var i=1;i<grdAdjust.rows;i++)
          {
            if(grdAdjust.GetGridData(i,G2_Adj_Amt_VND) == "")  
             {
                alert("Please input adjust amount(VND) at row "+ i);
                return false;
             }
			if(grdAdjust.GetGridData(i,G2_Adj_Reason) == "")   
             {
                alert("Please input reason at row "+ i);
                return false;
             }
          }
          return true;
}
function OnReport()
{
	if(grdAdjust.row !='-1')
	{
		var url = '/reports/ht/fo/rpt_htfo00590_fee_adjust.aspx?p_mst_adjust_pk='+grdAdjust.GetGridData(grdAdjust.row,0); 
		System.OpenTargetPage( System.RootURL+url , "newform" );
	}
}
</script>

<body>
 <!---------------------------------------------------------------->
    <gw:data id="pro_htfo00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ht_pro_60250140" > 
                <input>
                    <input bind="txtExRate" /> 
					<input bind="txtCompanyPK" />
                </input> 
                <output>
                    <output bind="txtExRate" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_htfo00590" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="ht_sel_60250140" >
                <input  bind="grdRoomAllocate">
                    <input bind="txtRoomNo" /> 
                    <input bind="dtFrom" />
					<input bind="dtTo" />
                </input> 
                <output bind="grdRoomAllocate" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_htfo00590_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="ht_sel_60250140_dtl"  procedure="ht_upd_60250140_dtl">
                <input  bind="grdAdjust">
                    <input bind="txtNightAuditPK" />
                </input> 
                <output bind="grdAdjust" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Room#/Guest Name:
                        </td>
                        <td width="20%" align="right">
                            <gw:textbox id="txtRoomNo" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="left">
                            
                        </td>
                        <td style="width: 30%; white-space: nowrap" align="center" id="id_date">
                            From:
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch('ALLOCATE')" />
							<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch('ALLOCATE')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            Total Room:
                        </td>
                        <td style="width: 20%">
                            <gw:label id="lblRows" />
                        </td>
                        <td style="width: 8%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('ALLOCATE')" />
                        </td>
                        <td style="width: 1%" align="left">
                             
                        </td>
                        <td style="width: 1%" align="left">
                             
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id='grdRoomAllocate' 
                                header='_pk|Room#|Last Name|First Name|Audit Date|Room Amt|Ex_Rate|Daily Rate USD|Adjust Amt(VND)'
                                format='0|0|0|0|4|-0|-0|-2|-0' 
                                aligns='0|0|0|0|0|0|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|0' 
                                widths='1200|1500|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' acceptnulldate="T" styles='width:100%; height:100%'
                                oncellclick="txtNightAuditPK.text=grdRoomAllocate.GetGridData(grdRoomAllocate.row,G1_pk);dso_htfo00590_1.Call('SELECT');" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            
                        </td>
                        <td style="width: 10%" align="right">
                            
                        </td>
                        <td style="width: 20%" align="right">
                            
                        </td>
                        <td width="33%" align="center">
                        </td>
                        <td style="width: 1%" align="left">
                            
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnAddNew" img="new" alt="new" onclick="OnAddNew('ADJUST')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="delete" onclick="OnDelete('ADJUST')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('ADJUST')" />
                        </td>
						<td style="width: 3%" align="left">
							<gw:imgbtn id="ibtnReport1" img="printer" alt="Report" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="10">
                            <gw:grid id='grdAdjust' header='_PK|_tht_nightaudit_pk|Room No|Last Name|First Name|Adjust Date|Adj Amt (VND)|Ex_Rate|AdjAmt(USD)|Adj Reason|_Adj_By_PK|Create_date|Create_by|modify_dt|modify_by'
                                format='0|0|0|0|0|4|-0|-0|-2|0|0|0|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                check='||||||||||||||'
                                editcol='0|0|0|0|0|0|1|0|0|1|0|0|0|0|0' 
                                widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                sorting='T' autosize='T' acceptnulldate='F' styles='width:100%; height:100%' onafteredit=""  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtNightAuditPK" styles='width:100%;display:none' />
    <gw:textbox id="txtExRate" styles='width:100%;display:none' />
	<gw:textbox id="txtCompanyPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
