<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Allotment Booking</title>
</head>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>";
    var  user_name = "<%=Session("USER_NAME")%>"  ;
//-----------------------------------------------------
var flag = '' ;

//-----------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display      = "none";       
        imgArrow.status         = "collapse";
        right.style.width       = "100%";
        imgArrow.src            = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display      = "";
        imgArrow.status         = "expand";
        right.style.width       = "80%";
        imgArrow.src            = "../../../../system/images/prev_orange.gif";
    }
 }
 
//==========================================================================

function BodyInit()
{
	var data = "<%=CtlLib.SetListDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
	lstRate.SetDataText(data);
	/*data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE' order by ord" )%>"; 
    grdMiniBar.SetComboFormat(2, data);//room type=(code) in grid*/
	
	var data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='BKTYPE' order by ord" )%>"; 
	lstBookingType.SetDataText(data);
	
	var data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='BKTYPE' order by ord" )%>|ALL|Select All"; 
	lstBookingTypeS.SetDataText(data);
	lstBookingTypeS.value='ALL';
	
}
function OnSearch(pos) 
{
    switch (pos)
    {
        case 'grdSearch' : 
			if(txtContractNoS.text !="" || txtCustomer.text !="")  
			{
				dtFromDateS.value='20000101';
				//dtFromDateS dtToDateS
			}
			else
			{
				//dtFromDateS.value=dtToDateS.value;
			}
            dso_htfo00060_searchM.Call("SELECT")
        break;
        case 'Master' :
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( event.row, 0); 
				flag = '';	
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            dsp_htbk00130_mst.Call("SELECT");
        break;
    }
}
//-------------------------------------------------------------------------------------------------

//==========================================================================
function OnDataReceive(obj)
{
  switch (obj.id)
    {
        case "dsp_htbk00130_mst" :
            if ( flag == 'save'|| flag == 'delete')
            {
			    if(flag == 'save')
                {
                   
				   for(var i=0; i < grdMiniBar.rows;i++)
                    {
                        if ( grdMiniBar.GetGridData( i, 1) == '' )
                        {
                            grdMiniBar.SetGridText( i, 1, txtMasterPK.text);
                        }    
                    }
					flag = 'save';
					//alert(txtMasterPK.text);
					//grdMiniBar.UpdateRow();
					dsp_htbk00130_dtl.Call(); 
                }            
            }
            else
            {
                dsp_htbk00130_dtl.Call("SELECT"); 
            }             
        break;
        case "dsp_htbk00130_dtl" :
            /*if(flag == 'save' || flag == 'Delete')
            {
                if(flag == 'save')
                {
                    OnSearch('grdSearch'); 
                    flag = 'select';
                }
                else
                {
                    dsp_htbk00130_mst.Call();
                    flag = 'break OnDataReceive';
                }
            }*/
        break;
        
     }
}
//==========================================================================
function OnAddNew(obj)
{
	if(obj=='Master')
	{
		dsp_htbk00130_mst.StatusInsert();
		grdMiniBar.ClearData();
		dsp_htbk00130_Addnew_dtl.Call("SELECT");
	}
	if(obj=='Detail')
	{
		grdMiniBar.AddRow(); 
	}
}
function validateDTL()
{
	for(var i=1;i<grdMiniBar.rows;i++)
          {
            if(grdMiniBar.GetGridData(i,2) == "")
             {
                alert("Please,choose room type at row "+ i);
                return false;
             }
			if(grdMiniBar.GetGridData(i,3) == "")
             {
                alert("Please input take at row "+ i);
                return false;
             }
             
          }
          return true;
}
function OnSave()
{
	
	if (txtSlipNo.text == '')    
	{
		alert('Please, input contract no to save.');
		return;
	}
	if (txtCompanyPK.text == '')
	{
		alert('Please, choose customer to save.');
		return;
	}
	if (txtReleaseDays.text == '')
	{
		alert('Please, input Release Days to save.');
		return;
	}
	
	flag = 'save';
	dsp_htbk00130_mst.Call();
}

//==========================================================================
function OnDelete(index)
 {
    switch(index)
    {
        case'Master':
			if (txtMasterPK.text != '')
			{
				if ( confirm( "Do you want to delete contract no " + txtSlipNo.text + " ?" ) ) 
				{
					flag = 'delete';
					dsp_htbk00130_mst.StatusDelete();
					dsp_htbk00130_mst.Call(); 
				}
			}        
        break;
        
        case 'Detail':
			/*if (grdMiniBar.rows > 1 && grdMiniBar.GetGridData(grdMiniBar.row, 0)!="")
			{
				flag ='Delete';
				grdMiniBar.DeleteRow();
				dsp_htbk00130_dtl.Call();
			}
			else
			{
			    dsp_htbk00130_dtl.Call("SELECT");
			    flag ='end';
			}*/
        break;
    }         
 }
function OnPopUp(pos)
{   
	if(pos=='Customer')
	{
		var path = System.RootURL + '/standard/forms/ho/24/60240080_pp.aspx';
		var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
 
		 if ( obj != null )
		 {
			txtCompanyPK.text = obj[0];   
			txtCompany.text   = obj[3];
		}
	}
	if(pos=='CustomerS')
	{
		var path = System.RootURL + '/standard/forms/ho/24/60240080_pp.aspx';
		var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
 
		if ( obj != null )
		{ 
			txtCustomer.text   = obj[3];
		}
	}
}
function OnReportClick()
{
		var url =System.RootURL + '/standard/reports/ho/24/rpt_60240080_Allotment.aspx?p_master_pk='+ txtMasterPK.text ;
		window.open(url);    
}
</script>

<body>
    <!---------------------------------------------------------------------------->
    <gw:data id="dso_htfo00060_searchM" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ht_sel_60240080" > 
                <input bind="grdSearch" > 
                     <input bind="dtFromDateS" />  
                     <input bind="dtToDateS" /> 
                     <input bind="txtContractNoS" />  
                     <input bind="txtCustomer" /> 
                     <input bind="lstBookingTypeS"/>      
                 </input> 
                <output bind="grdSearch" />   
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="dsp_htbk00130_mst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="ht_sel_60240080_mst" procedure="ht_upd_60240080_mst" > 
                <inout> 
                     <inout bind="txtMasterPK" />       
                     <inout bind="txtSlipNo" />  
					 <inout bind="dtContractDate" />
                     <inout bind="lstBookingType" />
                     <inout bind="txtDescription" />
                     <inout bind="lstRate"/>
                     <inout bind="dtFromDate"/>
                     <inout bind="dtToDate"/>
                     <inout bind="txtReleaseDays"/>
					 <inout bind="txtCompanyPK"/>  
					 <inout bind="txtCompany"/>
					 <inout bind="lblCreateBy"/>
                     <inout bind="lblCreateDate"/>
					 <inout bind="lblModifyBy"/>  
					 <inout bind="lblModifyDate"/>
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dsp_htbk00130_dtl" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="ht_sel_60240080_dtl"  procedure="ht_upd_60240080_dtl" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdMiniBar" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	<gw:data id="dsp_htbk00130_Addnew_dtl" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  function="ht_sel_60240080_addnew_dtl"  procedure="" > 
                <input> 
                    <input bind="txtNotPara" /> 
                </input> 
                <output bind="grdMiniBar" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Date
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:datebox id="dtFromDateS" lang="1" onchange="OnSearch('grdSearch')" /> 
                            ~
                            <gw:datebox id="dtToDateS" lang="1" onchange="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 25%; white-space: nowrap">
                            Contract#
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtContractNoS" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%" nowrap>
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('CustomerS')">Customer</b>
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="2">
                            <gw:textbox id="txtCustomer" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%" nowrap>Booking Type:</b>
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="2">
							<gw:list id="lstBookingTypeS" styles='width:100%' onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Customer Name|Contract#|From Date|To Date" format="0|0|0|4|4" aligns="0|0|0|0|0"
                                defaults="|||||" editcol="0|0|0|0|0" widths="0|1000|1500|1200|1000" styles="width:100%; height:100%"
                                autosize="T" sorting="T" acceptnulldate="true" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 2%">
                        <td style="width: 15%; white-space: nowrap" align="right"><b style="color: Red">*</b>Contract No</td>
                        <td style="width: 20%"><gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%"  /></td>
                        <td style="width: 10%" align="right"><b>Date</b></td>
                        <td style="width: 13%"><gw:datebox id="dtContractDate" lang="1" /></td>
						<td style="width: 15%" align="right">Booking Type</td>
                        <td style="width: 15%"><gw:list id="lstBookingType" styles='width:100%' /></td>
                        <td style="width: 3%" align="right"><gw:imgbtn id="btnNew" img="new" alt="New Take Out Goods" text="Add" onclick="OnAddNew('Master')" /></td>
                        <td style="width: 3%" align="right"><gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" /></td>
                        <td style="width: 3%" align="right"><gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" /></td>
                        <td style="width: 3%" align="right"><gw:imgbtn id="btnReport" img="excel" alt="Print" text="Print" onclick="OnReportClick()" /></td>
                    </tr>
					<tr style="height: 2%">
                        <td style="width: 15%; white-space: nowrap" align="right"><b>Description</b></td>
                        <td style="width: 20%" colspan="3"><gw:textbox id="txtDescription"  styles="width:100%"  /></td>
                        <td style="width: 15%" align="right">Rate</td>
                        <td style="width: 3%" colspan="5" align="right"><gw:list id="lstRate" styles='width:100%' /></td>
                    </tr>
					<tr style="height: 2%">
                        <td style="width: 15%; white-space: nowrap" align="right"><b>From Date</b></td>
                        <td style="width: 20%"><gw:datebox id="dtFromDate" lang="1" /></td>
                        <td style="width: 10%" align="right"><b>To Date</b></td>
                        <td style="width: 13%"><gw:datebox id="dtToDate" lang="1" /></td>
						<td style="width: 15%" align="right"><b style="color: Red">*</b>Release Days</td>
                        <td style="width: 15%" colspan="5" ><gw:textbox id="txtReleaseDays" csstype="mandatory"  styles="width:100%" type="number" format="###,###,###,###,###"  /></td>
                    </tr>
					<tr style="height: 2%">
                        <td style="width: 15%; white-space: nowrap" align="right"><b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Customer')"><b style="color: Red">*</b>Customer</b></td>
                        <td style="width: 20%" colspan='4'><gw:textbox id="txtCompany" csstype="mandatory" styles="width:100%" readonly="true" /></td> 
                        <td><gw:imgbtn id="btnClearCompanyS" img="reset" alt="Reset" onclick="txtCompany.text='';txtCompanyPK.text='';" /></td>
						<td style="width: 15%" colspan="4" ></td>
                    </tr>
					
                    <tr style="height: 1%">
                        <td colspan="10">
                            <fieldset>
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 1%">
                                        <td style="width: 9%; white-space: nowrap" align="left">
                                          Create by:  
                                        </td>
                                        <td style="width: 10%">
											<gw:label id="lblCreateBy" />
                                        </td>
										
                                        <td style="width: 13%" align="right">
											Create date:
                                        </td>
                                        <td style="width:18%">
										<gw:label id="lblCreateDate" />
                                        </td>
                                        <td style="width: 10%">  
											Modify by:
                                        </td>
                                        <td style="width: 10%">
										<gw:label id="lblModifyBy" />	
                                        </td>
                                        <td style="width: 10%" align="left">
											Modify date
                                        </td>
                                        <td style="width: 18%" align="right">
										  <gw:label id="lblModifyDate" />
                                        </td>
                                        
                                        <td style="width: 1%" align="right"><gw:imgbtn id="btnNew" img="new" styles='width:100%;display:none' alt="New Take Out Goods" text="Add" onclick="OnAddNew('Detail')" /></td>
										<td style="width: 1%" align="right">
                                            <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" styles='width:100%;display:none' text="Delete" onclick="OnDelete('Detail')" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 42%">
                        <td colspan="14">
                            <gw:grid id='grdMiniBar' header='_PK|_THT_INVOICE_PK|Code|Take|# Rooms|Description'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' defaults='|||||'
                                editcol='1|1|0|1|1|1' widths='0|0|0|0|0|0'
                                autosize="T" sorting='T'  styles="width:100%;height:100%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!-------------------------------------------------------------->
    <gw:textbox id="txtCompanyPK" styles='width:100%;display:none' />
	<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtRoomSearchPK" styles='width:100%;display:none' />
    <gw:textbox id="txtRoomPK" styles='width:100%;display:none' />
    <gw:textbox id="txtNotPara" styles='width:100%;display:none'  />
    <gw:textbox id="PAYED_YN" styles='width:100%;display:none' text='N'/>
    <!-------------------------------------------------------------->
</body>
</html>
