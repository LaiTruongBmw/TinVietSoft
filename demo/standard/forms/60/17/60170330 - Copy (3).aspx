<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
%>
<head>
    <title>ALLOCATION RATIO</title>
</head>

<script type="text/javascript" language="javascript">
var gAction="";
var flag;

var G1_PK = 0,
    G1_CD = 1,
    G1_NM = 2 ; 

var G2_ALLOC_RATIO_PK       = 0,
    G2_SEQ                  = 1,
    G2_TAC_ABTRACGRP_PK     = 2, 
    G2_RATIO                = 3,
	G2_TAC_COSTING_ITEMGRP_PK =4,
	G2_TAC_ABPLCENTER_PK = 5,
	G2_pl_cd				= 6,
	G2_pl_nm				= 7;
    G2_MONTH                = 8,
	G2_REMARK               = 9;
	
    
	
	
//------------------------------------------------------------

function BodyInit()
{	 
	
	var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT  c.pk , c.ac_grp || '-' || c.ac_grpnm cost_nm FROM tac_abtracgrp c WHERE c.del_if = 0 AND c.app_grp IN ('C', 'X')")%>";
    lstCostType.SetDataText(ls_data);
	
	var data2 = "<%=CtlLib.SetGridColumnDataSQL("SELECT  c.pk , c.ac_grp || '-' || c.ac_grpnm cost_nm FROM tac_abtracgrp c WHERE c.del_if = 0 AND c.app_grp IN ('C', 'X')" )%>" ; 
	grdRatio.SetComboFormat(G2_TAC_ABTRACGRP_PK,data2); 
	
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    
    var ctrl = grdRatio.GetGridControl();        
    ctrl.ColFormat(G2_RATIO)    = "###,###,###.####R" ;
    //----------------------------
    lst_60170330_4.Call();
	
	
}


//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdRatio': 
             
           
                data_60170330_1.Call("SELECT");   
           
              
        break;        
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_60170330_1":
         
        break; 
            
         case "lst_60170330_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
           // cboCompanyList.value = "<%=session("COMPANY_PK")%>";
            lst_60170330_5.Call();
			dat_ItemGroupTree.Call('SELECT');
          break; 
          case "pro_60170330":
            alert(txtReturnValue.text);
            OnSearch('grdRatio');
          break;
		  case "lst_60170330_5":
			lstCostType.SetDataText(txtReturnValue.text);
		  break;
        
    }
}

function Validate()
{   
   return true;
}

//====================================================================================

function OnSave()
{ 
    
		for(var i =0 ; i<grdRatio.rows; i++)
		{
			if(grdRatio.GetGridData(i,G2_ALLOC_RATIO_PK) =="")
			{
				grdRatio.SetRowStatus(i,32);
			}
		}             
		flag='save';
		data_60170330_1.Call();                
}

//====================================================================================
function OnProcess()
{
    if(txtGrpItemPK.text != "")
    {     
         pro_60170330.Call()
    }
}

//====================================================================================
 function OnDelete(index)
 {     
    if(confirm("Do you want to delete this data?"))  
    { 
        grdRatio.DeleteRow();
        OnSave();
    }
 }
//====================================================================================
 function OnNew(obj)
{
 if(txtPLCode.text=="")
	{
		alert("Please ! choose PL to add new !!!!");
		return;
	}
	if(txtGrpItemPK.text!="")
	{        
			grdRatio.AddRow();
			//grdRatio.SetGridText(grdRatio.rows-1,1,txtMasterPK.text);
			//grdRatio.SetGridText(grdRatio.rows-1,13,-1);//use yn
			grdRatio.SetGridText(grdRatio.rows-1, G2_TAC_ABPLCENTER_PK, txttac_abplcenter_pk.text);     // PK
			grdRatio.SetGridText(grdRatio.rows-1, G2_pl_cd, txtPLCode.text);     // PL Code
			grdRatio.SetGridText(grdRatio.rows-1, G2_pl_nm,txtPLName.text);     // PL Name 
			grdRatio.SetGridText(grdRatio.rows-1, G2_MONTH,dtMonth.value);     // PL Name 
			grdRatio.SetGridText(grdRatio.rows-1, G2_TAC_ABTRACGRP_PK,lstCostType.value);// Manufacturing Cost Type
			grdRatio.SetGridText(grdRatio.rows-1, G2_TAC_COSTING_ITEMGRP_PK,txtGrpItemPK.text);// Manufacturing Cost Type
   
	}
	else
	{
		alert("Please ! select item group to add new!!!");
		return;
	}
}
function OnUnDelete()
{              
    
}

//-------------------------------------------------------------------------------------------------

function OnTreeClick()
{ 
   //var obj = event.srcElement.GetCurrentNode();       
   //txtInputPK.SetDataText(obj.oid);
   
   //txtGroupPK.SetDataText(obj.oid);
   txtGrpItemPK.text=grdSearch.GetGridData(grdSearch.row,0);
	//dtMonth.SetDataText(obj.oid);
	//txtGrpItemPK.SetDataText(obj.oid);   
 //  grdRatio.ClearData();
   gAction="VIEW";
   data_grd_control.Call("SELECT");
} 
//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      
}

function OnPopUp()
{
           
         var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompanyList.GetData() + '&dsqlid=ac_sel_60110010_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes');   
        if(object != null)
        {
            txttac_abplcenter_pk.text = object[2];
            txtPLCode.text = object[0];
            txtPLName.text = object[1];
        }
   
}
//====================================================================================
 function OnGetPL(obj)
{
	if(event.col==G2_pl_cd || event.col == G2_pl_nm)
	{
	var l_col = event.col ;
	var l_row = event.row ;
	
        var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompanyList.GetData() + '&dsqlid=ac_sel_60110010_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
			{
				grdRatio.SetGridText(l_row, G2_TAC_ABPLCENTER_PK, object[2]);     // PK
                grdRatio.SetGridText(l_row, G2_pl_cd, object[0]);     // PL Code
                grdRatio.SetGridText(l_row, G2_pl_nm, object[1]);     // PL Name
            }
        }		
	}
}   

function OnReset()
{
   
             
            txtPLCode.text = '';
            txtPLName.text = '';
            txttac_abplcenter_pk.text = '' ;
               
    
}
</script>

<body>
	<!------------------------------------------------------------------>
	<gw:data id="data_grd_control" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60170330_1" > 
                <input>
                    <input  bind="dtMonth" />   
                    <input  bind="txtGrpItemPK" />
                    			        
                </input>
               
                    <output bind="grdRatio" /> 
               
            </dso> 
        </xml>
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="lst_60170330_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60170330_4" > 
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
    <gw:data id="lst_60170330_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60170330_5" > 
                <input> 
                    <input bind="cboCompanyList" />
                </input>
	           <output>
	                <output bind="txtGrpItemPK" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    
     <!----------------------------auto-insert---------------------------------------->
    <gw:data id="pro_60170330" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170330" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="txtGrpItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_60170330_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="ac_sel_60170330_1"  procedure="ac_upd_60170330_1"  > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="txtGrpItemPK" />                  
                </input> 
                <output bind="grdRatio" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
	
    <gw:data id="lst_60170330_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_lst_60170330_6" > 
                <input> 
                    <input  bind="txtGrpItemPK" />
                </input>
	           <output>
	                <output bind="lstCostType" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    
     <!----------------------------auto-insert---------------------------------------->
	 <gw:data id="dat_ItemGroupTree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60170330_s"    > 
                <input>
                    <input bind="cboCompanyList" /> 
					<input bind="dtMonth" /> 
                    <input bind="txtGroupSearch" />                  
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>

	<!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
           <td style="width: 25%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company</td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%;" onchange="txtGrpItemPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group</td>
                        <td style="width: 79%">
                            <gw:textbox id="txtGroupSearch" styles='width:100%' onenterkey="txtGrpItemPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="txtGrpItemPK.text='';dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
							 <gw:grid id="grdSearch" header="_PK|Group Code|Group Name" format="0|0|0" aligns="0|0|1"
                                defaults="||" editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%"
                                sorting="T"  oncellclick="OnTreeClick()" />
								
                            <!--gw:tree id="grdSearch" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" /-->
                            <!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"-->
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                         <td style="width: 10%">
                            Month
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
                        </td>
						<td style="width: 10%" align="right">
                            Cost Type</td>
                        <td style="width: 20%" colspan="2">
                            <gw:list id="lstCostType" styles="width:100%;" />
                        </td>
						<td align="right" ><a title="Click here to select PL" onclick="OnPopUp()" href="#tips">PL</a></td>
						 <td align="left" style="width: 20%"><gw:textbox id="txtPLCode" text="" styles="width:100%; " csstype="mandatory" /></td>
						<td align="left" style="width: 20%" ><gw:textbox id="txtPLName" text="" styles="width:100%; " csstype="mandatory" /></td>                    
						<td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset()" /></td>   
                         <td style="width: 1%">
                            <gw:imgbtn id="btnProcess" img="process" alt="Auto Get Ratio" text="Process" onclick="OnProcess()" />
                        </td>
                         <td style="width: 28%" align="right">
                            <gw:label id="txtSTCode" text="" styles="color:red" readonly="true" />
                        </td>
                        <td style="width: 30%">
                            <gw:label id="txtSTName" text="" styles="color:red" readonly="true" />
                        </td>                       
                        
                        <td with="1%">
                            <gw:imgbtn id="btnNewM" img="New" alt="New" onclick="OnNew()" />
                        </td>
                        
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="15">
                            <gw:grid id='grdRatio'
                                header='_ALLOC_RATIO_PK|Seq|Cost Type|Index|_TAC_COSTING_ITEMGRP_PK|_TAC_ABPLCENTER_PK|PL Code|PL Name|_P_MONTH|Remark'
                                format='0|0|0|1|0|0|0|0|5|0'
                                aligns='0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||'
                                editcol='1|1|1|1|1|1|0|0|1|1'
                                widths='0|1000|2000|1500|0|0|1000|3000|0|2000'
                                sorting='T'
								oncelldblclick='OnGetPL(this)'
								styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtGrpItemPK" text="" style="display: none" />
<gw:textbox id="txttac_abplcenter_pk" text="" style="display: none" />
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtParentPK" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtGroupPK" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
</html>
