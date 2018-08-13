<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>INVENTORY CLOSING CONFIG</title>
</head>

<script>
    var G_PK	  = 0,
	    G_SEQ	  = 1,
	    G_WH_PK	  = 2,
	    G_WH_ID	  = 3,	 
	    G_WH_NAME = 4;
	
//============================================================================================
function BodyInit()
{   
    OnSearch();
    FormatGrid();
} 
//============================================================================================
function OnSearch()
{    
    data_bico00021.Call('SELECT');
}
//============================================================================================
function FormatGrid()
{	
    var data = "data|0|0|1|1|2|2|3|3|4|4|5|5";
    lstRowNum.SetDataText(data);   
    
    data = "data|0|0 - Khong gia|1|1 - Binh quan truc tiep|2|2 - Binh quan chu ki|3|3 - Dich danh|4|4 - FIFO";
    lstCostMethod.SetDataText(data); 
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
    lstCCY.SetDataText(data);    
    
    data = "data|0|0|1|1|2|2|3|3|4|4|5|5";  
    lstUP.SetDataText(data); 
}
//============================================================================================
function OnSave(para)
{
    if(para == 1)
    {
        data_bico00021.Call();
    }
    else
    {
        data_bico00021_1.Call();
    }
}
//============================================================================================
function OnDelete()
{
    if ( grdWH.row > 0 )
    {
        if ( grdWH.GetGridData( grdWH.row, G_PK) == '' ) 
        {
            grdWH.RemoveRowAt( grdWH.row ); 			
        }
        else			
        {
            grdWH.DeleteRow();
        }
    }
}
//=======================================================================
function OnUnDelete()
{    
    grdWH.UnDeleteRow();
}
//=======================================================================
function OnDataReceive(para)
{
    if(para.id == 'data_bico00021')
    {
        data_bico00021_1.Call('SELECT');
    }
}
//=======================================================================
function OnAddNew(para)
{
    if(para == 1)
    {
        var url =System.RootURL + '/form/fp/ab/fpab00240.aspx';
	    //var values  = System.OpenModal(  url , 1000, 450, 'resizable:yes;status:yes', this);	
	    var values  = window.showModalDialog(  url , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');
	    if(values != null && values[0] != '' )
	    {
	        grdWH.AddRow();
	        grdWH.SetGridText( grdWH.rows-1, G_SEQ, grdWH.rows-1);
	        grdWH.SetGridText( grdWH.rows-1, G_WH_PK, values[0]);
	        grdWH.SetGridText( grdWH.rows-1, G_WH_ID, values[1]);
	        grdWH.SetGridText( grdWH.rows-1, G_WH_NAME, values[2]);
        }	  
    }         
}
//====================================================================== 
</script>

<body>
    <gw:data id="data_bico00021" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_bico00021" procedure="<%=l_user%>lg_upd_bico00021">	
				<input	bind="grdWH">					
				</input>
				<output	bind="grdWH"/>	
			</dso>	
		</xml>	
	</gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico00021_1" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3" type="control" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_bico00021_1" procedure="<%=l_user%>lg_upd_bico00021_1">	
				<inout>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="lstCostMethod"	/>
						<inout	bind="lstCCY"	/>
						<inout	bind="lstRowNum"	/>
						<inout	bind="lstUP"	/>	
						<inout	bind="chkCheck"	/>			
				</inout>
			</dso>	
		</xml>	
	</gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%" border="0">
        <tr style="height: 1%" id="tab_bottom">
            <td style="width: 100%; white-space: nowrap" align="center">
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnAddNew" img="new" onclick="OnAddNew('1')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('1')" />
            </td>
        </tr>
        <tr style="height: 98%;">
            <td colspan="5">
                <gw:grid id='grdWH' header='_pk|Seq|_tin_warehouse_pk|W/H ID|W/H Name'
                    format='0|0|0|0|0' aligns='0|1|0|0|0' check='||||' editcol='1|1|1|1|1' widths='0|1000|0|3500|3500'
                    sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%; width: 100%">
            <td colspan="5">
                <table style="height: 1%; width: 100%" border="0">
                    <tr width="100%">
                        <td style="width: 5%; white-space: nowrap">
                            Cost Method
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstCostMethod" styles="width:100%;" />
                        </td>
                        <td style="white-space: nowrap" align="right">
                            Amt R.Num
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstRowNum" styles="width:100%;" />
                        </td>
                        <td style="white-space: nowrap">
                        </td>
                        <td style="width: 25%">
                        </td>
                        <td align="right">
                        </td>
                        <td align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave2" onclick="OnSave('2')" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            CCY
                        </td>
                        <td>
                            <gw:list id="lstCCY" styles="width:100%;" />
                        </td>
                        <td align="right">
                            U/P R.Num
                        </td>
                        <td>
                            <gw:list id="lstUP" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%" align="right" colspan="2"> 
				            Check Stock Out Qty<gw:checkbox id="chkCheck" alt="Check Stock Out Qty" img="save" defaultvalue="Y|N" value="N" onclick="OnSave()" />
			            </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <!--   <td colspan="5">
                <gw:grid id='grdConfig' header='_PK|Cost Method|Round Num' format='0|0|0' aligns='0|0|0'
                    check='||' editcol='1|1|1' widths='0|2500|1000' sorting='T' styles='width:100%; height:100%' />
            </td> -->
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------->
</body>
</html>
