<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var iPK                  =	1
    ,iPartner            =  2
    ,iPL_Code            =	3
    ,iContract_Date      =  4
    ,iContract_No        =	5
    ,iContract_Amount    =  6
    ,iPartner_Code       =  7
    ,iPL                 =  8
    ,iIssued_Date        =  9
    ,iBooking_Ccy        =  10
    ,iTO_TR_AMT          =	11
    ,iTO_B_AMT           =  12
    ,iAR_TR_AMT          =	13
    ,iAR_B_AMT           =	14
    ,iADV_TR_AMT         =  15
    ,iADV_B_AMT          =	16
    ,iCOL_TR_AMT         =	17
    ,iCOL_B_AMT		     =  18

function BodyInit()
{
    SetFormatCol();
      System.Translate(document);  // Translate to language session
	  txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
//---------------------------------------------------------------
function SetFormatCol()
{
    
    var ctrl1 = grdContract.GetGridControl();
    ctrl1.ColFormat(6) = "###,###R";  
   
    var data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstBookingCcy.SetDataText(data);
    data="<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All"; 
    lstCompany.SetDataText(data);
    var sContractDt_Fr,sContractDt; 
    sContractDt=dtContractDt_To.value
    sContractDt_Fr=sContractDt.substr(0,6)+'01';    
    dtContractDt_Fr.SetDataText(sContractDt_Fr);
    txt_row.text    = 1;
  
}
//------------------------------------------------------
function OnShowPopup(index)
{
    switch (index)
    {
        case 0:
            var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtPartnerID.SetDataText(object[1]);//customer id
                    txtPartnerNm.SetDataText(object[2]);//customer name
                    txtPartner_PK.SetDataText(object[0]);//customer pk
      	        }
		     }       
                break;
        case 1:
            fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                
                if ( oValue != null )
                {
                    txtPL_PK.text = oValue[2]; 
                    txtPL_Nm.text   = oValue[1];
                    txtPL_Code.text   = oValue[0];
                }                
            break;    
       
    }
}
//--------------------------------------------------------------------------------
function onSearch()
{  
    dat_gfqc00010.Call("SELECT");
    
}
//--------------------------------------------------------------------------
function onSave()
{
   dat_update.Call();
}
//------------------------------------------------------------------------------
function onCellClickToGrid()
{    
    txt_PK.SetDataText(grdContract.GetGridData(grdContract.row,1));
    
    dat_update.Call('SELECT');
    
}
//---------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var strdata = txtCodeTemp.text;
    if(obj.id == 'datGetNewCode')
    {
        switch(indexCode)
                {
                    case 1:
                        lstBookingCcy.SetDataText(strdata);
                        lstBookingCcy.value=strcodereturn; //loai tien   
                        OnChangeCurrent();               
                    break;
                   
                }
    }
    else if(obj.id == 'dat_update')
    {
        //onSearch();
        FormatGrid();
        
    }
    else if(obj.id == 'dat_gfqc00010')
    {
        FormatGrid();
    }
}
//----------------------------------------------------------------------------
function OnPrint()
{
    
    var p_tex_contr_mst;
    if (grdContract.rows>1)
    {
        p_tex_contr_mst_pk=grdContract.GetGridData(grdContract.row,iPK); 
        p_tco_company_pk=grdContract.GetGridData(grdContract.row,iCompany);      
        var url = '/standard/reports/60/02/60020040_contractprogress.aspx?p_tex_contr_mst_pk='+p_tex_contr_mst_pk+ '&p_tco_company_pk='+p_tco_company_pk.text;
        System.OpenTargetPage( System.RootURL+url , "newform" );
    }
    else 
    {
        alert("Please select a data row");
        return;
    } 
}
//-----------------------------------------------------------------------------------
function OnShow() 
{
    var vendor = document.all("updating_info"); 

    if ( vendor.style.display == "none" )
    {
        vendor.style.display = "";
        imgup.src = "../../../system/images/up.gif";
    }
    else
    {
        vendor.style.display = "none";
        imgup.src = "../../../system/images/down.gif";
    }
}
//-----------------------------------------------------
function OnChangeCurrent()
{
    
    dso_get_rate.Call();
} 
//------------------------------------------------------------------
function GetDataListbox(index)
{
    var scode;
        switch(index)
        {           
            case 1:
                scode='ACAB0110'; //loai tien
            break;
           
        }
        txtComCodeID.text = scode;
        var fpath = System.RootURL + "/standard/forms/60/02/60020050_popup_1.aspx?code=" + scode ;
       
        var obj = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes');
        if (obj!=null)
        {
            strcodereturn=obj[1];
            indexCode=index;
            
            if (obj[0]==1 ) //modify common code
                OnLoadNew(scode);
                //datGetNewControl.Call();
            else
            {               
                switch(index)
                {                        
                    case 1:
                        lstBookingCcy.value=strcodereturn; //loai tien
                        OnChangeCurrent();
                    break;
                   
                }            
            }
        }	     
               

}
//------------------------------------------------
function OnLoadNew(scode)
 {	
        datGetNewCode.Call('SELECT');
 }
 function FormatGrid()
 {
    var fg=grdContract.GetGridControl();
    if(lstBookingCcy.GetData() == "VND")
        {
            fg.ColFormat(6) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(15) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(16) = "#,###,###,###,###,###,###R";
            fg.ColFormat(17) = "#,###,###,###,###,###,###R";
            fg.ColFormat(18) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(15) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(16) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(17) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(18) = "#,###,###,###,###,###,###.##R";
        }
 }
</script>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
<gw:data id="dat_gfqc00010"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"  function="AC_sel_60020040_grid"> 
            <input bind="grdContract">                    
                <input bind="txtContractNo" /> 
                <input bind="dtContractDt_Fr" /> 
                <input bind="dtContractDt_To" />
                <input bind="txtPartner_PK" />
                <input bind="txtPL_PK" />
            </input> 
            <output bind="grdContract" /> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------------>
<gw:data id="dat_update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="12" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="AC_sel_60020040_control" procedure="AC_upd_60020040_control"> 
            <inout> 
                <inout bind="txt_PK"/>
                <inout bind="lstBookingCcy" />
                <inout bind="txtBookingRate" />
                <inout bind="txtTransRate" />
                <inout bind="txtTOBooksAmt" />
                
                <inout bind="txtTOTransAmt" />
                <inout bind="txtAdvBooksAmt" />
                <inout bind="txtAdvTransAmt" />
                <inout bind="txtCollTransAmt" />
                <inout bind="txtCollBooksAmt" />
                
                <inout bind="dt_Issued" />
                <inout bind="txtARBooksAmt" />
                <inout bind="txtARTransAmt" />
                <inout bind="dtContract" />
                <inout bind="txtContractNo_D" />
            </inout>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------->
<gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="AC_pro_60020040_RATE"> 
                <input> 
                     <input bind="dtContract"/>
                     <input bind="lstCompany"/>
                     <input bind="lstBookingCcy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtTransRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!---------------------------------------------------------->
 <gw:data id="datGetNewCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020040_newcomm" > 
                <input> 
                    <input bind="txtComCodeID" /> 
                </input>
	           <output>
	                <input bind="txtCodeTemp" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60020040_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<table border="0" style="width:100%;height:100%" id="table1"  cellpadding="0" cellspacing="0">
<tr style="width:100%;height:10%">
    <td>
        <table style="width:100%">
            <tr>
                <td>
                    <fieldset style="padding:0">
                        <table style="width:100%">
                               <tr>
		                            <td width="10%" align="right">Company</td>
		                            <td width="25%"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" /></td>                                            
		                            <td width="15%" align=right>Contract No</td>
		                            <td width="20%"><gw:textbox id="txtContractNo"  onenterkey="onSearch()"  styles="width:96%" /></td>
		                            <td width="20%" align=right >Contract Date</td>
		                            <td width="20%">
		                                <table style="width:100%" cellpadding="0" cellspacing="0">
		                                        <tr>
		                                            <td width="45%"><gw:datebox id="dtContractDt_Fr" lang=1  lang="<%=Session("Lang")%>"  /></td>
		                                            <td width="5%" align=center>~</td>
                                                    <td width="45%"><gw:datebox id="dtContractDt_To" lang=1  lang="<%=Session("Lang")%>"  /></td>
		                                        </tr>
		                                </table>
		                            </td>
		                            
		                            <td><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" /></td>
	                            </tr>
	                            <tr>
		                            <td width="10%" align="right"><a onclick="OnShowPopup(0)" title="Click here to select partner" href="#tips" style="text-decoration : none; color=#0000FF">Partner</a> </td>
		                            <td width="10%" colspan="3">
		                                <table style="width:100%" cellpadding="0" cellspacing="0">
		                                    <tr>
		                                            <td width="35%"><gw:textbox id="txtPartnerID" styles ="width:100%"  /></td>
		                                            <td width="65%" ><gw:textbox id="txtPartnerNm" style="width:100%" text=""/></td>
		                                            <td ><gw:textbox id="txtPartner_PK" style="width:100%;display:none" /></td>
		                                            <td ><gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPartnerID.text='';txtPartner_PK.text='';txtPartnerNm.text='';" /></td>
		                                    </tr>
		                                </table>
		                            </td>
		                                                                     
		                            
		                            <td width="13%" align=right ><a onclick="OnShowPopup(1)" title="Click here to select P/L" href="#tips" style="text-decoration : none; color=#0000FF">P/L</a> </td>
		                            <td width="10%" colspan="2">
		                                 <table style="width:100%" cellpadding="0" cellspacing="0">
		                                        <tr>
		                                            <td width="35%"><gw:textbox id="txtPL_Code" styles ="width:100%"  /></td>
		                                            <td width="65%" colspan=2><gw:textbox id="txtPL_Nm" styles ="width:100%"  /></td>
		                                            <td><gw:textbox id="txtPL_PK" style="width:100%;display:none" /></td>
		                                            <td ><gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPL_Nm.text='';txtPL_PK.text='';txtPL_Code.text='';" /></td>
		                                        </tr>
		                                 </table>
		                            </td>
		                            
	                            </tr> 
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                    <td >
                        <fieldset >
                                <legend ><img status="expand" id="imgup" src="../../../../system/images/up.gif" style="cursor: hand;"
                                                    onclick="OnShow()" /><b style="text-decoration: none; color=#0000ff"> Updating Info</b></legend>
                                <table style="width:100%;background: #CCFFFF" id="updating_info" border="0" cellpadding="0" cellspacing="0">
                                        <tr align="right">
                                            <td style="width: 100%" colspan="11" valign="middle" align="left">
                                                
                                            </td>
                                           
                                        </tr>
                                        <tr>
		                                    <td width="13%" align="right">Contract dt&nbsp;</td>
		                                    <td width="10%"><gw:datebox id="dtContract"   lang="<%=Session("Lang")%>"  /></td>
		                                    <td width="12%" align=right>Contract No&nbsp;</td>
		                                    <td width="12%"><gw:textbox id="txtContractNo_D" text="" styles="width:95%" /></td>
		                                    <td width="10%" align=right>Issued dt&nbsp;</td>
		                                    <td width="10%"><gw:datebox id="dt_Issued"   lang="<%=Session("Lang")%>"  /></td>
		                                    <td width="10%" align=right ><a title="Click here to select Booking Currency" onclick="GetDataListbox(1)" href="#tips" style="text-decoration : none; color:#0000FF"><b>Book.CCY&nbsp;</b></a></td>
                                            <td width="8%">
                                                <gw:list id="lstBookingCcy" onchange="OnChangeCurrent()" style="width:100%" value="0">                               
                                                </gw:list>
                                            </td>
                                            <td width="8%"><gw:textbox id="txtBookingRate" type="number" format="###,###.##R" text="1" readonly="true" styles="width:90%"/></td>
                                            <td width="10%"><gw:textbox id="txtTransRate" type="number" format="###,###.##R" text="1"  styles="width:90%"/></td>
		                                    <td width="1%"><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                                            <td width="1%"><gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" /></td>
	                                    </tr>
                                       <tr>
	                                        <td width="12%" align="right">T/O Trans Amt&nbsp;</td>
	                                        <td width="10%"><gw:textbox id="txtTOTransAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
	                                        <td width="12%" align=right>A/R Trs.Amt&nbsp;</td>
	                                        <td width="12%"><gw:textbox id="txtARTransAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
	                                        <td width="10%" align=right>Adv Trs.Amt&nbsp;</td>
	                                        <td width="10%"><gw:textbox id="txtAdvTransAmt" format="###,###.##R" type="number" styles="width:95%" text="" /></td>
	                                        <td width="18%" colspan=2 align=right >Coll Trs.Amt&nbsp;</td>
                                            
                                            <td width="20%" colspan=4><gw:textbox id="txtCollTransAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
                                           
                                        </tr>
	                                     <tr>
		                                    <td width="12%" align="right">T/O Book.Amt&nbsp;</td>
		                                    <td width="10%"><gw:textbox id="txtTOBooksAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
		                                    <td width="12%" align=right>A/R Book.Amt&nbsp;</td>
		                                    <td width="12%"><gw:textbox id="txtARBooksAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
		                                    <td width="10%" align=right>Adv Book.Amt&nbsp;</td>
		                                    <td width="10%"><gw:textbox format="###,###.##R" type="number" id="txtAdvBooksAmt" styles="width:95%" text="" /></td>
		                                     <td width="18%" colspan=2 align=right >Coll Book.Amt&nbsp;</td>
                                            
                                            <td width="20%" colspan=4><gw:textbox id="txtCollBooksAmt" type="number" format="###,###.##R" styles="width:95%" text="" /></td>
                                          
	                                    </tr>
                                </table>
                        </fieldset>
                    </td>
            </tr>
        </table>
    </td>
</tr>
<tr style="width:100%;height:90%">
    <td>
            <table border=0 cellpadding=0 cellspacing=0 style="width:100%;height:100%">      
                <tr style="height:100%" valign=top>
             <!--   header='0.No|1._PK|2.Partner|3.P/L|4.Contract Date|5.Contract No|6.Contract Amount|7._Paner_Code|8._PL_Code|9.Issued Date|10.Book.CCY|11.TT/O Trans Amt|12.T/O Book.Amt|13.A/R Trs.Amt|14.A/R Book.Amt|15.Adv Trs.Amt|16.Adv Book.Amt|17.Coll Trs.Amt|18.Coll Book.Amt'-->
                   <td>
                        <gw:grid id='grdContract' 
                            header='No|_PK|Partner|P/L|Contract Date|Contract No|Contract Amount|_Paner_Code|_PL_Code|Issued Date|Book.CCY|TT/O Trans Amt|T/O Book.Amt|A/R Trs.Amt|A/R Book.Amt|Adv Trs.Amt|Adv Book.Amt|Coll Trs.Amt|Coll Book.Amt'
                            format='0|0|0|0|4|0|0|0|0|4|0|0|0|0|0|0|0|0|0'
                            aligns='1|0|0|0|1|0|3|0|0|1|1|3|3|3|3|3|3|3|3'
                            defaults='||||||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='500|0|3000|1500|1300|2000|2000|0|0|1200|1000|2000|2000|2000|2000|2000|2000|2000|2000'
                            sorting='T'
                            acceptnulldate="T"                              
                            styles='width:100%; height:100%'
                            oncellclick="onCellClickToGrid()"
                          />
                    </td>
                </tr>
            </table>
    </td>
</tr>
	
	
    
</table>
 

   <gw:list id="lstBookingCcy_Tmp" style="display:none"></gw:list>
   <gw:textbox id="txt_PK" style="display:none"></gw:textbox>
    <gw:textbox id="txtProposedByUserPk" style="display:none"></gw:textbox>
   <gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txtComCodeID" styles='width:100%;display:none' />   
<gw:textbox id="txtCodeTemp" styles='width:100%;display:none' />  
</body>
</html>
