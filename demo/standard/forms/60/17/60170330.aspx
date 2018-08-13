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

var G2_ALLOC_RATIO_PK       = 0,
    G2_SEQ                  = 1,
    G2_TAC_ABTRACGRP_PK     = 2, 
    G2_GRP_NM               = 3,
    G2_RATIO                = 4,
    G2_TCO_STITEM_PK        = 5,
    G2_MONTH                = 6,
    G2_REMARK               = 7;
//------------------------------------------------------------
var checkAll = 'F';
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    
    var ctrl = grdRatio.GetGridControl();        
    ctrl.ColFormat(G2_RATIO)    = "###,###,###.####R" ;
    //----------------------------
    lst_kbal00010_4.Call();
	var month  = "<%=Request.querystring("p_month")%>"
	var group_id =  "<%=Request.querystring("group_id")%>"
	
	if( group_id !=''){
	
	 dtMonth.value = month;
	 dtMonth2.value =  month;
	 txtSTitemQuery.text= group_id;
	
	 
	 }
}

function OnSelectItem(p_pos)
{
	switch (p_pos)
    {
		case 'WIP':
			if(grdSTitem.row >0)
			{
			 txtSTItemPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
			 txtSTCode.text = grdSTitem.GetGridData( grdSTitem.row, G1_CD );
			 txtSTName.text = grdSTitem.GetGridData( grdSTitem.row, G1_NM );
			}
			OnSearch('grdRatio');
		break;
		case 'BY_PROD':
			if(grdSTitem2.row >0)
			{
			 txtSTItemPK2.text = grdSTitem2.GetGridData( grdSTitem2.row, G1_PK );
			 txtSTCode2.text = grdSTitem2.GetGridData( grdSTitem2.row, G1_CD );
			 txtSTName2.text = grdSTitem2.GetGridData( grdSTitem2.row, G1_NM );
			}
			OnSearch('grdRatio2');
		break;
	}
    
                 
}
//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSTitem':
            data_kbal00010.Call("SELECT");
        break;
        case 'grdSTitem2':
            data_kbal00010_t2.Call("SELECT");
        break;
        case 'grdRatio': 
           
                data_kbal00010_1.Call("SELECT");   
           
        break;     
		case 'grdRatio2': 
           
             data_kbal00010_1_t2.Call("SELECT");   
           
        break;      	
		 break;    
		case 'REGISTERRATIO' : 
				 dsoForm.Call("SELECT");
				 break;
          		
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_kbal00010_1":
         
        break; 
            
         case "lst_kbal00010_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
			 cboCompanyList2.SetDataText(txtReturnValue.text);   
           // cboCompanyList.value = "<%=session("COMPANY_PK")%>";
            lst_kbal00010_5.Call();
          break; 
          case "pro_kbal00010":
            alert(txtReturnValue.text);
            OnSearch('grdRatio');
          break;
        
    }
}

function Validate()
{   
   return true;
}

//====================================================================================

function OnSave(p_tab)
{ 
		switch (p_tab)
    {
	case 'WIP' : 
				for(var i =0 ; i<grdRatio.rows; i++)
				{
					if(grdRatio.GetGridData(i,G2_ALLOC_RATIO_PK) =="")
					{
						grdRatio.SetRowStatus(i,32);
					}
				}             
				flag='save';
				data_kbal00010_1.Call();
				break;
     case  'BY_PROD' : 
				for(var i =0 ; i<grdRatio2.rows; i++)
				{
					if(grdRatio2.GetGridData(i,G2_ALLOC_RATIO_PK) =="")
					{
						grdRatio2.SetRowStatus(i,32);
					}
				}             
				flag='save';
				data_kbal00010_1_t2.Call();    
				break;
	case 'REGISTERRATIO' : 

				for (var i =1;i< idGrid.rows;i++){

						if(idGrid.GetGridData(i,0)==""){
						idGrid.SetRowStatus( i , 48);
						}
				}
				dsoForm.Call();
				break;
	 }
}

//====================================================================================
function OnProcess()
{
    if(txtSTItemPK.text != "")
    {     
         pro_kbal00010.Call()
    }
}

//====================================================================================
 function OnDelete(index)
 {     
	if(index=="WIP")
	{
		if(confirm("Do you want to delete this data?"))  
		{ 
			grdRatio.DeleteRow();
			OnSave("WIP");
		}
	} else
	{
		if(confirm("Do you want to delete this data?"))  
		{ 
			grdRatio2.DeleteRow();
			OnSave("BY_PROD");
		}
	
	}
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
    function tabCurrent1(){
	var  idx = tab.GetCurrentPageNo();

	switch (idx){
		
		case 2:  OnSearch('REGISTERRATIO'); break;
	}
	
}

//================popup=============================
function OnPopup(obj, index)

{

		if((obj=='PL' && index =='0')|| (idGrid.col ==4 && obj=='PL') )
		{
			var fpath =  System.RootURL + "/standard/forms/60/17/60170001_pl_popup.aspx?";
			var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null && index =='0' ) 
			{
				if (object[0] != 0)
				{
					txtTAC_APPL_PK.SetDataText(object[0]);//pk
					
					txt_PL_CD_NAME.SetDataText(object[1]+'-'+object[2]);//id
				}
				OnSearch('REGISTERRATIO');
			}
			
			if ( object != null && index =='1' ) 
			{
				if (object[0] != 0)
					{
						
						
						if(chkAll.GetData()=='T'){
							
							
								for(var i=1 ; i< idGrid.rows ; i++){
									idGrid.SetGridText(i, 4, object[1]+'-'+object[2]);
									idGrid.SetGridText(i, 7, object[0]);
								}
							
						}
						else
						{
						
								idGrid.SetGridText(idGrid.row, 4, object[1]+'-'+object[2]);
								idGrid.SetGridText(idGrid.row, 7, object[0]);
								
							
						}
					}
			}
			
		}
	
	
}

//==================

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
     <!------------------------------------------------------------------>
    <gw:data id="lst_kbal00010_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_kbal00010_5" > 
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
    <gw:data id="data_kbal00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="lg_sel_kbal00010" > 
                <input>
                    <input bind="cboCompanyList" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" />     
					<input bind = "chkRatio"/>
					<input bind = "dtMonth"/>
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!----------------------------auto-insert---------------------------------------->
    <gw:data id="pro_kbal00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_kbal00010" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="txtSTItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_kbal00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="lg_sel_kbal00010_1"  procedure="lg_upd_kbal00010_1"  > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="txtSTItemPK" />                  
                </input> 
                <output bind="grdRatio" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------tab 2------------------------------------------->
	  <!------------------------------------------------------------------>
    <gw:data id="lst_kbal00010_5_t2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_kbal00010_5" > 
                <input> 
                    <input bind="cboCompanyList2" />
                </input>
	           <output>
	                <output bind="cboGroupQuery2" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_kbal00010_t2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="lg_sel_kbal00010_t2" > 
                <input>
                    <input bind="cboCompanyList2" /> 
                    <input bind="cboGroupQuery2" /> 
                    <input bind="txtSTitemQuery2" />                   
                </input> 
                <output bind="grdSTitem2" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!----------------------------auto-insert---------------------------------------->
    <gw:data id="pro_kbal00010_t2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_kbal00010" > 
                <input>
                    <input bind="dtMonth2" />
                    <input bind="txtSTItemPK2" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_kbal00010_1_t2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="lg_sel_kbal00010_1_by_prod"  procedure="lg_upd_kbal00010_1"  > 
                <input>
                    <input bind="dtMonth2" /> 
                    <input bind="txtSTItemPK2" />                  
                </input> 
                <output bind="grdRatio2" /> 
            </dso> 
        </xml> 
    </gw:data>
	
<!--- ---------------------------------REGISTERRATIO------------------------------------------>
	<gw:data id="dsoForm" onreceive="">
	<xml>
		<dso type="grid" parameter="0,1,5,6,7" function="ac_sel_60170480_popup" procedure="ac_UPD_60170480">
			<input bind="idGrid" >
				<input bind="dtPeriod" />
				<input bind="txtpCodeGroupPk"/>
				<input bind="txtTAC_APPL_PK"/>
			</input>
			<output bind="idGrid" />
			
			
		</dso>
	</xml>
	</gw:data>
	
	
 <gw:tab id="tab" onpageactivate="tabCurrent1()">
    <table  name="Wip Allocate Ratio" class="table" width="100%" style="height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="lst_kbal00010_5.Call()"  />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Prod
                        </td>
                        <td style="width: 79%" >
                            <gw:textbox id="txtSTitemQuery" styles="width:100%" onenterkey="OnSearch('grdSTitem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
						
                    </tr>   
					<tr>
					<td>
					</td>
						<td align="right">
								<table>
									<tr>
										 <td style="width: 10%" align="right">
											Month
										</td>
										<td style="width: 20%">
											<gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
										</td>
										
										<td  align="right">Ratio Y/N</td>
										<td><gw:checkbox id="chkRatio" value="N" defaultvalue="Y|N" /></td>
										</tr>
								</table>
						</td>
					</tr>
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id="grdSTitem" header="_PK|Prod Group ID|Group Name" format="0|0|0" aligns="0|0|0" defaults="||"
                                editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
                                param="0,1,2" oncellclick="OnSelectItem('WIP')" />
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
                       <!-- <td style="width: 20%">
                            <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
                        </td>-->
                         <td style="width: 1%">
                            <gw:imgbtn id="btnProcess" img="process" alt="Auto Get Ratio" text="Process" onclick="OnProcess()" />
                        </td>
                         <td style="width: 28%" align="right">
                            <gw:label id="txtSTCode" text="" styles="color:red" readonly="true" />
                        </td>
                        <td style="width: 30%">
                            <gw:label id="txtSTName" text="" styles="color:red" readonly="true" />
                        </td>                       
                        <td style="width:9%"> 
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('WIP')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('WIP')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="8">
                            <gw:grid id='grdRatio'
                                header='_ALLOC_RATIO_PK|Seq|_TAC_ABTRACGRP_PK|Manufacturing Cost Type|Index|_P_TLG_IT_STITEM_PK|_P_MONTH|Remark'
                                format='0|0|0|0|1|0|0|0'
                                aligns='0|0|0|0|0|0|0|0'
                                check='|||||||'
                                editcol='1|1|1|1|1|1|1|1'
                                widths='0|1000|0|2500|1500|0|0|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	 <table style="width: 100%; height: 100%" name="By Product Ratio">
           <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList2" styles="width:100%" onchange="lst_kbal00010_5.Call()"  />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20% ; display:none" align="right">
                            Group
                        </td>
                        <td style="width: 80%; display:none" colspan="2" >
                            <gw:list id="cboGroupQuery2" styles="width:100%" onchange="OnSearch('grdSTitem2')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Prod
                        </td>
                        <td style="width: 79%" >
                            <gw:textbox id="txtSTitemQuery2" styles="width:100%" onenterkey="OnSearch('grdSTitem2')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem2')" />
                        </td>
                    </tr>                   
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSTitem2" header="_PK|Prod Group ID|Group Name" format="0|0|0" aligns="0|0|0" defaults="||"
                                editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
                                param="0,1,2" oncellclick="OnSelectItem('BY_PROD')" />
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
                            <gw:datebox id="dtMonth2" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio2')"/>
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="btnProcess2" img="process" alt="Auto Get Ratio" text="Process" onclick="OnProcess()" />
                        </td>
                         <td style="width: 28%" align="right">
                            <gw:label id="txtSTCode2" text="" styles="color:red" readonly="true" />
                        </td>
                        <td style="width: 30%">
                            <gw:label id="txtSTName2" text="" styles="color:red" readonly="true" />
                        </td>                       
                        <td style="width:9%"> 
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" text="Delete" onclick="OnDelete('BY_PROD')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" text="Save" onclick="OnSave('BY_PROD')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="8">
                            <gw:grid id='grdRatio2'
                                header='_ALLOC_RATIO_PK|Seq|_TAC_ABTRACGRP_PK|Manufacturing Cost Type|Index|_P_TLG_IT_STITEM_PK|_P_MONTH|Remark'
                                format='0|0|0|0|1|0|0|0'
                                aligns='0|0|0|0|0|0|0|0'
                                check='|||||||'
                                editcol='1|1|1|1|1|1|1|1'
                                widths='0|1000|0|2500|1500|0|0|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
	</table>
	
	<table  width="100%" style="height: 100%" border="1" name=" Wip Progress Ratio">
				<tr style="height:5%">
			<td>
			 <fieldset style="width: 100%; height: 100%; padding: 2">
				<table border="0" width="100%" cellpadding="0" cellspacing="2"  >
					<tr>
			  
						<td width="15%" align="right">Month:</td>
						<td width="20%"><gw:datebox type='month' id="dtPeriod" onchange="OnSearch('REGISTERRATIO')" styles="width: 100%" /></td>
						<td width="7%" ><a title="Click here to select PL" onclick="OnPopup('PL','0')" href="#tips" style="text-decoration: none; color=#0000ff"><b>PL</b></a></td>
						<td width="28%" colspan="6" ><gw:textbox id="txt_PL_CD_NAME"   text="" styles='width:100%' /> </td>
						<td aligin="right" ><gw:checkbox id="chkAll" value="F" onclick="checkAll()"  /> </td>
						<td width=""><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('REGISTERRATIO')" /></td>
						<td width="2%"><gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('REGISTERRATIO')" /></td>
					 </tr>
					 
					
					 
				 </table>  
			 </fieldset>
			</td>
		  </tr>
		  <tr style="height:95%">
				<td colspan = "9">
										<div style="width:100%; height:96%; overflow:auto;">
										<gw:grid  
										id="idGrid"  
										header="_pk|_PK_code_Group|CODE TYPE ID|CODE TYPE NM|PL |Progress Ratio|_P_MONTH|_pl_pk"
										format="0|0|0|0|0|1|0|0"
										aligns="1|0|0|0|0|0|0|0"  
										defaults="|||||||"  
										editcol="0|0|0|0|0|1|0|0"  
										widths="0|4000|4000|4000|4000|2000|0|0"  
										styles="width:100%; height:100%"   
										sorting="T"   
										paging="true"  pageview="20"
										
										oncelldblclick = "OnPopup('PL','1')"
										 />
										</div>
			</td>
		  </tr>
	</table>
	
</gw:tab>
</body>
<gw:textbox id="txtSTItemPK" text="" style="display: none" />
<gw:textbox id="txtSTItemPK2" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
<gw:textbox id="txtpCodeGroupPk" text="" style="display: none" />
<gw:textbox id="txtTAC_APPL_PK"  style="display:none"/>
</html>
