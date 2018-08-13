<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Storage Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript" language="javascript">
    //Storage Grid
    var G1_STORAGE_PK           = 0,
        G1_COMPANY_PK           = 1,
        G1_STORAGE_ID           = 2,
        G1_STORAGE_NAME         = 3,
        G1_STORAGE_LNAME        = 4,
        G1_STORAGE_FNAME        = 5,
        G1_ACTIVE               = 6,
        G1_STORAGE_TYPE         = 7,
        G1_FULL_ADDRESS         = 8,
        G1_ADD_LNAME            = 9,
        G1_ADD_FNAME            = 10,
        G1_PHONE_NO             = 11,
        G1_FAX_NO               = 12,
        G1_DESC                 = 13,
        G1_STG_START_DATE       = 14,
        G1_STG_END_DATE         = 15,
        G1_ROW_NO               = 16,
        G1_COL_NO               = 17,
        G1_FLR_NO               = 18;

//Warehouse Grid
    var G2_LEVEL             = 0
        G2_WH_PK             = 1,
        G2_STORAGE_PK        = 2,
        G2_SOURCE_WH         = 3,
        G2_SOURCE_PK         = 4,
        G2_WH_ID             = 5,
        G2_WH_Name           = 6,
        G2_PARENT_CODE       = 7
        G2_PL_PK             = 8,
        G2_PL_Name           = 9,
        G2_WH_Type           = 10,
        G2_MATERIAL_YN       = 11,
        G2_PRODUCT_YN        = 12,
		G2_SUB_MAT_YN		 = 13,
        G2_ACC_YN            = 14,
		G2_CHECK_QTY_YN		 = 15,	
		G2_CHECK_REF_QTY_YN	 = 16,	
		G2_PRICE_YN          = 17,		
        G2_ROW_LOC           = 18,
        G2_COL_LOC           = 19,
        G2_NUM_OF_ROW        = 20,
        G2_NUM_OF_COL        = 21,
        G2_DESC              = 22,
        G2_USE_YN            = 23,
        G2_PO_DEPT_PK        = 24,
        G2_PO_DEPT_NAME      = 25,
		G2_PARTNER_PK		 = 26,
		G2_PARTNER_NAME      = 27,
        G2_PARENT_PK         = 28,
		G2_WH_L_NAME		 = 29,
		G2_WH_F_NAME		 = 30;

//======================================================================
function BodyInit()
{
    System.Translate(document);
	
    var data = "";

	data = "#1;S/O|#2;W/H LOC|#;" ;
    grdStorage.SetComboFormat( G1_STORAGE_TYPE, data);
	
    data = "<%=CtlLib.SetGridColumnDataSQL(" select pk, partner_name from TCO_COMPANY where DEL_IF = 0 " )%>" ;
    grdStorage.SetComboFormat( G1_COMPANY_PK, data);

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGIN0210' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>|;" ;
    grdWareHouse.SetComboFormat( G2_WH_Type, data);
	
    data = "<%=CtlLib.SetGridColumnDataSQL(" select pk, STRG_ID || ' * ' || STRG_NAME from tlg_in_storage where del_if = 0 and use_yn = 'Y' order by STRG_ID  " )%> " ;	
	grdWareHouse.SetComboFormat( G2_STORAGE_PK, data);

    data = "<%=CtlLib.SetListDataSQL("select pk, partner_name from TCO_COMPANY where DEL_IF = 0 ")%>||Select ALL";
    lstCompany.SetDataText(data);
    lstCompany.value = '' ;
}
//======================================================================
function OnSearch(iObj)
{
    switch(iObj)
    {
        case 'grdStorage':
            data_agfp00020.Call('SELECT');
        break;

        case 'grdWareHouse':
            //----------------------------
            if ( grdStorage.row > 0 )
            {
                txtStorage_PK.text = grdStorage.GetGridData( grdStorage.row, G1_STORAGE_PK);
            }
            else
            {
                txtStorage_PK.text = '';
            }
            //----------------------------
            data_agfp00020_1.Call('SELECT');
        break;
    }
}
//======================================================================
function OnNew(iObj)
{
    switch(iObj)
    {
        case 'grdStorage':

            grdWareHouse.ClearData();

            grdStorage.AddRow();
            grdStorage.DeselectRow(grdStorage.row);
            grdStorage.SelectRow(grdStorage.rows - 1);

            if ( grdStorage.rows - 1, G1_COMPANY_PK, lstCompany.GetData() != "%" )
            {
                grdStorage.SetGridText(grdStorage.rows - 1, G1_COMPANY_PK, lstCompany.GetData());
            }

        break;

        case 'grdWareHouse':

            grdWareHouse.AddRow();
            grdWareHouse.DeselectRow(grdWareHouse.row);
            grdWareHouse.SelectRow(grdWareHouse.rows - 1);

            grdWareHouse.SetGridText(grdWareHouse.rows - 1, G2_STORAGE_PK, grdStorage.GetGridData(grdStorage.row, G1_STORAGE_PK ));

        break;
    }
}
//======================================================================
function OnUndelete(iObj)
{
    switch(iObj)
    {
        case 'grdWareHouse':
            grdWareHouse.UnDeleteRow();
        break;

        case 'grdStorage':
            grdStorage.UnDeleteRow();
        break;
    }
}

//======================================================================

function OnSave(iObj)
{
    switch(iObj)
    {
        case 'WH':
            data_agfp00020_1.Call();
        break;

        case 'STORAGE':
            data_agfp00020.Call();
        break;
    }
}
//======================================================================
function OnDelete(iObj)
{
    switch(iObj)
    {
        case 'grdWareHouse':
            grdWareHouse.DeleteRow();
        break;

        case 'grdStorage':
            grdStorage.DeleteRow();
        break;
    }
}

//======================================================================
function OnDblClick()
{
    col = event.col;
    row = event.row;

    if ( col == G2_PARENT_CODE )
    {
        var path = System.RootURL + '/form/ag/fp/agfp00021.aspx?storage_pk=' + txtStorage_PK.text;
	    var object = window.showModalDialog(path ,this ,'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');

	    if (object!=null)
	    {
	        grdWareHouse.SetGridText(row, G2_PARENT_CODE, object[4] );
	        grdWareHouse.SetGridText(row, G2_PARENT_PK,   object[1] );
	    }
    }
    else if ( col == G2_PL_Name )
    {
        var path = System.RootURL + '/form/fp/ab/fpab00560.aspx';
	    var object = window.showModalDialog(path ,this ,'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');

	    if (object!=null)
	    {
	        grdWareHouse.SetGridText(row, G2_PL_PK,   object[6] );
	        grdWareHouse.SetGridText(row, G2_PL_Name, object[2] + ' - ' + object[5] );
	    }
    }
    else if ( col == G2_SOURCE_WH )
    {
        var path = System.RootURL + '/form/ag/fp/agfp00021.aspx?storage_pk=' + txtStorage_PK.text;
	    var object = window.showModalDialog(path ,this ,'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');

	    if (object!=null)
	    {
	        grdWareHouse.SetGridText(row, G2_SOURCE_WH , object[4] );
	        grdWareHouse.SetGridText(row, G2_SOURCE_PK,   object[1] );
	    }
    }
	else if ( col == G2_PO_DEPT_NAME )
	{ 
		 var path = System.RootURL + "/standard/forms/fp/ab/fpab00550.aspx";
         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		 
		 if ( object != null )
	     {
		 	grdWareHouse.SetGridText(row, G2_PO_DEPT_PK ,  object[1] );
	        grdWareHouse.SetGridText(row, G2_PO_DEPT_NAME, object[2] + ' * ' + object[3] );
		 }	
	}
	else if ( col == G2_PARTNER_NAME )
	{ 
		 var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx";
         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		 
		 if ( object != null )
	     {
		 	grdWareHouse.SetGridText(row, G2_PARTNER_PK ,  object[0] );
	        grdWareHouse.SetGridText(row, G2_PARTNER_NAME, object[1] + ' * ' + object[2] ); 				
		 }	
	}		
}
//======================================================================
function OnExcel1()
{
    var url =System.RootURL + '/reports/ag/fp/agfp00020_1.aspx'  ;
      window.open(url);
}
//======================================================================
function OnExcel()
{
      var url =System.RootURL + '/reports/ag/fp/agfp00020.aspx'  ;
      window.open(url);
}

//======================================================================
function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case "data_agfp00020":
            //--------------------------
            OnSearch('grdWareHouse');
        break;
    }
}

//======================================================================
function OnPopUp(pos)
{
    if ( pos == 'WH_type')
    {
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0210";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
    }
	else if ( pos == 'MAP_ITEM' )
	{
			 var path = System.RootURL + "/standard/forms/ag/fp/agfp00022.aspx";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	}
	
}
//======================================================================

</script>

<body>
    <!------------------------------------------------------------->
    <gw:data id="data_agfp00020" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_agfp00020"  procedure="st_lg_upd_agfp00020">
                <input bind="grdStorage" >
                    <input bind="lstCompany" />
                </input>
                <output bind="grdStorage" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------->
    <gw:data id="data_agfp00020_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" function="st_lg_sel_agfp00020_1"  procedure="st_lg_upd_agfp00020_1">
                <input bind="grdWareHouse" >
                    <input bind="txtStorage_PK" />
                    <input bind="txtWhNo" />
                    <input bind="chkUseYN" />
                </input>
                <output bind="grdWareHouse" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------->
    <table style="height: 40%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%" align="center">
                <b>Company</b>
            </td>
            <td style="width: 40%" align="left">
                <gw:list id="lstCompany" styles="width: 100%" onchange="OnSearch('grdStorage')" />
            </td>
            <td style="width: 43%" align="left">
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('grdStorage')" />
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnNew" img="new" alt="Add" onclick="OnNew('grdStorage')" />
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('grdStorage')" />
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave('STORAGE')" />
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="btExcel" img="excel" alt="Excel" onclick="OnExcel()" />
            </td>
            
        </tr>
        <tr style="height: 99%">
            <td colspan="8">
                <gw:grid id="grdStorage" onreceive="OnDataReceive(this)" header="_PK|Company|Storage ID|Storage Name|_Storage LName|_Storage FName|Active|Storage Type|Full Address|Address LName|Address FName|Phone No|Fax No|Description|Start Date|End Date|Row|Column|Floor"
                    format="0|0|2|0|0|0|3|0|0|0|0|0|0|0|4|4|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1"
                    defaults="|||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" widths="0|2000|1500|2500|2500|2500|1000|2000|2500|2500|2500|2000|2000|2000|1500|1500|800|800|800"
                    styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"
                    oncellclick="OnSearch('grdWareHouse')" />
            </td>
        </tr>
    </table>
    <table style="height: 60%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 20%" align="right">
                <gw:textbox id="txtWhNo" onenterkey="OnSearch('grdWareHouse')" />
            </td>
            <td style="width: 10%" align="left">
                <gw:checkbox id="chkUseYN" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch('grdWareHouse')">In Use
				</gw:checkbox>
            </td>
			<td style="width: 30%; white-space:nowrap" align="center">
                <b style="cursor: hand;" onclick="OnPopUp('MAP_ITEM')" class="eco_link"><u>Item Group Mapping</u></b>
            </td>
            <td style="width: 30%; white-space:nowrap" align="center">
                <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('WH_type')" class="eco_link"><u>W/H Type</u></b>
            </td>
			<td style="width: 1%" align="left">                
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnNew2" img="new" alt="Add" onclick="OnNew('grdWareHouse')" />
            </td>
            <td style="width: 1%" align="left">
                <gw:button id="ibtnDelete2" img="delete" alt="Delete" onclick="OnDelete('grdWareHouse')" />
            </td>
           
            <td style="width: 1%" align="left">
                <gw:button id="ibtnSave2" img="save" alt="Save" onclick="OnSave('WH')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id="grdWareHouse" header="Level|_PK|Storage|Source WH ID|_source_wh_pk|W/H ID|W/H Name|Get Price From|_PL_PK|P/L|W/H Type|Material|Product|Sub Mat|Acc|Check Qty|Check Ref Qty|Price YN|Row Loc|Column Loc|Num of Rows|Num of Cols|Remark|In Use|_PO_DEPT_PK|Dept Name|_PARTNER_pk|Partner|_parent_pk|L Name|F Name"
                    format ="0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|0|0|0|0|0|3|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||||||||||||||||||||" 
					editcol="0|0|0|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|1|0|1|1|0|0|0|0|0|1|1"
                    widths="1000|0|1500|1500|0|2000|2500|2000|0|2500|1500|1200|1200|800|1200|1200|1200|1200|1200|1200|1200|1200|1500|1000|0|1500|0|1500|0|1500|1500"
                    styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19"
                    oncelldblclick="OnDblClick()" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------->
    <gw:textbox id="txtStorage_PK" styles="display:none; " />
</body>
</html>