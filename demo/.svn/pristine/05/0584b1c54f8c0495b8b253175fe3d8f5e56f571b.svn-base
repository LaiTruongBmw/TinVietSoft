<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Production Card from Order Plan</title>
</head>

<script>

//===========================================================
 function BodyInit()
 {
    System.Translate(document);
    //----------------------
    txtRefTablePK.text   = "<%=Request.querystring("RefTablePK")%>";
    txtRefTableName.text = "<%=Request.querystring("RefTableName")%>";

	//----------------
    txtPlanQty.SetEnable(false);
    txtCardedQty.SetEnable(false);
    //----------------
    pro_fpip00102.Call();
            
 }

//==========================================================
function Generate()
{
    if(txtDevideQty.text!="")
    {
         
    }
    else
    {
        alert("Please input Card Qty");
    }
   
}
//==========================================================
function OnProcess()
{
    if ( confirm ('Are you want to Generate Production Card ?' ))
    {

        if ( Number(txtRemainQty.text)>0 && Number(txtDevideQty.text)>0 )
        {
            pro_fpip00102_1.Call();
        }
        else
        {
            alert( 'Devide Qty and Remain Qty must be greater than 0 . ');
        }
    }   
}
//==========================================================
function OnDataReceive(obj)
{
     switch(obj.id)
    {
       
        case 'pro_fpip00102_1':
            alert(txtReturnValue.text);            
            data_fpip00102.Call("SELECT");            
        break;
        
        case 'data_fpip00102':
            pro_fpip00102.Call();
        break;
    }
}
//===========================================================
function OnDelete(index)
{
    switch (index)
    {
        case 'grdProdCard':
                if ( grdProdCard.GetGridData( grdProdCard.row, 0 ) == '' )
                {
                    grdProdCard.RemoveRow();
                }
                else
                {   
                    grdProdCard.DeleteRow();
                }              
        break;
    
    }
}
//============================================================
function OnSave()
{   
    data_fpip00102.Call();
}
//============================================================
function OnUndelete()
{
    grdProdCard.UnDeleteRow();
}
//===========================================================
function OnPrint()
{
    var control = grdProdCard.GetGridControl();
    var pk="",takeout_pk="";
    
    for ( i=0; i<control.SelectedRows; i++)
    {
          var row=control.SelectedRow(i)
          pk += "//"+grdProdCard.GetGridData(row,0);
          takeout_pk=pk.substring(2);
    }
//    alert(takeout_pk); 
//    var  url= System.RootURL + "/reports/ds/bs/rpt_Boxlabel.aspx?saleorderpk="+takeout_pk ;
//	System.OpenTargetPage( url);

	if(takeout_pk!="")
	{
//	    var url =System.RootURL + "/reports/fp/ip/rpt_fpip00102_Selected.aspx?saleorderpk="+ takeout_pk;
//	    System.OpenTargetPage(url); 
	    var url = System.RootURL + "/system/ReportEngine.aspx?file=fp/ip/rpt_fpip00102.rpt&procedure=PROD.sp_rpt_fpip00102&parameter=" + txtRefTablePK.text + "," + takeout_pk + "," + lstCardTyle.value + "&export_pdf=Y" ;              
	    System.OpenTargetPage(url); 
	}    
	else
	{
	    alert("Please select Prod Card to report");
	}
}
//===========================================================
function OnPrint1()
{	    
    if(txtRefTablePK.text!="")
    { 
        var url =System.RootURL + "/reports/fp/ip/rpt_fpip00102.aspx?saleorderpk="+ txtRefTablePK.text;
	    System.OpenTargetPage(url); 
	}
	else
	{
	    alert("Please select Card to print.");
	}
}
//==============================================================================
function OnSearch()
{
    data_fpip00102.Call("SELECT");
}
//==============================================================================

</script>

<body>
    <!---------------------------------------------------------------------------->    
     <gw:data id="pro_fpip00102" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1,2" procedure="<%=l_user%>lg_pro_fpip00102"> 
                <input> 
                    <input bind="txtRefTablePK" />
                    <input bind="txtRefTableName" />
                </input>
                <output>     
                    <output bind="txtPlanQty"/>
                    <output bind="txtCardedQty"/>
                    <output bind="txtRemainQty"/>
                </output>                
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->    
     <gw:data id="pro_fpip00102_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1,2" procedure="<%=l_user%>lg_pro_fpip00102_1"> 
                <input> 
                    <input bind="txtRefTablePK" />
                    <input bind="txtRefTableName" />
                    <input bind="txtRemainQty" />
                    <input bind="txtDevideQty" />   
                    <input bind="lstCardTyle" />                                    
                </input>
                <output>     
                    <output bind="txtReturnValue"/>
                </output>                
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00102" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter ="0,1,2,3,4" function="<%=l_user%>lg_sel_fpip00102" procedure="<%=l_user%>lg_upd_fpip00102" > 
                <input> 
                    <input bind="txtRefTablePK" />
                    <input bind="txtRefTableName" />   
                    <input bind="lstCardTyle" /> 
                </input>
                <output  bind="grdProdCard" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 100%; width: 100%">
            <td style="border: 1px solid #034D72">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%; background-color: CCFFFF">
                        <td align="right" style="width: 15%; white-space: nowrap">
                            Plan Qty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtPlanQty" styles='width:100%' csstype="mandatory" type="number"
                                format="###,###,###" />
                        </td>
                        <td align="right" style="width: 15%; white-space: nowrap">
                            Carded Qty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtCardedQty" styles='width:100%' csstype="mandatory" type="number"
                                format="###,###,###" />
                        </td>
                        <td align="right" style="width: 15%; white-space: nowrap">
                            Remain Q'ty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtRemainQty" styles='width:100%; color:blue' type="number" format="###,###,###" />
                        </td>
                        <td align="right" style="width: 15%; white-space: nowrap">
                            Devide Q'ty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtDevideQty" styles='width:100%' text='50' type="number" format="###,###,###" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="8">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 25%" align="right">
                                        Card Type
                                    </td>
                                    <td style="width: 65%">
                                        <gw:list id="lstCardTyle" styles='width:80%' >
                                            <data>DATA|10|Production Card|20|Box Card</data>
                                        </gw:list>
                                    </td>
                                    <td style="width: 4%" align="center">
                                        <gw:icon id="ibtnGenerate" img="2" text="Generate" alt="Generate Sale Order" onclick="OnProcess()"
                                            styles='width:20%' />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:imgbtn img="excel" alt="Print Selected report" id="btnPrint" onclick="OnPrint()" />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:imgbtn img="excel" alt="Print All report" id="btnAllPrint" onclick="OnPrint1()" />
                                    </td>
                                    <td style="width: 1%" align="center">
                                        <gw:imgbtn id="ibtnDelete" img="delete" alt="delete" styles='width:100%' onclick="OnDelete('grdProdCard')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete()" />
                                    </td>
                                    <td style="width: 1%" align="center">
                                        <gw:imgbtn id="ibtnUpdate" img="save" alt="save" styles='width:100%' onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td style="width: 100%" colspan="8">
                            <gw:grid id='grdProdCard' header='_PK|Component|Card ID|Card Qty|Order Qty|_ref_table_pk' format='0|0|0|0|0'
                                aligns='0|0|0|3|3|0' defaults='|||||' editcol='0|0|0|1|0|0' widths='1000|2000|2200|2000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtSumOrder" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtRefTablePK" styles='width:100%;display:none' />
    <gw:textbox id="txtRefTableName" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
