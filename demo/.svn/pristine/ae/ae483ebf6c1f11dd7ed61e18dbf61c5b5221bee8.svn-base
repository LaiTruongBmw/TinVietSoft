<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Object Permission User</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;overflow-x:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_SY_SEL_GSVS00402_0" 
                        procedure=""> 

                    <input bind="grdData">           
						<input bind="txtClientPk" />
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
                                    <gw:list id="lstObjKey" onchange=""><data>DATA|1|User ID|2|Employee ID|3|Full Name</data></gw:list>
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
            <tr style="height:99%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid
                            id="grdData"
                            header	="PK|Employee ID|User ID|Full Name|."
                            format	="0|0|0|0|0"  
                            aligns	="0|0|0|0|0"  
                            editcol	="0|0|0|0|0"  
                            widths	="0|0|0|0|0"  
                            styles="width:100%; height:100%"
				            autosize = "T"
                            sorting="T"
				            oncelldblclick="OnClick(this)"
                            />
                    </div>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtResult" styles='display:none' />
		<gw:textbox  id="txtClientPk" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
				
            var G_PK				=	0,
		        G_EMPLOYEE_ID	 	=	1,
		        G_USER_ID			=	2,
		        G_FULL_NAME			=	3,
		        G_END				=	4
		        ;

            var flag = true;
            
            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
            }
            
            function InitData() {
				txtClientPk.text = '<%= Request.QueryString("p0") %>';
                check_init = 1;
                flag = false;
            }
            
            function InitControl() {
                lstObjKey.value = "1";
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
						var arr_data = new Array();
						
					    if(event.row > 0)
					    {
							var arrTemp=new Array();
							
							for(var j=0;j<grdData.cols;j++)
							{
								arrTemp[arrTemp.length]= grdData.GetGridData(event.row, j);
							}
							 
							arr_data[arr_data.length]= arrTemp;
							 
							if ( arr_data !=null )
							{
								window.returnValue =  arr_data;
								window.close();
							} else {
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
        </script>
    </body>
</html>