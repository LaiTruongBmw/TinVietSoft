<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">

function BodyInit()
{	
	BindingDataList();
    OnFormatGrid();
   
}
//-----------------------------------------------------------------------------------------
function BindingDataList()
{
    var ls_comp  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_comp);  
    idGrid.GetGridControl().FrozenCols = 3;
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
//-----------------------------------------------------------------------------------
function OnPopUp(ind)
{
    var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
    
     if(ind == "2")
    {      
        comm_code = 'ACDF0030';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AD001";       
    }          
    if(ind == "3")
    {        
        comm_code = 'AE002' ; //'ACDF0040';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AE002" // AD001
       
    }                   
    var fpath   = System.RootURL + "/standard/forms/60/13/60130110_acc_code.aspx?compk=" + lstCompany.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no'); 
		
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "2")
            {
                txtDeprAcc_pk.SetDataText(object[0]);
                txtDeprAcc_cd.SetDataText(object[1]);
                txtDeprAcc_nm.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtExpAcc_pk.SetDataText(object[0]);
                txtExpAcc_cd.SetDataText(object[1]);
                txtExpAcc_nm.SetDataText(object[2]);
            } 
        }
    }
}
//-------------------------------------------------------------
function OnGetPL()
{
        fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
     oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
    if ( oValue != null )
    {
        txtCostCenter_pk.text = oValue[5]; 
        txtCostCenter_nm.text   = oValue[1];
        txtCostCenter_cd.text   = oValue[0];
    }
}
//---------------------------------------------------------------
function OnGetCenter() 
{
      var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
            var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( object != null ) 
            {
                if (object[0] != 0)
                {
                    txtBizCenter_pk.SetDataText(object[6]);//pk
                    txtBizCenter_cd.SetDataText(object[3]);//id
                    txtBizCenter_nm.SetDataText(object[4]);//nm
                }
            }
}
//---------------------------------------------------------------
function OnSearch()
{
    DSO_MT.Call("SELECT");
}
//------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    trl = idGrid.GetGridControl();	
    trl.ColFormat(4)                  = "###,###,###,###,###";    
    trl.ColFormat(8)                  = "###,###,###,###,###";    
    trl.ColFormat(9)              = "###,###,###,###,###";
    trl.ColFormat(10)              = "###,###,###,###,###";
}
//---------------------------------------------------------------------
function OnDataReceive(obj)
{
        if(obj.id == "DSO_MT")
        {
             var ctr=idGrid.GetGridControl(); 
			 ctr.OutlineBar =2 ;
			 ctr.SubTotal(2,0, 8,'',0x99FFFF,0x000000,'1','Grand Total: ','',true);
			 ctr.SubTotal(2,1, 8,'',0x99FFFF,0x000000,'1','Total: %s ','',true);
			 ctr.SubTotal(2,2, 8,'',0x99FFCC,0x000000,'1','Total: %s','',true);
			 
			 ctr.SubTotal(2,0, 9,'',0x99FFFF,0x000000,'1','Grand Total: ','',true);
			 ctr.SubTotal(2,1, 9,'',0x99FFFF,0x000000,'1','Total: %s ','',true);
			 ctr.SubTotal(2,2, 9,'',0x99FFCC,0x000000,'1','Total: %s','',true);
			 
			 ctr.SubTotal(2,0, 10,'',0x99FFFF,0x000000,'1','Grand Total: ','',true);
			 ctr.SubTotal(2,1, 10,'',0x99FFFF,0x000000,'1','Total: %s ','',true);
			 ctr.SubTotal(2,2, 10,'',0x99FFCC,0x000000,'1','Total: %s','',true);
			 
			 /*ctr.MergeCells  = 2;             ctr.MergeCol(1) = true;             ctr.MergeCol(2) = true;              ctr.MergeCol(3) = true;             ctr.MergeCol(4) = false; 
             ctr.MergeCol(5)= false; 
             ctr.MergeCol(6) = false; 
             ctr.MergeCol(7)= false; 
             ctr.MergeCol(8) = false; 
             ctr.MergeCol(9)= false; 
             ctr.MergeCol(10) = false ;/**/
             
             DSO_Bottom.Call("SELECT");             
        }
        if(obj.id == "DSO_Bottom")
        {
            MergeColumn();             
        }
}
//--------------------------------------------------------------------------------
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="100%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="40%";
            right.style.width  ="60%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="100%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="40%";
            right.style.width  ="60%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//-------------------------------------------------------------------------
function MergeColumn()
{
      
      
      idGridBottom.GetGridControl().MergeCells  = 4 ;	
      idGridBottom.GetGridControl().MergeCol(0) = true ;	
      idGridBottom.GetGridControl().MergeCol(1) = true ;   	
      idGridBottom.GetGridControl().MergeCol(2) = true ;	
      idGridBottom.GetGridControl().MergeCol(3) = true ;
      idGridBottom.GetGridControl().MergeCol(4) = true ;		
      idGridBottom.GetGridControl().MergeCol(5) = false ;	
      idGridBottom.GetGridControl().MergeCol(6) = false ;	
      idGridBottom.GetGridControl().MergeCol(7) = false ;   	
      idGridBottom.GetGridControl().MergeCol(8) = false ;	
      idGridBottom.GetGridControl().MergeCol(9) = false ;	
}
</script>

<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130130_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="DSO_MT" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ac_sel_60130160_mst" > 
            <input>
                  <input bind="lstCompany" />
                  <input bind="dtMonth" />
                  <input bind="txtDeprAcc_pk" />
			          <input bind="txtExpAcc_pk" />
			          <input bind="txtBizCenter_pk" />
			          <input bind="txtCostCenter_pk" />
			          <input bind="txtAsset" />
            </input>
            <output bind="idGrid" /> 
        </dso> 
    </xml> 
</gw:data> 
<!----------------------------------------------------------------->
<gw:data id="DSO_Bottom" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ac_sel_60130160_dtl" > 
            <input>
                  <input bind="lstCompany" />
                  <input bind="dtMonth" />
                  <input bind="txtDeprAcc_pk" />
			          <input bind="txtExpAcc_pk" />
			          <input bind="txtBizCenter_pk" />
			          <input bind="txtCostCenter_pk" />
			          <input bind="txtAsset" />
            </input>
            <output bind="idGridBottom" /> 
        </dso> 
    </xml> 
</gw:data> 
<table width="100%" style="height:100%;background: #BDE9FF" >
	<tr style="height:5%;width:100%">
	    <td style="background-color:White" >
	        <fieldset>
	            <table >
	                    <tr >
		                    <td align="right" width="15%">Company&nbsp;</td>
		                    <td width="35%"><gw:list id="lstCompany" styles="width:100%" /></td>		
		                    <td align="right"  width="15%"><a title="Click here to select Expense Account " onclick="OnPopUp('3')" href="#tips" ><b>Expense Acc&nbsp;</b></a></td>
                         <td  width="35%">
                                  <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                                  <td width="30%"><gw:textbox id="txtExpAcc_cd" readonly='true'  styles='width:100%'   /></td>
                                                  <td width="70%"><gw:textbox id="txtExpAcc_nm" readonly='true' styles='width:100%'   /></td>
                                                  <td ><gw:imgBtn id="ibtnSearch21" img="reset" alt="Reset" onclick="txtExpAcc_cd.text='';txtExpAcc_nm.text='';txtExpAcc_pk.text='';"/></td>
                                                  <td><gw:textbox id="txtExpAcc_pk"  styles='width:100%;display:none'   /></td>
                                        </tr>
                                  </table>   
                         </td>
                         <td ><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
                           
	                    </tr>
	                     <tr >
	                        <td width="15%" align="right"><a title="Click here to select Biz.Center" onclick="OnGetCenter()" href="#tips" ><b>Biz.Center&nbsp;</b></a></td>
		                    <td width="35%">
		                          <table cellpadding="0" cellspacing="0" width="100%">
		                                  <tr>
		                                          <td width="30%"><gw:textbox id="txtBizCenter_cd" readonly='true' styles="width:100%" /></td>
		                                          <td width="70%"><gw:textbox id="txtBizCenter_nm" readonly='true' styles="width:100%" /></td>
		                                          <td ><gw:imgBtn id="ibtnSearch2" img="reset" alt="Reset" onclick="txtBizCenter_cd.text='';txtBizCenter_nm.text='';txtBizCenter_pk.text='';"/></td>
		                                          <td><gw:textbox id="txtBizCenter_pk" styles="width:100%;display:none"  /></td>
		                                  </tr>
		                          </table>
		                    
		                    </td>
		                    
	                       
		                    <td width="15%" align="right"><a title="Click here to select Department Account" onclick="OnPopUp('2')" href="#tips" ><b>Depr.Acc&nbsp;</b></a></td>
		                    <td width="35%">
		                          <table cellpadding="0" cellspacing="0" width="100%">
		                                  <tr>
		                                          <td width="30%"><gw:textbox id="txtDeprAcc_cd" readonly='true' styles="width:100%" /></td>
		                                          <td width="70%"><gw:textbox id="txtDeprAcc_nm" readonly='true' styles="width:100%" /></td>
		                                          <td ><gw:imgBtn id="ibtnSearch3" img="reset" alt="Reset" onclick="txtDeprAcc_cd.text='';txtDeprAcc_nm.text='';txtDeprAcc_pk.text='';"/></td>
		                                          <td><gw:textbox id="txtDeprAcc_pk" styles="width:100%;display:none"  /></td>
		                                  </tr>
		                          </table>
		                    
		                    </td>
		                    <td ><gw:imgBtn id="ibtnSearch8" img="excel" alt="Print" onclick="OnExcel()"/></td>
	                    </tr>
	                    <tr >
		                   <td width="15%" align="right"><a title="Click here to select Cost Center" onclick="OnGetPL()" href="#tips" ><b>Cost Center &nbsp;</b></a></td>
		                    <td width="35%">
		                          <table cellpadding="0" cellspacing="0" width="100%">
		                                  <tr>
		                                          <td width="30%"><gw:textbox id="txtCostCenter_cd" readonly='true' styles="width:100%" /></td>
		                                          <td width="70%"><gw:textbox id="txtCostCenter_nm" readonly='true' styles="width:100%" /></td>
		                                          <td ><gw:imgBtn id="ibtnSearch4" img="reset" alt="Reset" onclick="txtCostCenter_cd.text='';txtCostCenter_nm.text='';txtCostCenter_pk.text='';"/></td>
		                                          <td><gw:textbox id="txtCostCenter_pk" styles="width:100%;display:none"  /></td>
		                                  </tr>
		                          </table>
		                    
		                    </td>
		                    <td width="15%" align="right">Asset &nbsp;</td>
		                    <td width="35%">
		                          <table cellpadding="0" cellspacing="0" width="100%">
		                                  <tr>
		                                          <td width="80%"><gw:textbox id="txtAsset" onenterkey="OnSearch()" styles="width:100%" /></td>
		                                          <td width="20%" >Month</td>
		                                          <td><gw:datebox id="dtMonth" type="month" lang="1"/></td>
		                                  </tr>
		                          </table>
		                    
		                    </td>
		                    <td></td>
	                    </tr>
	                   
	            </table>
	        </fieldset>
	    </td>
	</tr>
	
	
	<tr style="height:45%;width:100%" id="t-left">
		<td colspan="5" width="100%">
		
			<gw:grid
				id="idGrid"				
				header  ="|Biz center|Asset code|Asset name|Original Amt|Depr.Acc|Expense Acc|Cost center|Depr.Amount|Accumulation Amt|Remain Amt"
				format  ="0|0|0|0|0|0|0|0|0|0|0"
				aligns  ="0|0|0|0|3|0|0|0|3|3|3"
				defaults="||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0"
				widths  ="3000|2000|2000|3000|2000|2000|2000|2000|2000|2000|2000"
				styles  ="width:100%; height:100%"		
				acceptnulldate="T"	
				sorting ="T" oncelldblclick=""/>           
		</td>
	</tr>
	<tr style="width:100%;height:5%" >
	        <td>
	            <fieldset>
	                    <table cellpadding="0" cellspacing="0" style="width:100%">
	                           <tr>
	                                    <td width="100%" align="center">
                                             <img status="expand" id="imgArrow1" src="../../../../system/images/button/icons_button/up.gif"
                                            style="cursor: hand; position: center" onclick="OnToggle('1')" />
                                            <img status="expand" id="imgArrow2" src="../../../../system/images/button/icons_button/down.gif"
                                            style="cursor: hand; position: center" onclick="OnToggle('2')" />
                                        </td>
	                           </tr>
	                    </table>
	            </fieldset>
	                
	        </td>
	</tr>
	<tr id="t-right" style="width:100%;height:45%">
	        <td colspan="5" width="100%">
		
			    <gw:grid
				    id="idGridBottom"				
				    header  ="Biz center|Asset code|Asset name|Original Amt|Depr.Acc|Expense Acc|Cost center|Depr.Amount|Accumulation Amt|Remain Amt"
				    format  ="0|0|0|1|0|0|0|1|1|1"
				    aligns  ="0|0|0|3|0|0|0|3|3|3"
				    defaults="|||||||||"
				    editcol ="0|0|0|0|0|0|0|0|0|0"
				    widths  ="2000|2000|3000|2000|2000|2000|2000|2000|2000|2000"
				    styles  ="width:100%; height:100%"		
				    acceptnulldate="T"	
				    group   ="T"
				    sorting ="T" oncelldblclick=""/>           
		    </td>
	</tr>
	</tr>
</table>	
 <gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
