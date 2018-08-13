<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Popup Version Copy</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_SY_SEL_GSVS00203" 
                        procedure=""> 

                    <input bind="grdData">                    
                        <input bind="txtPK" /> 
                        <input bind="txtSearch" /> 
                    </input> 
                    <output bind="grdData" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Process" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso type="process" procedure="ST_SY_PRO_GSVS00203" > 
                    <input>
                        <input bind="txtVersionPK" /> 
                        <input bind="txtPK" />
                    </input> 
                    <output>
                        <output bind="txtResult" />
                    </output>
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
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    Object :
                                </td>
                                <td colspan="79" width="79%">
                                    <gw:textbox  id="txtSearch" styles='width:100%;height:20px' onenterkey="OnClick(this)" /></td>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnProcess" img="process"  text="Process"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord"  text="Rcs : " />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT"  text="0" />
                                </td>
                                <td colspan="16" width="16%" align="left" style="white-space:nowrap">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:100%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData" 
                            header ="_TSY_VERSION_PK_FROM|_TSY_VERSION_PK_TO|OBJECT ID|OBJECT NAME|VERSION|OBJECT TYPE|."
                            format ="0|0|0|0|0|0|0" 
                            aligns ="0|0|0|0|0|0|0"
                            editcol="0|0|0|0|0|0|0"
                            autosize = 'T'
                            styles="width:100%; height:100%"
                            sorting="T" autosize="T" />
                    </div>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtPK" styles='display:none' />
        <gw:textbox  id="txtVersionPK" styles='display:none' />
        <gw:textbox  id="txtUserID" styles='display:none' />
        <gw:textbox  id="txtResult" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
            var G0_TSY_VERSION_PK_FROM = 0,
                G0_TSY_VERSION_PK_TO = 1,
                G0_OBJECT_ID = 2,
                G0_OBJECT_NAME = 3,
                G0_VERSION = 4,
                G0_OBJECT_TYPE = 5
                ;
                
            var c_lblRecordDT,
                c_txtPK,
                c_txtVersionPK,
                c_txtSearch,
                c_txtResult,
                c_ibtnSearch,
                c_ibtnProcess,
                c_grdData,

                c_dso_Data,
                c_dso_Process
                ;

            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
                check_init = 1;

                c_dso_Data.Call("SELECT");
            }

            function InitData() {
                var pk = "<%=request.queryString("pk") %>";
                txtPK.text = pk;
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT;
                c_txtPK = txtPK;
                c_txtVersionPK = txtVersionPK;
                c_txtSearch = txtSearch;
                c_txtResult = txtResult;
                c_ibtnSearch = ibtnSearch;
                c_ibtnProcess = ibtnProcess;
                c_grdData = grdData;

                c_dso_Data = dso_Data;
                c_dso_Process = dso_Process;

                c_grdData.GetGridControl().FrozenCols = G0_OBJECT_NAME;
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    case c_dso_Data.id:
                        c_lblRecordDT.text = c_grdData.rows - 1;
                        break;
                    case c_dso_Process.id:
                        if(txtResult.text == "FINISH"){
                            var arr_data = "OK";
                            alert(txtResult.text);
                            window.returnValue =  arr_data;
		                    window.close();
                        }
                        break;
                }
            }

            function OnClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_txtSearch.id:
                    case c_ibtnSearch.id:
                        c_dso_Data.Call("SELECT")
                    break;
                    case c_ibtnProcess.id:
                        var pk = c_grdData.GetGridData(c_grdData.row, G0_TSY_VERSION_PK_TO);
                        if (pk != "") {
                            c_txtVersionPK.text = pk;
                            c_dso_Process.Call();
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