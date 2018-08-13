<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Order Plan Entry Pop Up</title>
</head>

<script>

var v_language  = "<%=Session("SESSION_LANG")%>";
var emp_pk      = "<%=Session("EMPLOYEE_PK") %>";
var full_name   = "<%=Session("USER_NAME") %>";
    
var G2_SPEC01_NM    = 0,
    G2_SPEC02_NM    = 1,
    G2_SPEC03_NM    = 2,
    G2_SPEC04_NM    = 3,
    G2_SPEC05_NM    = 4,
    G2_ORD_QTY      = 5,
    G2_PLAN_QTY     = 6, 
	G2_FROM_DT      = 7,
	G2_TO_DT	    = 8,
    G2_REMARK       = 9,
    G2_SPEC01_PK    = 10,
    G2_SPEC02_PK    = 11,
    G2_SPEC03_PK    = 12,
    G2_SPEC04_PK    = 13,
    G2_SPEC05_PK    = 14,
    G2_STYLE_PK     = 15,
    G2_ARR_SO_PK    = 16,
    G2_REF_PO_NO    = 17,
    G2_OPLAN_M_PK   = 18,
    G2_OPLAN_D_PK   = 19;
        
//=======================================================================
   
function BodyInit()
{
    System.Translate(document);
    txtStyleID.SetEnable(false);
    txtStyleName.SetEnable(false);
    //-------------------------------
    txtStylePK.text   = "<%=Request.querystring("style_pk")%>";
    txtArraySOPK.text = "<%=Request.querystring("array_so_pk")%>";
    txtSOPO.text      = "<%=Request.querystring("array_po")%>";
    //-------------------------------
    FormatGrid();    
    //-------------------------------
    OnSearch('Style');
    //-------------------------------    
    var data = "<%=ESysLib.SetListDataSQL("select a.CODE  ,a.CODE_NM   from  TLG_LG_CODE  a, TLG_LG_CODE_GROUP b   where a.DEL_IF =0 and b.DEL_IF =0   and a.USE_IF = 'Y' and b.pk = a.TLG_LG_CODE_GROUP_PK   and b.GROUP_ID ='LGPC0304' order by a.DEF_YN desc,a.CODE asc") %>";     
    cboRate.SetDataText(data); 
    
	
	data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText(data); 
    lstFactory.value = '';
}
//=======================================================================
function FormatGrid()
{
    var ctrl = grdDetail.GetGridControl();  
      
    ctrl.MergeCells = 2;
    ctrl.MergeCol(G2_SPEC01_NM) = true;
    ctrl.MergeCol(G2_SPEC02_NM) = true;
    ctrl.MergeCol(G2_SPEC03_NM) = true;
    ctrl.MergeCol(G2_SPEC04_NM) = true;
    ctrl.MergeCol(G2_SPEC05_NM) = true;
    
    ctrl.ColFormat(G2_ORD_QTY) = "###,###,###,###";
    ctrl.ColFormat(G2_PLAN_QTY)= "###,###,###,###";
}

//=======================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpip00101':
            //-----------------------
            if ( lbSpecGrp01.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC01_NM, 0, G2_SPEC01_NM) = lbSpecGrp01.text;
            }
            else
            {
                document.all("chkSpecGrp01").style.display = "none";
                grdDetail.GetGridControl().ColHidden(G2_SPEC01_NM) = true ;
            } 
            
            if ( lbSpecGrp02.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC02_NM, 0, G2_SPEC02_NM) = lbSpecGrp02.text;                
            }
            else
            {
                document.all("chkSpecGrp02").style.display = "none";
                grdDetail.GetGridControl().ColHidden(G2_SPEC02_NM) = true ;
            } 
            
            if ( lbSpecGrp03.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC03_NM, 0, G2_SPEC03_NM) = lbSpecGrp03.text;
            }
            else
            {
                document.all("chkSpecGrp03").style.display = "none";
                grdDetail.GetGridControl().ColHidden(G2_SPEC03_NM) = true ;
            }   
            
            if ( lbSpecGrp04.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC04_NM, 0, G2_SPEC04_NM) = lbSpecGrp04.text;
            }
            else
            {
                document.all("chkSpecGrp04").style.display = "none";
                grdDetail.GetGridControl().ColHidden(G2_SPEC04_NM) = true ;
            } 
            
            if ( lbSpecGrp05.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC05_NM, 0, G2_SPEC05_NM) = lbSpecGrp05.text;
            }
            else
            {
                document.all("chkSpecGrp05").style.display = "none";
                grdDetail.GetGridControl().ColHidden(G2_SPEC05_NM) = true ;
            }                          
            //-----------------------
            OnSearch('grdDetail');
        break;
        
        case 'data_fpip00101_1':
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_ORD_QTY,  true);
                grdDetail.SetCellBold( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_PLAN_QTY, true);
                grdDetail.SetCellBgColor( 1, G2_PLAN_QTY, grdDetail.rows - 1, G2_PLAN_QTY, 0xCCFFFF );
                grdDetail.Subtotal( 0, 2, -1, '5!6','###,###,###');
            }    
        break;
        
        case 'pro_fpip00101':
            for ( var i=1 ; i<grdDetail.rows-1; i++)
            {
                grdDetail.SetGridText( i, G2_OPLAN_M_PK, txtPlanPK.text );                
                grdDetail.SetGridText( i, G2_STYLE_PK, txtStylePK.text   );
                grdDetail.SetGridText( i, G2_ARR_SO_PK,   txtArraySOPK.text );                
                grdDetail.SetGridText( i, G2_REF_PO_NO,     txtSOPO.text      );                
            }
            
            data_fpip00101_2.Call();
        break;
        
        case 'data_fpip00101_2':
            window.returnValue = 1; 
            this.close();   
        break;        
    }
}

//=======================================================================
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
    
    if ( col == G2_PLAN_QTY )
    {
        var dQuantiy;
        
        dQuantiy =  grdDetail.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText(row,col,"")
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"")
        }         
        //---------------------------------------------
        grdDetail.Subtotal( 0, 2, -1, '5!6','###,###,###');
    } 

 }
//=======================================================================

function OnSearch(obj)
{
    switch(obj)
    {
        case 'Style':
            data_fpip00101.Call();
        break;
    
        case 'grdDetail':
            data_fpip00101_1.Call("SELECT");
        break;
        
        case 'Plan':
            pro_fpip00101.Call("SELECT");
        break;        
    }
}

//=======================================================================

function OnSave(pos)
{
    switch (pos)
    {
        case 'ProdPlan':
            if ( CheckData() )
            {
                if ( confirm("Do you want to make order plan for " + txtSOPO.text + " ? ") )
                {
                    pro_fpip00101.Call();
                }    
            }    
        break;
    }    
}

//=======================================================================
function CheckData()
{
    if ( dtFrom.value > dtTo.value )
    {
        alert("Pls check Plan Date.");
        return false ;
    }
    return true;
}
//=======================================================================

function OnDateChange(pos)
{
    switch (pos)
    {
        case 'FROM_DT':
			for ( var i=1; i<grdDetail.rows-1; i++ )
			{        
				grdDetail.SetGridText( i, G2_FROM_DT, dtFrom.value );  
            } 
        break;
		
		case 'TO_DT':
			for ( var i=1; i<grdDetail.rows-1; i++ )
			{        
				grdDetail.SetGridText( i, G2_TO_DT, dtTo.value );  
            } 
        break;
    }    
}

//=======================================================================
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_fpip00101" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_sel_fpip00101" > 
                <input>
                    <input bind="txtStylePK" /> 
                </input>                 
                <output> 
                    <output bind="txtStyleID" />
                    <output bind="txtStyleName" />                    
                    <output bind="txtSpecGroupPK01" />
                    <output bind="lbSpecGrp01" />                    
                    <output bind="txtSpecGroupPK02" />
                    <output bind="lbSpecGrp02" />
                    <output bind="txtSpecGroupPK03" />
                    <output bind="lbSpecGrp03" />
                    <output bind="txtSpecGroupPK04" />
                    <output bind="lbSpecGrp04" />
                    <output bind="txtSpecGroupPK05" />
                    <output bind="lbSpecGrp05" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00101_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpip00101_1"  > 
                  <input bind="grdDetail" > 
                    <input bind="txtArraySOPK" />
					<input bind="txtSpecGroupPK01" />
					<input bind="chkSpecGrp01" />
					<input bind="txtSpecGroupPK02" />
					<input bind="chkSpecGrp02" />
					<input bind="txtSpecGroupPK03" />
					<input bind="chkSpecGrp03" />
					<input bind="txtSpecGroupPK04" />
					<input bind="chkSpecGrp04" />
					<input bind="txtSpecGroupPK05" />
					<input bind="chkSpecGrp05" />																				
					<input bind="cboRate" />
					<input bind="txtStylePK" /> 	
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fpip00101" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpip00101" > 
                <input>
                    <input bind="txtStylePK" />
                    <input bind="txtArraySOPK" />
                    <input bind="txtSOPO" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="cboRate" />
                    <input bind="lstFactory" />
                    <input bind="txtDescription" />
                </input>                                  
                <output> 
                    <output bind="txtPlanPK" />                   
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00101_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="<%=l_user%>lg_sel_fpip00101_2" procedure="<%=l_user%>lg_upd_fpip00101_2" > 
                  <input bind="grdDetail" > 
                    <input bind="txtPlanPK" />																							
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            P/O No
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtSOPO" styles="width:100%" csstype="madatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Style
                        </td>
                        <td style="width: 39%; white-space: nowrap">
                            <gw:textbox id="txtStylePK" styles="display:none" />
                            <gw:textbox id="txtStyleID" styles="width:30%" csstype="madatory" />
                            <gw:textbox id="txtStyleName" styles="width:70%" csstype="madatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Plan DT
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnDateChange('FROM_DT')" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnDateChange('TO_DT')"  />
                        </td>
                        <td style="width: 1%; display: none">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Factory
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstFactory" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Description</td>
                        <td style="width: 39%; white-space: nowrap">
                            <gw:textbox id="txtDescription" maxlen="100" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space:nowrap" align="right">
                            Plan Rate
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:list id="cboRate" styles="width:100%" onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:icon id="btnSave" img="2" text="Save" onclick="OnSave('ProdPlan')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK01" styles="display:none" />
                            <gw:label id="lbSpecGrp01" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp01" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK02" styles="display:none" />
                            <gw:label id="lbSpecGrp02" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp02" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK03" styles="display:none" />
                            <gw:label id="lbSpecGrp03" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp03" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK04" styles="display:none" />
                            <gw:label id="lbSpecGrp04" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp04" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK05" styles="display:none" />
                            <gw:label id="lbSpecGrp05" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp05" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='Spec1|Spec2|Spec3|Spec4|Spec5|Ord Qty|Plan Qty|From|To|Description|_Spec01_PK|_Spec02_PK|_Spec03_PK|_Spec04_PK|_Spec05_PK|_tco_stitem_pk|_array_so_pk|_so_po_pk|_plan_pk|_ordplan_pk'
                    format='0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|1|1|1|1|3|3|1|1|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||' 
					editcol='0|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|2000|2000|2000|2000|1200|1200|1200|1200|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' acceptnulldate="T" 
					onafteredit="CheckInput()" />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtArraySOPK" styles='width:100%; display:none' />
<gw:textbox id="txtPlanPK" styles='width:100%; display:none' />
<!--------------------------------------------------------------------------->
</html>
