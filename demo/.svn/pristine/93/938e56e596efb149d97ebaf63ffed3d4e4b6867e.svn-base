<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var Modify = false;
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
	OnSearch();
}
//-------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
        ls_Project_Type = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0001') FROM DUAL")%>";
        lstProject_Type.SetDataText(ls_Project_Type); 
        Grid_Facilities.SetComboFormat(2, '#Y;Yes|#N;No');
        data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0002') FROM DUAL")%>";
	    txtProject_Category.SetDataText(data); 
		<%=ESysLib.SetGridColumnComboFormat("Grid_Faci_Detail", 1,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0190' AND A.USE_IF = 1 ORDER BY A.CODE")%>; 
	    var ls_current  = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
        lstCurrency.SetDataText(ls_current); 
		var UOM = "<%=ESysLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tco_uom a where del_if=0" ) %> "; 
     	Grid_Faci_Detail.SetComboFormat(3,UOM);
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
        dso_search.Call("SELECT");
}
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
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnNew(obj)
{
        switch(obj)
        {
                case 1:
                            
                            if(txtProject_Pk.text == '')
                            {
                                    alert('Please select Master row first!!');
                            }
                            else
                            {
                                        var fpath = System.RootURL + "/form/61/02/61020010_popup_Facilities.aspx";
	                                    var aValue = System.OpenModal( fpath , 850 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	                                    if(aValue != null)
	                                    {
                                                var tmp = new Array();
                                                tmp = aValue[0]; 
                                                txtFa_cd.text = tmp[0]; 
                                                if(!CheckDuplicateFacilities())
                                                {                                       
                                                    return;
                                                } 
                                                else
                                                {
                                                        for(var i=0; i<aValue.length; i++)
                                                        { 
                                                                tmp = aValue[i];
                                                                
                                                                Grid_Facilities.AddRow();
                                                                Grid_Facilities.SetGridText(Grid_Facilities.rows - 1, 0, tmp[0]); 
                                                                Grid_Facilities.SetGridText(Grid_Facilities.rows - 1, 1, tmp[1]);  
																Grid_Facilities.SetGridText(Grid_Facilities.rows - 1, 5, tmp[2]);  
                                                                Grid_Facilities.SetGridText(Grid_Facilities.rows - 1, 4, txtProject_Pk.text); 
                                                        }
                                                }  
                                        }
                                        }
                break;
                case 2:
                            if(Facilities_pk.text != '')
                            {
                                    Grid_Faci_Detail.AddRow();
                                    Grid_Faci_Detail.SetGridText(Grid_Faci_Detail.rows - 1, 5, Facilities_pk.text);  
                            }
                            else 
                            {
                                    alert("Please select Facilities row first!!");
                            } 
                break;
        }
} 
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSave(obj)
{
        switch(obj)
        {
        		case 0:
        			if(txtProject_Pk.text != '')
        			{
        				dso_search_Detail.Call();
        			}
        			else
        			{
        				alert('Please select the Project!!');
        			}
                break;
                case 1:
                        dso_Facilities.Call();
                break;
                case 2:
                        dso_Facilities_Detail.Call();
                break;
        } 
        
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function AttachFiles()
    {
            if(txtProject_Pk.text != '')
           { 
		
                    imgFile.MasterPK=txtProject_Pk.text;
                    imgFile.ChangeImage();
		   
                    if( imgFile.oid == 0 )
                    {
                        return false;
                    }
                    else
                    {
						Grid_Attach.SetGridText( Grid_Attach.rows - 1, 3, txtProject_Pk.text);   		
                        DSO_ATTACH_FILE.Call();
                    }
                    imgFile.oid= "";     
            } 
        else
        {
                alert('Please select the  Project first!!');
        }     
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnOpenFile()
{
        var img_pk = Grid_Attach.GetGridData(Grid_Attach.GetGridControl().row,2)	;
        var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TECPS_PROJECT_FILE";	
        window.open(url);
}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
             if(confirm('Are you sure you want to delete selected file ?'))
            {
                 Grid_Attach.DeleteRow();
                 DSO_ATTACH_FILE.Call();
            }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckDuplicateFacilities()
{
    for(var i = 1; i < Grid_Facilities.rows; i++)
    {
        if(Grid_Facilities.GetGridData(i, 0) == txtFa_cd.text)
        {
             alert("Duplicated Facility Code!! ");
             return false ;
        }
    }
    return true;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnClick(obj)
{
        switch(obj)
        {
                case 1:
                        txtProject_Pk.SetDataText(Grid_Mst.GetGridData(Grid_Mst.row, 0));
                        dso_search_Detail.Call("SELECT");
                break;
               
                case 3:
                        Facilities_pk.SetDataText(Grid_Facilities.GetGridData(Grid_Facilities.row, 5));
                        ProjectFac_pk.SetDataText(Grid_Facilities.GetGridData(Grid_Facilities.row, 3));
                        dso_Facilities_Detail.Call("SELECT");
                break;
        } 
        
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
            switch(obj.id)
            {
        		   case "dso_search_Detail":
                            dso_Facilities.Call("SELECT");
                   break;   
                    case "dso_Facilities":
//                          alert(Grid_Facilities.GetGridData(0, 5));
                          dso_Facilities_Detail.Call();
                    break;  
                    case "dso_Facilities_Detail":
                            //Facilities_pk.SetDataText(Grid_Facilities.GetGridData(Grid_Facilities.row, 3));
                            DSO_ATTACH_FILE.Call("SELECT"); 
                   break;  
            } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            //var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                                    dso_search_Detail.Call("SELECT"); 
                            } 
                break;
				case 'Category':
					var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0002';
					var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					 if (object != null )
					 {
						 txtProject_Category.SetDataText(object[1]);
					 }
				break;
				case 'Project_Type':
					var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0001';
					var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					 if (object != null )
					 {
						 lstProject_Type.SetDataText(object[1]);
					 }
				break;
				case 'Ccy':
					 var path = System.RootURL + '/form/61/01/61010010_popup_PartnerType.aspx?code=ACAB0110';
					 var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					 if (object != null )
					 {
						 lstCurrency.SetDataText(object[1]);
					 }
				break;
        } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDelete(obj)
{
        switch(obj)
        {
                case 1:
                            var i=0;
                            var _rows = 0;
                            for(i = 1; i< Grid_Faci_Detail.rows; i++)
                            {
                                    _rows = i;
                            }
                            if(_rows != 0)
                            {
                                    alert("Please delete detail first !!");
                            }
                            else
                            {
                                    if(confirm("Are you sure you want to delete?"))
                                    {
                                            Grid_Facilities.DeleteRow();
                                    } 
                            }
                break
                case 2:
                            if(confirm('Are you sure you want to delete ?'))
                            {
                                    Grid_Faci_Detail.DeleteRow();
                            }
                break;
		case 3:
		    if(confirm('Do you want to delete selected file ?'))
			{
			     Grid_Attach.DeleteRow();
			     DSO_ATTACH_FILE.Call();
			}
	       break;

        } 
}
</script>

<body>
    <gw:data id="dso_search">
  <xml>
    <dso type="grid" function="pm_sel_61020010" >
      <input bind="Grid_Mst">
      <input bind="txtProject"/>
      </input>
      <output bind="Grid_Mst"/>
    </dso>
  </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_search_Detail" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="pm_sel_61020010_1" procedure="pm_upd_61020010_1">
      <inout>
      <inout bind="txtProject_Pk"/>
      <inout bind="txtProject_Cd"/>
      <inout bind="txtProject_Nm"/>
      <inout bind="txtProject_Category"/>
      <inout bind="lstProject_Type"/>
      <inout bind="txtSite_location"/>
      <inout bind="dtCreate_Date"/>
      <inout bind="dtApproved_Date"/>
     
      <inout bind="txtOther"/>
      <inout bind="chkDesign"/>
      <inout bind="chkFacility"/>
      <inout bind="chkConstruction"/>
      <inout bind="chkCMCS"/>
      <inout bind="rdoContract_Type"/>
      <inout bind="rdoSingle_CCY"/>
      <inout bind="rdoApply_Targ"/>
      <inout bind="rdoCont_Budget"/>
      <inout bind="lstCurrency"/>
      </inout>
    </dso>
  </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_Facilities" onreceive="OnDataReceive(this)">
  <xml>
    <dso id="1" type="grid"   parameter="0,1,2,3,4,5" function="pm_sel_61020010_2" procedure="pm_upd_61020010_2">
      <input bind="Grid_Facilities">
      <input bind="txtProject_Pk" />
      </input>
      <output bind="Grid_Facilities" />
    </dso>
  </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_Facilities_Detail" onreceive="OnDataReceive(this)">
  <xml>
    <dso id="1" type="grid"  parameter="0,1,2,3,4,6" function="pm_sel_61020010_4" procedure="pm_upd_61020010_4">
      <input bind="Grid_Faci_Detail">
        <input bind="Facilities_pk" />
        <input bind="ProjectFac_pk" />
      </input>
      <output bind="Grid_Faci_Detail" />
    </dso>
  </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="DSO_ATTACH_FILE" onreceive="OnDataReceive(this)">
  <xml>
    <dso id="1" type="grid" parameter="2"  function="pm_sel_61020010_3"  procedure="pm_upd_61020010_3">
      <input bind="Grid_Attach" >
      <input bind="txtProject_Pk" />
      </input>
      <output bind="Grid_Attach" />
    </dso>
  </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 30%;" id="idLEFT" valign="top">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%; width: 100%">
                        <td>
                            <fieldset style="width: 100%; padding: 0">
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="30%" align="right">
                                            Project&nbsp;</td>
                                        <td width="70%">
                                            <gw:textbox id="txtProject" onenterkey="OnSearch()" styles='width:100%' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btSve2" img="search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%; width: 100%">
                        <td width="100%">
                            <gw:grid id="Grid_Mst" header="_PK|Project Code|Project Name" format="0|0|0" aligns="0|0|0"
                                defaults="||" editcol="0|0|0" widths="0|1500|3000" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnClick(1)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 70%" id="idRIGHT">
                <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr style="width: 100%; height: 5%;">
                        <td>
                            <fieldset style="background-color: #CCFFFF">
                                <table style="width: 100%;">
                                    <tr>
                                        <td align="right" width="16%">
                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                Project&nbsp;</a></td>
                                        <td width="84%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="60%">
                                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="">
                                                        <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btSdve2" img="save" alt="Save" onclick="OnSave(0)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <a title="Click here to show Project Field" href="#" style="text-decoration: none"
                                                onclick="OnPopUp('Category')">Pro Field&nbsp;</a></td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="38%">
                                                        <gw:list id="txtProject_Category" styles='width:100%' />
                                                    </td>
                                                    <td align="right" width="20%">
                                                        <a title="Click here to show Project Type" href="#" style="text-decoration: none"
                                                            onclick="OnPopUp('Project_Type')">Project Type&nbsp;</a></td>
                                                    <td width="42%">
                                                        <gw:list id="lstProject_Type" onchange="" styles='width:100%'></gw:list>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Business Place&nbsp;</td>
                                        <td width="">
                                            <gw:textbox id="txtSite_location" styles='width:100%' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Draw-up Date&nbsp;</td>
                                        <td width="80%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="15%">
                                                        <gw:datebox id="dtCreate_Date" lang="1" />
                                                    </td>
                                                    <td align="right" width="25%"><a title="Approved Date" style="color:#333">Appr. Date&nbsp;</a></td>
                                                    <td width="15%">
                                                        <gw:datebox id="dtApproved_Date" lang="1" />
                                                    </td>
                                                    <td width="45%"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 85%">
                        <td>
                            <gw:tab id="idTab">
              <table style="width: 100%; height:100%;overflow:scroll" name="Scale" id="Tab1"  cellpadding="0" cellspacing="0">
                <tr style="height:49%;width:100%">
                  <td colspan="3" style="width:100%"><table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="40%"><table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                            <tr style="height:1%">
                              <td width="100%"><fieldset style="padding:0">
                                  <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                      <td width="100%"></td>
                                      <td><gw:imgbtn id="btSv" img="new" alt="New"  onclick="OnNew(1)" /></td>
                                      <td ><gw:imgbtn id="btSve" img="save" alt="Save"  onclick="OnSave(1)" /></td>
                                      <td ><gw:imgbtn id="btSvre" img="delete" alt="Delete"  onclick="OnDelete(1)" /></td>
                                    </tr>
                                  </table>
                                </fieldset></td>
                            </tr>
                            <tr style="height:99%">
                              <td width="100%" ><gw:grid   
																						id="Grid_Facilities"  
																						header="Facilities Code|Facilities Name|Typical Facilities Y/N|_pk|_Project_pk|_Faciliti_pk"   
																						format  ="0|0|0|0|0|0"  
																						aligns  ="0|0|0|0|0|0"  
																						defaults="||Y|||"  
																						editcol ="0|0|0|0|0|0"  
																						widths  ="1500|2000|3000|0|0|0"  
																						styles="width:100%; height:100%"   
																						sorting="T"   
																						oncellclick= "OnClick(3)" /></td>
                            </tr>
                          </table></td>
                        <td width="3%" style="background-color:#BDE9FF"></td>
                        <td width="57%"><table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                            <tr style="height:100%">
                              <td  width="100%" ><gw:grid   
																					id="Grid_Faci_Detail"  
																					header="Scale Item|Input Value|Scale Value|Unit|_contsizeitem|_facility|_projectfacility"   
																					format  ="0|0|-0|0|0|0|0"  
																					aligns  ="0|0|0|0|0|0|0"  
																					defaults="||||||"  
																					editcol ="0|0|1|0|0|0|0"  
																					widths  ="1500|2000|1500|1500|500|500|0"  
																					styles="width:100%; height:100%"   
																					sorting="T"   
																						 /></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr style="height:1%;width:100%">
                  <td colspan="3" width="100%"><table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td align="right" width="15%" >Others&nbsp;</td>
                        <td width="85%" ><gw:textarea id="txtOther" styles='width:100%;height:50' /></td>
                      </tr>
                    </table></td>
                </tr>
                <tr style="height:1%">
                  <td width="100%"></td>
                  <td align="right"><gw:imgbtn id="btS" img="attach" alt="Attach file"  onclick="AttachFiles()" /></td>
                  <td ><gw:imgbtn id="btSe" img="delete" alt="Delete"  onclick="OnDelete(3)" /></td>
                </tr>
                <tr style="height:48%">
                  <td colspan="3"><gw:grid   
		                                                                                                id="Grid_Attach"  
		                                                                                                header="File Name|Size|_pk|_project_pk"   
		                                                                                                format  ="0|0|0|0"  
		                                                                                                aligns  ="0|0|0|0"  
		                                                                                                defaults="|||"  
		                                                                                                editcol ="0|0|0|0"  
		                                                                                                widths  ="6000|1000|0|0"  
		                                                                                                styles="width:100%; height:100%"   
		                                                                                                sorting="T"   
		                                                                                                oncelldblclick="OnOpenFile()" /></td>
                </tr>
              </table>
              <table style="width: 100%; overflow:scroll" name="Condition" id="Tab2" >
                <tr>
                  <td align="right" width="15%">Work Description</td>
                  <td width="85%" colspan="3"><fieldset>
                      <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                          <td><gw:checkbox id="chkDesign" value="N" defaultvalue="Y|N"/></td>
                          <td align="left" width="25%">Equipment</td>
                          <td style="display:none"><gw:checkbox id="chkFacility" value="N" defaultvalue="Y|N" /></td>
                          <td style="display:none" align="left" width="25%">Facility</td>
                          <td><gw:checkbox id="chkConstruction" value="N" defaultvalue="Y|N" /></td>
                          <td align="left" width="25%">Construction</td>
                          <td><gw:checkbox id="chkCMCS" value="N" defaultvalue="Y|N"/></td>
                          <td align="left" width="25%"><a title="Construction Management, Supervision(English)" style="color:#333">CM, Sprv</a></td>
                        </tr>
                      </table>
                    </fieldset></td>
                </tr>
                <tr>
                  <td align="right" width="15%"><a title="Contract Type" style="color:#333">Cont. Type</a></td>
                  <td colspan="3"><table width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="35%"><fieldset >
                            <table cellpadding="0" cellspacing="0" width="100%">
                              <tr>
                                <td width="100%"><gw:radio id="rdoContract_Type" value="2" > <span value="2"><a title="Main Contract" style="color:Black">General</a></span> <span value="0"><a title="Sub Contract" style="color:Black">Sub Cont.</a></span> </gw:radio ></td>
                              </tr>
                            </table>
                          </fieldset></td>
                        <td align="right" width="15%">Single CCY</td>
                        <td width="35%"><fieldset style="padding:0">
                            <table cellpadding="1" cellspacing="1" width="100%">
                              <tr>
                                <td width="50%"><gw:radio id="rdoSingle_CCY" value="2" > <span value="2">Yes</span> <span value="0">No</span> </gw:radio ></td>
                                <td align="left" width="10%"><a href="#" onClick="OnPopUp('Ccy')" title="Click here to show Currency" style="text-decoration:none">Ccy</a></td>
                                <td width="40%"><gw:list id="lstCurrency" styles='width:100%' /></td>
                              </tr>
                            </table>
                          </fieldset></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td align="right"><a title="Apply Target Construction Period" style="color:Black">Apply Targ Cons Period</a></td>
                  <td><fieldset style="width:100%">
                      <table cellpadding="0" cellspacing="0" width="100%">
                        <tr style="width:100%">
                          <td width="20%"><gw:radio id="rdoApply_Targ" value="2" > <span value="2">Yes</span> <span value="0">No</span> </gw:radio ></td>
                        </tr>
                      </table>
                    </fieldset></td>
                  <td align="right" width=""><a title="Joint Contact Budget" style="color:Black" >Joint Cont Bud</a></td>
                  <td><fieldset>
                      <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                          <td width="55%"><gw:radio id="rdoCont_Budget" value="2" > <span value="0"><a title="Not applicable" style="color:Black">Not appl</a></span> <span value="1">Integrated</span> <span value="2">Separate</span> </gw:radio ></td>
                        </tr>
                      </table>
                    </fieldset></td>
                </tr>
              </table>
            </gw:tab>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
    <gw:image id="imgFile" table_name="TECPS_PROJECT_FILE" view="/binary/ViewFile.aspx"
        post="/binary/PostFile.aspx" styles="width:100;height:100;display:none" />
    <gw:textbox id="txtPK" text="" style="display: none" />
    <gw:textbox id="txtFa_cd" text="" style="display: none" />
    <gw:textbox id="Facilities_pk" text="" style="display: none" />
    <gw:textbox id="ProjectFac_pk" text="" style="display: none" />
</body>
</html>
