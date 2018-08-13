<!-- #include file="../lib/form.inc"  -->
<%@ Page Language="C#"%>
<script runat="server">
    protected void Page_Load(object senader, EventArgs e)
    {
        Session["SESSION_LANG"] = Request.QueryString["lang"].ToString();
    }
</script>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <title></title>
        <script src="jquery-1.4.3.js" type="text/javascript"></script>
        <script src="data.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="fzsys.css"/>
	</head>
	<body style="height:99%;border:0px solid #e5e5e5;width:98%;background: #d5ecab" cellpadding="0" cellspacing="0">
        <div id="menu" style="height:0%;width:100%;border:0px;background-color:#d5ecab;">
            <table cellpadding="0" cellspacing="0" width="240px" height="100%" style="background: #d5ecab">
                <tr>
                    <td id="tdmnleft" valign="top" style="border-right:0px solid #e5e5e5;border-top:0px solid #e5e5e5;display:normal">
                        <div id="accordian" style="white-space:nowrap;overflow:hidden;background-color:#d5ecab;"></div>
					</td>
                </tr>
            </table>
        </div>  
        <script>
            var accordian = "#accordian";
            $(document).ready(function () {
                $("body").height($(document).height());
                $("#menu").height($(document).height() - 2);
                //$("#accordian").height($(document).height() - 3);
                $('#menu').onsend($(accordian), System.S_Lang, '<%=Session["APP_DBUSER"]%>', '<%=Session["User_ID"]%>');
                //$('#accordian').height($('#tdmnleft').height());
            });

            function On_Open(obj) {
                //alert("OK");
                parent.NewWindow(obj.path, obj.innerHTML, obj.innerHTML, obj.innerHTML, obj.mnid, obj.mnps);
            }
        </script>
	</body>
</html>