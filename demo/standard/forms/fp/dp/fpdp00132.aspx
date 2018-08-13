<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET SPEC</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
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

var group_type    = "<%=request.QueryString("group_type") %>"  ;
var specgrp_pk    = "<%=request.QueryString("specgrp_pk") %>"  ;
var tco_stitem_pk = "<%=request.QueryString("tco_stitem_pk") %>"  ;

//=======================================================================
function BodyInit()
{
    System.Translate(document);
    if ( group_type == 1 )
    {
        data = "<%=ESysLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 and ( grp_type = 1 or grp_type is null ) order by specgrp_nm ")%>";                 
    }
    else if ( group_type == 2 ) 
    {
        data = "<%=ESysLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 and ( grp_type = 2 or grp_type is null ) order by specgrp_nm ")%>";             
    }
    else
    {
        data = "<%=ESysLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 order by specgrp_nm ")%>";         
    }
    lstSpecGrp.SetDataText(data);
    
               
    if ( Number(tco_stitem_pk) > 0 )
    {
        txtSTItemPK.text = tco_stitem_pk;
        data_fpdp00132.Call();
    }
    else if ( Number(specgrp_pk) > 0 )
    {     
        lstSpecGrp.SetEnable(false); 
        lstSpecGrp.value = specgrp_pk ;
    } 
    
     
    
}
//=======================================================================

 function OnSearch()
 {
    data_fpdp00132_1.Call('SELECT')
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
        case 'data_fpdp00132' :
            if ( Number(specgrp_pk) > 0 )
            {     
                lstSpecGrp.SetEnable(false); 
                lstSpecGrp.value = specgrp_pk ;
            } 
            
        break;
         case 'data_fpdp00132_1' :
           
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
    <gw:data id="data_fpdp00132" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpdp00132" > 
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
    <gw:data id="data_fpdp00132_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpdp00132"  > 
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
            <td style="width: 5%; white-space: nowrap">
                Spec Group
            </td>
            <td style="width: 50%">
                <gw:list id="lstSpecGrp" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%">
                Spec
            </td>
            <td style="width: 37%">
                <gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSpec)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdSpec)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="7">
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
