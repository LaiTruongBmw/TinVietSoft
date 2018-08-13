<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var arr_pk_char    =new Array();
var arr_len_char    =new Array();
var arr_Temp    =new Array();
var sCharacters;
var sExa_Characters;
var sTemplates;
var sExa_Templates;
var bend;
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";

function BodyInit()
{   
}
function OnSelect()
{
    OnExit();
}
function OnExit()
{var p_temp="0";
 if(option1.checked==true)
  p_temp="1";
  else
  p_temp="0";
  //alert(p_temp);
window.returnValue = p_temp; 
	window.close();
}
</script>
<body bgcolor='#F5F8FF'>
<table border='0'>
<tr style="height:0%">
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
</tr>
<tr>
    <td  colspan="9" align="center" style=" color:Blue" >Please chooce option to get Beneficiary infomation by  </td>
    <td>
    <gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" />
    </td>
</tr>

<tr>
<td colspan="1" align="right">
  <input type="radio" name="option" id="option1" value="1"  onclick="OnSelect()"><br>
</td>
<td colspan=9 align="left"><label for="option1" onclick="option2.checked=true;">From Humam Resource </label> </td>
</tr>

<tr>
<td colspan="1" align="right">
  <input type="radio" name="option" id="option2" value="2"  onclick="OnSelect()"><br>
</td>
<td colspan=9 align="left"><label for="option2" onclick="" >From Accounting</label> </td>
</tr>

</table>
<!--data-->
<gw:textbox id="txtResult"  text="0" style="display:none"/>

</body>
</html>
