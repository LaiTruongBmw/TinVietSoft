<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
function BodyInit()
{
    System.Translate(document); 
    BindingDataList();
     FormatGrid();
    dat_gridMaster.Call('SELECT');
   
}
//-----------------------------------------------------------------
function BindingDataList()
{
    var lst_Company ="<%=CtlLib.SetListDataSQL("select pk, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0") %>"; 
    lstCompany.SetDataText(lst_Company);
    
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
    lstLanguage.SetDataText(ls_data1); 
    lstCompany.value = "<%=session("company_pk") %>";
}
//---------------------------------------------------------------
function OnToggle()
{   
        var left  = document.all("bottom");    
        var right = document.all("content");   
        var imgArrow = document.all("imgArrow");   

        if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.height="100%";
            imgArrow.src = "../../../system/images/up.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.height="50%"
        imgArrow.src = "../../../system/images/down.gif";
    }
}

//------------------------------------------------------------------

function ShowDetail(index)
{
    switch(index)
    {
        case 1:
            var icol,irow;
            icol=GridMaster.col;
            irow=GridMaster.row;
            txttac_allexpd_pk.text=GridMaster.GetGridData(irow,0); //get pk
        break;
        case 2:
            txttac_allexpd_pk.SetDataText(GridMaster.GetGridData(GridMaster.row,0));
            flag='search';
            dat_gridDetail.Call('SELECT');
        break;
     }
}
//------------------------------------------------------------------
function OnResetAccount()
{
    txtACPK.text ='';
    txtACCD.text ='';
    txtACNM.text ='';
}

function OnResetPLCenter()
{
    txtPLC_PK.text ='';
    txtPLC_CD.text ='';
    txtPLC_NM.text ='';
}

function OnResetPLUnit()
{
    txtPLPK.text ='';
    txtPLCD.text ='';
    txtPLNM.text ='';
}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
    {
         var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_60080050_acct";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
            {
                txtACPK.SetDataText(object[3]);
                txtACCD.SetDataText(object[0]);
                txtACNM.SetDataText(object[1]);
            }
    }
     if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_PL_Center.Call();
                }            
            }        
   }
    if (pname=='PL')
    {
      
      var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plunit.aspx?";
       
      var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
       
      var tmp;
      
        if ( object != null )  
        {
            if (object[0] != 0)
            {
               txtPLPK.text=object;     // Center PK
                dat_PL_Unit.Call();
            }            
        }    
    }

}
//--------------------------------------------------------------------
function OnSearch(obj)
{
    switch(obj)
    {
        case 1:
            dat_gridMaster.Call("SELECT");
        break;
        
    }
}
//---------------------------------------------------------------------
function Popup_OnNew(index)
{
    switch(index)
    {
        case 1:	
            var i = 0
            var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_60080050_acct";
            aValue    = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
                    if ( aValue != null ) 
                    {
                        GridMaster.AddRow();
                        GridMaster.SetGridText( GridMaster.rows - 1, 1, aValue[3]);    //ACPK
                        GridMaster.SetGridText( GridMaster.rows - 1, 2, aValue[0]);    //Account Code
                        GridMaster.SetGridText( GridMaster.rows - 1, 3, aValue[1]);    //Account Name
                       GridMaster.SetGridText( GridMaster.rows - 1, 8, lstCompany.value);   
                       GridMaster.SetGridText( GridMaster.rows - 1, 9, dtbMonth.value);  
                     /*  txtACPK_Master.text = aValue[3];
                       if (aValue[3] != 0)
                        {                                                                                                            
                            dat_Amount_Master.Call();    
                        }     */
                    }
         break;
         case 2:
             if(txttac_allexpd_pk.text != "")
             {
                    var i = 0
                    var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_60080050_acct";
                    aValue    = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
                   if ( aValue != null ) 
                   {
                                grdDetail.AddRow();
                                grdDetail.SetGridText( grdDetail.rows - 1, 1, aValue[3]);    //ACPK
                                grdDetail.SetGridText( grdDetail.rows - 1, 4, aValue[0]);    //Account Code
                                grdDetail.SetGridText( grdDetail.rows - 1, 5, aValue[1]);    //Account Name
                                grdDetail.SetGridText( grdDetail.rows - 1, 12, txttac_allexpd_pk.text);   
                                grdDetail.SetGridText( grdDetail.rows - 1, 3, dtbMonth.value); 
                             /*   txtACPK_Detail.text = aValue[3];
                                if(aValue[3] !=0)
                                {
                                        dat_Amount_Detail.Call();
                                }*/
                   }
              }
              else
              {
                          alert('Please select code Master!!');
              }
         break;
    }

}
//--------------------------------------------------------------------------
function SelectAccount(obj)
{
    switch(obj)
    {
        case 1:
            if(GridMaster.col=="2")
            {
             var i = 0
            var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_60080050_acct";
            aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
              if ( aValue != null ) 
                {
                        GridMaster.SetGridText( GridMaster.row, 1, aValue[3]);    //ACPK
                        GridMaster.SetGridText( GridMaster.row, 2, aValue[0]);    //Account Code
                        GridMaster.SetGridText( GridMaster.row, 3, aValue[1]);    //Account Name
                        txtCostCenter_PK.SetDataText(GridMaster.GetGridData(GridMaster.row,5));
                       /* txtACPK_Master.text = aValue[3];
                        if (aValue[3] != 0)
                        {                                                                                                            
                            dat_Amount_Master.Call();    
                        }     */
               }
            }
        break;
        case 2:
            if(grdDetail.col=="4")
            {
                var i = 0
                var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_60080050_acct";
                aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
                   if ( aValue != null ) 
                   {
                            grdDetail.SetGridText( grdDetail.row, 1, aValue[3]);    //ACPK
                            grdDetail.SetGridText( grdDetail.row, 4, aValue[0]);    //Account Code
                            grdDetail.SetGridText( grdDetail.row, 5, aValue[1]);    //Account Name
                            txtCostCenter_PK.SetDataText(grdDetail.GetGridData(grdDetail.row,2));
                           /* txtACPK_Detail.text = aValue[3];
                            if(aValue[3] !=0)
                            {
                                    dat_Amount_Detail.Call();
                            }*/
                   }
            }
        break;
    }
}
//---------------------------------------------------------------------
function SelectCostCenter(obj)
{
    switch(obj)
    {
        case 1:
            if(GridMaster.col=="4")
            {
                var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60010060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes');                     
                    if ( object != null )  
                    {               
                         GridMaster.SetGridText( GridMaster.row , 5, object[2]);    //Center PK
                         GridMaster.SetGridText( GridMaster.row, 4, object[0] + " - " + object[1] );    //Center Code
                        txtCostCenter_CD_Master.text = object[0];   
                        txtACPK_Master.text = GridMaster.GetGridData(GridMaster.row , 1);   
                        if (object[2] != 0)
                        {                                                                                                            
                            dat_Amount_Master.Call();    
                        }     
                   }
           }
      break;
           case 2:
                    if(grdDetail.col=="6")
                    {
                         var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60010060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                         var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
                    
                                if ( object != null )  
                                {
                                         grdDetail.SetGridText( grdDetail.row , 2, object[2]);    //Center PK
                                         grdDetail.SetGridText( grdDetail.row, 6, object[0] + " - " + object[1]);    //Center Code
                                        
                                         txtCostCenter_CD_Detail.text = object[0];   
                                         txtACPK_Detail.text = grdDetail.GetGridData(grdDetail.row , 1);       
                                        if (object[2] != 0)
                                        {
                                            dat_Amount_Detail.Call(); 
                                        }            
                               }        
                   }
           break;
     }  
}
//----------------------------------------------------------------------

//----------------------------------------------------------------------------	
function OnDataReceive(obj)
{
    var i, n=0;
    var k = 100;
    switch(obj.id)
    {
        case "dat_Amount_Detail":
             
             Number(grdDetail.SetGridText(grdDetail.row, 7, txtAmount.text));   
             OnSum();  
            if(txtSUM_Amount1.text==0)
            {
                    grdDetail.SetGridText(grdDetail.row, 8,'');
                    grdDetail.SetGridText(grdDetail.row, 7,'');
                    grdDetail.SetGridText(grdDetail.row, 9,'');  
            }
            else
            {
                    for(i=1;i<grdDetail.rows;i++)
                    {
                             n += Number(grdDetail.GetGridData(i,8));
                           
                    } 
                    grdDetail.SetGridText(grdDetail.row, 8, k-n); 
                    if(grdDetail.GetGridData(grdDetail.row,8) == 0)
                    {
                                    alert("Ratio can not large than 100 percent!!");
                                    //grdDetail.SetGridText(grdDetail.row, 8, '');   
                                    grdDetail.SetGridText(grdDetail.row, 8, '');  
                                    grdDetail.SetGridText(grdDetail.row, 9, '');   
                    }  
                    Amount();   
            }    
        break;
        case "dat_gridMaster":
                 var i, l_comma = "", l_rtn_str = "", n = 0;
                    for(i=1;i<GridMaster.rows;i++)
                   {
                          l_rtn_str = l_rtn_str +  l_comma + GridMaster.GetGridData(i , 0) ; // Master pk
                          l_comma = ",";
                   } 
                    txtAcc_pkM.SetDataText(l_rtn_str);
                    dat_Process_Amt_Detail.Call(); 
        break;
        case "dat_gridDetail":
                    
        break;
       case "dat_Amount_Master_Process":
          /*    var l_arr = new Array();
              var l_str = txtAmountT1.GetData() ;
              var i ;
              l_arr = l_str.split(',');  
              for(i = 0; i  < l_arr.length; i++)
              {
                    GridMaster.SetGridText(i+1, 6, l_arr[i]);  
              }
             dat_gridMaster.Call();
            /**/
             dat_gridMaster.Call("SELECT");
       break;
       case "dat_Amount_Master":
                GridMaster.SetGridText(GridMaster.row, 6, txtAmountT.text);  
       break;
       case "dat_Copy":
                     alert(txtReturn.text); 
                    OnSearch(1);
       break;
       case "dat_Process_Amt_Detail":
            grdDetail.ClearData();
               // dat_gridDetail.Call("SELECT");
       break;
       case "DSO_DeleteAll":
                OnSearch(1);
                
       break;
    }
}
//------------------------------------------------------------------------------------
function OnSave(obj)
{
    switch(obj)
    {
        case 1:
            dat_gridMaster.Call();
        break;
       case 2:
         if(txtRatio.text >100)
         {
            alert('Ratio can not lager than 100 percent!!!');
         }
         else
         {
            dat_gridDetail.Call();
         }
         
       break;
    }
}

//---------------------------------------------------------------------------
function OnDelete(obj)
{
    switch(obj)
    {
        case 1:
            if(grdDetail.rows>1)
            {
                alert("Please delete all rows detail!!");
            }
            else if(confirm('Are you sure you want to delete!!'))
            {
                    GridMaster.DeleteRow();
            }
            
        break;
        case 2:
            if(confirm('Are you sure you want to delete!!'))
            { 
                grdDetail.DeleteRow();
            }
        break;
       case 3:
                 if(confirm('Are you sure you want to delete all data!!'))
                { 
                        DSO_DeleteAll.Call();
                } 
       break; 
    }
}
function FormatGrid()
{
    var dt1 = GridMaster.GetGridControl();
    dt1.ColFormat(6) = "###,###.##";
    
    var dt2 = grdDetail.GetGridControl();
    dt2.ColFormat(8) = "###,###.##";
    dt2.ColFormat(9) = "###,###.##";
    dt2.ColFormat(7) = "###,###.##";
}
//-------------------------------------------------------------------------------
function OnSum()
{
    var ctrl = grdDetail.GetGridControl();
    var sum_Amount1 = 0;
    var sum_Amount2 = 0;
    var sum_Ratio = 0;
    for(i = 1; i<ctrl.Rows; i++)
    {
        sum_Amount1 = sum_Amount1 + Number(grdDetail.GetGridData(i,7));
        sum_Amount2 = sum_Amount2 + Number(grdDetail.GetGridData(i,9));
        sum_Ratio   = sum_Ratio + Number(grdDetail.GetGridData(i,8));
    }
    txtSUM_Amount1.text = sum_Amount1.toFixed(2);
    txtSUM_Amount2.text = sum_Amount2.toFixed(2);
    txtRatio.text = sum_Ratio.toFixed();
}
//------------------------------------------------------------------------------
function Amount()
{
    
    var l_ratio = 0;
    var l_Amount = 0;
   if(!CheckRatio())
   {   
      
      for(i=1;i<grdDetail.rows;i++)
      {
              
                l_Amount = Number(GridMaster.GetGridData(GridMaster.row, 6)) * Number(grdDetail.GetGridData(i, 8)) /100;
              // txtAmountD.text = l_Amount.toFixed(2);
                grdDetail.SetGridText(i, 9, l_Amount);   
       }
        //l_ratio = Number(grdDetail.GetGridData(grdDetail.row, 7) / Number(txtSUM_Amount1.text) *100 );     
       // grdDetail.SetGridText(grdDetail.row, 8, l_ratio);   
    } 
    else
    {
            grdDetail.SetGridText(grdDetail.row, 7, '');   
           grdDetail.SetGridText(grdDetail.row, 8, '');   
           grdDetail.SetGridText(grdDetail.row, 9, '');    
    }
    OnSum();
} 
function CheckRatio()
{
        var ratio = 0;
        for(i=1;i<grdDetail.rows;i++)
       {
                    ratio += Number(grdDetail.GetGridData(i, 8));
                    if(ratio > '100')
                   {
                            alert("Ratio can not large than 100 percent!!");
                            grdDetail.SetGridText( grdDetail.row, 8, '');  
                            return;
                   } 
       }
}
function OnPrint(lang)
{
    var url='';
    switch(lang)
    {
         
             case "ENG": // A/R On Progress
               if(txttac_allexpd_pk.text != "")
               {
                        url = '/standard/reports/ag/ga/agga00120_Eng.aspx?p_tac_allexpd_pk=' + txttac_allexpd_pk.GetData() + '&l_company=' + lstCompany.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );
               }
                else
                {
                            alert('Please select code Master!!');
                }
            break;
            case "VIE":
                 if(txttac_allexpd_pk.text != "")
                 {
                     url = '/standard/reports/ag/ga/agga00120_VIE.aspx?p_tac_allexpd_pk=' + txttac_allexpd_pk.GetData() + '&l_company=' + lstCompany.GetData();
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                 }
                 else
                 {
                            alert('Please select code Master!!');
                 }
            break;
    }
   
}
function OnCopy()
{
        dat_Copy.Call();
}
function OnProcess()
{
        var i, l_comma = "", l_rtn_str = "", n = 0;
        for(i=1;i<GridMaster.rows;i++)
       {
              l_rtn_str = l_rtn_str +  l_comma + GridMaster.GetGridData(i , 1) ; // account code pk
              l_comma = ",";
              l_rtn_str = l_rtn_str +  l_comma + GridMaster.GetGridData(i , 10) ; // cost center code 
       } 
       //alert(l_rtn_str);
       txtCostCenter_CD_Master_Pro.SetDataText(l_rtn_str);
       dat_Amount_Master_Process.Call();
}
</script>

<body>
    <!----------------PL Center----------------------------------------->
    <gw:data id="dat_PL_Center" onreceive=""> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_1"  > 
        <input>
            <input bind="txtPLC_PK" />
        </input> 
        <output>
            <output bind="txtPLC_CD" />
            <output bind="txtPLC_NM" />
        </output>
    </dso> 
</xml>
</gw:data>
  
    <!----------------Amount Grid Detail----------------------------------------->
    <gw:data id="dat_Amount_Detail" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_5"  > 
        <input>
           <input bind="dtbMonth" />
            <input bind="txtCostCenter_CD_Detail" /> 
            <input bind="txtACPK_Detail" /> 
            <input bind="lstCompany" /> 
        </input> 
        <output>
            <output bind="txtAmount" />
        </output>
    </dso> 
</xml> 
</gw:data>
    
<!-------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dat_gridMaster" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9" function="ac_sel_60010080_grid_dtl" procedure="ac_UPD_60010080_GRID_DTL"   > 
            <input bind="GridMaster">                    
               <input bind="lstCompany" />
            <input bind="dtbMonth" />
            <input bind="txtACPK" />
            <input bind="txtPLC_PK" />
            <input bind="txtPLPK" />
            </input> 
            <output bind="GridMaster"></output>
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dat_gridDetail" onreceive="OnSum()"> 
    <xml> 
        <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ac_sel_60010080_grid_dtl_1" procedure="ac_upd_60010080_grid_dtl_1"> 
            <input bind="grdDetail">                    
                <input bind="txttac_allexpd_pk" />  
            </input> 
            <output bind="grdDetail"></output>
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dat_PL_Unit"> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_PL_Unit"  > 
        <input>
            <input bind="txtPLPK" />
        </input> 
        <output>
            <output bind="txtPLCD" />
            <output bind="txtPLNM" />
        </output>
    </dso> 
</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
  <gw:data id="dat_Amount_Master" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_5"  > 
        <input>
            <input bind="dtbMonth" />
            <input bind="txtCostCenter_CD_Master" /> 
            <input bind="txtACPK_Master" /> 
            <input bind="lstCompany" /> 
        </input> 
        <output>
            <output bind="txtAmountT" />
        </output>
    </dso> 
</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
<gw:data id="dat_Amount_Master_Process" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_5_Pro"  > 
        <input>
            <input bind="dtbMonth" />
            <input bind="txtCostCenter_CD_Master_Pro" /> 
            <input bind="lstCompany" /> 
        </input> 
        <output>
            <output bind="txtAmountT1" />
        </output>
    </dso> 
</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
<gw:data id="dat_Process_Amt_Detail" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_sel_60010080_5_pro1"  > 
        <input>
            <input bind="txtAcc_pkM" /> 
        </input> 
        <output>
            <output bind="txtReturn_AmtD" />
        </output>
    </dso> 
</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
  <gw:data id="dat_Copy" onreceive="OnDataReceive(this)"> 
    <xml>
    <dso  type="process"  procedure="ac_Pro_60010080"  > 
        <input >      
                 
                <input bind="dtbMonth" />  
            </input> 
            <output>
                 <output bind="txtReturn" />
            </output>
    </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
<gw:data id="DSO_DeleteAll" onreceive="OnDataReceive(this)"> 
    <xml>
    <dso  type="process"  procedure="ac_Pro_60010080_Delete"  > 
        <input >   
                <input bind="dtbMonth" />  
            </input> 
            <output>
                 <output bind="txtReturn" />
            </output>
    </dso> 
    </xml> 
</gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 10%">
            <td>
                <fieldset style="width: 100%; height: 100%">
                    <table width="100%" height="100%" cellpadding="0" border="0" cellspacing="0">
                        <tr>
                            <td width="10%">
                            </td>
                            <td width="11%">
                            </td>
                            <td width="2%">
                            </td>
                            <td width="11%">
                            </td>
                            <td width="15%">
                            </td>
                            <td width="10%">
                            </td>
                            <td width="23%">
                            </td>
                            <td width="2%">
                            </td>
                            <td width="5%">
                            </td>
                            <td width="3%">
                            </td>
                            <td width="2%">
                            </td>
                            <td width="2%">
                            </td>
                            <td width="2%">
                            </td>
                            <td width="2%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Company&nbsp;</td>
                            <td colspan="3">
                                <gw:list id="lstCompany" styles="width:100%" />
                            </td>
                            <td align="right">
                                <a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">
                                    Account Code</a>&nbsp;</td>
                            <td>
                                <gw:textbox id="txtACCD" text="" styles="width:100%" />
                            </td>
                            <td>
                                <gw:textbox id="txtACNM" text="" styles="width:100%" />
                            </td>
                            <td align="right">
                                <gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="OnResetAccount()" />
                            </td>
                            <td colspan="2">
                            </td>
                            <td align="right">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnReset" img="new" alt="New" onclick="Popup_OnNew(1)" />
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete(1)" />
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave(1)" />
                            </td>
                            <td><gw:imgbtn id="ibtnUpdae" img="copy" alt="Copy" onclick="OnCopy()" /></td>
                             <td><gw:imgbtn id="ibtnUdae" img="process" alt="Process" onclick="OnProcess()" /></td>
                             <td><gw:imgbtn id="ibnUdae" img="delete" alt="Delete All" onclick="OnDelete(3)" /></td> 
                            <td><gw:imgbtn img="printer" alt="Report" id="idBtnPrinter" styles="width:100%" onclick="OnPrint(lstLanguage.GetData())" /></td>
                        </tr>
                        <tr>
                            <td align="right">
                                Trans Date&nbsp;</td>
                            <td colspan="3">
                                <gw:datebox id="dtbMonth" onchange="OnSearch(1)" lang="1" type="month" />
                            </td>
                            <td align="right" styles="width: 100%">
                                <a title="Click here to select PL Center" onclick="OnPopUp('CENTER')" href="#tips">PL
                                    Center</a>&nbsp;</td>
                            <td>
                                <gw:textbox id="txtPLC_CD" styles="width:100%" />
                            </td>
                            <td>
                                <gw:textbox id="txtPLC_NM" text="" styles="width:100%" />
                            </td>
                            <td align="right">
                                <gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="OnResetPLCenter()" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="right" >Language</td>
                            <td colspan="3"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
                            
                            <td align="right">
                                <a title="Click here to select PL Unit" onclick="OnPopUp('PL')" href="#tips">PL Unit</a>&nbsp;</td>
                            <td>
                                <gw:textbox id="txtPLCD" text="" styles="width:100%" />
                            </td>
                            <td>
                                <gw:textbox id="txtPLNM" text="" styles="width:100%" />
                            </td>
                            <td align="right">
                                <gw:imgbtn img="reset" alt="Reset" id="btnResetPLUnit" onclick="OnResetPLUnit()" />
                            </td>
                            <td colspan="3">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr id="content" valign="top" height="44%">
            <td>
                <gw:grid id="GridMaster" 
                    header='_pk|_Account_pk|Account Code|Account Name|Cost Center|_Center_pk|Amount|Ratio|_company_pk|_Month|_Center_cd'
                    format='0|0|0|0|0|0|0|0|0|0|0' 
                     aligns='0|0|0|0|0|0|3|3|0|0|0' 
                    defaults='||||||||||'
                    editcol='0|0|0|0|0|0|1|1|1|0|0' 
                    widths='0|0|1500|5000|2000|1000|2500|1000|0|0|0' 
                    sorting='T'
                    styles='width:100%; height:100%' 
                    oncelldblclick="SelectCostCenter(1);SelectAccount(1)"
                    oncellclick="ShowDetail(2)" 
                    onselchange="ShowDetail(1)" />
            </td>
        </tr>
        <tr style="height: 1%; width: 100%">
            <td>
                <fieldset>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td width="4%">
                                <img status="expand" id="imgArrow" src="../../../../system/images/down.gif" style="cursor: hand;"
                                    onclick="OnToggle()" />
                            </td>
                            <td width="4%" align="left">
                                Detail</td>
                            <td width="92%">
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnReset1" img="new" alt="new" onclick="Popup_OnNew(2)" />
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnDelete1" img="delete" alt="delete" onclick="OnDelete(2)" />
                            </td>
                            <td>
                                <gw:imgbtn id="ibtnUpdate1" img="save" alt="save" onclick="OnSave(2)" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr id="bottom" valign="top" height="45%">
            <td>
                <gw:grid id="grdDetail" 
                header="_pk|_Account code_pk|_Cost Center_pk|Month|Account code|Account Name|Cost Center|Amount|Ratio(%)|Amount|Qty|Times|_tac_allexpd_pk"
                    format="0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|1|0|0|0|3|3|3|1|0" 
                    defaults="|||||||||||"
                    editcol="1|1|1|1|0|0|0|1|1|1|1|1" 
                    widths="0|0|0|1000|2000|3000|2000|1500|2000|1500|1500|0"
                    sorting='T' 
                    styles='width:100%; height:100%' 
                    oncelldblclick="SelectCostCenter(2);SelectAccount(2)"
                    onafteredit="Amount()" />
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%"
                    bordercolor="#81d7f3" style="border-collapse: collapse">
                    <tr>
                        <td width="11%" bgcolor="bde9ff">
                        </td>
                        <td width="28%" bgcolor="bde9ff" align="center">
                        </td>
                        <td width="13%">
                            <gw:textbox id="txtSUM_Amount1" format="#,###,###,###,###.##R" styles="width:100%;text-align: Right"
                                readonly="true" type="number" />
                        </td>
                        <td width="20%" bgcolor="bde9ff" align="center">
                        </td>
                        <td width="14%">
                            <gw:textbox id="txtSUM_Amount2" format="#,###,###,###,###.##R" styles="width:100%;text-align: Right"
                                readonly="true" type="number" />
                        </td>
                        <td width="11%" bgcolor="bde9ff" align="center">
                        </td>
                        <td width="25%" bgcolor="bde9ff">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtACPK" styles="display:none; " />
    <gw:textbox id="txtPLPK" styles="display:none; " />
    <gw:textbox id="txtPLC_PK" styles="display:none; " />
    <gw:textbox id="txtCostCenter_PK" styles="display:none; " />
    <gw:textbox id="txtCostCenter_CD_Master" styles="display:none; " />
    <gw:textbox id="txtCostCenter_CD_Detail" styles="display:none; " />
    <gw:textbox id="txttac_allexpd_pk" styles="display:none; " />
    <gw:textbox id="txttac_allexpd1_pk" styles="display:none; " />
    <gw:textbox id="txtAmount" styles="display:none; " />
    <gw:textbox id="txtRatio" styles="display:none; " />
    <gw:textbox id="txtAmountT" styles="display:none; " />
    
    <gw:textbox id="txtACPK_Detail" styles="display:none; " />
    <gw:textbox id="txtACPK_Master" styles="display:none; " />
    
    
    <gw:textbox id="txtReturn" styles="display:none; " />
   
    <gw:textbox id="txtCostCenter_CD_Master_Pro" styles="display:none; " />
    <gw:textbox id="txtACPK_Master_Pro" styles="display:none; " />
    <gw:textbox id="txtAmountT1" styles="display:none; " />
    <gw:textbox id="txtAcc_pkM" styles="display:none; " />
    <gw:textbox id="txtReturn_AmtD" styles="display:none;width:100% " />
</body>
</html>
