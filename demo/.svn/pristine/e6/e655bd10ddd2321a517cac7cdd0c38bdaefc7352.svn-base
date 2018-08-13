<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Incoming Entry</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var v_language = "<%=Session("SESSION_LANG")%>";
var flag;
var stt=0;
var GS_MASTER_PK = stt;
    GS_SLIP_NO   = ++stt;
    GS_STATUS    = ++stt;
    GS_SLIP_DT   = ++stt;
    GS_ORG_NM    = ++stt;

	
//'_PK|_REC_REQ_M_PK|Seq|Position|Job|Numbers|Sex|Salary|Reason|ALT Position|ALT Job|_ALT_EMP_PK|ALT Employee|Description'
	
  //'_PK|_REC_REQ_M_PK|_REC_REQ_D_PK|Seq|Position|Job|Criteria Name|Description|Request Information'
var tt =0;  
var G2_PK  = tt;
	G2_REC_REQ_M_PK = ++tt;
	G2_SEQ			= ++tt;
	G2_POSITION		= ++tt;
	G2_JOB			= ++tt;
	G2_CRITERIAL	= ++tt;
	G2_DESCRIPTION	= ++tt;
	G2_REQUEST_INFO = ++tt;
	
 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>";

    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------- 
    txtRequestName.SetEnable(false);
    txtApproveName.SetEnable(false);
	
    BindingDataList();    
    //----------------------------         
    //OnToggleGrid();

 }
 //==================================================================================
 
 function BindingDataList()
 { 
    var data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrgS.SetDataText(data);
	lstOrgS.value ="ALL";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	ChangeColorItem(lstOrgS.GetControl());
	ChangeColorItem(lstOrg.GetControl());
	
	lstSlipType.SetDataText((v_language=="ENG")?"|1|Recruit New|2|Alternative":"|1|Tuyển mới|2|Thay thế");
	lstSlipType.value = "1";
	
	lstLevelType.SetDataText((v_language=="ENG")?"|1|Nomal|2|Urgent|3|Secret":"|1|Bình thường|2|Khẩn gấp|3|Tuyệt mật");
	lstLevelType.value = "1";
	  
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0220' order by code")%>";
    grdSearchSpec.SetComboFormat(G2_CRITERIAL,t1);
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code")%>";
    grdSearchSpec.SetComboFormat(G2_POSITION,t1);
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code")%>";
    grdSearchSpec.SetComboFormat(G2_JOB,t1);
	t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	txtposition.SetDataText(t1);
	txtposition.value = "ALL";
	txtaltposition.SetDataText(t1);
	txtaltposition.value="ALL";
	
	t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0010', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
	txtjob.SetDataText(t1);
	txtjob.value = "ALL";
	txtaltjob.SetDataText(t1);
	txtaltjob.value = "ALL";
	
	t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0007', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
	txtsex.SetDataText(t1);
	txtsex.value="ALL";
	
 }
 function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "0066CC";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "FF4500";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                    }
                }                
            }
        }
}
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_hrrc00100_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtRequestName.text = "<%=Session("USER_NAME")%>";
            txtRequestPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //-------------------------------------------           
            flag = "view";        
        break;
		case 'Criteria':
			var irow=grdSearch.row;
			if (irow>=1)
			{
				var s_pos = txtposition.value;
				var s_job = txtjob.value;
				var s_m_pk = grdSearch.GetGridData(irow,GS_MASTER_PK);

				
				grdSearchSpec.AddRow();
				irow=grdSearchSpec.rows-1;
				grdSearchSpec.SetGridText(irow, G2_REC_REQ_M_PK, s_m_pk);
				grdSearchSpec.SetGridText(irow, G2_POSITION , s_pos);
				grdSearchSpec.SetGridText(irow, G2_JOB ,s_job);
				
			}
		break;
	}
} 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_hrrc00100.Call("SELECT");
        break;
		case 'grdMaster':
            if ( data_hrrc00100_1.GetStatus() == 20 && grdSearch.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_MASTER_PK );
                    }
                    flag = 'view' ;
                    data_hrrc00100_1.Call("SELECT");
                }                
            }
			else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_MASTER_PK );
                }
                
                flag = 'view' ;
                data_hrrc00100_1.Call("SELECT");
            }    
		break;
		case 'grdSearchSpec': 
			if ( grdSearch.row > 0 )
			{
				txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_MASTER_PK );
			}
			
			flag = 'view' ;
            data_hrrc00100_3.Call("SELECT");
        break;
    }
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
				if(confirm((v_language == "ENG")?"Do you want to save Request ?":"Bạn có muốn cập nhật yêu cầu tuyển dụng không?"))
				{
					data_hrrc00100_1.Call();
					flag='save';
				}
            }            
        break;

		case 'DetailSpec': 
			if(confirm((v_language == "ENG")?"Do you want to save Criteria ?":"Bạn có muốn cập nhật tiêu chí tuyển dụng không?"))
			{
				data_hrrc00100_3.Call();
			}
        break;
    }
}
function OnDelete(index)
{        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm((v_language == "ENG")?"Do you want to delete this slip?":"Bạn có muốn xóa phiếu này không?"))
            {
                flag='delete';
                data_hrrc00100_1.StatusDelete();
                data_hrrc00100_1.Call();
            }   
        break;
		case 'Criteria':
            if(confirm((v_language == "ENG")?"Do you want to delete this criteria?":"Bạn có muốn xóa tiêu chí này không?"))
            {
				grdSearchSpec.DeleteRow();
				data_hrrc00100_3.Call();
                  
            }            
        break;        
    }     
}
function OnShowPopup(obj1)
{
    var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			obj1.value = obj;
            
        }
}
function Validate()
{   
	if ( lstOrg.value =="ALL" )
	{
		alert("Please input organization!")
		return false;
	}
        
    //----------------
    return true;
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case "data_hrrc00100": 
            lbSearchRecords.text = grdSearch.rows - 1;
        break;
        case "data_hrrc00100_1": 

        
                //---------------------------- 
                OnSearch('grdSearchSpec');   
       
                            
        break;
		
		case "data_hrrc00100_2": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdSearchSpec.rows;i++)
                {
                    if ( grdSearchSpec.GetGridData( i, G2_REC_REQ_D_PK) == '' )
                    {
                        grdSearchSpec.SetGridText( i, G2_REC_REQ_M_PK, txtMasterPK.text);
						grdSearchSpec.SetGridText( i, G2_REC_REQ_D_PK, txtDetailPK.text);
                    } 
                }
                //----------------------------
                OnSave('DetailSpec');                
            }
            else
            { 
                //---------------------------- 
                OnSearch('grdSearchSpec');   
            }            
        break;
		case 'pro_hrrc00100':
            alert(txtReturnValue.text);
          
		    flag = 'view' ;
            data_hrrc00100_1.Call("SELECT");
	}
}
 //================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		
        case 'Request':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequestName.text = obj[2];
                txtRequestPK.text   = obj[0];
            }
        break;
		case 'Approve':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtApproveName.text = obj[2];
                txtApprovePK.text   = obj[0];
            }
        break;
	}
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to submit this Slip?'))
                {
                    pro_hrrc00100.Call();
                } 
            } 
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                         
        break;
    }    
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<gw:data id="pro_hrrc00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_hr_pro_hrrc00100" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_hrrc00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4" function="st_hr_sel_hrrc00100" > 
                <input> 
                    <input bind="lstOrgS" />
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="data_hrrc00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_hr_sel_hrrc00100_1"  procedure="st_hr_upd_hrrc00100_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" />                          
                     <inout  bind="txtRequestPK" />
                     <inout  bind="txtRequestName" />
					 <inout  bind="txtApprovePK" />
                     <inout  bind="txtApproveName" />
                     <inout  bind="lstOrg" />
                     <inout  bind="lstSlipType" />
                     <inout  bind="txtBudgetAMT" />
                     <inout  bind="lstLevelType" />
                     <inout  bind="dtStart" />
                     <inout  bind="dtFinish" />
                     <inout  bind="txtRemark" />
                     <inout  bind="lblStatus" />
					 <inout	 bind="txtposition"/>
					 <inout  bind="txtjob"/>
					 <inout  bind="txtnumber"/>
					 <inout  bind="txtsalary"/>
					 <inout  bind="txtaltposition"/>
					 <inout  bind="txtaltjob"/>
					 <inout  bind="txtsex"/>
					 <inout  bind="txtreason"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
   
		<gw:data id="data_hrrc00100_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7" function="st_hr_sel_hrrc00100_3"   procedure="st_hr_upd_hrrc00100_3"> 
                <input bind="grdSearchSpec">                    

                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdSearchSpec" /> 
            </dso> 
        </xml> 
    </gw:data>
 
    <!-------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="3">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="2" cellspacing="1">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td style="width: 25%" align="left" style="white-space:nowrap">Records :</td>
                            <td style="width: 25%" align="left" style="width:25%">
                                <gw:label id="lbSearchRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td style="width: 25%"></td>
                            <td style="width: 25%"><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" /></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td>
                                            Date
                                        </td>
                                        <td style="white-space: nowrap">
                                           <gw:datebox id="dtFrom" lang="1" />
                                            &nbsp; ~
										</td>
										<td align="right" style="white-space: nowrap">
                                            <gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(lstOrgS)" href="#tips"  >Organization</a>
                                        </td>
                                        <td colspan="3">
                                            <gw:list id="lstOrgS" styles='width:100%' csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                          
							                No.
                                        </td>
                                        <td colspan="3">                            
							                <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" 
								header="_PK|Slip No|Status|Date|Organization|" 
								format="0|0|0|4|0"
                                aligns="0|0|0|1|0" 
								defaults="|||||" 
								editcol="0|0|0|0|0" 
								widths="0|2500|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Status : </td>
                                        <td style="width:100px"><gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left'  /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Submit')" /></td>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtVoucherDate" lang="1" onchange="OnChangeDate()" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Request" onclick="OnPopUp('Request')" href="#tips" class="eco_link">Request By</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRequestName" styles="width:100%" />
                                            <gw:textbox id="txtRequestPK" styles="display:none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                           Slip No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Approve" onclick="OnPopUp('Approve')" href="#tips" class="eco_link">Approve By</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtApprovePK" styles="display:none" />
                                            <gw:textbox id="txtApproveName" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(lstOrg)" href="#tips"  >Organization</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstOrg" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            Slip Type
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Budget AMT
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtBudgetAMT"  type="number" format="#,###,###,###.##R" styles="width:100%" />
                                        </td>
                                        
                                        <td align="right" style="width: 15%">
                                            Level
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstLevelType" styles="width:100%" onchange="" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Period date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtStart" lang="1" />
                                            ~
                                            <gw:datebox id="dtFinish" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%; white-space: nowrap">
                                            Description
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width:15%" >
											Position
										</td>
										<td style="width:35%" >
											<gw:list id="txtposition" stye="width:100%;"/>
										</td>
										<td align="right" style="width:15%" >
											Alternative Position
										</td>
										<td style="width:35%" >
											<gw:list id="txtaltposition" style="width:100%"/>
										</td>
									</tr>
									<tr>
										<td align="left" style="width:15%" >
											Job
										</td>
										<td style="width:35%" >
											<gw:list id="txtjob" style="width:100%;"/>
										</td>
										<td align="right" style="width:15%" >
											Alternative Job
										</td>
										<td style="width:35%" >
											<gw:list id="txtaltjob" style="width:100%;"/>
										</td>
									</tr>
									<tr>
										<td align="left" style="width:15%" >
											Quantity Employee 
										</td>
										<td style="width:35%" >
											<gw:textbox id="txtnumber" style="width:100%;"/>
										</td>
										<td align="right" style="width:15%" >
											Sex
										</td>
										<td style="width:35%" >
											<gw:list id="txtsex" style="width:100%;"/>
										</td>
									</tr>
									<tr>
										<td align="left" style="width:15%" >
											Expection Salary
										</td>
										<td style="width:35%" >
											<gw:textbox id="txtsalary" type="number" format="#,###,###,###.##R" style="width:100%;"/>
										</td>
										<td align="right" style="width:15%" >
											Reason
										</td>
										<td style="width:35%" >
											<gw:textbox id="txtreason" style="width:100%;"/>
										</td>
									</tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
		<tr style="height: 70%">
            <td valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                            <td align="left" style="white-space:nowrap">
                                <table style="height:100%">
                                    <tr>
										<td>Criteria Information</td>
										<td style="width:10%" ></td>
                                        <td style="width:10%"></td>
                                        <td style="width:10%"></td>
                                        
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
										<td><gw:button id="btnNewCri" img="new" alt="New" text="New" onclick="OnAddNew('Criteria')" /></td>
										<td><gw:button id="btnSaveCri" img="save" alt="Save" text="Save" onclick="OnSave('DetailSpec')" /></td>
                                        <td><gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Criteria')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdSearchSpec' 
								header='_PK|_REC REQUEST PK|Seq|_Position|_Job|Criteria Name|Description|Request Information'
                                format='0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0'
                                check='|||||||' 
								editcol='0|0|0|0|0|0|1|1'
                                widths='1500|1500|500|1500|1500|2500|3000|2000'
                                sorting='T' styles='width:100%; height:100%' 
                                acceptnulldate='T' />
                            </td>
                        </tr>
                    </table>
                </div>
				
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtDetailPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:list id="lstTransType" styles='width:100%;display: none' />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
 
</html>
