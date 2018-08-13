<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
//"V|_EMP_PK|Organization|Employee ID|Employee Name|Join Date|Position|Job|Salary"
var G_SELECT        = 0,
    G_EMP_PK        = 1,
    G_ORGANIZATION  = 2,
    G_EMPLOYEE_ID   = 3,
    G_EMPLOYEE_NAME = 4,
    G_JOIN_DATE     = 5,
	G_ORG_PK		= 6,
	G_POSITION_VALUE= 7,
    G_POSITION      = 8,
	G_JOB_VALUE		= 9,
    G_JOB           = 10,   
	G_SALARY		= 11;

//"No|_EMP_PK|Organization|Employee ID|Employee Name|Kind|Start Date| End Date|Treat Kind|Amount|Reason|Times|Description|_SEQ"
var stt = 0;
var G1_NO 					= stt;
var G1_EMP_PK 				= ++stt;
var G1_ORGANIZATION 		= ++stt;
var G1_EMP_ID 				= ++stt;
var G1_FULL_NAME 			= ++stt;
var G1_APPOINTMENT 			= ++stt;
var G1_OLD_PK				= ++stt;
var G1_OLD_VALUE 			= ++stt;
var G1_NEW_PK				= ++stt;
var G1_NEW_VALUE 			= ++stt;
var G1_EMP_APPROVE_PK		= ++stt;
var G1_APPROVE_BY 			= ++stt;
var G1_APPROVE_DATE 		= ++stt;
var G1_APPOINTMENT_F_DT 	= ++stt;
var G1_APPOINTMENT_T_DT 	= ++stt;
var G1_DESCRIPTION 			= ++stt;
var G1_SEQ					= ++stt; 

//------------------------------------------------------------------------------------------------
function BodyInit()
{
	
    System.Translate(document);
	iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	ChangeColorItem(lstOrg.GetControl());
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0221', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL " )%>";    
	lstAppointment.SetDataText(data);
	lstAppointment.value ="";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstOrgNew.SetDataText(data);
	lstOrgNew.value ="";
	ChangeColorItem(lstOrgNew.GetControl());
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstPosNew.SetDataText(data);
	lstPosNew.value="";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0010', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstJobNew.SetDataText(data);
	lstJobNew.value="";
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0221' order by code_nm")%>";
    grdInsert.SetComboFormat(G1_APPOINTMENT,t1);
	
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
		{
			datUser_info.Call();     	    
		}
	txtlanguage.text = v_language;
}
//----------------------------------
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
//-----------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
		case "datUser_info":
		{
			lstOrg.SetDataText(txtdept_temp.text + "|ALL|Select All");
			lstOrg.value = "ALL";
			ChangeColorItem(lstOrg.GetControl());
			
			lstOrgNew.SetDataText(txtdept_temp.text + "|ALL|Select All");
			lstOrgNew.value = "ALL";
			ChangeColorItem(lstOrgNew.GetControl());
		}
		break;
	}
}
//--------------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_hrem01201_1.Call("SELECT");
        break;
    }
   
}
function OnSave()
{
	if(OnValidate())
	{
		if ( confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?"))
			data_hrem01201_0.Call();
	}
	
}
function OnValidate()
{
	var ctrl = grdInsert.GetGridControl();
	for ( var i =  1 ; i < ctrl.rows ; i++ )
	{
		if(grdInsert.GetGridData(i, G1_APPOINTMENT) =="")
		{
			alert((v_language =="ENG")?"You have input appointment type at row " + i :"Bạn phải nhập loại thay đổi tại dòng " + i);
			return false;
		} 
		if(grdInsert.GetGridData(i, G1_APPOINTMENT_F_DT) =="")
		{
			alert((v_language =="ENG")?"You have input from date at row " + i :"Bạn phải nhập cho ngày bắt đầu tại dòng " + i);
			return false;
		} 
		if(grdInsert.GetGridData(i, G1_APPROVE_BY) =="")
		{
			alert((v_language =="ENG")?"You have input to approve by at row " + i :"Bạn phải nhập cho đến người xác nhận tại dòng " + i);
			return false;
		}  
	}
	return true;
}
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdInsert.row > 0)
  {
    var col_val = grdInsert.GetGridData( grdInsert.row, G_EMP_PK);
    
    grdInsert.RemoveRowAt(grdInsert.row);
    
    SetRowBackGroundColor(grdSearch,col_val,0x000000); 
    
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_EMP_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_EMP_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick()
{
      if(event.row > 0 )
      {
            grdSearch.SetGridText(event.row, G_SELECT, "-1");
            OnSelect(grdSearch);
            
      }
}

//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_hrem01201_1':
           
        break;
    }
}

//================================================================================================
function OnSelect(idGrid)
{
	for (i = 1; i< idGrid.rows  ; i++)
	{
		var col_val = idGrid.GetGridData( i, G_EMP_PK);
		if (idGrid.GetGridData(i, 0) == "-1" && (!CheckDataExist( grdInsert, col_val)))
		{
			SetRowBackGroundColor(idGrid,col_val,0x0000FF);
			grdInsert.AddRow();
			var rowcount = grdInsert.rows-1 ;
    		grdInsert.SetGridText(grdInsert.rows-1, G_SELECT, rowcount );
	        for(var j= G_EMP_PK; j< G_JOIN_DATE ; j++)
	        {
	            grdInsert.SetGridText( grdInsert.rows-1, j, idGrid.GetGridData(i, j) );
	        }
			if(lstAppointment.value !="")
				grdInsert.SetGridText(grdInsert.rows-1, G1_APPOINTMENT, lstAppointment.value);
			
			if(lstAppointment.value == "01")
			{
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_PK,idGrid.GetGridData(i,G_ORG_PK));
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_VALUE, idGrid.GetGridData(i,G_ORGANIZATION));
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_PK,lstOrgNew.value);
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_VALUE,lstOrgNew.GetText());
			}	
			if(lstAppointment.value == "02")
			{
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_PK,idGrid.GetGridData(i,G_POSITION_VALUE));
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_VALUE,idGrid.GetGridData(i,G_POSITION));
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_PK,lstPosNew.value);
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_VALUE,lstPosNew.GetText());
			}
			if(lstAppointment.value == "03")
			{
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_PK,idGrid.GetGridData(i,G_JOB_VALUE));
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_VALUE,idGrid.GetGridData(i,G_JOB));
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_PK,lstJobNew.value);
				grdInsert.SetGridText(grdInsert.rows-1,G1_NEW_VALUE,lstJobNew.GetText());
			}
			if(lstAppointment.value == "04")
				grdInsert.SetGridText(grdInsert.rows-1,G1_OLD_VALUE,idGrid.GetGridData(i,G_SALARY));

			if(dtFromDate.value != "")	
				grdInsert.SetGridText(grdInsert.rows-1, G1_APPOINTMENT_F_DT, dtFromDate.value);
			
			if(dtToDate.value != "")	
				grdInsert.SetGridText(grdInsert.rows-1, G1_APPOINTMENT_T_DT, dtToDate.value);
		}
	}
	
	OnSetSeq();
}
//------------------------------------------------------------------------------------
function OnSetGrid()
{	
    
    var ctrl = grdInsert.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		{
			var row = ctrl.SelectedRow(i);
			
			if ( row > 0 )
			{
				var emp_pk_insert = grdInsert.GetGridData(row,G1_EMP_PK);
				for(j=1;j<grdSearch.rows;j++)
				{
					if (grdSearch.GetGridData(j, 0) == "-1")
					{
						var emp_pk = grdSearch.GetGridData(j,G_EMP_PK);
						if (emp_pk = emp_pk_insert)
						{
							if(lstAppointment.value =="01")
							{
								
								var old_pk_org = grdSearch.GetGridData(j,G_ORG_PK);
								var old_value_org = grdSearch.GetGridData(j,G_ORGANIZATION);
							}
							if(lstAppointment.value == "02")
							{
								var old_pk_pos = grdSearch.GetGridData(j,G_POSITION_VALUE);
								var old_value_pos = grdSearch.GetGridData(j,G_POSITION);
							}
							if(lstAppointment.value == "03")
							{
								var old_pk_job = grdSearch.GetGridData(j,G_JOB_VALUE);
								var old_value_job = grdSearch.GetGridData(j,G_JOB);
							}
							if(lstAppointment.value == "04")
							{
								var old_value_sal = grdSearch.GetGridData(j,G_SALARY);
							}
						}
					}																	
				}
				if(lstAppointment.value !="")
					grdInsert.SetGridText(row, G1_APPOINTMENT, lstAppointment.value);

				if(lstAppointment.value =="01")
				{
					grdInsert.SetGridText(row,G1_NEW_PK,lstOrgNew.value);
					grdInsert.SetGridText(row,G1_NEW_VALUE,lstOrgNew.GetText());
					grdInsert.SetGridText(row,G1_OLD_PK,old_pk_org);
					grdInsert.SetGridText(row,G1_OLD_VALUE,old_value_org);
				}
				
				if(lstAppointment.value == "02")
				{
					grdInsert.SetGridText(row,G1_NEW_PK,lstPosNew.value);
					grdInsert.SetGridText(row,G1_NEW_VALUE,lstPosNew.GetText());
					grdInsert.SetGridText(row,G1_OLD_PK,old_pk_pos);
					grdInsert.SetGridText(row,G1_OLD_VALUE,old_value_pos);
				}
				
				if(lstAppointment.value=="03")
				{
					grdInsert.SetGridText(row,G1_NEW_PK,lstJobNew.value);
					grdInsert.SetGridText(row,G1_NEW_VALUE,lstJobNew.GetText());
					grdInsert.SetGridText(row,G1_OLD_PK,old_pk_job);
					grdInsert.SetGridText(row,G1_OLD_VALUE,old_value_job);
				}
				
				if(lstAppointment.value =="04")
				{
					grdInsert.SetGridText(row,G1_NEW_VALUE,txtSalary.text);
					grdInsert.SetGridText(row,G1_OLD_VALUE,old_value_sal);
				}
				if(dtFromDate.value != "")	
					grdInsert.SetGridText(row, G1_APPOINTMENT_F_DT, dtFromDate.value);
				
				if(dtToDate.value != "")	
					grdInsert.SetGridText(row, G1_APPOINTMENT_T_DT, dtToDate.value);
											
				if(txtDescription.text != "")
					grdInsert.SetGridText(row, G1_DESCRIPTION, txtDescription.text);
				if(txtApprovePK.text !="")
				{
					grdInsert.SetGridText(row,G1_EMP_APPROVE_PK,txtApprovePK.text);
					grdInsert.SetGridText(row,G1_APPROVE_BY,txtApproveName.text);
				}
			
			}
		}
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
		{			
			for(j=1;j<grdSearch.rows;j++)
			{
				if (grdSearch.GetGridData(j, 0) == "-1")
				{
					var emp_pk = grdSearch.GetGridData(j,G_EMP_PK);
					if(lstAppointment.value =="01")
					{
						var old_pk = grdSearch.GetGridData(j,G_ORG_PK);
						var old_value = grdSearch.GetGridData(j,G_ORGANIZATION);
					}
					if(lstAppointment.value == "02")
					{
						var old_pk = grdSearch.GetGridData(j,G_POSITION_VALUE);
						var old_value = grdSearch.GetGridData(j,G_POSITION);
					}
					if(lstAppointment.value == "03")
					{
						var old_pk = grdSearch.GetGridData(j,G_JOB_VALUE);
						var old_value = grdSearch.GetGridData(j,G_JOB);
					}
					if(lstAppointment.value == "04")
					{
						var old_value = grdSearch.GetGridData(j,G_SALARY);
					}
				}
				for(k=1;k<grdInsert.rows;k++)
				{
					var emp_pk_insert = grdInsert.GetGridData(k,G1_EMP_PK);				
					if (emp_pk == emp_pk_insert)
					{
						if(lstAppointment.value =="01")
						{
							grdInsert.SetGridText(k,G1_OLD_PK,old_pk);
							grdInsert.SetGridText(k,G1_OLD_VALUE,old_value);
						}
						if(lstAppointment.value =="02")
						{
							grdInsert.SetGridText(k,G1_OLD_PK,old_pk);
							grdInsert.SetGridText(k,G1_OLD_VALUE,old_value);
						}
						if(lstAppointment.value =="03")
						{
							grdInsert.SetGridText(k,G1_OLD_PK,old_pk);
							grdInsert.SetGridText(k,G1_OLD_VALUE,old_value);
						}
						if(lstAppointment.value =="04")
						{
							grdInsert.SetGridText(k,G1_OLD_VALUE,old_value);
						}
					}
				}
			}
			if(lstAppointment.value !="")
				grdInsert.SetGridText(i, G1_APPOINTMENT, lstAppointment.value);
			
			if(lstOrgNew.value != "" &&  lstAppointment.value == "01")
			{
				grdInsert.SetGridText(i, G1_NEW_PK, lstOrgNew.value);
				grdInsert.SetGridText(i,G1_NEW_VALUE,lstOrgNew.GetText());
			}
			
			if(lstPosNew.value != "" &&  lstAppointment.value == "02")
			{
				grdInsert.SetGridText(i, G1_NEW_PK, lstPosNew.value);
				grdInsert.SetGridText(i,G1_NEW_VALUE,lstPosNew.GetText());
			}
			
			if(lstJobNew.value != "" &&  lstAppointment.value == "03")
			{
				grdInsert.SetGridText(i, G1_NEW_PK, lstJobNew.value);
				grdInsert.SetGridText(i,G1_NEW_VALUE,lstJobNew.GetText());
			}
			
			if(txtSalary.text != "" &&  lstAppointment.value == "04")
			{
				grdInsert.SetGridText(i,G1_NEW_VALUE,txtSalary.text);
			}
			
			if(dtFromDate.value != "")	
				grdInsert.SetGridText(i, G1_APPOINTMENT_F_DT, dtFromDate.value);
			
			if(dtToDate.value != "")	
				grdInsert.SetGridText(i, G1_APPOINTMENT_T_DT, dtToDate.value);
				
						
			if(txtDescription.text != "")
				grdInsert.SetGridText(i, G1_DESCRIPTION, txtDescription.text);
			if(txtApprovePK.text !="")
			{
				grdInsert.SetGridText(i,G1_EMP_APPROVE_PK,txtApprovePK.text);
				grdInsert.SetGridText(i,G1_APPROVE_BY,txtApproveName.text);
			}
		}
				   
	}
	
}
function OnSetSeq()
{
	txtSeq.text = new Date().getTime();
	for ( var i =  1 ; i < grdInsert.rows ; i++ )
	{
		grdInsert.SetGridText(i, G1_SEQ, txtSeq.text);
	}
}
function OnSelectAll(obj_checkbox,obj_grd,obj_col)
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
function OnChangeSetBy()
{
	if (lstAppointment.value == "01")
	{
		td1.style.display="";
		td2.style.display="none";
		td3.style.display="none";
		td4.style.display="none";
	}
	else if (lstAppointment.value == "02")
	{
		td1.style.display="none";
		td2.style.display="";
		td3.style.display="none";
		td4.style.display="none";
	}
	else if(lstAppointment.value == "03")
	{
		td1.style.display="none";
		td2.style.display="none";
		td3.style.display="";
		td4.style.display="none";
	}
	else if(lstAppointment.value == "04")
	{
		td1.style.display="none";
		td2.style.display="none";
		td3.style.display="none";
		td4.style.display="";
	}
	else
	{
		td1.style.display="none";
		td2.style.display="none";
		td3.style.display="none";
		td4.style.display="none";
	}
}

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'grid':
		{
			var col=event.col;
			if(col==G1_APPROVE_BY)
			{
				
				var strcom;
				var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	
				//var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
				if (obj!=null)
				{
					rowclick= event.row;
					grdInsert.SetGridText(rowclick,G1_EMP_APPROVE_PK,obj[0]);
					grdInsert.SetGridText(rowclick,G1_APPROVE_BY,obj[2]);          
				}    
			}
		}
		break;
		case 'Approve':
		{
			var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
			var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			if(obj!= null)
			{
				txtApproveName.text = obj[2];
                txtApprovePK.text   = obj[0];
			}
		}
		break;
	}
}
</script>

<body>
 
    <!---------------------------------------------------------------->
    <gw:data id="data_hrem01201_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="5" type="grid" function="ST_HR_SEL_HREM01201_1" > 
                  <input bind="grdSearch" >
                    <input bind="lstOrg" />
                    <input bind="lstStatus" />
                    <input bind="txtEmployee" />
					<input bind="txtlanguage"/>
                  </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="data_hrem01201_0" onreceive="OnReceiveData(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,5,6,7,8,9,10,11,12,13,14,15,16" function="ST_HR_SEL_HREM01201_0" procedure="ST_HR_UPD_HREM01201_0"> 
                <input bind="grdInsert" >
                    <input bind="txtSeq" /> 
                </input>
                <output  bind="grdInsert" />
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
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        
        <tr style="height: 5%">
            <td colspan=5 style="width: 5%" align="right">
				<gw:checkbox id="chkCheckReport" value="F" onclick="OnSelectAll(chkCheckReport,grdSearch,0)" ></gw:checkbox >
			</td>
            <td colspan=10 style="width: 10%" align="right">
                Organization
            </td>
            <td colspan=15 style="width: 15%">
                <gw:list id="lstOrg" styles="width:100%" onchange="OnSearch(1)" />
            </td>
			<td colspan=10 style="width: 10%" align="right">
                Status
            </td>
            <td colspan=15 style="width: 15%">
                <gw:list id="lstStatus" styles="width:100%" onchange="OnSearch(1)" />
            </td>
            <td colspan=10 style="width: 10%" align="right">
                Employee
            </td>
            <td colspan=15 style="width: 15%">
                <gw:textbox id="txtEmployee" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td colspan=10 style="width: 10%" align="center">
               
            </td>
            <td colspan=5 style="width: 5%" >
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
			<td colspan=5 style="width: 5%" >
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSearch)" />
            </td>
        </tr>
        <tr style="height: 35%">
            <td colspan="100">
				 <gw:grid id="grdSearch" 
				    header="V|_EMP_PK|Organization|Employee ID|Employee Name|Join Date|_ORG_PK|_pk position|Position|_pk job|Job|Salary"
                    format="3|0|0|0|0|0|0|0|0|0|0|-0" 
					aligns="0|0|0|0|0|1|3|3|0|0|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
					widths="500|1500|1500|0|1500|1500|1500|1500|1500|1000|1000|1000"                
                    styles="width:100%; height:100%" autosize="T" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 5%">
            <td colspan="85">
				<fieldset style="padding: 5;">
					<legend ><font class="eco_blue" ><b>Update Data</b></font></legend>	
						<table style="background:#D6EAF8;width: 100%; height: 100%" >
							<tr>
								<td colspan=2 style="width: 2%">
								</td>
								<td colspan=10 style="width: 10%">
									From Date
								</td>
								<td colspan=20 style="width: 20%">
									<gw:datebox id="dtFromDate" nullaccept  styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=2 style="width: 2%">
								</td>
								<td colspan=10 style="width: 10%">
									To Date
								</td>
								<td colspan=20 style="width: 20%">
									<gw:datebox id="dtToDate" nullaccept  styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>	
								<td colspan=2 style="width: 2%">
								</td>
								<td colspan=10 style="width: 10%">
									Description
								</td>
								<td colspan=20 style="width: 20%">
									<gw:textbox id="txtDescription" styles="width:100%"/>
								</td>
							</tr>
							<tr>
								<td colspan=2 style="width: 2%">
								</td>
								<td colspan=10 style="width: 10%">
									<a title="Approve" onclick="OnPopUp('Approve')" href="#tips" class="eco_link">Approve By</a>
								</td>
								<td colspan=20 style="width: 20%">
									<gw:textbox id="txtApprovePK" styles="display:none" />
									<gw:textbox id="txtApproveName" styles="width:100%" />
								</td>
								<td colspan=2 style="width: 2%">
								</td>
								<td colspan=10 style="width: 10%">
									Appointment Type
								</td>
								<td colspan=20 style="width: 20%">
									<gw:list id="lstAppointment" styles="width:100%" onchange="OnChangeSetBy()" />
								</td>
								<td colspan=2 style="width: 2%">
								</td>
								<td id="td1" colspan=20 style="width: 20%;display:none" align="left" >
									<gw:list id="lstOrgNew" styles="width:100%" onchange="" />
								</td>
								<td id="td2" colspan=20 style="width: 20%;display:none" align="left" >
									<gw:list id="lstPosNew" styles="width:100%" onchange="" />
								</td>
								<td id="td3" colspan=20 style="width: 15%;display:none" align="left" >
									<gw:list id="lstJobNew" styles="width:100%" onchange="" />
								</td>
								<td id="td4" colspan=20 style="width: 15%;display:none" align="left" >
									<gw:textbox id="txtSalary" styles="width:100%"/>
								</td>
							</tr>
							
						</table>
				</fieldset>
            </td>
			<td colspan="15">
				<table style="background:#D6EAF8">
					<tr>
						<td style="width: 1%">
							<gw:button id="ibtnUpdate" img="set" alt="Update" onclick="OnSetGrid()" />
						</td>
						<td style="width: 1%">
							<gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
						</td>
						<td style="width: 1%">
							<gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
						</td>
					</tr>
				</table>
				
			</td>
        </tr>
        <tr style="height: 55%">
            <td colspan="100">
                <gw:grid id="grdInsert" 
				    header="No|_EMP_PK|Organization|Emp ID|Full Name|Appointment Type(*)|_Old PK|Old Value|_New pk|New Value|_Approve_PK|Approve By(*)|Approve Date|Apply From Date(*)|Apply To Date|Description|_SEQ"
                    format="0|0|0|0|0|0|0|-0|0|-0|0|0|0|4|4|0|0" 
					aligns="0|0|0|0|0|0|1|3|3|0|0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1" 
					widths="500|1500|1500|500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"                
                    styles="width:100%; height:100%" 
					autosize="T" 
					sorting="T"
					oncelldblclick="OnPopUp('grid')"	
						/>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
<gw:textbox id="txtSeq" styles="display:none"/>
<gw:textbox id = "txtlanguage" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
</body>
</html>
