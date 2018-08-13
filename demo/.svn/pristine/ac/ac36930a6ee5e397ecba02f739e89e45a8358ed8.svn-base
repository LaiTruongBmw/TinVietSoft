<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>MR Result</title>
</head>

<script>
 
  var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name  = "<%=Session("USER_NAME")%>" ;
  var flag =0; 
  var callerWindowObj = dialogArguments;

  //---------------------------------------------------------
 function BodyInit()
 {
    SetDefault()
    txtProdShiftPK.text = callerWindowObj.txtProdShiftPk.text
    if(txtProdShiftPK.text !='')
    {
         fpep00041_10.Call('SELECT')
    }
    else
    {
        fpep00041_10.StatusInsert(); 
        txtWIPK.text  = callerWindowObj.txtWI_PK.text ;
        txtWINo.text   = callerWindowObj.txtWINo.text ;
        txtSTItemPK.text = callerWindowObj.txtItemPk.text;
        txtItemCode.text = callerWindowObj.txtItemCode.text;
        
        txtItemName.text = callerWindowObj.txtItemName.text;
        listShift.value = callerWindowObj.txtShift_pk.text;
        txtLinePk.text = callerWindowObj.txtLine_pk.text;
        txtLine.text = callerWindowObj.txtLine.text;
        txtChargerPk.text = user_pk;
        txtCharger.text = user_name;
        fpep00041_11.Call('SELECT')
    }
 } 
//-------------------------------------------------------------------------------------------
 function SetDefault()
  { 
     var data = "data|00|00|01|01|02|02|03|03|04|04|05|05|06|06|07|07|08|08|09|09"
     data = data+"|10|10|11|11|12|12|13|13|14|14|15|15|16|16|17|17|18|18|19|19|20|20|21|21|22|22|23|23";
     lstHour.SetDataText(data);  
     
     data = data + "|24|24|25|25|26|26|27|27|28|28|29|29|30|30"
     data = data + "|31|31|32|32|33|33|34|34|35|35|36|36|37|37|38|38|39|39"
     data = data + "|40|40|41|41|42|42|43|43|44|44|45|45|46|46|47|47|48|48|49|49"
     data = data + "|50|50|51|51|52|52|53|53|54|54|55|55|56|56|57|57|58|58|59|59"
     lstMinute.SetDataText(data);  
     
     data = "<%=ESysLib.SetListDataSQL(" SELECT a.CODE, a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";  
     listShift.SetDataText(data);  
     txtWINo.SetEnable(false);
     txtItemCode.SetEnable(false);
     txtItemName.SetEnable(false); 
     txtLine.SetEnable(false) 
  }
 

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
   if(po_oData.id=='fpep00041_11')
   {
        dtChangeDate.text = txtTimeServer.text.substr(0,8);
        lstHour.value = txtTimeServer.text.substr(8,2);
        lstMinute.value = txtTimeServer.text.substr(10,2);
        txtChangeTime.text = txtTimeServer.text.substr(8,2)+":"+txtTimeServer.text.substr(10,2)
   }
   if(po_oData.id=='fpep00041_10')
   {
        lstHour.value = txtChangeTime.text.substr(0,2);
        lstMinute.value = txtChangeTime.text.substr(3,2);
        if(flag==1)
        {
            window.close()
        }
   }
   
 }
 //---------------------------------------------------------
 function OnPopup(id)
 {
     if(id==1)
    { //Show Roll No
        if(txtSTItemPK.text!='')
        {
         var path = System.RootURL + '/form/ag/fp/agfp00050.aspx' ;
                     path = path + '?item_pk='  + txtSTItemPK.text ;
                     path = path + '&item_code='+ txtItemCode.text ;
                     path = path + '&item_name='+ dtItemName.text ;
                     path = path + '&item_uom=' + grdWI.GetGridData(grdWI.row,G1_uom) ;
                     
                 var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                 if ( obj != null )
                 {
                     txtRollId_pk.text = obj[0]; //tpr_lotno_pk
                     txtRollId.text = obj[1]; //LOT NO
                 }	 
          }
      } 
      if(id==2)
      {
         var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( obj != null )
	             {
	                txtChargerPk.text   = obj[0];
	                txtCharger.text = obj[2];
                 }	
      }
 }      
 //---------------------------------------------------------

function OnDelete(obj)
 {
    var ctrl = obj.GetGridControl();
	var row  = ctrl.row;
	  if ( row > 0 ) 
	{
		if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		{						
			obj.RemoveRow();					
		}		
		else 
		{
			if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			{
				obj.DeleteRow();
			}
		}
	}
 }

//---------------------------------------------------------

 function OnUnDelete(obj) 
 {
	var ctrl = obj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			obj.UnDeleteRow();
		}
	}
}

//-------------------------------------------------------------------
 function CheckNumber(obj)
 {   
   if(Number(obj.text))
	{
	    if(Number(obj.text)<0)
	    {
	        obj.text=''
	        return false
	    }
	}else
	{
	   obj.text=''
	   return false;
	}
    return true;
 } 
 //------------------------------------------------------------------
 function OnSave(id)
 {
    if(CheckSave())
    {
        fpep00041_10.Call()
        flag = 1;    
    }
 }

 //-----------------------------------------------------------------
 function CheckSave()
 {
    if(txtHangOver.text<0)
    {
        alert("Please input hang over quantity!")
        return false;
    }
    if(dtChangeDate.text<0)
    {
        alert("Please input hang over quantity!")
        return false;
    }
    if(listShift.value =='')
    {
        alert('Please select a Shift!')
        return false;
    }
    return true;
 }
 function OnSetTime()
 {
     txtChangeTime.text = lstHour.value+":"+lstMinute.value
 }
</script>

<body>
   <!------------------------------------------------------------------>
    <gw:data id="fpep00041_10" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="PROD.sp_sel_fpep00041_6"  procedure="PROD.sp_upd_fpep00041_6"> 
                <inout>             
                     <inout  bind="txtProdShiftPK" />
                     <inout  bind="txtWIPK" />
                     <inout  bind="txtWINo" />
                     <inout  bind="txtLine" />
                     <inout  bind="txtSTItemPK" /> 
                     <inout  bind="txtItemCode" />
                     <inout  bind="txtItemName" /> 
                     <inout  bind="listShift" />
                     <inout  bind="txtNumOfWorker" /> 
                       
                     <inout  bind="txtChargerPk" />
                     <inout  bind="txtCharger" />  
                     
                     <inout  bind="dtChangeDate" /> 
                     <inout  bind="txtChangeTime" />  
                     <inout  bind="txtHangOver" />         
                </inout>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="fpep00041_11" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="PROD.sp_pro_fpep00041_1" > 
                <inout>             
                     <inout  bind="txtTimeServer" />  
                </inout>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------> 
    <table style="width: 100%; height: 100%">
        <tr style="height:5%">
                <td colspan="5" align="center" style="color:Blue; font-weight:bold; font-size:large">SHIFT CHANGE</td>
        </tr>
        <tr style="height:5%">
                <td style="width:25%"> WI No</td>
                <td  colspan="4">
                     <gw:textbox id="txtWIPK" styles="width:100%;display:none"   onenterkey="" />
                     <gw:textbox id="txtWINo" styles="width:100%"   onenterkey="" />
                </td>
        </tr>
        <tr style="height:5%">
                <td style="width:25%"> Line </td>
                <td  colspan="4">
                    <gw:textbox id="txtLinePk" styles="width:100%;display:none"   onenterkey="" />
                     <gw:textbox id="txtLine" styles="width:100%"   onenterkey="" />
                </td>
        </tr>   
        <tr style="height:5%">
                <td style="width:25%"> Item Code</td>
                <td  colspan="4">
                     <gw:textbox id="txtSTItemPK" styles="width:100%;display:none"   onenterkey="" />
                     <gw:textbox id="txtItemCode" styles="width:100%"   onenterkey="" />
                </td>
        </tr>   
         <tr style="height:5%">
                <td style="width:25%"> Item Name</td>
                <td  colspan="4">
                       <gw:textbox id="txtItemName" styles="width:100%"   onenterkey="" />
                </td>
        </tr>   
         <tr style="height:5%">
                <td style="width:25%">Shift</td>
                <td  colspan="5">
                       <gw:list id="listShift" styles="width:100%"   onenterkey="" />
                      <!--<gw:textbox id="txtShiftRemark" styles="width:100%"   onenterkey="" /> -->
                </td>
          </tr>   
        <tr style="height:5%">
                <td style="width:25%">No of Worker</td>
                <td style="width:12%">
                       <gw:textbox id="txtNumOfWorker" styles="width:100%" type='number' format="###,###" onenterkey="" />
                </td>
                <td style="width:12%"><a style="text-decoration: none; color=#0000ff;" href='#tips' title="Select Charger"
                                onclick="OnPopup(2)">Charger </a></td>
                <td style="width:12%" colspan="2">
                       <gw:textbox id="txtChargerPk" styles="width:100%; display:none" />
                       <gw:textbox id="txtCharger" styles="width:100%" />
                </td>
        </tr> 
        <tr style="height:5%">
                <td style="width:25%">Change Time</td>
                <td style="width:12%" >
                       <gw:datebox id="dtChangeDate" styles="width:100%" lang="<%=Session("Lang")%>"  />
                </td>
                    <td style="width:12%"> <gw:list id="lstHour" styles="width:100%" onchange="OnSetTime()" /> </td>
                    <td style="width:12%"> <gw:list id="lstMinute" styles="width:100%" onchange="OnSetTime()" /> </td>
                    <td style="width:12%">  <gw:textbox id="txtChangeTime" styles="width:100%;display:none"  />  
                </td>
        </tr>   
        <tr style="height:5%">
                <td style="width:25%">Hand Over</td>
                <td style="width:12%; "  >
                       <gw:textbox id="txtHangOver" styles="width:95%" type='number' format="###,###" onblur="callerWindowObj.txtHandOver.text = this.text" />
                </td>
                <td style="width:12%" align="left"> M </td>
                <td style="width:12%"> </td>
                <td style="width:12%">
                       
                </td>
        </tr>   
        <tr style="height:5%">
            <td colspan="4"  align="right">
                     <gw:icon id="btnOK" text="OK" style='width:100%' onclick='OnSave()' />
            </td>
            <td   align="left">
                     <gw:icon id="btnCancel" text="Cancel" style='width:100%' onclick='window.close()' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtProdShiftPK" style="display: none" />
    <gw:textbox id="txtWI_PK" style="display: none" />
    
    <gw:textbox id="txtTimeServer" style="display: none" />
    <!------------------------------------------------------------------>
</body>
</html>
