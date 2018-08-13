<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var check_init=0;
var flag;
var strcodereturn;
var binit=true;
var tab2=false;
var tab3=false;
var flag2=false;
var startTime,interval_time
var v_language = "<%=Session("SESSION_LANG")%>";
var rowselect=0;
var flag_wg=1;
var flag_tab=1;
 
//grid 3

var c_emp_pk_3=0
var c_org_3=1
var c_w_group_3=2
var c_emp_id_3=3
var c_full_name_3=4
var c_join_dt_3=5
var c_contract_3=6
var c_level_1_3=7
var c_level_2_3=8
var c_confirm_dt_3=9
var c_pos_3=10
var c_sal_level_3=11
var c_al1_3=12
var c_al2_3=13
var c_al3_3=14
var c_al4_3=15
var c_al5_3=16
var c_al6_3=17
var c_al7_3=18
var c_al8_3=19
var c_al1_l2_3=20
var c_al2_l2_3=21
var c_al3_l2_3=22
var c_al4_l2_3=23
var c_al5_l2_3=24
var c_al6_l2_3=25
var c_al7_l2_3=26
var c_al8_l2_3=27

var c_work_mon_3=28
var c_sal_note_3=29
var c_imp_dt_3=30
var c_update_current_3=31
var c_month_apply=32





function BodyInit()
{
	var t1;
	
    //if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
     idDBUSR.text= "<%=session("APP_DBUSER")%>";
     menu_id.text=System.Menu.GetMenuID();
     
     
     datAllowance.Call();
   
    
}
    

function OnFormatHeader(obj)
{
    var fg = obj.GetGridControl();
    fg.FixedRows = 2;
    fg.FixCols = 1;
    fg.MergeCells = 5;
    stt = 0;//num column
    fg.MergeCol(stt) = true;
    fg.Cell(0, 0, stt, 1, stt) = "EmpPK";   //fg.Cell(0,row, from_col, row, to_col)	

    fg.MergeCol(stt + 1) = true;
    fg.Cell(0, 0, stt + 1, 1, stt + 1) = "Organization";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.MergeCol(stt + 2) = true;
    fg.Cell(0, 0, stt + 2, 1, stt + 2) = "WGroup";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.MergeCol(stt + 2) = true;
    fg.Cell(0, 0, stt + 2, 1, stt + 2) = "Emp ID";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.MergeCol(stt + 2) = true;
    fg.Cell(0, 0, stt + 2, 1, stt + 2) = "Full Name";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.MergeCol(stt + 2) = true;
    fg.Cell(0, 0, stt + 2, 1, stt + 2) = "Join Date";   //fg.Cell(0,row, from_col, row, to_col)	
   // fg.MergeRow(0) = true;
    //fg.Cell(0, 0, stt + 3, 0, stt + 4) = "Yesterday";   //fg.Cell(0,row, from_col, row, to_col)	
    //fg.Cell(0, 1, stt + 3, 1, stt + 3) = "Male";
    //fg.Cell(0, 1, stt + 4, 1, stt + 4) = "Female";
}


//----------------------------------------------

function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}

function clock(start,x) 
{
 var d = new Date()
 lbldata2.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
//----------------------------------


//----------------------------------------------
function OnDataReceive(obj)
{  
   if (obj.id=="datAllowance")
   {
            init_form();
        
   }
   else if (obj.id=="datCheck_Month_t3")
   {
         check_init=1;          
   }
   else if (obj.id=="datSal_imp")
   {
        auto_resize_column(grdSalary3,0,grdSalary3.GetGridControl().cols-1,0);
   }
   else if (obj.id=="datMonth_imp")
   {
        lblRecord3.text=grdSalary3.rows-1 ;
        auto_resize_column(grdSalary3,0,grdSalary3.GetGridControl().cols-1,0);
   }
   else if (obj.id=="datUptoCurrent_t3")
   {
        datMonth_imp.Call("SELECT");
   }
   else if (obj.id=="datDelete_t3")
   {
        datMonth_imp.Call("SELECT");
   }
   
   
   
}
//-------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

//------------------------------------------------------

function OnSearch()
{
	if(check_init==1)
	{
	    datMonth_imp.Call("SELECT");   
	}	
   	
}

        

//----------------------------------------------------

function init_form()
{
    var tmp; //value of allowance col
		    tmp=idALL1_NM.text+" L1";
		    grdSalary3.SetGridText(0,c_al1_3,tmp);
		
		    tmp=idALL2_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al2_3,tmp);
		
		    tmp=idALL3_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al3_3,tmp);
		
		    tmp=idALL4_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al4_3,tmp);
		
		    tmp=idALL5_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al5_3,tmp);
		
		    tmp=idALL6_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al6_3,tmp);
		
		    tmp=idALL7_NM.text+" L1";
            grdSalary3.SetGridText(0,c_al7_3,tmp);
		
		    tmp=idALL8_NM.text+" L1";
		    grdSalary3.SetGridText(0, c_al8_3, tmp);
		    var _str = "";
		    if (id2LV_ALLOW_YN.text == "Y")
		    {
		        grdSalary3.GetGridControl().ColHidden(c_al1_3) = !(Number(idALL1_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al2_3) = !(Number(idALL2_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al3_3) = !(Number(idALL3_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al4_3) = !(Number(idALL4_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al5_3) = !(Number(idALL5_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al6_3) = !(Number(idALL6_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al7_3) = !(Number(idALL7_USE.text));
		        grdSalary3.GetGridControl().ColHidden(c_al8_3) = !(Number(idALL8_USE.text));
		        _str = " L2";
		    }
		    else
		    {
		        grdSalary3.GetGridControl().ColHidden(c_al1_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al2_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al3_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al4_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al5_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al6_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al7_3) = true;
		        grdSalary3.GetGridControl().ColHidden(c_al8_3) = true;
		    }
		    //allowance level 2
		    tmp = idALL1_NM.text + _str;
		    grdSalary3.SetGridText(0,c_al1_l2_3,tmp);
		
		    tmp = idALL2_NM.text + _str;
            grdSalary3.SetGridText(0,c_al2_l2_3,tmp);
		
            tmp = idALL3_NM.text + _str;
            grdSalary3.SetGridText(0,c_al3_l2_3,tmp);
		
            tmp = idALL4_NM.text + _str;
            grdSalary3.SetGridText(0,c_al4_l2_3,tmp);
		
            tmp = idALL5_NM.text + _str;
            grdSalary3.SetGridText(0,c_al5_l2_3,tmp);
		
            tmp = idALL6_NM.text + _str;
            grdSalary3.SetGridText(0,c_al6_l2_3,tmp);
		
            tmp = idALL7_NM.text + _str;
            grdSalary3.SetGridText(0,c_al7_l2_3,tmp);
		
            tmp = idALL8_NM.text + _str;
            grdSalary3.SetGridText(0,c_al8_l2_3,tmp);
		
		    grdSalary3.GetGridControl().ColHidden(c_al1_l2_3)=!(Number(idALL1_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al2_l2_3)=!(Number(idALL2_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al3_l2_3)=!(Number(idALL3_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al4_l2_3)=!(Number(idALL4_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al5_l2_3)=!(Number(idALL5_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al6_l2_3)=!(Number(idALL6_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al7_l2_3)=!(Number(idALL7_USE.text));
            grdSalary3.GetGridControl().ColHidden(c_al8_l2_3)=!(Number(idALL8_USE.text));

            auto_resize_column(grdSalary3,0,grdSalary3.GetGridControl().cols-1,0);
            datCheck_Month_t3.Call();
        
}


//------------------------------------------

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




function OnReport()
{
    var url = System.RootURL + '/standard/reports/hr/pm/rpt_hrpm01400_0.aspx' ;
    window.open(url);
}

function OnImport()
{
	var currentTime = new Date();		
	txtSequence.text = currentTime.getTime();
    var pro_name = "ST_HR_PRO_HRPM01400_4";
	
	// argument fixed table_name, procedure, procedure_file
	// dynamic arg p_1,p_2,p_3,p_4,p_5
	
	var url = System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text + '&procedure=ST_HR_PRO_CO_INSERT_IMAGE' 
			+ '&procedure_file=' + pro_name + '&p_1=' + dtMonth3.value + '&p_2='+ '&p_3='+ '&p_4=' + '&p_5=' + '&p_cols=31' ;
	
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
	
	if (txtRecord.text != 'undefined')
	{
		alert("Imported : " + txtRecord.text + " record(s)");
	}
		
    datSal_imp.Call("SELECT");

    
	
}

function onchange_month_tab3()
{
    datCheck_Month_t3.Call();
}

function UptoCurrent()
{
    if(grdSalary3.rows-1>0)
    {
        if(confirm("Current salary and allowance will be change, are you sure?\n Lương cơ bản và phụ cấp sẽ thay đổi, bạn có chắc chắn?"))
        {
            datUptoCurrent_t3.Call();
        }
    }
    else
        alert("There is no data to update.\n Không có dữ liệu");
}

function OnDelete_imp()
{
    if(grdSalary3.rows-1>0)
    {
        if(confirm("Import data will be delete, are you sure?\n Dữ liệu import sẽ bị xóa, bạn có chắc chắn xóa?"))
        {
            datDelete_t3.Call();
        }
    }
    else
        alert("There is no data to update.\n Không có dữ liệu");
}



</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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


<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_HRPM01400_0"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                    <output bind="idALL1_NM" />
                    <output bind="idALL2_NM" />
                    <output bind="idALL3_NM" />
                    <output bind="idALL4_NM" />
                    <output bind="idALL5_NM" />
                    <output bind="idALL6_NM" />
                    <output bind="idALL7_NM" />
                    <output bind="idALL8_NM" />
                    <output bind="idALL1_USE" />
                    <output bind="idALL2_USE" />
                    <output bind="idALL3_USE" />
                    <output bind="idALL4_USE" />
                    <output bind="idALL5_USE" />
                    <output bind="idALL6_USE" />
                    <output bind="idALL7_USE" />
                    <output bind="idALL8_USE" />
                    <output bind="id2LV_ALLOW_YN" />
                    <output bind="idSAL_APPOVAL_YN" />
                </output>
            </dso> 
        </xml> 
</gw:data>




<!-----------------tab3----------------------------->
<gw:data id="datSal_imp" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM01400_0" > 
                <input bind="grdSalary3" >
                    <input bind="txtSequence" />    
                </input>
                <output  bind="grdSalary3" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datMonth_imp" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30,31,32" function="ST_HR_SEL_HRPM01400_1" procedure=""> 
                <input bind="grdSalary3" >
                   <input bind="dtMonth3" /> 
                   <input bind="txtTemp3" /> 
                </input>
                <output  bind="grdSalary3" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datCheck_Month_t3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01400_1" > 
                <input >
                    <input bind="dtMonth3" /> 
                </input>
                <output >
                    <output bind="lblInfo3" /> 
                    <output bind="lblclose3" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datUptoCurrent_t3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01400_2" > 
                <input >
                    <input bind="dtMonth3" /> 
                </input>
                <output >
                    <output bind="txtresult" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datDelete_t3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01400_3" > 
                <input >
                    <input bind="dtMonth3" /> 
                </input>
                <output >
                    <output bind="txtresult" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>



<!-------------------data control----------------------->
    <table name="Import Sal" id="Table1" width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;" class="eco_line">
		<tr style="width:100%;height:100%" border="0" valign="top">
			<td>
				<div style="width:100%;height:7%" class="eco_bg">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0" align="left" >Employee</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:textbox id="txtTemp3" onenterkey   ="OnSearch(3)" styles='width:100%'/>
							</td>
							<td colspan=66 width="66%" style="border:0" align="left" >
							    <table style="height:100%" border="0" cellpadding="2" cellspacing="1">
							        <tr>
							            <td><gw:button id="ibtnSearch3" img="search" text="Search" onclick="OnSearch(3)" /></td>
							            <td><gw:button id="idBtnImp3" img="attach" text="Import File" onclick="OnImport()" /></td>
							            <td><gw:button id="idSample3" img="excel" text="Sample file" onclick="OnReport()" /></td>
							            <td><gw:button id="idUpto3" img="process" text="UpTo Current" onclick="UptoCurrent()" /></td>
							            <td><gw:button id="idDel3" img="delete" text="Delete" onclick="OnDelete_imp()" /></td>
							            <td>Rows:</td>
							            <td width="50px" style="border:0" align="left" >
								            <gw:label id="lblRecord3"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" />
							            </td>
							        </tr>
							    </table>
							</td>
						</tr>
					</table>
				</div>
				<div style="width:100%;height:13%" class="eco_line_t">
					<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="0" cellspacing="0">
					
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Month
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								 <gw:datebox id="dtMonth3"  onchange="onchange_month_tab3()" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=32 style="border:0" width="20%"  align="left" >
								<gw:label id="lblInfo3"  text="" maxlen = "100" class="eco_link" styles="width:90%;font-weight: bold;font-size:12" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" ></td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:label id="lblclose3"  text="" maxlen = "100" class="eco_link" styles="width:90%;font-weight: bold;font-size:12" />
							</td>
						</tr>
						
					</table>
				</div>
				<div style="width:100%;height:80%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
								id="grdSalary3"  
								header="_EMP_PK|Organization|_W-Group|Emp ID|Full Name|Join Date|_Contract Type|Level 1|Level 2|Confirm DT|_Postion|_Salary Level|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow1_2|Allow2_2|Allow3_2|Allow4_2|allow5_2|Allow6_2|Allow7_2|Allow8_2|_WMON|Salary Note|Imported Date|UpTo Current|_Monthly Apply"
								format="0|0|0|0|0|4|0|-0|-0|4|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0"  
								aligns="0|2|2|1|0|1|1|3|3|3|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
								defaults="||||||||||||||||||||||||||||||||"  
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
								widths="0|1500|1600|1000|2500|1200|1700|1200|1200|1200|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|17500|1500|1500|1500|1500|1500|1500|0|3000|1500|1000|1000"  
								styles="width:100%; height:100%" 
								sorting="T" acceptNullDate   
								onafteredit=""
								/> 
                        </td>
                    </tr>
					</table>
				</div>	
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtFlag" styles="display:none"/>
<gw:textbox id="txtresult" styles="display:none"/>



 <!------------------------------------------------->


<gw:textbox id="idALL1_NM" styles="display:none"/>
<gw:textbox id="idALL2_NM" styles="display:none"/>
<gw:textbox id="idALL3_NM" styles="display:none"/>
<gw:textbox id="idALL4_NM" styles="display:none"/>
<gw:textbox id="idALL5_NM" styles="display:none"/>
<gw:textbox id="idALL6_NM" styles="display:none"/>
<gw:textbox id="idALL7_NM" styles="display:none"/>
<gw:textbox id="idALL8_NM" styles="display:none"/>

<gw:textbox id="idALL1_USE" styles="display:none"/>
<gw:textbox id="idALL2_USE" styles="display:none"/>
<gw:textbox id="idALL3_USE" styles="display:none"/>
<gw:textbox id="idALL4_USE" styles="display:none"/>
<gw:textbox id="idALL5_USE" styles="display:none"/>
<gw:textbox id="idALL6_USE" styles="display:none"/>
<gw:textbox id="idALL7_USE" styles="display:none"/>
<gw:textbox id="idALL8_USE" styles="display:none"/>
    <gw:textbox id="id2LV_ALLOW_YN" styles="display:none"/>
    <gw:textbox id="idSAL_APPOVAL_YN" styles="display:none"/>
                      
 
	
 <gw:textbox id="txt_PK"  styles="display:none"/>
<gw:textbox id="txt_option"  text='2' styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />                       
<gw:textbox id="txtSequence" text="" styles="display:none"  />
<gw:textbox id="idDBUSR" text="" styles="display:none"  />
<gw:textbox id="txtRecord" text="" styles="display:none"  />
<gw:textbox id="txt_thr_emp_pk" text="" styles="display:none"  />
    
                        
</html>
