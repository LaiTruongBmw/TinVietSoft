<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POP UP View Picture</title>
</head>

<script type="text/javascript" language="javascript">
var save = 0 ;
//===========================================================
function BodyInit()
 {
    System.Translate(document);
    var comp_in_pk = "<%=Request.querystring("comp_in_pk")%>";
     
    txt_comp_in_pk.text  = comp_in_pk;
    
    data_fpdp00124.Call("SELECT");
 }
//===========================================================
 function OnDataReceive(obj)
 {
        if( obj.id == 'data_fpdp00124' )
        {
             if(save == 0)
             {
                 imgComponent.SetDataText(txt_photo_pk.text);
             }
             else 
             {
                window.close();
             }               
        }                     
 }
//=========================================================== 
  function onSave()
 {
        txt_photo_pk.SetDataText(imgComponent.oid);
        data_fpdp00124.StatusUpdate();
        save = 1 ;
        data_fpdp00124.Call();         
 }
 //===========================================================
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpdp00124" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1" function="<%=l_user%>lg_sel_fpdp00124"  procedure="<%=l_user%>lg_upd_fpdp00124"> 
            <inout> 
                 <inout  bind="txt_comp_in_pk" /> 
                 <inout  bind="txt_photo_pk" />     
            </inout>
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td colspan="2">
            <gw:image id="imgComponent" table_name="TLG_PT_LGPICTURE" oid="0" view="/binary/ViewFile.aspx"
                        post="/binary/PostFile.aspx" styles="width:99%;height:100%" style='border: 1px solid #1379AC' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------->
<gw:imgbtn img="save" alt="Save" id="btnInSave" onclick="onSave()" style="position: absolute; right: 25; top: 3;"/>
<gw:textbox id="txt_photo_pk" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txt_comp_in_pk" maxlen="100" styles='width:100%;display:none' />
<!------------------------------------------------------------------->
</html>
