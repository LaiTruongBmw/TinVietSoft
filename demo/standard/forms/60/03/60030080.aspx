<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Vina Genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
    function BodyInit() {
        System.Translate(document);
    }
    function OnSearch() {
        dso_search.Call('SELECT');
    }
</script>
<body>
<gw:data id="dso_search" onreceive=""> 
        <xml> 
           <dso type="grid" function="ac_sel_60030080" > 
                <input bind="GridDetail" > 
                    <input bind="txtUser_Id" /> 
                    <input bind="txtEmployee" /> 
                </input> 
                <output bind="GridDetail" /> 
            </dso> 
        </xml> 
 </gw:data> 
    <table style='width:100%;height:100%' cellpadding='0' cellspacing='0'>
        <tr style='height:2%'>
            <td>
                <fieldset style='padding:0'>
                    <table width='100%' cellpadding='1' cellspacing='1'>
                        <tr>
                            <td align="right" width='10%' >User ID</td>
                            <td width='40%'><gw:textbox id="txtUser_Id" onenterkey='OnSearch()'  styles="width:100%;" /></td>
                            <td align="right" width='10%'>Employee</td>
                            <td width='40%'><gw:textbox id="txtEmployee" onenterkey='OnSearch()'  styles="width:100%;" /></td>
                            <td ><gw:imgBtn id="ibtnReset" img="search" alt="search"	onclick="OnSearch()"  	/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style='height:98%'>
            <td>
                <gw:grid   
                            id="GridDetail"  
                            header="_pk|User Id|Employee|Trans Code|Trans Name"   
                            format="0|0|0|0|0"  
                            aligns  ="0|0|0|0|0"  
                            defaults="||||"  
                            editcol="1|1|1|1|1"  
                            widths="0|1000|3000|1500|0"  
                            styles="width:100%; height:100%"   
                            sorting="F"   
                            oncelldblclick  ="onRowDoubleclk(0)" 
		                   
	                             /> 
            </td>
        </tr>
    </table>
</body>
</html>