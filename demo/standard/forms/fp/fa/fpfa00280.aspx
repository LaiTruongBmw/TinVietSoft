<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Check list entri (Level 1)</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var 
G_SELECT     =0,
G_CUT_ITEM_M_PK     =1,
G_BOM_PK        =2,
G_PL_CODE       =3,
G_BOM_DATE      =4,
G_SEQ           =5,
G_ITEM_NAME     =6,
G_DWG_NO        =7,
G_REV           =8,
G_IDMK          =9,
G_MARK          =10,
G_SPEC1         =11,
G_SPEC2         =12,
G_SPEC3         =13,
G_SPEC4         =14,
G_SPEC5         =15,
G_LENGTH        =16,
G_QTY           =17,
G_CUT_QTY       =18,       
G_U_WT          =19,
G_TOTAL_WT      =20,
G_MATERIAL      =21,
G_REMARK        = 22,
G_Pl_PK         = 23;

var 
G2_PK               = 0,
G2_Item_Name        = 1,
G2_Dwg_No           = 2,
G2_IDMK             = 3,
G2_Length           = 4,
G2_Total_WT         = 5,
G2_MATERIAL         = 6,
G2_PL_PK            = 7;

function BodyInit()
{
	//-----------------------------------------
    var now = new Date(); 
    var  ldate;
     ldate = dtCLFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;          
    dtCLFrom.value=ldate ; 
  
    grdGrid.GetGridControl().FrozenCols = 3;
}
//-----------------------------------------
function checkKey() 
{ 
	var c = String.fromCharCode (event.keyCode); 
	var x = c.toUpperCase().charCodeAt(0) ; 
	event.keyCode = x; 
	
}
//-----------------------------------------
function OnGetPopup(obj)
{
  switch(obj)
    {
        case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0]; 
                    txtProjectCD.text   = oValue[1];
                    txtProjectNM.text   = oValue[2];
                }
        break;    
       case 'Item':
            alert('Will Get Item already create BOM of current project!')
          /*  var fpath = System.RootURL + "/form/bd/dp/bddp00012.aspx";
            oValue = System.OpenModal( fpath , 700 , 500, 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtItem.text   = oValue[0];
            }*/
        break;
        case 'Import':
			var url =System.RootURL + '/form/fp/fa/fpfa00200_import.xls';
        	window.open(url);
		break;       
        
     }		  
}
//-----------------------------------------
function SearchOnClick(p_obj)
{	
   switch(p_obj)
    {
        case 1:
        if(txtProjectPK.text !="" )
        {
	        idData_fpfa00280.Call("SELECT");	
	    }else
	    {
	        alert("Please select project first!");
	    }
	    break;
	    case 2:
	         idData_fpfa00280_1.Call("SELECT");	
	    break;
	    case 3:
	        idData_fpfa00280_2.Call('SELECT');
	    break;
	}
}
function OnShowDetail()
{
     var fpath  = System.RootURL + "/form/fp/fa/fpfa00281.aspx?master_pk="+grdSupplyList.GetGridData(grdSupplyList.row,0);
     var oValue = System.OpenModal( fpath , 800 , 500 , 'resizable:yes;status:yes');
}
//====================================================================
    function OnSaveData(obj)
    {
        var l_valid = false ;
        if(obj ==1)
        {
            //kiem tra bom co cung drwg no,item,
            if(idData_fpfa00280_3.GetStatus() !='20')
            {            
                idData_fpfa00280_3.StatusInsert();
            }
            for(var i = 1 ; i<grdGrid.rows; i++ )
            {
                 if(grdGrid.GetGridData(i,G_SELECT)== -1 )
                {
                    txtItemName.text = grdGrid.GetGridData(i,G_ITEM_NAME);
                    txtDWN.text = grdGrid.GetGridData(i,G_DWG_NO);
                    
                    txtIDMK.text = grdGrid.GetGridData(i,G_IDMK);
                    txtLENGTH.text = grdGrid.GetGridData(i,G_LENGTH);
                    
                    txtMATERIAL.text = grdGrid.GetGridData(i,G_MATERIAL);
                    txtPLPK.text =  txtProjectPK.text;                    
                    l_valid = true; 
                    break;                   
                }
            }
            if(l_valid == false)
            {
                 alert('Please, select BOM item for cutting plan!');
                return;
            }
            //---------------------------------------------            
            flag = 'save';
            idData_fpfa00280_3.Call();            
        }
        /////////////////////////////////////////
         if(obj ==2)
        {
            idData_fpfa00280_2.Call();
        }
        
    }
function OnDelete(p_grd)
{
    p_grd.DeleteRow();
}
//====================================================================

function OnReport()
{
    var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00280.aspx?p_pl_pk='+txtProjectPK.text+'&item='+txtItem.text;
    System.OpenTargetPage(url); 

 }
 //
flag = 'search';
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'idData_fpfa00280':
            if(grdGrid.rows>1)
                {
                     grdGrid.SetCellBold( 1, G_DWG_NO, grdGrid.rows - 1, G_MARK,   true);
                     grdGrid.SetCellBold( 1, G_CUT_QTY, grdGrid.rows - 1, G_CUT_QTY,   true);
                     grdGrid.SetCellBgColor( 1, G_CUT_QTY, grdGrid.rows - 1, G_CUT_QTY, 0x99FFFF );                       
                }
                lblRecored.text =  (grdGrid.rows -1 ) +" record(s)."
           idData_fpfa00280_2.Call('SELECT');
        break;
   
        
        case 'idData_fpfa00280_2':
            if(grdSupplyList.rows>1)
                {
                     grdSupplyList.SetCellBold( 1, G2_Item_Code, grdSupplyList.rows - 1, G2_Item_NM,   true);
                     grdSupplyList.SetCellBold( 1, G2_Plan_Qty, grdSupplyList.rows - 1, G2_Plan_Qty,   true);
                }
             lblRecored3.text =  (grdSupplyList.rows -1 ) +" record(s)."
        break;
        
       
         case 'idData_fpfa00280_3':
            if(flag =='save')
            {
                  for(var i = 1 ; i<grdGrid.rows; i++ )
                    {
                         if(grdGrid.GetGridData(i,G_SELECT)== -1 )
                        {
                           grdGrid.SetGridText(i,G_CUT_ITEM_M_PK,txtMasterPK.text)
                           grdGrid.SetRowStatus(i,32);              
                        }else
                        {
                            grdGrid.SetRowStatus(i,0);
                        }
                    }
                      flag ='search';            
                idData_fpfa00280.Call();
            }
        break;
    }
	
}

function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

</script>

<html>
<body>
 <gw:data id="idData_fpfa00280_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="lg_sel_fpfa00280_3" parameter='0,1,2,3,4,5,6' procedure="lg_upd_fpfa00280_3"> 
                <inout>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtItemName" /> 
                    <inout bind="txtDWN" />      
                    <inout bind="txtIDMK" />    
                    <inout bind="txtLENGTH"  /> 
                   	<inout bind="txtMATERIAL" />   
					<inout bind="txtPLPK"  />
                 </inout>  
            </dso> 
        </xml> 
    </gw:data>   

	<gw:data id="idData_fpfa00280"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_fpfa00280" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" procedure="lg_upd_fpfa00280" > 
                <input bind="grdGrid">                 
                    <input bind="dtCLFrom" />
					<input bind="dtCLTo" />
					<input bind="txtProjectPK" /> 
					<input bind="txtItem" /> 
					<input bind="txtSeachText" />  					
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data> 
  	
 	<gw:data id="idData_fpfa00280_2"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_fpfa00280_2" parameter="0,1,2,3,4,5,6,7"  procedure="lg_upd_fpfa00280_2"> 
                <input bind="grdSupplyList">                 
                     <input bind="txtProjectPK" /> 
					 <input bind="txtItem" /> 
					 <input bind="txtSeachText" />  
                </input> 
                <output bind="grdSupplyList" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 		
<table width="100%"  style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
  <tr style="height:2%">    
    <td width="10%" align="right"><b>Date</b></td>
    <td width="8%"><gw:datebox id="dtCLFrom" lang="<%=Session("Lang")%>"  /></td> 
    <td width="2%" align="center"><b>~</b></td>
    <td width="10%"><gw:datebox id="dtCLTo" lang="<%=Session("Lang")%>"  /></td>
    <td width="15%" align="right">
    <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnGetPopup('Project')">Project</b></td>
    <td width="35%" >
     <gw:textbox id="txtProjectCD" styles="width:30%; display:none" readonly='yes' />   
     <gw:textbox id="txtProjectNM" styles="width:100%" readonly='yes'/></td> 
     <td width="8%"></td> 
     <td align="right">
        <gw:imgBtn id="idBtnSave" img="save" alt="Save" text="Save" onclick="OnSaveData(1)" />
     </td>  
     <td width="2%"><gw:imgBtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="SearchOnClick(1)" /> </td>	
  </tr>
  
 <tr style="height:2%">   
    <td style="width: 10%" align="right">
    <b title="Click to get item" style="color:Blue; cursor:hand" onclick="OnGetPopup('Item')">Item Name</b>
    </td>
    <td style="width: 20%" colspan="3">        
        <gw:textbox id="txtItem" styles="width:100%" onenterkey ="SearchOnClick(1)"/>
    </td>
    <td width="15%" align="right"><b>Search Text</b></td>
     <td width="35%" ><gw:textbox id="txtSeachText" styles="width:100%"  onenterkey ="SearchOnClick(1)"/></td>         			
      <td style="width: 8%">        
    </td>
	 <td colspan="2" align="right">
	     <gw:label id="lblRecored" styles='width:100%;color:cc0000;font:9pt;align:right' />       
    </td>       
    </tr>
  <tr style="height:40%">
    <td colspan="12">       
		  <gw:grid id='grdGrid'
            header='Select|_Master_pk|_PK|_Pl Code|Bom Date|SEQ|Item Name|DWG No|Rev|IDMK|MARK|Spec 1|Spec 2|Spec 3|Spec 4|Spec 5|Length|Bom Qty|Chk List Qty|Unit WT|Total WT|Material|Remark|_PL_PK'
            format='3|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            check='|||||||||||||||||||||||'
            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
            widths='800|0|0|800|2000|1200|2000|1500|800|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0'
            sorting='T'
            autosize='T' 
            acceptNullDate ="true"
            styles='width:100%; height:100%'
            />
	</td>
  </tr> 
  <tr style="height:1%">
    <td style="width: 10%" align="right">
       Search Text  
    </td>
    <td style="width: 20%" colspan="3">
         <gw:textbox id="txtItemTextS" styles="width:100%"  onenterkey ="SearchOnClick(3)"/>        
    </td>
   <td align=right>
       <gw:imgBtn id="idBtnSearch3" img="search" alt="Search" text="Search" onclick="SearchOnClick(3)" />
    </td>    
    <td>
       
    </td>
     <td align="right">
        <gw:label id="lblRecored3" styles='width:100%;color:cc0000;font:9pt;align:right' />     
     </td>
     <td align="right" style="display:none">
        <gw:imgBtn id="idBtnExcel" img="excel" alt="excel" text="update" onclick="OnReport()" />
     </td>
     <td align="right">
        <gw:imgBtn id="idBtnUpd" img="update" alt="update" text="update" onclick="OnSaveData(2)" />
     </td>
      <td width="2%" align="right">
      <gw:imgBtn id="idBtnDelete3" img="delete" alt="Delete" text="Delete" onclick="OnDelete(grdSupplyList)" /> </td>	
  </tr>
      <tr style="height:30%">
        <td colspan="12" >       
		           <gw:grid id='grdSupplyList'
                    header='_PK|Item Name|DWG NO|IDMK|LENG|TOTAL WT|MATERIAL|_TAC_ABPL_PK'
                    format='0|0|0|0|0|1|0|0'
                    aligns='0|0|0|0|0|0|0|0'
                    check='|||||||'
                    editcol='0|0|0|0|0|1|0|0'
                    widths='0|200|1500|1500|1500|200|1500|0'
                    sorting='T'
                    autosize='T' 
                    oncelldblclick="OnShowDetail();"
                    styles='width:100%; height:100%'
                    /> 
	    </td>
      </tr>
</table>
	
 <gw:textbox id="txtItem2" styles="display:none" />
 <gw:datebox id="txtBomDt" style="display:none" lang='1' />
 <!---------------------------------------------------------------->

 <gw:textbox id="txtMasterPK" styles="display:none"/>
 <gw:textbox id="txtItemName" styles="display:none" />
 <gw:textbox id="txtDWN"        styles="display:none" />
 <gw:textbox id="txtLENGTH"     styles="display:none" />
 <gw:textbox id="txtPLAN_QTY"   styles="display:none" />
 <gw:textbox id="txtIDMK"   styles="display:none" />
 <gw:textbox id="txtItemPK"     styles="display:none" />
 <gw:textbox id="txtMATERIAL"     styles="display:none" />
 <gw:textbox id="txtProjectPK" styles="display:none"/>
 <gw:textbox id="txtPLPK" styles="display:none"/>
 
</body>
</html>