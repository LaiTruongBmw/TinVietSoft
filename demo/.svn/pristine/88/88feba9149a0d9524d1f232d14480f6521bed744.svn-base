<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>O/S Price Setting</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
    
var G_PK                = 0,
    G_COMPONENT_PK		= 1,
    G_COMPONENT_CD		= 2,
    G_COMPONENT_NM		= 3,    
    G_OS_TYPE 			= 4, 
    G_PARTNER_PK 		= 5,
    G_PARTNER_ID		= 6,
    G_PARTNER 			= 7,
    G_UNIT_PRICE		= 8,
    G_APPLY_DATE		= 9,
    G_DESCRIPTION		= 10, 
    G_USE_YN		    = 11,
    G_STYLE_PK			= 12;    
	
var G0_COMPONENT_PK  = 1,
    G0_COMPONENT_CD  = 2,
    G0_COMPONENT_NM  = 3;

var G2_STYLE_PK =0;
    //============================================================================
    function BodyInit() 
	{
	    System.Translate(document); 
        BindingList();       
        OnSearch(3);
    }
    //============================================================================ 
    function BindingList() 
	{        
	   var data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT  code, (code || ' ' || code_nm) code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0502' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord")%>";
        grdDetail.SetComboFormat(G_OS_TYPE,data);
    }
    //============================================================================    
    function OnAddNew() 
	{
	    if(grdComp.row > 0)
	    {
	        grdDetail.AddRow();
	        grdDetail.SetGridText(grdDetail.rows-1,G_COMPONENT_PK,grdComp.GetGridData(grdComp.row,G0_COMPONENT_PK));	        
	        grdDetail.SetGridText(grdDetail.rows-1,G_COMPONENT_CD,grdComp.GetGridData(grdComp.row,G0_COMPONENT_CD));
	        grdDetail.SetGridText(grdDetail.rows-1,G_COMPONENT_NM,grdComp.GetGridData(grdComp.row,G0_COMPONENT_NM));
	        
	        grdDetail.SetGridText(grdDetail.rows-1,G_STYLE_PK,txtStyle_pk.text);
	       
	    }else
	    {
	        alert("Select component to set price, please!")
	    }
    }
    //============================================================================
    
    function OnPopUp(obj)
    {
        switch(obj)
        {
            case 'partner':
                var fpath = System.RootURL + "/form/fp/ab/fpab00120.aspx";
                var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
                if (object != null)
                {                  
                    txtPartner.text=object[2];
                }
            break;    
            case 'style':
                var fpath = System.RootURL + "/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y";
                var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
                if (object != null)
                {    
                    txtStyle_pk.text = object[0];       
                    txtStyle_ID.text = object[1] ;    
                    txtStyle_NM.text = object[2];
                    OnSearch(1)
                }
            break;
            case 'component':
                var fpath = System.RootURL + "/form/fp/dp/fpdp00020.aspx";
                var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
                if (object != null)
                {      
                    var arr = object[0];            
                    txtComponent.text = arr[2];
                }
            break;
        }
    }
    //============================================================================
    function OnCellDbClick()
    {
        var col= event.col;
        var row = event.row;
        if( col== G_PARTNER || col== G_PARTNER_ID)
        {
            var fpath = System.RootURL + "/form/fp/ab/fpab00120.aspx";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                grdDetail.SetGridText(row,G_PARTNER_PK,object[0]);
                grdDetail.SetGridText(row,G_PARTNER_ID,object[1]);
                grdDetail.SetGridText(row,G_PARTNER,object[2]);
            }
        }
      
    }
    //============================================================================
    function OnSave() 
	{
        data_fpos00010_1.Call();
    }
    //============================================================================
    function OnSearch(obj) 
	{
	    if(obj ==1)
	    {
	        if(txtStyle_pk.text !="")
            {
            data_fpos00010.Call("SELECT");
            }else
            {
                alert("Select Style first, please!");
            }
        }else
        { 
            if(obj == 2)
            {
                if(txtStyle_pk.text !="")
                {
                     data_fpos00010_1.Call('SELECT')
                }
            }else
            {
                data_fpos00010_2.Call('SELECT');
            }
        }
        
    }
 //============================================================================
    function OnStyleClick()
    {
        if(grdStyle.row>0)
        {
         txtStyle_pk.text = grdStyle.GetGridData(grdStyle.row,G2_STYLE_PK);
         txtComponent.text =""
        }
         data_fpos00010.Call('SELECT')                
    }
   //============================================================================
    function onComponentClick()
    {
        if(grdComp.row>0)
        {
         txtComponent.text = grdComp.GetGridData(grdComp.row,G0_COMPONENT_NM);
        }
         data_fpos00010_1.Call('SELECT')                
    }
    //============================================================================
    function OnDataReceive(pos) 
	{
	    switch(pos.id)
	    {
	        case 'data_fpos00010':
	            data_fpos00010_1.Call('SELECT');
	        break;
	        case 'data_fpos00010_1':
	            if(grdDetail.rows >1)
	            {
	            grdDetail.SetCellBold( 1, G_PARTNER_ID,  grdDetail.rows - 1, G_UNIT_PRICE,  true);
	            grdDetail.SetCellBgColor( 1, G_PARTNER_ID , grdDetail.rows - 1, G_UNIT_PRICE , 0xCCFFFF); // 0xCCFFFF
	            }
	        break;
	    }	    
        
    }
    //=====================================================================================
    function OnDelete() 
	{
        if (grdDetail.row > 0) 
		{
            if (grdDetail.GetGridData(grdDetail.row, G_PK) == "") 
			{
                grdDetail.RemoveRow();
            }
            else 
			{
                if (confirm(" Do you want to mark this row to delete ? ")) 
				{
                    grdDetail.DeleteRow();
                }
            }
        }
    }
    //=====================================================================================
    function OnUnDelete() 
	{
        if (grdDetail.row > 0) 
		{
            grdDetail.UnDeleteRow();
        }
    }
    //=====================================================================================	 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpos00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="<%=l_user%>lg_sel_fpos00010_2"  > 
                <input bind="grdStyle"> 
                     <input bind="txtStyle_NM" />
                </input> 
                <output bind="grdStyle" /> 
            </dso> 
        </xml> 
    </gw:data> 
   <!------------------------------------------------------------------>
    <gw:data id="data_fpos00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="<%=l_user%>lg_sel_fpos00010"  > 
                <input bind="grdComp"> 
                     <input bind="txtStyle_pk" />
                     <input bind="txtSComponent" />
                </input> 
                <output bind="grdComp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpos00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpos00010_1" procedure="<%=l_user%>lg_upd_fpos00010_1"  > 
                <input bind="grdDetail"> 
                    <input bind="txtPartner" /> 
                    <input bind="txtStyle_pk" />
                    <input bind="txtComponent" />                  
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
     <table style="width: 100%; height: 100%">
       <tr style="height: 100%">   
        <td style="width:35%">
            <table style="width: 100%; height: 100%">
                <tr style="height: 5%">
                     <td style="width: 5%; white-space: nowrap">
                        Style
                    </td>
                    <td style="width: 90%">
                        <gw:textbox id="txtStyle_pk" styles='width:100%;display:none'  />
                         <gw:textbox id="txtStyle_NM" styles='width:100%' onenterkey="" />
                    </td>
                    <td>
                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(3)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <gw:grid id='grdStyle'
                            header='_STYLE_PK|Style ID|Style NM'
                            format='0|0|0'
                            aligns='0|0|0'
                            check='||'
                            editcol='0|0|0'
                            widths='0|1500|2000'
                            sorting='T'
                            oncellclick="OnStyleClick()"
                            styles='width:100%; height:100%'
                            />
                    </td>
                </tr>
                <tr style="height: 5%">
                     <td style="width: 5%; white-space: nowrap">
                       Component
                    </td>
                    <td style="width: 90%">
                        <gw:textbox id="txtSComponent" styles='width:100%' onenterkey="" />
                    </td>
                    <td>
                        <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch(1)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <gw:grid id='grdComp'
                            header='_STYLE_PK|_COMPONENT_PK|Component ID|Component NM'
                            format='0|0|0|0'
                            aligns='0|0|0|0'
                            check='|||'
                            editcol='1|1|1|1'
                            widths='0|0|1500|2000'
                            sorting='T'
                            oncellclick="onComponentClick()"
                            styles='width:100%; height:100%'
                            />
                    </td>
                </tr>
               
            </table>
        </td>
        <td style="width:65%">
            <table style="width: 100%; height: 100%">
                <tr style="height: 1%">           
                   <td style="width: 5%; white-space: nowrap">
                        Partner
                    </td>
                    <td style="width: 25%">
                        <gw:textbox id="txtPartner" styles="width:100%;" onenterkey="OnSearch(2)" />
                    </td>
                    <td style="width: 7%; white-space: nowrap">
                        Component
                    </td>
                    <td style="width: 20%">                        
                        <gw:textbox id="txtComponent" styles='width:100%' onenterkey="OnSearch(2)" />
                    </td>                                                                                     
                    <td style="width: 1%">
                        <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew()" />
                    </td>
                    <td style="width: 1%">
                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" />
                    </td>
                    <td style="width: 1%">
                        <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete1" onclick="OnUnDelete()" />
                    </td>
                    <td style="width: 1%">
                        <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('grdSearch')" />
                    </td>
                </tr>
                <tr style="height: 95%">
                    <td style="width: 100%; height: 100%" colspan="14">
                       <gw:grid id='grdDetail'
                        header='_PK|_PT_COMPONENT_PK|_Component ID|Component Nm|OS Type|_PARTNER_PK|Partner ID|Partner Name|Unit Price|Apply Date|Description|Use YN|_STYLE_PK'
                        format='0|0|0|0|0|0|0|0|-2|4|0|3|0'
                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0'
                        check='||||||||||||'
                        editcol='0|0|0|0|1|0|0|0|1|1|1|1|0'
                        widths='0|0|1500|2000|1500|0|1500|2000|1500|1200|1500|800|0'
                        sorting='T'
                        autosize='T' 
                        oncelldblclick ="OnCellDbClick()"
                        styles='width:100%; height:100%'
                        />
                    </td>
                </tr>
            </table>
        </td>
       </tr>
     </table>
     
    
</body>
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
