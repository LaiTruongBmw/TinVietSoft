<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Incoming Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_PK            = 0,
    G_SLIP_NO       = 1,
    G_PL            = 2,
    G_WI_FR_DATE    = 3,
    G_WI_TO_DATE    = 4;

var G1_TLG_FA_CUT_WI_M_PK   = 0,
    G1_WI_FR_DATE           = 1,
    G1_WI_TO_DATE           = 2,
    G1_SLIP_NO              = 3,
    G1_PL_NM                = 4,
    G1_TLG_FA_CUT_WI_D_PK   = 5,
    G1_LINE_NAME            = 6, 
    G1_DWG_NO               = 7,
    G1_IDMK                 = 8,
    G1_MARK                 = 9,
    G1_ITEM_NAME            = 10,
    G1_SPEC_01              = 11,
    G1_SPEC_02              = 12,
    G1_SPEC_03              = 13,
    G1_SPEC_04              = 14,
    G1_SPEC_05              = 15,
    G1_WI_QTY               = 16,
    G1_ITEM_BC              = 17,
    G1_RESULT_QTY           = 18;
    
    var 
    G2_TLG_FA_CUT_OUTREQ_M_PK   = 0,
    G2_req_fr_date              = 1,
    G2_req_to_date              = 2,
    G2_SLIP_NO                  = 3,
    G2_PL_NM                    = 4,
    G2_TLG_FA_CUT_OUTREQ_D_PK   = 5,
    G2_LINE_NAME                = 6, 
    G2_DWG_NO                   = 7,
    G2_IDMK                     = 8,
    G2_MARK                     = 9,
    G2_ITEM_NAME                = 10,
    G2_SPEC_01                  = 11,
    G2_SPEC_02                  = 12,
    G2_SPEC_03                  = 13,
    G2_SPEC_04                  = 14,
    G2_SPEC_05                  = 15,
    G2_REG_QTY                  = 16,
    G2_ITEM_BC                  = 17,
    G2_DOC_DATE                 = 18,
    G2_LENGHT_QTY               = 19,
    G2_MATERIAL                 = 20,
    G2_BOM_QTY                  = 21,
    G2_RESULT_QTY               = 22;
    
    var
    G3_WI_FR_DATE               = 0,
    G3_WI_TO_DATE               = 1,
    G3_SLIP_NO                  = 2,
    G3_PL_NM                    = 3,
    G3_LINE_NAME                = 4, 
    G3_DWG_NO                   = 5,
    G3_IDMK                     = 6,
    G3_MARK                     = 7,
    G3_ITEM_NAME                = 8,
    G3_SPEC_01                  = 9,
    G3_SPEC_02                  = 10,
    G3_SPEC_03                  = 11,
    G3_SPEC_04                  = 12,
    G3_SPEC_05                  = 13,
    G3_WI_QTY                   = 14,
    G3_RESULT_QTY               = 15,
    G3_BALANCE                  = 16,
    G3_OUT_RESULT               = 17,
    G3_SCAN_YMD                 = 18,   
    G3_EMPLOYEE                 = 19;
    
   

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
	 
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFromSearch.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFromSearch.value=ldate ;
    //---------------------------- 
    
    BindingDataList(); 
    //---------------------------- 
    OnChangeType(); 

   
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = "";            
	 var data1= "";    
	
    data = "data|1|IN|2|OUT";
    lstType.SetDataText( data);
    lstType.value = '1' ;	
     data1 = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstLine.SetDataText(data1); 
     
 }
 //==================================================================================
 
function  OnChangeDate()
{
	var	ldate=dtVoucherDate.value ;       
    ldate = ldate.substr(2,4)  ; 
    lstInType.value = ldate;
}
 //==================================================================================
 
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G2_WI_QTY) = "###,###,###,###.##";
 }
 
  

//========================================================================

function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_fpfa00390_search_in':
	        if ( grdSearchIn.rows>1 )
	        {
	            lblRecord.text = grdSearchIn.rows - 1 + ' row(s)';
	            grdSearchIn.SetCellBold( 1, G1_WI_QTY, grdSearchIn.rows - 1, G1_WI_QTY,   true);
                grdSearchIn.SetCellBold( 1, G1_RESULT_QTY , grdSearchIn.rows - 1, G1_RESULT_QTY,   true);      
                grdSearchIn.SetCellBgColor( 1, G1_WI_QTY, grdSearchIn.rows - 1, G1_WI_QTY, 0x99FFFF );  
                grdSearchIn.SetCellBgColor( 1, G1_RESULT_QTY, grdSearchIn.rows - 1, G1_RESULT_QTY, 0x99FFFF );
	        }
	        else
	        lblRecord.text =  '0 row(s)'; 
	    break;
	     case 'data_fpfa00390_search_out':
	        if ( grdSearchOut.rows>1 )
	        {
	            lblRecord.text = grdSearchOut.rows - 1 + ' row(s)';
	            grdSearchOut.SetCellBold( 1, G2_REG_QTY, grdSearchOut.rows - 1, G2_REG_QTY,   true);
                grdSearchOut.SetCellBold( 1, G2_RESULT_QTY , grdSearchOut.rows - 1, G2_RESULT_QTY,   true);      
                grdSearchOut.SetCellBgColor( 1, G2_REG_QTY, grdSearchOut.rows - 1, G2_REG_QTY, 0x99FFFF );  
                grdSearchOut.SetCellBgColor( 1, G2_RESULT_QTY, grdSearchOut.rows - 1, G2_RESULT_QTY, 0x99FFFF );
	        }
	        else
	        lblRecord.text =  '0 row(s)'; 
	    break;
	    case 'data_fpfa00390_view_balance':
	        if ( grdViewBalance.rows>1 )
	        {
	            lblRecord.text = grdViewBalance.rows - 1 + ' row(s)';
	            grdViewBalance.SetCellBold( 1,G3_WI_QTY, grdViewBalance.rows - 1, G3_WI_QTY,true);
                grdViewBalance.SetCellBold( 1,G3_RESULT_QTY , grdViewBalance.rows - 1,  G3_RESULT_QTY,true); 
                grdViewBalance.SetCellBold( 1,G3_BALANCE , grdViewBalance.rows - 1, G3_BALANCE,true);     
                grdViewBalance.SetCellBgColor( 1, G3_WI_QTY, grdViewBalance.rows - 1, G3_WI_QTY, 0x99FFFF );  
                grdViewBalance.SetCellBgColor( 1, G3_RESULT_QTY, grdViewBalance.rows - 1, G3_RESULT_QTY, 0x99FFFF );
                grdViewBalance.SetCellBgColor( 1,G3_BALANCE, grdViewBalance.rows - 1, G3_BALANCE, 0x99FFFF );
	        }
	        else
	        lblRecord.text =  '0 row(s)'; 
	    break;
    }
}
//=============================================================================================
function OnSearch()
{
     if ( lstType.value == 1 )
      {
        if(rbView.value ==2)
            data_fpfa00390_view_balance.Call("SELECT");
         else   
            data_fpfa00390_search_in.Call("SELECT");
                  
       }        
    else
      {
        if(rbView.value ==2)
            data_fpfa00390_view_balance.Call("SELECT");
         else  
            data_fpfa00390_search_out.Call("SELECT");
          
     }
                        
}

//=========================================================================================================

function OnChangeType()
{
    var tab_IN       = document.all("tbl_IN");    
    var tab_OUT      = document.all("tbl_OUT");    
    var tab_Balance      = document.all("tbl_Balance");  
    if ( lstType.value == 1 )
    {
        tab_IN.style.display = "";
        tab_IN.style.zIndex = 11111;
        tab_OUT.style.display      	= "none";
       
    }    
    else
    {
        tab_IN.style.display      	= "none";
        tab_OUT.style.zIndex= 11111;
        tab_OUT.style.display      	= "";
       
    }
    if(rbView.value == 2)
    {
        tab_IN.style.display      	= "none";
        tab_OUT.style.display      	= "none";
        tab_Balance.style.display      	= "";
        
    }
    else
         tab_Balance.style.display      	= "none";
     OnSearch();  
}
//=========================================================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;            
        case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0];
                    txtProjectCode.text =  oValue[1];
                    txtProjectName.text   = oValue[2];
                }
        break;           
    }	       
}

//=================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G2_WI_QTY)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    //----------------
    return true;
}
//=================================================================================
function OnPrint()
{    
    if(txtMasterPK.text != "")
    {
        var url =System.RootURL + '/reports/bi/ni/rpt_bini00030.aspx?p_from_dt=' + dtFromSearch.value ;
	    System.OpenTargetPage(url); 
	}
	else
	{
	    alert("Pls select one slip.");
	}
}
//==================================================================================
function OnReport()
{
	var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00390.aspx?p_from_date='+ dtFromSearch.value + '&p_project_pk=' + txtProjectPK.text + '&p_project_code=' + txtProjectCode.text + '&p_project_nm=' + txtProjectName.text;
	window.open(url, "_blank"); 
}
//================================================================================================
</script>

<body>
    <!--============================================= Search In=====================================-->
    <gw:data id="data_fpfa00390_search_in" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso type="grid"	parameter="0,1,2,3,4,5,6,7"	function="<%=l_user%>lg_sel_fpfa00390"	>	
				<input>
				    <input	bind="lstType"	/>
				    <input	bind="dtFromSearch"	/>
				    <input	bind="dtToSearch"	/>
				    <input	bind="txtProjectPK"	/>
				    <input	bind="lstLine"	/>
				    <input	bind="txtSlipNo"	/>	
				    <input	bind="txtIDMKSearch"	/>
				    <input	bind="rbView"	/>		
				</input>	
				<output	bind="grdSearchIn"	/>	
			</dso>	
		</xml>	
	</gw:data>
	
	  <!--============================================= Search Out=====================================-->
    <gw:data id="data_fpfa00390_search_out" onreceive="OnDataReceive(this)" >	
		<xml>	
			<dso type="grid"	parameter="0,1,2,3,4,5,6,7"	function="<%=l_user%>lg_sel_fpfa00390"	>	
				<input>
				    <input	bind="lstType"	/>
				    <input	bind="dtFromSearch"	/>
				    <input	bind="dtToSearch"	/>
				    <input	bind="txtProjectPK"	/>
				    <input	bind="lstLine"	/>
				    <input	bind="txtSlipNo"	/>	
				    <input	bind="txtIDMKSearch"	/>
				    <input	bind="rbView"	/>	
				</input>	
				<output	bind="grdSearchOut"	/>	
			</dso>	
		</xml>	
	</gw:data>
	
	  <!--============================================= View Balance=====================================-->
    <gw:data id="data_fpfa00390_view_balance" onreceive="OnDataReceive(this)" >	
		<xml>	
			<dso type="grid"	parameter="0,1,2,3,4,5,6,7"	function="<%=l_user%>lg_sel_fpfa00390"	>	
				<input>
				    <input	bind="lstType"	/>
				    <input	bind="dtFromSearch"	/>
				    <input	bind="dtToSearch"	/>
				    <input	bind="txtProjectPK"	/>
				    <input	bind="lstLine"	/>
				    <input	bind="txtSlipNo"	/>	
				    <input	bind="txtIDMKSearch"	/>
				     <input	bind="rbView"	/>	
				</input>	
				<output	bind="grdViewBalance"	/>	
			</dso>	
		</xml>	
	</gw:data>
	
	
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 5%">
                            Type
                        </td>
                        <td style="width: 5%">
                            <gw:list id="lstType" styles="width:100%" onchange="OnChangeType()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 5%">
                            <gw:datebox id="dtFromSearch" lang="1" />
                            ~
                            <gw:datebox id="dtToSearch" lang="1" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Project" onclick="OnPopUp('Project')" href="#tips" style="color=#0000ff"><b>
                                Project</b></a>
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtProjectPK" styles="display:none" />
                            <gw:textbox id="txtProjectCode" styles="display:none" />
                            <gw:textbox id="txtProjectName" styles="width:100%" />
                        </td>
                        <td style="width: 2%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Line
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstLine" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="right">
                            SlipNo
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtSlipNo" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%">
                            IDMK/Mark/Item
                        </td>
                        <td style="width: 48%">
                            <gw:textbox id="txtIDMKSearch" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 2%">
							<gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr tyle="height: 2%">
                    <td colspan="4">
                        <gw:radio id="rbView" value="0" onchange="OnChangeType()"> 
                            <span value="0">View log</span>
                            <span value="1">View Sumarry</span>
                            <span value="2">View Cutting Balance</span>
                        </gw:radio>
                    </td>
                    <td colspan="3" align="right" style="width: 5%; white-space: nowrap">
                         <gw:label id="lblRecord" styles="color: red">row(s)</gw:label>
                    </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="7">                     
                            <table id="tbl_IN" style="width:100%; height:100%;overflow:visible;">
                                <tr>
                                    <td>
                                        <gw:grid id='grdSearchIn' header='_tlg_fa_cut_wi_m_pk|Wi Fr Date|Wi To Date|Slip NO|PL NM|_tlg_fa_cut_wi_d_pk|Line Name|DWG NO|IDMK|Mark|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Wi Qty|_Item BC|Result Qty'
                                            format='1|4|4|0|0|1|0|0|0|0|0|0|0|0|0|0|1|0|1' aligns='0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|1|0'
                                            check='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1200|1200|1200|1000|1000|1000|1300|1000|1000|3000|1000|1000|1000|1000|1000|1300|1200|1300'
                                            sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table id="tbl_OUT" style="display: none;width:100%; height:100%; overflow:visible;">
                                <tr>
                                    <td>
                                        <gw:grid id='grdSearchOut' header='_TLG_FA_CUT_OUTREQ_M_PK|Req Fr Date|Req To Date|Slip NO|PL NM|_TLG_FA_CUT_OUTREQ_D_PK|Line Name|DWG NO|IDMK|Mark|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Req Qty|_Item BC|_Doc Date|_Lenght Qty|_Weight Qty|_Material|_Bom Qty|_Item Name|Result Qty'
                                            format='1|4|4|0|0|1|0|0|0|0|0|0|0|0|0|1|0|4|1|1|0|1|0|1' aligns='0|0|0|0|1|0|1|0|0|0|0|0|0|0|0|0|1|0|2|2|0|2|1|0'
                                            check='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            widths='1000|1300|1300|1200|1200|1000|1000|1200|1000|1000|3000|1000|1000|1000|1000|1000|1200|1200|1200|1200|1000|1000|1200|1000'
                                            sorting='T' styles='width:100%; height:100%;' />
                                    </td>
                                </tr>
                            </table>
                             <table id="tbl_Balance" style="display: none;width:100%; height:100%; overflow:visible;">
                                <tr>
                                    <td>
                                        <gw:grid id='grdViewBalance'
                                        header='Wi Fr Date|Wi To Date|Slip NO|PL NM|Line Name|DWG NO|IDMK|MARK|Item Name|Spec 01|Spec02|Spec 03|Spec 04|Spec 05|Wi Qty|Result Qty|Balance|Out Result|Date|Employee'
                                        format='4|4|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|4|0'
                                        aligns='0|0|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|1|1'
                                        check='|||||||||||||||||||'
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        widths='1200|1200|1000|1200|1000|1000|1000|1000|3500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1200|3000'
                                        sorting='T'
                                        styles='width:100%; height:100%'/>
                                    </td>
                                </tr>
                            </table>
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:list id="lstTransType" styles='width:100%;display: none' />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<gw:textbox id="txtLang" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->


</html>
