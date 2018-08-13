<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO Closing </title>
    <style>
        .t-header1{
            text-align:center;background-color:#99ccff; color: #660033 ; font-size: 14
        }
        .t-header2{
            text-align:left;background-color:#ccffff;  font-size: 14
        }
        .t-header3{
            text-align:left;background-color:#3B6EA5; color: white ; font-size: 22
        } 
    </style>
</head>

<script>
 //---------------------------------------------------------
 // columns of grdOrder
 var    
        iColMSlip_No        = 1,
        iColMOrder_AMT      = 7,
        iColMTotal_AMT      = 8;
// columns of grdDetail
 var    iColST_Ord_Qty      = 8,
        iColOrd_Qty         = 10,
        iColUP              = 12,
        iColVAT_Rate        = 13,
        iColAmount          = 14,
        iColDeli_Req        = 21,
        iColDeli_Plan       = 22,
        iColProd_Plan_Qty   = 23,
        iColTO_Qty          = 24,
        iColProd_Qty        = 25;
//--------------------------------------------------------------------------        
 function BodyInit()
 {
     System.Translate(document); 
 } 
//-------------------------------------------------------------------------- 
 function BindingDataList()
 {         
    
 } 
 //--------------------------------------------------------------------------    
 function OnDataReceive(obj)
 {
    
 }
 //-------------------------------------------------------------------------- 
 function OnClose()
 {
     chkCloseYN.value='Y';  
     OnSetData(); 
     dsbs00130.Call();
 }
 //-------------------------------------------------------------------------- 
 function OnOpen()
 {
    chkCloseYN.value='N';   
    OnSetData(); 
    dsbs00130.Call(); 
 }
 //--------------------------------------------------------------------------        
 function OnSetData()
 {
    //chkCloseYN txtType dtbFrom dtbTo
   
    for(var i=0;i<optClosing.length;i++)
        if (optClosing[i].checked)
            rpt_no =optClosing[i].value;
    
    switch (rpt_no)
    {  
        case 'SO':
            txtType.text  = 'SO';
            dtbFrom.value = dtbSOFrom.value;
            dtbTo.value   = dtbSOTo.value;
        break;
        case 'WI':
            txtType.text  = 'WI';
            dtbFrom.value = dtbWIFrom.value;
            dtbTo.value   = dtbWITo.value;
        break;
        case 'MR':
            txtType.text  = 'MR';
            dtbFrom.value = dtbMRFrom.value;
            dtbTo.value   = dtbMRTo.value;
        break;
        case 'PO':
            txtType.text  = 'PO';
            dtbFrom.value = dtbPOFrom.value;
            dtbTo.value   = dtbPOTo.value;
        break;
    }
               
 }
 //--------------------------------------------------------------------------        
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="SALE.sp_pro_dsbs00130" > 
                <input>
                     <input bind="txtPK" /> 
                     <input bind="chkCloseYN" /> 
                     <input bind="txtType" /> 
                     <input bind="dtbFrom" /> 
                     <input bind="dtbTo" /> 
                </input> 
                <output> 
                    <output bind="txtRtnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 4%">
            <td colspan="2">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 98%"></td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnClose" text="Close" alt="Close" onclick="OnClose()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnUnClose" text="Open" alt="Open" onclick="OnOpen()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%; ">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%" name="title"  >
                        <td style="width: 5%"></td>
                        <td align="center" class="t-header1">
                            <input type="radio" name="optClosing" value="SO" >
                            SO 
                        </td>
                        <td style="width: 5%"></td>
                        <td align="center" class="t-header1">
                            <input type="radio" name="optClosing" value="WI" >
                            WI
                        </td>
                        <td style="width: 5%"></td>
                        <td align="center" class="t-header1">
                            <input type="radio" name="optClosing" value="MR" >
                            MR
                        </td>
                        <td style="width: 5%"></td>
                    </tr>
                    <tr style="height: 1%" name="blankrow"  >
                        <td ></td>
                        <td  class="t-header2">                            
                        </td>
                        <td></td>
                        <td  class="t-header2"></td>
                        <td></td>
                        <td  class="t-header2"></td>
                        <td></td>
                    </tr>
                    <tr style="height: 1%" name="date" > 
                        <td ></td>
                        <td   nowrap>
                            <gw:datebox id="dtbSOFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbSOTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                        <td  nowrap>
                            <gw:datebox id="dtbWIFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbWITo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                        <td  nowrap>
                            <gw:datebox id="dtbMRFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbMRTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                    </tr>
                </table>
            </td>            
        </tr>
        <tr style="height: 1%" >
            <td class="t-header2"></td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%; ">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1px" name="title" >
                        <td style="width: 5%"></td>
                        <td align="center"  class="t-header1">
                            <input type="radio" name="optClosing" value="1" >
                            SO 
                        </td>
                        <td style="width: 5%"></td>
                        <td align="center"  class="t-header1">
                            <input type="radio" name="optClosing" value="5" >
                            WI
                        </td>
                        <td style="width: 5%"></td>
                        <td align="center"  class="t-header1">
                            <input type="radio" name="optClosing" value="6" >
                            MR
                        </td>
                        <td style="width: 5%"></td>
                    </tr>
                    <tr style="height: 1%" name="blankrow"  >
                        <td></td>
                        <td  class="t-header2"></td>
                        <td></td>
                        <td  class="t-header2"></td>
                        <td></td>
                        <td  class="t-header2"></td>
                        <td></td>
                    </tr>
                    <tr style="height: 1%" name="date" >
                        <td ></td>
                        <td nowrap >
                            <gw:datebox id="dtbSOFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbSOTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                        <td nowrap >
                            <gw:datebox id="dtbWIFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbWITo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                        <td nowrap >
                            <gw:datebox id="dtbMRFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbMRTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td ></td>
                    </tr>
                </table>
            </td>            
        </tr>
        <tr style="height: 95%">
            <td></td>
        </tr>
    </table>  
    <!--------------------------------------------------------------------------------->
    <gw:textbox id="txtPK" text="" styles='display:none' />
    <gw:textbox id="txtRtnValue" text="" styles='display:none' />
    <gw:checkbox id="chkCloseYN" value="N" defaultvalue="Y|N" styles='display:none' />   
    <gw:textbox id="txtType" text="" styles='display:none' /> 
    <gw:datebox id="dtbFrom" mode="01" style='display:none' />
    <gw:datebox id="dtbTo" mode="01" style='display:none' />
    <!--------------------------------------------------------------------------------->
</body>
</html>
