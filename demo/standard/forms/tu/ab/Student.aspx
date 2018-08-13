<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
    function BodyInit() {
        System.Translate(document);
    }
    function OnAddnew() {
        grdStudentInfo.AddRow()
    }
    function OnSearch() {
        data_Student.Call("SELECT");
    }
    function OnDelete() {
        if (confirm('Are you sure you want to delete ?')) {
            grdStudentInfo.DeleteRow();
            data_Student.Call();
        }
    }
    function OnSave() {
        if (CheckData()) {
            data_Student.Call();
        }
    }
    function CheckData() {
        for (var i = 1; i < grdStudentInfo.rows; i++) {
            if (grdStudentInfo.GetGridData(i, 2) == "") {
                alert("Please input code at row " + i);

                return false;
            }
            if (grdStudentInfo.GetGridData(i, 4) == "") {
                alert("Please input name at row " + i);
                return false;
            }
        }
        return true;
    }
    function OnDataReceiveColor() {
		var grd=grdStudentInfo.GetGridControl();
		grd.Select(3,3,4,3);
		grd.CellBorder( 0x008000, 2, 3, 2, 2, 1, 1);
    }
</script>
<body>
<!----------------------------------------------------------------------------------------------->
<gw:data id="data_Student"  onreceive="OnDataReceiveColor()" > 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6" function="GENUWIN.sel_tutorialabstudent" procedure="GENUWIN.sel_tutorialabstudent"> 
            <input bind="grdStudentInfo">                    
                <input bind="txtID_Name" /> 
            </input> 
            <output bind="grdStudentInfo" />
        </dso> 
    </xml> 
</gw:data>
<!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td width="13%">
                                                        Student ID/Name :</td>
                                                    <td width="22%">
                                                        <gw:textbox id="txtID_Name" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    <td width="1%"></td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch2" img="new" width="100%" img="in" text="Process" onclick="OnAddnew()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch4" img="delete" width="100%" img="in" text="Process" onclick="OnDelete()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch3" img="save" width="100%" img="in" text="Process" onclick="OnSave()" />
                                                    </td>
                                                    <td width="35%"></td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            
                            <gw:grid id="grdStudentInfo" header="_PK|STUDENTID|FULLNAME|ADDRESS|SEX|BIRTHDAY|PHONE|DEPARTMENT"
                                format="0|0|0|0|3|0|0|0" 
                                aligns="0|0|0|0|0|0|0|0" 
                                defaults="|||||||" 
                                editcol="1|1|1|1|1|1|1"
                                widths="1000|1000|1000|1000|1000|1000|1000" 
                                styles="width:100%; height:100%"
                                sorting="T"  autosize="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display:none"/>
</body>
</html>
