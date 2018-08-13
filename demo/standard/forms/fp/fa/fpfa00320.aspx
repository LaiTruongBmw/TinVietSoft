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

var G_WI_FR_DATE            = 0,
    G_WI_TO_DATE            = 1,
    G_SLIP_NO               = 2,
    G_PL_NM                 = 3,
    G_LINE_NAME             = 4,   
    G_DWG_NO                = 5,
    G_IDMK                  = 6,
    G_ITEM_NAME             = 7,
    G_SPEC_01               = 8,
    G_SPEC_02               = 9,
    G_SPEC_03               = 10,
    G_SPEC_04               = 11,
    G_SPEC_05               = 12,
    G_WI_QTY                = 13,
    G_RESULT_QTY            = 14,
    G_DESCRIPTION_D         = 15,
    G_DESCRIPTION_M         = 16,
    G_DOC_DATE              = 17,
    G_ITEM_BC               = 18,
    G_SEG                   = 19;
//-----------------------------------------------------

var flag;

    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

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

     OnChangeType();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = "";            
	 
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstLine.SetDataText(data); 
      
     
 }
 
//=========================================================================================================

function OnChangeType()
{
   OnSearch();
    
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
 //---------------------------------------------------------------------------------------------------
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fpfa00300_master.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;  
        case 'BOM':
            if(txtMasterPK.text != '')
            {
                var path = System.RootURL + "/form/fp/fa/fpfa00301.aspx?p_project_pk=" + txtProjectPK.text;
			    var object = System.OpenModal( path ,750 , 400 ,  'resizable:yes;status:yes');
			    if ( object != null )
			    {
 	                if ( object != null )
                    {
                        var arrTemp
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                //SEQ|ITEM_NAME|DWG_NO|IDMK|MARK|SPEC_01|SPEC_02|SPEC_03|SPEC_04|SPEC_05|BOM_QTY|MATERIAL                                
                                grdDetail.AddRow();                            
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1); 	
                                grdDetail.SetGridText( grdDetail.rows-1, G2_TLG_FA_CUT_WI_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME   ,   arrTemp[1]);                    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_DWG_NO      ,   arrTemp[2]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IDMK        ,   arrTemp[3]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_MARK        ,   arrTemp[4]);

                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_01     ,   arrTemp[5]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_02     ,   arrTemp[6]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_03     ,   arrTemp[7]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_04     ,   arrTemp[8]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_05     ,   arrTemp[9]);

                                grdDetail.SetGridText( grdDetail.rows-1, G2_WI_QTY      ,   arrTemp[10]);
                        }		            
                    }                     
			    }
            }
            else
            {
                alert("Pls select one slip.");
            }
        break;
    }
}  
//=============================================================================================
function OnSearch()
{
        data_fpfa00320_wiew.Call("SELECT");
        if ( grdView.rows>1 )     
	        lblRecord.text = grdView.rows - 1 + ' row(s)';           
	    else
	        lblRecord.text =  '0 row(s)';
    
}
//=============================================================================================
function OnDataReceive(obj)
{
    if ( grdView.rows>1 )
	     {
	         lblRecord.text = grdView.rows - 1 + ' row(s)';
	         grdView.SetCellBold( 1, G_WI_QTY, grdView.rows - 1, G_WI_QTY,   true);
             grdView.SetCellBold( 1, G_RESULT_QTY, grdView.rows - 1, G_RESULT_QTY,   true);      
             grdView.SetCellBgColor( 1, G_WI_QTY, grdView.rows - 1, G_WI_QTY, 0x99FFFF );  
             grdView.SetCellBgColor( 1, G_RESULT_QTY, grdView.rows - 1, G_RESULT_QTY, 0x99FFFF );    
        }            
	    else
	        lblRecord.text =  '0 row(s)'; 
}
//--------------------------------------------------------------------------------------------------
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
                    txtProjectName.text   = oValue[2];
                }
        break;           
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {

    }
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_fpfa00300_master.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fpfa00300_detail.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G1_REQ_UOM || event_col == G1_IN_UOM )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 else if ( event_col == G1_IN_ITEM_CODE || event_col == G1_IN_ITEM_NAME )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_INCOME_ITEM_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_IN_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G1_IN_ITEM_NAME,   object[2] );
                       }                       
                 }
            break;             
      }         
}   

//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_fpfa00300_master.StatusDelete();
                data_fpfa00300_master.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_TLG_FA_CUT_WI_D_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
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
        var url =System.RootURL + '/reports/bi/ni/rpt_bini00030.aspx?p_master_pk=' + txtMasterPK.text ;
        //var url =System.RootURL + '/reports/ep/fm/rpt_bini00030_multi.aspx?master_pk=' + txtMasterPK.text ;
	    window.open(url, "_blank"); 
	}
	else
	{
	    alert("Pls select one slip.");
	}
}
//==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00300.aspx?master_pk=' + txtMasterPK.text ;
	window.open(url, "_blank"); 
}
//================================================================================================
</script>
<body>
     <!--============================================= View Log Or View Summary=====================================-->
    <gw:data id="data_fpfa00320_wiew" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso type="grid"	parameter="0,1,2,3,4,5,6"	function="<%=l_user%>lg_sel_fpfa00320"	>	
				<input bind="grdView">
				    <input	bind="rbType"	/>
				    <input	bind="dtFromSearch"	/>
				    <input	bind="dtToSearch"	/>
				    <input	bind="txtProjectPK"	/>
				    <input	bind="lstLine"	/>
				    <input	bind="txtSlipNo"	/>	
				    <input	bind="txtIDMKSearch"	/>	
				</input>	
				<output	bind="grdView"	/>	
			</dso>	
		</xml>	
	</gw:data>
	
	
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td id="Td1" style="width: 30%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 2%">
                                    <td style="width: 5%">
                                        Type
                                    </td>
                                    <td style="width: 5%">
                                        <gw:radio id="rbType" value="0" onchange="OnChangeType()"> 
		                                    <span value="0">View log</span>
		                                    <span value="1">Sumarry</span>
		                                    </gw:radio>
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
                                        <gw:textbox id="txtProjectName" styles="width:100%" />
                                    </td>
                                    <td style="width: 2%">
                                        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
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
                                
                                <td colspan="7" align="right" style="width: 5%; white-space: nowrap">
                                     <gw:label id="lblRecord" styles="color: red">row(s)</gw:label>
                                </td>
                                <tr style="height: 96%">
                                    <td colspan="7">
                                        <table id="tbl_View" style="width: 100%; height: 100%; overflow: visible;">
                                            <tr>
                                                <td>
                                                    <gw:grid id='grdView'
                                                        header='Wi Fr Date|Wi To Date|Slip NO|PL NM|Line Name|DWG NO|IDMK|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Wi Qty|Result Qty|_DESCRIPTION_D|_DESCRIPTION_M|_DOC_DATE|_ITEM_BC|_SEQ'
                                                        format='4|4|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|4|0|0'
                                                        aligns='1|1|0|0|1|1|1|1|0|0|0|0|0|2|2|1|1|1|0|0'
                                                        check='|||||||||||||||||||'
                                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                        widths='1200|1200|1000|1000|1200|1000|1000|3000|1000|1000|1000|1000|1000|1000|1200|2000|2000|1200|1000|1000'
                                                        sorting='T'styles='width:100%; height:100%;'
                                                        />
                                                </td>
                                            </tr>
                                        </table>
                                       
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
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
<gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
<gw:textbox id="txtLang" styles='width:100%;display:none' />
<gw:textbox id="txtItemCD_Search" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtItemNM_Search" maxlen="100" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
<gw:grid id="grdItem_Search" header="pk|item_cd|item_nm" format="0|0|0" aligns="0|0|0"
    defaults="||" editcol="1|1|1" widths="0|0|0" styles="width:100%; height:200;display:none"
    sorting="F" param="0,1,2" />
<!--------------------------------------------------------------------------------->
<gw:textbox id="txtNumReqQty" styles='width:100%;display:none' />
<gw:textbox id="txtNumQTy" styles='width:100%;display:none' />
<gw:textbox id="txtNumPrice" styles='width:100%;display:none' />
<gw:textbox id="txtNumItemAmt" styles='width:100%;display:none' />
<gw:textbox id="txtNumRate" styles='width:100%;display:none' />
<gw:textbox id="txtNumTaxAmt" styles='width:100%;display:none' />
<gw:textbox id="txtNumTotalAmt" styles='width:100%;display:none' />
<gw:textbox id="txtMaskReqQty" styles='width:100%;display:none' />
<gw:textbox id="txtMaskQTy" styles='width:100%;display:none' />
<gw:textbox id="txtMaskPrice" styles='width:100%;display:none' />
<gw:textbox id="txtMaskAmount" styles='width:100%;display:none' />
<gw:textbox id="txtMaskRate" styles='width:100%;display:none' />
<gw:textbox id="txtMaskVatAmt" styles='width:100%;display:none' />
<gw:textbox id="txtMaskTotalAmt" styles='width:100%;display:none' />
</html>
