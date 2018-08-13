<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Stock Checking</title>
</head>

<script>
   
var G2_COMP_PK      = 0,
    G2_COMP_ID      = 1,
    G2_COMP_NAME    = 2,
    G2_SPEC01_ID      = 3,
    G2_SPEC02_ID      = 4,
    G2_SPEC03_ID      = 5,
    G2_SPEC04_ID      = 6,
    G2_SPEC05_ID      = 7,
	G2_PROD_QTY     = 8,
	G2_IN_QTY		= 9,
    G2_RATIO_QTY    = 10,
	G2_READY_QTY    = 11;
    
//=============================================================================             
function BodyInit()
{    
    System.Translate(document);
	var ordplan_pk  = "<%=request.QueryString("ordplan_pk") %>";
	txtOrdPlanPK.text = ordplan_pk ;	
	
	var style_pk  = "<%=request.QueryString("style_pk") %>";
	txtStylePK.text = style_pk ;	
		
    var component_pk  = "<%=request.QueryString("component_pk") %>";
	txtCompPK.text = component_pk ;		  
    OnHiddenGrid();
    FormatGrid();
	
	ibtnSearch.SetEnable(false);
    //-----------------
    OnSearch('header');    
}
//----------------------------------------------
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;
	
	lblSpec01.style.display = 'none';
	lstSpec01.style.display = 'none';
	
	lblSpec02.style.display = 'none';
	lstSpec02.style.display = 'none';
	
	lblSpec03.style.display = 'none';
	lstSpec03.style.display = 'none';
	
	lblSpec04.style.display = 'none';
	lstSpec04.style.display = 'none';
	
	lblSpec05.style.display = 'none';
	lstSpec05.style.display = 'none';
}
//=============================================================================             
function FormatGrid()
{     
    var ctrl = grdDetail.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;  
      
    ctrl.ColFormat(G2_PROD_QTY)  = "###,###,###" ;  
	ctrl.ColFormat(G2_IN_QTY)    = "###,###,###" ;    
    ctrl.ColFormat(G2_RATIO_QTY) = "###,###,###" ;
	ctrl.ColFormat(G2_READY_QTY) = "###,###,###" ;
	
    var data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";		
} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'grdDetail':           
            //---------------------  
            for(var i = 0; i < 5; i++)
            {
                if(chkSpec01.value == "N")
                {
                    chkSpec01.value = "";
                }
                else if(chkSpec02.value == "N")
                {
                    chkSpec02.value = "";
                }
                else if(chkSpec03.value == "N")
                {
                    chkSpec03.value = "";
                }
                else if(chkSpec04.value == "N")
                {
                    chkSpec04.value = "";
                }
                else if(chkSpec05.value == "N")
                {
                    chkSpec05.value = "";
                }
                data_fpgm00101.Call('SELECT');
            }
        break; 
		
		case 'header':
			data_fpgm00101_header.Call('SELECT');
		break;		
		
        case 'spec01':
            pro_fpgm00101_1.Call();
        break;
         
        case 'spec02':
            pro_fpgm00101_2.Call();
        break; 
        
        case 'spec03':
            pro_fpgm00101_3.Call();
        break; 

        case 'spec04':
            pro_fpgm00101_4.Call();
        break; 
        
        case 'spec05':
            pro_fpgm00101_5.Call();
        break;            		       
    }
}
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fpgm00101.Call();
        break;                     
    }        
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpgm00101':            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_COMP_ID,   grdDetail.rows-1, G2_COMP_ID,   true);
                grdDetail.SetCellBold( 1, G2_PROD_QTY,  grdDetail.rows-1, G2_PROD_QTY,  true);
                grdDetail.SetCellBold( 1, G2_READY_QTY, grdDetail.rows-1, G2_READY_QTY, true);
				
				grdDetail.Subtotal( 0, 2, -1, '8!11','###,###,###');
            }       
            OnSearch('spec01');     
        break;  

        case 'data_fpgm00101_header':
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
                    grdDetail.SetGridText(0,G2_SPEC01_ID,col1);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = false ;
                    lblSpec01.style.display = '';
                    lbSpec01.SetDataText(col1);
                    chkSpec01.style.display = '';
                    lstSpec01.style.display = '';
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC02_ID,col2);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = false ;
                    lblSpec02.style.display = '';
                    lbSpec02.SetDataText(col2);
                    chkSpec02.style.display = '';
                    lstSpec02.style.display = '';
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC03_ID,col3);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = false ;
                    lblSpec03.style.display = '';
                    chkSpec03.style.display = '';
                    lbSpec03.SetDataText(col3);                    
                    lstSpec03.style.display = '';
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC04_ID,col4);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;
                    lblSpec04.style.display = '';
                    lbSpec04.SetDataText(col4);
                    chkSpec04.style.display = '';
                    lstSpec04.style.display = '';
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_ID,col5);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ; 
                    lblSpec05.style.display = '';   
                    lbSpec05.SetDataText(col5);
                    chkSpec05.style.display = '';
                    lstSpec05.style.display = '';                
                }
                OnSearch("grdDetail");
            }		
		break;
		
        case 'pro_fpgm00101_1' :
            OnSearch('spec02');
        break;    
        
        case 'pro_fpgm00101_2' :
            OnSearch('spec03');
        break;  
        
        case 'pro_fpgm00101_3' :
            OnSearch('spec04');
        break;   
        
        case 'pro_fpgm00101_4' :
            OnSearch('spec05');
        break;
        
        case 'pro_fpgm00101_5' :
            ibtnSearch.SetEnable(true);
        break;             		           
    }
}

//============================================================================= 
 
                      
</script>

<body>
    <gw:data id="data_fpgm00101_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00101_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00101_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00101_1" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstSpec01" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00101_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00101_2" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstSpec02" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00101_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00101_3" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstSpec03" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00101_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00101_4" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstSpec04" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00101_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00101_5" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstSpec05" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00101" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00101"  >
                <input bind="grdDetail" >               
			        <input bind="txtOrdPlanPK" />
			        <input bind="txtStylePK" />
					<input bind="txtCompPK" />
			        <input bind="lstSpec01" />
			        <input bind="lstSpec02" />
			        <input bind="lstSpec03" />	
					<input bind="lstSpec04" />	
					<input bind="lstSpec05" />
					<input bind="lstLang" />		        
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Daily">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                <gw:label id="lblSpec01" styles='width:100%;color:cc0000;font:9pt' text="Spec 01" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:list id="lstSpec01" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                <gw:label id="lblSpec02" styles='width:100%;color:cc0000;font:9pt' text="Spec 02" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:list id="lstSpec02" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                <gw:label id="lblSpec03" styles='width:100%;color:cc0000;font:9pt' text="Spec 03" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:list id="lstSpec03" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                <gw:label id="lblSpec04" styles='width:100%;color:cc0000;font:9pt' text="Spec 04" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:list id="lstSpec04" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                <gw:label id="lblSpec05" styles='width:100%;color:cc0000;font:9pt' text="Spec 05" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:list id="lstSpec05" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 2%; white-space: nowrap" align="right">
                <gw:textbox id="txtSpecPK01" styles="display:none" />
                <gw:label id="lbSpec01" styles='width:100%;color:cc0000;font:9pt'></gw:label>
            </td>            
            <td style="width: 2%" align="left">
                <gw:checkbox id="chkSpec01" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 2%; white-space: nowrap" align="right">
                <gw:textbox id="txtSpecPK02" styles="display:none" />
                <gw:label id="lbSpec02" styles='width:100%;color:cc0000;font:9pt'></gw:label>
            </td>
            <td style="width: 2%" align="left">
                <gw:checkbox id="chkSpec02" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 2%; white-space: nowrap" align="right">
                <gw:textbox id="txtSpecPK03" styles="display:none" />
                <gw:label id="lbSpec03" styles='width:100%;color:cc0000;font:9pt'></gw:label>
            </td>
            <td style="width: 2%" align="left">
                <gw:checkbox id="chkSpec03" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 2%; white-space: nowrap" align="right">
                <gw:textbox id="txtSpecPK04" styles="display:none" />
                <gw:label id="lbSpec04" styles='width:100%;color:cc0000;font:9pt'></gw:label>
            </td>
            <td style="width: 2%" align="left">
                <gw:checkbox id="chkSpec04" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 2%; white-space: nowrap" align="right">
                <gw:textbox id="txtSpecPK05" styles="display:none" />
                <gw:label id="lbSpec05" styles='width:100%;color:cc0000;font:9pt'></gw:label>
            </td>
            <td style="width: 2%" align="left">
                <gw:checkbox id="chkSpec05" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%">
            </td>
            <td style="width: 15%">
                <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%" align="right">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="23">
                <gw:grid id='grdDetail' header='_COMP_PK|Comp ID|Comp Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Prod Qty|In Qty|Ratio|Ready Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|1|1|1|1|1|3|3|3|3' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3000|1200|1200|1200|1200|1200|1200|1200|1200|1200' sorting='T'
                    styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%; display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
    <gw:textbox id="txtStylePK" text="" styles="width:100%;display:none" />
    <gw:textbox id="txtCompPK" text="" styles="width:100%;display:none" />
</body>
</html>
