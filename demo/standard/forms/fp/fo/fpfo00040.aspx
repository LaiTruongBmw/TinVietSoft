<!--	#include	file="../../../system/lib/form.inc"	-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>OQC Result Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var	flag;
//-------------------
var	G1_DETAIL_PK			=	0,
	G1_MASTER_PK		    =	1,
	G1_SEQ					=	2,
	G1_COMP_PK				=	3,
	G1_COMP_ID				=	4,
	G1_COMP_NAME	        =	5,
	G1_SPEC01_PK			=	6,
	G1_SPEC01_ID			=	7,
	G1_SPEC02_PK			=	8,
	G1_SPEC02_ID			=	9,
	G1_SPEC03_PK			=	10,
	G1_SPEC03_ID			=	11,
	G1_SPEC04_PK			=	12,
	G1_SPEC04_ID			=	13,
	G1_SPEC05_PK			=	14,
	G1_SPEC05_ID			=	15,	
	G1_QC_QTY				=	16,
	G1_DEF_QTY				=	17,
	G1_DESCRIPTION			=   18;
	
var flag;
var flag_defect;
var current_row_detai;
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
	var	now	=	new	Date();	
	var	lmonth,	ldate;
	
	ldate=dtFrom.value	;			
	ldate	=	ldate.substr(0,4)	+	ldate.substr(4,2)	+	'01'	;
	dtFrom.value=ldate	;
	//----------------------------------	
	txtSlipNo.SetEnable(false);
	txtRefNo.SetEnable(false);
	txtStyleName.SetEnable(false);
	txtChargerName.SetEnable(false);
	txtEmpName.SetEnable(false);
	//-------------------------
	SetGridFormat();
	BindingDataList();	
	
	OnHiddenGrid();	
	OnSearch('header'); 
	//----------------------------------	
	OnAddNew('Master');	
	
}
//---------------------------------------------------------------------	
	function	BindingDataList()
	{	
		var	data	=	"";	
		
		data	=	"<%=ESysLib.SetListDataSQL(" select pk, type_id || ' - ' || type_name  from tlg_qc_defect_type where del_if = 0  order by type_id"	)%>||Select ALL";	
		lstDefectGroup.SetDataText(data);	
		lstDefectGroup.value = '' ;	
		
		data	=	"DATA|1|SAVED|2|CONFIRMED|3|APPROVED|4|CANCEL||Select ALL";	
		lstStatus.SetDataText(data);	
		lstStatus.value = '' ;	
	}
	//---------------------------------------------------------------------------------------------------
	function	SetGridFormat()
	{
		var	ctr	=	grdDetail.GetGridControl();		
		ctr.Cell( 7, 0, G1_DEF_QTY, 0, G1_DEF_QTY) = 0x3300cc;
	}
	
//--------------------------------------------------------------------------------------------------
function	OnPopUp(pos)
{
	switch(pos)
	{
		case	'Plan_No':
			var path = System.RootURL + '/form/fp/ab/fpab00360.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
            if ( obj != null )
            {
			   txtOrdPlanPK.text = obj[0];
               txtRefNo.text     = obj[2];
               txtStylePK.text   = obj[5];
               txtStyleName.text = obj[7];
            }
		break;
		
		case	'Style':
			var path = System.RootURL + '/form/fp/ab/fpab00360.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
            if ( obj != null )
            {
			   txtOrdPlanPK.text  = obj[0];
               txtRefNo.text    = obj[2];
               txtStylePK.text   = obj[5];
               txtStyleName.text = obj[7];
            }
		break;		
		
		case	'Charger':
			var	path	=	System.RootURL	+	'/form/ch/ae/chae00010_search_emp.aspx';
			var	obj	=	System.OpenModal(	path	,800	,	600	,	'resizable:yes;status:yes');
			if	(	obj	!=	null	)
			{
				txtChargerName.text	=	obj[2];
				txtChargerPK.text	=	obj[0];
			}
		break;
		
		case	'Emp':
			var	path	=	System.RootURL	+	'/form/ch/ae/chae00010_search_emp.aspx';
			var	obj	=	System.OpenModal(	path	,800	,	600	,	'resizable:yes;status:yes');
			if	(	obj	!=	null	)
			{
				txtEmpName.text	=	obj[2];
				txtEmpPK.text	=	obj[0];
			}
		break;
		
		case	'Component':
		    if ( txtOrdPlanPK.text != '' ) 
			{
				var	path	=	System.RootURL	+	'/form/fp/fo/fpfo00044.aspx';
				var	object	=	System.OpenModal(	path	, 800	,	500	,	'resizable:yes;status:yes',this);
				if	(	object	!=	null	)
				{					
					var	arrTemp;
					for(	var	i=0;	i	<	object.length;	i++)		
					{	
						arrTemp	=	object[i];
						grdDetail.AddRow();							
						
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_MASTER_PK        ,	txtMasterPK.text);	//master_pk														
						
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_COMP_PK	    ,	arrTemp[0]);		
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_COMP_ID	    ,	arrTemp[1]);							
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_COMP_NAME	,	arrTemp[2]);	
						
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC01_PK	,	arrTemp[3]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC01_ID	,	arrTemp[4]);									
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC02_PK	,	arrTemp[5]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC02_ID	,	arrTemp[6]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC03_PK	,	arrTemp[7]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC03_ID	,	arrTemp[8]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC04_PK	,	arrTemp[9]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC04_ID	,	arrTemp[10]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC05_PK	,	arrTemp[11]);	
						grdDetail.SetGridText(	grdDetail.rows-1,	G1_SPEC05_ID	,	arrTemp[12]);								}
					    grdDetail.SelectRow(grdDetail.rows-1);	
					    flag = 'save';
				}	
			}
			else
			{
				alert("PLS SELECT P/O FIRST !");
			}
		break;
		
		case 'Process':		    
		    if(grdDetail.row > 0)
		    {
		        var path = System.RootURL + '/form/fp/fo/fpfo00041.aspx?p_master_pk=' + grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK);
		        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes',this);			        
		    }
		break;
	}			
}
//---------------------------------------------------------------------------------------------------
function	OnReport()	
{	
	if(txtMasterPK.text != '' && lblStatus.text == 'APPROVED')
	{
		var url = System.RootURL + "/reports/fp/fo/rpt_fpfo00130.aspx?master_pk="+txtMasterPK.text;
		System.OpenTargetPage(url); 
	}
	else
	{
		alert('The voucher must be approved !!!')
	}
}
//---------------------------------------------------------------------------------------------------
function	OnReport1()	
{	
	if(txtMasterPK.text != '' && lblStatus.text == 'APPROVED')
	{
		var url = System.RootURL + "/reports/fp/fo/rpt_fpfo00040.aspx?master_pk="+txtMasterPK.text+"&p_po=" + txtRefNo.text + "&p_style=" + txtStyleName.text + "&p_date=" + dtQcDate.value;
		System.OpenTargetPage(url); 
	}
	else
	{
		alert('The voucher must be approved !!!')
	}
}
//-======================================================
function	OnAddNew(pos)
{
		switch	(pos)
		{
			case	'Master':				
				data_fpfo00040_1.StatusInsert();		
				txtSlipNo.text	=	'***New Voucher***';							
				//-------------------------------------------
				txtChargerName.text	=	"<%=Session("USER_NAME")%>";
				txtChargerPK.text	=	"<%=Session("EMPLOYEE_PK")%>";
				
				txtEmpName.text			=	"<%=Session("USER_NAME")%>";
				txtEmpPK.text			=	"<%=Session("EMPLOYEE_PK")%>";
				//-------------------------------------------	
				grdDetail.ClearData();	
				grdDefect.ClearData();				
				flag = "save";
			break;	
		}
}
//======================================================================
function	OnSearch(pos)
{
	switch(pos)
	{
		case 'header':
			data_fpfo00040_header.Call('SELECT');
		break;
				
		case 'grdSearch':
			data_fpfo00040.Call('SELECT');
		break;
		
		case 'grdMaster':
			if	(	grdSearch.row	>	0	)
				{
					txtMasterPK.text	=	grdSearch.GetGridData(	grdSearch.row,	0	);
					data_fpfo00040_1.Call('SELECT');
				}
		break;
		
		case 'grdDefect':
			if	(grdDetail.row	>	0)
			{
				if(grdDetail.GetGridData(	grdDetail.row,	G1_DETAIL_PK) != '')
				{					
					data_fpfo00040_3.Call('SELECT');					
				}
			}
		break;
	}
}
//======================================================================
function	OnDelete(index)
{	
	switch(index)
	{
		case 'Master':
			if(confirm('Do you want to delete?'))
            {
                data_fpfo00040_1.StatusDelete();
                data_fpfo00040_1.Call();
            }  
		break;
		case 'Detail':
			if(confirm('Do you want to delete this Item?'))
			{
				if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == '' )
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
//======================================================================
function OnUnDelete()
{				
	grdDetail.UnDeleteRow();
}
//======================================================================
function OnCheckInput()
{
	for(var i = 1; i < grdDetail.rows; i++)
	{		
		var _def_qty = grdDetail.GetGridData( i, G1_DEF_QTY );
		if(Number(_def_qty) == 0)
		{
			alert("Please input data for column 'Def Qty' at row " + i) 
			return false;			
		}
	}
	return true;
}
//======================================================================
function OnSave(pos)
{	
	switch(pos)
	{
		case 'Master':
					if(flag == 'save')
					{
					    if(OnCheckInput())
						{
							flag = "save";
							data_fpfo00040_1.Call();  							  
						}	
					}
					else
					{
					    txtDetailPK.text = grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK);
						OnSave('Defect');
					}
		break;
				 
		case 'Defect':
			if(grdDetail.row > 0)
			{
			    flag = "";
				for(var i = 1; i < grdDefect.rows;i++)
				{
					if ( grdDefect.GetGridData( i, 0) == -1 )
					{
						grdDefect.SetGridText( i, 2, grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK));
					}
				}
				data_fpfo00040_3.Call();
			}
		break;
	}
}
//======================================================================
function	OnDataReceive(obj)
{
	switch(obj.id)
	{
	  		case 'data_fpfo00040_header':
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
	                    grdDetail.SetGridText(0,G1_SPEC04_ID,col4);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = false ;
	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col5);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = false ;
	                    
	                }					
				}	
				dso_wh_list.Call();				
			break;
				
			case 'data_fpfo00040':
				grdDetail.ClearData();
				grdDefect.ClearData();
			break;			
				
			case 'data_fpfo00040_1':			
			 	if ( flag == 'save')
            	{
					for(var i=1; i < grdDetail.rows;i++)
					{
						if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
						{
							grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
						}    
					}
					data_fpfo00040_2.Call();
				}
            	else
            	{
                	data_fpfo00040_2.Call('SELECT');  
            	}					
			break;
			
			case 'data_fpfo00040_2':
				    grdDetail.SetCellBold( 1, G1_QC_QTY , grdDetail.rows - 1, G1_QC_QTY , true);	
				    grdDetail.SetCellBold( 1, G1_DEF_QTY, grdDetail.rows - 1, G1_DEF_QTY, true);	
			        if(grdDetail.rows > 1 && grdDetail.row == -1)
					{
					    if(flag_defect != 'save')
					    {
						    grdDetail.SelectRow(1);
						    txtDetailPK.text = grdDetail.GetGridData(1 , G1_DETAIL_PK);
						    data_fpfo00040_3.Call('SELECT');	
					    }
					    else
					    {
					        data_fpfo00040_3.Call();
					    }
					}							
					else
					{				
						grdDefect.ClearData();
					}
			break;
			
			case 'data_fpfo00040_3':
			            if(flag_defect == 'save')
			            {
			                grdDetail.SelectRow(current_row_detai);
				            flag = '';
				            flag_defect = '';			                
			            }
			break;
			
			case 'dso_wh_list':            
				lstLine.SetDataText(txtWHStr.text);  								
			break; 
			
			case 'pro_fpfo00040':
            	alert(txtReturnValue.text);
            	OnSearch('grdMaster');
        	break; 
	}
}
//======================================================================
function OnGridCellClick(pos)
{
	switch(pos.id)
	{
		case 'grdDetail':
			if(grdDetail.row > 0)
			{   
			    var row = event.row
			    if(grdDetail.GetGridData(row , G1_DETAIL_PK) == '')
			    {
			        flag = "save";
			        grdDefect.ClearData();
			    }
			    else
			    {
			        if(txtDetailPK.text != '')
			        {
				        txtDetailPK.text = grdDetail.GetGridData( row, G1_DETAIL_PK);	
				        data_fpfo00040_3.Call('SELECT');
				    }
				}
				current_row_detai = row;
			}
		break;
	}
}
//======================================================================
function OnProcess()
{
	if ( confirm('Do you want to submit?'))
	{
		pro_fpfo00040.Call();
	} 	
}
//======================================================================
function OnSaveDetail(pos)
{
    switch(pos.id)
	{
		case 'grdDetail':
		flag = "save";
		if (grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK) != '')
		{
			txtDetailPK.text = grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK);		    
		}
		break;
	}	
}
//======================================================================
function OnSaveDefect(pos)
{
	switch(pos.id)
	{
		case 'grdDefect':
		    if (grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK) != '')
		    {
			    txtDetailPK.text = grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK);	
			    flag_defect = "save";			    	    
		    }
		break;
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
</script>
<html>
<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpfo00040_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfo00040_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!-------------------------Line by user--------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fpfo00040_4" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------Search---------------------------------------->
    <gw:data id="data_fpfo00040" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="<%=l_user%>lg_sel_fpfo00040"	>	
				<input>
					<input	bind="dtFrom"	/>	
					<input	bind="dtTo"	/>	
					<input	bind="txtStyleSearch"	/>	
					<input	bind="lstStatus"	/>	
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!------------------------Master---------------------------------------->
    <gw:data id="data_fpfo00040_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8,9,10,11"	function="<%=l_user%>lg_sel_fpfo00040_1"	procedure="<%=l_user%>lg_upd_fpfo00040_1">	
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
    <gw:data id="data_fpfo00040_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="<%=l_user%>lg_sel_fpfo00040_2" procedure="<%=l_user%>lg_upd_fpfo00040_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--------------------Defect----------------------------------------->
    <gw:data id="data_fpfo00040_3" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fpfo00040_3" procedure="<%=l_user%>lg_upd_fpfo00040_3">	
				<input	bind="grdDefect">					
					<input	bind="txtDetailPK"	/>	
					<input	bind="lstDefectGroup"	/>
				</input>	
				<output	bind="grdDefect"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--------------------Process-------------------------------------------->
    <gw:data id="pro_fpfo00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfo00040" > 
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
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%" align="right">
                        <td style="width: 5%">
                            Date
                        </td>
                        <td style="width: 98%" align="left">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtStyleSearch" styles="width:	100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Status
                        </td>
                        <td colspan="3">
                            <gw:list id="lstStatus" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_PK|QC Date|Slip No/PO|Style Name' format='0|4|0|0'
                                aligns='0|1|0|0' check='|||' editcol='0|0|0|0' widths='1000|1200|1000|1000' sorting='T'
                                styles='width:100%;	height:100%' oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
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
                        <td style="width: 5%">
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:50%' onclick="OnProcess()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReport1" img="excel" alt="Report" text="Report" onclick="OnReport1()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNewMaster" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDeleteMaster" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSaveMaster" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                        <td align="right">
                            <a title="Emp" onclick="OnPopUp('Emp')" href="#tips" style="color=#0000ff"><b>Emp</b></a>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtEmpName" styles="width:100%" />
                            <gw:textbox id="txtEmpPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            <a title="Plan	No" onclick="OnPopUp('Plan_No')" href="#t<pre></pre>ips" style="color=#0000ff">
                                <b>P/O No</b></a>
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtOrdPlanPK" styles="width:	100%;display:	none" />
                            <gw:textbox id="txtRefNo" styles="width:	100%" />
                        </td>
                        <td align="right">
                            <a title="Style" onclick="OnPopUp('Style')" href="#tips" style="color=#0000ff"><b>Style</b></a>
                        </td>
                        <td colspan="7">
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
                        <td colspan="7">
                            <gw:textbox id="txtDesc" styles="width:	100%" />
                        </td>
                    </tr>
                    <tr style="height: 96%; width: 100%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 65%">
                                        <table style="width: 100%; height: 100%" border="0">
                                            <tr style="height: 1%">
                                                <td style="width: 1%">
                                                    <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                                        style="cursor: hand" onclick="OnToggle()" />
                                                </td>
                                                <td style="width: 96%">
                                                </td>
                                                <td>
                                                    <gw:icon id="idBtnProcess" img="2" text="Consumption" styles='width:100%' onclick="OnPopUp('Process')" />
                                                </td>
                                                <td style="width: 1%" align="right">
                                                    <gw:imgbtn id="btnNewDetail" img="new" alt="New" onclick="OnPopUp('Component')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDeleteDetail" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUnDeleteDetail" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete('Detail')" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <gw:grid id='grdDetail' header='_pk|_qc_outgo_m_pk|Seq|_pt_component_pk|Comp ID|Comp Name|_spec01_pk|Spec 01|_spec02_pk|Spec 02|_spec03_pk|Spec 03|_spec04_pk|Spec 04|_spec05_pk|Spec 05|QC Qty|Def Qty|Description'
                                                        format='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                        check='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1' widths='0|0|800|0|1500|2000|0|1000|0|1000|0|1000|0|1000|0|1000|1200|1200|1000'
                                                        sorting='T' styles='width:100%; height:100%' onafteredit="OnSaveDetail(this)"
                                                        oncellclick="OnGridCellClick(this)" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 35%">
                                        <table style="width: 100%; height: 100%" border="0">
                                            <tr style="height: 1%">
                                                <td style="width: 5%" align="right">
                                                    Group
                                                </td>
                                                <td style="width: 85%" align="right" colspan="3">
                                                    <gw:list id="lstDefectGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdDefect')" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <gw:grid id='grdDefect' header='Chk|_qc_outgo_def_PK|_QC_OUTGO_D_PK|_defect_PK|Defect ID|Defect Name|Def Qty|_Description'
                                                        format='3|0|0|0|0|0|1|0' aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|1|1'
                                                        widths='500|0|0|0|1000|2000|800|1000' sorting='T' styles='width:100%; height:100%'
                                                        onafteredit="OnSaveDefect(this)" />
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
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtQcOutgoConsPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtDetailPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtReturnValue" styles="width:	100%;display:	none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtUser_PK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
