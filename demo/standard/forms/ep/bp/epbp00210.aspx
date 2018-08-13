<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Quotation Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_SELECT           = 0,
    G1_QUOT_M_PK        = 1,
    G1_STATUS           = 2,
    G1_QUOT_DATE        = 3,
    G1_SLIP_NO          = 4,
	G1_DEPT				= 5,   
    G1_CHARGER          = 6,
    G1_REMARK           = 7,
	G1_RECOMMEND		= 8;
                   
var G2_ITEM_PK          = 0,
    G2_ITEM_CD          = 1,
    G2_ITEM_NM          = 2,
    G2_UOM              = 3,
    G2_REQ_QTY          = 4,
    G2_PK               = 5,
    G2_PARTNER_PK       = 6,
    G2_PARTNER_ID       = 7,
    G2_PARTNER_NM       = 8,
    G2_UNIT_PRICE       = 9,
	G2_AMOUNT			= 10,
    G2_CCY              = 11,
    G2_AGREE_YN         = 12,
    G2_PAY_TERM         = 13,
    G2_PAY_METHOD       = 14,
	G2_PRICE_TYPE       = 15,
    G2_LEAD_DAY         = 16,   
    G2_DESC             = 17,
	G2_LAST_PARTNER		= 18,
	G2_LAST_DATE		= 19,
	G2_LAST_UPRICE		= 20,
	G2_LAST_CCY			= 21;
		   
var l_status = 'select'    ;

//==================================================================
         
function BodyInit()
{       
    System.Translate(document);
    txtChargerPK.text="<%=Session("EMPLOYEE_PK")%>";
    //---------------------------------- 
    var now = new Date(); 
    var lmonth, ldate;
  
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;   
    //-----------------------------------------   
    BindingDataList();      

    //------------------------------------
    OnSearch('grdConfirm');    
}
//====================================================================================================
 function BindingDataList()
 {  
    var  data = "";
	
	data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' - '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstSearchDept.SetDataText(data);  
    lstSearchDept.value = '' ;
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";           
	grdDetail.SetComboFormat(G2_PAY_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
    grdDetail.SetComboFormat(G2_PAY_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0130' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
    grdDetail.SetComboFormat(G2_PRICE_TYPE,data);  
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdDetail.SetComboFormat(G2_CCY,data);  
          
    var ctrl = grdDetail.GetGridControl();  
	
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
	    
    ctrl.ColFormat(G2_REQ_QTY)    = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G2_LEAD_DAY)   = "#,###,###,###,###,###";	
	ctrl.ColFormat(G2_LAST_UPRICE)= "#,###,###,###,###,###.##";
	
	grdDetail.GetGridControl().Cell( 7, 0, G2_AGREE_YN, 0, G2_AGREE_YN) = 0x3300cc;
                         
 }

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_epbp00210.Call('SELECT');
        break;
        
        case 'grdDetail':
			if ( grdConfirm.row > 0 )
			{
            	txtMasterPK.text  = grdConfirm.GetGridData(grdConfirm.row,G1_QUOT_M_PK);
            	upd_epbp00210.Call('SELECT')            
			}	
        break;
    }
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_epbp00210':
            lbRecord.text = grdConfirm.rows-1 + " (s)";
            
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_SLIP_NO, grdConfirm.rows - 1, G1_SLIP_NO, true);
                grdConfirm.SetCellBold( 1, G1_STATUS,  grdConfirm.rows - 1, G1_STATUS,  true);
				
                grdConfirm.SetCellBgColor( 1, G1_STATUS, grdConfirm.rows - 1, G1_STATUS, 0xCCFFFF );
				grdConfirm.SetCellBgColor( 1, G1_DEPT,   grdConfirm.rows - 1, G1_DEPT,   0xCCFFFF );                                      
            }
                  
        break;    
        
        case 'data_epbp00210_1':   
            SetRowColor();
			
            if(l_status == 'save')    
            {
                l_status = 'select';
                OnSearch('grdConfirm');
                
            }
			
			loadSum();
			                 
        break; 
        
        case 'upd_epbp00210': 
           if(l_status == 'save')    
            {
                data_epbp00210_1.Call();
            }else
            {
                 data_epbp00210_1.Call('SELECT');
            }                   
        break;
        
        case 'pro_epbp00210' :
            alert('Finished!')
        break;        
        
        case 'pro_epbp00210_1':   
            alert(txtReturnValue.text);
            data_epbp00210.Call('Select');
        break;         
        
       
    }
}

//=====================================================================================
 function  SetRowColor()
 {
        var v_color = 0xCCFFCC;
        var v_item  = "";
		
        for( var i = 1 ; i<grdDetail.rows; i++ )
        {
            if ( v_item != grdDetail.GetGridData(i,G2_ITEM_PK) )
            {
                if ( v_color == 0xCCFFCC )
                {
                    v_color = 0xFFFFFF;
                }
				else
                {
                    v_color = 0xCCFFCC;
                }
				
                v_item = grdDetail.GetGridData(i,G2_ITEM_PK);
            }
			
            grdDetail.SetCellBgColor( i, G2_ITEM_PK, i, G2_LAST_CCY, v_color );   
            
        }
		
        if ( grdDetail.rows > 1 )
        {
            grdDetail.SetCellBold( 1, G2_ITEM_CD,    grdDetail.rows - 1, G2_ITEM_CD,    true);
            grdDetail.SetCellBold( 1, G2_PARTNER_ID, grdDetail.rows - 1, G2_PARTNER_ID, true);                  
        } 
 }
//==================================================================
var flag="";
function OnProcess(pos)
{
    switch (pos)
    {
        case'Approve':
            var po_pk = "";            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                grdConfirm.SetRowStatus(i,16);   
                l_status ='save';
                upd_epbp00210.Call();            
            }            
        break; 

        case'Cancel':
            if ( txtMasterPK.text != '')
            {
                if ( confirm ('Do you want to Cancel ?'))
                {
                    pro_epbp00210_1.Call();
                }    
            }
            else
            {
                alert('Pls select one Slip.');
            }         
                     
        break;         
        
        case 'PO_LIST':
             var po_pk = "";
            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData( i, G1_SELECT);
                var b = grdConfirm.GetGridData( i, G1_QUOT_M_PK);
                
                if ( a == "-1" )
                {
                   po_pk= po_pk + b +",";
                }
            }
            
            txtArrayPOPK.text = po_pk.substring( 0, po_pk.length-1);
            
            if ( txtArrayPOPK.text == "" )
            {
                alert('You must select one Quotation.');
            }
            else
            {
                pro_epbp00210.Call();
            } 
        break;     
        case 'PO':
        
            txtArrayPOPK.text = grdConfirm.GetGridData(grdConfirm.row,G1_QUOT_M_PK);
            
            if ( txtArrayPOPK.text == "" )
            {
                alert('You must select one Quotation.');
            }
            else
            {
                pro_epbp00210.Call();
            } 
        break;      
    }    
}

//==================================================================
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.width="100%";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }    
 
  //=======================================================================================
  
function OnGridCellDoubleClick(oGrid)
{
    var v_col = event.col;
    var v_row = event.row;
	
    if ( v_col == G2_PARTNER_ID || v_col == G2_PARTNER_NM )
    {
         var path = System.RootURL + '/standard/formsfp/ab/fpab00570.aspx?partner_pk='+ grdDetail.GetGridData( v_row, G2_PARTNER_PK );
         var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:600px;dialogHeight:400px');			 		 
		  
		 if ( object != null )
		 {
		 	for ( var i=1; i<grdDetail.rows; i++)
			{
				if ( grdDetail.GetGridData( i, G2_PARTNER_PK) == object[0] )
				{
					grdDetail.SetGridText( i, G2_AGREE_YN, -1 );
				}
				else
				{
					grdDetail.SetGridText( i, G2_AGREE_YN, 0 );
				}					
			}
		 }		            
    } 
	else if ( v_col == G2_ITEM_CD || v_col == G2_ITEM_NM )
	{
         var path = System.RootURL + '/standard/formsfp/ab/fpab00020.aspx?item_pk='+ grdDetail.GetGridData( v_row, G2_ITEM_PK );
         var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:400px');			 		 		
	}
}   

//==================================================================

function OnGridCellClick(obj)
{
	switch(obj.id)
	{
		case 'grdDetail' :
			if ( event.col == G2_AGREE_YN )
			{
				loadSum();
			}
		break;
	}
}
//====================================================================================
function loadSum()
{
		var t_select_amount = 0  ;
		var t_temp_item_pk  = "" ;
		var t_item_count    = 0  ;
		var t_ccy           = "" ;
		
		for ( var i=1; i<grdDetail.rows; i++)				
		{			
			if ( grdDetail.GetGridData( i, G2_AGREE_YN) == -1 )
			{
				t_select_amount = Number(t_select_amount) + Number(grdDetail.GetGridData( i, G2_AMOUNT)) + "" ;
				
				t_ccy = grdDetail.GetGridData( i, G2_CCY);      
			}
			
			if ( t_temp_item_pk != grdDetail.GetGridData( i, G2_ITEM_PK) )
			{
				t_item_count    = t_item_count + 1 ;
				t_temp_item_pk  = grdDetail.GetGridData( i, G2_ITEM_PK) ;
			}						
		}
		
		lbItemNum.text      = addCommas(t_item_count)    + " items" ;
		lbSelectAmount.text = addCommas(t_select_amount) + " (" + t_ccy + ")";
}

//====================================================================================

function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
//==================================================================
function OnPrint()
{
    if(txtMasterPK.text=="")
    {
        alert("Please select Voucher !!!");
    }
    else
    {    
        var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00191_IBC.aspx?p_master_pk='+ txtMasterPK.text;
        window.open(url);          
    }
} 

//====================================================================================  
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00210" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_epbp00210"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
					<input bind="lstSearchDept" />                
			        <input bind="txtSearchNo1" />
					<input bind="txtItem1" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!---------5:pk; 14:agree_yn; 15:description----------------------------------------->
    <gw:data id="data_epbp00210_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_epbp00210_1" parameter="5,12,17" procedure="st_lg_upd_epbp00210_1" >
                <input bind="grdDetail" >
                    <input bind="txtMasterPK" />
          	        <input bind="txtSearchNo2" />			       
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00210" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00210" > 
                <input>
                    <input bind="txtArrayPOPK" /> 
                    <input bind="txtChargerPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
   
    <!--------------------------------------------------------------------->
     <gw:data id="upd_epbp00210" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1" function="st_lg_sel_epbp00210_2"  procedure="st_lg_upd_epbp00210"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtRecomend" />                   
                </inout>
            </dso> 
        </xml> 
    </gw:data>  
    <!-------------------------CANCEL--------------------------------------->
    <gw:data id="pro_epbp00210_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00210_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <inout bind="txtRecomend" />                                       
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!--------------------------------------------------------------------->
    
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 40%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
						<td style="width: 5%">
                            Dept
                        </td>
                        <td style="width: 20%" colspan="2">
                            <gw:list id="lstSearchDept" styles='width:100%;' onchange="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSearchNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>   
						<td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>                        
                        <td style="width: 13%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>(s)</gw:label>
                        </td>
                         <td style="width: 1%; white-space: nowrap" align="center">
                            <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                         </td>  
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
                            <gw:grid id='grdConfirm' header='_Select|_PK|Status|Quot Date|Slip No|Dept|Charger|Remark|Recommendation|Approved By|Cancel By'
                                format='3|0|0|4|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|3|3|3|0|0' check='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0' 
                                widths='0|0|1200|1200|1200|2000|2500|2500|2500|1800|1800'
                                oncellclick="OnSearch('grdDetail')"
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 60%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>                        
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSearchNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="center">
                            <gw:label id="lbItemNum" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
                        </td>
						<td style="width: 15%; white-space: nowrap" align="center">
                            <gw:label id="lbSelectAmount" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdDetail')" />
                        </td>             
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td> 
                         <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td> 
                        <td style="width: 5%; white-space: nowrap" align="center">
                            <gw:button id="btnPO" img="Generate PO" text="Generate PO" onclick="OnProcess('PO')" />
                         </td>                        
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="13">
                              <gw:grid id='grdDetail'
                                header='_ITEM_PK|Item Code|Item Name|UOM|Req Qty|_PK|_BUSPARTNER_PK|Partner ID|Partner Name|U/Price|Amount|CCY|Agree YN|Payment Term|Pay Method|Price Type|Lead days|Remark|_Last Partner|Date|U/Price|_UOM'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|4|0|0' 
								aligns='0|0|0|1|3|0|0|0|0|3|3|1|1|0|0|0|3|0|0|1|3|1'
                                check='|||||||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0' 
								widths='0|1500|2000|800|1500|0|0|1500|2000|1500|1500|800|1000|1500|1500|1500|1200|1200|2000|1200|1300|800'
                                styles='width:100%; height:100%'
								oncellclick="OnGridCellClick(this)"		
								acceptnulldate="T"		
								oncelldblclick="OnGridCellDoubleClick(this)"
								
                                />														 			   
                        </td>
                    </tr>
                    <tr  style="height: 5%">
                        <td style="white-space: nowrap" align="right" colspan="2">
                            Recommendation & Reason:</td>
                        <td style="width: 70%" colspan ="8">
                            <gw:textarea id="txtRecomend" maxlen="500" styles='width:100%;height:80' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
    
    <!----------------------------------------------------------->
</body>
</html>
