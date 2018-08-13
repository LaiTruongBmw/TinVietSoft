<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Version Entry</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Get_List_Client" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstClient" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_List_Type" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstType" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Grid_Client" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso type="process" procedure="ST_SY_SEL_CO_GRID_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" />
                        <input bind="txtColumn" />
                    </input> 
                    <output>
                        <output bind="txtResult" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Grid_Img" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso type="process" procedure="ST_SY_SEL_CO_GRID_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" />
                        <input bind="txtColumn" />
                    </input> 
                    <output>
                        <output bind="txtResult" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Grid_Type" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso type="process" procedure="ST_SY_SEL_CO_GRID_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" />
                        <input bind="txtColumn" />
                    </input> 
                    <output>
                        <output bind="txtResult" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_O"  onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,3,4,5,6,7,8,9,10" 
                        function="ST_SY_SEL_GSVS00200_0" 
                        procedure="ST_SY_UPD_GSVS00200_0"> 

                    <input bind="grdData_O">                    
                        <input bind="lstClient" /> 
                        <input bind="lstType" /> 
                        <input bind="txtSearch_O" /> 
                    </input> 
                    <output bind="grdData_O" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_V"  onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,3,4,5" 
                        function="ST_SY_SEL_GSVS00200_1" 
                        procedure="ST_SY_UPD_GSVS00200_1"> 

                    <input bind="grdData_V">                    
                        <input bind="txtPK_O" /> 
                    </input> 
                    <output bind="grdData_V" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_M"  onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,7,8" 
                        function="ST_SY_SEL_GSVS00200_2" 
                        procedure="ST_SY_UPD_GSVS00200_2"> 

                    <input bind="grdData_M">                    
                        <input bind="txtPK_V" /> 
                    </input> 
                    <output bind="grdData_M" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_U"  onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_SY_SEL_GSVS00200_3" 
                        procedure=""> 

                    <input bind="grdData_U">                    
                        <input bind="txtPK_V" /> 
                    </input> 
                    <output bind="grdData_U" />
                </dso> 
            </xml> 
        </gw:data>
        <!--------------------------------------------Content--------------------------------------------------->
        <table style="width:100%;height:100%;border:0px solid black" cellpadding="0" cellspacing="0" border="0" >
            <tr style="height:50%">
                <td style="width:50%;padding-right:2px;" valign="top">
                    <fieldset style="border:1px solid #62ac0d;height:100%">
                        <legend>Object</legend>
                        <table style="width:100%;height:95%;border:0px solid black" cellpadding="1" cellspacing="1">
                            <tr style="height:1%">
                                <td colspan="30" width="30%">
                                    <gw:list id="lstClient" styles="width: 100%" onchange="OnClick(this)" />
                                </td>
                                <td colspan="30" width="30%">
                                    <gw:list id="lstType" styles="width: 100%" onchange="OnClick(this)" />
                                </td>
                                <td colspan="25" width="25%">
                                    <gw:textbox  id="txtSearch_O" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch_O" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew_O" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate_O" img="save"  text="Update"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete_O" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord_O"  text="Rcs : " />
                                </td>
                                <td colspan="10" width="10%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT_O"  text="0" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="100" valign="top" style="height:99%">
                                    <gw:grid id="grdData_O" 
                                            header ="_PK|SOURCE|ID|NAME|L.NAME|F.NAME|PATH|IMG|TYPE|DESC.|USE YN|."
                                            format ="0|0|0|0|0|0|0|0|0|0|3|0" 
                                            aligns ="0|0|0|0|0|0|0|0|0|0|0|0"
                                            editcol="0|0|1|1|1|1|1|0|0|1|1|0"
                                            autosize = 'T'
                                            styles="width:100%; height:100%"
                                            onclick="OnClick(this)"
                                            sorting="T" autosize="T" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td style="width:50%" valign="top">
                    <fieldset style="border:1px solid #62ac0d;height:100%">
                        <legend>Mapping</legend>
                        <table style="width:100%;height:95%;border:0px solid black" cellpadding="1" cellspacing="1">
                            <tr>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew_M" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate_M" img="save"  text="Update"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete_M" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord_M"  text="Rcs : " />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT_M"  text="0" />
                                </td>
                                <td colspan="95" width="95%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="100" valign="top" style="height:99%">
                                    <gw:grid id="grdData_M" 
                                            header ="_PK|_TSY_VERSION_PK_FROM|_TSY_VERSION_PK_TO|OBJECT ID|OBJECT NAME|VERSION|OBJECT TYPE|DESC.|USE YN|."
                                            format ="0|0|0|0|0|0|0|0|3|0" 
                                            aligns ="0|0|0|0|0|0|0|0|0|0"
                                            editcol="0|0|0|0|0|0|0|1|1|0"
                                            autosize = 'T'
                                            styles="width:100%; height:100%"
                                            sorting="T" autosize="T" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr style="height:50%">
                <td style="width:50%;padding-right:2px;" valign="top">
                    <fieldset style="border:1px solid #62ac0d;height:99%">
                        <legend>Version</legend>
                        <table style="width:100%;height:95%;border:0px solid black" cellpadding="1" cellspacing="1">
                            <tr style="height:1%">
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    Object :
                                </td>
                                <td colspan="84" width="84%" align="left" style="white-space:nowrap">
                                    <gw:textbox  id="txtSearch_V" styles='width:100%;height:20px' onenterkey="OnClick(this)" /></td>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew_V" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate_V" img="save"  text="Update"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete_V" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnCopy_V" img="copy"  text="Copy"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord_V"  text="Rcs : " />
                                </td>
                                <td colspan="10" width="10%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT_V"  text="0" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="100" valign="top" style="height:99%">
                                    <gw:grid id="grdData_V" 
                                        header ="_PK|_TSY_OBJ_PK|VERSION|ATTACH|DESC.|USE YN|."
                                        format ="0|0|0|0|0|3|0" 
                                        aligns ="0|0|0|1|0|0|0"
                                        editcol="0|0|1|0|1|0|0"
                                        autosize = 'T'
                                        styles="width:100%; height:100%"
                                        oncelldblclick = "OnDblClick(this);"
                                        onclick="OnClick(this)"
                                        sorting="T" autosize="T" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td valign="top">
                    <fieldset style="border:1px solid #62ac0d;height:99%">
                        <legend>Use By</legend>
                        <table style="width:100%;height:95%;border:0px solid black" cellpadding="1" cellspacing="1">
                            <tr style="height:1%">
                                <td colspan="1" width="1%" style="white-space:nowrap;">
                                    <gw:label id="lblRecord_U"  text="Rcs : " style="height:22px" />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT_U"  text="0" style="height:22px"/>
                                </td>
                                <td colspan="98" width="98%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="100" valign="top" style="height:99%">
                                    <gw:grid id="grdData_U" 
                                            header ="_PK|_TSY_VERSION_PK_FROM|_TSY_VERSION_PK_TO|OBJECT ID|OBJECT NAME|VERSION|OBJECT TYPE|DESC.|USE YN|."
                                            format ="0|0|0|0|0|0|0|0|3|0" 
                                            aligns ="0|0|0|0|0|0|0|0|0|0"
                                            editcol="0|0|0|0|0|0|0|1|1|0"
                                            autosize = 'T'
                                            styles="width:100%; height:100%"
                                            sorting="T" autosize="T" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtClientID" styles='display:none' />
        <gw:textbox  id="txtUserID" styles='display:none' />
        <gw:textbox  id="txtObjectID" styles='display:none' />
        <gw:textbox  id="txtSysCD" styles='display:none' />
        <gw:textbox  id="txtAllYN" styles='display:none' />
        <gw:textbox  id="txtSRCYN" styles='display:none' />
        <gw:textbox  id="txtColumn" styles='display:none' />
        <gw:textbox  id="txtLable" styles='display:none' />
        <gw:textbox  id="txtLang" styles='display:none' />

        <gw:textbox  id="txtResult" styles='display:none' />
        <gw:textbox  id="txtPK_O" styles='display:none' />
        <gw:textbox  id="txtPK_V" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
            var G0_PK = 0,
                G0_SOURCE = 1,
                G0_ID = 2,
                G0_NAME = 3,
                G0_LNAME = 4,
                G0_FNAME = 5,
                G0_PATH = 6,
                G0_IMG = 7,
                G0_TYPE = 8,
                G0_DESC = 9,
                G0_USE_YN = 10,

                G1_PK = 0,
                G1_TSY_OBJ_PK = 1,
                G1_VERSION = 2,
                G1_ATTACH_FILE = 3,
                G1_DESC = 4,
                G1_USE_YN = 5,

                G2_PK = 0,
                G2_TSY_VERSION_PK_FROM = 1,
                G2_TSY_VERSION_PK_TO = 2,
                G2_OBJECT_ID = 3,
                G2_OBJECT_NAME = 4,
                G2_VERSION = 5,
                G2_OBJECT_TYPE= 6
                G2_DESC = 7,
                G2_USE_YN = 8,

                GE = 0
                ;
            var c_txtClientID,
                c_txtUserID,
                c_txtObjectID,
                c_txtSysCD,
                c_txtAllYN,
                c_txtSRCYN,
                c_txtColumn,
                c_txtLable,
                c_txtLang,

                c_txtResult,

                c_lstClient,
                c_lstType,

                c_ibtnSearch_O,
                c_ibtnNew_O,
                c_ibtnUpdate_O,
                c_ibtnDelete_O,
                c_lblRecordDT_O,
                c_txtSearch_O,
                c_txtPK_O,
                c_grdData_O,
                c_dso_Data_O,

                c_ibtnNew_V,
                c_ibtnUpdate_V,
                c_ibtnDelete_V,
                c_ibtnCopy_V,
                c_lblRecordDT_V,
                c_txtSearch_V,
                c_txtPK_V,
                c_grdData_V,
                c_dso_Data_V,

                c_ibtnNew_M,
                c_ibtnUpdate_M,
                c_ibtnDelete_M,
                c_lblRecordDT_M,
                c_grdData_M,
                c_dso_Data_M,

                c_lblRecordDT_U,
                c_grdData_U,
                c_dso_Data_U,

                c_dso_Get_List_Client,
                c_dso_Get_List_Type,

                c_dso_Get_Grid_Client,
                c_dso_Get_Grid_Img,
                c_dso_Get_Grid_Type
                ;

            var arr_g_Client,
                arr_g_Img,
                arr_g_Type
                ;

            function BodyInit() {
                InitControl();
                InitData();                
                System.Translate(document);
                c_dso_Get_List_Client.Call();
            }

            function InitData() {
                c_txtClientID.text = '<%=Session("CLIENT_ID")%>';
                c_txtUserID.text = '<%=Session("LOGIN_ID")%>';
                c_txtSysCD.text = 'CLIENT';
                c_txtAllYN.text = 'Y';
                c_txtSRCYN.text = 'N';
                c_txtLable.text = 'SEL CLIENT';
                c_txtLang.text = System.S_Lang;
            }

            function InitControl() {
                c_txtClientID = txtClientID;
                c_txtUserID = txtUserID;
                c_txtSysCD = txtSysCD;
                c_txtAllYN = txtAllYN;
                c_txtSRCYN = txtSRCYN;
                c_txtColumn = txtColumn;
                c_txtLable = txtLable;
                c_lstClient = lstClient;
                c_lstType = lstType;
                c_txtLang = txtLang;

                c_lblRecordDT_O = lblRecordDT_O;
                c_txtSearch_O = txtSearch_O;
                c_txtPK_O = txtPK_O;
                c_ibtnSearch_O = ibtnSearch_O;
                c_ibtnNew_O = ibtnNew_O;
                c_ibtnUpdate_O = ibtnUpdate_O;
                c_ibtnDelete_O = ibtnDelete_O;
                c_grdData_O = grdData_O;
                c_dso_Data_O = dso_Data_O;
                c_grdData_O.GetGridControl().FrozenCols = G0_LNAME;

                c_lblRecordDT_V = lblRecordDT_V;
                c_ibtnNew_V = ibtnNew_V;
                c_ibtnUpdate_V = ibtnUpdate_V;
                c_ibtnDelete_V = ibtnDelete_V;
                c_ibtnCopy_V = ibtnCopy_V;
                c_txtSearch_V = txtSearch_V;
                c_txtPK_V = txtPK_V;
                c_grdData_V = grdData_V;
                c_dso_Data_V = dso_Data_V;
                c_grdData_V.GetGridControl().FrozenCols = G1_DESC;

                c_ibtnNew_M = ibtnNew_M;
                c_ibtnUpdate_M = ibtnUpdate_M;
                c_ibtnDelete_M = ibtnDelete_M;
                c_lblRecordDT_M = lblRecordDT_M;
                c_grdData_M = grdData_M;
                c_dso_Data_M = dso_Data_M;
                c_grdData_M.GetGridControl().FrozenCols = G2_OBJECT_NAME;

                c_lblRecordDT_U = lblRecordDT_U;
                c_grdData_U = grdData_U;
                c_dso_Data_U = dso_Data_U;

                c_dso_Get_List_Client = dso_Get_List_Client;
                c_dso_Get_List_Type = dso_Get_List_Type;

                c_dso_Get_Grid_Client = dso_Get_Grid_Client;
                c_dso_Get_Grid_Img = dso_Get_Grid_Img;
                c_dso_Get_Grid_Type = dso_Get_Grid_Type;                
            }

            function OnDataError(obj) {
                switch (obj.id) {
                    default: return false;
                    case c_dso_Data_V.id:
                    case c_dso_Data_O.id:
                        System.Menu.OnGetError(eval(obj).errmsg);
                        break;
                }
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    default: return false;
                    case c_dso_Get_List_Client.id:
                        c_txtLable.text = 'SEL TYPE';
                        c_txtSysCD.text = 'SY_OBJ';
                        c_dso_Get_List_Type.Call();
                        break;
                    case c_dso_Get_List_Type.id:
                        c_txtSysCD.text = 'CLIENT';
                        c_txtAllYN.text = 'N';
                        c_dso_Get_Grid_Client.Call();
                        break;
                    case c_dso_Get_Grid_Client.id:
                        arr_g_Client = txtResult.text; txtResult.text = "";
                        c_grdData_O.SetComboFormat(G0_SOURCE, arr_g_Client);
                        c_txtSysCD.text = 'SY_IMG';
                        c_txtColumn.text = 'V1';
                        c_dso_Get_Grid_Img.Call();
                        break;
                    case c_dso_Get_Grid_Img.id:
                        arr_g_Img = txtResult.text; txtResult.text = "";
                        c_grdData_O.SetComboFormat(G0_IMG, arr_g_Img);
                        c_txtSysCD.text = 'SY_OBJ';
                        c_txtColumn.text = '';
                        c_dso_Get_Grid_Type.Call();
                        break;
                    case c_dso_Get_Grid_Type.id:
                        arr_g_Type = txtResult.text; txtResult.text = "";
                        c_grdData_O.SetComboFormat(G0_TYPE, arr_g_Type);
                        check_init = 1;
                        break;
                    case c_dso_Data_O.id:
                        c_lblRecordDT_O.text = c_grdData_O.rows - 1;
                        c_txtPK_O.text = "";
                        c_txtPK_V.text = "";
                        c_grdData_M.ClearData();
                        c_grdData_U.ClearData();
                        c_dso_Data_V.Call("SELECT");
                        break;
                    case c_dso_Data_V.id:
                        c_txtPK_V.text = "";
                        c_grdData_M.ClearData();
                        c_grdData_U.ClearData();
                        c_lblRecordDT_V.text = c_grdData_V.rows - 1;
                        break;
                    case c_dso_Data_M.id:
                        c_lblRecordDT_M.text = c_grdData_M.rows - 1;
                        c_dso_Data_U.Call("SELECT");
                        break;
                    case c_dso_Data_U.id:
                        c_lblRecordDT_U.text = c_grdData_U.rows - 1;
                        break;
                }
            }

            function OnDblClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_grdData_V.id:
                        var pk = obj.GetGridData(obj.row, G1_PK);
                        if (obj.row > 0 && obj.col == G1_ATTACH_FILE && pk != "") {
                            var fpath = System.RootURL + "/standard/forms/gs/vs/gsvs00201.aspx?pk=" + pk;
                            var obj = System.OpenModal(fpath, 500, 500, 'resizable:yes;status:yes');
                        }
                        break;
                }
            }

            function OnClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_ibtnNew_O.id:
                        c_grdData_O.AddRow();
                        c_grdData_O.SetGridText(c_grdData_O.rows - 1, G0_USE_YN, '-1'); 
                        c_grdData_O.SetGridText(c_grdData_O.rows - 1, G0_SOURCE, c_txtClientID.text);
                        c_grdData_O.SetGridText(c_grdData_O.rows - 1, G0_IMG, 'iconAutoForm.png');
                        c_grdData_O.SetGridText(c_grdData_O.rows - 1, G0_TYPE, 'OBJ_01');
                        break;
                    case c_ibtnUpdate_O.id:
                        var vl = false;
                        for (var i = 1; i < c_grdData_O.rows; i++) {
                            if (c_grdData_O.GetGridData(i, G0_ID) == "") { alert("Please input ID at row " + i.toString() + "!"); vl = true; i = c_grdData_O.rows; }
                            if (c_grdData_O.GetGridData(i, G0_NAME) == "") { alert("Please input Name at row " + i.toString() + "!"); vl = true; i = c_grdData_O.rows; }
                            if (c_grdData_O.GetGridData(i, G0_SOURCE) == "") { alert("Please input Source at row " + i.toString() + "!"); vl = true; i = c_grdData_O.rows; }
                            if (c_grdData_O.GetGridData(i, G0_TYPE) == "") { alert("Please input Type at row " + i.toString() + "!"); vl = true; i = c_grdData_O.rows; }
                        }
                        if (vl) return false;
                        c_dso_Data_O.Call();
                        break;
                    case c_ibtnDelete_O.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData_O.DeleteRow();
                            c_dso_Data_O.Call();
                        }
                        break;
                    case c_txtSearch_O.id:
                    case c_ibtnSearch_O.id:
                        c_dso_Data_O.Call("SELECT");
                        break;
                    case c_grdData_O.id:
                        var pk = obj.GetGridData(obj.row, G0_PK);
                        if (pk != "") {
                            c_txtPK_O.text = pk;
                            c_txtSearch_V.text = obj.GetGridData(obj.row, G0_ID);
                            c_txtPK_V.text = "";
                            c_grdData_M.ClearData();
                            c_grdData_U.ClearData();
                            c_dso_Data_V.Call("SELECT");
                        }
                        break;

                    case c_ibtnNew_V.id:
                        var pk = c_txtPK_O.text;
                        if (pk != "") {
                            c_grdData_V.AddRow();
                            c_grdData_V.SetGridText(c_grdData_V.rows - 1, G1_USE_YN, '-1');
                            c_grdData_V.SetGridText(c_grdData_V.rows - 1, G1_TSY_OBJ_PK, pk.toString());
                        }
                        break;
                    case c_ibtnUpdate_V.id:
                        var vl = false;
                        /*
                        for (var i = 1; i < c_grdData_V.rows; i++) {
                            if (c_grdData_V.GetGridData(i, G0_ID) == "") { alert("Please input ID at row " + i.toString() + "!"); vl = true; i = c_grdData_V.rows; }
                        } 
                        if (vl) return false;/**/
                        c_dso_Data_V.Call();
                        break;

                    case c_ibtnDelete_V.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData_V.DeleteRow();
                            c_dso_Data_V.Call();
                        }
                        break;

                    case c_ibtnCopy_V.id:
                        if (c_grdData_V.row < 0) return;
                        var pk = c_grdData_V.GetGridData(c_grdData_V.row, G1_PK);
                        if (pk != "") {
                            var fpath = System.RootURL + "/standard/forms/gs/vs/gsvs00203.aspx?pk=" + pk;
                            var obj = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');

                            if (obj != null) {
                                c_dso_Data_M.Call("SELECT");
                            }
                        }
                        break;

                    case c_grdData_V.id:
                        var pk = obj.GetGridData(obj.row, G1_PK);
                        if (obj.row > 0 && pk != "") {
                            c_txtPK_V.text = pk;
                        } else {
                            c_txtPK_V.text = "";
                        }
                        c_dso_Data_M.Call("SELECT");
                        break;

                    case c_ibtnNew_M.id:
                        if (c_grdData_V.row < 0) return;
                        var pk = c_grdData_V.GetGridData(c_grdData_V.row, G1_PK);
                        if (pk != "") {
                            var fpath = System.RootURL + "/standard/forms/gs/vs/gsvs00202.aspx?pk=" + pk;
                            var obj = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');

                            if (obj != null) {
                                var arrTemp;
                                for (var i = 0; i < obj.length; i++) {
                                    arrTemp = obj[i];
                                    c_grdData_M.AddRow();
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_TSY_VERSION_PK_FROM, arrTemp[0]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_TSY_VERSION_PK_TO, arrTemp[1]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_OBJECT_ID, arrTemp[2]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_OBJECT_NAME, arrTemp[3]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_VERSION, arrTemp[4]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_OBJECT_TYPE, arrTemp[5]);
                                    c_grdData_M.SetGridText(c_grdData_M.rows - 1, G2_USE_YN, '-1'); 
                                }
                            }
                        }
                        break;

                    case c_ibtnUpdate_M.id:
                        c_dso_Data_M.Call();
                        break;
                    case c_ibtnDelete_M.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData_M.DeleteRow();
                            c_dso_Data_M.Call();
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