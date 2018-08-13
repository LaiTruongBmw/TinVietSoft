<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET WORK PROCESS</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_WP_PK         = 0,
    G_Seq           = 1,
    G_Process_PK    = 2,
    G_WP_ID         = 3,
    G_WP_Name       = 4,
    G_Description   = 5;

var line_pk        = "<%=request.QueryString("line_pk") %>"  ;
var process_pk     = "<%=request.QueryString("process_pk") %>"  ;
var tco_stitem_pk  = "<%=request.QueryString("tco_stitem_pk") %>"  ; 

//=======================================================================
function BodyInit()
{
	System.Translate(document);
    var data=""; 
       
    data = "<%=CtlLib.SetListDataSQL("select pk, process_id || ' * ' || process_name from tlg_pb_process v where del_if = 0 and use_yn = 'Y' ORDER BY process_id ")%>";   
    lstProcess.SetDataText(data);
          
    if ( Number(process_pk) > 0 )
    {     
        lstProcess.SetEnable(false); 
        lstProcess.value = Number(process_pk) ;
    }
    else if ( Number(tco_stitem_pk) > 0 || Number(line_pk) > 0 )
    {
        txtSTItemPK.text = tco_stitem_pk;
        txtLinePK.text   = line_pk;
        
        pro_fpab00430.Call();
    }
                         
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00430.Call('SELECT')
 }
   
//=======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

//=======================================================================
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    for( j=0 ; j < oGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}

//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case'pro_fpab00430':
            OnSearch();
        break;
        
        case 'data_fpab00430' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G_Seq, grdDetail.rows - 1, G_Seq, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpab00430" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_fpab00430" > 
                <input>
                    <input bind="txtSTItemPK" /> 
                    <input bind="txtLinePK" /> 
                </input> 
                <output>
                    <output bind="lstProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00430" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00430"  > 
			    <input bind="grdDetail" >
			        <input bind="lstProcess" />			
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Process
            </td>
            <td style="width: 85%">
                <gw:list id="lstProcess" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 8%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdDetail' header='_PK|Seq|_process_pk|W/P ID|W/P Name|Remark'
                    format='0|0|0|0|0|0' aligns='0|1|0|0|0|0' editcol='0|0|0|0|0|0' widths='0|800|0|2000|4000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdDetail)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtSTItemPK" text="" styles="display:none" />
<gw:textbox id="txtLinePK" text="" styles="display:none" />
<!---------------------------------------------------------------------->
</html>
