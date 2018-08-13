<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK INCOMING</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

    
var G2_WAREHOUSE	= 0,
	G2_IN_DATE	    = 1,
	G2_SLIP_NO		= 2,
	G2_IN_TYPE		= 3,
	G2_REF_NO	    = 4,	
	G2_SEQ	            = 5,
	G2_PARTNER			= 6,
	G2_ITEM_PK          = 7,
	G2_ITEM_CD		    = 8,
	G2_ITEM_NM		    = 9,
	G2_IN_QTY		    = 10,
	G2_IN_UOM		    = 11,
	G2_UNIT_PRICE       = 12,
	G2_ITEM_AMT         = 13,
	G2_VAT_RATE         = 14,
	G2_VAT_AMT          = 15,   
	G2_TOTAL_AMT        = 16, 
	G2_CCY              = 17,
	G2_DISCOUNT         = 18,	
	G2_PL               = 19,   
    G2_ST_INCOME_D_PK   = 20;

//===================================================================================
var callerWindowObj = dialogArguments;    
function BodyInit()
{   
    ldate=dtFrom1.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom1.value=ldate ;
    //----------------------------
    radFlag.value = callerWindowObj.radFlag.value;
    txtPaymentPK.text = callerWindowObj.txtPaymentPK.text;
    //----------------------------
    System.Translate(document); 
    BindingDataList();    
    //----------------------------
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>"; 
	 lstWH.SetDataText( data + "||");
     lstWH.value = '';       
         
  		                              
 }
//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {   
        case 'InCome':            
            data_bico00011_1.Call("SELECT");
        break;
		 	
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        
        case "data_bico00011_2":            
            if ( grdMap.rows > 1 )
            {
                grdMap.SetCellBold( 1, G3_ALLOCATE_AMT,  grdMap.rows - 1, G3_ALLOCATE_AMT,  true);					 
                grdMap.SetCellBold( 1, G3_SLIP_NO, grdMap.rows - 1, G3_SLIP_NO, true);                  
                grdMap.SetCellBold( 1, G3_ITEM_CD, grdMap.rows - 1, G3_ITEM_NM, true);      
                grdMap.SetCellBgColor( 1, G3_ALLOCATE_AMT , grdMap.rows - 1, G3_ALLOCATE_AMT , 0xCCFFFF );           
            }   
            //----------------------               
        break;   
        case "pro_bico00011": 
			data_bico00011_2.Call('SELECT')
          //  grdCons.ClearData();                
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
				data_bico00011_2.Call("SELECT");
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
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   var ctrl = oGrid.GetGridControl();
   if(oGrid.rows > 1)
   {   
      for(var i = 0; i< ctrl.SelectedRows ; i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(ctrl.SelectedRow(i),j)
         }         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {	     
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
//===================================================================================
</script>

<body> 
	<!------------------------------------------------------------------>
    <gw:data id="data_bico00011_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_bico00011"  > 
                <input bind="grdInCome">                    
                     <input bind="dtFrom1" />
			        <input bind="dtTo1" />
			        <input bind="txtPartner1" />
			        <input bind="txtItemNo" />
			        <input bind="lstWH" />
			        <input bind="txtPaymentPK" />
			        <input bind="radFlag" />
                </input> 
                <output bind="grdInCome" /> 
            </dso> 
        </xml> 
    </gw:data>
   <!------------------------------------------>
        <table style="width: 100%; height: 100%" border=1>
            <tr style="height: 100%" >                
                <td style="width:63%" id="t-right">
                    <table style="width: 100%; height: 100%">
                        <tr  style="height: 5%">
                            <td align="right" style="width: 10%; white-space: nowrap">
                            Date
                            </td>
                            <td style="width: 35%; white-space: nowrap" >
                                <gw:datebox id="dtFrom1" lang="<%=Application("Lang")%>" mode="01" />
                                ~
                                <gw:datebox id="dtTo1" lang="<%=Application("Lang")%>" mode="01" />
                            </td>                           
                            <td style="width: 10%; " align="right">
                                W/H    
                            </td>
                            <td style="width: 30%; ">
                                <gw:list id="lstWH" styles="width:100%;" />
                            </td>
                            <td style="width: 5%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('InCome')" />
                            </td> 
                            <td style="width: 5%">
                                <gw:imgbtn img="select" alt="Select" id="btnSelect" onclick="OnSelect(grdInCome)" />
                            </td> 
                        </tr>
                        <tr style="height: 5%">
                             <td style="width: 10%; " align="right">
                                Partner
                            </td>
                            <td style="width: 40%">
                                <gw:textbox id="txtPartner1" maxlen="100" styles='width:100%' onenterkey="OnSearch('InCome')" />
                            </td>
                            <td style="width: 10%; white-space: nowrap" align="right">
                                Slip/Item
                            </td>
                            <td style="width: 35%" colspan=3>
                                <gw:textbox id="txtItemNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('InCome')" />
                            </td>                                           
                        </tr>
                        <tr  style="height: 90%">
                            <td colspan="10">                            
                                <gw:grid id='grdInCome'
                                header='_Warehouse|In Date|Slip No|In Type|Ref No|_SEQ|Partner|_Item_PK|Item Code|Item Name|In Qty|In UOM|Unit Price|Item Amt|_Vat Rate|_Vat Amount|_Total Amount|_CCY|_Dis amt|_PL|_ST_INCOME_D_PK'
                                format='0|4|0|0|0|0|0|0|0|0|-2|0|-2|-2|-2|-2|-2|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='||||||||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|1200|1500|1500|1500|0|1200|2000|1500|2000|1500|800|1500|1500|1500|1500|1500|1500|1500|1500'
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
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtPaymentPK" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
<gw:radio id="radFlag" value="LG" style=" display:none" > 
    <span value="LG" >Payment</span> 
    <span value="ACC" >ACC Payment</span>                                            
</gw:radio>
<!---------------------------------------------------------------------------------->
</html>
