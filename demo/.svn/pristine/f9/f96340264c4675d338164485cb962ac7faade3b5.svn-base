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
    
    idData_fpfa00292.Call('SELECT')
}
//====================================================================

function OnDataReceive(obj)
{
   switch(obj.id )
   {
    case "idData_fpfa00292":
        if(grdGrid.rows>1)
        {
             grdGrid.SetCellBold( 1, G_DWG_NO, grdGrid.rows - 1, G_DWG_NO,   true);
             grdGrid.SetCellBold( 1, G_SPEC1, grdGrid.rows - 1, G_LENGTH,   true);
             grdGrid.SetCellBold( 1, G_QTY, grdGrid.rows - 1, G_QTY,   true);
             grdGrid.SetCellBold( 1, G_TOTAL_WT, grdGrid.rows - 1, G_TOTAL_WT,   true);
        }
        idData_fpfa00292_1.Call('SELECT');
     break;
     case 'pro_fpfa00291':
         alert(txtReturnValue.text);
         idData_fpfa00292_1.Call('SELECT');
     break;
   }
	
}
function OnUpdateData(p_obj)
{
    switch(p_obj)
    {
        case 'REMAIN':
            idData_fpfa00292_1.Call();
        break;
        case 'ITEM':
            idData_fpfa00292.Call();
        break;
    }
}

function OnDelete()
{
    grdItemRemain.DeleteRow();
}

function OnProcess()
{
    pro_fpfa00291.Call();
}
</script>

<body> 
	<gw:data id="idData_fpfa00292"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00292" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  procedure="<%=l_user%>lg_upd_fpfa00292"> 
                <input bind="grdGrid">                 
                   	<input bind="txtMasterPK" /> 							
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	
 	<gw:data id="idData_fpfa00292_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00292_1" parameter="0,1,2,3,4,5,6,7,8,9,10"  procedure="<%=l_user%>lg_upd_fpfa00292_1"> 
                <input bind="grdItemRemain">                 
                   	<input bind="txtMasterPK" /> 							
                </input> 
                <output bind="grdItemRemain" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	
 	 <!--------------------------------------remain------------------------------->
    <gw:data id="pro_fpfa00291" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfa00291_remain" > 
                <input>
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
 		
<table width="100%"  style="height:100%"  border="0" cellpadding="0" cellspacing="0"> 
  <tr style="height:1%">
    <td style="width:98%" colspan=3>           
        Cutting Item
    </td>
     <td align="right" style="width: 2%" >
        <gw:imgBtn id="idBtnUpdD" img="update" alt="update" text="update" onclick="OnUpdateData('ITEM')" />
     </td>     
  </tr>   
  <tr style="height:40%">
    <td colspan="4">       
		  <gw:grid id='grdGrid'
            header='_PK|Item Name|Dwg No|IDMK|MARK|SPEC_01|SPEC_02|SPEC_03|SPEC_04|SPEC_05|LENGTH|CUT QTY|UNIT WT|TOTAL WT|MATERIAL|REMARK'
            format='0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            check='|||||||||||||||'
            editcol='0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0'
            widths='0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
            sorting='T'
            autosize='T' 
            acceptNullDate ="true"
            styles='width:100%; height:100%'
            />
	</td>
  </tr>  
   <tr style="height:1%">
    <td style="width:94%">           
        Remain Item
    </td>
    <td align="right" style="width: 2%" >
        <gw:icon id="idRemain"  alt="Cal. Remain" text="Cal Remain" onclick="OnProcess()" />
     </td>
     <td align="right" style="width: 2%" >
        <gw:imgBtn id="idBtnUpd" img="save" alt="save" text="save" onclick="OnUpdateData('REMAIN')" />
     </td>
      <td style="width: 2%"  align="right">
      <gw:imgBtn id="idBtnDelete3" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" /> </td>	
  </tr>   
  <tr style="height:40%">
    <td colspan="4">       
		  <gw:grid id='grdItemRemain'
            header='_PK|Remain No|Description|Width|Length|Remain Qty|Unit WT|Total WT|Material|Remark|_TLG_FA_CUTTING_ITEM_M_PK'
            format='0|0|0|1|1|1|1|1|0|0|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0'
            check='||||||||||'
            editcol='0|1|1|1|1|1|1|1|0|1|1'
            widths='0|1500|1500|150|1500|1500|1500|1500|1500|1500|0'
            sorting='T'
            autosize='T' 
            styles='width:100%; height:100%' />
	</td>
  </tr>  
</table>
	
  <!---------------------------------------------------------------->
 <gw:textbox id="txtMasterPK" styles="display:none"/>
 <gw:textbox id="txtReturnValue" styles="display:none"/>
 
</body>
</html>