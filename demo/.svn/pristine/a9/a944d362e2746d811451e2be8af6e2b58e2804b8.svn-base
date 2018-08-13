<!-- #include file="../../../system/lib/form.inc"  -->
 <%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>test import</title>


</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
function BodyInit()
{

	idDBUSR.text= "GENUWIN";

    
}
	function OnImportNew()
	{
	
		var currentTime = new Date();		
		txtSequence.text = currentTime.getTime();
		
	
	// argument fixed table_name, procedure, procedure_file
	// dynamic arg p_1,p_2,p_3,p_4,p_5
	var url =System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text +  '&table_name=TES_FILEOBJECT'+  '&procedure=gasp.SP_INSERT_IMAGE' + '&procedure_file='+ idDBUSR.text +'.lg_tantest_import_excel' + '&p_start=2'+ '&p_1=' + '&p_2=' + '&p_3=' + '&p_4=' + '&p_5=';
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
	
	if (txtRecord.text != 'undefined')
	{
		alert("Imported : " + txtRecord.text + " record(s)");
	}
		
    //datImportNew.Call("SELECT");
	}
</script>

<body>
   <table>
		<tr>
			<td>
				<gw:icon id="idBtnImp" img="in" text="Import Data" onclick="OnImportNew()" />			
			</td>
		</tr>
   </table>
   <gw:textbox id="txtSequence" text="" styles="display:none"  />
   <gw:textbox id="txtRecord" text="" styles="display:none"  />
   <gw:textbox id="idDBUSR" text="" styles="display:none"  />
</body>
</html>
