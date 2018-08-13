<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Item Group</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

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
    System.Translate(document); 
	
    var company_pk      = "<%=request.QueryString("company_pk")%>";
	    
    //-----------------------
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM  TCO_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompany.SetDataText(data);

    if ( company_pk  > 0 )
    {
        cboCompany.value = company_pk;
		
		cboCompany.SetEnable(false);
    }
    
    //---------------------------------------- 
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk, wh_id || ' * ' || wh_name  from tlg_in_WAREHOUSE where del_if = 0 and use_yn='Y' " )%>" ; 
    grdGroup.SetComboFormat(G_WH,data);    
    
    //----------------------------------------          
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
//-----------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
           
    }
}
//-------------------------------------------------------------
</script>

<body>    
    <!--------------------------------------------->
    <gw:data id="data_agci00111" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_agci00111" > 
                  <input bind="grdGroup" > 
                    <input bind="cboCompany" />
                    <input bind="txtGroup" />		                 
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
                        <td style="width: 10%" align="right">
                            Company
                        </td>
                        <td style="width: 30%">
                            <gw:list id="cboCompany" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Group
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtGroup" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdGroup' 
					header='_PK|Group Code|Group Name|_null|_null|_null|_STSeqLength|W/H|Remark|_GrpCD_Display|_UOM|_WT UOM|_Lot UOM|_PHOTO_PK'
                    format='0|0|0|3|3|3|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|1|1|1|1' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|4000|0|0|0|0|1500|1000|0|0|0|0|0' sorting='T'
                    styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------> 
</body>
</html>
