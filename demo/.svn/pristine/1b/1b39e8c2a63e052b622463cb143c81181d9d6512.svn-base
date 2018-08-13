<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>MATERIAL EXPENSE SLIP ENTRY</title>
</head>

<script type="text/javascript" language="javascript">
var flag;

var G_TLG_CO_CC_ALLO_SLIP_M_PK  = 0,
    G_SLIP_DATE                 = 1,
    G_SLIP_NO                   = 2,
    G_TLG_CO_CC_ALLO_RULE_M_PK  = 3,
    G_RULE_NAME                 = 4,
    G_STATUS                    = 5;
 
var G0_MASTER_PK	            = 0,
	G0_SLIP_NO		            = 1,
	G0_SLIP_DATE		        = 2,	 
	G0_STATUS	                = 3,
	G0_TLG_CO_CC_ALLO_RULE_M_PK = 4,
	G0_TLG_CO_CC_ALLO_RULE_M_ID = 5,
	G0_TLG_CO_CC_ALLO_RULE_M_NM = 6,
	G0_CHARGER_PK		        = 7,
	G0_FULL_NAME                = 8,
	G0_REF_NO                   = 9,
	G0_SLIP_AMOUNT              = 10,
	G0_DESCRIPTION              = 11;

var G1_TLG_CO_CC_ALLO_SLIP_M_PK     = 0,
    G1_TLG_CO_CC_ALLO_SLIP_D_PK     = 1,
    G1_SEQ                          = 2,
    G1_TLG_CO_COST_CENTER_PK        = 3,
    G1_CENTER_ID                    = 4,
    G1_CENTER_NAME                  = 5,
	G1_ALLO_VALUE		            = 6,    
	G1_ALLO_QTY 		            = 7,
    G1_TOTAL_VALUE                  = 8,
	G1_ALLO_AMOUNT                  = 9,
    G1_DESCRIPTION                  = 10;
	
var arr_FormatNumber = new Array();	
        
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="70%";
                imgArrow.src = "../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}
 
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtChargerName.SetReadOnly(true);
	txtSlipNo.SetReadOnly(true);
	txtRuleID.SetReadOnly(true);
	txtRuleNM.SetReadOnly(true);
	dtSearchSlipFrom.SetDataText(System.AddDate(dtSearchSlipFrom.GetData(), -30));
	
	FormFormat();   
	OnAddNew();      
}
//=================================================================================
function FormFormat()
{  
     var data="";  	
   
     //--------STATUS
     data = "data|1|SAVED|2|SUBMITED|3|APPROVED|4|CANCEL||-";
     lstSearchStatus.SetDataText(data); 
     lstSearchStatus.value = '';
	 
	 //grdDetail.GetGridControl().ColFormat(G1) = "###,###,###.##";  
	 
	 //arr_FormatNumber[G1_ADJ_AMOUNT] = 2;
}

//==============================================================================

function CheckInput()
{  
    if(!Number(txtSlipAmt.text))
    { 
        alert("Slip Amount must be numeric"); 
        txtSlipAmt.text = ""; 
        return; 
    }
    var total = 0;
    for(var i = 1; i < grdDetail.rows; i++)
    {
        var allo_value  = grdDetail.GetGridData(i,G1_ALLO_VALUE) ;
        var allo_qty    = grdDetail.GetGridData(i,G1_ALLO_QTY) ;
        
        if(Number(allo_value) && Number(allo_qty))
        {
            grdDetail.SetGridText( i, G1_TOTAL_VALUE, allo_value * allo_qty);
        }
        else
        {
            if(!Number(allo_value))grdDetail.SetGridText( i, G1_ALLO_VALUE, "") ;
            if(!Number(allo_qty))grdDetail.SetGridText( i, G1_ALLO_QTY, "") ;
            grdDetail.SetGridText( i, G1_TOTAL_VALUE, "");
        }
        total +=  Number(grdDetail.GetGridData(i,G1_TOTAL_VALUE)) ;      
    }
    for(var i = 1; i < grdDetail.rows; i++)
    {
        var total_value = grdDetail.GetGridData(i, G1_TOTAL_VALUE) ;
        
        if(Number(total_value))
        {
            grdDetail.SetGridText( i, G1_ALLO_AMOUNT, (Number(txtSlipAmt.text)/total)*total_value) ;
        }
        else
        {
            grdDetail.SetGridText( i, G1_ALLO_AMOUNT, "");
        }
    }
}
 
//=================================================================================
function OnAddNew()
{
    if ( data_bico00060_1.GetStatus() != 20 )
    {
        data_bico00060_1.StatusInsert();
        txtSlipNo.SetDataText("**New Slip No**") ;
        grdDetail.ClearData();
       
        txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
     	txtChargerName.text = "<%=Session("USER_NAME")%>"  ;
        //----------------     
        flag = "view";                          
    }
    else
    {
        alert("Already add new. Pls input data !!!");
    }	
}
//=================================================================================
function OnSave(obj)
{ 
    if(obj == 'Master' )
    {
        flag='save';
        data_bico00060_1.Call();
    }    
    else if(obj == 'Detail')
    {
        data_bico00060_2.Call();
    }
}
//=================================================================================
function CheckBeforeSave()
{
	if ( txtDeprSDID.text == '' )
	{
		alert("PLS SELECT DEPR SD FIRST !");
		return false;
	}
	
	return true;
}
//=================================================================================
function OnCopy()
{
}
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_bico00060': //SEARCH
            for ( var i=0; i<grdSearch.rows; i++)
            {
                    if ( grdSearch.GetGridData( i, G_STATUS) == 2 )
                    { 
                        grdSearch.SetCellBgColor( i, G_STATUS, i, G_STATUS, 0xCCFFFF );
                    } 
					else if ( grdSearch.GetGridData( i, G_STATUS) == 3 ) 
					{
						grdSearch.SetCellBgColor( i, G_STATUS, i, G_STATUS, 0xFFFFCC );
					}
					else if ( grdSearch.GetGridData( i, G_STATUS) == 4 ) 
					{
						grdSearch.SetCellBgColor( i, G_STATUS, i, G_STATUS, 0xFFCCFF );
					}  
            }     
        break;
		
        case 'data_bico00060_1': //MASTER
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_TLG_CO_CC_ALLO_SLIP_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_TLG_CO_CC_ALLO_SLIP_M_PK, txtMasterPK.text);
                    }    
                }                
                OnSave('Detail');  
            } 
            else
            {
                data_bico00060_2.Call('SELECT'); 
            }    
        break;
        
		case 'data_bico00060_2':
			if ( grdDetail.rows > 1 )
			{
				grdDetail.SetCellBold( 1, G1_CENTER_ID, grdDetail.rows - 1, G1_CENTER_ID, true);
				//grdDetail.SetCellBold( 1, G1_ADJ_AMOUNT, grdDetail.rows - 1, G1_ADJ_AMOUNT, true);
				//grdDetail.SetCellBgColor( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_NAME, 0xCCFFFF );
			}
		break;
        case 'pro_bico00060': // SUBMIT
            alert(txtValueReturn.text);
        break;
    }  
}
//=================================================================================
function OnDelete(pos) 
{
    switch (pos)
    {
        case 'Master':// delete master
            if ( confirm('Do you want to delete this slip?'))
            {
                flag='delete';
                data_bico00060_1.StatusDelete();
                data_bico00060_1.Call();
            }   
        break;
 		
		case 'Detail':
			if ( grdDetail.GetGridData( grdDetail.row, G1_TLG_CO_CC_ALLO_SLIP_D_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {   
                grdDetail.DeleteRow();
            }   		
		break;
    }      
}
//==============================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

function OnAddDetail()
{
     grdDetail.AddRow();  
}
//=================================================================================
function OnSearch(pos)
{ 
    switch(pos)
    {
        case 'grdSearch':
            data_bico00060.Call('SELECT');
        break;
		
        case 'Master':
			if ( grdSearch.row > 0 )
			{
            	txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G0_MASTER_PK);
			
           	 	data_bico00060_1.Call('SELECT');
			}	
        break;
    }
}  
//========================================================================================
function OnAllocate()
{
    if(confirm("Would you like to allocate automatically?"))
    {
        pro_bico00060_1.Call();
    }
}
//========================================================================================
function OnSubmit()
{
    if(txtMasterPK.text != '')
    {
        pro_bico00060.Call();
    }
}
//========================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;    
		
        case 'CostCenter':
            var path = System.RootURL + '/form/fp/ab/fpab00630.aspx';
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if ( object != null )
	        {
                  for( var i=0; i < object.length; i++)	  
                  {	
                    var arrTemp = object[i];

                    grdDetail.AddRow();  
                    grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);   	    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_CO_COST_CENTER_PK, arrTemp[3]);
                    grdDetail.SetGridText( grdDetail.rows-1, G1_CENTER_ID, arrTemp[4]);
                    grdDetail.SetGridText( grdDetail.rows-1, G1_CENTER_NAME, arrTemp[5]);
                 }		            
	        }
        break; 

        case 'CostCenter':
            var path = System.RootURL + '/form/fp/ab/fpab00630.aspx';
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if ( object != null )
	        {
                  for( var i=0; i < object.length; i++)	  
                  {	
                    var arrTemp = object[i];

                    grdDetail.AddRow();  
                    grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);   	    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_CO_COST_CENTER_PK, arrTemp[3]);
                    grdDetail.SetGridText( grdDetail.rows-1, G1_CENTER_ID, arrTemp[4]);
                    grdDetail.SetGridText( grdDetail.rows-1, G1_CENTER_NAME, arrTemp[5]);
                 }		            
	        }
        break;
 		
    }	       
}
//=================================================================================
</script>

<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_bico00060" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>lg_sel_bico00060"	>	
				<input>
					<input	bind="txtSearchSlip"	/>	
					<input	bind="lstSearchStatus"	/>	
					<input  bind="txtSearchCostCenter" />					 			
					<input  bind="dtSearchSlipFrom" />
					<input  bind="dtSearchSlipTo" />
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Master =====================================-->
    <gw:data id="data_bico00060_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8,9,10,11"	function="<%=l_user%>lg_sel_bico00060_1"	procedure="<%=l_user%>LG_UPD_bico00060_1">	
				<input>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="txtSlipNo"	/>	
						<inout	bind="dtSlipDate"	/>
						<inout	bind="lblStatus"	/>	
						<inout	bind="txtRulePK"	/>
						<inout	bind="txtRuleID"	/>
						<inout	bind="txtRuleNM"	/>
						<inout	bind="txtChargerPK"	/>											
						<inout	bind="txtChargerName"	/>
						<inout	bind="txtRefNo"	/>
						<inout	bind="txtSlipAmt"	/>												 						 
						<inout	bind="txtDesc"	/>				 											 
				</input>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_bico00060_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_bico00060_2" procedure="<%=l_user%>LG_UPD_bico00060_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Submit =====================================-->
    <gw:data id="pro_bico00060" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>LG_PRO_bico00060"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
     <!--============================================= Submit =====================================-->
    <gw:data id="pro_bico00060_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_bico00060_2"> 
                <input> 
			        <input bind="dtSlipDate" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 35%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td style="width: 60%">
                            <gw:textbox id="txtSearchSlip" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 35%" colspan="2">
                            <gw:list id="lstSearchStatus" styles="width:100%" onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Cost Center
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:textbox id="txtSearchCostCenter" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip Date
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="2">
                            <gw:datebox id="dtSearchSlipFrom" lang="1" width="100%" />
                            ~
                            <gw:datebox id="dtSearchSlipTo" lang="1" width="100%" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' header='_PK|Slip Date|Slip No|_PK|Rule Name|Status' format='0|4|0|0|0|0'
                                aligns='0|0|0|0|0|1' check='|||||' editcol='1|1|1|1|1|1' widths='0|1200|1000|0|1500|1000'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 10%; white-space: nowrap">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle('1')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" styles='width:100%' />
                        </td>
                        <td style="width: 5%">
                            Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtSlipDate" lang="1" width="10%" />
                        </td>
                        <td style="width: 25%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                         <td align="right" style="width: 1%">
                            <gw:icon id="idBtnAuto" img="2" text="Allocate" styles='width:15%' onclick="OnAllocate()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:15%' onclick="OnSubmit()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew('')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF" border="0">
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                            Charger</b></a>
                                    </td>
                                    <td style="width: 55%">
                                        <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtChargerName" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ref No
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtRefNo" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Rule
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtRulePK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtRuleID" styles='width:30%' />
                                        <gw:textbox id="txtRuleNM" styles='width:70%' />
                                    </td>
                                    <td style="white-space: nowrap">
                                        Slip Amount
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtSlipAmt" styles='width:100%' type="number" format="###,###.##"
                                            onblur="CheckInput()" />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Desc
                                    </td>
                                    <td style="width: 95%" colspan="3">
                                        <gw:textbox id="txtDesc" styles='width:100% ' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 96%; white-space: nowrap" align="center">
                                    </td>
									<td style="width: 1%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="new" id="btnNew2" onclick="OnPopUp('Mapping')" />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="new" id="btnNew2" onclick="OnPopUp('CostCenter')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 94%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_tlg_co_cc_allo_slip_m_pk|_pk|Seq|_tlg_co_cost_center_pk|Center ID|Center Name|Allo Value|Allo Qty|Total Value|Allo Amount|Description'
                                format='0|0|0|0|0|0|1|1|1|1|0' aligns='0|0|1|0|0|0|0|0|0|0|0' check='||||||n||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1' widths='0|0|600|0|1200|2000|1200|1200|1200|1800|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
