<!-- #include file="../../../../system/lib/form.inc"  -->

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="ftb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>SEND MAIL</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var  user_pk   =  "<%=Session("EMPLOYEE_PK")%>"  ;
var Arr
var idx;
var startTime,interval_time;
var	ajax_test
function BodyInit()
{

    System.Translate(document);  // Translate to language session
    iduser_pk.text = "<%=session("EMPLOYEE_PK")%>";
    ibtnSend.SetEnable(0);
    var t =document.getElementById('<%=ftbContent.ClientID %>');
    t.style.Disable=true;
    FTB_API['ftbContent'].SetHtml(""); 
    FTB_API['ftbContent'].InsertHtml("");   
    FTB_API['ftbContent'].Visible=false;
    // FTB_API['ftbContent'].Blur(); 
    // FTB_API['ftbContent'].enable=false;
    //FTB_API['ftbContent'].SetReadOnly(false);
			//mo tu dong mo chuong trinh goi mail
				ajax_test = null;
					ajax_test = GetXmlHttpRequest(return_result);
					//alert(System.RootURL+ "/form/ch/cs/test.aspx")
					ajax_test.open("GET", System.RootURL+ "/reports/ch/cs/test.aspx" , true);
					ajax_test.send(null);   
   OnChangeTitile();
     
}
function return_result()
{
	var t=GetRequestState(ajax_test);
	
	if(GetRequestState(ajax_test))
		{
			
			
		}			
}
function OnClear()
{
 txtSubject.text='';
 txtContent.text='';
 
}
function OnShowPopup(num)
{ var strcom;
       if(num=='2') 
        {var fpath = System.RootURL + "/form/ch/ae/chae0030_Emp_Kind.aspx";
         var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX  +';dialogTop:'+window.event.screenY  +';edge:sunken;scroll:yes;unadorned:yes;help:no');
	        if (obj!=null)
	        { lstEmpType.value=obj;
	        }
	     }
	     if(num=='1') 
        {var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx";
         var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX  +';dialogTop:'+window.event.screenY  +';edge:sunken;scroll:yes;unadorned:yes;help:no');
	        if (obj!=null)
	        { lstOrg.value=obj;
	        }
	     }   
}
function OnSend()
{ if(lstTitle.value!='1' && lstTitle.value!='3'&& lstTitle.value!='4')
        {//alert(txtContent.GetData() + " --  " + txtSubject.text)
        var obj = document.getElementById('<%=ftbContent.ClientID %>').value.innerText;
        var obj1 = document.getElementById('<%=ftbContent.ClientID %>');
        obj1.Focus=false;
        txtContent.text = document.getElementById('<%=ftbContent.ClientID %>').value;
        //alert(txtContent.text);
       // FTB_API['ftbContent'].SetHtml(""); 
        //FTB_API['ftbContent'].InsertHtml(""); 
        //return;
        if(txtContent.text==''|| txtSubject.text=='')
            {alert("Please input Subject and Content");
            return;
            }
        }
  
  
  for (var i=1;i<grdEmployee.rows;i++)
           grdEmployee.SetGridText(i,7,'');
           
  alert("Please waiting mail sending.");
  clear_Interval(idInterval);
  idx=0;
  txtEmpPk.text=Arr[idx][0];
  txtMailOption.text=Arr[idx][1];
  set_Interval(100);
  if(lstTitle.value=='1'||lstTitle.value=='2'||lstTitle.value=='4')
  datSendMail.Call();
  if(lstTitle.value=='3')
  datSendMail_happy_birthday.Call();      
}
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
//------------------------------------------------------------------------------------

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}

function OnDataReceive1(obj)
{ lblRecord.text=(grdSendMail.rows-1) +'record(s)';
 
}
function OnDataReceive(obj)
{      if(lstTitle.value=='2' && txtResult.text!='Error')//send other
            { 
            clear_Interval(idInterval);
                   idInterval.text="Sending finished.";    
                   for (var i=1;i<grdEmployee.rows;i++)
                    {if(grdEmployee.GetGridData(i,2)=='-1'||grdEmployee.GetGridData(i,1)=='-1')
                        {grdEmployee.SetGridText(i,7,txtResult.text);}
                    }   
                   return;  
            }
        if(lstTitle.value=='2' && txtResult.text=='Error')//send other
            {if(confirm("Have error when sending mail. \n Click 'OK' if you want to try again or 'Cancel' ignore")==true)
                       {
                        datSendMail.Call();
                        }
                        clear_Interval(idInterval);
                        return;
            }
        
    
         if(grdEmployee.GetGridData(Arr[idx][2],0)==Arr[idx][0])// khong co ai order by lai
                grdEmployee.SetGridText(Arr[idx][2],7,txtResult.text);
         else
             {for (var i=1;i<grdEmployee.rows;i++)
                {if(grdEmployee.GetGridData(i,0)==Arr[idx][0])
                    {grdEmployee.SetGridText(i,7,txtResult.text); break;}
                }
             }
         if(lstTitle.value=='2' && txtResult.text=='Error' && idx <= Arr.length-1)
             {if(confirm("Have error when sending mail to " + Arr[idx][3]+"\n Click 'OK' if you want to try again or 'Cancel' ignore and continute ")==true)
                       {
                        datSendMail.Call();
                        return;
                       }
             }         
         if(idx < Arr.length-1   )
            {//alert(Arr.length);
             idx=idx+1;
             txtEmpPk.text=Arr[idx][0];
             txtMailOption.text=Arr[idx][1];
             datSendMail.Call();
            }
         if(idx==Arr.length-1)
          {
           clear_Interval(idInterval);
           idInterval.text="Sending finished.";       
           return;  
          }
       
  
   
}

function OnChangeTitile()
{  
    OnClickRow();
    if(lstTitle.value=='1'||lstTitle.value=='3'||lstTitle.value=='4')
        { txtSubject.SetEnable(0);
          txtContent.SetEnable(0);
          txtContent.text='';
          if(lstTitle.value=='1')
          txtSubject.text='PAY SLIP ON '+ dtMonth.text;
		  if(lstTitle.value=='4')
          txtSubject.text='Announcement for personnal evaluation';
          if(lstTitle.value=='3')
          txtSubject.text='HAPPY BIRTHDAY ';
          
          grdEmployee.GetGridControl().ColHidden(2)=1;  
          chkCC.value='F';
          chkCC.SetEnable(0);  
          idlbCC.text='';     
          ibtnClear.SetEnable(0);
          idlbCC.style.display="none";
          dtMonth.SetEnable(1);
        }
     else
        { txtSubject.SetEnable(1);
          txtContent.SetEnable(1);
          ibtnClear.SetEnable(1);
          txtSubject.text='';
          grdEmployee.GetGridControl().ColHidden(2)=0;  
           chkCC.SetEnable(1); 
           idlbCC.style.display="";  
           dtMonth.SetEnable(0);    
           FTB_API['ftbContent'].SetHtml(""); 
           FTB_API['ftbContent'].InsertHtml(""); 
        
        }
        
        
    
}
function OnSearch()
{
     idlbTo.text='0';   
    idlbCC.text='0';
    datEmployee_Main_Search.Call("SELECT");
}
function OnClickRow()
{
Arr  =new Array();
idx=0;
var to='';
 var cc='';
 var lstpk='';
 var lstpkCC='';
 var num_to=0;
 var num_cc=0;
 
 for (var i=1;i<grdEmployee.rows;i++)
       {    if(grdEmployee.GetGridData(i,1)=="-1" )
                {   to=to+grdEmployee.GetGridData(i,8)+"("+grdEmployee.GetGridData(i,4)+")<"+grdEmployee.GetGridData(i,6)+ ">;";
                    num_to=num_to+1;
                    Arr[idx]=new Array();
                    Arr[idx][0]=grdEmployee.GetGridData(i,0);//pk
                    lstpk=lstpk+grdEmployee.GetGridData(i,0)+",";
                    Arr[idx][1]='1';//to
                    Arr[idx][2]=i;//idx grid
                    Arr[idx][3]=grdEmployee.GetGridData(i,3)+"("+grdEmployee.GetGridData(i,4)+")";//idx grid
                    idx++;
                // grdEmployee.SetGridText(i,11,lstTitle.value+"");
                 //grdEmployee.SetGridText(i,12,dtMonth.value);
                }
             if(grdEmployee.GetGridData(i,1)=='-1' && grdEmployee.GetGridData(i,2)=='-1')   
             {alert("Can't choose option CC and To at the same time ");
              grdEmployee.SetGridText(i,2,'0');
             }
               if(grdEmployee.GetGridData(i,2)=="-1" )
                {
                if(Number(lstTitle.value)!=1)
                    {  cc=cc+grdEmployee.GetGridData(i,8)+"("+grdEmployee.GetGridData(i,4)+")<"+grdEmployee.GetGridData(i,6)+ ">;";
                    num_cc=num_cc+1; 
                    Arr[idx]=new Array();
                    Arr[idx][0]=grdEmployee.GetGridData(i,0);//pk
                    Arr[idx][1]='2';//cc
                    Arr[idx][2]=i;//idx grid
                    Arr[idx][3]=grdEmployee.GetGridData(i,3)+"("+grdEmployee.GetGridData(i,4)+")";//idx grid
                    lstpk=lstpk+grdEmployee.GetGridData(i,0)+",";
                    lstpkCC=lstpkCC+grdEmployee.GetGridData(i,0)+",";
                    idx++;      
                    }
                
                
                }   
           
       }
    // alert(num_cc);
  /*     if(num_to>0 || num_cc>0)
       {/*for (var i=1;i<grdEmployee.rows;i++)
           {   //////////////////////////// alert(cc);
             if(grdEmployee.GetGridData(i,1)=="-1" ||grdEmployee.GetGridData(i,2)=="-1" )
                       {
                            grdEmployee.SetGridText(i,7,to);
                            grdEmployee.SetGridText(i,8,cc);
                            grdEmployee.SetGridText(i,9,txtSubject.text);
                            grdEmployee.SetGridText(i,10,txtContent.text);
                       } 
      
           }
           ibtnSend.SetEnable(true);
       }*/
      if(num_to>0 || num_cc>0)
                ibtnSend.SetEnable(true);
       else
       ibtnSend.SetEnable(0);
    idlbTo.text=num_to;   
    idlbCC.text=num_cc;
    txtCC.text=cc;
    txtTo.text=to;
    txtlstPk.text=lstpk;
    txtlstPkCC.text=lstpkCC;
}
function OnCheck(obj)
{ 
var ctrl=grdEmployee.GetGridControl();
            for(var i=1;i<=ctrl.SelectedRows;i++)
                {
                        if(obj=="1")
                            {  
                              if(chkTo.value=="T" &&  grdEmployee.GetGridData(ctrl.SelectedRow(i-1),2)=='0')
                              grdEmployee.SetGridText(ctrl.SelectedRow(i-1),1,"-1");
                              else
                              grdEmployee.SetGridText(ctrl.SelectedRow(i-1),1,"0");
                              
                            }
                            
                        if(obj=="2")
                            {  
                              if(chkCC.value=="T" && grdEmployee.GetGridData(ctrl.SelectedRow(i-1),1)=='0')
                              grdEmployee.SetGridText(ctrl.SelectedRow(i-1),2,"-1");
                              else
                              grdEmployee.SetGridText(ctrl.SelectedRow(i-1),2,"0");
                            }    
                      
                }
    OnClickRow();
    
}
 function OnSearch1()
 {datHistory.Call("SELECT");
 }

</script>

<body>

<!------------------------------------->
<!-------------------data control----------------------->
<gw:data id="datEmployee_Main_Search" > 
        <xml> 
            <dso  type="grid"   function="ST_HR_SEL_HRPM01600_0 " > 
                <input bind="grdEmployee" >
                    <input bind="lstOrg" />
                    <input bind="dtFrom_JoinDate" />
                    <input bind="dtTo_JoinDate" />
                    <input bind="chkTemp" />
                    <input bind="txtTemp" />
					<input bind="lstNation" />
					<input bind="lstStatus" />
					<input bind="lstWplace" />
					<input bind="lstEmpType" />
					<input bind="dtFrom_birth" />
                    <input bind="dtTo_birth" />
                    
				</input>
                <output  bind="grdEmployee" />
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datHistory" onreceive="OnDataReceive1(this)"> 
        <xml> 
            <dso  type="grid"   function="ST_HR_SEL_HRPM01600_1 " > 
                <input bind="grdSendMail" >
                    <input bind="lstTitle1" />
                    <input bind="dtSend_from" />
                    <input bind="dtSend_to" />
                    <input bind="chkTemp1" />
                    <input bind="txtTemp1" />
					<input bind="lstSendingStatus" />
					
				</input>
                <output  bind="grdSendMail" />
            </dso> 
        </xml> 
</gw:data>


<!------------------------------------->
<gw:data id="datSendMail" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01600_2" > 
                <input>
                    <input bind="lstTitle" />
                    <input bind="dtMonth" />
                    <input bind="txtSubject" />
                    <input bind="txtContent" />
                    <input bind="txtMailOption" />
                    <input bind="txtEmpPk" />
                    <input bind="txtCC" /> 
                    <input bind="txtTo" /> 
                    <input bind="chkReceive" /> 
                    <input bind="iduser_pk" /> 
                    
                    <input bind="txtlstPk" /> 
                    <input bind="txtlstPkCC" /> 
                    
                    
                    
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!------------------------------------->
<gw:data id="datSendMail_happy_birthday" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="hr_send_mail_happy_birthday" > 
                <input>
                    <input bind="lstTitle" />
                    <input bind="dtMonth" />
                    <input bind="txtSubject" />
                    <input bind="txtContent" />
                    <input bind="txtMailOption" />
                    <input bind="txtEmpPk" />
                    <input bind="txtCC" /> 
                    <input bind="txtTo" /> 
                    <input bind="chkReceive" /> 
                    <input bind="iduser_pk" /> 
                    
                    <input bind="txtlstPk" /> 
                    <input bind="txtlstPkCC" /> 
                    
                    
                    
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

   
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate=""  >   
  <table name="Send mail" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
    <tr>
    <td style="width:55%;height:100%" align=right >
        <table>
            
            <tr style="height:5%">
                <td style="width:20%; height:5%" align=right>Sender Receive</td>
                <td style="width:40%" align=left style="white-space:nowrap"><gw:checkbox id="chkReceive" value="T"  ></gw:checkbox >
                <gw:label id="idInterval" text="" styles="width:100%" ></gw:label>
                </td>
                <td style="width:20%" align=right><gw:icon id="ibtnClear" img="in" text="Clear" onclick="OnClear()" /></td>
                <td style="width:20%" align=right><gw:icon id="ibtnSend" img="in" text="Send Mail" onclick="OnSend()" /></td>
                
            </tr>
            <tr style="height:5%">
                <td style="width:20%; height:5%" align=right>Mail Title</td>
                <td style="width:40%" align=right><gw:list  id="lstTitle" value="1" maxlen = "10" styles='width:100%' onchange="OnChangeTitile()" > 
                            <data>|1|Pay Slip
                            </data>
                            </gw:list></td>
                <td style="width:20%" align=right>Month</td>
                <td style="width:20%" align=right><gw:datebox id="dtMonth"  type="month" maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>"  onchange="OnChangeTitile()" /></td>
                
            </tr>
            <tr style="height:5%">
                <td style="width:20%; height:5%" align=right>Subject</td>
                <td colspan=3><gw:textbox  id="txtSubject"   text="" styles='width:100%'csstype="mandatory"  /></td>
           </tr>
            <tr style="height:80%">
                <td colspan=4 style="height:85%; width:100%">
                    <div style="height:75%;">
                        <form id="Form1" runat="server" > 
                            <ftb:freetextbox id="ftbContent" runat="server"        imagegallerypath="../ci/picture/" supportfolder="~/FreeTextBox/"   ShowTagPath=false BreakMode="LineBreak" ToolbarLayout="FontFacesMenu, FontSizesMenu, FontForeColorsMenu,FontForeColorPicker, FontBackColorsMenu, FontBackColorPicker | JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, NumberedList, Indent, Outdent , InsertDate, InsertTime ,RemoveFormat| Bold, Italic, Underline, Strikethrough, Superscript, Subscript ,InsertRule, CreateLink, Unlink, InsertImageFromGallery,InsertTable, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,DeleteTableColumn,SymbolsMenu,WordClean" ImageGalleryUrl="../ci/ftb.imagegallery.aspx?rif={0}&cif={0}"></ftb:freetextbox>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </td>
    <td style="width:45%;height:100%">
         <table width="100%" height="100%" cellpadding=0 cellspacing=0 border=0 class="itable">
			    <tr   style="border:0;height:5%">
			        <td width="20%" style="border:0"  align="right" valign="middle">Nation</td>
				    <td colspan=2 width="25%" style="border:0" >
					    <gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by seq")%>|ALL|Select All</data></gw:list>
				    </td>
				    <td width="16%" align=right>Status</td>
				    <td colspan=3 width="44%"><gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0022' order by seq" )%>|ALL|Select All</data></gw:list>
                     </td>
				    <td width=5%>&nbsp;</td>
				    <td width=5%>&nbsp;</td>
			    </tr>
			     <tr   style="border:0;height:5%">
			        <td width="20%" style="border:0"  align="right" valign="middle">Working place</td>
				    <td colspan=2 width="25%" style="border:0" >
					    <gw:list  id="lstWplace" value='ALL' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0115' order by seq")%>|ALL|Select All</data></gw:list>
				    </td>
				   <td width="16%" align=right><a class="eco_link" title="Click here to show employee kind" onclick="OnShowPopup(2)" href="#tips" >Emp Kind</a></td>
				    <td colspan=3 width="44%"><gw:list  id="lstEmpType" value="ALL" styles='width:100%' >
                           <data>
                                <%=CtlLib.SetListDataSQL("SELECT A.PK,A.KIND_NAME as code FROM THR_EMPLOYEE_KIND A  where  A.del_if=0  order by code ")%>|ALL|Select All
                            </data></gw:list>
                     </td>
				    <td width=5%>&nbsp;</td>
				    <td width=5%>&nbsp;</td>
			    </tr>
				<tr style="border:0;height:5%">
			        <td style="border:0"  align="right" valign="middle"><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a></td>
				    <td style="border:0" colspan=6>
					    <gw:list  id="lstOrg" value="ALL" styles='width:100%' > 
					    <data>
                                <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                            </data></gw:list>
				    </td>
				    <td >&nbsp;</td>
				    <td ></td>
				    
				    
			    </tr>
			    
				<tr  style="border:0;height:5%" >
					<td  style="border:0" align="right">Join DT</td>
				    <td colspan=2 style="border:0" ><gw:datebox id="dtFrom_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				    <td style="border:0" align="center">~</td>
				    <td colspan=4 style="border:0" ><gw:datebox id="dtTo_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				    <td colspan=2></td>
				    
				</tr>
				<tr  style="border:0;height:5%" >
					<td  style="border:0" align="right">Birthday</td>
				    <td colspan=2 style="border:0" ><gw:datebox id="dtFrom_birth" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				    <td style="border:0" align="center">~</td>
				    <td colspan=4 style="border:0" ><gw:datebox id="dtTo_birth" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				    <td colspan=2></td>
				    
				</tr>
				<tr  style="border:0;height:5%">
		            <td style="border:0" align="right" >Search by</td>
		            <td colspan=2 style="border:0">									
			            <gw:list  id="chkTemp" value="2" styles="color:blue;width:100%" onchange=""> 
					            <data> LIST|1|Full Name|2|Emp ID|3|Card ID|4|Person ID</data> 
			            </gw:list>
		            </td>
		            <td colspan=4 style="border:0"><gw:textbox id="txtTemp" styles="color:blue;width:100%"  onenterkey ="OnSearch()"  /></td>
		            <td colspan=2 style="border:0" align="right"><gw:imgBtn id="ibtnSearch"  alt="Search"  img="search" text="Search"  onclick="OnSearch()" /></td>
		            
				</tr >
				<tr  style="border:0;height:5%" >
					<td colspan=1 style="border:0" align="right"><gw:checkbox id="chkTo" value="F" onclick="OnCheck(1)" ></gw:checkbox ></td>
					<td colspan=2 style="border:0" align="left" style="white-space:nowrap">To:<gw:label id="idlbTo" text="0" styles="width:100%"></gw:label></td>
				    <td colspan=1 style="border:0" align="right"><gw:checkbox id="chkCC" value="F" onclick="OnCheck(2)" ></gw:checkbox ></td>
				    <td colspan=2 align="left" style="white-space:nowrap">CC:<gw:label id="idlbCC" text="0" styles="width:100%"></gw:label></td>
				    
				    <td colspan=4></td>
				    
				</tr>
				
		        <tr  style="border:1;height:65%">
		            <td colspan=10 style="width:100%;height:100%">
		               <table border=1 width=100% style="height:100%" cellspacing=0 border=0>
		                    <tr>
		                        <td>
		                            <gw:grid   
			                        id="grdEmployee"  
			                        header="_PK|To|CC|Full Name|Emp ID|_Join DT|E-Mail|Sending Status|_Full_fName"
			                        format="0|3|3|0|0|4|0|0|0"  
			                        aligns="0|0|0|0|0|0|0|0|0"
			                        defaults="||||||||"  
			                       editcol="0|1|1|0|0|0|0|0|0"  
			                        widths="0|500|500|2000|1200|1200|1200|1500|0"  
			                        styles="width:100%; height:100%"   
			                        sorting="T"   
			                        onafteredit ="OnClickRow()"
			                        param="0,1,2,3,4,5,6,7"   />
		                        </td>
		                    </tr>
		               </table>
		            </td>
		        </tr>
	        </table>
    </td>
    </tr>
  </table> 
  <table name="History" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
   <tr style="width:100%;height:5%;" valign="center">
     <td style="border:0;width:8%" align=right> Send Date </td>
   <td style="border:0 ;width:5%" ><gw:datebox id="dtSend_from"  styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				    <td style="border:0;width:2%" > ~ </td>
				    <td style="border:0;width:5%" ><gw:datebox id="dtSend_to"  styles="width:100%" lang="<%=Session("Lang")%>" /></td>
   <td style="border:0;width:8%" align=right>Mail title </td>
   <td style="border:0;width:10%" >
   <gw:list  id="lstTitle1" value="ALL" maxlen = "10" styles='width:100%' onchange="" > 
                            <data>
                                LIST|1|Pay Slip|2|Other|ALL|Select All
                            </data>
                            </gw:list></td>
   <td style="border:0;width:10%" align=right>Sending Status </td>
   <td style="border:0;width:10%" >
   <gw:list  id="lstSendingStatus" value="ALL" maxlen = "10" styles='width:100%' onchange="" > 
                            <data>
                                LIST|0|Error|1|Success|ALL|Select ALL
                            </data>
                            </gw:list></td>
   <td style="border:0 ;width:8%" align="right" >Search by</td>
		            <td  style="border:0;width:10%">									
			            <gw:list  id="chkTemp1" value="2" styles="color:blue;width:100%" onchange=""> 
					            <data> LIST|1|Sender Name|2|Sender ID|6|Sender Email|3|Receiver Name|4|Receiver ID|7|Receiver Email|5|Subject</data> 
			            </gw:list>
		            </td>
		            <td style="border:0;width:10%"><gw:textbox id="txtTemp1" styles="color:blue;width:100%"  onenterkey ="OnSearch1()"  /></td>
   <td style="border:0;width:2%" align="right" ><gw:imgBtn id="ibtnSearch1"  alt="Search"  img="search" text="Search"  onclick="OnSearch1()" /></td>
 </tr>
 <tr style="width:100%;height:5%;" valign="center">
  <td colspan=12  style="border:0" align="right">
  <gw:label id="lblRecord"   text="0 record(s)" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12" />
  </td>
  
 </tr>
 <!--<tr  style="width:100%;height:5%;">
		            <td colspan=12 style="width:100%;height:100%" align="right">
		            <gw:label id="lblRecord"   text="0 record(s)" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12" />
                   </td>
</tr>-->
   <tr  style="border:1;height:70%">
		            <td colspan=12 style="width:100%;height:100%">
		               <table border=1 width=100% style="height:100%" cellspacing=0 border=0>
		                    <tr>
		                        <td>
		                            <gw:grid   
			                        id="grdSendMail"  
			                        header="Sender|Send Date|Receiver Name|Option|Status|Subject|Content"
			                        format="0|0|0|0|0|0|0"  
			                        aligns="0|0|0|0|0|0|0"  
			                        defaults="||||||"  
			                       editcol="0|0|0|0|0|0|0"  
			                        widths="4500|2500|4500|1500|1500|3000|35000|4000"  
			                        styles="width:100%; height:100%"   
			                        sorting="T"   
			                        onafteredit =""
			                        param="0,1,2,3,4,5,6,7"   />
		                        </td>
		                    </tr>
		                    </table>
		                    </td>
 				    
  </tr>
  </table>
</gw:tab>   
    <!------------------------------------------->
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="seq" styles="display:none"/>
    <gw:textbox id="txtCC" styles="display:none"/>
    <gw:textbox id="txtTo" styles="display:none"/>
    <gw:textbox id="txtResult" styles="display:none"/>
    <gw:textbox id="txtEmpPk" styles="display:none"/>
    <gw:textbox id="txtMailOption" styles="display:none"/>
    <gw:textbox id="txtlstPk" styles="display:none"/>
    <gw:textbox id="txtlstPkCC" styles="display:none"/>
    <gw:textbox id="txtContent" styles="display:none"/></gw:textarea>    
    
</body>
</html>
