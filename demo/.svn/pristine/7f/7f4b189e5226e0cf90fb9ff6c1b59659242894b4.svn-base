<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Work Classification</title>
</head>
<%  CtlLib.SetUser("acnt")%>
<script>
 function BodyInit()
{
    System.Translate(document); 
     data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.sf_a_get_company('') FROM DUAL")%>";   
     lstCompany_pk.SetDataText(data);
     lstCompany_pk.value = "<%=Session("COMPANY_PK") %>";
     OnSearch();
} 
function OnSearch()
{
        dso_search.Call("SELECT");
}
function Select()
{
	
	var code_data=new Array()
	var ctrl = idGrid.GetGridControl();
        code_data[0] = idGrid.GetGridData( ctrl.row , 0 );//Code
        code_data[1] = idGrid.GetGridData( ctrl.row , 1 );//Name(ENG)
		code_data[2] = idGrid.GetGridData( ctrl.row , 2 );//Name (VN)
		code_data[3] = idGrid.GetGridData( ctrl.row , 3 );//Name (KR)
		code_data[4] = idGrid.GetGridData( ctrl.row , 4 );//pk
		window.returnValue = code_data; 
	   	this.close(); 	
}	
</script>
<body>
 <gw:data id="dso_search" onreceive="">
        <xml>
            <dso type="grid" function="acnt.sp_sel_agic00010_popup" >
                <input bind="idGrid">
                    <input bind="lstCompany_pk"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
        <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                    
                    <tr style="width:100%;height:100%">
                                 <td>
                                                <gw:grid
                                        id      ="idGrid"  
                                        header  ="Currency|Bank Name|Account No|Account Name|_pk"
                                        format  ="0|0|0|0|0"
                                        aligns  ="0|0|0|0|0"
                                        defaults="||||"
                                        editcol ="0|0|0|0|0"
                                        widths  ="1500|3000|3000|3000|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="T"
										oncelldblclick="Select()"		
                                        />									
                                 </td>
                    </tr> 
        </table>
</body>
<gw:list id="lstCompany_pk" styles='width:100%;display:none' />
</html>
