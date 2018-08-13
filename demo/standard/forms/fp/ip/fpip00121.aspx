<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Plan Detail</title>
</head>

<script>
//============================================================================================
     function BodyInit()
     {  
         System.Translate(document);		         
		 
         FormatGrid();
     } 
//============================================================================================
    function OnSearch()
    {    
        search_fpip00031.Call('SELECT');
    }
//============================================================================================
    function FormatGrid()
    {
		var data = "";
        data = "<%=ESysLib.SetListDataSQL("SELECT   pk, group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY group_name")%>||";
        lstLineGroup.SetDataText( data);
		lstLineGroup.value = '';
		//--------------------------------------------
		var line_group_pk = "<%=Request.querystring("line_group_pk")%>";
		
		if ( Number(line_group_pk) > 0 )
		{
			lstLineGroup.value = line_group_pk;
		}
		//-------------------------------------------- 
        grdSearch.GetGridControl().MergeCells  = 2 ;	
        grdSearch.GetGridControl().MergeCol(0) = true ;	
        grdSearch.GetGridControl().MergeCol(1) = true ;   	
        grdSearch.GetGridControl().MergeCol(2) = true ;	
        grdSearch.GetGridControl().MergeCol(3) = true ;	
        grdSearch.GetGridControl().MergeCol(4) = true ;   	
        grdSearch.GetGridControl().MergeCol(5) = true ;	
        grdSearch.GetGridControl().MergeCol(6) = true ;	
        grdSearch.GetGridControl().MergeCol(7) = true ;   	
        grdSearch.GetGridControl().MergeCol(8) = true ;	
        grdSearch.GetGridControl().MergeCol(9) = true ;	
        grdSearch.GetGridControl().MergeCol(10) = true ; 
    }
//============================================================================================
    function OnSave()
    {
       search_fpip00031.Call();
    }
 
//============================================================================================
function OnDelete()
{
    if ( grdSearch.row > 0 )
    {
        if ( grdSearch.GetGridData( grdSearch.row, 2) == '' ) 
        {
	        grdSearch.RemoveRowAt( grdSearch.row ); 			
	    }
	    else			
	    {
	        grdSearch.DeleteRow();
	    }
	}  
}
//=======================================================================
function OnUnDelete()
{    
    grdSearch.UnDeleteRow();
}
//=======================================================================
function OnDataReceive()
{
    if(grdSearch.rows > 1)
    {
        grdSearch.SetCellBold( 1, 12, grdSearch.rows - 1, 12, true);
    }
}
//=======================================================================
</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="search_fpip00031" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function = "<%=l_user%>lg_sel_fpip00031" procedure="<%=l_user%>lg_upd_fpip00031" > 
                    <input >
                        <input bind="lstLineGroup" /> 
					    <input bind="txtPOStyle" />
                        <input bind="dtDateFrom" /> 
                        <input bind="dtDateTo" />                       
                    </input> 
                     <output bind="grdSearch" />                      
                </dso> 
            </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%" id="tab_bottom">
           
                        <td style="width: 1%; white-space: nowrap" align="right">
                            L/G
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:list id="lstLineGroup" styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="right">
                            PO/Style
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:textbox id="txtPOStyle" styles='width:100%;' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:datebox id="dtDateFrom" lang="1" styles='width:100%;' onchange="OnSearch()" />
                            ~
                            <gw:datebox id="dtDateTo" lang="1" styles='width:100%;' onchange="OnSearch()" />
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="center">                            
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 99%;">
                        <td colspan="21">
                            <gw:grid id='grdSearch' header='_pb_line_pk|Line ID|Seq|_pp_ordplan_pk|Ref P/O|Style|_spec01_pk|_spec02_pk|_spec03_pk|_spec04_pk|_spec05_pk|Spec|Plan Date|Plan Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|4|1' 
								aligns='0|0|1|0|0|0|0|0|0|0|0|0|1|0' check='|||||||||||||'
                                editcol='0|0|1|0|0|0|0|0|0|0|0|0|0|1' 
								widths='0|1000|800|0|1200|2500|0|0|0|0|0|3000|1200|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
        </tr>
    </table>  
</body>
</html>
