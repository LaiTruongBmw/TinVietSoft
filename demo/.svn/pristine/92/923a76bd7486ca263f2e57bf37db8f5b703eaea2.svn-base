<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>warehouse Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script> 

var G1_PK           = 0,
    G1_WH_ID        = 1,
    G1_WH_NAME      = 2,
    G1_TAC_ABPL_PK  = 3,
    G1_PL_CD        = 4,
	G1_PL_NM	    = 5,
    G1_WH_TYPE      = 6,
    G1_DESCRIPTION  = 7,
	G1_ORD          = 8,
    G1_USE_YN       = 9;

var G2_PK          			= 0,
    G2_TAC_WAREHOUSE_PK     = 1,
	G2_TLG_IN_WAREHOUSE_PK  = 2,
    G2_WH_ID             	= 3,
    G2_WH_NAME         		= 4,
    G2_USE_YN      		    = 5,
    G2_DESCRIPTION          = 6; 
var t_open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
   // FormatGrid(); 
    //-----------     
    
}
//====================================================================================
function BindingDataList()
{
    var  data ;
	<%=CtlLib.SetGridColumnComboFormat("grdLineGroup",6,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACT00001'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;

   
}
//====================================================================================
 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdLineGroup':
            data_fpib00020.Call("SELECT");
        break;
        
        case 'grdLine':
            if ( grdLineGroup.row > 0 )
            {
                txtLineGroupPK.text = grdLineGroup.GetGridData( grdLineGroup.row,0 );
            }
            else
            {
                txtLineGroupPK.text = '' ;
            }
            
            data_fpib00020_1.Call("SELECT");
        break;
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'grdLineGroup' :
            grdLineGroup.AddRow();        
            grdLineGroup.SetCellBgColor( grdLineGroup.rows-1, 0, grdLineGroup.rows-1, grdLineGroup.cols-1, 0xCCFFFF );                       
            grdLineGroup.GetGridControl().TopRow = grdLineGroup.rows -1;            
        break;
        
        case 'grdLine' :
            if ( txtLineGroupPK.text == '' )
            {                
                alert('Pls select data in left to add new mapping !');
                return;
            }
            //=======================
			
			
            var path = System.RootURL + '/standard/forms/60/01/60010160_WH_POPUP.aspx';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdLine.AddRow(); 
                            grdLine.SetGridText( grdLine.rows-1, G2_TAC_WAREHOUSE_PK,txtLineGroupPK.text);
                            grdLine.SetGridText( grdLine.rows-1, G2_TLG_IN_WAREHOUSE_PK, arrTemp[0]);//WH PK	    
                            grdLine.SetGridText( grdLine.rows-1, G2_WH_ID, arrTemp[1]);//WH ID
							grdLine.SetGridText( grdLine.rows-1, G2_WH_NAME, arrTemp[2]);//WH NAME					
                                                     
                    }	
             }                                 
        break;
                        
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdLineGroup' :
            data_fpib00020.Call();
        break;
        
        case 'grdLine' :       
            data_fpib00020_1.Call();
        break;                                
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpib00020' :
            OnSearch('grdLine');
        break;
        
        case 'data_fpib00020_1' :
           
                      
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
//====================================================================================
 
 //=================================================================
 function OnPopUp(obj)
 {
	if(grdLineGroup.col==G1_PL_CD || grdLineGroup.col==G1_PL_NM)
	{
		/*if(obj=='PL')
		{
			var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +'99'+ '&dsqlid=ac_sel_60130120_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null ) 
			{
				if (object[0] != 0)
				{
					grdLineGroup.SetGridText(grdLineGroup.rows-1, G1_TAC_ABPL_PK, object[3]);
					grdLineGroup.SetGridText(grdLineGroup.rows-1, G1_PL_CD, object[0]);
					grdLineGroup.SetGridText(grdLineGroup.rows-1, G1_PL_NM, object[1]);
				}
			}
		}*/
		
					if(obj=='PL')
			{
				var fpath =  System.RootURL + "/standard/forms/60/17/60170001_pl_popup.aspx?";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						grdLineGroup.SetGridText(grdLineGroup.row, G1_TAC_ABPL_PK, object[0]);
						grdLineGroup.SetGridText(grdLineGroup.row, G1_PL_CD, object[1]);
					   grdLineGroup.SetGridText(grdLineGroup.row, G1_PL_NM, object[2]);
					}
				}
			}
		

	}
 }
 //=================================================================

</script>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpib00020" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>ac_sel_60010190" parameter="0,1,2,3,4,5,6,7,8,9" procedure="<%=l_user%>ac_upd_60010190"> 
                <input bind="grdLineGroup" >
                    <input bind="txtWH_ID_Name" /> 
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpib00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6" function="<%=l_user%>ac_sel_60010190_mapping"  procedure="<%=l_user%>ac_upd_60010190_mapping"> 
                <input bind="grdLine" >
                    <input bind="txtLineGroupPK" /> 
                </input> 
                <output bind="grdLine" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 65%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            ID/Name
                        </td>
                        <td style="width: 80%">
                            <gw:textbox id="txtWH_ID_Name" styles="width:100%" onenterkey="OnSearch()"/>
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                           
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdLineGroup')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('grdLineGroup')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" onclick="OnDelete(grdLineGroup)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete2" img="udelete" alt="Undelete" onclick="OnUndelete(grdLineGroup)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdLineGroup')" />
                        </td>
                    </tr>
					
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdLineGroup' header='_PK|W/H ID|W/H NAME|_TAC_ABPL_PK|PL CODE|PL NAME|W/H TYPE|DESCRIPTION|ORD|USE Y/N'
                                format='0|0|0|0|0|0|0|0|0|3' aligns='0|0|1|0|0|0|0|0|0|0' defaults='|||||||||' editcol='0|1|1|0|0|0|1|1|1|1'
                                widths='1000|1500|800|1500|2000|2000|2000|1000|1200|1200' sorting='T' autosize='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdLine')" oncelldblclick="OnPopUp('PL')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 35%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 90%" align="center">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            
                        </td>
                        <td style="width: 1%">
                           
                        </td>
                        <td style="width: 1%">
                           
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('grdLine')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdLine)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndelete(grdLine)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdLine')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10" id="t_Line">
                            <gw:grid id='grdLine' header="_PK|_TAC_WAREHOUSE_PK|_TLG_IN_WAREHOUSE_PK|W/H ID|W/H Name|USE YN|DESCRIPTION"
                                format='0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0'
                                defaults='||||||' editcol='0|0|0|0|0|1|1'
                                widths='0|0|800|1500|2500|2000|800'
                                sorting='T' styles='width:100%; height:100%' autosize='T' onafteredit="" oncelldblclick=""
                                onclick="" />
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
