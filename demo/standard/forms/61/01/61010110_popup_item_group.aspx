<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Item Group</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

var G_WH            = 7,
    G_Description   = 8,
    G_GrpCD_Display = 9,
    G_UOM           = 10,
    G_W_UOM         = 11,
    G_Lot_UOM       = 12;

 //---------------------------------------------------------
  
function BodyInit()   
{
     txtProjectPK_popup.text   = "<%=request.QueryString("p_prjectPk")%>";
     txtProjectCodePopup.text  = "<%=request.QueryString("p_prjectcode")%>";
	 txtProjectNamePopup.text  = "<%=request.QueryString("p_prjectname")%>";
   
	
    var company_pk      = "<%=request.QueryString("company_pk")%>";
    var sale_yn         = "<%=request.QueryString("sale_yn")%>";
    var prod_yn         = "<%=request.QueryString("prod_yn")%>";
    //-----------------------
    if ( sale_yn == 'Y' )
    {
        txtSaleYN.text = sale_yn ;
    }
    //----------
    if ( prod_yn == 'Y' )  
    {  
        txtProdYN.text = prod_yn ;
    }    
    //-----------------------
    var data = "<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompany.SetDataText(data);

    if ( company_pk  > 0 )
    {
        cboCompany.value = company_pk;
    }
    
    //---------------------------------------- 
    data = "<%=ESysLib.SetGridColumnDataSQL("select pk, wh_id || '-' || wh_name  from TIN_WAREHOUSE where del_if = 0 and use_yn='Y' " )%>" ; 
    grdGroup.SetComboFormat(G_WH,data);    
    
    //----------------------------------------         
  //  OnSearch();
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{
     data_agci00111.Call("SELECT");
}
//-----------------------------------------------------------------------------------------------

function OnGridCellDoubleClick(oGrid)
{
        var code_data=new Array()
        
	    var ctrl = oGrid.GetGridControl();
	    
	    var index, rowNo
	    index = 0 ;
	    rowNo = 0 ;
	    if( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
	    {
            rowNo = event.row;
            for( j=0 ; j<oGrid.cols -1 ; j++ )
            {
                code_data[index] = oGrid.GetGridData(rowNo , j );
                index ++;
            } 
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
} 
function OnPopUp()
{
	var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
					var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
					if(aValue != null)
					{   
							txtProjectPK_popup.text = aValue[0];  
							txtProjectCodePopup.text = aValue[1];
							txtProjectNamePopup.text = aValue[2];  
							OnSearch();
					} 
}
//-------------------------------------------------------------
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="data_agci00111" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="sp_sel_kpac1011_popup" > 
                  <input bind="grdGroup" > 
                    <input bind="cboCompany" />
                    <input bind="txtGroup" />   
					<input bind="txtProjectPK_popup" />         					
                  </input>
                <output bind="grdGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0"> 
                    <tr>
					<td align="right" style="width: 6%" ><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp()">Project</a>&nbsp;</td>
					<td style="width: 64%"><gw:textbox id="txtProjectCodePopup" readonly="true" styles='width:35%' /><gw:textbox id="txtProjectNamePopup"  readonly="true" styles='width:64%' /></td>
					<td ><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProjectNamePopup.text='';txtProjectCodePopup.text='';txtProjectPK_popup.text='';" /></td>
					<td >
                         <gw:textbox id="txtProjectPK_popup"  readonly="true" styles='width:100%;display:none' />   
                    </td>
					 <td style="width: 1%" align="right">
                            Group
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtGroup" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 4%" align="right">
                            
                        </td>
                        <td style="width: 1%">
                            <gw:list id="cboCompany" styles="width:100%;display:none" onchange="OnSearch()" />
                        </td>
                       
            
                        <td style="width: 3%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdGroup' header='_PK|Group Code|Group Name|_Parentundertakelevelcode|_parentundertakelevelname|_undertakechangeseq|_undertakefulllevelcode|_undertakelevel|Undertake Level Name(F)|_undertakelevelname_l|_parent_pk|_leaf_yn|_tco_company_pk|_tecps_projectsumm_pk'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|1|1|1|1' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1500|5000|1000|1000|1000|1000|2000|1000|1000|1000|1000|1000|1000' sorting='T' autosize="T"
                    styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txtSaleYN" text="" styles="width:100%;display:none" />
    <gw:textbox id="txtProdYN" text="" styles="width:100%;display:none" />
    <!--------------------------------------------->
</body>
</html>
