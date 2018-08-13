<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time
var ajax_test;
var v_fac=0;
var process_flag=1;
var root_temp="";
var flag_daily=1;
var check_init=0;


var v_language = "<%=Session("SESSION_LANG")%>";

var cur_date="";
function BodyInit()
{
    

    if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtCodeAdmin.text= "<%=session("CODEADMIN_YN")%>";
    txtcompany_pk.text= "<%=session("COMPANY_PK")%>";
	
	if (txtCodeAdmin.text=="N")
    {	var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0  AND ACTIVE_YN='Y' and pk='" + session("COMPANY_PK") + "' ")%>";
		lstCompany.SetDataText(ls_data);
		lstCompany.value=txtcompany_pk.text;
	}
  // dtFrom.SetEnable(false);
   //dtTo.SetEnable(false);
    cur_date=dtTo.value;
	idGrid.SetComboFormat(2,"#01;Local Banking|#02;Other Banking|#03;Overseas Banhking");
	idGrid.SetComboFormat(15,"#C;Cancel|#Y;Approve|#N;Waiting");
   datGetAccount.Call();
    
}


//-----------------------------------------------
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}


function OnSearch()
{ datGetResult.Call("SELECT");
}

function onCheck_Data()
{
   
}

function OnDataReceive(obj)
{ 	if(obj.id=='datGetAccount')
	{lstAccount.SetDataText(txtResult.text+"|ALL|Select ALL");
	}
	if(obj.id=='datGetBankCode')
	{}
	if(obj.id=='datGetResult')
	{
			auto_resize_column(idGrid,0,idGrid.cols-1,9); 
			lblRecord.text=idGrid.rows-1 + " (records).";
			if(idGrid.rows-1>0)
			{     
				 if(idGrid.GetGridData(1,0)=="ALL")
				 { lblMess.text="Approving function is INACTIVE. ";
					ibtnSave.SetEnable(false);
					idBtnSet.SetEnable(0);
					
				 }
				 else
				 {
				 lblMess.text="Approving function is ACTIVE. ";
				 ibtnSave.SetEnable(true);
				 idBtnSet.SetEnable(1);
				 }
				 
				 lblRecord.text="Display : "+(idGrid.rows-1) + " (records) in "+ idGrid.GetGridData(1,1) + " (records)"  ;
				 
			}
			else
			{
				lblMess.text="Approving function is INACTIVE. ";
				ibtnSave.SetEnable(false);
				idBtnSet.SetEnable(0);
			}
	}
	if(obj.id == 'datGetfingerdata'){
			if(finger_yn.text == '0' || finger_yn.text == undefined)
				alert('You didn\'t register finger data infomation. Pls register data finger first');
			else{
				if(Capture2()){
					var gCtrl=idGrid.GetGridControl();		
					var key=GetKey()+ lstBy.value +addZero(gCtrl.SelectedRows,4);
					for(i=0;i<gCtrl.SelectedRows;i++)
					{
						var tmp=gCtrl.SelectedRow(i);	
						idGrid.SetGridText(tmp,15,lstAppr.value);
						idGrid.SetGridText(tmp,16,key);									  
					}	
				}
			}
	}
	
}


function OnShowPopup()
{
	var temp=lstBy.value;
           
	if(temp=='ALL')
		   {var fpath = System.RootURL + "/standard/forms/60/10/60100120_01.aspx";
              var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:25;dialogHeight:10;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:no;unadorned:yes;help:no');
            if (obj!=null)
            {
                if(obj=="1")
                temp="HR";
                else
                temp="AC";
                
            }
		}
		if(temp=="HR")
		{
			var strcom;
        var fpath = System.RootURL + "/standard/forms/60/10/60100120_02.aspx";
        var obj1  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
        if (obj1!=null)
			{//alert(obj[0]);
				//txtCost_Center_pk.text=obj[0]
				txtName.text=obj1[28]+"";
				txtAcc.text=obj1[29]+"";
			   
			}
		
		}
		else
		if(temp=="AC")
		{
			var strcom;
        var fpath = System.RootURL + "/standard/forms/60/10/60100120_03.aspx";
        var obj1  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
        if (obj1!=null)
			{//alert(obj[0]);
				//txtCost_Center_pk.text=obj[0]
				txtName.text=obj1[0]+"";
				txtAcc.text=obj1[1]+"";
			   
			}
		
		}
		
}  

//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------
function StringToDate(str)
 {var temp=new Date();
 temp.setYear(str.substr(0,4));
 temp.setMonth(str.substr(4,2)-1);
 temp.setDate(str.substr(6,2));
	 return temp;
 }
 function DateToString(dt)
 {   if(dt==null || dt=="undefined"|| dt=='')
	 return dt;
   // var dt1= new Date(dt);
	 var dd = dt.getDate();
	 var mm = dt.getMonth()+1; //January is 0!
	 var yyyy = dt.getFullYear();

	 if(dd<10) {
	     dd='0'+dd;
	 } 

	 if(mm<10) {
	     mm='0'+mm;
	 } 
	 return yyyy+""+mm+""+dd; 

 }

 
  var opti;
  function ChangeOption(op)
  {
    opti=op;
	  
	  
	//alert(cur_date);
	 if(op==1)
		 { 
			dtFrom.SetEnable(false);
			dtTo.SetEnable(false);
		 var date= StringToDate(cur_date);
		   date.setDate(date.getDate()-7);
		   dtTo.value=cur_date;
		 //  alert(date+" "+DateToString(date));
		   dtFrom.value=DateToString(date);
		   
		   
		 }
	 if(op==2)
	 { 		dtFrom.SetEnable(false);
			dtTo.SetEnable(false);
		 var date= StringToDate(cur_date);
		   date.setMonth(date.getMonth()-1);
		   dtTo.value=cur_date;
		    //alert(date+" "+DateToString(date));
		   dtFrom.value=DateToString(date);
		   
	 }
	 if(op==3)
	 {		dtFrom.SetEnable(true);
			dtTo.SetEnable(true);
		 
	 }
	
  }
function OnSelectAll(obj_checkbox,obj_grd)
{	
    var ctrl=obj_grd.GetGridControl();
    if( obj_checkbox.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
            ctrl.IsSelected(i)="True";
    }
	else
	{
        for(var i=1;i<ctrl.rows;i++)
            ctrl.IsSelected(i)="False";
    }        

}

function OnSetToGrid()
{
	datGetfingerdata.Call();
	
}
function GetKey() {
    var d = new Date();
     
	var yy = addZero(d.getFullYear(),4);
	var mm = addZero(d.getMonth(), 2);
	var dd = addZero(d.getDate(), 2);
	var h = addZero(d.getHours(), 2);
    var m = addZero(d.getMinutes(), 2);
    var s = addZero(d.getSeconds(), 2);
    var ms = addZero(d.getMilliseconds(), 3);
    return  yy+""+mm+""+dd+""+h + "" + m + "" + s + "" + ms+""+"<%=session("USER_PK")%>";
}
function addZero(x,n) {
    while (x.toString().length < n) {
        x = "0" + x;
    }
    return x;
}


function Capture2() {
	
  var err;
	var result = false;
	
	// Check ID is not NULL
	/* if (document.MainForm.UserID.value == "")
	{
		alert("Please enter user id!");
		return(false);
	} */
	 var returnValue1 ;
	try // Exception handling
	{
		var idx = finger_yn.text;
		if(idx == undefined){
			
			return false;
		}
		if(idx < 1 || idx > 10)
		{
			alert('Please register fingerprint data');
			return false;	
		}
		else
			{ 
				var str = "";
				if(idx==1)
					str = "Please Scan RIGHT THUMB finger";
				if(idx==2)
					str = "Please Scan RIGHT INDEX finger";
				if(idx==3)
					str = "Please Scan RIGHT MIDDLE finger";
				if(idx==4)
					str = "Please Scan RIGHT RING finger";
				if(idx==5)
					str = "Please Scan RIGHT LITTLE finger";
				if(idx==6)
					str = "Please Scan LEFT THUMB finger";
				if(idx==7)
					str = "Please Scan LEFT INDEX finger";
				if(idx==8)
					str = "Please Scan LEFT MIDDLE finger";
				if(idx==9)
					str = "Please Scan LEFT RING finger";
				if(idx==10)
					str = "Please Scan LEFT LITTLE finger";
			
				 // var myObject = new Object();
		           // myObject.image1 = idx; 
					var path    = System.RootURL + '/standard/forms/60/10/60100140_01.aspx?idx=' + idx;
					var returnValue1  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		            //returnValue1 =  window.showModalDialog(System.RootURL + "/standard/forms/60/10/60100140_01.aspx",myObject,"dialogwidth:270px;dialogHeight:260px;resizable:1;center:1;scroll:0;")
				//alert(str);
		            if( returnValue1.yesNo ==0){
		            	
		    			return false;
		    		}
				
		            
			}
		
		
		
		
		var objUCBioBSP = new ActiveXObject("UCBioBSPCOM.UCBioBSP.1");
		var objDevice = objUCBioBSP.Device;
		var objExtraction = objUCBioBSP.Extraction;
		var objMatching = objUCBioBSP.Matching;

		// Open device. [255 = AUTO_DETECT]
		// You must open device before capture.
		
		objDevice.Open(255);
		err = objUCBioBSP.ErrorCode;
		if (err != 0)		// Device open failed
		{
			alert("Device open failed!");
		}
		else
		{
			// Capture user's fingerprint.
			objExtraction.Capture();
			err = objUCBioBSP.ErrorCode;
			if (err != 0)		// Capture failed
			{
				alert("Capture failed! [Error : " + err + " (" + objUCBioBSP.ErrorDescription + ")]");
			}
			else	// Capture success
			{				
				 var fFIRTextData =  finger_data.text;
				 var scanfFIRTextData = objExtraction.TextFIR;
				// Get text encoded FIR data from NBioBSP module.
				//alert(scanfFIRTextData);
				objMatching.VerifyMatch(scanfFIRTextData, fFIRTextData);
				
				if (objMatching.MatchingResult == 0 )	// Matching failed. [0:FALSE,Others:TRUE]
				{
					alert("Verification failed!");
				}
				else
					result = true;
			}
		
			// Close device. [AUTO_DETECT]
			objDevice.Close(255);			
		}
		
		objExtraction = 0;
		objDevice = 0;		
		objUCBioBSP = 0;
	}
	catch(e)
	{
		//alert(e.message);
		return(false);
	} 
	return (result);
}

</script>
<style>
.top { border-top:2px solid #034D72; }
.topright { border-top :2px solid #034D72;
			border-right: 2px solid #034D72;;padding-right:10px
			}
.topleft {border-left:2px solid #034D72; 
			border-top :2px solid #034D72;
			}
.left { border-left:2px solid #034D72; }
.right { border-right:2px solid #034D72;padding-right:10px }
.bottomright { border-bottom:2px solid #034D72; 
				border-right:2px solid #034D72; padding-right:10px
				}
.bottomleft { border-bottom:2px solid #034D72; 
				border-left:2px solid #034D72;;
			}
.bottomleftright { border-bottom:2px solid #034D72; 
				border-left:2px solid #034D72;;
				border-right:2px solid #034D72;;
			}			
.bottom { border-bottom:2px solid #034D72; }

#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }



</style>
<body>

<!-------------------data control----------------------->
<gw:data id="datGetAccount" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ac_pro_60100120_get_account"  > 
                <input>
                    <input bind="lstCompany" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!-------------------data control----------------------->
<gw:data id="datGetBankCode" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ac_pro_60100120_get_bankcode"  > 
                <input>
                    <input bind="lstBank" />
                </input> 
                <output>
                    <output bind="lstBankCode" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGetfingerdata" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ac_pro_60100140_fingerdata"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="finger_yn" />
					<output bind="finger_data" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGetResult" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,2,15,16" function="ac_sel_60100140" procedure="ac_upd_60100140"> 
                <input bind="idGrid" >
                    <input bind="lstAccount" />
                    <input bind="lstTrans" />
                    <input bind="lstStatus" />
					<input bind="lstBy" />
					<input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtName" />
					<input bind="txtAcc" />
					<input bind="lstBank" />
					<input bind="lstBankCode" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>



<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center" border="0" >
    <tr style="width:100%;height:1%">
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>	
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	    <td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td><td style="width:1%">&nbsp;</td>
	</tr>
	<tr style="width:100%;height:8%">
	    <td colspan="5" align="right">Company</td>
	    <td colspan="15"><gw:list  id="lstCompany"  maxlen = "100" value="<%=session("COMPANY_PK")%>" styles='width:100%' onchange="datGetAccount.Call()" >
                <data>
                    <%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0  AND ACTIVE_YN='Y'  ")%>
                </data>
            </gw:list>
        </td>
		<td colspan="7" align="right">Debit Account</td>
	    <td colspan="8"><gw:list  id="lstAccount"  maxlen = "100" value='01' styles='width:100%'  />   </td>
	    
        <td colspan="8" align="right">Transfer type</td>
        <td colspan="12"><gw:list  id="lstTrans"  maxlen = "100" value='01' styles='width:100%' onchange="" >
                <data>|01|Local Banking|02|Other Banking|03|Overseas Banhking|ALL|Select ALL</data>
            </gw:list>
        </td>
       <td colspan="5" align="right">Status</td>
	   <td colspan="10"><gw:list  id="lstStatus"  maxlen = "100" value='01' styles='width:100%' onchange="" >
                <data>|01|Waiting|02|Cancel|ALL|Select ALL</data>
            </gw:list>
        </td>
		 <td colspan="5" align="right">By</td>
	   <td colspan="10"><gw:list  id="lstBy"  maxlen = "100" value='AC' styles='width:100%' onchange="" >
                <data>|HR|HR|AC|Accountting|GWI|Interface|ALL|Select ALL</data>
            </gw:list>
        </td>
		
		 
		
		<td colspan="10" align="right"></td>
		<td  align="right"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick ="OnSearch()" />   </td>
		<td colspan="1" align="right"></td>
		<td  align="right"><gw:imgbtn id="ibtnSave" img="Save" alt="Search" onclick ="OnSearch()" />   </td>
		<td colspan="1" align="right"></td>
		<td  align="right"><gw:imgbtn id="ibtnReport" img="Excel" alt="Report" onclick ="OnReport()" />   </td>
	</tr>
	<tr style="width:100%;height:4%">
	    <td colspan="5" align="left">Select</td>
	    <td colspan="1" align="right"><input type="radio" name="optSelect" value="1" onclick="ChangeOption(1)" ></td>
	    <td colspan="4" align="left">Week</td>
		<td colspan="1" align="right"><input type="radio" name="optSelect" value="2" onclick="ChangeOption(2)"></td>
	    <td colspan="4" align="left">Month</td>
		<td colspan="1" align="right"><input type="radio" name="optSelect" value="3" checked onclick="ChangeOption(3)"></td>
	    <td colspan="4" align="left">Manual</td>
	    
		<td colspan="7"align="right" >Period</td>
        <td colspan="3" align=center><gw:datebox id="dtFrom" onchange=""  maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=date /></td>
		<td colspan="2" align="center" >~</td>
	    <td colspan="3" align=center><gw:datebox id="dtTo" onchange=""  maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=date /></td>
	    
		<td colspan="8" align="right"><a title="Click here to show Beneficiary information" onclick="OnShowPopup()" href="#tips" >Beneficiary Name</a></td>
	    <td colspan="12" align="right"><gw:textbox id="txtName"  text=""  styles="width:100%"  onenterkey="OnSearch()"/></td>
	    <td colspan="8" align="right"><a title="Click here to show Beneficiary information" onclick="OnShowPopup()" href="#tips" >Beneficiary Account</a></td>
	    <td colspan="7" align="right"><gw:textbox id="txtAcc"  text=""  styles="width:100%"  onenterkey="OnSearch()" /></td>
		
		<td colspan="18"><gw:list  id="lstBank"  maxlen = "100" value='ALL' styles='width:100%' onchange="datGetBankCode.Call()" >
                <data>
                    <%=CtlLib.SetListDataSQL("select  SUBSTR(SUBSTR(a.BANK_CODE,-6),1,3),max(a.SHORT_NAME) from TSI_BANK_CODE_LIST a where a.del_if=0 group by  SUBSTR(SUBSTR(a.BANK_CODE ,-6),1,3) order by 2")%>|ALL|Bank name- ALL
                </data>
            </gw:list>
        </td>
	   
		<td colspan="17"><gw:list  id="lstBankCode"  maxlen = "100" value='ALL' styles='width:100%' onchange="" >
                <data>
                    <%=CtlLib.SetListDataSQL("select  a.BANK_CODE,a.SHORT_NAME from TSI_BANK_CODE_LIST a where a.del_if=0  order by 2")%>|ALL|Branch- ALL
                </data>
            </gw:list>
        </td>
		
	</tr>
	<tr style="width:100%;height:4%">
	<td colspan="20" align="right"><gw:label id="lblRecord"  text="0 (records)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /></td>
	<td colspan="40" align="right"><gw:label id="lblMess"  text="" maxlen = "100" styles="color:blue;width:90%;font-weight: bold;font-size:13" /></td>
	<td colspan="10" align="right">Select ALL</td>
	<td colspan="5" align="right"><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll(chkSelectAll,idGrid)" ></gw:checkbox ></td>
	<td colspan="10" align="right">Set Approve</td>
	<td colspan="10"><gw:list  id="lstAppr"  maxlen = "100" value='01' styles='width:100%' onchange="" >
                <data>|N|Waiting|C|Cancel|Y|Approve</data>
            </gw:list>
        </td>
		<td colspan="5" align="right"><gw:icon id="idBtnSet"  styles='width:90%' img="in"  text="Set"  onclick="OnSetToGrid()"/></td>
		
	</tr>
	<tr style="width:100%;height:89%">
	    <td colspan="100">
	        <gw:grid
					id="idGrid"
					header="_pk|_pages|Transfer type|Debit Account|Beneficiary Acount|Beneficiary Name|Bank Name|Bank code|Currency|AMT|Receiver Adrress|Phone|Aplicate Date|Transfer resource|Remark|Approve Status|_key "
					format="0|0|0|0|0|0|0|0|-1|0|0|0|0|0|0|2|0"
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					defaults="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths="0|0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|100"
					styles="width:100%;height:100%"
					sorting="T"
					acceptNullDate="T"
					oncelldblclick = ""
			/>
	    </td>
	</tr>
</table>

</body>

<OBJECT classid="CLSID:20E4176F-7756-4630-86AA-AB0ECD841BC3" width=0 height=0 VIEWASTEXT></OBJECT>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtCodeAdmin" styles="display:none"/>
<gw:textbox id="txtAction_Flag" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtBank_pk" styles="display:none"/>
<gw:textbox id="txtcompany_pk" styles="display:none"/>
<gw:textbox id="txtRef_pk" styles="display:none"/>

<gw:textbox id="finger_yn" styles="display:"/>
<gw:textbox id="finger_data" styles="display:"/>




</html>