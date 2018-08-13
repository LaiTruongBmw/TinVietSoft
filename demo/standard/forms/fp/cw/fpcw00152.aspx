<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Pop Up Cutting W/I List</title>
</head>

<script>
var G_WI_PK         = 0,
    G_WI_Date       = 1,
    G_WI_No         = 2,
    G_Status        = 3,
    G_PO_No         = 4,
    G_Style         = 5,
    G_Pattern       = 6,
    G_Description   = 7;

//===========================================================
function BodyInit()
{
      //-----------------------------      
      dtWIFromDate.SetDataText(System.AddDate(dtWIToDate.GetData(),-30)); 
      //----------------------------- 
      OnChangeClose();
      //----------------------------- 
	  OnSearch();
} 
//===========================================================
function OnDataReceive(po_oData)
{
    switch(po_oData.id)
    { 
        case 'pro_fpcw00152' :
            alert(txtReturnValue.text);
            
            OnSearch() ;
        break;  
        
        case 'pro_fpcw00152_1' :
            alert(txtReturnValue.text);
            
            OnSearch() ;
        break; 
    }      
        
    lbRecord.text = grdDetail.rows-1 + " record(s)";
}
//===========================================================
function OnSelect()
{
    if ( chkClose.value == 'N' )
    {
        var code_data = new Array();	
        var rowNo = 0 ;
        var oGrid = grdDetail;
        
        code_data = new Array();
        
        if(grdDetail.row>0)   
            code_data[0] = grdDetail.GetGridData(grdDetail.row, 0) ;	
        
        window.returnValue = code_data; 
        this.close();
     }
     else
     {
        alert(' System allow to select the Opening W/I only. ');
     }   
}
//==============================================================================
function OnSearch()
{
    data_fpcw00152.Call("SELECT");
}
//==============================================================================
function OnChangeClose()
{
    if ( chkClose.value == "Y" ) 
    {
        btnClose.style.display   = "none" ;
        btnUnClose.style.display = "" ;
    }
    else
    {
        btnClose.style.display   = "" ;
        btnUnClose.style.display = "none" ;
    }
    
    OnSearch() ;
}

//==================================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'Close' :
            if ( grdDetail.row > 0 )
            {
                if ( confirm ('Do you want to close W/I : ' + grdDetail.GetGridData( grdDetail.row, G_WI_No) ))
                {
                    txtWIPK.text = grdDetail.GetGridData( grdDetail.row, G_WI_PK);
                    
                    pro_fpcw00152.Call();
                }    
            }
            else
            {
                alert('Pls select one W/I.');
            }            
        break;
        
        case 'UnClose' :
            if ( grdDetail.row > 0 )
            {
                if ( confirm ('Do you want to unclose W/I : ' + grdDetail.GetGridData( grdDetail.row, G_WI_No) ))
                {            
                    txtWIPK.text = grdDetail.GetGridData( grdDetail.row, G_WI_PK);
                    
                    pro_fpcw00152_1.Call();
                }    
            }
            else
            {
                alert('Pls select one W/I.');
            }            
        break;        
    }    
}
//==============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00152" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="0,1,2" function="<%=l_user%>lg_sel_fpcw00152" > 
                <input> 
                    <input bind="dtWIFromDate" />
                    <input bind="dtWIToDate" />                 
                    <input bind="txtSearchNo" />
                    <input bind="chkClose" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpcw00152" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00152" > 
                <input>
                    <input bind="txtWIPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00152_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00152_1" > 
                <input>
                    <input bind="txtWIPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 5%; white-space: nowrap">
                W/I Date
            </td>
            <td align="left" style="width: 30%; white-space: nowrap">
                <gw:datebox id="dtWIFromDate" lang="1" styles="width:100%" />
                ~
                <gw:datebox id="dtWIToDate" lang="1" styles="width:100%" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                PO/Style</td>
            <td style="width: 30%">
                <gw:textbox id="txtSearchNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="center">
                Close
                <gw:checkbox id="chkClose" defaultvalue="Y|N" value="N" onchange="OnChangeClose()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="center">
                <gw:icon id="btnClose" img="2" text="Close" onclick="OnProcess('Close')" />
                <gw:icon id="btnUnClose" img="2" text="UnClose" onclick="OnProcess('UnClose')" />
            </td>
            <td style="width: 9%; white-space: nowrap" align="center">
                <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
            </td>
        </tr>
        <tr id='top' style="height: 99%">
            <td colspan="8">
                <gw:grid id="grdDetail" header='_pk|W/I Date|W/I No|Status|P/O No|Style|Pattern|Description'
                    format='0|4|0|0|0|0|0|0' aligns='0|0|0|1|0|0|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|1200|1500|1500|1500|2500|2000|1000' styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnSelect()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIPK" styles='display:none;width:100%' />
    <gw:textbox id="txtReturnValue" styles='display:none;width:100%' />
    <!------------------------------------------------------------------>
</body>
</html>
