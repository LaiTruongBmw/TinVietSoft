<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <title>vina genuwin</title>

    <script>
function BodyInit(){
    var pk = "<%=request.queryString("pk") %>";
    imgMember.MasterPK  =pk;
    txtMasterPK.text    =pk;
    dso_Photo.Call("SELECT");
}

function OnAttachFile(){
    imgMember.ChangeImage();
    dso_Photo.Call("SELECT");
}

function OnDeleteFile()
{
    if (confirm("Do you want to delete this picture?"))
    {
        grdPhoto.DeleteRow();
        dso_Photo.Call();
    }
}
function OnDownload(){
  var url = System.RootURL + "/system/binary/ViewFile.aspx?img_pk="+grdPhoto.GetGridData(grdPhoto.row,0)+"&table_name=SALE.sm_site_file";
  window.open(url);
}
    </script>

    <body>
        <gw:data id="dso_Photo"> 
        <xml> 
            <dso  
                type        ="grid" 
                parameter   ="0,1,2,3,4"  
                function    ="st_lg_sel_agds00161" 
                procedure   ="st_lg_upd_agds00161"> 
                <input bind ="grdPhoto">
                    <input bind="txtMasterPK" /> 
                </input>
                <output bind="grdPhoto" />
            </dso> 
        </xml> 
    </gw:data>
        <table style="width: 100%; height: 100%">
            <tr style="height: 2%" valign="top">
                <td style="width: 94%;">
                </td>
                <td style="width: 3%;">
                    <gw:icon id="btnAttachFile" text="Attach File" onclick="OnAttachFile()" />
                </td>
                <td style="width: 3%;">
                    <gw:icon id="btnDeleteFile" text="Delete File" onclick="OnDeleteFile()" />
                </td>
            </tr>
            <tr style="height: 100%" valign="top">
                <td colspan="3">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 98%">
                            <td>
                                <gw:grid id="grdPhoto" header="_pk|File Name|Size(Kb)|Attach Date|Create By" format="0|0|0|0|0"
                                    aligns="0|0|1|1|1" defaults="||||" editcol="0|0|0|0|0" widths="1500|1500|1500|2000|1000"
                                    sorting='T' styles="width:100%; height:100%" oncelldblclick="OnDownload()" autosize="T" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <gw:textbox id="txtMasterPK" styles="display:none" />
        <gw:image id="imgMember" table_name="sale.sm_site_file" procedure="sale.sp_upd_agds00161_attach"
            styles="display:none;height:100%" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
            post="/binary/PostFile.aspx" style='border: 1px solid #1379AC' />
    </body>
</html>
