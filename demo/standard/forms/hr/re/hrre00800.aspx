<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var byhand;
var cIdx,rIdx;
var dt_tmp;
var strcodereturn;
var user;
var rowclick;
var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;
var p_PK =0;
var p_Organization=1;
var p_WorkGroup= 2;
var p_EmpID=3;
var p_OldID = 4;
var p_FullName= 5;
var p_IDNum=6;
var p_JoinDate=7 ;
var p_BirthDate=8;
var p_PlaceBirth= 9;
var p_Telephone= 10;
var p_PermanentAddress=11;
var p_PresentAddress=12;
var p_Sex=13;
var p_PersonID=14;
var p_IssueDate= 15;
var p_PlacePerID=16;
var p_Married= 17;
var p_Nation= 18;
var p_Ethenic= 19;
var p_Religion= 20;
var p_Education=21;
var p_Job=22;
var p_Position= 23;
var p_ProbationType= 24;
var p_BeginProbation= 25;
var p_EndProbation= 26;
var p_ContractKind= 27;
var p_ContractNO= 28;
var p_BeginContract= 29;
var p_EndContract= 30;
var p_SocialFlag= 31;
var p_SocialNo= 32;
var p_SocialPlace= 33;
var p_SocialDate= 34;
var p_HealthFlag= 35;
var p_HealthNo= 36;
var p_HealthPlace=37;
var p_HealthDate= 38;
var p_UnempFlag= 39;
var p_UnempDate= 40;
var p_EmployeeType= 41;
var p_OTYN =42;
var p_SalaryYN= 43;
var p_ProbationSalary= 44;
var p_BasicSalary= 45;
var p_AllowAmt1= 46;
var p_AllowAmt2 =47;
var p_AllowAmt3= 48;
var p_AllowAmt4= 49;
var p_AllowAmt5= 50;
var p_AllowAmt6 =51;
var p_AllowAmt7= 52;
var p_AllowAmt8= 53;
var p_PayType= 54;
var p_BankType= 55;
var p_bank_branch=56;
var p_Account= 57;
var p_Status= 58;
var p_LeftDate= 59;
var p_ResignType= 60;
var p_CostGroup =61
var p_GroupKind= 62
var p_CostKind= 63;
var p_PassPortNo= 64;
var p_PassPortDate= 65;
var p_Remark= 66;
var p_Union= 67;
var p_PitNo= 68;
var p_ByHand_YN=69;
var p_pk_CostKind=70;
var p_house_yn=71;
var p_meal_yn=72;
var p_pk_Org=73;
var p_major=74;
var p_emergency_name=75;
var p_emergency_phone=76;
var p_salary_type=77;
var p_job_description=78;
var p_charitable_yn=79;
var p_section_type=80;
var p_int_name=81;
var p_int_pk=82;
var p_sub_acc=83;

var x=10;
function BodyInit()
{
    grdEmployee.GetGridControl().FrozenCols =6;
    grdEmployee.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user="<%=session("USER_ID")%>";
    BindingDataList();
    OnSearch();

    var id =  setInterval("OnTime()",1000);
}

function BindingDataList()
{   
    
      var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlaceBirth,t1);
    
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select a.PK,a.WORKGROUP_NM from thr_work_group a where a.del_if=0 order by a.WORKGROUP_NM")%>";
       grdEmployee.SetComboFormat(p_WorkGroup,t1);
	   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0013' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_SocialPlace,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0012' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_HealthPlace,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Sex,t1);
        t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlacePerID,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Nation,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0015' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Ethenic,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0016' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Religion,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Education,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Job,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Position,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_EmployeeType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0023' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PayType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0020' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_BankType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0092' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_CostGroup,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0093' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_GroupKind,t1);
	   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0116' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_bank_branch,t1);
       
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select pk,org_nm from tco_org where del_if=0 order by org_nm")%>";
       grdEmployee.SetComboFormat(p_pk_Org,t1);
	   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0056' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_salary_type,t1);
       t1 = "#Y;Y|#N;N";
       grdEmployee.SetComboFormat(p_charitable_yn,t1);
	   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0154' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_section_type,t1);
       
	   
    
    
}

function OnDataReceive(obj)
{
   if (obj.id=="datEmp_Management")
   {
        lblRecord.text=grdEmployee.rows-1 + " record(s).";
        auto_resize_column(grdEmployee,0,grdEmployee.cols-1,9); 
   }
   else if(obj.id == "datClearGrid")
   {
        OnSearch();
   }
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//----------------------------------------------------
function OnSearch()
{
        datEmp_Management.Call("SELECT");
}
function OnTime()
{
    x= x-1;
    idInterval.text = x;
    if(x== 0)
    {
        x = 10;
        OnSearch();

    }
}
function OnClear()
{
    if(confirm("You want to clear all data on grid ?"))
        datClearGrid.Call();
}
</script>
<body style=" margin-bottom:0; margin-top:0; margin-right:0; margin-left:0" >
<!-------------------data control----------------------->


<gw:data id="datEmp_Management" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="hr_CHPR10190007_sel_emp_check" procedure=""> 
                <input bind="grdEmployee" >
                    <input bind="txtTmp" />
                </input>
                <output  bind="grdEmployee" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datClearGrid" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="hr_CHPR10190007_pro_clear_grid" > 
                <input>
                    <input bind="txtFlag" />  
                </input> 
                <output>
                    <output bind="txtFlag" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
 
  <table name="Employee Management" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            
                    <tr style="border:0;width:100%;height:5%" valign="middle" >
                        
                        <td  style="border:0;" align="right" >Refresh Page &nbsp;</td>
                        <td  style="border:0;" align="center" >
                            <gw:label id="idInterval"  text="" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12"/>
                        </td>
                        <td colspan=2 width="13%" align=right style="border:0"> 
					       
				        </td>
                        <td  style="border:0;" align="right" ></td>
                        <td  style="border:0;" align="left" >
                        
                        </td>
                       
                        <td  style="border:0" align="right" valign="middle"></td>
                        <td style="border:0;"></td>
				        <td  width="3%" style="border:0;" align="center"></td>
				        <td style="border:0;"></td>
                        <td colspan=3 style="border:0;" align="center" ><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12" /></td>
                        <td  style="border:0" align="center" valign="middle">
                            <gw:imgBtn id="ibtnReset" alt="Clear Grid" img="Reset" text="Reset" onclick="OnClear()" />
                        </td>
                    </tr>
                     
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=14 style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdEmployee"  
                                header="_PK|Organization|Work Group|Emp ID|Old Code|Full Name|ID Num|Join Date|Birth Date|Place Birth|Telephone|Permanent Address|Present Address|Sex|Person ID|Issue Date|Place Per ID|Married|Nation|Ethenic|Religion|Education|Job|Position|Probation Type|Begin Probation|End  Probation|Contract Kind|Contract NO|Begin Contract|End Contract|Social Flag|Social No|Social Place|Social Date|Health Flag|Health No|Health Place|Health Date|Unemp Flag|Unemp Date|Employee Type|OT YN|Salary YN|_Probation Salary|_Basic Salary|_Allow Amt1|_Allow Amt2|_Allow Amt3|_Allow Amt4|_Allow Amt5|_Allow Amt6|_Allow Amt7|_Allow Amt8|Pay Type|Bank Type|Bank Branch|Account|Status|Left Date|Resign Type|Cost Group|Group Kind|Cost Center|Pass Port No|Pass Port Date|Remark|Union YN|Pit No|_ByHand_YN|_PK_CostKind|House YN|Meal YN|_PK_ORG|Major|Emergency Name|Emergency Phone|Salary Type|Job Description|Charitable YN|Section Type|Introduction Name |_int_pk|Sub Account"   
                                format="0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|4|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|4|3|0|0|4|3|4|0|3|3|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|2|2|0|0|4|0|3|0|0|0|3|3|2|0|0|0|2|0|2|2|0|0|0"  
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"    
                                defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"    
                               editcol="0|0|0|1|1|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|1|1|0|1|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|1|0|0|0"  
                                widths="1500|1500|1500|1500|1500|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|500|500|1500|1500|1500|500|500|1500|1500|500|1500|1500|1500|1500|1500|1500|1500|1500|0|0"  
                                styles="width:100%; height:100%"   acceptNullDate
                                onafteredit=""
                                onentercell = ""
                                oncelldblclick = ""
                                sorting="T"/> 
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
  
</body>



<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtTmp" styles="display:none"/>
<gw:textbox id="txtFlag" styles="display:none"/>

    
</html>
