<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<script>
function BodyInit(){
    OnChangeSample();
}
    function OnChangeSample(){
        if(lstSample.GetData() == "crystalreportexample"){
            window.frames["ifrContent"].document.location.href = "crystalreportexample.aspx";
        }
        else if(lstSample.GetData() == "barcode2d"){
            window.frames["ifrContent"].document.location.href = "Barcode2D.aspx";
        }
        else if(lstSample.GetData() == "autocad"){
            window.frames["ifrContent"].document.location.href = "autocad.aspx";
        }
        else if (lstSample.GetData() == "rte") {
            window.frames["ifrContent"].document.location.href = "richtext_editor.aspx";
        }
        else{
            window.frames["ifrContent"].document.location.href = "../google_control/" + lstSample.GetData() + ".htm";
        }
    }
</script>
<body >
    <table width="100%">
        <tr>
            <td><gw:list id="lstSample" onchange="OnChangeSample()" styles="width:30%" >
            <data>DATA|rte|Rich Text Editor(Silverlight 4.0)|map|Map|crystalreportexample|Crystal Report|barcode2d|Barcode 2D|linechart|Line chart|scatterchart|Scatter chart|orgchart|Organization chart|combochart|Combo Chart|piechart|Pie Chart|stackcolumnchart|Stack Column Chart|columnchart|Column Chart|areachart|Area Chart|barchart|Bar Chart|stackbarchart|Stack Bar Chart|intensitymap|Intensity Map|table1|Table 1|table2|Table 2|table3|Table 3|autocad|Autocad(DXF file)</data>
            </gw:list>
            </td>
        </tr>
        <tr>
            <td><iframe id="ifrContent" width="1200" height="500" frameborder="0" ></iframe></td>
        </tr>
    </table>
</body>
</html>
