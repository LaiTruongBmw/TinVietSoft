<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Incoming Entry</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_SLIP_NO = 2,
    G_DESC = 6,
    G_TOTAL_AMT = 9;

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
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
  	
	 var data = "";    
     lstSlipTypeS.SetDataText("DATA|IM|IMPORT|EX|EXPORT");
    
        grdDetail.GetGridControl().MergeCells  = 2 ;	
        grdDetail.GetGridControl().MergeCol(0) = true ;	
        grdDetail.GetGridControl().MergeCol(1) = true ;   	
        grdDetail.GetGridControl().MergeCol(2) = true ;	
        grdDetail.GetGridControl().MergeCol(3) = true ;	
        grdDetail.GetGridControl().MergeCol(4) = true ;   	
        grdDetail.GetGridControl().MergeCol(5) = true ;	
        
        grdDetail.GetGridControl().MergeCol(6) = true ;	
        grdDetail.GetGridControl().MergeCol(7) = true ;   	
        grdDetail.GetGridControl().MergeCol(8) = true ;	
        grdDetail.GetGridControl().MergeCol(9) = true ;	
        grdDetail.GetGridControl().MergeCol(10) = true ; 
        
       
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;

 }

 
//=============================================================================================
function OnSearch(pos)
{
    data_dscm00030.Call("SELECT");
}
//=============================================================================================
function OnDataReceive(obj)
{
    if ( grdDetail.rows > 1 )
    {
        grdDetail.SetCellBold( 1, G_SLIP_NO, grdDetail.rows-1, G_SLIP_NO, true);
        grdDetail.SetCellBold( 1, G_DESC, grdDetail.rows-1, G_DESC, true);
        grdDetail.SetCellBold( 1, G_TOTAL_AMT, grdDetail.rows-1, G_TOTAL_AMT, true);      
    }   
        lbConfirmRecord.text = grdDetail.rows-1 + " record(s)";      
}

</script>

<body>
  
  <!--------------------------------------------------------------------->
    <gw:data id="data_dscm00030" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_dscm00030"  >
                <input bind="grdDetail" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
			        <input bind="txtSearchNo" />
					<input bind="lstSlipTypeS" />
                 </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
         <tr style="height: 5%" >
   
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdConfirm')" />
                ~
                <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdConfirm')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Slip
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtSearchNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Type
            </td>
            <td style="width: 20%">
                <gw:list id="lstSlipTypeS" styles='width:100%' csstype="mandatory" />
            </td>
             <td style="width: 27%; text-align: center">
                <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
            </td>            
        </tr>
            <tr style="height: 95%">
                <td colspan="8">
                   <gw:grid id='grdDetail'
                        header='TYPE|Slip Date|Slip NO|Status|Item AMT|Tax AMT|Total AMT|CCY|Charger|Description|Item Code|Item Name|Item Qty|Item AMT|Taxt AMT|Total Amt'
                        format='0|4|0|0|1|1|1|0|0|0|0|0|1|1|1|1'
                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        check='|||||||||||||||'
                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths='500|1200|1500|800|1500|1500|1500|1000|2000|2000|1500|2000|1500|1500|1500|1500'
                        sorting='T'
                        autosize='T' 
                        styles='width:100%; height:100%'
                        />
                </td>
           
            </tr>
    </table>
</body>
</html>
