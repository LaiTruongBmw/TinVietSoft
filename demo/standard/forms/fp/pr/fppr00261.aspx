<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Incoming Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag;

var G_PK        = 0,
    G_STATUS    = 1,
    G_SLIPNO    = 2,
    G_PROD_DT   = 3;
    

var G1_PK                    = 0,
    G1_PR_PROD_ASS_M_PK      = 1,
    G1_SEQ                   = 2,
    G1_ITEM_PK               = 3,
    G1_ITEM_CODE             = 4,
    G1_ITEM_NAME             = 5,
    G1_IN_UOM                = 6,
    G1_IN_QTY                = 7,
    G1_REF_NO                = 8,
    G1_LOT_NO                = 9,
    G1_REMARK                = 10,
    G1_TSA_SALEORDER_D_PK    = 11;
    

//=================================================================================
var G2_PK                    = 0,
    G2_PR_PROD_ASS_M_PK      = 1,
    G2_SEQ                   = 2,
    G2_ITEM_PK               = 3,
    G2_ITEM_CODE             = 4,
    G2_ITEM_NAME             = 5,
    G2_OUT_UOM               = 6,
    G2_OUT_QTY               = 7,
    G2_REF_NO                = 8,
    G2_LOT_NO                = 9,
    G2_REMARK                = 10,
    G2_TSA_SALEORDER_D_PK    = 11;
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    
    System.Translate(document);  // Translate to language session    
    var p_type = "<%=Request.querystring("p_type")%>"; 
    if(p_type == "Approve")
    {
        idCancel.style.display="none";
    }
    else
    {
        idApprove.style.display="none";
    }
    lstInWH.SetEnable(false);
    lstOutWH.SetEnable(false);
    lstInLine.SetEnable(false);
    lstOutLine.SetEnable(false);
    var p_master_pk = "<%=Request.querystring("master_pk")%>";  
    
    txtMasterPK.text = p_master_pk ;
    SetGridFormat();  
    data_fppr00250_1.Call("SELECT");
 }
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04'  ORDER BY wh_name  ASC" )%>";    
     lstInWH.SetDataText(data);
     lstOutWH.SetDataText(data);
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstInLine.SetDataText(data);   
     lstOutLine.SetDataText(data);  
     
     var ctr = grdDetailIn.GetGridControl(); 
    
     ctr.ColFormat(G1_IN_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G1_IN_QTY] = 2;                   
     
     var ctr = grdDetailOut.GetGridControl(); 
    
     ctr.ColFormat(G2_OUT_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G2_OUT_QTY] = 2;                   
 }
 //==================================================================================
  
 

//=============================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case 'grdDetailIn':            
            data_fppr00250_2.Call("SELECT");
        break;
        case 'grdDetailOut':            
            data_fppr00250_3.Call("SELECT");
        break;
    }
}
//=============================================================================================

//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'data_fppr00250_1':
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetailIn.rows;i++)
                {
                    if ( grdDetailIn.GetGridData( i, G1_PR_PROD_ASS_M_PK) == '' )
                    {
                        grdDetailIn.SetGridText( i, G1_PR_PROD_ASS_M_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('DetailIn');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetailIn');   
            }    
        break; 
        case'data_fppr00250_2':
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetailOut.rows;i++)
                {
                    if ( grdDetailOut.GetGridData( i, G2_PR_PROD_ASS_M_PK) == '' )
                    {
                        grdDetailOut.SetGridText( i, G2_PR_PROD_ASS_M_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('DetailOut');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetailOut');   
            }    
        break;
        case 'pro_fppr00250':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break; 
        
        case 'pro_fppr00250_1':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
    }          
}

//==================================================================================================

//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Cancel' :
            if(confirm("Are you sure to Cancel this Slip ???"))
            {
             pro_fppr00250_1.Call();           
            }
        break;  
        case 'Approve' :
            if(confirm("Are you sure to Approve this Slip ???"))
            {
             pro_fppr00250.Call();           
            }
        break;      
    }
}
//=================================================================================


//=================================================================================

  

//=================================================================================


//=================================================================================
 


//=================================================================================

//=================================================================================


//=================================================================================
</script>

<body>
    <!-----------------------grdSearch---------------------------------------->
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppr00250_1"  procedure="<%=l_user%>lg_upd_fppr00250_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtProdDate" /> 
                     <inout  bind="lblStatus" />
                     
                     <inout  bind="txtRefNo" />
                                             
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffID" />
                     <inout  bind="txtStaffName" />
                     
                     <inout  bind="lstInWH" /> 
                     <inout  bind="lstInLine" />
                     
                     <inout  bind="lstOutWH" /> 
                     <inout  bind="lstOutLine" />
                                          
                     <inout  bind="txtRemark" /> 
                                                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00250_2"  > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetailIn" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00250_3"  > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetailOut" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00250" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00260" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="pro_fppr00250_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00260_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-right" style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtProdDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 25%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">   
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                            <gw:icon id="idApprove" img="2" text="Approve" styles='width:100%' onclick="OnProcess('Approve')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Ref No
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            Charger
                        </td>
                        <td colspan="8" style="white-space: nowrap">
                            <gw:textbox id="txtStaffID" styles="width:30%" />
                            <gw:textbox id="txtStaffName" styles="width:70%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            In W/H
                        </td>
                        <td colspan="3">
                            <gw:list id="lstInWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            In Line
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstInLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td colspan="3">
                            <gw:list id="lstOutWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Out Line
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstOutLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="12">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="13">
                            <table style="width: 100%; height: 100%" border="1">
                                <tr>
                                    <td style="width: 49%">
                                        <table style="width: 99%; height: 99%">
                                            <tr style="height: 99%">
                                                <td colspan="8">
                                                    <gw:grid id='grdDetailIn' header='_PK|_PR_PROD_ASS_M_PK|Seq|_ITEM_PK|Item Code|Item name|In Uom|In Qty|Ref No|Lot No|Remark|_TSA_SALEORDER_D_PK'
                                                        format='0|0|0|0|0|0|0|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||'
                                                        editcol='1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                                        sorting='T' autosize='T' styles='width:100%; height:100%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 49%">
                                        <table style="width: 99%; height: 99%">
                                            <tr style="height: 99%">
                                                <td colspan="8">
                                                    <gw:grid id='grdDetailOut' header='_PK|_PR_PROD_ASS_M_PK|Seq|_ITEM_PK|Item Code|Item Name|Out Uom|Out Qty|Ref No|Lot No|Remark|_TSA_SALEORDER_D_PK'
                                                        format='0|0|0|0|0|0|0|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||'
                                                        editcol='1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                                        sorting='T' autosize='T' styles='width:100%; height:100%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLineStr" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtLinePK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
</html>
