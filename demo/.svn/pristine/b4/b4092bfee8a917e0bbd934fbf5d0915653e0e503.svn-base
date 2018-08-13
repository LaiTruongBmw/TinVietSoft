<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ASSET DEPR SCHEDULE</title>
</head>

<script type="text/javascript" language="javascript">

var p_update = 0;

var G1_ASSET_PK   = 0,
    G1_ASSET_CODE = 1,
    G1_ASSET_NAME = 2;
	G1_ASSET_AMT  = 3,
	G1_SD_AMT     = 4,
	G1_BAL_AMT    = 5;
      
var G2_DEPR_SD_ID = 0,
    G2_DETAIL_PK  = 1,
    G2_ASSET_PK   = 2,
    G2_TR_AMOUNT  = 3,
	G2_PROCESS_YN = 4,
	G2_CLOSE_YN   = 5,  
    G2_REMARK     = 6,
	G2_EXP_ACC_01_CD  = 7, 
	G2_EXP_ACC_01_AMT = 8,
	G2_EXP_ACC_02_CD  = 9, 
	G2_EXP_ACC_02_AMT = 10,
	G2_EXP_ACC_03_CD  = 11, 
	G2_EXP_ACC_03_AMT = 12,
	G2_EXP_ACC_04_CD  = 13, 
	G2_EXP_ACC_04_AMT = 14,
	G2_EXP_ACC_05_CD  = 15, 
	G2_EXP_ACC_05_AMT = 16;
 
var arr_FormatNumber = new Array();	         
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	//--------------------------------------
	
	dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -100));
	dtTo.SetDataText(System.AddDate(dtTo.GetData(), + 3000));
	
	FormFormat();    
    //--------------------------------------            
}
//=================================================================================
function FormFormat()
{  
     var data="";  
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";       
     lstSearchDept.SetDataText(data+"||");
     lstSearchDept.value="";        

	 data = "<%=ESysLib.SetListDataSQL("select pk, asset_type_code || ' * '| | asset_type_name from tlg_ma_asset_type a where  del_if=0 order by asset_type_code")%>";       
	 lstSearchAssType.SetDataText(data+'||');
     lstSearchAssType.value='';
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>";       	 
	 lstSearchAssGrp.SetDataText(data+'||');
     lstSearchAssGrp.value='';	  
	 
	 var ctrl = grdAsset.GetGridControl();
     ctrl.ColFormat(G1_ASSET_AMT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G1_SD_AMT)    = "###,###,###,###,###.##";
	 ctrl.ColFormat(G1_BAL_AMT)   = "###,###,###,###,###.##"; 	 
	 
	 ctrl = grdDetail.GetGridControl();
     ctrl.ColFormat(G2_TR_AMOUNT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EXP_ACC_01_AMT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EXP_ACC_02_AMT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EXP_ACC_03_AMT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EXP_ACC_04_AMT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EXP_ACC_05_AMT) = "###,###,###,###,###.##";
	 
	 arr_FormatNumber[G2_TR_AMOUNT] = 2; 
}
 
//=================================================================================
function OnSave(pos)
{ 
      switch (pos)         
      {		        
            case 'MASTER' :
           
				if ( confirm("Do you want to save this asset?") )
				{
					p_update = 1;
                	data_fpma00200_1.Call();
				}	
 
            break; 
      }  
}
 
//=================================================================================
function OnDataReceive(p_oData)
{
  	switch(p_oData.id)
  	{
	    case 'data_fpma00200':
			if ( grdAsset.rows > 1 )
			{
				grdAsset.SetCellBold( 1, G1_ASSET_CODE, grdAsset.rows - 1, G1_ASSET_CODE, true);
				grdAsset.SetCellBgColor( 1, G1_ASSET_AMT, grdAsset.rows - 1, G1_BAL_AMT, 0xCCFFFF );
				
				grdAsset.GetGridControl().Cell( 7, 0, G1_BAL_AMT, grdAsset.rows - 1, G1_BAL_AMT)  = 0x3300cc;
			}
				 
	        lblSearchAssetCount.text = (grdAsset.rows - 1) + ' (s)';
	    break;
		
	    case 'data_fpma00200_1':
			if ( grdDetail.rows > 1 )
			{
				for(var i = 1; i < grdDetail.rows; i++)
                {
                    if ( grdDetail.GetGridData( i, G2_PROCESS_YN ) == 'Y' )
                    {
                         grdDetail.SetCellBgColor( i, G2_PROCESS_YN, i, G2_PROCESS_YN, 0xFF33CC );
                    }
					//-------
					if ( grdDetail.GetGridData( i, G2_CLOSE_YN ) == 'Y' )
					{
						grdDetail.SetCellBgColor( i, G2_CLOSE_YN, i, G2_CLOSE_YN, 0xFF6633 );
					}
                }
				
				grdDetail.SetCellBgColor( 1, G2_EXP_ACC_01_CD, grdDetail.rows - 1, G2_EXP_ACC_01_AMT, 0xCCFFFF );			
				grdDetail.SetCellBgColor( 1, G2_EXP_ACC_03_CD, grdDetail.rows - 1, G2_EXP_ACC_03_AMT, 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G2_EXP_ACC_05_CD, grdDetail.rows - 1, G2_EXP_ACC_05_AMT, 0xCCFFFF );								 
				
				//------------
	          	grdDetail.Subtotal( 1, 2,-1, '3'); 								       
			}  
	    break;
	    
	    case 'pro_fpma00200_1':
	        alert(txtValueReturn.text);
	    break;    
	    
	    case 'pro_fpma00200_2':
	        alert(txtValueReturn.text);
	    break; 
  	}
}
 
//=================================================================================
    function OnProcess(obj)
    {         
        switch(obj)
        {
            case 'MANY-ASSET':
				if ( grdDetail.row > 0 )
				{
					txtDeprSDID.text = grdDetail.GetGridData( grdDetail.row, G2_DEPR_SD_ID );
				}
				else
				{
					alert("PLS SELECT ONE SCHEDULE !");
				}
				//---------
                var arr_pk = "";
                var comma  = "";
				
                for(var i = 1; i < grdAsset.rows; i++)
                {
                    if ( grdAsset.GetGridControl().isSelected(i) == true )
                    {
                        arr_pk +=  comma + grdAsset.GetGridData( i, G1_ASSET_PK);
                        comma = ",";
                    }
                }
                //-----------------------												
				if ( arr_pk != "" )
				{
					txtArrayAssetPK.text =  arr_pk ; 
					
					if (confirm("Do you want to make depreciation schedule ?"))
					{
					    pro_fpma00200_1.Call();
					}    
				}
            break;	
            
            case 'DEL-SCHEDULE':
				if ( grdDetail.row > 0 )
				{
					txtDeprSDID.text = grdDetail.GetGridData( grdDetail.row, G2_DEPR_SD_ID );
				}
				else
				{
					alert("PLS SELECT ONE SCHEDULE !");
				}
				//---------
                var arr_pk = "";
                var comma  = "";
				
                for(var i = 1; i < grdAsset.rows; i++)
                {
                    if ( grdAsset.GetGridControl().isSelected(i) == true )
                    {
                        arr_pk +=  comma + grdAsset.GetGridData( i, G1_ASSET_PK);
                        comma = ",";
                    }
                }
                //-----------------------												
				if ( arr_pk != "" )
				{
					txtArrayAssetPK.text =  arr_pk ; 
					
					if (confirm("Do you want to delete depreciation schedule ?"))
					{
					    pro_fpma00200_2.Call();
					}    
				}
            break;	            			             
        }		 
    }
 
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case 'grdAsset':
            data_fpma00200.Call("SELECT");
        break;
        
        case 'DETAIL':		 			            		                                 
            if ( grdAsset.row > 0 )
            {
				txtAssetPK.text = grdAsset.GetGridData( grdAsset.row, G1_ASSET_PK );	
				   
                data_fpma00200_1.Call('SELECT');
            }
        break;
    }   
	
}
 
//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G2_TR_AMOUNT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {          
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
        //------------------------
    }
}
//========================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00200" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00200"> 
                <input bind="grdAsset" >
					<input bind="lstSearchDept" />
                    <input bind="lstSearchAssGrp" />
					<input bind="lstSearchAssType" />
                    <input bind="txtAssetSearch" /> 
					<input bind="chkSDBal" />	
					<input bind="chkHaveAmt" />	
					<input bind="chkHaveSD" />			 					
                </input>
                <output  bind="grdAsset" />
            </dso> 
        </xml> 
    </gw:data>    
	<!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00200_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="<%=l_user%>lg_sel_fpma00200_1" procedure="<%=l_user%>lg_upd_fpma00200_1" > 
                <input bind="grdDetail" >
					<input bind="txtAssetPK" />
                    <input bind="dtFrom" />
					<input bind="dtTo" />                   			 					
                </input>
                <output  bind="grdDetail" />
            </dso> 
        </xml> 
    </gw:data>       
	<!--============================================= Submit =====================================-->
    <gw:data id="pro_fpma00200_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_fpma00200_1"> 
                <input> 
			        <input bind="txtArrayAssetPK" /> 
					<input bind="txtDeprSDID" /> 		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>	
    <!--============================================= Submit =====================================-->
    <gw:data id="pro_fpma00200_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_fpma00200_2"> 
                <input> 
			        <input bind="txtArrayAssetPK" /> 
					<input bind="txtDeprSDID" /> 		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>	    
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="width: 100%; height: 60%">
            <td style="width: 70%; height: 60%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%" >                    
                    <tr style="height: 1%">
						<td style="width: 5%; white-space: nowrap;" align="right">
                            Type
                        </td>
                        <td style="width: 45%"  >
                            <gw:list id="lstSearchAssType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap;" align="right">
                            Group
                        </td>
                        <td style="width: 45%"  >
                            <gw:list id="lstSearchAssGrp" styles="width:100%;" onchange="OnSearch('grdAsset')" />
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Dept
                        </td>
                        <td style="width: 45%"  >
                            <gw:list id="lstSearchDept" styles="width:100%" onchange="OnSearch('grdAsset')" />
                        </td>
						<td style="width: 5%" align="right">
                            Asset
                        </td>
                        <td style="width: 45%" >
                            <gw:textbox id="txtAssetSearch" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
						<td colspan="7">
							<table>
								<tr>
									<td style="width: 20%" align="center"   >
			                            S/D Bal                                               
			                            <gw:checkbox id="chkSDBal" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdAsset')" />
			                        </td>
									<td style="width: 20%" align="center"   >
			                            Have Amt                                               
			                            <gw:checkbox id="chkHaveAmt" defaultvalue="Y|N" value="N" onchange="OnSearch('grdAsset')" />
			                        </td>
									<td style="width: 20%" align="center" > 
										Have S/D                                               
			                            <gw:checkbox id="chkHaveSD" defaultvalue="Y|N" value="N" onchange="OnSearch('grdAsset')" />  							                        
			                        </td>									 
									<td style="width: 15%" align="center" >
										<gw:label id="lblSearchAssetCount" styles='width:100%;color:cc0000;font:9pt' />  
									</td>
									<td style="width: 5%; white-space: nowrap" align="center">                             
			                            <gw:icon id="idBtnProcess" img="2" text="Process" styles='width:100%' onclick="OnProcess('MANY-ASSET')" />                          
			                        </td>	
			                        <td style="width: 5%; white-space: nowrap" align="center">                             
			                            <gw:icon id="idBtnDelete" img="2" text="Delete" styles='width:100%' onclick="OnProcess('DEL-SCHEDULE')" />                          
			                        </td>						
			                        <td style="width: 5%" align="right" >
			                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdAsset')" />
			                        </td>								
								</tr>
							</table>
						</td>                        
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="7">
                            <gw:grid id='grdAsset' 
								header='_PK|Asset Code|Asset Name|Asset Amount|S/D Amount|S/D Bal' 
								format='1|0|0|0|0|0' 
								aligns='0|0|0|3|3|3'
                                defaults='|||||' 
								editcol='0|0|0|0|0|0' 
								widths='0|2000|3500|1500|1500|1500' 
								sorting='T' 
								styles='width:100%; height:100%'
                                oncellclick="OnSearch('DETAIL')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%; height: 60%" align="center" valign="top" id="right">
                <table style="width: 100%; height:100%">
                    <tr style="width: 100%; height: 1%">     
						<td style="width:5%" align="right" >
							Date
						</td>
                        <td style="width:94%;white-space:nowrap">
							<gw:datebox id="dtFrom" lang="1" width="10%" /> 
							~ <gw:datebox id="dtTo" lang="1" width="10%" />
						</td>						                                                                                      
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('MASTER')" />
                        </td>
                    </tr>                   
                    <tr style="width: 100%; height: 99%">                        
                        <td colspan="7">
                            <gw:grid id='grdDetail' 
								header='Depr S/D|_DETAIL_PK|_ASSET_PK|Tr Amount|PRO|CLO|Remark|Expense ACC 1|Amount|Expense ACC 2|Amount|Expense ACC 3|Amount|Expense ACC 4|Amount|Expense ACC 5|Amount'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='1|0|0|3|1|1|0|1|3|1|3|1|3|1|3|1|3'
								editcol='1|0|0|1|0|0|1|0|0|0|0|0|0|0|0|0|0'
                                widths='1200|0|0|1500|500|500|1000|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200' sorting='T' styles='width:100%; height:100%'
                                onafteredit="CheckInput()" />
                        </td>                                
                    </tr>					 
                </table>
            </td>			 
        </tr>		 
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtArrayAssetPK" styles='width:100%;display:none' />
	<gw:textbox id="txtDeprSDID" styles='width:100%;display:none' />
	<gw:textbox id="txtAssetPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
