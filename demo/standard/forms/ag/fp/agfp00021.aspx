<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Storage Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript" language="javascript">
    //Storage Grid
    
//Warehouse Grid
    var iWarehouse_PK       = 0,
        iSTORAGE_PK         = 1,
        iParent_code        = 2
        iWarehouse_ID       = 3,
        iFull_Name          = 4,
        iLast_Name          = 5,
        iFirst_Name         = 6,
        iIMEX_Type         = 7,
        iWarehouseType      = 8,
        iGrade              = 9,
        iActive_Item        = 10,
        iOutside            = 11,
        iStock              = 12,
        iDescription        = 13,
        iIn_Use             = 14,
        iStart_Date         = 15,
        iEnd_Date           = 16 ;
        
//---------------------------------------------------------------------        
function BodyInit()
{
    System.Translate(document); 
    var storage_pk = "<%=Request.querystring("storage_pk")%>";
    
    txtStorage_PK.text = storage_pk;
    var data;

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGIN0210' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grdWareHouse.SetComboFormat(iWarehouseType, data);     

    data_agfp00021.Call('SELECT');
}
//--------------------------------------------------------------------
function OnSelect()
{
    var code_data=new Array()
    var ctrl = grdWareHouse.GetGridControl();
    
    if( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
        {
            for( i=0 ; i<ctrl.SelectedRows ; i++ )
	        {	  
                rowNo = ctrl.SelectedRow(i) ;
	            
	            
	            var arrTemp=new Array();
                for(var j=0;j<grdWareHouse.cols-1;j++)
                {
                    code_data[code_data.length]= grdWareHouse.GetGridData(rowNo,j);
                }                                    
	        }
        }
        window.returnValue = code_data; 
        this.close(); 
}
//-----------------------------------------------
</script>

<body>
    
    <!------------------------------------------------------------->
    <gw:data id="data_agfp00021" onreceive=""> 
        <xml>                 
            <dso type="grid"  function="st_lg_sel_agfp00021" > 
                <input bind="grdWareHouse" > 
                    <input bind="txtStorage_PK" /> 
                </input> 
                <output bind="grdWareHouse" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------->   
    <table style="height: 100%; width: 100%">
        <tr style="height: 2%">
            <td width="96%">
            </td>
            <td width="1%" align="left">
                
            </td>
            <td width="1%" align="left">
                
            </td>
            <td width="1%" align="left">
                <gw:imgbtn id="ibtnSearch" img="Search" alt="Search" onclick="data_agfp00021.Call('SELECT');" />
            </td>
            <td width="1%" align="left">
                <gw:imgbtn id="ibtnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="5">
                <gw:grid id="grdWareHouse" onreceive="" 
                    header="Level|_PK|_STORAGE_pk|Parent Code|Warehouse ID|Full Name|Last Name|First Name|_IMEX Type|W/H Type|_Grade|_Active Item|_Outside|_Stock|Description|In Use|Start Date|End Date"
                    format="0|0|0|0|0|0|0|0|0|0|0|3|3|3|0|3|4|4" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||" editcol="0|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1" widths="0|0|2000|1500|2500|2500|2000|2000|2000|1000|1200|1000|1000|2000|1000|1200|1200"
                    styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"
                    oncelldblclick="OnSelect()" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------->
    <gw:textbox id="txtStorage_PK" styles="display:none; " />
</body>
</html>
