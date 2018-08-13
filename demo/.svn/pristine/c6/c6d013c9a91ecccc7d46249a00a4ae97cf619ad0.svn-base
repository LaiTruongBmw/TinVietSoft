<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO HISTORY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
      
    var G_TLG_SA_PERIOD_PK  = 0,         
        G_TR_TYPE           = 1,
        G_FR_DATE           = 2,
        G_TO_DATE           = 3,
        G_OPEN_YN           = 4,
        G_DESCRIPTION       = 5;


 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
   BindingDataList();
 }
 //---------------------------------------------------------
 function FormatGrid()
 {
      var trl
      trl=grdDetail.GetGridControl();	
 }
  //---------------------------------------------------------
 function BindingDataList()
 {    
        var data="";    
        data = "data|1|SALE ORDER|2|DELIVERY|3|COLLECTION|4|PROMOTION||";
        lstTranStyle.SetDataText(data); 
        lstTranStyle.value = '' ;  
        
        data ="#1;SALE ORDER|#2;DELIVERY|#3;COLLECTION|#4;PROMOTION"
        grdDetail.SetComboFormat(G_TR_TYPE,data);   
  }        
 //---------------------------------------------------------
 function OnAddNew(obj)
 {
    obj.AddRow()
 }
//====================================================================
function OnDelete(obj)
{
    obj.DeleteRow();
}
//====================================================================
function OnUnDelete(obj)
{
    obj.UnDeleteRow()
}
//====================================================================
function OnSave()
{
    data_epap00020.Call();
} 
  //---------------------------------------------------------
 function OnSearch()
 {
    data_epap00020.Call("SELECT");
 }
 //---------------------------------------------------------
 function OnDataReceive(obj)
 {
    if(obj.id=="pro_epap00020")
    {
        alert(txtReturn.text);
        data_epap00020.Call('SELECT');
    }
 }
  //---------------------------------------------------------
 function OnProcess()
 {
    pro_epap00020.Call();
 }
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epap00020" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="st_lg_sel_epap00020" parameter="0,1,2,3,4,5" procedure="st_lg_upd_epap00020"   > 
			    <input  > 
			        <input bind="lstTranStyle" />
			        <input bind="dtFrom" />
			        <input bind="dtTo" />
			    </input>     			
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_epap00020" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="st_lg_pro_epap00020"> 
                <input> 
			        <input bind="lstTranStyle" />
			        <input bind="dtFrom" />
			        <input bind="dtTo" />  		
			    </input> 
                <output>
                    <output bind="txtReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
    <table style="width: 100%; height: 100%" name="Transaction Code">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Trans Type
            </td>
            <td style="width: 45%">
                <gw:list id="lstTranStyle" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%">
                Date
            </td>
            <td style="width: 48%">
                <gw:datebox id="dtFrom" lang="1" width="10%" />
                ~
                <gw:datebox id="dtTo" lang="1" width="10%" />
            </td>
            <td style="width: 1%">
                <gw:button id="idBtnProcess" img="Generate" text="Generate"= onclick="OnProcess()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnNew" img="new" onclick="OnAddNew(grdDetail)" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnDelete" img="delete" onclick="OnDelete(grdDetail)" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnUnDelete" img="UnDelete" onclick="OnUnDelete(grdDetail)" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSave" img="save" onclick="OnSave()" />
            </td>
        </tr>
        <tr>
            <td colspan="10">
                <gw:grid id='grdDetail' header='_PK|Tr Type|Fr Date|To Date|Open|Description' format='0|2|4|4|3|0'
                    aligns='0|0|1|1|0|0' check='|||||' editcol='1|1|1|1|1|1' widths='0|1800|1200|1200|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    </form>
    <!------------------------------------------->
    <gw:textbox id="txtReturn" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
