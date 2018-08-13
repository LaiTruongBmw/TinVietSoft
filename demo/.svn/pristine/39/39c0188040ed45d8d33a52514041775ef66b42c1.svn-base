<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser("sale")%>
<head id="Head1" runat="server">
    <title>Version Checking</title>
</head>

<script>
var iMColOBJNo = 0;

//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document); 
    BindingData();
   
}
//--------------------------------
function BindingData()
{
    var data;
    
    data = "DATA|PROD|PROD|SALE|SALE|ACNT|ACNT|INV|INV|HR|HR|IMEX|IMEX|ESYS|ESYS|COMM|COMM";
    lstUser.SetDataText(data);
    //--------------------------------

    data = "DATA|1|INDEX|2|TABLE|4|VIEW|6|SEQUENCE|7|PROCEDURE|8|FUNCTION";
    
    lstType.SetDataText(data);
    lstType.value = '7';
    //--------------------------------

}

//------------------------------------------------------------

 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
        case 'agds00020' :
            txtObjNo.SetDataText('');
            agds00020_1.Call("SELECT");
        break;
      }  
 }
 
//------------------------------------------------------------

function loadVersionDetail()
{
    var lRow = event.row;
    
    var lObjNo ;
    
    if(event.row > 0)
    {   
        lObjNo = grdVersion.GetGridData(lRow, iMColOBJNo);
        
        txtObjNo.SetDataText(lObjNo); 
               
        agds00020_1.Call("SELECT");
    }
    
} 
//------------------------------------------------------------
function OnSearch()
{
    agds00020.Call("SELECT");
}
//------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="agds00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,3,4" function="sale.sp_sel_agds00020" > 
                <input bind="grdVersion"> 
                    <input bind="lstType" />
                    <input bind="dtDateFrom" />
                    <input bind="dtDateTo" />
                    <input bind="lstUser" />
                 </input>
               <output  bind="grdVersion"/>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="agds00020_1" onreceive=""> 
        <xml> 
            <dso type="grid" parameter="0,1,3,4" function="sale.sp_sel_agds00020_1" > 
                <input bind="grdVersionDetail"> 
                    <input bind="txtObjNo" />
                 </input>
               <output  bind="grdVersionDetail"/>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table width="100%" border="1">
        <tr>
            <td colspan="2">
                <table width="100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            USER
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstUser" styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Type
                        </td>
                        <td style="width: 20%" align="left">
                            <gw:list id="lstType" styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" styles="width:100%" align="right">
                            Date
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:datebox id="dtDateFrom" lang="1" styles='width:80%' />
                        </td>
                        <td style="width: 10%" align="left">
                            ~<gw:datebox id="dtDateTo" lang="1" styles='width:80%' />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:imgbtn id="btnOrderNoSearch" img="search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
            <tr>
                <td style="width: 40%">
                    <gw:grid id="grdVersion" header='_OBJ#|_DATAOBJ#|_OWNER#|NAME|_NAMESPACE|_SUBNAME|_TYPE#|_CTIME|MTIME|_STIME|_STATUS|_REMOTEOWNER|_LINKNAME|_FLAGS|_OID$|_SPARE1|_SPARE2|_SPARE3|_SPARE4|_SPARE5|_SPARE6'
                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        defaults='||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths='1000|1000|1000|4000|1000|1000|1000|2000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                        sorting='T' styles='width:100%; height:460' oncellclick="loadVersionDetail()"
                        acceptnulldate="true" />
                </td>
                <td style="width: 60%">
                    <gw:grid id='grdVersionDetail' header='_OBJ#|_LINE|SOURCE' format='0|0|0' aligns='0|1|0'
                        defaults='||' editcol='0|0|0' widths='1000|800|1000' sorting='T' styles='width:100%; height:460' />
                </td>
            </tr>
        </tr>
    </table>
    <gw:textbox id="txtObjNo" styles="display:none;" />
</body>
</html>
