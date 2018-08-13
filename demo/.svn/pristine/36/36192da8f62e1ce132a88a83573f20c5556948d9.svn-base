<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser("HR")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script>

function BodyInit()
{ 
	System.Translate(document);
	OnSearch();
}

function OnClickUpload(opt)
{  
     if(opt == 1){
	    imgFile.SetDataText(0);
		imgFile.ChangeImage();
		var pic_pk = imgFile.GetData();
		imgFile.SetDataText(pic_pk);
		OnSearch();
		
      }
      
}
function OnSearch(){
    dsoDataList.Call("SELECT");
}
function OnDisplay(){
    txtFilePK.text = grdListFile.GetGridData(grdListFile.row,0);
    dsoCreateFile.Call("PROCESS");
}
function OnDataReceive(obj){
    if(obj.id == "dsoCreateFile"){
        document.TEST.loadFile("../../../" + txtFileName.text);
    }
    else if(obj.id == "dsoDataList"){
        if(grdListFile.rows > 1){
		    grdListFile.SelectRow(1);
		    OnDisplay();
		}
    }
}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <gw:data id="dsoCreateFile" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="esys.SP_PRO_GET_RATE"> 
                <input> 
                     <input bind="txtFilePK"/>
                </input>
                <output>
                     <output bind="txtFileName"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dsoDataList" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" function="esys.SP_SEL_TES_DXF_FILE"  > 
            <input bind="grdListFile"  > 
				<input bind="dtFrom" /> 
				<input bind="dtTo" /> 	
            </input> 
            <output bind="grdListFile" /> 
        </dso> 
    </xml> 
</gw:data>
    <table width="100%" height="100%" border="1" cellspacing="1" cellpadding="1">
        <tr valign="top">
            <td width="25%" height="100%">
                <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        Upload
                                    </td>
                                    <td>
                                        <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width:90%" onchange=""></gw:datebox>
                                    </td>
                                    <td width="10%">
                                        ~</td>
                                    <td>
                                        <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width:90%" onchange=""></gw:datebox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <gw:icon id="btnClearAcc" img="in" text="Add new" styles="width:100" onclick="OnClickUpload(1)" />
                                    </td>
                                    <td align="right">
                                        <gw:imgbtn id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="100%">
                        <td colspan="4">
                            <gw:grid id="grdListFile" header="_PK|File name|File size" format="0|0|0" aligns="0|0|0" defaults="||"
                                editcol="0|0|0" widths="0|3000|1000" styles="width:100%; height:100%" sorting="T" acceptnulldate="T"
                                oncellclick="OnDisplay()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="75%" height="100%">
                <applet codebase="." archive="dxfapplet.jar" code="de.escape.quincunx.dxf.DxfViewer" width="1000" height="600"
                    name="TEST">
                    <param name="framed" value="false">
                    <param name="frameWidth" value="1000">
                    <param name="frameHeight" value="600">
                </applet>
            </td>
        </tr>
    </table>
    <gw:image id="imgFile" table_name="ESYS.TES_DXF_FILE" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx"
        styles="width:0%;height:0%" />
</body>
<gw:textbox id="txtFilePK" styles="display:none" />
<gw:textbox id="txtFileName" styles="display:none" />
</html>
