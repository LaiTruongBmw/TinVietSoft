<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>System Config</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" 
                        function="ST_SY_SEL_GSVS00100" 
                        procedure="ST_SY_UPD_GSVS00100"> 

                    <input bind="grdData">                    
                        <input bind="txtSearch" /> 
                        <input bind="chkParent" /> 
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
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">Code/Name :</td>
                                <td colspan="48" width="48%">
                                    <gw:textbox  id="txtSearch" styles='width:100%;height:20px' onenterkey="OnClick(this)" /></td>
                                </td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">Parent Code :</td>
                                <td colspan="1" width="1%">
                                    <gw:checkbox id="chkParent" defaultvalue="Y|N" value="N" onchange="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate" img="save"  text="Update"  onclick="OnClick(this)"/>
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
                                <td colspan="43" width="43%">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:100%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData" 
                                 header ="_PK|Order|Code|P.Code|Name|L.Name|F.Name|Num 1|Num 2|Num 3|Num 4|Num 5|Num 6|Num 7|Num 8|Num 9|Value 1|Value 2|Value 3|Value 4|Value 5|Value 6|Value 7|Value 8|Value 9|Desc.|Use YN|."
                                 format ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0" 
                                 aligns ="0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|0" 
                                 editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"
                                 autosize = 'T'
                                 styles="width:100%; height:100%"
                                 sorting="T"  autosize="T" />
                    </div>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            /*******************************************************************************************************************
            * Description: Cau hinh common code cua system
            *******************************************************************************************************************/
            var check_init = 0;
            var G0_PK = 0,
                G0_ORDER = 1,
                G0_CODE = 2,
                G0_PCODE = 3,
                G0_NAME = 4,
                G0_LNAME = 5,
                G0_FNAME = 6,
                G0_NUM_1 = 7,
                G0_NUM_2 = 8,
                G0_NUM_3 = 9,
                G0_NUM_4 = 10,
                G0_NUM_5 = 11,
                G0_NUM_6 = 12,
                G0_NUM_7 = 13,
                G0_NUM_8 = 14,
                G0_NUM_9 = 15,
                G0_VALUE_1 = 16,
                G0_VALUE_2 = 17,
                G0_VALUE_3 = 18,
                G0_VALUE_4 = 19,
                G0_VALUE_5 = 20,
                G0_VALUE_6 = 21,
                G0_VALUE_7 = 22,
                G0_VALUE_8 = 23,
                G0_VALUE_9 = 24,
                G0_DESC = 25,
                G0_USE_YN = 26
                ;

            var c_lblRecordDT,
                c_chkParent,
                c_txtSearch,
                c_grdData,

                c_ibtnUpdate,
                c_ibtnNew,
                c_ibtnSearch,
                c_ibtnDelete,

                c_dso_Data
                ;

            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
                check_init = 1;
            }

            function InitData() {
                
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT;
                c_chkParent = chkParent;
                c_txtSearch = txtSearch;
                c_grdData = grdData;

                c_ibtnUpdate = ibtnUpdate;
                c_ibtnNew = ibtnNew;
                c_ibtnSearch = ibtnSearch;
                c_ibtnDelete = ibtnDelete;

                c_dso_Data = dso_Data;
                
                c_grdData.GetGridControl().FrozenCols = G0_LNAME;
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
                    case c_ibtnNew.id:
                        c_grdData.AddRow();
                        c_grdData.SetGridText(c_grdData.rows - 1, G0_ORDER, c_grdData.rows - 1);
                        c_grdData.SetGridText(c_grdData.rows - 1, G0_USE_YN, '-1');
                        break;

                    case c_ibtnUpdate.id:
                        var vl = false;
                        for (var i = 1; i < c_grdData.rows; i++) {
                            if (c_grdData.GetGridData(i, G0_CODE) == "") { alert("Please input Code at row " + i.toString() + "!"); vl = true; i = c_grdData.rows; }
                            if (c_grdData.GetGridData(i, G0_NAME) == "") { alert("Please input Name at row " + i.toString() + "!"); vl = true; i = c_grdData.rows; }
                        }
                        if (vl) return false;
                        c_dso_Data.Call();
                        break;

                    case c_chkParent.id:
                    case c_txtSearch.id:
                    case c_ibtnSearch.id:
                        c_dso_Data.Call("SELECT");
                        break;

                    case c_ibtnDelete.id:
                        if (confirm("Are you sure to delete?")) {
                            c_grdData.DeleteRow();
                            c_dso_Data.Call();
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