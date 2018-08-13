<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head >
    <title>Genuwin</title>
</head>
<script>
var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';
function BodyInit()
{
    onSearch();
    System.Translate(document);
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
//---------------------------------------------------------
function OnShowPopup(index)
{
    switch (index)
    {
        case 0:
          var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_emp_3.aspx";
	        var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	        if ((aValue != null)&&(aValue[0]!=""))
	        {
	           // txtChargerPK.text = aValue[0];
	           
	            txtCharger.text = aValue[2];
	            txtCharger_pk.text = aValue[0];
	        }  
        break;
        case 1:
           var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_emp_3.aspx";
	        var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	        if ((aValue != null)&&(aValue[0]!=""))
	        {
	           // txtChargerPK.text = aValue[0];
	           
	            txtChief.text = aValue[2];
	            txtChief_pk.text = aValue[0];
	        }  
        break;   
        case 2:        
             var fpath   = System.RootURL + "/standard/forms/60/08/60080030_popup_bank.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                                var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes');                     
                                if ( object != null )  
                                {                                             
                                      
                                       txtChiPhi_pk.text = object[2];
                                       txtChiPhi_cd.text = object[0];
                                       txtChiPhi_nm.text = object[1];
                                       
                                }
            break; 
                   
    }
}
//---------------------------------------------------------
function OnNew()
{
    if((idGridHide.GetGridData(idGridHide.rows -1, 1)=='T'))
  {
            alert("Bạn không thể thêm mã bộ phận ở nút lá!!");
       
  }  
else
{
         var getparentPK="", parentID="",parentName="";
    
    getparentPK = txtPK.text;
    parentName = txtCapCha.GetData();
    parentID = txtBoPhan.GetData();
    dat_update.StatusInsert();
    txtParentPK.text = getparentPK;
    txtCapCha.SetDataText(parentID);
    Insert = 'T';
}  
   
}
//---------------------------------------------------------
function onSearch()
{  
    dat_tree.Call("SELECT");
}
//---------------------------------------------------------

function onSave()
{
//    if(onValidate())
//    {
        dat_update.Call();
//     }
}
//---------------------------------------------------------
function OnDataReceive(obj)
{
   
        if(obj.id=="dat_update")
        {

              if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                     Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                  dat_tree.Call("SELECT");
              }
               else{
                     dso_gridhide.Call("SELECT");
               } 
        }
     
}
 //-----------------------------------------------------
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
//---------------------------------------------------------
function OnClick()
{

    var obj = event.srcElement.GetCurrentNode();
	txtPK.SetDataText( obj.oid );

//	   Insert   = 'F';
//	Modify   = 'F';
//	Delelete = 'F';
      dat_update.Call("SELECT");
		    
}
function OnDelete()
{
     if(confirm("Bạn có muốn xóa không ?"))
    {
        dat_update.StatusDelete();
        dat_update.Call();
        Delete='T';
    }
}
function onValidate()
{
    if(txtChiPhi_cd.GetData()=="")
    {
        alert('Bạn hãy nhập bộ phận chi phí!!');
        //txtChiPhi_cd.GetControl().focus();
        return false;
    }
    return true;
}
</script>
<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020060_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dat_update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ac_sel_60160110_control"   procedure="ac_upd_60160110_control"> 
            <inout> 
                <inout bind="txtPK"/>
                <inout bind="txtParentPK" /> 
                <inout bind="txtBoPhan" />
                <inout bind="chkLeaf_YN" />
                <inout bind="txtTiengViet" />
                
                <inout bind="txtTiengHan" />
                <inout bind="txtChiPhi_pk" />
                <inout bind="txtChief_pk" />
                <inout bind="txtCharger_pk" />
                <inout bind="txtApprovalLevel" />
                
                <inout bind="dtNgayXacNhan" />
                <inout bind="dtTuNgay" />
                <inout bind="dtDenNgay" />
                <inout bind="txtDienGiai" />
                <inout bind="txtChiPhi_cd" />
                
                <inout bind="txtChiPhi_nm" />
                <inout bind="txtCapCha" />
                <inout bind="txtChief" />
                <inout bind="txtCharger" />
                 <inout bind="lstCompany" />
            </inout>
        </dso> 
    </xml> 
</gw:data>
<!--------------------------------------------------------------------------------------->
  <gw:data id="dat_tree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="ac_sel_60160110_tree" > 
                <input>
                    <input bind="dtContractDt_Fr" />   
                    <input bind="lstCompany" />                    
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------------------------------------->
  <gw:data id="dso_gridhide" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60160110_hide" > 
                <input>
                    <input bind="txtPK" />                    
                </input> 
                <output bind="idGridHide" /> 
            </dso> 
        </xml> 
    </gw:data>
      <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 40%" id="idLEFT">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%;width:100%">
                        <td>
                            <fieldset style="width:100%;">
                                <table  style="width: 100%">
                                    <tr>
                                        <td align="right" width="37%">Company</td>
                                        <td width="63%" colspan="2"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                            </gw:list>
                                         </td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="right">Date</td>
                                        <td width="20%">
                                            <gw:datebox id="dtContractDt_Fr" lang=1  lang="<%=Session("Lang")%>"   />
                                        </td>
                                        <td align="left" width="80%"><gw:imgbtn id="btnSearch" img="search" alt="Search"  onclick="onSearch()" /></td>
                                    </tr>
                              
                                 
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%;width:100%">
                      <td colspan=3 valign="top" width="40%"><gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree></td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 60%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="width: 100%;height:100%" border="0">
                   <tr style="width:100%;height:100%" valign="top">
                        <td width="100%">
                            <table style="width:100%" cellpadding="4" cellspacing="4" border="0">
                                <tr>
                                        <td width="40%" align="right">Upper department</td>
                                        <td width="60%" >
                                           <gw:textbox id="txtCapCha" text="" styles="width:100%" />
                                        </td>
                                        <td ><gw:button id="btnSave1" img="new" alt="New" onclick="OnNew()" /></td>
                                        <td ><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                                        <td ><gw:button id="btnSave2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                      
                                    </tr>
                                    <tr>
                                            <td  width="40%" align="right">Department code</td>
                                            <td width="60%" colspan="4">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="80%"><gw:textbox id="txtBoPhan" text="" styles="width:100%" /></td>
                                                        <td style="width:20%" align="right">Leaf Y/N</td>
                                                        <td ><gw:checkbox id="chkLeaf_YN" value="F" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width:40%">Name</td>
                                            <td width="60%" colspan="4"><gw:textbox id="txtTiengViet" styles="width:100%" /></td>
                                        </tr>
                                          
                                        <tr>
                                            <td  align="right" width="40%">Foreign name</td>
                                            <td colspan="4" width="60%">
                                                <gw:textbox id="txtTiengHan"   style="width:100%"  />
                                            </td> 
                                        </tr>
                                        <tr>
                                            <td  align="right" width="40%"><a title="Nhấp vào đây để chọn bộ phận chi phí" onclick="OnShowPopup(2)" href="#tips" >PL Unit</a></td>
                                            <td  colspan="4"  width="60%">
                                                   <table width="100%" cellpadding="0" cellspacing="0">
                                                          <tr>
                                                                  <td width="40%"><gw:textbox id="txtChiPhi_cd" csstype="mandatory" style="width:100%" /></td>
                                                                  <td width="60%"><gw:textbox id="txtChiPhi_nm" csstype="mandatory" style="width:100%" /></td>
                                                                  <td><gw:textbox id="txtChiPhi_pk" style="width:100%" style="display: none" /></td>
                                                                  <td ><gw:imgbtn id="btnSave12" img="reset" alt="Reset" onclick="txtChiPhi_cd.text='';txtChiPhi_nm.text=''; txtChiPhi_pk.text='';" /></td>
                                                          </tr>
                                                   </table>
                                            
                                           </td>
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="40%"><a title="Click here to show Chief" onclick="OnShowPopup(1)" href="#tips" >Chief</a></td>
                                            <td width="60%" colspan="4">
                                                 <table width="100%"  cellpadding="0" cellspacing="0">
                                                      <tr>
                                                             <td width="100%"><gw:textbox id="txtChief"  style="width:100%" /></td>
                                                             <td ><gw:imgbtn id="btnSave4" img="reset" alt="Reset"  onclick="txtChief.text='';txtChief_pk.text='';" /></td>
                                                      </tr>
                                                </table>
                                            </td>                        
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="40%"><a title="Click here to show Charger" onclick="OnShowPopup(0)" href="#tips" >Charger</a></td>
                                            <td colspan="4" width="60%">
                                                 <table width="100%"  cellpadding="0" cellspacing="0">
                                                      <tr>
                                                             <td width="100%"> <gw:textbox id="txtCharger" style="width:100%" /></td>
                                                              <td ><gw:imgbtn id="btnSave3" img="reset" alt="Reset"  onclick="txtCharger.text='';txtCharger_pk.text='';" /></td>
                                                      </tr>
                                                      
                                                 </table>
                                           
                                            </td>
                                          
                                        </tr>
                                        <tr>
                                            <td  align="right" width="40%">Approval Level</td>
                                            <td width="60%" colspan="4">
                                                 <table cellpadding="0" cellspacing="0" width:100%>
                                                      <tr>
                                                             <td width="50%"><gw:textbox id="txtApprovalLevel"  style="width:100%" /></td>
                                                             <td  align="right" width="50%">Confirmed date&nbsp;</td>
                                                             <td> <gw:datebox id="dtNgayXacNhan" nullaccept lang="<%=Session("Lang")%>"  /></td>
                                            
                                                      </tr>
                                                 </table>
                                                
                                            </td>                        
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="40%">Date form</td>
                                            <td  width="60%" colspan="4">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                 <tr>
                                                        <td width=""><gw:datebox id="dtTuNgay" lang="<%=Session("Lang")%>" /></td>
                                                        <td width="100%" align="right">Date to</td>
                                                        <td width=""> <gw:datebox id="dtDenNgay" nullaccept lang="<%=Session("Lang")%>"  /></td>
                                                 </tr>
                                            </table>
                                            
                                          </td>
                                            
                                        </tr>
                                       
                                         <tr>
                                             <td  align="right" valign="top" width="40%">Description</td>
                                            <td  width="60%" colspan="4"><gw:textarea id="txtDienGiai" styles="width:100%;height:150;"></gw:textarea></td>
                                            
                                        </tr>
                            </table>
                        </td>
                   </tr>
                  
                                    
                </table>
                            
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
        <gw:grid id="idGridHide" header="pk|Y/N" 
                                        format="0|0"
                                        aligns="0|0" 
                                        defaults="|" 
                                        editcol="0|0" 
                                        widths="500|500"
                                         
                                        style="display:none;width:200; height:200"/>
                                        
<gw:textbox id="txtPK"  text="" style="display:none" />      
<gw:textbox id="txtProposedByUserPk"  text="" style="display:none" />
<gw:textbox id="txtParentPK"  text="" style="display:none" />
<gw:textbox id="txtChief_pk"  text="" style="display:none" />      
<gw:textbox id="txtCharger_pk"  text="" style="display:none" />                                       
</body>
</html>
