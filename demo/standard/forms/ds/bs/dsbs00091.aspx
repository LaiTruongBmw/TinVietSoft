<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Generate Sale Order</title>
</head>

<script>

//===========================================================
 function BodyInit()
 {
    System.Translate(document); 
    //----------------------
    txtWIMasterPK.text = "<%=Request.querystring("saleorderpk")%>";
    //txtWIMasterPK.text = '2';
    txtTotalOrder.text = "<%=Request.querystring("order_qty")%>";
	//----------------
    txtTotalOrder.SetEnable(false);
    txtCardQty.SetEnable(false);
    data_dsbs00091_1.Call("SELECT");
    
    
 }
//==========================================================
function OnDataReceive(obj)
{
   
}
//==========================================================
function Generate()
{
    if(txtDevideOrder.text!="")
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
        var k=0;
        k=txtTotalOrder.text-txtCardQty.text;
        var g=0;
        g=k-txtRemainOrder.text;  
        var dQuantiy ;
        var dQuantiy1;
        dQuantiy =  txtDevideOrder.text ;
        dQuantiy1=  txtRemainOrder.text ;
        if (Number(dQuantiy)&&Number(dQuantiy1))
        {
            if(dQuantiy<0||dQuantiy1<0)
            {
                alert(" Value must greater than zero !!");
                txtDevideOrder.text="" ;
                txtRemainOrder.text=k;
                return false;
            }
            if(g<0)
            {
                alert('Please input the right qty');
                txtRemainOrder.text=k;
                return false;
                
            }
            else
            {
                txtDevideOrder.text= parseInt(dQuantiy);
                data_dsbs00091_2.Call();
                txtDevideOrder.text="";
            }
              
//            if (dQuantiy >0&& g>=0)
//            {
//                txtDevideOrder.text= parseInt(dQuantiy);
//                data_dsbs00091_2.Call();
//                txtDevideOrder.text="";
//            }
//            else
//            {
//                alert(" Value must greater than zero !!");
//                txtDevideOrder.text="" ;
//                txtRemainOrder.text=k;
//            }
        }
        else
        {
            txtRemainOrder.text=k;
            txtDevideOrder.text="" ;
            alert("Please input Numberic")
        }

}
//==========================================================
function OnDataReceive(obj)
{
     switch(obj.id)
    {
       
        case 'data_dsbs00091_1':
        var k=0;
            for(var i=1;i<grdWICard.rows;i++)
            {
                k=k+Number(grdWICard.GetGridData(i,2)); 
            }
        txtCardQty.text=k; 
        txtRemainOrder.text=txtTotalOrder.text-k;
        break;
        
        case 'data_dsbs00091_2':
            data_dsbs00091_1.Call("SELECT");
        break;
    }
}
//===========================================================
function OnDelete(index)
{
    switch (index)
    {
        case 'grdWICard':
                if ( grdWICard.GetGridData( grdWICard.row, 0 ) == '' )
                {
                    grdWICard.RemoveRow();
                }
                else
                {   
                    grdWICard.DeleteRow();
                }              
        break;
    
    }
}
//============================================================
function OnSave()
{
   
    data_dsbs00091_1.Call();
}
//============================================================
function OnUndelete()
{
    grdWICard.UnDeleteRow();
}
//===========================================================
function OnPrint()
{
    var control=grdWICard.GetGridControl();
    var pk="",takeout_pk="";
    for (i=0;i<control.SelectedRows;i++)
    {
          var row=control.SelectedRow(i)
          pk += ","+grdWICard.GetGridData(row,0);
          takeout_pk=pk.substring(1);
    }
//    alert(takeout_pk); 
//    var  url= System.RootURL + "/standard/reports/ds/bs/rpt_Boxlabel.aspx?saleorderpk="+takeout_pk ;
//	System.OpenTargetPage( url);
	if(takeout_pk!="")
	{
	    var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00091_Selected.aspx?saleorderpk="+ takeout_pk;
	    System.OpenTargetPage(url); 
	}    
	else
	{
	    alert("Please select Order to report");
	}
}
//===========================================================
function OnPrint1()
{	    
    if(txtWIMasterPK.text!="")
    { 
        var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00091.aspx?saleorderpk="+ txtWIMasterPK.text;
	    System.OpenTargetPage(url); 
	}
	else
	{
	    alert("Please select Order to report");
	}
}
//==============================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00091_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1,2" procedure="SALE.sp_pro_dsbs00091"> 
                <input> 
                    <input bind="txtWIMasterPK" />
                    <input bind="txtRemainOrder" />
                    <input bind="txtDevideOrder" />    
                </input>
                <output>     
                    <output bind="txtFinish"/>
                </output>
                
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00091_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter ="0,1,2,3,4" function="sale.sp_sel_dsbs00091" procedure="SALE.sp_upd_dsbs00091" > 
                <input> 
                    <input bind="txtWIMasterPK" />   
                </input>
                <output  bind="grdWICard" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 100%; width: 100%">
            <td style="background-color: CCFFFF; border: 1px solid #034D72">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="center" style="width: 10%">
                            SO Qty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtTotalOrder" styles='width:100%' />
                        </td>
                        <td align="center" style="width: 10%">
                            Card Qty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtCardQty" styles='width:100%' />
                        </td>
                        <td align="center" style="width: 15%">
                            Remain Q'ty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtRemainOrder" styles='width:100%' />
                        </td>
                        <td align="center" style="width: 15%">
                            Devide Q'ty
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtDevideOrder" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="8">
                            <table>
                                <tr>
                                    <td style="width: 92%" align="center" colspan="3">
                                    </td>
                                    <td style="width: 3%" align="center">
                                        <gw:button id="ibtnGenerate" img="Generate" text="Generate" alt="Generate Sale Order" onclick="OnProcess()"
                                            />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:button img="excel" alt="Print Selected report" id="btnPrint" onclick="OnPrint()" />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:button img="excel" alt="Print All report" id="btnAllPrint" onclick="OnPrint1()" />
                                    </td>
                                    <td style="width: 1%" align="center">
                                        <gw:button id="ibtnDelete" img="delete" alt="delete" onclick="OnDelete('grdWICard')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete()" />
                                    </td>
                                    <td style="width: 1%" align="center">
                                        <gw:button id="ibtnUpdate" img="save" alt="save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td style="width: 100%" colspan="8">
                            <gw:grid id='grdWICard' header='_PK|Card ID|Card Qty|Order Qty|_ref_table_pk' format='0|0|0|0'
                                aligns='0|0|0|0|0' defaults='||||' editcol='1|1|1|1|1' widths='1000|2000|2000|1000|1000'
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
    <gw:textbox id="txtFinish" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIMasterPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
