<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>I/E Partner</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;    
        
    var G1_DETAIL_PK      = 0,
        G1_PARTNER_LOC_PK = 1,
		G1_SEQ			  = 2,
        G1_ATT01          = 3,
        G1_ATT02          = 4,
		G1_ATT03          = 5,
		G1_ATT04          = 6,
		G1_ATT05          = 7;

 //==========================================================================================
 function BodyInit()
 {
      System.Translate(document);
     
	  txtPartnerLocPK.text = "<%=Request.querystring("partner_loc_pk")%>";
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
 //==========================================================================================
 function FormatGrid()
 {

 }
 
 //==========================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_agic00031.Call("SELECT");
            break;     
      }  
 }

 //==========================================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        case 'grdDetail' :       
             
              grdDetail.AddRow();
			  
			  grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, 			  grdDetail.rows-1     );	
			  
			  grdDetail.SetGridText( grdDetail.rows-1, G1_PARTNER_LOC_PK, txtPartnerLocPK.text );			  
        break;
      }  
 }
 
 //==========================================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_agic00031.Call();
            break;
      }  

 }

 //==========================================================================================

 function OnDelete()
 {
		if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == "" ) 
	    {						
				grdDetail.RemoveRow();					
		}			
		else 
		{			 
				grdDetail.DeleteRow();
		 
		}
 }
 
 //==========================================================================================

 function OnUnDelete()
 {
        grdDetail.UnDeleteRow();
 }
 
  
  
 //==========================================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_agic00031':
                 
            break;
        }
 }  
  
 //==========================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agic00031" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_agic00031"  procedure="<%=l_user%>lg_upd_agic00031" > 
                <input> 
                    <input bind="txtPartnerLocPK" /> 
               
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
            <td style="width: 40%" align="right">
                
            </td>
            <td style="width: 10%" align="right">
                 
            </td>
            <td style="width: 40%" align="right">
               <gw:textbox id="txtPartnerLocPK" styles="width:100%;display:none" />
            </td>
            <td style="width: 45%" align="right">
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
                <gw:grid id="grdDetail" header="_PK|_Partner_PK|Seq|Att01|Att02|Att03|Att04|Att05"
                    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol="1|1|1|1|1|1|1|1"
                    widths='0|0|800|4000|4000|4000|4000|4000' styles="width:100%; height:100%"
                    sorting="T"  
            </td>
        </tr>
    </table>
    <!------------------------------------------->
	
	<!------------------------------------------->
</body>
</html>
