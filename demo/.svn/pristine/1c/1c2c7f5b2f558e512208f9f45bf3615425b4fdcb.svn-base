<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Order Plan PopUp</title>
</head>

<script>

var G2_SPEC01_PK     = 0,
    G2_SPEC01_NM     = 1,
    G2_SPEC02_PK     = 2,
    G2_SPEC02_NM     = 3,
    G2_SPEC03_PK     = 4,
    G2_SPEC03_NM     = 5,
    G2_SPEC04_PK     = 6,
    G2_SPEC04_NM     = 7,
    G2_SPEC05_PK     = 8,
    G2_SPEC05_NM     = 9,
    G2_ORD_QTY       = 10,
    G2_PLAN_QTY      = 11,
	G2_FROM_DT		 = 12,
	G2_TO_DT		 = 13,
    G2_REMARK        = 14,
    G2_ORDPLAN_M_PK  = 15,
    G2_ORDPLAN_D_PK  = 16,
	G2_STYLE_PK		 = 17;
    
//======================================================================    

function BodyInit()
{
    System.Translate(document);
	
    txtPlanPK.text = "<%=Request.querystring("plan_pk")%>" ;
    //--------------
    txtPlanNo.SetEnable(false);
    txtStyleID.SetEnable(false);
    txtStyleName.SetEnable(false);
    //--------------
    OnChangeGroup(); 
    //-------------- 
    OnFormat();
    OnSearch('header');
    //--------------
	
}

//======================================================================
function OnFormat()
{

    var data = "<%=ESysLib.SetListDataSQL("select a.CODE  ,a.CODE_NM   from TLG_LG_CODE  a, TLG_LG_CODE_GROUP b   where a.DEL_IF =0 and b.DEL_IF =0   and a.USE_IF = 'Y' and b.pk = a.TLG_LG_CODE_GROUP_PK   and b.GROUP_ID ='LGPC0304' order by a.DEF_YN desc,a.CODE asc") %>";     
    cboRate.SetDataText(data);
    
	data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
    lstFactory.SetDataText(data); 
	//---------------------------------------------------------
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_NM) = true ;
	
    var ctrl = grdDetail.GetGridControl();

    ctrl.ColFormat(G2_ORD_QTY) = "###,###,###,###";
    ctrl.ColFormat(G2_PLAN_QTY)= "###,###,###,###";	
}

//======================================================================   
 
function OnAddNew(pos)
{
	switch(pos)
	{
		case 'MASTER':
			if ( data_fpip00103.GetStatus() != 20 )
            {
                data_fpip00103.StatusInsert();
				
                txtPlanNo.SetDataText("**New Slip No**") ;
                
                grdDetail.ClearData();
                //----------------                              
            }
            else
            {
                alert("Already add new. Pls input data !!!");
            }		
		break;
		
		case 'DETAIL':
			 //-----------------
			 if ( txtStylePK.text == '' )
			 {
			 	 alert("PLS SELECT STYLE FIRST !");
				 return;
			 }
			 //-----------------			 
			 var path = System.RootURL + '/form/fp/ab/fpab00670.aspx?group_type=Y||Y|||' + '&st_item_pk=' + txtStylePK.text ;	    
			 var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');		 
			  		        
	         if ( object != null )
	         {               
                var arrTemp
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                   
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORDPLAN_M_PK, txtPlanPK.text) ;//master_pk					                                  					                                 
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC01_PK, arrTemp[3] );// 
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC01_NM, arrTemp[4] );// 
					
					grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC02_PK, arrTemp[5] );// 
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC02_NM, arrTemp[6] );//
					
					grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC03_PK, arrTemp[7] );// 
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC03_NM, arrTemp[8] );//
					
					grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC04_PK, arrTemp[9] );// 
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC04_NM, arrTemp[10]);//
					
					grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC05_PK, arrTemp[11]);// 
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC05_NM, arrTemp[12]);//     
					
					grdDetail.SetGridText( grdDetail.rows-1, G2_STYLE_PK, txtStylePK.text );//                   
                }  	            
	         }	 	  
		break;
	}
}
//======================================================================    

function OnSearch(pos)
{
    switch(pos)
    {
        case 'Master':
			if ( Number(txtPlanPK.text) > 0 )
			{
            	data_fpip00103.Call("SELECT");
			}
			else
			{
				OnAddNew('MASTER');
			}	
        break;
        
        case 'grdDetail':
            data_fpip00103_1.Call("SELECT");
        break;
        
        case 'header':
            data_fpip00100_Header.Call("SELECT");
        break;
    }
}

//======================================================================    

function OnChangeGroup()
{
    if(chkGroup.value=='Y')
    {
        var ctrl = grdDetail.GetGridControl();  
      
        ctrl.MergeCells = 2;
        ctrl.MergeCol(G2_SPEC01_PK) = true;
        ctrl.MergeCol(G2_SPEC01_NM) = true;
        ctrl.MergeCol(G2_SPEC02_PK) = true;
        ctrl.MergeCol(G2_SPEC02_NM) = true;
        ctrl.MergeCol(G2_SPEC03_PK) = true;
        ctrl.MergeCol(G2_SPEC03_NM) = true;
        ctrl.MergeCol(G2_SPEC04_PK) = true;
        ctrl.MergeCol(G2_SPEC04_NM) = true;
        ctrl.MergeCol(G2_SPEC05_PK) = true;
        ctrl.MergeCol(G2_SPEC05_NM) = true;
        
        lblGroup.text='Group';
    }
    else
    {
        var ctrl = grdDetail.GetGridControl();  
      
        ctrl.MergeCells = 2;
        ctrl.MergeCol(G2_SPEC01_PK) = false;
        ctrl.MergeCol(G2_SPEC01_NM) = false;
        ctrl.MergeCol(G2_SPEC02_PK) = false;
        ctrl.MergeCol(G2_SPEC02_NM) = false;
        ctrl.MergeCol(G2_SPEC03_PK) = false;
        ctrl.MergeCol(G2_SPEC03_NM) = false;
        ctrl.MergeCol(G2_SPEC04_PK) = false;
        ctrl.MergeCol(G2_SPEC04_NM) = false;
        ctrl.MergeCol(G2_SPEC05_PK) = false;
        ctrl.MergeCol(G2_SPEC05_NM) = false;
        
        lblGroup.text='UnGroup';
    }
    
}

//====================================================================== 

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpip00100_Header':
            if(grdHeader.rows>1)
            {
                var col1=grdHeader.GetGridData(1,2);
                var dis_col1=grdHeader.GetGridData(1,3);
                var col2=grdHeader.GetGridData(1,4);
                var dis_col2=grdHeader.GetGridData(1,5);
                var col3=grdHeader.GetGridData(1,6);
                var dis_col3=grdHeader.GetGridData(1,7);
                var col4=grdHeader.GetGridData(1,8);
                var dis_col4=grdHeader.GetGridData(1,9);
                var col5=grdHeader.GetGridData(1,10);
                var dis_col5=grdHeader.GetGridData(1,11);
                if(dis_col1!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC01_NM,col1);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC01_NM) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC02_NM,col2);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC02_NM) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC03_NM,col3);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC03_NM) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC04_NM,col4);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_NM) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_NM,col5);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_NM) = false ;
                    
                }                
            }

            OnSearch('Master');
        break;
		
        case 'data_fpip00103':
            if ( p_update != 1 )
            {
                OnSearch('grdDetail');
            }
            else
            {  
				for ( var i = 1; i < grdDetail.rows ; i++ )
       		 	{
            		if ( grdDetail.GetGridData( i, G2_ORDPLAN_M_PK) == "" )
            		{
                		grdDetail.SetGridText( i, G2_ORDPLAN_M_PK , txtPlanPK.text ) ;
           			}
        		}
				 
                data_fpip00103_1.Call();   
            }    
        break;
        
        case 'data_fpip00103_1':
		
            if ( p_update == 1 )
            {
                window.returnValue = 1; 
                this.close();            
            }
            else
            {
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G2_ORD_QTY,  grdDetail.rows - 1, G2_ORD_QTY,  true);
                    grdDetail.SetCellBold( 1, G2_PLAN_QTY, grdDetail.rows - 1, G2_PLAN_QTY, true);
					
                    grdDetail.SetCellBgColor( 1, G2_PLAN_QTY, grdDetail.rows - 1, G2_PLAN_QTY, 0xCCFFFF );
					
                    //grdDetail.Subtotal( 0, 2, -1, '10!11','###,###,###'); 
                }
            }        
            //---------------------------------------------          
        break;        
    }
} 

//====================================================================== 

function OnSave()
{
    if(dtFrom.value>dtTo.value)
    {
        alert("Date From must small Date To");
        
    }
    else
    {
        if ( confirm("Do you want to update modify order plan for " + txtPONo.text + " ? ") )
        { 
            p_update = 1;
            
            data_fpip00103.Call();
        }  
    }
      
}
//====================================================================== 
var p_update = 0 ;

function OnDelete()
{
    if ( confirm("Do you want to delete order plan for " + txtPONo.text + " ? ") )
    {    
        p_update = 1; 
        
        data_fpip00103.StatusDelete();

        data_fpip00103.Call();
    }    
}

//====================================================================== 
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
    
    if ( col == G2_PLAN_QTY )
    {
        var dQuantiy;
        
        dQuantiy =  grdDetail.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText(row,col,"")
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"")
        }         
        //---------------------------------------------
        grdDetail.Subtotal( 0, 2, -1, '10!11','###,###,###');
    } 

 }
 //=======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'group' :
            var col=event.col ;
            var row=event.row ;
			
            if ( col == G2_SPEC01_NM ||col == G2_SPEC02_NM || col == G2_SPEC03_NM ||col == G2_SPEC04_NM ||col == G2_SPEC05_NM )
            {
                var spec_pk=grdDetail.GetGridData(grdDetail.row,col-1);
								
				var path = System.RootURL + '/form/fp/ip/fpip00104.aspx?spec_pk='+spec_pk;         		
				var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:40;dialogHeight:20');		 
 
                if(object!=null)
                {
                    grdDetail.SetGridText(grdDetail.row,col-1,object[0]);
                    grdDetail.SetGridText(grdDetail.row,col,(object[1]+' - '+object[2]));
                }
            }
            
        break;
		
	    case 'Style' :             
                 var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y||||';
				 var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');		
	              
	             if ( obj != null )
	             {
	                txtStylePK.text   = obj[0];
	                txtStyleID.text   = obj[1];
                    txtStyleName.text = obj[2];
                 }	
	    break;			
		 
    }
} 
 //=======================================================================
function OnCancel()
{
    window.returnValue = null; 
    this.close();   
}
 //=======================================================================

function PlanQtyWithRate()
{
    for(var i=1 ; i<grdDetail.rows-1 ; i++)
    {
        var value = Number(grdDetail.GetGridData(i,G2_ORD_QTY));
        var plan_qty = value + Math.ceil(value * Number(cboRate.value)/100) ;
        
        grdDetail.SetGridText( i, G2_PLAN_QTY, parseFloat(plan_qty+"").toFixed(0) );
    }
}
//=======================================================================

function OnDateChange(pos)
{
    switch (pos)
    {
        case 'FROM_DT':
			for ( var i=1; i<grdDetail.rows-1; i++ )
			{        
				grdDetail.SetGridText( i, G2_FROM_DT, dtFrom.value );  
            } 
        break;
		
		case 'TO_DT':
			for ( var i=1; i<grdDetail.rows-1; i++ )
			{        
				grdDetail.SetGridText( i, G2_TO_DT, dtTo.value );  
            } 
        break;
    }    
}

//=======================================================================
function OnDeleteDetail()
{
	grdDetail.DeleteRow();
}

//=======================================================================
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00100_Header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00100_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00103" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpip00103" procedure="<%=l_user%>lg_upd_fpip00103"> 
                <inout>
                    <inout bind="txtPlanPK" />
                    <inout bind="txtPlanNo" />  
                    <inout bind="txtStylePK" />
                    <inout bind="txtStyleID" />
                    <inout bind="txtStyleName" />
                    <inout bind="dtFrom" />
                    <inout bind="dtTo" />           
                    <inout bind="txtArraySOPK" />
                    <inout bind="txtPONo" />
                    <inout bind="txtDescription" />    
                    <inout bind="cboRate" />                 
                    <inout bind="lstFactory" />   
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpip00103_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="<%=l_user%>lg_SEL_fpip00103_1" procedure="<%=l_user%>lg_upd_fpip00103_1" >
                <input bind="grdDetail" >
			        <input bind="txtPlanPK" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Plan No</td>
            <td style="width: 20%">
                <gw:textbox id="txtPlanNo" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                From</td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnDateChange('FROM_DT')"/>
                ~
                <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnDateChange('TO_DT')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Remark</td>
            <td style="width: 45%">
                <gw:textbox id="txtDescription" maxlen="100" styles='width:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Factory
            </td>
            <td style="width: 20%">
                <gw:list id="lstFactory" styles='width:100%' csstype="mandatory" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                P/O No</td>
            <td style="width: 20%">
                <gw:textbox id="txtPONo" maxlen="100" styles='width:100%' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Style')">Style</b></td>
            <td style="width: 45%; white-space: nowrap" align="right">
                <gw:textbox id="txtStylePK" styles="display:none" />
                <gw:textbox id="txtStyleID" styles="width:30%" csstype="mandatory" />
                <gw:textbox id="txtStyleName" styles="width:70%" csstype="mandatory" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 70%; white-space: nowrap">
                            <gw:checkbox id="chkGroup" defaultvalue="Y|N" value="Y" onchange="OnChangeGroup()" />
                            &nbsp;&nbsp;&nbsp;
                            <gw:label id="lblGroup" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Rate
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:list id="cboRate" styles="width:100%" onchange="PlanQtyWithRate()" />
                        </td>
                        <td style="width: 5%">
                        </td>
						<td style="width: 1%">							 
							<gw:imgbtn img="new" alt="new" id="btnNew" onclick="OnAddNew('DETAIL')" />
                        </td>
						<td style="width: 1%">
							<gw:imgbtn img="delete" alt="Delete" id="btnDeleteDetail" onclick="OnDeleteDetail()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnDelete" img="2" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnSave" img="2" text="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnCancel()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="8">
                <gw:grid id='grdDetail' 
					header='_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Ord Qty|Plan Qty|From|To|Remark|_pp_plan_m_pk|_pp_ordpland_pk|_style_pk'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0' 
					aligns='0|1|0|1|0|1|0|1|0|1|3|3|1|1|0|0|0|0'
                    defaults='|||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0' 
					acceptnulldate="T"
					widths='1000|2000|1000|2000|1000|2000|1000|2000|1000|2000|1200|1200|1200|1200|1000|0|0|0'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnPopUp('group')" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------->
    <gw:textbox id="txtPlanPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtArraySOPK" maxlen="100" styles='width:100%;display:none' />
    <!--------------------------------------------------------------->
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
	<!--------------------------------------------------------------->
</body>
</html>
