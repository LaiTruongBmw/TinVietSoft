<!--	#include	file="../../../system/lib/form.inc"	-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>OQC Result Approve Popup</title>
</head>
<%	ESysLib.SetUser("prod")%>

<script>
var	flag;
//-------------------
var	G1_DETAIL_PK			=	0,
	G1_MASTER_PK		    =	1,
	G1_COMP_PK				=	2,
	G1_COMP_ID				=	3,
	G1_COMP_NAME	        =	4,
	G1_SPEC01_PK			=	5,
	G1_SPEC01_ID			=	6,
	G1_SPEC02_PK			=	7,
	G1_SPEC02_ID			=	8,
	G1_SPEC03_PK			=	9,
	G1_SPEC03_ID			=	10,
	G1_SPEC04_PK			=	11,
	G1_SPEC04_ID			=	12,
	G1_SPEC05_PK			=	13,
	G1_SPEC05_ID			=	14,	
	G1_QC_QTY				=	15,
	G1_DEF_QTY				=	16;
	
var flag;
var	arr_FormatNumber	=	new	Array();		
//---------------------------------------------------------------------	

function	OnToggle()
{
	var	left	=	document.all("left");	
	var	right	=	document.all("right");	
	var	imgArrow	=	document.all("imgArrow");	

	if(imgArrow.status	==	"expand"){
	left.style.display="none";
	imgArrow.status	=	"collapse";
	right.style.width="100%";
	imgArrow.src	=	"../../../system/images/button/next.gif";
	}
	else{
	left.style.display="";
	imgArrow.status	=	"expand";
	right.style.width="75%";
	imgArrow.src	=	"../../../system/images/button/previous.gif";
	}
}

//-------------------------------------------------------------------

function	BodyInit()
{
	txtUser_PK.text	= "<%=session("USER_PK")%>";	
	//----------------------------------	
	txtSlipNo.SetEnable(false);
	txtRefNo.SetEnable(false);
	txtStyleName.SetEnable(false);
	txtChargerName.SetEnable(false);
	txtEmpName.SetEnable(false);
	//-------------------------
	SetGridFormat();
	BindingDataList();	
	OnSearch('header');
	OnHiddenGrid();	 
	//----------------------------------
	txtMasterPK.text = "<%=Request.querystring("trans_pk")%>";
}
//---------------------------------------------------------------------	
	function	BindingDataList()
	{	
		var	data	=	"";	
		
		data	=	"<%=ESysLib.SetListDataSQL(" select pk, type_id || ' - ' || type_name  from prod.qc_defect_type where del_if = 0  order by type_id"	)%>||Select ALL";	
		lstDefectGroup.SetDataText(data);	
		lstDefectGroup.value = '' ;	
		//-----------------------		
		data	=	"<%=ESysLib.SetListDataSQL(" SELECT	pk,	line_name FROM prod.pb_line	WHERE del_if	=	0	order	by	2"	)%>||";	
		lstLine.SetDataText(data);
		lstLine.value = '';		
	}
	//---------------------------------------------------------------------------------------------------
	function	SetGridFormat()
	{
		var	ctr	=	grdDetail.GetGridControl();	
	
		ctr.ColFormat(G1_QC_QTY)  =	"#,###,###,###,###,###";
		ctr.ColFormat(G1_DEF_QTY) =	"#,###,###,###,###,###";
	}
	//===================================================================
function	OnSearch(pos)
{
	switch(pos)
	{
		case 'header':
			data_fpfo00131_header.Call('SELECT');
		break;
				
		case 'grdSearch':
			data_fpfo00131.Call('SELECT');
		break;
		
		case 'grdMaster':
			data_fpfo00131_1.Call('SELECT');
		break;
		
		case 'grdDefect':
			if	(grdDetail.row	>	0)
			{
				txtDetailPK.text = grdDetail.GetGridData(	grdDetail.row,	G1_DETAIL_PK);
				data_fpfo00131_3.Call('SELECT');
			}
		break;
	}
}
//=========================================================================
function OnGridCellClick()
{
    if(grdDetail.row > 0)
    {
        txtDetailPK.text = grdDetail.GetGridData(	grdDetail.row,	G1_DETAIL_PK);
        data_fpfo00131_3.Call('SELECT');
    }
}
//=========================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G1_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = true ;
} 
//======================================================================
function	OnDataReceive(obj)
{
	switch(obj.id)
	{
	  		case 'data_fpfo00131_header':				
				if(grdHeader.rows>1)
	            {
	                var col1=grdHeader.GetGridData(1,2);
	                var dis_col1=grdHeader.GetGridData(1,3);
	                var col2=grdHeader.GetGridData(1,4);
	                var dis_col2=grdHeader.GetGridData(1,5);
	                var col3=grdHeader.GetGridData(1,6);
	                var dis_col3=grdHeader.GetGridData(1,7);
	                var col4=grdHeader.GetGridData(1,8);
	                var dis_col4=grdHeader.GetGridData(1,9);
	                var col5=grdHeader.GetGridData(1,10);
	                var dis_col5=grdHeader.GetGridData(1,11);
	                if(dis_col1!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC01_ID,col1);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC01_ID) = false ;
	                    
	                }
	                if (dis_col2!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC02_ID,col2);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC02_ID) = false ;
	                    
	                }
	                if (dis_col3!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC03_ID,col3);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC03_ID) = false ;
	                    
	                }
	                if (dis_col4!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col4);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = false ;
	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col5);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = false ;	                    
	                }
				}
				OnSearch('grdMaster');
				break;				
			case 'data_fpfo00131_1':
			
			 	if ( flag == 'save')
            	{
					for(var i=0; i < grdDetail.rows;i++)
					{
						if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
						{
							grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
						}    
					}
					
					data_fpfo00131_2.Call();					
				}
            	else
            	{
                	data_fpfo00131_2.Call('SELECT');  
            	}					
			break;
			
			case 'data_fpfo00131_2':
				if(grdDetail.rows > 1)
				{
					grdDetail.SelectRow(1);
					txtDetailPK.text = grdDetail.GetGridData(1 , G1_DETAIL_PK);
					data_fpfo00131_3.Call('SELECT');
				}	
				
				flag = '';						
			break;
			
			case 'pro_fpfo00131':
            	alert(txtReturnValue.text);
				window.returnValue = 1; 
				this.close();
        	break; 
	}
}
//======================================================================
function OnProcess()
{
	if ( confirm('Do you want to approve?'))
	{
		pro_fpfo00131.Call();
	} 	
}

//======================================================================
</script>

<html>
<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpfo00131_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="PROD.sp_sel_fpfo00131_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------Master---------------------------------------->
    <gw:data id="data_fpfo00131_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8,9,10,11"	function="PROD.sp_sel_fpfo00131_1"	procedure="PROD.sp_upd_fpfo00131_1">	
				<inout>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="dtQcDate"	/>
						<inout	bind="txtSlipNo"	/>
						<inout	bind="txtOrdPlanPK"	/>
						<inout	bind="txtRefNo"	/>
						<inout	bind="lstLine"	/>
						<inout	bind="txtChargerPK"	/>
						<inout	bind="txtChargerName"	/>
						<inout	bind="txtEmpPK"	/>
						<inout	bind="txtEmpName"	/>
						<inout	bind="txtDesc"	/>
						<inout	bind="txtStylePK"	/>				
						<inout	bind="txtStyleName"	/>	
						<inout	bind="lblStatus"	/>						
				</inout>
			</dso>	
		</xml>	
	</gw:data>
    <!--------------------Detail----------------------------------->
    <gw:data id="data_fpfo00131_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="PROD.sp_sel_fpfo00131_2" procedure="PROD.sp_upd_fpfo00131_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--------------------Defect----------------------------------------->
    <gw:data id="data_fpfo00131_3" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7" function="PROD.sp_sel_fpfo00131_3" procedure="PROD.sp_upd_fpfo00131_3">	
				<input	bind="grdDefect">					
					<input	bind="txtDetailPK"	/>	
					<input	bind="lstDefectGroup"	/>
				</input>	
				<output	bind="grdDefect"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--------------------Process-------------------------------------------->
    <gw:data id="pro_fpfo00131" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="PROD.sp_pro_fpfo00131" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:	100%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            QC Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtQcDate" lang="1" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 41%; white-space: nowrap" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnApprove" img="2" text="Approve" styles='width:50%' onclick="OnProcess()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            Charger
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                        <td align="right">
                            Emp
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtEmpName" styles="width:100%" />
                            <gw:textbox id="txtEmpPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            P/O No
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtOrdPlanPK" styles="width:	100%;display:	none" />
                            <gw:textbox id="txtRefNo" styles="width:	100%" />
                        </td>
                        <td align="right">
                            Style
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtStylePK" styles="width:	100%;display:	none" />
                            <gw:textbox id="txtStyleName" styles="width:	100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            Line
                        </td>
                        <td colspan="3">
                            <gw:list id="lstLine" styles='width:100%' csstype="mandatory"" />
                        </td>
                        <td align="right">
                            Remark
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtDesc" styles="width:	100%" />
                        </td>
                    </tr>
                    <tr style="height: 96%; width: 100%">
                        <td colspan="10">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr style="height: 1%">
                                    <td>
                                    </td>
                                    <td>
                                        <table border="0" cellspacing="0" cellpadding="2" width="100%">
                                            <tr>
                                                <td style="width: 5%">
                                                    Group
                                                </td>
                                                <td style="width: 95%">
                                                    <gw:list id="lstDefectGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdDefect')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 65%">
                                        <gw:grid id='grdDetail' header='_pk|_qc_outgo_m_pk|_pt_component_pk|Comp ID|Comp Name|_spec01_pk|Spec 01|_spec02_pk|Spec 02|_spec03_pk|Spec 03|_spec04_pk|Spec 04|_spec05_pk|Spec 05|QC Qty|Def Qty'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            check='||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1' widths='0|0|0|1200|2000|0|1000|0|1000|0|1000|0|1000|0|1000|1000|1000'
                                            sorting='T' styles='width:100%; height:100%' oncellclick="OnGridCellClick()" />
                                    </td>
                                    <td style="width: 35%">
                                        <gw:grid id='grdDefect' header='Chk|_qc_outgo_def_PK|_QC_OUTGO_D_PK|_defect_PK|Defect ID|Defect Name|Def Qty|_Description'
                                            format='3|0|0|0|0|0|1|0' aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|1|1'
                                            widths='500|0|0|0|1000|2000|1100|200' sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtDetailPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtReturnValue" styles="width:	100%;display:	none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtUser_PK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtDefect" styles="width:	100%;display:	none" />
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
