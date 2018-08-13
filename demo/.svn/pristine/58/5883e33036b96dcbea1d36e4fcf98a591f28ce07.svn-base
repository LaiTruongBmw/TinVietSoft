<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Safe Quantity Popup</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>


<script>

var G_WH_PK			= 0,
	G_ITEM_PK       = 1,
    G_ITEM_CODE     = 2,
    G_ITEM_NAME     = 3,
    G_UOM           = 4,
    G_CONS          = 5,
    G_MAX_QTY       = 6,
    G_MIN_QTY       = 7,
    G_MAX_DAY       = 8,
    G_MIN_DAY       = 9;
	
var arr_FormatNumber = new Array();    
//----------------------------------------------------------------------------------------
var vPage = 1;

function BodyInit()
{   
    System.Translate(document); 
	//-------------------
    SetGridFormat();        
		
    OnChangeTab();
	//-------------------
	txtItem.text   = "<%=Request.querystring("item_code")%>";
    txtGroup.text  = "<%=Request.querystring("group")%>";
    lstGroup.value = txtGroup.text;
	
	if ( txtItem.text != '' )
    {
		OnSearch('1');
	}
	//-------------------
}
//----------------------------------------------------------------------------------------
function OnChangeTab()
{
    if(radTab.value==1)
    {
        lstGroup.SetEnable(true);
        txtItem.SetEnable(true);
        btnSearch_1.SetEnable(true);
        btnSave.SetEnable(true);
        grdLedger.SetEnable(true);
        
    
        lstGroup2.SetEnable(false);
        btnSearch_Monthly.SetEnable(false);
        btnSave2.SetEnable(false);
        txtMaxQty.SetEnable(false);
        txtMinQty.SetEnable(false);
        txtCons.SetEnable(false);
        txtMinDay.SetEnable(false);
        txtMaxDay.SetEnable(false);
    }
    else
    {
        lstGroup.SetEnable(false);
        txtItem.SetEnable(false);
        btnSearch_1.SetEnable(false);
        btnSave.SetEnable(false);
        grdLedger.SetEnable(false);
        
    
        lstGroup2.SetEnable(true);
        btnSearch_Monthly.SetEnable(true);
        btnSave2.SetEnable(true);
        txtMaxQty.SetEnable(true);
        txtMinQty.SetEnable(true);
        txtCons.SetEnable(true);
        txtMinDay.SetEnable(true);
        txtMaxDay.SetEnable(true);
    }
}
//----------------------------------------------------------------------------------------

function BindingDataList()
{
    
    
    
}
//---------------------------------------------------------------------------------------
function ReceiveData(pos)
{
    switch(pos.id)
    {
        case'data_bisc00061_2':
            OnSearch('2');
        break;
    }
}
//===========================================================================
function SetGridFormat()
{      
        var ctrl = grdLedger.GetGridControl();
		
        ctrl.ColFormat(G_MAX_QTY)= "###,###,###.###" ;
        ctrl.ColFormat(G_MIN_QTY)= "###,###,###.###" ;
        ctrl.ColFormat(G_MAX_DAY)= "###,###,###.###" ;
        ctrl.ColFormat(G_MIN_DAY)= "###,###,###.###" ;
		ctrl.ColFormat(G_CONS)   = "###,###,###.###" ;	
        
        arr_FormatNumber[G_MAX_QTY] = 3;
        arr_FormatNumber[G_MIN_QTY] = 3;
        arr_FormatNumber[G_MAX_DAY] = 3;
        arr_FormatNumber[G_MIN_DAY] = 3;
		arr_FormatNumber[G_CONS]    = 3;
		
	    var data;
		
		data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||Select ALL"; 
	    
	    lstGroup.SetDataText(data);
	    lstGroup.value = '';
	    
	    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>"; 
	    lstGroup2.SetDataText(data);
		
		data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
		lstWH.SetDataText(data);
	 
		
}
//===========================================================================

function OnSearch(obj)
{
    switch(obj)
    {
        case '1':
            data_bisc00061.Call("SELECT");
        break;
        case'2':
            data_bisc00061_1.Call("SELECT");
        break;
    }
    
}
//------------------------------------------------------------------------
function OnSave(pos)
{
    switch(pos)
    {
        case'1':
            data_bisc00061.Call();
        break;
		
        case '2':
			data_bisc00061_2.Call();
            /*if( !Number(txtMinDay.text) && txtMinDay.text!="" )
            {
                alert(" Must Input Min days !!!");
                return;
            } 
            else if(!Number(txtMaxDay.text)&& txtMaxDay.text!="")
            {
                alert(" Must Input Max days !!!");
                return;
            }
            else if(!Number(txtMaxQty.text)&& txtMaxQty.text!="")
            {
                alert(" Must Input Max quantity !!!");
                return;
            }
            else if(isNaN(txtMinQty.text)&& txtMinQty.text!="")
            {
                alert(" Must Input Min quantity !!!");
                return;
            }
            else if(!Number(txtCons.text)&& txtCons.text!="")
            {
                alert(" Must Input Consumption quantity !!!");
                return;
            }
            else
            {
                data_bisc00061_2.Call();
            }*/
                         
        break;
    }
}
//===========================================================================

function OnPrint(obj)
{

}

//==================================================================
function OnCheckInput()
{
    var col=event.col;
    var row=event.row;
    if(col==G_MAX_QTY)
    {
        var a= Number(grdLedger.GetGridData(grdLedger.row,G_MAX_QTY));
        var b= Number(grdLedger.GetGridData(grdLedger.row,G_CONS));
        if(b==0)return;
        var c= Number(a/b);
        grdLedger.SetGridText(grdLedger.row, G_MAX_DAY, System.Round(c, arr_FormatNumber[G_MAX_DAY]));
    }
    if(col==G_MIN_QTY)
    {
        var a= Number(grdLedger.GetGridData(grdLedger.row,G_MIN_QTY));
        var b= Number(grdLedger.GetGridData(grdLedger.row,G_CONS));
        if(b==0)return;        
        var c= a/b;
        grdLedger.SetGridText(grdLedger.row,G_MIN_DAY,System.Round(c, arr_FormatNumber[G_MIN_DAY]));
    }
    if(col==G_MAX_DAY)
    {
        var a= Number(grdLedger.GetGridData(grdLedger.row,G_MAX_DAY));
        var b= Number(grdLedger.GetGridData(grdLedger.row,G_CONS));
        var c= a*b;
        grdLedger.SetGridText(grdLedger.row,G_MAX_QTY,System.Round(c, arr_FormatNumber[G_MAX_QTY]));
    }
    if(col==G_MIN_DAY)
    {
        var a= Number(grdLedger.GetGridData(grdLedger.row,G_MIN_DAY));
        var b= Number(grdLedger.GetGridData(grdLedger.row,G_CONS));
        var c= a*b;
        grdLedger.SetGridText(grdLedger.row,G_MIN_QTY,System.Round(c, arr_FormatNumber[G_MIN_QTY]));
    }
    if(col==G_CONS)
    {
        var a= Number(grdLedger.GetGridData(grdLedger.row,G_MAX_QTY));
        var b= Number(grdLedger.GetGridData(grdLedger.row,G_MIN_QTY));
        var c= Number(grdLedger.GetGridData(grdLedger.row,G_CONS));
        if(c==0)return;
        var d= a/c;
        var e= b/c;
        grdLedger.SetGridText(grdLedger.row,G_MAX_DAY,System.Round(d, arr_FormatNumber[G_MAX_DAY]));
        grdLedger.SetGridText(grdLedger.row,G_MIN_DAY,System.Round(e, arr_FormatNumber[G_MIN_DAY]));
    }
}

//==================================================================

function OnChangeGridFormat()
{
   
}
//==================================================================
function OnCalcular(obj)
{
//    switch(obj)
//    {
//        case'1':
//            var a=Number(txtMaxQty.text);
//            var b=Number(txtMinQty.text);
//            var c=Number(txtMaxDay.text);
//            var d=Number(txtMinDay.text);
//            var e=Number(txtCons.text);
//            txtMaxDay.text=a/e;
//        break;
//        case'2':
//            var a=Number(txtMaxQty.text);
//            var b=Number(txtMinQty.text);
//            var c=Number(txtMaxDay.text);
//            var d=Number(txtMinDay.text);
//            var e=Number(txtCons.text);
//            txtMinDay.text=b/e;
//        break;
//        case'3':
//            var a=Number(txtMaxQty.text);
//            var b=Number(txtMinQty.text);
//            var c=Number(txtMaxDay.text);
//            var d=Number(txtMinDay.text);
//            var e=Number(txtCons.text);
//            txtMaxDay.text=a/e;
//            txtMinDay.text=b/e;
//        break;
//        case'4':
//            var a=Number(txtMaxQty.text);
//            var b=Number(txtMinQty.text);
//            var c=Number(txtMaxDay.text);
//            var d=Number(txtMinDay.text);
//            var e=Number(txtCons.text);
//            txtMaxQty.text=e*c;
//        break;
//        case'5':
//            var a=Number(txtMaxQty.text);
//            var b=Number(txtMinQty.text);
//            var c=Number(txtMaxDay.text);
//            var d=Number(txtMinDay.text);
//            var e=Number(txtCons.text);
//            txtMinQty.text=e*d;
//        break;
//    }
    
    
    
}
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00061" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00061" procedure="st_lg_upd_bisc00061" parameter="0,1,2,3,4,5,6,7,8,9">  
                <input bind="grdLedger">
					<input bind="lstWH" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdLedger" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00061_1" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso type="control" function="st_lg_sel_bisc00061_1" > 
                <inout> 
                    <inout bind="lstGroup2" />
                    <inout bind="txtMaxQty" />
                    <inout bind="txtMinQty" />  
                    <inout bind="txtCons" />
                    <inout bind="txtMaxDay" />
                    <inout bind="txtMinDay" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00061_2" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisc00061_2" > 
                <input>
                    <inout bind="lstGroup2" />
                    <inout bind="txtMaxQty" />
                    <inout bind="txtMinQty" />  
                    <inout bind="txtCons" />
                    <inout bind="txtMaxDay" />
                    <inout bind="txtMinDay" />
                </input> 
                <output> 
                    <output bind="lstGroup2" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 20%" >
                <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                    <span value="1" id="item">Item</span> 
                    <span value="2" id="group">Group</span> 
                </gw:radio>
            </td>
			<td style="width: 5%" align="right" >                 
                W/H
            </td>			
			<td style="width: 20%">
                <gw:list id="lstWH" styles="width: 100%"   />
            </td>
			<td style="width: 50%" >                 
               
            </td>
        </tr>
        <tr valign="top" style="height: 100%">
            <td style="width: 100%" colspan=10 >
                <fieldset style="width: 100%; height: 80%">
                    <legend><font color="blue" size="4"><b><i>Item</i></b></font></legend>
                    <table style="height: 90%; width: 100%" name="Item" id="TabItem">
                        <tr style="height: 1%">
                            <td>
                                <table style="height: 100%; width: 100%">
                                    <tr style="height: 50%">
                                        
                                        <td style="width: 5%" align="right">
                                            Group</td>
                                        <td style="width: 25%">
                                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('1')" />
                                        </td>
                                        <td style="width: 5%" align="right">
                                            Item</td>
                                        <td style="width: 25%">
                                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('1')" />
                                        </td>
                                        <td style="width: 8%">
                                        </td>
                                        <td style="width: 1%" align="right">
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:button id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('1')" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave('1')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td>
                                <gw:grid id='grdLedger' header='_WH_PK|_PK|Item Code|Item Name|UOM|Consumption|Max Qty|Min Qty|Max Days|Min Days'
                                    format='0|0|0|0|-0|-0|-0|-0|-0' 
									aligns='0|0|0|0|0|0|0|0|0' 
									check='||||||||' 
									editcol='0|0|0|0|1|1|1|1|1'
                                    widths='1000|1200|2000|800|1500|1300|1300|1300|1300' 
									sorting='T' styles='width:100%; height:100%'
                                    onafteredit="OnCheckInput()" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset style="padding: 2; width: 100%; height: 20%">
                    <legend><font color="blue" size="4"><b><i>Group</i></b></font></legend>
                    <table style="height: 20%; width: 100%" name="Group" id="TabGroup">
                        <tr style="height: 1%">
                            <td style="width: 100%" colspan="6">
                                <table style="height: 100%; width: 100%">
                                    <tr style="height: 50%">
                                        <td style="width: 5%" align="right">
                                            Group</td>
                                        <td style="width: 25%">
                                            <gw:list id="lstGroup2" styles="width:100%;" onchange="OnSearch('Monthly')" />
                                        </td>
                                        <td style="width: 60%">
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:button id="btnSearch_Monthly" img="search" alt="Search" text="Search" onclick="OnSearch('2')" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:button img="save" alt="Save" id="btnSave2" onclick="OnSave('2')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 10%; white-space: nowrap">
                                Max Needed Qty
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtMaxQty" styles="width:100%;" align="right" onblur="OnCalcular('1')"
                                    type="number" format="###,###.###" />
                            </td>
                            <td style="width: 10%; white-space: nowrap">
                                Min Needed Qty
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtMinQty" styles="width:100%;" align="right" onblur="OnCalcular('2')"
                                    type="number" format="###,###.###" />
                            </td>
                            <td style="width: 10%; white-space: nowrap">
                                Consumption
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtCons" styles="width:100%;" align="right" onblur="OnCalcular('3')"
                                    type="number" format="###,###.###" />
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 10%; white-space: nowrap">
                                Max Days
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtMaxDay" styles="width:100%;" align="right" onblur="OnCalcular('4')"
                                    type="number" format="###,###.###" />
                            </td>
                            <td style="width: 10%; white-space: nowrap">
                                Min Days
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtMinDay" styles="width:100%;" onblur="OnCalcular('5')" type="number"
                                    format="###,###.###" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                        </tr>
                    </table>
                </fieldset>
                <!-- </gw:tab> -->
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtItemPk" styles="width: 100%;display: none" />
<gw:textbox id="txtGroup" styles="width: 100%;display: none" />
<!------------------------------------------------------->
</html>
