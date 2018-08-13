<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O Consumption</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK                = 0,
    G_TSA_SALEORDER_PK  = 1,
    G_TSA_SALEORDERD_PK = 2,
    G_ST_PROD_PK        = 3,
    G_PROD_PK           = 4,
    G_Prod_Code         = 5,
    G_Prod_Name         = 6,
    G_Spec1             = 7,
    G_Spec2             = 8,
    G_Spec3             = 9,
    G_Spec4             = 10,
    G_Spec5             = 11,
    G_Prod_UOM          = 12,
    G_Ord_Qty           = 13,
    G_ST_MAT_PK         = 14,
    G_MAT_PK            = 15,
    G_Mat_Code          = 16,
    G_Mat_Name          = 17,
    G_Spec1             = 18,
    G_Spec2             = 19,
    G_Spec3             = 20,
    G_Spec4             = 21,
    G_Spec5             = 22,
    G_Mat_UOM           = 23,
    G_Gross_Qty         = 24,
    G_Description       = 25;  
        
//===============================================================
function BodyInit()
{  
    System.Translate(document);
    grdDetail.GetGridControl().FrozenCols = 2 ;
    FormatGrid();
}

//===============================================================
function FormatGrid()
{
    var ctrl ;
    
    ctrl = grdDetail.GetGridControl();
    
    ctrl.ColFormat(G_Ord_Qty)    = "###,###,###.##" ;
    ctrl.ColFormat(G_Gross_Qty)  = "###,###,###.##" ;
  
}  

//===============================================================
function OnSearch()
{
    data_dsbs00100.Call("SELECT")
}

//===============================================================
function OnDataReceive(p_oData)
{
     grdDetail.GetGridControl().AutoSize( 0, G_Description, false, 0);
}
//===============================================================
 
</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_dsbs00100" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="SALE.sp_sel_dsbs00100" > 
                  <input > 
                          <input bind="txtSOPO" />                 
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            SO NO/PO</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSOPO" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 69%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='_PK|_TSA_SALEORDER_PK|_TSA_SALEORDERD_PK|_ST_PROD_PK|_PROD_PK|Item Code|Item Name|Spec1|Spec2|Spec3|Spec4|Spec5|UOM|Ord Qty|_ST_MAT_PK|_MAT_PK|Mat Code|Mat Name|Spec1|Spec2|Spec3|Spec4|Spec5|UOM|Gross Qty|Description'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
                <!--
              <gw:grid id='grdDetail' 
                header='_PK|_TSA_SALEORDER_PK|_TSA_SALEORDERD_PK|_ST_PROD_PK|_PROD_PK|
                        Item Code|Item Name|Spec1|Spec2|Spec3|
                        Spec4|Spec5|UOM|Ord Qty|_ST_MAT_PK|
                        _MAT_PK|Mat Code|Mat Name|Spec1|Spec2|
                        Spec3|Spec4|Spec5|UOM|Gross Qty|
                        Description'
                format='0|0|0|0|0|
                        0|0|0|0|0|
                        0|0|0|0|0|
                        0|0|0|0|0|
                        0|0|0|0|0|
                        0' 
                aligns='0|0|0|0|0|
                        0|0|0|0|0|
                        0|0|1|3|0|
                        0|0|0|0|0|
                        0|0|0|1|3|
                        0'
                defaults='|||||
                          |||||
                          |||||
                          |||||
                          |||||' 
                editcol='0|0|0|0|0|
                         0|0|0|0|0|
                         0|0|0|0|0|
                         0|0|0|0|0|
                         0|0|0|0|0|
                         0'
                widths='1000|1000|1000|1000|1000|
                        1000|1000|1000|1000|1000|
                        1000|1000|1000|1000|1000|
                        1000|1000|1000|1000|1000|
                        1000|1000|1000|1000|1000|
                        1000'
                sorting='T' styles='width:100%; height:100%' />
                -->
            </td>
        </tr>
    </table>
</body>
</html>
