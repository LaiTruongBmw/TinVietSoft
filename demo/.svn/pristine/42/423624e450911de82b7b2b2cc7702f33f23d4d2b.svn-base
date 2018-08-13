<!-- #include file="../../../../system/lib/form.inc"  -->
  <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var bSelect =false;
var bSearch =false;
var codeadmin_yn;
codeadmin_yn ="<%=Session("CODEADMIN_YN")%>";
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG") 
        System.Translate(document);
    CheckRole();
    grdMasterCode.GetGridControl().FrozenCols =6;
    grdDetailCode.GetGridControl().FrozenCols =7;
    ibtnCreate_D.style.display="none"
    
     iduser_pk.text = "<%=session("USER_PK")%>";
   
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
<%=CtlLib.SetGridColumnComboFormat( "grdDetailCode" , 19 , "select a.pk,A.PARTNER_NAME from tco_company a where a.del_if=0 and nvl(A.ACTIVE_YN,'N')='Y' union all select null,null from dual order by 2") %>; 
   if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
    datUser_info.Call(); 
    else
    datMasterCode_Temp.Call("SELECT");
}
//----------------------------------
function CheckRole()
{
    if (codeadmin_yn!="Y")
    {
        grdMasterCode.GetGridControl().ColHidden(16)=true;
        grdMasterCode.SetColEdit(15,false);
    }
}
//----------------------------------
function OnToggle(obj)
{
    if (obj==1) //master
    {
        if(imgMaster.status == "expand")
        {
            tblMaster.style.display="none";
            imgMaster.status = "collapse";
            imgMaster.src = "../../../../system/images/down_orange.gif";
            tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="95%";
            
        }
        else
        {
            tblMaster.style.display="";
            imgMaster.status = "expand";
            imgMaster.src = "../../../../system/images/up_orange.gif";
            tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="45%";
            tblMaster.style.height="50%";
            
        }
    }
    else //detail
    {
        if(imgDetail.status == "expand")
        {
            tblDetail.style.display="none";
            imgDetail.status = "collapse";
            imgDetail.src = "../../../system/images/down_orange.gif";
            tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblMaster.style.height="95%";
            
            
        }
        else
        {
            tblDetail.style.display="";
            imgDetail.status = "expand";
            imgDetail.src = "../../../system/images/up_orange.gif";
            tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblMaster.style.height="50%";
            tblDetail.style.height="45%";
            
        }
    }
}
//---------------------------------------------------------
function OnSearch()
{
    grdMasterCode.ClearData();
    grdDetailCode.ClearData();
    bSearch=true;
    datMasterCode.Call("SELECT");
    
}
//----------------------------------------------------------
function OnReport(obj)
{
    var url;    
    if (obj==2)//master
    {
        url='/reports/ag/bh/rpt_hr_code_master.aspx?id='+txtID.text+'&name='+txtName.text;
    }
    else
    {    
        url='/reports/ag/bh/rpt_hr_code_detail.aspx?id='+txtID.text+'&name='+txtName.text;  
    }
    window.open(System.RootURL+url);
}
//-----------------------------------------------------------
function OnAddNew(obj)
{
    var inum;
    if (obj==2)
    {
        grdMasterCode.AddRow();
        grdMasterCode.GetGridControl().TopRow=grdMasterCode.rows-1;
    }
    else
    {
        if (txtMaster_PK.text!="")
        {
            
            grdDetailCode.AddRow();
            grdDetailCode.GetGridControl().TopRow=grdDetailCode.rows-1;
            var irow=grdDetailCode.rows-1;
            grdDetailCode.SetGridText(irow,1,txtMaster_PK.text);
            if (irow!=1)
                inum=Number(grdDetailCode.GetGridData(irow-1,2))+1;
            else
                inum=1;
            grdDetailCode.SetGridText(irow,2,inum);
        }
        else
            alert("Please select a code master!");
    }
    
}
//-------------------------------------------------------------

//---------------------------------------------------------------
function OnSave(obj)
{
    if (confirm("Do you want to save?"))
    {
        if (obj==2)
        {
            if (checkDupItems(grdMasterCode,2,2,2) && checkDupItem(grdMasterCode_Temp,grdMasterCode,2))
                datMasterCode.Call();
        }
        else
        {   
            if (checkNumber() && checkDupItems(grdDetailCode,3,2,19) )
                datDetailCode.Call();
        }
    }
}
//---------------------------------------------------------------
function checkDupItems(obj_grid,obj_col,obj_col_dis,obj_com)
{
    var ctrl 	= obj_grid.GetGridControl();
    var rownum 	= ctrl.Rows;
    if(rownum == 1)
    {
	    return false;
    }
    var i;
    for(i=1; i<rownum; i++)
    {
        
      for(j=i+1; j<rownum; j++)
      {
  	    var i_code 	= obj_grid.GetGridData(i, obj_col);
	    i_code		= i_code.toUpperCase();
	    var j_code 	= obj_grid.GetGridData(j, obj_col);
	    j_code		= j_code.toUpperCase();

        var i_com = obj_grid.GetGridData(i,obj_com);
        var j_com = obj_grid.GetGridData(j,obj_com);
    	
	    if(j_code == i_code && i_com == j_com)
	    {
		    if(j_code !="" )
		    {
			    alert("Code already in use, please re-enter at row " + (i+1) + " and column " + obj_col_dis );
			    return false;
		    }
	    }
      }	
    }
    return true;
}
//-----------------------------------------------------
function checkDupItem(obj_grd1,obj_grd2,obj_col)
{
   var ctrl 	= obj_grd2.GetGridControl();
   var rownum 	= ctrl.Rows;
   if(rownum == 1)
   		return true;
   var i;
   
   for(i=1; i<rownum; i++)
   {
      	var i_code 	= obj_grd2.GetGridData(i, obj_col);
		i_code		= i_code.toUpperCase();
		
		var ctrl_1	= obj_grd1.GetGridControl();
		var row_1 	= ctrl_1.Rows;
		var cnt = 0;
		 
		for(j=1; j<row_1; j++)
		{
		 	var j_code 	= obj_grd1.GetGridData(j, obj_col);
			j_code		= j_code.toUpperCase();
			
			if(obj_grd1.GetGridData(j, 0) != obj_grd2.GetGridData(i, 0))
			{
			    
				if(j_code == i_code)
				{
					cnt = cnt + 1;
					if(cnt >=1 )
					{
						alert("Code code already in use, please re-enter at rows " + i );
						return false;
					}
				}
			}
	 	}
	}
   	return true;
}
//---------------------------------------------------
function checkNumber()
{
	var ctrl 	= grdDetailCode.GetGridControl();
	var rownum 	= ctrl.Rows;
	
	if(rownum == 1)
	    return false;
	
	var i;
	for(i=1; i<rownum; i++)
	{
	 	for(j=7; j <= 11; j++)
		{
			var ij_num 	= grdDetailCode.GetGridData(i, j);
			ij_num		= ij_num.toUpperCase();
			if (isNaN(ij_num))
			{
				alert("Please enter is number at col " + (i) + " and row " + (j-1) );
				return false;
			}
			
		}	
	}
	for(i=1; i<rownum; i++)
	{
	 	var inum=grdDetailCode.GetGridData(i, 2);
	 	if (isNaN(inum) || Trim(inum)=="")
		{
			alert("Please enter is number at col 1 " + " and row " + (i) );
			return false;
		}
		if (Number(inum)<0)
		{
		    alert("Please enter is number at col 1 " + " and row " + (i) );
			return false;
		}
		
	}
	return true;
}
//---------------------------------------------------------------
function OnDelete(obj)
{
    if (confirm("Do you want to delete?"))
    {
        if (obj==2)
        {
            grdMasterCode.DeleteRow();
            ibtnDelete_M.SetEnable(false);
			datMasterCode.Call();
        }    
        else
        {
            grdDetailCode.DeleteRow();
            ibtnDelete_D.SetEnable(false);
	        ibtnUnDelete_D.SetEnable(true);
			datDetailCode.Call();
        }
    }
    
}
//---------------------------------------------------------------
function OnUnDelete(obj)
{
    if (confirm("Do you want to undelete?"))
    {
        if (obj==2)
        {
            grdMasterCode.UnDeleteRow();
            ibtnDelete_M.SetEnable(true);
        }    
        else
        {
            grdDetailCode.UnDeleteRow();
            ibtnDelete_D.SetEnable(true);
	        ibtnUnDelete_D.SetEnable(false);
	    }
        
    }
    
}
//-----------------------------------------------------------------
function OnDataReceive(obj)
{
    if (obj.id=="datMasterCode")
    {
        lblRecord_M.text=grdMasterCode.rows-1 + " record(s).";
        auto_resize_column(grdMasterCode,0,grdMasterCode.cols-1,0);
        
        if (grdMasterCode.rows>1)
        {
            OnSetSysRole();
        }
        if ((bSelect==true) || (bSearch==true))
        {
            if (grdMasterCode.rows==2) //have one record
            {
                bSelect=false;
                bSearch=false;
                txtMaster_PK.text=grdMasterCode.GetGridData(1,0); //get pk
                lblRecord_M.text=grdMasterCode.rows-1 + " record(s).";
                lblID.text=grdMasterCode.GetGridData(1,2); //get id
                lblName.text=grdMasterCode.GetGridData(1,3); //get name 
                OnSetGrid(1);
                datDetailCode.Call("SELECT");  
            }
        }
    }
    else if (obj.id=="datDetailCode")
    {
		var ctrl=grdDetailCode.GetGridControl(); 
        lblRecord_D.text=ctrl.rows-1 + " record(s).";		
       // auto_resize_column(grdDetailCode,0,grdDetailCode.cols-1,0);
        
    }
    else if (obj.id=="datMasterCode_Temp")
    {
        datGetMasterCode.Call();
    }
    else if (obj.id=="datGetMasterCode")
    {
        lblMasterCode.text="   Max ID: " + lblMasterCode.text;
    }
    else if (obj.id=="datCreateMoneyType")
    {
        if (txtResult.text=="1")
            alert("Creating type of money successfull!");
        else
            alert("Creating type of money have error!!!");
    }
    else if (obj.id=="datHrCode")
    {
        var t=txthrcode_value.text;
        var s="";
        if (t.length!=4)//khong co du lieu chi co chuoi "DATA"
        {   
            t=t.substring(5,t.length);
            var arr=t.split("|");			
            var i=0;
            while(i<arr.length)
            {
                s+="#"+arr[i]+";"+arr[i+1]+"|";
                i+=2;
            }
        }
         s = s+ "#;|";		 
         s=s.substring(0,s.length-1);
        grdDetailCode.SetComboFormat(16,s);
        datDetailCode.Call("SELECT");  
    }
}
//-------------------------------------------------
function OnSetSysRole()
{
    for(var i=1;i<=grdMasterCode.rows-1;i++)
    {
        if (grdMasterCode.GetGridData(i,16)==-1) //sys yn
            grdMasterCode.SetCellBgColor(i,1,i,16,0xCCFFCC);
    }
    
}
//---------------------------------------------------
function OnSetGrid(obj)
{
    var t;
    t=grdMasterCode.GetGridData(obj,6)==""?"NUM1_NAME":grdMasterCode.GetGridData(obj,6);
    grdDetailCode.SetGridText(0,7,t);
    t=grdMasterCode.GetGridData(obj,7)==""?"NUM2_NAME":grdMasterCode.GetGridData(obj,7);
    grdDetailCode.SetGridText(0,8,t);
    t=grdMasterCode.GetGridData(obj,8)==""?"NUM3_NAME":grdMasterCode.GetGridData(obj,8);
    grdDetailCode.SetGridText(0,9,t);
    t=grdMasterCode.GetGridData(obj,9)==""?"NUM4_NAME":grdMasterCode.GetGridData(obj,9);
    grdDetailCode.SetGridText(0,10,t);
    t=grdMasterCode.GetGridData(obj,10)==""?"NUM5_NAME":grdMasterCode.GetGridData(obj,10);
    grdDetailCode.SetGridText(0,11,t);
    t=grdMasterCode.GetGridData(obj,11)==""?"CHAR1_NAME":grdMasterCode.GetGridData(obj,11);
    grdDetailCode.SetGridText(0,12,t);
    t=grdMasterCode.GetGridData(obj,12)==""?"CHAR2_NAME":grdMasterCode.GetGridData(obj,12);
    grdDetailCode.SetGridText(0,13,t);
    t=grdMasterCode.GetGridData(obj,13)==""?"CHAR3_NAME":grdMasterCode.GetGridData(obj,13);
    grdDetailCode.SetGridText(0,14,t);
    t=grdMasterCode.GetGridData(obj,14)==""?"CHAR4_NAME":grdMasterCode.GetGridData(obj,14);
    grdDetailCode.SetGridText(0,15,t);
    t=grdMasterCode.GetGridData(obj,15)==""?"CHAR5_NAME":grdMasterCode.GetGridData(obj,15);
    grdDetailCode.SetGridText(0,16,t);
}
//----------------------------------------------------
function ShowDetail()
{
    if (grdMasterCode.GetRowStatus(irow)==32)
    {
        ibtnAdd_D.SetEnable(false);
        ibtnSave_D.SetEnable(false);
        ibtnDelete_D.SetEnable(false);
        ibtnUnDelete_D.SetEnable(false);
        grdDetailCode.ClearData();
        txtMaster_PK.text="";
    }
    var icol,irow,iflag;
    icol=grdMasterCode.col;
    irow=grdMasterCode.row;
    txtMaster_PK.text=grdMasterCode.GetGridData(irow,0); //get pk
    lblID.text=grdMasterCode.GetGridData(irow,2); //get id
    lblName.text=grdMasterCode.GetGridData(irow,3); //get name
    iflag=grdMasterCode.GetGridData(irow,16); //get sys yn
    if (iflag==0 || codeadmin_yn =="Y") 
    {
        SetEditGrid(true);
        if (lblID.text=="HR0045")
            ibtnCreate_D.style.display=""
        else
            ibtnCreate_D.style.display="none"
    }
    else
        SetEditGrid(false);
    
    OnSetGrid(irow);
    //XU LY VOI CHARACTER 5 NO LA MOT LIST BOX 
    txthrcode_id.text=grdMasterCode.GetGridData(irow,15);
    if (txthrcode_id.text!="") //co su dung list box cua hr code
    {
        datHrCode.Call();		
    }    
    else
    {
        grdDetailCode.SetComboFormat(16,"#;|");
        datDetailCode.Call("SELECT");  
    }
}
//-----------------------------------------------------
function SetEditGrid(bflag)
{
    grdDetailCode.SetColEdit(2,bflag);
    grdDetailCode.SetColEdit(3,bflag);
    for (var i=7;i<=18;i++)
    {
        grdDetailCode.SetColEdit(i,bflag);
    }
    ibtnAdd_D.SetEnable(bflag);
    ibtnSave_D.SetEnable(bflag);
    ibtnDelete_D.SetEnable(bflag);
}
//-----------------------------------------------------
function CheckButton(obj)
{
    
    if (obj.id=="grdMasterCode")
    {
        var ctrl 	= grdMasterCode.GetGridControl();
        var rownum 	= ctrl.Row;
        var rownums 	= ctrl.Rows;
        
        if(rownum > 0 && rownums>1)
        {
            if(grdMasterCode.GetRowStatus(rownum) >= 64)
            {
	                ibtnDelete_M.SetEnable(false);
            }
            else
            {
	                ibtnDelete_M.SetEnable(true);
            }
        }
    }
    else if (obj.id=="grdDetailCode")
    {
        var ctrl 	= grdDetailCode.GetGridControl();
        var rownum 	= ctrl.Row;
        var rownums 	= ctrl.Rows;
        if(rownum > 0 && rownums>1)
        {
	    
            if(grdDetailCode.GetRowStatus(rownum) >= 64)
            {
	                ibtnDelete_D.SetEnable(false);
	                ibtnUnDelete_D.SetEnable(true);
            }
            else
            {
	                ibtnDelete_D.SetEnable(true);
	                ibtnUnDelete_D.SetEnable(false);
            }
        }
    }
}
//-------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-------------------------
function OnCreate_Money()
{
    txtResult.text="0";
    if (confirm("Do you want to create type of money?"))
        datCreateMoneyType.Call();
}

function onSearchDetail()
{	
    if(txtMaster_PK.text!="")
    {
        datDetailCode.Call("SELECT");
    }
    else
    {
        alert("Select master pls.")
    }
}

</script>
<body style="margin-top:0">

<!------------main control---------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------data control--------------------------->
<gw:data id="datMasterCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="ST_HR_SEL_GSHR00100_0" procedure="ST_HR_UPD_GSHR00100_0">
                <input bind="grdMasterCode" >
                    <input bind="txtID" />
                    <input bind="txtName" />
                </input>
                <output  bind="grdMasterCode" />
            </dso> 
        </xml> 
</gw:data>
<!------------------data control--------------------------->
<gw:data id="datCreateMoneyType" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process"  procedure="ST_HR_PRO_GSHR00100_0"> 
                <input >
                    <input  bind="lblID" />
                </input>
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------data control--------------------------->
<gw:data id="datGetMasterCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process"  procedure="ST_HR_PRO_GSHR00100_1"> 
                <input >
                    <input  bind="lblMasterCode" />
                </input>
                <output>
                    <output bind="lblMasterCode" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ST_HR_SEL_GSHR00100_1" procedure="ST_HR_UPD_GSHR00100_1">
                <input bind="grdDetailCode" >
                    <input bind="txtMaster_PK" />
                    <input bind="lstCompany" />
                    <input bind="lstDetail_Temp" />
                    <input bind="txtDetail_Val" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------------->
<gw:data id="datMasterCode_Temp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"   function="ST_HR_SEL_GSHR00100_0" > 
                <input  bind="grdMasterCode_Temp">
                    <input bind="txtID_Temp" />
                    <input bind="txtName_Temp" />
                </input>
                <output  bind="grdMasterCode_Temp" />
            </dso> 
        </xml> 
</gw:data>
<!------------------lay detail code cho character 5 ---------------------------------------->
<gw:data id="datHrCode" onreceive="OnDataReceive(this)"> 
        <xml> 
             <dso  type="list" procedure="ST_HR_PRO_GSHR00100_2" > 
                <input>
                    <input bind="txthrcode_id" /> 
                </input> 
                <output>
                    <output bind="txthrcode_value" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------table--------------------------->
   <table width="100%" id="tblMain" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
                             
               <table width="100%"  id="tblUpper" style="height:5%" border=1 cellpadding="0" cellspacing="0">
                    
                    <tr style="border:0;width:100%;height:100%"  >
                        <td style="border:0;width:10%;color:#3399FF" align="center" valign="middle">MASTER INFO</td>
                        <td style="border:0;width:10%" align="right" valign="middle">ID</b>
                        </td>
                        <td  style="border:0;width:15%" align="center" valign="middle" >
                            <gw:textbox id="txtID" text="" onenterkey="OnSearch()" />	
                        </td>
                        <td style="border:0;width:10%" align="right" valign="middle">Name</b>
                        </td>
                        <td  style="border:0;width:15%" align="center" valign="middle">
                            <gw:textbox id="txtName" text="" onenterkey="OnSearch()" />	
                        </td>
                        <td width="10%" style="border:0;" align="right" valign="middle" >
                         Company
                        </td>
                        <td width="15%" style="border:0;" align="right"  valign="middle">
                         <gw:list  id="lstCompany" value="ALL" maxlen = "100" styles='width:100%'onchange="if(txtMaster_PK.text!=''){ShowDetail()}" >
                            <data>
                                <%= CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>|ALL|Select ALL
                            </data>
                        </gw:list>
                        </td>
                        <td width="5%" style="border:0;" >
                         <gw:button img="search" id="ibtnSearch" text="Search"  alt="search"  onclick="OnSearch()"/>
                        </td>
                        <td width="5%" style="border:0;" >
                         <gw:button img="excel" id="ibtnPrint" text="Report"  alt="Detail printer" styles="display:none"  onclick="OnReport(1)"/>
                        </td>
						<td width="5%" style="border:0;"  >
                         <gw:button img="new" id="ibtnAdd_M"  text="Add New"  alt="Add"  onclick="OnAddNew(2)"/>
                        </td>
                         <td width="5%" style="border:0;" >
                         <gw:button img="save" id="ibtnSave_M"  text="Save"  alt="Save"  onclick="OnSave(2)"/>
                        </td>
                        <td width="5%" style="border:0;" >
                         <gw:button img="delete" id="ibtnDelete_M"  text="Delete"  alt="Delete"  onclick="OnDelete(2)"/>
                        </td>
                    </tr>
                </table>
                <table width="100%" id="tblMaster" style="height:50%" border=1 cellpadding="0" cellspacing="0" >
                    <tr style="border:0;width:100%;height:5%" >
                        <td width="60%" style="border:0;" align="left" ><gw:label img="new" id="lblMasterCode"  style="font-weight:bold;color:#FF3399;font-size:12"  text=""/>
                      
                        </td>
                        <td width="20%" style="border:0;" align="right" >
                         <gw:label img="new" id="lblRecord_M"  style="font-weight:bold;color:red;font-size:12"  text="0 record(s)"/>
                        </td>
                        <td width="8%" style="border:0;"  >
                         
                        </td>
                         <td width="3%" style="border:0;" >
                         
                        </td>
                        <td width="3%" style="border:0;" >
                         
                        </td>
                        <td width="3%" style="border:0;display:none"  >
                         
                        </td>
                        <td width="3%" style="border:0">
                         <gw:button img="excel" id="ibtnPrinter_M"  text="Report"  alt="Master Report" styles="display:none"  onclick="OnReport(2)"/>
                        </td>
                    </tr>
                    
                    <tr style="border:1;width:100%;height:95%" valign="top">
                        <td colspan=7 style="width:100%;height:100%;"> 
                             <gw:grid   
                                        id="grdMasterCode"  
                                        header="_PK|SEQ|ID|NAME|USE Y/N|REMARK|NUM 1 Name|NUM 2 Name|NUM 3 Name|NUM 4 Name|NUM 5 Name|CHA 1 Name|CHA 2 Name|CHA 3 Name|CHA 4 Name|CHA 5 Name|SYS Y/N"   
                                        format="0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|3"  
                                        aligns="1|1|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="||||-1||||||||||||"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="1000|1000|1500|2000|900|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|700"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"   oncellclick="ShowDetail();CheckButton(this)"  
                                        /> 
                         </td>
                    </tr>
               </table> 
               <table width="100%" id="tblDetail" style="height:45%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:5%" valign="center" >
                         <td style="border:0;width:10%;color:#3399FF" align="left" valign="middle"><gw:list  id="lstDetail_Temp" value="1" maxlen = "100" styles='width:100%' onchange="" >
                            <data>|0|CODE NAME|1|NUM 1|2|NUM 2|3|NUM 3|4|NUM 4|5|NUM 5|6|CHAR 1|7|CHAR 2|8|CHAR 3|9|CHAR 4|10|CHAR 5
                            </data>
                        </gw:list></td>
                        <td style="border:0;width:20%" align="right" valign="middle">
                            <gw:textbox id="txtDetail_Val" text="" styles='width:90%' onenterkey="onSearchDetail()" />
                        </td>
                        <td  style="border:0;width:15%" align="left" valign="right">
                           <gw:label img="new" style="color:red;font-weight:bold"  id="lblID"   text=""/>
                        </td>
                        <td style="border:0;width:10%" align="right" valign="middle">Name</b>
                        </td>
                        <td  style="border:0;width:15%" align="left" valign="middle">
                           <gw:label img="new" style="color:red;font-weight:bold" id="lblName"   text=""/>
                        </td>
                        <td width="10%" style="border:0;"  >
                            <gw:label img="new" id="lblRecord_D"  style="font-weight:bold;color:red;font-size:12" text="0 record(s)"/>
                        </td>
                        <td width="8%" style="border:0;"  >
                         <gw:imgBtn img="process" id="ibtnCreate_D"   alt="Create Money Type"  onclick="OnCreate_Money()"/>
                        </td>
                        <td width="3%" style="border:0;"  >
                         <gw:button img="new" id="ibtnAdd_D" text="Add New"  alt="Add"  onclick="OnAddNew(3)"/>
                        </td>
                         <td width="3%" style="border:0;"  >
                         <gw:button img="save" id="ibtnSave_D"  text="Save"  alt="Save"  onclick="OnSave(3)"/>
                        </td>
                        <td width="3%" style="border:0;"  >
                         <gw:button img="delete" id="ibtnDelete_D" text="Delete"   alt="Delete"  onclick="OnDelete(3)"/>
                        </td>
                        <td width="3%" style="border:0;display:none" align="right" >
                         <gw:imgBtn img="udelete" id="ibtnUnDelete_D"    alt="UnDelete"  onclick="OnUnDelete(3)"/>
                        </td>
                        
                    </tr>
                    
                    <tr style="border:1;width:100%;height:95%" valign="top">
                        <td colspan=11 style="width:100%;height:100%;"> 
                             <gw:grid   
                                        id="grdDetailCode"  
                                        header="_PK|_MasterPK|SEQ|CODE|NAME|KNAME|FNAME|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|USE Y/N|REMARK|COMPANY"   
                                        format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|2|3|0|0"  
                                        aligns="1|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="|||||||||||||||||-1||"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="1000|0|500|2000|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"  oncellclick="CheckButton(this)"
                                        param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" /> 
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
</body>
 <img status="expand" id="imgMaster" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:4;top:34;" onclick="OnToggle(1)"  /> 
 <img status="expand" id="imgDetail" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:4;top:465;" onclick="OnToggle(2)"  /> 
 <gw:textbox id="txtMaster_PK" styles="display:none" text="" />	
 <gw:textbox id="txtID_Temp" styles="display:none" text="" />	
 <gw:textbox id="txtName_Temp" styles="display:none" text="" />	
<gw:textbox id="txtExistMaster" styles="display:none" text=""/>
<gw:textbox id="txtResult" styles="display:none" text="0"/>
<gw:textbox id="txthrcode_id" styles="display:none" text="0"/>
<gw:textbox id="txthrcode_value" styles="display:none" text="0"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    
 <gw:grid   
id="grdMasterCode_Temp"  
header="_PK|NO|ID|NAME|USE Y/N|REMARK|NUM 1 Name|NUM 2 Name|NUM 3 Name|NUM 4 Name|NUM 5 Name|CHA 1 Name|CHA 2 Name|CHA 3 Name|CHA 4 Name|CHA 5 Name"   
format="0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0"  
aligns="1|1|1|0|1|0|0|0|0|0|0|0|0|0|0|0"  
defaults="||||||||||||||"  
editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
widths="1000|1000|1500|1500|900|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
styles="width:100%; height:230;display:none"   
sorting="T"   
param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" /> 
 
</html>
