<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Asset Type</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       

    var G1_TYPE_PK          = 0,
        G1_SEQ              = 1,
        G1_ASSET_TYPE_CODE  = 2,
        G1_ASSET_TYPE_NAME  = 3,
        G1_DEPR_TYPE        = 4,
        G1_DEPR_RATE        = 5,
		G1_DEPR_YN          = 6,
		G1_ASSET_ACC_PK     = 7,
        G1_ASSET_ACC_NM     = 8,
        G1_DEPR_ACC_PK      = 9,
        G1_DEPR_ACC_NM      = 10,
        G1_EXPENSE_ACC_PK   = 11,
        G1_EXPENSE_ACC_NM   = 12,        
        G1_REMARK           = 13;
		
	var G2_GRP_PK    = 0,
        G2_SEQ       = 1,
        G2_GRP_CODE  = 2,
        G2_GRP_NAME  = 3,     
		G2_CIRCLE_MT = 4,     
        G2_REMARK    = 5;	

 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);
     
      //--------------  
      FormatGrid();
      //--------------
      //OnSearch('grdAssetType');
 }
 
//===============================================================================
 function FormatGrid()
 {
      var data = "" ;
	  data = "#1;1 * Fixed Asset|#2;2 * Long-term|#3;3 * Short-term|#4;4 * Expense" ;
      grdAssetType.SetComboFormat(G1_DEPR_TYPE,data); 
 
 }
 
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdAssetType' :
                data_fpma00180.Call("SELECT");
            break; 
			
			case 'grdAssetGroup' :
				data_fpma00180_1.Call("SELECT");
			break;
			    
      }  
 }

//===============================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        	case 'grdAssetType' :       
              	grdAssetType.AddRow();	 	           
        	break;
		
		    case 'grdAssetGroup' :       
              	grdAssetGroup.AddRow();	 	           
        	break;
      }  
 }
 
//===============================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdAssetType' :
                data_fpma00180.Call();
            break;
			
			case 'grdAssetGroup' :
                data_fpma00180_1.Call();
            break;
      }  

 }

//===============================================================================

 function OnDelete(pos)
 {
 	switch(pos)
	{
		case 'grdAssetType' :		
			if ( grdAssetType.GetGridData( grdAssetType.row, G1_TYPE_PK ) == "" ) 
		    {						
					grdAssetType.RemoveRow();					
			}			
			else 
			{
				if ( confirm( "Do you want to mark this row to delete?" ) ) 
				{
					grdAssetType.DeleteRow();
				}
			}
		break;
		
		case 'grdAssetGroup' :		
		 
			if ( grdAssetGroup.GetGridData( grdAssetGroup.row, G2_GRP_PK ) == "" ) 
		    {		 		
					grdAssetGroup.RemoveRow();					
			}			
			else 
			{ 	
				if ( confirm( "Do you want to mark this row to delete?" ) ) 
				{ 
					grdAssetGroup.DeleteRow();
				}
			}
		break;		
	}	
 }
 
//===============================================================================

 function OnUnDelete(pos)
 {
 	switch(pos)
	{
		case 'grdAssetType' :		
 	
        	grdAssetType.UnDeleteRow();
		break;
		
		case 'grdAssetGroup' :
			grdAssetGroup.UnDeleteRow();
		break;
	}		
 }
 
//===============================================================================
 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdAssetType' :
	             var row  = event.row;
	             var col  = event.col;
	             
                 if (col == G1_EXPENSE_ACC_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdAssetType.SetGridText(row,G1_EXPENSE_ACC_PK,aValue[0]); 
                            grdAssetType.SetGridText(row,G1_EXPENSE_ACC_NM,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_ASSET_ACC_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdAssetType.SetGridText(row,G1_ASSET_ACC_PK,aValue[0]); 
                            grdAssetType.SetGridText(row,G1_ASSET_ACC_NM,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_DEPR_ACC_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdAssetType.SetGridText(row,G1_DEPR_ACC_PK,aValue[0]); 
                            grdAssetType.SetGridText(row,G1_DEPR_ACC_NM,aValue[2]); 
                        }		               
                 }
            break;
       }     
 }  
 
//===============================================================================
 function OnDataReceive(obj)
 {
//        switch (obj.id)
//        {
//            case 'data_fpma00180':
//                if (grdAssetType.rows > 1)
//                {
//                    grdAssetType.SetCellBold( 1, G1_DEPT_ID, grdAssetType.rows - 1, G1_DEPT_ID, true);
//					
//					grdAssetType.SetCellBgColor( 1, G1_DEPT_ID, grdAssetType.rows - 1, G1_DEPT_NAME, 0xCCFFFF );
//                }
//            break;
//        }
 }   
//===============================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'DEPT':
			 var fpath = System.RootURL + '/form/ep/bp/epbp00200.aspx';
             var aValue  = System.OpenModal(  fpath , 950 , 500 , 'resizable:yes;status:yes');
		break;
	}
}
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpma00180" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fpma00180"  procedure="<%=l_user%>lg_upd_fpma00180" > 
                <input bind="grdAssetType" > 
                    <input bind="txtAssetType" /> 
                </input> 
                <output bind="grdAssetType" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpma00180_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fpma00180_1"  procedure="<%=l_user%>lg_upd_fpma00180_1" > 
                <input bind="grdAssetGroup" > 
                    <input bind="txtAssetGroup" /> 
                </input> 
                <output bind="grdAssetGroup" /> 
            </dso> 
        </xml> 
    </gw:data>	
    <!------------------------------------------------------------------>
	<gw:tab id="tab">
    <table style="width: 100%; height: 100%" name="Asset Type">
        <tr style="height: 2%">
            <td style="width: 20%; white-space: nowrap" align="right">
                Asset Type
            </td>
            <td style="width: 30%" align="right">
                <gw:textbox id="txtAssetType" styles="width:100%" onenterkey="OnSearch('grdAssetType')" />
            </td>             
            <td style="width: 40%" align="center">
				<a title="Create Department" href="#tips" style="text-decoration: none; color=#0000ff"
                    onclick="OnPopUp('DEPT')"><b>Department</b>
            </td>
            <td style="width: 5%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdAssetType')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="new" alt="New" id="btnAddNew1" onclick="OnAddNew('grdAssetType')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('grdAssetType')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete1" onclick="OnUnDelete('grdAssetType')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('grdAssetType')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="10">
                <gw:grid id='grdAssetType' header='_PK|Seq|Type Code|Type Name|Depr Type|Depr Rate|Depr Y/N|_ASSET_ACC_PK|Asset ACC|_DEPR_ACC_PK|Depr ACC|_EXPENSE_ACC_PK|Expense ACC|Remark'
                    format='0|0|0|0|0|1|3|0|0|0|0|0|0|0' aligns='0|1|0|0|1|0|0|0|0|0|0|0|0|0' check='|||||||||||||' editcol='1|1|1|1|1|1|1|0|0|0|0|0|0|1'
                    widths='0|800|1500|2500|1500|1200|1000|0|2500|0|2500|0|2500|1000' sorting='T' 
                    styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick('grdAssetType')" />
            </td>
        </tr>
    </table>
	<table style="width: 100%; height: 100%" name="Asset Group">
        <tr style="height: 2%">
            <td style="width: 20%; white-space: nowrap" align="right">
                Asset Group
            </td>
            <td style="width: 30%" align="right">
                <gw:textbox id="txtAssetGroup" styles="width:100%" onenterkey="OnSearch('grdAssetGroup')" />
            </td>
            <td style="width: 10%" align="right">
            </td>
            <td style="width: 30%" align="right">
            </td>
            <td style="width: 15%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdAssetGroup')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="new" alt="New" id="btnAddNew2" onclick="OnAddNew('grdAssetGroup')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete2" onclick="OnDelete('grdAssetGroup')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete2" onclick="OnUnDelete('grdAssetGroup')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="save" alt="Save" id="btnSave2" onclick="OnSave('grdAssetGroup')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="10">
                <gw:grid id='grdAssetGroup' header='_PK|Seq|Group Code|Group Name|Circle M/T|Remark'
                    format='0|0|0|0|1|0' aligns='0|1|0|0|3|0' check='|||||' editcol='1|1|1|1|1|1'
                    widths='0|800|1500|2500|1500|1500' sorting='T' 
                    styles='width:100%; height:100%'  />
            </td>
        </tr>
    </table>
	</gw:tab>
    <!------------------------------------------->
</body>
</html>
