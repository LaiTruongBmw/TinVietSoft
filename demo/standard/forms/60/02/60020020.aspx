<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<!-- #include file="../../../../system/lib/form.inc"  -->
<script>
var item_pk =0;
function BodyInit()
{
   BindingDataList();
   ChangeEx();
   
   var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
   listccy.SetDataText(lstBook_ccy.GetData());
   var trl = GridDetail.GetGridControl();
	 SetControlFormat();
	 trl.FrozenCols = 5;
	 data = "<%=CtlLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tlg_it_uom a where del_if=0" ) %> "; 
     GridDetail.SetComboFormat(5,data);
     data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'ACCR0110' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm" ) %> "; 
     GridDetail.SetComboFormat(9,data);
     
     
   <%=CtlLib.SetGridColumnComboFormat("GridTerms",2,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB043' and a.del_if = 0 and b.del_if = 0")%>;
   txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
   
}
//-------------------------------------------------------------------------------------
function ChangeEx()
{
    txtExrate2.SetDataText('1');
   txtExrate1.SetDataText("1");
   txtExrate1.SetEnable(false);
   txt_row.text    = 1;
   
   var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   listccy.SetDataText(ls_current);
   
   ls_trsdate  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
   txt_date.text   = ls_trsdate;
   data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   arr  = data.split("|");
	
	 txtbookccy.SetDataText(arr[1]);
}
//-------------------------------------------------------------------------------------

function BindingDataList()
 {      
     var data ;
     var arr;
     
     txtuser_pk.Text = "<%=Session("USER_PK") %>";
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
     cboCompany.SetDataText(data);
     //cboCompany.value = "<%=Session("COMPANY_PK") %>";
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
     cboStatus.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0010') FROM DUAL")%>";
     arr  = data.split("|");
	 cboStatus.SetDataText(arr[1]);
	 //data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
     listccy.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0001') FROM DUAL")%>";
     lstArea.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB051') FROM DUAL")%>";
     lstBiztype.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0002') FROM DUAL")%>";
     lstUnit.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACCR0110') FROM DUAL")%>";
     lstVat.SetDataText(data);
     OnNew(0);
 }
 
//--------------------------------------------------------------------------------
var flag ="";
function OnSave()
{
    if(OnValidate())
    {
        if(txtsubtract_pk.GetData()!='') flag='update';        
        dat_gfqc00060_2.Call();
        //dat_gfqc00060_3.Call();
    }    
}
 
 //--------------------------------------------------------------------------------
 
 function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/right.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}
//----------------------------------------------------------------------
function SetControlFormat()
{
    var ctrl1 = GridDetail.GetGridControl();
   
    ctrl1.ColFormat(6) = "#,###,###,###,###,###,###,###.##R";  
    ctrl1.ColFormat(7) = "#,###,###,###,###,###,###,###.##R";  
    ctrl1.ColFormat(8) = "#,###,###,###,###,###,###,###.##R";
   
    ctrl1.ColFormat(10) = "#,###,###,###,###,###,###,###.##R";
    ctrl1.ColFormat(11) = "#,###,###,###,###,###,###,###.##R";
    ctrl1.ColFormat(12) = "#,###,###,###,###,###,###,###.##R"; 
    
}
//----------------------------------------------------------------------------
function OnChangeAmt()
{

    
    var l_contracttotal_amt =0;
    var l_Exrate2 = Number(txtExrate2.GetData());
    

    var l_contract_amt =0;
	var l_contract_famt = 0;
	var l_unit_price =Number(txtUnitprice.GetData());
	var l_Qty = Number(txtQuantity.GetData());
    var l_vat_rate = lstVat.GetData();
	if(!isNaN(l_vat_rate)){
	    l_vat_rate = Number(l_vat_rate);
	}else
	{
	    l_vat_rate =0;
	}

	
	var l_contract_fvat =0;
	var l_contract_amt_adj = txtAdjAmt_4.GetData();
	var l_vat_adj =txtVatadj_7.GetData();
	
	
	var l_TotalVatAdjTmp = 0;
	var l_TotalVatAdj = 0;
	var l_NetTotal = 0;
	var l_amt11 =0 ;
	
	l_contracttotal_amt = Number(l_contract_famt/l_Exrate2);
	l_contract_famt = Number(l_unit_price*l_Qty);
	
	
	
	txtNetAmt_3.SetDataText('' +l_contract_famt);
    l_contract_fvat = l_contract_famt*l_vat_rate/100;
	txtVatAmt_6.SetDataText('' +l_contract_fvat);
	l_NetTotal = Number(l_contract_amt_adj)  +  Number(l_contract_famt);
	txtTotalamt_5.SetDataText('' +l_NetTotal);
	
	l_amt11 = Number(txtVatAmt_6.GetData()) + Number(txtVatadj_7.GetData());
	txtVatTotal_8.SetDataText('' + l_amt11);
	l_TotalVatAdjTmp = Number(l_NetTotal) + Number(l_amt11);
	txtFamt_9.SetDataText('' + l_TotalVatAdjTmp);
	
	 if(Trim(txtNetAmt_3.text) != "")
     {
             l_txtcontract_amt = Number(l_contract_famt*l_Exrate2);
	        txtcontract_amt.text = l_txtcontract_amt;
	}
	if(Trim(txtAdjAmt_4.text) != "")
    {
        
        l_txtcontract_amt = Number(l_contract_amt_adj*l_Exrate2);
        txt_AmtAdj.text = l_txtcontract_amt;
    }
     if(Trim(txtFamt_9.text) != "")
     {
        
        l_txtcontract_amt = Number(l_TotalVatAdjTmp*l_Exrate2);
        txtGrand_btotal.text = l_txtcontract_amt;
     }
     if(Trim(txtVatAmt_6.text) != "")
     {
        
        l_txtcontract_amt = Number(l_contract_fvat*l_Exrate2);
        txtvat_amt.text = l_txtcontract_amt;
     }
	if(Trim(txtVatadj_7.text) != "")
     {
        
        l_txtcontract_amt = Number(l_vat_adj*l_Exrate2);
        txtvat_amt_adj.text = l_txtcontract_amt;
     }
	else
	{
	    txtcontract_amt.text = "";
	}
	OnEdit();

}

//------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
       case 'cust_search':
            var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk='+cboCompany.GetData();
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txt_CustomerID.SetDataText(object[1]);//customer id
                    txtCustomer_nm_s.SetDataText(object[2]);//customer name
                    txt_CustomerPK.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;  
        case 'cust':
            var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk='+cboCompany.GetData();
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtCust_id.SetDataText(object[1]);//customer id
                    txtCust_nm.SetDataText(object[2]);//customer name
                    txtCust_pk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break; 
        case 'cust_to':
            var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk='+cboCompany.GetData();
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtCustto_id.SetDataText(object[1]);//customer id 
                    txtCustto_nm.SetDataText(object[2]);//customer name
                    txtCustto_pk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;  
          
        case 'PL_search':
             var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var oValue  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( oValue != null )
            {
               // txtPLPK.text = oValue[2]; 
                txtProject_nm_s.text   = oValue[1];
              //  txtPLID.text   = oValue[1];
            }
          
        break;  
        case 'Project':
             var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var oValue  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( oValue != null )
            {
                txtProject_pk.text = oValue[2]; 
                txtProject_nm.text   = oValue[1];
                txtProject_cd.text   = oValue[0];
            }
          
        break;
		
		case 'Bank_Acc':  
				if(txtCust_pk.text !="")
				{
					var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2009.aspx?p_Custto_id="+url_encode(txtCust_id.text)+'&p_Custto_name='+url_encode(txtCust_nm.text)+'&p_Cust_PK='+txtCust_pk.text;

					var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes');   
			   
					if ( object != null )  
					{
						if (object[0] != 0)
						{
							txtBank_Acc_pk.text = object[2];//pk 
							txtBank_Acc_cd.text = object[1];//code
							txtBank_Acc_nm.text = object[0] ;//name	
						}
					}
				}
				else
				{
					alert("Please,choose customer.");
				}
		break;                               
    }	       
} 
function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return escape(utftext);
}             
//----------------------------------------------------------------------
function OnDelete(index)
{
    switch(index)
    {
        case 0:
            if(txtsubtract_pk.GetData()!='')
            {
                if(confirm('Do you want to delete selected contract?'))
                {
                     flag='delete';
                     dat_gfqc00060_2.StatusDelete();
                     dat_gfqc00060_2.Call();
                     
                }
            }    
        break;
        case 1:
            if(confirm('Do you want to delete selected item(s)?'))
            {
                GridDetail.DeleteRow();
               
            }
        break;
    }         
}

//---------------------------------------------------------------------------------------------
function OnSumAmt()
{
    //alert('OnSumAmt');
    var ctrl = GridDetail.GetGridControl();
      var Total  = 0;
      var VAT_Amt = 0;
      var Sum_Adj_Amt = 0;
     var Amt = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     Total = Number(Total) + Number(GridDetail.GetGridData(i, 12));
	     VAT_Amt = Number(VAT_Amt)+ Number(GridDetail.GetGridData(i,10));
	    Amt = Number(Amt) + Number(GridDetail.GetGridData(i, 8));
	    Sum_Adj_Amt = Number(Sum_Adj_Amt)+ (Number(Total) - Number(VAT_Amt));
	   
	}
	//var l_amt = System.Round(Amt,2);
	txtAdjAmt_4.SetDataText( "" + System.Round(Amt,2));
	txtVatadj_7.text = "" + System.Round(VAT_Amt,2);
	OnChangeAmt();
  
}
//-------------------------------------------------------------------------------------
function  OnNew(index)
{
    txtTotalamt_5.text="";
    switch(index)
    {
        case 0: // New master
            flag='new';
            
            dat_gfqc00060_2.StatusInsert();
            txtuser_pk.text =  "<%=Session("USER_PK") %>";
           GridDetail.ClearData();
           for(var i = 1; i < GridTerms.rows; i++)
           {
                for(var j = 3; j < GridTerms.cols ; j++)
                {
                    if(j !=6)
                    {
                        GridTerms.SetGridText(i, j, "");
                    }    
                }                
           }
           ChangeEx();
            chkauto_YN.SetDataText("Y");
        break;
        case 1: // new free detail
            GridDetail.AddRow();
            GridDetail.SetGridText( GridDetail.rows-1, 2, txtsubtract_pk.text); //master_pk	  
        break;
       case 2: // new free detail
       if(GridDetail.col=="3")
       {
            var path = System.RootURL + '/standard/forms/gf/qc/gfqc00050_1.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             var isAlready, j ;                                                     
             if ( object != null )
             {
                   
                    for( var i=0; i < object.length; i++)	  
                    {	
                         var arrTemp = new Array();
                         arrTemp = object[i];
                         isAlready = 0 ;
                          for(var k=1; k<GridDetail.rows;k++)
                          {
	                        //alert(GridDetail.GetGridData(k , 15));
	                        //alert(arrTemp[0]);
	                        if (GridDetail.GetGridData(k , 15)== arrTemp[0]) // da co item_pk
					        {					            					            
						        isAlready=1;						        
						        j = k ;						        
						        break;	
					        }		
                         }
                         
                    
                     if(isAlready==0) 
	                    {    
                        
                            if(i != 0)
                            {
                                arrTemp = object[i];
                                GridDetail.AddRow();
                                GridDetail.SetGridText( GridDetail.rows-1, 2, txtsubtract_pk.text); //master_pk	    	                                               
                                GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                             }
                             else 
                             {
                                arrTemp = object[i];                                
                                GridDetail.SetGridText( GridDetail.rows-1, 2, txtsubtract_pk.text); //master_pk	    	                                               
                                GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom                                
                             }   
                         }
                      else 
                        {
                             GridDetail.RemoveRowAt(j) ;
                        }      
                    }		            
             }  
             GridDetail.SetGridText(GridDetail.rows-1,1,'') 
      }
        break;
          
               case 4: // new free detail
            var path = System.RootURL + '/standard/forms/gf/qc/gfqc00050_1.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             var isAlready, j ;                                                     
             if ( object != null )
             {
                   
                    for( var i=0; i < object.length; i++)	  
                    {	
                         var arrTemp = new Array();
                         arrTemp = object[i];
                         isAlready = 0 ;
                          for(var k=1; k<GridDetail.rows;k++)
                          {
	                        //alert(GridDetail.GetGridData(k , 15));
	                        //alert(arrTemp[0]);
	                        if (GridDetail.GetGridData(k , 15)== arrTemp[0]) // da co item_pk
					        {					            					            
						        isAlready=1;						        
						       // j = k ;						        
						        break;	
					        }		
                         }
                    
                     if(isAlready==0) 
	                    {    
                        
                            arrTemp = object[i];
                            GridDetail.AddRow();
                            GridDetail.SetGridText( GridDetail.rows-1, 2, txtsubtract_pk.text); //master_pk	    	                                               
                            GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                            GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                            GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                            GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                            GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                         }
                      else 
                        {
                             GridDetail.RemoveRowAt(j) ;
                        }      
                    }		            
             }  
             GridDetail.SetGridText(GridDetail.rows-1,1,'') 
             break;
    }        
}
//------------------------------------------------------------------------
function OnSearch(index)
{
   switch(index)
    {
        case 0: // Show data on searching grid
            dat_gfqc00060_3.Call("SELECT"); 
        break;
        case 1: // Show data on control when click on searching grid
            txtsubtract_pk.SetDataText(GridSearch.GetGridData(GridSearch.row,0));
            flag = 'search';            
            dat_gfqc00060_2.Call('SELECT');
        break;    
    }
    
}
//--------------------------------------------------------------------
function OnEdit()
{
//     if ((event.col == 7) || (event.col ==8))
//                {
//                    if (event.row > 4)
//                    {
//                        
//                        GridTerms.SetGridText(event.row,event.col,''); 
//                        return;
//                    }
//                    
//                }
	            var ctrl   = GridTerms.GetGridControl();
	            var amount = 0;
            	var n = 0, i ;
            	// kiem tra            	
            	for(i = 1; i < GridTerms.rows; i++)
            	{
	               var strRate = GridTerms.GetGridData(i, 6); // code 
	            
	                    if (strRate =="50")
	                    {
	                            GridTerms.SetGridText(event.row, 4,'');  // amt
	                            GridTerms.SetGridText(event.row, 3,'');  // rate
	                    }
	                    else
	                    {	                                   
                           n += Number(GridTerms.GetGridData(i,3));
                           //alert(n);
                            if(n>100)
                            {
                                 alert("The total value can not large than 100 percent!!");
                                 GridTerms.SetGridText(event.row, 3,''); 
                                 GridTerms.SetGridText(event.row, 4,''); 
                                 return;
                            }
	                     }            

	            }  // for
             amount = Number(txtFamt_9.GetData());
             for( i = 1; i < GridTerms.rows ; i++)
             {
                 if( Number(GridTerms.GetGridData(i, 3)) != 0 && GridTerms.GetGridData(i, 3) != '') 
                 {
                     GridTerms.SetGridText(i, 4, Math.round(Number(GridTerms.GetGridData(i, 3)) / 100 * amount)) ; 
                 }
             }
}

function OnDataReceive(obj)
{
    switch(obj.id)
    {  
      
	  case "dso_getCompany":
               dat_gfqc00060_1.Call('SELECT');
        break; 
        case "dso_get_rate_book":
               dat_gfqc00060_1.Call(); 
        break; 
        case "dso_get_rate":
            
            //dat_gfqc00060_1.Call('SELECT');
            var l_txtNetAmt_3,l_txtAdjAmt_4,l_txtFamt_9,l_txtTotalamt_5,l_txtVatAmt_6,l_txtVatadj_7 = 0;
            var l_ex_rate = 0;
            var l_txtcontract_amt = 0;
            l_ex_rate = Number(txtExrate2.text);
            if(Trim(txtNetAmt_3.text) != "")
            {
                l_txtNetAmt_3 = Number(txtNetAmt_3.text);
                
                l_txtcontract_amt = Number(l_txtNetAmt_3*l_ex_rate);
                txtcontract_amt.text = l_txtcontract_amt;
                
                
            }
            
            
            if(Trim(txtAdjAmt_4.text) != "")
                {
                    l_txtAdjAmt_4 = Number(txtAdjAmt_4.text);
                    l_txtcontract_amt = Number(l_txtAdjAmt_4*l_ex_rate);
                    txt_AmtAdj.text = l_txtcontract_amt;
                }
             if(Trim(txtFamt_9.text) != "")
             {
                l_txtFamt_9 = Number(txtFamt_9.text);
                l_txtcontract_amt = Number(l_txtFamt_9*l_ex_rate);
                txtGrand_btotal.text = l_txtcontract_amt;
             }
          //  if(Trim(txtTotalamt_5.text) != "")
            // {
              //  l_txtTotalamt_5 = Number(txtTotalamt_5.text);
                //l_txtcontract_amt = Number(l_txtTotalamt_5*l_ex_rate);
              //  txtGrand_btotal.text = l_txtcontract_amt;
            // }
             
             if(Trim(txtVatAmt_6.text) != "")
             {
                l_txtVatAmt_6 = Number(txtVatAmt_6.text);
                l_txtcontract_amt = Number(l_txtVatAmt_6*l_ex_rate);
                txtvat_amt.text = l_txtcontract_amt;
             }
             if(Trim(txtVatadj_7.text) != "")
             {
                l_txtVatadj_7 = Number(txtVatadj_7.text);
                l_txtcontract_amt = Number(l_txtVatadj_7*l_ex_rate);
                txtvat_amt_adj.text = l_txtcontract_amt;
             }
            else
            {
                l_txtcontract_amt = Number(l_txtNetAmt_3/l_ex_rate);
                l_txtcontract_amt = Number(l_txtAdjAmt_4/l_ex_rate);
                l_txtcontract_amt = Number(l_txtFamt_9/l_ex_rate);
                l_txtcontract_amt = Number(l_txtVatAmt_6/l_ex_rate);
                l_txtcontract_amt = Number(l_txtVatadj_7/l_ex_rate);
                
 //               txtcontract_amt.text = "";
 //               txt_AmtAdj.text = "";
  //              txtGrand_btotal.text = "";
            }
        break; 
        
        case "dat_gfqc00060_1":          
            if(flag != 'search')
            {
                
                for(i = 1; i < GridDetail.rows; i++)
                {
                    if(GridDetail.GetGridData(i, 2)=='')
                    {
                        GridDetail.SetGridText(i, 2, txtsubtract_pk.text);
                        GridDetail.SetRowStatus(i, 0x20);
                    }    
                }
                dat_gfqc00060_4.Call();
              }
              else
              {
                dat_gfqc00060_4.Call('SELECT');
              }   
        break;  
        case "dat_gfqc00060_2":        
           if(flag== 'delete')
           {
                dat_gfqc00060_3.Call('SELECT');
                return;
            }   
            
               OnChangeAmt();
                
               if(flag !='search') //update
               {
                    for(i=1;i< GridTerms.rows; i++)
                    {
                        GridTerms.SetGridText(i, 1, txtsubtract_pk.text);
                        //alert(GridTerms.GetGridData(i,0));
                        if(GridTerms.GetGridData(i,0) == '')
                        {
                        
                            GridTerms.SetRowStatus(i, 0x20);
                        }
                    }
                    dat_gfqc00060_1.Call();
               }
                else
                {                   
                 dat_gfqc00060_1.Call("SELECT");                              
                }
               
        break; 
        case "dat_gfqc00060_4":
            if(flag == 'new')
            {
                dat_gfqc00060_3.Call('SELECT');
            }
        break;
          
    }  
}
//---------------------------------------------------------------------------
function OnChangeAmt_Receive()
{
    dso_get_rate.Call();
    OnChangeAmt();
    
}
//-----------------------------------------------------------------
 function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
var x = c.toUpperCase().charCodeAt(0);
event.keyCode = x;
}
//-------------------------------------------------------------------------
function OnEditDetail()
{
   
     var tmp=0;
    var l_qty = GridDetail.GetGridData(GridDetail.row,6);
    var l_u_price = GridDetail.GetGridData(GridDetail.row,7);
    var l_amt = Number(l_qty) * Number(l_u_price);
    GridDetail.SetGridText(GridDetail.row,8,'' + l_amt);
    var l_vat_rate = GridDetail.GetGridData(GridDetail.row,9);
    if(!isNaN(l_vat_rate)){
	    l_vat_rate = Number(l_vat_rate);
	}else
	{
	    l_vat_rate =0;
	}
    var l_vat_amt = (Number(l_vat_rate)/100) * Number(l_amt);
    GridDetail.SetGridText(GridDetail.row,10,'' + l_vat_amt);
    var l_amt_adj=  GridDetail.GetGridData(GridDetail.row,11);
    var l_total = Number(l_amt) + Number(l_vat_amt) + Number(l_amt_adj);
    GridDetail.SetGridText(GridDetail.row,12,'' + l_total);
    
}
//------------------------------------------------------------------------
 function UnDelete()
    {
        GridDetail.UnDeleteRow();
    }
//------------------------------------------------------------------------
function onPrint()
{
   // var url = '/standard/reports/gf/qc/gfqc00010_contractinqAR.aspx?p_company_pk=' + lstComp.GetData() + '&p_partner_pk=' + txtPartnerPk.GetData() + '&p_pl_pk=' + txtPL_PK.GetData();
   // System.OpenTargetPage( System.RootURL+url , "newform" );
}
//--------------------------------------------------------------------------------
function OnValidate()
{
    if(txtContractNo.GetData()=="")
    {
        alert('Please inpput contract no first.');
        txtContractNo.GetControl().focus();
        return false;
    }
    if(txtProject_pk.GetData()=="")
    {
        alert('Please select project first.');
        txtProject_cd.GetControl().focus();
        return false;
    }
    if(txtCust_pk.GetData()=="")
    {
        alert('Please select customer first.');
        txtCust_id.GetControl().focus();
        return false;
    }
   
    return true;
}
//-------------------------------------------------------------------------------
function OnChangeCurrent()
{
    
    dso_get_rate.Call();
    
    
} 
//----------------------------------------------------------------------------------
function UnDelete()
{ 
    GridDetail.UnDeleteRow();
}
//----------------------------------------------------------------------------------
function OnExcel()
{
     if(txtsubtract_pk.text !="")
            {
                var url = '/standard/reports/gf/qc/gfqc00060_1.aspx?p_tac_subcontract_pk=' + txtsubtract_pk.GetData() + '&p_company=' + cboCompany.GetData() + '&p_tr_date=' + dbContdt.GetData() + '&l_contract_ccy=' + listccy.value + '&contract_no=' + txtContractNo.text;
                System.OpenTargetPage( System.RootURL+url , "newform" );
            }
            else
            {
                alert("Please select code master!!!");
            }

}
//----------------------------------------------------------------------------------
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
<!---------------------------------------------------------------------------------------->
 
   <gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="AC_PRO_60020020_RATE"> 
                <input> 
                     <input bind="dbContdt"/>
                     <input bind="cboCompany"/>
                     <input bind="listccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtExrate2"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_get_rate_book" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="AC_PRO_60020020_RATE"> 
                <input> 
                     <input bind="dbContdt"/>
                     <input bind="cboCompany"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtexratebook"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
 
 <!--------------------------------------------------------------------------------------->   
<gw:data id="dat_gfqc00060_1"  onreceive="OnDataReceive(this)" > 
    <xml> 
          <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60020020_grid_terms" procedure="ac_upd_60020020_grid_terms"   > 
            <input bind="GridTerms">                    
                <input bind="txtsubtract_pk" /> 
            </input> 
            <output bind="GridTerms" /> 
        </dso> 
    </xml> 
</gw:data>

 <!--------------------------------------------------------------------------->   
 <gw:data id="dat_gfqc00060_3"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"    function="ac_sel_60020020_search"> 
            <input bind="GridSearch"> 
				<input bind="dtFrom"/> 
				<input bind="dtTo"/> 
                <input bind="txtCustomer_nm_s" /> 
                <input bind="txtProject_nm_s" /> 
                <input bind="txtContract_s" />
            </input> 
            <output bind="GridSearch" /> 
        </dso> 
    </xml> 
</gw:data>
 
 
<!---------------------------------------------------------------------------------------->
<gw:data id="dat_gfqc00060_4"  onreceive="OnDataReceive(this)" > 
    <xml> 
    
        <dso id="1" type="grid"   parameter="0,2,3,4,5,6,7,8,9,10,11,13,14,15,16" function="ac_sel_60020020_dtl" procedure="ac_upd_60020020_dtl"   > 
            <input bind="GridDetail">                    
                <input bind="txtsubtract_pk" /> 
            </input> 
            <output bind="GridDetail" /> 
        </dso> 
    </xml> 
</gw:data>

<!----------------------------------------------------------------------------------------->
<gw:data id="dat_gfqc00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,50,51,52,53,54,55" function="ac_sel_60020020_mst" procedure="ac_upd_60020020_mst">
                <input>
                   
                     <inout bind="txtsubtract_pk" />
                     <inout bind="cboCompany" />
                     <inout bind="txtCust_pk" />
                     <inout bind="txtProject_pk" />
                     <inout bind="dbContdt" />
                     
                     <inout bind="txtContractNo" />
                     <inout bind="dbWorkingfromdt" />
                     <inout bind="dbWorkingTo" />                     
                     <inout bind="dbConfirmdt" />
                     <inout bind="txtExrate2" />
                     
                     <inout bind="txtcontract_amt" />
                     <inout bind="listccy" />
                     <inout bind="txt_AmtAdj" />
                     <inout bind="txtGrand_btotal" />
                     <inout bind="txtuser_pk" />
                     
                     <inout bind="txtExrate1" />
                     <inout bind="txtNetAmt_3" />
                     <inout bind="txtAdjAmt_4" />
                     <inout bind="txtFamt_9" />
                     <inout bind="txtUnitprice" />
                     
                     <inout bind="txtQuantity" />
                     <inout bind="lstUnit" />
                     <inout bind="txtterms_type" />
                     <inout bind="chkauto_YN" />
                     <inout bind="txtindex_no" />
                     
                     <inout bind="lstArea" />
                     <inout bind="lstBiztype" />
                     <inout bind="txtadv_famt" />
                     <inout bind="txtpay_famt" />
                     <inout bind="txtpaytr_famt" />
                     
                     <inout bind="txtadv_amt" />
                     <inout bind="txtpay_amt" />
                     <inout bind="txtpaytr_amt" />
                     <inout bind="txtcontract_vatamt" />
                     <inout bind="txtVatTotal_8" />
                     
                     
                     <inout bind="txtVatAmt_6" />
                     <inout bind="txtVatadj_7" />                    
                     <inout bind="txtvat_amt" />
                     <inout bind="txtvat_amt_adj" />
                     <inout bind="txtp_pk" />
                     
                     <inout bind="txtRemark" />
                     <inout bind="txtLRemark" />
                     <inout bind="txttr_status" />
                     <inout bind="txttac_subcontract_req_pk" />
                     <inout bind="txtRequestNo" />
                     
                     <inout bind="lstVat" />
                     <inout bind="txtProject_cd" />
                     <inout bind="txtProject_nm" />
                     <inout bind="txtCust_id" />
                     <inout bind="txtCust_nm" />

					 <inout bind="txtDesCnt" />
                     <inout bind="txtLDesCnt" />
					 <inout bind="txtguarantee" />
					<inout bind="txtBank_Acc_pk" />
					<inout bind="txtBank_Acc_cd"/>
					<inout bind="txtBank_Acc_nm"/>
					
					
                 </input>
            </dso>
        </xml>
    </gw:data>
	<gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="cboCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------------------------->    
<table border="1" width="100%" cellpadding=0 cellspacing=0>
	<tr>
		<td id="left" width="25%" valign=top>
		    
		        <table border="0" width="100%" cellpadding=0 cellspacing=0  id="table5">
		            <tr>
		                <td width=100%>
		                    <fieldset style="width: 96%;  padding: 2">
		                         <table border="0" width="100%" cellpadding=0 cellspacing=0  id="table5">
		                            <tr style="height:">
										<td style="width: 10%" align="right">Date&nbsp;</td>
										<td colspan="2" style="width: 27%; white-space: nowrap"><gw:datebox id="dtFrom" lang="1"/>~<gw:datebox id="dtTo" lang="1"/></td>
										<td width="1%" align="right"><gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch(0)" /></td> 
									</tr>
					                <tr>
						                <td width="10%" align="right"><a title="Click here to select Customer" onclick="OnPopUp('cust_search')" href="#tips"
                                                     style="text-decoration: none; color=#0000ff"><b>Customer</b></a></td>
                                        <td width="25%" colspan=2 ><gw:textbox id="txtCustomer_nm_s" onenterkey="OnSearch(0)" styles="width:98%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset1" img="reset" alt="Reset" onclick="txtCustomer_nm_s.text='';" /></td>                                     
					                </tr>
					                <tr>
						                <td width="10%" align="right"><a title="Click here to select PL" onclick="OnPopUp('PL_search')" href="#tips"
                                                     style="text-decoration: none; color="0000ff"><b>PL</b></a></td>
                                        <td width="25%" colspan=2 ><gw:textbox id="txtProject_nm_s" onenterkey="OnSearch(0)" styles="width:98%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset2"  img="reset" alt="Reset" onclick="txtProject_nm_s.text='';" /></td>                                     
					                </tr>
					                <tr>
						                <td width="10%" align="right"><a title="Click here to select Customer" onclick="OnPopUp('Charger')" href="#tips"
                                                     style="text-decoration: none; color=#0000ff"><b>Contract</b></a></td>
                                        <td width="25%" colspan=2 ><gw:textbox id="txtContract_s" onenterkey="OnSearch(0)" styles="width:98%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset3" img="reset" alt="Reset" onclick="txtContract_s.text='';" /></td>  
						                                                   
					                </tr>
					              </table>  
		                     </fieldset>
		                </td>
		            </tr>
					<tr>
						<td width="100%"  colspan=4>
						    <gw:grid   
		                        id="GridSearch"  
		                        header="_pk|No|Contract|Project"   
		                        format="0|0|0|0"  
		                        aligns="0|1|0|0"  
		                        defaults="|||"  
		                        editcol="1|1|1|1"  
		                        widths="0|600|1200|1500"  
		                        styles="width:100%; height:460px"   
		                        sorting="F"   
			                    
			                    oncellclick="OnSearch(1)"
		                        onselchange="OnSearch(1)" 
		                         /> 
						</td>
                    </tr>
				</table>
		</td>
		<td id="right" width="75%" valign=Top>
		<table border="0" cellpadding=0 cellspacing=0 width="100%" id="table4">
			<tr>
				<td colspan="2">
					<fieldset style="width: 96%;  padding: 2">
					<table border="0" width="100%" cellpadding=0 cellspacing=0  id="table5">
						<tr>
							<td colspan="2">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<tr>
											<td width="17%">Company</td>
											<td width="45%"><gw:list id="cboCompany" styles="width:100%;" /></td>
											<td width="10%" align="right" >Status</td>
											<td width="20%" ><gw:list id="cboStatus" styles="width:100%;" /></td>
											<td width="1%" align="right"><gw:button id="btnNewMST" img="new" alt="New" onclick="OnNew(0)" /></td>
											<td width="1%" align="right"><gw:button id="btnSaveMST" img="save" alt="Save" onclick="OnSave()" /></td>
											<td width="1%" align="right"><gw:button id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete(0)" /></td>
										</tr>	
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="70%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="18%"><a title="Click here to select PL" onclick="OnPopUp('Project')" href="#tips"
										style="text-decoration: none; color=#0000ff"><b>PL</b></a></td>
										<td width="29%" colspan=0 ><gw:textbox id="txtProject_cd" readonly='true' csstype="mandatory" styles="width:100%;" />
										<gw:textbox id="txtProject_pk" styles="width:98%;display:none" /></td>
										<td width="53%" colspan=0 ><gw:textbox id="txtProject_nm" csstype="mandatory" readonly='true' styles="width:99%;" /></td>
										<td width="1%" align="right"><gw:imgbtn id="btnreset4" img="reset" alt="Reset" onclick="txtProject_pk.text='';txtProject_cd.text='';txtProject_nm.text='';" /></td>
										
									</tr>
								</table>
							</td>
							<td width="30%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="right" ><a title="Biz. type"  style="color=#ffff00 "><font color="#000000">Biz. type</font></a></td>										
										<td width="60%" ><gw:list id="lstBiztype" styles="width:100%;" /></td>
									</tr>
								</table>
							</td>
						</tr>						
						<tr>
							<td width="70%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="18%"><a title="Contract No" csstype="mandatory" style="color=#ffff00 "><font color="#000000">
										Cont. No</font></td>
										<td width="72%"><gw:textbox id="txtContractNo" csstype="mandatory" onkeypress="Upcase()" styles="width:98%;" /></td>
										<td width="10%" align="right"><a title="Auto"  style="color=#ffff00 "><font color="#000000">
										Auto</font></td>
										<td width="1%" align="right"><gw:checkbox id="chkauto_YN" defaultvalue="Y|N" value="Y" onclick="chkChange()" /></td>
									</tr>
								</table>
							</td>
							<td width="30%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" colspan=0 align="right" ><a title="Area"  style="color=#ffff00 "><font color="#000000">
										Area</font></a></td>
										<td width="60%" colspan=0><gw:list id="lstArea" lang="1" styles="width:100%;" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="70%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="17%">Cont. dt</td>
										<td width="33%"><gw:datebox id="dbContdt"  lang="1"  lang="1" /></td>
										<td width="20%">Confirm dt</td>
										<td width="30%"><gw:datebox id="dbConfirmdt" lang="1"  lang="1" /></td>
									</tr>
								</table>
							</td>
							<td width="30%">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40%" align="right" ><a title="Request No"  style="color=#ffff00 "><font color="#000000">
										Request No</font></a></td>
										<td width="60%" colspan=0><gw:textbox id="txtRequestNo"  styles="width:100%;" /></td>
									</tr>
								</table>
							</td>
						</tr>
				        <tr>
							<td colspan="2">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="12%"><a title="Description(contract team)"  style="color=#ffff00 "><font color="#000000">
											Description</font></td>
											<td width="88%" ><gw:textbox  id="txtDesCnt" styles="width:100%;" /></td>
									</tr>
								</table>
							</td>
						</tr>  
						<tr>
							<td colspan="2">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td width="12%"><a title="Local description(contract team)"  style="color=#ffff00 "><font color="#000000">
										L.Description</font></td>
										<td width="88%"><gw:textbox  id="txtLDesCnt" styles="width:100%;" /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td valign="top" width=50%>
					<fieldset style="width: 96%; padding: 2">					
					<table border="0" cellpadding=1 cellspacing=1 width="100%" id="table6"> 
						<tr>
							<td width="20%"><a title="Click here to select Customer" onclick="OnPopUp('cust')" href="#tips"
                                     style="text-decoration: none; color=#0000ff"><b>Customer</b></a></td>
		                     <td width="30%"><gw:textbox id="txtCust_id" csstype="mandatory" style="width:100%"  readonly='true'  /> <gw:textbox id="txtCust_pk" styles="display: none;"  /></td>
		                     <td width="50%"><gw:textbox id="txtCust_nm" csstype="mandatory" style="width:100%"  readonly='true'  /></td>
		                     <td width=""><gw:imgbtn id="btnRest" img="reset" alt="Reset" onclick="txtCust_pk.text='';txtCust_id.text='';txtCust_nm.text='';" /></td>
						</tr>
						<tr>
							<td width="20%"><a title="Click here to select Bank_Account" onclick="OnPopUp('Bank_Acc')" href="#tips"
                                     style="text-decoration: none; color=#0000ff"><b>Bank_Acc</b></a></td>
							 
							<td width="30%"><gw:textbox id="txtBank_Acc_cd" csstype="mandatory" style="width:100%"  readonly='true'  /></td>
		                     <td width="50%"><gw:textbox id="txtBank_Acc_nm" csstype="mandatory" style="width:100%"  readonly='true'  /></td>
		                     <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtBank_Acc_pk.text='';txtBank_Acc_cd.text='';txtBank_Acc_nm.text='';" /></td>
						</tr>
						<tr>
		                <td width="20%"><a title="Remark"  style="color=#ffff00 "><font color="#000000">
				            Remark</font></a></td></td>
		                <td width="80%" colspan=3><gw:textbox id="txtRemark" styles="width:98%;"  /></td>
		               
	                </tr>
	                 <tr>
		                <td width="20%"><a title="Local Remark"  style="color=#ffff00 "><font color="#000000">
				            L.Remark</font></a></td>
		                <td width="80%" colspan=3><gw:textbox id="txtLRemark"  styles="width:98%;" /></td>
		               
	                </tr>
	               
					</table>
					</fieldset>
				</td>
				<td valign="top" rowspan=2 width=50%>
				
					<fieldset style="width: 92%; padding: 2" >
					
					<table border="0"  cellpadding=0 cellspacing=2 width="100%" id="table7">
						
						<tr>
							<td width="30%" align="left"><a title="Period of guarantee "  style="color=#ffff00 "><font color="#000000">
				            Guarantee</font></a></td>
							<td width="25%" colspan=3><gw:textbox id="txtguarantee"  text="1"  styles="width:82%;" type="number" format="###,###"/>
							<td width="25%" colspan=1 align=left>Month(s)</td>
							<td width="20%" colspan=2 align="right" ></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Working from date"  style="color=#ffff00 "><font color="#000000">Working</font></a></td>
							<td width="25%" colspan=3><gw:datebox id="dbWorkingfromdt"  lang="1" styles="width:98%;" /></td>
							<td width="25%" colspan=1 align="right">Currency</td>
							<td width="20%" colspan=2 align="right" ><gw:list id="listccy"  lang="1" onchange="OnChangeCurrent()" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Working Period To"  style="color=#ffff00 "><font color="#000000">
				            To</font></a></td>
							<td width="25%" colspan=3><gw:datebox id="dbWorkingTo" lang="1"  nullaccept styles="width:98%;" /></td>
							<td width="25%" colspan=1 align="right"><a title="Exchange rate"  style="color=#ffff00 "><font color="#000000">
				            Ex. rate</font></a></td>
							<td width="5%" colspan=1 align="right" ><gw:textbox id="txtExrate1" text="1"  styles="width:82%;" type="number" format="###,###.##R"/></td>
							<td width="15%" colspan=1 align="right" ><gw:textbox id="txtExrate2"  styles="width:90%;" type="number" format="###,###.##R" onenterkey="OnSearch()"/></td>
						</tr>
						
						<tr>
							<td width="30%" align="left"><a title="Quantity (manual input)"  style="color=#ffff00 "><font color="#000000">
				            Qty. (1)</font></a></td>
							<td width="25%" colspan=3><gw:textbox id="txtQuantity" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" styles="width:95%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
							<td width="25%" colspan=1 align="right">Unit</td>
							<td width="20%" colspan=2 align="right" ><gw:list id="lstUnit"  styles="width:100%;" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Unit price/ton (manual input)"  style="color=#ffff00 "><font color="#000000">
				            Price (2)</font></a></td>
							<td width="25%" colspan=3><gw:textbox id="txtUnitprice" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" styles="width:95%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
							<td width="25%" colspan=1 align="right">Vat(%)</td>
							<td width="20%" colspan=2 align="right" ><gw:list id="lstVat" onchange="OnChangeAmt()" styles="width:100%;" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Contract amount = (1) * (2)"  style="color=#ffff00 "><font color="#000000">
				            Net Amt (3)</font></a></td>
							
							<td width="20%" colspan=3><gw:textbox id="txtNetAmt_3" readonly= true  styles="width:95%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
							<td width="25%" colspan=1 align="right"><a title="Vat Amount = (3) *  Vat(%)"  style="color=#ffff00 "><font color="#000000">
				            VAT amt(6)</font></a></td>
							
							<td width="20%" colspan=2 align="right" ><gw:textbox id="txtVatAmt_6" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" readonly= true format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Contract amount (manual inpput)"  style="color=#ffff00 "><font color="#000000">
				            Adj Amt (4)</font></a></td>
							
							<td width="20%" colspan=3><gw:textbox id="txtAdjAmt_4" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()"   styles="width:95%;" format="#,###,###,###,###,###,###.##" type="number" /></td>
							<td width="25%" colspan=1 align="right"><a title="Adjusting vat amount (manual input)"  style="color=#ffff00 "><font color="#000000">
				            Vat adj (7)</font></a></td>
							<td width="20%" colspan=2 align="right" ><gw:textbox id="txtVatadj_7" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Total amount = (3) + (4)"  style="color=#ffff00 "><font color="#000000">
				            Total Amt (5)</font></a></td>
							<td width="25%" colspan=3><gw:textbox id="txtTotalamt_5" readonly= true format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;" /></td>
							<td width="25%" colspan=1 align="right"><a title="Vat amount after adjusting = (6) + (7)"  style="color=#ffff00 "><font color="#000000">
				            Vat total(8)</font></a></td>
							<td width="20%" colspan=2 align="right" ><gw:textbox id="txtVatTotal_8" readonly= true format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;" /></td>
						</tr>
						<tr>
							<td width="30%" align="left"><a title="Final amount = (5) + (8)"  style="color=#ffff00 "><font color="#000000">
				            Final Amt(9)</font></a></td>
							<td width="70%" colspan=6><gw:textbox id="txtFamt_9" readonly= true styles="width:99%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
							<!--td width="25%" colspan=1 align="right"><a title="Grand total = (10) + (7)"  style="color=#ffff00 "><font color="#000000">
				            Grd. amt(11)</font></a></td>
							<td width="20%" colspan=2 align="right" ><gw:textbox id="chkauto_YN"  readonly= true styles="width:95%;" format="#,###,###,###,###,###,###.##R" type="number" /></td-->
						</tr>
					</table>
					</fieldset>
				</td>
			</tr>
			<tr>
			        <!--0_pk|1_tac_crcontract_pk|2.Terms Type|3.Rate|4.Trans.Amt.|5_BooksAmt.|6_code|7.Valid From|8.Valid To--->
		                <td width="50%" colspan=1>
		                    <fieldset style="width: 96%;  padding: 2">
		                    <legend>Terms type management</legend>
                             <gw:grid   
		                        id="GridTerms"  
		                        
		                        header="_pk|_tac_crcontract_pk|Terms Type|Rate|Trans.Amt.|_BooksAmt.|_code|Valid From|Valid To"   
		                        format="0|0|0|1|1|0|0|4|4"  
		                        aligns="0|0|0|3|3|3|0|0|0"  
		                        defaults="||||||||"  
		                        editcol="1|1|1|1|1|1|1|1|1"  
		                        widths="0|0|1200|700|1100|0|0|1200|1200"  
		                        styles="width:100%; height:130px"   
		                        sorting="F"   
			                    acceptnulldate="T"
			                    onafteredit="OnEdit()"
		                     /> 
		                    </fieldset>
		                </td>
		               
	        </tr>
			<tr>
				<td colspan="2">
				
				<fieldset style="width: 96%;  padding: 2">
				<legend>Adjust management</legend>
				    <table border="0" width="100%"  cellpadding=0 cellspacing=0 id="table1">
		                <tr>
			                <td width="99%">&nbsp;</td>
			                <td width="4%"><gw:imgbtn id="ibtnNewFree" img="new" alt="New Detail" onclick="OnNew(1)"/></td>
							
			                <td width="4%"><gw:imgbtn id="ibtnNewDetail" img="popup" alt="New Detail" onclick="OnNew(4)"/></td>
						    <td width="4%"><gw:imgbtn id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="OnDelete(1)" /></td>
						   <td width="4%"><gw:imgbtn id="ibtUnDeleteDetail" img="udelete" alt="UnDelete Detail" onclick="UnDelete()" /></td>
						  
		                </tr>
		                <tr>
			                <td colspan="5">
			                    <gw:grid   
			                            id="GridDetail"  
			                            header="_PK|No|_TAC_CRCONTRACT_PK|Item code|Item name|UOM|Quantity|U/Price|Amount|Vat(%)|VAT Amt|Adjust|Total|Remark|Local Remark|_tco_item_pk|_famt_adj|_vat_famt|_famt"   
			                            format="0|0|0|0|0|0|1|1|0|0|0|1|1|1|0|0|1|0|0"  
			                            aligns="0|1|0|0|0|0|3|3|3|0|3|3|3|1|1|0|1|0|0"  
			                            defaults="||||||1||||||||||||"  
			                            editcol="1|1|1|1|1|1|1|1|0|1|0|1|1|1|1|1|1|1|0|0"  
			                            widths ="0|500|1500|2500|1000|1000|1000|2000|1000|1000|2000|2000|2000|0|0|0|0|0|0|0"  
			                            styles="width:100%; height:100"   
			                            sorting="T"   
				                        onafteredit="OnEditDetail();OnSumAmt()"  
				                        oncelldblclick="OnNew(2)"
				                        
			                     /> 
			                </td>
		                </tr>
	                </table>
			    </fieldset>
			    </td>
			</tr>
		</table>		
		</td>		
	</tr>	
</table>
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
<gw:list id="lstBookExRate" styles="width:100%;display:none" />        
<gw:textbox id="txtsubtract_pk" styles="width:100%;display:none" /> 
<gw:textbox id="txtuser_pk"  styles="width:95%;display:none" /> 
<gw:textbox id="txt_CustomerPK"  styles="width:95%;display:none" /> 
<gw:textbox id="txt_CustomerID"  styles="width:95%;display:none" /> 
<gw:textbox id="txtcontract_amt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" />
<gw:textbox id="txt_AmtAdj" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtGrand_btotal" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtterms_type"  styles="width:95%;display:none" /> 
<gw:textbox id="txtindex_no"  styles="width:95%;display:none" /> 
<gw:textbox id="txtadv_famt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtpay_famt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtpaytr_famt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtadv_amt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtpay_amt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtBank_Acc_pk"  styles="width:95%;display:none" />
<gw:textbox id="txtpaytr_amt"  styles="width:95%;display:none" /> 
<gw:textbox id="txtcontract_vatamt"  styles="width:95%;display:none" /> <p></p>
<gw:textbox id="txtvat_amt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtvat_amt_adj" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtp_pk"  styles="width:95%;display:none" /> 
<gw:textbox id="txttr_status"  styles="width:95%;display:none" /> 
<gw:textbox id="txttac_subcontract_req_pk"  styles="width:95%;display:none" /> 


<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date" style="display: none" />
<gw:textbox id="txtProposedByUserPk" style="display: none" />
<gw:textbox id="txtbookccy" style="display:none " />
<gw:textbox id="txtexratebook" style="display:none " />
<gw:list id="lstBook_ccy" style="width: 75%; display:none "></gw:list>

</body>
</html>
