<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var deleteFlag = 'F';
var addFlag = 'F';
var iCountDeptID =0;
function BodyInit()
{
    System.Translate(document);
    idemp_pk.text = "<%=session("USER_PK")%>";
    txtManager_ID.SetEnable(false);
    txtManager_Name.SetEnable(false);    
	dsoDeptEntry.StatusInsert();
	
	
    lstOrgType.SetDataText("<%=CtlLib.SetListDataFUNC("SELECT hr_f_commoncode('COEO0030','','') FROM DUAL" )%>");
  	txtCompanyPk.text         =   lstCompany.GetData();
  	dsoDeptTree.Call("SELECT");
  	
}
/*--------------------------------------*/
function OnMove(n)
{   if(txtOrgPk.text=='')
        alert("Please select department entry");
    else
    { var strcom;
        var fpath = System.RootURL + "/form/ag/io/agio00060_org.aspx?dept_pk="+txtOrgPk.text+"&company_pk="+lstCompany.value+"&type="+n;
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:400;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null && n=='0')
        {dsoDeptTree.Call("SELECT");
          //  txtUpperDept.text=obj;
           // datDeptData.Call();
        }
        if (obj!=null && n=='1')
        alert(obj+' Employees moved.');
    }    

}
/*--------------------------------------*/
function OnCheckOrgId()
{
    dsoCheckDeptId.Call();
    
}

/*function OnCheckAjax()
{
    
    var HttpRequest = false;

    if (window.XMLHttpRequest) // Internet Explorer
    {
        HttpRequest = new XMLHttpRequest()
    }
    else  // Other browsers  
    {
        HttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    var t=new Date();	
    if (!HttpRequest) return;
    alert(txtOrgPk.GetData() + "|" + txtOrgId.GetData());
    var url = "wcoeo00003_4.aspx?DeptPk=" + txtOrgPk.GetData() + "&DeptId=" + txtOrgId.GetData() + "&Date=" + t;
    
    HttpRequest.open("GET",url);
    HttpRequest.onreadystatechange = function()
    {
        if (HttpRequest.readyState == 4 && HttpRequest.status == 200)
        {
           iCountDeptID = HttpRequest.responseText ;
      
        }
   } 
   HttpRequest.send(null);
}*/
//------------------------------------------
function checkKey() 
{
     
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}
/*-----------------------------*/
function UpdateOnClick()
{
    imagePK.text = imgFile.oid;
	if (confirm("Do you want to save data?"))
	{
	    
	    if(checkItemEmpty() && OnCheckDate() )
	    {
		    if(dsoDeptEntry.GetStatus()!=20 && dsoDeptEntry.GetStatus()!=40)
			    {
			        
			        dsoDeptEntry.StatusUpdate();
			    }
    			
		        dsoDeptEntry.Call();
    		
	    }
	}
}

/*-----------------------------*/
function Add_subOnClick()
{
    if(lstCompany.GetData()=="ALL")
    {
        alert("Please choose company add new org.\nChọn công ty để thêm mới")
        return;
    }
	
	var upperDeptPk     = txtOrgPk.text;
    var upperDept       = txtUpperDept.text= txtOrgName.text;
	
	dsoDeptEntry.StatusInsert();
	txtCompanyPk.text   =   lstCompany.GetData();
   	txtUpperOrgPk.text = upperDeptPk;
	txtUpperDept.text   = upperDept;

}
//---------------------------------------
function AddOnClick()
{
    if(lstCompany.GetData()=="ALL")
    {
        alert("Please choose company add new org.\nChọn công ty để thêm mới")
        return;
    }

	var t1,t2;
	t1=txtUpperOrgPk.text;
	t2=txtUpperDept.text;
	dsoDeptEntry.StatusInsert();
    txtCompanyPk.text         =   lstCompany.GetData();
    txtUpperOrgPk.text=t1;
    txtUpperDept.text=t2;
}
/*-------------------------------------*/
function DeleteOnClick()
{
    if(confirm("Are you sure you want to delete?\nBạn có muốn xóa?" ))
	{
	    dsoDeptEntry.StatusDelete();
	    dsoDeptEntry.Call();
	}
}

/*------------------------------*/
function OnChange_com()
{
	txtUpperDept.SetDataText("");	
  	dsoDeptTree.Call("SELECT");
}

/*-----------------------------*/
function query()
{
	dsoDeptTree.Call("SELECT");
}

/*-----------------check empty-----------------------*/
function checkItemEmpty()
{
/*	if(txtOrgId.GetData() == "")
	{
		alert("Please enter Organization ID ...");
		return false;
	} */
	if(txtOrgName.GetData() == "")
	{
		alert("Please enter Organization name ...");
		return false;
	}
	if(lstOrgType.GetData() == "")
	{
		alert("Please enter Organization type ...");
		return false;
	}
	if(dtStartDate.GetData() == "")
	{
		alert("Please enter start date...");
		return false;
	}
	return true;
}

/*-----------------check date-----------------------*/
function OnCheckDate()
{
	var std_dt, etd_dt ;
	std_dt = dtStartDate.GetData();
	etd_dt = dtEndDate.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert("End Date can not less than Start date....");
		return false;
	}
	return true;
}
//------------------------------------------
function treeItemOnclick()
{
    
	var obj = event.srcElement.GetCurrentNode();
    txtOrgPk.text= obj.oid;
    dsoDeptEntry.StatusSelect();
	dsoDeptEntry.Call("SELECT");
}



//------------------------------------------
function OnDataReceive(dso)
{
    
    if (dso.id=="dsoDeptEntry")
    {
        imgFile.SetDataText(imagePK.text);   
        if( dsoDeptEntry.GetStatus()!=0 )
        {
            
            dsoDeptTree.Call("SELECT");
            
        }
    }
    
    if (dso.id=="dsoCheckDeptId")
    {
        
        if (txtCountOrgId.text!="0")
        {
            alert("Duplicated Organization Id, please input another!");
            var crtl=txtOrgId.GetControl();
            crtl.focus();
        }
    }
}
//-------------------------------------------
function OnShowDeptID()
{
    var url = '/standard/forms/gs/or/gsor00201.aspx?DeptId=' + txtOrgId.text  ;
	o = System.OpenModal( System.RootURL+ url , 900 , 450 , 'resizable:yes;status:yes') 
}
function OnDataError(obj)
{
	if(obj.id == "dsoDeptEntry")
    {
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	
}
function Numbers(e) 
{ 
  //  var ctrl=idTEL.GetControl(); 
    var keynum; 
    var keychar; 
    var numcheck; 
    keynum =event.keyCode; 
        
    if(window.event) // IE 
    { 
      keynum = e.keyCode; 
    } 
    else if(e.which) // Netscape/Firefox/Opera 
    { 
      keynum = e.which; 
    } 
    keychar = String.fromCharCode(keynum); 
    numcheck = /\d/; 
    return numcheck.test(keychar); 
}
//----------------------------------------------
function OnShowManager()
{
    if (txtOrgPk.text!="")
    {
        var fpath = System.RootURL + "/standard/forms/co/lg/colg00100.aspx" ;
        var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	    if (obj!=null)
	    {
	        txtManager_PK.text=obj[0];
	        txtManager_ID.text=obj[1];
	        txtManager_Name.text=obj[2];
	    }
	}
}
//----------------------
function OnReset()
{
    txtManager_PK.text="";
    txtManager_ID.text="";
    txtManager_Name.text="";
}
function onReport()
{
    var url =System.RootURL + '/reports/ag/io/rpt_org.aspx';        
    window.open(url);
}

function OnChangeShow() {
    dsoDeptTree.Call("SELECT");
}

function OnPupupCostCenter()
{
    var strcom;
        var fpath = System.RootURL + "/form/ch/ae/chae00010_cost_center.aspx?id="+txtCost_Center_pk.text+"&company_pk=" +  "<%=Session("COMPANY_PK")%>";
        var obj  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
       // var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            //alert(obj[0]);
			txtCost_Center_pk.text=obj[0]
			txtCostCenter.text=obj[1];
            
        }
}        

</script>

<body>

<gw:data id="dsoDeptTree"   > 
        <xml> 
            <dso id="1" type="tree" function="ST_GS_PRO_GSOR00200_0" > 
                <input>
                    <input bind="lstCompany" />
                    <input bind="idemp_pk" />  
                    <input bind="lstShow" /> 
                </input> 
                <output bind="tvDept" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->

<gw:data id="dsoCheckDeptId"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process"  procedure="ST_GS_PRO_GSOR00200_1" > 
                <input>
                    <input bind="txtOrgPk" /> 
                    <input bind="txtOrgId" /> 
                </input> 
                <output> 
                    <output bind="txtCountOrgId" />
                </output>  
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
<gw:data id="dsoDeptEntry" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23" function = "ST_GS_SEL_GSOR00200_0" procedure="ST_GS_UPD_GSOR00200_0"> 
            <inout> 
                <inout bind="txtOrgPk" />
                <inout bind="txtUpperOrgPk" />
                <inout bind="txtUpperDept" /> 
                <inout bind="txtOrgId" />
                <inout bind="txtOrgName" />
                <inout bind="txtOrgLocalName" /> 
                <inout bind="txtOrgForeignName" />
                <inout bind="lstOrgType" />
                <inout bind="dtStartDate" /> 
                <inout bind="dtEndDate" /> 
                <inout bind="txtareaRemark" />
                <inout bind="txtCompanyPk" /> 
                <inout bind="txtSeq" /> 
                <inout bind="txtManager_PK" /> 
                <inout bind="lstManager_Kind" /> 
                <inout bind="txtManager_ID" /> 
                <inout bind="txtManager_Name" /> 
                <inout bind="lstPaySal" />
                <inout bind="imagePK" />
                <inout bind="txtID_VD" />
                <inout bind="txtShortName" />
                <inout bind="lstCostGroup" />
                <inout bind="lstCostGroupKind" />
                <inout bind="txtCost_Center_pk" /> 
                <inout bind="txtCostCenter" />
                
             </inout>
        </dso> 
    </xml> 
</gw:data> 
   <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
	<tr width="100%" height="10%">
		<td width="30%">
						<!-- Table1 contain master buttons and text box -->
						<table id="LeftTopTB" width="100%">
							<tr>
								<td width="100%">
									<table id="LeftTopTB1" height="15" width="100%" border="0">
										<tr>
											<td width="9%" align="left">Company</td>
											<td width="27%">
											    <gw:list  id="lstCompany"  maxlen = "100" styles='width:100%' onchange="OnChange_com()" >
                                                    <data>
                                                        <%=CtlLib.SetListDataSQL("select PK,PARTNER_NAME from TCO_COMPANY where DEL_IF = 0 AND ACTIVE_YN='Y'")%>
                                                    </data>
                                                </gw:list>
										    </td>
											<td width="4%" align="right"><gw:imgBtn id="btnSearch" img="search"  alt="search" onclick="query()" /> </td>
										</tr>
									</table>
								</td>
							</tr>
							
						</table>
						<!-- End of Table1--->
		</td>
		<td width="70%">
					<!-- Table2 contain detail buttons and text box -->
					<table id="RightTopTB" width="100%">
						<tr>
							<td width="41%"><gw:list id="lstShow" styles='width:80%' onchange="OnChangeShow()" ><data>|01|Show All|02|Show Available</data> </gw:list></td>
							<td width="15%"><gw:icon     alt="Move employees "  styles='display:none'   	id="btnMove"  img="in"	text="Move Employees"	onclick="OnMove(1)" /></td>		
							<td width="18%"><gw:icon     alt="Move department"  styles='display:none'  	id="btnMove1"  img="in"	text="Move Department"	onclick="OnMove(0)" /></td>		
							<td width="4%"><gw:button img="new"    text="New"	   alt="New"    styles='display:none'	id="btnAdd" 		onclick="AddOnClick()" /></td>		
							<td width="4%"><gw:button img="new"    text="New Sub"	  alt="New Sub"    id="btnAddSub" 	onclick="Add_subOnClick()" /></td>	
							<td width="4%"><gw:button img="save"   	text="Save"   alt="Save"   	id="btnUpdate" 	onclick="UpdateOnClick()" /></td>
							<td width="4%"><gw:button img="delete" 	text="Delete"   alt="Delete"     id="btnDelete" 	onclick="DeleteOnClick()" /></td>
							<td width="4%"><gw:button img="excel"   text="Report"   alt="Report"   styles='display:none' 	id="btnrpt" 	onclick="onReport()" /></td>
							
						</tr>
					</table>
		</td>
	
	</tr>
	<tr width="100%" height="90%" valign="top">
		<td width="30%"> 
			<table id="LeftBottomTB" width="100%" >
				<tr>
					<td width="100%" valign="top"> 
						<gw:tree  id="tvDept" style="width:100%; height:500;overflow:auto;" onclicknode="treeItemOnclick()"  />
					</td>
				</tr>
			</table>			
		</td>
		<td width="70%" valign="top">
						<!-- Table2 contain detail grid -->
						<table id="RightBottomTB" width="100%" height="100%"  align="top" >
							<tr>
									<td width="100%" valign="top" > 
										<table width="100%">
											  <tr> 
												<td width="25%" align="right">Upper Organization</td>
												<td width="75%" colspan=5><gw:textbox id="txtUpperDept"  styles='width:100%'  onkeypress="checkKey()" csstype=""/></td>
											  </tr>
											  <tr> 
												<!--<td width="25%" align="right"><font color="black" ><b>Organization 
												  ID&nbsp;&nbsp;</b></font></td> -->
												  <td width="25%" align="right"><a title="Click here to show Organization summary" onclick="OnShowDeptID()" href="#tips" style="text-decoration : none; color=#0000FF">Organization ID</a></td>
												<td width="75%"  colspan=5><gw:textbox id="txtOrgId" maxlen="10" styles='width:100%'    onBlur="OnCheckOrgId()"  onkeypress="checkKey()" csstype="mandatory"/></td>
											  </tr>
											  <tr> 
												<td width="25%" align="right">Organization</td>
												<td width="75%"  colspan=5><gw:textbox id="txtOrgName" maxlen="100" styles='width:100%'  onkeypress="" csstype="mandatory"/></td>
											  </tr>
											  <tr> 
												<td width="25%" align="right">Local name</td>
												<td width="75%"  colspan=5><gw:textbox id="txtOrgLocalName" maxlen="100" styles='width:100%'  onkeypress="" csstype=""/></td>
											  </tr>
											  <tr> 
												<td width="25%" align="right">Foreign name</td>
												<td width="75%" colspan=5><gw:textbox id="txtOrgForeignName" maxlen="100" styles='width:100%'  onkeypress="" csstype=""/></td>
											  </tr>
											  <tr> 
												<td width="25%" align="right">Type&nbsp;&nbsp;</td>
												<td width="20%" > <gw:list id="lstOrgType" styles='width:100%' /> </td>
												<td width="10%" align="right"><font color="black" ><a title="Select Manager" onclick="OnShowManager()" href="#tips" style="text-decoration : none; color=#0000FF"><b>Manager&nbsp;</b></a></font></td>  
												<td width="12%"  ><gw:textbox id="txtManager_ID" maxlen="100" styles='width:100%'   csstype=""/></td>
											    <td width="30%"  ><gw:textbox id="txtManager_Name" maxlen="100" styles='width:100%'  csstype=""/></td> 
											    <td width="3%"  ><gw:imgBtn id="ibtnResetE" alt="Reset" img="Reset" text="Reset" onclick="OnReset()" /></td> 
											  </tr>
											  <tr> 
												<td width="25%" align="right">Start Date&nbsp;&nbsp;</td>
												<td width="20%" ><gw:datebox id="dtStartDate" maxlen=10 styles='width:31%'  lang="1" onchange = "OnCheckDate()" /></td>
												<td width="22%" colspan=2 align="right">Manager &nbsp;</td>  
												<td width="33%" colspan=2 ><gw:list id="lstManager_Kind" value="" styles='width:100%'> <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0071' order by code_nm")%>||</data> </gw:list ></td>
											    
											  </tr>
											  <tr> 
												<td width="25%" align="right">End Date&nbsp;&nbsp;</td>
												<td ><gw:datebox id="dtEndDate" maxlen=10 styles='width:31%'  lang="1" onchange = "OnCheckDate()" nullaccept/></td>
												<td width="22%" colspan=2 align="right">Pay Salary</td>  
												<td width="33%" colspan=2 ><gw:list id="lstPaySal" value="" styles='width:100%'> <data>|Y|Yes|N|No</data> </gw:list ></td>
											    
											  </tr>
											  <tr> 
												<td width="25%" align="right">Seq &nbsp;</td>
												<td width="25%" ><gw:textbox id="txtSeq" maxlen="10" styles='width:15%'  onkeypress="return Numbers(event)" csstype=""/></td>
                                                <td width="25%" colspan=2 align="right">ID VD</td>
												<td width="25%" colspan=2><gw:textbox id="txtID_VD" maxlen="10" styles='width:15%'  onkeypress="return Numbers(event)" csstype=""/></td>
											  </tr>
                                            <tr> 
												<td width="25%" align="right">Short Name</td>
												<td width="75%" colspan=5><gw:textbox id="txtShortName" maxlen="" styles='width:15%'  onkeypress="" csstype=""/></td>
											  </tr>
											  <tr> 
												<td width="25%" align="right">Cost Group</td>
												<td  width="25%" align="right">
                                                        <gw:list  id="lstCostGroup" value="" styles='width:100%' onChange="">
                                                        <data>
                                                            <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0092' order by code_nm")%>||
                                                        </data>
                                                        </gw:list >
                                                 </td>
                                                 <td colspan=2 width="25%" align="right">Cost Type</td>
												<td colspan=2  width="25%" align="right">
                                                        <gw:list  id="lstCostGroupKind" value="" styles='width:100%' onChange="">
                                                        <data>
                                                            <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0093' order by code_nm")%>||
                                                        </data>
                                                        </gw:list >
                                                </td>
											  </tr>
											  <tr> 
												<td width="25%" align="right"><a title="Click here to show cost center" onclick="" href="#tips" >Cost Center</td>
												<td width="75%" colspan=5><gw:textbox id="txtCostCenter" maxlen="" styles='width:100%'  onkeypress="" csstype=""/></td>
											  </tr>
											  <tr> 
												<td align="right">Remark&nbsp;&nbsp;</td>
												<td  colspan=4><gw:textbox id="txtareaRemark" maxlen="" styles='width:100%'  onkeypress="" csstype=""/></td>
											  </tr>
											  <tr> 
												<td align="right">Image&nbsp;&nbsp;</td>
												<td  colspan=4><gw:image id="imgFile" table_name="TCO_BPPHOTO" procedure="ES_INSERT_IMAGE"  view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:50%;height:100" /></td>
											  </tr>
										      
										</table>
									</td>			
							</tr>
						</table>
						<!-- End of Table2 -->		
		</td>
	</tr>	
</table>
<gw:textbox id="txtOrgPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtUpperOrgPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtCompanyPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtCountOrgId" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="idemp_pk" styles="display:none"/>
<gw:textbox id="txtManager_PK" styles="display:none"/>
<gw:textbox id="imagePK" maxlen="100" styles='width:100%;display:none' csstype="" />
<gw:textbox id="txtCost_Center_pk" styles="display:none"/>


</body>
</html>
