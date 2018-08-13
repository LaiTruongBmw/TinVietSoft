<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Emp</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript"> 

var G1_LineGroup_PK = 0,     
    G1_Seq          = 1,
    G1_Group_ID     = 2,
    G1_Group_Name   = 3;

var G2_LinePK          = 0,
    G2_LineGroupPK     = 1,
    G2_Seq             = 2,
    G2_Line_ID         = 3,
    G2_Line_Name       = 4;    
     
var G3_PK             = 0,
    G3_SEQ            = 1,
    G3_TLG_PB_LINE_PK = 2,
    G3_WORK_SHIFT     = 3,  
    G3_CHARGER_PK     = 4,
    G3_EMP_ID         = 5,  
    G3_FULL_NAME      = 6,
    G3_FROM_DATE      = 7,
    G3_TO_DATE        = 8,
    G3_WORK_TYPE      = 9,
    G3_REMARK         = 10;
    
         
var t_open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    FormatGrid(); 
    //-----------     
   
}
//====================================================================================
function BindingDataList()
{
    var  data ;
 
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>|ALL|Select ALL";
    lstFactory.SetDataText( data);
    lstFactory.value = 'ALL' ;    

    txtLineID.SetReadOnly(true);
    txtLineNAME.SetReadOnly(true);
    
    txtLineGroupID.SetReadOnly(true);
    txtLineGroupNAME.SetReadOnly(true);
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGGS0202' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";             
    grdEmp.SetComboFormat(G3_WORK_SHIFT,data); 
    
     data1 = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0301' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";             
    grdEmp.SetComboFormat(G3_WORK_TYPE,data1); 
    
}

//====================================================================================
 function FormatGrid()
 {
      var trl ;
                   
 }
 
 //==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/pw/rpt_fppw00060.aspx?p_pb_line_group_pk=' + txtLineGroupPK.text ;
	window.open(url, "_blank"); 
}
//====================================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdLineGroup':
            data_fppw00060.Call("SELECT");
        break;
        
        case 'grdLine':
            if ( grdLineGroup.row > 0 )
            {
                txtLineGroupPK.text   = grdLineGroup.GetGridData( grdLineGroup.row, G1_LineGroup_PK );
                txtLineGroupID.text   = grdLineGroup.GetGridData( grdLineGroup.row, G1_Group_ID );
                txtLineGroupNAME.text = grdLineGroup.GetGridData( grdLineGroup.row, G1_Group_Name );
            }
            else
            {
                txtLineGroupPK.text = '' ;
                txtLineGroupID.text = '' ;
                txtLineGroupNAME.text = '' ;
            }
            
            data_fppw00060_1.Call("SELECT");
        break;
               
        case 'grdEmp' :
            
		        if ( grdLine.row > 0 )
		        {
			        txtLinePK.text   = grdLine.GetGridData( grdLine.row, G2_LinePK );
			        txtLineID.text   = grdLine.GetGridData( grdLine.row, G2_Line_ID );
			        txtLineNAME.text = grdLine.GetGridData( grdLine.row, G2_Line_Name );
    			    
			        data_fppw00060_3.Call('SELECT');
			    }
			    else
			    {
			        txtLinePK.text    = '' ;
			        txtLineID.text    = '' ;
			        txtLineNAME.text    = '' ;
 			    }									
	        break;              
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
                
        case 'EMP_LIST' :
            if ( txtLinePK.text != '' )
            {
                var path = System.RootURL + "/form/fp/pw/fppw00061.aspx";
                var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
				
                if ( obj != null )
	            {
	                var gCtrl = grdEmp;
	                var arrTemp;
    				
	                for( var i=0; i < obj.length; i++)	  
	                {	
	                    arrTemp = obj[i];
    					
	                    gCtrl.AddRow();
    					
	                    gCtrl.SetGridText( gCtrl.rows-1, G3_SEQ,        gCtrl.rows-1 );
    					
	                    gCtrl.SetGridText( gCtrl.rows-1, G3_TLG_PB_LINE_PK,   txtLinePK.text );
	                    
	                    gCtrl.SetGridText( gCtrl.rows-1, G3_CHARGER_PK, arrTemp[0] ); 

	                    gCtrl.SetGridText( gCtrl.rows-1, G3_EMP_ID,     arrTemp[3]  ); 
					    gCtrl.SetGridText( gCtrl.rows-1, G3_FULL_NAME,  arrTemp[5]  );
    										    
	                }
	            }      
            }
            else
            {
                alert('Pls select one Line.');
            }    
        break;      
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdEmp' :
            data_fppw00060_3.Call();
        break; 
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fppw00060' :
            OnSearch('grdLine');
        break;
        
        case 'data_fppw00060_1' :
            grdEmp.ClearData();
                      
        break;  
    }    
}
//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}
  
 //=================================================================
 
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'WORK_TYPE':
			 var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0301";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		break;
	}
}
 //=================================================================
 
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fppw00060" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_SEL_fppw00060" parameter="0,1,2,3,4,5,6,7"> 
                <input bind="grdLineGroup" >
                    <input bind="lstFactory" /> 
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fppw00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="<%=l_user%>lg_SEL_fppw00060_1" > 
                <input bind="grdLine" >
                    <input bind="txtLineGroupPK" /> 
                </input> 
                <output bind="grdLine" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00060_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fppw00060_3"  procedure="<%=l_user%>lg_upd_fppw00060_3"  > 
			    <input bind="grdEmp" > 
			        <input bind="txtLinePK" />
			        		        					        
			    </input> 
			    <output bind="grdEmp" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Factory
                        </td>
                        <td style="width: 80%">
                            <gw:list id="lstFactory" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdLineGroup')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdLineGroup' header='_PK|Seq|Line Group ID|Line Group Name'
                                format='0|0|0|0' aligns='0|1|0|0' defaults='|||' editcol='0|0|0|0'
                                widths='1000|800|1500|2000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdLine')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="center">
                            Group
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:textbox id="txtLineGroupID" text="" styles="width:30%" />                        
                            <gw:textbox id="txtLineGroupNAME" text="" styles="width:70%"  />
                        </td>                                              
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdLine')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">
                            <gw:grid id='grdLine' header="_PK|_LineGroupPK|Seq|Line ID|Line Name"
                                format='0|0|0|0|0' 
								aligns='0|0|1|0|0'
                                defaults='||||' 
								editcol='0|0|0|0|0'
                                widths='0|0|800|1500|2500'
                                sorting='T' styles='width:100%; height:100%' 
                                onclick="OnSearch('grdEmp')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="center">
                            Line
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:textbox id="txtLineID" text=""  styles="width:30%" />                        
                            <gw:textbox id="txtLineNAME" text=""  styles="width:70%" />
                        </td>
						 
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdEmp')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('EMP_LIST')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdEmp)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdEmp)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdEmp')" />
                        </td>                         
                        <td style="width: 2%">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport()" />
                        </td>
                        
                    </tr>
					
					 <tr style="height: 1%">
                        <td style="width: 5%" align="center">
                            
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                             
                        </td>
						 
                        <td style="width: 1%" colspan=6 align="center" >
                            <b style="color: purple; cursor: hand" onclick="OnPopUp('WORK_TYPE')">Work Type</b>
                        </td>
                         
                        
                    </tr>
					
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id='grdEmp' header='_PK|Seq|_TLG_PB_LINE_PK|Work Shift|_CHARGER_PK|Emp Id|Full Name|From Date|To Date|Work Type|Remark'
                                format='0|0|0|2|0|0|0|4|4|0|0' 
								aligns='0|1|0|0|1|1|0|1|1|0|0' check='||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1' 
								widths='1000|600|1000|1300|1000|1300|3000|1200|1200|1200|2000'
                                sorting='T' styles='width:100%; height:100%'  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />

    <!----------------------------------------------------------->
</body>
</html>
