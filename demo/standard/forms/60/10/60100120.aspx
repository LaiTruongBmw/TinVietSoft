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
	{lstAccount.SetDataText(txtResult.text+'|ALL|Select All');
	}
	if(obj.id=='datGetBankCode')
	{}
	if(obj.id=='datGetResult')
	{
		auto_resize_column(idGrid,0,idGrid.cols-1,9); 
			lblRecord.text=idGrid.rows-1 + " record(s).";		
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

//popup
function popupFund(obj){

	switch(obj)
	{
		case 'fund':
			var fpath   = System.RootURL + "/standard/forms/if/sh/ifsh0010.aspx";
			var object  = System.OpenModal(fpath , 450 , 400 , 'resizable:yes;status:yes'); 
		break ;
		case 'domestic':
			var fpath   = System.RootURL + "/standard/forms/if/sh/ifsh0020.aspx";
			var object  = System.OpenModal(fpath , 600 , 600 , 'resizable:yes;status:yes'); 
		break ;
		
		case 'Overseas':
			var fpath   = System.RootURL + "/standard/forms/if/sh/ifsh0030.aspx";
			var object  = System.OpenModal(fpath , 700 , 850 , 'resizable:yes;status:yes'); 
		break ;
		
	}

			
			
			

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


<gw:data id="datGetResult" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ac_sel_60100120" procedure=""> 
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
        <td colspan="12"><gw:list  id="lstTrans"  maxlen = "100" value='ALL' styles='width:100%' onchange="" >
                <data>|01|Local Banking|02|Other Banking|03|Overseas Banhking|ALL|Select ALL</data>
            </gw:list>
        </td>
       <td colspan="5" align="right">Status</td>
	   <td colspan="10"><gw:list  id="lstStatus"  maxlen = "100" value='ALL' styles='width:100%' onchange="" >
                <data>|01|Waiting|02|Cancel|03|Approved - Sending|04|Success|05|Error|ALL|Status-ALL</data>
            </gw:list>
        </td>
		 <td colspan="5" align="right">By</td>
	   <td colspan="10"><gw:list  id="lstBy"  maxlen = "100" value='ALL' styles='width:100%' onchange="" >
                <data>|HR|HR|AC|Accountting|ALL|BY-ALL</data>
            </gw:list>
        </td>
		<td colspan="10" align="right"><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /></td>
		<td  align="right"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick ="OnSearch()" />   </td>
		<td align=""   ><gw:icon id="ibtnFun" img="in" text="Fun" onclick="popupFund('fund')" /></td>
		<td align=""  ><gw:icon id="ibtnDomestic" img="in" text="Domestic" onclick="popupFund('domestic')" /></td>
		<td align=""  ><gw:icon id="ibtnOverseas" img="in" text="Overseas" onclick="popupFund('Overseas')" /></td>

		<td colspan="3" align="right"></td>
		<td  align="right"><gw:imgbtn id="ibtnReport" img="Excel" alt="Report" onclick ="OnReport()" />   </td>
	</tr>
	<tr style="width:100%;height:8%">
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
	

	<tr style="width:100%;height:89%">
	    <td colspan="105">
	        <gw:grid
					id="idGrid"
					header="Debit Account|Status|Beneficiary Acount|Beneficiary Name|Bank Name|Bank code|Currency|AMT|Fee Account|Fee AMT|Deduction Fee|Remain Fee|Receiver Adrress|Phone|Aplicate Date|Send Date|Receive Date|Transfer resource|Remark|Error "
					format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					defaults="||||||||||||||||||"
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths="1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000"
					styles="width:100%;height:100%"
					sorting="T"
					acceptNullDate="T"
					oncelldblclick = ""
			/>
	    </td>
	</tr>
</table>

</body>


<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtCodeAdmin" styles="display:none"/>
<gw:textbox id="txtAction_Flag" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtBank_pk" styles="display:none"/>
<gw:textbox id="txtcompany_pk" styles="display:none"/>
<gw:textbox id="txtRef_pk" styles="display:none"/>




</html>