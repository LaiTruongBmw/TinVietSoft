<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser("sys")%>
<head id="Head1" runat="server">
    <title>Version Checking</title>
</head>

<script>
var iSession_ID     = 0,
    iSerialNo       = 1,
    iOraUser        = 2,
    iOSUser         = 3,
    iLockedMode     = 4,
    iKilled         = 5;
    

function BodyInit()
{
    System.Translate(document); 
    BindingData();
   
}
//-----------------------------------------------------------------------
function BindingData()
{
    var data;
    data = "DATA|PROD|PROD|SALE|SALE|ACNT|ACNT|INV|INV|HR|HR|IMEX|IMEX|ESYS|ESYS|COMM|COMM|ALL|Select All";
    lstUser.SetDataText(data);
    lstUser.value = "ALL";    
}
//-----------------------------------------------------------------------
function OnDataReceive(objData)
{
    switch(objData.id)
    {
        case 'dat_agds00030':
            dat_agds00030_1.Call('SELECT');
        break;
    }
    
}
//-----------------------------------------------------------------------
function OnSearch()
{
    dat_agds00030.Call("SELECT");
}
//-----------------------------------------------------------------------
function OnSelectChange(Obj)
{
    switch(Obj.id)
    {
        case "lstUser":
            dat_agds00030.Call("SELECT");
        break;
    }
}   
//-----------------------------------------------------------------------
function OnKillSession()
{
    var i;
    if(grdLockedSess.rows > 1)
    {
        for(i=1; i < grdLockedSess.rows ; i++)
        {
            if(grdLockedSess.GetGridData(i, iKilled)== -1)
                dat_agds00030_1.Call();
        }
    }
    else
    if(grdSession.rows > 1)
    {
        for(i=1; i < grdSession.rows ; i++)
        {
            if(grdSession.GetGridData(i, iKilled)== -1)
                dat_agds00030.Call();
        }
    }    
}
//-----------------------------------------------------------------------
</script>
<body>
<gw:data id="dat_agds00030" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso type="grid" function="sale.sp_sel_agds00030" parameter="1,2" procedure="sale.sp_upd_agds00030" > 
            <input bind="grdSession"> 
                <input bind="lstUser" />
             </input>
           <output  bind="grdSession"/>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_agds00030_1" onreceive=""  > 
    <xml> 
        <dso type="grid" function="sale.sp_sel_agds00030_1" parameter="0,1" procedure="sale.sp_upd_agds00030" > 
            <input bind="grdLockedSess">                 
             </input>
           <output  bind="grdLockedSess"/>
        </dso> 
    </xml> 
</gw:data>

<table width="100%" cellpadding="0" cellspacing="0" border="1" style="height: 100%">
    <tr valign="top" style="height: 100%">
        <td id="left" style="width: 60%">
            <table width="100%" align="right">        
                    <tr>
                        <td width="10%">
                        </td>
                        <td width="30%" align="right" styles="width:100%">
                        USER:
                        </td>
                        <td width="20%" align="left">
                        <gw:list id="lstUser" styles='width:100%' onchange="OnSelectChange(this)" />
                        </td>
                        <td width="40%" align="right">
                        <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch()" />
                        </td>
                    </tr>                    
                    <tr>
                        <td colspan="4">
                        <gw:grid id="grdSession"
                        header='Process ID|Session ID|Serial No|Machine|User Name|Killed|OS User|Program'
                        format='0|0|0|0|0|3|0|0'
                        aligns='0|0|0|0|0|0|0|0'
                        defaults='|||||0||'
                        editcol='0|0|0|0|0|1|0|0'
                        widths='1000|1000|1000|1000|1000'
                        sorting='T'
                        styles='width:100%; height:460'
                        oncellclick=""
                        acceptNullDate="true"
                        />
                        </td>
                </tr>
            </table>        
        </td>
        <td id="right" style="width: 40%">
            <table width="100%">
                <tr>
                    <td width="80%" align="right">
                        <gw:icon id="idBtnKill" img="" text="Kill Session" onclick="OnKillSession()" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <gw:grid id="grdLockedSess"
                        header='Session ID|Serial#|Oracle User Name|OS User Name|Locked Mode|Killed'
                        format='0|0|0|0|0|3'
                        aligns='0|0|0|0|0|0'
                        defaults='|||||0'
                        editcol='1|1|1|1|1|1'
                        widths='1000|1000|1700|1500|1000|700'
                        sorting='T'
                        styles='width:100%; height:460'
                        oncellclick=""
                        acceptNullDate="true"
                        />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>    
</body>
</html>