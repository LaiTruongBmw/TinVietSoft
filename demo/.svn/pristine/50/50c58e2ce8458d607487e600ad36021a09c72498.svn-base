<!-- #include file="../../../system/lib/form.inc"  -->
<html >
<head id="Head1" runat="server">
    <title>SilverlightApplication13</title>
    <style type="text/css">
    html, body {
	    height: 100%;
	    overflow: auto;
    }
    body {
	    padding: 0;
	    margin: 0;
    }
    #silverlightControlHost {
	    height: 100%;
	    text-align:center;
    }
    </style>
    <script type="text/javascript" src="../../../system/lib/Silverlight.js"></script>
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
        function LoadDocument() {
            dsoSelectRTE.Call("SELECT_BINARY");
        }
        function SaveDocument() {
            var Plugin = document.getElementById("slControl");
            var root = Plugin.content.myObject;

            txtData.text = root.GetData();

            dsoSaveRTE.Call("BINARY");
        }
        function OnDataReceive(obj) {
            if (obj.id == "dsoSaveRTE") {
                alert(txtPK.text);
            }
            else {
                SetDataToRTE(txtData.text)
            }
        }
        function SetDataToRTE(content) {
            var Plugin = document.getElementById("slControl");
            var root = Plugin.content.myObject;

            root.SetData(content);
        }
    </script>
</head>
<body>
<gw:data id="dsoSaveRTE" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="process" parameter="0,1,2,3" procedure="CRM.SP_INSERT_IMAGE">
			<input>
				<input bind="txtTableName" />
				<input bind="txtTablePK" />
				<input bind="txtPK" />
                <input bind="txtContentType" />
				<input bind="txtData" />
			</input> 
			<output>
				<output bind="txtPK" />
			</output>
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dsoSelectRTE" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="process" parameter="0,1" procedure="CRM.xxx">
			<input>
				<input bind="txtTableName" />
				<input bind="txtTablePK" />
			</input> 
			<output>
				<output bind="txtData" />
			</output>
		</dso> 
	</xml> 
</gw:data>
    <input type="button" value="Load Document" onclick="LoadDocument();" />
    <input type="button" value="Save Document" onclick="SaveDocument();" />
    <div id="silverlightControlHost">
        <object id="slControl" data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="100%" height="100%">
		  <param name="source" value="../../../system/controls/rte.xap"/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="3.0.40818.0" />
		  <param name="autoUpgrade" value="true" />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50401.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="visibility:hidden;height:0px;width:0px;border:0px"></iframe></div>
        
        <gw:textbox id="txtTableName" text="crm.tcm_test_rtf" styles="width: 100%; display:none" />
        <gw:textbox id="txtTablePK" text="41" styles="width: 100%; display:none" />
        <gw:textbox id="txtPK" text="41" styles="width: 100%; display:none" />
        <gw:textbox id="txtContentType" text="10" styles="width: 100%; display:none" />
        <gw:textbox id="txtData" styles="width: 100%; display:none" />
</body>
</html>
