<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Recruitment Report</title>
</head>
<script>
var ctlGroup;
var bChange_All=false;
var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;
function BodyInit()
{ 	
    if (v_language!="ENG")
        System.Translate(document);	
    idemp_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";

}


//------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if (tabMain.GetCurrentPageNo()==0)
        {
            lstDept_Code_1.value=obj;
            lstDept_Code_2.value=obj;
            lstDept_Code_3.value=obj;
            lstDept_Code_4.value=obj;
            lstDept_Code_5.value=obj;
            lstDept_Code_6.value=obj;
            lstDept_Code_7.value=obj;
            lstDept_Code_8.value=obj;
            lstDept_Code_9.value=obj;
            lstDept_Code_10.value=obj;
            
        }
        else
        {
            lstDept_Code_BN_1.value=obj;
            lstDept_Code_BN_2.value=obj;
            lstDept_Code_BN_3.value=obj;
            lstDept_Code_BN_4.value=obj;
            lstDept_Code_BN_5.value=obj;
            lstDept_Code_BN_6.value=obj;
            lstDept_Code_BN_7.value=obj;
           
        }
        
    }
    
}
//-------------------------------------------------------------
function OnDataReceive(obj)
{
    
    if (obj.id == "datFind_Report")
    {
        var url = System.RootURL;
        switch (rpt_no)
            {
                case 1:
                {
                    url = url + '/reports/ch/pr/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_1.value  + '&l_master=' + lstMaster_Code_1.value + '&l_detail=' + lstDetail_Code_1.value + '&l_dtFrom=' + txtdtFrom.text + '&l_dtTo=' + txtdtTo.text ;
                    break;
                }
                case 2:
                {
                    url = url + '/reports/ch/pr/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_2.value  + '&l_master=' + lstMaster_Code_2.value + '&l_detail=' + lstDetail_Code_2.value + '&l_dtFrom=' + txtdtFrom.text + '&l_dtTo=' + txtdtTo.text ;
                    break;
                }
                case 3:
                {
                    url = url + '/reports/ch/pr/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_3.value  + '&l_master=' + lstMaster_Code_3.value + '&l_detail=' + lstDetail_Code_3.value + '&l_dtFrom=' + txtdtFrom.text + '&l_dtTo=' + txtdtTo.text ;
                    break;
                }
            }
        System.OpenTargetPage( url , 'newform' );
    }
}

//------------------------------------
function OnReport(optobj)
{
    
}
//------------------------------
function ChangeYear()
{
    
}
//------------------------------
function OnChangeOrg(obj)
{
    if(obj=="1")
        datListOrg_1.Call();
    else if(obj == "2")
        datListOrg_2.Call();
    else if(obj == "3")
        datListOrg_3.Call();
    else if(obj == "4")
        datListOrg_4.Call();
}
//------------------------------
function OnChangeMaster(obj)
{
    if(obj=="1")
        datListMaster_1.Call();
    else if(obj == "2")
        datListMaster_2.Call();
    else if(obj == "3")
        datListMaster_3.Call();
    else if(obj == "4")
        datListMaster_4.Call();
}
//------------------------------------
function OnReport(optobj)
{
     rpt_no = optobj.value;
        for(var i=0;i<optobj.length;i++)
            if (optobj[i].checked)
                rpt_no = i + 1;
     
        switch (rpt_no)
        {
            case 1:
            {
                txtReport_tmp.text = "rpt_status_recruitment.aspx";
                break;
            }
            case 2:
            {
                txtReport_tmp.text = "rpt_status_summary_rec.aspx";
                break;
            }
            case 3:
            {
                txtReport_tmp.text = "rpt_rec_employee_list.aspx";
                break;
            }
        }
    OnDate();
    datFind_Report.Call();
}
//-------------------------
function OnDate()
{
    if(Rec.optDay[0].checked)
    {
        txtdtFrom.text = dtYear.value +'0101';
        txtdtTo.text = dtYear.value +'1231'
    }
    else if(Rec.optDay[1].checked)
    {
        txtdtFrom.text = dtMonth.value +'01';
        txtdtTo.text = dtMonth.value +'31'
    }
    else if(Rec.optDay[2].checked)
    {
        txtdtFrom.text = dtFrom.value;
        txtdtTo.text = dtTo.value;
    }
}
</script>
<style type="text/css">
<!--
.textColor {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 11px;
}
-->
</style>

<style>
.top { border-top:1px solid #034D72; }
.topright { border-top :1px solid #034D72;
			border-right: 1px solid #034D72;;padding-right:10px
			}
.topleft {border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			}
.left { border-left:1px solid #034D72; }
.right { border-right:1px solid #034D72;padding-right:10px }
.bottomright { border-bottom:1px solid #034D72; 
				border-right:1px solid #034D72; padding-right:10px
				}
.bottomleft { border-bottom:1px solid #034D72; 
				border-left:1px solid #034D72;;
			}
.topcenter { border-top:1px solid #034D72; }
.bottom { border-bottom:1px solid #034D72; }

.topleftbottom { border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }
.topcenterbottom { 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.topbottom {border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.toprightbottom { border-right:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }
	
#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }

</style>

<body>
<!------------main control---------------------->

<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="hr_sp_pro_find_report" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListOrg_1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="HR.SP_PRO_LIST_ORG_REC" > 
                <input>
                    <input bind="lstDept_Code_1" /> 
                </input> 
                <output>
                    <output bind="lstMaster_Code_1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListMaster_1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_CHPR10190003_LIST_REQUEST" > 
                <input>
                    <input bind="lstMaster_Code_1" /> 
                </input> 
                <output>
                    <output bind="lstDetail_Code_1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListOrg_2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="HR.SP_PRO_LIST_ORG_REC" > 
                <input>
                    <input bind="lstDept_Code_2" /> 
                </input> 
                <output>
                    <output bind="lstMaster_Code_2" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListMaster_2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_CHPR10190003_LIST_REQUEST" > 
                <input>
                    <input bind="lstMaster_Code_2" /> 
                </input> 
                <output>
                    <output bind="lstDetail_Code_2" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListOrg_3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="HR.SP_PRO_LIST_ORG_REC" > 
                <input>
                    <input bind="lstDept_Code_3" /> 
                </input> 
                <output>
                    <output bind="lstMaster_Code_3" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListMaster_3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_CHPR10190003_LIST_REQUEST" > 
                <input>
                    <input bind="lstMaster_Code_3" /> 
                </input> 
                <output>
                    <output bind="lstDetail_Code_3" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListOrg_4" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="HR.SP_PRO_LIST_ORG_REC" > 
                <input>
                    <input bind="lstDept_Code_4" /> 
                </input> 
                <output>
                    <output bind="lstMaster_Code_4" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListMaster_4" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_CHPR10190003_LIST_REQUEST" > 
                <input>
                    <input bind="lstMaster_Code_4" /> 
                </input> 
                <output>
                    <output bind="lstDetail_Code_4" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<form name="Recruit Reports" id="Rec" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:80%"   valign="middle" border="0" >
	<tr height="15%" >
      <td style="width:100%">
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:100%" width="100%"  border="0" >
            <tr>
                <td width="15%"  align="right" valign="middle" class="topleftbottom" style="font-family:Times New Roman;font-size:14" >
                   <input type="radio" name="optDay" value="1" checked> Year
                </td>
                <td width="10%"  align="left" valign="middle" class="topcenterbottom" style="font-family:Times New Roman">
                    <gw:datebox id="dtYear"  text="" maxlen = "10" type="year" styles='width:60%' lang="<%=Session("Lang")%>" />
                </td>
                <td width="5%" valign="middle" align="left" class="topcenterbottom" style="border-left:0;border-right:0"> &nbsp; </td>
                <td width="10%" valign="middle" align="right" class="topcenterbottom" style="font-family:Times New Roman;font-size:14"> 
                    <input type="radio" name="optDay" value="1" checked> Month
                </td>
                <td width="10%" valign="middle" align="left" class="topcenterbottom" style="border-left:0;border-right:0">
                    <gw:datebox id="dtMonth"  text="" maxlen = "10" type="month" styles='width:60%' lang="<%=Session("Lang")%>" />
                </td> 
                <td width="5%" valign="middle" align="left" class="topcenterbottom" style="border-left:0;border-right:0"> &nbsp; </td>
                <td width="10%" valign="middle" align="right" class="topcenterbottom" style="font-family:Times New Roman;font-size:14">
                    <input type="radio" name="optDay" value="1" checked> From &nbsp;
                </td>
                <td width="10%" valign="middle" align="left" class="topcenterbottom" style="border-left:0;border-right:0">
                    <gw:datebox id="dtFrom"  text="" maxlen = "10" type="date" styles='width:60%' lang="<%=Session("Lang")%>" />
                </td>
                <td width="3%" valign="middle" align="center" class="topcenterbottom" style="font-family:Times New Roman;font-size:14"> To &nbsp; </td>
                <td width="10%" valign="middle" align="left" class="topcenterbottom" style="border-left:0;border-right:0">
                    <gw:datebox id="dtTo"  text="" maxlen = "10" type="date" styles='width:60%' lang="<%=Session("Lang")%>" />
                </td> 
                <td width="2%" valign="middle" align="center" class="topcenterbottom" style="border-left:0;border-right:0"> &nbsp; </td>
              <td width="5%" align="left" valign="middle" class="toprightbottom"><gw:imgBtn id="ibtnReport" alt="Excel Report" img="excel" text="Print" onclick="OnReport(Rec.optMonthReport)" /></td>
            </tr>
        </table>
      </td>
      
    </tr>
    <tr height="80%">
	    <td  style="width:100%;height:100%">
		    <table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
			    <tr style="width:100%;height:7%"  > 
                    <td width="15%" colspan="2" align="center" class="topleft" style="border-right:0;color:Navy">Report Name</td>
                    <td width="20%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">
                        <a  title="Click here to show Organization" onclick="OnShowPopup()" href="#tips">Organization</a>
                    </td>
			        <td width="20%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Recruitment Master</td>
			        
			        <td width="20%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Recruitment Detail</td>
			        
			        <td width="10%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">&nbsp;</td>
			        <td width="15%" align="center" class="topright" style="border-left:0;color:Navy">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"  width="2%" valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" checked></td>
                    <td valign="middle" style="font-size:12" width="20%" style="border-left:0;border-right:0">Recruit Detail Status</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDept_Code_1" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeOrg(1)" >
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
							</data>
						</gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstMaster_Code_1" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeMaster(1)">
							<data>
								<%= CtlLib.SetListDataSQL("select a.pk, a.slip_no from thr_rec_request a where a.del_if=0 and a.status ='2' ")%>|ALL|Select All
							</data>
						</gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDetail_Code_1" value='ALL' maxlen = "100" styles='width:80%' onchange="">
							<data>
								<%= CtlLib.SetListDataSQL("SELECT to_char(A.PK) t1,A.slip_no||' - '|| (SELECT V.CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=A.POS_TYPE ) t2  FROM THR_REC_REQUEST A WHERE A.DEL_IF = 0 and nvl(a.status,'1')='3' ")%>|ALL|Select All
							</data>
						</gw:list></td>
                                                         
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Recruit Summary Status</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDept_Code_2" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeOrg(2)" >
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstMaster_Code_2" value='ALL' maxlen = "100" styles='width:80%'  onchange="OnChangeMaster(2)">
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk, a.slip_no from thr_rec_request a where a.del_if=0 and a.status ='2'" )%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDetail_Code_2" value='ALL' maxlen = "100" styles='width:80%' onchange="">
							<data>
								<%= CtlLib.SetListDataSQL("SELECT to_char(A.PK) t1,A.slip_no||' - '|| (SELECT V.CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=A.POS_TYPE ) t2  FROM THR_REC_REQUEST A WHERE A.DEL_IF = 0 and nvl(a.status,'1')='3'")%>|ALL|Select All
							</data>
						</gw:list>
					</td>                                                      
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Recruit Employee</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDept_Code_3" value='ALL' maxlen = "100" styles='width:80%'onchange="OnChangeOrg(3)" >
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstMaster_Code_3" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeMaster(3)">
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk, a.slip_no from thr_rec_request a where a.del_if=0 and a.status ='2'" )%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDetail_Code_3" value='ALL' maxlen = "100" styles='width:80%' onchange="">
							<data>
								<%= CtlLib.SetListDataSQL("SELECT to_char(A.PK) t1,A.slip_no||' - '|| (SELECT V.CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=A.POS_TYPE ) t2  FROM THR_REC_REQUEST A WHERE A.DEL_IF = 0 and nvl(a.status,'1')='3'")%>|ALL|Select All
							</data>
						</gw:list>
					</td>
										   
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="bottomleft"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td calss="bottom" valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Recruit Apply</td>
                    
                    <td calss="bottom" align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDept_Code_4" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeOrg(4)" >
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td calss="bottom" align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstMaster_Code_4" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeMaster(4)">
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk, a.slip_no from thr_rec_request a where a.del_if=0 and a.status ='2'" )%>|ALL|Select All
							</data>
						</gw:list>
					</td>
			        <td calss="bottom" align="center" valign="middle" style="border-left:0;border-right:0">
						<gw:list  id="lstDetail_Code_4" value='ALL' maxlen = "100" styles='width:80%' onchange="">
							<data>
								<%= CtlLib.SetListDataSQL("SELECT to_char(A.PK) t1,A.slip_no||' - '|| (SELECT V.CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=A.POS_TYPE ) t2  FROM THR_REC_REQUEST A WHERE A.DEL_IF = 0 and nvl(a.status,'1')='3'")%>|ALL|Select All
							</data>
						</gw:list>
					</td>                   
			        <td calss="bottom" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td calss="bottomright" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
               
               <tr height="35%" style="width:100%;"  valign="top"> 
                    <td class="bottomleft"   valign="middle" style="border-right:0"></td>
                    <td class="bottom" valign="middle" style="font-size:12"  style="border-left:0;border-right:0"></td>
                    
                    <td class="bottom" align="center" valign="middle" style="border-left:0;border-right:0"></td>
			        <td  align="center" class="bottom" valign="middle" style="border-left:0;border-right:0"></td>
			        <td align="center" class="bottom" valign="middle" style="border-left:0;border-right:0"></td>
                    <td align="center"  class="bottom" valign="middle" style="border-left:0;border-right:0"></td>                    
			        <td   class="bottomright" align="center" valign="middle" style="border-left:0"></td>
                </tr>

            </table>
	    </td>
	</tr>	
 </table>
 </form>
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="idemp_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
<gw:textbox id="txtReport_tmp" styles="display:none"/>	
<gw:textbox id="txtdtFrom" styles="display:none"/>	
<gw:textbox id="txtdtTo" styles="display:none"/>	

</body>
</html>

