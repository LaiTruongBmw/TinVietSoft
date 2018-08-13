<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Account Group Code</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var aValue = new Array()

var User_log;
var AdminYN;

User_log ="<%=Session("USER_ID")%>"
AdminYN  ="<%=Session("CODEADMIN_YN")%>";

function BodyInit()
{
	System.Translate(document);    
	if (AdminYN == '')
    {
        alert(''+'\n'+'Bạn đã hết phiên giao dịch. Hãy đăng nhập lại, cảm ơn!!!');
        return;
    }
	
    BindingDataList();
    Search();
    btnDelete.SetEnable(false);
    btnUndelete.SetEnable(false);
    btnUpdate.SetEnable(false);
    btnAdd.SetEnable(false);
    txtAccGrpID.GetControl().focus();
	  txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
    
}

function BindingDataList()
{ 
    if (AdminYN == 'Y')
    {
        var ls_data     = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0070','','') FROM DUAL")%>";
    }
    else if (AdminYN == 'N')
    {        
        var ls_data     = "<%=CtlLib.SetListDataFUNC("SELECT SUBSTR(ac_f_commoncode('ACAB0070','',''), 1, INSTR(ac_f_commoncode('ACAB0070','',''), '|Y|SYSTEM') -1) || SUBSTR(ac_f_commoncode('ACAB0070','',''), INSTR(ac_f_commoncode('ACAB0070','',''), '|Y|SYSTEM') + LENGTH('|Y|SYSTEM')) FROM DUAL")%>";
    }
    var ls_data2    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstTransGroup.SetDataText(ls_data);
    lstCompany.SetDataText(ls_data2);
	  
}

function Search()
{
    grdAGCode.ClearData();
	grdAccount.ClearData();
	SetControl(0);
	txtInput_PK.text = "";
	txtCode.SetDataText("");
	txtAccCode.SetDataText("");
	txtNameEng.SetDataText("");
	txtNameLocal.SetDataText("");
	txtNameKorean.text ="";
    dsoAccountGroupEntry.Call("SELECT")
}


function checkItemLength() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	
	if ( n == 1) 
	{
   		return false;
	}	
	for ( i=1; i<n; i++ ) {
		var data = grdAccount.GetGridData( i, 2 );
		if ( data.length > 50 ) 
		{			
			alert("'" + data + "' too large for column");
			return false;
		}		
	}
	return true;
}

function checkGrid() 
{
	checkItemLength();
	//checkDupItem();
}

function SetControl(n)
{
	if (txtInput_PK.text=="")
	{
		btnAdd.SetEnable(false);
	}
	else
	{
		btnAdd.SetEnable(true);
	}
    if (n>1) 
    { 
        btnDelete.SetEnable(true)
        btnUndelete.SetEnable(false)
        btnUpdate.SetEnable(true)
    }
    else
    {
        btnDelete.SetEnable(false)
        btnUndelete.SetEnable(false)
        btnUpdate.SetEnable(false)
    }
}

function OnDataReceive(obj)
{
    var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.Rows;
	var ctrlMaster = grdAGCode.GetGridControl();
	var nMaster    = ctrlMaster.Rows;
	if (obj.id=="dsoAccounGroupDetail")
	{
		if (txtInput_PK.text=="")
		{
			btnAdd.SetEnable(false);
		}
        else
		{
			btnAdd.SetEnable(true);
		}
        txtCode.GetControl().focus();
        SetControl(n);
 	}
 	else if (obj.id=="AccounGroupAdmin")
 	{
 	    SetControl(n);
 	    for (i=1; i < n; i++)
 	    {
 	        grdAccount.SetRowStatus(i, 0x20);
 	    }
 	    
        if (ctrl.rows==1) //Add 1 Row, If found no matching account
        {
 	        grdAccount.AddRow();
            grdAccount.SetGridText(ctrl.rows - 1, 1, txtInput_PK.GetData());
            SetControl(ctrl.rows);
        }

 	}
	if (obj.id=="dsoAccountGroupEntry")
	{
        if (nMaster>1) 
        { 
             btnDeleteM.SetEnable(true);
             //btnUndelete.SetEnable(false);
             btnSaveM.SetEnable(true);
        }
        else
        {
             btnDeleteM.SetEnable(false);
             //btnUndelete.SetEnable(false);
             btnSaveM.SetEnable(false);
        }
 	}
 	else if (obj.id=="pro_AccountGroup_Exists")
 	{
 	    if (txtCount.GetData() > 0)
 	    {
 	        alert('  You must delete code in form Account Group Code!'+'\n'+'Bạn hãy xóa Code này ở form Account Group Code trước!');
 	        return;
 	    }
 	    else
 	    {
 	        txtCount.SetDataText("0");
 	        dso_check_dup.Call();
		}
 	}
 	else if (obj.id=="dso_check_dup")
 	{
 	    if (txtCount.GetData() > 0)
 	    {
 	        alert('    Account Group Code is using in form Standard Slip Entry. You must delete code in form Standard Slip Entry first!'+'\n'+'Account Group Code đang sử dụng ở form Standard Slip Entry. Bạn hãy xóa Code này ở form Standard Slip Entry trước!');
 	        return;
 	    }
 	    else
 	    {
 	        CheckMasterData();
 	        grdAGCode.DeleteRow();
			grdAccount.ClearData();
			txtInput_PK.text ="";
			SetControl(0);
 	        dsoAccountGroupEntry.Call();
		}
 	}
}

function AccountRowClick()
{
    var ctrl1 = grdAccount.GetGridControl();
    
    if (grdAccount.GetGridData(ctrl1.row, 0) != "")
    {
        return;
    }
    if( event.col == 3 || event.col == 4 || event.col == 5)
	{
	    
	    var ctrl    = grdAGCode.GetGridControl();
	    var sNm ;
	    if (AdminYN == "Y")
        {
	        if (lstTransGroup.GetData() == 'Y')
            {
	            sNm  = grdAGCode.GetGridData(ctrl.row, 2);
	        }
	        else
	        {
	            sNm = "";
	        }
	    }
	    else
	    {
	        sNm     = "";
	    }
      var fpath   = System.RootURL + "/standard/forms/60/03/60030040_popup_account.aspx?comm_code=&val1=" + txtInput_PK.GetData() + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60030040_popup_account";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            grdAccount.RemoveRowAt(grdAccount.rows - 1);
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    grdAccount.AddRow();
	                    grdAccount.SetGridText(grdAccount.rows - 1, 1, txtInput_PK.GetData());//
	                    grdAccount.SetGridText(grdAccount.rows - 1, 2, tmp[0]);//Code
	                    grdAccount.SetGridText(grdAccount.rows - 1, 3, tmp[0]);//Account Code
	                    grdAccount.SetGridText(grdAccount.rows - 1, 4, tmp[1]);//Account Name (Eng)
	                    grdAccount.SetGridText(grdAccount.rows - 1, 5, tmp[4]);//Account Name (Local)
						grdAccount.SetGridText(grdAccount.rows - 1, 6, tmp[6]);//Account Name (Korean)
						grdAccount.SetGridText(grdAccount.rows - 1, 7, tmp[3]);
	                }
	            }
	        }
	    }
	}		
}

function checkNullData()
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	
	if ( n == 1) 
	{
   		return false;
	}	
	for ( i=1; i<n; i++ ) 
	{		
		var data = grdAccount.GetGridData( i, 2 );
	
		if ( data == "" ) 
		{
			alert('Code is not null!'+'\n'+'Mã code không được rỗng!');
			return false;		
		}
	    data = grdAccount.GetGridData( i, 7 );
		if ( data == "" ) 
		{
			alert('Please select a Account Code!'+'\n'+'Bạn hãy chọn Account Code');
			return false;
		}		
	}	
	return true;
}

function checkDupItem() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if (n < 2) 
	{
        return false;
	}	
	else
	{
	    for (i=1; i< n -1; i++ ) 
	    {	   
		    for (j=i+1; j< n; j++)
		    {
		        var data_1 = grdAccount.GetGridData( i, 2 );
			    var data_2 = grdAccount.GetGridData( j, 2 );			
			    if ((data_1 != "") && ( data_1.toUpperCase() == data_2.toUpperCase()))
			    {
				    alert("'" + data_1 + "' Code already in use, please re-enter");				
				    return false;		
			    }
				data_1 = grdAccount.GetGridData( i, 7 );
			    data_2 = grdAccount.GetGridData( j, 7 );			
			    if ((data_1 != "") && (data_1 == data_2)) 
			    {
				    alert("'" + grdAccount.GetGridData( j, 3 ) + "' Account Code already in use, please re-select");
				    return false;		
			    }
		    }
	    }
	}
	return true;
}

function UpdateOnClick() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	var row  = ctrl.row;
	
    if (n > 1)
    {	
	    if (checkNullData() && checkItemLength() )
		{		
		    for ( i=1; i<ctrl.rows; i++ ) 
			{
			    var data = grdAccount.GetGridData( i, 3 );
				if ( data.length == 0 ) 
				{
				    grdAccount.SetRowStatus(i, 64);
				}
			}
			if (confirm(' Are you sure want to save?'+'\n'+'Bạn có muốn lưu lại không?')) 
			{
				dsoAccounGroupDetail.Call("");
			}
		}
	}
}

function CheckBeforeAdd() 
{
	var agcode = '' + txtInput_PK.text;
	if (agcode != '') 
	{
		return true;
	}
	else 
	{
		alert('Please select a Account Group Code frist!'+'\n'+'Bạn hãy chọn Account Group Code trước!');
		return false;
	}
}



function OnAdd_New_Admin()
{
    if (txtInput_PK.text == "")
    {
        alert('You must choose A/C group code frist!!!'+'Bạn hãy chọn A/C group code trước!!!');
        return;
    }
    else
    {
        var ctrl = grdAccount.GetGridControl();
	    var n    = ctrl.rows;	
	    if (n > 1)
	    {
            grdAccount.AddRow();
            grdAccount.SetGridText(ctrl.rows - 1, 1, txtInput_PK.GetData());
        }
        else
        {
            txtACCD.text = grdAGCode.GetGridData(grdAGCode.selrow, 3);
            AccounGroupAdmin.Call("SELECT");
            // Kiem tra lai
        }
    }
}

function OnAdd_New_User()
{
	if (txtInput_PK.text == "")
    {
        alert('You must choose A/C group code frist!!!'+'Bạn hãy chọn A/C group code trước!!!');
        return;
    }
   //This code is allow to add account group code 
    var ctrl = grdAccount.GetGridControl(); 
   var n    = ctrl.rows;	
    if (n > 1)
    {
        grdAccount.AddRow();
        grdAccount.SetGridText(ctrl.rows - 1, 1, txtInput_PK.GetData());
    }
    else
    {
        txtACCD.text = grdAGCode.GetGridData(grdAGCode.selrow, 3);
        AccounGroupAdmin.Call("SELECT");
        // Kiem tra lai
    } 
   /* 
    grdAccount.AddRow();
    var ctrl = grdAccount.GetGridControl();
    var n = ctrl.Rows -1;
    grdAccount.SetGridText(n, 1,txtInput_PK.text );
    btnUpdate.SetEnable(true);
   */
    
}

function AddOnClick()
{
    if (AdminYN == 'Y')
    {
        if (lstTransGroup.GetData() == 'Y')
        {
            OnAdd_New_Admin();
        }
        else
        {
            OnAdd_New_User();
        }
    }
    else
    {
        OnAdd_New_User();
    }
}

function DeleteOnClick() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if ( n > 1 )
	{		
		if ( row < 0 ) 
		{
		    alert('Please select a Code to delete!'+'\n'+'Bạn hãy chọn dòng đễ xóa!');
		}			
		else
		{
			if (confirm('Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa Code này?'))
			{
				for ( i=0; i < ctrl.rows; i++ )
			    {
				    if (ctrl.isSelected(i) == true)
				    {
				        grdAccount.DeleteRow();
				    }
				}
				checkData();
				dsoAccounGroupDetail.Call("");	
			}
		}
	}
	else 
	{
		alert('Please select a Code to delete!'+'\n'+'Bạn hãy chọn dòng đễ xóa!');
	}		
}

function SearchonClick()
{
    if (txtInput_PK.GetData() == '') 
    {
        alert("Please select a Code!")
    }
    else
    {
        dsoAccounSearchDetailS.Call('SELECT')
    }
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
function checkData() 
{
	var ctrl = grdAccount.GetGridControl();
	var n = ctrl.rows;
	var row = ctrl.row; 

	if ( n > 1 ) 
	{ 
		if ( row < 0 ) 
		{
		}
		else 
		{ 
			if (grdAccount.GetRowStatus( ctrl.row ) >= 64) 
			{
				btnDelete.SetEnable(false);
				btnUndelete.SetEnable(true);
			}
			else {
				btnDelete.SetEnable(true);
				btnUndelete.SetEnable(false);
			}
		} 
	} 
}


function RowClick() 
{
	var ctrl = grdAGCode.GetGridControl();
	var n    = ctrl.Rows;
	var row  = ctrl.Row;	
	var tmp  = txtInput_PK.text;
	if ( n > 1 ) {
	
		if ( row > 0 ) 
		{			
			if ( grdAGCode.GetRowStatus( ctrl.Row ) >= 64 ) 
			{
				btnDeleteM.SetEnable(false);
				//btnUndelete.SetEnable(true);
			}
			else {
				btnDeleteM.SetEnable(true);
				//btnUndelete.SetEnable(false);
			}
		}	
	}	
	
	txtCode.SetDataText("");
	txtAccCode.SetDataText("");
	txtNameEng.SetDataText("");
	txtNameLocal.SetDataText("");
	txtNameKorean.text = "";
	txtInput_PK.text = grdAGCode.GetGridData( grdAGCode.selrow , 0 );	
    if(txtInput_PK.text == "")
    {
		grdAccount.ClearData();
	}
	else
	{
		if(tmp!=txtInput_PK.text)
		{
			dsoAccounGroupDetail.Call("SELECT");
		}
	}
}



function onMasterAddClick()
{
    grdAGCode.AddRow();
    btnSaveM.SetEnable(true)
    var ctrl = grdAGCode.GetGridControl();
	var n = ctrl.Rows;
	grdAGCode.SetGridText( n-1, 1, lstCompany.GetData() );
	grdAGCode.SetGridText( n-1, 2, lstTransGroup.GetData() );
}

function onMasterSaveClick()
{
    if (checkMasterItemLength() && checkDupMasterItems())
    {
        for(i=1;i<grdAGCode.rows;i++)
        {
            if(grdAGCode.GetGridData(i,1)=="")
            {
                grdAGCode.SetGridText( i, 1, lstCompany.GetData() );
	            grdAGCode.SetGridText( i, 2, lstTransGroup.GetData() );
            }
        }
        dsoAccountGroupEntry.Call();
    }
}

function checkMasterItemLength()
{
	var ctrl = grdAGCode.GetGridControl();
	var n    = ctrl.Rows;	
	
	if ( n == 1)
	{
   		return false;
	}
	for ( i=1; i<n; i++ )
	{
		var data = grdAGCode.GetGridData( i, 3 );
		if ( data.length < 1 )
		{
		    alert('    Account Group Code is not null!!!'+'\n'+'Account Group Code không được rỗng!!!');
			return false;
		}
		if ( data.length > 10 )
		{			
			alert('Account Group Code is too large for column( <= 10 characters)'+'\n'+'   Dữ liệu Account Group Code quá lớn ( <= 10 ký tự)');
			return false;
		}
		
		var data = grdAGCode.GetGridData( i, 4 );
		if ( data.length < 1 )
		{
		    alert('    Account Group Name is not null!!!'+'\n'+'Account Group Name không được rỗng!!!');
			return false;
		}
		if (data.length > 60 ) 
		{			
			alert('Account Group Name is ntoo large for column!'+'\n'+'  Dữ liệu Account Group Name quá lớn!');
			return false;
		}
		
		var data = grdAGCode.GetGridData( i, 7 );
		if ( data.length < 1 )
		{
		    alert('   Description is not null!!!'+'\n'+'Description không được rỗng!!!');
			return false;
		}
		if ( data.length > 100 ) 
		{
			alert('Description is too large for column!'+'\n'+'  Dữ liệu Description quá lớn!');
			return false;
		}
	}
	return true;
}

function checkDupMasterItems()
{
	var ctrl = grdAGCode.GetGridControl();
	var n    = ctrl.Rows;
	var row  = ctrl.Row;
	
	if ( n==1 ) 
	{
   		return false;
	}
	for ( i=1; i<n; i++ ) 
	{
		if ( row != i ) 
		{
			var data_1 = grdAGCode.GetGridData( row, 3 );
			var data_2 = grdAGCode.GetGridData( i, 3 );			
			if ( ( data_1.length != 0 ) && ( data_1.toUpperCase() == data_2.toUpperCase() ) ) 
			{
				alert('   Account Group Code is exist. Please check again!!!'+'\n'+'Account Group Code đã tồn tại. Bạn vui lòng kiểm tra lại!!!');
				return false;		
			}

			var data_1 = grdAGCode.GetGridData( row, 4 );
			var data_2 = grdAGCode.GetGridData( i, 4 );
			if ( ( data_1.length != 0 ) && ( data_1.toUpperCase() == data_2.toUpperCase() ) ) 
			{
                alert('   Account Group Name is exist. Please check again!!!'+'\n'+'Account Group Name đã tồn tại. Bạn vui lòng kiểm tra lại!!!');
				return false;
			}			
		}
	}
	return true;
}

function CheckMasterData()
{
	var ctrl = grdAGCode.GetGridControl();
	var n    = ctrl.Rows;
	var row  = ctrl.Row;	
	
	if ( n > 1 ) {
	
		if ( row > 0 ) 
		{			
			if ( grdAGCode.GetRowStatus( ctrl.Row ) >= 64 ) 
			{
				btnDeleteM.SetEnable(false);
				//btnUndelete.SetEnable(true);
			}
			else {
				btnDeleteM.SetEnable(true);
				//btnUndelete.SetEnable(false);
			}
		}	
	}	
}

function onMasterDeleteClick()
{
    var ctrl = grdAGCode.GetGridControl();
	var n    = ctrl.Rows;
	var row  = ctrl.Row;
	
    if ( row < 0 ) 
	{			
	    alert('Please select a code to delete!!!'+'\n'+'Bạn hãy chọn code cần xóa!!!');
	}			
	else
	{
	    if (confirm(' Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa dữ liệu này?')) 
	    {
		    var j = 0;
		    var i = 1;
		    while ((i < ctrl.rows) && (j < 2))
		    {
		        if (ctrl.isSelected(i) == true)
		        {
		            j = j + 1;
		        }
		        i = i + 1;
		    }
		   
            if (j > 1)
            {
                alert('You must one row to delete!!!'+'\n'+'Bạn chỉ chọn 1 dòng để xóa!!!')
                return;
            }		    
		    
		    for ( i=1; i < ctrl.rows; i++ )
			{
			    if (ctrl.isSelected(i) == true)
			    {
				    txtInput_PKMaster.text = grdAGCode.GetGridData( i, 0 );	
			        pro_AccountGroup_Exists.Call();
				}
			}
		}
	}
}

</script>
<body style="margin:0; padding:0;">
    
	<gw:data id="dsoAccountGroupEntry"  onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="ac_sel_60030040_acc_group" parameter="0,1,2,3,4,5,6,7,8" procedure="ac_upd_60030040_acc_group"> 
                    <input bind="grdAGCode" > 
                    <input bind="lstCompany" /> 
                    <input bind="lstTransGroup" /> 
                    <input bind="txtAccGrpID" /> 
                    <input bind="txtAccGrpName" /> 
                </input> 
                <output bind="grdAGCode" /> 
            </dso> 
        </xml> 
    </gw:data> 
	
	   <gw:data id="pro_AccountGroup_Exists"  onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60030040_acc_group">
                <input>
                     <input  bind="txtInput_PKMaster"/>
                </input>
                <output>
                     <output  bind="txtCount"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_check_dup"  onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60030040_acc_group">
                <input>
                     <input  bind="txtInput_PKMaster"/>
                </input>
                <output>
                     <output  bind="txtCount"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
	
    <gw:data id="dsoAccounGroupDetail" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" parameter="0,1,2,7" function="ac_sel_60030040_acc_group_dl" procedure="ac_upd_60030040_acc_group_d" > 
                <input bind="grdAccount" >
                    <input bind="txtInput_PK" /> 
                </input> 
                <output bind="grdAccount" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="AccounGroupAdmin" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" parameter="0,1" function="ac_sel_60030040_accgroup_admin"> 
                <input bind="grdAccount" >
                    <input bind="txtInput_PK" /> 
                    <input bind="txtACCD" /> 
                    <input bind="lstCompany" /> 
                </input> 
                <output bind="grdAccount" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoAccounSearchDetailS" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030040_acc_grp_dtl_s"  > 
                <input bind="grdAccount" >
                    <input bind="txtInput_PK" /> 
                    <input bind="txtCode" /> 
                    <input bind="txtAccCode" /> 
                    <input bind="txtNameEng" /> 
                    <input bind="txtNameLocal" /> 
					<input bind="txtNameKorean" /> 
                </input> 
                <output bind="grdAccount" /> 
            </dso> 
        </xml> 
    </gw:data>
     <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
   
        <table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
            <tr>
                <td width="45%" valign="top">
                    <table border="0" cellpadding="1" cellspacing="1" style="width:100%;height:100%">
                        <tr style="height:2%">
                            <td width="20%" align="right">Company</td>
                            <td width="30%"><gw:list id="lstCompany" styles="width:100%;" value="" onchange="Search()"></gw:list></td>
                            <td width="20%" align="right">Trans Group</td>
                            <td width="30%"><gw:list id="lstTransGroup" styles="width:100%;" value="" onchange="Search()"></gw:list></td>
                        </tr>
						<tr style="height:2%">
							<td align="right">Acc. Grp Code</td>
							<td><gw:textbox id="txtAccGrpID" styles='width:100%' onenterkey="Search()" onkeypress="Upcase()"/> </td>
							<td align="right">Acc. Grp Name</td>	
							<td><gw:textbox id="txtAccGrpName" styles='width:100%' onenterkey="Search()" onkeypress="Upcase()" /> </td>
						</tr>
						<tr style="height:2%">
							<td colspan="4" align="right">
								<table border=0 cellpadding="0" cellspacing="0" width="100%">
									<tr>
									<td width="92%"></td>				
									<td width="5%"><gw:imgBtn img="search"  alt="Search"   id="btnSearchM"   onclick="Search()" styles="display:none;"/></td>
									<td width="1%"> <gw:button  id="btnAddM" img="new" alt="New" onclick="onMasterAddClick()" /></td>
									<td width="1%"><gw:button id="btnSaveM" img="save" alt="Save" onclick="onMasterSaveClick();return false;"/></td>
									<td width="1%"><gw:button id="btnDeleteM" img="delete" alt="Delete" onclick="onMasterDeleteClick()"/></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height:94%">
							<td colspan="4">
							<gw:grid   
						    id="grdAGCode"  
						    header  ="_PK|_COMPANY|_APP_GRP|Acc. Grp Code|Acc. Grp Name|Acc. Grp Name (LC)|Local Description|Description|_User"   
						    format  ="0|0|0|0|0|0|0|0|0"  
						    aligns  ="0|0|0|0|0|0|0|0|0"  
						    defaults="|||||||||"  
						    editcol ="0|0|0|1|1|1|1|1|1"  
						    widths  ="0|0|0|1500|2200|2200|2200|2500|0"  
						    styles  ="width:100%; height:100%"   
						    sorting ="T"   
						    param="0,1,2,3,4,5,6,7,8" 
						    oncellclick="RowClick()" 
						 /> 
							</td>
						</tr>
                    </table>
                    
                </td>
                <td width="55%"  valign="top">
                    <table id="RightTopTB" border="0" cellpadding="1" cellspacing="1" style="width:100%;height:100%">
                        <tr style="height:2%">
                            <td width="25%" align="right">Code&nbsp;&nbsp;</td>
                            <td width="25%" >
                                <gw:textbox id="txtCode" styles='width:100%' onenterkey="SearchonClick()" onkeypress="CheckNumeric()"/>
							</td>
                            <td width="25%" align="right">Acc. Code&nbsp;&nbsp;</td>
                            <td width="25%" ><gw:textbox id="txtAccCode" styles='width:100%' onenterkey="SearchonClick()" onkeypress="CheckNumeric()"/></td>
                            
                        </tr>
                        <tr style="height:2%">
                            <td align="right">Acc. Name (ENG)</td>
                            <td ><gw:textbox id="txtNameEng" styles='width:100%' onenterkey="SearchonClick()" onkeypress="Upcase()"/></td>
                            <td align="right">Acc. Name (LC)</td>
                            <td ><gw:textbox id="txtNameLocal" styles='width:100%' onenterkey="SearchonClick()" onkeypress="Upcase()"/></td>
                        </tr>
						<tr style="height:2%">
							<td align="right">Acc. Name (KOR)</td>
                            <td ><gw:textbox id="txtNameKorean" styles='width:100%' onenterkey="SearchonClick()" onkeypress="Upcase()"/></td>
                            <td width="25%" align="center"></td>
							<td align="right" width="25%">
								<table cellspacing="0" cellpadding="0" border="0">
								<td width="1%"> <gw:button  id="btnAdd" img="new" alt="New" onclick="AddOnClick()" /></td>
								<td width="1%"><gw:button id="btnUpdate" img="save" alt="Save" onclick="UpdateOnClick()"/></td>
								<td width="1%"><gw:button id="btnDelete" img="delete" alt="Delete" onclick="DeleteOnClick()"/></td>
                               <td ><gw:imgbtn img="printer" alt="Print"     id="btnUndelete" onclick=""  styles='display:none;'/></td>
								</table>
							</td>
						</tr>
						<tr style="height:94%">
							<td colspan="4">
								<gw:grid 
                                    id      ="grdAccount" 
                                    header  ="_PK|_TAC_ABTRACGRP_PK|Code|Acc. Code|Acc. Name (ENG)|Acc. Name (LC)|Acc. Name (KOR)|_TAC_ABACCTCODE_PK|Acc. Code (LC)-VAS"
                                    format  ="0|0|0|0|0|0|0|0|0" 
                                    aligns  ="0|0|1|1|2|2|2|0|0" 
                                    defaults="||||||||" 
                                    editcol ="0|0|1|0|0|0|0|0|0"
                                    widths  ="0|0|1000|1500|2700|2700|2700|0|1500"
                                    styles  ="width:100%; height:100%" 
                                    sorting ="T"
                                    param   ="0,1,2,3,4,5,6,7"
									oncellclick     ="checkData()"
                                    oncelldblclick  ="AccountRowClick()"
                                    onafteredit     ="checkGrid()" />
									
							</td>
						</tr>
                    </table>
                </td>
            </tr>
        </table>
  
 <gw:textbox id="txtInput_PK"   text="" style="display: none" />
 <gw:textbox id="txtInput_PKMaster"   text="" style="display: none" />
 <gw:textbox id="txtACCD"       text="" style="display: none" />
 <gw:textbox id="txtCount" text="" style="display:none" />
 <gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>