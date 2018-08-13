<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>P/O Process Balance II</title>
</head>

<script>
    
var G_RGROUP		= 0,
	G_ORDPLAN_PK	= 1,
	G_REF_PO_NO		= 2,
	G_STYLE_PK		= 3,
	G_STYLE_CODE	= 4,
	G_STYLE_NAME	= 5,
	G_SPEC01_PK		= 6,
	G_SPEC01_ID		= 7,
	G_SPEC02_PK		= 8,
	G_SPEC02_ID		= 9,
	G_SPEC03_PK		= 10,
	G_SPEC03_ID		= 11,
	G_SPEC04_PK		= 12,
	G_SPEC04_ID		= 13,
	G_SPEC05_PK		= 14,
	G_SPEC05_ID		= 15,
	G_PLAN_QTY		= 16,
	G_CUT_QTY		= 17,
	G_PROCESS01_QTY	= 18,
	G_PROCESS02_QTY	= 19,
	G_PROCESS03_QTY = 20,
	G_PROCESS04_QTY = 21;
    
 //========================================================================
var callerWindowObj = dialogArguments;  

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //-----------------------------------------------------
    txtPlanPK.text = "<%=Request.querystring("plan_pk")%>";  
    FormatGrid();
     txtClose.text  = dialogArguments.chkClose.value;
      if(txtClose.text =='Y')
      {
         btnClose.style.display = "none" ;
      }else
      {
         btnUnClose.style.display = "none" ;
      }
	OnHiddenGrid();	
	OnSearch('header');  
    
}

//========================================================================
function FormatGrid()
{    
    var data="";    
   
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G_PLAN_QTY)      = "###,###,###,###";
    ctrl.ColFormat(G_CUT_QTY)       = "###,###,###,###"; 
    ctrl.ColFormat(G_PROCESS01_QTY) = "###,###,###,###";         
    ctrl.ColFormat(G_PROCESS02_QTY) = "###,###,###,###";
    ctrl.ColFormat(G_PROCESS03_QTY) = "###,###,###,###";
	ctrl.ColFormat(G_PROCESS04_QTY) = "###,###,###,###";
    //-----------------------------------    

    grdOrdPlan.GetGridControl().MergeCells  = 2 ;	
    grdOrdPlan.GetGridControl().MergeCol(0) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(1) = true ;   	
    grdOrdPlan.GetGridControl().MergeCol(2) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(3) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(4) = true ;
    grdOrdPlan.GetGridControl().MergeCol(5) = true ;
    grdOrdPlan.GetGridControl().MergeCol(6) = true ;
       
    //-----------------------------------
}     

 //========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {
            case 'grdOrdPlan' :
                data_fpip00131.Call("SELECT");
            break; 
			
			case 'header':
				data_fpip00131_header.Call('SELECT');
			break;			
      }  
 }
//==========================================================================

function OnHiddenGrid()
{
    grdOrdPlan.GetGridControl().ColHidden(G_SPEC01_ID) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G_SPEC02_ID) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G_SPEC03_ID) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G_SPEC04_ID) = true ;
	grdOrdPlan.GetGridControl().ColHidden(G_SPEC05_ID) = true ;
}
 //========================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "data_fpip00131" :
                var p_ordplan_pk ;
                
                if ( grdOrdPlan.rows > 1 )
                {
                    grdOrdPlan.SetCellBold( 1, G_REF_PO_NO, grdOrdPlan.rows - 1, G_REF_PO_NO, true);
                    grdOrdPlan.SetCellBold( 1, G_PLAN_QTY,  grdOrdPlan.rows - 1, G_PLAN_QTY,  true);
					
					grdOrdPlan.SetCellBgColor( 1, G_CUT_QTY,    grdOrdPlan.rows - 1, G_PROCESS04_QTY, 0xCCFFFF );
					grdOrdPlan.SetCellBgColor( 1, G_STYLE_CODE, grdOrdPlan.rows - 1, G_STYLE_CODE,    0xCCFFFF );
					grdOrdPlan.SetCellBgColor( 1, G_SPEC01_PK,  grdOrdPlan.rows - 1, G_SPEC05_ID,     0xCCFFFF );
					
                }   
                //------------------- 
                
                grdOrdPlan.Subtotal( 0, 2, -1, '15!16!17!18!19!20!21','###,###,###');               
            break;     
			
            case 'data_fpip00131_header':
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
                    grdOrdPlan.SetGridText(0,G_SPEC01_ID,col1);
                    grdOrdPlan.GetGridControl().ColHidden(G_SPEC01_ID) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdOrdPlan.SetGridText(0,G_SPEC02_ID,col2);
                    grdOrdPlan.GetGridControl().ColHidden(G_SPEC02_ID) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdOrdPlan.SetGridText(0,G_SPEC03_ID,col3);
                    grdOrdPlan.GetGridControl().ColHidden(G_SPEC03_ID) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdOrdPlan.SetGridText(0,G_SPEC05_ID,col4);
                    grdOrdPlan.GetGridControl().ColHidden(G_SPEC04_ID) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdOrdPlan.SetGridText(0,G_SPEC05_ID,col5);
                    grdOrdPlan.GetGridControl().ColHidden(G_SPEC05_ID) = false ;
                    
                }
            }
                data_fpip00131.Call('SELECT');
        	break;	
        	case 'pro_fpip00131':
        	    window.returnValue = '1'; 
		        this.close(); 
        	break;		       
      }
 }       
//==============================================================================
function OnProcess(obj)
{
    if(obj == 1)
    {
            if ( confirm('Do you want to Close this Plan?'))
            {
                 pro_fpip00131.Call()
                
            }  
    }else
    {
         if ( confirm('Do you want to Unclose this Plan?'))
            {
                 pro_fpip00131.Call()
                
            }  
    }
}
//==============================================================================
</script>

<body>
    <gw:data id="pro_fpip00131" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpip00131" > 
                <input>
                    <input bind="txtClose" />
                    <input bind="txtPlanPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpip00131_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00131_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00131" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2,3" function="<%=l_user%>lg_sel_fpip00131" > 
                <input> 
                    <input bind="txtPlanPK" />					
					<input bind="chkPercent" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Total">
        <tr style="height: 1%">	            		             
			<td style="width: 10%; white-space: nowrap" align="center">  
			View Percent(%)
            <gw:checkbox id="chkPercent" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdOrdPlan')"></gw:checkbox>							               
            </td>
			<td style="width: 80%" align="right">
            </td>
            <td style="width: 1%" align="left">
				<gw:icon id="btnClose" img="2" text="Close" styles='width:100%' onclick="OnProcess(1)" />
				<gw:icon id="btnUnClose" img="2" text="UnClose" styles='width:100%' onclick="OnProcess(2)" />
            </td>    			           
        </tr>
        <tr style="height: 99%">
            <td colspan="4">
				<gw:grid id='grdOrdPlan'
					header='R/G|_PP_ORDPLAN_PK|P/O No|_STYLE_PK|Style Code|Style Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Req Qty|Cut Qty|Prepare Qty|Sew Qty|QC Qty|Pack Qty'
						format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|3|3|3'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='1000|0|1500|0|1500|2000|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|1200|1200|1200'
						sorting='T'
						styles='width:100%; height:100%'
					/>
            </td>
        </tr>
    </table>
      <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />   
      <gw:textbox id="txtPlanPK" maxlen="100" styles='width:100%;display:none' />    
      <gw:textbox id="txtClose" maxlen="100" styles='width:100%;display:none' />   
	 <!------------------------------------------------------------------>
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%; display:none' /> 
	 <!------------------------------------------------------------------>
</body>
</html>
