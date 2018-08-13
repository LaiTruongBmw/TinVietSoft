<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET SPEC FROM ORDER PLAN</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_No            = 0,
    G_Spec_Grp      = 1,
    G_tco_spec_pk   = 2,
    G_Spec_ID       = 3,
    G_Spec_Name     = 4,
    G_Description   = 5;

var pp_ordplan_pk = "<%=request.QueryString("pp_ordplan_pk") %>";
var spec_seq      = "<%=request.QueryString("spec_seq") %>"  ;

//=======================================================================
function BodyInit()
{   
	System.Translate(document);  
    txtOrdPlanPK.text = pp_ordplan_pk;
    txtSpecSeq.text   = spec_seq;
    
    OnSearch('SPECGRP');
               
    if ( Number(tco_stitem_pk) > 0 )
    {
        txtSTItemPK.text = tco_stitem_pk;
        pro_fpab00090.Call();
    }    
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00090.Call('SELECT')
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
        case 'data_fpab00090' :
            if ( grdSpec.rows > 1 )
            {
                grdSpec.SetCellBgColor( 1, 0, grdSpec.rows - 1, 0, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpab00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_fpab00090" > 
                <input>
                    <input bind="txtSTItemPK" /> 
                </input> 
                <output>
                    <output bind="lstSpecGrp" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00090" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00090"  > 
			    <input bind="grdSpec" >
			        <input bind="txtSTItemPK" /> 
			        <input bind="lstSpecGrp" />	
			        <input bind="txtSpec" />		
			    </input> 
			    <output bind="grdSpec" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%">
                Spec
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 57%">
            </td>
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSpec)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdSpec)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="6">
                <gw:grid id='grdSpec' header='No|_Spec Grp|_tco_spec_pk|Spec ID|Spec Name|Description'
                    format='0|0|0|0|0|0' aligns='1|0|0|0|0|0' editcol='0|0|0|0|0|0' widths='600|2000|0|2000|4000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdSpec)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtSTItemPK" text="" styles="display:none" />
<!---------------------------------------------------------------------->
</html>
