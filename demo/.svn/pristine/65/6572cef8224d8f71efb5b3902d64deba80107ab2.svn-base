<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Spec</title>
</head>

<script type="text/javascript" language="javascript">
 
//--------------------------------------------------------

function BodyInit()
{
    System.Translate(document);
    var spec_pk ="<%=request.QueryString("spec_pk")%>"; 
    txtMasterPK.text=spec_pk;
    fpip00104_group.Call("SELECT");
    txtItemGroup.SetEnable(false);
}
//---------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'fpip00104_group':
            fpip00104_Spec.Call("SELECT");
        break;
    }
}
//--------------------------------------------------------
function OnSearch()
{
    fpip00104_Spec.Call("SELECT");
}
//--------------------------------------------------------
function OnSelect()
{
    var code_data = new Array();       
    if ( idGrid.row > 0 )
    {
        for( j=0 ; j<idGrid.cols ; j++ )
        {
            code_data[j] = idGrid.GetGridData(idGrid.row , j );
        } 
    }
    else
    {
        for( j=0 ; j<idGrid.cols ; j++ )
        {
            code_data[j] = '';
        } 	    
    }
    //----------------------------
    window.returnValue = code_data; 
    this.close(); 	
}
//--------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="fpip00104_group" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="<%=l_user%>lg_sel_fpip00104_group" > 
             <inout> 
                <inout  bind="txtMasterPK" />                 
                <inout  bind="txtReturnValue" />   
                <inout  bind="txtItemGroup" />         
            </inout>
            </dso>  
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpip00104_Spec" onreceive="OnDataReceive(this)"> 
        <xml>                                   
             <dso id="1" type="grid"   function="<%=l_user%>lg_sel_fpip00104_spec" > 
              <input  bind="idGrid">
                    <input bind="txtReturnValue" />
                    <input bind="txtSpec" />
                </input>
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            Group</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtItemGroup" styles="width:100%" />
                        </td>
                        <td style="width: 5%">
                            Spec</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSpec" styles="width:100%" />
                        </td>
                        <td style="width: 50%">
                            
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td>
                            <gw:grid id='idGrid' header='_PK|Spec ID|Spec Name|Spec lname|Spec fname|_Remark|Group Name|_TCO_SPECGRP_PK|_TCO_ITEMGRP_PK|_TCO_BUSPARTNER_PK|Partner Name|_PARENT_SPEC_ID'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|2000|1500|1500|1000|1500|1000|1000|1000|1500|1000'
                                sorting='T'  styles='width:100%; height:100%' oncelldblclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txt_tco_stitem_pk" text="" styles="display:none; width:100%" />
    <gw:textbox id="txt_stmapping_yn" text="" styles="display:none; width:100%" />
    <gw:textbox id="txtSpecPK" text="" styles='display:none' />
    <gw:textbox id="txtReturnValue" text="" styles='display:none' />
    <gw:textbox id="txtMasterPK" text="" styles='display:none' />
    <!------------------------------------------------------------------------------>
</body>
</html>
