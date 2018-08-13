<!-- Popup dung de get customer tuong tu popupgetpartnet.aspx -->
<!-- #include file="../../../../system/lib/form.inc"  -->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _selected = false;

function BodyInit()
{  
    System.Translate(document);
   txtTransactin_pk.text = "<%=Request("tr_pk") %>";
   txtCCy.text =  "<%=Request("ccy") %>";
   
   
}
function OnSearch()
{
    datGetAR.Call("SELECT");
}
//------------------------------ poup partner-----------------------------
function Popup_Cust()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=99&AR=Y'+'&company=Y';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
      if ( object != null )
    {
        if (object[0] != 0)
        {
            txtBizPartnerCode.SetDataText(object[1]);
            txtBizPartnerName.SetDataText(object[2]);
          //  txtcust_pk.SetDataText(object[0]);
        }
    }
}

//---------------------------------------------------------------------------
function OnConfirm(){
	
	
	 var tac_crca_pk = "";
            var t_link = "";
            
            for( var i=1; i<idGrid.rows; i++)
            {
                var a = idGrid.GetGridData(i,1);
                var b = idGrid.GetGridData(i,0);
                
                if (a == "-1" )
                {
                   tac_crca_pk = tac_crca_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtcrca_pk_lst.text = tac_crca_pk;
            
            if(txtcrca_pk_lst.text=="")
            {
                alert('You must select one invoice to Confirm.');
            }
            else
            {
                 if ( confirm ('Are you sure you want to confirm this slip?') )
                 {
                       dso_ar_confirm.Call()
                 }       
            }


}

//------------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

  <gw:data id="datGetAR" >
	<xml>
		<dso type="grid" function="ac_sel_60100151_popup"   >
			<input bind="idGrid">
				<input bind="txtBizPartnerCode"/>
				<input bind="txtBizPartnerName"/>
				<input bind="txtSeq" />
				<input bind="txtVoucherNo" />
				<input bind="txtInvoiceNo" />
				<input bind="lstOriginSource" />
				<input bind="txtFROM_DATE" />
				<input bind="txtTo_DATE" />
			</input>
			<output bind="idGrid"/>
		</dso>
	</xml>
  </gw:data>
  
  
    <gw:data id="dso_ar_confirm" " > 
        <xml> 
            <dso type="process" procedure="ac_pro_60100151_popup_confirm" >
                <input> 
					<input bind="txtcrca_pk_lst"/>
                    <input bind="txtTransactin_pk"/>					 
                </input>  
                <output>
                     <output bind="txtReturn"/>
				</output> 
            </dso> 
        </xml> 
    </gw:data>
  
  
  
  
    <table  width=100% style="height:100%">
	<tr>
		<td>
			<a title="Click here to select Partner" onclick="Popup_Cust()" href="#tips">Biz Partner Code</a>
		</td>
		<td>
			<gw:textbox id ="txtBizPartnerCode" text=""/>
		</td>
	</tr>
	<tr>
		<td>
			Biz Partner Name
		</td>
		<td>
			<gw:textbox id ="txtBizPartnerName" text=""/>
		</td>
	</tr>
	<tr>
		<td>
			Seq
		</td>
		<td>
			<gw:textbox id ="txtSeq" text=""/>
		</td>
	</tr>
	<tr>
		<td>
			Voucher No
		</td>
		<td>
			<gw:textbox id ="txtVoucherNo" text=""/>
		</td>
	</tr>
	<tr>
		<td>
			Invoice No
		</td>
		<td>
			<gw:textbox id ="txtInvoiceNo" text=""/>
		</td>
	</tr>
	
	<tr>
		<td>
			Origin Source 
		</td>
		<td>
			<gw:list id="lstOriginSource" >
				<data>DATA|ALL|ALL|DO|Domestic|SO|foreign</data>
			 </gw:list>
		</td>
	</tr>
	<tr>
		<td>
			Tran Date
		</td>
		<td>
				<table>
						<tr>
							<td>
								<gw:datebox id="txtFROM_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/>
							</td>
							<td>
								~
							</td>
							<td>
								<gw:datebox id="txtTo_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/>
							</td>
							<td>
								<gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
							</td>
							<td align="right">
								<gw:icon id="btn_save" img="2" text="Confirm" styles='width:30%' onclick="OnConfirm('Confirm')" />
							</td>
						</tr>
				</table>
		</td>
		
	</tr>
	<tr style="height:92%">
	  
	    <td colspan="2">
			
			<gw:grid   
			id="idGrid"  
			header="pk|dd|Seq|Origin Source|Voucher No|Trans Date|Invoice No."
			format="0|3|0|0|0|0|0"  
			aligns="0|0|0|0|0|0|0"  
			defaults="||||||"  
			editcol="1|1|1|1|1|1|1"  
			widths="0|1000|3000|4000|0|0|1550"  
			styles="width:100%; height:100%"   
			sorting="T"   
			acceptNullDate ='T'
			onkeyupedit="DblClick()"
			oncelldblclick= "DblClick()" /> 
	    </td>
	</tr>
</table >
<gw:textbox id="txtTransactin_pk" styles="display:none" />  
<gw:textbox id="txtReturn" styles="display:none" /> 
<gw:textbox id="txtcrca_pk_lst" styles="display:none" /> 
<gw:textbox id="txtCCy" styles="display:none" /> 
</body>
</html>
