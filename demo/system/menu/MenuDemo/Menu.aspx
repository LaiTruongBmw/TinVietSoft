<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menu</title>
<link rel="stylesheet" href="style.css" type="text/css" />
<script language="javascript" src="jquery-1.4.3.js"></script>
<script language="javascript" src="data.js"></script>
<script>
    var size = "400px";
	var lang = '<%= Request.QueryString["lang"] %>';
    function SetSizeMenu(size) {
        self.frameElement.style.height = size;
    }

    function On_Active(obj) {
        for (var idx = 0; idx < document.getElementsByName("folder").length; idx++) {
            document.getElementsByName("folder")[idx].className = document.getElementsByName("folder")[idx].className.replace(/(?:^|\s)active(?!\S)/, '');
        }
        obj.className += " active";

        for (var idx = 0; idx < document.getElementById("sub_content").childNodes.length; idx++) {
            document.getElementById("sub_content").childNodes[idx].style.display = "none";
        }
        var str_group = "";
        str_group = obj.id.toString();
        str_group = str_group.replace("fd", "");
        var obj_sub = document.getElementById("sub" + str_group);
        obj_sub.style.display = "";
    }

    function On_Open(obj) {
		this.SetSizeMenu('48px');
        parent.NewWindow(obj.vl1, obj.vl2, obj.vl2, obj.vl2, obj.vl3);
    }
</script>
</head>
<body onmouseout="SetSizeMenu('48px')" onload="TestAjax()" id="frmMenu" class="bodyscroll">
<div id="header">
    <div id="logo" onclick="parent.DisMenu();">&nbsp;</div>
    <div id="main_navi" />
</div>
<div id="content" onmouseover="SetSizeMenu(size)">
    <table cellpadding="0" cellspacing="0" style="width:100%;display:none">
        <tr>
            <td style="height:1px;background-color:White">
                <img src="dot_transparent.gif" style="height:1px"/>
            </td>
        </tr>
    </table>
    <div id="sub_content" />
</div>
<script language="javascript">
    var frmId = '#frmMenu';
	
    function TestAjax(){
        parent.HideAppMenu();
		return false;
        $(frmId).onsend(document.getElementById('main_navi'), document.getElementById('sub_content'), lang);
    }
</script>
</body>
</html>