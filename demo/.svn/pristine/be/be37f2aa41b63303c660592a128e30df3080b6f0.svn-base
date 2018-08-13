<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM OF MATERIAL</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var 
  G_CUT_ITEM_M_PK            =0,
  G_PL_CODE                  =1,
  G_ITEM_NAME                =2,
  G_DWG_NO                   =3,
  G_IDMK                     =4,
  G_MARK                     =5,
  G_SPEC1                    =6,
  G_SPEC2                    =7,
  G_SPEC3                    =8,
  G_SPEC4                    =9,
  G_SPEC5                    =10,
  G_LENGTH                   =11,
  G_QTY                      =12,
  G_U_WT                     =13,
  G_TOTAL_WT                 =14,
  G_MATERIAL                 =15,
  G_REMARK                   =16,
  G_Pl_PK                    =17;
  
function BodyInit()
{
    grdGrid.GetGridControl().FrozenCols = 3;
    
    txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
    
    idData_fpfa00281.Call('SELECT')
}
//====================================================================

function OnDataReceive(obj)
{
   if(grdGrid.rows>1)
    {
         grdGrid.SetCellBold( 1, G_DWG_NO, grdGrid.rows - 1, G_DWG_NO,   true);
         grdGrid.SetCellBold( 1, G_SPEC1, grdGrid.rows - 1, G_LENGTH,   true);
         grdGrid.SetCellBold( 1, G_QTY, grdGrid.rows - 1, G_QTY,   true);
         grdGrid.SetCellBold( 1, G_TOTAL_WT, grdGrid.rows - 1, G_TOTAL_WT,   true);
    } 
	
}

</script>

<body>
 
	<gw:data id="idData_fpfa00281"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_fpfa00281" > 
                <input bind="grdGrid">                 
                   	<input bind="txtMasterPK" /> 							
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 		
<table width="100%"  style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
  <tr style="height:40%">
    <td colspan="12">       
		  <gw:grid id='grdGrid'
            header='_PK|PL CD|Item Name|Dwg No|IDMK|MARK|SPEC_01|SPEC_02|SPEC_03|SPEC_04|SPEC_05|LENGTH|BOM QTY|UNIT WT|TOTAL WT|MATERIAL|REMARK|_TAC_ABPL_PK'
            format='0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            check='|||||||||||||||||'
            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            widths='0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0'
            sorting='T'
            autosize='T' 
            acceptNullDate ="true"
            styles='width:100%; height:100%'
            />
	</td>
  </tr>  
</table>
	
  <!---------------------------------------------------------------->
 <gw:textbox id="txtMasterPK" styles="display:none"/>

 
</body>
</html>