<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>Get Detail</title>
</head>

<script type="text/javascript" language="javascript">
//-------------------------------------------------
    function BodyInit()
    {
        TABLE_PK.text = '<%= Request.QueryString("pk") %>';
        dso_htfo00041.Call("SELECT");
    }
    function OnDataReceive(obj)
    {
        var fg=idGrid.GetGridControl();
        for (var rw = idGrid.rows-5; rw < idGrid.rows; rw++){
            fg.Cell(2, rw, 0, rw, 5) = 7;
            fg.Cell(13, rw, 0, rw, 6) = true;
            fg.MergeCells   = 2;
	        fg.MergeRow(rw)  = true;
        }
    }
</script>
<body>
    <!----------------------------------------------------->
    <gw:data id="dso_htfo00041" onreceive="OnDataReceive(this)">
	    <xml> 
		    <dso type="grid" parameter="" function="sp_sel_htfo00041">
			    <input bind="idGrid">
				    <input bind="TABLE_PK" />
			    </input> 
			    <output bind="idGrid" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr>
            <td style="height:5%" align="center">
                Slip No: <%= Request.QueryString("sn") %> - Room: <%=Request.QueryString("room")%> - Date: <%=Request.QueryString("date")%> 
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="7">
                <gw:grid id="idGrid" 
                    header  ="_PK|No.|Item Name|Unit|Price|Quantity|Amount"
                    format  ="0|0|0|0|1|0|1" 
                    aligns  ="0|1|0|1|3|1|3" 
                    defaults="||||||" 
                    editcol ="0|0|0|0|0|0|0"
                    widths  ="0|500|4000|900|1500|1000|1000"  
                    styles  ="width:100%; height:100%" 
                    sorting ="T" 
                    param   ="0,1,2,3,4" />
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="TABLE_PK" styles="width: 100%; display:none" />
</html>
