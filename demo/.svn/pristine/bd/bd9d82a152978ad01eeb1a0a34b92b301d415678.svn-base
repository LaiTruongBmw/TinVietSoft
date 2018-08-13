<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser("hr")%>
<head id="Head1" runat="server">
    <title>Request Management Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var dt_tmp ;

var g_pk =0;
    g_emp_id =1;
    g_fullname = 2;
    g_birth_dt = 3;
    g_sex = 4;
    g_personid = 5;
    g_issue_dt =6;
    g_placeid =7;
    g_address = 8;
    g_supplier =9;
    g_reason = 10;
    g_org = 11;
    g_position =12;
    g_resign_dt =13;
    g_note = 14;


function BodyInit()
{ 	
    grdBlock.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";

         t1 = "<%=CtlLib.SetGridColumnDataSQL("select 'M','Male' from dual union all select 'F','Female' from dual ")%>";
       grdBlock.SetComboFormat(g_sex,t1);
        t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>";
       grdBlock.SetComboFormat(g_placeid,t1);
}
//----------------------------------------------------
function OnSearch()
{
        datBlock.Call("SELECT");
}
//-----------------------------------------------------------
function OnAddNew()
{
        grdBlock.AddRow();   
}
//-----------------------------------
function OnDelete()
{
    grdBlock.DeleteRow();
}
//------------------------------------------------------------------------------------
function OnSave(obj)
{
    if(confirm("Do you want to save?\nBạn muốn save?"))
    {
            datBlock.Call();
    }
}
function OnDataReceive(obj)
{
       if (obj.id=="datBlock")
       {
          idRecord.text = grdBlock.rows -1 +' records';
       } 
	   
}       
//-----------------------------
function On_Click()
{
    
	dt_tmp=grdBlock.GetGridData(event.row,event.col)//luu tru gia tri vua click
   
}
function On_AfterEdit()
{

     if(event.col == g_issue_dt)
     {
//      alert("t");
        if(grdBlock.GetGridData(event.row, g_birth_dt) >=  grdBlock.GetGridData(event.row, g_issue_dt))
        {
            alert("Issue date has to more than birth date\nNgày cấp phải lớn hơn ngày sinh!");
            grdBlock.SetGridText(event.row, g_issue_dt, dt_tmp);
            return;
        }
     }   
}

</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >

<!----------------------------------->
<gw:data id="datBlock" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,2,3,4,5,6,7,8,9,10,14" function="HR.sp_sel_block_list_rec_hs" procedure="HR.sp_upd_block_list_rec" > 
            <input> 
                <input bind="lstSearchBy" />
                <input bind="idtxtTmp" /> 
                <input bind="lstSex" />
                <input bind="dtFromBirth" />
                <input bind="dtToBirth" />
            </input> 
            <output bind="grdBlock" /> 
        </dso> 
   </xml> 
</gw:data> 
<!----------------------------------->


    <table  name="Summary" id="tblEvent" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
		     <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:100%;width:100%" >
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
					        <tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right">Search by</td>
						        <td colspan="10"><gw:list id="lstSearchBy" styles="color:black;width:100%" value="2" > 
									   <data>
											|1|Full Name|2|Person ID|3|Address|4|Supplier
										</data>
								   </gw:list > 
						        </td>
						        
						       <td colspan="8" align=right style="white-space:nowrap"> 
                                <gw:textbox id="idtxtTmp" onenterkey   ="OnSearch()" styles='width:95%'/>
                               </td>
						        
							    <td colspan=3 align="right">
                                    Sex &nbsp;
						        </td>
                                <td colspan=4>
                                    <gw:list id="lstSex" styles="color:black;width:100%" value="ALL" > 
									   <data>
											|ALL|Select All|M|Male|F|Female
										</data>
								   </gw:list > 
						        </td>
						        <td colspan=5 style="white-space:nowrap" align=right> Birth DT &nbsp;</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtFromBirth"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=1 style="white-space:nowrap" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtToBirth"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        
						       
						        <td colspan="1">
						        </td>
						        
						        <td colspan="1" align="left">
							        <gw:imgBtn id="ibtnSearch1" alt="Search" img="Search" text="Search" onclick="OnSearch(1)" />
						        </td>
						        <td  align="right">
                                    <gw:imgBtn img="new" id="ibtnAdd"   alt="Add"  onclick="OnAddNew()"/>
						        </td>
						        <td  align="right">
						            <gw:imgBtn id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave()" />
						        </td>
                                <td  align="right">
						            <gw:imgBtn id="ibtnDel" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" />
						        </td>
						        <td  align="right">
						        <gw:imgBtn id="ibtnReport1"  alt="Report"  img="excel"  text="Exel"  onclick="OnReport(1)" />
						        </td>
					        </tr>
							<tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right"><font color="black">
						        </td>
						        <td colspan="10"> 
							        
						        </td>
						        <td colspan="5" align="right" > 
						            
                                </td>
						        <td colspan="5">
						            
						        </td>
						        <td colspan="11" align="right"><font color="black"></td>
						        <td colspan="12" align="right"><font color="black">
						            <gw:label id="idRecord" styles="width:100%;color:red;font-weight: bold" text="0 record(s)"></gw:label>
						        </td>
						        <td colspan="2" align="right">
        						   
        						</td>
					        </tr>
					        
					        
					        <tr align = top style="border:0;width:100%;height:90%" valign="center"> 
	                        <td  colspan="50"  align = top style="width:100%;height:100%" >
	                           <table width="100%" id="tblMaster" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                    <tr style="border:1;width:100%;height:100%" valign="top">
                                        <td>
	                                      <gw:grid   
		                                    id="grdBlock"  
		                                    header="_pk|Emp ID|Full Name|Birth Date|Sex|Person ID|Issues Date|Place of ID|Address|Supplier|Reason|Oganization|Position|Resign DT|Description"   
		                                    format="0|0|0|4|2|0|4|2|0|0|0|0|0|0|0"   
		                                    aligns="0|1|0|1|1|1|1|1|0|0|0|0|0|0|0"  
		                                    defaults="||||||||||||||"  
		                                    editcol="0|0|1|1|1|1|1|1|1|1|1|0|0|0|1"  
		                                    widths="0|1200|2500|1500|1000|1500|1500|1500|2500|2500|2500|2000|2000|1500|2000"  
		                                    styles="width:100%; height:100%"   
		                                    sorting="T"   
		                                    acceptNullDate
                                            onentercell = "On_Click()"
                                            onafteredit= "On_AfterEdit()"
		                                    /> 
		                                  </td>  
                    	            </tr>
                    	         </table>   
                    	         
  	                         </td>
                           </tr>
				        </table>
               </td>
        </tr>
    </table>   			 


    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
 
</body>
</html>

				
