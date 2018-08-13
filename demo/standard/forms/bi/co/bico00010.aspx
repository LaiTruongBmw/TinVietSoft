<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>COST ALLOCATION</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//---------------------------------------------------------
var G1_PAYMENT_PK    		= 0, 
    G1_TABLE_NM     	    = 1,  
    G1_PAYMENT_DT    	    = 2,  
	G1_SLIP_NO		        = 3,  
    G1_PARTNER              = 4,
	G1_PAY_AMT	            = 5,
    G1_CCY    	            = 6,
    G1_EX_RATE              = 7,
    G1_OUT_TYPE             = 8,
    G1_DESC                 = 9,
    G1_ALL                 = 10;
    	
	var 
	G3_ALLOCATE_PK        = 0,
	G3_TABLE_PK           = 1,
	G3_TABLE_NM           = 2,
	
	G3_WAREHOUSE	      = 3,
	G3_IN_DATE	          = 4,
	G3_SLIP_NO		      = 5,	
	G3_IN_TYPE		      = 6,
	G3_REF_NO	          = 7,	
	G3_SEQ	              = 8,
	G3_PARTNER		       = 9,  
	G3_ITEM_PK             = 10,
	G3_ITEM_CD		       = 11,
	G3_ITEM_NM		       = 12,
	G3_IN_QTY		       = 13,
	G3_IN_UOM		       = 14,
	G3_UNIT_PRICE          = 15,
	G3_ITEM_AMT            = 16,
	G3_VAT_RATE            = 17, 
	G3_VAT_AMT             = 18,
	G3_TOTAL_AMT           = 19,
	G3_CCY                 = 20,
	G3_DISCOUNT            = 21,  
	G3_PL                  = 22, 
	G3_ST_INCOME_D_PK      = 23, 
	G3_ALLOCATE_AMT        = 24;
//===================================================================================

function BodyInit()
{   
    //----------------------------
    System.Translate(document); 
     //----------------------------
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
   
//     var ctrl = grdInvoice.GetGridControl();     
//     ctrl.ColFormat(G1_AMOUNT)    = "#,###,###,###,###,###"; 
//	 
//	 var ctrl = grdCons.GetGridControl();     
//     ctrl.ColFormat(G2_CONS_QTY) = "#,###,###,###,###,###.##"; 		  		                              
 }
//=====================================================================================
function CallTotal()
{
    var vTotalMap = 0;
       for(var i = 1; i< grdMap.rows; i++)
       {
            if(Number(grdMap.GetGridData(i,G3_ALLOCATE_AMT))>0)
            {
                vTotalMap = vTotalMap + Number(grdMap.GetGridData(i,G3_ALLOCATE_AMT));
            }
       }   
       lblMapTotal.text  = vTotalMap.toFixed(2); 
}  
//=====================================================================================
function OnDelete()
{
    grdMap.DeleteRow();         
}  
//=====================================================================================
function OnProcess()
{
		if ( txtPaymentPK.text != '' )
		{
        	pro_bico00010.Call();
		}	
		else
		{
			alert("Pls select Payment to process!");
		}    
	     
}
//=====================================================================================
function OnSave()
{
    data_bico00010_2.Call();
}
//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {         		 
        case 'paylist':    			        
            data_bico00010.Call("SELECT");
        break;
		case 'MAP':    
		     txtPaymentPK.text = grdPayment.GetGridData(grdPayment.row,G1_PAYMENT_PK);	
		     txtTableNm.text   = grdPayment.GetGridData(grdPayment.row,	G1_TABLE_NM	);  
		     lbPayTotal.text   = grdPayment.GetGridData(grdPayment.row,	G1_PAY_AMT	);       
            data_bico00010_2.Call("SELECT");
        break; 	
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {   
        case "data_bico00010_2":            
            if ( grdMap.rows > 1 )
            {
                grdMap.SetCellBold( 1, G3_ALLOCATE_AMT,  grdMap.rows - 1, G3_ALLOCATE_AMT,  true);					 
                grdMap.SetCellBold( 1, G3_SLIP_NO, grdMap.rows - 1, G3_SLIP_NO, true);                  
                grdMap.SetCellBold( 1, G3_ITEM_CD, grdMap.rows - 1, G3_ITEM_NM, true);      
                grdMap.SetCellBgColor( 1, G3_ALLOCATE_AMT , grdMap.rows - 1, G3_ALLOCATE_AMT , 0xCCFFFF );           
            }  
            CallTotal(); 
            //----------------------               
        break;   
        case "pro_bico00010": 
			data_bico00010_2.Call('SELECT')
          //  grdCons.ClearData();                
        break;   
        case "data_bico00010":
            if ( grdPayment.rows > 1 )
            {
                grdPayment.SetCellBold( 1, G1_PAY_AMT,  grdPayment.rows - 1, G1_PAY_AMT,  true);					 
                grdPayment.SetCellBold( 1, G1_DESC, grdPayment.rows - 1, G1_ALL, true);                  
                grdPayment.SetCellBgColor( 1, G1_ALL , grdPayment.rows - 1, G1_ALL , 0xCCFFFF );           
            }  
        break;   
		
   }            
}

//===================================================================================
function OnCheck()
{  
	if ( chkALL.value == "Y")
	{
		var t_link = "";
		txtInvPK.text = "";
				
		for (var i=1; i<grdInvoice.rows;i++)
		{
			grdInvoice.SetGridText(i,G1_CHK,-1);
			
			txtInvPK.text = txtInvPK.text + t_link + grdInvoice.GetGridData(i,G1_INV_PK);
			t_link = ",";
			
			if (txtInvPK.text != "")
			{
				data_bico00010_2.Call("SELECT");
			}
		}
	}	
	else
	{
		for (var i=1; i<grdInvoice.rows;i++)
		{
			grdInvoice.SetGridText(i,G1_CHK,0);
		}	
		
		grdCons.ClearData();
	}
}
//=========================================================================
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
            
            right.style.width  ="98%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="35%";
            right.style.width  ="63%";
            
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
            left.style.width ="98%";
            
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
                    
            left.style.width   ="35%";
            right.style.width  ="63%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}  
//===================================================================================
function OnPopUp()
{
    if(txtPaymentPK.text != "")
    {
	    var url = System.RootURL + "/form/bi/co/bico00011.aspx";
	    var obj = System.OpenModal( url ,800 , 600,  'resizable:yes;status:yes', this);   
	        if(obj != null)
	        {
	            var temparr;
	            for( var i=0; i < obj.length; i++)	  
                 {	
                        arrTemp = obj[i];
                        grdMap.AddRow();                            
                        grdMap.SetGridText(grdMap.rows -1,G3_TABLE_PK ,txtPaymentPK.text );
                        grdMap.SetGridText(grdMap.rows -1,G3_TABLE_NM  , txtTableNm.text );    
                        for(var j =0 ; j<arrTemp.length; j++)
                        {               
                            grdMap.SetGridText(grdMap.rows -1,j+3 , arrTemp[j]);
                        }                       
                   }
	        }
	}else
	{
	    alert('Please, select a payment slip!')
	}
}
//===================================================================================
</script>

<body>   
    <!------------------------------------------------------------------>
    <gw:data id="data_bico00010" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid"  function="<%=l_user%>lg_sel_bico00010" > 
                 <input bind="grdPayment" >
			        <input bind="dtFrom" />
			        <input bind="dtTo" />
			        <input bind="txtPartner" />
			        <input bind="txtSlipRefNo" />
			        <input bind="chkAllocate" />
			        <input bind="radFlag" />
                </input>
                <output bind="grdPayment" />            
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico00010_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,10,23,24" function="<%=l_user%>lg_sel_bico00010_2" procedure="<%=l_user%>lg_upd_bico00010_2" > 
                <input bind="grdMap">                    
                   <input bind="txtItemNo2" />
			       <input bind="txtPaymentPK" />
			       <input bind="txtTableNm" />
                </input> 
                <output bind="grdMap" /> 
            </dso> 
        </xml> 
    </gw:data>		 
  
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bico00010" onreceive="OnDataReceive(this)"  > 
            <xml> 
                <dso  type="process" procedure="<%=l_user%>lg_pro_bico00010" > 
                    <input>
                        <input bind="txtPaymentPK" /> 
                        <input bind="txtTableNm" /> 
                        <input bind="radTab" /> 
                    </input> 
                    <output>
                        <output bind="txtReturnValue" />
                    </output>
                </dso> 
            </xml> 
    </gw:data>
   <!------------------------------------------>
        <table style="width: 100%; height: 100%" border=1>
            <tr style="height: 100%" >
                <td  style="width:35%" id="t-left" >
                    <table style="width: 100%; height: 100%" >
                        <tr  style="height: 5%">
                            <td align="right" style="width: 10%; white-space: nowrap">
                            Date
                            </td>
                            <td style="width: 60%; white-space: nowrap" colspan="3">
                                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                                ~
                                <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                            </td>                           
                           <td  style="white-space: nowrap; width:30%" align="left" >
                                <gw:radio id="radFlag" value="LG" styles="width:100%" > 
                                    <span value="LG" >Payment</span> 
                                    <span value="ACC" >ACC Payment</span>                                            
                                </gw:radio>
                            </td>
                            <td style="width: 1%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('paylist')" />
                            </td> 
                        </tr>
                        <tr style="height: 5%">
                             <td style="width: 10%; " align="right">
                                Partner
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch()" />
                            </td>
                            <td style="width: 10%; white-space: nowrap" align="right">
                                Slip/Ref No
                            </td>
                            <td style="width: 35%" >
                                <gw:textbox id="txtSlipRefNo" maxlen="100" styles='width:100%' onenterkey="OnSearch()" />
                            </td>    
                            
                            <td align="right" style="width: 5%; white-space: nowrap">                               
                                <gw:checkbox id="chkAllocate" styles="color:blue" defaultvalue="Y|N" value="N" > Allocated
                                </gw:checkbox>
                            </td>                       
                        </tr>
                        <tr  style="height: 95%">
                            <td colspan="10">
                                <gw:grid id='grdPayment'
                                header='_PK|_table_nm|Payment DT|Slip No|Partner |Pay amount|CCY|Ex. Rate|_Out Type|Payment Desc|Allocate AMT'
                                format='0|0|4|0|0|-2|0|0|0|0|-2'
                                aligns='0|0|0|0|0|0|2|0|0|0|0'
                                check='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|1200|1500|2000|1500|1500|1200|1200|2000|1500'
                                sorting='T'
                                autosize='T' 
                                styles='width:100%; height:100%'
                                oncellclick="OnSearch('MAP')"
                                />
                            </td>
                        </tr>
                    </table>
                </td>
                 <td style="width: 2%; white-space: nowrap; border-top:none; border-bottom:none" align="center">
                    <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                        style="cursor: hand" onclick="OnToggle('1')" />
                    <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                        style="cursor: hand" onclick="OnToggle('2')" />
                </td>
                <td style="width:63%" id="t-right">
                    <table style="width: 100%; height: 100%">
                        <tr  style="height: 45%">
                           <td colspan="10">
                            <table style="width:100%; height:100%">
                               
                                <tr style="height: 5%">                                                                        
                                    <td style="width: 40%;white-space:nowrap" colspan="2">
                                        <gw:radio id="radTab" value="1" styles="width:100%" > 
                                            <span value="1" >Qty</span> 
                                            <span value="2" >AMT</span>                                            
                                        </gw:radio>
                                    </td>  
                                    <td style="width: 1%">
                                       
                                    </td>                                 
                                    <td style="width: 27%; text-align: center">
                                        
                                    </td> 
                                     <td  style="white-space: nowrap" align="left">
                                        
                                    </td>
                                     <td  style="white-space: nowrap" align="left">
                                        
                                    </td>
                                     <td style="width: 1%">
                                        <gw:imgbtn img="popup" alt="TakeIn List" id="btnPopup" onclick="OnPopUp()" />
                                    </td>                                     
                                    <td style="width: 1%">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                                    </td>  
                                     <td style="width: 1%">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
                                    </td>  
                                    <td style="width: 1%">
                                        <gw:imgbtn img="process" alt="Process" id="btnProcess" onclick="OnProcess()" />
                                    </td>                                    
                                   
                                 </tr>
                                  <tr>
                                      <td style="width: 10%; white-space: nowrap" align="right">
                                    Slip No/Item
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtItemNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('MAP')" />
                                    </td>  
                                    <td style="width: 1%">
                                        <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('MAP')" />
                                    </td>                                 
                                    <td style="width: 27%; text-align: center; white-space:nowrap; display:none">
                                        <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                                    </td> 
                                    <td style="width: 10%">
                                        Payment:
                                    </td>
                                    <td style="width: 30%;" align='left'>
                                        <gw:label id="lbPayTotal" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                                    </td>
                                    <td style="width: 10%">
                                        Allocate:
                                    </td>
                                    <td style="width: 28%" colspan=4>
                                        <gw:label id="lblMapTotal" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                                    </td>
                                </tr>
                                 <tr  style="height: 90%">
                                    <td colspan="10">
                                       <gw:grid id='grdMap'
                                        header='_PK|_Payment_PK|_table_name|_Warehouse|In Date|Slip No|_In Type|Ref No|_SEQ|Partner|_item_pk|Item Code|Item Name|In Qty|_In UOM|_Unit Price|Item Amt|_Vat Rate|_Vat Amount|_Total Amount|_CCY|_Dis amt|_PL|_ST_INCOME_D_PK|Allocate AMT'
                                        format='0|0|0|0|4|0|0|0|0|0|0|0|0|-2|0|-2|-2|-2|-2|-2|0|0|0|0|-2'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        check='||||||||||||||||||||||||'
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1'
                                        widths='0|0|0|1500|1200|1500|1500|1500|0|1200|0|1500|2000|1500|1500|800|1500|1500|1500|1500|1500|1500|1500|1500|1000'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        />													 					  

                                    </td>
                                </tr>
                             </table>                          
                            </td>
                        </tr>                      
                    </table>
                    </td>
                </tr>            
        </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtPaymentPK" styles="width:100%; display:none" />
<gw:textbox id="txtTableNm" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
