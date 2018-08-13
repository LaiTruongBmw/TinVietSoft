<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Item Entry without Spec</title>
</head>

<script>
 
    var lastrow = -1 ;
        
    var G1_ITEM_PK          = 0, 
		G1_SEQ				= 1,
        G1_ITEM_CODE        = 2, 
        G1_VIRTUAL_CODE     = 3,
		G1_VIRTUAL_NAME		= 4,
        G1_ITEM_NAME        = 5,   
        G1_F_NAME_01        = 6, 
        G1_F_NAME_02        = 7,
        G1_UOM              = 8, 
		G1_REF_UOM			= 9,
		G1_SPEC_01			= 10,
		G1_SPEC_02			= 11,
		G1_SPEC_03			= 12,
		G1_SPEC_04			= 13,
		G1_SPEC_05			= 14,
        G1_UNIT_PRICE       = 15,
        G1_PUR_PRICE        = 16, 
        G1_PROD_PRICE       = 17,
		G1_VAT_RATE			= 18 ,
		G1_SVC_RATE 		= 19,
		G1_COC_RATE  		= 20,
        G1_CCY              = 21,
        G1_USE_YN           = 22, 
        G1_REMARK           = 23,
        G1_ITEM_PHOTO_PK    = 24,
        G1_GRP_PK           = 25,
		G1_ACC_PK			= 26,
		G1_WH_ACC			= 27,
		G1_EXPENSE_PK		= 28,
		G1_EXPENSE_ACC		= 29,
		G1_REVENUE_PK		= 30,
		G1_REVENUE_ACC		= 31,
		G1_BOM_YN			= 32,
		G1_INV_YN			= 33,
        G1_ATT_01			= 34,
        G1_ATT_02			= 35,
        G1_ATT_03			= 36,
        G1_ATT_04			= 37,
        G1_ATT_05			= 38,
        G1_VAL_01			= 39,
        G1_VAL_02			= 40,
        G1_VAL_03			= 41,
        G1_VAL_04			= 42,
        G1_VAL_05			= 43,	
		G1_HS_CODE			= 44	
		G1_LOT_NO_TYPE		= 45;
        

var arr_FormatNumber = new Array(); 

 //---------------------------------------------------------
 function OnToggle(direction)
 {
    if ( direction == 'SearchList' )
    {
        var left  = document.all("left");    
        var right = document.all("right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left.style.display="none";       
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../../system/images/button/next.gif";
        }
        else
        {
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../../system/images/button/previous.gif";
        }
     }
     else if ( direction == 'Picture' )
     {
        var left  = document.all("t-left");    
        var right = document.all("t-right");   
        var imgArrow = document.all("img1");   
        
        if(imgArrow.status == "expand")
        {
            right.style.display="none";       
            imgArrow.status = "collapse";
            left.style.width="99%";
            imgArrow.src = "../../../../system/images/button/previous.gif";
        }
        else
        {
            right.style.display="";
            imgArrow.status = "expand";
            //left.style.width="75%";
            imgArrow.src = "../../../../system/images/button/next.gif";
        }     
     }    
 }        
//------------------------------------------------------------ 

function BodyInit()
{   
    System.Translate(document); 
	
    txtParentNm.SetEnable(false);
    txtUser_PK.text = "<%=session("USER_PK")%>";
    //------------------------------
    SetGridFormat();
 
    //------------------------------
    OnToggle('Picture');
	OnToggleGrid();
	
    lst_agci00070_4.Call();    
} 
 
//------------------------------------------------------------
function SetGridFormat()
{

	var data = "<%=CtlLib.SetGridColumnDataSQL("select  UOM_CODE, UOM_CODE UOM_CODE1 from TLG_IT_UOM where del_if=0  order by 1")%>";   
    grdItem.SetComboFormat(G1_UOM,data);
	grdItem.SetComboFormat(G1_REF_UOM,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdItem.SetComboFormat(G1_CCY,data); 
	
	data = "#0;0|#1;Must Input|#2;System Auto";
	grdItem.SetComboFormat(G1_LOT_NO_TYPE,data); 
	
    var ctr = grdItem.GetGridControl(); 
    ctr.ColFormat(G1_UNIT_PRICE) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_PUR_PRICE)  = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_PROD_PRICE) = "#,###,###,###,###,###.#####";
	
    ctr.ColFormat(G1_VAL_01) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_VAL_02) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_VAL_03) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_VAL_04) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_VAL_05) = "#,###,###,###,###,###.#####";	
	
	ctr.ColFormat(G1_VAT_RATE) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_SVC_RATE)  = "#,###,###,###,###,###.#####";
    ctr.ColFormat(G1_COC_RATE) = "#,###,###,###,###,###.#####";
	
    arr_FormatNumber[G1_UNIT_PRICE] = 5;
    arr_FormatNumber[G1_PUR_PRICE]  = 5;
	arr_FormatNumber[G1_PROD_PRICE] = 5;
	
	arr_FormatNumber[G1_VAL_01] = 5;
	arr_FormatNumber[G1_VAL_02] = 5;
	arr_FormatNumber[G1_VAL_03] = 5;
	arr_FormatNumber[G1_VAL_04] = 5;
	arr_FormatNumber[G1_VAL_05] = 5;	
	
	arr_FormatNumber[G1_VAT_RATE] = 5;
    arr_FormatNumber[G1_SVC_RATE] = 5;
	arr_FormatNumber[G1_COC_RATE] = 5;
	
	ctr.FrozenCols = G1_VIRTUAL_CODE ;
}

//------------------------------------------------------------ 
function OnSave(pos)
{
    switch (pos)
    {
        case 'Item':
            if(grdItem.rows > 1)
            {
                grdItem.SetGridText(grdItem.rows-1, G1_ITEM_PHOTO_PK, imgItem.oid );// luu photo_pk cho dong cuoi cung
            }
            //----------------------- 
            for (var i =1; i< grdItem.rows; i++)
            {
                if (grdItem.GetGridData(i,G1_ITEM_PK)=="")
                {
                 grdItem.SetGridText( i, G1_GRP_PK, txtGroup_PK.text);
                }
            }
            //-----------------------     
			data_agci00070_2.Call();
                   
        break;
        
        case 'Group':
            data_agci00070_1.Call();
        break;     
    }   
}
//------------------------------------------------------------ 
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Item' :
            if ( txtGroup_PK.text != '' )
            {
                if ( txtLeafYN.text == 'Y' )
                {
                    grdItem.AddRow();
                    grdItem.SetGridText(grdItem.rows-1, G1_GRP_PK, txtGroup_PK.text );
                    grdItem.SetGridText(grdItem.rows-1, G1_UOM,    txtGrpUOM.text   );
                    grdItem.SetGridText(grdItem.rows-1, G1_USE_YN, '-1'             );
                    grdItem.SetGridText(grdItem.rows-1, G1_INV_YN, '-1'             );
                }
                else
                {
                    alert("Add new for Leaf Group only.");
                }    
            }
            else
            {
                alert('Pls Select Group first !!!');
            }    
        break;
        
        case 'group' :
            data_agci00070_1.StatusInsert();
                        
            txtParentPK.text = oTree.GetCurrentNode().oid; 
            txtParentNm.text = oTree.GetCurrentNode().text;            
            
            txtGrpCD.text = '<< New Code >>' ;
            txtGrpNm.text = '<< New Name >>' ;
        break;  
        
        case 'update_group' :
            txtGroupNew_PK.text = oTree.GetCurrentNode().oid;
            data_agci00070_1.Call("SELECT");
        break;      
    }    
}
//------------------------------------------------------------ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_agci00070_3":
             data_agci00070_2.Call("SELECT");
        break;
        
        case 'data_agci00070_2':
            lblRecord.text = grdItem.rows-1 + ' row(s)';
        break;
                
        case 'data_agci00070_1':
            OnSearch('Group');
        break;  
        case "lst_agci00070_4":
            //cboCompany.SetDataText(txtReturnValue.text);    
            cboCompany.value = "<%=session("COMPANY_PK")%>";		
            
			OnSearch('Group');	
        break;         
    }
}
//------------------------------------------------------------
function OncellClickGrd()
{
    if(lastrow!='-1')
    {
        grdItem.SetGridText(lastrow, G1_ITEM_PHOTO_PK, imgItem.oid);
    }
   
    txttco_itemphoto_pk.SetDataText(grdItem.GetGridData(grdItem.GetGridControl().row, G1_ITEM_PHOTO_PK));
    imgItem.SetDataText(txttco_itemphoto_pk.text );  
    lastrow = grdItem.GetGridControl().row;
   
}
//------------------------------------------------------------
function OnDelete(pos)
{
    switch (pos)
    {
        case 'Item' :
            if( confirm('Do you want to delete this item ?'))
	        {
	            grdItem.DeleteRow();
	        }        
        break;
        
        case 'Group':
            if(confirm('Do you want to delete selected group?'))
            {                
                data_agci00070_1.StatusDelete();
                data_agci00070_1.Call('');
	        }        
        break;
    }
}
//------------------------------------------------------------
function ValidateData()
{
    for(i=1; i<grdItem.rows;i++)
    {
        if((grdItem.GetGridData(i, G1_ITEM_CODE ) =='')&& (grdItem.GetRowStatus(i)!=64))
        {
            alert("You must input item code at row " + i + "!");
            return false;
        }
        if(grdItem.GetGridData(i, G1_ITEM_NAME ) =='')
        {
            alert("You must input item name at row " + i + "!");
            return false;
        }
        if(grdItem.GetGridData(i, G1_UOM ) =='')
        {
            alert("You must input uom at row " + i + "!");
            return false;
        }
    }
    return true;
}

 //------------------------------------------------------------------
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
        
    if ( col == G1_UNIT_PRICE || col == G1_PUR_PRICE || col == G1_PROD_PRICE || col == G1_VAT_RATE || col == G1_SVC_RATE || col == G1_COC_RATE || col == G1_VAL_01 || col == G1_VAL_02 || col == G1_VAL_03 || col == G1_VAL_04 || col == G1_VAL_05) 
    {      
        var dQuantiy
        
        dQuantiy =  grdItem.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdItem.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col]));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdItem.SetGridText(row,col,"")
            }
        }
        else
        {
            grdItem.SetGridText(row,col,"")
        }
         //---------------------------------------------
    } 
 } 
//============================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Group':
            data_agci00070.Call("SELECT");
        break;
        
        case 'ItemList': 
            txtGroup_PK.SetDataText(oTree.GetCurrentNode().oid);
            
            data_agci00070_3.Call("SELECT");                              
        break;    
    }
}
//===========================================================

function CheckFilesExist(filepath)
{

        if (Trim(filepath)=='') 
        {
            alert("Please, select an excel source file!!")
            return false;
        }
	    //test file exist
	    var fso = new ActiveXObject("Scripting.FileSystemObject");		

        if (!fso.FileExists(filepath))    
        {
            alert(filepath+" doesn't exist.");        
            return false;
        }	
        return true;
    
}

//-------------------------read data form exel file ----------------
function ReadFiles()
{
    if ( txtGroup_PK.text != '' )
    {
        if ( txtLeafYN.text == 'Y' )
        {
        	var fl = document.getElementById("idtext").value;  
                
              //  if ( CheckFilesExist(fl) )
              //  {
                    var excel = new ActiveXObject("Excel.Application");
                    var excel_file  = excel.Workbooks.Open(fl);
                    var excel_sheet = excel.Worksheets("Sheet1"); 
                    var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                    var lrow, lcol, data
                 
                    for(lrow = 2; lrow <= maxRow ; lrow++) 
                    {
                           grdItem.AddRow();
                           
                           for ( lcol = 1; lcol < 12; lcol++ )
                           {
                               data = excel_sheet.Cells( lrow, lcol ).Value; 
                               
                               grdItem.SetGridText( grdItem.rows-1, lcol, data);
                               grdItem.SetGridText( grdItem.rows-1, G1_GRP_PK, txtGroup_PK.text);
                           }                                                    
                    }          
                   lblRecord.text = (grdItem.rows -1)+" row(s).";
                    excel.Quit();
                    excel = null;
              //  }
        }
        else
        {
            alert("Add new for Leaf Group only.");
        }            
    }    
    else
    {
        alert('Pls Select Group first !!!');
    }  
}
//============================================================

function OnCellDoubleClick(obj)
{
	switch(obj.id)
	{
		case 'grdItem':
			var col = event.col ;
			var row = event.row ;
		 
			if (col == G1_WH_ACC || col == G1_EXPENSE_ACC || col == G1_REVENUE_ACC )
			{
 				fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
            	var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            	if ( aValue != null )
            	{      
                	grdItem.SetGridText( row, col-1, aValue[0] );
					grdItem.SetGridText( row, col,   aValue[1] + ' - ' + aValue[2] );                	 
            	}				
			}
		break;
	}
}
//===============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		case 'Import':
			var url =System.RootURL + '/form/ag/ci/agci00070_import.xls';
        	window.open(url);
		break;       
    }	       
}

//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_CODE) = true ;
		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_NAME) = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_01)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_02)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_03)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_04)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_05)      = true ;
		
		grdItem.GetGridControl().ColHidden(G1_ATT_01)      = true ;
		grdItem.GetGridControl().ColHidden(G1_ATT_02)      = true ;
		grdItem.GetGridControl().ColHidden(G1_ATT_03)      = true ;
		grdItem.GetGridControl().ColHidden(G1_ATT_04)      = true ;
		grdItem.GetGridControl().ColHidden(G1_ATT_05)      = true ;
		
		grdItem.GetGridControl().ColHidden(G1_VAL_01)      = true ;
		grdItem.GetGridControl().ColHidden(G1_VAL_02)      = true ;
		grdItem.GetGridControl().ColHidden(G1_VAL_03)      = true ;
		grdItem.GetGridControl().ColHidden(G1_VAL_04)      = true ;
		grdItem.GetGridControl().ColHidden(G1_VAL_05)      = true ;
		
		grdItem.GetGridControl().ColHidden(G1_VAT_RATE)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SVC_RATE)      = true ;
		grdItem.GetGridControl().ColHidden(G1_COC_RATE)      = true ;

        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_CODE) = false ;
		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_NAME) = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_01)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_02)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_03)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_04)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_05)      = false ;			
		
		grdItem.GetGridControl().ColHidden(G1_ATT_01)      = false ;
		grdItem.GetGridControl().ColHidden(G1_ATT_02)      = false ;
		grdItem.GetGridControl().ColHidden(G1_ATT_03)      = false ;
		grdItem.GetGridControl().ColHidden(G1_ATT_04)      = false ;
		grdItem.GetGridControl().ColHidden(G1_ATT_05)      = false ;
		
		grdItem.GetGridControl().ColHidden(G1_VAL_01)      = false ;
		grdItem.GetGridControl().ColHidden(G1_VAL_02)      = false ;
		grdItem.GetGridControl().ColHidden(G1_VAL_03)      = false ;
		grdItem.GetGridControl().ColHidden(G1_VAL_04)      = false ;
		grdItem.GetGridControl().ColHidden(G1_VAL_05)      = false ;		
		
		grdItem.GetGridControl().ColHidden(G1_VAT_RATE)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SVC_RATE)      = false ;
		grdItem.GetGridControl().ColHidden(G1_COC_RATE)      = false ;

        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//============================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="lst_agci00070_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00070_4" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="cboCompany" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="st_lg_sel_agci00070" > 
                <input>
                    <input bind="cboCompany" />
                    <input bind="txtGroupSearch" />
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4" function="st_lg_sel_agci00070_1"  procedure="st_lg_upd_agci00070_1"> 
                <inout> 
                     <inout  bind="txtGroupNew_PK" /> 
                     <inout  bind="txtParentPK" />
                     <inout  bind="txtParentNm" />
                     <inout  bind="txtGrpCD" />
                     <inout  bind="txtGrpNm" />                	                 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3" function="st_lg_sel_agci00070_3"> 
                <inout> 
                     <inout  bind="txtGroup_PK" /> 
                     <inout  bind="lbGroupName" />
                     <inout  bind="txtGrpUOM" /> 
                     <inout  bind="txtLeafYN" />              	                 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00070_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45" function="st_lg_sel_agci00070_2" procedure="st_lg_upd_agci00070_2" > 
                <input bind="grdItem" > 
                    <input bind="txtItem" /> 
                    <input bind="txtGroup_PK" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr valign="top" style="height: 100%">
            <td style="width: 35%" id="left">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                                        Company
                                    </td>
                                    <td style="width: 90%" colspan="6" >
                                        <gw:list id="cboCompany" styles="width:100%" />
                                    </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search
                        </td>
                        <td style="width: 50%">
                            <gw:textbox id="txtGroupSearch" styles='width:100%' onenterkey="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnAddNew" img="new" alt="New" text="New" onclick="OnAddNew('group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUpdate" img="update" alt="Update" text="Update" onclick="OnAddNew('update_group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave01" img="save" alt="Save" text="Save" onclick="OnSave('Group')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Parent
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtParentPK" styles='width:100%; display:none' />
                            <gw:textbox id="txtParentNm" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Group
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtGrpCD" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtGrpNm" styles='width:70%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%;" colspan="7">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnSearch('ItemList')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="Import" onclick="OnPopUp('Import')" href="#tips">File Path</a>
                        </td>
                        <td style="width: 40%">
                            <input type="file" id="idtext" size="30%" onchange="ReadFiles()">
                        </td>
                        <td style="width: 5%" align="right">
                            Item</td>
                        <td style="width: 40%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('ItemList')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('ItemList')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add New Item" text="Add New Item" onclick="OnAddNew('Item')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnDel" img="delete" alt="Delete Item" text="Delete Item" onclick="OnDelete('Item')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save Item" text="Save Item" onclick="OnSave('Item')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="8">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td style="width: 5%" align="left">
										 <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand" onclick="OnToggle('SearchList')" />
									</td>
                                    <td style="width: 80%" align="left">
                                        <gw:label id="lbGroupName" styles="color: red">-</gw:label>
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <gw:label id="lblRecord" styles="color: blue"></gw:label>
                                    </td>
									<td style="width: 5%" align="right" >
										<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
									</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%" colspan="8">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 100%" valign="top">
                                    <td style="width: 98%" id="t-left">
                                        <gw:grid id="grdItem" header='_Pk|Seq|Item Code|Virtual Code|Virtual Name|Item Name|F Name 01|F Name 02|UOM|Ref UOM|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Sale Price|Pur Price|Prod Price|VAT %|SVC %|COC %|CCY|Use Y/N|Remark|_PHOTO_PK|_tco_Itemgrp_Pk|_ACCT_PK|W/H Acc|_EXPENSE_PK|Expense Acc|_Revenue_pk|Revenue Acc|BOM Y/N|INV Y/N|Att 01|Att 02|Att 03|Att 04|Att 05|Val 01|Val 02|Val 03|Val 04|Val 05|HS Code|Lot No Type'
                                            format='0|0|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|3|3|0|0|0|0|0|0|0|0|0|0|0|0'
                                            aligns='0|1|0|0|0|0|0|0|1|1|1|1|1|1|1|3|3|3|3|3|3|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            defaults='|||||||||||||||||||||||||||||||||-1||||||||||||' 
											editcol='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1'
                                            widths='0|600|1800|1500|2000|2000|2000|2000|800|800|1200|1200|1200|1200|1200|1300|1300|1000|1000|1500|1600|1000|800|2000|0|0|0|1500|0|1500|0|1500|900|900|700|700|700|700|700|700|700|700|700|700|1000|1000'
                                            styles="width:100%; height:100%" oncellclick="OncellClickGrd()" onafteredit="CheckInput()"
                                            oncelldblclick="OnCellDoubleClick(this)" />
                                    </td>
                                    <td style="width: 1%">
                                        <img status="expand" id="img1" src="../../../../system/images/button/next.gif" style="cursor: hand;
                                            position: fixed" onclick="OnToggle('Picture')" />
                                    </td>
                                    <td style="width: 1%" id="t-right">                                        
										<gw:image id="imgItem" table_name="TLG_IT_ITEMPHOTO" procedure="st_lg_SYS_INSERT_PICTURE_ITEM"
                                            styles="width:98%;height:130" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" />
												
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
  
    <!------------------------------------------->
    <gw:textbox id="txtGroupNew_PK" styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtGroup_PK" styles='display:none' />
    <gw:textbox id="txtGrpUOM" styles='display:none' />
    <gw:textbox id="txtLeafYN" styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txttco_itemphoto_pk" styles="display: none" />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtUser_PK" text="" style="display: none" />
    <gw:textbox id="txtReturnValue" text="" style="display: none" />

</body>
</html>
