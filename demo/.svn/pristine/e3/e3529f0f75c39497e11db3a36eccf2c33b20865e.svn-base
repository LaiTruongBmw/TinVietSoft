<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Popup Source</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="0" 
                        function="ST_SY_SEL_GSVS00201" 
                        procedure="ST_SY_DEL_GSVS00201"> 

                    <input bind="grdData">                    
                        <input bind="txtPK" /> 
                    </input> 
                    <output bind="grdData" />
                </dso> 
            </xml> 
        </gw:data>
        <!----------------------------------------------------------------------------------------------->
        <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0" >
            <tr style="width:100%;">
                <td>
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:100%;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td colspan="95" width="95%" align="left" style="white-space:nowrap">&nbsp;</td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUp" img="up"  text="Upload"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDown" img="down"  text="Download"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord"  text="Rcs : " />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT"  text="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:100%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData" 
                                 header ="_PK|File Name|Size(Kb)|Attach Date|Up By|."
                                 format ="0|0|0|0|0|0" 
                                 aligns ="0|1|0|0|0|0" 
                                 editcol="0|0|0|0|0|0"
                                 autosize = 'T'
                                 styles="width:100%; height:100%"
                                 sorting="T"  autosize="T" />
                    </div>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtPK" styles='display:none' />
        <gw:image id="imgSource" 
                table_name="TSY_SOURCE" 
                procedure="ST_SY_UPD_GSVS00201"
                styles="display:none;height:100%" 
                style='border: 1px solid #1379AC' 
                view="/binary/ViewFile.aspx"
                post="/binary/PostFile.aspx" 
                style='border: 1px solid #1379AC' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
            var G0_PK = 0,
                G0_FILE_NAME = 1,
                G0_FILE_SIZE = 2,
                G0_ATTACH_DATE = 3,
                G0_UP_BY = 4
                ;

            var c_lblRecordDT,
                c_imgSource,
                c_txtPK,
                c_grdData,

                c_ibtnDelete,
                c_ibtnUp,
                c_ibtnDown,

                c_dso_Data
                ;

            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
                check_init = 1;
            }

            function InitData() {
                var pk = "<%=request.queryString("pk") %>";
                txtPK.text = pk;
                imgSource.MasterPK = pk;

                c_dso_Data.Call("SELECT");
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT;
                c_txtPK = txtPK;
                c_imgSource = imgSource;
                c_grdData = grdData;

                c_ibtnDelete = ibtnDelete;
                c_ibtnUp = ibtnUp;
                c_ibtnDown = ibtnDown;

                c_dso_Data = dso_Data;
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    case c_dso_Data.id:
                        c_lblRecordDT.text = c_grdData.rows - 1;
                        break;
                }
            }

            function OnClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_ibtnUp.id:
                        c_imgSource.ChangeImage();
                        c_dso_Data.Call("SELECT");
                    break;
                    case c_ibtnDelete.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData.DeleteRow();
                            c_dso_Data.Call();
                        }
                    break;
                    case c_ibtnDown.id:
                        var pk = c_grdData.GetGridData(c_grdData.row, G0_PK);
                        if (c_grdData.row > 0 && pk != "") {
                            var url = System.RootURL + "/system/binary/ViewFile.aspx?img_pk=" + pk + "&table_name=CTL.TSY_SOURCE";
                            window.open(url);
                        }
                    break;
                }
            }

            function OnValid(obj) {
                switch (obj) {
                    case "INIT":
                        if (check_init == 0) {
                            alert("System not yet ready!");
                            return false;
                        }
                        return true;
                        break;
                }
            }
        </script>
    </body>
</html>