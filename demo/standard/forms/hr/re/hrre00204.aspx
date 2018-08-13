<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>  
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var p_status="<%=Request.querystring("p_status")%>";
var p_request="<%=Request.querystring("p_request")%>";
var p_flag=true;
function BodyInit()
{ 	
    grdEmployee.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
      txtHr_level.text= "<%=session("HR_LEVEL")%>";
       lstPass.value= "<%=session("p_status")%>";
    lstPass.value=p_status+"";
	lstRequest.value=p_request+"";
    if(p_request!="ALL")
    {tblabel.style.display="none";
    p_flag=false;
    datEmployeePopup.Call();
    
    }
    
	
}
function OnSearch()
{
    datEmployeePopup.Call("SELECT");
}
function OnSelect()
{ if(p_flag==true)
    OnExit();
}
function OnExit()
{
    var obj= Array();
    var irow;
    irow=grdEmployee.row;
    if (irow>0) 
    {
        obj[0]=grdEmployee.GetGridData(irow,0); //pk
    }    
    else 
    {
        obj=null;
    }
	window.returnValue = obj; 
	window.close();
}
function EXITOnClick()
{   
	OnExit();
}
//------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
       auto_resize_column(grdEmployee,0,grdEmployee.cols-1,10);   
       lblRecord.text= (grdEmployee.rows -1)+" records";
}     
function OnChangeDept()
{
    
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

//----------------------------------------------------
function OnShowPopup()
{

        var strcom;
        var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			lstOrg.value = obj;
            //txtUpperOrg.text=obj;
            //datOrgData.Call();
            
        }
}
//----------------------------------------------------

</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datEmployeePopup" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="grid" function="ST_HR_SEL_HRRE00204_0"> 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstPosition" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
				<input bind="lstJob" />
				<input bind="lstPass" />
				<input bind="lstRequest" />
				<input bind="dtReceiveFrom" />
				<input bind="dtReceiveTo" />
				<input bind="dtExpiryFrom" />
				<input bind="dtExpiryTo" />
				<input bind="dtInterview1From" />
				<input bind="dtInterview1To" />
				<input bind="dtInterview2From" />
				<input bind="dtInterview2To" />
				<input bind="dtInterview3From" />
				<input bind="dtInterview3To" />
				
				
            </input> 
            <output bind="grdEmployee" /> 
        </dso> 
   </xml> 
</gw:data> 
<table style='margin-left:10px' align = top class="itable" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >
	<tr> 
	    <td  align = top >
		    <table align = top  width="100%" style="height:7%">
		        <tr>
			        <td align="Left">
				        <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:inherit" >
							<tr width="100%">
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
							</tr>
					        <tr>   
						        <td colspan="7" align="right"><font color="black"><b ><a title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" /></b></td>
						        <td colspan="15"><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 and a.org_type='06' order by a.seq")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        <td colspan="5" align="right"><font color="black"><b>Position &nbsp;</b>
						        </td>
						        <td colspan="15" > <gw:list  id="lstPosition" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                             </data></gw:list>
                                             </td>
						        <td colspan= "" ></td>
						        <td colspan="2" align="left">
							        <gw:imgBtn id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td colspan="3" ></td>
						        <td colspan="3" align="right">
							       <gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" />
						        </td>
					        </tr>
							<tr>   
						        <td colspan="7" align="right"><font color="black"><b >Job &nbsp;</b></td>
						        <td colspan="15"><gw:list id="lstJob" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>|ALL|Select All ...
										</data>
								   </gw:list > 
						        </td>
								
						        <td colspan="5" align="right"><font color="black"><b>Search by &nbsp;</b>
						        </td>
						        <td colspan="5">
							        <gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|4|Per ID</data> 
							        </gw:list>
						        </td>
        						
						        <td colspan="10"> 
							        <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						         <td colspan="3" align="right"><font color="black"><b>Pass &nbsp;</b>
						        </td>
						        <td colspan="5">
							        <gw:list  id="lstPass" value="ALL" styles='width:100%' onchange=""> 
									        <data>LIST|Y|Pass|N|No|W|Waiting|ALL|ALL</data> 
							        </gw:list>
						        </td>
        						
					        </tr>
					        <tr>   
						        <td colspan="10" align="right" style="white-space:nowrap"><font color="black"><b >Recruiment Request &nbsp;</b></td>
						        <td colspan="12"><gw:list id="lstRequest" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											<%=CtlLib.SetListDataSQL("select a.pk,app_no || ' - ' || (select v.code_nm from vhr_hr_code v where  v.id='HR0008' and v.code=a.pos_type )from thr_rec_request t ,thr_rec_request_detail  a where a.del_if=0 and t.del_if=0 and a.thr_rec_request_pk =t.pk and nvl(a.app_status,'01')='03' order by t.app_no ")%>|ALL|Select All ...
										</data>
								   </gw:list > 
						        </td>
								
						     <td colspan="5" align=right style="white-space:nowrap"> Recieve DT</td>
						         <td colspan="4" style="white-space:nowrap"> 
							        <gw:datebox id="dtReceiveFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td align=center> ~</td>
							    <td colspan=4> <gw:datebox id="dtReceiveTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						        <td colspan="14" style="white-space:nowrap" align=right> Expiry DT
						        <gw:datebox id="dtExpiryFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        ~ <gw:datebox id="dtExpiryTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						          
						      
						       
					        </tr>
					        
					        
					          <tr>   
					            
						        <td colspan="10" align="right"><font color="black"><b >Interview DT1</b></td>
						        <td colspan="5" style="white-space:nowrap"> 
							        <gw:datebox id="dtInterview1From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="2" align=center> ~</td>
							    <td colspan=5> <gw:datebox id="dtInterview1To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        <td colspan="5" align="right" style="white-space:nowrap"><font color="black"><b >Interview DT2</b></td>
						        <td colspan="4" style="white-space:nowrap"> 
							        <gw:datebox id="dtInterview2From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="1" align=center> ~</td>
							    <td colspan=4> <gw:datebox id="dtInterview2To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        
						        <td colspan="14" style="white-space:nowrap" align=right>
						        <font color="black"><b >Interview DT3</b>
						        <gw:datebox id="dtInterview3From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        ~
						        <gw:datebox id="dtInterview3To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						          
						       
					        </tr>
					        <tr>   
						        <td colspan="30" id="tblabel" align="left" valign="middle"><font color="black"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
						        <td colspan="20"><gw:label id="lblRecord" text="0 record(s)" styles="width:100%" ></gw:label></td>
					        </tr>
				        </table>
			        </td>
		        </tr>
		    </table>
	    </td> 
	</tr>		   
	<tr align = top> 
	    <td align = top style="width:100%;height:93%" >
  		    <gw:grid   
			    id="grdEmployee"  
			    header="_pk|ID|Full Name|Sex|Birth DT|Birth Place|Personal ID|Issue DT|Place ID|Ethnic|Current Address|Permanent Address|Hand Phone|Home Phone|Other Contact|Email|Education |Graduation School|Major|Graduation Kind|Other Certificate|Foreign Language|Language Certificate|Other Language|Computer  Skill|Experience|Other Description|Organization|Position|Job|Salary|Other Request|Receive DT|Introduction |Expiry DT|Full Profile| Profile Note|Interview DT1|Result 1|Remark 1|Interview DT2|Result 2|Remark 2|Interview DT3|Result 3|Remark 3|Pass |Working DT "   
			    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"  
			    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"  
			    defaults="|||||||||||||||||||||||||||||||||||||||||||||||"  
			    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"  
			    widths="1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|"  
			    styles="width:100%; height:100%"   
			    sorting="T"   
			    autosize="true"
			    oncelldblclick ="OnSelect()" /> 
    	
  	    </td>
    </tr>
</table>
<gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
</body>
</html>

				
