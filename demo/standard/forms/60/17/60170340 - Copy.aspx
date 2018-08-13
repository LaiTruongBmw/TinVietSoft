<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
  
%>
<head>
    <title>ALLOCATION INQUIRY</title>
</head>

<script type="text/javascript" language="javascript">

var G2_MON       = 0,
    G2_ITEM_PK    = 1,
    G2_ITEM_CD    = 2, 
    G2_R1         = 3,
    G2_R2         = 4,
    G2_R3       = 5,
    G2_R4       = 6,
    G2_R5       = 7,
    G2_R6       = 8,
    G2_R7       = 9,
    G2_R8       = 10,
    G2_R9       = 11,
    G2_R10       = 12,
    G2_R11       = 13,
    G2_R12       = 14,
    G2_R13       = 15,
    G2_R14       = 16,
    G2_R15       = 17;
        
var GT_NM   = 1;
//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    //----------------------------
     var ctrl = grdRatio.GetGridControl();        
    ctrl.ColFormat(G2_R1)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R2)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R3)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R4)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R5)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R6)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R7)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R8)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R9)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R10)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R11)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R12)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R13)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R14)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R15)    = "###,###,###.####R" ;
    
    data_60170340_1.Call("SELECT");  
}

//--------------------------------------------------------------------------------------------------
function OnPopUp()
{
     var path = System.RootURL + '/standard/forms/60/17/60170330_1.aspx?p_month=' +dtMonth.value + '&p_item_cd='+grdRatio.GetGridData(grdRatio.row,G2_ITEM_CD);
     var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
           
} 
//-------------------------------------------------------------------------------------
function OnSearch()
{
    data_60170340_1.Call("SELECT");   
           
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {   
         case "data_60170340_1":	
             for(var i =1; i<grdHead.rows; i++)	
             {
                grdRatio.GetGridControl().ColHidden(G2_ITEM_CD+i) = false;
                grdRatio.SetGridText(0,G2_ITEM_CD+i,grdHead.GetGridData(i,GT_NM));
             } 
             for (var j = grdHead.rows + 2 ; j<= 17; j++)
             {
                grdRatio.GetGridControl().ColHidden(j) = true;
             }
             data_60170340.Call("SELECT");    
         break; 
        
    }
}

//====================================================================================
    
</script>

<body>
     <!------------------------------------------------------------------>
    <gw:data id="data_60170340_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170340_1"  > 
                <input>
                    <input bind="dtMonth" /> 
                </input> 
                <output bind="grdHead" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_60170340" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170340"  > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="txtSTCode" />                  
                </input> 
                <output bind="grdRatio" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="0" style="width: 100%; height: 100%">
        <tr style="height: 5%">           
             <td style="width: 10%">
                Month
            </td>
            <td style="width: 20%">
                <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
            </td>
             <td style="width: 10%">
                Prod
            </td>
             <td style="width: 30%" align="right">
                <gw:textbox id="txtSTCode" text="" styles="color:red"  />
            </td>
            <td style="width: 30%">
                <gw:label id="lblRecord" text="" styles="color:red"  />
            </td>                       
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="6">
                <gw:grid id='grdRatio'
                    header='_ALLOC_MONTH|_TLG_IT_STITEM_PK|PROD GROUP ID|R1|R2|R3|R4|R5|R6|R7|R8|R9|R10|R11|R12|R13|R14|R15'
                    format='0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='|||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T'
                    autosize='T' 
                    styles='width:100%; height:100%'
                    oncelldblclick="OnPopUp()"
                    />
            </td>
        </tr>
    </table>
</body>
<gw:grid id='grdHead'
            header='GRD_CD|GRD_NM'
            format='0|0'
            aligns='0|0'
            check='|'
            editcol='0|0'
            widths='0|0'
            sorting='T'
            autosize='T' 
            styles='width:100%; height:100%;display:none'
            />
<gw:textbox id="txtSTItemPK" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
</html>
