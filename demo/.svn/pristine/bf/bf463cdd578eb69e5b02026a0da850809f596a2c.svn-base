<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Object Permission Object</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;overflow-x:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_SY_SEL_GSVS00401_0" 
                        procedure=""> 

                    <input bind="grdData">           
                        <input bind="lstObjKey" /> 
                        <input bind="txtField" /> 
                    </input> 
                    <output bind="grdData" />
                </dso> 
            </xml> 
        </gw:data>
        <!----------------------------------------------------------------------------------------------->
        <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0" >
            <tr style="width:100%;height:1%">
                <td>
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:auto;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td width="75px" align="left">FILTER KEY :</td>
                                <td width="150px">
                                    <gw:list id="lstObjKey" onchange=""><data>DATA|1|Object ID|2|Menu ID|3|Menu Name|4|Parent Menu Name</data></gw:list>
                                </td>
                                <td width="75px" align="center">VALUE :</td>
                                <td width="150px">
                                    <gw:textbox  id="txtField" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                                </td>
                                <td>
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <gw:label id="lblRecord"  text="Rcs : " />
                                </td>
                                <td style="white-space:nowrap">
                                    <gw:label id="lblRecordDT"  text="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:49%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid
                            id="grdData"
                            header	="_PK|Object ID|Menu ID|Menu Name|Parent Menu Name|."
                            format	="0|0|0|0|0|0"  
                            aligns	="0|0|0|0|0|0"  
                            editcol	="0|0|0|0|0|0"  
                            widths	="0|0|0|0|0|0"  
                            styles="width:100%; height:100%"
				            autosize = "T"
                            sorting="T"
				            oncelldblclick="OnClick(this)"
                            />
                    </div>
                </td>
            </tr>
			<tr style="width:100%;height:1%">
                <td>
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:auto;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td width="480px">
                                    &nbsp;
                                </td>
                                <td>
                                    <gw:button id="ibtnDeleteRs" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
								<td>
                                    <gw:button id="ibtnSelectRs" img="select"  text="Select"  onclick="OnClick(this)"/>
                                </td>
								<td>
                                    <gw:label id="lblRecordRs"  text="Rcs : " />
                                </td>
                                <td style="white-space:nowrap">
                                    <gw:label id="lblRecordDTRs"  text="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
			<tr style="width:100%;height:49%">
				<td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
						<gw:grid   
							id="grdSelect"  
							header	="_PK|Object ID|Menu ID|Menu Name|Parent Menu Name|."
                            format	="0|0|0|0|0|0"  
                            aligns	="0|0|0|0|0|0"  
                            editcol	="0|0|0|0|0|0"  
                            widths	="0|0|0|0|0|0"  
							styles="width:100%; height:100%"   
							autosize = "T"
                            sorting="T"
							/>
					</div>
				</td>
			</tr>
        </table>
        <gw:textbox  id="txtResult" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
				
            var G_PK				=	0,
		        G_OBJECT_ID			=	1,
		        G_MENU_ID			=	2,
		        G_MENU_NAME			=	3,
		        G_PARENT_MENU_NAME	=	4,
		        G_END				=	5,
				
				GRS_PK					=	0,
		        GRS_OBJECT_ID			=	1,
		        GRS_MENU_ID				=	2,
		        GRS_MENU_NAME			=	3,
		        GRS_PARENT_MENU_NAME	=	4,
		        GRS_END					=	5
		        ;
            
            var flag = true;
            
            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
            }
            
            function InitData() {
                check_init = 1;
                flag = false;
            }
            
            function InitControl() {
                lstObjKey.value = "4";
            }	
            
            function OnDataReceive(obj) {
                switch (obj.id) {
                    default: return false;
                    case "dso_Data":
                        lblRecordDT.text = grdData.rows - 1;
                        break;
                }
            }

            function OnClick(obj) {
                switch (obj.id) {
                    default: return false;
					case "txtField":
                    case "ibtnSearch":
						if (!OnValid("INIT")) return false;
						dso_Data.Call("SELECT");
					break;
					case "grdData":
						if (!OnValid("INIT")) return false;
						var col_val = obj.GetGridData(event.row, G_PK); 
						if (event.row > 0 && !CheckDataExist(grdSelect,col_val))
						{
							obj.SetCellBgColor(event.row ,G_PK ,event.row ,G_END ,0x99DDFF);
							grdSelect.AddRow();
							for(var i=0 ;i<obj.cols ;i++)
							{
								grdSelect.SetGridText(grdSelect.rows-1 ,i ,obj.GetGridData(event.row ,i));
							}
						} else {
							alert('Data already exist!');
						}
						
						CountItem();
					break;
					case "ibtnDeleteRs":
						if(grdSelect.row > 0)
						{
							var col_val = grdSelect.GetGridData(grdSelect.row ,GRS_PK);       
							grdSelect.RemoveRowAt(grdSelect.row);
							
						    for (var i=1; i<grdData.rows; i++ )
						    {
							  if ( grdData.GetGridData(i, G_PK) == col_val)
							  {
								 CountItem();
								 grdData.SetCellBgColor( i, G_PK , i, G_END  , 0x000000 );
								 return;
							  }
						    }    
						}
					break;
					case "ibtnSelectRs":
						var arr_data = new Array();
   
					    if(grdSelect.rows > 1)
					    {
						  for(var i=1;i<grdSelect.rows;i++)
						  {
							 var arrTemp=new Array();
							 
							 for(var j=0;j<grdSelect.cols;j++)
							 {
								arrTemp[arrTemp.length]= grdSelect.GetGridData(i,j);
							 }
							 
							 arr_data[arr_data.length]= arrTemp;
						  }
						  
						  if ( arr_data !=null )
						  {
							window.returnValue =  arr_data;
							window.close();
						  }
						  else
						  {
							alert("You have not selected data yet.");
						  }
					    }
					break;
                }
            }
                
            function OnValid(obj) {
                switch (obj) {
                    case "INIT":
                        if (check_init == 0) {
                            alert("System not yet ready!");
                            return false;
                        }
                        return true;
                    break;  
				}
            }
            
			function CheckDataExist(p_oGrid,p_value)
			{
			  for(var i=1;i<p_oGrid.rows;i++)
			   {
				  if(p_oGrid.GetGridData(i, G_PK) == p_value)
				  {
					 return true;
				  }
				  
			   }
			   return false;
			}
			
			function CountItem()
			{
				lblRecordDTRs.text = grdSelect.rows - 1;
			}
        </script>
    </body>
</html>