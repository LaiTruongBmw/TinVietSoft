<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Accounting Common Code</title>
    <%CtlLib.SetUser("acnt")%>
  </head>
<script>
var bSelect =false;
var bSearch =false;
var p_update = false;
var codeadmin_yn;
codeadmin_yn ="<%=Session("CODEADMIN_YN")%>";

function BodyInit()
{
	System.Translate(document); 
    CheckRole();		
    grdMasterCode.GetGridControl().FrozenCols =6;
    grdDetailCode.GetGridControl().FrozenCols =8;
	var data1 = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";	
	lstCompany.SetDataText(data1); 
	txtID.SetEnable(false);
	txtName.SetEnable(false);
	var  v_id    = "<%=request.QueryString("ID")%>" ;
	txtID.SetDataText(v_id);
    datMasterCode.Call("SELECT");    
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
            imgMaster.src = "../../../system/images/down_orange.gif";
            tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="95%";
            
        }
        else
        {
            tblMaster.style.display="";
            imgMaster.status = "expand";
            imgMaster.src = "../../../system/images/up_orange.gif";
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
	txtMaster_PK.text ="";
	lblID.text ="";
	lblName.text ="";
	lblRecord_D.text ="0 record(s)";
	lblRecord_M.text ="0 record(s)";	
    datMasterCode.Call("SELECT");
    
}
//----------------------------------------------------------
function OnReport(obj)
{
    /*if (obj==1)
    {}
    else
    */
}
//-----------------------------------------------------------
function OnAddNew(obj)
{
    var inum;
    if (obj==2)
    {
        grdMasterCode.AddRow();
		inum = grdMasterCode.rows-1;
		grdMasterCode.SetGridText(inum,17,lstCompany.value);
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
//---------------------------------------------------------------
function OnSave(obj)
{
    if (confirm("Do you want to save?"))
    {
        if (obj==2)
        {
            if (checkDupItems(grdMasterCode,2,2) && checkDupItem(grdMasterCode_Temp,grdMasterCode,2))
			{
			    for(i=1;i<grdMasterCode.rows;i++)
			   {
			        if (grdMasterCode.GetGridData(i,17)=="")
			        {
			            grdMasterCode.SetGridText(i,17,lstCompany.value);
			         }
			   } 
                datMasterCode.Call();
			}
        }
        else
        {   
            if (checkNumber() && checkDupItems(grdDetailCode,4,2) )
            {
                inum = 1;
                for(i=1;i<grdDetailCode.rows;i++)
               {
                    if(grdDetailCode.GetGridData(i,1)=="")
                    {
                            grdDetailCode.SetGridText(i,1,txtMaster_PK.text);
                            if (i!=1)
                                inum=Number(grdDetailCode.GetGridData(i-1,2))+1;
                            else
                                inum=1;
                            grdDetailCode.SetGridText(i, 2, inum);
                    }
               } 
               p_update = true;       
                datDetailCode.Call();
              } 
        }
    }
}
//---------------------------------------------------------------
function checkDupItems(obj_grid,obj_col,obj_col_dis)
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
    	
	    if(j_code == i_code)
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
	 	for(j=8; j <= 12; j++)
		{
			var ij_num 	= grdDetailCode.GetGridData(i, j);
			ij_num		= ij_num.toUpperCase();
			if (isNaN(ij_num))
			{
				//alert("Please enter is number at col " + (j) + " and row " + (i) );
				//return false;
			}
			
		}	
	}
	for(i=1; i<rownum; i++)
	{
	 	var inum=grdDetailCode.GetGridData(i, 2);
	 	if (isNaN(inum) || Trim(inum)=="")
		{
			//alert("Please enter is number at col 1 " + " and row " + (i) );
			//return false;
		}
		if (Number(inum)<0)
		{
		    //alert("Please enter is number at col 1 " + " and row " + (i) );
			//return false;
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
	        ibtnUnDelete_M.SetEnable(true);
        }    
        else
        {
            grdDetailCode.DeleteRow();
            ibtnDelete_D.SetEnable(false);
	        ibtnUnDelete_D.SetEnable(true);
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
	        ibtnUnDelete_M.SetEnable(false);
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
        //auto_resize_column(grdMasterCode,0,grdMasterCode.cols-1,0);
        txtMaster_PK.text=grdMasterCode.GetGridData(1,0); //get pk
        lblRecord_M.text=grdMasterCode.rows-1 + " record(s).";
        lblID.text=grdMasterCode.GetGridData(1,2); //get id
        lblName.text=grdMasterCode.GetGridData(1,3); //get name 
        OnSetGrid(1);        
        datDetailCode.Call("SELECT");  
/*        if (grdMasterCode.rows>1)
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
    */        
    }
    else if (obj.id=="datDetailCode")
    {
        lblRecord_D.text=grdDetailCode.rows-1 + " record(s).";
        if(p_update)
        {
               // Get Option to return for AR Form
               var l_arr = new Array();
               for(i = 1; i < grdDetailCode.rows ; i++)
               {
                if(grdDetailCode.GetGridData(i, 3) == '-1')
                {
                    l_arr[0] = grdDetailCode.GetGridData(i, 5);
                }                        
               }
               l_arr[1] = "1";                     
               window.returnValue = l_arr;
               window.close();
        }
       
        //auto_resize_column(grdDetailCode,0,grdDetailCode.cols-1,0);
        
    }
    else if (obj.id=="datMasterCode_Temp")
    {
        datGetMasterCode.Call();
    }
    else if (obj.id=="datGetMasterCode")
    {
        lblMasterCode.text="   Max ID: " + lblMasterCode.text;
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
    grdDetailCode.SetGridText(0,8,t);
    t=grdMasterCode.GetGridData(obj,7)==""?"NUM2_NAME":grdMasterCode.GetGridData(obj,7);
    grdDetailCode.SetGridText(0,9,t);
    t=grdMasterCode.GetGridData(obj,8)==""?"NUM3_NAME":grdMasterCode.GetGridData(obj,8);
    grdDetailCode.SetGridText(0,10,t);
    t=grdMasterCode.GetGridData(obj,9)==""?"NUM4_NAME":grdMasterCode.GetGridData(obj,9);
    grdDetailCode.SetGridText(0,11,t);
    t=grdMasterCode.GetGridData(obj,10)==""?"NUM5_NAME":grdMasterCode.GetGridData(obj,10);
    grdDetailCode.SetGridText(0,12,t);
    t=grdMasterCode.GetGridData(obj,11)==""?"CHAR1_NAME":grdMasterCode.GetGridData(obj,11);
    grdDetailCode.SetGridText(0,13,t);
    t=grdMasterCode.GetGridData(obj,12)==""?"CHAR2_NAME":grdMasterCode.GetGridData(obj,12);
    grdDetailCode.SetGridText(0,14,t);
    t=grdMasterCode.GetGridData(obj,13)==""?"CHAR3_NAME":grdMasterCode.GetGridData(obj,13);
    grdDetailCode.SetGridText(0,15,t);
    t=grdMasterCode.GetGridData(obj,14)==""?"CHAR4_NAME":grdMasterCode.GetGridData(obj,14);
    grdDetailCode.SetGridText(0,16,t);
    t=grdMasterCode.GetGridData(obj,15)==""?"CHAR5_NAME":grdMasterCode.GetGridData(obj,15);
    grdDetailCode.SetGridText(0,17,t);
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
        SetEditGrid(true);
    else
        SetEditGrid(false);
    OnSetGrid(irow);
    datDetailCode.Call("SELECT");  
    
}
//-----------------------------------------------------
function SetEditGrid(bflag)
{
    grdDetailCode.SetColEdit(2,bflag);
    grdDetailCode.SetColEdit(4,bflag);
    for (var i=8;i<=19;i++)
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
	                ibtnUnDelete_M.SetEnable(true);
            }
            else
            {
	                ibtnDelete_M.SetEnable(true);
	                ibtnUnDelete_M.SetEnable(false);
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
		if (grdDetailCode.selrow >=1 && event.col == 3)
		{
		  
			for(i=1;i<grdDetailCode.rows;i++)
			{
				grdDetailCode.SetGridText( i , 3, "0");
			}
			grdDetailCode.SetGridText( grdDetailCode.selrow , 3, "-1");
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

function onChangeCompany()
{
	bSelect =false;
	txtMaster_PK.text ="";
	lblID.text ="";
	lblName.text ="";
	lblRecord_D.text ="0 record(s)";
	lblRecord_M.text ="0 record(s)";
	grdMasterCode.ClearData();
    grdDetailCode.ClearData();
    bSearch=true;
	datMasterCode_Temp.Call("SELECT");
}
function OnDataError(obj)
{
	if (obj.id=="datMasterCode")
    {
		alert("Please delete all detail code first!");
		return;
	}
}
</script>
<body style="margin-top:0">
<!------------------data control--------------------------->
<gw:data id="datMasterCode" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="ACNT.SP_SEL_ACNTCOMMCODE_MASTER" procedure="ACNT.SP_UPD_ACNTCOMMCODE_MASTER"> 
                <input bind="grdMasterCode" >
                    <input bind="txtID" />
                    <input bind="txtName" />
					<input bind="lstCompany" />
                </input>
                <output  bind="grdMasterCode" />
            </dso> 
        </xml> 
</gw:data>
<!------------------data control--------------------------->
<gw:data id="datGetMasterCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process"  procedure="ACNT.SP_PRO_ACNTCOMMCODE_MASTER"> 
                <input >
                    <input  bind="lblMasterCode" />
					<input  bind="lstCompany" />
                </input>
                <output>
                    <output bind="lblMasterCode" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ACNT.SP_SEL_ACNTCOMMCODE_DETAIL" procedure="ACNT.SP_UPD_ACNTCOMMCODE_DETAIL"> 
                <input bind="grdDetailCode" >
                    <input bind="txtMaster_PK" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------------->
<gw:data id="datMasterCode_Temp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"   function="ACNT.SP_SEL_ACNTCOMMCODE_MASTER" > 
                <input  bind="grdMasterCode_Temp">
                    <input bind="txtID_Temp" />
                    <input bind="txtName_Temp" />
					<input bind="lstCompany" />
                </input>
                <output  bind="grdMasterCode_Temp" />
            </dso> 
        </xml> 
</gw:data>

<!------------------table--------------------------->
   <table width="100%" id="tblMain" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%"  id="tblUpper" style="height:5%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:100%" valign="top" >
						<td width="10%" style="border:0;color:#3399FF" align="center" valign="middle" >
							</td>
						<td width="15%" style="border:0;color:#3399FF" align="left" >
							<gw:list id="lstCompany" styles="width:100%;display:none;" onchange="onChangeCompany()"></gw:list>
                        </td>
                        <td width="15%" style="border:0;color:#3399FF" align="center" valign="middle">MASTER INFO</td>
                        <td width="10%" style="border:0;" align="right" valign="middle">ID : 
                        </td>
                        <td width="15%" style="border:0;" align="center" valign="middle" >
                            <gw:textbox id="txtID" text="" onenterkey="OnSearch()" />	
                        </td>
                        <td width="10%" style="border:0;" align="right" valign="middle"> Name:&nbsp;
                        </td>
                        <td  style="border:0;width:15%" align="center" valign="middle">
                            <gw:textbox id="txtName" text="" onenterkey="OnSearch()" />	
                        </td>
                        <td width="5%" style="border:0;" align="right" >
                         <gw:imgBtn img="search" id="ibtnSearch"   alt="search"  onclick="OnSearch()"/>
                        </td>
                        <td width="5%" style="border:0;" align="right" >
                         <gw:imgBtn img="excel" id="ibtnPrint"   alt="Detail printer"  styles="display:none;" onclick="OnReport(1)"/>
                        </td>
                    </tr>
                </table>
                <table width="100%" id="tblMaster" style="height:50%" border=1 cellpadding="0" cellspacing="0" >
                    <tr style="border:0;width:100%;height:5%" valign="middle" >
                        <td width="60%" style="border:0;" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<gw:label img="new" id="lblMasterCode"  style="font-weight:bold;color:#FF3399;font-size:12"  text=""/>
                      
                        </td>
                        <td width="20%" style="border:0;" align="right" >
                         <gw:label img="new" id="lblRecord_M"  style="font-weight:bold;color:red;font-size:12"  text="0 record(s)"/>
                        </td>
                        <td width="8%" style="border:0;" align="right" >
                         <gw:imgBtn img="new" id="ibtnAdd_M"   alt="Add" style="display:none;" onclick="OnAddNew(2)"/>
                        </td>
                         <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="save" id="ibtnSave_M"    alt="Save" style="display:none;" onclick="OnSave(2)"/>
                        </td>
                        <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="delete" id="ibtnDelete_M"    alt="Delete" style="display:none;"  onclick="OnDelete(2)"/>
                        </td>
                        <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="udelete" id="ibtnUnDelete_M"    alt="UnDelete" style="display:none;" onclick="OnUnDelete(2)"/>
                        </td>
                        <td width="3%" style="border:0" align="right">
                         <gw:imgBtn img="excel" id="ibtnPrinter_M"    alt="Master Report" styles="display:none;"  onclick="OnReport(2)"/>
                        </td>
                    </tr>
                    
                    <tr style="border:1;width:100%;height:95%" valign="top">
                        <td colspan=7 style="width:100%;height:100%;"> 
                             <gw:grid   
                                        id="grdMasterCode"  
                                        header="_PK|ORD|ID|NAME|USE Y/N|REMARK|NUM 1 Name|NUM 2 Name|NUM 3 Name|NUM 4 Name|NUM 5 Name|CHA 1 Name|CHA 2 Name|CHA 3 Name|CHA 4 Name|CHA 5 Name|SYS Y/N|_COMPANY_PK"   
                                       format='0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|3|0'
                                        aligns='1|1|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        defaults='||||-1|||||||||||||'
                                        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                        widths="0|1000|1500|2000|900|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|700|0"
                                        styles="width:100%; height:100%"   
                                        sorting="T"   oncellclick="ShowDetail();CheckButton(this)" 
                                         onselchange="ShowDetail();CheckButton(this)" 
                                        /> 
                         </td>
                    </tr>
               </table> 
               <table width="100%" id="tblDetail" style="height:45%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:5%" valign="center" >
                         <td style="border:0;width:20%" align="center" valign="middle"><b style="color:#3399FF">DETAIL INFO</b>
                        </td>
                        <td style="border:0;width:10%" align="right" valign="middle"><b>ID:&nbsp;</b>
                        </td>
                        <td  style="border:0;width:15%" align="left" valign="middle">
                           <gw:label img="new" style="color:red;font-weight:bold"  id="lblID"   text=""/>
                        </td>
                        <td style="border:0;width:10%" align="right" valign="middle"><b>Name:&nbsp;</b>
                        </td>
                        <td  style="border:0;width:15%" align="left" valign="middle">
                           <gw:label img="new" style="color:red;font-weight:bold" id="lblName"   text=""/>
                        </td>
                        <td width="10%" style="border:0;" align="right" >
                            <gw:label img="new" id="lblRecord_D"  style="font-weight:bold;color:red;font-size:12" text="0 record(s)"/>
                        </td>
                        <td width="11%" style="border:0;" align="right" >
                         <gw:imgBtn img="new" id="ibtnAdd_D"   alt="Add" style="display:none;"  onclick="OnAddNew(3)"/>
                        </td>
                         <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="save" id="ibtnSave_D"    alt="Save"  onclick="OnSave(3)"/>
                        </td>
                        <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="delete" id="ibtnDelete_D"    alt="Delete" style="display:none;"  onclick="OnDelete(3)"/>
                        </td>
                        <td width="3%" style="border:0;" align="right" >
                         <gw:imgBtn img="udelete" id="ibtnUnDelete_D"    alt="UnDelete" style="display:none;" onclick="OnUnDelete(3)"/>
                        </td>
                        
                    </tr>
                    
                    <tr style="border:1;width:100%;height:95%" valign="top">
                        <td colspan=10 style="width:100%;height:100%;"> 
                             <gw:grid   
                                        id="grdDetailCode"  
                                        header="_PK|_MasterPK|ORD|DEF|CODE|NAME|LNAME|KNAME|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|USE Y/N|REMARK"   
                                        format="0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0"  
                                        aligns="1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="||||||||||||||||||-1|"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="0|0|500|500|2000|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|800|1500"  
                                        styles="width:100%; height:100%"   
                                        sorting="F"  
                                        oncellclick="CheckButton(this)"
                                       
                                         /> 
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>

 <img status="expand" id="imgMaster" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:4;top:34;" onclick="OnToggle(1)"  /> 
 <img status="expand" id="imgDetail" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:4;top:465;" onclick="OnToggle(2)"  /> 
 <gw:textbox id="txtMaster_PK" styles="display:none" text="" />	
 <gw:textbox id="txtID_Temp" styles="display:none" text="" />	
 <gw:textbox id="txtName_Temp" styles="display:none" text="" />	
<gw:textbox id="txtExistMaster" styles="display:none" text=""/>


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
 </body>
</html>
