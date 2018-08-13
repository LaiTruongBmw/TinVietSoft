<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Process W/I List</title>
</head>

<script>

    var user_pk   = "<%=Session("EMPLOYEE_PK")%>" 
    var user_name = "<%=Session("USER_NAME")%>" 

    var G1_Chk          = 0,
        G1_PK           = 1,
        G1_Status       = 2,
        G1_Slip_No      = 3,
        G1_Ins_Date     = 4,
        G1_Ref_No       = 5,
        G1_PB_LINE_PK   = 6,
        G1_Line_Name    = 7,
        G1_Remark       = 8;
		
    var G2_ST_OUTGO_REQ_M_PK  = 0,
        G2_Status             = 1,  
        G2_Slip_No            = 2,  
        G2_Req_Date           = 3,   
        G2_Ref_No             = 4,
        G2_PB_LINE_PK         = 5,
        G2_Line               = 6,
        G2_Remark	          = 7;
		
	
				
//================================================================

 function BodyInit()
 {  
    System.Translate(document);
     var data = ""; 
     //----------------------------
     data = "<%=ESysLib.SetListDataSQL("SELECT pk ,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id" )%>||";   
      
     lstLine.SetDataText(data);
     lstLine.value="";
     
     lstLine2.SetDataText(data);
     lstLine2.value="";
     
    flag = 'first';   
    OnSearch('Master');
    
 }
//================================================================

 function FormatGrid()
 { 
           
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
 	switch(pos)
 	{
 	    case'Master':
 	        data_fppw00040.Call("SELECT");
 	    break;
 	    case'grdWILine':
 	        data_fppw00040_1.Call("SELECT");
 	    break;
 	}	
 }
//======================================================================
function OnSave(pos)
{
      
}
 
//========================================================================
 function OnDataReceive(obj)
 {  
    switch(obj.id)
    {
        case'pro_fppw00040_2':
            alert(txtReturnValue.text);
            OnSearch('Master');
        break;
        case'pro_fppw00040_1':
            alert(txtReturnValue.text);
            OnSearch('grdWILine');
        break;
        case'data_fppw00040':
            if(flag=='first')
            {
                flag="";
                OnSearch('grdWILine');
            }
            if(flag =='process')
            {
                flag="";
                OnSearch('grdWILine');
            }
            if(grdMaster.rows>0)
            {
                grdMaster.SetCellBold( 1, G1_Slip_No,    grdMaster.rows - 1, G1_Slip_No,    true);
                grdMaster.SetCellBold( 1, G1_Ref_No,    grdMaster.rows - 1, G1_Ref_No,    true);
                grdMaster.SetCellBold( 1, G1_Line_Name,    grdMaster.rows - 1, G1_Line_Name,    true);
                
                grdMaster.SetCellBgColor( 1, G1_Line_Name , grdMaster.rows - 1, G1_Line_Name , 0xCCFFFF );   
            }
            
        break;
        case'data_fppw00040_1':
            if(flag =='process')
            {
                flag="";
                OnSearch('Master');
            }
            if(grdMaster.rows>0)
            {
                grdWILine.SetCellBold( 1, G2_Slip_No,    grdWILine.rows - 1, G2_Slip_No,    true);
                grdWILine.SetCellBold( 1, G2_Ref_No,    grdWILine.rows - 1, G2_Ref_No,    true);
                grdWILine.SetCellBold( 1, G2_Line,    grdWILine.rows - 1, G2_Line,    true);
                
                grdWILine.SetCellBgColor( 1, G2_Line , grdWILine.rows - 1, G2_Line , 0xCCFFFF );   
            }
        break;
        
    }
 }
//==========================================================================
flag ="";
//=========================================================================
 function OnProcess(pos)
 {
    switch(pos)
    {
        case'cons':
            flag = 'process';
            if(grdMaster.rows>1)
            {
                var line_pk = "";
                var temp = 0
                for(i=1;i<grdMaster.rows;i++)
                {
                    if(grdMaster.GetGridData(i,0)==-1)
                    {
                        if(grdMaster.GetGridData(i,G1_PB_LINE_PK)!=line_pk )
                        { 
                            temp = temp + 1 ;
                        }
                        line_pk = grdMaster.GetGridData(i,G1_PB_LINE_PK);          
                    }
                }
                if(temp > 1)
                {
                    alert("You must select same Line");
                    line_pk = "";
                    temp = 0
                }
                else
                {
                    line_pk = "";
                    temp = 0
                    var list_pk ="";
                    var list_pk_2 ="";
                    var ref_no  ="";
                    for(i=1;i<grdMaster.rows;i++)
                    {
                        if(grdMaster.GetGridData(i,0)==-1)
                        {
                            
                            list_pk = list_pk + grdMaster.GetGridData(i,1) + ',';
                            ref_no = ref_no + grdMaster.GetGridData(i,G1_Slip_No) + ',';
                        }
                    }
                    list_pk = list_pk.substring(0,list_pk.length-1);
                    ref_no = ref_no.substring(0,ref_no.length-1);
                    txtListRefno.text = ref_no;
                    txtListPK.text = list_pk;
                    if(txtListPK.text!="")
                    {
                        pro_fppw00040_2.Call();
                    }
                }
            }
            
        break;
         case'OUT':
            flag = 'process';
            if(grdMaster.rows>1)
            {
                var line_pk = "";
                var temp = 0
                for(i=1;i<grdMaster.rows;i++)
                {
                    if(grdMaster.GetGridData(i,0)==-1)
                    {
                        if(grdMaster.GetGridData(i,G1_PB_LINE_PK)!=line_pk )
                        { 
                            temp = temp + 1 ;
                        }
                        line_pk = grdMaster.GetGridData(i,G1_PB_LINE_PK);          
                    }
                }
                if(temp > 1)
                {
                    alert("You must select same Line");
                    line_pk = "";
                    temp = 0
                }
                else
                {
                    line_pk = "";
                    temp = 0
                    var list_pk ="";
                    var list_pk_2 ="";
                    var ref_no  ="";
                    for(i=1;i<grdMaster.rows;i++)
                    {
                        if(grdMaster.GetGridData(i,0)==-1)
                        {
                            
                            list_pk = list_pk + grdMaster.GetGridData(i,1) + ',';
                            ref_no = ref_no + grdMaster.GetGridData(i,G1_Slip_No) + ',';
                        }
                    }
                    list_pk = list_pk.substring(0,list_pk.length-1);
                    ref_no = ref_no.substring(0,ref_no.length-1);
                    txtListRefno.text = ref_no;
                    txtListPK.text = list_pk;
                    if(txtListPK.text!="")
                    {
                        pro_fppw00040_3.Call();
                    }
                }
            }
            
        break;
        case'delete':
            flag = 'process';
            if(grdWILine.row>0)
            {
                txtOutGoReqMPK.text = grdWILine.GetGridData(grdWILine.row,0);
            }
            if(txtOutGoReqMPK.text != "")
            {
                if(confirm('Do you want to delete this Slip'))
                {
                    pro_fppw00040_1.Call();
                }
            }
            else
            {
                alert("Please select one row to delete");
            }
        break;
    }
 }	  		
//=========================================================================			
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00040" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppw00040"  > 
			    <input bind="grdMaster" >
			        <input bind="dtFrom" /> 
			        <input bind="dtTo" /> 
			        <input bind="txtSearchNo" /> 
			        <input bind="lstLine" /> 
			    </input> 
			    <output bind="grdMaster" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00040_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppw00040_1"  > 
			    <input bind="grdWILine" >
			        <input bind="dtFrom2" /> 
			        <input bind="dtTo2" /> 
			        <input bind="txtSearchNo2" /> 
			        <input bind="lstLine2" /> 
			    </input> 
			    <output bind="grdWILine" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fppw00040_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00040_2 " > 
                <input>
                    <input bind="txtListPK" /> 
                    <input bind="txtListRefno" /> 
                    
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fppw00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00040_1" > 
                <input>
                    <input bind="txtOutGoReqMPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
      <!------------------------------------------------------------------>
    <gw:data id="pro_fppw00040_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00040_3" > 
                <input>
                    <input bind="txtListPK" /> 
                    <input bind="txtListRefno" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
            Ins Date
            </td>
            <td style="width: 5%;white-space:nowrap" >
                <gw:datebox id="dtFrom" lang="1" onchange="OnSearch('Master')" /> ~ <gw:datebox id="dtTo" lang="1" onchange="OnSearch('Master')"/>
            </td>
            <td align="right" style="width: 15%; white-space: nowrap">
            Slip No/Req No
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('Master')" />
            </td>
            <td align="right" style="width: 7%; white-space: nowrap">
                Line 
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('Master')" /> 
            </td>
            <td style="width: 1%; white-space: nowrap">
                <gw:icon id="ibtnLinePlan" img="2" text="Cons" alt="Consumption" onclick="OnProcess('cons')"
                    styles='width:100%;display:none' />
                 <gw:icon id="ibtnT_OUT" img="2" text="Out Req" alt="Consumption" onclick="OnProcess('OUT')"
                styles='width:100%' />
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('Master')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id='grdMaster' header='Chk|_PK|Status|Slip No|Ins Date|Ref No|_PB_LINE_PK|Line|Remark'
                    format='3|0|0|0|4|0|0|0|0' aligns='0|0|1|0|1|0|0|0|0' check='||||||||' editcol='1|0|0|0|0|0|0|0|0'
                    widths='500|1000|1200|1500|1200|2000|1000|2000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
             <td style="width: 5%; white-space: nowrap" align="right">
            Req Date
            </td>
            <td style="width: 5%;white-space:nowrap" >
                <gw:datebox id="dtFrom2" lang="1" onchange="OnSearch('grdWILine')"/> ~ <gw:datebox id="dtTo2" lang="1" onchange="OnSearch('grdWILine')"/>
            </td>
            <td align="right" style="width: 15%; white-space: nowrap">
            Slip No/Req No
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSearchNo2" styles="width: 100%" onenterkey="OnSearch('grdWILine')" />
            </td>
            <td align="right" style="width: 7%; white-space: nowrap">
                Line 
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:list id="lstLine2" styles="width: 100%" onchange="OnSearch('grdWILine')"/> 
            </td>
            <td style="width: 1%; white-space: nowrap">
                <gw:icon id="ibtnDelete" img="2" text="Delete" alt="Consumption" onclick="OnProcess('delete')"
                    styles='width:100%' />
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdWILine')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id='grdWILine' header='_ST_OUTGO_REQ_M_PK|Status|Slip No|Req Date|Ref No|_PB_LINE_PK|Line|Remark'
                    format='0|0|0|4|0|0|0|0' aligns='0|1|0|1|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='1000|1200|1500|1200|2000|2000|2000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none' />
    <gw:textbox id="txtLinePK" styles='width:100%;display:none' />
    <gw:textbox id="txtSpec01PK" styles='width:100%;display:none' />
    <gw:textbox id="txtSpec02PK" styles='width:100%;display:none' />
    <gw:textbox id="txtSpec03PK" styles='width:100%;display:none' />
    <gw:textbox id="txtSpec04PK" styles='width:100%;display:none' />
    <gw:textbox id="txtSpec05PK" styles='width:100%;display:none' />
    <gw:textbox id="txtListPK" styles='width:100%;display:none' />  
     <gw:textbox id="txtListRefno" styles='width:100%;display:none' />  
    <gw:textbox id="txtOutGoReqMPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    
    
</body>
</html>
