<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
var cmp_pk  = "<%=Request("company_pk")%>";
var trs_pk  = "<%=Request("transaction_pk")%>";
var slip_pk = "<%=Request("slip_pk")%>";
var drcr_type = "<%=Request("drcr_type")%>";
function BodyInit()
{
    System.Translate(document);     
    BindingDataList();



}


function BindingDataList()
{ 
    var ls_data1   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data2     = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0070','','') FROM DUAL")%>";
    lstCompany.SetDataText(ls_data1);
    lsttrangrp.SetDataText(ls_data2);
    lstCompany.value = cmp_pk;
	lsttrangrp.value = trs_pk;
	lstCompany.SetEnable(false);
	//lsttrangrp.SetEnable(false);
	txt_Slip_Pk.text = slip_pk;
	txtdrcr_type.text = drcr_type;
	onChangeOptionRB();
	OnSearch();
}

function OnSearch()
{
    if(rbOption.value=="G")
   {
        grpGroupCode.ClearData();
        grpGroupCodeDetail.ClearData();
        datSlipPopup.Call("SELECT");
     }
     else
     {
        grpAcountCode.ClearData();
        datAllAccount.Call("SELECT");
     }
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_search_trans":
            if (lb_delete)
            {
                dso_upd_trans.StatusInsert();
                lb_delete = false;
                lb_select = false;
            }
        break;
    }
}
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
function Selects()
{	
    var rtnArr = new Array();
    for(i=1;i<grpGroupCode.rows;i++)
   {
        if(grpGroupCode.GetGridData(i,5)== "-1")
        {
                tmp= new Array();
                tmp[0] ="G";
                for(j=0;j<grpGroupCode.cols;j++)
               {
                    tmp[tmp.length] = grpGroupCode.GetGridData(i,j);
               } 
               rtnArr[rtnArr.length]=tmp; 
        }
   } 
   
   for(i=1;i<grpAcountCode.rows;i++)
   {
        if(grpAcountCode.GetGridData(i,5)== "-1")
        {
                tmp= new Array();
                tmp[0] ="C";
                for(j=0;j<grpGroupCode.cols;j++)
               {
                    tmp[tmp.length] = grpAcountCode.GetGridData(i,j);
               } 
               rtnArr[rtnArr.length]=tmp; 
        }
   }
   window.returnValue = rtnArr; 
   window.close(); 
}

function onChangeOptionRB()
{
    if(rbOption.value=="G")
   {
        grpGroupCode.style.display="";
        grpGroupCodeDetail.style.display="";
        //grpGroupCodeDetail.ClearData();
        grpAcountCode.style.display="none";
   }
   else
   {
         grpGroupCode.style.display="none";
        grpGroupCodeDetail.style.display="none";
        grpAcountCode.style.display="";
        if(grpAcountCode.rows<2)
        {
            OnSearch();
        }
   } 
}

function onGetDetailCode()
{
    var old_pk = txtGroupCodePK.text;
   txtGroupCodePK.text = grpGroupCode.GetGridData(grpGroupCode.row,0); 
   if (old_pk !=txtGroupCodePK.text)
   {
        datAccountInGroup.Call("SELECT");
    }
}

</script>
<body style="margin:0; padding:0;">
 <gw:data id="datSlipPopup" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030050_get_acc_group" > 
                <input bind="grpGroupCode" > 
                    <input bind="txtCodeSrc" /> 
                    <input bind="txtNameSrc" /> 
                    <input bind="txtLNameSrc" /> 
                    <input bind="txtKNameSrc" /> 
                    <input bind="lsttrangrp" /> 
                    <input bind="txt_Slip_Pk" /> 
                    <input bind="txtdrcr_type" /> 
                    <input bind="lstCompany" /> 
                </input> 
                <output bind="grpGroupCode" /> 
            </dso> 
        </xml> 
    </gw:data> 
    
   <gw:data id="datAccountInGroup" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030050_acc_in_group" > 
                <input bind="grpGroupCodeDetail" > 
                    <input bind="txtGroupCodePK" />  
                </input> 
                <output bind="grpGroupCodeDetail" /> 
            </dso> 
        </xml> 
    </gw:data>  
    
   <gw:data id="datAllAccount" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="ac_sel_60030050_account_code" > 
           <input bind="grpAcountCode" > 
                    <input bind="txtCodeSrc" /> 
                    <input bind="txtNameSrc" /> 
                    <input bind="txtLNameSrc" /> 
                    <input bind="txtKNameSrc" /> 
                    <input bind="txt_Slip_Pk" /> 
                    <input bind="txtdrcr_type" /> 
                    <input bind="lstCompany" /> 
                </input> 
                <output bind="grpAcountCode" /> 
                </dso>  
        </xml> 
    </gw:data>   
<table  width="100%"  cellpadding="0" cellspacing="0" border="0">
	<tr>	
		<td width="15%" align="right" >Company</td>
		<td width="20%">
			<gw:list id="lstCompany"  styles='width:100%'></gw:list >
		</td>
		<td align="right" width="13%">Option</td>
		<td width="20%">
			<gw:radio id="rbOption" value="G" onchange="onChangeOptionRB()"> <span value="G" >Group&nbsp;&nbsp;</span><span value="C">Code</span></gw:radio>
		</td>
		<td width="12%"></td>
		<td width="10%" align="right"><gw:icon id="btnSearch" img="in" text="Search" onclick="OnSearch()" styles="width:80%"/></td>
		<td width="10%" align="right"><gw:icon id="btnSelect" img="in" text="Select"  onclick="Selects()" styles="width:80%"/></td>

	</tr>
	<tr>
		<td align="right" width="10%">Transaction Group</td>
		<td width="20%">
			<gw:list id="lsttrangrp" styles='width:100%'></gw:list>
		</td>
		<td align="right">Code</td>
		<td><gw:textbox id="txtCodeSrc" maxlen="150" styles='width:100%'/></td>
		<td align="right">Name (ENG)</td>
		<td colspan="2"><gw:textbox id="txtNameSrc" maxlen="150" styles='width:100%'/></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td align="right">Name (LOCAL)</td>
		<td><gw:textbox id="txtLNameSrc" maxlen="150" styles='width:100%'/></td>
		<td align="right">Name (KOR)</td>
		<td colspan="2"><gw:textbox id="txtKNameSrc" maxlen="150" styles='width:100%'/></td>
	</tr>
	<tr>
		<td colspan="7">
		    <gw:grid id='grpGroupCode'
                header='_PK|Acc Grp Code|Acc Grp Name|Acc Grp Local Name|Acc Grp Korean Name|Check'
                format='0|0|0|0|0|3'
                aligns='0|0|0|0|0|2'
                defaults='|||||'
                editcol='0|0|0|0|0|1'
                widths='0|2200|3000|3000|2800|800'
                sorting='T'
                styles='width:100%; height:200'
                oncellclick='onGetDetailCode()'
                />
		</td>
	</tr>
	<tr>
		<td colspan="7">
		<gw:grid id='grpGroupCodeDetail'
            header='_PK|Account Code|Account Name|Account Local Name|Account Korean Name'
            format='0|0|0|0|0'
            aligns='0|1|0|0|0'
            defaults='||||'
            editcol='0|0|0|0|0'
            widths='0|2500|3200|3200|3200'
            sorting='T'
            styles='width:100%; height:200'
            />
		</td>
	</tr>
	<tr>
		<td colspan="7">
		<gw:grid id='grpAcountCode'
header='_PK|Account Code|Account Name|Account Local Name|Account Korean Name|Check'
format='0|0|0|0|0|3'
aligns='0|1|0|0|0|1'
defaults='|||||'
editcol='0|0|0|0|0|1'
widths='0|2000|3000|3000|3000|800'
sorting='T'
styles='width:100%; height:400'
/>
		</td>
	</tr>
</table>
<gw:textbox id="txt_Slip_Pk"             style="display:none"/> 
<gw:textbox id="txtdrcr_type"             style="display:none"/> 

<gw:textbox id="txtGroupCodePK"             style="display:none"/> 
</body>
</html>
