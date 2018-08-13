<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{   
    OnDisplay(1);
    BindingDataList();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
function BindingDataList()
{
    var ls_Company    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var lstCostType_data = "<%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0093' order by code")%>";
    var lstCostGroup_data = "<%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0092' order by code")%>" +"|ALL|--Select All--";
    lstCompany.SetDataText(ls_Company);
    lstCostType.SetDataText(lstCostType_data);
    lstApType.value="ALL";
    lstCostGroup.SetDataText(lstCostGroup_data);
    lstCostGroup.value="ALL";
	grdMaster.GetGridControl().FrozenCols = 3;

}
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="100%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="40%";
            right.style.width  ="60%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="100%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="40%";
            right.style.width  ="60%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//-----------------------------------------------------------------------------------------
function OnDisplay()
{
    var n = rdoDISPLAY.GetData();
    
    switch(n)
    {
    	case "1":
            btnSearch.style.display="";
            btnProcess.style.display="";
            btnCancelP.style.display="";
            
            btnSearch_slip.style.display="none";
            btnMakeSlip.style.display="none";
            btnCancelM.style.display="none";
            
        break;
        case "2":
           btnSearch.style.display="none";
            btnProcess.style.display="none";
            btnCancelP.style.display="none";
           
            
            btnSearch_slip.style.display="";
            btnMakeSlip.style.display="";
            btnCancelM.style.display="";
            
            break;
    }
   
       
}
function OnPopUp(obj)
{
    switch(obj)
    {
        case 1:
              var path    = System.RootURL + '/standard/forms/60/14/60140140_popup.aspx';
			        var object  = System.OpenModal( path, 600, 400,'resizable:yes;status:yes');
			        if ( object != null )
			        {
			              txtCostCenter.text = object[2];
			        } 
        break;
        case 2:
              
              var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_org.aspx?";
              var object=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
               if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        txtOrganization_pk.text=object;     
                        dat_Organization.Call();
                    }            
                }    
        break;
    }
}
//---------------------------------------------------
function Process(index)
{
	switch(index)
	{
		case "0": // process insert 
		  txt_action.text='INSERT';
		  txt_type.text= 'PROCESS';
		  dat_gfpm00040_1.Call();
		break;
		case "1": // generate slip insert
		  txt_action.text='INSERT';
		  txt_type.text= 'GENERATE';
		  dat_gfpm00040_1.Call();
		break;
		case "2": // cancel process
		  txt_action.text='DELETE';
		  txt_type.text= 'PROCESS';
		  dat_gfpm00040_1.Call();
	 	break;
		case "3": // cancel slip 
		  txt_action.text='DELETE';
		  txt_type.text= 'GENERATE';
		  dat_gfpm00040_1.Call();
		break;

	}
	
}
//---------------------------------------------------
 function OnDataReceive(obj)
 {
	switch(obj.id)
	{
		case "dat_gfpm00040_1":
			alert(txtReturn.text);
            dat_process_checking.Call();
		break;
        case "dat_process_checking":
			SetButtonStatus();
		break;
	}
 }
//--------------------------------------------------
function SetButtonStatus()
{
	 if(txt_process_yn.GetData()=='Y')
		{
			btnProcess.SetEnable(false);
			if(txt_genslip_yn.GetData()=='Y')
			{
				btnCancelP.SetEnable(false);
				btnMakeSlip.SetEnable(false);
				btnCancelM.SetEnable(true);
			}else{
				btnCancelP.SetEnable(true);
				btnMakeSlip.SetEnable(true);
				btnCancelM.SetEnable(false);
			}
			
		}
		else
		{
			btnProcess.SetEnable(true);
			btnCancelP.SetEnable(false);
			btnMakeSlip.SetEnable(false);
            btnCancelM.SetEnable(false);
				
		}
}
//---------------------------------------------------
function onSearch(index)
{
	switch(index)
	{
		case "0":
			txt_type.text= 'PROCESS';
			dat_gfpm00040_2.Call('SELECT');
		break;
		case "1":
			txt_type.text= 'GENERATE';
			dat_gfpm00040_2.Call('SELECT');
		break;
	}
}
//---------------------------------------------------
function onMasterclick()
{
	txt_trname.text = grdMaster.GetGridData(grdMaster.row,2);
    txt_trcode.text = grdMaster.GetGridData(grdMaster.row,0);
	dat_gfpm00040_3.Call('SELECT');

}
//---------------------------------------------------
</script>

<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60140140_4_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<!------------------------------------------------------------------------>
  <gw:data id="dat_Organization" onreceive=""  > 
	 <xml>
		<dso  type="process"   procedure="ac_sel_60140140_popup"  > 
			<input>
				<input bind="txtOrganization_pk" />
			</input> 
			<output>
				<output bind="txtOrganization" />
			</output>
		</dso> 
	  </xml> 
   </gw:data>
   <!------------------------------------------------------------------------->
   <gw:data id="dat_gfpm00040_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="process" parameter="0,1,2,3,4"  procedure="ac_pro_60140140_4"> 
                <input>   
                    <input bind="txt_action" />
					<input bind="lstCostType" />
				    <input bind="lstCompany" />
                    <input bind="dtMonth" /> 
                    <input bind="dtRolldate" /> 
                    <input bind="txt_type" />      
                </input> 
                <output>
                    <output bind="txtReturn" />
                </output>
            </dso> 
        </xml> 
</gw:data>
 <!-------------------------------------------------------------------------------->
 <gw:data id="dat_process_checking"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="process" parameter="0,1,2,3"  procedure="ac_pro_60140140_6"> 
                <input>   
				   <input bind="dtMonth" /> 
                   <input bind="lstCompany" />
				   <input bind="lstCostType" /> 
				   <input bind="txt_type" /> 
                </input> 
                <output>
                    <output bind="txt_process_yn" />
					<output bind="txt_genslip_yn" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!--------------------------------------------------------------------------> 
<gw:data id="dat_gfpm00040_2"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"  function="ac_sel_60140140_mst"  > 
             <input bind="grdMaster">                    
               <input bind="dtMonth" /> 
               <input bind="lstCompany" /> 
			   <input bind="lstApType" /> 	
			   <input bind="lstCostGroup" /> 
			   <input bind="lstCostType" /> 
			   <input bind="txt_type" /> 
		      </input> 
            <output bind="grdMaster" /> 
        </dso> 
    </xml> 
</gw:data>

<!-------------------------------------------------------------------------->
<gw:data id="dat_gfpm00040_3"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"  function="ac_sel_60140140_dtl"  > 
             <input bind="grdDetail">                    
               <input bind="dtMonth" /> 
               <input bind="lstCompany" /> 
			   <input bind="lstApType" /> 	
			   <input bind="lstCostGroup" /> 
			   <input bind="lstCostType" /> 
			   <input bind="txt_trname" /> 
			   <input bind="txt_trcode" /> 
             </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>

   <!------------------------------------------------------------------------->
    <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr style="width:100%;height:10%;background:white">
             <td width="100%" colspan="3">
                   <table style="width:100%;height:100%" cellpadding="1" cellspacing="1" border="0">
                          <tr style="width:100%">
                                    <td width="90%">
                                   <fieldset>
                                                <table cellpadding="1" cellspacing="1" style="width: 100%">
                                                    <tr>
                                                        <td align="right" width="14%">Company&nbsp;</td>
                                                        <td  width="32%"><gw:list id="lstCompany" styles='width:100%' onchange="dat_process_checking.Call();"  /></td>
                                                        <td align="right" width="18%">Cost Group &nbsp;</td>
                                                        <td width="15%" >
                                                             <gw:list id="lstCostGroup" styles='width:100%' />
                                                        </td>
                                                         <td align="right" width="11%">Cost Type&nbsp;</td>
                                                         <td width="10%"><gw:list id="lstCostType" styles='width:100%' onchange="dat_process_checking.Call();" /></td>
                                                    </tr>
                                                    <tr>
                                                          <td align="right">AP Type&nbsp;</td>
                                                          <td ><gw:list id="lstApType" styles='width:100%'>
                                                              <data>|01|Salary|03|Health Ins|02|Social Ins|04|Unemp Ins|05|Meal|ALL|--Select All--</data>
                                                              </gw:list>
                                                          </td>
                                                           
                                                          <td align="right" >Month&nbsp;</td>
                                                          <td ><gw:datebox id="dtMonth" styles='width:100%;' onchange="dat_process_checking.Call();" type=month  lang="<%=Session("Lang")%>"/></td>
                                                          <td align="right" >Pay Roll Date&nbsp;</td>
                                                          <td ><gw:datebox id="dtRolldate" type="date" lang="1" /></td>
                                                    </tr>
                                                    <tr>
                                                          <td align="right" ><a title="Click here to show Code group" onclick="OnPopUp(1)" href="#tips">Cost Center&nbsp;</a></td>
                                                         <td >
                                                                  <table style="width:100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                              <td width="100%"><gw:textbox id="txtCostCenter" styles='width:100%;' /></td>
                                                                              <td><gw:imgbtn id="ibtndeprs" img="reset" alt="reset" onclick="txtCostCenter.text='';" /></td>
                                                                        </tr>
                                                                  </table>
                                                         </td>
                                                         <td align="right" >Organization</td>
                                                          <td colspan="3">
                                                                  <table style="width:100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                              <td width="100%"><gw:textbox id="txtOrganization" styles='width:100%;' /></td>
                                                                              <td><gw:imgbtn id="ibtndepr" img="reset" alt="reset" onclick="txtOrganization.text='';txtOrganization_pk.text='';" /></td>
                                                                        </tr>
                                                                  </table>
                                                          </td>
                                                         
                                                          
                                                    </tr>
                                                    
                                                          
                                                    
                                                </table>
                                </fieldset>
                        </td>  
                                    <td style="width:10%" >
                                       <fieldset style="width:100%;height:100%">
                                            <table style="width:100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
			                                                  <td ><gw:imgBtn id="btnSearch" img="search"   alt="Search Process"        onclick="onSearch('0')" /></td>
                                                              <td ><gw:imgBtn id="btnProcess"      img="process"  alt="Process"  onclick="Process('0')" /></td>
                                                              <td ><gw:imgBtn id="btnCancelP" img="cancel"   alt="Cancel Process"        onclick="Process('2')" /></td>
                                                              
                                                              <td ><gw:imgBtn id="btnSearch_slip" img="search"   alt="Search Slip"        onclick="onSearch('1')" /></td>
                                                              <td ><gw:imgBtn id="btnMakeSlip"      img="create"  alt="Make Slip"  onclick="Process('1')" /></td>
                                                              <td ><gw:imgBtn id="btnCancelM" img="cancel"   alt="Cancel Make Slip"        onclick="Process('3')" /></td>
		                                                </tr>
		                                                <tr>
			                                                <td colspan="7" align="center"><gw:radio id="rdoDISPLAY" value="1" onchange="OnDisplay()">
                                                                                  <span value="1">Process&nbsp;&nbsp;</span>
                                                                                  <span value="2">Slip</span>
                                                                                  </gw:radio></td>
		                                                </tr>
                                            </table>
                                       </fieldset>
                                  </td>
                          </tr>
                   </table>
             </td>
                     
                      
        </tr>
             
        <tr style="height: 90%;width:100%" >
                        <td style="width:38%" id="t-left">
                            <gw:grid id="grdMaster" 
                            header='_pk|No|Name|Trans.Amount|CCY|BK Rate|Book Amt|Description' 
                            format='0|0|0|0|0|0|0|0'
                            aligns='0|0|0|3|1|3|3|0' 
                            defaults='|||||' 
                            editcol='0|0|0|0|0|0|0|0' 
                            widths='0|500|2500|1500|800|1500|1500|2000'
                            sorting='T' 
                            styles="width:100%;height:100%" 
                            oncellclick="onMasterclick()" />
                        </td>
                        <td style="width: 2%; white-space: nowrap;" align="center">
                                <img status="expand" id="imgArrow1" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('1')" />
                                <img status="expand" id="imgArrow2" src="../../../../system/images/button/next.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('2')" />
                       </td>
                        <td style="width:60%" id="t-right">
                            <!--   header='0._pk|1.Description|2.Local Description|3.PIS Date|4.Original Cost|5.Monthly Allocate|6.Accum.Allocate|7.Remain.Allocate'-->
                            <gw:grid id="grdDetail" 
                            header='Organization|PL Code|PL Name|Employee|Trans Amt|Book Amt|CCY|Rate|Dr.Acc|Cr.Acc|Description|_Mpk'
                            format='0|0|0|0|0|0|0|0|0|0|0|0' 
                            aligns ='0|0|0|0|3|3|0|3|0|0|0|0' 
                            defaults='|||||||||||' 
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='1500|1500|2000|2000|2000|2000|1000|1000|2000|2000|3000|0' 
                            sorting='T' 
                            styles="width:100%;height:100%" />
                        </td>
                    </tr>
    </table>
   
  <gw:textbox id="txtOrganization_pk" styles="display:none; " />
  <gw:textbox id="txt_pk"      style="display:none"/>
 <gw:textbox id="txtComCodeID"  text=""  styles='display:none'  />
 <gw:textbox id="txtCodeTemp"  text=""  styles='display:none'  />
 <gw:textbox id="txtReturn"  styles='display:none;'/>
<gw:textbox id="txt_action" text="INSERT" styles='display:none;'/>

<gw:textbox id="txt_actionc" text="DELETE" styles='display:none;'/>
process
<gw:textbox id="txt_process_yn" text="DELETE" styles="display:none"/>
generate
<gw:textbox id="txt_genslip_yn" text="DELETE" styles="display:none"/>
<gw:textbox id="txt_type" text="" styles='display:'/>
<gw:textbox id="txt_slipvcno"      style="display:none"/>

<gw:textbox id="txt_trcode" text="" styles="display:none"/>
<gw:textbox id="txt_trname"      style="display:none"/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
