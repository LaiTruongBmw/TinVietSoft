<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
var emp_pk_list;
var labour_pk_list;
var rpt_no=0;
//"No|Organization|Emp ID|Full Name|Join Date|Contract No|Create New|Probation Kind|_Old Kind of LC|Contract Kind|Start Probation|End Probation|Start Contract
//|End Contract|Get Salary|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|Times|_PK|Note|Approved"   
var stt =0;
var G1_NO = stt;
	G1_ORG_NAME 		= ++stt;
	G1_EMP_ID			= ++stt;
	G1_FULL_NAME		= ++stt;
	G1_JOIN_DATE		= ++stt;
	G1_CONTRACT_NO		= ++stt;
	G1_CREATE_NEW		= ++stt;
	G1_PROBATION_TYPE	= ++stt;
	G1_OLD_CONTRACT_TYPE 	= ++stt;
	G1_NEW_CONTRACT_TYPE	= ++stt;
	G1_START_PROBATION	= ++stt;
	G1_END_PROBATION	= ++stt;
	G1_START_CONTRACT	= ++stt;
	G1_END_CONTRACT		= ++stt;
	G1_GET_SALARY		= ++stt;
	G1_SALARY_AMT		= ++stt;
	G1_ALLOW1			= ++stt;
	G1_ALLOW2			= ++stt;
	G1_ALLOW3			= ++stt;
	G1_ALLOW4	= ++stt;		
	G1_ALLOW5	= ++stt;
	G1_ALLOW6	= ++stt;
	G1_ALLOW7	= ++stt;
	G1_ALLOW8	= ++stt;
	G1_ALLOW9	= ++stt;
	G1_ALLOW10	= ++stt;
	G1_ALLOW11	= ++stt;
	G1_ALLOW12	= ++stt;
	G1_EMP_PK	= ++stt;
	G1_TIMES	= ++stt;
	G1_PK		= ++stt;
	G1_NOTE		= ++stt;
	G1_APPROVED	= ++stt;
	

var flag_tab=1;
var check_init=0;

//"Select|Organization|_W-Group|Emp ID|Full Name|D.O.J|Contract No|Probation Kind|Contract Kind|Start Probation|End Probation
//|Start Contract|End Contract|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK
//|TIMES|_PK|_Contract Type|_Probation_Type|_Nation"   
var GR_SELECT = 0;
	GR_ORGANIZATION = 1;
	GR_WGROUP = 2;
	GR_EMP_ID = 3;
	GR_FULLNAME = 4;
	GR_DOJ = 5;
	GR_CONTRACT_NO = 6;
	GR_PROBATION_NO = 7;
	GR_CONTRACT_KIND = 8;
	GR_START_PROBATION = 9;
	GR_END_PROBATION = 10;
	GR_START_CONTRACT= 11;
	GR_END_CONTRACT = 12;
	GR_SALARY = 13;
	GR_ALLOW1 = 14;
	GR_ALLOW2 = 15;
	GR_ALLOW3 = 16;
	GR_ALLOW4 = 17;
	GR_ALLOW5 = 18;
	GR_ALLOW6 = 19;
	GR_ALLOW7 = 20;
	GR_ALLOW8 = 21;
	GR_ALLOW9 = 22;
	GR_ALLOW10 = 23;
	GR_ALLOW11 = 24;
	GR_ALLOW12 = 25;
	GR_EMP_PK = 26;
	GR_TIMES= 27;
	GR_PK = 28;
	GR_CONTRACT_TYPE = 29;
	GR_PROBATION_TYPE = 30;
	GR_NATION = 31;
//"Select|Organization|_W-Group|Emp ID|Full Name|_Job|D.O.J|Contract No|Probation Kind|Contract Kind|Start Probation|End Probation|Start Contract
//|End Contract|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|TIMES|_Contract Type"   	
var GRH_EMP_PK = 27;
	GRH_TIMES = 28;
	GRH_CONTRACT_TYPE = 29;
	
//"Select|_Department|Group|Emp ID|Full Name|Contract No|Contract Kind|Appendix No|Create New|Singature Date|Get Sal|Get Contract Dt
//|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|TIMES|_CONTRACT_PK|_APPENDIX_PK"   
var GRA_SELECT =0;
	GRA_EMP_PK =25;
	GRA_TIMES = 26;
	GRA_CONTRACT_PK = 27;
	GRA_APPEDIX_PK  = 28;
function BodyInit()
{
    
    //if (v_language!="ENG")
        System.Translate(document);
    OnToggle();
    grdLabourContract.GetGridControl().FrozenCols =5;
    grdLBReport.GetGridControl().FrozenCols =5;
    
    grdLabourContract.GetGridControl().ScrollTrack=true;
    grdLBReport.GetGridControl().ScrollTrack=true;
    
    BindingData();
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text= "<%=session("COMPANY_PK")%>";
	txtLang.text = "<%=Session("SESSION_LANG")%>";
	var v_language = "<%=Session("SESSION_LANG")%>";
    

    menu_id.text=System.Menu.GetMenuID();

    ChangeColorItem(lstOrg_Code_M.GetControl());
    ChangeColorItem(lstOrg_Code_R.GetControl());


    datCheck_View.Call();
}
//-------------------------------------------------------------------------
function BindingData()
{
    <%=CtlLib.SetGridColumnComboFormat( "grdLabourContract" , 7 , "select a.code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where a.id='HR0002' ORDER BY A.seq") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "grdLabourContract" , 8 , "select a.code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where a.id='HR0001' ORDER BY A.seq") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "grdLabourContract" , 9 , "select a.code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where a.id='HR0001' ORDER BY A.seq") %>; 
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00500', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport_R.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code_M.SetDataText(data);
	lstOrg_Code_M.value ="ALL";
	lstOrg_Code_R.SetDataText(data);
	lstOrg_Code_R.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstGrp_Code_M.SetDataText(data);
	lstGrp_Code_M.value ="ALL";
	lstGrp_Code_R.SetDataText(data);
	lstGrp_Code_R.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus1.SetDataText(data);
	lstStatus1.value ="A";
	lstStatus_R.SetDataText(data);
	lstStatus_R.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0002', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstKindPB_M.SetDataText(data);
	lstKindPB_M.value ="ALL";
	lstKindPB_R.SetDataText(data);
	lstKindPB_R.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstKindLB_M.SetDataText(data);
	lstKindLB_M.value ="ALL";
	
	lstKindLB_R.SetDataText(data);
	lstKindLB_R.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE3('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstKindLB_Set.SetDataText(data);    
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST3('HREM00500', '1', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstSelectDate_M.SetDataText(data);
	lstSelectDate_R.SetDataText(data);
}

//-----------------------------------------------

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

//---------------------------------------------------------------------------
function OnShowPopup(n)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {txtUpperOrg.text=obj;
        if(n==1)
            {  txtActive_tab.text="1";
            lstOrg_Code_M.value=obj;
			onChange_org(1,lstOrg_Code_M);
            }
        else if(n==2)
            {txtActive_tab.text="2";
            lstOrg_Code_R.value=obj;
			onChange_org(2,lstOrg_Code_R);
            }
        else if(n==3)
            {txtActive_tab.text="3";
            lstOrg_Code_P.value=obj;
			onChange_org(3,lstOrg_Code_P);
			}
        else if (n==4)
            {txtActive_tab.text="4";
            lstOrg_Code_A.value=obj;    
			onChange_org(4,lstOrg_Code_A);
            }      
        else
            {txtActive_tab.text="5";
            lstOrg_Code_His.value=obj;    
			onChange_org(5,lstOrg_Code_His);
            }                           
            
    
    }
    
}
//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl();
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//-------------------------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
    {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnSave_A.style.display = "none";
            ibtnSave_P.style.display = "none";

            ibtnDelete.style.display = "none";
            ibtnDelete_A.style.display = "none";
        }
        datAllowance.Call();
    }
   else if (obj.id=="datAllowance")
   {
        
        BindingCol(grdLabourContract,16);
        BindingCol(grdLBReport,14);
        
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
		else
		{
			check_init=1;
		}
        
   }
   else if (obj.id=="datLabourContractManage")
   {
        lblRecord_M.text=grdLabourContract.rows -1 ;
        chkCheckCreate.value='F';
        chkGetSalary.value='F';     
        
	   for(var i=1 ; i< grdLabourContract.rows ;i++)
		{   
			if( grdLabourContract.GetGridData(i,28)=='-1') 
				grdLabourContract.SetCellBgColor(i,0,i,28,0xFFEEFF);
		}   
		//auto_resize_column(grdLabourContract, 0,grdLabourContract.cols-1,9);
   }
   else if (obj.id=="datLabourContractReport")
   {
        lblRecord_R.text=grdLBReport.rows -1 ;
        chkCheckReport.value='F';
		auto_resize_column(grdLBReport, 0,grdLBReport.cols-1,9);
		for(var i=1 ; i< grdLabourContract.rows ;i++)
		{   
			if( grdLabourContract.GetGridData(i,28)=='-1') 
				grdLabourContract.SetCellBgColor(i,0,i,28,0xFFEEFF);
		}  
   }
   else if (obj.id=="datAppendixContract")
   {
        lblRecord_A.text=grdAppendix.rows -1 ;
   }
   else if (obj.id=="datLabourContractHis")
   {
        lblRecord_H.text=grdLBHist.rows -1 ;
        
   }
   else if (obj.id=="datLabourContractPre")
   {
        lblRecord_P.text=grdLBPreparation.rows -1 ;
        
   }  
   else if (obj.id=="datUser_info")
   {
        lstOrg_Code_M.SetDataText(txtDeptData.text);
        lstOrg_Code_R.SetDataText(txtDeptData.text);
        txtDept.text=lstOrg_Code_M.value;

        ChangeColorItem(lstOrg_Code_M.GetControl());
        ChangeColorItem(lstOrg_Code_R.GetControl());

        onChange_org(0,lstOrg_Code_M);
   }
   else if (obj.id=="datWorkGroup_info")
   {
		switch (flag_tab) 
		{
			case 0:
			{
				lstGrp_Code_M.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_M.value ="ALL";
				lstGrp_Code_R.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_R.value ="ALL";
				
				break;
			}
			case 1:
			{
				lstGrp_Code_M.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_M.value ="ALL";
				break;
			}	
			case 2:
			{
				lstGrp_Code_R.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_R.value ="ALL";
				break;
			}
			
			case 4:
			{
				lstGrp_Code_A.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_A.value ="ALL";
				break;
			}
            case 5:
			{
				lstGrp_Code_His.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_His.value ="ALL";
				break;
			}
		}
		check_init=1;
		
   }
   else if (obj.id=="datLBReport")
   {
        datFind_Report.Call();
   }
   else if (obj.id=="datLBHisReport")
   {
        datFind_HisReport.Call();
   }
   else if(obj.id == "datFind_Report")
   {	
		var url;
		if(txtReportCode_tmp.text =="14" ||txtReportCode_tmp.text =="19") //current contract
		{	
			if(lstReport_R.value =="16")
			{
				url =System.RootURL +  txtReport_tmp.text +'?emp_pk=' + emp_pk_list_his +'&appendix_type=0' + '&contract_type=' + txtContract_Type.text;      
			}
			else 
				url =System.RootURL + txtReport_tmp.text+'?p_contract_pk=' + contract_pk_list ;                   
		}
		else if(txtReportCode_tmp.text =="15") //list contract
		{ 
			url =System.RootURL + txtReport_tmp.text+'?p_tco_org_pk=' + lstOrg_Code_R.value + '&p_emp_search=' + txtEmployee_R.text + '&p_probation_type=' + lstKindPB_R.value + '&p_contract_type=' + lstKindLB_R.value
            + '&p_select_date=' + lstSelectDate_R.value + '&p_from_date=' + dtFrom_Date_R.value + '&p_to_date=' + dtTo_Date_R.value + '&p_status=' + lstStatus_R.value + '&p_lang=' + v_language ;
		}
		
		
		window.open(url);
   }
   else if (obj.id=="datFind_HisReport")
   {
        var url;
        //alert(rpt_no);
        //alert(txtReport_tmp.text);       
        switch(rpt_no)
        {
            case 1: //history report
                    //txtReport_tmp.text="rpt_labour_contract.aspx";                    
                      url =System.RootURL + '/reports/ch/ae/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list+'&appendix_type=0' + '&contract_type=' + txtContract_Type.text;                   
                    break;
                  
            case 2: //History labour contract list
                url =System.RootURL + '/reports/ch/ae/'+txtReport_tmp.text+'?p_tco_dept_pk=' + lstOrg_Code_R.value + '&p_thr_group_pk=' + lstGrp_Code_R.value  + '&p_chktemp=' + lstTemp_R.value + '&p_temp=' + txtEmployee_R.text + '&p_probation_type=' + lstKindPB_R.value + '&p_from_begin_probation=' + dtFromBProbation_R.value;
                url=url + '&p_to_begin_probation=' + dtToBProbation_R.value + '&p_from_end_probation=' + dtFromEProbation_R.value + '&p_to_end_probation=' + dtToEProbation_R.value + '&p_contract_type=' + lstKindLB_R.value +  '&p_from_begin_contract=' + dtFromBContract_R.value +  '&p_to_begin_contract=' + dtToBContract_R.value + '&p_from_end_contract=' + dtFromEContract_R.value + '&p_to_end_contract=' + dtToEContract_R.value + '&p_status=' + lstStatus_R.value ;
                break;
              
            case 7:
                url =System.RootURL + '/reports/ch/ae/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list + '&appendix_type=1';;                 
                break; 
            case 8: //appendix report posco LT
                    //txtReport_tmp.text="rpt_labour_contract.aspx";
                    url =System.RootURL + '/reports/ch/ae/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list+'&appendix_type=0' + '&contract_type=' + txtContract_Type.text;
                    break;  
            case 9: //current foreigner report
                    //txtReport_tmp.text="rpt_labour_contract.aspx";
                    url =System.RootURL + '/reports/ch/ae/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list+'&appendix_type=0' + '&contract_type=' + txtContract_Type.text;
                    break;             
         }       
        window.open(url);    
   }
   
    else if (obj.id=="datLabourContractHis2")
   {
        lblRecord_His.text=grdLBHisReport.rows -1 ;
        
   }
}

function onChange_org(tab,obj)
{
	flag_tab=tab;
	
	txtOrg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}

//-------------------------------------------------
function OnSetLBType(obj_grd,obj_col)
{
    var tmp;
    tmp=lstKindLB_Set.value;    
    var ctrl = obj_grd.GetGridControl();
	for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		{
			var row = ctrl.SelectedRow(i);
			if ( row > 0 )
			{		
				obj_grd.SetGridText(row,obj_col,tmp);
			}	
		}
}
//--------------------------------------------------
function BindingCol(obj,icol)
{
    obj.SetGridText(0,icol,lblA1.text);
    obj.SetGridText(0,icol+1,lblA2.text);
    obj.SetGridText(0,icol+2,lblA3.text);
    obj.SetGridText(0,icol+3,lblA4.text);
    obj.SetGridText(0,icol+4,lblA5.text);
    obj.SetGridText(0,icol+5,lblA6.text);
    obj.SetGridText(0,icol+6,lblA7.text);
    obj.SetGridText(0,icol+7,lblA8.text);
	obj.SetGridText(0,icol+8,lblA9.text);
	obj.SetGridText(0,icol+9,lblA10.text);
	obj.SetGridText(0,icol+10,lblA11.text);
	obj.SetGridText(0,icol+11,lblA12.text);
    obj.GetGridControl().ColHidden(icol)=!(Number(lblDisplay1.text));
    obj.GetGridControl().ColHidden(icol+1)=!(Number(lblDisplay2.text));
    obj.GetGridControl().ColHidden(icol+2)=!(Number(lblDisplay3.text));
    obj.GetGridControl().ColHidden(icol+3)=!(Number(lblDisplay4.text));
    obj.GetGridControl().ColHidden(icol+4)=!(Number(lblDisplay5.text));
    obj.GetGridControl().ColHidden(icol+5)=!(Number(lblDisplay6.text));
    obj.GetGridControl().ColHidden(icol+6)=!(Number(lblDisplay7.text));
    obj.GetGridControl().ColHidden(icol+7)=!(Number(lblDisplay8.text));
	obj.GetGridControl().ColHidden(icol+8)=!(Number(lblDisplay9.text));
	obj.GetGridControl().ColHidden(icol+9)=!(Number(lblDisplay10.text));
	obj.GetGridControl().ColHidden(icol+10)=!(Number(lblDisplay11.text));
	obj.GetGridControl().ColHidden(icol+11)=!(Number(lblDisplay12.text));
	
}

//------------------------------------------------
function OnToggle()
{
    
    if(imgArrow.status == "expand")
    {
        tblHist.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/iconmaximize.gif";
        tblReport.style.height="100%";
        tblMainHist.style.height="80%";
        tblHist.style.height="0%";
        
    }
    else
    {
        tblHist.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/close_popup.gif";
        tblReport.style.height="100%";
        tblMainHist.style.height="40%";
        tblHist.style.height="40%";
        if (grdLBReport.row>0)
        {
            txtEmp_PK.text=grdLBReport.GetGridData(grdLBReport.row,22);
            datLabourContractHis.Call("SELECT");
        }
        
    }
    
}

//-----------------------------------------------------
function OnSearch(obj_data)
{
	if(check_init==1)
	{
		obj_data.Call("SELECT");
	}		
        
}
//-----------------------------------------------------
function OnSave(objid)
{
	if(check_init==1)
	{
		switch (objid)
		{
			case 1:
				if(confirm("Do you want to save contract ?" + "\n" + "Bạn có muốn cập nhật hợp đồng không?") &&  CheckBeforeSave())
				{
					datLabourContractManage.Call();
				}
				break;
			case 2:
				if(confirm("Do you want to save contract ?" + "\n" + "Bạn có muốn cập nhật hợp đồng không?") )
				{
					datLabourContractPre.Call();
				}
				break;
			case 3:
				if(confirm("Do you want to save appendix contract ?" + "\n" + "Bạn có muốn cập nhật phụ lục hợp đồng không?") &&  CheckBeforeSave())
				{
					datAppendixContract.Call();
				} 
				break;
				 
		}
	}	
}

//---------------------------------------------------------
function OnDelete()
{
	if(check_init==1)
	{
		if(confirm("Do you want to delete this contract ?" + "\n" + "Bạn có muốn xóa hợp đồng này không?"))
		{
			grdLabourContract.DeleteRow();
			datLabourContractManage.Call();
		}
	}	
}
//---------------------------------------------------------
function OnDelete_A()
{
    if(confirm("Do you want to delete this appendix contract ?" + "\n" + "Bạn có muốn xóa phụ lục hợp đồng này không?"))
    {
        grdAppendix.DeleteRow();
		datAppendixContract.Call();
    }
}
//--------------------------
function CheckBeforeSave()
{
    var p_create_new;
    var p_old_contract_type;
    var p_new_contract_type,p_begin_pro,p_end_pro,p_begin_con,p_end_con;
    for(var i=1;i<grdLabourContract.rows;i++)
    {
        if (grdLabourContract.GetRowStatus(i)==16)
        {
            p_join_dt=grdLabourContract.GetGridData(i,G1_JOIN_DATE); //column create new
            p_join_dt=String(p_join_dt.substr(6,4)) + String(p_join_dt.substr(3,2)) + String(p_join_dt.substr(0,2));
            p_create_new=grdLabourContract.GetGridData(i,G1_CREATE_NEW); //column create new
            p_old_contract_type=grdLabourContract.GetGridData(i,G1_OLD_CONTRACT_TYPE); //column old_contract_type
            p_new_contract_type=grdLabourContract.GetGridData(i,G1_NEW_CONTRACT_TYPE); //column new_contract_type
            p_begin_pro=grdLabourContract.GetGridData(i,G1_START_PROBATION); //column begin probation
            p_end_pro=grdLabourContract.GetGridData(i,G1_END_PROBATION); //column end probation
            p_begin_con=grdLabourContract.GetGridData(i,G1_START_CONTRACT); //column begin contract
            p_end_con=grdLabourContract.GetGridData(i,G1_END_CONTRACT); //column end contract
            if (Number(p_join_dt) > Number(p_begin_pro) || Number(p_join_dt) > Number(p_end_pro) || ( Number(p_join_dt) > Number(p_begin_con) && p_begin_con !='') || (Number(p_join_dt) > Number(p_end_con) && p_end_con !=''))
            {
                alert("Join Date can not larger than Contract signed date at row " + i + "\n" + "Ngày vào không thể lớn hơn ngày ký hợp đồng tại dòng " + i );
                return false;
            }
            if ( Number(p_begin_pro) > Number(p_end_pro)  || (Number(p_begin_con) > Number(p_end_con)  && p_end_con !='') )
            {
                alert("Start Date can not larger than End Date at row " + i + "\n" + "Ngày bắt đầu ký hợp đồng không thể nhỏ hơn ngày kết thúc tại dòng " + i );
                return false;
            }
            if ((p_create_new==-1) && (p_old_contract_type == p_new_contract_type ) && p_new_contract_type !='05')
            {
                alert("Have to choose another contract type if you want to create new contract at row " + i + "\n" + "Để tạo hợp đồng mới bạn phải chọn loại hợp đồng mới tại dòng " + i );
                return false;
            }
            else if ((p_create_new==0) && (p_old_contract_type != p_new_contract_type))
            {
                alert("Have to choose old contract type if you wan't to create new contract at row " + i + "\n" + "Phải chọn hợp đồng cũ nếu không tạo hợp đồng mới tại dòng " + i );
                return false;
            }
        }
    }
    return true;
}

//------------------------------------------------------------------------------------
function OnSetGrid(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}
function OnReport(obj)
{
	if(obj=="R")
	{   
		if(lstReport_R.value =="14" || lstReport_R.value =="19")
		{
			if (FindSameType(grdLBReport,GR_CONTRACT_TYPE)==false)
			{
				alert("Have to print the same type of report!" + "\n"  + "Phải chọn cùng một kiểu của loại hợp đồng!");
				return;
			}
			else
			{
				emp_pk_list="";
				contract_pk_list="";
				
				for (var i=1;i<=grdLBReport.rows-1;i++)
				{
					if (grdLBReport.GetGridData(i,0)=="-1")
					{
						emp_pk_list = emp_pk_list + grdLBReport.GetGridData(i,GR_EMP_PK) + ",";
						contract_pk_list = contract_pk_list + grdLBReport.GetGridData(i,GR_PK) + ",";
						
						txtContract_Type.text=grdLBReport.GetGridData(i,GR_CONTRACT_TYPE);
						txtProbation_Type.text=grdLBReport.GetGridData(i,GR_PROBATION_TYPE);
						
						if(lstReport_R.value =="14") // Labour contract.
						{
							if(grdLBReport.GetGridData(i,GR_CONTRACT_TYPE) == '01')
							{
								alert("You don't have choose probation contract to print. \n Bạn không được chọn hợp đồng thử việc để in")
								return;
							}
						}
						else if(lstReport_R.value =="19") //Probation contract.
						{
							if(grdLBReport.GetGridData(i,GR_CONTRACT_TYPE) != '01')
							{
								alert("You have only choose probation contract to print. \n Bạn chỉ được chọn hợp đồng thử việc để in")
								return;
							}
						}
					}   
				}
				if (emp_pk_list=="")
				{
					alert((v_language =="ENG")?"Please choose employees to print":"Hãy chọn nhân viên để xuất báo cáo");
					return;
				}
				else
				{
					emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
					contract_pk_list= contract_pk_list.substr(0,contract_pk_list.length-1);
					txtOrg_tmp.text=lstOrg_Code_R.value; 
					
				}
			}    
			txtReportCode_tmp.text = lstReport_R.value;
		}
		else if(lstReport_R.value =="16")  // history of contract
		{
		
			emp_pk_list_his="";
			for (var i=1;i<=grdLBHist.rows-1;i++)
			{
				if (grdLBHist.GetGridData(i,0)=="-1")
				{
					emp_pk_list_his = emp_pk_list_his + grdLBHist.GetGridData(i,GRH_EMP_PK) + ",";
					txtContract_Type.text=grdLBHist.GetGridData(i,GRH_CONTRACT_TYPE);						
				}   
			}
			
			if (emp_pk_list_his=="")
				alert((v_language =="ENG")?"Please choose employees to print":"Hãy chọn nhân viên để xuất báo cáo");
			else
			{
				emp_pk_list_his=emp_pk_list_his.substr(0,emp_pk_list_his.length-1);
				txtOrg_tmp.text=lstOrg_Code_R.value;
			}
			if(txtContract_Type.text =="01")
			{
				txtReportCode_tmp.text ="19"  // probation contract
			}
			else txtReportCode_tmp.text ="14"  // labour contract
		}
		else if(lstReport_R.value == "15")
		{
			txtReportCode_tmp.text ="15";
		}
		txtOrg_tmp.text = lstOrg_Code_R.value; 
		
	}
	
	datFind_Report.Call();
}

//-------------------------------------------------------------------------------------
function FindSameType(obj_grid,col) //check report of grid just one labour contract type
{
    var irow;
    irow=0;
    for (var i=1;i<=obj_grid.rows-1;i++)
    {
        if (obj_grid.GetGridData(i,0)=="-1")
        {
            if (obj_grid.GetGridData(i,col) !=obj_grid.GetGridData(irow,col) && irow !=0)
                return false;
            irow=i;
            
        }
    }
    return true;
    
}
//-----------------------------------labour contract report -------------------------

function OnHistLabourContract()
{
    if (imgArrow.status=="expand")
    {
        txtEmp_PK.text=grdLBReport.GetGridData(grdLBReport.row,26);
        datLabourContractHis.Call("SELECT");
    }
}
//-------------------------check select column of grid labour contract history-------------------
function AfterSelectHist() 
{
    
        if (grdLBHist.col==0)
        {
            var i,icurrow;
            icurrow=grdLBHist.row;
            if ( grdLBHist.GetGridData(icurrow,0)==-1)
                for (i=1;i<=grdLBHist.rows-1;i++)
                    if (icurrow!=i) 
                        grdLBHist.SetGridText(i,0,"0");
        }
    
}
//------------Appendix Contract----------------
function OnHistAppendixContract()
{
    if (imgArrow_A.status=="expand")
    {
		txtEmp_PK_A.text=grdAppendix.GetGridData(grdAppendix.row,25);
        txtAppendix_Times_A.text=grdAppendix.GetGridData(grdAppendix.row,26); 
        txtContract_Type_A.text = grdAppendix.GetGridData(grdAppendix.row,27);
        datAppendixContractHis.Call("SELECT");
    }
}

function OnSetDate()
{
	if(idSetDate.value=="")
	{
		alert((v_language =="ENG")?"Signature date cannot be blank":"Ngày phê duyệt chưa được nhập");
		return;
	}
	var ctrl = grdAppendix.GetGridControl();    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    grdAppendix.SetGridText(row,9,idSetDate.value);
			    }
		    }
	}	
	
}

function OnGetContractDate()
{
	var ctrl = grdAppendix.GetGridControl();  
	var is_check=0;
	if(chkGetContactDate.value=='T')
		is_check=-1;
	else
		is_check=0;
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    grdAppendix.SetGridText(row,11,is_check);
			    }
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
//-------------------------------------------------------------------------------------
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-------------------data control----------------------->
<gw:data id="datCheck_View" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_VIEW"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_ALLOWANCE_LB" > 
                <input>
                    <input bind="txtAllowance" /> 
                    <input bind="txtCompany_pk" /> 
                </input> 
                <output>
                    <output bind="lblA1" />
                    <output bind="lblA2" />
                    <output bind="lblA3" />
                    <output bind="lblA4" />
                    <output bind="lblA5" />
                    <output bind="lblA6" />
                    <output bind="lblA7" />
                    <output bind="lblA8" />
					<output bind="lblA9" />
					<output bind="lblA10" />
					<output bind="lblA11" />
					<output bind="lblA12" />
                    <output bind="lblDisplay1" />
                    <output bind="lblDisplay2" />
                    <output bind="lblDisplay3" />
                    <output bind="lblDisplay4" />
                    <output bind="lblDisplay5" />
                    <output bind="lblDisplay6" />
                    <output bind="lblDisplay7" />
                    <output bind="lblDisplay8" />
					<output bind="lblDisplay9" />
					<output bind="lblDisplay10" />
					<output bind="lblDisplay11" />
					<output bind="lblDisplay12" />					
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datLBReport" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_LB_REPORT" > 
                <input>
                    <input bind="txtProbation_Type" /> 
                    <input bind="txtContract_Type" /> 
                    <input bind="txtForeignerYN" />                     
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datLBHisReport" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_LB_REPORT" > 
                <input>
                    <input bind="txtProbation_Type" /> 
                    <input bind="txtContract_Type" /> 
                    <input bind="txtForeignerYN" />                     
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-----------------------tab labour contract manage------------------------------->
<gw:data id="datLabourContractManage" onreceive="OnDataReceive(this)"  > 
        <xml> 		
            <dso  type="grid" parameter="2,4,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32" function="ST_HR_SEL_HREM00500_0 " procedure="ST_HR_UPD_HREM00500_0"> 
                <input bind="grdLabourContract">
					<input bind="txtEmployee_M" />
					<input bind="lstSelectDate_M" />
					<input bind="dtFrom_Date_M" />
					<input bind="dtTo_Date_M" />
                    <input bind="lstOrg_Code_M" /> 
                    <input bind="lstKindPB_M" /> 
                    <input bind="lstKindLB_M" />
                    <input bind="lstStatus1" />
                </input> 
                <output bind="grdLabourContract"/>
            </dso> 
        </xml> 
</gw:data>
<!-----------------------tab labour contract report------------------------------->
<gw:data id="datLabourContractReport" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HREM00500_1" > 
                <input bind="grdLBReport">
					<input bind="txtEmployee_R" /> 
					<input bind="lstSelectDate_R" />
					<input bind="dtFrom_Date_R" />
					<input bind="dtTo_Date_R" />
                    <input bind="lstOrg_Code_R" /> 
                    <input bind="lstKindPB_R" /> 
					<input bind="lstKindLB_R" />
                    <input bind="lstStatus_R" />
					<input bind="txtLang" />
                </input> 
                <output bind="grdLBReport"/>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------------------------>
<gw:data id="datLabourContractHis" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HREM00500_2" > 
                <input bind="grdLBHist">
                    <input bind="txtEmp_PK" /> 
                </input> 
                <output bind="grdLBHist"/>
            </dso> 
        </xml> 
</gw:data>



<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReportCode_tmp" /> 
                    <input bind="txtOrg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------>
<gw:data id="datFind_HisReport" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_FIND_REPORT_2" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                    <input bind="txtOrg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------>


<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtOrg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!--------------------main table----------------------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate=""  > 

    <table name="Management Contract" id="management" width="100%" cellpadding="0"  cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr  style="width:100%;height:100%" valign="top">
            <td  style="width:100%;height:100%">
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
				<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
					<tr style="border:1;width:100%;height:4%" valign="center" >
						<td colspan=70 width="70%" >
							<fieldset style="padding: 5" >
							<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 width="18%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=25 width="25%" style="border:0" align="left">
										<gw:textbox id="txtEmployee_M" onenterkey   ="OnSearch(datLabourContractManage)" styles='width:100%'/>
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 style="border:0" width="12%" align="left" >
										Probation Type
									</td>
									<td colspan=25 style="border:0" width="20%"  align="left" >
										<gw:list id="lstKindPB_M"  value="ALL" styles='width:100%' />
									</td>
									
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 width="18%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips"  >
										Organization</a>
									</td>
									<td colspan=25 width="25%" style="border:0"  align="left" >
										<gw:list  id="lstOrg_Code_M" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(1,lstOrg_Code_M);" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 style="border:0" width="18%" align="left" >
										Contract Type
									</td>
									<td colspan=25 width="25%" style="border:0" align="left">
										<gw:list id="lstKindLB_M"  value="ALL" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 width="18%" style="border:0"  align="left" >
										<gw:list  id="lstSelectDate_M" value='1' maxlen = "100" styles='width:80%' onchange="" />
									</td>
									<td colspan=25 width="25%" style="border:0" align="left">
										<gw:datebox id="dtFrom_Date_M" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_Date_M" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=18 style="border:0" width="12%" align="left" >
										Status
									</td>
									<td colspan=25 style="border:0" width="20%"  align="left" >
											
										<gw:list id="lstStatus1"  value="A" styles='width:100%' />
									</td>
									
								</tr>
							</table>
							</fieldset>
						</td>
						<td colspan=2 width="2%" >
						</td>
						<td colspan=28 width="28%" >
							<fieldset style="padding: 5" style="background:#F3FAFD">
							<legend ><font class="eco_blue" ><b>Set Data</b></font></legend>
							<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0" >
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=40 width="40%" style="border:0"   >
										Contract Type
									</td>
									<td colspan=40 width="40%" style="border:0"   >
										<gw:list id="lstKindLB_Set"  value="ALL" styles='width:100%' />
									</td>
									<td colspan=20 width="20%" style="border:0"   >
										<gw:button img="set" text= "Set Grid" id="ibtnSet_M"   alt="Set Grid"  onclick="OnSetLBType(grdLabourContract,G1_NEW_CONTRACT_TYPE)"/>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=30 width="30%" style="border:0"   >
										Create Y/N
									</td>
									<td colspan=20 width="20%" style="border:0"   >
										<gw:checkbox id="chkCheckCreate" value="F" onclick="OnSetGrid(chkCheckCreate,grdLabourContract,G1_CREATE_NEW)" ></gw:checkbox >
									</td>
									<td colspan=30 width="30%" style="border:0"   >
										Salary
									</td>
									</td>
									<td colspan=20 width="20%" style="border:0"   >
										<gw:checkbox id="chkGetSalary" value="F" onclick="OnSetGrid(chkGetSalary,grdLabourContract,G1_GET_SALARY)" ></gw:checkbox >
									</td>
								</tr>
								
							</table>
						</td>
					</tr>
				</table>
				</div>	
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:0px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						
						<tr style="border:0;width:100%;height:4%" valign="center"  >
							<td colspan=5 width="5%" style="border:0"   >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord_M"   />
							</td>
							<td colspan=70 width="70%" style="border:0"> 
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" text="Search" id="ibtnSearch_M"   alt="Search"  onclick="OnSearch(datLabourContractManage)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" text="Save" id="ibtnSave"    alt="Save"  onclick="OnSave(1)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="delete" text="Delete" id="ibtnDelete"   alt="Delete"  onclick="OnDelete()"/>
							</td>
						</tr>
					</table>
				</div>
				
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:80%">
					<table width="100%" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                            <gw:grid   
						        id="grdLabourContract"  
						        header="No|Organization|Emp ID|Full Name|Join Date|Contract No|Create New|Probation Kind|_Old Kind of LC|Contract Kind|Start Probation|End Probation|Start Contract|End Contract|Get Salary|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|Times|_PK|Note|_Approved"   
						        format="0|0|0|0|4|0|3|2|2|2|4|4|4|4|3|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|3"  
						        aligns="2|0|1|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0"  
						        defaults="||||||||||||||||||||||||||||||||"  
						        editcol="0|0|0|0|0|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|1|1"  
						        widths="500|2500|1200|2500|1200|1500|1200|1500|2500|1200|1500|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|0|0|0|1500|1500|1500|1500|1500|1500"  
						        styles="width:100%; height:100%"   
						        sorting="T"  
								autosize="T"
						        acceptNullDate
						        /> 
                        </td>
                    </tr>
					</table>
				</div>	
            </td>
        </tr>
    </table>
    <table name="Reports Contract" id="tblReport"  width="100%" cellpadding="0"  cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;;border-bottom:1px solid #62ac0d;width:100%;height:15%" >
					
					<fieldset style="padding: 5" >
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:textbox id="txtEmployee_R" onenterkey   ="OnSearch(datLabourContractReport)" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Probation Type
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list id="lstKindPB_R"  value="ALL" styles='width:100%' />	
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
							</td>
							<td colspan=20 width="20%" style="border:0"> 
							</td>
						</tr>
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips"  >
								Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg_Code_R" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(2,lstOrg_Code_R);" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Contract Type
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list id="lstKindLB_R"  value="ALL" styles='width:100%' />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" ></td>
							<td colspan=20 width="20%" style="border:0"> 
								
							</td>
						</tr>
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								<gw:list  id="lstSelectDate_R" value='1' maxlen = "100" styles='width:80%' onchange="" />
							</td>
							<td colspan=9 width="9%" style="border:0" align="left">
								<gw:datebox id="dtFrom_Date_R" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0" align="left"  >
								~
							</td>
							<td colspan=9 width="9%" style="border:0" align="left">
								<gw:datebox id="dtTo_Date_R" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Status
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list id="lstStatus_R"  value="A" styles='width:100%' />
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								
							</td>
							<td colspan=18 width="18%" style="border:0" align="left">
								
							</td>
							<td colspan=2 width="2%" style="border:0" align="left">
								<img status="expand" id="imgArrow" src="../../../../system/images/iconmaximize.gif" alt="Show history"  style="cursor:hand" onclick="OnToggle()"  />
							</td>
						</tr>
					</table>
					</fieldset>
				</div>
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center"  >
							<td colspan=2 width="2%" style="border:0"   >
								<gw:checkbox id="chkCheckReport" value="F" onclick="OnSetGrid(chkCheckReport,grdLBReport,0)" ></gw:checkbox >
							</td>
							<td colspan=5 width="5%" style="border:0"   >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord_R"   />
							</td>
							<td colspan=63 width="63%" style="border:0"> 
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="search" text="Search" id="ibtnSearch_R"   alt="Search"  onclick="OnSearch(datLabourContractReport)"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport('R')"/>
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport_R" styles="color:blue;width:100%" onchange=""/> 
							</td>
						</tr>
					</table>
				</div>
				<div id="tblMainHist" style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:80%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
									id="grdLBReport"  
									header="Select|Organization|_W-Group|Emp ID|Full Name|D.O.J|Contract No|Probation Kind|Contract Kind|Start Probation|End Probation|Start Contract|End Contract|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|TIMES|_PK|_Contract Type|_Probation_Type|_Nation"   
									format="3|0|0|0|0|4|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0|0|0"  
									aligns="1|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									acceptNullDate
									defaults="||||||||||||||||||||||||||||||||"  
									editcol="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="800|1700|1700|1200|2500|1200|2000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0"  
									styles="width:100%; height:100%"   
									sorting="T"
									autosize="T"									
									oncellclick = "OnHistLabourContract()" /> 

							</td>
						</tr>
				   </table> 
				</div>   
				<div id="tblHist" style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:80%">
				   <table cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1 >				
						<tr style="width:100%;height:10%">		
							<td width="90%" align="right" style="border:0"><gw:label id="lblRecord_H" text="" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12"></gw:label></td>													
							<td width="10%"  style="border:0" align="right">		
								
							</td>
						</tr>
					   
						<tr style="width:100%;height:90%">
							<td colspan=100 >		
							   <gw:grid   
									id="grdLBHist"  
									header="_Select|Organization|_W-Group|Emp ID|Full Name|_Job|D.O.J|Contract No|Probation Kind|Contract Kind|Start Probation|End Probation|Start Contract|End Contract|Salary|ALLOW1|ALLOW2|ALLOW3|ALLOW4|ALLOW5|ALLOW6|ALLOW7|ALLOW8|ALLOW9|ALLOW10|ALLOW11|ALLOW12|_EMP_PK|TIMES|_Contract Type"   
									format="3|0|0|0|0|0|0|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0"  
									aligns="1|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									acceptNullDate
									defaults="||||||||||||||||||||||||||||||"  
									editcol="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="800|1700|1700|1200|2500|2000|1200|2000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500"  
									styles="width:100%; height:100%"   
									sorting="T"   
									oncellclick="AfterSelectHist()"/> 
							</td>
						</tr>	
					</table>
				</div>
               
            </td>
        </tr>
    </table>
 
</gw:tab>
 
</body>
 
  
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="lblA1" text="" styles="display:none"/> 
<gw:textbox id="lblA2" text="" styles="display:none"/> 
<gw:textbox id="lblA3" text="" styles="display:none"/> 
<gw:textbox id="lblA4" text="" styles="display:none"/> 
<gw:textbox id="lblA5" text="" styles="display:none"/> 
<gw:textbox id="lblA6" text="" styles="display:none"/> 
<gw:textbox id="lblA7" text="" styles="display:none"/> 
<gw:textbox id="lblA8" text="" styles="display:none"/> 
<gw:textbox id="lblA9" text="" styles="display:none"/> 
<gw:textbox id="lblA10" text="" styles="display:none"/> 
<gw:textbox id="lblA11" text="" styles="display:none"/> 
<gw:textbox id="lblA12" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay1" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay2" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay3" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay4" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay5" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay6" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay7" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay8" text="" styles="display:none"/> 
<gw:textbox id="lblDisplay9" text="" styles="display:none"/>
<gw:textbox id="lblDisplay10" text="" styles="display:none"/>
<gw:textbox id="lblDisplay11" text="" styles="display:none"/>
<gw:textbox id="lblDisplay12" text="" styles="display:none"/>
<gw:textbox id="txtAllowance" text="HR0019" styles="display:none"/>
<gw:textbox id="txtEmp_PK" text="" styles="display:none"/> 
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtContract_Type" styles="display:none"/>
<gw:textbox id="txtEmp_PK_A" text="" styles="display:none"/> 
<gw:textbox id="txtContract_Type_A" styles="display:none"/>
<gw:textbox id="txtAppendix_Times_A" styles="display:none"/>
<gw:textbox id="txtActive_tab" styles="display:none"/>
<gw:textbox id="txtUpperOrg" styles="display:none"/>
<gw:textbox id="txtOrgData" styles="display:none"/>
<gw:textbox id="txtProbation_Type" styles="display:none"/>

<gw:textbox id="txtOrg_tmp" text="" styles="display:none"  />
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="txtForeignerYN" styles="display:none"/> 
<gw:textbox id="txtCompany_pk" styles="display:none"/> 

<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtLang" text="" styles="display:none"  />
 <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:list  id="lstGrp_Code_M" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstGrp_Code_R" value='ALL' maxlen = "100" styles='width:100%;display:none' />
</html>
