<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var check_init=0;
var dt_tmp;
var opt_value=1;
var flag_imp=0;
var flag_wg=1;
var flag_tab=1;

var v_language = "<%=Session("SESSION_LANG")%>";

var c_emp_id=3;
var c_nm=4;
var c_allow_nm=5;
var c_yn=7;
var c_remark=8;
var c_amount=6;
var c_mon=10;
var c_imp_seq=11;
var c_allow_kind=12;
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    idGrid.GetGridControl().FrozenCols =5;
    System.Translate_V2(document, System.Menu.GetMenuPS());
     <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 7 , "Y|YES|N|NO") %>; 
     
      
      iduser_pk.text = "<%=session("USER_PK")%>";
      txtHr_level.text= "<%=session("HR_LEVEL")%>";
      menu_id.text=System.Menu.GetMenuID();
      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRPM00800', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
      lstReport.SetDataText(data);
      

      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
      lstOrg.SetDataText(data);
      lstOrg.value ="ALL";
	  ChangeColorItem(lstOrg.GetControl());
      
      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
      lstWG.SetDataText(data);
      lstWG.value ="ALL";
      
      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
      lstStatus.SetDataText(data);
      lstStatus.value ="A";
      
      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_UNFIX_ALLOW('" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
      lstAll_kind.SetDataText(data);
      lstAll_kind.value ="ALL";
      
      data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
      lstNation.SetDataText(data);
      lstNation.value ="01";
      
      datCheck_View.Call();
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

//---------------------------------------------------
function OnShowPopup()
{
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
             lstOrg.value=obj;
			 onChange_org(1,lstOrg);
        }
}
//------------------------------------------------------------------------------------

function OnDataReceive(obj)
{
    if(obj.id == "datCheck_View")
    {
            if(txtFlag_View.text == 'Y')
            {
                ibtnSave.style.display = "none";
                ibtnDel.style.display = "none";
                ibtnProcess.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                datUser_info.Call();     	    
            else
                 datCheck_Month_allowance.Call();
            
    }
    else if (obj.id=="datUser_info")
    {
            ChangeColorItem(lstOrg.GetControl());
            onChange_org(1,lstOrg);
     }
    else if (obj.id=="datCheck_Month_allowance")
    {
       
        if(Number(lbltmp2.text)==0)
            lblRecord.text="Close!";
            
        ibtnSave.SetEnable(Number(lbltmp2.text));    
            
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
            datUser_info.Call();  
        else
           check_init=1;     
    }
       else if (obj.id=="datUnfix_allowance")
       {
            lblRecord.text=idGrid.rows-1 ;
            var tmp=0;
            for(var i=1;i<idGrid.rows;i++)
            {
                if(idGrid.GetGridData(i,c_amount)!="")
                    tmp+=Number(idGrid.GetGridData(i,c_amount))
            }    
           
            auto_resize_column(idGrid,0,idGrid.cols-1,0);
       }
       else if(obj.id == "datUnfix_allowance_imp")
       {
             lblRecord.text=idGrid.rows-1;
             var tmp=0;
            for(var i=1;i<idGrid.rows;i++)
            {
                if(idGrid.GetGridData(i,c_amount)!="")
                    tmp+=Number(idGrid.GetGridData(i,c_amount))
            }    
            
            auto_resize_column(idGrid,0,idGrid.cols-1,0);
       }
	   else if (obj.id=="datWorkGroup_info")
	   {
			
			lstWG.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstWG.value='ALL';
			datAllowance_info.Call();
		}
		else if (obj.id=="datAllowance_info")
	   {
	        lstAll_kind.AppendItem("ALL|Select All");
	        lstAll_kind.value="ALL";
			check_init=1;
		}	
		else if (obj.id == "datFind_Report") {
		    var url = System.RootURL;

		    switch (txtReportCode_tmp.text) {
		        case "230":
		            url = url + txtReport_tmp.text + '?l_tco_org_pk=' + lstOrg.value + '&l_wg=' + lstWG.value + '&l_work_mon=' + dtMonth.value + '&l_kind=' + lstAll_kind.value + '&l_input=' + idtxtTmp.text + '&l_amount=' + lstAMT.value + '&l_imp_seq=' + idImp_seq.text;
		            break;

		        case "231":
		            url = url + txtReport_tmp.text;
		            break;
		    }
		    window.open(url);
		}
    
}     
//------------------------------------------------------------------------------------
function OnSearch()
{
    if(check_init==1)
    {
        flag_imp=0;
        idImp_seq.text="";
        if(Trim(idtxtTmp.text)==""&&lstAll_kind.value=="ALL")
        {
            if(confirm("Data will be overload. Do you want to continous?\nDữ liệu có thể sẽ rất nhiều. Bạn có muốn tiếp tục?"))
                datUnfix_allowance.Call("SELECT");  
        }
        else       
            datUnfix_allowance.Call("SELECT");  
    }        
           
        
}
//------------------------------------------------------------------------------------
function OnUpdate()
{
 var i;
    if(check_init==1)
    {   
    
          if(idGrid.GetGridControl().rows>1)
          {
            
            for(i=1;i<idGrid.rows;i++)
            {
                
                if(idGrid.GetGridData(i,c_allow_nm)=="" && idGrid.GetGridData(i,c_amount)!="")
                {
                    alert((v_language =="ENG")?"Please choose allowance name at row: ":"Vui lòng chọn loại phụ cấp tại dòng: "+i)
                    return;
                }
            }
          }  
            
            if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn đã chắc chắn lưu dữ liệu?"))
            {
                if(flag_imp==1)
                    datUnfix_allowance_imp.Call();
                else
                    datUnfix_allowance.Call();    
            }   
    }        
}
//------------------------------------------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
function onChangeMonth()
{
    idGrid.ClearData();
    datCheck_Month_allowance.Call();
}

//-----------------------------------------------
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
function OnSetToGrid(n)
{
    if(n==1)
    {
        if(Number(idtxtAmount.text)>0)
        {
            if(idGrid.rows>1)
            {
                var ctrl=idGrid.GetGridControl();
                if(ctrl.SelectedRows>0)
                {
                    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
            	            idGrid.SetGridText(ctrl.SelectedRow(i),c_amount,idtxtAmount.text);
        			
                }
                else
                {
                    if(confirm((v_language =="ENG")?"Do you want to set all rows?":"Bạn có muốn set hết tất cả các dòng ở dưới lưới"))
                    {
                        for ( var i =  1 ; i < ctrl.Rows ; i++ )
            	                idGrid.SetGridText(i,c_amount,idtxtAmount.text);
                    }
                }
            }
            
        }    
    }
    else
    {
        if(idGrid.rows>1)
            {
                var ctrl=idGrid.GetGridControl();
                if(ctrl.SelectedRows>0)
                {
                    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
            	            idGrid.SetGridText(ctrl.SelectedRow(i),c_yn,idSet_Fix.value);
        			
                }
                else
                {
                    if(confirm((v_language =="ENG")?"Do you want to set all rows?":"Bạn có muốn set hết tất cả các dòng ở dưới lưới"))
                    {
                        for ( var i =  1 ; i < ctrl.Rows ; i++ )
            	                idGrid.SetGridText(i,c_yn,idSet_Fix.value);
                    }
                }
            }
        
    }    
}
//--------------------
function OnReport()
{
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();
}


function CheckValidFile(vfile)
{
    var sext;
    sext=vfile.substring(vfile.length-4,vfile.length);
    if (sext!=".xls")
        return false;
    return true;
}
function Remove_empty_rows()
{
    var tmp=0;
    var i=1;
  if(idGrid.GetGridControl().rows>1)
  {
    var row=idGrid.GetGridControl().rows;
    
    while(i<row)
    {
        if(idGrid.GetGridData(i,c_emp_id).length<4)
        {   
            idGrid.RemoveRowAt(i);
            i-=1;
            row=idGrid.GetGridControl().rows;
        }
        i+=1;    
    }
    
    lblRecord.text=idGrid.rows-1 ;
    for(i=1;i<idGrid.rows;i++)
    {
        if(idGrid.GetGridData(i,c_amount)!="")
            tmp+=Number(idGrid.GetGridData(i,c_amount))
    }    
    
    auto_resize_column(idGrid,0,idGrid.cols-1,0);
  } 
  
  //clear_Interval(idRecord);
  
}
function OnLoadExcel()
{
	if (lstAll_kind.value=='ALL')
	{
		alert((v_language =="ENG")?"Please choose one Allowance kind only !":"Vui lòng chọn một loại trợ cấp");
		return;
	}
	
	var vfilename = document.all["inputfile"].value;    
	imp_seq=new Date().getTime();
	idImp_seq.text=imp_seq;
	
	if (!CheckValidFile(vfilename) || vfilename =="")
	{
		alert((v_language =="ENG")?"Please select excel file":"Vui lòng chọn tập tin excel");
		return;
	}

	idGrid.ClearData();
	idtxtTmp.text="";  
	
	
		
	try
	{
		var myApp = new ActiveXObject("Excel.Application");     
		myApp.Workbooks.Open(vfilename); 
		var workSheet = myApp.ActiveSheet; 
		var vemp_id,vemp_name, vamount;
		var maxRow =workSheet.UsedRange.Rows.Count; 
		//alert(maxRow);
		//return;
		for (var j =3;j <= maxRow; j++) 
		{ 
			vemp_id=workSheet.Cells(j,2).value;                        
			vemp_name=workSheet.Cells(j,3).value;
			vamount=workSheet.Cells(j,4).value;		
			vremark=workSheet.Cells(j,5).value;	
			                   
				idGrid.AddRow();
				var irow=idGrid.rows-1;
				idGrid.SetGridText(irow,c_emp_id,vemp_id);
				idGrid.SetGridText(irow,c_nm,vemp_name);				
				idGrid.SetGridText(irow,c_allow_nm,lstAll_kind.GetText());                    
				idGrid.SetGridText(irow,c_amount,vamount);   
				idGrid.SetGridText(irow,c_yn,'Y');
				idGrid.SetGridText(irow,c_remark,vremark);
				idGrid.SetGridText(irow,c_mon,dtMonth.value);
				idGrid.SetGridText(irow,c_imp_seq,imp_seq);
				idGrid.SetGridText(irow,c_allow_kind,lstAll_kind.value);
		} 
		flag_imp=1;
		myApp.Quit();
		myApp=null;
	}
	catch(e)
	{
		alert("Could not read Excel File !"); 
		myApp.Quit();
	}/**/
	//Remove_empty_rows();
	
	
}
function OnDelete()
{
    if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn đã chắc chắn lưu dữ liệu?"))
    {
        idGrid.DeleteRow();
        datUnfix_allowance.Call();
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

<gw:data id="datAllowance_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_HRPM00800_0"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="lstAll_kind" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datCheck_Month_allowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00800_1" > 
                <input >
                    <input bind="dtMonth" /> 
					<input bind="lstOrg" />
                </input>
                <output >
                    <output bind="lbltmp" /> 
                    <output bind="lbltmp2" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datUnfix_allowance" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,3,6,7,8,9,10,11,12" function="ST_HR_SEL_HRPM00800_0" procedure="ST_HR_UPD_HRPM00800_0"> 
                <input bind="idGrid" >
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="dtMonth" />
                    <input bind="lstAll_kind" />
                    <input bind="idtxtTmp" />
                    <input bind="lstNation" />
                    <input bind="lstAMT" />
                    <input bind="idImp_seq" />
					<input bind="lstStatus" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datUnfix_allowance_imp" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,3,6,7,8,9,10,11,12" function="hr_sel_10030008_UNFIX_IMP" procedure="hr_upd_10030008_unfix_allow"> 
                <input bind="idGrid" >
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="dtMonth" />
                    <input bind="lstAll_kind" />
                    <input bind="idtxtTmp" />
                    <input bind="lstNation" />
                    <input bind="lstAMT" />
                    <input bind="idImp_seq" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

    <!------------------------------------------>
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

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" class="eco_line">
	<tr>
	    <td>			
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>			
						<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
							
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Month
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:datebox id="dtMonth"  maxlen = "10" text="" styles='width:50%'lang="<%=Session("Lang")%>" type="month" onchange="onChangeMonth()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
								</td>
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >								
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:list  id="lstOrg"  value="ALL" styles='width:100%' onchange="onChange_org(1,lstOrg);" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Allow Name
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstAll_kind"  value="ALL" styles='width:100%' />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Nation
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%' />
								</td>
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Amount
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstAMT"  value="0" styles='width:100%' >
										<data>|ALL|Select All|0|<>0</data>
									</gw:list>
								</td>
								
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Set Amount
								</td>
								<td colspan=15 width="15%" style="border:0" align="left">
									<gw:textbox id="idtxtAmount" maxlen = "50" styles="width:100%" onkeypress="return Numbers(event)" />
								</td>
								<td colspan=5 width="5%" style="border:0" align="left">
									<gw:button id="ibtnSet" alt="Set Amount to Grid" img="set" text="Set Grid" onclick="OnSetToGrid(1)" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Set Byhand
								</td>
								<td colspan=15 width="15%" style="border:0"> 
									<gw:list  id="idSet_Fix" value="Y" styles='width:100%' onChange="">
										<data>|Y|Yes|N|No</data>
									</gw:list>
								</td>
								<td colspan=5 width="5%" style="border:0" align="left">
									<gw:button id="ibtnSet2" alt="Set to Grid" img="set" text="Set Grid" onclick="OnSetToGrid(2)" />
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="width:100%;height:4%" >
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
									
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:label id="lblRecord"  text="" maxlen = "100" />
						</td>
						<td colspan=50 width="50%" style="border:0"   >
									
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >						
							<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnUpdate()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnDel" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport()"/>
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:list  id="lstReport" value='' maxlen = "100" styles='width:100%' />
						</td>									
					</tr>
				</table>
			</div>
			<div style="width:100%;height:81%" >
				<table width="100%" style="height:98%" border="0" cellpadding="0" cellspacing="0">
					<tr style="border:1;width:100%;height:75%" valign="top">
						<td colspan=100 style="width:100%;height:100%;"> 
							 <gw:grid
							id="idGrid"
							header="_PK|Organization|Work Group|Employee ID|Full Name|Allow Name|Amount|Fix Byhand|Description|_thr_emp_pk|_work_mon|_imp_seq|_allow_kind"
							format ="0|0|0|0|0|0|1|0|0|0|0|0"
							aligns ="0|0|0|0|0|0|0|1|1|1|1|0"
							editcol="0|0|0|0|0|0|1|1|1|0|0|0" 
							defaults="|||||||||||"					
							widths="1000|3000|2000|1500|3000|2000|2000|3000|1200|1200|1200|0"
							styles="width:100%;height:100%"
							sorting="T"
							oncelldblclick = ""/>
						</td>
					</tr>
				</table>
			</div>	
		</td>	
	</tr>
</table>

	<gw:textbox id="txtResult" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="lbltmp" styles="display:none"/>
    <gw:textbox id="lbltmp2" styles="display:none"/>
    <gw:textbox id="idImp_seq" styles="display:none"/>
	<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtReport_tmp" text="" styles="display:none"  />
	<gw:list  id="lstWG"  value="ALL" styles='width:100%;display:none' />
</body>
</html>

