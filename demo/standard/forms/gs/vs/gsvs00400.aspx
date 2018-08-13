<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Object Permission</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="0,1,2,9,10,11,12,13,14,15,16" 
                        function="ST_SY_SEL_GSVS00400_0" 
                        procedure="ST_SY_UPD_GSVS00400_0"> 

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
                        <table style="width:100%;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">FILTER KEY :</td>
                                <td colspan="48" width="48%">
                                    <gw:list id="lstObjKey" onchange=""><data>DATA|1|Full Name|2|User ID|3|Menu ID</data></gw:list>
                                </td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">VALUE :</td>
                                <td colspan="44" width="44%">
                                    <gw:textbox  id="txtField" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate" img="save"  text="Save"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete" img="delete"  text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord"  text="Rcs : " />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT"  text="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:69%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid
                            id="grdData"
                            header	="_PK|_TCO_BSOBJ_PK|_TCO_BSUSER_PK|Object ID|Menu ID|Object Name|Employee ID|User ID|Full Name|1.Search|2.Insert|3.Update|4.Delete|5.Submit|6.Approve|7.Report|8.Process|."
                            format	="0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|0"
                            aligns	="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            editcol	="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            widths	="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
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
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
			var c_pk = "<%=Session("CLIENT_PK")%>";
            var G_PK				=	0,
		        G_TES_OBJ_PK		=	1,
		        G_TES_USER_PK		=	2,
		        G_OBJECT_ID			=	3,
				G_MENU_ID			=	4,
		        G_OBJECT_NAME		=	5,
				G_EMPLOYEE_ID		=	6,
				G_USER_ID			=	7,
				G_FULL_NAME			=	8,
				G_SELECT			=	9,
		        G_INSERT			=	10,
		        G_UPDATE			=	11,
		        G_DELETE			=	12,
		        G_SUBMIT			=	13,
		        G_APPROVE			=	14,
		        G_REPORT			=	15,
				G_PROCESS			=	16,
				G_END				=	17
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
                
            }
            
            function OnDataReceive(obj) {
                switch (obj.id) {
                    default: return false; break;
                    case "dso_Data":
                        lblRecordDT.text = grdData.rows - 1;
                        check_init = 1;
                    break;
                }
            }
			
            function OnClick(obj) {
				var url, obj_arr, arrTemp;
                switch (obj.id) {
                    default: return false; break;
					case "ibtnNew":
                        if (!OnValid("INIT")) return false;
						url = System.RootURL + '/standard/forms/gs/vs/gsvs00401.aspx';
						obj_arr = System.OpenModal( url, 1000, 600, 'resizable:yes;status:yes', this); 
						if( obj_arr != null ){
							for ( var i = 0 ; i < obj_arr.length ; i++){
								arrTemp = obj_arr[i];
								grdData.AddRow();
								grdData.SetGridText( grdData.rows-1, G_TES_OBJ_PK, 		arrTemp[0] ); 
								grdData.SetGridText( grdData.rows-1, G_OBJECT_ID, 		arrTemp[1] );
								grdData.SetGridText( grdData.rows-1, G_MENU_ID, 		arrTemp[2] );
								grdData.SetGridText( grdData.rows-1, G_OBJECT_NAME, 	arrTemp[3] );
								
								grdData.SetGridText( grdData.rows-1, G_SELECT, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_INSERT, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_UPDATE, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_DELETE, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_SUBMIT, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_APPROVE, 		"-1");
								grdData.SetGridText( grdData.rows-1, G_REPORT, 			"-1");
								grdData.SetGridText( grdData.rows-1, G_PROCESS,			"-1");
							}
						}
                    break; 
					case "ibtnUpdate":
                        if (!OnValid("INIT")) return false;
						if (!OnValid("SAVE")) return false;
                        dso_Data.Call();
                    break;
                    case "txtField":
                    case "ibtnSearch":
                        if (!OnValid("INIT")) return false;
                        dso_Data.Call("SELECT");
                    break;
					case "ibtnDelete":
                        if (confirm("Are you sure to delete?")) {
                            grdData.DeleteRow();
                            dso_Data.Call();
                        }
                    break;
					case "grdData":
                        switch(event.col){
							case G_EMPLOYEE_ID:
							case G_USER_ID:
							case G_FULL_NAME:
								url = System.RootURL + '/standard/forms/gs/vs/gsvs00402.aspx?p0=' + c_pk;
								obj_arr= System.OpenModal( url, 1000, 600, 'resizable:yes;status:yes', this); 
								
								if( obj_arr != null ){
									for ( var i = 0 ; i < obj_arr.length ; i++)
									{
										arrTemp = obj_arr[i];
										obj.SetGridText( event.row, G_TES_USER_PK, 		arrTemp[0] ); 
										obj.SetGridText( event.row, G_EMPLOYEE_ID,		arrTemp[1] ); 
										obj.SetGridText( event.row, G_USER_ID, 			arrTemp[2] ); 
										obj.SetGridText( event.row, G_FULL_NAME, 		arrTemp[3] ); 
									}
								}
							break;
							case G_OBJECT_ID:
							case G_MENU_ID:
							case G_OBJECT_NAME:
								url = System.RootURL + '/standard/forms/gs/vs/gsvs00401.aspx';
								obj_arr = System.OpenModal( url, 1000, 600, 'resizable:yes;status:yes', this); 
								if( obj_arr != null ){
									for ( var i = 0 ; i < obj_arr.length ; i++){
										arrTemp = obj_arr[i];
										grdData.SetGridText( event.row, G_TES_OBJ_PK, 	arrTemp[0] ); 
										grdData.SetGridText( event.row, G_OBJECT_ID, 	arrTemp[1] );
										grdData.SetGridText( event.row, G_MENU_ID, 		arrTemp[2] );
										grdData.SetGridText( event.row, G_OBJECT_NAME, 	arrTemp[3] );
										
										grdData.SetGridText( event.row, G_SELECT, 			"-1");
										grdData.SetGridText( event.row, G_INSERT, 			"-1");
										grdData.SetGridText( event.row, G_UPDATE, 			"-1");
										grdData.SetGridText( event.row, G_DELETE, 			"-1");
										grdData.SetGridText( event.row, G_SUBMIT, 			"-1");
										grdData.SetGridText( event.row, G_APPROVE, 			"-1");
										grdData.SetGridText( event.row, G_REPORT, 			"-1");
										grdData.SetGridText( event.row, G_PROCESS, 			"-1");
									}
								}
							break;
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
					case "SAVE":
						for (var i=1; i<grdData.rows; i++){
							if(grdData.GetGridData(i, G_TES_OBJ_PK) == "" || grdData.GetGridData(i, G_TES_USER_PK) == ""){
								alert("Data note valid!");
								return false;
							}
						}
						return true;
						break;
                }
            }
        </script>
    </body>
</html>