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

var G_GRP_PK  = 0,
    G_SEQ     = 1,
    G_GRP_CD  = 2,
    G_GRP_NM  = 3,
    G_UOM     = 4,
    G_REMARK  = 5;

//===================================================================================================
  
function BodyInit()
{
    System.Translate(document); 
   
    var parent_pk = "<%=request.QueryString("parent_pk")%>";
	
    if ( Number(parent_pk) > 0 )
	{
		txtParentPK.text = parent_pk;
	}
    //-----------------------
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM tco_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompany.SetDataText(data);
	
	var company_pk = "<%=request.QueryString("company_pk")%>";
	
    if ( Number(company_pk)  > 0 )
    {
        cboCompany.value = company_pk;
    }
    
    //----------------------------------------         
    OnSearch();
}
//===================================================================================================
function OnSearch()
{
     data_fpab00310.Call("SELECT");
}

//===================================================================================================
function OnSave()
{
     data_fpab00310.Call();
}
//===================================================================================================

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

//===================================================================================================
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="data_fpab00310" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_fpab00310" procedure="st_lg_upd_fpab00310" > 
                  <input bind="grdGroup" >
				  	<input bind="cboCompany" />                     
					<input bind="txtParentPK" />
                    <input bind="txtGroup" />                     			                 
                  </input>
                <output bind="grdGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%">		 
        <tr style="height: 1%">   
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
            <td style="width: 3%" align="right">
            </td>                         
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
			<td style="width: 1%" align="right">
                <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>                    
        </tr>
        <tr style="height: 98%">
            <td colspan=8>
                <gw:grid id='grdGroup' 
					header='_PK|Seq|Group Code|Group Name|UOM|Remark'
                    format='0|0|0|0|0|0' 
					aligns='0|1|0|0|1|0' 
					editcol='0|1|0|0|0|0'
                    widths='0|1000|2500|3000|800|1000' 
					sorting='T'
                    styles='width:100%; height:100%' 
					oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
	<gw:textbox id="txtParentPK" styles="width:100%;display:none" />
</body>
</html>
