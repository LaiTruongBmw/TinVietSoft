<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM GROUP ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var gAction="";
 
var OldValues = new Array();

var G1_tco_grpspecgrp_pk = 0,   
    G1_seq               = 1,
    G1_tco_itemgrp_pk    = 2,
    G1_tco_specgrp_pk    = 3,
    G1_specgrp_nm        = 4,
    G1_specgrp_lnm       = 5,
    G1_mandatory         = 6,
    G1_NULL_01           = 7,
    G1_idauto_yn         = 8,
    G1_spec_type         = 9,
    G1_Gravity_yn        = 10,
    G1_prefix_sign_cd    = 11,
    G1_prefix_sign_nm    = 12,
    G1_NULL_02      	 = 13, 
    G1_sub_code_yn       = 14,
    G1_display_yn_cd     = 15,
    G1_display_yn        = 16,
    G1_cons_yn           = 17,
    G1_POP_Spec_Seq      = 18,
    G1_Plan_Spec_Seq     = 19;
    
//=================================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";     
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }    
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    tab_Spec.style.color  = "cc0000"; 
    txtUser_PK.text = "<%=session("USER_PK")%>";

    //----------------------------
    txtWHAccCode.SetEnable(false);
    txtWHAccNM.SetEnable(false);
    txtRevenueAccCode.SetEnable(false);
    txtRevenueAccNM.SetEnable(false);
    txtExpenseAccCode.SetEnable(false);
    txtExpenseAccNM.SetEnable(false);
	
	txtPartnerPK.SetEnable(false);
    txtPartnerID.SetEnable(false);
    txtPartnerName.SetEnable(false);
            
    txtITEM_UOM.SetEnable(false);
    txtITEM_UOMWT.SetEnable(false);
    txtLotUOM.SetEnable(false);
    //----------------------------
    lst_agci00040_3.Call()
    //----------------------------
    BindingDataList();
    
    //----------------------------
    txtInputPK.text="";
}
//=================================================================================
function BindingDataList()
{  
    var data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || '-' || wh_name  from tlg_in_warehouse where del_if = 0 and use_yn='Y'")%>";
    cboWH.SetDataText(data);
        
    data = "#ITEM;ITEM|#ST;STANDARD";
    grdAttribute.SetComboFormat(G1_spec_type,data); 
       
    data ="#10;1ST|#20;2ND|#30;3RD|#;"
    grdAttribute.SetComboFormat(G1_POP_Spec_Seq,data);   
    
    data ="#10;1ST|#20;2ND|#30;3RD|#40;4TH|#50;5TH|#;"
    grdAttribute.SetComboFormat(G1_Plan_Spec_Seq,data);          
   
    
    data = "<%=CtlLib.SetListDataSQL("SELECT a.code, a.code || ' - ' || a.code_nm  FROM tlg_lg_code a, tlg_lg_code_group b WHERE a.del_if = 0 AND b.del_if = 0 AND a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIT0210' AND a.use_if = 'Y' ORDER BY a.code ")%>||";  // group type
    lstGroupType.SetDataText(data);
    lstGroupType.value = '' ;    
    
    data = "<%=CtlLib.SetListDataSQL("select 'A', 'WT UOM' from dual union all select 'B', 'UOM' from dual ")%>";
    lstBomType.SetDataText(data);    
}

//=================================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'UOM':
               var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtITEM_UOM.text = obj[1];
               }	
        break; 
        
        case 'Lot_UOM':
               var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtLotUOM.text = obj[1];
               }	
        break;         
        
        case 'WT_UOM':
               var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtITEM_UOMWT.text = obj[1];
               }	
        break; 
        
        case 'WH_ACC':
            fpath = System.RootURL + '/standard/forms/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtWHAccPK.SetDataText(   aValue[0] );
                txtWHAccCode.SetDataText( aValue[1] );
                txtWHAccNM.SetDataText(   aValue[2] );
            }		
        break; 
        
        case 'Revenue_ACC':
            fpath = System.RootURL + '/standard/forms/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtRevenueAccPK.SetDataText(   aValue[0] );
                txtRevenueAccCode.SetDataText( aValue[1] );
                txtRevenueAccNM.SetDataText(   aValue[2] );
            }		
        break;    
        
        case 'Expense_ACC':
            fpath = System.RootURL + '/standard/forms/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtExpenseAccPK.SetDataText(   aValue[0] );
                txtExpenseAccCode.SetDataText( aValue[1] );
                txtExpenseAccNM.SetDataText(   aValue[2] );
            }		
        break; 
		
		case 'PARENT-GROUP' :
			fpath = System.RootURL + '/standard/forms/fp/ab/fpab00310.aspx?parent_pk=' + txtParentPK.text + '&company_pk=' + cboCompany.value ;
            var aValue  = System.OpenModal(  fpath , 700 , 450 , 'resizable:yes;status:yes');             
		break;  

		case 'PARTNER' :
			var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=ALL";
	        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	        
			if ( object != null )
	        {
	            txtPartnerPK.text   = object[0];
				txtPartnerID.text = object[2];  	
                txtPartnerName.text = object[2];  
	        }
		break; 	
    } 
}                
        
//=================================================================================
function OnSave()
{  
	if(onValidate())
	{
	    txtItemGroupPhotoPK.SetDataText(imgSTItem.oid);
	    
	    gAction = "SAVE" 
	    data_grd_control.Call();
	}	
}
//=================================================================================
function OnAddNew(index)
{
	switch(index)
	{
	    case 0:
	        if(txtInputPK.GetData()=='')
	        {
	            alert("You must chose a parent node!");
	            return;
	        }
	        
	        if(chkLEAF_YN.GetData()=='Y')
	        {
		        alert("You can not add sub group to a leaf group");
		        return;
	        }
	        
    	    SaveOldValues();		                
	        gAction = "INSERT";
	        data_grd_control.StatusInsert();
	        chkUSE_YN.value='Y';
	        
	        var obj=cboCompany.GetControl();
	        if (obj.options.length >0 && cboCompanyList.value > 0 )
			{
	            cboCompany.value = cboCompanyList.value ;
	        }
						        
	        txtParentPK.SetDataText(txtInputPK.GetData());
	        grdAttribute.ClearData();           
	    break;
	    case 1:
	       grdAttribute.AddRow();
	       grdAttribute.SetGridText(grdAttribute.rows - 1,G1_tco_itemgrp_pk,txtInputPK.GetData()); 
	       grdAttribute.SetGridText(grdAttribute.rows - 1,G1_mandatory,"-1"); 
	    break;
	    case 2:
	        SaveOldValues();		                
	        gAction = "INSERT";
	        data_grd_control.StatusInsert();
	        chkUSE_YN.value='Y';
	        
	        var obj=cboCompany.GetControl()
	        if (obj.options.length >0)
	            obj.options.selectedIndex=0;
	        
	        txtParentPK.text = '';
	        grdAttribute.ClearData();
	    break;
	}
}
//=================================================================================
function OnDataReceive(p_oData)
{
    switch(p_oData.id )
    {       
        case "data_grd_control":  
             imgSTItem.SetDataText(txtItemGroupPhotoPK.text );
             
            if ( gAction == "SAVE" )  
            {          
                for(var i=1; i< grdAttribute.rows; i++)
                {
                    if ( grdAttribute.GetGridData( i, G1_tco_itemgrp_pk) == '' )
                    {
                        grdAttribute.SetGridText(i, G1_tco_itemgrp_pk, txtGroupPK.text);
                    }    
                }
                data_grd_attribute.Call();
            }
            else
            {
                if(gAction == "DELETE")
                {
                    OnAddNew(0)
                    dat_ItemGroupTree.Call("SELECT");
                }
                else
                {
                    data_grd_attribute.Call('SELECT');
                }
            }        
        break;
        
        case "data_grd_attribute":
             //if ( gAction != "VIEW" ) 
             //{
                //dat_ItemGroupTree.Call("SELECT");
             //}   
        break;    
        
        case 'pro_agci00040_5':
            if(Number(txtNumChild.text)==0)
            {
                gAction = "DELETE";
                data_grd_control.StatusDelete();
                data_grd_control.Call('');
            }
            else
                alert("You must delete leaf node first!");
        break;  
                
         case 'lst_agci00040_3':
		 
            cboCompany.SetDataText(txtReturnValue.text); 
            cboCompany.value = "<%=session("COMPANY_PK")%>";
			
            cboCompanyList.SetDataText(txtReturnValue.text);    
            cboCompanyList.value = "<%=session("COMPANY_PK")%>";
			
            dat_ItemGroupTree.Call("SELECT");             
         break; 
        
    }
}
//=================================================================================
function OnDelete(index) 
{
    switch(index)
    {
        case 0:
            if(confirm('Do you want to delete selected item?'))
            {                
                pro_agci00040_5.Call('');
	        }
        break;
        case 1:
            if(confirm('Do you want to delete selected item?'))
            {
                grdAttribute.DeleteRow();
            }    
        break;
    }
}
//=================================================================================
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode();       
   txtInputPK.SetDataText(obj.oid);
   txtGroupPK.SetDataText(obj.oid); 
   grdAttribute.ClearData();
   gAction="VIEW";
   data_grd_control.Call("SELECT");
} 
//=================================================================================
function onValidate()
{
    if(txtITEMGRP_CD.GetData()=="" || txtGRP_NM.GetData()=="")
	{
		alert("Group initial and description can not be empty");
		return false;
	}
	
	for(i=1; i<grdAttribute.rows; i++)
	{   
	    if(grdAttribute.GetGridData(i,G1_idauto_yn)=='-1')
	    {
           if( Trim(txtSTSeqLength.text)=='')
	            if(!confirm("Do you want to save without input ST item sequence length?"))  
	            {
	                alert("Please input ST item sequence length!");
	                txtSTSeqLength.GetControl().focus();
	                return false;	        
    	        }        	     
            	   
            if( Trim(txtItemSeqLength.text)=='')
                if(!confirm("Do you want to save without input item sequence length?"))  
                {
                    alert("Please input item sequence length!");
                    txtItemSeqLength.GetControl().focus();
                    return false;
                }
        }
    }
    return true; 
}
//=================================================================================
function SaveOldValues()
{
	OldValues[30]=txtHS_CODE_PK.GetData();
	OldValues[31]=txtHSCODE.GetData();
	OldValues[32]=txtITEM_UOM.GetData();
	OldValues[34]=txtITEM_UOMWT.GetData();
}
//=================================================================================
function  OnSubUndelete()
{
   grdAttribute.UnDeleteRow();
}
//=================================================================================
function OnGridCellDoubleClick(p_oGrid)
{
    var col_val = event.col ;
    var row_val = event.row ;
     
    if ( col_val == G1_specgrp_nm )
    {
       var path = System.RootURL + '/standard/forms/ag/ci/agci00041.aspx';
       var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
       
       if ( obj != null )
       {
            grdAttribute.SetGridText( row_val, G1_tco_specgrp_pk, obj[1] );
            grdAttribute.SetGridText( row_val, G1_specgrp_nm,     obj[2] );
       }
    }   	
}
//=================================================================================
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}
//================================================================================
function OnChangeTab()
 {
 
    var strRad = radPackType.GetData();
             
	switch (strRad)
	{
		case 'SL':
		    grdAttribute.style.display  = "";
		    imgSTItem.style.display		= "none";
			tabAcc.style.display        = "none";
		    
		    tab_Spec.style.color    = "cc0000"; 
		    tab_Picture.style.color = "";	
			tab_Account.style.color = "";
        break;

		case 'AC':
			tabAcc.style.display        = "";
			grdAttribute.style.display  = "none";
			imgSTItem.style.display     = "none";

			tab_Account.style.color = "cc0000";
			tab_Picture.style.color = "";
			tab_Spec.style.color    = "";
		break;
        
        case 'AS':
			tabAcc.style.display        = "none";
		    grdAttribute.style.display  = "none";
		    imgSTItem.style.display     = "";
		    
		    tab_Spec.style.color    = ""; 
			tab_Account.style.color = "";
		    tab_Picture.style.color = "cc0000";		   		    
        break;	
    } 
 }
//=================================================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'ChangeAllItem':
            if ( txtGroupPK.text > 0 )
            {
                if ( confirm('Do you want to apply for all stitem and item ?') )
                {
                    pro_agci00040.Call();                
                }    
            } 
            else
            {
                alert('Pls Select Item Group.');
            }           
        break;  
    }         
}
//=================================================================================
</script>

<body>
<!------------------------------------------------------------------>
    <gw:data id="lst_agci00040_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00040_3" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_agci00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00040" > 
                <input>
                     <input bind="txtGroupPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="dat_ItemGroupTree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="st_lg_sel_agci00040_1" > 
                <input>
                    <input bind="cboCompanyList"/>
                    <input bind="txtParentPK" />
                    <input bind="txtGroupSearch" />                    
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_grd_control" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="control" parameter = '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54'  function="st_lg_sel_agci00040_2" procedure = "st_lg_upd_agci00040_2"> 
                <input>
                    <input  bind="txtGroupPK" />   
                    <input  bind="txtParentPK" />
                    <input  bind="txtITEMGRP_CD" /> 
                    <input  bind="txtGRP_NM" /> 
			        <input  bind="txtGRP_LNM" />
			        <input  bind="txtGRP_FNM" />
			        <input  bind="txtITEM_FORMAT" /> 
                    <input  bind="txtITEM_UOM" /> 
                    <input  bind="txtITEM_UOMWT" /> 
                    <input  bind="txtITEM_UOMVOL" />
                    
                    <input  bind="txtITEM_UOMDIM" />
                    <input  bind="txtITEM_UOMSUR" />
                    <input  bind="chkLEAF_YN" /> 
                    <input  bind="txtHS_CODE_PK" /> 
                    <input  bind="txtHSCODE" />
                    <input  bind="txtHS_LEVEL" /> 
                    <input  bind="cboWH" /> 
                    <input  bind="txtWHAccPK" />
                    <input  bind="txtPUR_TYPE" />
                    <input  bind="txtWEIGHT_FORMULAR" />
                    
                    <input  bind="txtVOLUME_FORMULAR" />
                    <input  bind="txtSURFACE_FORMULA" />
                    <input  bind="txtID_FORMULA" />
                    <input  bind="chkUser_Limit" />
			        <input  bind="txtSTSeqLength" />
			        <input  bind="txtItemSeqLength" />			        
			        <input  bind="txtDESCRIPTION" />
			        <input  bind="chkUSE_YN" />
			        <input  bind="dtaFrom" />  
			        <input  bind="dtaTo" /> 
			         
			        <input  bind="txtWHAccCode" />
			        <input  bind="txtWHAccNM" />
			        <input  bind="cboCompany" />
			        <input  bind="txtGravity" />
			        <input  bind="lstBomType" />
			        <input  bind="chkGrpCode_Display_YN" />
			        <input  bind="txtLotUOM" />			        
			        <input  bind="lstGroupType" />			        
			        <input  bind="chkSale" />
			        <input  bind="chkProd" />
			        
			        <input  bind="chkMat" />
			        <input  bind="chkSub_Mat" />
			        <input  bind="chkSemi_Prod" />
			        <input  bind="chkPurchase" />
					<input  bind="chkAcc" />
			        
			        <input  bind="txtExpenseAccPK" />
			        <input  bind="txtExpenseAccCode" />
			        <input  bind="txtExpenseAccNM" />
			        
			        <input  bind="txtRevenueAccPK" />
			        <input  bind="txtRevenueAccCode" />
			        <input  bind="txtRevenueAccNM" />
			        <input  bind="txtItemGroupPhotoPK" />

					<input  bind="txtPartnerPK" />
			        <input  bind="txtPartnerID" />
			        <input  bind="txtPartnerName" />		
                </input>
                <output>
                    <output bind="txtGroupPK" /> 
                </output>
            </dso> 
        </xml>
    </gw:data>
    <!-----------------grdAttribute ---------------------------------------->
    <gw:data id="data_grd_attribute" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_agci00040_4"  procedure="st_lg_upd_agci00040_4"> 
                <input bind="grdAttribute" > 
                    <input bind="txtGroupPK" /> 
                </input> 
                <output bind="grdAttribute" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------check current node has child------------------------->
    <gw:data id="pro_agci00040_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_agci00040_5"  > 
                <input> 
                     <input  bind="txtGroupPK" />
                </input>
                <output>
                    <output  bind="txtNumChild" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 25%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company</td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%;" onchange="txtParentPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group</td>
                        <td style="width: 79%">
                            <gw:textbox id="txtGroupSearch" styles='width:100%' onenterkey="txtParentPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="txtParentPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
                            <!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"-->
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%" id="RightTopTB">
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Company
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="cboCompany" styles="width:100%" />
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 94%" align="left">
                                                    <gw:imgbtn id="btnNewParent" img="btn_popup" alt="New Parent" text="New Parent" onclick="OnAddNew(2)" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="idBtnSaveChange" img="2" text="Apply for Items" styles='width:100%'
                                                        onclick="OnProcess('ChangeAllItem')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew(0)" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete(0)" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">                                        
										<a title="Group" onclick="OnPopUp('PARENT-GROUP')" href="#tips">Group code</a>
									</td>
                                    <td style="width: 30%">
                                        <gw:textbox csstype="mandatory" id="txtITEMGRP_CD" styles='width:100%' onkeypress="Upcase()" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Group name</td>
                                    <td style="width: 50%">
                                        <gw:textbox csstype="mandatory" id="txtGRP_NM" styles='width:100%' onchange="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; background-color: #B4E7FF" align="right" colspan="4">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 5%">
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Sale</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkSale" mode="01" />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Pur</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkPurchase" mode="01" />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Prod</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkProd" mode="01" />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Semi Prod</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkSemi_Prod" mode="01" />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Mat</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkMat" mode="01" />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    Sub Mat</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkSub_Mat" mode="01" />
                                                </td>
                                                <td style="width: 5%">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select UOM" href="#tips" style="text-decoration: none; color=#0000ff"
                                            onclick="OnPopUp('UOM')"><b>UOM</b>
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 30%">
                                                    <gw:textbox id="txtITEM_UOM" styles='width:100%' />
                                                </td>
                                                <td style="width: 40%" align="right">
                                                    <a title="Click here to select UOM" href="#tips" style="text-decoration: none; color=#0000ff"
                                                        onclick="OnPopUp('WT_UOM')"><b>WT UOM</b>
                                                </td>
                                                <td style="width: 30%">
                                                    <gw:textbox id="txtITEM_UOMWT" style="width: 100%" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 15%" align="right">
                                                    <b>Leaf</b>
                                                </td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkLEAF_YN" mode="01"></gw:checkbox>
                                                </td>
                                                <td style="width: 15%" align="right">
                                                    Active</td>
                                                <td style="width: 5%" align="left">
                                                    <gw:checkbox id="chkUSE_YN" defaultvalue="Y|N" value="Y" />
                                                </td>
                                                <td style="width: 15%" align="right">
                                                    Date</td>
                                                <td style="width: 15%" align="left">
                                                    <gw:datebox id="dtaFrom" lang="<%=Application("Lang")%>" mode="01" />
                                                    ~<gw:datebox id="dtaTo" nullaccept lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Gravity</td>
                                    <td style="width: 30%" align="left">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 30%">
                                                    <gw:textbox id="txtGravity" mode="01" type="number" format='###,###,###.#########'> </gw:textbox>
                                                </td>
                                                <td style="width: 40%" align="right">
                                                    <a title="Lot UOM" href="#tips" style="text-decoration: none; color=#0000ff" onclick="OnPopUp('Lot_UOM')">
                                                        <b>Lot UOM</b>
                                                </td>
                                                <td style="width: 30%">
                                                    <gw:textbox id="txtLotUOM" style="width: 100%" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Group Type</td>
                                    <td style="width: 50%">
                                        <gw:list id="lstGroupType" styles="width:100%" csstype="mandatory" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        GrpCD Display</td>
                                    <td style="width: 30%" align="left">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 30%">
                                                    <gw:checkbox id="chkGrpCode_Display_YN" mode="01" />
                                                </td>
                                                <td style="width: 40%" align="right">
                                                    BOM Type
                                                </td>
                                                <td style="width: 30%">
                                                    <gw:list id="lstBomType" styles="width:100%" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td colspan="2">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 20%; white-space: nowrap" align="right">
                                                    User Limit
                                                </td>
                                                <td style="width: 10%">
                                                    <gw:checkbox id="chkUser_Limit" mode="01" />
                                                </td>
                                                <td style="width: 20%; white-space: nowrap" align="right">
                                                    <b>Seq length(st/item)</b></td>
                                                <td style="width: 50%; white-space: nowrap">
                                                    <gw:textbox id="txtSTSeqLength" styles="width:50%" />
                                                    <gw:textbox id="txtItemSeqLength" styles="width:50%" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%" id="Table4"> 
                                <tr>                                   
                                    <td style="width: 11%" align="right">
                                        Description
                                    </td>
                                    <td style="width: 90%" colspan="7">
                                        <gw:textbox id="txtDESCRIPTION" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 97%" align="left">
                                        <gw:radio id="radPackType" value="SL" styles="width:100%" onchange="OnChangeTab()"> 
                                            <span value="SL" id="tab_Spec" >Spec</span> 
											<span value="AC" id="tab_Account" >Account</span> 
                                            <span value="AS" id="tab_Picture">Picture</span> 
                                        </gw:radio>
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubNew" img="new" alt="New" onclick="OnAddNew(1)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubDelete" img="delete" alt="Delete" onclick="OnDelete(1)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubUndelete" img="udelete" alt="Undelete" onclick="OnSubUndelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td>
                            <gw:grid id="grdAttribute" header="_pk|No|_tco_itemgrp_pk|_tco_specgrp_pk|Group spec name|_Local name|Mandatory|_NULL_01|Seq Auto|Spec Type|Gravity YN|Prefix Sign CD|Prefix Sign NM|_NULL_02|_Sub Code YN|Display CD|Display Name|Cons|POP Spec Seq|Plan Spec Seq"
                                format="0|0|0|0|0|0|3|3|3|2|3|0|0|3|3|3|3|3|0|0" aligns="0|0|0|0|0|0|3|3|0|0|3|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||-1||ST||||||||||" editcol="0|1|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|500|0|0|2500|0|1200|1200|1200|1200|1200|1500|1500|1200|0|1300|1300|1000|1500|1500"
                                styles="width:100%; height:100%" sorting="F" oncelldblclick="OnGridCellDoubleClick(this)" />
                            <gw:image id="imgSTItem" table_name="TCO_STITEMPHOTO" oid="0" view="/binary/ViewFile.aspx"
                                post="/binary/PostFile.aspx" styles="width:50%;height:100%" style='border: 1px solid #1379AC' />
							<table id="tabAcc" style="height:3%; width:100%" border="0">
								<tr>
                                    <td style="width: 10%" align="right" nowrap>
                                        <a title="Click here to select account code" onclick="OnPopUp('Expense_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Expense ACC</b></a>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:textbox id="txtExpenseAccCode" styles="width=30%" />
                                        <gw:textbox id="txtExpenseAccNM" styles="width=70%" />
                                        <gw:textbox id="txtExpenseAccPK" styles="display:none" />
                                    </td>
                                    <td style="width: 10%" align="right" nowrap>
                                        <a title="Click here to select account code" onclick="OnPopUp('Revenue_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Revenue ACC</b></a>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap" colspan="3">
                                        <gw:textbox id="txtRevenueAccCode" styles="width=30%" />
                                        <gw:textbox id="txtRevenueAccNM" styles="width=70%" />
                                        <gw:textbox id="txtRevenueAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right" nowrap>
                                        <a title="Click here to select account code" onclick="OnPopUp('WH_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>W/H ACC</b></a>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:textbox id="txtWHAccCode" styles="width=30%" />
                                        <gw:textbox id="txtWHAccNM" styles="width=70%" />
                                        <gw:textbox id="txtWHAccPK" styles="display:none" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        HS code</td>
                                    <td style="width: 40%" colspan="3">
                                        <gw:textbox id="txtHSCODE" styles='width:100%' />
                                        <gw:textbox id="txtHS_CODE_PK" style="display: none" />
                                    </td>
                                </tr>
								
								<tr>
                                    <td style="width: 10%" align="right" nowrap>
                                        <a title="Business Partner" onclick="OnPopUp('PARTNER')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Partner</b></a>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:textbox id="txtPartnerID" styles="width=30%" />
                                        <gw:textbox id="txtPartnerName" styles="width=70%" />
                                        <gw:textbox id="txtPartnerPK" styles="display:none" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        </td>
                                    <td style="width: 40%" colspan="3">
 
                                         
                                    </td>
                                </tr>
								
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Virtual W/H
                                    </td>
                                    <td style="width: 40%">
                                        <gw:list id="cboWH" styles="width:100%" />
                                    </td>
									<td style="width: 10%; white-space: nowrap" align="right">
                                        Acc
                                    </td>
                                    <td style="width: 40%">
                                       <gw:checkbox id="chkAcc" styles="color:blue" mode="01"></gw:checkbox>
                                    </td>
                                </tr>
							</table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtGroupPK" text="" style="display: none" />
    <gw:textbox id="txtItemGroupPhotoPK" text="" style="display: none" />
    <gw:textbox id="txtParentPK" text="" style="display: none" />
    <gw:textbox id="txtInputPK" style="display: none" />
    <gw:textbox id="txtNumChild" style="display: none" />
    <!--------------------------------------------------------->
    <gw:textbox id="txtHS_LEVEL" styles='width:100%;display:none' />
    <gw:textbox id="txtSURFACE_FORMULA" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtWEIGHT_FORMULAR" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtVOLUME_FORMULAR" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtITEM_FORMAT" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtITEM_UOMVOL" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtPUR_TYPE" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtITEM_UOMDIM" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtITEM_UOMSUR" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtID_FORMULA" styles='width:100%;display:none' maxlen="40" />
    <gw:textbox id="txtGRP_LNM" styles='width:100%;display:none' maxlen="20" />
    <gw:textbox id="txtGRP_FNM" styles='width:100%;display:none' onchange="" maxlen="40" />
    <!--------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!--------------------------------------------------------->
    <gw:textbox id="txtReturnValue" text="" style="display: none" />
    <gw:textbox id="txtUser_PK" text="" style="display: none" />
</body>
</html>
