<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>IQC Request Attach File</title>
<script>
    
 var tpr_reqiqc_pk  = "<%=Request.querystring("qc_ireq_m_pk")%>";
 var documentPK = 0;
 var flag =0;
 
//==============================================================================================
 function BodyInit()
 { 
      txtMasterPK.text  = tpr_reqiqc_pk
      data_fpfo00062.Call('SELECT')
 }
 
//==============================================================================================
 function OnAttach()
 {
 
      var url = System.SystemURL + '/binary/PostFile.aspx?img_pk=0&table_name=TPR_IQC_FILE&master_pk=' + tpr_reqiqc_pk;
	  var rtnPK = System.OpenModal(  url , 415, 310 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
		
		if(rtnPK)
		{
		   if(IsNumeric(rtnPK))
		   {
		        documentPK = rtnPK;
		        data_fpfo00062.Call('SELECT')
		   }
		   else
		   {
		        alert("Unexpected error:"+rtnPK);
		   }
		}
		
  }
  
//==============================================================================================
  function OnDelete()
  {
    if(confirm('Are you sure you want to delete attach file?'))
    {
        grdFiles.DeleteRow();
        flag = 1;
        data_fpfo00062.Call()
    }
  }
  
//==============================================================================================
  function OnDataReceive()
  {
    if(flag ==1)
    {
        flag =0
        data_fpfo00062.Call('SELECT')
    }
  }
  
//==============================================================================================
 function OnDownloadFile()
 {
    documentPK = grdFiles.GetGridData(grdFiles.row,0);
    var url = System.SystemURL + '/binary/ViewFile.aspx?img_pk='+ documentPK +'&table_name=TPR_IQC_FILE';
	window.open(url);
	
 }
 
//==============================================================================================
</script>

</head>
<body>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00062" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0" function="prod.sp_sel_fpfo00062" procedure = "prod.sp_upd_fpfo00062" > 
                <input bind="grdFiles" >
                    <input bind="txtMasterPK" />
                </input>
                <output bind="grdFiles" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 10%">
            <td style="width: 98%">
                Request For Inspection Files List</td>
            <td style="width: 1%">
                <gw:imgbtn img="attach" alt="Attach file" id="btnAttach" onclick="OnAttach()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete file" id="btnDelete" onclick="OnDelete()" />
            </td>
        </tr>
        <tr style="height: 90%">
            <td colspan="3">
                <gw:grid id="grdFiles" header="_PK|File Name|Size(Kb)|Uploaded date" format="0|0|0|0"
                    aligns="0|0|3|1" defaults="|||" editcol="0|0|0|0" widths="0|5000|1200|1500" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnDownloadFile()" param="0,1,2,3" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none;" />
</body>
</html>
