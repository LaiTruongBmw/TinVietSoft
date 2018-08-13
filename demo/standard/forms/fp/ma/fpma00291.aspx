<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Attach file(s) list of Adjust Slip</title>
</head>

<script type="text/javascript" language="javascript">
    var PK              =0,
        FILENAME        =1,
        FILESIZE        =2,
        CONTENTTYPE     =3,
        REMARKS         =4,
        TLG_MA_ASSET_PK =5;


    //=======================================================================
    function AttachFiles() {
        txtAssetPK.text = '<%=Request.Querystring("pk") %>';
        if (txtAssetPK.text != '') {
            imgFile.MasterPK = txtAssetPK.text;
            imgFile.ChangeImage();
            if (imgFile.oid == 0) {
                return false;
            }
            else {
                data_fpma00291.Call('SELECT');
            }
            imgFile.oid = "";
        }
        else {
            alert('Please select one Asset!!');
        }
    }

//=======================================================================
 
function BodyInit()
{
    System.Translate(document);    
    //var image_pk = 1 ;
    //imgAsset.SetDataText(image_pk);
    //-------------------------
    txtAssetPK.text = '<%=Request.Querystring("pk") %>';
    data_fpma00291.Call("SELECT");
}  
//=======================================================================
function OnDataReceive(pos)
{
    //imgAsset.SetDataText(txtImagePK.text);
}
//=======================================================================
function OnSave()
{
    data_fpma00291.Call();
}
//=======================================================================
function OnRefresh() {
    txtAssetPK.text = '<%=Request.Querystring("pk") %>';
    data_fpma00291.Call();
}

//=======================================================================
function OnDelete()
{
    if (grdAttach.rows - 1 > 0) 
    {
        grdAttach.DeleteRow();
    }
}

//=======================================================================
function OnDownload() {
    if (grdAttach.rows > 0)
     {
        var filepk = grdAttach.GetGridData( grdAttach.row, PK );
        if(filepk!='')
        {
            var url = System.RootURL + '/form/fp/ma/fpma00024_DownFile.aspx?img_pk=' + filepk + '&table_name=TLG_MA_ADJ_SLIP_FILES';
	        System.OpenTargetPage( url , 'newform' ); 
        }
    }
}
//=======================================================================
function OnOpenFile() {
    var img_pk = grdAttach.GetGridData(grdAttach.GetGridControl().row, PK);
    var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TLG_MA_ADJ_SLIP_FILES";
    window.open(url);
}
//=======================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="data_fpma00291" onreceive="OnDataReceive(this)"> 
    	<xml> 
	        <dso  id="1" type="grid" parameter="0,4,5" function="<%=l_user%>lg_sel_fpma00291"  procedure="<%=l_user%>lg_upd_fpma00291">
	            <input>
	                 <input  bind="txtAssetPK" /> 
	            </input>
	                <output bind="grdAttach" /> 
	        </dso> 
    	</xml> 
    </gw:data>
    <!---------------------------------------------------------------->
	<table id='id_4' style="width:100%;height:100%" cellpadding='0' cellspacing='0'>		<tr style="width:100%; height:1%">			<td width="98%"></td>			<td width="1%" valign='top'>				<gw:button id="btS" img="attach" alt="Attach file"  onclick="AttachFiles()" />			</td>			<td width="1%" valign='top'>				<gw:button id="btRefresh" img="refresh" alt="Refresh List"  onclick="OnRefresh()" />			</td>			<td width="1%" valign='top'>				<gw:button id="btSaveAttact" img="save" alt="Update"  onclick="OnSave('Attach_file')" />			</td>			<td width="1%">				<gw:button id="btDeletedtl" img="delete" alt="Delete"  onclick="OnDelete('Attach_file')" />			</td>			<td width="1%">				<gw:button id="btDownload" img="download" alt="Downlad"  onclick="OnDownload()" />			</td>		</tr>		<tr style="width:100%; height:">			<td colspan="6"  width='100%'>			    <gw:grid id='grdAttach'
                    header='_PK|File Name|File Size|File Type|Remark|_TLG_MA_ASSET_PK'
                    format='0|0|0|0|0|0'
                    aligns='0|0|3|0|0|0'
                    check='|||||'
                    editcol='0|0|0|0|1|0'
                    widths='1000|3500|1000|2000|1000|1000'
                    styles="width:100%; height:100%"   					sorting="T" oncelldblclick="OnOpenFile()"   
                    />			</td>		</tr> 	</table>						
</body>
<!---------------------------------------------------------------------->
<gw:image id="imgFile" table_name="<%=l_user %>TLG_MA_ADJ_SLIP_FILES" procedure="<%=l_user %>lg_upd_fpma00291_files" view="/binary/ViewFile.aspx"        post="/binary/PostFile.aspx" styles="width:100;height:100;display:none" />
        
<gw:textbox id="txtAssetPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtImagePK" maxlen="100" styles='width:100%;display:none' />
</html>
