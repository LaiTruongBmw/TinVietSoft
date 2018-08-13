<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Asset Image</title>
</head>

<script type="text/javascript" language="javascript">
    
//=======================================================================
 
function BodyInit()
{
    System.Translate(document);    
    //var image_pk = 1 ;
    //imgAsset.SetDataText(image_pk);
    //-------------------------
    txtMasterPK.text = "<%=request.queryString("pk") %>";
    data_fpma00023.Call("SELECT");
}  
//=======================================================================
function OnDataReceive(pos)
{
    imgAsset.SetDataText(txtImagePK.text);
}
//=======================================================================
function OnSave()
{
    txtImagePK.SetDataText(imgAsset.oid);
    data_fpma00023.Call();
}
//=======================================================================
function OnDelete()
{
    data_fpma00023.StatusDelete();
    data_fpma00023.Call();
}
//=======================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="data_fpma00023" onreceive="OnDataReceive(this)"> 
    	<xml> 
	        <dso type="control" parameter="0,1" function="<%=l_user%>lg_sel_fpma00023"  procedure="<%=l_user%>lg_upd_fpma00023">
	            <inout> 
	                 <inout  bind="txtMasterPK" /> 
	                 <inout  bind="txtImagePK" />                       
	            </inout>
	        </dso> 
    	</xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 99%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%" colspan="3">
                <gw:image id="imgAsset" table_name="<%=l_user%>tlg_ma_asset_photo" procedure="<%=l_user%>lg_upd_fpma00023_att"
                    styles="width:100%;height:100%" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
                    post="/binary/PostFile.aspx" style='border: 1px solid #1379AC' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtImagePK" maxlen="100" styles='width:100%;display:none' />
</html>
