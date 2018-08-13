<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM INQUIRY</title>
</head>

<script>

//------------------------------------------------------------ 
function BodyInit()
{
    txtUser_PK.text = "<%=session("USER_PK")%>";
    txtCompanyPK.text = "<%=session("COMPANY_PK")%>";   
    System.Translate(document); 
    BindingDataList();
    OnChangeModify();
    //----------------------
    lst_agci00060_2.Call();
    //----------------------    
} 

//------------------------------------------------------------

function BindingDataList()
{
	var data = '';
	
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' and leaf_yn = 'Y' order by grp_cd " ) %> ";       
    grdItem.SetComboFormat(1,data);	
    
    data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompanyList.SetDataText(data);
    //cboCompanyList.value='ALL';
  
}	
//------------------------------------------------------------
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode(); 
      
   txtGroup_PK.text  = '' + obj.oid; 

   OnSearch(2);
}

//-------------------------------------------------------------- 
function OnDataReceive(p_oData)
{
    switch (p_oData.id)
    {
        case 'data_agci00060':
            //OnSearch(2);
        break;

        case 'data_agci00060_1':
            OnChangeModify();
        break;
		        
        case 'pro_agci00060' :
            alert( txtReturnValue.text );
        break;
        
        case 'pro_agci00060_1' :
            alert( txtReturnValue.text );
             OnSearch(2);
        break;
        
         case 'lst_agci00060_2':
            cboCompanyList.SetDataText(txtReturnValue.text + "||");    
            cboCompanyList.value = txtCompanyPK.text;
            data_agci00060.Call();             
         break; 
    }
}
//--------------------------------------------------------
function OnSearch(obj)
{      	  
    if(obj=='1')
    {
        data_agci00060.Call();   
    }else
    {
       data_agci00060_1.Call("SELECT");   
    }
     
}
//--------------------------------------------------------
function onExcel()
{
    if ( radSearchPage.value == 1 )
    {
        var url =System.RootURL + '/reports/ag/ci/rpt_agci00060.aspx?Item_CD=' + txtItem.text+'&Item_GP=' +txtGroup_PK.text;
        window.open(url);    
    }
    else
    {
        var url =System.RootURL + '/reports/ag/ci/rpt_agci00060.aspx?Item_CD=' + txtItem.text+'&Item_GP=' +txtGroup_PK.text;
        window.open(url);    
    }     
}
//--------------------------------------------------------
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}

//-------------------------------------------------------
 function OnBFEdit(grid)
 {
    col = event.col ;
    
    if ( col == 1 && chkModify.value == 'N' && radSearchPage.value == '1' )
    {
            grid.GetGridControl().Col = 2;  
    }    
 }
//====================================================================== 
 function OnProcess()
 {
    if ( txtGroup_PK.text != '' )
    {
        if ( confirm("Are you want to generate spec for item ?") )
        {
            pro_agci00060.Call();
        }    
    }    
 }
 //====================================================================== 
 function OnLoadName()
 {
    pro_agci00060_1.Call()
 }
//====================================================================== 

 function OnSave()
 {
        if ( confirm("Are you want to save change of item ?") )
        {
            data_agci00060_1.Call();
        }     
 }
//======================================================================

function OnChangeModify()
{
   // if ( radSearchPage.value == '1' )
   // {
        if(chkModify.value=='Y')
        {
             ibtnProcess.SetEnable(true);
             ibtnSave.SetEnable(true);
        }
        else
        {
             ibtnProcess.SetEnable(false);
             ibtnSave.SetEnable(false); 
        }  
   // }
    //else
   // {
    //    chkModify.value = 'N' ;
	//	ibtnProcess.SetEnable(false);
    //    ibtnSave.SetEnable(false); 
    //}      
}

//====================================================================== 

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="lst_agci00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00060_2" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="st_lg_sel_agci00060" > 
                <input>
                    <input bind="cboCompanyList"/>     
                    <input bind="txtUser_PK" />               
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_agci00060_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agci00060_1"  procedure="st_lg_upd_agci00060_1"  > 
                    <input bind="grdItem" > 
                        <input bind="radSearchPage" />
                        <input bind="txtItem" /> 
                        <input bind="txtGroup_PK" />
						<input bind="chkWHAcc" />
						<input bind="chkExAcc" />
						<input bind="chkRevAcc" />
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_agci00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00060" > 
                <input>
                    <input bind="radSearchPage" />
                    <input bind="txtGroup_PK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
   <!---------------------------------------------------------------->
    <gw:data id="pro_agci00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00060_1" > 
                <input>
                    <input bind="radSearchPage" />
                    <input bind="txtGroup_PK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
       
        <tr style="height: 100%">
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                       <td style="width: 30%" align="right">
                            Company
                        </td>
                        <td style="width: 70%">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="data_agci00060.Call()" />
                        </td>
                         <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnlSearch" img="search" alt="Search" text="Search" onclick="OnSearch('1')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="3">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
                        </td>
                    </tr>
                </table>                
            </td>
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td style="width: 5%; white-space: nowrap">
                            Item</td>
                        <td style="width: 55%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('2')" onkeypress="Upcase()" />
                        </td>
                        <td style="width: 18%; white-space: nowrap">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnSearch('2')"> 
                                <span value="1">Item</span> 
                                <span value="2">ST Item</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(2)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Export to Excel" text="Export to Excel"
                                onclick="onExcel()" />
                        </td>
                        <td style="width: 18%; white-space: nowrap; background-color: CCFFFF" align="center">
                            Modify
                            <gw:checkbox id="chkModify" defaultvalue="Y|N" value="N" onchange="OnChangeModify()" />
                        </td>
                        <td style="width: 1%; background-color:CCFFFF" align="right">
                            <gw:imgbtn id="ibtnProcess" img="process" alt="View Spec" text="View Spec" onclick="OnProcess()" />
                        </td>
                        <td style="width: 1%; background-color:CCFFFF" align="right">
                            <gw:icon id="btnCreate" img="2" text="Load Name" styles="width:100%;" onclick="OnLoadName()" />
                        </td>
                        <td style="width: 1%; background-color: CCFFFF" align="right">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" text="View Spec" onclick="OnSave()" />
                        </td>
                    </tr>
					 <tr style="height: 5%">
 						<td colspan="9" align="center" >
                            W/H ACC
                            <gw:checkbox id="chkWHAcc" defaultvalue="Y|N" value="N" onchange="OnSearch(2)" />
							Expense ACC
                            <gw:checkbox id="chkExAcc" defaultvalue="Y|N" value="N" onchange="OnSearch(2)" />
							Rev ACC
                            <gw:checkbox id="chkRevAcc" defaultvalue="Y|N" value="N" onchange="OnSearch(2)" />
						</td>                         			
					</tr>
                     <tr style="height: 90%">
                        <td colspan="9">
                            <gw:grid id="grdItem" header="_pk|Group|Item Code|Item Name|F Name 01|F Name 02|UOM|Active|_Type|_ACCT_PK|W/H Acc|_EXPENSE_PK|Expense Acc|_Revenue_pk|Revenue Acc|_Spec8|Crt By|Mod By"
                                format="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0" 
								aligns="0|0|0|0|0|0|1|0|3|0|0|0|0|0|0|0|0|0"
                                editcol="0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0" 
								widths="0|2000|2000|3500|2000|2000|800|800|1200|0|2000|0|2000|0|2000|0|0|0"
                                styles="width:100%; height:100%" 
								onbeforeedit="OnBFEdit(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtGroup_PK" styles='width:100%;display:none;' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtUser_PK" text="" style="display: none" />
    <gw:textbox id="txtCompanyPK" text="" style="display: none" />
</body>
</html>
