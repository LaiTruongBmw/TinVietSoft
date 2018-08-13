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
	
    var G0_ST_ITEM_PK       = 0,
        G0_ST_CODE          = 1,
        G0_ST_NAME          = 2,
        G0_GRP_PK           = 3;
			
   var 	G1_ITEM_PK          = 0, 
        G1_ITEM_CODE        = 1, 
        G1_VIRTUAL_CODE     = 2,
        G1_ITEM_NAME        = 3,   
        G1_F_NAME_01        = 4, 
        G1_F_NAME_02        = 5,
        G1_UOM              = 6, 
		G1_SPEC_01			= 7,
		G1_SPEC_02			= 8,
		G1_SPEC_03			= 9,
		G1_SPEC_04			= 10,
		G1_SPEC_05			= 11,
        G1_UNIT_PRICE       = 12,
        G1_PUR_PRICE        = 13, 
        G1_PROD_PRICE       = 14,
        G1_CCY              = 15,
        G1_USE_YN           = 16, 
        G1_REMARK           = 17,
        G1_ITEM_PHOTO_PK    = 18,
        G1_GRP_PK           = 19,
		G1_ST_ITEM_PK		= 20,
		G1_ACC_PK			= 21,
		G1_WH_ACC			= 22,
		G1_EXPENSE_PK		= 23,
		G1_EXPENSE_ACC		= 24,
		G1_REVENUE_PK		= 25,
		G1_REVENUE_ACC		= 26,
		G1_BOM_YN			= 27,
		G1_INV_YN			= 28;        				
        
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
    //------------------------------
    SetGridFormat(); 
    //------------------------------
    OnToggle('Picture');
	OnToggleGrid();
} 
 
//------------------------------------------------------------
function SetGridFormat()
{
    var data = "<%=CtlLib.SetGridColumnDataSQL("select  UOM_CODE, UOM_CODE UOM_CODE1 from TLG_IT_UOM where del_if=0  order by UOM_CODE")%>";   
    grdItem.SetComboFormat(G1_UOM,data);
    
    data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>|ALL|Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = 'ALL' ; 
	
    var ctr = grdItem.GetGridControl(); 
    ctr.ColFormat(G1_UNIT_PRICE) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_PUR_PRICE)  = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_PROD_PRICE) = "#,###,###,###,###,###.##";
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
                if ( grdItem.GetGridData( i, G1_ST_ITEM_PK) == "" )
                {
                 	grdItem.SetGridText( i, G1_ST_ITEM_PK, txtSTItemPK.text );				 
                }
				//-------------
				if ( grdItem.GetGridData( i, G1_GRP_PK ) == "" )
                {           
					grdItem.SetGridText( i, G1_GRP_PK,     txtGroup_PK.text );
                }
            }
            //-----------------------     
			data_agci00120_2.Call(); 
        break;      
    }   
}
//------------------------------------------------------------ 
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Item' :
            if ( grdSTitem.row > 0)
            {              
                    grdItem.AddRow();
                    grdItem.SetGridText(grdItem.rows-1, G1_ST_ITEM_PK, txtSTItemPK.text );
                    grdItem.SetGridText(grdItem.rows-1, G1_GRP_PK,     txtGroup_PK.text );
                     
                    grdItem.SetGridText(grdItem.rows-1, G1_USE_YN, '-1' );
                    grdItem.SetGridText(grdItem.rows-1, G1_INV_YN, '-1' );
            }
            else
            {
                alert('Pls Select Group first !!!');
            }    
        break;
          
    }    
}
//------------------------------------------------------------ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_agci00120_1":
            lblRecord.text = grdItem.rows-1 + ' row(s)';
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
//====================================================================
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
//====================================================================
function ReadFiles()
{
	    //grdItem.ClearData();
	    if(txtGroup_PK.text=="")
	    {
	        alert("Please select Group first");
	    }
	    else
	    {   
	        var fl = document.getElementById("idtext").value;  
        
            if ( CheckFilesExist(fl) )
            {
                var excel = new ActiveXObject("Excel.Application");
                var excel_file  = excel.Workbooks.Open(fl);
                var excel_sheet = excel.Worksheets("Sheet1");
                var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                var lrow, lcol, data
             
                for(lrow = 2; lrow <= maxRow ; lrow++) 
                {
                    grdItem.AddRow();
                    
                    for ( lcol = 1; lcol < grdItem.cols - 4; lcol++ )
                    {
                        data = excel_sheet.Cells( lrow, lcol ).Value 
                        
                        grdItem.SetGridText( grdItem.rows-1, lcol, data);
                    }    
                    grdItem.SetGridText( grdItem.rows-1, G1_GRP_PK,txtGroup_PK.text ); 
                    grdItem.SetGridText( grdItem.rows-1, G1_ST_ITEM_PK,txtSTItemPK.text );               
               }
                excel.Quit();
                excel = null;
            }   
            lblRecord.text = (grdItem.rows -1)+" row(s)";
	    }
        
}
 //------------------------------------------------------------------
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
        
    if ( col == G1_UNIT_PRICE || col == G1_PUR_PRICE || col == G1_PROD_PRICE )
    {      
        var dQuantiy
        
        dQuantiy =  grdItem.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdItem.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
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
        case 'grdSTitem':
            data_agci00120.Call("SELECT");
            break;    
			    
        case 'ItemList': 
            txtGroup_PK.SetDataText(grdSTitem.GetGridData( grdSTitem.row, G0_GRP_PK ));
            txtSTItemPK.SetDataText(grdSTitem.GetGridData( grdSTitem.row, G0_ST_ITEM_PK ));
			
            lbGroupName.SetDataText(grdSTitem.GetGridData( grdSTitem.row, G0_ST_CODE ) + ' - ' + grdSTitem.GetGridData( grdSTitem.row, G0_ST_NAME ) );
			
            data_agci00120_1.Call("SELECT");                              
        break;    
    }
}
//===============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		case 'Import':
			var url =System.RootURL + '/form/ag/ci/agci00120_import.xls';
        	window.open(url);
		break;       
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
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_CODE) = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_01)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_02)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_03)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_04)      = true ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_05)      = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdItem.GetGridControl().ColHidden(G1_VIRTUAL_CODE) = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_01)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_02)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_03)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_04)      = false ;
		grdItem.GetGridControl().ColHidden(G1_SPEC_05)      = false ;			
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//============================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00120" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_agci00120" > 
                    <input>
                        <input bind="cboGroupQuery" /> 
                        <input bind="txtSTitemQuery" />
                    </input> 
                    <output bind="grdSTitem" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="st_lg_sel_agci00120_2" procedure="st_lg_upd_agci00120_2"> 
                <input bind="grdItem"> 
                     <input  bind="txtItem" /> 
                     <input  bind="txtSTItemPK" />             	                 
                </input>
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr valign="top" style="height: 100%">
            <td style="width: 35%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group</td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Item</td>
                        <td style="width: 80%">
                            <gw:textbox id="txtSTitemQuery" styles="width:100%" onenterkey="OnSearch('grdSTitem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSTitem" header="_PK|ST Code|ST Name|_TCO_ITEMGRP_PK" format="0|0|0|0" aligns="0|0|0|0"
                                defaults="||" editcol="0|0|0|0" widths="0|1500|1200" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('ItemList')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
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
                                <tr>
                                    <td style="width: 1%" align="left" colspan="9">									
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
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 100%" valign="top">
                                    <td style="width: 98%" id="t-left">                                        
										<gw:grid id="grdItem" 
											header='_Pk|Item Code|Virtual Code|Item Name|F Name 01|F Name 02|UOM|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Sale Price|Pur Price|Prod Price|CCY|Use Y/N|Remark|_PHOTO_PK|_GRP_PK|_ST_ITEM_PK|_ACCT_PK|W/H Acc|_EXPENSE_PK|Expense Acc|_Revenue_pk|Revenue Acc|BOM Y/N|INV Y/N'
                                            format='0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|3|3' 
											aligns='0|0|0|0|0|0|1|1|1|1|1|1|3|3|3|1|0|0|0|0|0|0|0|0|0|0|0|0|0' 
											defaults='||||||||||||||||||||||||||||-1'
                                            editcol='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0' 
											widths='0|1800|2000|2000|2000|2000|800|1200|1200|1200|1200|1200|1300|1300|1300|1000|800|2000|0|0|0|0|1500|0|1500|0|1500|900|900'
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
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtGroup_PK" styles='display:none' />
    <gw:textbox id="txtSTItemPK" styles='display:none'  />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txttco_itemphoto_pk" styles="display:none" />
    <!------------------------------------------------------------------------------>
</body>
</html>
