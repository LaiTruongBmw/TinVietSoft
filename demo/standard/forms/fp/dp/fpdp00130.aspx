<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Map Spec</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//------------------------------------------------------------
var GS_PK           = 0,
    GS_Style_Code   = 1,
    GS_Style_Name   = 2;

var G2_WP_PK     = 0,
    G2_WProcess  = 1,   
    G2_CompPK    = 2, 
    G2_ItemGrpPK = 3, 
    G2_Comp_ID   = 4, 
    G2_Comp_Nm   = 5, 
    G2_UOM       = 6,  
    G2_StylePK   = 7;     
      
 var action ='SELECT';
//===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//=================================================================================== 
function BodyInit()
{
    System.Translate(document);
    txtStyleName.SetEnable(false);
    //-------
    FormFormat();
    //-------
}
//===============================================================================================
function FormFormat()
{ 
    //-------------------------------------------------
    grdComponent.GetGridControl().MergeCells  = 2 ;	
    grdComponent.GetGridControl().MergeCol(0) = true ;	
    grdComponent.GetGridControl().MergeCol(1) = true ;   	
    //----------------------
    var data=""; 
    
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( PROD_YN = 'Y' or sale_yn = 'Y' ) order by grp_cd")%>";     
    lstGroupSearch.SetDataText(data);
    //----------------------    
 }
//===============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
         
        case 'data_fpdp00130_4':
            data_fpdp00130_1.Call('SELECT');
        break;
        
        case 'data_fpdp00130_1':
            if ( grdComponent.rows > 1 )
            {
                grdComponent.SetCellBold( 1, G2_Comp_ID, grdComponent.rows - 1, G2_Comp_ID, true);
                grdComponent.SetCellBold( 1, G2_Comp_Nm, grdComponent.rows - 1, G2_Comp_Nm, true);                
            }                    
        break; 
        
        case 'pro_fpdp00130_5':        
            alert('Copy sucessfull');
        break;                            
    }
}


//======================================================================
function findItem()
{
    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=|Y|Y|||'
    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

    if ( object != null )
    {
 
    txtStylePK.text   = object[0];
    txtStyleCode.text = object[1];
    txtStyleName.text = object[2];
    OnSearch('Style_Component');
     

    }
}
//======================================================================
 var p_update = '' ;
    
 function OnDelete(pos)
 {
    switch (pos)
    {
        case 'grdComponent' :
            if ( confirm('Are you really want to delete this work process?') )
            {
                grdComponent.DeleteRow();
            }         
        break;   
          
      
    }   
 }
 //======================================================================
 function OnAddNew(obj)
 {
    switch(obj)
    {
        case "grdComponent":
            savestatus = 0;
            var trl = grdComponent.GetGridControl();
            var Seq;
            Seq = trl.Rows>1 ? Number(grdComponent.GetGridData(trl.Rows-1, G2_seq)) +1 : 1;
            grdComponent.AddRow();   
            grdComponent.SetGridText(trl.Rows-1, G2_seq, Seq);
            grdComponent.SetGridText(trl.Rows-1, G2_StylePK, txtStylePK.text);
        break;
      
    }
 }  
 //======================================================================
 function OnValidateData(obj)
 {
    switch (obj)
     {
        case 'grdComponent' :
            var trl = grdComponent.GetGridControl();
            for(var i =1; i<trl.Rows; i++)
            {
                if(grdComponent.GetGridData(i,G2_pb_work_process_pk) =="")
                {
                    alert("Please select work process first!!!");
                    return false;
                }
            }
        break;         
       
     }
     return true;
 }


 //======================================================================
 function OnSave(pos)
 {
     switch (pos)
     {
        case 'grdComponent' :
            if(OnValidateData('grdComponent'))
                data_fpdp00130_1.Call();               
        break;         
      
  
     }
 }
 //======================================================================
 function OnSearch(pos)
 {
    switch ( pos )
    {
        case 'grdSTItemList' :
            data_fpdp00130.Call("SELECT");
        break;
        
        case "Style_Component":
            data_fpdp00130_1.Call('SELECT');
        break;
        
        case 'grdComponent' :
            if ( grdComponent.row > 0 )
            {
//                if((grdComponent.col != G2_wp_id) && (grdComponent.col != G2_wp_name))
                {
                    txtProcessComPK.text = grdComponent.GetGridData( grdComponent.row, G2_CompPK);
                    action = "SELECT";
                    data_fpdp00130_2.Call("SELECT");
                }
            }
        break;  
        case 'Style':
            data_fpdp00130_4.Call('SELECT');
        break;   
    }    
 }
 //======================================================================
 function OnGridCellClick(obj)
 {
    switch (obj.id)
    {
        case 'grdSTItemList' :        
            if ( grdSTItemList.row > 0 )
            {
                txtStylePK.text   = grdSTItemList.GetGridData( grdSTItemList.row, GS_PK         );
                txtStyleCode.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Code );
                txtStyleName.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Name );
                OnSearch('Style_Component');
            }  
        break;
    }
 }
 //======================================================================
function OnGridCellDblClick(obj)
{
   
}
//============================================================================
function OnShowSpecMapping()
{
    if ( grdComponent.row > 0 )
    {
        var event_row = grdComponent.row; 
                          
             txtComponentPk.text   = grdComponent.GetGridData( event_row, G2_CompPK           );
             txtComponentNm.text   = grdComponent.GetGridData( event_row, G2_Comp_Nm );
             txtWorkProcessPK.text = grdComponent.GetGridData( event_row, G2_WP_PK        );
             this.Height        
             window.frames["ifrm_SpecMapping"].document.location.href = "fpdp00131.aspx?style_cons_pk="+ grdComponent.GetGridData( event_row, G2_StylePK);          
       
        return;    
    }
    else
    {
        alert('Pls select on saved item below.');
    }
}
</script>

<body>
    <!-----------------Search ST Item List ---------------------------->
    <gw:data id="data_fpdp00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpdp00130" > 
                <input bind="grdSTItemList" > 
                    <input bind="lstGroupSearch"/> 
                    <input bind="txtSTItemSearch"/>
                    <input bind="chkComponent" />
                </input> 
                <output bind="grdSTItemList" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00130_1" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpdp00130_1"   >
                <input>
                    <input bind="txtStylePK" />
                </input>
                <output bind="grdComponent" />
            </dso>
        </xml>
    </gw:data>
   
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00130_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fpdp00130_4"  > 
                <inout> 
                    <inout bind="txtStyleCode" />  
                    <inout bind="txtStylePK" />
                    <inout bind="txtStyleName"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
   
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 25%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 15%" align="right">
                            <b>Group </b>
                        </td>
                        <td style="width: 84%">
                            <gw:list id="lstGroupSearch" styles='width:100%' onchange="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearchSTItem" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            <b>Style </b>
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtSTItemSearch" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:checkbox id="chkComponent" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSTItemList' header='_PK|Style Code|Style Name' format='0|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='1000|1500|2000' sorting='T' styles='width:100%; height:100%'
                                onclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%" id="t-right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td colspan="3">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" /></td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="findItem()">Style </b>
                                    </td>
                                    <td style="width: 76%; white-space: nowrap">
                                        <gw:textbox id="txtStylePK" styles="display:none;width:30%"   />
                                        <gw:textbox id="txtStyleCode" text="" styles='width:30%' onenterkey="OnSearch('Style')" />
                                        <gw:textbox id="txtStyleName" text="" styles='width:70%' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="search" alt="Search" id="btn" onclick="OnSearch('Style_Component')" />
                                    </td>                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td style="width: 100%" colspan="3">
                            <gw:grid id='grdComponent' header='_WP_pk|W/Process|_CompPK|_ItemGrpPK|Component ID|Component Name|UOM|_Style_pk'
                                format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|0' defaults='|||||||'
                                editcol='0|0|0|0|0|0|0|0' widths='0|2000|0|0|2500|3000|800|0'
                                sorting='T' styles='width:100%; height:100%' 
                                onclick="OnShowSpecMapping()"  />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                         <td colspan="13" style=" color:Red">
                            Select one component to register spec
                         </td>
                    </tr>
                   <tr style="height: 59%">
                        <td colspan="13" id="tab_SpecMaping">
                            <iframe id="ifrm_SpecMapping" style="width: 100%; height: 100%; background-color: Black"
                                frameborder="0"></iframe>
                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtPicture_pk" text="" styles="display:none" />
    <gw:textbox id="txtItemPK" text="" styles="display:none" />
    <gw:textbox id="txtProcessComPK" text="" styles="display:none" />
    <gw:textbox id="txtAlert" text="" styles="display:none" />
    <gw:textbox id="txtListProcessCompPK" text="" styles="display:none" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
     <gw:textbox id="txtComponentPk" text="" styles="display:none" />
     <gw:textbox id="txtComponentNm" text="" styles="display:none" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtWorkProcessPK" text="" styles="display:none" />
    
</body>
</html>
