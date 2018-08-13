<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Order Plan Entry</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK        = 0,
    G1_SO_PK      = 1,
    G1_ORD_DT     = 2,  
    G1_PO_NO      = 3,
    G1_SO_NO      = 4,
    G1_STYLE_PK   = 5,
    G1_STYLE_CODE = 6,
    G1_STYLE_NAME = 7,
    G1_TOTAL_QTY  = 8,
    G1_REMARK     = 9;    
    
var G2_MASTER_PK       = 0,
    G2_PLAN_NO         = 1,
    G2_PLAN_DATE       = 2,
    G2_ARRAY_SO_PK     = 3,
    G2_SO_PK           = 4,
    G2_PO_NO           = 5,
    G2_STYLE_PK        = 6,
    G2_STYLE_CODE      = 7,
    G2_STYLE_NAME      = 8,
    G2_FROM_DT         = 9,
    G2_TO_DT           = 10,
    G2_ORD_QTY         = 11,
    G2_PLAN_QTY        = 12,  
	G2_RG_QTY		   = 13,  
    G2_SPEC01_PK       = 14,
    G2_SPEC01_NM       = 15,
    G2_SPEC02_PK       = 16,
    G2_SPEC02_NM       = 17,
    G2_SPEC03_PK       = 18,
    G2_SPEC03_NM       = 19,
    G2_SPEC04_PK       = 20,
    G2_SPEC04_NM       = 21,
    G2_SPEC05_PK       = 22,
    G2_SPEC05_NM       = 23,
    G2_REMARK          = 24,
    G2_DETAIL_PK       = 25;
//==================================================================
         
function BodyInit()
{         
    System.Translate(document);
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));  
    dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-30));
    
    FormatGrid();
    //-----------------------------------
    
    OnHiddenGrid();
    OnSearch('header');
}
//==================================================================
  
function FormatGrid()
{
    var data="";    
        
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	
	
    var ctrl = grdSO.GetGridControl();   
     
    ctrl.ColFormat(G1_TOTAL_QTY) = "###,###,###" ;
    //---------------------
    ctrl = grdOrdPlan.GetGridControl();  
      
    ctrl.MergeCells = 2;
    ctrl.MergeCol(G2_MASTER_PK)     = true;
    ctrl.MergeCol(G2_PLAN_NO)       = true;
    ctrl.MergeCol(G2_PLAN_DATE)     = true;
    ctrl.MergeCol(G2_ARRAY_SO_PK)   = true;
    ctrl.MergeCol(G2_SO_PK)         = true;
    ctrl.MergeCol(G2_PO_NO)         = true;
    
    ctrl.MergeCol(G2_STYLE_PK)      = true;
    ctrl.MergeCol(G2_STYLE_CODE)    = true;
    ctrl.MergeCol(G2_STYLE_NAME)    = true;
    ctrl.MergeCol(G2_FROM_DT)       = true;
    ctrl.MergeCol(G2_TO_DT)         = true;
    ctrl.MergeCol(G2_SPEC01_PK)     = true;
    ctrl.MergeCol(G2_SPEC01_NM)     = true;
    ctrl.MergeCol(G2_SPEC02_PK)     = true;
    ctrl.MergeCol(G2_SPEC02_NM)     = true;
    ctrl.MergeCol(G2_SPEC03_PK)     = true;
    ctrl.MergeCol(G2_SPEC03_NM)     = true;
    ctrl.MergeCol(G2_SPEC04_PK)     = true;
    ctrl.MergeCol(G2_SPEC04_NM)     = true;
    ctrl.MergeCol(G2_SPEC05_PK)     = true;
    ctrl.MergeCol(G2_SPEC05_NM)     = true;

    ctrl.ColFormat(G2_ORD_QTY) = "###,###,###,###";
    ctrl.ColFormat(G2_PLAN_QTY)= "###,###,###,###";
	ctrl.ColFormat(G2_RG_QTY)  = "###,###,###,###";
    
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdSO':
            data_fpip00100.Call('SELECT');
        break;
        
        case 'grdOrdPlan':
            data_fpip00100_1.Call('SELECT')
        break;
        
        case 'header':
            data_fpip00100_Header.Call("SELECT");
        break;
    }
}

//==================================================================
function OnHiddenGrid()
{
    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC01_NM) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G2_SPEC02_NM) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G2_SPEC03_NM) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G2_SPEC04_NM) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G2_SPEC05_NM) = true ;
}
//==================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'MakeOrdPlan':
        
                var array_po    = '';
                var array_so_pk = '';
                var style_pk    = ''; 
                var t = 0 ;
                
                for(i = 1; i < grdSO.rows; i++)
                {
                    if ( grdSO.GetGridData(i, G1_CHK) == -1 && t <= 20 )
                    {                        
                        if ( style_pk != '' && style_pk != grdSO.GetGridData(i, G1_STYLE_PK) )
                        {
                            alert('Diffrence Style!');
                            return;
                        }
                        
                        array_po    = array_po    + grdSO.GetGridData(i, G1_PO_NO) + ',';
                        array_so_pk = array_so_pk + grdSO.GetGridData(i, G1_SO_PK) + ',';
                        t = t + 1 ;                        
                        
                        style_pk = grdSO.GetGridData(i, G1_STYLE_PK);
                    }                    
                }
                                       
                array_po    = array_po.substring(0, array_po.length-1);
                array_so_pk = array_so_pk.substring(0, array_so_pk.length-1); 
                
                if ( array_so_pk == '' )
                {
                    alert('You must select one P/O.');
                }
                else
                {
                    var path = System.RootURL + '/form/fp/ip/fpip00101.aspx?style_pk='+ style_pk +'&array_so_pk='+ array_so_pk +'&array_po='+ array_po;
	                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 

	                if ( object != null )                    
	                {
	                    OnSearch('grdSO');
	                }
                }
         break ;
         
		 case 'ManualOrdPlan':
		 	  	var path = System.RootURL + '/form/fp/ip/fpip00103.aspx';
	            var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
		 break;
		 
         case 'ModifyOrdPlan':
            if ( grdOrdPlan.row > 0 )
            {
                var order_plan_pk = grdOrdPlan.GetGridData( grdOrdPlan.row, G2_MASTER_PK);
                
                var path = System.RootURL + '/form/fp/ip/fpip00103.aspx?plan_pk='+ order_plan_pk;
	            var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
	            
            	if ( object != null )                    
                {
                    OnSearch('grdSO');
                }
	        }
	        else
	        {
	            alert('Pls select Order Plan to modify.');
	        }       	        
         break;
         
         case 'Prod_Card' :
            if ( grdOrdPlan.row > 0 )
            { 
                var url = System.RootURL + "/form/fp/ip/fpip00102.aspx?RefTablePK="+ grdOrdPlan.GetGridData( grdOrdPlan.row, G2_DETAIL_PK) +"&RefTableName=PP_ORDPLAND" ;
	            var object = System.OpenModal( url ,700 , 600,  'resizable:yes;status:yes', this); 
	        }
	        else
	        {
	            alert("Please select Order Plan Detail !");
	        }         
         break;   
		 
		 case 'RG-PLAN' :
		 	if ( grdOrdPlan.row > 0 )
            {
                var url = System.RootURL + "/form/fp/ip/fpip00106.aspx";//?p_pp_ordpland_pk="+ grdOrdPlan.GetGridData(grdOrdPlan.row,G2_DETAIL_PK);
	            var object = System.OpenModal( url ,800 , 550,  'resizable:yes;status:yes', this); 
	        }
	        else
	        {
	            alert("Please select Order Plan Detail !");
	        }  
		 break;      
		 
		 case 'Report':
		 	var path = System.RootURL + '/form/fp/ip/fpip00105.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		 break;
         
     }       
}
//==================================================================
function OnPrint(para)
{
    switch(para)
     {
        /*case '0':			 
             var url =System.RootURL + '/reports/ds/cd/rpt_dscd00070_ST_DW.aspx?master_pk=463&print_time=1' ;			 
             window.open(url); 			 
        break;
		
        case '1':
            var url =System.RootURL + '/reports/ds/cd/rpt_dscd00030_DW.aspx?master_pk='+ l_master_pk  ;
             window.open(url); 
        break;
		
        case '2':
            var url =System.RootURL + '/reports/ds/cd/rpt_dscd00030_DW_02.aspx?master_pk='+ l_master_pk  ;
	        window.open(url);   
        break;
		
        case '3':
            var url =System.RootURL + '/reports/ds/cd/rpt_dscd00030_DW_03.aspx?master_pk='+ l_master_pk  ;
	         window.open(url); 
        break;
		
        case '4':
            var url =System.RootURL + '/reports/ds/cd/rpt_dscd00030_DW_04.aspx?master_pk='+ l_master_pk  ;
	        window.open(url); 
        break;
        */
        case '0':
            if ( grdOrdPlan.row > 0 )
	            { 
		            txtOrdPlanPK.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G2_MASTER_PK);	
				    var url = System.RootURL + '/reports/fp/ip/rpt_fpip00100_SW.aspx?p_pp_ordplan_pk='+txtOrdPlanPK.text;
				    window.open(url);			            
	            }
	            else
	            {
		            alert("Please select Order Plan to print !");
	            } 
        break;
		
		case '1':
            if ( grdOrdPlan.row > 0 )
	            { 
		            txtOrdPlanPK.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G2_MASTER_PK);	
				    //var url = System.RootURL + '/reports/fp/ip/rpt_fpip00100_SW01.aspx?p_pp_ordplan_pk='+txtOrdPlanPK.text;
					var url = System.RootURL + '/reports/fp/ip/rpt_fpip00100_SW01.xls';
				    window.open(url);			            
	            }
	            else
	            {
		            alert("Please select Order Plan to print !");
	            } 
        break;
    }      
	   
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
    
        case 'data_fpip00100_Header':
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
                    grdOrdPlan.SetGridText(0,G2_SPEC01_NM,col1);
                    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC01_NM) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdOrdPlan.SetGridText(0,G2_SPEC02_NM,col2);
                    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC02_NM) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdOrdPlan.SetGridText(0,G2_SPEC03_NM,col3);
                    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC03_NM) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdOrdPlan.SetGridText(0,G2_SPEC04_NM,col4);
                    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC04_NM) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdOrdPlan.SetGridText(0,G2_SPEC05_NM,col5);
                    grdOrdPlan.GetGridControl().ColHidden(G2_SPEC05_NM) = false ;
                    
                }
            }
        break;
        
        case 'data_fpip00100':                   
            lbRecord.text = grdSO.rows-1 + " record(s)";
            
            if ( grdSO.rows > 1 )
            {
                grdSO.SetCellBold( 1, G1_PO_NO,           grdSO.rows - 1, G1_PO_NO,           true);
                grdSO.SetCellBold( 1, G1_TOTAL_QTY, grdSO.rows - 1, G1_TOTAL_QTY, true);
                grdSO.SetCellBgColor( 1, G1_STYLE_CODE , grdSO.rows - 1, G1_STYLE_NAME , 0xCCFFFF );                    
            }
            
            OnSearch('grdOrdPlan');            
        break;    
        
        case 'data_fpip00100_1':                               
            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBold( 1, G2_PO_NO, grdOrdPlan.rows - 1, G2_PO_NO, true);
                
                grdOrdPlan.SetCellBold( 1, G2_ORD_QTY,  grdOrdPlan.rows - 1, G2_ORD_QTY,  true);
                grdOrdPlan.SetCellBold( 1, G2_PLAN_QTY, grdOrdPlan.rows - 1, G2_PLAN_QTY, true);
                
                grdOrdPlan.SetCellBgColor( 1, G2_PLAN_QTY , grdOrdPlan.rows - 1, G2_PLAN_QTY , 0xCCFFFF );    
            }         
        break;  
        
        case 'pro_fpip00100' :
            alert(txtReturnValue.text);
            
            OnSearch('grdOrdPlan') ;
        break;  
        
        case 'pro_fpip00100_1' :
            alert(txtReturnValue.text);
            
            OnSearch('grdOrdPlan') ;
        break;   
        case 'pro_fpip00100_3' :
            alert(txtReturnValue.text);
            OnSearch('grdSO') ;
        break;
        
    }
}  

//==================================================================
function OnProcess(pos)
{
    switch (pos)
    {         
        case 'AutoPlan':
            var array_po    = '';
            var array_so_pk = '';
            var style_pk    = ''; 
            
            for(i = 1; i < grdSO.rows; i++)
            {
                if (grdSO.GetGridData(i, G1_CHK) == -1)
                {
                    array_po    = array_po    + grdSO.GetGridData(i, G1_PO_NO) + ',';
                    array_so_pk = array_so_pk + grdSO.GetGridData(i, G1_SO_PK) + ',';
                    
                    if ( style_pk != '' && style_pk != grdSO.GetGridData(i, G1_STYLE_PK) )
                    {
                        alert('Diffrence Style!');
                        return;
                    }
                    
                    style_pk = grdSO.GetGridData(i, G1_STYLE_PK);
                }
            }
                                   
            array_po    = array_po.substring(0, array_po.length-1);
            array_so_pk = array_so_pk.substring(0, array_so_pk.length-1); 
            
            if ( array_so_pk == '' )
            {
                alert('You must select one P/O.');
            }
            else
            {
                if ( confirm("Do you want to make plan for " + array_po + " ? ") )
                {
                     txtStylePK.text = style_pk;
                     txtArraySOPK.text = array_so_pk;
                     txtSOPO.text = array_po;
                     
                     pro_fpip00100_3.Call();
                } 
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
        tab_bottom.style.height="100%";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }    
  
//==================================================================        
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00100_Header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00100_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00100" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fpip00100"  >
                <input bind="grdSO" >
			        <input bind="dtFrom" />
			        <input bind="dtTo" />
			        <input bind="txtPOStyle" />
                </input>
                <output bind="grdSO" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00100_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_SEL_fpip00100_1"  >
                <input bind="grdOrdPlan" >
					<input bind="lstFactory" />
			        <input bind="dtFrom2" />
			        <input bind="dtTo2" />
			        <input bind="txtPOStyle2" />			         
                </input>
                <output bind="grdOrdPlan" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------Close-------------------------------->
    <gw:data id="pro_fpip00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpip00100" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpip00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpip00100_1" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpip00100_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpip00100_3" > 
                <input>
                    <input bind="txtStylePK" />
                    <input bind="txtArraySOPK" />
                    <input bind="txtSOPO" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Order Date</td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            PO/Style</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSO')" />
                        </td>
                        <td style="width: 26%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdSO')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnMakeOrdPlanAuto" img="2" text="Auto Plan" onclick="OnProcess('AutoPlan')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnMakeOrdPlan" img="2" text="Plan Advance" onclick="OnPopUp('MakeOrdPlan')" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="Add New Order Plan" id="btnManualOrdPlan" onclick="OnPopUp('ManualOrdPlan')" />
                        </td>	
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdSO' header='Chk|_PK|Ord Date|P/O No|S/O No|_TCO_STITEM_PK|Style Code|Style Name|Order Qty|Remark'
                                format='3|0|4|0|0|0|0|0|1|0' aligns='0|0|1|0|0|0|0|0|3|0' defaults='|||||||||' editcol='0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|1200|2000|1200|0|2000|5000|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="left">
                            <img id="imgArrow" status="expand"  src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
						
						<td style="width: 5%; white-space: nowrap" align="right">
                			Factory</td>
            			<td style="width: 20%">
                			<gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
            			</td>
														
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Plan Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            PO/Style</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOStyle2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
                        </td>                        
                        <td style="width: 5%; white-space: nowrap" align="center">
                             
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdOrdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print Report" id="btnPrint" onclick="OnPopUp('Report')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnModifyOrdPlan" img="2" text="Modify" onclick="OnPopUp('ModifyOrdPlan')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnPrintCard" img="2" text="Print Card" onclick="OnPopUp('Prod_Card')" />
                        </td>
						<td style="width: 1%">
                            <gw:icon id="btnRGPlan" img="2" text="R/G Plan" onclick="OnPopUp('RG-PLAN')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">
                            <gw:grid id='grdOrdPlan' header='_PP_PLAN_PK|Plan No|Date|_ARRAY_SO_PK|_SO_PK|P/O No|_TCO_STITEM_PK|Style Code|Style Name|From|To|Ord Qty|Plan Qty|R/G Qty|_SPEC01_PK|Spec 01|_Spec02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Remark|_PK'
                                format='0|0|4|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|1|1|3|3|3|0|1|0|1|0|1|0|1|0|1|0|0'
                                defaults='|||||||||||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|0|0|1500|1000|1500|2500|1200|1200|1200|1200|1200|0|1200|0|1200|0|1200|0|1200|0|1200|1000|0'								
                                sorting='T' acceptnulldate='T' styles='width:100%; height:100%'   />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtDateFrom" styles='width:100%;display:none' />
    <gw:textbox id="txtDateTo" styles='width:100%;display:none' />
    <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtStylePK" styles='width:100%;display:none' />
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtSOPO" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
</body>
</html>
