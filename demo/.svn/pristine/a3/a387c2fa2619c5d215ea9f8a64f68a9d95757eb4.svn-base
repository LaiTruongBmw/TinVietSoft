<!-- #include file="../../../system/lib/form.inc"  -->
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="ftb" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>STYLE ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK = 0 ; 

var G2_PK               = 0,
    G2_TCO_STITEM_PK    = 1,   
    G2_TCO_SPECGRP_PK   = 2,
    G2_Spec_Grp         = 3,
    G2_Seq              = 4,
    G2_TCO_SPEC_PK      = 5,
    G2_Spec_ID          = 6,
    G2_Spec_Name        = 7,
    G2_Description      = 8,
    G2_ATT01            = 9,
    G2_ATT02            = 10;
    
var G3_PK               = 0,
    G3_TCO_STITEM_PK    = 1,
    G3_Seq              = 2,
    G3_PROCESS_PK       = 3,
    G3_Process_ID       = 4,
    G3_Process_Name     = 5,
    G3_NULL_01     		= 6,
    G3_NULL_02    		= 7,
    G3_NULL_03          = 8,
    G3_NULL_04     		= 9,
    G3_NULL_05          = 10,
    G3_PROCESS_FEE      = 11,
    G3_REMARK           = 12;

var arr_FormatNumber = new Array();  
    
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }

//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    
    //----------------------------
    txtGroupCode.SetEnable(false);
    txtGroupName.SetEnable(false);
    txtUOM.SetEnable(false);
    txtBuyer.SetEnable(false);
    //----------------------------
    
    BindingDataList(); 
    FormatGrid(); 
    //----------------------------
    grdSpec.GetGridControl().MergeCells = 2;  
}
//------------------------------------------------------------
function BindingDataList()
{     
    var data="";    
        
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0050') FROM DUAL" )%>";    
    lstSeason.SetDataText(data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
    lstCurrency.SetDataText(data);     
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0050') FROM DUAL" )%>|ALL|Select ALL";    
    lstSeasonSearch.SetDataText(data);
    lstSeasonSearch.value = 'ALL'; 
    //----------------------
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, pattern_id || ' * ' || pattern_name FROM tlg_pt_pattern WHERE del_if = 0 ORDER BY pattern_id ")%>||";     
    lstPattern.SetDataText(data);
    lstPattern.value = '';
}
//--------------------------------------------------------------------------------------------------

function FormatGrid()
 {
      var trl ;
      
      trl = grdProcess.GetGridControl();
      	
      trl.ColFormat(G3_PROCESS_FEE) = "###,###,###,###,###";  
	  
	  arr_FormatNumber[G3_PROCESS_FEE]  = 0;            

 }
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {   
        
        case 'Buyer' :
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	            txtBuyerPK.text   = object[0];
                txtBuyer.text     = object[2];                              
	         }
	    break;
	    
        case 'PatternMaster' :
             var path = System.RootURL + "/form/fp/dp/fpdp00072.aspx";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	         
	            txtPatternMasterPK.text   = object[0];
                txtPatternMaster.text     = object[2];                              
	         }
	    break;    
	        
        case 'UOM':
               var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtUOM.text = obj[1];
               }	
        break;   
 
        case 'Spec':
               //----------------------------------                
               if ( txtItemGroupPK.text == '' )                
               {
                    alert('PLS SELECT ITEM GROUP FIRST');
                    return;
               }
               //----------------------------------        
               var path   = System.RootURL + '/form/fp/dp/fpdp00071.aspx?tco_itemgrp_pk=' + txtItemGroupPK.text ;
               var object = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');

               if ( object != null )
               {
                    for( var i=0; i < object.length; i++)	  
                    {	
                        arrTemp = object[i];
                        
                        grdSpec.AddRow();
                        
                        grdSpec.SetGridText( grdSpec.rows-1, G2_TCO_STITEM_PK, txtMasterPK.text );//master pk		    	                   
                        grdSpec.SetGridText( grdSpec.rows-1, G2_Spec_Grp,      arrTemp[1]);//spec group	
                        grdSpec.SetGridText( grdSpec.rows-1, G2_TCO_SPEC_PK,   arrTemp[2]);//spec pk 
                           
                        grdSpec.SetGridText( grdSpec.rows-1, G2_Seq, grdSpec.rows-1);//Seq Num
                        	    
                        grdSpec.SetGridText( grdSpec.rows-1, G2_Spec_ID,       arrTemp[3]);//spec id	    
                        grdSpec.SetGridText( grdSpec.rows-1, G2_Spec_Name,     arrTemp[4]);//spec name	    
                   }	
               } 
        break;   
        
        case 'Process':
               //----------------------------------        
               var path   = System.RootURL + '/form/fp/ab/fpab00011.aspx' ;
               var object = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');

               if ( object != null )
               {
                    for( var i=0; i < object.length; i++)	  
                    {	
                        arrTemp = object[i];
                        
                        grdProcess.AddRow();
                        
                        grdProcess.SetGridText( grdProcess.rows-1, G3_TCO_STITEM_PK, txtMasterPK.text );//sequence		    	                   
                        grdProcess.SetGridText( grdProcess.rows-1, G3_PROCESS_PK,    arrTemp[0]);//process pk	    
                        grdProcess.SetGridText( grdProcess.rows-1, G3_Process_ID,    arrTemp[1]);//process id	    
                        grdProcess.SetGridText( grdProcess.rows-1, G3_Process_Name,  arrTemp[2]);//process name	    
                   }	
               } 
        break;           
             
        case 'Group':
               
               var path = System.RootURL + '/form/ag/ci/agci00111.aspx?sale_yn=Y&prod_yn=Y';
               var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
               
               if ( obj != null )
               {
                    txtItemGroupPK.text = obj[0]; // GROUP PK
                    txtGroupCode.text   = obj[1]; // GROUP CODE
                    txtGroupName.text   = obj[2]; // GROUP NAME
                    
                    txtUOM.text = obj[10]; //UOM
               }
                              	
        break;                                   
     }	       
}

//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSTitem':
            data_fpdp00070.Call("SELECT");
        break;
        
        case 'grdMaster':  
				         
            if ( data_fpdp00070_1.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSTitem.row > 0 )
                    {
                        txtMasterPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
                    }
                    flag = 'view' ;
                    data_fpdp00070_1.Call("SELECT");
                }                
            } 
            else
            { 
                if ( grdSTitem.row > 0 )
                { 
                    txtMasterPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
                }
                flag = 'view' ;
				
                data_fpdp00070_1.Call("SELECT");
            }                                     
        break;
        
        case 'grdSpec':
            data_fpdp00070_2.Call("SELECT");
        break;
        
        case 'grdProcess':
            data_fpdp00070_3.Call("SELECT");
        break;        
        
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpdp00070_1":
            //----------------------------                
            imgSTItem.SetDataText(txtSTItemPhotoPK.text ); 
            //----------------------------        
            if ( flag == 'save')
            {
                for(var i=0; i < grdSpec.rows; i++)
                {
                    if ( grdSpec.GetGridData( i, G2_TCO_STITEM_PK) == '' )
                    {
                        grdSpec.SetGridText( i, G2_TCO_STITEM_PK, txtMasterPK.text);
                    }    
                }
                OnSave('Spec');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdSpec');   
            }
            
        break; 
              
        case "data_fpdp00070_2":
        
            if ( flag == 'save')
            {
                for(var i=0; i < grdProcess.rows; i++)
                {
                    if ( grdProcess.GetGridData( i, G3_TCO_STITEM_PK) == '' )
                    {
                        grdProcess.SetGridText( i, G3_TCO_STITEM_PK, txtMasterPK.text);
                    }    
                }
                OnSave('Process');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdProcess');   
            }
             
        break;   
        
        case "data_fpdp00070_3":       
            
            if ( flag != 'view' ) 
            {
                txtStyleSearch.text = txtSTItemCode.text ;
                OnSearch('grdSTitem');
            }    
        break;           
    }
}

//-----------------------------------------------------------------------
 function CheckInput(obj)
 { 
    switch (obj.id)
    {
        case "grdProcess":
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            

            if ( col == G3_PROCESS_FEE )
            {
                var dQuantiy
                
                dQuantiy =  grdProcess.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdProcess.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ) );
                    }                     
                }
                else
                {
                    grdProcess.SetGridText(row,col,"")
                }
            }
             
            //------------------------------------------            
        break;
    }       
}     
    
 //-----------------------------------------------------------------------  
function OnAddNew()
{
    data_fpdp00070_1.StatusInsert();
    //------------------------------------------- 
    grdSpec.ClearData();
    grdProcess.ClearData();

    imgSTItem.SetDataText(txtSTItemPhotoPK.text);
        
    flag="view"; 
}  

//-------------------------------------------------------------------------------------

function Validate()
{   
    if ( txtItemGroupPK.text == '' )
    {
        alert('Pls Select Group first !!!');
        return false;
    }
    else if ( txtUOM.text == '' )
    {
        alert('Pls Select UOM first !!!');
        return false;
    }
    //----------------
    return true;
}

//-------------------------------------------------------------------------------------

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if ( Validate() )
            {  
                txtSTItemPhotoPK.SetDataText(imgSTItem.oid);
                          
                flag='save';
                data_fpdp00070_1.Call();                
            }            
        break;
        
        case 'Spec':        
            data_fpdp00070_2.Call();
        break;
        
        case 'Process':        
            data_fpdp00070_3.Call();
        break;        
    }
}

//------------------------------------------------------------------------------------------------

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Style?'))
            {
                flag='delete';
                data_fpdp00070_1.StatusDelete();
                data_fpdp00070_1.Call();
            }   
        break;

        case 'Spec':
            if( confirm('Do you want to delete this Spec ?'))
            {   
                grdSpec.DeleteRow();   
            }            
        break; 
        
        case 'Process':
            if( confirm('Do you want to delete this Process ?'))
            {   
                grdProcess.DeleteRow();   
            }            
        break;                     

    }     
}
//------------------------------------------------------------------------------------- 
 
function OnUnDelete(index)
{ 
    switch (index)
    { 
        case 'Spec':                
            grdSpec.UnDeleteRow();
        break;
        
        case 'Process':                
            grdProcess.UnDeleteRow();
        break;
    }            
            
}

//----------------------------------------------------------
    
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fpdp00070" > 
                <input>                    
                    <input bind="FromYear" /> 
                    <input bind="ToYear" /> 
                    <input bind="lstSeasonSearch" /> 
                    <input bind="chkActiveQuery" />
                    <input bind="txtBuyerSearch" />  
                    <input bind="txtStyleSearch" />                  
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="<%=l_user%>lg_sel_fpdp00070_1" procedure="<%=l_user%>lg_upd_fpdp00070_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtSTItemCode" />  
                    <inout bind="txtSTItemName" />
                    <inout bind="txtBuyerPK" />
                    <inout bind="txtBuyer" />
                    <inout bind="txtItemGroupPK" />
                    <inout bind="txtGroupCode" />           
                    <inout bind="txtGroupName" />
                    <inout bind="StyleYear" />
                    <inout bind="lstSeason" /> 
                    <inout bind="chkActive" />
                    <inout bind="dtaFrom" />        
                    <inout bind="dtaTo" />  
                    <inout bind="txtUOM" />  
                    <inout bind="lstCurrency" />  
                    <inout bind="txtUnitPrice" />       
                    <inout bind="txtDescription" />
                    <inout bind="txtSTItemPhotoPK" />
                    <inout bind="lstPattern" />
                    <inout bind="txtRemak1" />
                    <inout bind="txtRemak2" />
                    <inout bind="txtRemak3" />
                    <inout bind="txtRemak4" />
                    <inout bind="txtRemak5" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00070_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10"  function="<%=l_user%>lg_sel_fpdp00070_2"  procedure="<%=l_user%>lg_upd_fpdp00070_2"> 
              <input  bind="grdSpec"> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdSpec" />   
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12"  function="<%=l_user%>lg_sel_fpdp00070_3"  procedure="<%=l_user%>lg_upd_fpdp00070_3"> 
              <input  bind="grdProcess"> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdProcess" />   
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="Form1" runat="server" style="width: 100%; height: 100%">
        <table border="1" style="width: 100%; height: 100%">
            <tr style="height: 100%">
                <td style="width: 30%" id="left">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 20%" align="right">
                                Year</td>
                            <td style="width: 79%; white-space: nowrap">
                                <gw:datebox id="FromYear" type="year" lang="1" />
                                ~<gw:datebox id="ToYear" type="year" lang="1" />
                            </td>
                            <td style="width: 1%" align="right">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                            </td>
                        </tr>
                        <tr style="height: 1%; white-space: nowrap">
                            <td style="width: 20%" align="right">
                                Season</td>
                            <td style="white-space: nowrap; width: 79%">
                                <gw:list id="lstSeasonSearch" styles="width:100%" />
                            </td>
                            <td style="white-space: nowrap; width: 1%">
                                Active
                                <gw:checkbox id="chkActiveQuery" defaultvalue="Y|N" value="Y" onchange="" />
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td align="right">
                                Buyer
                            </td>
                            <td colspan="2">
                                <gw:textbox id="txtBuyerSearch" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Style</td>
                            <td colspan="2">
                                <gw:textbox id="txtStyleSearch" styles='width:100%' />
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="3">
                                <gw:grid id='grdSTitem' header='_PK|Style Code|Style Name|Year' format='0|0|0|0'
                                    aligns='0|0|0|1' defaults='|||' editcol='0|0|0|0' widths='1000|1500|2000|1000'
                                    sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdMaster')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 70%" align="center" id="right">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td>
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            <a title="Click here to select Group Code" href="#tips" style="text-decoration: none;
                                                color=#0000ff" onclick="OnPopUp('Group')"><b>Group</b></a>
                                        </td>
                                        <td style="width: 40%; white-space: nowrap" colspan="3">
                                            <gw:textbox id="txtItemGroupPK" styles='width:100%;display:none' />
                                            <gw:textbox id="txtGroupCode" styles='width:25%' csstype="mandatory" />
                                            <gw:textbox id="txtGroupName" styles='width:75%' csstype="mandatory" />
                                        </td>
                                        <td style="width: 50%" colspan="4">
                                            <table style="width: 100%; height: 100%">
                                                <tr>
                                                    <td style="width: 96%">
                                                    </td>
                                                    <td style="width: 1%">
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            Style Code
                                        </td>
                                        <td style="width: 40%" colspan="3">
                                            <gw:textbox id="txtSTItemCode" csstype="mandatory" styles="width:100%" />
                                        </td>
                                        <td align="right" style="width: 10%">
                                            <a title="Click here to select Requester" onclick="OnPopUp('Buyer')" href="#tips"
                                                style="text-decoration: none; color=#0000ff"><b>Buyer</b></a>
                                        </td>
                                        <td style="width: 40%" colspan="3">
                                            <gw:textbox id="txtBuyer" styles="width:100%;" onenterkey="" />
                                            <gw:textbox id="txtBuyerPK" styles="display=none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            Style Name
                                        </td>
                                        <td style="width: 40%" colspan="3">
                                            <gw:textbox id="txtSTItemName" csstype="mandatory" styles="width:100%" />
                                        </td>
                                        <td style="width: 10%" align="right">
                                            Pattern
                                        </td>
                                        <td style="width: 40%; white-space: nowrap" colspan="3">
                                            <gw:list id="lstPattern" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            Style Year
                                        </td>
                                        <td style="width: 15%">
                                            <gw:datebox id="StyleYear" type="year" lang="1" />
                                        </td>
                                        <td style="width: 10%" align="right">
                                            Season
                                        </td>
                                        <td style="width: 15%">
                                            <gw:list id="lstSeason" styles="width:100%" />
                                        </td>
                                        <td style="width: 10%" align="right">
                                        </td>
                                        <td style="width: 40%; white-space: nowrap" colspan="3">
                                            <gw:checkbox id="chkActive" defaultvalue="Y|N" />
                                            Active
                                            <gw:datebox id="dtaFrom" lang="<%=Application("Lang")%>" mode="01" />
                                            ~
                                            <gw:datebox id="dtaTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            <a title="Click here to select UOM" href="#tips" style="text-decoration: none; color=#0000ff"
                                                onclick="OnPopUp('UOM')"><b>UOM</b></a>
                                        </td>
                                        <td style="width: 15%">
                                            <gw:textbox id="txtUOM" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td style="width: 10%" align="right">
                                            Currency
                                        </td>
                                        <td style="width: 15%">
                                            <gw:list id="lstCurrency" styles="width:100%" />
                                        </td>
                                        <td style="width: 10%" align="right">
                                            Unit Price</td>
                                        <td style="width: 15%">
                                            <gw:textbox id="txtUnitPrice" styles='width:100%' />
                                        </td>
                                        <td style="width: 10%" align="right">
                                        </td>
                                        <td style="width: 15%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%" align="right">
                                            Description
                                        </td>
                                        <td style="width: 50%" colspan="7">
                                            <gw:textbox id="txtDescription" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td>
                                <!-- <gw:tab> -->
                                <gw:tab>
                            <table style="height: 100%; width: 100%" name="Picture">
                                <tr>
                                    <td>
                                        <gw:image id="imgSTItem" table_name="TCO_STITEMPHOTO" oid="0" view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" styles="width:500;height:300" />
                                    </td>
                                </tr>
                            </table>
                            <table style="height: 100%; width: 100%" name="Style Info">
                                <tr>
                                    <td>
                                        <ftb:freetextbox id="ftbContent" runat="server" height="100%" width="100%" imagegallerypath="~/images/Gallery/" supportfolder="~/form/ag/ci/picture/" BreakMode="LineBreak" ToolbarLayout="ParagraphMenu,FontFacesMenu, FontSizesMenu, FontForeColorsMenu,FontForeColorPicker, FontBackColorsMenu, FontBackColorPicker|Preview,Cut, Copy, Paste, Delete, Undo, Redo, Print | JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, NumberedList, Indent, Outdent , InsertDate, InsertTime ,RemoveFormat| Bold, Italic, Underline, Strikethrough, Superscript, Subscript ,InsertRule, CreateLink, Unlink, InsertImage,InsertImageFromGallery,InsertTable, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,DeleteTableColumn,SymbolsMenu,WordClean"></ftb:freetextbox> 
                                    </td>
                                </tr>
                            </table>                            
                            <table style="height: 100%; width: 100%" name="Spec Code">
                                <tr>
                                    <td style="width: 98%" align="right">
                                        <gw:imgbtn id="btnSubAddSpec" img="new" alt="New" onclick="OnPopUp('Spec')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubDelete" img="delete" alt="Delete" onclick="OnDelete('Spec')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubUndelete" img="udelete" alt="Undelete" onclick="OnUndelete('Spec')" />
                                    </td>
                                </tr>
                                <tr style="height: 100%">
                                    <td colspan="3">
                                        <gw:grid id='grdSpec' header='_PK|_TCO_STITEM_PK|_TCO_SPECGRP_PK|Spec Grp|Seq|_TCO_SPEC_PK|Spec ID|Spec Name|_Description|Needle|Foot/Shaft/Rim'
                                            format='0|0|0|0|0|0|0|0|0|0|0' 
											aligns='0|0|0|0|0|0|0|0|0|0|0' 
											defaults='||||||||||' 
											editcol='0|0|0|0|1|0|0|0|1|1|1'
                                            widths='1000|1000|1000|2500|1000|1000|2000|3000|1000|1000|1000' 
											sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table style="height: 100%; width: 100%" name="Prod Info">
                                <tr style="height: 1%">
                                    <td style="width: 98%" align="right">
                                        <gw:imgbtn id="btnSubAddProcess" img="new" alt="New" onclick="OnPopUp('Process')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubDeleteProceee" img="delete" alt="Delete" onclick="OnDelete('Process')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubUndeleteProcess" img="udelete" alt="Undelete" onclick="OnUndelete('Process')" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td valign="top" colspan="3">
                                        <gw:grid id='grdProcess' 
                                            header='_PK|_TCO_STITEM_PK|Seq|_PROCESS_PK|Process ID|Process Name|_NULL_01|_NULL_02|_NULL_03|_NULL_04|_NULL_05|Processing Fee (%)|Remark'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                            aligns='0|0|0|0|0|0|3|3|3|3|3|3|0' 
											defaults='||||||||||||'
                                            editcol='0|0|1|0|0|0|1|1|1|1|1|1|1' 
                                            widths='0|0|1000|0|2000|4000|0|0|0|0|0|2000|1000'
                                            sorting='T' 
											styles='width:100%; height:100%' 
                                            onafteredit="CheckInput(this)"  />
                                    </td>
                                </tr>
                            </table>
                            <table style="height: 100%; width: 100%" name="Intension Info" cellpadding="0">
                                <tr>
                                     <td style="width: 10%" align="right">
                                            Leather
                                        </td>
                                        <td style="width: 50%">
                                            <gw:textbox id="txtRemak1" styles='width:100%' />
                                        </td>
                                 </tr>
                                 <tr>
                                        <td style="width: 10%" align="right">
                                            Group
                                        </td>
                                        <td style="width: 50%">
                                            <gw:textbox id="txtRemak2" styles='width:100%' />
                                        </td>
                                  </tr>
                                  <tr>
                                        <td style="width: 10%" align="right">
                                            Size
                                        </td>
                                        <td style="width: 50%">
                                            <gw:textbox id="txtRemak3" styles='width:100%' />
                                        </td>
                                  </tr>
                                  <tr>
                                        <td style="width: 10%" align="right">
                                            T&A
                                        </td>
                                        <td style="width: 50%">
                                            <gw:textbox id="txtRemak4" styles='width:100%' />
                                        </td>
                                  </tr>
                                  <tr>
                                  
                                        <td style="width: 10%" align="right">
                                            Remark 5
                                        </td>
                                        <td style="width: 50%">
                                            <gw:textbox id="txtRemak5" styles='width:100%' />
                                        </td>
                                </tr>
                    </table>
                    </gw:tab>
                                <!-- </gw:tab>-->
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtSTItemPhotoPK" text="" style="display: none" />
<!--------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
<!--------------------------------------------------------->
</html>
