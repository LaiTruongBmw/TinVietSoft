<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Dictionnary</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,3,4,5,6,7,8,9" 
                        function="ST_SY_SEL_GSVS00300_0" 
                        procedure="ST_SY_UPD_GSVS00300_0"> 

                    <input bind="grdData">           
                        <input bind="txtSearch" /> 
                        <input bind="txtField" /> 
                    </input> 
                    <output bind="grdData" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_Map" onreceive="OnDataReceive(this)"> 
            <xml>                                                               
                <dso type="grid" function="ST_SY_SEL_GSVS00300_1"> 
                    <input bind="grdData_Map" > 
                        <input bind="txtResult" /> 
                    </input> 
                    <output bind="grdData_Map" /> 
                </dso> 
            </xml> 
        </gw:data> 
        <!----------------------------------------------------------------------------------------------->
        <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0" >
            <tr style="width:100%;height:1%">
                <td>
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:100%;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">OBJECT ID :</td>
                                <td colspan="48" width="48%">
                                    <gw:textbox  id="txtSearch" styles='width:100%;height:20px' onenterkey="OnClick(this)" /></td>
                                </td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">FIELD NAME :</td>
                                <td colspan="44" width="44%">
                                    <gw:textbox  id="txtField" styles='width:100%;height:20px' onenterkey="OnClick(this)" /></td>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate" img="save"  text="Save"  onclick="OnClick(this)"/>
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
            <tr style="height:69%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData" 
                                 header ="PK|OBJECT_ID|FIELD NAME|ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH|REMARK|."
                                 format ="0|0|0|0|0|0|0|0|0|0|0" 
                                 aligns ="0|0|0|0|0|0|0|0|0|0|0"
                                 editcol="0|0|0|1|1|1|1|1|1|1|0"
                                 autosize = 'T'
                                 styles="width:100%; height:100%"
                                 oncellclick="OnClick(this);"
                                 onenterkey = "OnClick(this);"
                                 sorting="T" autosize="T" />
                    </div>
                </td>
            </tr>
            <tr style="height:30%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData_Map" 
                                 header ="ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH|."
                                 format ="0|0|0|0|0|0|0" 
                                 aligns ="0|0|0|0|0|0|0"
                                 editcol="0|0|0|0|0|0|0"
                                 autosize = 'T'
                                 styles="width:100%; height:100%"
                                 oncelldblclick="OnClick(this);"
                                 sorting="T" autosize="T" />
                    </div>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtResult" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0,
                p0 = '<%= Request.QueryString("p0") %>',
                p1 = '<%= Request.QueryString("p1") %>';

            var G0_PK = 0,
                G0_OBJECT_ID = 1,
                G0_FIELD_NAME = 2,
                G0_ENGLISH = 3,
                G0_VIETNAMESE = 4,
                G0_KOREAN = 5,
                G0_CHINESE = 6,
                G0_JAPANESE = 7,
                G0_FRENCH = 8,
                G0_REMARK = 9,

                G1_ENGLISH = 0,
                G1_VIETNAMESE = 1,
                G1_KOREAN = 2,
                G1_CHINESE = 3,
                G1_JAPANESE = 4,
                G1_FRENCH = 5
                ;

            var c_lblRecordDT,
                c_txtSearch,
                c_txtResult,
                c_txtField,
                c_grdData,
                c_grdData_Map,

                c_ibtnUpdate,
                c_ibtnNew,
                c_ibtnSearch,
                c_ibtnDelete,

                c_dso_Data,
                c_dso_Data_Map
                ;

            var flag = true;

            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
                
            }

            function InitData() {
                if (p0 != 'F') {
                    c_txtSearch.text = p1;
                    c_dso_Data.Call("SELECT");
                } else {
                    check_init = 1;
                    flag = false;
                }
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT;
                c_txtSearch = txtSearch;
                c_txtResult = txtResult;
                c_txtField = txtField;
                c_grdData = grdData;
                c_grdData_Map = grdData_Map;

                c_ibtnUpdate = ibtnUpdate;
                c_ibtnNew = ibtnNew;
                c_ibtnSearch = ibtnSearch;
                c_ibtnDelete = ibtnDelete;

                c_dso_Data = dso_Data;
                c_dso_Data_Map = dso_Data_Map;

                c_ibtnNew.SetEnable(System.S_Lang == "ENG");
                c_ibtnUpdate.SetEnable(System.S_Lang == "ENG");
                c_ibtnDelete.SetEnable(System.S_Lang == "ENG");
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    default: return false;
                    case c_dso_Data.id:
                        c_lblRecordDT.text = c_grdData.rows - 1;
                        if (p0 != 'F') {
                            check_init = 1;
                            if (flag) {
                                OnAdd();
                                flag = false;
                            }
                        }
                        break;
                }
            }

            function OnClick(obj) {
                switch (obj.id) {
                    default: return false;
                    case c_ibtnNew.id:
                        if (!OnValid("INIT")) return false;

                        c_grdData.AddRow();
                        break;
                    case c_ibtnUpdate.id:
                        if (!OnValid("INIT")) return false;
                        var vl = false;
                        /*s
                        for (var i = 1; i < c_grdData.rows; i++) {
                            if (c_grdData.GetGridData(i, G0_PK) == "") { alert("Please input Code at row " + i.toString() + "!"); vl = true; i = c_grdData.rows; }
                        } /**/
                        if (vl) return false;
                        c_dso_Data.Call();
                        break;

                    case c_txtField.id:
                    case c_txtSearch.id:
                    case c_ibtnSearch.id:
                        if (!OnValid("INIT")) return false;
                        c_dso_Data.Call("SELECT");
                        break;

                    case c_ibtnDelete.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData.DeleteRow();
                            c_dso_Data.Call();
                        }
                        break;
                    case c_grdData.id:
                        c_txtResult.text = c_grdData.GetGridData(c_grdData.row, G0_FIELD_NAME);
                        c_dso_Data_Map.Call("SELECT");
                        break;
                    case c_grdData_Map.id:
                        c_grdData.SetGridText(c_grdData.row, G0_ENGLISH, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_ENGLISH));
                        c_grdData.SetGridText(c_grdData.row, G0_VIETNAMESE, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_VIETNAMESE));
                        c_grdData.SetGridText(c_grdData.row, G0_KOREAN, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_KOREAN));
                        c_grdData.SetGridText(c_grdData.row, G0_CHINESE, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_CHINESE));
                        c_grdData.SetGridText(c_grdData.row, G0_JAPANESE, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_JAPANESE));
                        c_grdData.SetGridText(c_grdData.row, G0_FRENCH, c_grdData_Map.GetGridData(c_grdData_Map.row, G1_FRENCH));
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

            function OnAdd() {
                var data = new Array;
                data = System.S_ArrDictAuto;
                var arr_grd = new Array;
                var str_return = "";
                for (var i = 1; i <= c_grdData.rows - 1; i++) {
                    arr_grd[i - 1] = c_grdData.GetGridData(i, G0_FIELD_NAME);
                }
                
                if (c_txtSearch.text != "") {
                    //if (dict != "") {
                    if (data.length > 0) {
                        var b_exist = false;
                        //data = dict.split('!');
                        for (var x = 0; x < data.length; x++) {
                            if (data[x].length > 1) {
                                b_exist = false;
                                for (var i = 0; i < arr_grd.length; i++) {
                                    if (data[x] == arr_grd[i]) {
                                        b_exist = true;
                                    }
                                }
                                if (b_exist == false) {
                                    str_return += data[x] + "!";
                                }
                            }
                        }

                        str_return = str_return.substr(0, str_return.length - 1);
                    }

                    if (System.S_Lang == "ENG") {
                        if (str_return != "") {
                            data = str_return.split('!');
                            for (var idx = 0; idx < data.length; idx++) {
                                if (data[idx] != "") {
                                    c_grdData.AddRow();
                                    c_grdData.SetGridText(c_grdData.rows - 1, G0_OBJECT_ID, c_txtSearch.text);
                                    c_grdData.SetGridText(c_grdData.rows - 1, G0_FIELD_NAME, data[idx])//feild
                                    c_grdData.SetGridText(c_grdData.rows - 1, G0_ENGLISH, data[idx])//eng
                                }
                            }
                        }
                    }
                }

                //OnSave();
            }
        </script>
    </body>
</html>