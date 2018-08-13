<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <title>Maintenance task checking</title>
</head>

<script type="text/javascript">

 var    G_REQ_NO		= 0,
        G_REQ_DATE		= 1,
        G_STATUS		= 2,
        G_STATUS_NAME	= 3,
        G_ASSET_PK		= 4,
        G_ASSET	        = 5,
        G_UOM		    = 6,
        G_MA_PROCESS_PK	= 7,
        G_PROCESS	    = 8,
        G_REQ_TYPE		= 9,
        G_REQ_EMP_PK	= 10,
        G_FULL_NAME		= 11,
        G_REQ_DESC		= 12,
        G_MA_DATE		= 13,
        G_MA_RESULT		= 14,
        G_MA_AMOUNT		= 15,
        G_CHARGER_PK	= 16,
        G_CHARGER_NAME	= 17,
        G_PARTNER_PK	= 18,
        G_PARTNER_NAME	= 19;


  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    //----------------
    OnBindingList();
    
    grdAsset.style.display  = "";        		      
    grdAssetGroup.style.display = "none";
    grdAsset.SetEnable(false);
    grdAssetGroup.SetEnable(false);
    OnSearch('Item');
 }
//===============================================================
function OnBindingList()
{
    var data = '';
   
    data = "DATA|1|SAVED|2|SUBMIT|3|APPROVED|4|CANCEL|5|RESOLVED||"; //ma type
    lstStatus.SetDataText(data);
    lstStatus.value='';
}

//===============================================================

 function FormatGrid()
 {
         
             
        /*grdAsset.GetGridControl().MergeCells  = 2 ;	
        grdAsset.GetGridControl().MergeCol(0) = true ;	
        grdAsset.GetGridControl().MergeCol(1) = true ;   	
        grdAsset.GetGridControl().MergeCol(2) = true ;	
        grdAsset.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdAsset.GetGridControl();
        ctrl.ColFormat(G_In_Qty) = "###,###,###.###" ;
        ctrl.ColFormat(G_UP)     = "###,###,###.###" ;
        ctrl.ColFormat(G_Amount) = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_Rate)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_Amt)   = "###,###,###.###" ;
        ctrl.ColFormat(G_Total_Amt) = "###,###,###.###" ;
        ctrl.ColFormat(G_Sel_CYY )  = "###,###,###.###" ;
        
		grdAsset.GetGridControl().Cell( 7 , 0 , G_Sel_CYY , 0, G_Sel_CYY ) = 0x3300cc; */
		var objGrid = grdAsset;
		for(var i =1 ; i < objGrid.rows; i ++)
        {
            switch(objGrid.GetGridData(i, G_STATUS))
            {
                case '1'://save: white
                    objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFFFF);
                break;
                case '2'://submit: yellow
                    objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xAFFAFF);
                break;
                case '3'://approve green
                    objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFFCC);
                break;
                case '4'://cancel gray
                    objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xC0C0C0);
                break;
                case '5'://resolved linghte green
                    objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFF33);
                break;
                default:
                break;
            }
        }
		
 }

//===============================================================
 
function OnSearch(pos)
{
    data_fpma00080.Call("SELECT");
}
 
//===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_fpma00080' :
                lblRecord.text = (grdAsset.rows - 1) + ' record(s)';
			    if ( grdAsset.rows > 1 )
			    {
		            FormatGrid();
		        }   
		        grdAssetGroup.GridRefresh();
		        data_fpma00080_1.Call("SELECT"); 
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport()
{     
//TODO:
    alert('output report function not implement!');
    //var url =System.RootURL + '/reports/bi/ni/rpt_bini00020.aspx?p_tin_warehouse_pk='+ lstWH.value +'&p_whtype='+lstWHType.GetText()+'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+txtRefNoSupplier.text+'&p_item='+txtItem.text;
    //window.open(url);
}
 //===============================================================
 function OnChangeTab()
 {
    
    var strRad = radType.GetData();
             
    switch (strRad)
    {
        case 'Item':        		    
            grdAsset.style.display  = "";        		      
            grdAssetGroup.style.display = "none";		     
        break;
        
        case 'Group':
            grdAsset.style.display  = "none";        		      
            grdAssetGroup.style.display = "";			    	   		    
        break;	
    }                
     
 }
 
 //===============================================================
 function OnChangeCurr()
 {
    	grdAsset.SetGridText(0,G_Sel_CYY,lstCurrency.value +" Amt")
    	grdAssetGroup.SetGridText(0,G_Sel_CYY+1,lstCurrency.value +" Amt")
 }
 //===============================================================
 
 function OnCheckDate()
 {
 	if ( chkDate.value == 'N' )
	{
		dtFrom.SetEnable(false);
		dtTo.SetEnable(false);
	}
	else
	{
		dtFrom.SetEnable(true);
		dtTo.SetEnable(true);	
	}
 }
 //===============================================================
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fpma00080" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00080" > 
                <input bind="grdAsset" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
				    <input bind="txtReqNo" />
                    <input bind="txtProcess" />                
                    <input bind="lstStatus" />
                    <input bind="txtAsset" />
                    <input bind="txtPartner" />
					<input bind="txtLine" />
                </input>
                <output bind="grdAsset" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fpma00080_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00080_1" > 
                <input bind="grdAssetGroup" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
				    <input bind="txtReqNo" />
                    <input bind="txtProcess" />                
                    <input bind="lstStatus" />
                    <input bind="txtAsset" />
                    <input bind="txtPartner" />
					<input bind="txtLine" />
                </input>
                <output bind="grdAssetGroup" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <%--<gw:data id="pro_bini00020_2" onreceive=""> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_bini00020" > 
                <input>
                    <input bind="lstWHType" /> 
                </input> 
                <output>
                    <output bind="lstWH" />
                </output>
            </dso> 
        </xml> 
    </gw:data>--%>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Req No
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtReqNo" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtProcess" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Status
                        </td>
                        <td style="width: 19%; white-space: nowrap">
                            <gw:list id="lstStatus" styles="width:100%;" />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            Asset
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtAsset" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Partner
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtPartner" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Line
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtLine" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                        </td>
                        <td style="width: 19%; white-space: nowrap">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnExcel" img="excel" alt="excel" text="excel" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 55%" colspan="2">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="Item"  id="tab_Item">Asset</span> 
                                <span value="Group" id="tab_Group">Group</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 20%">
                        </td>
                        <td style="width: 49%" colspan="4">
                            <table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="padding: 0 0 0 0; margin: 0 0 0 0; white-space: nowrap;" align="center">
                                        <gw:label img="new" id="lblRecord" styles="font-weight: bold; color:#CC0000;" text="0 record(s)" />
                                    </td>
                                    <td style="background-color: #FFFFFF; color: Black;" align="center">
                                        SAVED
                                    </td>
                                    <td style="background-color: #FFFAAF; color: Black;" align="center">
                                        SUBMIT
                                    </td>
                                    <td style="background-color: #CCFFFF; color: Black;" align="center">
                                        APPROVED
                                    </td>
                                    <td style="background-color: #C0C0C0; color: Black;" align="center">
                                        CANCEL
                                    </td>
                                    <td style="background-color: #A6FFD2; color: Black;" align="center">
                                        RESOLVED
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 1%">
                        </td>
                    </tr>
                </table>
            </td> 
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdAsset' 
                    header='Req No|Req Date|_StatusCode|Status|_ASSET_PK|Asset|UOM|_MA_PROCESS_PK|Process Name|Req Type|_REQ_EMP_PK|Requestor|Req Description|Ma.Date|Ma.Result|Ma.Amount|_CHARGER_PK|Charger|_PARTNER_PK|Partner'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|4|0|1|0|0|0|0' 
                    aligns='0|1|0|1|0|0|1|0|0|0|0|0|0|1|0|2|0|0|0|0'
                    check='|||||||||||||||||||' 
                    editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' defaults='|||||||||||||||||||||||' styles='width:100%; height:100%' />
                <gw:grid id='grdAssetGroup' 
                    header='Req No|Req Date|Status|Asset|UOM|Process|Req Type|Requestor|Req Description|Ma.Date|Ma.Result|Ma.Amount|Charger|Partner'
                    format='0|4|0|0|0|0|0|0|0|4|0|1|0|0' 
                    aligns='0|1|0|0|0|0|0|0|0|1|0|2|0|0'
                    check='|||||||||||||' 
                    editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1' 
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' group="T" defaults='||||||||||||||||||' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
