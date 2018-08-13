<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
//=======================================================================
var l_master_pk ="";
function BodyInit()
{
    System.Translate(document); 
    var callerWindowObj = dialogArguments;  
    l_master_pk =   callerWindowObj.txtMasterPK.text;
    //-------------------------
    pro_dscd00034.Call();
}  
//=======================================================================
function OnReport()
{
    switch(radType.value)
    {
        case '0':
            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00030_ST_DW.aspx?master_pk='+ l_master_pk+'&print_time='+txtPrintTime.text  ;
             window.open(url); 
        break;
        case '1':
            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00030_DW.aspx?master_pk='+ l_master_pk  ;
             window.open(url); 
        break;
        case '2':
            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00030_DW_02.aspx?master_pk='+ l_master_pk  ;
	        window.open(url);   
        break;
        case '3':
            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00030_DW_03.aspx?master_pk='+ l_master_pk  ;
	         window.open(url); 
        break;
        case '4':
            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00030_DW_04.aspx?master_pk='+ l_master_pk  ;
	        window.open(url); 
        break;
    }   
    this.close(); 	
}
//=======================================================================
</script>

<body>    
 <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00034" > 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00034" > 
                <input>      
                    <input bind="txtPrintTime" />             
                </input> 
                <output>
                    <output bind="txtPrintTime" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <table >
        <tr style="height:20%">
            <td colspan="3" style="font-size:large; color:Blue" align="center"> DELIVERY VOUCHER</td>
        </tr>
           <tr style="height:10%">
           <td style="width:30%;" align="right">Print No            
            </td>
            <td style="width:30%">
                <gw:textbox id='txtPrintTime' styles="width:100%" type='number' format="###.###.###"> </gw:textbox>
            </td>
          <td align="right" style="width:40%">
                <gw:button id="idBtnOk" img="excel" text="Print Report"
                                            onclick="OnReport()" />
           </td>
          </tr>  
          <tr style="height:70%" >
           <td colspan = 2 style="width:60%" > 
               <gw:radio id="radType" value="0" styles="width:100%" > 
                    <span value="0">Delivery Voucher (Standard)</span> <br/>
                    <span value="1">Delivery Voucher (Type 1)</span> <br/>
                    <span value="2">Delivery Voucher (Type 2)</span> <br/>
                    <span value="3">Delivery Voucher (Type 3)</span> <br/>                                              
                    <span value="4">Delivery Voucher (Type 4)</span> <br/>
                </gw:radio>
           </td>
           <td>
                
           </td>          
        </tr>   
        
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
