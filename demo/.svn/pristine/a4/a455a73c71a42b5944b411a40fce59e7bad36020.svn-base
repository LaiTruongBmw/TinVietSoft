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
//===========================================================
function BodyInit()
 {
    System.Translate(document);
    var patternd_pk = "<%=Request.querystring("patternd_pk")%>";
    var picture_pk  = "<%=Request.querystring("picture_pk")%>";
     
    txt_photo_pk.text    = picture_pk;
    txt_patternd_pk.text = patternd_pk;
    
    imgComponent.SetDataText(txt_photo_pk.text); 
 }
//===========================================================
 function onSave()
 {
    if (txt_patternd_pk.text=="")
    {
        var arr_data = new Array();
        arr_data[0]=imgComponent.oid;
        window.returnValue =  arr_data;
		window.close();
         
    }
    else
    {
        txt_photo_pk.SetDataText(imgComponent.oid);
        data_fpdp00065.StatusUpdate();
        data_fpdp00065.Call();
    }
 }
//===========================================================
 function OnDataReceive(obj)
 {
        if( obj.id == 'data_fpdp00065' )
        {
            imgComponent.SetDataText(txt_photo_pk.text);
            
            var arr_data = new Array();
            
            arr_data[0]=imgComponent.oid;
            
            window.returnValue =  arr_data;
	        window.close();
        }
 }
//===========================================================
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpdp00065" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1" function="<%=l_user%>lg_sel_fpdp00065"  procedure="<%=l_user%>lg_upd_fpdp00065"> 
            <inout> 
                 <inout  bind="txt_patternd_pk" /> 
                 <inout  bind="txt_photo_pk" />     
            </inout>
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 99%">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="2">
                <gw:image id="imgComponent" table_name="TES_LGPICTURE" oid="0" view="/binary/ViewFile.aspx"
                    post="/binary/PostFile.aspx" styles="width:100%;height:100%" />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------->
<gw:textbox id="txt_photo_pk" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txt_patternd_pk" maxlen="100" styles='width:100%;display:none' />
<!------------------------------------------------------------------->
</html>
