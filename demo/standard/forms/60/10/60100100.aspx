<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<OBJECT classid="CLSID:20E4176F-7756-4630-86AA-AB0ECD841BC3" width=0 height=0 VIEWASTEXT></OBJECT>
<script language="JavaScript" src="../../../../system/lib/md5.js"></script>
<script >
var G_PK=0,
	G_Employee_pk=1,
	G_Employee_ID=2,
	G_Employee_Name=3,
	G_tco_bsuser_pk=4,
	G_User_ID=5,
	G_Tel_No=6,
	G_Mobile=7,
	G_SER_LEVEL = 8,
	G_HOLIDAY_FROM  = 9,
	G_HOLIDAY_TO  = 10 ,
	G_Password= 11,
	G_Password_md5= 12,
	G_Fingerprint_Y_N= 13,
	G_Remark =14,
	
	G_LEFT_THUMB_Y_N=15,
	G_LEFT_THUMB=16,
	G_LEFT_THUMB_STRING=17,
	
	G_LEFT_INDEX_Y_N=18,
	G_LEFT_INDEX=19,
	G_LEFT_INDEX_STRING=20,
	
	G_LEFT_MIDDLE_Y_N= 21,
	G_LEFT_MIDDLE= 22,
	G_LEFT_MIDDLE_STRING= 23,
	
	G_LEFT_RING_Y_N= 24,
	G_LEFT_RING= 25,
	G_LEFT_RING_STRING= 26,
	
	G_LEFT_LITTLE_Y_N= 27,
	G_LEFT_LITTLE= 28,
	G_LEFT_LITTLE_STRING= 29,
	//==============
	
	
	G_RIGHT_THUMB_Y_N= 30,
	G_RIGHT_THUMB= 31,
	G_RIGHT_THUMB_STRING= 32,
	
	G_RIGHT_INDEX_Y_N= 33,
	G_RIGHT_INDEX= 34,
	G_RIGHT_INDEX_STRING=35,
	
	G_RIGHT_MIDDLE_Y_N=36,
	G_RIGHT_MIDDLE=37,
	G_RIGHT_MIDDLE_STRING=38,
	
	G_RIGHT_RING_Y_N=39,
	G_RIGHT_RING=40,
	G_RIGHT_RING_STRING=41,
	
	G_RIGHT_LITTLE_Y_N=42,
	G_RIGHT_LITTLE=43,
	G_RIGHT_LITTLE_STRING=44,
	G_photto_pk   =45;
	
function BodyInit()
{
    System.Translate(document); 
	<%=CtlLib.SetGridColumnComboFormat("grdBankingauthority",8,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='60100100'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	imgFile.SetEnable(false);
	OnSearch();
	
}
function OnNew()
{
		//alert();
	/*if (dtFrom2.GetData() == ""){
		alert("Please select arrival date firstly.");
		return;
	}*/
	var path = System.RootURL + "/standard/forms/60/10/60100100_popup.aspx";
	var object = System.OpenModal( path ,700 , 600 ,  'resizable:yes;status:yes;scroll:no;');
	if ( object != null )
	{
		 for( var i=0; i < object.length; i++)	  
			{	
				arrTemp = object[i];
				grdBankingauthority.AddRow(); 
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_Employee_pk, arrTemp[0]);
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_Employee_ID, arrTemp[1]);
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_Employee_Name, arrTemp[2]);
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_tco_bsuser_pk, arrTemp[3]);
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_User_ID, arrTemp[4]);
				grdBankingauthority.SetGridText(grdBankingauthority.rows-1, G_Tel_No, arrTemp[5]);
			}
	}    	    
}
function OnSearch()
{
    data_CommCode.Call("SELECT");
}
function OnDelete()
{
    if(confirm('Are you sure you want to delete ?'))
	{
        grdBankingauthority.DeleteRow();
        data_CommCode.Call();
    }
}
function OnSave()
{
    if(CheckData())
    {
        data_CommCode.Call();
     }
}
function CheckData()
{
    for(var i=1;i<grdBankingauthority.rows;i++)
          {
            if(grdBankingauthority.GetGridData(i,1) == "")
             {
                alert("Please input employee at row " +i);
                
                return false;
             } 
          }
          return true;
}
function OnSetPassMD5()
{
   var v_password="";
   v_password=grdBankingauthority.GetGridData(grdBankingauthority.row, G_Password)
   if(v_password!="")
   {
		//alert(v_password);
		grdBankingauthority.SetGridText(grdBankingauthority.row, G_Password_md5, b64_md5(v_password));
   }
}
//==========================================
function OnSet(){
	if(grdBankingauthority.selrow>-1){
		grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_Password,txtpass.text);
		grdBankingauthority.SetGridText(grdBankingauthority.row, G_Password_md5, b64_md5(txtpass.text));
		txtpass.text="";
	}
	else{
		alert('Please select row to set password.');
	}
}
//==================================================
function OnSetFinger(index_finger,string_finger)
{
	if(grdBankingauthority.selrow>-1)
	{
		//grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_Password,txtpass.text);
		//grdBankingauthority.SetGridText(grdBankingauthority.row, G_Password_md5, b64_md5(txtpass.text));
		//txtpass.text="";
		
		
			if(index_finger=="6")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_THUMB_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_THUMB,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_THUMB_STRING,string_finger);
			}
			if(index_finger=="7")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_INDEX_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_INDEX,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_INDEX_STRING,string_finger);
			}
			if(index_finger=="8")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_MIDDLE_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_MIDDLE,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_MIDDLE_STRING,string_finger);
			}
			if(index_finger=="9")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_RING_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_RING,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_RING_STRING,string_finger);
			}
			if(index_finger=="10")
			{				
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_LITTLE_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_LITTLE,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_LEFT_LITTLE_STRING,string_finger);
			}
			//==============================
			if(index_finger=="1")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_THUMB_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_THUMB,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_THUMB_STRING,string_finger);
			}
			if(index_finger=="2")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_INDEX_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_INDEX,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_INDEX_STRING,string_finger);
			}
			if(index_finger=="3")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_MIDDLE_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_MIDDLE,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_MIDDLE_STRING,string_finger);
			}
			if(index_finger=="4")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_RING_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_RING,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_RING_STRING,string_finger);
			}
			if(index_finger=="5")
			{
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_LITTLE_Y_N,"Y");
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_LITTLE,index_finger);
				grdBankingauthority.SetGridText(grdBankingauthority.selrow, G_RIGHT_LITTLE_STRING,string_finger);
			}
	} 
	else
	{
		alert('Please select row to set finger.');
	}
}
//===========================================
function Enroll()
{	
	var user_id_login = "<%=Session("USER_ID")%>";
	//alert(user_id);
	var user_id="";
	if(grdBankingauthority.selrow>-1)
	{
		user_id=grdBankingauthority.GetGridData(grdBankingauthority.row, G_User_ID)
	}
	var err, payload;
	var result = false;

	// Check ID is not NULL
	if ( user_id == "" )
	{
		alert("Please enter user id!");
		return(false);
	}

	try // Exception handling
	{
		DEVICE_AUTO_DETECT	= 255;
		
		var objUCBioBSP = new ActiveXObject("UCBioBSPCOM.UCBioBSP.1");
		var objDevice = objUCBioBSP.Device;
		var objExtraction = objUCBioBSP.Extraction;		
		var objFPData = objUCBioBSP.FPData;

		// Open device.
		// You must open device before enroll.
		objDevice.Open(DEVICE_AUTO_DETECT);

		err = objUCBioBSP.ErrorCode;	// Get error code	
		if (err != 0)		// Device open failed
		{
			alert("Device open failed!");
		}
		else
		{
			// Enroll user's fingerprint.
			objExtraction.Enroll(payload);
			err = objUCBioBSP.ErrorCode;	// Get error code
		
			if (err != 0)		// Enroll failed
			{
				alert("Registration failed! [Error : " + err + " (" + objUCBioSBP.ErrorDescription + ")]");
			}
			else	// Enroll success
			{
				// Get text encoded FIR data from NBioBSP module.
				//document.MainForm.FIRTextData.value = objExtraction.TextFIR;
				//var string_finger=
				//alert("Registration success!");
				//result = true;
////////////////////////////////////////////////////////////////////////////////
// kks test
				err = objFPData.Export(objExtraction.TextFIR, 400);

				//value = objFPData.TotalFingerCount;
				//alert("### FpCount = " + value);
				value = objFPData.FingerID(0);
				//txtCode_Name.text=objExtraction.TextFIR;
				OnSetFinger(value,objExtraction.TextFIR);
////////////////////////////////////////////////////////////////////////////

			}
			
			// Close device. [AUTO_DETECT]
			objDevice.Close(DEVICE_AUTO_DETECT);
		}

		objExtraction = 0;
		objDevice = 0;
		objUCBioBSP = 0;		
	}
	catch(e)
	{
		alert(e.message);
		return(false);
	}
	
	/*if ( result )
	{
		// Submit main form
		document.MainForm.submit();
	}
	return result;*/
}
//=========show==pass===control====again================
function OnShowPass()
{
	var v_password="";
	if(grdBankingauthority.selrow>-1)
	{
		v_password=grdBankingauthority.GetGridData(grdBankingauthority.row, G_Password)
	}
	txtpass.text=v_password;
	//activeFingerIndex(2);
	//alert(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_INDEX_Y_N) +"---"+grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_INDEX) );
	for(var i =1 ; i <=10 ;i++){
		resetFingerIndex(i);
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_THUMB_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_THUMB));
	}
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_INDEX_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_INDEX));
	}
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_MIDDLE_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_MIDDLE));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_RING_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_RING));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_LITTLE_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_LEFT_LITTLE));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_THUMB_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_THUMB));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_INDEX_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_INDEX));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_MIDDLE_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_MIDDLE));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_RING_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_RING));
	}
	
	if(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_LITTLE_Y_N) =='Y'){
		activeFingerIndex(grdBankingauthority.GetGridData(grdBankingauthority.row, G_RIGHT_LITTLE));
	}
	
	if( grdBankingauthority.GetGridData(grdBankingauthority.row, G_photto_pk) !=""){
	
		imgFile.SetDataText(Number(grdBankingauthority.GetGridData(grdBankingauthority.row, G_photto_pk)));
	}
	
	
	
}
function resetFingerIndex(idx){
	var currDiv = document.getElementById('finger'+idx );
	currDiv.className = "finger"+idx+"_normal";
}
function activeFingerIndex(idx){
	var currDiv = document.getElementById('finger'+idx );
	currDiv.className = "finger"+idx+"_active";
}
</script>
<body>
<!----------------------------------------------------------------------------------------------->
<gw:data id="data_CommCode"  onreceive="" > 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45" function="ac_sel_60100100" procedure="ac_upd_60100100"> 
            <input bind="grdBankingauthority">                    
                <input bind="txtCode_Name" /> 
            </input> 
            <output bind="grdBankingauthority" />
        </dso> 
    </xml> 
</gw:data>
<!----------------------------------------------------------------------------------------------->
	
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%" colspan="2">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td width="10%" align="right">
                                                        User ID/Employee :
													</td>
                                                    <td width="15%">
                                                        <gw:textbox id="txtCode_Name" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>                                                    
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />
                                                    </td>
													<td width="6%" align="right">
                                                        Password
													</td>
													<td width="9%">
														<gw:textbox id="txtpass" passwd="T" csstype="mandatory" styles="width:100%" onenterkey="OnSet()" />
													</td>
													<td width="1%">
														<gw:imgbtn id="btnSetPass" img="process" width="100%"  text="process" onclick="OnSet()" />
													</td>
                                                    <td width="3%">													
                                                        <gw:imgbtn id="btnSearch2" img="new" width="100%" img="New" text="New" onclick="OnNew()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch4" img="delete" width="100%" img="in" text="Process" onclick="OnDelete()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch3" img="save" width="100%" img="in" text="Process" onclick="OnSave()" />
                                                    </td>
													
													<td width="6%"><gw:icon id="btnEnroll"   text="Enroll" onclick="Enroll()" /></td>
                                                    <td width="32%"></td>
                                                </tr>
												
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
								
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
			
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="60%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            
                            <gw:grid id="grdBankingauthority" 
								header="_PK|_Employee_pk|Employee ID|Employee Name|_tco_bsuser_pk|User ID|_Tel No|_Mobile|Ser Level| Holiday From|Holiday To|_Password|_Password|_Fingerprint(Y/N)|Remark|_LEFT THUMB(Y/N)|_G_LEFT_THUMB|_G_LEFT_THUMB_STRING|_LEFT INDEX(Y/N)|_G_LEFT_INDEX|_G_LEFT_INDEX_STRING|_LEFT MIDDLE(Y/N)|_G_LEFT_MIDDLE|_G_LEFT_MIDDLE_STRING|_LEFT RING(Y/N)|_G_LEFT_RING|_G_LEFT_RING_STRING|_LEFT LITTLE(Y/N)|_G_LEFT_LITTLE|_G_LEFT_LITTLE_STRING|_RIGHT THUMB(Y/N)|_G_RIGHT_THUMB|_G_RIGHT_THUMB_STRING|_RIGHT INDEX(Y/N)|_G_RIGHT_INDEX|_G_RIGHT_INDEX_STRING|_RIGHT MIDDLE(Y/N)|_G_RIGHT_MIDDLE|_G_RIGHT_MIDDLE_STRING|_RIGHT RING(Y/N)|_G_RIGHT_RING|_G_RIGHT_RING_STRING|_RIGHT LITTLE(Y/N)|_G_RIGHT_LITTLE|_G_RIGHT_LITTLE_STRING|_photo_pk|_html"
                                format="0|0|0|0|0|0|0|0|0|4|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                defaults="||||||||||||||||||||||||||||||||||||||||||||||" 
                                editcol="0|0|0|0|0|0|1|1|1|1|1|1|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="1200|1200|1200|1600|1200|1400|1200|1200|1200|1200|1200|1200|1200|1200|1200|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1000|1000|1000|1000|0" 
                                styles="width:100%; height:100%"
                                sorting="T"  autosize="F" onafteredit="OnSetPassMD5()" oncellclick="OnShowPass()" />
                        </td>																															
                    </tr>
                </table>
            </td>
			<td width="40%" style="vertical-align:top;">
				<table>
					<tr>
						<td>
							<div>
								<div id="fingerpic">
									<div id="finger10" class="finger10_normal"></div>
									<div id="finger9" class="finger9_normal"></div>
									<div id="finger8" class="finger8_normal"></div>
									<div id="finger7" class="finger7_normal"></div>
									<div id="finger6" class="finger6_normal"></div>
									
									<div id="finger1" class="finger1_normal"></div>
									<div id="finger2" class="finger2_normal"></div>
									<div id="finger3" class="finger3_normal"></div>
									<div id="finger4" class="finger4_normal"></div>
									<div id="finger5" class="finger5_normal"></div>
									
								</div>
							</div>
						</td>
					</tr>
					<tr>
						   <td nowrap  align = "center" >
								<gw:image id="imgFile"   view="/binary/ViewFile.aspx" styles="width:190;height:190"   />
						   </td>
					</tr>
				</table>
			</td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display:none"/>
	
	<style type="text/css">
	#fingerpic{
		width:609px;
		height:406px;
		background: url("assets/finger_picture_10_03.gif") no-repeat;
	}
	/*----------------LEFT--------------------*/
	#finger10{
		/*LEFT LITTLE*/
		width:42px;
		height:36px;
		position: relative;           
		left:10px;
		top:50px;
	}
	.finger10_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger10_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger9{
		/*LEFT RING*/
		width:42px;
		height:36px;
		position: relative;           
		left:85px;
		top:-30px;
	}
	.finger9_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger9_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger8{
		/*LEFT MIDDLE*/
		width:42px;
		height:36px;
		position: relative;           
		left:178px;
		top:-65px;
	}
	.finger8_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger8_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger7{
		/*LEFT INDEX*/
		width:42px;
		height:36px;
		position: relative;           
		left:255px;
		top:-45px;
	}
	.finger7_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger7_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	
	#finger6{
		/*LEFT  THUMB*/
		width:42px;
		height:36px;
		position: relative;           
		left:255px;
		top:50px;
	}
	.finger6_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger6_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	
	
	/*----------------RIGHT--------------------*/
	
	#finger5{
		/*RIGHT LITTLE*/
		width:42px;
		height:36px;
		position: relative;     
		float:right; 		
		left:170px;
		top:-125px;
	}
	.finger5_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger5_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger4{
		/*RIGHT RING*/
		width:42px;
		height:36px;
		position: relative;  
		float:right;       		
		left:50px;
		top:-170px;
	}
	.finger4_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger4_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger3{
		/*RIGHT MIDDLE*/
		width:42px;
		height:36px;
		position: relative;   
		float:right;        
		left:-80px;
		top:-170px;
	}
	.finger3_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger3_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	#finger2{
		/*RIGHT INDEX*/
		width:42px;
		height:36px;
		position: relative;           
		float:right;
		left:-200px;
		top:-115px;
	}
	.finger2_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger2_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	
	#finger1{
		/*RIGHT  THUMB*/
		width:42px;
		height:36px;
		position: relative;           
		left:-245px;
		z-index:3;
		float:right;
		top:20px;
	}
	.finger1_normal{
		background: url("assets/finger_picture_05.gif") no-repeat;
	}
	.finger1_active{
		background: url("assets/finger_picture_03.gif") no-repeat;
	}
	
	
	</style>
</body>
</html>
