<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Patterm Entry</title>
</head>

<script language="javascript1.1">
      <!-- hide
      function toggleLayer() {
        if (document.TEST.isLayerIndexVisible(0)) {
	  document.TEST.hideLayerIndex(0);
        }
	else {
	  document.TEST.showLayerIndex(0);
        }
        if (document.TEST.isLayerIndexVisible(1)) {
	  document.TEST.hideLayerIndex(1);
        }
	else {
	  document.TEST.showLayerIndex(1);
        }
      }
      function readLayer() {
        var len = document.TEST.getNumberOfLayers();
        var text = "";
        for (i = 0;   i < len;   i++) {
          text += "Layer "+i+": "+document.TEST.getLayerName(i);
	  if (document.TEST.isLayerIndexVisible(i)) {
	    text += " (visible)";
          }
          else {
            text += " (hidden)";
          }
          text += "\n"
        }
        alert(text);
      }
      function showAppletInfo() {
        var text = document.TEST.getAppletInfo()+"\n";
        alert(text);
      }
      function loadShuttle() {
        document.TEST.loadFile("SHUTTLE.dxf");
      }
      function loadChair() {
        document.TEST.loadFile("Stuhl.DXF");
      }
      function loadArch() {
        document.TEST.loadFile("manky_dxf_1.dxf");
      }
      function loadBoat() {
        document.TEST.loadFile("APEX20.DXF");
      }
      function resetView() {
        document.TEST.resetView();
      }
      
      // end of hidden script -->
</script>

<body>
    <!--------------------------------Search Pattern Master---------------------------------->
    <table name="View Design" style="width: 100%; height: 100%">
        <tr style="height: 98%">
            <td>
                <applet codebase="." archive="dxfapplet.jar" code="de.escape.quincunx.dxf.DxfViewer"
                    width="1000" height="600" name="TEST">
                    <param name="file" value="Stuhl.dxf">
                    <param name="framed" value="false">
                    <param name="frameWidth" value="1000">
                    <param name="frameHeight" value="600">
                </applet>
            </td>
        </tr>
        <tr style="height: 2%">
            <td>
                <form>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td>
                                <input type="button" name="TL" value="Toggle first 2 Layers" onclick="toggleLayer()">
                            </td>
                            <td>
                                <input type="button" name="SM" value="Show layer names" onclick="readLayer()">
                            </td>
                            <td>
                                <input type="button" name="IN" value="Show Applet Info" onclick="showAppletInfo()">
                            </td>
                            <td>
                                <input type="button" name="ST" value="Reset view" onclick="resetView()">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" name="LS" value="Load shuttle" onclick="loadShuttle()">
                            </td>
                            <td>
                                <input type="button" name="LC" value="Load chair" onclick="loadChair()">
                            </td>
                            <td>
                                <input type="button" name="LB" value="Load boat" onclick="loadBoat()">
                            </td>
                            <td>
                                <input type="button" name="LA" value="Load plan" onclick="loadArch()">
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
