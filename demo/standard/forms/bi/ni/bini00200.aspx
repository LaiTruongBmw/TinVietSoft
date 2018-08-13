<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>INV Transaction</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var v_chargerName = "<%=Session("USER_NAME")%>";
var v_chargerPK   = "<%=Session("EMPLOYEE_PK")%>";
var G1_PK               = 0,           
    G1_Trans_Type       = 1,
    G1_Slip_No          = 2,
    G1_Status_nm        = 3,
    G1_Trans_Date       = 4,
    G1_Item_Pk_1        = 5,
    G1_Item_Code_1      = 6,
    G1_Item_Name_1      = 7,
    G1_LotNo_1          = 8,
    G1_UOM_1            = 9, 
    G1_Trans_Qty_1      = 10,  
    G1_Wh_Pk_1          = 11,
    G1_Item_Pk_2        = 12,
    G1_Item_Code_2      = 13,
    G1_Item_Name_2      = 14,
    G1_LotNo_2          = 15,
    G1_UOM_2            = 16, 
    G1_Trans_Qty_2      = 17,
    G1_Wh_Pk_2          = 18,
    G1_Pb_line_Pk       = 19,
    G1_Supplier_Pk      = 20,
    G1_Suppler_Name     = 21,
    G1_Charger_Pk       = 22,
    G1_Charger_Name     = 23,
    G1_Ref_No           = 24,
    G1_Remark           = 25,
    G1_Status           = 26;
   
   var rad_cur_val = 'I10'
   
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    
    	var data;   
	
    data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||SELECT ALL";   
    cboWH.SetDataText(data);
	cboWH.value = '';
	  
	cboStatus.SetDataText('DATA|APPROVE|APPROVE|SAVE|SAVE||');  
	cboStatus.value ='SAVE';
	  
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk,WH_ID||' * '||WH_NAME from tlg_in_warehouse where del_if = 0 order by WH_ID")%>";
    grdTrans.SetComboFormat(G1_Wh_Pk_1,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk,WH_ID||' * '||WH_NAME from tlg_in_warehouse where del_if = 0 order by WH_ID")%>";
    grdTrans.SetComboFormat(G1_Wh_Pk_2,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT pk ,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0 and use_yn = 'Y' ORDER BY line_id")%>";
    grdTrans.SetComboFormat(G1_Pb_line_Pk,data);

     //-----------------------------------
    grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
	grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
	grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;			
	grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;
	grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
	
	grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
	grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = true ;
	
	grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = false ;	
    
    OnSearch();
}
//==================================================================
  
function OnAddNew()
{
    grdTrans.AddRow();
    grdTrans.SetGridText(grdTrans.rows-1,G1_Trans_Type,radType.value);
    grdTrans.SetGridText(grdTrans.rows-1,G1_Wh_Pk_1,cboWH.value);
    
    grdTrans.SetGridText(grdTrans.rows-1,G1_Charger_Pk,v_chargerPK);
    grdTrans.SetGridText(grdTrans.rows-1,G1_Charger_Name,v_chargerName);
    
    if(grdTrans.rows>1)
    {
        grdTrans.SetCellBgColor( 1, G1_Trans_Date , grdTrans.rows - 1, G1_Trans_Date , 0xCCFFFF); // 0xCCFFFF
        grdTrans.SetCellBgColor( 1, G1_Item_Code_1 , grdTrans.rows - 1, G1_Item_Name_1 , 0xCCFFFF); // 0xCCFFFF
        grdTrans.SetCellBgColor( 1, G1_Trans_Qty_1 , grdTrans.rows - 1, G1_Item_Name_2 , 0xCCFFFF); // 0xCCFFFF
        grdTrans.SetCellBgColor( 1, G1_Trans_Qty_2 , grdTrans.rows - 1, G1_Suppler_Name , 0xCCFFFF); // 0xCCFFFF
        
    }
}

//==================================================================  
function CheckStatus()
{
    var count =0;
    for(var i =1; i< grdTrans.rows; i++)
    {
        if(grdTrans.GetGridData(i,G1_PK)=="")
        {
            count +=1;
            break;
        }
    }
    
    return count;
}

//==================================================================
function OnSearch()
{
    data_bini00200.Call("SELECT");
}
//==================================================================
function OnSave()
{
    if(CheckSaveValid())
    {
        data_bini00200.Call();
    }
}
//==================================================================

function OnPopUp()
{
    var row = event.row;
    var col = event.col;
    if(col == G1_Suppler_Name)
    {
        var path = System.RootURL + '/standard/forms/fp/ab/fpab00120.aspx' ;
        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

        if ( obj != null )
        {
            grdTrans.SetGridText(grdTrans.row,G1_Supplier_Pk,obj[0]);  
            grdTrans.SetGridText(grdTrans.row,G1_Suppler_Name,obj[2]);            
        }
    }
    if(col == G1_Charger_Name)
    {
        var path = System.RootURL + '/standard/forms/ch/ae/chae00010_search_emp.aspx' ;
        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

        if ( obj != null )
        {
            grdTrans.SetGridText(grdTrans.row,G1_Charger_Pk,obj[0]);  
            grdTrans.SetGridText(grdTrans.row,G1_Charger_Name,obj[2]);            
        }
    }
}
//==================================================================
function OnPrint()
{    
    txtDateFrom.text=dtFrom2.value;
    txtDateTo.text=dtTo2.value;
    
    var url =System.RootURL + "/standard/reports/bi/ni/rpt_bini00130.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'data_bini00200_item':
            if(col1==G1_Item_Code_1||col1==G1_Item_Name_1)
            {
                if(grdTemp.rows==2)
                {
                    grdTrans.SetGridText(row1,G1_Item_Pk_1,grdTemp.GetGridData(1,0));
                    grdTrans.SetGridText(row1,G1_Item_Code_1,grdTemp.GetGridData(1,1));
                    grdTrans.SetGridText(row1,G1_Item_Name_1,grdTemp.GetGridData(1,2));
                    grdTrans.SetGridText(row1,G1_UOM_1,grdTemp.GetGridData(1,3));
                }
                else
                {
                    var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y&item_cd='+txtItem1.text;
                    var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

                    if ( obj != null )
                    {
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Pk_1,obj[0]);  
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Code_1,obj[1]);  
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Name_1,obj[2]); 
                        grdTrans.SetGridText(grdTrans.row,G1_UOM_1,obj[5]);            
                    }
                }
            }
            else if (col1==G1_Item_Code_2||col1==G1_Item_Name_2)
            {
                if(grdTemp.rows==2)
                {
                    grdTrans.SetGridText(row1,G1_Item_Pk_2,grdTemp.GetGridData(1,0));
                    grdTrans.SetGridText(row1,G1_Item_Code_2,grdTemp.GetGridData(1,1));
                    grdTrans.SetGridText(row1,G1_Item_Name_2,grdTemp.GetGridData(1,2));
                    grdTrans.SetGridText(row1,G1_UOM_2,grdTemp.GetGridData(1,3));
                }
                else
                {
                    var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y&item_cd='+txtItem1.text;
                    var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

                    if ( obj != null )
                    {
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Pk_2,obj[0]);  
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Code_2,obj[1]);  
                        grdTrans.SetGridText(grdTrans.row,G1_Item_Name_2,obj[2]); 
                        grdTrans.SetGridText(grdTrans.row,G1_UOM_2,obj[5]);            
                    }
                }
            }
        break;
        case 'data_bini00200':
            if(grdTrans.rows>1)
            {
                grdTrans.SetCellBgColor( 1, G1_Trans_Date , grdTrans.rows - 1, G1_Trans_Date , 0xCCFFFF); // 0xCCFFFF
                grdTrans.SetCellBgColor( 1, G1_Item_Code_1 , grdTrans.rows - 1, G1_Item_Name_1 , 0xCCFFFF); // 0xCCFFFF
                grdTrans.SetCellBgColor( 1, G1_Trans_Qty_1 , grdTrans.rows - 1, G1_Item_Name_2 , 0xCCFFFF); // 0xCCFFFF
                grdTrans.SetCellBgColor( 1, G1_Trans_Qty_2 , grdTrans.rows - 1, G1_Suppler_Name , 0xCCFFFF); // 0xCCFFFF
                
            }
            //----------------------------------
            for(var i =1 ; i< grdTrans.rows ; i++)
            {
                if(grdTrans.GetGridData(i,G1_Status)==3)
                {
                    grdTrans.SetCellBgColor( i, G1_Trans_Type , i, G1_Remark , 0xFFF0F8); // 0xCCFFFF
                }
            }
            lblRecord.text = grdTrans.rows -1 +" record(s)."
        break;
        
        case 'pro_bini00200_Approve':
            data_bini00200.Call('SELECT')
        break;
        
        case 'pro_bini00200_Cancel':
            data_bini00200.Call('SELECT')
        break;
        
    }
}

//==================================================================
function OnCancelData()
{
     var grdId = grdTrans.GetGridControl()
     if (grdId.SelectedRows >0) {
		    for (var i= 1 ; i< grdId.Rows ;i ++) {
			    //Add row to mapping grid
			    if (grdId.IsSelected(i)) {
			        grdApprove.AddRow();
				    grdApprove.SetGridText(grdApprove.rows -1 ,0,grdTrans.GetGridData(i,G1_PK));  // pk								   
			    }
		    }
		    pro_bini00200_Cancel.Call();
	    } else {
		    alert ("Please select data to cancel.");			
	    }
   
} 
//==================================================================
function OnApproveData()
{
     var grdId = grdTrans.GetGridControl()
     if (grdId.SelectedRows >0) {
		    for (var i= 1 ; i< grdId.Rows ;i ++) {
			    //Add row to mapping grid
			    if (grdId.IsSelected(i)) {
			        grdApprove.AddRow();
				    grdApprove.SetGridText(grdApprove.rows -1 ,0,grdTrans.GetGridData(i,G1_PK));  // pk								   
			    }
		    }
		    pro_bini00200_Approve.Call();
	    } else {
		    alert ("Please select data to cancel.");			
	    }
   
} 
//==================================================================

function OnChangeTras()
{
    if(rad_cur_val != radType.value)
    {
        if(CheckStatus()==1)
        {
            if(confirm("Do you want to save current data first?"))
            {
                if(CheckSaveValid())
                {
                    rad_cur_val = radType.value ;
                    data_bini00200.Call();
                }else
                {
                    radType.value = rad_cur_val;
                }
                
            }else
            {
                  rad_cur_val = radType.value ;
                  OnSearch();
            }          
        }else
        {
          rad_cur_val = radType.value ;   
          OnSearch();
        }
    }else
    {
        return;
    }
    
    switch (radType.value)
    {
        case 'I10'://income
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = false ;			
				
        break;
        case 'O10':
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = false ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = true ;	
        break;
        case 'IO90'://exchange  
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = false ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = false ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = false ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = false ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = false ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = true ;	
        break;
        case 'IO60':// Transfer
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = false ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = true ;
        break;
        case 'O70'://income
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = false ;			
				
        break;
        case 'I70':
            grdTrans.GetGridControl().ColHidden(G1_Item_Code_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_Item_Name_2)  = true ;
			grdTrans.GetGridControl().ColHidden(G1_UOM_2)        = true ;	
			grdTrans.GetGridControl().ColHidden(G1_LotNo_2)      = true ;		
			grdTrans.GetGridControl().ColHidden(G1_Trans_Qty_2)  = true ;
			
			grdTrans.GetGridControl().ColHidden(G1_Wh_Pk_2)      = true ;
			grdTrans.GetGridControl().ColHidden(G1_Pb_line_Pk)   = false ;
			
			grdTrans.GetGridControl().ColHidden(G1_Suppler_Name) = true ;	
        break;
    }
   
}
//==================================================================
function CheckSaveValid()
{
    for(var i= 1; i<grdTrans.rows ;i++ )
    {
        if(grdTrans.GetGridData(i,G1_Trans_Date)=="" ||grdTrans.GetGridData(i,G1_Item_Pk_1)==""
           ||grdTrans.GetGridData(i,G1_Trans_Qty_1)=="" ||grdTrans.GetGridData(i,G1_Wh_Pk_1)=="")
           {
            alert("Please, check all information at row " +i +" !" )
            return false;
           }
    }
    return true;
}
//==================================================================
var col1 ;
var row1 ;
function CheckInput()
{
    col1 = event.col;
    row1 = event.row;
    if(col1==G1_Item_Code_1||col1==G1_Item_Name_1)
    {
        txtItem1.text="";
        txtItem1.text=grdTrans.GetGridData(row1,col1);
        data_bini00200_item.Call("SELECT");
    }
    if(col1==G1_Item_Code_2||col1==G1_Item_Name_2)
    {
        txtItem1.text="";
        txtItem1.text=grdTrans.GetGridData(row1,col1);
        data_bini00200_item.Call("SELECT");
    }
}
//==================================================================
function OnDelete()
{
    if(confirm('Do you want to delete this Item?'))
    {
        if ( grdTrans.GetGridData( grdTrans.row, G1_PK ) == '' )
        {
            grdTrans.RemoveRow();
        }
        else
        {   
            grdTrans.DeleteRow();
        }    
    }    
}   
//====================================================
function OnCopy()
{
     var grdId = grdTrans.GetGridControl()
     if (grdId.SelectedRows >0) {
		    for (var i= 1 ; i< grdId.Rows ;i ++) {			    
			    if (grdId.IsSelected(i)) {
			        grdTrans.AddRow();
			        for( var j=G1_Trans_Type; j<G1_Status; j++)
			        {
				        grdTrans.SetGridText(grdTrans.rows -1 ,j,grdTrans.GetGridData(i,j));  // pk								   
				    }
			    }
		    }		  
	    } else {
		    alert ("Please select data to copy.");			
	    }
}	
//==================================================================         
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <gw:data id="data_bini00200" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" function="st_lg_sel_bini00200" procedure="st_lg_upd_bini00200" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" > 
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="cboWH" />
                    <input bind="radType" />
                    <input bind="txtItem" />
                    <input bind="cboStatus" />
                </input> 
                <output bind="grdTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bini00200_item" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" function="st_lg_sel_bini00200_item" > 
                <input> 
                    <input bind="txtItem1" />
                </input> 
                <output bind="grdTemp" /> 
            </dso> 
        </xml> 
    </gw:data>
    
   <!--------------------------------------------------------------------->
    <gw:data id="pro_bini00200_Approve" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" function="st_lg_sel_bini00200_1"  parameter="0" procedure="st_lg_upd_bini00200_1" > 
                <input> 
                    
                </input> 
                <output bind="grdApprove" /> 
            </dso> 
        </xml> 
    </gw:data>
   <!--------------------------------------------------------------------->
    <gw:data id="pro_bini00200_Cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" function="st_lg_sel_bini00200_1"  parameter="0" procedure="st_lg_upd_bini00200_2" > 
                <input> 
                    
                </input> 
                <output bind="grdApprove" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    
    <table id="main" border="0" style="width: 100%; height: 100%" class="eco_line" cellpadding="0" cellspacing="0">
        <tr style="height: 2%" class="eco_bg">
            <td style="width: 70%;white-space:nowrap" align="center">
                <gw:radio id="radType" value="I10" styles="width:100%" onchange="OnChangeTras()"> 
                    <span value="I10" id="rad1">Incoming</span> 
                    <span value="O10" id="rad2">Outgoing</span> 
                    <span value="IO90" id="rad3">Exchange</span> 
                    <span value="IO60" id="rad4">Transfer</span> 
                    <span value="O70" id="rad5">Return To Supplier</span> 
                    <span value="I70" id="rad6">Return From Line</span> 
                </gw:radio>
            </td>
            <td style="width: 30%" align="right">
                <table style="height:100%;" cellpadding="2" cellspacing="1">
                    <tr>
                        <td>
                            <gw:button id="idBtnCopy" img="copy" text="Copy" onclick="OnCopy()" />
                        </td>                        
                        <td>
                            <gw:button img="new" alt="New" id="btnNew" onclick="OnAddNew()" />
                        </td>
                        <td>
                            <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td>
                            <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave()"/>
                        </td>
                        <td>
                            <gw:button id="idBtnApprove" img="select" text="Approve" onclick="OnApproveData()" />
                        </td>                        
                        <td>
                            <gw:button id="idBtnCancel" img="cancel" text="Cancel" onclick="OnCancelData()" />
                        </td>
                        <td>
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch()" />
                        </td>    
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 2%">
            <td class="eco_line_t" colspan="2">
                <table style="height:100%;width:100%" cellpadding="2" cellspacing="1">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%">
                            W/H
                        </td>
                        <td style="width: 20%">
                            <gw:list id="cboWH" styles="width:100%;" />
                        </td>
                         <td style="width: 5%">
                            Item
                        </td>
                        <td style="width: 20%">
                          <gw:textbox id="txtItem" styles='width:100%'  />
                        </td>
                         <td style="width: 15%; white-space: nowrap" align="center">
                             <gw:list id="cboStatus" styles="width:100%;" />                           
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:label id="lblRecord" styles="color:red"> </gw:label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td class="eco_line_t" colspan="2">
                <gw:grid id='grdTrans' header='_PK|_Trans Type|Slip No|Status|Stock Date|_ITEM_1_PK|Item Code |Item Name| Lot No |UOM | Qty |Warehouse |_ITEM_2_PK|Item Code 2|Item Name 2|Lot No|UOM 2|Qty 2|Warehouse 2|Line|_SUPPLIER_PK|Supplier|_CHARGER_PK|Charger|Ref No|Remark|_Status'
                    format='0|0|0|0|4|0|0|0|0|0|-2|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|1|1|3|0|0|0|0|0|0|0|0|0'
                    check='||||||||||||||||||||||||||' editcol='0|0|0|0|1|0|1|1|1|1|1|0|0|1|1|1|1|1|0|0|0|0|0|0|1|1|1'
                    widths='0|0|1200|1000|1200|0|1500|2000|1200|800|1500|1500|0|1500|2000|1500|800|1500|1500|1500|0|1500|0|1500|1000|1500|0'
                    sorting='T'  styles='width:100%; height:100%' oncelldblclick="OnPopUp()"
                    onafteredit="CheckInput()"  />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
    <gw:textbox id="txtInComePK" styles='width:100%;display:none' />
    <gw:textbox id="txtItem1" styles='width:100%;display:none' />
    <gw:grid id='grdTemp' header='PK|ITEM_CODE|ITEM_NAME|UOM' format='0|0|0|0' aligns='0|0|0|0'
        check='|||' editcol='1|1|1|1' widths='1000|1000|1000|1000' sorting='T' autosize='T' 
        styles='width:100%; height:460 ;display:none' />
    <!----------------------------------------------------------->
    <gw:grid id='grdApprove' header='_PK'
    format='0' aligns='0'
    check='' editcol='0'
    widths='0'
    sorting='T'  styles='width:100%; height:100%;display:none' 
    />
</body>
</html>
