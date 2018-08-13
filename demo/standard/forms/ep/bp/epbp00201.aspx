<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
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
        
    var G1_PK           = 0,
        G1_DEPT_PK      = 1,
        G1_POINT_ID     = 2,
		G1_POINT_NAME   = 3;

    var G2_PK           = 0,
        G2_DEPT_PK      = 1,
        G2_POINT_ID     = 2,
		G2_POINT_NAME   = 3;
 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);
      data_epbp00200.StatusInsert();
      data_epbp00200_1.StatusInsert();
      txtDeptPK.text  =  "<%=Request.querystring("p_dept_pk")%>";
      lblInDept.text =  "<%=Request.querystring("p_dept_name")%>";
      lblOutDept.text =  "<%=Request.querystring("p_dept_name")%>";
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
//===============================================================================
 function FormatGrid()
 {
    var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   a.code, a.code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE b.GROUP_ID = 'LGPC1190' AND a.tlg_lg_code_group_pk = b.pk AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.code, a.code_nm" )%>" ; 
    grdDetail.SetComboFormat(G1_POINT_NAME,data); 
    grdDetail1.SetComboFormat(G2_POINT_NAME,data); 
 }
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00200.Call('SELECT');
            break;     
            case 'grdDetail1' :
                data_epbp00200_1.Call('SELECT');
            break; 
      }  
 }
//===============================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        case 'grdDetail' :       
              if(txtDeptPK.text == "") return;
              grdDetail.AddRow();
              grdDetail.SetGridText( grdDetail.rows-1, G1_DEPT_PK, txtDeptPK.text);	 
        break;
        case 'grdDetail1' :       
              if(txtDeptPK.text == "") return;
              grdDetail1.AddRow();	 
              grdDetail1.SetGridText( grdDetail1.rows-1, G2_DEPT_PK, txtDeptPK.text);	 
        break;        
      }  
 }
//===============================================================================
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00200.Call();
            break;
            case 'grdDetail1' :
                data_epbp00200_1.Call();
            break;            
      }  
 }
//===============================================================================

 function OnDelete(pos)
 {
    switch(pos)
    {
        case 'grdDetail':
		    if ( grdDetail.GetGridData( grdDetail.row, G1_DEPT_PK ) == "" ) 
	        {						
				    grdDetail.RemoveRow();					
		    }			
		    else 
		    {
			    if ( confirm( "Do you want to mark this row to delete?" ) ) 
			    {
				    grdDetail.DeleteRow();
			    }
		    }
        break;
        case 'grdDetail1':
		    if ( grdDetail1.GetGridData( grdDetail1.row, G1_DEPT_PK ) == "" ) 
	        {						
				    grdDetail1.RemoveRow();					
		    }			
		    else 
		    {
			    if ( confirm( "Do you want to mark this row to delete?" ) ) 
			    {
				    grdDetail1.DeleteRow();
			    }
		    }
        break;        
    }
 }
//===============================================================================

 function OnUnDelete(pos)
 {
    if(pos == "grdDetail")
    {
        grdDetail.UnDeleteRow();
    }
    else if(pos == "grdDetail1")
    {
        grdDetail1.UnDeleteRow();
    }
 }  
//===============================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_epbp00200':
                data_epbp00200_1.Call('SELECT');
            break;
            case 'data_epbp00200_1':
            
            break;            
        }
 }   
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00200" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3" function="st_lg_SEL_EPBP00201"  procedure="st_lg_UPD_EPBP00201" > 
                <input> 
                    <input bind="txtDeptPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
        <gw:data id="data_epbp00200_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3" function="st_lg_SEL_EPBP00201_1"  procedure="st_lg_UPD_EPBP00201_1" > 
                <input> 
                    <input bind="txtDeptPK" /> 
                </input> 
                <output bind="grdDetail1" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
    <!--------------------------IN DEPT---------------------------------------->
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="left">
                IN DEPARTMENT
            </td>
            <td style="width: 100%" align="right">
                <gw:label id="lblInDept" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="new" alt="New" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="UnDelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="10">
                <gw:grid id='grdDetail' header='_PK|_IN_DEPT_PK|Point ID|Name' format='0|0|2|0' aligns='0|0|0|0'
                    check='|||' editcol='1|1|1|0' widths='0|0|1200|1500' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <!--------------OUT DEPT----------------------------->
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="left">
                OUT DEPARTMENT
            </td>
            <td style="width: 100%" align="right">
                <gw:label id="lblOutDept" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="new" alt="New" id="btnAddNew1" onclick="OnAddNew('grdDetail1')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('grdDetail1')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="UnDelete" alt="Un Delete" id="btnUnDelete1" onclick="OnUnDelete('grdDetail1')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="save" alt="Save" id="btnSave1" onclick="OnSave('grdDetail1')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="10">
                <gw:grid id='grdDetail1' header='_PK|_OUT_DEPT_PK|Point ID|Name' format='0|0|2|0' aligns='0|0|0|0'
                    check='|||' editcol='1|1|1|0' widths='0|0|1200|1500' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
	<gw:textbox id="txtDeptPK" styles="width: 100%;display: none" />
</body>
</html>
