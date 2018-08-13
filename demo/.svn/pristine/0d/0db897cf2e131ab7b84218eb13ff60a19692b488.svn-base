<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <title>W/H Daily Locking Data</title>
</head>

<script type="text/javascript">

var
    G_PK        = 0,
    G_DATE      = 1,
	G_DEPR_ID	= 2,
    G_CLOSE_YN  = 3,
    G_DESC      = 4;
	
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------
	txtUser_PK.text = "<%=session("USER_PK")%>";
 
	//----------------	
	dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -30));
	dtTo.SetDataText(System.AddDate(dtTo.GetData(), + 30));
	
    OnBindingList();    
     
 }
//===============================================================
function OnBindingList()
{
	var data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWH.SetDataText( data );
	
	
	data = "<%=CtlLib.SetListDataSQL("select pk, DEPT_ID || ' * ' || DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";       
    lstDept.SetDataText(data);      
}
//===============================================================
function OnSearch()
{
    data_bimc00110.Call("SELECT");
}
//===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'pro_bimc00110':
                data_bimc00110.Call("SELECT");
            break;        	           
      }	 
 }
   
  //===============================================================  
  function OnSave()
  {
    data_bimc00110.Call();
  }  
 
 //===============================================================
 function OnProcess()
 {
    pro_bimc00110.Call();
 }
   //=============================================================== 
   
  
	
 //=============================================================== 
 
</script>

<body>  
	 
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_bimc00110" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="st_lg_pro_bimc00110"> 
                <input>
					<input  bind="lstWH" />
					<input  bind="lstDept" />
			        <input	bind="dtFrom"	/>	
					<input	bind="dtTo"	/>		
			    </input> 
                <output>
                    <output bind="txtComp" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>   
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bimc00110" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter ="0,1,2,3,4" function="st_lg_sel_bimc00110" procedure="st_lg_upd_bimc00110"> 
                <input bind="grdDetail" >
					<input  bind="lstWH" />
					<input  bind="lstDept" />
                    <input	bind="dtFrom" />	
					<input	bind="dtTo"	/>
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>  
	<!-------------------------------------------------------------------------->   
     <table border="1"  style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
						<td style="width:5%">
							W/H
						</td>
						
                        <td style="width:30%">
							 <gw:list id="lstWH" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
						</td>
						
						 <td align="right" style="width: 5%; white-space: nowrap">
                            Dept
                        </td>
                        <td style="width: 30%; white-space: nowrap"  >
                             <gw:list id="lstDept" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
                        </td>
						
						
                        <td style="width:5%">
							Date
						</td>
						
                        <td style="width:20%; white-space: nowrap"   >
							<gw:datebox id="dtFrom" lang="1" width="10%" /> ~ <gw:datebox id="dtTo" lang="1" width="10%" />
						</td>
                        
                        <td style="width:7%">							 
						</td>                
						
                        <td style="width:1%">
							<gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch()" />
						</td>                         
                        <td style="width:1%">
							<gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
						</td>
                        <td style="width:1%">
							<gw:imgbtn id="idBtnProcess" img="process" text="Process" onclick="OnProcess()" />
						</td>                      
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdDetail'
                header='_PK|Date|_Depr ID|Close|Remark'
                format='0|4|0|3|0'
                aligns='0|0|1|0|0'
                check='||||'
                editcol='0|1|1|1|1'
                widths='0|1200|1500|800|1500'
                sorting='T'
                styles='width:100%; height:100%'
                />
            </td>
        </tr>
    </table>    
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtComp" styles='width:100%;display:none' />
	 
	<gw:textbox id="txtUser_PK" styles='width:100%;display:none' />
</body>
</html>
