<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Measurement Entry</title>
</head>
<script type="text/javascript">
   

  var G3_MEA_ITEM_PK = 0,  	  
  	  G3_ITEM_PK     = 1,  	 
  	  G3_ITEM_CODE   = 2,
  	  G3_ITEM_NAME   = 3,
	  G3_TRANS_UOM   = 4,
	  G3_TRANS_RATE  = 5,
	  G3_REMARK		 = 6;
	  
	  
 var arr_FormatNumber = new Array();
 
//============================================================================ 
function BodyInit()
{ 
    System.Translate(document); 
    BindingDataList();
	
   OnSearch();
}
//============================================================================ 
 function BindingDataList()
	{ 
	}
//============================================================================ 
function OnSave()
{  
   data_agci00230.Call(); 
}
//============================================================================ 
function OnSearch()
{
    
     data_agci00230.Call('SELECT');   
}

function OnDataReceive()
{
    txtCount.text=grdItem.rows-1 + " item";
}

   function OnPopUp()
   {
		var approve_yn="";
		
		if(grdItem.row <1)
		{
			alert("Please,select item to show file or insert file.");
			return;
		}
		/*if(radTab.value=='4')
		{
			approve_yn='Y';
		}
		if(radTab.value=='2')
		{
			approve_yn='Y';
		}
		else
		{
			approve_yn='N';
		}*/		
		txtMasterPK.text=grdItem.GetGridData( grdItem.row, 0);
		var fpath = System.RootURL + '/form/ds/bs/dsbs00218.aspx?master_pk=' + txtMasterPK.text+'&p_approve_yn='+radTab.value;

		var aValue  = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');                  
        data_agci00230.Call("SELECT");
	} 
	function OnPopUp_grd()
   {	
		txtMasterPK.text=grdItem.GetGridData( grdItem.row, 0);
		 var fpath = System.RootURL + '/form/ds/bs/dsbs00218.aspx?master_pk=' + txtMasterPK.text+'&p_approve_yn='+radTab.value;
		 var aValue  = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');                  
        data_agci00230.Call("SELECT");
	}
	


</script>

<html>
<body>
    <!--------------------------------------------------------------->
     <gw:data id="data_agci00230" onreceive="OnDataReceive(this)">
	    <xml>
	        <dso id="1" type="grid" parameter="0,7,8"  function="st_lg_sel_AGCI00230" procedure="st_lg_upd_AGCI00230" >
	            <input bind="grdItem" >
	                <input bind="txtItem" />
					<input bind="txtBuyer" />
					<input bind="txtPattern" />
					<input bind="radTab" />	
	            </input>
	            <output bind="grdItem" />
	        </dso>
	    </xml>
	</gw:data>	
   <!----------------------------------------------------------------> 

    <table width="100%" style="background-color: #BDE9FF; height: 100%" cellspacing="2">
        <tr style="background-color: White; height: 100%">
            
            <td width="100%">
                <table width="100%" style="height: 100%">                   
                    <tr style="height: 1%">
						<td width="2%" align="left" style="white-space: nowrap" >
                            Buyer
                        </td>
                       <td width="5%" align="left">
                            <gw:textbox id="txtBuyer" styles="width:100%;" onenterkey="OnSearch()"></gw:textbox>
                        </td>
						<td width="2%" align="left" style="white-space: nowrap" >
                            Pattern
                        </td>
                       <td width="5%" align="left">
                            <gw:textbox id="txtPattern" styles="width:100%;" onenterkey="OnSearch()"></gw:textbox>
                        </td>
						<td width="2%" align="left" style="white-space: nowrap" >
                            Item
                        </td>
                        
						<td width="7%" align="left">
                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch()"></gw:textbox>
                        </td>
						<td width="33%">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnSearch()"> 
								<span value="1" id="Deli-Info">All</span> 
								<span value="2" id="Sale-Term">Attach file</span> 
								<span value="3" id="Sale-Term"> Not Attach file</span>
								<!--span value="4" id="Sale-Term"> Approved Attach file</span-->	
								<!--span value="5" id="Sale-Term"> Un-Approve Attach file</span-->	
							</gw:radio>
                        </td>
						<td width="2%" align="right">
                            Total:
                        </td>
						<td style="width:6%" align="center">
							 <gw:label id="txtCount" />
						 </td>							
						 <td width="1%" align="right">
                             <gw:imgbtn img="search" alt="Search" onclick="OnSearch()" />
                        </td>
						<td style="width: 1%" align="right">
							<gw:imgbtn id="btnFileAttachList" img="attach" alt="List File Attach" onclick="OnPopUp()" />     						 
						</td>
						<td style="width: 1%" align="right">
							 <gw:imgbtn img="save" alt="Save" onclick="OnSave()" />    						 
						</td>	
						
                    </tr>
                    <tr style="height: 99%">
                        <td width="50%" colspan="12">
                            <gw:grid id='grdItem' 
								header='_PK|Buyer|Pattern Code|Pattern Name|Item Code|_Item Name|Item Name Yujin|Attach YN|Approve YN'
                                format='0|0|0|0|0|0|0|3|3' 
								aligns='0|0|0|0|0|0|0|0|0' 
								defaults='||||||||' 
								editcol='0|0|0|0|0|0|0|1|1'
                                widths='0|800|1200|1200|1500|2000|2000|1000|1000' 
								sorting='T' 
								styles='width:100%; height:100%'
								oncelldblclick="OnPopUp_grd()"
								  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtUOM" styles="display: none" />
<gw:textbox id="txtMasterPK" styles="display: none" />
</html>
