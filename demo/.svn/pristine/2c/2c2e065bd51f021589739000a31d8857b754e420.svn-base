<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>ALLOCATION RATIO</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK = 0,
    G1_CD = 1,
    G1_NM = 2 ; 

var G2_whItem_pk                =  0,
    G2_WH_Type                  =  1,
    G2_Trans_Type               =  2, 
	G2_Credit_Account_code      =  3,
    G2_Credit_Account           =  4,
	G2_Debit_Account_code       =  5,
    G2_Debit_Account            =  6,
	G2_Credit_PL_code           =  7,
    G2_Credit_PL                =  8,
	G2_Debit_PL_code            =  9,
    G2_Debit_PL                 =  10,
    G2_ACC_YN                   =  11,
	G2_USE_YN                   =  12,
	G2_Remark                   =  13,
	G2_CreditAccountPK          =  14,
	G2_DebitAccountPK           =  15,
	G2_CreditPLPK               =  16,
	G2_DebitPLPK                =  17,
	G2_CostingItemgrpPk         =  18;
//------------------------------------------------------------


function BodyInit()
{
    System.Translate(document);  // Translate to language session
    txtUser_PK.text = "<%=session("USER_PK")%>";
	BindingDataList();
	lst_kbal00010_4.Call();
}

//====================================================================================
function BindingDataList()
{
    
	<%=CtlLib.SetGridColumnComboFormat("grdWhMapping",1,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACT00001'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	<%=CtlLib.SetGridColumnComboFormat("grdWhMapping",2,"SELECT    a.trans_code, a.trans_name  FROM tlg_in_trans_code a, tlg_in_warehouse c WHERE a.del_if = 0  AND c.del_if(+) = 0 AND a.tlg_in_warehouse_pk = c.pk(+) AND a.TYPE in ('I','O') ORDER BY a.TYPE, a.trans_code")%>;
   var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACT00001'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>|ALL|ALL";
   lsWhType.SetDataText(ls_data);
  
}
//====================================================================================

function OnSearch(pos)
{
   
		 switch (pos)
    {
        case 'grdSTitem':
            data_600100140_1.Call("SELECT");
        break;
		case 'grdWhMapping':
			data_600100140.Call("Select");
			break;
			
        
          		
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        
         case "lst_kbal00010_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
			lst_600100140_5.Call();
			
          break; 
          case "dso_Copy":
				alert(txtReturn.text);
				break;
		  case "lst_600100140_5":
				 cboGroupQuery.value ='';
				 break;
				
    }
}


//====================================================================================

function OnSave()
{ 
	data_600100140.Call();	
}


//====================================================================================
 function OnDelete(index)
 {     
	
 }
//====================================================================================
 
function OnUnDelete()
{              
    
}

//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      
}

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'grdWhMapping' :
				if(txtCostingItemgrpPk.text == ''){
					alert("need choose item");
					break;
				}
				grdWhMapping.AddRow(); 
				grdWhMapping.SetGridText(grdWhMapping.rows - 1, G2_CostingItemgrpPk, txtCostingItemgrpPk.text);
				grdWhMapping.SetGridText(grdWhMapping.rows - 1, G2_ACC_YN, '-1');
				grdWhMapping.SetGridText(grdWhMapping.rows - 1, G2_USE_YN, '-1');
				break;
		
        
       
                        
    }    
 }
//====================================================================================
function OnSelectItem()
{
	if(grdSTitem.row >0)
	{
		 txtCostingItemgrpPk.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
		 OnSearch('grdWhMapping');	 
	}

}

//----------------------------------------------------------------
function Popup_AccDtl(index)
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "511" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + cboCompanyList.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	var i = 0;
    if (o != null)
    {
		
        if(o[0] != 0)
        {
			if(index =='C'){
				
					grdWhMapping.SetGridText(grdWhMapping.row, G2_CreditAccountPK, o[3]);	
					 grdWhMapping.SetGridText(grdWhMapping.row, G2_Credit_Account_code, o[0]);
					grdWhMapping.SetGridText(grdWhMapping.row, G2_Credit_Account, o[1]);				
				
			}
			if(index =='D'){
				
					grdWhMapping.SetGridText(grdWhMapping.row, G2_DebitAccountPK, o[3]);	
				   grdWhMapping.SetGridText(grdWhMapping.row, G2_Debit_Account_code, o[0]);
					grdWhMapping.SetGridText(grdWhMapping.row, G2_Debit_Account, o[1]);				
				
			}
            
        }
        
    }
    
}
//----------------------------------------------------------------
function popup_pl(index){
				var fpath =  System.RootURL + "/standard/forms/60/17/60170001_pl_popup.aspx?";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						
					   
					   if(index =='C'){
				
							grdWhMapping.SetGridText(grdWhMapping.row, G2_CreditPLPK, object[0]);	
							grdWhMapping.SetGridText(grdWhMapping.row, G2_Credit_PL_code	, object[1]);			
							grdWhMapping.SetGridText(grdWhMapping.row, G2_Credit_PL, object[2]);				
				
					}
					if(index =='D'){
						
							grdWhMapping.SetGridText(grdWhMapping.row, G2_DebitPLPK, object[0]);
							grdWhMapping.SetGridText(grdWhMapping.row, G2_Debit_PL_code, object[1]);								
							grdWhMapping.SetGridText(grdWhMapping.row, G2_Debit_PL, object[2]);				
						
					}
					}
				
				}
}

function SelectGrdWhMapping(){
	var l_row = event.row ;
	 var l_col = event.col ;
	 
/*	 switch (l_col)
	{
		case G2_Credit_Account:
			Popup_AccDtl('C');
		break;
		case  G2_Debit_Account:
			Popup_AccDtl('D');
			break;
		case  G2_Credit_PL:
			popup_pl('C');
			break;
		case  G2_Debit_PL:
			popup_pl('D');
			break;
	}*/
		if(l_col ==  G2_Credit_Account  ||  l_col  == G2_Credit_Account_code){
			Popup_AccDtl('C');
	}
	
	if(l_col ==  G2_Debit_Account_code  ||  l_col  == G2_Debit_Account){
			Popup_AccDtl('D');
	}
	if(l_col ==  G2_Credit_PL_code  ||  l_col  == G2_Credit_PL){
			popup_pl('C');
	}
	
	if(l_col ==  G2_Debit_PL_code  ||  l_col  == G2_Debit_PL){
			popup_pl('D');
	}
	
	 
}

//====================================================================================
 function OnDelete(index)
 {     
	if(index=="grdWhMapping")
	{
		if(confirm("Do you want to delete this data?"))  
		{ 
			grdWhMapping.DeleteRow();
			OnSave();
		}
	} 
 }
//========================================popup copp\y============================================
function popupCopy(){
	var fpath =  System.RootURL + "/standard/forms/60/01/600100140_1_Copy_popup.aspx?t="+txtUser_PK.text;
	var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
	
	if ( object != null ) 
	{
		
		txtItemGroupM.text = object;
		dso_Copy.Call();
	
	}
	
	
}

</script>
<body>  

	<!------------------------------------------------------------------>
    <gw:data id="lst_kbal00010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_kbal00010_4" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
	
	<!----------------------------------------------------------------->
	  
    <gw:data id="lst_600100140_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_600100140_5" > 
                <input> 
                    <input bind="cboCompanyList" />
                </input>
	           <output>
	                <output bind="cboGroupQuery" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    
	<!------------------------------------------------------------------>
    <gw:data id="data_600100140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="lg_sel_600100140_1" > 
                <input>
                    <input bind="cboCompanyList" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" />                   
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
	  <gw:data id="data_600100140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,11,12,13,14,15,16,17,18" function="ac_sel_600100140" procedure="ac_upd_600100140" > 
                <input>
                    <input bind="txtCostingItemgrpPk" /> 
					<input bind="lsWhType" /> 
					
                                   
                </input> 
                <output bind="grdWhMapping" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	
	<!----------------------------copy-------------------------------------->
	 <gw:data id="dso_Copy" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="AC_PRO_600100140_PROCESS" >
                <input> 
					<input bind="txtItemGroupM"/>
                    <input bind="txtIndex"/>	
					<input bind="txtCostingItemgrpPk"/>	
							
                </input>  
                <output>
                     <output bind="txtReturn"/>
				</output> 
            </dso> 
        </xml> 
    </gw:data>
	
	

    <table    width="100%" style="height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="lst_600100140_5.Call()"  />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
						<td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
					
                                 
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id="grdSTitem" 
									 header="_PK|Prod Group ID|Group Name" 
									 format="0|0|0" aligns="0|0|0" defaults="||"
									 editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
									 param="0,1,2"
									 oncellclick="OnSelectItem()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%" >
                    <tr style="height: 5%">
                         <!--<td style="width: 10%">
                            Month
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
                        </td> -->
						
						<td style="width:5%">
							WH Type
						</td>
						<td style="width: 20%" align="right">
							 <gw:list id="lsWhType" styles="width:100%" onchange="OnSearch('grdWhMapping')" />
						</td>
						
						<td style="width:50%"  align="right"> 
							 <table style="width: 20%; height: 100%" >
								<tr>
										<td style="width: 1%" align="right">
									<gw:icon id="idBtnCopy" img="2" text="Copy" styles='width:100%' onclick="popupCopy()" />
									</td>
									 <td style="width: 1%" align="right">
										<gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('grdWhMapping')" />
									</td>
									<td style="width: 1%">
										 <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
									</td>                       
								   
									<td style="width: 1%">
										<gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('grdWhMapping')" />
									</td>
									
								</tr>
							 </table>
						</td>
                         
                    <tr style="height: 95%">
                        <td colspan="8">
                             <gw:grid id='grdWhMapping'
                                header='_whItem_pk|WH Type|Trans Type|C Account Code |Credit Account|D Account Code|Debit Account|C PL Code|Credit PL|D PL Code|Debit PL|ACC YN|USE YN|Remark|_CreditAccountPK|_DebitAccountPK|_CreditPLPK|_DebitPLPK|_CostingItemgrpPk'
                                format='0|0|0|0|0|0|1|0|0|0|0|3|3|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='||||||||||||||||||'
                                editcol='1|1|1|1|1||1|1|1|1|1|1|1|1|1|1||1|11|0'
                                widths='0|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0|0'
                                sorting='T'
                                styles='width:100%; height:100%'
								oncelldblclick="SelectGrdWhMapping()" 
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</body>
<gw:textbox id="txtUser_PK" text="" style="display: none" />
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<gw:textbox id="txtSTitemQuery" text="" style="display: none" />
<gw:textbox id="txtCostingItemgrpPk" text="" style="display: none" />
<gw:textbox id="txtItemGroupM" text="" style="display: none" />
<gw:textbox id="txtIndex" text="1" styles="display:none;" />
<gw:textbox id="txtReturn" text="" styles="display:none;" />
</html>
