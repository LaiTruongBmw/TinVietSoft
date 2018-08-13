<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Get Order Plan Details</title>
</head>

<script>

var v_language  = "<%=Session("SESSION_LANG")%>";
var emp_pk      = "<%=Session("EMPLOYEE_PK") %>";
var full_name   = "<%=Session("USER_NAME") %>";

var G1_ORDPLAN_M_PK     = 0,
    G1_REF_PO_NO        = 1,
    G1_DELI_TO_PK       = 2,
    G1_NULL_01          = 3, 
    G1_PARTNER_NAME     = 4,
    G1_ITEMGRP_PK       = 5,
    G1_GRP_CD           = 6,
    G1_GRP_NM           = 7,
    G1_STYLE_PK         = 8,
    G1_ITEM_CODE        = 9,
    G1_ITEM_NAME        = 10,
    G1_FROM_DT          = 11,
    G1_TO_DT            = 12,
    G1_REMARK           = 13;   
    
var G2_PP_ORDPLAN_PK    = 0,
    G2_REF_PO_NO        = 1,
	G2_COMP_PK			= 2,
	G2_COMP_ID			= 3,
	G2_COMP_NAME		= 4,
    G2_SPEC01_PK        = 5,
    G2_SPEC01_ID        = 6,
    G2_SPEC02_PK        = 7,
    G2_SPEC02_ID        = 8,
    G2_SPEC03_PK        = 9,
    G2_SPEC03_ID        = 10,
    G2_SPEC04_PK        = 11,
    G2_SPEC04_ID        = 12,
    G2_SPEC05_PK        = 13,
    G2_SPEC05_ID        = 14,     
    G2_PLAN_QTY         = 15,
    G2_PROD_QTY         = 16,
    G2_BAL_QTY          = 17;
        
//=======================================================================
   
function BodyInit()
{
    System.Translate(document);
    //-------------------------------
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
    //-------------------------------
    FormatGrid();    
    //------------------------------- 
    OnHide();
    //-------------------------------
    OnSearch('grdOrdPlan');
    //-------------------------------   
 
}
//=======================================================================
function FormatGrid()
{
    var ctrl = grdDetail.GetGridControl();  
      
    ctrl.MergeCells = 2;
    ctrl.MergeCol(G2_REF_PO_NO)  = true;
    ctrl.MergeCol(G2_SPEC01_ID) = true;
    ctrl.MergeCol(G2_SPEC02_ID) = true;
    ctrl.MergeCol(G2_SPEC03_ID) = true;
    ctrl.MergeCol(G2_SPEC04_ID) = true;
    ctrl.MergeCol(G2_SPEC05_ID) = true;

    ctrl.ColFormat(G2_PLAN_QTY)   = "###,###,###,###";
    ctrl.ColFormat(G2_PROD_QTY)   = "###,###,###,###";
    ctrl.ColFormat(G2_BAL_QTY)    = "###,###,###,###";  
	
	grdDetail.GetGridControl().MergeCells   = 2 ;	
    grdDetail.GetGridControl().MergeCol(0)  = true ;	
    grdDetail.GetGridControl().MergeCol(1)  = true ;   	
    grdDetail.GetGridControl().MergeCol(2)  = true ;
	grdDetail.GetGridControl().MergeCol(3)  = true ;
	grdDetail.GetGridControl().MergeCol(4)  = true ;
	grdDetail.GetGridControl().MergeCol(5)  = true ;
	grdDetail.GetGridControl().MergeCol(6)  = true ;
	grdDetail.GetGridControl().MergeCol(7)  = true ;
	grdDetail.GetGridControl().MergeCol(8)  = true ;
	grdDetail.GetGridControl().MergeCol(9)  = true ; 
	grdDetail.GetGridControl().MergeCol(10) = true ; 
	grdDetail.GetGridControl().MergeCol(11) = true ; 
	grdDetail.GetGridControl().MergeCol(12) = true ; 
	grdDetail.GetGridControl().MergeCol(13) = true ; 
	grdDetail.GetGridControl().MergeCol(14) = true ;       
}



//=======================================================================
var p_search_specgrp = 0;

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fppw00051':
            lbRecord.text = grdOrdPlan.rows-1 + " (s)";
			
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBold( 1, G1_REF_PO_NO, grdOrdPlan.rows-1, G1_REF_PO_NO, true);
                grdOrdPlan.SetCellBold( 1, G1_GRP_CD,    grdOrdPlan.rows-1, G1_GRP_CD,    true);
                grdOrdPlan.SetCellBold( 1, G1_ITEM_CODE, grdOrdPlan.rows-1, G1_ITEM_CODE, true);
				
                grdOrdPlan.SetCellBgColor( 1, G1_ITEM_CODE, grdOrdPlan.rows-1, G1_ITEM_NAME, 0xCCFFFF );              
            }            
        break;
        
        case 'pro_fppw00051_2':
         
            p_search_specgrp = 0 ; 
                
            OnHide();           
            //-----------------------
            if ( lbSpecGrp01.text != '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC01_ID, 0, G2_SPEC01_ID) = lbSpecGrp01.text;
                
                chkSpecGrp01.value = 'Y';
                document.all("chkSpecGrp01").style.display      = ""    ;
                grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = false ;
            }
            
            if ( lbSpecGrp02.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC02_ID, 0, G2_SPEC02_ID) = lbSpecGrp02.text;
                
                chkSpecGrp02.value = 'Y';
                document.all("chkSpecGrp02").style.display      = ""    ;
                grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = false ;                                
            } 
            
            if ( lbSpecGrp03.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC03_ID, 0, G2_SPEC03_ID) = lbSpecGrp03.text;
                
                chkSpecGrp03.value = 'Y';
                document.all("chkSpecGrp03").style.display      = ""    ;
                grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = false ;                
            }  
            
            if ( lbSpecGrp04.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC04_ID, 0, G2_SPEC04_ID) = lbSpecGrp04.text;
                
                chkSpecGrp04.value = 'Y';
                document.all("chkSpecGrp04").style.display      = ""    ;
                grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;                
            }
            
            if ( lbSpecGrp05.text!= '' )
            {
                grdDetail.GetGridControl().Cell(0, 0, G2_SPEC05_ID, 0, G2_SPEC05_ID) = lbSpecGrp05.text;
                
                chkSpecGrp05.value = 'Y';
                document.all("chkSpecGrp05").style.display      = ""    ;
                grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ;                
            }
            //----------------------------------
            p_search_specgrp = 1;    
            //----------------------------------
            OnSearch("Spec"); 
            //---------------------------------- 
        break;
        
        case 'data_fppw00051_2':
            if ( grdDetail.rows > 1 )
            {
                 
                grdDetail.SetCellBold( 1, G2_PLAN_QTY, grdDetail.rows - 1, G2_PLAN_QTY, true);				
                grdDetail.SetCellBold( 1, G2_PROD_QTY, grdDetail.rows - 1, G2_PROD_QTY, true);
                grdDetail.SetCellBold( 1, G2_BAL_QTY,  grdDetail.rows - 1, G2_BAL_QTY,  true);
                
                grdDetail.SetCellBgColor( 1, G2_PLAN_QTY,  grdDetail.rows - 1, G2_PLAN_QTY,  0xCCFFFF );
                
                grdDetail.Subtotal( 0, 2, -1, '15!16!17','###,###,###');                
            }    
        break; 
        		
		case "pro_fppw00051" :
			pro_fppw00051_1.Call();   
		break;		
		
		case "pro_fppw00051_1":
			pro_fppw00051_2.Call();
		break;    
    }
}
//=======================================================================

function OnCellClk(obj)
{
    switch (obj.id)
    {
        case 'grdOrdPlan' :
            p_search_specgrp = 1 ;
        break;
    }    
}

//=======================================================================

function OnHide()
{
    chkSpecGrp01.value = 'N';
    chkSpecGrp02.value = 'N';
    chkSpecGrp03.value = 'N';
    chkSpecGrp04.value = 'N';
    chkSpecGrp05.value = 'N';
    
    document.all("chkSpecGrp01").style.display = "none";
    document.all("chkSpecGrp02").style.display = "none";
    document.all("chkSpecGrp03").style.display = "none";
    document.all("chkSpecGrp04").style.display = "none";
    document.all("chkSpecGrp05").style.display = "none";
    
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
    grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
    grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
    grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
    grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;    
}
 
//=======================================================================

function OnSearch(obj)
{
    switch(obj)
    {
        case 'grdOrdPlan':
			p_search_specgrp = 0 ;
			grdDetail.ClearData();
			//---------------------
            data_fppw00051.Call("SELECT");
        break;
    
        case 'grdDetail':
            	var array_grp_pk   = '';
			    var array_so_pk    = '';
				var array_so_no    = '';
				var array_style_pk = '';				
				
				var temp = '' ;
				
				p_search_specgrp = 0 ;
				
                for(var i = 1; i<grdOrdPlan.rows; i++)
                {
                    if ( grdOrdPlan.GetGridControl().isSelected(i) == true )
                    {  
						if ( grdOrdPlan.GetGridControl().isSelected(i) == true )
                    	{  
                        	array_so_pk    = array_so_pk    + temp + grdOrdPlan.GetGridData( i, G1_ORDPLAN_M_PK );
							array_style_pk = array_style_pk + temp + grdOrdPlan.GetGridData( i, G1_STYLE_PK     );
							array_so_no    = array_so_no    + temp + grdOrdPlan.GetGridData( i, G1_REF_PO_NO    );
							
                        	temp = ',';
                    	}
						//-------------
                        if ( array_grp_pk != '' && array_grp_pk != grdOrdPlan.GetGridData( i, G1_ITEMGRP_PK) )
                        {
                            alert('The group code must be the same');
                            return;
                        }
                        else
                        {
                            array_grp_pk = grdOrdPlan.GetGridData( i, G1_ITEMGRP_PK);
                        }
						//--------------
                    }
                }
				
				lbPONo.text          = array_so_no    ;
				txtArraySOPK.text    = array_so_pk    ;	
				txtArrayStylePK.text = array_style_pk ;	
                txtArrayGroupPK.text = array_grp_pk   ;
				//-------------------
                pro_fppw00051.Call();
				//-------------------         
        break;               
        
        case 'Spec':                  
            if ( p_search_specgrp == 0 )
			{
				alert("PLS QUERY AGAIN !");
			}
			else
			{ 
            	data_fppw00051_2.Call("SELECT"); 
			}	
        break;
    }
}

//=========================================================

function OnSelect(pos)
{
    switch (pos)
    {
        case 'Partial' :
            var arr_data = new Array();
            /* khong lay subtotal */
            for(var i = 1; i < grdDetail.rows-1; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
            
            /*if ( arr_data != null )
            {
                var callerWindowObj = dialogArguments;    
                  
                callerWindowObj.txtArraySOPK.text = txtArraySOPK.text ;
                callerWindowObj.txtPONo.text      = lbPONo.text       ; 
                
                callerWindowObj.txtStylePK.text   = txtStylePK.text ; 
                callerWindowObj.txtStyleName.text = txtStyleName.text ;                                 
            }*/
                      
            window.returnValue =  arr_data;
            window.close();
        break;
        
        case 'ALL' :
            var arr_data = new Array();  
			/* khong lay subtotal */          
            for(var i = 1; i < grdDetail.rows-1; i++ )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ ) 
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }             
                                  
            window.returnValue =  arr_data;
            window.close();
            
        break;        
    }        
}

//=========================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'PackBalance' :
            if ( grdOrdPlan.row > 0 )
            {
                if ( confirm('Do you want to calculate packing balance for this order ?') )
                {                     
                }    
            }
        break;
    }
} 
//=========================================================

</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_fppw00051" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppw00051"  > 
                <input bind="grdOrdPlan" >
			        <input bind="dtFrom" />
			        <input bind="dtTo" />
			        <input bind="txtRefNoBuyer" />
			        <input bind="txtGroupStyle" />
                </input>
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppw00051_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppw00051_2" > 
                <input>
                    <input bind="txtArrayGroupPK" /> 
                </input>                 
                <output>                 
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
    <gw:data id="data_fppw00051_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fppw00051_2"  > 
                  <input bind="grdDetail" > 
                    <input bind="lstWProcess" />
					<input bind="lstComponent" />
					<input bind="chkCompYN" />
					<input bind="chkQtyType" />
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
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fppw00051" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00051" >
                <input>
                    <input bind="txtArrayStylePK" />
                </input>
                <output>
                    <output bind="lstWProcess" />
                </output>
            </dso>
        </xml>
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fppw00051_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00051_1" >
                <input>
					<input bind="txtArrayStylePK" />
                    <input bind="lstWProcess" />
                </input>
                <output>
                    <output bind="lstComponent" />
                </output>
            </dso>
        </xml>
    </gw:data>	
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 50%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Ref No/Buyer
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtRefNoBuyer" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                            Group/Style
                        </td>
                        <td style="width: 25%; white-space: nowrap" align="center">
                            <gw:textbox id="txtGroupStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
                        </td>
						<td style="width: 14%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdOrdPlan')" />
                        </td>                                                 
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdOrdPlan' 
								header='_pp_ordplan_pk|Ref No|_deli_to_pk|_NULL|Partner Name|_itemgrp_pk|Group CD|Group NM|_style_pk|Style Code|Style Name|From Date|To Date|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|4|4|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|1|1|0'								
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|1500|0|0|2500|0|1500|2000|0|1500|2500|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
		<tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>  					  
						<td style="width: 5%; white-space: nowrap" align="right" >
							W/Process
						</td>                     
                        <td style="width: 20%; white-space: nowrap" align="center">
                            <gw:list id="lstWProcess" styles="width: 100%" onchange="pro_fppw00051_1.Call();"  />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right" >
							Comp
						</td>                     
                        <td style="width: 20%; white-space: nowrap" align="center">
                            <gw:list id="lstComponent" styles="width: 100%" onchange="OnSearch('Spec')"  />
                        </td>  
						<td style="width: 20%; white-space: nowrap" align="center">
                             <gw:checkbox id="chkCompYN" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')">Comp
							</gw:checkbox>
							
							<gw:checkbox id="chkQtyType" styles="color:blue" defaultvalue="0|1" value="1" onchange="OnSearch('Spec')">KG
							</gw:checkbox>
                        </td> 						                                                         
                        <td style="width: 27%; white-space: nowrap" align="center">
                            <gw:label id="lbPONo" styles='width:100%;font:8pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="btnQuery" img="2" text="Query" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="btnSelect" img="2" text="Select" onclick="OnSelect('Partial')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="select" alt="Select ALL" id="btnSelect01" onclick="OnSelect('ALL')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>		
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 18%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK01" styles="display:none" />
                            <gw:label id="lbSpecGrp01" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp01" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')" />
                        </td>
                        <td style="width: 18%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK02" styles="display:none" />
                            <gw:label id="lbSpecGrp02" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp02" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')" />
                        </td>
                        <td style="width: 18%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK03" styles="display:none" />
                            <gw:label id="lbSpecGrp03" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp03" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')" />
                        </td>
                        <td style="width: 18%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK04" styles="display:none" />
                            <gw:label id="lbSpecGrp04" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp04" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')" />
                        </td>
                        <td style="width: 18%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecGroupPK05" styles="display:none" />
                            <gw:label id="lbSpecGrp05" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 2%" align="left">
                            <gw:checkbox id="chkSpecGrp05" defaultvalue="Y|N" value="Y" onchange="OnSearch('Spec')" />
                        </td>                         
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdDetail' 
					header='_pp_ordplan_pk|P/O No|_Comp_PK|Comp ID|Comp Name|_spec01_pk|Spec 01|_spec02_pk|Spec 02|_spec03_pk|Spec 03|_spec04_pk|Spec 04|_spec05_pk|Spec 05|Plan Qty|Prod Qty|Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3'                 				 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|0|1500|2500|0|1500|0|1500|0|1500|0|1500|0|1500|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtArrayGroupPK" styles='width:100%; display:none' />
<gw:textbox id="txtArraySOPK" styles='width:100%; display:none' />
<gw:textbox id="txtArrayStylePK" styles='width:100%; display:none' />
<gw:textbox id="txtStylePK" styles='width:100%;display:none' />
<gw:textbox id="txtStyleName" styles='width:100%;display:none' />
<!--------------------------------------------------------------------------->
</html>
