﻿<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
              
function BodyInit()
{
    System.Translate(document);
    var ls_date_fr = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    dtTrdate_fr.SetDataText(ls_date_fr);
    txtcompk.text = "<%=Request.querystring("company")%>";
    // trang thai cua cac nut xoa , delete
    idBtnDel.SetEnable(false);
    idBtnSave.SetEnable(false);
    idBtnOK.SetEnable(true);            
}
//-------------------------------------------------------------
function OnSelect()
{
    var i ;
	var aValue = new Array();
	for(i = 1; i < grdDtl_2.rows; i++)
    {
			tmp= new Array();
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 0);  // seq
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 1);  // voucher no
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 2);  // item code 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 3); // item name
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 4); // UOM 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 5); // Quantity 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 6); // Net trans amount
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 7); // Net Books Amount
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 8); // Desc
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 9); // Local Desc
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 10); // PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 11); // Item_PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 12); // Acc_PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 13); // Acc_CD
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 14); // Acc_Name
			aValue[aValue.length]=tmp;		
    }
	window.returnValue = aValue;
	window.close();	
}
//-------------------------------------------------------------
function onSearch()
{
    dso_get_item.Call('SELECT');
   
}
//-------------------------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtven_cd.text = object[1];
            txtven_nm.text = object[2];
            txtven_pk.text = object[0];
        }
    }
}
//-------------------------------------------------------
function onResetVen()
{
    txtven_cd.text = '';
    txtven_nm.text = '';
    txtven_pk.text = '';
}
//-------------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        case 'dso_get_item':
        break ;
    }    
}
//--------------------------------------------
function OnCopy()
{
    var i, j ;
    grdDtl_2.AddRow();   
    i = grdDtl_2.rows - 1;
    for(j = 0; j < grdDtl.cols; j++)
    {
        grdDtl_2.SetGridText(i, j, grdDtl.GetGridData(event.row, j));        
    }
    grdDtl.RemoveRowAt(event.row);
}
//-------------------------------------------------------------------
function OnCopyAll()
{
    var i, j;
	var fg = grdDtl.GetGridControl();
    for(i = 1; i < grdDtl.rows; i++)
    {
		if(fg.isSelected(i) == true)
		{
			grdDtl.SetCellBgColor(i, 0, i, grdDtl.cols-1, 0xA9EBD7);
			grdDtl_2.AddRow();
			for(j = 0 ; j < grdDtl.cols ; j++)
			{
				grdDtl_2.SetGridText(grdDtl_2.rows - 1, j, grdDtl.GetGridData(i, j));
			}
		}	
    }
    
}
//-------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!-------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_item" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="acnt.sp_sel_returngd_get_item">
                <input bind="grdDtl">
                    <input bind="txtcompk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="dtTrdate_fr"/>
                    <input bind="dtTrdate_to"/>
                    <input bind="txtven_pk"/>
                    <input bind="txtSeq" />
                    <input bind="txtInvNo"/>
                </input>
                <output bind="grdDtl" />
            </dso>
        </xml>
    </gw:data>

<!-------------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
<tr style="height:0%" >    
    <td width="8%"></td>
    <td width="12%"></td>
    <td width="8%"></td>
    <td width="10%"></td>
    <td width="3%"></td>
    <td width="10%"></td>
    <td width="5%"></td>
    <td width="27%"></td>
    <td width="12%"></td>
    <td width="3%"></td>
</tr>
    <tr style="height:5%; " >
        <td align="right">Voucher No</td>
        <td ><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="onSearch()"/></td>
        <td align="right">Trans Date</td>
        <td><gw:datebox id="dtTrdate_fr" lang="1" /></td>
        <td align="center">~</td>
        <td><gw:datebox id="dtTrdate_to" styles="width:100%" lang="1" /></td>
        <td align="right">Vendor</td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="30%"><gw:textbox id="txtven_cd" styles='width:100%' /></td>
                <td width="60%"><gw:textbox id="txtven_nm" styles='width:100%'/></td>
                <td width="0%"><gw:textbox  id="txtven_pk" styles='display:none'/></td>
                <td width="5%"><gw:imgBtn   img="popup"	id="idSearchVen" alt="Popup" onclick="onSearchVen()"/></td> 
                <td width="5%"><gw:imgBtn   img="reset"	id="idResetVen"  alt="Reset" onclick="onResetVen()"/></td>
            </tr>
            </table>
        </td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>                
                <td align="center" width="40%"><gw:label id="lblsum" text="0" styles="color:red;width:90%;font-weight: bold;font-size:12"/></td>
                <td align="right" width="60%"><gw:label id="lblLabel" text="record(s)" styles="color:red;width:90%;font-weight: bold;font-size:12"/>&nbsp;</td>
            </tr>
            </table>
        </td>
        <td><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" /></td>
    </tr>
    <tr style="height:5%">
        <td align="right">Seq</td>
        <td ><gw:textbox id="txtSeq" styles="width:100%" onenterkey="onSearch()" /></td>
        <td align="right">Invoice No</td>
        <td colspan="3"><gw:textbox id="txtInvNo" styles='width:100%' onenterkey="onSearch()" /></td>                    
        <td align="right"></td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="90%"></td>                                                        
                <td width="5%"></td> 
                <td width="5%"><gw:icon id="btnCopyAll" alt="Copy All" img="in" text="Copy All" onclick="OnCopyAll()" /></td>
            </tr>
            </table>
        </td>
        <td colspan="1" align="right" width="100%"><td align="right" width="20%"><gw:imgBtn id="idBtnOK" alt="Select" img="select" onclick="OnSelect()" /></td>
    </tr>    
    <tr style="height:40%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="Slip No|Date|Item Code|Item Name|WH|Qty|UOM|Amount|Ccy|UPrice|PartnerID|Partner Name|Remark|_RTND_PK|_ITEM_PK|_WH_PK|_ACC_PK|ACC. Code"
                format  ="0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="0|1|1|2|1|3|1|3|1|3|1|2|2|0|0|0|0|0"
                defaults="|||||||||||||||||"
                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="1400|1000|1400|2000|1400|1200|800|1500|800|1300|1400|2500|1600|0|0|0|0|1500"
                styles  ="width:100%; height:100%"                
                sorting ="T"
                oncelldblclick  = "OnCopy()"
            />
        </td>
    </tr>
    <tr style="height:5%;display:none;" >
        <td colspan="10" >
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
				<td width="80%"></td>
                <td width="5%" align="right" ><gw:imgBtn id="idBtnAdd" img="new" alt="Add New" onclick="OnAddNew()" /></td>
                <td width="5%"><gw:imgBtn id="idBtnDel" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                <td width="5%"><gw:imgBtn id="idBtnSave" img="save" alt="Save" onclick="OnSave()" /></td>            
                <td width="5%"></td>            
            </tr>
        </table>
        </td>
    </tr>        
    <tr style="height:40%">
        <td colspan="10">
            <gw:grid
                id      ="grdDtl_2"  
                header  ="Slip No|Date|Item Code|Item Name|WH|Qty|UOM|Amount|Ccy|UPrice|PartnerID|Partner Name|Remark|_RTND_PK|_ITEM_PK|_WH_PK|_Acc_PK|ACC. Code"
                format  ="0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="0|1|1|2|1|3|1|3|1|3|1|2|2|0|0|0|0|0"
                defaults="|||||||||||||||||"
                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="1400|1000|1400|2000|1400|1200|800|1500|800|1300|1400|2500|1600|0|0|0|0|1500"
                styles  ="width:100%; height:100%"                
                sorting ="T"
                oncelldblclick  = ""
            />
        </td>
    </tr>    
</table>
<!---------------------------------------------------------------------------------------------------->
<gw:textbox id="txtcompk"           style="display:none" />

</body>
</html>