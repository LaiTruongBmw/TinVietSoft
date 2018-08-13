﻿<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser("APP_DBUSER")%>

<script>
              
function BodyInit()
{
    System.Translate(document);
    var ls_date_fr = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    dtTrdate_fr.SetDataText(ls_date_fr);
    txtcompk.text = "<%=Request.querystring("company")%>";
    g_cus_pk = "<%=Request("cus_pk") %>"
	g_cus_id = "<%=Request("cus_id") %>"
	g_cus_nm = "<%=Request("cus_nm") %>"
	
	txtven_cd.text = g_cus_id;
    txtven_nm.text = g_cus_nm;
    txtven_pk.text = g_cus_pk;
	
    // trang thai cua cac nut xoa , delete
   // idBtnDel.SetEnable(false);
    //idBtnSave.SetEnable(false);
   // idBtnOK.SetEnable(true);            
}
//-------------------------------------------------------------
function OnSelect()
{
    var i ;
	var aValue = new Array();
	for(i = 1; i < grdDtl_2.rows; i++)
    {
			tmp= new Array();
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 1);  // seq
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 2);  // voucher no
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 3);  // item code 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 4); // item name
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 5); // UOM 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 6); // Quantity 
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 7); // Net trans amount
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 8); // Net Books Amount
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 9); // Desc
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 10); // Local Desc
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 11); // PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 12); // Item_PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 13); // Acc_PK
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 14); // Acc_CD
			tmp[tmp.length] = grdDtl_2.GetGridData(i, 15); // Acc_Name
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
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + txtcompk.text;
    var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
   // var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	//var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
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
	for(i = 1; i < grdDtl.rows; i++)
	{
		if(grdDtl.GetGridData(i, 0)=='-1')
		{
			grdDtl_2.AddRow();
			for(j = 1; j < grdDtl.cols; j++)
			{
				grdDtl_2.SetGridText(grdDtl_2.rows - 1, j, grdDtl.GetGridData(i, j) );
				//grdDtl_2.SetRowStatus(grdDtl_2.rows - 1, 0x20);
			}						
		}				
    }		
	j = 1;	
	i = j;
	while(i >= j && i < grdDtl.rows)
	{
		if(grdDtl.GetGridData(i, 0)=='-1')
		{
			grdDtl.RemoveRowAt(i);
			j = i;
		}
		else
		{
			i++;
		}
	}
}
//-------------------------------------------------------------------
function OnCopyAll()
{

    var i, j;
	var fg = grdDtl.GetGridControl();
    for(i = 1; i < grdDtl.rows; i++)
    {
          	grdDtl_2.AddRow();
			for(j = 0 ; j < grdDtl.cols ; j++)
			{
				grdDtl_2.SetGridText(grdDtl_2.rows - 1, j, grdDtl.GetGridData(i, j));
			}
		
    }
    j = 1;	
	i = j;
    while(i >= j && i < grdDtl.rows)
	{
		grdDtl.RemoveRowAt(i);
		j = i;
		
	}
    
   /* var i, j;
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
    }*/
    
}
function OnCheckAll()
{
    for(j = 1 ; j < grdDtl_2.rows ; j++)
			{
				grdDtl_2.SetGridText(j,0,-1);
			}
}
//--------------------------------------------
function OnDelete()
{
	var i, j;
	var fg = grdDtl_2.GetGridControl();
    for(i = 1; i < grdDtl_2.rows; i++)
    {
        if(grdDtl_2.GetGridData(i, 0)=='-1')
		{
          	grdDtl.AddRow();
			for(j = 0 ; j < grdDtl_2.cols ; j++)
			{
				grdDtl.SetGridText(grdDtl.rows - 1, j, grdDtl_2.GetGridData(i, j));
			}
		}
    }
    i = grdDtl_2.rows-1;		
    while( i > 0)
	{
	     if(grdDtl_2.GetGridData(i, 0)=='-1')
		{
		    grdDtl_2.RemoveRowAt(i);		  
		}
		i--;
	}

}
</script>
<body style="margin:0; padding:0;">
<!-------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_item" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090060_allo_get_item">
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
        <td colspan="3">
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="60%"></td>                                                        
                <td width="20%"><gw:icon id="btnCopy" alt="Copy" img="in" text="Copy" onclick="OnCopy()" /></td> 
                <td width="20%"><gw:icon id="btnCopyAll" alt="Copy All" img="in" text="Copy All" onclick="OnCopyAll()" /></td>
            </tr>
            </table>
        </td>        
    </tr>    
    <tr style="height:40%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="Check|Seq|Voucher No|Item Code|Item Name|UOM|Q'ty|Net Trans Amt|Net Books Amt|Desc|Local Desc|_PK|_Item_PK|_Acc_PK|Acc. Code|Acc. Name|_PL_PK|Invoice No|Serial No|Invoice Date"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4"
                aligns  ="0|0|0|1|2|1|3|3|3|2|0|0|0|0|0|0|0|0|0|1"
                defaults="|||||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="800|1000|1500|1500|2500|1000|1200|1500|1500|1500|1500|1500|1500|0|1500|2500|0|1400|1400|1400"
                styles  ="width:100%; height:100%"                
                sorting ="T"
                oncelldblclick  = "OnCopy()"
            />
        </td>
    </tr>
    <tr style="height:5%;" >
        <td colspan="10" >
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
               	<td width="70%"></td>
                <td width="10%"><gw:icon id="btnChk" alt="Check All" img="in" text="Check All" onclick="OnCheckAll()" /></td>
                <td width="10%"> <gw:imgBtn id="btnDelete" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" /></td>      
                <td width="10%"><gw:imgBtn id="btnSelect" alt="Select" img="select" text="Select" onclick="OnSelect()" /></td>           
            </tr>
        </table>
        </td>
    </tr>        
    <tr style="height:40%">
        <td colspan="10">
            <gw:grid
                id      ="grdDtl_2"  
                header  ="Check|Seq|Voucher No|Item Code|Item Name|UOM|Q'ty|Net Trans Amt|Net Books Amt|Desc|Local Desc|_PK|_Item_PK|_Acc_PK|Acc. Code|Acc. Name|_PL_PK|Invoice No|Serial No|Invoice Date"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="0|0|0|1|2|1|3|3|3|2|0|0|0|0|0|0|0|0|0|0"
                defaults="|||||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="800|1000|1500|1500|2500|1000|1200|1500|1500|1500|1500|1500|1500|0|1500|2500|0|1500|1500|1500"
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