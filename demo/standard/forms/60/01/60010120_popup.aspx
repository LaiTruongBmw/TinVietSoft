<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Expense Inquiry</title>
</head>
<%CtlLib.SetUser("acnt")%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    BindingData();
}

function BindingData()
{
   txt_comp_pk.text = "<%=Request("p_comp_pk")%>"; 
   txt_month.text = "<%=Request("p_month")%>"; 
   txt_acc_pk.text = "<%=Request("p_acc_pk")%>"; 
   txt_pl_pk.text = "<%=Request("p_pl_pk")%>"; 
   datDetail.Call("SELECT");
}
function OnReturn(){
    grdExpenseDetail.Subtotal( 1, 2,-1, '5'); 
}
</script>
<body>	
<gw:data id="datDetail" onreceive="OnReturn()">
        <xml>
            <dso type="grid" function="ACNT.ac_sel_60010120_popup">
                <input bind="grdExpenseDetail">
                    <input bind="txt_comp_pk"/>
                    <input bind="txt_month"/>
                    <input bind="txt_acc_pk"/>
                    <input bind="txt_pl_pk"/>
                </input>
                <output bind="grdExpenseDetail"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
    <tr>
        <td width="100%">
	        <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>

						<gw:grid id='grdExpenseDetail'
header='_Operator|Seq|Date|AC CODE|AC NAME|BOOK_AMT|REMARK|REMARK 2'
format='0|0|0|0|0|-0|0|0'
aligns='0|0|0|0|0|0|0|0'
defaults='|||||||'
editcol='0|0|0|0|0|0|0|0'
widths='1000|1000|1200|1000|3000|1500|3000|3000'
sorting='T'
styles='width:100%; height:440'
oncelldblclick=""
/>
					</td>
				</tr>
			</table>
        </td>
    </tr>
</table>

<gw:textbox id="txt_comp_pk"    styles='display:none'/>
<gw:textbox id="txt_month"        styles='display:none'/>
<gw:textbox id="txt_acc_pk"        styles='display:none'/>
<gw:textbox id="txt_pl_pk"        styles='display:none'/>
</body>
</html>