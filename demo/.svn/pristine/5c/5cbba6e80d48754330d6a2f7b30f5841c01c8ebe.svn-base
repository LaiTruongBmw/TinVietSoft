<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
 
    //_pk 0|Select 1|ID 2|Full Name 3|Sex 4|Birth DT 5|Birth Place 6|Personal ID 7|Issue DT 8|Place ID 9|Ethnic 10 |Current Address 11|Permanent Address 12
    //|Hand Phone 13|Home Phone 14|Other Contact 15|Email 16|Height(m)17|Weight(Kg) 18|State of Health 19|Marital Status 20
    //|Education  21|Graduation School 22
    //|Major 23|Graduation Kind 24|Other Certificate 25|Foreign Language 26|Language Certificate 27|Other Language 28|Computer  Skill 29|Experience 30
    //|Other Description 31|Organization 32|Position 33|Job 34|Emp type 35|Salary 36|Other Request 37|Receive DT 38|Introduction 39|Expiry DT 40|Full Profile 41
    //|Minus Profile 42|MINUS_CODE 43| Profile Note 44|Interview DT1 45|Hours ITV1 46|Interviewer1 47|_Interviewer1_pk 48|Result 1 49|Remark 1 50|Interview DT2 51
    //|Hours ITV2 52|Interviewer2 53|_Interviewer2_pk 54
    //|Result 2 55|Remark 2 56|Interview DT3 57|Hours ITV3 58|Interviewer3 59|_Interviewer3_pk 60|Result 3 61|Remark 3 62|Pass  63|Pass DT 64|Working DT 65|_int_pk 66
    //|Return Profile DT 67| Reason return 68|Request 69|Request 70
   p_pk = 0;
   p_org_nm =2; 
   p_ID=3;
   
   p_Sex=5;
   p_Birth_DT=6;
   p_PlaceBirth=7;
   p_Personal_ID=8;
   p_Issue_DT=9;
   p_PlaceID=10;
   p_Ethnic=11;
   p_Marital=21;
   p_Education=22;
   p_School=23;
   p_major=24;
   p_grad_kind=25;
   p_language=27;
   p_language_result=28;
   p_OtherDescription=32;

   p_pos=33;
   p_job=34;
   p_Emp_type=35;
   p_sal=36;
   p_Receive_dt=38;
   p_Introduction=39;
   p_Expiry_dt=40;
   p_full_profile_yn=41;
   p_minus_profile = 42;
   p_minus_profile_code = 43;
   p_Profile_note=44;
   p_Interview1_dt=45;
   p_hours_itv1 = 46;

   p_Result1=49;
   p_Remark1=50;
   p_Interview2_dt=51;
   p_hours_itv2 = 52;
   p_Result2=55;
   p_Remark2=56;
   p_Interview3_dt=57;
   p_hours_itv3 =58
   p_Result3=61;
   p_Remark3=62;
   p_pass=63;
   p_pass_dt = 64;
   p_intro_pk=66;
   p_return_pro_dt =67;
   p_reason_return =68;
   p_Request=69;
   p_Request_pk=70,
   p_org_pk =71;
   

   
   

var datenow;

function BodyInit()
{ 	
    grdEmployee.GetGridControl().FrozenCols =8;
    txtInterviewer.SetEnable(0);
    grdEmployee.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
   
     var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlaceBirth,t1);
    
	     t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code ")%>";
       grdEmployee.SetComboFormat(p_Result1,t1);
     t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code ")%>";
       grdEmployee.SetComboFormat(p_Result2,t1);
     t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code ")%>";
       grdEmployee.SetComboFormat(p_Result3,t1);
	
      t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Sex,t1);
      
      t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlaceID,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0015' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Ethnic,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Education,t1);

    
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0147' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_grad_kind,t1);
    
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0143' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_language,t1);
        
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0144' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_language_result,t1);
       
     
     t1 = "<%=CtlLib.SetGridColumnDataSQL(" select pk,org_nm from tco_org g where g.del_if=0 order by seq,org_nm  ")%>";
       grdEmployee.SetComboFormat(p_org_pk,t1);
      
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_pos,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_job,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code ")%>";
       grdEmployee.SetComboFormat(p_pass,t1);
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select 'Y','Yes' from dual union all select 'N','No' from dual ")%>";
       grdEmployee.SetComboFormat(p_full_profile_yn,t1);
       
         t1 = "<%=CtlLib.SetGridColumnDataSQL("select 'Y','Married' from dual union all select 'N','Single' from dual ")%>";
       grdEmployee.SetComboFormat(p_Marital,t1);
           t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm ")%>";
       grdEmployee.SetComboFormat(p_Emp_type,t1);


       
  /*  t1 = "<%=CtlLib.SetGridColumnDataSQL("SELECT to_char(B.PK) t1,A.APP_NO||' - '|| (SELECT V.CODE_NM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=B.POS_TYPE ) t2   FROM THR_REC_REQUEST A, THR_REC_REQUEST_DETAIL B WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_REC_REQUEST_PK and b.app_status='03' ")%>";
       grdEmployee.SetComboFormat(p_request,t1);
    */  
      
          
    visible_grd(3);

    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;
        if(month<10) month='0'+month;
    var date = now.getDate();
        if(date<10) date='0' + date;
    datenow = ''+year+month+date;
    
}
function OnSearch()
{
    datRecManagement.Call("SELECT");
}
function OnSave()
{
    if(confirm("Do you want to save?\nBạn muốn save?"))
             datRecManagement.Call();
}

//------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
     
     if(obj.id=='datListRequest')
     {
        lstRequestDetail.value='ALL';
     }
    else if(obj.id=='datRecManagement')
     { 
        auto_resize_column(grdEmployee,0,grdEmployee.cols-1,10);    
        for(var i=1;i<grdEmployee.rows;i++)
           {        grdEmployee.SetCellBgColor(i, p_ID,i, p_ID+1, 0xFFEEFF );
                    grdEmployee.SetCellBgColor(i, p_Birth_DT,i, p_Birth_DT, 0xFFEEFF );
                    grdEmployee.SetCellBgColor(i, p_Personal_ID,i, p_Personal_ID, 0xFFEEFF );
                    
                    grdEmployee.SetCellBgColor(i, p_Interview1_dt,i, p_Interview1_dt+5, 0xFFCC66);
                    grdEmployee.SetCellBgColor(i, p_Interview2_dt,i, p_Interview2_dt+5, 0xCCCCFF);
                    grdEmployee.SetCellBgColor(i, p_Interview3_dt,i, p_Interview3_dt+5, 0xCCFFFF);
           }
        idlb.text = grdEmployee.rows - 1 +' record(s)';
     }
   else if (obj.id=="datGet_Org")
   {

      grdEmployee.SetGridText(rowclick,p_org_nm,txtOrgNM.text);
   }
   else if (obj.id=="datGet_Org_2")
   {
        txtInterviewer.text= txtOrgNM.text;
	    txtRequest_PK.text=txtOrgPK.text;
   }
}     

function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}


function OnShowPopup(o)
{
        if(o=='1')
        {
        var strcom;
        var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
            if (obj!=null)
            { lstOrg.value = obj;
            }
        }
        if(o=='3')
        {
            if(grdEmployee.row>0 && grdEmployee.col==p_Request)
            {
              var fpath = System.RootURL + "/form/ch/pr/chpr00010_request.aspx?";
              var obj=System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
                if (obj!=null)
                    {
			         grdEmployee.SetGridText(grdEmployee.row,grdEmployee.col ,obj[1]);
			         grdEmployee.SetGridText(grdEmployee.row,p_Request_pk ,obj[0] );
                     
			        }
             }
            
            if(grdEmployee.row>0 && grdEmployee.col == p_minus_profile)
             {
                var txtProfile="";
                var txtProfile_Code="";
                var fpath = System.RootURL + "/form/ch/pr/chpr00010_profile.aspx?code=HR0162&rec_pk="+ grdEmployee.GetGridData(grdEmployee.row, p_pk) ;
	            var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
                if (obj!=null)
	            {

	                    var arrTemp;
                        for( var i=0; i < obj.length; i++)	  
                        {	
                          arrTemp = obj[i];
                          txtProfile_Code +=   arrTemp[3] + ","  ;
                          txtProfile += arrTemp[12] +"," ;
                        }
                       txtProfile = txtProfile.substr(0,txtProfile.length-1);
                       txtProfile_Code = txtProfile_Code.substr(0,txtProfile_Code.length -1) ;

                       grdEmployee.SetGridText(grdEmployee.row,p_minus_profile, txtProfile);
                       grdEmployee.SetGridText(grdEmployee.row,p_minus_profile_code, txtProfile_Code);
               
	            } 
             }

            if(grdEmployee.row >0 && grdEmployee.col==p_Introduction)
            {  var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
             var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	         if (obj!=null)
	            { grdEmployee.SetGridText(grdEmployee.row,p_intro_pk ,obj[0]);
	              grdEmployee.SetGridText(grdEmployee.row,p_Introduction ,obj[1] +' - '+ obj[2]);
	              
	            }
	        }
	        
	        if(grdEmployee.row >0 && grdEmployee.col==p_Interview1_dt+2)
            {  var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
             var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	         if (obj!=null)
	            { grdEmployee.SetGridText(grdEmployee.row,p_Interview1_dt+3 ,obj[0]);
	              grdEmployee.SetGridText(grdEmployee.row,p_Interview1_dt+2 ,obj[1] +' - '+ obj[2]);
	              
	            }
	        }
	         if(grdEmployee.row >0 && grdEmployee.col==p_Interview2_dt+2)
            {  var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
             var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	         if (obj!=null)
	            { grdEmployee.SetGridText(grdEmployee.row,p_Interview2_dt+3 ,obj[0]);
	              grdEmployee.SetGridText(grdEmployee.row,p_Interview2_dt+2 ,obj[1] +' - '+ obj[2]);
	              
	            }
	        }
	         if(grdEmployee.row >0 && grdEmployee.col==p_Interview3_dt+2)
            {  var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
             var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	         if (obj!=null)
	            { grdEmployee.SetGridText(grdEmployee.row,p_Interview3_dt+3 ,obj[0]);
	              grdEmployee.SetGridText(grdEmployee.row,p_Interview3_dt+2 ,obj[1] +' - '+ obj[2]);
	              
	            }
	        }

            if(grdEmployee.col==p_org_nm)
            {
                var strcom;
                var fpath = System.RootURL + "/form/ch/ae/chae00030_org.aspx?";
                var obj  = System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');
                //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
                if (obj!=null)
                {
                     rowclick= event.row;
                     txtOrgPK.text = obj;
			         grdEmployee.SetGridText(event.row,p_org_pk,txtOrgPK.text);
                    datGet_Org.Call();
                }    
             }
	    
        }
         if(o=='4')
        {
           if(lstinterviewer.value =='1' || lstinterviewer.value =='2' || lstinterviewer.value =='3')
           {
             var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
             var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	         if (obj!=null)
	            {   
	                txtInterviewer.text=obj[1]+" - " + obj[2];
	                 txtInterviewer_pk.text=obj[0];
	            
	              }   
	                else 
	                {txtInterviewer.text="please click to choose Interviewer ";
	                 txtInterviewer_pk.text=null;
	            
	                }
	        }
            else if(lstinterviewer.value == '4')
            {
                var fpath = System.RootURL + "/form/ch/pr/chpr00010_request.aspx?";
                var obj=System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
                if (obj!=null)
                    {
                     txtInterviewer.text=obj[1];
	                 txtRequest_PK.text=obj[0];
			        }
            }    
	        else if(lstinterviewer.value == '5')
            {
                var strcom;
                var fpath = System.RootURL + "/form/ch/ae/chae00030_org.aspx?";
                var obj  = System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');
                //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
                if (obj!=null)
                {
                     rowclick= event.row;
                     txtOrgPK.text = obj;
                    datGet_Org_2.Call();
                }    

                
            }
        }
        
}
function OnchangeRequest()
{ 
    datListRequest.Call();
}



function OnSelect()
{var flag,temp, ctrl=grdEmployee.GetGridControl();
 
 if(chkSelectAll.value=='T')
 temp='-1'
 else
 temp='0';
 for(var i=1;i<=ctrl.SelectedRows;i++)
                    {   grdEmployee.SetGridText(ctrl.SelectedRow(i-1),1,temp);
                    }
}

function OnDelete()
{
    if(confirm ("Do you want to delete ?.\n Bạn có muốn xóa không?"))
    {
      grdEmployee.DeleteRow();
    }
}

function OnToggle()
{
            if(img3.status == "middle")
            {
                img3.status = "large";
                img3.src = "../../../../system/images/iconmaximize.gif";
			    img3.alt="Show all columns";
			    visible_grd(2);
    			
            }
            else if(img3.status == "large")
            {
                img3.status = "min";
                img3.src = "../../../../system/images/iconminimize.gif";
			    img3.alt="Hide column";
			    visible_grd(1);
            }
            else if(img3.status == "min")
            {
                img3.status = "middle";
                img3.src = "../../../../system/images/menu.gif";
			    img3.alt="Show more columns";
			    visible_grd(3);
            }
    
  
}


function visible_grd(n)
{
 
        switch(n)
        {
            case 1://middle
             grdEmployee.GetGridControl().ColHidden(p_Sex)=1;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+1)=1;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+2)=1;   
             for(var i=p_Issue_DT;i<=p_OtherDescription;i++)      
             grdEmployee.GetGridControl().ColHidden(i)=1;
         
       
                break;
            case 2://large
             grdEmployee.GetGridControl().ColHidden(p_Sex)=0;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+1)=0;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+2)=0;   
            
       for(var i=p_Issue_DT;i<=p_Profile_note;i++)      
         grdEmployee.GetGridControl().ColHidden(i)=0;
         
       
                
                break;
            case 3:
               grdEmployee.GetGridControl().ColHidden(p_Sex)=1;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+1)=1;   
             grdEmployee.GetGridControl().ColHidden(p_Sex+2)=1;   
          
             for(var i=p_Issue_DT;i<=p_Profile_note;i++)      
         grdEmployee.GetGridControl().ColHidden(i)=1;
         
                
                break;    
        }
        grdEmployee.GetGridControl().ColHidden(p_minus_profile_code)=1;
}

function OnSetGrid(obj)
{if(obj=='1')
    {
    if(lstInteview.value=='1')
        {
        var flag,temp, ctrl=grdEmployee.GetGridControl();
            for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
                       if(OnChangeDT(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Receive_dt),dtInterview.value,grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview2_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview3_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Expiry_dt) )==1)
                                 {if(dtInterview.value!='')
                                       grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview1_dt,dtInterview.value);
                                   else
                                    if(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview1_dt)=='' && (grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Result1)!='' || grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Remark1)!='' )  )          
                                        alert("Can't clear Interview date 1  "); 
                                }
                                 
                    }
        
        }
    if(lstInteview.value=='2')
        {
        var flag,temp, ctrl=grdEmployee.GetGridControl();
            for(var i=1;i<=ctrl.SelectedRows;i++)
                    {    if(OnChangeDT(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Receive_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview1_dt),dtInterview.value,grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview3_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Expiry_dt) )==1)
                          {if(dtInterview.value!='')
                            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview2_dt,dtInterview.value);
                           else
                             if(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview2_dt)=='' && (grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Result2)!='' || grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Remark2)!='' )  )          
                                alert("Can't clear Interview date 2  "); 
                              
                          }
                           
                    }
        
        }    
      if(lstInteview.value=='3')
        {
        var flag,temp, ctrl=grdEmployee.GetGridControl();
            for(var i=1;i<=ctrl.SelectedRows;i++)
                    {  //temp=OnChangeDT(
                      if(OnChangeDT(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Receive_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview1_dt),grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview2_dt),dtInterview.value,grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Expiry_dt) )==1)
                         {if(dtInterview.value!='')
                            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview3_dt,dtInterview.value);
                         else
                            if(grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Interview3_dt)=='' && (grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Result3)!='' || grdEmployee.GetGridData(ctrl.SelectedRow(i-1),p_Remark3)!='' )  )          
                                alert("Can't clear Interview date 3  "); 
                                
                         }
                    }
        
        }  
      
      }
     if(obj=='2')   
     { 
	             var flag,temp
                 var ctrl=grdEmployee.GetGridControl();
                    for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
	            
	                  if(lstinterviewer.value=='1' && txtInterviewer_pk.text!='')
	                  {grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview1_dt+3 ,txtInterviewer_pk.text);
	                  grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview1_dt+2,txtInterviewer.text);
	                  }
	                  if(lstinterviewer.value=='2' && txtInterviewer_pk.text!='')
	                  {grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview2_dt+3 ,txtInterviewer_pk.text);
	                  grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview2_dt+2,txtInterviewer.text);
	                  }
	              
	                   if(lstinterviewer.value=='3' && txtInterviewer_pk.text!='')
	                   {
                        grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview3_dt+3 ,txtInterviewer_pk.text);
	                    grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Interview3_dt+2,txtInterviewer.text);
	                   }
                       if(lstinterviewer.value=='4')
	                   {
                         
			            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Request ,txtInterviewer.text );
			            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_Request_pk ,txtRequest_PK.text );
                    
	                   }
	                   if(lstinterviewer.value=='5')
	                   {
                         
			            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_org_nm ,txtInterviewer.text );
			            grdEmployee.SetGridText(ctrl.SelectedRow(i-1),p_org_pk ,txtRequest_PK.text );
                    
	                   }
	            }
	         
     }
        
}

function OnChangeDT(dtReceiveDT,dtInterviewDT1,dtInterviewDT2,dtInterviewDT3,dtExpiryDT)
{ if(dtReceiveDT!='' && dtExpiryDT!='' && Number(dtReceiveDT)> Number(dtExpiryDT))
        {alert("Please input Expiry date greater than Receive Date ");
              return 0;
        }
  if(dtInterviewDT1!='' && dtExpiryDT!='' && Number(dtInterviewDT1)> Number(dtExpiryDT))
        {alert("Please input Expiry date greater than Interview Date ");
       
         return 0;
        }
  if(dtInterviewDT2!='' && dtExpiryDT!='' && Number(dtInterviewDT2)> Number(dtExpiryDT))
        {alert("Please input Expiry date greater than Interview Date ");
       
         return 0;
        }    
   if(dtInterviewDT3!='' && dtExpiryDT!='' && Number(dtInterviewDT3)> Number(dtExpiryDT))
        {alert("Please input Expiry date greater than Interview Date ");
       
         return 0;
        } 
    if(dtInterviewDT1!='' && dtReceiveDT!='' && Number(dtInterviewDT1)< Number(dtReceiveDT))
        {alert("Please input Interview date greater than Receive Date ");
       
         return 0;
        }
  if(dtInterviewDT2!='' && dtReceiveDT!='' && Number(dtInterviewDT2)< Number(dtReceiveDT))
        {alert("Please input Interview date greater than Receive Date ");
       
         return 0;
        }    
   if(dtInterviewDT3!='' && dtReceiveDT!='' && Number(dtInterviewDT3)< Number(dtReceiveDT))
        {alert("Please input Interview date greater than Receive Date ");
       
         return 0;
        }
   if(dtInterviewDT1!='' && dtInterviewDT2!='' && Number(dtInterviewDT2)< Number(dtInterviewDT1))
        {alert("Please input Interview date 2 greater than Interview 1 Date ");
       
         return 0;
        } 
  if(dtInterviewDT3!='' && dtInterviewDT2!='' && Number(dtInterviewDT3)< Number(dtInterviewDT2))
        {alert("Please input Interview date 3 greater than Interview 2 Date ");
       
         return 0;
        }    
  if((dtInterviewDT3!='' || dtInterviewDT2!='') && dtInterviewDT1=='')
        {alert("Please input Interview date 1 ");
        dtInterviewDT3='';
        dtInterviewDT2='';
       
         return 0;
        }                                                                       
   if(dtInterviewDT3!='' && dtInterviewDT2=='' )
        {alert("Please input Interview date 2  ");
        
        dtInterviewDT3='';
       
         return 0;
        }                                                                            
                                                                     
      return 1;
}

var old_value='';
function Check_Data(obj)
{   if(obj=='1')
        { old_value=grdEmployee.GetGridData(grdEmployee.row,grdEmployee.col)+'';
        }
    if (obj=='2' && grdEmployee.row >=1 && (grdEmployee.col>=p_Receive_dt && grdEmployee.col<=p_Remark3))
        {  
          if(OnChangeDT(grdEmployee.GetGridData(grdEmployee.row,p_Receive_dt),grdEmployee.GetGridData(grdEmployee.row,p_Interview1_dt),grdEmployee.GetGridData(grdEmployee.row,p_Interview2_dt),grdEmployee.GetGridData(grdEmployee.row,p_Interview3_dt),grdEmployee.GetGridData(grdEmployee.row,p_Expiry_dt) )=="0"  )
                   {
                   grdEmployee.SetGridText(grdEmployee.row,grdEmployee.col,old_value);
                   }
          if(grdEmployee.GetGridData(grdEmployee.row,p_Interview1_dt)=='' && (grdEmployee.GetGridData(grdEmployee.row,p_Result1)!='03' || grdEmployee.GetGridData(grdEmployee.row,p_Remark1)!='' )  )          
            {alert("Please input Interview date 1  "); 
            grdEmployee.SetGridText(grdEmployee.row,grdEmployee.col,'');
            }
          if(grdEmployee.GetGridData(grdEmployee.row,p_Interview2_dt)=='' && (grdEmployee.GetGridData(grdEmployee.row,p_Result2)!='03' || grdEmployee.GetGridData(grdEmployee.row,p_Remark2)!='' )  )          
            {alert("Please input Interview date 2  "); 
            grdEmployee.SetGridText(grdEmployee.row,grdEmployee.col,''); 
            }
          
          if(grdEmployee.GetGridData(grdEmployee.row,p_Interview3_dt)=='' && (grdEmployee.GetGridData(grdEmployee.row,p_Result3)!='03' || grdEmployee.GetGridData(grdEmployee.row,p_Remark3)!='' )  )          
            {  alert("Please input Interview date 3  "); 
               grdEmployee.SetGridText(grdEmployee.row,grdEmployee.col,'');   
            }
        }
      if(obj=='2' && grdEmployee.row>=1 && grdEmployee.col == p_pass && grdEmployee.GetGridData(grdEmployee.row,p_pass_dt)=="" && grdEmployee.GetGridData(grdEmployee.row,p_pass)== "01")    
      {
        grdEmployee.SetGridText(grdEmployee.row,p_pass_dt, datenow);      
      }   
      if(obj=='2' && grdEmployee.row>=1 && grdEmployee.col == p_pass && grdEmployee.GetGridData(grdEmployee.row,p_pass_dt)!="" && grdEmployee.GetGridData(grdEmployee.row,p_pass)!= "01")    
      {
        grdEmployee.SetGridText(grdEmployee.row,p_pass_dt, '');      
      }

}

function OnReport()
{
if(lstReport.value=='1')
{txtReport_tmp.text='rpt_Curriculum_Vitae.aspx';
var  emp_pk_list="";
                    
                    for (var i=1;i<=grdEmployee.rows-1;i++)
                    {
                        if (grdEmployee.GetGridData(i,1)=="-1")
                        {
                            emp_pk_list = emp_pk_list + grdEmployee.GetGridData(i,0) + ",";
                           
                        }   
                    }
                    if (emp_pk_list=="")
                        alert("Please choose employees to print");
                    else
                    {
                        emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
                        var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list + '&appendix_type=1';
                        window.open(url);     
                        
                    }
                    

}               
else if(lstReport.value=='2')
{       txtReport_tmp.text='rpt_Recruit_management.aspx';
               var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_position='
                    +lstPosition.value +"&p_serach="+lstSearch.value+"&p_temp="+txtTemp.text +"&p_resultby="+lstResultBy.value+"&p_status="+lstStatus.value
                    +"&p_request="+lstRequest.value + "&p_detail="+lstRequestDetail.value + "&p_PeriodFrom="+dtPeriodFrom.value 
                    + "&p_PeriodTo="+dtPeriodTo.value +"&p_receive_from=" +dtReceiveFrom.value+"&p_receive_to=" +dtReceiveTo.value
                    +"&p_Expiry_from=" +dtExpiryFrom.value+"&p_Expiry_to=" +dtExpiryTo.value
                    +"&p_Interview1_from=" +dtInterview1From.value+"&p_Interview1_to=" +dtInterview1To.value
                    +"&p_Interview2_from=" +dtInterview2From.value+"&p_Interview2_to=" +dtInterview2To.value
                    +"&p_Interview3_from=" +dtInterview3From.value+"&p_Interview3_to=" +dtInterview3To.value+"&p_emp_type="+lstEmpType.value
                    +"&p_working_from=" +dtWorkingFrom.value +"&p_working_to=" +dtWorkingTo.value ;
                    window.open(url);     
                    

}               
else if(lstReport.value=='3')
{       txtReport_tmp.text='rpt_rec_interview_status_list.aspx';
               var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_position='
                    +lstPosition.value +"&p_serach="+lstSearch.value+"&p_temp="+txtTemp.text +"&p_resultby="+lstResultBy.value+"&p_status="+lstStatus.value
                    +"&p_request="+lstRequest.value + "&p_detail="+lstRequestDetail.value + "&p_PeriodFrom="+dtPeriodFrom.value 
                    + "&p_PeriodTo="+dtPeriodTo.value +"&p_receive_from=" +dtReceiveFrom.value+"&p_receive_to=" +dtReceiveTo.value
                    +"&p_Expiry_from=" +dtExpiryFrom.value+"&p_Expiry_to=" +dtExpiryTo.value
                    +"&p_Interview1_from=" +dtInterview1From.value+"&p_Interview1_to=" +dtInterview1To.value
                    +"&p_Interview2_from=" +dtInterview2From.value+"&p_Interview2_to=" +dtInterview2To.value
                    +"&p_Interview3_from=" +dtInterview3From.value+"&p_Interview3_to=" +dtInterview3To.value+"&p_emp_type="+lstEmpType.value 
                    +"&p_working_from=" +dtWorkingFrom.value +"&p_working_to=" +dtWorkingTo.value ;
                    window.open(url);     
                    

}      
else if(lstReport.value=='4')
{       txtReport_tmp.text='rpt_rec_emp_expect_list.aspx';
               var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_position='
                    +lstPosition.value +"&p_serach="+lstSearch.value+"&p_temp="+txtTemp.text +"&p_resultby="+lstResultBy.value+"&p_status="+lstStatus.value
                    +"&p_request="+lstRequest.value + "&p_detail="+lstRequestDetail.value + "&p_PeriodFrom="+dtPeriodFrom.value 
                    + "&p_PeriodTo="+dtPeriodTo.value +"&p_receive_from=" +dtReceiveFrom.value+"&p_receive_to=" +dtReceiveTo.value
                    +"&p_Expiry_from=" +dtExpiryFrom.value+"&p_Expiry_to=" +dtExpiryTo.value
                    +"&p_Interview1_from=" +dtInterview1From.value+"&p_Interview1_to=" +dtInterview1To.value
                    +"&p_Interview2_from=" +dtInterview2From.value+"&p_Interview2_to=" +dtInterview2To.value
                    +"&p_Interview3_from=" +dtInterview3From.value+"&p_Interview3_to=" +dtInterview3To.value+"&p_emp_type="+lstEmpType.value
                    +"&p_working_from=" +dtWorkingFrom.value +"&p_working_to=" +dtWorkingTo.value ;
                    window.open(url);     
                    

}           
}

</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datRecManagement" onreceive="OnDataReceive(this)" > 
    <xml> 
    <dso  type="grid" parameter="0,2,5,7,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71" function="ST_HR_SEL_HRRE00300_0"  procedure="ST_HR_UPD_HRRE00300_0" > 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstPosition" /> 
                <input bind="lstSearch" /> 
                <input bind="txtTemp" /> 
				<input bind="lstResultBy" />
				<input bind="lstStatus" />
				<input bind="lstRequest" />
				<input bind="lstRequestDetail" />
				<input bind="dtPeriodFrom" />
				<input bind="dtPeriodTo" />
				
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
				<input bind="lstEmpType" />
				<input bind="dtWorkingFrom" />
				<input bind="dtWorkingTo" />
				
            </input> 
            <output bind="grdEmployee" /> 
        </dso> 
   </xml> 
</gw:data> 
<!------------------------------------->

<gw:data id="datGet_Org" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00300_0" > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtOrgNM" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datGet_Org_2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00300_0" > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtOrgNM" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datListRequest" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_HRRE00300_1" > 
                <input>
                    <input bind="lstRequest" /> 
                </input> 
                <output>
                    <output bind="lstRequestDetail" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------->
<table name="Report" id="tblReport" width="100%" cellpadding="0" cellspacing="0" border=0 style="height:98%;">
    <tr style="width:100%;height:100%" valign="top">
        <td width="100%">
                <table width="100%" id="Table2" style="height:100%" border=0 cellpadding="0" cellspacing="0">
							<tr  >
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
								<td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td><td width="2%" style="border:0"></td>
							</tr>
							<tr style="border:0;width:100%;height:5%" valign="middle">   
						        
						        <td colspan="44" align="left" style="border:0">
							        
						        </td>
						        <td colspan=2  style="border:0">
							       <gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td colspan=2  style="border:0">
						            <gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave()" />
						        </td>
						        <td colspan=2  style="border:0">
						            <gw:button id="ibtnDelete"  alt="Delete"  img="delete"  text="Delete"  onclick="OnDelete()" />
						        </td>
					        </tr>
					        <tr style="border:0;width:100%;height:5%" valign="middle">   
						        <td colspan="5" align="right" style="border:0"><a title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a></td>
						        <td colspan="10" style="border:0"><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange="OnChangeDept()"> 
									   <data>
											<%= CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0  order by a.seq")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        <td colspan="5" align="right" style="border:0"><font color="black"><b>Position &nbsp;</b>
						        </td>
						        <td colspan="5" style="border:0"> <gw:list  id="lstPosition" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                             </data></gw:list>
                                             </td>
						        <td colspan="5" style="border:0"> <gw:list  id="lstEmpType" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm")%>|ALL|Emp Type - ALL
                                             </data></gw:list>
                                             </td>
						        <td colspan="5" align="right" style="border:0"><font color="black"><b>Result By &nbsp;</b></td>
						        <td colspan="4" style="border:0"><gw:list id="lstResultBy" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											|ALL|Select All|1|Result 1|2|Result 2|3|Result 3|4|Final Result
										</data>
								   </gw:list > 
						        </td>
						        
						        <td colspan="2" align="right" style="border:0"><font color="black"><b >Status</b></td>
						        <td colspan="4" style="border:0"><gw:list  id="lstStatus" value="ALL" styles='width:100%' onchange=""> 
									        <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>|ALL|ALL</data> 
							        </gw:list>
						        </td>
						        
						        <td colspan="1" align="left" style="border:0">
							        
						        </td>
						        <td  align="right" style="border:0">
							      
						        </td>
						        <td  align="right" style="border:0">
						            
						        </td>
						        <td  align="right" style="border:0">
						           
						        </td>
                                <td  align="right" style="border:0">
						        
						        </td>
					        </tr>
							<tr style="border:0;width:100%;height:5%" valign="middle"> 
						        <td colspan="5" align="right" style="border:0"><font color="black"><b>Search by &nbsp;</b>
						        </td>
						        <td colspan="5" style="border:0">
							        <gw:list  id="lstSearch" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|4|Per ID</data> 
							        </gw:list>
						        </td>
        						
						        <td colspan="5" style="border:0"> 
							        <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						         
						         <td colspan="5" align=right style="white-space:nowrap;border:0"> Recieve DT</td>
						         <td colspan="4" style="white-space:nowrap;border:0"> 
							        <gw:datebox id="dtReceiveFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="2" align=center style="border:0">~</td>
							    <td colspan=4 align="right" style="border:0"> <gw:datebox id="dtReceiveTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						        <td colspan=5 style="white-space:nowrap;border:0" align=right> Expiry DT</td>
						        <td colspan=4 style="white-space:nowrap;border:0" align=right><gw:datebox id="dtExpiryFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=2 style="white-space:nowrap;border:0" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap;border:0" align=right><gw:datebox id="dtExpiryTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
                                <td colspan=2 align=right>
                                    <gw:list id="lstReport" styles="color:black;width:100%" value="1" onchange=""> 
									   <data>
											|1|Curriculum Vitae|2|Recruit Management|3|Interview List|4|Expect Work List
										</data>
								   </gw:list >
                                </td>
                                <td align=center>
                                    <gw:imgBtn id="ibtnReport"  alt="Report"  img="excel"  text="Exel"  onclick="OnReport()" />
                                </td>
					        </tr>
					        <tr style="border:0;width:100%;height:5%" valign="middle"> 
                                <td colspan="5" align="right" style="white-space:nowrap;border:0"><font color="black"><b >Request &nbsp;</b></td>
						        <td colspan="10" style="border:0"><gw:list id="lstRequest" styles="color:black;width:100%" value="ALL" onchange="OnchangeRequest()"> 
									   <data>
											<%=CtlLib.SetListDataSQL("select a.pk,a.app_no ||' ' ||a.note from thr_rec_request a,thr_rec_request_detail b where nvl(b.app_status,'01')='03' and a.pk=b.thr_rec_request_pk and a.del_if=0 and b.del_if=0 group by a.pk,a.app_no, a.note  order by 2,1 ")%>|NON|None Request|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
                                 <td colspan="5" align="right" style="border:0"><font color="black"><b >Interview DT1</b></td>
						        <td colspan="4" style="white-space:nowrap" style="border:0"> 
							        <gw:datebox id="dtInterview1From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
							       <td colspan="2" align=center style="border:0">~</td>
							    <td colspan=4 align="right" style="border:0"> <gw:datebox id="dtInterview1To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>  
							
							 <td colspan=5 style="white-space:nowrap;border:0" align=right > Period DT</td>
						        <td colspan=4 style="white-space:nowrap;border:0" align=right><gw:datebox id="dtPeriodFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=2 style="white-space:nowrap;border:0" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap;border:0" align=right><gw:datebox id="dtPeriodTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
					        </tr>
					        
					        
					        <tr style="border:0;width:100%;height:5%" valign="middle">   
                                <td colspan="5" align="right" style="border:0">Request Detail  &nbsp;
						        </td>
						        <td colspan="10" style="border:0"><gw:list id="lstRequestDetail" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											<%=CtlLib.SetListDataSQL("select b.pk,a.APP_NO||' - '|| (select v.code_nm from vhr_hr_code v where v.id='HR0008' and v.code=b.POS_TYPE ) from thr_rec_request a, thr_rec_request_detail b where a.DEL_IF=0 and b.DEL_IF=0 and nvl(b.app_status,'01')='03' and a.pk=b.THR_REC_REQUEST_PK order by 2,1")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        

                                <td colspan="5" align="right" style="white-space:nowrap;border:0"><font color="black"><b >Interview DT2</b></td>
						        <td colspan="4" style="white-space:nowrap;border:0" > 
							        <gw:datebox id="dtInterview2From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
							       <td colspan="2" align=center style="border:0">~</td>
							    <td colspan=4 align="right"> <gw:datebox id="dtInterview2To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>

						        <td colspan="5" align="right" style="white-space:nowrap;border:0"><font color="black"><b >Interview DT3</b></font>
						        </td>
						        <td colspan="4" align="right" >
						        <gw:datebox id="dtInterview3From"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						       </td>
						       <td colspan="2"  align=center style="border:0">~</td>
						        <td colspan="4" align="right"> 
						        <gw:datebox id="dtInterview3To"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						         <td colspan="4" style="white-space:nowrap;border:0" align=right>
							    <gw:label id="idlb" styles="width:100%;color:red;font-weight: bold" text="0 record(s)"></gw:label>
						        </td> 
						       
					        </tr>
					        
					          <tr style="border:0;width:100%;height:5%" valign="middle">   
					            <td colspan="5" style="border:0"><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelect()" ></gw:checkbox ></td>
						        <td colspan="5" align="right" style="border:0">  <gw:list id="lstInteview" styles="color:black;width:100%" value="1" onchange=""> 
									   <data>
											|1|Interview Date 1|2|Interview Date 2|3|Interview Date 3
										</data>
								   </gw:list >   </td>
						        <td colspan="4" style="white-space:nowrap;border:0"> 
							        <gw:datebox id="dtInterview"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
							       <td colspan="3" align="left" style="border:0"> <gw:imgBtn id="ibtnSet" alt="Set Grid" img="set" text="Set Grid" onclick="OnSetGrid('1')" /></td>
							    
							    <td colspan="5" align="right" style="border:0">  <gw:list id="lstinterviewer" styles="color:black;width:100%" value="1" onchange=""> 
									   <data>
											|1|Interviewer 1|2|Interviewer 2|3|Interviewer 3|4|Request Detail|5|Organization
										</data>
								   </gw:list >   </td>
						        
						        <td colspan="7" style="white-space:nowrap;border:0"><gw:textbox  id="txtInterviewer" text="please click to choose Interviewer " styles='width:100%; '  csstype="mandatory"  onclick="OnShowPopup(4)" /> </td>
							    <td colspan="1" align="left" style="border:0"> <gw:imgBtn id="ibtnSet2" alt="Set Grid" img="set" text="Set Grid" onclick="OnSetGrid('2')" /></td>
						        <td colspan="5" align="right" style="border:0">Working DT</td>
						        <td colspan="4" align="right" style="border:0">  
                                      <gw:datebox id="dtWorkingFrom" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept />
                                </td>
                                <td colspan="2" align="center" style="border:0">  
                                      ~
                                 </td>
                                 <td colspan="4" align="right" style="border:0">  
                                      <gw:datebox id="dtWorkingTo" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept />
                                 </td>  
								<td colspan="2" align=center style="border:0"> <img status="middle" id="img3" alt="Show more columns" src="../../../../system/images/menu.gif" style="cursor:hand" onclick="OnToggle()"  /></td>
						       
					        </tr>
					        
					        
					        <tr align =top style="border:0"> 
	                        <td  colspan="50"  align = top style="width:100%;height:80%;border:0" >
  		                      <gw:grid   
			                    id="grdEmployee"  
			                    header="_pk|Select|Organization|ID|Full Name|Sex|Birth DT|Birth Place|Personal ID|Issue DT|Place ID|Ethnic|Current Address|Permanent Address|Hand Phone|Home Phone|Other Contact|Email|Height(m)|Weight(Kg)|State of Health|Marital Status|Education |Graduation School|Major|Graduation Kind|Other Certificate|Foreign Language|Language Certificate|Other Language|Computer  Skill|Experience|Other Description|Position|Job|Emp type|Salary|Other Request|Receive DT|Introduction |Expiry DT|Full Profile|Minus Profiles|_Code_pk|Profile Note|Interview DT1|ITV1 Hours|Interviewer1|_Interviewer1_pk|Result 1|Remark 1|Interview DT2|ITV2 Hours|Interviewer2|_Interviewer2_pk|Result 2|Remark 2|Interview DT3|ITV3 Hours|Interviewer3|_Interviewer3_pk|Result 3|Remark 3|Pass |Pass DT|Working expect DT|_int_pk|Return Profile DT|Reason Return|Request detail|_Request_detail_pk|_ORG_PK "   
			                    format="0|3|0|0|0|2|0|2|0|4|2|2|0|0|0|0|0|0|0|0|0|0|2|2|0|0|0|2|2|0|0|0|0|2|2|0|0|0|4|0|4|2|0|0|0|4|0|0|0|2|0|4|0|0|0|0|0|4|0|0|0|0|0|2|4|4|0|4|0|0|0|0 "   
			                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0 "  
			                    defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"  
			                   editcol="0|1|1|0|0|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|0|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|0|1|1"  
			                    widths="1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|1500|1500|1500|0|0"  
			                    styles="width:100%; height:100%"   
			                    sorting="T"   
			                    acceptNullDate
			                    autosize="true"
			                    oncelldblclick ="OnShowPopup(3)" 
			                    onafteredit="Check_Data(2)"
			                    onbeforeedit="Check_Data(1)"
			                    /> 
    	
  	                    </td>
                         </tr>
				        </table>
			 
	            </td>
        </tr>
    </table>

<gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtInterviewer_pk" styles="display:none"/>
    <gw:textbox id="txtRequest_PK" styles="display:none"/>
    <gw:textbox id="txtOrgPK" styles="display:none"/>
    <gw:textbox id="txtOrgNM" styles="display:none"/>
    
</body>
</html>

				
