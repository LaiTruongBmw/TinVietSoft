<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser("SALE")
    Dim l_user As String
    l_user = "sale."
%>
<head>
    <title>CHECK LIST SUMMARY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;
      
    
var G2_MEMBER_PK			= 0,
	G2_LOCATION				= 1,
	G2_ZONE                 = 2,	
    G2_TEAM                 = 3,	 
    G2_MEMBER_NM            = 4,
	G2_REVISION_NUM			= 5,
    G2_MEMBER_NO            = 6,
	G2_MEMBER_SIZE			= 7,
	G2_LENGTH				= 8,
    G2_QTY                  = 9,
    G2_WT                   = 10,
    G2_DWG_NO               = 11,
	G2_AC_DWG_NO			= 12,
	G2_FIT_UP				= 13,
    G2_WELD                 = 14,
    G2_AC_WELD              = 15,      
    G2_INSP                 = 16,
    G2_AC_INSP              = 17,
	G2_ASSEMBLY				= 18,
	G2_OUTSOURCE_DELI		= 19,
	G2_OUTSOURCE_RECEIVE	= 20,
	G2_TRANS_PAINT			= 21,
	G2_BLAST_REMARK			= 22,
	G2_BLAST_INSPEC			= 23,
    G2_PAINT                = 24,
    G2_PAINT_REMARK         = 25,
	G2_PAINT_INSPEC			= 26,	
	G2_TRANS_PACK			= 27,
    G2_PACK                 = 28,
    G2_AC_PACK              = 29,
	G2_FINAL_INSP			= 30,
    G2_DELI                 = 31,
    G2_AC_DELI              = 32,
	G2_PACK_NO		    	= 33,
	G2_INVOICE_NO			= 34,	
    G2_REMARK               = 35;
  //------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	OnToggleGrid();  
    //---------------------------- 
	grdDetail.GetGridControl().FrozenCols = G2_MEMBER_SIZE ;
 	
}
 

 //==================================================================================
 function OnPopUp(obj)
 {
    switch(obj)
        {
            case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text   = oValue[0];
                    txtProjectCode.text = oValue[1];
                    txtProjectName.text = oValue[2];
					
					pro_fpfa00530.Call();
                }
            break;               
       }
 }
//==================================================================================
function OnPrint( para)
{
	var path = System.RootURL + '/form/fp/fa/fpfa00531.aspx';
	var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		
    /*switch(para01)
    {								
        case '0':
            var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00470.aspx?master_pk=' + txtMasterPK.text ;
	        System.OpenTargetPage(url);  
        break;
		
        case '1':
            //var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00301.aspx?master_pk=' + txtMasterPK.text;
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00471.aspx?master_pk=' + txtMasterPK.text;
	        System.OpenTargetPage(url);  
        break;
        
		case 'CHECK-LIST':
            //var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00301.aspx?master_pk=' + txtMasterPK.text;
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00530.aspx?p_proj_pk=' + txtProjectPK.text + '&p_proj_nm=' + txtProjectName.text ;
	        System.OpenTargetPage(url);  
        break;
		
		case 'SUMMARY':
            //var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00301.aspx?master_pk=' + txtMasterPK.text;
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00531.aspx?p_proj_pk=' + txtProjectPK.text + '&p_proj_nm=' + txtProjectName.text ;
	        System.OpenTargetPage(url);  
        break;
    }*/
}

//==================================================================================
function OnReport(para01,para02)
{
	 	
    switch(para01)
    {								
        case '0':
            var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00470.aspx?master_pk=' + txtMasterPK.text ;
	        System.OpenTargetPage(url);  
        break;
		
        case '1':
            //var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00301.aspx?master_pk=' + txtMasterPK.text;
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00471.aspx?master_pk=' + txtMasterPK.text;
	        System.OpenTargetPage(url);  
        break;
        
		case 'CHECK-LIST-2':
		
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00533.aspx?p_proj_pk=' + txtProjectPK.text;
                url+= '&p_proj_nm=' + txtProjectName.text + '&p_item_name=' + lstItemName.value;
                url+= '&p_zone=' + txtZone.text + '&p_fab_team=' + txtFabTeam.text;
                url+= '&p_member=' + txtMember.text;
	        System.OpenTargetPage(url);  
        break;
		
		case 'CHECK-LIST-1':
             
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00530.aspx?p_proj_pk=' + txtProjectPK.text;
                url+= '&p_proj_nm=' + txtProjectName.text + '&p_item_name=' + lstItemName.value;
                url+= '&p_zone=' + txtZone.text + '&p_fab_team=' + txtFabTeam.text;
                url+= '&p_member=' + txtMember.text;
	        System.OpenTargetPage(url);  
        break;
		
		case 'DAILY':
             
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00531.aspx?p_proj_pk=' + txtProjectPK.text + '&p_proj_nm=' + txtProjectName.text + '&p_from_date=' + para02 ;
	        System.OpenTargetPage(url);  
        break;
				
		case 'SUMMARY':
            //var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00301.aspx?master_pk=' + txtMasterPK.text;
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00532.aspx?p_proj_pk=' + txtProjectPK.text + '&p_proj_nm=' + txtProjectName.text ;
	        System.OpenTargetPage(url);  
        break;
		
		case 'PLAN_RESULT':
            var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00538.aspx?p_proj_pk=' + txtProjectPK.text;
                url+= '&p_proj_nm=' + txtProjectName.text + '&p_item_name=' + lstItemName.value;
                url+= '&p_zone=' + txtZone.text + '&p_fab_team=' + txtFabTeam.text;
                url+= '&p_member=' + txtMember.text;
	        System.OpenTargetPage(url); 		
		break;
    }
}
//==================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        
        case 'grdDetail':  
			 
			//--------------          
            data_fpfa00530_1.Call("SELECT");
        break;
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {            
        case "data_fpfa00530_1":
            if ( grdDetail.rows > 1 )
            {
				 grdDetail.SetCellBgColor( 1, G2_AC_DWG_NO,grdDetail.rows-1, G2_AC_DWG_NO,0x99FFFF );
                 grdDetail.SetCellBgColor( 1, G2_AC_WELD,  grdDetail.rows-1, G2_AC_WELD,  0x99FFFF );  
                 grdDetail.SetCellBgColor( 1, G2_AC_INSP,  grdDetail.rows-1, G2_AC_INSP,  0x99FFFF );  
                 
                 grdDetail.SetCellBgColor( 1, G2_AC_PACK,  grdDetail.rows-1, G2_AC_PACK,  0x99FFFF );  
                 grdDetail.SetCellBgColor( 1, G2_AC_DELI,  grdDetail.rows-1, G2_AC_DELI,  0x99FFFF );
				 
				 grdDetail.SetCellBgColor( 1, G2_ASSEMBLY,          grdDetail.rows-1, G2_ASSEMBLY,          0xCCFFFF );
				 grdDetail.SetCellBgColor( 1, G2_OUTSOURCE_DELI,    grdDetail.rows-1, G2_OUTSOURCE_DELI,    0xCCFFFF ); 
                 grdDetail.SetCellBgColor( 1, G2_OUTSOURCE_RECEIVE, grdDetail.rows-1, G2_OUTSOURCE_RECEIVE, 0xCCFFFF ); 
				 
				 grdDetail.SetCellBgColor( 1, G2_TRANS_PAINT, grdDetail.rows-1, G2_TRANS_PAINT, 0xFFFF99 ); 
                 grdDetail.SetCellBgColor( 1, G2_FINAL_INSP,  grdDetail.rows-1, G2_FINAL_INSP,  0xFFFF99 );
				 
				 data_fpfa00530_2.Call();                				                   
            }
                       
        break;
        
        case 'data_fpfa00530_2':
            lblQty.text = addCommas(lblQty.text);
            lblWeight.text = addCommas(lblWeight.text);
        break;
    }
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

function OnToggleGrid()
{
    if(chkPlan.value == "N")
    {   
		
		grdDetail.GetGridControl().ColHidden(G2_WELD)  = true ;
		grdDetail.GetGridControl().ColHidden(G2_INSP)  = true ;
		grdDetail.GetGridControl().ColHidden(G2_PAINT) = true ;
		grdDetail.GetGridControl().ColHidden(G2_PACK)  = true ;
		grdDetail.GetGridControl().ColHidden(G2_DELI)  = true ;		
    }
    else
    {
		
        grdDetail.GetGridControl().ColHidden(G2_WELD)  = false ;
		grdDetail.GetGridControl().ColHidden(G2_INSP)  = false ;
		grdDetail.GetGridControl().ColHidden(G2_PAINT) = false ;
		grdDetail.GetGridControl().ColHidden(G2_PACK)  = false ;
		grdDetail.GetGridControl().ColHidden(G2_DELI)  = false ;		
    }
}
 
  //======================================================================
  
  function OnSave()
  {
  		if ( confirm ("Do you want to save ?") )
		{			
			data_fpfa00530_1.Call();
		}
  }
  
  
   
  //======================================================================  
    var  click_data = "";
	var  click_col  = 0;
	
	var  copy_data  = "";
	var  copy_col   = 0;
  //======================================================================  
  function OnGridCellClick()
  {
		click_data = grdDetail.GetGridData( event.row, event.col ) ;
		click_col  = event.col;
  }
  //======================================================================  
  function OnCopy()
  {
		copy_data = click_data ;
		copy_col  = click_col  ;	
  }
  //======================================================================  
  function OnPaste()
  {
					for( var i=0; i < grdDetail.rows; i++)	  
                    {	
                        if ( grdDetail.GetGridControl().isSelected(i) == true )
						{
							grdDetail.SetGridText( i, copy_col, copy_data);
						}
                    }			 
  }
 //======================================================================    
</script>

<body>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpfa00530_1" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="<%=l_user%>lg_sel_fpfa00530_1" procedure="<%=l_user%>lg_upd_fpfa00530_1">
				<input	bind="grdDetail">					
					<input	bind="txtProjectPK"	/>	
					<input	bind="txtZone"	/>	
					<input	bind="txtFabTeam"	/>	
					<input	bind="lstItemName"	/>	
					<input	bind="txtMember"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <gw:data id="data_fpfa00530_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_sel_fpfa00530_2"> 
                <input> 
			        <input	bind="txtProjectPK"	/>	
					<input	bind="txtZone"	/>	
					<input	bind="txtFabTeam"	/>	
					<input	bind="lstItemName"	/>	
					<input	bind="txtMember"	/>	 		
			    </input> 
                <output>
                    <output bind="lblQty" />
                    <input bind="lblWeight" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfa00530" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpfa00530" >
                <input>
                    <input bind="txtProjectPK" />
                </input>
                <output>
                    <output bind="lstItemName" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="white-space: nowrap; width: 5%" align="right">
                <a title="Project" onclick="OnPopUp('Project')" href="#tips" style="color=#0000ff"><b>
                    Project </a>
            </td>
            <td style="white-space: nowrap; width: 40%">
                <gw:textbox id="txtProjectPK" styles="display:none" />
                <gw:textbox id="txtProjectCode" styles="display:none" />
                <gw:textbox id="txtProjectName" styles="width:100%" />
            </td>
            <td style="white-space: nowrap; width: 5%" align="right">
                Zone
            </td>
            <td style="white-space: nowrap; width: 10%" colspan="2">
                <gw:textbox id="txtZone" styles="width:100%" />
            </td>
            <td style="white-space: nowrap; width: 5%" align="right">
                Fab. Team
            </td>
            <td style="white-space: nowrap; width: 10%" colspan="2">
                <gw:textbox id="txtFabTeam" styles="width:100%" />
            </td>
            
            <td style="white-space: nowrap; width: 5%" align="right">
                Member
            </td>
            <td style="white-space: nowrap; width: 15%" colspan="2">
                <gw:textbox id="txtMember" styles="width:100%" />
            </td>
            <td style="white-space: nowrap; width: 4%">
                <gw:checkbox id="chkPlan" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnToggleGrid()">Plan
							</gw:checkbox>
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:imgbtn id="btnRpt01" img="excel" alt="Summary" text="CSummary" onclick="OnPrint()" />
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:icon id="btnCopy" img="2" text="C" onclick="OnCopy()" />
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:icon id="btnPaste" img="2" text="P" onclick="OnPaste()" />
            </td>
        </tr>
        <tr>
			<td style="white-space: nowrap; width: 5%" align="right">
                Item
            </td>
            <td style="white-space: nowrap; width: 40%"  >
                <gw:list id="lstItemName" styles="width: 100%" />
            </td>
            <td style="width: 100%; height: 1%" colspan="10">
                <table style="width: 100%; height: 100%">
                    <tr>                       
                        <td style="white-space: nowrap;width: 5%">
                            <gw:label id="1" text='Qty:' />
                        </td>
                        <td style="white-space: nowrap;width: 40%">
                            <gw:label id="lblQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                format="###,###.##" />
                            <!--  <gw:textbox id="txtQty" csstype="mandatory" styles="width:100%" type="number" format="###,###,###.##" />-->
                        </td>
                        <td style="white-space: nowrap;width: 5%">
                           <gw:label id="1" text='Weight(KG):' /> 
                        </td>
                        <td style="white-space: nowrap;width: 40%">
                            <gw:label id="lblWeight" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                format="###,###.##" />                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 97%">
            <td colspan="21">
                <gw:grid id='grdDetail' acceptnulldate='T' 
				    header='_PK|Location|Zone|Fab. Team|Member Name|Revision|Member No.|Member Size|Length|Qty|Weight(Kg)|DWG No.|DESIGN PLAN|Actual Fit Up|Plan Welding|Actual Welding|Inspection|Actual Insp.|Assembly|Out Source Deli|O/S Receive|Paint Transfer|Blast Remark|Blast Insp.|Painting|Paint Remark|Paint Insp.|Pack Transfer|Pack Plan|Actual Packing|Final Inspec|Delivery|Actual Deli.|Pack No|Invoice No|Remark'
                    format='0|0|0|0|0|0|0|0|1|1|1|0|4|4|4|4|4|4|4|4|4|4|0|4|4|0|4|4|4|4|4|4|4|0|0|0' 										         		
					aligns='0|1|1|1|1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0'
                    check='|||||||||||||||||||||||||||||||||||' 
					editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='0|1500|1000|1500|2000|1000|1500|2000|1200|1000|1500|2000|1300|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200'
                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick()' />

	
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<!--------------------------------------------------------->
</html>
