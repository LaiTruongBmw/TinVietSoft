<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReadExcel.aspx.cs" Inherits="Ctl.ReadExcel" %>
<html>
<title>Select file to upload</title>
<script>
    var file_path, img_pk;
    var first_load = true;
    
    function OnHidenFrameLoad()
    {
        var oFrm = window.document.all("ifrPhoto");        
        var rtnValue = oFrm.contentWindow.getReturnPK();
		
        if(rtnValue != "")
        {
            window.returnValue = rtnValue;
            window.close();
        }
        else
        {
            initPhotoUpload();
        }
    }
    
</script>

<script type="text/javascript">
    /* <![CDATA[ */
        var PROGRESS_INTERVAL = 500;
        var PROGRESS_COLOR = '#000080';

        var _divFrame;
        var _divUploadMessage;
        var _divUploadStatus;
        var _divUploadProgress;
        var _ifrPhoto;

        var _loopCounter = 1;
        var _maxLoop = 10;
        var _photoUploadProgressTimer;

        function initPhotoUpload()
        {
		
            _divFrame = document.getElementById('divFrame');
            _divUploadMessage = document.getElementById('divUploadMessage');
            _divUploadStatus = document.getElementById('divUploadStatus');
            _divUploadProgress = document.getElementById('divUploadProgress');
            _ifrPhoto = document.getElementById('ifrPhoto');
            
            _ifrPhoto.contentWindow.document.getElementById('hiddenTableName').value = "<%=Request["table_name"] %>";
            _ifrPhoto.contentWindow.document.getElementById('hiddenMaster_pk').value = "<%=Request["master_pk"] %>";
            _ifrPhoto.contentWindow.document.getElementById('hiddenProcedure').value = "<%=Request["procedure"] %>";				
			
			_ifrPhoto.contentWindow.document.getElementById('hiddenStart').value = "<%=Request["p_start"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenCols').value = "<%=Request["p_cols"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenType1').value = "<%=Request["p_1"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenType2').value = "<%=Request["p_2"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenType3').value = "<%=Request["p_3"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenType4').value = "<%=Request["p_4"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenType5').value = "<%=Request["p_5"] %>";
			
			_ifrPhoto.contentWindow.document.getElementById('hiddenImportSeq').value = "<%=Request["import_seq"] %>";
            _ifrPhoto.contentWindow.document.getElementById('hiddenProcedureFile').value = "<%=Request["procedure_file"] %>";
			_ifrPhoto.contentWindow.document.getElementById('hiddenErrorCont').value = "<%=Request["p_err_cont"] %>";
			
            _ifrPhoto.contentWindow.document.getElementById('hiddenImgPK').value = "<%=Request["img_pk"] %>";

            //alert(_ifrPhoto.contentWindow.document.getElementById('hiddenTableName'))
            var btnUpload = _ifrPhoto.contentWindow.document.getElementById('btnUpload');

            btnUpload.onclick = function(event)
            {
                var filPhoto = _ifrPhoto.contentWindow.document.getElementById('FileInput');

                //Baisic validation for Photo
                _divUploadMessage.style.display = 'none';

                if (filPhoto.value.length == 0)
                {
                    _divUploadMessage.innerHTML = '<span style=\"color:#ff0000\">Please specify the file.</span>';
                    _divUploadMessage.style.display = '';
                    filPhoto.focus();
                    return;
                }

                var regExp = /^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$/;
               /*
                if (!regExp.test(filPhoto.value)) //Somehow the expression does not work in Opera
                {
                    _divUploadMessage.innerHTML = '<span style=\"color:#ff0000\">Invalid file type. Only supports jpg, gif, png and bmp.</span>';
                    _divUploadMessage.style.display = '';
                    filPhoto.focus();
                    return;
                }
              */
                beginPhotoUploadProgress();
                _ifrPhoto.contentWindow.document.getElementById('photoUpload').submit();
                _divFrame.style.display = 'none';
            }
        }

        function beginPhotoUploadProgress()
        {
            _divUploadProgress.style.display = '';
            clearPhotoUploadProgress();
            _photoUploadProgressTimer = setTimeout(updatePhotoUploadProgress, PROGRESS_INTERVAL);
        }

        function clearPhotoUploadProgress()
        {
            for (var i = 1; i <= _maxLoop; i++)
            {
                document.getElementById('tdProgress' + i).style.backgroundColor = 'transparent';
            }

            document.getElementById('tdProgress1').style.backgroundColor = PROGRESS_COLOR;
            _loopCounter = 1;
        }

        function updatePhotoUploadProgress()
        {
            _loopCounter += 1;

            if (_loopCounter <= _maxLoop)
            {
                document.getElementById('tdProgress' + _loopCounter).style.backgroundColor = PROGRESS_COLOR;
            }
            else 
            {
                clearPhotoUploadProgress();
            }

            if (_photoUploadProgressTimer)
            {
                clearTimeout(_photoUploadProgressTimer);
            }

            _photoUploadProgressTimer = setTimeout(updatePhotoUploadProgress, PROGRESS_INTERVAL);
        }

        function photoUploadComplete(message, isError)
        {
            clearPhotoUploadProgress();

            if (_photoUploadProgressTimer)
            {
                clearTimeout(_photoUploadProgressTimer);
            }

            _divUploadProgress.style.display = 'none';
            _divUploadMessage.style.display = 'none';
            _divFrame.style.display = '';

            if (message.length)
            {
                var color = (isError) ? '#ff0000' : '#008000';

                _divUploadMessage.innerHTML = '<span style=\"color:' + color + '\;font-weight:bold">' + message + '</span>';
                _divUploadMessage.style.display = '';

                if (isError)
                {
                    _ifrPhoto.contentWindow.document.getElementById('FileInput').focus();
                }
            }
        }
    /* ]]> */
</script>
<body bgcolor="#66ff66">
    <div style="width: 400px">
        <div id="divFrame">
            <iframe id="ifrPhoto" name="ifrPhoto" onload="OnHidenFrameLoad()" scrolling="no"
                frameborder="0" style="text-align: center; vertical-align: middle;
                border-style: none; margin: 0px; width: 100%; height: 855px" src="ReadExcelSubmit.aspx">
            </iframe>
        </div>
        <div id="divUploadMessage" style="padding-top: 4px; display: none">
        </div>
		<div id="divUploadStatus" style="padding-top: 4px; display: none">
            <span style="font-size: smaller"><b>Waiting...</b></span>
        </div>
        <div id="divUploadProgress" style="padding-top: 4px; display: none">
            <span style="font-size: smaller"><b>Uploading file...</b></span>
            <div>
                <table border="0" cellpadding="0" cellspacing="2" style="width: 100%">
                    <tbody>
                        <tr>
                            <td id="tdProgress1">&nbsp; &nbsp;</td>
                            <td id="tdProgress2">&nbsp; &nbsp;</td>
                            <td id="tdProgress3">&nbsp; &nbsp;</td>
                            <td id="tdProgress4">&nbsp; &nbsp;</td>
                            <td id="tdProgress5">&nbsp; &nbsp;</td>
                            <td id="tdProgress6">&nbsp; &nbsp;</td>
                            <td id="tdProgress7">&nbsp; &nbsp;</td>
                            <td id="tdProgress8">&nbsp; &nbsp;</td>
                            <td id="tdProgress9">&nbsp; &nbsp;</td>
                            <td id="tdProgress10">&nbsp; &nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
	&nbsp;<img  width="200" height="180" id="imgPreview" border="1" src="../images/photo_X.gif" style="display:none"/>
</body>
</html>


