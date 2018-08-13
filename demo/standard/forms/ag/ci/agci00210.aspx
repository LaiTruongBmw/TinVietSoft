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
 
    //----------------------
    lst_agci00210_2.Call();
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
        case 'data_agci00210':
            //OnSearch(2);
        break;
              
        case 'lst_agci00210_2':
            cboCompanyList.SetDataText(txtReturnValue.text + "||");    
            cboCompanyList.value = txtCompanyPK.text;
            data_agci00210.Call();             
        break; 
    }
}
//--------------------------------------------------------
function OnSearch(obj)
{      	  
    if(obj=='1')
    {
        data_agci00210.Call();   
    }else
    {
       data_agci00210_1.Call("SELECT");   
    }
     
}
//--------------------------------------------------------
function onExcel()
{
       
}
//--------------------------------------------------------
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}

 
 
//====================================================================== 

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="lst_agci00210_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00210_2" > 
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
    <gw:data id="data_agci00210" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="st_lg_sel_agci00210" > 
                <input>
                    <input bind="cboCompanyList"/>     
                    <input bind="txtUser_PK" />               
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_agci00210_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agci00210_1"  procedure="st_lg_upd_agci00210_1"  > 
                    <input bind="grdItem" >                     
                        <input bind="txtItem" /> 
                        <input bind="txtGroup_PK" />						 
                    </input> 
                    <output bind="grdItem" /> 
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
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="data_agci00210.Call()" />
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
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(2)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Export to Excel" text="Export to Excel"
                                onclick="onExcel()" />
                        </td>                                               
                        <td style="width: 19%" align="right">                             
                        </td>
                        <td style="width: 1%; background-color: CCFFFF" align="right">
                             
                        </td>
                    </tr>					 
                     <tr style="height: 90%">
                        <td colspan="9">
                            <gw:grid id="grdItem" header="_pk|Group|Item Code|Item Name|F Name 01|F Name 02|UOM|Active|_Type|_ACCT_PK|W/H Acc|_EXPENSE_PK|Expense Acc|_Revenue_pk|Revenue Acc|_Spec8|Crt By|Mod By"
                                format="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0" 
								aligns="0|0|0|0|0|0|1|0|3|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								widths="0|2000|2000|3500|2000|2000|800|800|1200|0|2000|0|2000|0|2000|0|0|0"
                                styles="width:100%; height:100%" />
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
