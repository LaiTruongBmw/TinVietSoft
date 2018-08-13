<%@ Page language="c#" Inherits="Ctl.FileChooser" CodeFile="FileChooser.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Test File Upload</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script>
		  // Process when clicking ŽQÆ button:
function chooseFile()
{
	// Get the iframe object:
	var iFrameObj = document.getElementById('FileIframe');
	// Get file chooser object (id = 'fileChooser') in the iframe
	iFrameObj.contentWindow.SelectFile();
	// Pop up file open dialog to choose a file:
	//fileChooser.click();
}
function uploadFile()
{
	// Get the iframe object:
	var iFrameObj = document.getElementById('FileIframe');
	// Get form that contains file input:
	var form = iFrameObj.contentWindow.document.getElementById('Form1');
	// Submit form to upload file:
	form.submit();
	return false; // Wait to upload file
}
// buttonWidth: button width of Browse button
function moveChooseFileButton(buttonWidth)
{
	// Get created Browse button:
	var chooseFileButton = document.getElementById('ChooseFileButton');
	chooseFileButton.style.width = buttonWidth;
	// Get the iframe object:
	var iFrameObj = document.getElementById('FileIframe');
	// Get x position of iframe object:
	var x = getX(iFrameObj);
	// Get y position of iframe object:
	var y = getY(iFrameObj);
	var w = iFrameObj.offsetWidth, h = iFrameObj.offsetHeight;
	// Get width and height when last time moved of iframe object:
	var oldX, oldY, oldW, oldH;
	try
	{
		oldX = iFrameObj.oldX;
		oldY = iFrameObj.oldY;
		oldW = iFrameObj.oldW;
		oldH = iFrameObj.oldH;
	}
	catch(e)
	{
		oldX = 0;
		oldY = 0;
		oldW = 0;
		oldH = 0;
	}
	// Moved only when position or size has changed:
	if(x != oldX || y != oldY || w != oldW || h != oldH)
	{
		// Move created Browse button:
		chooseFileButton.style.left = x + w - buttonWidth + 2;
		chooseFileButton.style.top = y + ((h-22)>>1);
	}
	iFrameObj.oldX = x;
	iFrameObj.oldY = y;
	iFrameObj.oldW = w;
	iFrameObj.oldH = h;
}

// Utility method to get x position of an object:
function getX(o)
{
	var x = 0;
	while(o)
	{
		x+= o.offsetLeft;
		o = o.offsetParent;
	}
	return x;
}
// Utility method to get y position of an object:
function getY(o)
{
	var y = 0;
	while(o)
	{
		y+= o.offsetTop;
		o = o.offsetParent;
	}
	return y;
}
// Calculate and return most appropriate width of the Browse button
var browseButtonWidth = 83;
function getButtonWidth()
{
	try
	{
		// Get the iframe object:
		var	iFrameObj = document.getElementById('FileIframe');
		// Get file chooser object (id = 'fileChooser' in the iframe
		var fileChooser = iFrameObj.contentWindow.document.getElementById('fileChooser');
		fileChooser.style.width = 0;
		var offsetWidth = 0; // NOP to delay time
		offsetWidth = fileChooser.offsetWidth; // NOP to delay time
		// Number 2 below is an estination based on experience:
		var buttonWidth = fileChooser.offsetWidth - 2;
		fileChooser.style.width = '100%';
		return buttonWidth;
	}
	catch(e){}
}
function updateButtonWidth()
{
	browseButtonWidth = getButtonWidth();
	moveChooseFileButton(browseButtonWidth);
}
		</script>
	</HEAD>
	<body >
		<form name="ABC">
			<P>
				<iframe id="FileIframe" TabIndex="-1" frameBorder="0" width="100%" height="200" src=PostFile.aspx></iframe>
			</P>
		</form>
	</body>
</HTML>
