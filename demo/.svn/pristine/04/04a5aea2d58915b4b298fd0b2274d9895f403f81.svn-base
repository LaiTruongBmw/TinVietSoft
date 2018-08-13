<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Department</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       
        
    var G1_PK			= 0,
		G1_SEQ        	= 1,
        G1_PARTNER_PK   = 2,
        G1_PARTNER_ID   = 3,
        G1_PARTNER_NAME = 4,	
		G1_UNIT_PRICE	= 5,	
		G1_REMARK     	= 6,
		G1_MASTER_PK	= 7;

var arr_FormatNumber = new Array();

//---------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
     
	var p_master_pk = "<%=Request.querystring("master_pk")%>";
	
	txtMasterPK.text = p_master_pk;
    //--------------  
    FormatGrid();
    //--------------
    OnSearch('grdDetail');
}
 
//===============================================================================
 function FormatGrid()
 {
    var ctr = grdDetail.GetGridControl(); 
          
    ctr.ColFormat(G1_UNIT_PRICE)  	= "#,###,###,###,###,###";
	
	arr_FormatNumber[G1_UNIT_PRICE]= 0;
 }
 
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_bico20021.Call("SELECT");
            break;     
      }  
 }


//===============================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        case 'grdDetail' :       
             
            var path = System.RootURL + '/form/fp/ab/fpab00480.aspx';//purchase_yn=Y
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			
			if ( object != null )
			{						
				var arrTemp
			
				for( var i=0; i < object.length; i++)	  
				{	
					arrTemp = object[i];
							
					grdDetail.AddRow();           
							
					grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, 			grdDetail.rows-1);				
					grdDetail.SetGridText( grdDetail.rows-1, G1_PARTNER_PK, 	arrTemp[0]		);
					grdDetail.SetGridText( grdDetail.rows-1, G1_PARTNER_ID, 	arrTemp[1]		);  	    	                                               									
					grdDetail.SetGridText( grdDetail.rows-1, G1_PARTNER_NAME, 	arrTemp[2]		);   

					grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, 	txtMasterPK.text );         	
				}		            
			} 		        
        break;
      }  
 }
 
//===============================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_bico20021.Call();
            break;
      }  

 }

//===============================================================================

 function OnDelete()
 {
		 
				grdDetail.DeleteRow();
			 
 }
 
//===============================================================================

 function OnUnDelete()
 {
        grdDetail.UnDeleteRow();
 }
 
//===============================================================================
 function CheckInput()
 {   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_UNIT_PRICE )
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
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
	}
 }
  
//===============================================================================
 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdDetail' :
	             var row  = event.row;
	             var col  = event.col;
                 if (col == G1_EXP_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_EXP_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_EXP_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_REV_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_REV_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_REV_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_DEPR_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_DEPR_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_DEPR_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_PL_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00560.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_PL_PK,aValue[6]); 
                            grdDetail.SetGridText(row,G1_PL_NM,aValue[5]); 
                        }		               
                 }
				 else if (col == G1_COST_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00380.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_COST_PK,aValue[6]); 
                            grdDetail.SetGridText(row,G1_COST_NM,aValue[5]); 
                        }		               
                 }
                 else if((col == G1_DEPT_ID || col == G1_DEPT_NAME) && row != 0)
                 {
                       var fpath = System.RootURL + '/form/ep/bp/epbp00201.aspx?p_dept_pk=' + grdDetail.GetGridData( row, G1_DEPT_PK) + '&p_dept_name=' + grdDetail.GetGridData( row, G1_DEPT_NAME);
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                 }
                 else if(col == G1_PARENT_ID && row != 0)
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00550.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');  
                        if ( aValue != null )
                        {
                            grdDetail.SetGridText(row, G1_PARENT_PK, aValue[1]);
                            grdDetail.SetGridText(row, G1_PARENT_ID, aValue[2]);
                        }                  
                 }
            break;
       }     
 }  
 
//===============================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_bico20021':
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G1_DEPT_ID, grdDetail.rows - 1, G1_DEPT_ID, true);
					
					grdDetail.SetCellBgColor( 1, G1_DEPT_ID, grdDetail.rows - 1, G1_DEPT_NAME, 0xCCFFFF );
                }
            break;
        }
 }   
//===============================================================================
function OnReport()
{
	var url =System.RootURL + "/reports/ep/bp/rpt_bico20021.aspx"; 
	System.OpenTargetPage(url); 
}
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico20021" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_bico20021"  procedure="<%=l_user%>lg_upd_bico20021" > 
                <input> 
                    <input bind="txtMasterPK" />                     
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 10%" align="right">
                 
            </td>
            <td style="width: 30%" align="right">
                
            </td>
            <td style="width: 10%" align="right">
                
            </td>
            <td style="width: 30%" align="right">
                 
            </td>
            <td style="width: 15%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" />
            </td>			 
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" header="_PK|Seq|_PARTNER_PK|Partner ID|Partner Name|Unit Price|Remark|_MASTER_PK"
                    format='0|0|0|0|0|0|0|0'
					aligns='0|1|0|0|0|3|0|0' 
					defaults='|||||||' 
					editcol="0|1|0|0|0|1|1|0"
                    widths='0|800|0|2000|3500|1500|1000|0' 
					styles="width:100%; height:100%"
					onafteredit="CheckInput()"
                    sorting="T" />
            </td>
        </tr>				
    </table>
    <!------------------------------------------->
	<gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />	
</body>
</html>
