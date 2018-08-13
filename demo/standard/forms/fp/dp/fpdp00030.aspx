<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Model Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var status = 0;
//------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    SetProperty();
    btnUpdate.SetEnable(false);
    btnDelete.SetEnable(false);
    
    //-------------
    BindingDataList();
    //-------------
}

//-----------------------------------------------------------------------------------------------

function BindingDataList()
{ 
    var data=""; 

    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0140','','') FROM DUAL" )%>"; 
    lstSeason.SetDataText(data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0150','','') FROM DUAL" )%>"; 
    lstModelType.SetDataText(data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0160','','') FROM DUAL" )%>"; 
    lstBrand.SetDataText(data);
}

//------------------------------------------------------------

function SearchCode()
{
    fpdp00030.Call("SELECT")
}
//------------------------------------------------------------

function SetProperty()
{
    txtClientCode.SetEnable(false)
    txtClientName.SetEnable(false)
    txtManagerCode.SetEnable(false)
    txtManagerName.SetEnable(false)
    txtDesignerCode.SetEnable(false)
    txtDesignerName.SetEnable(false)
    txtSellerCode.SetEnable(false)
    txtSellerName.SetEnable(false)
}
//------------------------------------------------------------

function Reset()
{
     txtPK.text ="" 
     txtModeName.text =""
     lstSeason.text =""  
     dbYear.text =""
     txtSeasonCode.text =""
     lstBrand.text=""
     txtDeveloperCode.text="" 
     txtFactoryCode.text=""            
     txtVendorCode.text="" 
     dbStardate.text=""         
     dbEnddate.text=""  
     chkActive.value='Y'   
     txtClientCode.text=""   
     txtClientName.text=""        
     txtClientPK.text="" 
     txtManagerCode.text=""
     txtManagerName.text=""   
     txtManagerPK.text="" 
     txtDesignerCode.text="" 
     txtDesignerName.text=""  
     txtDesignerPK.text="" 
     txtSellerCode.text="" 
     txtSellerName.text=""  
     txtSellerPK.text="" 
     txtRemark.text=""   
    
}
//------------------------------------------------------------

function DeleteOnClick()
{
    if (txtPK.text =="")
    {
          Reset()
    }else
    {
        if(confirm("Do you want to delete "+txtModeName.text+" ?"))
        {
            fpdp00030_1.StatusDelete()
            status=1;
            fpdp00030_1.Call();
        }
    }
}
//------------------------------------------------------------

function OnPopUp(pos)
 {
      switch (pos)         
      {	  
        case 1  :
             var path = System.RootURL + '/form/fp/ab/PopUpGetPartner.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	            txtClientPK.text = object[0];
                txtClientCode.text = object[1];
                txtClientName.text = object[2];            
	         }
	    break;
	         
        case 2 :
             var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtManagerPK.text = object[0];
                txtManagerCode.text = object[1];
                txtManagerName.text = object[2];
	         }
	    break; 
	         
        case 3 :
             var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtDesignerPK.text = object[0];
                txtDesignerCode.text = object[1];
                txtDesignerName.text = object[2];
	         }
        break;
        case 4 :
             var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSellerPK.text = object[0];
                txtSellerCode.text = object[1];
                txtSellerName.text = object[2];
	         }
	      break;
      }  
 } 
 //------------------------------------------------------------

 function OnDataReceive(obj)
 {
   if (obj.id=="fpdp00030_1" && status!=0)
   {
    if (status==1)
    {
        Reset();
    }
    SearchCode();
   }
   
 }
 //------------------------------------------------------------

 function AddOnClick()
 {
         status=2;
         btnUpdate.SetEnable(true)
        if ( fpdp00030_1.GetStatus() != 20 )
        {
            Reset();
            fpdp00030_1.StatusInsert();
            chkActive.value='Y' ;
        }
      
     
 }
 //------------------------------------------------------------

 function RowClick()
 {
    txtPK.text=grdMaster.GetGridData(event.row,0)
    btnUpdate.SetEnable(true)
    btnDelete.SetEnable(true)
    fpdp00030_1.Call("SELECT")
 }
 //------------------------------------------------------------

 function SaveOnClick()
 {
    if (SaveValid())
    {
    fpdp00030_1.Call()
    }
 }
 //------------------------------------------------------------

 function SaveValid()
 {
    if (status!=1)
    {
        if (txtModeName.text=="")
        {
            alert("Please, input Model name!");
            txtModeName.GetControl().focus();
            return false;
        }else 
        {
            if(lstBrand.value == "")
            {
                alert("Please, input Brand for this Model!");
                lstBrand.GetControl().focus();
                return false;
            }
        }
        return true;
    }
 }
 //------------------------------------------------------------

</script>

<body>
    <!-------------------------------------------------------->
    <gw:data id="fpdp00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="comm.sp_sel_fpdp00030" > 
                <input bind="grdMaster" > 
                     <input bind="txtModelName" /> 
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:data id="fpdp00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="comm.sp_sel_fpdp00030_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" procedure="comm.sp_upd_fpdp00030_1"> 
                <inout> 
                <inout bind="txtPK" />
                <inout bind="txtModeName" />
                <inout bind="lstModelType" />
                <inout bind="lstSeason" />  
                <inout bind="dbYear" />
                <inout bind="txtSeasonCode" />
                <inout bind="lstBrand" />
                <inout bind="txtDeveloperCode" />
                <inout bind="txtFactoryCode" />           
                <inout bind="txtVendorCode" />
                <inout bind="dbStardate" />        
                <inout bind="dbEnddate" />  
                <inout bind="chkActive" />
                <inout bind="txtClientPK" />  
                <inout bind="txtClientCode" />  
                <inout bind="txtClientName" />       
                <inout bind="txtManagerPK" />
                <inout bind="txtManagerCode" />
                <inout bind="txtManagerName" />  
                <inout bind="txtDesignerPK" />
                <inout bind="txtDesignerCode" />
                <inout bind="txtDesignerName" /> 
                <inout bind="txtSellerPK" />
                <inout bind="txtSellerCode" />
                <inout bind="txtSellerName" /> 
                <inout bind="txtRemark" /> 
                <inout bind="txtAtt01" />
                <inout bind="txtAtt02" />
                <inout bind="txtAtt03" />
                <inout bind="txtAtt04" />
                <inout bind="txtAtt05" /> 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="left">
                            <b>Model Name</b></td>
                        <td style="width: 79%">
                            <gw:textbox id="txtModelName" styles="width:100%" onenterkey="SearchCode()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btSearch" img="search" onclick="SearchCode()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="3">
                            <gw:grid id="grdMaster" header="_PK|Model Name" format="0|0" aligns="0|0" defaults="||"
                                editcol="0|0" widths="0|1500" styles="width:100%;height:100%" sorting="F" param="0,1"
                                oncellclick="RowClick()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr align="right">
                        <td style="width: 97%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="Add" onclick="AddOnClick()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="DeleteOnClick()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="SaveOnClick()" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="4">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 20%" align="right">
                                        Model Name
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtModeName" styles="width:100%" csstype="mandatory" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%" align="right">
                                        Model Type
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstModelType" styles="width:100%" />
                                    </td>
                                    <td colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Brand</td>
                                    <td>
                                        <gw:list id="lstBrand" styles="width:100%" />
                                    </td>
                                    <td style="width: 20%" align="right">
                                        Season
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstSeason" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%" align="right">
                                        Season Code
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtSeasonCode" styles="width:100%" />
                                    </td>
                                    <td style="width: 20%" align="right">
                                        <b>Year</b></td>
                                    <td style="width: 30%" align="left">
                                        <gw:datebox id="dbYear" type="year" lang="1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Development Code</td>
                                    <td>
                                        <gw:textbox id="txtDeveloperCode" styles="width:100%" />
                                    </td>
                                    <td align="right">
                                        <b>Factory Code</b>
                                    </td>
                                    <td>
                                        <gw:textbox id="txtFactoryCode" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Vendor Code</td>
                                    <td colspan="3">
                                        <gw:textbox id="txtVendorCode" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Valid</td>
                                    <td align="left" colspan="2">
                                        <gw:datebox id="dbStardate" lang="1" />
                                        ~
                                        <gw:datebox id="dbEnddate" nullaccept lang="1" />
                                    </td>
                                    <td align="left">
                                        <gw:checkbox id="chkActive" styles="color:blue" defaultvalue="Y|N" value="Y"><b>ACTIVE</b></gw:checkbox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(1)">Client </b>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap">
                                        <gw:textbox id="txtClientCode" styles="width:30%" />
                                        <gw:textbox id="txtClientName" styles="width:70%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(2)">Manager </b>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap">
                                        <gw:textbox id="txtManagerCode" styles="width:30%" />
                                        <gw:textbox id="txtManagerName" styles="width:70%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(3)">Designer </b>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap">
                                        <gw:textbox id="txtDesignerCode" styles="width:30%" />
                                        <gw:textbox id="txtDesignerName" styles="width:70%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(4)">Seller </b>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap">
                                        <gw:textbox id="txtSellerCode" styles="width:30%" />
                                        <gw:textbox id="txtSellerName" styles="width:70%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Remark
                                    </td>
                                    <td colspan="3">
                                        <gw:textarea rows="3" id="txtRemark" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>Att01</b>
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtAtt01" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Att02
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtAtt02" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Att03
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtAtt03" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Att04
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtAtt04" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Att05
                                    </td>
                                    <td colspan="3">
                                        <gw:textbox id="txtAtt05" styles="width:100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------->
    <gw:textbox id="txtPK" styles="width:100%;display:none" />
    <gw:textbox id="txtVendorName" styles="width:100%;display:none" />
    <gw:textbox id="txtVendorPK" styles="width:100%;display:none" />
    <gw:textbox id="txtClientPK" styles="width:100%;display:none" />
    <gw:textbox id="txtManagerPK" styles="width:100%;display:none" />
    <gw:textbox id="txtDesignerPK" styles="width:100%;display:none" />
    <gw:textbox id="txtSellerPK" styles="width:100%;display:none" />
    <!---------------------------------------------------------------------------->
</body>
</html>
