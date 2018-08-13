<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking</title>
</head>

<script type="text/javascript">
var G1_GRP_PK	  	= 0,
	G1_GRP_CODE   	= 1,
	G1_ITEM_PK    	= 2,
    G1_ITEM_CODE  	= 3,
    G1_ITEM_NAME  	= 4,
	G1_UOM 		  	= 5,    
	G1_LOT_NO	  	= 6,
    G1_BEGIN_QTY  	= 7,
	G1_BEGIN_REF_QTY= 8,
    G1_IN_QTY     	= 9,
    G1_IN_REF_QTY 	= 10,	 
    G1_OUT_QTY      = 11,
    G1_OUT_REF_QTY  = 12,	 
    G1_END_QTY      = 13,
	G1_END_REF_QTY  = 14;

//=============================================================================
function BodyInit()
{
    System.Translate(document);
    //--------------------
	var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtDTFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtDTFrom.value=ldate ;
	//---------------------
    FormatGrid();
    BindReportList();
}
//=============================================================================
function FormatGrid()
{
    var data ;	
	
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang1.SetDataText(data);
    lstLang1.value = "<%=Session("SESSION_LANG")%>";	
	//-----------------
	data = "data|10|Grand|20|by Group";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
    //-----------------	
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType01.SetDataText(data);
    lstWHType01.value = '';

	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWH01.SetDataText( data + "||");
    lstWH01.value = '';

    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';    
	
	var ctrl = grdINOUT.GetGridControl();

    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;

    ctrl.ColFormat(G1_BEGIN_QTY)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_BEGIN_REF_QTY) = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_QTY)        = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_REF_QTY)    = "###,###,###.##" ;	 
	ctrl.ColFormat(G1_OUT_QTY)       = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_REF_QTY)   = "###,###,###.##" ;	 
	ctrl.ColFormat(G1_END_QTY)       = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_REF_QTY)   = "###,###,###.##" ;

	ctrl.FrozenCols = G1_ITEM_NAME ; 
	//------
	//OnSetGrid();

}
//=============================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'BALANCE':
            //---------------------
            data_bisc00160.Call('SELECT');
        break;
    }
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00160':
            if ( grdINOUT.rows > 1 )
            {              
                grdINOUT.SetCellBold( 1, G1_BEGIN_QTY, grdINOUT.rows-1, G1_END_QTY,   true);

                grdINOUT.SetCellBgColor( 1, G1_ITEM_CODE, grdINOUT.rows - 1, G1_ITEM_CODE, 0xCCFFFF );

				//grdINOUT.SetCellBgColor( 1, G1_IN_QTY,  grdINOUT.rows - 1, G1_TOTAL_IN,  0xCCFFFF );
                //grdINOUT.SetCellBgColor( 1, G1_OUT_QTY, grdINOUT.rows - 1, G1_TOTAL_OUT, 0xFFFFCC );
				
				if ( lstGridType.value == '20' )
				{
					grdINOUT.Subtotal( 0, 2, 0, '7!8!9!10!11!12!13!14','###,###,###.##');
				}
				else if ( lstGridType.value == '10' )
				{
					grdINOUT.Subtotal( 0, 2, -1, '7!8!9!10!11!12!13!14','###,###,###.##');
				}	
            }
        break;
    }
}
//=============================================================================
 var vITEM_ID;
function OnPopUp(pos)
{
	switch (pos)
	{
		case 'DETAIL':
			if ( event.col >= G1_IN_QTY && event.col <= G1_TOTAL_OUT && event.row > 0 )
			{
				var col = event.col ;
				var row = event.row ;
		
			    if ( col == G1_TOTAL_IN )
				{
					vTYPE = 'TOTAL_IN' ;
				}
				else if ( col == G1_TOTAL_OUT )
				{
					vTYPE = 'TOTAL_OUT' ;
				}
		
				vITEM_PK = grdINOUT.GetGridData( row, G1_ITEM_PK );
				vLOTNO = grdINOUT.GetGridData( row, G1_LOT_NO );
		
			    var url = System.RootURL + '/standard/forms/bi/sc/bisc00161.aspx';
				var aValue  = System.OpenModal(  url , 700, 450, 'resizable:yes;status:yes', this);
			}
		break;
		
		case 'HIST':
		    if (grdINOUT.row >0)
		    {
		    vITEM_ID = grdINOUT.GetGridData( grdINOUT.row, G1_ITEM_CODE );
		    }else
		    {
		       vITEM_ID="";
		    }
			var url = System.RootURL + '/standard/forms/bi/sc/bisc00163.aspx';
			var aValue  = System.OpenModal(  url , 950, 500, 'resizable:yes;status:yes', this);
		break;
		
		case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00160';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
	}
}
//=============================================================================
function OnReport()
{    
    var url = System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                               "?p_from_date=" + dtDTFrom.value + 
                               "&p_to_date=" + dtDTTo.value + 
                               "&p_wh_type=" + lstWHType01.value + 
                               "&p_wh=" + lstWH01.value + 
                               "&p_wh_name=" + lstWH01.GetText() +
                               "&p_use_yn=" + lstUseYn.value + 
                               "&p_item_grp=" + lstItemGroup01.value + 
                               "&p_item=" + txtItem01.text + 
                               "&p_lang=" + lstLang1.value;
     	 
    System.OpenTargetPage(url);      
}
//=============================================================================
function OnSetGrid()
{
	if ( radType.value == 1 )
	{
		 grdINOUT.GetGridControl().ColHidden(G1_IN_QTY)    = true ;
         //grdINOUT.GetGridControl().ColHidden(G1_OR_IN_QTY) = true ;

		 //grdINOUT.GetGridControl().ColHidden(G1_TOTAL_IN) = false ;

		 grdINOUT.GetGridControl().ColHidden(G1_OUT_QTY)    = true ;
         //grdINOUT.GetGridControl().ColHidden(G1_OR_OUT_QTY) = true ;

		 //grdINOUT.GetGridControl().ColHidden(G1_TOTAL_OUT) = false ;
	}
	else
	{
		 grdINOUT.GetGridControl().ColHidden(G1_IN_QTY)    = false ;
         //grdINOUT.GetGridControl().ColHidden(G1_OR_IN_QTY) = false ;

		 //grdINOUT.GetGridControl().ColHidden(G1_TOTAL_IN) = true ;

		 grdINOUT.GetGridControl().ColHidden(G1_OUT_QTY)    = false ;
         //grdINOUT.GetGridControl().ColHidden(G1_OR_OUT_QTY) = false ;

		 //grdINOUT.GetGridControl().ColHidden(G1_TOTAL_OUT) = true ;
	}
}
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00160' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}  
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00160" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00160" >
                <input>
                    <input bind="lstWHType01" />
                    <input bind="lstUseYn" />
                </input>
                <output>
                    <output bind="lstWH01" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00160" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_sel_bisc00160"  >
                <input bind="grdINOUT" >
					<input bind="dtDTFrom" />
					<input bind="dtDTTo" />
					<input bind="lstWHType01" />
			        <input bind="lstWH01" />
			        <input bind="lstUseYn" />
					<input bind="lstItemGroup01" />
			        <input bind="txtItem01" />
			        <input bind="lstLang1" />
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="width: 100%; height: 0%">
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstWHType01" styles="width:100%" onchange="pro_bisc00160.Call('SELECT')" />
            </td>
            <td colspan="25" align="right">
                <gw:list id="lstWH01" styles="width: 100%" />
            </td>
            <td colspan="10" align="right">
                <gw:list id="lstUseYn" styles="width: 100%" onchange="pro_bisc00160.Call('SELECT')">
					<data>ListUse|Y|In use|N|Not in use|ALL|All</data>
				</gw:list>
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Date
            </td>
            <td colspan="20" style="white-space: nowrap">
                <gw:datebox id="dtDTFrom" lang="1"   />
                ~
                <gw:datebox id="dtDTTo" lang="1"   />
            </td>
            <td colspan="1"></td>
            <td colspan="5" style="white-space: nowrap" align="right">
                <gw:list id="lstLang1" styles='width:100%' />
            </td>
            <td colspan="7" style="white-space: nowrap" align="right">
                <gw:list id="lstGridType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                Item
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>
            <td colspan="25">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td colspan="10" align="center">
                <b style="color: purple; cursor: hand" onclick="OnPopUp('HIST')"><u>Stock Hist.</u></b>
            </td>
            <td colspan="20" style="white-space: nowrap" align="center">
                <gw:radio id="radType" value="1" styles="width:100%" onchange="OnSetGrid()">
                	<span value="1">ALL</span>
                    <span value="2">In/Others</span>
                </gw:radio>
                <gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="N" >Bal<0</gw:checkbox>
            </td>
            <td colspan="6" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="12" align="right">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport1" img="excel" alt="Many reports" text="Many reports" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
					<gw:grid id='grdINOUT'
					header='_TLG_IT_ITEMGRP_PK|Group|_TLG_IT_ITEM_PK|Item Code|Item Name|UOM|Lot No|Begin Qty|Begin Ref Qty|In Qty|In Ref Qty|Out Qty|Out Ref Qty|End Qty|End Ref Qty'
					format='0|0|0|0|0|0|0|1|1|1|1|1|1|1|1'
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					check='||||||||||||||'
					editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
					widths='1000|2500|1000|1500|2500|900|1500|1200|1500|1200|1500|1200|1500|1200|1500'
					sorting='T'
					styles='width:100%; height:100%'
					oncelldblclick="OnPopUp('DETAIL')"
					/>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
</html>
