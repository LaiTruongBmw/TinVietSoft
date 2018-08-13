<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var irow,icol;
var binit=true;
var icStatus=10;
var first=true;
function BodyInit()
{ 	
    grdMaster.GetGridControl().ScrollTrack=true;
    grdMaster.GetGridControl().FrozenCols =4;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
     txtManager_PK.text="<%=session("EMPLOYEE_PK")%>";
     grdMaster.GetGridControl().ScrollTrack=true;	
     grdMaster.GetGridControl().ScrollTrack=true;	
     grdMaster.GetGridControl().FrozenCols =5;
     grdMaster.GetGridControl().ColHidden(22)=1;
	 grdMaster.GetGridControl().ColHidden(23)=1;
       grdMaster.GetGridControl().ColHidden(24)=1;
       var icol=25; 
		grdMaster.GetGridControl().ColHidden(icol)=1;
        grdMaster.GetGridControl().ColHidden(icol+1)=1;
        grdMaster.GetGridControl().ColHidden(icol+2)=1;
        grdMaster.GetGridControl().ColHidden(icol+3)=1;
        grdMaster.GetGridControl().ColHidden(icol+4)=1;
        grdMaster.GetGridControl().ColHidden(icol+5)=1;
        grdMaster.GetGridControl().ColHidden(icol+6)=1;
        grdMaster.GetGridControl().ColHidden(icol+7)=1;
        grdMaster.GetGridControl().ColHidden(icol+8)=1;
        grdMaster.GetGridControl().ColHidden(icol+9)=1;
       grdMaster.GetGridControl().Cell( 7, 0, 7,     0, 7     ) = 0x3300cc;  
       grdMaster.GetGridControl().Cell( 7, 0, 10,     0, 10     ) = 0x3300cc;  
       grdMaster.GetGridControl().Cell( 7, 0, 20,     0, 20     ) = 0x3300cc;  
       
  <%=CtlLib.SetGridColumnComboFormat( "grdMaster" , 10 ,  "select code,CODE_NM from vhr_hr_code where id='HR0145' and code<>'01' order by code_nm") %>; 
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        datUser_info.Call();
}

function OnSearch()
{
      datApproval_Rec.Call("SELECT");
}
function OnSave()
{
      if(confirm("Do you  want to save?\n Bạn có muốn lưu hay không?"))
      datApproval_Rec.Call();
}
//------------------------------------------------------------------------------------
function OnDataReceive(obj)
{  if(obj.id=='datAllowance')
     {
     OnToggle();
     }
  if(obj.id=='datApproval_Rec')
     {  lblRecord.text= (grdMaster.rows-1) +" records."
           if(grdMaster.rows>1)
           {
           var fg=grdMaster.GetGridControl(); 	  
             fg.MergeCells =2	;
            fg.MergeCol(0) =true	;
            fg.MergeCol(1) =true	;
            fg.MergeCol(2) =true	;
            fg.MergeCol(3) =true	;
            fg.MergeCol(4) =true	;
             fg.MergeCol(5) =true	;
             fg.MergeCol(6) =true	;
             fg.MergeCol(7) =true	;
             fg.MergeCol(8) =true	;
            // fg.MergeCol(9) =true	;
             //fg.MergeCol(10) =true	;
          
          grdMaster.SetCellBgColor(1,7,grdMaster.rows -1 ,7,0xFFEEFF);   
          grdMaster.SetCellBgColor(1,10,grdMaster.rows -1 ,10,0xFFEEFF);   
          grdMaster.SetCellBgColor(1,20,grdMaster.rows -1 ,20,0xFFEEFF);   
          grdMaster.SetCellBgColor(1,22,grdMaster.rows -1 ,34,0x99FFCC);
           }
          }
            // fg.CellBorder (0xFFEECC, 1, 1, 4, 4, 1, 1)*/   /*fg.MergeCells =3	;
    fg.MergeCol(15) =true	;*/
	   
}     

//-------------------------------------------------
function SetEnable_B(data)
{
    icnApprove.SetEnable(data);
    icnReject.SetEnable(data);
    icnRequest.SetEnable(data);
    ibtnRegis_Res.SetEnable(data);
    txtaResponse.SetEnable(data);
}
//-----------------------------------------------------------
function Popup()
{
    var ctrl=grdMaster.GetGridControl();
    var request_pk=grdMaster.GetGridData(ctrl.row,21);
    
    if(grdMaster.col==22)//biz trip
    {
         var fpath = System.RootURL + "/form/ch/pr/chpr00010_search_emp.aspx?p_status=ALL&p_request="+grdMaster.GetGridData(ctrl.row,21)+"" ;
        var obj  = System.OpenModal(  fpath , 950 ,600, 'resizable:yes;status:yes;');
    }
     if(grdMaster.col==23)//biz trip
    {
         var fpath = System.RootURL + "/form/ch/pr/chpr00010_search_emp.aspx?p_status=Y&p_request="+grdMaster.GetGridData(ctrl.row,21)+"" ;
        var obj  = System.OpenModal(  fpath , 950 ,600, 'resizable:yes;status:yes;');
    }
  
}
function OnShowPopup()
{
     var strcom;
   
        var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
             lstOrg.value=obj;
    
}

function OnToggle()
{       if(first==true)
            {first=false;
            datAllowance.Call();
            }
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			 imgMaster.src = "../../../../system/images/iconmaximize.gif";
			
			imgMaster.alt="Close infomation";
			//txtEmp_PK.text="";
			//ibtnAdd.SetEnable(false);
			  grdMaster.GetGridControl().ColHidden(22)=0;
			grdMaster.GetGridControl().ColHidden(23)=0;
			grdMaster.GetGridControl().ColHidden(24)=0;
		var icol=25; 
		grdMaster.SetGridText(0,icol,grdAllowance.GetGridData(1,0));
        grdMaster.SetGridText(0,icol+1,grdAllowance.GetGridData(1,1));
        grdMaster.SetGridText(0,icol+2,grdAllowance.GetGridData(1,2));
        grdMaster.SetGridText(0,icol+3,grdAllowance.GetGridData(1,3));
        grdMaster.SetGridText(0,icol+4,grdAllowance.GetGridData(1,4));
        grdMaster.SetGridText(0,icol+5,grdAllowance.GetGridData(1,5));
        grdMaster.SetGridText(0,icol+6,grdAllowance.GetGridData(1,6));
        grdMaster.SetGridText(0,icol+7,grdAllowance.GetGridData(1,7));
        grdMaster.SetGridText(0,icol+8,grdAllowance.GetGridData(1,8));
        grdMaster.SetGridText(0,icol+9,grdAllowance.GetGridData(1,9));
        grdMaster.GetGridControl().ColHidden(icol)=!(Number(grdAllowance.GetGridData(1,10)));
        grdMaster.GetGridControl().ColHidden(icol+1)=!(Number(grdAllowance.GetGridData(1,11)));
        grdMaster.GetGridControl().ColHidden(icol+2)=!(Number(grdAllowance.GetGridData(1,12)));
        grdMaster.GetGridControl().ColHidden(icol+3)=!(Number(grdAllowance.GetGridData(1,13)));
        grdMaster.GetGridControl().ColHidden(icol+4)=!(Number(grdAllowance.GetGridData(1,14)));
        grdMaster.GetGridControl().ColHidden(icol+5)=!(Number(grdAllowance.GetGridData(1,15)));
        grdMaster.GetGridControl().ColHidden(icol+6)=!(Number(grdAllowance.GetGridData(1,16)));
        grdMaster.GetGridControl().ColHidden(icol+7)=!(Number(grdAllowance.GetGridData(1,17)));
        grdMaster.GetGridControl().ColHidden(icol+8)=!(Number(grdAllowance.GetGridData(1,18)));
        grdMaster.GetGridControl().ColHidden(icol+9)=!(Number(grdAllowance.GetGridData(1,19)));
       
        }
        else
        {
            imgMaster.status = "expand";
           // tdDetail.style.display="";
            //tdDetail.style.width="30%";
           // tdMaster.style.height="70%";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Open more infomation";
			//if (grdEmp.rows-1 > 0)
              // ibtnAdd.SetEnable(true);
        grdMaster.GetGridControl().ColHidden(22)=1;
		grdMaster.GetGridControl().ColHidden(23)=1;
		grdMaster.GetGridControl().ColHidden(24)=1;
		var icol=25; 
		grdMaster.GetGridControl().ColHidden(icol)=1;
        grdMaster.GetGridControl().ColHidden(icol+1)=1;
        grdMaster.GetGridControl().ColHidden(icol+2)=1;
        grdMaster.GetGridControl().ColHidden(icol+3)=1;
        grdMaster.GetGridControl().ColHidden(icol+4)=1;
        grdMaster.GetGridControl().ColHidden(icol+5)=1;
        grdMaster.GetGridControl().ColHidden(icol+6)=1;
        grdMaster.GetGridControl().ColHidden(icol+7)=1;
        grdMaster.GetGridControl().ColHidden(icol+8)=1;
        grdMaster.GetGridControl().ColHidden(icol+9)=1;
       
        }
  
}
function OnSetGrird()
{
}
var old_value;
function OnChange(obj)
{ if(obj=='2' && grdMaster.row>0 && grdMaster.col==10)
    {if(Number(grdMaster.GetGridData(grdMaster.row,22))>0 || Number(grdMaster.GetGridData(grdMaster.row,23))>0 || Number(grdMaster.GetGridData(grdMaster.row,24))>0) 
      {alert("You can change status because  request have fee and employees apply. ")
        grdMaster.SetGridText(grdMaster.row,10,old_value);
      }
    }
  if(obj=='1'&& grdMaster.row>0 && grdMaster.col==10 )
    { old_value=grdMaster.GetGridData(grdMaster.row,10)
        
    }  
    
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRRE00400_0" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->

<!--_pk 0|Application No 1|Applicant ID 2|Applicant Name 3|Organization 4|From 5|To 6|Master Remark 7|Description 8|Summitted Date 9|Status 10|Employee(s) 11|Position 12|Education 13|Experience (Years) 14|Language 15|Language Certificate 16|Computer Skill 17|Other 18|Remark Detail 19|appro note 20|detail pk 21|Total Fee 22 |Total Apply 23|Total Passed 24-->
<gw:data id="datApproval_Rec" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" function="ST_HR_SEL_HRRE00400_1" procedure="ST_HR_UPD_HRRE00400_1" parameter="0,7,10,20,21" > 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
                <input bind="dtFrom" /> 
                <input bind="dtTo" />
                <input bind="dtFromSumDt" /> 
                <input bind="dtToSumDt" />
                <input bind="lstStatus" />  
                <input bind="txtManager_PK" />
                <input bind="txtManagerLevel" />
            </input> 
            <output bind="grdMaster" /> 
        </dso> 
   </xml> 
</gw:data> 

<!--------------table------------------------------->
<table style='margin-left:10px' align = top  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >
	    <tr style="width:100%; height:7%">
	     <td width="10%" align="right"><a title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a></td>
						        <td width="20%" ><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange=""> 
	                                           <data><%=CtlLib.SetListDataSQL("SELECT PK,ORG_NM FROM tco_org WHERE DEL_IF = 0 order by ORG_ID")%>|ALL|Select All</data>
	                                           </gw:list >
	                              </td>
	                              <td width="5%" align="right" >Status</td>
						        <td width="10%">
							        <gw:list  id="lstStatus" value="ALL" styles='width:100%' onchange=""> 
									         <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0145' and code<>'01' order by code")%>|ALL|Select All</data>
							        </gw:list>
						        </td>
						         <td width="10%" align=right>Applicant </td>
						          <td  width="10%" align="left" ><gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|3|Card ID|4|Per ID|5|App No</data> 
							        </gw:list></td>
							    <td width="10%" align=right> 
							        <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						        <td width="18%"></td>
						        <td width="3%">
						            <gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td width="3%">
						        <gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave()" />
						        </td>
	    </tr>
	    <tr style="width:100%; height:8%">
	     <td align="right" valign="middle">Submitted</td>
						        <td align="left" valign="middle" style="white-space:nowrap">
						        <gw:datebox id="dtFromSumDt"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
						        ~
						         <gw:datebox id="dtToSumDt"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
						        </td>
						       <td  align="right" >Period </td>
						        <td  colspan=2 align="left" style="white-space:nowrap"><gw:datebox id="dtFrom"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
						        ~ <gw:datebox id="dtTo"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
						        </td> 
							      <td  align=right><gw:label id="lblRecord" text="0 record(s)" styles="width:100%" ></gw:label></td>
							      <td></td>
							      <td></td>
							      <td></td>
							      <td>
							      <img status="collapse" id="imgMaster" alt="Show Detail Items" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle()"  /> </td>
							     
	    </tr>
	    	    <tr style="width:100%; height:85%">
	    <td colspan=10> 
	     <gw:grid   
			                id="grdMaster"  
                                header='_pk|Application No|Applicant ID|Applicant Name|Organization|From|To|Master Remark|Description|Summitted Date|Status|Employee(s)|Position|Education|Experience (Years)|Language|Language Certificate|Computer Skill|Other|Remark Detail|Approver Remark|_detail_pk|Total Apply|Total Passed|Total Fee|_cost1|_cost2|_cost3|_cost4|_cost5|_cost6|_cost7|_cost8|_cost9|_cost10'
                                format='0|0|0|0|0|4|4|0|0|4|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='||||||||||||||||||||||||||||||||||'
                                editcol='0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|1500|2500|2500|2500|1500|2000|1500|2500|2500|2500|1500|1500|1500|2500|2000|2500|2500|1500|2500|2000|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                                sorting='T'
                              
                                oncelldblclick = "Popup()"
                                onafteredit = "OnChange(2)"
                                onbeforeedit= "OnChange(1)"
                                acceptNullDate
                                styles='width:100%; height:100%'
                                />	    
	    </td>
	    </tr>
	    </table>

<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtManager_PK" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtTemp_PK" styles="display:none"/>
    <gw:textbox id="txtBiz_Trip_PK" styles="display:none"/>
    <gw:textbox id="txtStatus" styles="display:none"/>
    <gw:textbox id="txtAction" styles="display:none"/>
    <gw:textbox id="txtResult" text="0" styles="display:none"/>
    <gw:textbox id="txtManagerLevel" text="0" styles="display:none"/>
    <gw:textbox id="txtApprove_Level" text="0" styles="display:none"/>
    <gw:textbox id="txtStatus_Text" text="0" styles="display:none"/>
    <gw:textbox id="txtApp_Type" text="0" styles="display:none"/>
    <gw:textbox id="txtApprove_Level_Text" text="0" styles="display:none"/>
    <gw:textbox id="txtManager_Level_T" text="0" styles="display:none"/>
  <gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Code Name 9|Code Name 10|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8|Display 9|Display 10"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0|0|0|0|0"  
    defaults="||||||||||||||||||"  
    editcol="0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200|0|0|0|0"  
    styles="display:none" 
    sorting="T"    
/>     
</body>
</html>

				
