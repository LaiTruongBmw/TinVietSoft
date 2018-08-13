<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get Partner Location</title>
</head>
<%  
	CtlLib.SetUser("SALE")
    Dim l_user As String
    l_user = "SALE."
%>

<script>
  
var G_LOC_PK		= 0,
	G_PARTNER_PK	= 1,
	G_NULL_01		= 2,
	G_NULL_02		= 3,
	G_LOC_NM		= 4,
	G_LOC_LNM		= 5,
	G_LOC_FNM		= 6,
	G_CHARGER_NM	= 7,
	G_SALE_ORDER	= 8,
	G_DILIVER		= 9,
	G_COLlECTION	= 10,
	G_ZIP_CODE		= 11,
	G_ADDR1			= 12,
	G_MEMO			= 13,
	G_IE_TYPE		= 14,
	G_PHONE			= 15,
	G_FAX			= 16,
	G_EMAIL			= 17,
	G_FROM_DT		= 18,
	G_TO_DT			= 19,
	G_USE			= 20,
	G_REMARK		= 21;
    
    var  partner_pk   = "<%=request.QueryString("partner_pk")%>"   ;
    var  partner_id   = "<%=request.QueryString("partner_id")%>"   ;
    var  partner_name = "<%=request.QueryString("partner_name")%>" ;
	
var detail_row = 0 ;	
    
//=================================================================
    function BodyInit()
    {  
		System.Translate(document);
		
        txtPartnerID.SetEnable(false);
        txtPartnerName.SetEnable(false);
        
		if ( Number(partner_pk) > 0 )
		{
    		txtPartnerPK.text   = partner_pk ;
        	txtPartnerID.text   = partner_id ;
        	txtPartnerName.text = partner_name ;
		}
		
		OnFormFormat();
		
		OnSearch();	
    }
 
//=================================================================

	function OnFormFormat()
	{
		var data ="#10;CONSIGNEE|#20;NOTIFY|#;";
		idGrid.SetComboFormat(G_IE_TYPE,data);
	}
	
//=================================================================
	
    function OnSearch()
    {
            data_fpab00180.Call("SELECT");
    }
//=================================================================
    function OnAddNew()
    {
		if ( txtPartnerPK.text != '' )
		{
        	idGrid.AddRow(); 
			idGrid.SetGridText( idGrid.rows-1 , G_PARTNER_PK , txtPartnerPK.text );
		}
		else
		{
			alert("PLS SELECT BUSINESS PARTNER .");
		}	
    }
//=================================================================
    function OnSave()
    {
        data_fpab00180.Call();
    }
//=================================================================

function OnCancel()
{
    var code_data=new Array()
    
    for( j=0 ; j < idGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//=================================================================
    function OnSelect()
    {
        var code_data = new Array() ;
	    var ctrl = idGrid.GetGridControl();
	    var index, rowNo ;
	    
	    index =0;
	    rowNo = 0 ;
	    
	    if ( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
	    {
	        for(i=0; i<ctrl.SelectedRows; i++)
		    {
		             rowNo = ctrl.SelectedRow(i);
    		         
		             for(j=0; j < idGrid.cols -1; j++)
		             {
		                    code_data[index] = idGrid.GetGridData(rowNo , j );
                            index ++;
                     }
	        }
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
    }

//=================================================================
    function OnDelete()
    {
        if ( idGrid.GetGridData( idGrid.row, 0 ) == '' )
        {
            idGrid.RemoveRow();
        }
        else
        {   
            idGrid.DeleteRow();
        }        
    }
//=================================================================
    function selectPartner()
    {
         var path = System.RootURL + '/form/fp/ab/fpab00120.aspx';
	     var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	     
	     if ( object != null )
	     {
	        txtPartnerPK.text = object[0];
            txtPartnerID.text = object[1];
            txtPartnerName.text = object[2];
	     }
		 
		 OnSearch();
    }
 //=================================================================

	function OnGrdClick(obj)
	{
		switch(obj.id)
		{
			case 'idGrid':
				if ( idGrid.row > 0 )				
				{
					txtPartnerLocPK.text = idGrid.GetGridData( idGrid.row, G_LOC_PK);
					
					detail_row = idGrid.row;
		
					txtMemo.SetDataText( idGrid.GetGridData( idGrid.row, G_MEMO ));
					
					data_fpab00180_1.Call("SELECT");
				}
			break;
		}
	}
	
	
 //==========================================================================================
 
  function TextOnBlur()
 {     		
    idGrid.SetGridText( detail_row, G_MEMO, txtMemo.GetData() );      
 }
 
//====================================================================

 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_fpab00180':
                 grdDetail.ClearData();
            break;
        }
 }  
  
//=================================================================	
</script>

<body>
    <!----------------------------------------------------------->
    <gw:data id="data_fpab00180" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00180" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" procedure="st_lg_upd_fpab00180" > 
                  <input bind="idGrid" > 
                    <input bind="txtPartnerPK" /> 
                    <input bind="txtLocName" /> 
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
<!----------------------------------------------------------->
    <gw:data id="data_fpab00180_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00180_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" procedure="st_lg_upd_fpab00180" > 
                  <input bind="grdDetail" > 
                    <input bind="txtPartnerLocPK" />                   
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>	
    <!----------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 5%">
            <td width="5%" align="right" style="white-space:nowrap">
                <b style="color: #1b2ff2; cursor: hand" onclick="selectPartner()">Partner </b>
            </td>
            <td width="60%" style="white-space:nowrap" >
                <gw:textbox id="txtPartnerID" styles="width:35%" csstype="mandatory" />             
                <gw:textbox id="txtPartnerName" styles="width:65%" csstype="mandatory" />
            </td>
            <td width="5%" align="right" style="white-space:nowrap">
                <b>Loc Name</b>
            </td>
            <td width="24%" style="white-space:nowrap">
                <gw:textbox id="txtLocName" styles="width:100%" />
            </td>
            <td width="1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td width="1%">
                <gw:button id="btnNew" img="new" alt="New" onclick="OnAddNew()" />
            </td>
            <td width="1%">
                <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
            </td>
            <td width="1%">
                <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
            </td>			
            <td width="1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <tr style="height: 50%">
            <td colspan="10">
                <gw:grid id="idGrid" header="_PK|_partner_pk|_Partner ID|_Partner Name|Loc Name|_LOC_LNM|_LOC_FNM|_CHARGER_NM|S/O Def|_DILIVER|_COLlECTION|_ZIP_CODE|ADDR|_LOC_MEMO|IE Type|PHONE|FAX|EMAIL|_FROM_DT|_TO_DT|_USE|Remark"
                    format="0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||||||||||||" editcol="0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                    widths="0|0|1500|4000|2000|0|0|1500|0|0|0|0|3000|0|1500|0|0|0|1500|1500|500|0" styles="width:100%; height:100%"
                    sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" oncellclick="OnGrdClick(this)" />
            </td>
			
        </tr>
		<tr style="height: 25%" id="tab_ItemDesc">
                        <td colspan="2">
                            <gw:textarea id="txtMemo" styles="width:100%;height:95%" onblur="TextOnBlur()" />
                        </td>
        </tr>
		<tr style="height: 25%">
			<td colspan="10">
				<gw:grid id="grdDetail" header="_PK|_Partner_PK|Seq|Att01|Att02|Att03|Att04|Att05"
                    format='0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0' defaults='|||||||' editcol="1|1|1|1|1|1|1|1"
                    widths='0|0|800|4000|4000|4000|4000|4000' styles="width:100%; height:100%"
					 
                    sorting="T"  />
			</td>
		</tr>
    </table>
    <gw:textbox id="txtPartnerPK" styles="width:100%;display:none" />
	<gw:textbox id="txtPartnerLocPK" styles="width:100%;display:none" />
</body>
</html>
