<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var strcodereturn;
var binit=true;
var flag_header=true;
var flag_header2=true;
var tab2 = false;
var tab4 = false;
var flag_wg=1;
var flag_tab=1;
var check_init = 0;

var g1_org = 0,
    g1_group = 1,
    g1_emp_id = 2,
    g1_full_nm = 3,
    g1_join_dt = 4,
    g1_prob_sal = 5,
    g1_contract = 6,
    g1_pos1 = 7,
    g1_sal_level1 = 8,
    g1_sal_level2 = 9,
    g1_confirm_dt = 10,
    g1_allow1 = 11,
    g1_allow2 = 12,
    g1_allow3 = 13,
    g1_allow4 = 14,
    g1_allow5 = 15,
    g1_allow6 = 16,
    g1_allow7 = 17,
    g1_allow8 = 18,
    g1_allow9 = 19,
    g1_allow10 = 20,
    g1_allow11 = 21,
    g1_allow12 = 22,
    g1_pos2 = 23,
    g1_sal_level1_2 = 24,
    g1_sal_level2_2 = 25,
    g1_confirm_dt_2 = 26,
    g1_allow1_2 = 27,
    g1_allow2_2 = 28,
    g1_allow3_2 = 29,
    g1_allow4_2 = 30,
    g1_allow5_2 = 31,
    g1_allow6_2 = 32,
    g1_allow7_2 = 33,
    g1_allow8_2 = 34,
    g1_allow9_2 = 35,
    g1_allow10_2 = 36,
    g1_allow11_2 = 37,
    g1_allow12_2 = 38,
    g1_seq = 39;

function BodyInit()
{
   System.Translate_V2(document, System.Menu.GetMenuPS());
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
   SetGridHeader(grdSalary);
    
   grdSalary.GetGridControl().FrozenCols =5;
   grdSalary2.GetGridControl().FrozenCols =5;
   grdSalary3.GetGridControl().FrozenCols = 5; 
   grdSalary.GetGridControl().ScrollTrack=true;
   grdSalary2.GetGridControl().ScrollTrack=true;
   grdSalary3.GetGridControl().ScrollTrack = true;
   grdSalary4.GetGridControl().FrozenCols = 5; 
   grdSalary4.GetGridControl().ScrollTrack = true;
        
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00300', 1) FROM DUAL")%>";
   lstReport.SetDataText(data);
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00300', 2) FROM DUAL")%>";
   lstReport2.SetDataText(data);
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00300', 3) FROM DUAL" )%>";
   lstReport3.SetDataText(data);

   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstOrg.SetDataText(data);
   lstOrg.value ="ALL";
   ChangeColorItem(lstOrg.GetControl());
   
   lstOrg2.SetDataText(data);
   lstOrg2.value ="ALL";
   ChangeColorItem(lstOrg2.GetControl());
   
   lstOrg3.SetDataText(data);
   lstOrg3.value ="ALL";
   ChangeColorItem(lstOrg3.GetControl());
   
   lstOrg4.SetDataText(data);
   lstOrg4.value ="ALL";
   ChangeColorItem(lstOrg4.GetControl());
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstWGroup.SetDataText(data);
   lstWGroup.value ="ALL";
   
   lstWGroup2.SetDataText(data);
   lstWGroup2.value ="ALL";
   
   lstWGroup3.SetDataText(data);
   lstWGroup3.value ="ALL";
   
   lstWGroup4.SetDataText(data);
   lstWGroup4.value ="ALL";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstPosition.SetDataText(data);
   lstPosition.value ="ALL";
   
   lstPosition2.SetDataText(data);
   lstPosition2.value ="ALL";
   
   lstPosition3.SetDataText(data);
   lstPosition3.value ="ALL";
   
   lstPosition4.SetDataText(data);
   lstPosition4.value ="ALL";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstEmp_Type.SetDataText(data);
   lstEmp_Type.value ="ALL";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstStatus.SetDataText(data);
   lstStatus.value ="A";
   
   lstStatus2.SetDataText(data);
   lstStatus2.value ="A";
   
   lstStatus3.SetDataText(data);
   lstStatus3.value ="A";
   
   lstStatus4.SetDataText(data);
   lstStatus4.value ="A";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0040', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstMoney.SetDataText(data);
   lstMoney.value ="ALL";
   
   lstMoney2.SetDataText(data);
   lstMoney2.value ="ALL";
   
   lstMoney3.SetDataText(data);
   lstMoney3.value ="ALL";
   
   lstMoney4.SetDataText(data);
   lstMoney4.value ="ALL";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstNation.SetDataText(data);
   lstNation.value ="01";
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstContract_Type2.SetDataText(data);
   lstContract_Type2.value ="ALL";
   
   lstContract_Type3.SetDataText(data);
   lstContract_Type3.value ="ALL";
   
   datAllowance.Call("SELECT");
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

//----------------------------------------------
//merge header 
function SetGridHeader(obj)
{
    var stt;
    
        
        var fg=obj.GetGridControl(); 
      if(obj==grdSalary)
        {  
            if (flag_header==true)
            {
                fg.rows=fg.rows+1;
                flag_header=false;
            }
        }    
        else if(obj==grdSalary2)
        {
            if (flag_header2==true)
            {
                fg.rows=fg.rows+1;
                flag_header2=false;
            }
        }
        fg.FixedRows = 2;
        fg.FixCols=1;
        fg.MergeCells =5	;// flexMergeFixedOnly	
        stt=0;//num column
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Organization";   //fg.Cell(CellPropertySettings,row, from_col, row, to_col)	
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "W-Group";   
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Emp ID";   
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Full Name"; 
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Join Date";
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Pro Sal";
        
        stt+=1;
        fg.MergeCol(stt) =true	;
        fg.Cell(0, 0, stt, 1, stt)  = "Contract";
        
        fg.MergeRow(0) =true	;
        stt+=1;
        if(obj==grdSalary)
        {
            fg.Cell(0, 0, stt, 0, stt+16)  = "Current Salary And Allowance Information";   
            obj.SetCellBgColor(0, stt,0, stt+16, 0x99FF99);
            obj.SetCellBgColor(1, stt,1, stt+16, 0x99FF99);
        }    
        else
        {
            fg.Cell(0, 0, stt, 0, stt+16)  = "Old Salary And Allowance Information";
            obj.SetCellBgColor(0, stt,0, stt+16, 0x99FF99);   
            obj.SetCellBgColor(1, stt,1, stt+16, 0x99FF99);
        }   
            
        fg.Cell(0, 1, stt, 1, stt) = "Position";
        
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Level1 Sal";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Level2 Sal";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Confirmed DT";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow1";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow2";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow3";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow4";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow5";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow6";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow7";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow8";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow9";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow10";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow11";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow12";
        
        stt+=1;
        if(obj==grdSalary)
        {
            fg.Cell(0, 0, stt, 0, stt+16) = dtMonth.text + " - Salary And Allowance Information";
            obj.SetCellBgColor(0, stt,0, stt+16, 0xFFCCFF);
            obj.SetCellBgColor(1, stt,1, stt+16, 0xFFCCFF);
        }    
        else
        {
            fg.Cell(0, 0, stt, 0, stt+16) = "New Salary And Allowance Information";
            obj.SetCellBgColor(0, stt,0, stt+16, 0xFFCCFF );
            obj.SetCellBgColor(1, stt,1, stt+16, 0xFFCCFF);
        }   
            
        fg.Cell(0, 1, stt, 1, stt) = "Position";
        
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Level1 Sal";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Level2 Sal";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Confirmed DT";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow1";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow2";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow3";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow4";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow5";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow6";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow7";
        stt+=1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow8";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow9";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow10";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow11";
        stt += 1;
        fg.Cell(0, 1, stt, 1, stt) = "Allow12";
        
        obj.SetCellBold(1,0,1,stt,true);
        fg.FontSize=8;
        
}
    //------------------------------------

function setColor(obj)
{
    if (obj != grdSalary3) {
        for (var i = 1; i < obj.rows; i++) {

            if (i > 1) {
                for (var j = 1; j <= 16; j++) {
                    if (j % 2 == 0) {
                        if (obj.GetGridData(i, j + g1_pos1) != obj.GetGridData(i, j + g1_pos2)) {
                            obj.SetCellFontColor(i, j + g1_pos1, i, j + g1_pos1, 0xFF3300);
                            //  obj.SetCellBold(i, j+6,i, j+6,true);
                            obj.SetCellFontColor(i, j + g1_pos2, i, j + g1_pos2, 0xFF3300);
                            //  obj.SetCellBold(i, j+18,i, j+18,true);
                        }
                    }
                    else {
                        obj.SetCellFontColor(i, j + g1_sal_level1, i, j + g1_sal_level1, 0xFF3300);
                        //  obj.SetCellBold(i, j+6,i, j+6,true);
                        obj.SetCellFontColor(i, j + g1_sal_level1_2, i, j + g1_sal_level1_2, 0xFF3300);
                        //  obj.SetCellBold(i, j+18,i, j+18,true);
                    }

                }
            }
        }
    }
    else {
        for (var i = 1; i < obj.rows; i++)
            for (var j = 7; j <= 33; j++)
                if (obj.GetGridData(i, j) != obj.GetGridData(i, j - 1) && !isNaN(obj.GetGridData(i, j)) && !isNaN(obj.GetGridData(i, j - 1)))//thay doi luong
                {
                    obj.SetCellFontColor(i, j, i, j, 0x300FF3);
                    //obj.SetCellBold(i,j,i,j,true);
                }

    }
}

//----------------------------------
function OnShowPopup(n)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
		{
            lstOrg.value=obj;
			onChange_org(1,lstOrg);
		}	
        else if(n==2)
		{
            lstOrg2.value=obj;
			onChange_org(2,lstOrg2);
		}	
        else if(n==3)
		{
            lstOrg3.value=obj;  
			onChange_org(3,lstOrg3);
		}	
        else 
		{
            lstOrg4.value=obj;      
			
		}	
                
    }
    
}
//------------------------------------
function OnChangeMonth(n)
{
    if(n==1)
    {
        grdSalary.ClearData();
        grdSalary.GetGridControl().Cell(0, 0, 19, 0, 30) = "Month ("+dtMonth.text+") Information";        
    }
    
}
//----------------------------------------------------
function ChoseList_box(obj_list,value)
{
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//----------------------------------------------
function OnDataReceive(obj)
{
	  if (obj.id=="datAllowance")
	   {
			allowance_grid_control(grdSalary);
			if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
					datUser_info.Call(); 
			else
				check_init=1;
	   }
	   
	   else if(obj.id=="datSalary")
	   {
	       lblRecord.text = grdSalary.rows - 2 ;
			if(grdSalary.rows-1>0)
			{
				SetGridHeader(grdSalary);
				setColor(grdSalary);
				Get_allowance_name(grdSalary)
				var font_size=0;
				if(img1.status=="large")
					font_size=11;
					
				auto_resize_column(grdSalary,0,grdSalary.cols-1,font_size);
				 
			}   
			
			
	   }
	   else if (obj.id=="datUser_info")
	   {
			lstOrg.SetDataText(txtDeptData.text);
			lstOrg2.SetDataText(txtDeptData.text);
			lstOrg3.SetDataText(txtDeptData.text);
			lstOrg4.SetDataText(txtDeptData.text);

            ChangeColorItem(lstOrg.GetControl());
            ChangeColorItem(lstOrg2.GetControl());
            ChangeColorItem(lstOrg3.GetControl());
            ChangeColorItem(lstOrg4.GetControl()); 

			onChange_org(0,lstOrg);
			
	   }
	   else if(obj.id=="datSalary2")
	   {
			lblRecord2.text=grdSalary2.rows-2 ;
			if(grdSalary2.rows-1>0)
			{
				SetGridHeader(grdSalary2);
				setColor(grdSalary2);
				Get_allowance_name(grdSalary2)
				var font_size=0;
				if(img2.status=="large")
					font_size=11;
					
				auto_resize_column(grdSalary2, 0, grdSalary2.cols - 1, font_size);
			}   
			
	   }
	   else if(obj.id=="datSalary3")
	   {
	       lblRecord3.text = grdSalary3.rows - 1 ;
			//setColor(grdSalary3);
			var font_size=0;
			if(img3.status=="large")
					font_size=11;
			auto_resize_column(grdSalary3,0,grdSalary3.cols-1,font_size);
	   }
	   else if(obj.id=="datSalary4")
	   {
	       lblRecord4.text = grdSalary4.rows - 1 ;
	       auto_resize_column(grdSalary4, 0, grdSalary4.cols - 1, 9);
	   }
	   else if (obj.id == "datFind_Report")
	   {
			var url = System.RootURL;

			switch (txtReportCode_tmp.text) {
			    case "201":
			        url = url + txtReport_tmp.text + '?org=' + lstOrg.value + '&wg=' + lstWGroup.value + '&pos=' + lstPosition.value + '&txttmp=' + txtTemp.text + '&dtyear=' + dtMonth.value + '&contract=' + lstContract_Type.value;
			        url = url + '&status=' + lstStatus.value + '&fromjoin=' + dtFrom_JoinDate.value + '&tojoin=' + dtTo_JoinDate.value + '&lstmoney=' + lstMoney.value;
			        break;
			    case "202":
			        url = url + txtReport_tmp.text + '?org=' + lstOrg2.value + '&wg=' + lstWGroup2.value + '&pos=' + lstPosition2.value + '&txttmp=' + txtTemp_2.text + '&dtyear=' + dtMonth2.value + '&contract=' + lstContract_Type2.value;
			        url = url + '&status=' + lstStatus2.value + '&fromjoin=' + dtFrom_JoinDate2.value + '&tojoin=' + dtTo_JoinDate2.value + '&lstmoney=' + lstMoney2.value
			        break;
			    case "203":
			        url = url + txtReport_tmp.text + '?org=' + lstOrg3.value + '&wg=' + lstWGroup3.value + '&pos=' + lstPosition3.value + '&txttmp=' + txtTemp3.text + '&dtyear=' + dtYear3.value + '&contract=' + lstContract_Type3.value;
			        url = url + '&status=' + lstStatus3.value + '&fromjoin=' + dtFrom_JoinDate3.value + '&tojoin=' + dtTo_JoinDate3.value + '&lstmoney=' + lstMoney3.value
			        break;
			    
			}

			window.open(url);
	   }
   else if (obj.id=="datWorkGroup_info")
   {
		
		switch (flag_tab) 
		{
			case 0:
			{
				lstWGroup.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstWGroup2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstWGroup3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWGroup.value='ALL';
                lstWGroup2.value='ALL';
                lstWGroup3.value='ALL';
				break;
			}
			case 1:
			{
				lstWGroup.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWGroup.value='ALL';
				break;
			}	
			case 2:
			{
				lstWGroup2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWGroup2.value='ALL';
				break;
			}
			case 3:
			{
				lstWGroup3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWGroup3.value='ALL';
				break;
			}
			
		}
		check_init=1;
	}	
   
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//--------------------------------------------------
function allowance_grid_control(obj)
{
    var icol = g1_allow1; //value of allowance col
    obj.SetGridText(1, icol, grdAllowance.GetGridData(1, 0));
    obj.SetGridText(1, icol + 1, grdAllowance.GetGridData(1, 1));
    obj.SetGridText(1, icol + 2, grdAllowance.GetGridData(1, 2));
    obj.SetGridText(1, icol + 3, grdAllowance.GetGridData(1, 3));
    obj.SetGridText(1, icol + 4, grdAllowance.GetGridData(1, 4));
    obj.SetGridText(1, icol + 5, grdAllowance.GetGridData(1, 5));
    obj.SetGridText(1, icol + 6, grdAllowance.GetGridData(1, 6));
    obj.SetGridText(1, icol + 7, grdAllowance.GetGridData(1, 7));
    obj.SetGridText(1, icol + 8, grdAllowance.GetGridData(1, 8));
    obj.SetGridText(1, icol + 9, grdAllowance.GetGridData(1, 9));
    obj.SetGridText(1, icol + 10, grdAllowance.GetGridData(1, 10));
    obj.SetGridText(1, icol + 11, grdAllowance.GetGridData(1, 11));
    obj.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
    obj.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
    obj.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
    obj.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
    obj.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
    obj.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
    obj.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
    obj.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
    obj.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
    obj.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
    obj.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
    obj.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));

    icol = g1_allow1_2;
    obj.SetGridText(1, icol, grdAllowance.GetGridData(1, 0));
    obj.SetGridText(1, icol + 1, grdAllowance.GetGridData(1, 1));
    obj.SetGridText(1, icol + 2, grdAllowance.GetGridData(1, 2));
    obj.SetGridText(1, icol + 3, grdAllowance.GetGridData(1, 3));
    obj.SetGridText(1, icol + 4, grdAllowance.GetGridData(1, 4));
    obj.SetGridText(1, icol + 5, grdAllowance.GetGridData(1, 5));
    obj.SetGridText(1, icol + 6, grdAllowance.GetGridData(1, 6));
    obj.SetGridText(1, icol + 7, grdAllowance.GetGridData(1, 7));
    obj.SetGridText(1, icol + 8, grdAllowance.GetGridData(1, 8));
    obj.SetGridText(1, icol + 9, grdAllowance.GetGridData(1, 9));
    obj.SetGridText(1, icol + 10, grdAllowance.GetGridData(1, 10));
    obj.SetGridText(1, icol + 11, grdAllowance.GetGridData(1, 11));
    obj.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
    obj.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
    obj.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
    obj.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
    obj.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
    obj.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
    obj.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
    obj.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
    obj.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
    obj.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
    obj.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
    obj.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));
}
//-------------------------------------------------
function Get_allowance_name(obj)
{
    var icol = g1_allow1; //value of allowance col
    obj.SetGridText(1, icol, grdAllowance.GetGridData(1, 0));
    obj.SetGridText(1, icol + 1, grdAllowance.GetGridData(1, 1));
    obj.SetGridText(1, icol + 2, grdAllowance.GetGridData(1, 2));
    obj.SetGridText(1, icol + 3, grdAllowance.GetGridData(1, 3));
    obj.SetGridText(1, icol + 4, grdAllowance.GetGridData(1, 4));
    obj.SetGridText(1, icol + 5, grdAllowance.GetGridData(1, 5));
    obj.SetGridText(1, icol + 6, grdAllowance.GetGridData(1, 6));
    obj.SetGridText(1, icol + 7, grdAllowance.GetGridData(1, 7));
    obj.SetGridText(1, icol + 8, grdAllowance.GetGridData(1, 8));
    obj.SetGridText(1, icol + 9, grdAllowance.GetGridData(1, 9));
    obj.SetGridText(1, icol + 10, grdAllowance.GetGridData(1, 10));
    obj.SetGridText(1, icol + 11, grdAllowance.GetGridData(1, 11));

    icol = g1_allow1_2;
    obj.SetGridText(1, icol, grdAllowance.GetGridData(1, 0));
    obj.SetGridText(1, icol + 1, grdAllowance.GetGridData(1, 1));
    obj.SetGridText(1, icol + 2, grdAllowance.GetGridData(1, 2));
    obj.SetGridText(1, icol + 3, grdAllowance.GetGridData(1, 3));
    obj.SetGridText(1, icol + 4, grdAllowance.GetGridData(1, 4));
    obj.SetGridText(1, icol + 5, grdAllowance.GetGridData(1, 5));
    obj.SetGridText(1, icol + 6, grdAllowance.GetGridData(1, 6));
    obj.SetGridText(1, icol + 7, grdAllowance.GetGridData(1, 7));
    obj.SetGridText(1, icol + 8, grdAllowance.GetGridData(1, 8));
    obj.SetGridText(1, icol + 9, grdAllowance.GetGridData(1, 9));
    obj.SetGridText(1, icol + 10, grdAllowance.GetGridData(1, 10));
    obj.SetGridText(1, icol + 11, grdAllowance.GetGridData(1, 11));
        
}        

//----------------------------------------------------
function OnSearch(obj_dat)
{
	if(check_init==1)
		obj_dat.Call("SELECT");
}
//-------------------------------------------------------------
function PrintSelection(grid, Row1, Col1, Row2, Col2)
{
    
        // save current settings
        var fg=grid.GetGridControl();
        var hl, tr, lc, rd
        hl = fg.HighLight;
        tr = fg.TopRow;
        lc = fg.LeftCol;
        rd = fg.Redraw
        fg.HighLight = 0
        fg.Redraw = 0
    
       
        fg.HighLight = hl;
        fg.Redraw = rd;
}
function print_grid(obj)
{
    
    
}
function OnReport(obj) {
    if (obj == 1) //tab thu nhat
    {
        //txtReport_tmp.text = "rpt_salary_summary.aspx";
        txtReportCode_tmp.text = lstReport.value;
        txtOrg_tmp_pk.text = lstOrg.value;
    }
    else if (obj == 2) // tab thu 2
    {
        //txtReport_tmp.text = "rpt_salary_change.aspx";
        txtReportCode_tmp.text = lstReport2.value;
        txtOrg_tmp_pk.text = lstOrg2.value;
    }
    else if (obj == 3) {
        //txtReport_tmp.text = "rpt_salary_year.aspx";
        txtReportCode_tmp.text = lstReport3.value;
        txtOrg_tmp_pk.text = lstOrg3.value;
    }
    //else if(obj==4) //tab thu 4
    //{
    //    txtReport_tmp.text = "rpt_event_salary_change.aspx";
    //    txtReportCode_tmp.text = lstReport4.value;
    //    txtOrg_tmp_pk.text = lstOrg4.value;
    //}          
    datFind_Report.Call();
}
function OnToggle(n)
{
    switch(n)
    {
        case 1:
            if(img1.status == "min")
            {
                img1.status = "large";
                img1.src = "../../../../system/images/iconmaximize.gif";
			    img1.alt="Show more columns";
			    visible_grdSalary(grdSalary,2);
    			
            }
            else if(img1.status == "large")
            {
                img1.status = "min";
                img1.src = "../../../../system/images/close_popup.gif";
			    img1.alt="Hide column";
			    visible_grdSalary(grdSalary,1);
            }
            break;
       case 2:
            if(img2.status == "min")
            {
                img2.status = "large";
                img2.src = "../../../../system/images/iconmaximize.gif";
			    img2.alt="Show more columns";
			    visible_grdSalary(grdSalary2,2);
            }
            else if(img2.status == "large")
            {
                img2.status = "min";
                img2.src = "../../../../system/images/close_popup.gif";
			    img2.alt="Hide column";
			    visible_grdSalary(grdSalary2,1);
            }
           
            break;   
       case 3:
            if(img3.status == "min")
            {
                img3.status = "large";
                img3.src = "../../../../system/images/iconmaximize.gif";
			    img3.alt="Show more columns";
			    visible_grdSalary(grdSalary3,2);
            }
            else if(img3.status == "large")
            {
                img3.status = "min";
                img3.src = "../../../../system/images/close_popup.gif";
			    img3.alt="Hide column";
			    visible_grdSalary(grdSalary3,1);
            }
           
            break;        
       
    }    
    
  
}
function visible_grdSalary(obj,n)
{
   
        switch(n)
        {
            case 1://middle
               
                obj.GetGridControl().ColHidden(0)=0;
                
                obj.GetGridControl().ColHidden(4)=0;
                obj.GetGridControl().ColHidden(5)=0;
                if(obj!=grdSalary3)
                    obj.GetGridControl().ColHidden(6)=0;
                auto_resize_column(obj,0,obj.cols-1,8);      
                break;
            case 2://hide all
                //alert(3)
                obj.GetGridControl().ColHidden(0)=1;
                if(obj!=grdSalary3)
                    obj.GetGridControl().ColHidden(1)=1;
            
                obj.GetGridControl().ColHidden(4)=1;
                obj.GetGridControl().ColHidden(5)=1;
                if(obj!=grdSalary3)
                    obj.GetGridControl().ColHidden(6)=1;
                    
                auto_resize_column(obj,0,obj.cols-1,11); //obj,col1,col2,font_size  
                break;    
        }
    
}
//-------------------------------------------------------------
function onPage_active()
{
    if(tabMain.GetCurrentPageNo()==1)
    {
        if(tab2==false)
        {
           SetGridHeader(grdSalary2);
           allowance_grid_control(grdSalary2);
           tab2=true;
            //txtDept.text=lstOrg2.value;
         }   
        
    }
    else if (tabMain.GetCurrentPageNo() == 3)
    {
        if (tab4 == false)
        {
            var icol = 11; //value of allowance col
            grdSalary4.SetGridText(0, icol, grdAllowance.GetGridData(1, 0) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 1, grdAllowance.GetGridData(1, 1) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 2, grdAllowance.GetGridData(1, 2) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 3, grdAllowance.GetGridData(1, 3) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 4, grdAllowance.GetGridData(1, 4) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 5, grdAllowance.GetGridData(1, 5) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 6, grdAllowance.GetGridData(1, 6) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 7, grdAllowance.GetGridData(1, 7) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 8, grdAllowance.GetGridData(1, 8) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 9, grdAllowance.GetGridData(1, 9) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 10, grdAllowance.GetGridData(1, 10) + "_L1 Old");
            grdSalary4.SetGridText(0, icol + 11, grdAllowance.GetGridData(1, 11) + "_L1 Old");
            grdSalary4.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
            grdSalary4.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
            grdSalary4.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
            grdSalary4.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
            grdSalary4.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
            grdSalary4.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
            grdSalary4.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
            grdSalary4.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
            grdSalary4.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
            grdSalary4.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
            grdSalary4.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
            grdSalary4.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));

            icol = 23;

            grdSalary4.SetGridText(0, icol, grdAllowance.GetGridData(1, 0) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 1, grdAllowance.GetGridData(1, 1) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 2, grdAllowance.GetGridData(1, 2) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 3, grdAllowance.GetGridData(1, 3) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 4, grdAllowance.GetGridData(1, 4) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 5, grdAllowance.GetGridData(1, 5) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 6, grdAllowance.GetGridData(1, 6) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 7, grdAllowance.GetGridData(1, 7) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 8, grdAllowance.GetGridData(1, 8) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 9, grdAllowance.GetGridData(1, 9) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 10, grdAllowance.GetGridData(1, 10) + "_L2 Old");
            grdSalary4.SetGridText(0, icol + 11, grdAllowance.GetGridData(1, 11) + "_L2 Old");
            grdSalary4.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
            grdSalary4.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
            grdSalary4.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
            grdSalary4.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
            grdSalary4.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
            grdSalary4.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
            grdSalary4.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
            grdSalary4.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
            grdSalary4.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
            grdSalary4.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
            grdSalary4.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
            grdSalary4.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));

            icol = icol + 12; //value of allowance col
            grdSalary4.SetGridText(0, icol, grdAllowance.GetGridData(1, 0) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 1, grdAllowance.GetGridData(1, 1) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 2, grdAllowance.GetGridData(1, 2) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 3, grdAllowance.GetGridData(1, 3) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 4, grdAllowance.GetGridData(1, 4) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 5, grdAllowance.GetGridData(1, 5) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 6, grdAllowance.GetGridData(1, 6) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 7, grdAllowance.GetGridData(1, 7) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 8, grdAllowance.GetGridData(1, 8) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 9, grdAllowance.GetGridData(1, 9) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 10, grdAllowance.GetGridData(1, 10) + "_L1 New");
            grdSalary4.SetGridText(0, icol + 11, grdAllowance.GetGridData(1, 11) + "_L1 New");
            grdSalary4.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
            grdSalary4.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
            grdSalary4.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
            grdSalary4.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
            grdSalary4.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
            grdSalary4.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
            grdSalary4.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
            grdSalary4.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
            grdSalary4.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
            grdSalary4.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
            grdSalary4.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
            grdSalary4.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));

            icol = icol + 12;

            grdSalary4.SetGridText(0, icol, grdAllowance.GetGridData(1, 0) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 1, grdAllowance.GetGridData(1, 1) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 2, grdAllowance.GetGridData(1, 2) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 3, grdAllowance.GetGridData(1, 3) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 4, grdAllowance.GetGridData(1, 4) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 5, grdAllowance.GetGridData(1, 5) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 6, grdAllowance.GetGridData(1, 6) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 7, grdAllowance.GetGridData(1, 7) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 8, grdAllowance.GetGridData(1, 8) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 9, grdAllowance.GetGridData(1, 9) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 10, grdAllowance.GetGridData(1, 10) + "_L2 New");
            grdSalary4.SetGridText(0, icol + 11, grdAllowance.GetGridData(1, 11) + "_L2 New");
            grdSalary4.GetGridControl().ColHidden(icol) = !(Number(grdAllowance.GetGridData(1, 12)));
            grdSalary4.GetGridControl().ColHidden(icol + 1) = !(Number(grdAllowance.GetGridData(1, 13)));
            grdSalary4.GetGridControl().ColHidden(icol + 2) = !(Number(grdAllowance.GetGridData(1, 14)));
            grdSalary4.GetGridControl().ColHidden(icol + 3) = !(Number(grdAllowance.GetGridData(1, 15)));
            grdSalary4.GetGridControl().ColHidden(icol + 4) = !(Number(grdAllowance.GetGridData(1, 16)));
            grdSalary4.GetGridControl().ColHidden(icol + 5) = !(Number(grdAllowance.GetGridData(1, 17)));
            grdSalary4.GetGridControl().ColHidden(icol + 6) = !(Number(grdAllowance.GetGridData(1, 18)));
            grdSalary4.GetGridControl().ColHidden(icol + 7) = !(Number(grdAllowance.GetGridData(1, 19)));
            grdSalary4.GetGridControl().ColHidden(icol + 8) = !(Number(grdAllowance.GetGridData(1, 20)));
            grdSalary4.GetGridControl().ColHidden(icol + 9) = !(Number(grdAllowance.GetGridData(1, 21)));
            grdSalary4.GetGridControl().ColHidden(icol + 10) = !(Number(grdAllowance.GetGridData(1, 22)));
            grdSalary4.GetGridControl().ColHidden(icol + 11) = !(Number(grdAllowance.GetGridData(1, 23)));

            tab4 = true;

        }
    }
}
//------------------------------------------
function  OnClickGrid(n)
{
    switch(n)
    {
        case 1:
            if (event.col<=3) // emp id, hoac ten 
            {
                var emp_id=grdSalary.GetGridData(event.row,2);
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary_his.aspx?emp_id=" + emp_id;
                window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:60;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
            }
            else if(event.col>7) // 
            {
                var emp_id=grdSalary.GetGridData(event.row,2);
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary.aspx?emp_id=" + emp_id;
                window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:60;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
            }
            break;
        case 2:
                var emp_id=grdSalary.GetGridData(event.row,2);
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary.aspx?emp_id=" + emp_id;
                window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:60;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
            break;    
    }    
}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}


</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-------------------data control----------------------->
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_CO_ALLOW_SALARY" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReportCode_tmp" /> 
                    <input bind="txtOrg_tmp_pk" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datSalary" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM00300_0"> 
                <input bind="grdSalary" >
					<input bind="lstOrg" /> 
					<input bind="lstWGroup" /> 
					<input bind="lstPosition" /> 
					<input bind="txtTemp" /> 
					<input bind="lstContract_Type" /> 
					<input bind="lstStatus" />
					<input bind="lstNation"/>
					<input bind="dtFrom_JoinDate" /> 
					<input bind="dtTo_JoinDate" /> 
					<input bind="dtMonth" />
					<input bind="lstMoney" />
					<input bind="lstEmp_Type" />
                </input>
                <output  bind="grdSalary" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datSalary2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM00300_1"> 
                <input bind="grdSalary2" >
                   <input bind="lstOrg2" /> 
                   <input bind="lstWGroup2" /> 
                   <input bind="lstPosition2" />
                   <input bind="txtTemp_2" /> 
                   <input bind="dtMonth2" /> 
                   <input bind="lstContract_Type2" /> 
                   <input bind="lstStatus2" /> 
                   <input bind="dtFrom_JoinDate2" /> 
                   <input bind="dtTo_JoinDate2" /> 
                   <input bind="lstMoney2" />
                </input>
                <output  bind="grdSalary2" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datSalary3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM00300_2"> 
                <input bind="grdSalary3" >
                   <input bind="lstOrg3" /> 
                   <input bind="lstWGroup3" /> 
                   <input bind="lstPosition3" />  
                   <input bind="txtTemp3" /> 
                   <input bind="dtYear3" /> 
                   <input bind="lstContract_Type3" /> 
                   <input bind="lstStatus3" /> 
                   <input bind="dtFrom_JoinDate3" /> 
                   <input bind="dtTo_JoinDate3" /> 
                   <input bind="lstMoney3" />
                </input>
                <output  bind="grdSalary3" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datSalary4" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM00300_3"> 
                <input bind="grdSalary4" >
                   <input bind="lstOrg4" /> 
				   <input bind="lstWGroup4" /> 
                   <input bind="lstPosition4" />
                   <input bind="txtTemp4" /> 
                   <input bind="dtMonth4" /> 
                   <input bind="lstStatus4" /> 
                   <input bind="dtFrom_JoinDate4" /> 
                   <input bind="dtTo_JoinDate4" /> 
                   <input bind="lstMoney4" />
                </input>
                <output  bind="grdSalary4" />
            </dso> 
        </xml> 
</gw:data>



<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="onPage_active()"  > 
    <table name="Salary" id="tblSalary" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" valign="top" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>                
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
								
									</td>
									<td colspan=12 width="12%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp" onenterkey   ="OnSearch(datSalary)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Salary Month
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:datebox id="dtMonth"  onchange="OnChangeMonth(1)" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstPosition" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										<a title="Click here to show organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(1,lstOrg);" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Join Date
									</td>
									<td colspan=20 width="10%" style="border:0" align="left">
										<gw:datebox id="dtFrom_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>																		
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
											<img status="min" id="img1" alt="Show more columns" src="../../../../system/images/close_popup.gif" style="cursor:hand" onclick="OnToggle(1)"  />
									</td>
									
									<td colspan=12 style="border:0" width="12%" align="left" >
										Employee Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstEmp_Type" value="ALL" styles='width:100%' />
									</td>									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Money Kind
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstMoney" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Nation
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' />
									</td>

								</tr>
							</table>
					</fieldset>
				</div>
				<div style="width:100%;height:4%" >
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >							
							<td colspan=2 width="2%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label  id="lblRecord"  text="" maxlen = "100"  />
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >								 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" text="Search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(datSalary)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="excel" id="ibtnReport"   text="Report"  onclick="OnReport(1)"/>
							</td>

						</tr>
					</table>
				</div>
				<div style="width:100%;height:81%" >
					<table width="100%" style="height:97%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdSalary"  
                                header="Organization|W-Group|Emp ID|Full Name|Join Date|Prob Salary|Contract|Postion1|Level1|Level2|Confirm|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12
                                        |Postion2|Level1|Level2|Confirm|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12|_SEQ"
                                format="0|0|0|0|0|-0|0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0"  
                                aligns="2|2|1|2|1|3|1|1|3|3|1|3|3|3|3|3|3|3|3|3|3|3|3|1|3|3|1|3|3|3|3|3|3|3|3|3|3|3|3|0"  
                                defaults="|||||||||||||||||||||||||||||||||||||||"  
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                widths="1500|1600|1000|2500|1200|1300|1300|1300|1300|1300|1300|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1300|1300|1300|1300|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0"  
                                styles="width:100%; height:100%" 
                                sorting="T" acceptNullDate  
                                 oncelldblclick="OnClickGrid(1)"
                                /> 
                        </td>
                    </tr>
					</table>
				</div>	
            </td>
        </tr>
    </table>
   <table name="Salary Change" id="tblIncSal" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" valign="top" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>                               
				<div style="width:100%;height:15%" class="eco_line_t">
					<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:textbox id="txtTemp_2" onenterkey   ="OnSearch(datSalary2)" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Salary Month
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtMonth2"  onchange="OnChangeMonth()" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstPosition2" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(2)" href="#tips" >Organization </b></a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg2" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(2,lstOrg2);" />
							</td>
						    <td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Join Date
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtFrom_JoinDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtTo_JoinDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Status
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus2" value='A' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								<img status="min" id="img2" alt="Show more columns" src="../../../../system/images/close_popup.gif" style="cursor:hand" onclick="OnToggle(2)"  />
							</td>							
							<td colspan=10 width="10%" style="border:0" align="left" >
								Contract Type
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstContract_Type2" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Group
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:list  id="lstWGroup2" value='ALL' maxlen = "100" styles='width:100%' />
							</td>														
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Money Kind
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstMoney2" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
					</table>
				</div>
				<div style="width:100%;height:4%;" >
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					    <tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord2"  text="" maxlen = "100"  />
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
					            <gw:button img="search" text="Search" id="ibtnSearch2"   alt="Search"  onclick="OnSearch(datSalary2)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport2" img="excel"   text="Report"  onclick="OnReport(2)"/>
							</td>														
						</tr>
					</table>
				</div>
				<div style="width:100%;height:81%">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
                        <tr style="border:1;width:100%;height:75%" valign="top">
                            <td colspan=100 style="width:100%;height:100%;"> 
                                 <gw:grid   
                                    id="grdSalary2"  
                                    header="Organization|W-Group|Emp ID|Full Name|Join Date|Prob Salary|Contract|Postion1|Level1|Level2|Confirm|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12
                                            |Postion2|Level1|Level2|Confirm|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12|_SEQ"
                                    format="0|0|0|0|0|-0|0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0"  
                                    aligns= "2|2|1|2|1|3|1|1|3|3|1|3|3|3|3|3|3|3|3|3|3|3|3|1|3|3|1|3|3|3|3|3|3|3|3|3|3|3|3|0"   
                                    defaults="||||||||||||||||||||||||||||||||||||||||"  
                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                    widths="1500|1600|1000|2500|1200|1300|1300|1300|1300|1300|1300|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1300|1300|1300|1300|1000|1000|1000|1000|1000|1000|1000|1000|1000|0"  
                                    styles="width:100%; height:100%" 
                                    sorting="T"  acceptNullDate 
                                    oncelldblclick="OnClickGrid(2)"
                                    /> 
                            </td>
                        </tr>
					</table>
				</div>
            </td>
        </tr>
    </table> 
    <table name="Salary Year" id="tblSalYear" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" valign="top" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>        
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									
									<td colspan=10 width="10%" style="border:0"  align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp3" onenterkey   ="OnSearch(datSalary3)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Year
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtYear3"  onchange="OnChangeMonth()" tyles="width:100%" type="year" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstPosition3" value='ALL' styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(3)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg3" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(3,lstOrg3);" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_JoinDate3" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_JoinDate3" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus3" value='A' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >									
									<td colspan=2 width="2%" style="border:0"   >
										<img status="min" id="img3" alt="Show more columns" src="../../../../system/images/close_popup.gif" style="cursor:hand" onclick="OnToggle(3)"  />
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Contract Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstContract_Type3" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWGroup3" value='ALL' maxlen = "100" styles='width:100%' />
									</td>									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Money Kind
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstMoney3" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="width:100%;height:4%" >
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					    <tr style="border:0;width:100%" valign="center" >	
							<td colspan=2 width="2%" style="border:0" align="left" >								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord3"  text="" maxlen = "100" />
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
							    <gw:button img="search" text="Search" id="ibtnSearch3"   alt="Search"  onclick="OnSearch(datSalary3)"/>							            
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport3" img="excel"   text="Report"  onclick="OnReport(3)"/>
							</td>							
						</tr>
					</table>
				</div>
				<div style="width:100%;height:80%">
					<table width="100%" style="height:98%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:1;width:100%;height:75%" valign="top">
							<td colspan=100 style="width:100%;height:100%;"> 
								  <gw:grid   
									id="grdSalary3"  
									header="Organization|W-Group|Emp ID|Full Name|Join Date|Contract Type|January Lv1|January Lv2|February Lv1|February Lv2|March Lv1|March Lv2|April Lv1|April Lv2|May Lv1|May Lv2|June Lv1|June Lv2|July Lv1|July Lv2|August Lv1|August Lv2|Septemper Lv1|Septemper Lv2|October Lv1|October Lv2|November Lv1|November Lv2|December Lv1|December Lv2"
									format="0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
									aligns="2|2|1|0|1|1|3|3|3|1|0|0|0|0|0|0|0|0"  
									defaults="||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="1500|1600|1000|2500|1500|1700|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1300|1300|1300|1300|1300|1300|1300|1300|1300|1300"  
									styles="width:100%; height:100%" 
									sorting="T"   acceptNullDate
									/> 
							</td>
						</tr>
					</table>
				</div>
            </td>
        </tr>
    </table>
   <table name="Salary Event" id="Table4" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" valign="top" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>                
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >							
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp4" onenterkey   ="OnSearch(datSalary4)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Start Month
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtMonth4"  onchange="" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" nullaccept />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstPosition4" value='ALL' styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(4)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg4" value='ALL' maxlen = "100" styles='width:100%' onchange="" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_JoinDate4" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_JoinDate4" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>							
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus4" value='A' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="width:100%;height:4%" >
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					    <tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord4"  text="" maxlen = "100" />
							</td>
							<td colspan=80 width="80%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" text="Search" id="ibtnSearch3"   alt="Search"  onclick="OnSearch(datSalary4)"/>
							</td>														
						</tr>
					</table>
				</div>
				<div style="width:100%;height:86%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:1;width:100%;height:75%" valign="top">
							<td colspan=100 style="width:100%;height:100%;"> 
								  <gw:grid   
									id="grdSalary4"  
									header="_emp_pk|Organization|Emp ID|Full Name|Join Date|Work Mon|Old Salary L1|Old Salary L2|Confirm Dt|New Sal L1|New Salary L2|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12
											|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12
											|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9|Allow10|Allow11|Allow12"
									format="0|0|0|0|4|0|-0|-0|4|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
									aligns="0|2|1|0|1|1|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="0|3000|1500|3000|1500|1200|1500|1500|1200|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600|1600"  
									styles="width:100%; height:100%" 
									sorting="T"  acceptNullDate 
									/> 
							</td>
						</tr>
					</table>
				</div>
            </td>
        </tr>
    </table>  
</gw:tab>
</body>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/> 
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
                       
 <gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Code Name 9|Code Name 10|Code Name 11|Code Name 12
            |Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8|Display 9|Display 10|Display 11|Display 12"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    defaults="||||||||||||||||||||||"  
    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200|0|0|0|0|0|0|0|0"  
    styles="display:none" 
    sorting="T"    
/> 
<gw:list  id="lstContract_Type" value='ALL' maxlen = "100" styles='width:100%;display:none' >
	<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0001' order by code_nm")%>|ALL|Select All</data>
</gw:list>
<gw:list  id="lstWGroup" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstReport2" value='1' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstReport3"  maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstMoney4" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstWGroup4" value='ALL' maxlen = "100" styles='width:100%;display:none' />
</html>
