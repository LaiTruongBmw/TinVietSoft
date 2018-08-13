<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>MR APPROVE</title>
</head>

<script>
    var  row_response;
    
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
    var G1_Date         = 0,
        G1_TCO_DEPT_PK  = 1,
        G1_Dept_Name    = 2,
        G1_MR_No        = 3,
        G1_REQ_EMP_PK   = 4,
        G1_Employee     = 5,
        G1_Deli_Loc     = 6,
        G1_LINE_NAME    = 7, 
        G1_PL_NM        = 8,
        G1_Status       = 9,
        G1_Amount       = 10,
        G1_Budget       = 11,
        G1_ATT01        = 12,
        G1_ATT02        = 13,
        G1_ATT03        = 14,
        G1_Description  = 15,
        G1_PK           = 16;        
                      
    var G2_PK               = 0,
        G2_TPR_POREQ_PK     = 1,
        G2_TPR_MATCONS_PK   = 2,
        G2_TAC_ABPL_PK      = 3,
        G2_NO               = 4,
        G2_TPR_WH_PK        = 5,
        G2_Warehouse        = 6,
        G2_Req_Date         = 7,
        G2_tco_itemgrp_pk   = 8,
        G2_Grp_Name         = 9,
        G2_TCO_ITEM_PK      = 10,
        G2_Item_Code        = 11,
        G2_Item_Name        = 12,
        G2_UOM              = 13,
        G2_Spec             = 14,
        G2_Req_Qty          = 15,
        G2_U_P              = 16,
        G2_Amount           = 17,
        G2_PO_Qty           = 18,
        G2_TakeIn_Qty       = 19,
        G2_Description      = 20,
        G2_REF_TABLE        = 21,
        G2_REF_PK           = 22;
         
 //---------------------------------------------------------
 function BodyInit()
 {

      txt_user_pk.text = user_pk;
      //---------------------- 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
      System.Translate(document);
      //----------------------
      BindingDataList();
      OnFormatGrid();
    } 


 //---------------------------------------------------------
 
 function BindingDataList()
 {
        var data ;
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGIN0010') FROM DUAL")%>|ALL|Select ALL"; 
        lstStatusSearch.SetDataText(data);
        lstStatusSearch.value = "ALL";
        
        data = "<%=CtlLib.SetListDataSQL("select pk,ORG_NM from comm.tco_org a where  del_if=0 order by ORG_NM")%>|ALL|Select ALL"; 
        lstDept.SetDataText(data);
        lstDept.value = "ALL";        
        
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGIN0010' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
        grdMaster.SetComboFormat(G1_Status,data); 
        
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGIN0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
        grdMaster.SetComboFormat(G1_Deli_Loc,data);        
 }        
 
 //------------------------------------------------------------------------------------------------
 function OnFormatGrid()
 {
    var trl ;
    
    //--------------------------------------------------------
    trl = grdMaster.GetGridControl();
    
    trl.ColFormat(G1_Amount)        = "###,###,###,###,###.##";
    trl.ColFormat(G1_Budget)        = "###,###,###,###,###.##";
    //--------------------------------------------------------
    trl = grdDetail.GetGridControl();
    
    trl.ColFormat(G2_Req_Qty)       = "###,###,###,###,###.##";
    trl.ColFormat(G2_U_P)           = "###,###,###,###,###.##";
    trl.ColFormat(G2_Amount)        = "###,###,###,###,###.##";
    trl.ColFormat(G2_PO_Qty)        = "###,###,###,###,###.##";
    trl.ColFormat(G2_TakeIn_Qty)    = "###,###,###,###,###.##";
    //--------------------------------------------------------
    
 }

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                epbp00070.Call("SELECT");
            break; 
            
            case 'Detail' :
                
                if ( grdMaster.row > 0 )
                {
                    txtMaster_PK.text = grdMaster.GetGridData( grdMaster.row, G1_PK );                   
                }
                else
                {
                    txtMaster_PK.text = '' ;
                }    
                epbp00070_1.Call("SELECT");   
            break;             
      }  
 }

 //---------------------------------------------------------
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'epbp00070' :
                OnSearch('Detail');
            break;
      }      
}            

//---------------------------------------------------------
function SetStatus()
{
    if(lstStatusSearch.value!='ALL')
    {
        for ( i = 1 ; i < grdMaster.rows ; i++ )
        {
            if ( grdMaster.GetGridControl().isSelected(i) == true )
            {

                grdMaster.SetGridText( i, iD_status, lstStatusSearch.value) ;

            } 
        } 
    }
}
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :                
                epbp00070.Call();
            break;
           
      }  
 }
 //------------------------------------------------------------------
 
 function TextOnBlur()
 {
    if ( grdMaster.row > 0 )
    {
        grdMaster.SetGridText( row_response, G1_ATT02, txtRespone.GetData() );
    }    
 }

 //------------------------------------------------------------------
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="epbp00070" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='9,13,16' function="st_lg_sel_epbp00070" procedure="st_lg_upd_epbp00070" >
                <input  bind="grdMaster">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="lstDept" />  
                    <input bind="lstStatusSearch" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="epbp00070_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" function="st_lg_sel_epbp00070_1" >
                <input  bind="grdDetail">
                    <input bind="txtMaster_PK" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%">
                            MR Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 10%" align="right">
                            Dept
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:list id="lstDept" styles="width:100%;" />
                        </td>
                        <td style="width: 10%" align="right">
                            Status
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:list id="lstStatusSearch" styles="width: 100%" onchange="" />
                        </td>
                        <td style="width: 7%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSetStatus" text="Set Status" onclick="SetStatus()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSave1" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 39%">
            <td>
                <gw:grid id='grdMaster' header='Date|_TCO_DEPT_PK|Dept Name|MR No|_REQ_EMP_PK|Employee|Deli Loc|_LINE_NAME|_PL_NM|Status|Amount|Bugdet|Purpose|Reponse|ATT03|Description|_PK'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|0|0|0|0|0|0|0|3|3|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1200|1000|2000|1500|1000|2000|2000|1000|1000|1500|1200|1200|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' onclick="OnSearch('Detail');row_response=grdMaster.row;txtRespone.SetDataText(grdMaster.GetGridData(grdMaster.row,G1_ATT02));lblAmount.text=''+grdMaster.GetGridData(grdMaster.row,G1_Amount)+'/'+grdMaster.GetGridData(grdMaster.row,G1_Budget)" />
            </td>
        </tr>
        <tr style="height: 40%">
            <td>
                <gw:grid id='grdDetail' header='_PK|_TPR_POREQ_PK|_TPR_MATCONS_PK|_TAC_ABPL_PK|NO|_TPR_WH_PK|_Warehouse|Req Date|_tco_itemgrp_pk|Grp Name|_TCO_ITEM_PK|Item Code|Item Name|UOM|Spec|Req Qty|U/P|Amount|_PO Qty|_TakeIn Qty|Description|_REF_TABLE|_REF_PK'
                    format='0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|1|0|0|0|0|0|1|0|3|3|3|3|3|0|0|0'
                    editcol='0|0|0|0|1|0|0|1|0|0|0|0|0|0|1|1|1|1|0|0|1|0|0' widths='1000|1000|1000|1000|1000|1000|2000|1200|1000|1500|1000|1500|3000|800|1500|1200|1200|1200|1200|1200|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="left">
                            Reponse
                        </td>
                        <td style="width: 80%" align="right">
                            Amount / Budget :
                        </td>
                        <td style="width: 10%" align="center">
                            <gw:label id="lblAmount" styles='width:100%;color:cc0000;font:9pt' text='Amount / Budget' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 19%">
            <td>
                <gw:textarea id="txtRespone" styles="width:100%;height:95%" onblur="TextOnBlur()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
