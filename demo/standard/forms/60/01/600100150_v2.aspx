<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>TRANSACTION WAREHOUSE MAPPING</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script type="text/javascript" language="javascript">

var flag;

var G_PK                =0,
    G_TRANS_NAME        =1,
    G_WH_NAME           =2,
	G_ITEMGRP			=3,
    G_ITEM_CODE         =4,
    G_ITEM_NAME         =5,
    G_DEBIT_ACCOUNT     =6,
    G_CREDIT_ACCOUNT    =7,
    G_PL_DEBIT          =8,
    G_PL_CREDIT         =9,
    G_LINE_NAME         =10,
    G_REF_WH_NAME       =11,
    G_DEBIT_ACC_PK      =12,
    G_CREDIT_ACC_PK     =13,
    G_WH_PK             =14,
	G_DEPT			    =15,
    G_TRANS_CODE        =16,
    G_ACTIVE_FLAG       =17,
    G_DESC              =18;
//------------------------------------------------------------
    var binit=true;
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    txtUser_PK.text = "<%=session("USER_PK")%>";
	BindingDataList();
	data_pro_600100150_v2_2.Call();
}

//====================================================================================
function BindingDataList()
{
    
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select v.pk, v.PL_CD || '*' || pl_nm from TAC_ABPL v order by pl_cd asc ")%>";
    grdWhMapping.SetComboFormat(G_PL_DEBIT,t1);
	grdWhMapping.SetComboFormat(G_PL_CREDIT,t1);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>|ALL|Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = 'ALL';

	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' and acc_yn='Y' order by wh_name")%>";
	lstWH.SetDataText( data + "||Select All");
    lstWH.value = '';
    
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||Select All";
    lstProGrp.SetDataText(data);
    lstProGrp.value = '';  
    
    grdWhMapping.GetGridControl().FrozenCols =G_DEBIT_ACCOUNT;
    grdWhMapping.GetGridControl().ScrollTrack=true;
    
    txtCreditCode.SetEnable(false);
    txtCreditName.SetEnable(false);
    txtDebitCode.SetEnable(false);
    txtDebitName.SetEnable(false);
    txtToPL_CD.SetEnable(false);
    txtToPL_Name.SetEnable(false);
    txtFromPL_CD.SetEnable(false);
    txtFromPL_Name.SetEnable(false);
	data = "<%=CtlLib.SetListDataPROC("lg_sel_agfp00090_wh_tree_lst", "'" + Session("SESSION_LANG") + "'")%>";
    lstWHGrp.SetDataText(data);
}
//====================================================================================

function OnSearch()
{
    
	data_sel_600100150_v2.Call("SELECT");
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_pro_600100150_v2_1":
            //data_pro_600100150_v2_5.Call();
            lstWH.value = "ALL";
            
          break; 
        case "data_pro_600100150_v2_2":
		    data_pro_600100150_v2_3.Call();
          break; 
		 case "data_pro_600100150_v2_5":
			alert(txtReturnValue.text);
			break;
		case "data_pro_600100150_v2_6":
			alert(txtReturnValue.text);
			break;
        case "data_pro_600100150_v2_3":
            lstWH.value="ALL";
		  break;
		case "data_pro_600100150_v2_4":
		    lstTrType.value="ALL";
		break;
		case "data_pro_600100150_v2":
		    data_sel_600100150_v2.Call("SELECT");
		break;
		case "data_sel_600100150_v2":
		    if (grdWhMapping.rows>1)
		    {
		        grdWhMapping.SetCellBgColor(1, G_ITEM_CODE,grdWhMapping.rows-1, G_ITEM_CODE, 0xCCFFFF );
		        grdWhMapping.SetCellBgColor(1, G_DEBIT_ACCOUNT,grdWhMapping.rows-1, G_DEBIT_ACCOUNT, 0xFFCCFF );
		        grdWhMapping.SetCellBgColor(1, G_PL_DEBIT,grdWhMapping.rows-1, G_PL_DEBIT, 0xFFCCFF );
		        grdWhMapping.SetCellBgColor(1, G_CREDIT_ACCOUNT,grdWhMapping.rows-1, G_CREDIT_ACCOUNT, 0xFFFFCC );
		        grdWhMapping.SetCellBgColor(1, G_PL_CREDIT,grdWhMapping.rows-1, G_PL_CREDIT, 0xFFFFCC);
		    }
		    lblRecord.text=(grdWhMapping.rows - 1)  + " record(s)!"
	    break;
    }
}
//===================================================================================

function OnPopUp(iObject)
{
    switch(iObject)
    {
        case 'Credit Account':
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=&comm_code=&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_600100150_v2_acc";
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
           if(object!=null)
            {     
                txtCreditCode.text = object[0];
                txtCreditName.text = object[1];
                txtCreditPK.text = object[3];
            }                                                    
        break ;
        case 'Debit Account':
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=&comm_code=&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_600100150_v2_acc";
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
           if(object!=null)
            {     
                txtDebitCode.text = object[0];
                txtDebitName.text = object[1];
                txtDebitPK.text = object[3];
            }                                                    
        break ;
	case "To PL":
        var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=sp_sel_pl_popup_plpk&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                txtToPL_PK.SetDataText(object[2])// PL PK
                txtToPL_CD.SetDataText(object[0])//PL Code
                txtToPL_Name.SetDataText(object[1])//PL Name
            }
        }
		
		break
	case "From PL":
        var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=sp_sel_pl_popup_plpk&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                txtFromPL_PK.SetDataText(object[2])// PL PK
                txtFromPL_CD.SetDataText(object[0])//PL Code
                txtFromPL_Name.SetDataText(object[1])//PL Name
            }
        }
		
		break
	}
}
//------------------------------------------
function OnReset_SetGrid(idobj)
{
    switch(idobj)
    {
        case 1:
            txtToPL_CD.SetDataText("");
	        txtToPL_Name.SetDataText("");
	        txtToPL_PK.SetDataText("");
        break;
        case 2:
            txtCreditCode.SetDataText("");
	        txtCreditName.SetDataText("");
	        txtCreditPK.SetDataText("");
        break;
		case 3:
            txtFromPL_CD.SetDataText("");
	        txtFromPL_Name.SetDataText("");
	        txtFromPL_PK.SetDataText("");
        break;
        case 4:
            txtDebitCode.SetDataText("");
	        txtDebitName.SetDataText("");
	        txtDebitPK.SetDataText("");
        break;
    }
}
//-----------------------------------------------------
function OnSetGrid(idobj)
{
    var i;
	var fg = grdWhMapping.GetGridControl();
	switch(idobj)
    {
        case 1:
           for( i = 1 ; i < grdWhMapping.rows; i++)
	        {
		        if(fg.isSelected(i) == true)
		        {
			        grdWhMapping.SetGridText(i, G_PL_CREDIT, txtToPL_PK.text);
			    }
	        }
        break;
        case 2:
            for( i = 1 ; i < grdWhMapping.rows ; i++)
	        {
		        if(fg.isSelected(i) == true)
		        {
			        grdWhMapping.SetGridText(i, G_CREDIT_ACCOUNT, txtCreditCode.text);
			        grdWhMapping.SetGridText(i, G_CREDIT_ACC_PK, txtCreditPK.text);
		        }
	        }
        break;
        case 3:
            for( i = 1 ; i < grdWhMapping.rows ; i++)
	        {
		        if(fg.isSelected(i) == true)
		        {
			       grdWhMapping.SetGridText(i, G_PL_DEBIT, txtFromPL_PK.text);
		        }
	        }
        break;
         case 4:
            for( i = 1 ; i < grdWhMapping.rows ; i++)
	        {
		        if(fg.isSelected(i) == true)
		        {
			        grdWhMapping.SetGridText(i, G_DEBIT_ACCOUNT, txtDebitCode.text);
			        grdWhMapping.SetGridText(i, G_DEBIT_ACC_PK, txtDebitPK.text);
		        }
	        }
        break;
        case 5:
            for( i = 1 ; i < grdWhMapping.rows ; i++)
	        {
		        if(fg.isSelected(i) == true)
		        {
			        grdWhMapping.SetGridText(i, G_ACTIVE_FLAG, lstActiveFlag.value);
		        }
	        }
	    break;
        
    }
}
//====================================================================================

function OnSave()
{ 
	data_sel_600100150_v2.Call();	
}


//====================================================================================
 function OnDelete()
 {     
	if (confirm("Do you want to delete data?"))
	{
	    grdWhMapping.DeleteRow();
	    data_sel_600100150_v2.Call();	
	}
 }

//====================================================================================
function OnToggle(n)
{
    
        if(img.status == "show")
        {
            img.status = "hide";
            img.src = "../../../system/images/close_popup.gif";
		    img.alt="Hide month salary information";
		    tbset.style.display='';
        }
        else 
        {
            img.status = "show";
            img.src = "../../../system/images/iconmaximize.gif";
		    img.alt="Show month salary information";
		    tbset.style.display="none";
        }
       
    
}
//=============================================================
function LoadData()
{   
    if (confirm("Do you want to load transaction?"))
    {
        data_pro_600100150_v2.Call();
    }
}

//=======================================================
function OnSetALL(obj)
{
	if (obj==1)
	{
		if (confirm("Do you want to delete all data?"))
			data_pro_600100150_v2_5.Call();
	}
	else
	{
		if (confirm("Do you want to set active for  all data?"))
			data_pro_600100150_v2_6.Call();
	}
	
	
}
</script>
<body>  
	<!----------------------------loading transaction------------------------>
    <gw:data id="data_pro_600100150_v2" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>ac_pro_600100150_v2" > 
			<input>
			    <input bind="lstCompany" /> 
			    <input bind="dtMonth" />
			</input> 
			<output>
				<output bind="txtReturnValue" />
			</output>
			</dso> 
		</xml> 
	</gw:data>  
	<!------------------------------------------------------------------------------>
	<gw:data id="data_sel_600100150_v2" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="<%=l_user%>ac_sel_600100150_v2" procedure="<%=l_user%>ac_upd_600100150_v2" > 
				<input>
					<input bind="lstCompany" /> 
					<input bind="lstProGrp" />
					<input bind="txtItem" />
					<input bind="lstWHType" />
					<input bind="lstWH" />
					<input bind="lstInOutType" />
					<input bind="lstTrType" />
					<input bind="lstLine" />
					<input bind="lstActiveFlag_S" />
					<input bind="lstWHGrp" />
					<input bind="dtMonth_From" />
					<input bind="dtMonth_To" />
			    </input> 
				<output bind="grdWhMapping" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_pro_600100150_v2_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>ac_pro_600100150_v2_1" >
                <input>
                    <input bind="lstWHType" />
                    <input bind="lstCompany" /> 
                </input>
                <output>
                    <output bind="lstWH" />
                </output>
            </dso>
        </xml>
    </gw:data>
    
<%--    <!---------------------------------------------------------------->
    <gw:data id="data_pro_600100150_v2_5" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>ac_pro_600100150_v2_5" >
                <input>
                    <input bind="lstWHType" />
                    <input bind="lstCompany" /> 
                </input>
                <output>
                    <output bind="lstWH" />
                </output>
            </dso>
        </xml>
    </gw:data>--%>

    <!------------------------------------------------------------------>
    <gw:data id="data_pro_600100150_v2_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>ac_pro_600100150_v2_2" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="lstCompany" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_pro_600100150_v2_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>ac_pro_600100150_v2_3" > 
                <input> 
                    <input bind="lstCompany" />
                    <input bind="lstWHType" />
                </input>
	           <output>
	                <output bind="lstWH" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="data_pro_600100150_v2_4" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="list" procedure="<%=l_user%>ac_pro_600100150_v2_4" > 
			<input>
				<input bind="lstInOutType" />
			</input> 
			<output>
				<output bind="lstTrType" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	
	<!----------------------------delete------------------------>
    <gw:data id="data_pro_600100150_v2_5" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>ac_pro_600100150_v2_5" > 
			<input>
			    <input bind="lstCompany" /> 
			    <input bind="dtMonth" />
			</input> 
			<output>
				<output bind="txtReturnValue" />
			</output>
			</dso> 
		</xml> 
	</gw:data>  
	<!----------------------------set flag------------------------>
    <gw:data id="data_pro_600100150_v2_6" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>ac_pro_600100150_v2_6" > 
			<input>
			    <input bind="lstCompany" /> 
			    <input bind="dtMonth" />
			</input> 
			<output>
				<output bind="txtReturnValue" />
			</output>
			</dso> 
		</xml> 
	</gw:data>  
	<!----------------------------copy-------------------------------------->
    <table    width="100%" style="height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%" >
                    <tr style="height: 2%">
                         <td  align="right" style="width:8%">
                          <img status="show" id="img" alt="Show month salary information" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle(2)"  />&nbsp;&nbsp;&nbsp;&nbsp;
                                 Company </td>
                        <td align="left" style="white-space: nowrap;width:15%">
                           <gw:list id="lstCompany" styles="width: 100%; " onchange="data_pro_600100150_v2_3.Call()">
                               <data>
                                    <%= CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>
                               </data>
                           </gw:list>
                        </td>
                        <td align="right" style="width:5%">
                            Line
                        </td>
                        <td align="left" style="white-space: nowrap;width:15%">
                              <gw:list id="lstLine" styles="width: 100%; " value="ALL" >
                              <data><%= CtlLib.SetListDataSQL("SELECT PK, LINE_NAME FROM TLG_PB_LINE WHERE DEL_IF=0 AND NVL(USE_YN,'N')='Y'")%>|ALL|Select All</data>
                           </gw:list>
                        </td>
						<td style="width:5%" align="right">
							Item
						</td>
                        <td style="width: 15%">
                            <gw:list id="lstProGrp" styles="width:100%"  />
                        </td>
                        <td style="width: 17%" >
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 11%" align="right" >
							 <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt' /> 
						</td>
						<td style="width: 3%">
							<gw:imgbtn id="btnSearch" img="search" alt="search" text="search" onclick="OnSearch()" />
						</td>
						<td style="width: 3%">
							<gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
						</td>
						<td style="width: 3%">
							 <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
						</td>   
				    </tr> 
				    <tr style="height: 2%">
                         <td  align="right" >
                            Warehouse </td>
                        <td align="left" style="white-space: nowrap">
                           <gw:list id="lstWHType" styles="width: 100%; " onchange="data_pro_600100150_v2_1.Call()">
                               <data>
                                    <%= CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>
                               </data>
                           </gw:list>
                        </td>
                        <td align="right" colspan=2>
                            <gw:list id="lstWH" styles="width: 100%; " />
                        </td>
						<td  align="right">
							Transaction
						</td>
                        <td >
                            <gw:list id="lstInOutType" styles="width: 100%" value="ALL" onchange="data_pro_600100150_v2_6.Call()"  >
                             <data>|I|I * IN|O|O * OUT|ALL|Select All</data> </gw:list>
                        </td>
                        <td >
                            <gw:list id="lstTrType" styles="width: 100%"   value="ALL"  >
	                            <data>
                                    <%= CtlLib.SetListDataSQL("SELECT  a.trans_code, a.trans_code||' * '||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and ( trans_type='I' or trans_type='O' ) order by a.trans_code")%>|ALL|Select All
                                </data></gw:list>
                        </td>
                        <td align="right" > Active Flag 
						</td>
						<td colspan=3>
						   <gw:list id="lstActiveFlag_S" styles="width: 100%"   value="ALL"  >
	                                        <data>|Y|Yes|N|No|ALL|Select All</data></gw:list>
						</td>
						
				    </tr>  
				    <tr style="height: 2%">
                         <td align="right">WH Group</td>
					<td align="left" colspan="3"><gw:list id="lstWHGrp" styles="width:100%; " onchange="OnSearch()" />
					</td>
                     <td align="right" >Month
					</td>
					<td  align="right" >
					<gw:datebox id="dtMonth_From" lang="1" type="month" />
					</td>
					<td  align="right"><b>~</b>
					</td>
					<td  align="left">
					<gw:datebox id="dtMonth_To" lang="1" type="month" />
					</td>    
						
				    </tr>  
				    <tr style="height: 5%; background-color:#FFFFCC">
				        <td id="tbset" colspan=12 valign="top" style="display:none" align="center" >
				            <table  width="100%"  >
					            <tr style="height: 50%">
	                                
									<td  width="15%" align="right" ><a title="Click here to select PL" onclick="OnPopUp('From PL')" href="#tips">PL Debit</a></td>
	                                <td width="10%" align="left" ><gw:textbox id="txtFromPL_CD" styles="width:100%;" /></td>
	                                <td width="15%" align="left" ><gw:textbox id="txtFromPL_Name" styles="width:100%;" /></td>			
	                                <td width="5%" align="left" ><gw:imgBtn id="btnRSet_FromPL" img="reset" onclick="OnReset_SetGrid(3)" /></td>
	                                <td width="5%" align="left" ><gw:icon id="btnFill_FromPL" text="Fill" onclick="OnSetGrid(3)" /></td>
	                                
									<td  width="10%" align="right" ><a title="Click here to select PL" onclick="OnPopUp('To PL')" href="#tips">PL Credit</a></td>
	                                <td width="10%" align="left" ><gw:textbox id="txtToPL_CD" styles="width:100%;" /></td>
	                                <td width="15%" align="left" ><gw:textbox id="txtToPL_Name" styles="width:100%;" /></td>			
	                                <td width="5%" align="left" ><gw:imgBtn id="btnRSet_ToPL" img="reset" onclick="OnReset_SetGrid(1)" /></td>
	                                <td width="10%" align="left" colspan=2 ><gw:icon id="btnFill_ToPL" text="Fill" onclick="OnSetGrid(1)" /></td>
	                                
                                </tr>	
                                <tr style="height: 50%">
	                                <td align="right" ><a title="Click here to select Debit account" onclick="OnPopUp('Debit Account')" href="#tips">Account Debit</a></td>
	                                <td align="left" ><gw:textbox id="txtDebitCode" styles="width: 100%" /></td>
	                                <td align="left" ><gw:textbox id="txtDebitName" styles="width: 100%"  /></td>			
	                                <td align="left" ><gw:imgBtn id="btnRSet_DebitCode" img="reset" onclick="OnReset_SetGrid(4)" /></td>
	                                <td align="left" ><gw:icon id="btnFill_Debit" text="Fill" onclick="OnSetGrid(4)" /></td>
	                                
	                                <td align="right" ><a title="Click here to select Credit account" onclick="OnPopUp('Credit Account')" href="#tips">Account Credit</a></td>
	                                <td align="left" ><gw:textbox id="txtCreditCode" styles="width: 100%"  /></td>
	                                <td align="left" ><gw:textbox id="txtCreditName" styles="width: 100%"  /></td>			
	                                <td align="left" ><gw:imgBtn id="btnRSet_CreditCode" img="reset" onclick="OnReset_SetGrid(2)" /></td>
	                                <td align="left" ><gw:icon id="btnFill_Credit" text="Fill" onclick="OnSetGrid(2)" /></td>
									<td align="left"  width="5%"><gw:button id="btnDelALL" alt="Delete ALL" onclick="OnSetALL(1)" /></td>
                                </tr>
                            	<tr style="height: 50%">
                                    <td colspan=3 align=right style="color:red;font-size:10pt; font-weight:700">
                                        Load Transaction
                                    </td>
                                    <td colspan=2 >
                                        <gw:datebox id="dtMonth" lang="1" type="month" />
                                    </td>
                                    <td colspan=1>
                                        <gw:imgbtn id="btnProcess" img="process" alt="Load Transaction" text="process" onclick="LoadData()" />
                                    </td>
                                    <td align=right >Active Flag</td>
                                    <td >
                                        <gw:list id="lstActiveFlag" styles="width: 100%"   value="-1"  >
	                                        <data>|-1|Yes|0|No</data></gw:list>
                                    </td>
                                    <td></td>
                                    <td><gw:icon id="btnFill_Active" text="Fill" onclick="OnSetGrid(5)" />
									</td>
									<td align="left"  width="5%"><gw:button id="btnSetALLFlag" alt="Set Active ALL" onclick="OnSetALL(2)" /></td>
                                    
                                 </tr>
    				        </table>
                       </td>       
				    </tr>
                    <tr style="height: 96%">
                        <td colspan="12">
                            <gw:grid id='grdWhMapping'
                                    header='_PK|Trans Name|Warehouse|_Item Group|Item Code|Item Name|Debit Account|Credit Account|Debit PL|Credit PL|Line Name|Ref Warehouse|_DEBIT_ACC_PK|_CREDIT_ACC_PK|_WH_PK|Department|CLOSE MONTH|Active Flag|Description'
                                    format='0|0|0|0|0|0|0|0|2|2|0|0|0|0|0|0|0|3|0'
                                    aligns='0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0'
                                    check='||||||||||||||||||'
                                    editcol='0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0'
                                    widths='1000|2565|1500|3120|1965|2925|1700|1700|1700|1700|1700|2000|1000|1000|1000|1000|1500|1000|1000'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                    />
                                   
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</body>
<gw:textbox id="txtUser_PK" text="" style="display: none" />
<gw:textbox id="txtWH" text="" style="display: none" />
<gw:textbox id="txtLine" text="" style="display: none" />
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<gw:textbox id="txtCreditPK" style="display:none" />
<gw:textbox id="txtDebitPK" style="display:none" />
<gw:textbox id="txtToPL_PK" style="display:none" />
<gw:textbox id="txtFromPL_PK" style="display:none" />
</html>
