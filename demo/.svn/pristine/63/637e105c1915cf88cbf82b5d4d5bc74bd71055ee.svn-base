<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head runat="server">
    <title>MR APPROVE</title>
</head>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
    var  iD_Master_pk   = 0 ,
         iD_status      = 3;
         
    var  G2_Plan_qty     = 5,
    G2_WI_qty     = 6;
         
 //---------------------------------------------------------
 function OnToggle()
 {
    var master  = document.all("master"); 
    var detail  = document.all("detail");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        detail.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up.gif";
    }
    else
    {
        detail.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
        System.Translate(document);
      txt_user_pk.text = user_pk;
      //---------------------- 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
      
      //----------------------
      BindingDataList();
      OnFormatGrid();
    } 


 //---------------------------------------------------------
 
 function BindingDataList()
 {
        var data ;
        
        data = "<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
        cboCompany.SetDataText(data+ "|ALL|Select ALL");
        cboCompany.value = "<%=Session("COMPANY_PK") %>";
        
        data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('PRBP0010') FROM DUAL" )%>|ALL|Select ALL"; 
        lstStatusSearch.SetDataText(data);
        lstStatusSearch.value = "PR";
        
        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.ID='PRBP0010' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
        grdMaster.SetComboFormat(iD_status,data); 
 }        
 
 //------------------------------------------------------------------------------------------------
 function OnFormatGrid()
 {
    var trl ;
    trl = grdDetail.GetGridControl();
    trl.ColFormat(G2_Plan_qty)              = "###,###,###,###,###.##";
    trl.ColFormat(G2_WI_qty)            = "###,###,###,###,###.##";
 }

 //---------------------------------------------------------
 function OnSearch(pos)
 {
       switch (pos)         
      {		        
            case 1 :
                fpip00060.Call("SELECT");
            break; 
            
            case 2 :
                if ( grdMaster.row > 0 )
                {
                    txtMaster_PK.text = grdMaster.GetGridData( grdMaster.row, iD_Master_pk );                   
                }
                else
                {
                    txtMaster_PK.text = '' ;
                }    
                fpip00060_1.Call("SELECT");   
            break;             
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
    if ( po_oData.id == 'fpip00060' )
    {
        grdDetail.ClearData();
        fpip00060_1.Call("SELECT");   
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
                fpip00060.Call();
            break;
           
      }  
 }
 //------------------------------------------------------------------
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="fpip00060" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="<%=l_user%>lg_sel_fpip00060" procedure="<%=l_user%>lg_upd_fpip00060" >
                <input  bind="grdMaster">
                    <input bind="cboCompany" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtMrNo" />
                    <input bind="lstStatusSearch" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="fpip00060_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" function="<%=l_user%>lg_sel_fpip00060_1" >
                <input  bind="grdDetail">
                    <input bind="txtMaster_PK" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr id='top' style="height: 50%" id="master">
            <td colspan="2">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%">
                            Company
                        </td>
                        <td style="width: 10%">
                            <gw:list id="cboCompany" styles="width:100%;" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b>Plan Date</b>
                        </td>
                        <td style="width: 8%" align="right">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 8%" align="left">
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b>Plan No</b>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtMrNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 10%" align="right">
                            Status
                        </td>
                        <td style="width: 10%">
                            <gw:list id="lstStatusSearch" styles="width: 100%" onchange="" />
                        </td>
                        <td style="width: 3%" ></td>
                        <td style="width: 2%" align="right">
                            <gw:icon id="btnSetStatus" styles='width:100%' text="Set Status" onclick="SetStatus()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="13">
                             <gw:grid id='grdMaster'
                                header='_PK|Plan Date|Plan No|Status|Planner|Confirmed by|Description'
                                format='0|4|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0'
                                defaults='||||||'
                                editcol='0|0|0|1|0|0|1'
                                widths='0|1200|2000|2000|3000|3000|2000'
                                sorting='T'
                                styles='width:100%; height:100%'
                                onselchange="OnSearch(2)"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 2%">
            <td valign="top" style="border: 0">
                <img status="expand" id="imgArrow" src="../../../system/images/down.gif" style="cursor: hand;
                    position: absolute;" onclick="OnToggle()" />
            </td>
            <td style="border: 0">
                Plan Detail</td>
        </tr>
        <tr style="height: 48%" id="detail">
            <td colspan="2">        
                    <gw:grid id='grdDetail'
                        header='Process NM|Line NM|Item Code|Item NM|UNIT|Plan Qty|WI Qty|Plan From|Plan To|SO Item No|Description'
                        format='0|0|0|0|0|1|1|4|4|0|0'
                        aligns='0|0|0|0|1|0|0|0|0|0|0'
                        defaults='||||||||||'
                        editcol='0|0|0|0|0|0|0|0|0|0|0'
                        widths='1500|1500|1500|2500|1000|1500|1500|1200|1200|1500|2000'
                        sorting='T'
                        styles='width:100%; height:100%'
                        oncellclick='OnGridCellClick(this)'
                        />
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
