<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>OQC Inquiry</title>
</head>

<script>
 
    var  user_pk =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
	
    var iColOrd_Qty         = 14,
        iColDefect_Qty      = 23 ;

var G1_PK				= 0,
	G1_QC_OUTGO_D_PK	= 1,
	G1_PP_ORDPLAN_PK	= 2,
	G1_REF_PO_NO		= 3,
	G1_STYLE_PK			= 4,
	G1_STYLE			= 5,
	G1_PT_COMPONENT_PK	= 6,
	G1_COMPONENT_ID 	= 7,
	G1_COMPONENT		= 8,
	G1_SPEC01_PK		= 9,
	G1_SPEC_ID_01		= 10,
	G1_SPEC02_PK		= 11,
	G1_SPEC_ID_02		= 12,
	G1_SPEC03_PK		= 13,
	G1_SPEC_ID_03		= 14,
	G1_SPEC04_PK		= 15,
	G1_SPEC_ID_04		= 16,
	G1_SPEC05_PK		= 17,
	G1_SPEC_ID_05		= 18,
	G1_QC_QTY			= 19,
	G1_DEF_QTY			= 20,
	G1_PERCENT			= 21;
 //---------------------------------------------------------
 function BodyInit()
 {
	  MergeColumn();
	  OnHiddenGrid();	
	  OnSearch('header'); 
 } 
//-------------------------------------------------------------------------------------------
 function MergeColumn()
{
      grdMaster.GetGridControl().MergeCells  = 2 ;	
	  grdMaster.GetGridControl().MergeCol(0) = true ;	
      grdMaster.GetGridControl().MergeCol(1) = true ;  
	  grdMaster.GetGridControl().MergeCol(2) = true ;	
      grdMaster.GetGridControl().MergeCol(3) = true ;  
      grdMaster.GetGridControl().MergeCol(4) = true ;	
      grdMaster.GetGridControl().MergeCol(5) = true ;   
}
//=========================================================================
function OnHiddenGrid()
{
    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_01) = true ;
	grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_02) = true ;
	grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_03) = true ;
	grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_04) = true ;
	grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_05) = true ;
} 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdMaster' :
				if(chkDetail.value == 'N')
				{
					fpfo00050_1.Call("SELECT");
				}
				else
				{
					fpfo00050.Call("SELECT");
				}
            break; 

			case 'header':
				data_fpfo00050_header.Call("SELECT");
			break;
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "fpfo00050" :
				if ( grdMaster.rows > 1 )
				{
					grdMaster.SetCellBold( 1, G1_REF_PO_NO,    grdMaster.rows-1, G1_REF_PO_NO,    true);
					grdMaster.SetCellBold( 1, G1_COMPONENT_ID,        grdMaster.rows - 1, G1_COMPONENT_ID,        true);
					grdMaster.SetCellBold( 1, G1_QC_QTY	  ,    grdMaster.rows-1, G1_QC_QTY	 ,    true); 
					grdMaster.SetCellBold( 1, G1_DEF_QTY  ,    grdMaster.rows-1, G1_DEF_QTY  ,    true);
					for ( var i = 1 ; i < grdMaster.rows ; i++)
					{						
						grdMaster.GetGridControl().Cell( 7, i, G1_DEF_QTY, i, G1_DEF_QTY ) = 0x3300cc;						                
					}    
					grdMaster.Subtotal( 0, 2, 0, '19!20'); 
				}
			break;

            case "fpfo00050_1" :
				if ( grdMaster.rows > 1 )
				{
					grdMaster.SetCellBold( 1, G1_REF_PO_NO,    grdMaster.rows-1, G1_REF_PO_NO,    true);
					grdMaster.SetCellBold( 1, G1_COMPONENT_ID,        grdMaster.rows - 1, G1_COMPONENT_ID,        true);
					grdMaster.SetCellBold( 1, G1_QC_QTY	  ,    grdMaster.rows-1, G1_QC_QTY	 ,    true); 
					grdMaster.SetCellBold( 1, G1_DEF_QTY  ,    grdMaster.rows-1, G1_DEF_QTY  ,    true);
					for ( var i = 1 ; i < grdMaster.rows ; i++)
					{						
						grdMaster.GetGridControl().Cell( 7, i, G1_DEF_QTY, i, G1_DEF_QTY ) = 0x3300cc;						                
					}    
					grdMaster.Subtotal( 0, 2, 0, '19!20'); 
				}
			break;

			case 'data_fpfo00050_header':
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
	                    grdMaster.SetGridText(0,G1_SPEC_ID_01,col1);
	                    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_01) = false ;
	                    
	                }
	                if (dis_col2!=0)
	                {
	                    grdMaster.SetGridText(0,G1_SPEC_ID_02,col2);
	                    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_02) = false ;
	                    
	                }
	                if (dis_col3!=0)
	                {
	                    grdMaster.SetGridText(0,G1_SPEC_ID_03,col3);
	                    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_03) = false ;
	                    
	                }
	                if (dis_col4!=0)
	                {
	                    grdMaster.SetGridText(0,G1_SPEC_ID_04,col4);
	                    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_04) = false ;
	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdMaster.SetGridText(0,G1_SPEC_ID_05,col5);
	                    grdMaster.GetGridControl().ColHidden(G1_SPEC_ID_05) = false ;
	                    
	                }					
				}				
			break;
      }  
 }

function OnView()
{
	if ( grdMaster.row > 0 )
            {
                var path = System.RootURL + '/form/fp/fo/fpfo00051.aspx?pp_ordplan_pk=' + grdMaster.GetGridData( grdMaster.row, G1_PP_ORDPLAN_PK) + '&pt_component_pk='+ grdMaster.GetGridData( grdMaster.row, G1_PT_COMPONENT_PK) + '&po_name='+ grdMaster.GetGridData( grdMaster.row, G1_REF_PO_NO) +
				'&style=' + grdMaster.GetGridData( grdMaster.row, G1_STYLE) +
				'&component=' + grdMaster.GetGridData( grdMaster.row, G1_COMPONENT);
                var object = System.OpenModal( path, 700, 450, 'resizable:yes;status:yes', this);
            }
}
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
         right.style.display="none";
          imgArrow.status = "collapse";
       
        left.style.width="100%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
      
    }
    else
    {
         right.style.display="";
          imgArrow.status = "expand";
      
        left.style.width="65%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
 }
//---------------------------------------------------------------------------------------
function OnCheck()
{
	if(chkDetail.value == 'N')
	{
		fpfo00050_1.Call('SELECT');
	}
	else
	{
		fpfo00050.Call('SELECT');
	}
}
</script>

<body>
 <!---------------------------------------------------------------->
    <gw:data id="data_fpfo00050_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfo00050_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpfo00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_fpfo00050" > 
                <input> 
                    <input bind="dtFromDate" /> 
					<input bind="dtToDate" /> 
					<input bind="txtPOStyle" /> 
					<input bind="txtComp" /> 
					<input bind="txtSpec" /> 
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpfo00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_fpfo00050_1" > 
                <input> 
                    <input bind="dtFromDate" /> 
					<input bind="dtToDate" /> 
					<input bind="txtPOStyle" /> 
					<input bind="txtComp" /> 
					<input bind="txtSpec" /> 
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table width="100%" style="height:100%">
        <tr id='top' style="height:100%">
            <td>
                <table width="100%" style="height:100%" border="0">
                    <tr style="height:1%">
                        <td style="width: 5%; white-space:nowrap" >
                           QC Date
                        </td>
						<td style="width: 15%; white-space:nowrap" align="right">
							<gw:datebox id="dtFromDate" lang="<%=Session("Lang")%>" styles="width=80%"  onenterkey="OnSearch('grdMaster')"/>
						    ~
                            <gw:datebox id="dtToDate" lang="<%=Session("Lang")%>" styles="width=80%"  onenterkey="OnSearch('grdMaster')"/>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            P/O Style
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOStyle" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 5%; white-space:nowrap" align="center">
                           Comp
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtComp" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 5%; white-space:nowrap">
                            Spec
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
						<td style="width: 3%" align="center">
							<gw:checkbox id="chkDetail" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnCheck()">
							</gw:checkbox>Detail
						</td>
						<td style="width: 1%" align="right">
							<gw:icon id="idBtnViewDetail" img="2" text="View Detail" styles='width:20%' onclick="OnView()" />
						</td>
                        <td style="width: 1%" align="left">
                           <gw:imgbtn	id="btnSearch"	img="search"	alt="Search"	text="Search"	onclick="OnSearch('grdMaster')"	/>
                        </td>
                       </tr>
                    <tr style="height:95%">
                        <td colspan='12'>
                            <table style="height:100%" style="width: 100%">
                                <tr>
                                    <td style="width: 65%" id="left">
									<gw:grid id='grdMaster'
									header='_Pk|_qc_outgo_d_pk|_pp_ordplan_pk|Ref PO|_style_pk|Style|_pt_component_pk|Comp ID|Comp Name|_spec01_pk|Spec 01|_spec02_pk|Spec 02|_spec03_pk|Spec 03|_spec04_pk|Spec 04|_spec05_pk|Spec 05|QC Qty|Def Qty|Percent'
									format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0'
									aligns='0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|0|0|3'
									check='|||||||||||||||||||||'
									editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
									widths='0|0|0|2000|0|2500|0|1500|2500|0|1200|0|1200|0|1200|0|1200|0|1200|1000|1000|1000'
									sorting='T'
									styles='width:100%; height:100%'
									/>
                                    </td>                                                                      
                                </tr>
                            </table>
                        </td>                                                     
                    </tr>
                </table>
    <gw:textbox id="txtMaster_PK" style="display: none" />
		 <!------------------------------------------------------------------> 
	 	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />	
	<!------------------------------------------------------------------> 
</body>
</html>
