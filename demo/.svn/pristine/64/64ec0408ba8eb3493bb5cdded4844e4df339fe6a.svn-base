<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Popup Object</title>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Get_List_Client" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstClient" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_List_Type" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstType" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_SY_SEL_GSAU00602_0" 
                        procedure=""> 

                    <input bind="grdData_O">                    
                        <input bind="lstClient" /> 
                        <input bind="lstType" /> 
                        <input bind="txtSearch_O" /> 
                    </input> 
                    <output bind="grdData_O" />
                </dso> 
            </xml>
        </gw:data>
        <!----------------------------------------------------------------------------------------------->
        <table style="width:100%;height:95%;border:0px solid black" cellpadding="1" cellspacing="1">
            <tr style="height:1%">
                <td colspan="30" width="30%">
                    <gw:list id="lstClient" styles="width: 100%" onchange="OnClick(this)" />
                </td>
                <td colspan="30" width="30%">
                    <gw:list id="lstType" styles="width: 100%" onchange="OnClick(this)" />
                </td>
                <td colspan="25" width="25%">
                    <gw:textbox  id="txtSearch_O" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                </td>
                <td colspan="1" width="1%">
                    <gw:button id="ibtnSearch_O" img="search"  text="Search"  onclick="OnClick(this)"/>
                </td>
                <td colspan="1" width="1%" style="white-space:nowrap">
                    <gw:label id="lblRecord_O"  text="Rcs : " />
                </td>
                <td colspan="10" width="13%" style="white-space:nowrap">
                    <gw:label id="lblRecordDT_O"  text="0" />
                </td>
            </tr>
            <tr>
                <td colspan="100" valign="top" style="height:99%">
                    <gw:grid id="grdData_O" 
                            header ="_PK|SOURCE|ID|VERSION|NAME|_L.NAME|_F.NAME|PATH|_IMG|_TYPE|_DESC.|_USE YN|."
                            format ="0|0|0|0|0|0|0|0|0|0|0|3|0" 
                            aligns ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0"
                            autosize = 'T'
                            styles="width:100%; height:100%"
                            oncelldblclick = "OnDblClick(this);"
                            sorting="T" autosize="T" />
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtClientID" styles='display:none' />
        <gw:textbox  id="txtUserID" styles='display:none' />
        <gw:textbox  id="txtObjectID" styles='display:none' />
        <gw:textbox  id="txtSysCD" styles='display:none' />
        <gw:textbox  id="txtAllYN" styles='display:none' />
        <gw:textbox  id="txtSRCYN" styles='display:none' />
        <gw:textbox  id="txtColumn" styles='display:none' />
        <gw:textbox  id="txtLable" styles='display:none' />
        <gw:textbox  id="txtLang" styles='display:none' />

        <gw:textbox  id="txtResult" styles='display:none' />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            var check_init = 0;
            var G0_PK = 0,
                G0_SOURCE = 1,
                G0_ID = 2,
                G0_VERSION = 3,
                G0_NAME = 4,
                G0_LNAME = 5,
                G0_FNAME = 6,
                G0_PATH = 7,
                G0_IMG = 8,
                G0_TYPE = 9,
                G0_DESC = 10,
                G0_USE_YN = 11
                ;

            var c_lblRecordDT,
                c_txtSearch_O,
                c_grdData_O,

                c_txtClientID,
                c_txtUserID,
                c_txtObjectID,
                c_txtSysCD,
                c_txtAllYN,
                c_txtSRCYN,
                c_txtColumn,
                c_txtLable,
                c_txtLang,

                c_txtResult,

                c_lstClient,
                c_lstType,
                c_ibtnSearch_O,

                c_dso_Data,
                c_dso_Get_Grid_Client,
                c_dso_Get_Grid_Type
                ;

            function BodyInit() {
                InitControl();
                InitData();
            }

            function InitData() {
                var id = "<%=request.queryString("id") %>";
                c_txtClientID.text = '<%=Session("CLIENT_ID")%>';
                c_txtUserID.text = '<%=Session("LOGIN_ID")%>';
                c_txtSysCD.text = 'CLIENT';
                c_txtAllYN.text = 'Y';
                c_txtSRCYN.text = 'N';
                c_txtLable.text = 'SEL CLIENT';
                c_txtLang.text = System.S_Lang;

                txtSearch_O.text = id;

                c_dso_Get_List_Client.Call();
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT_O;
                c_txtSearch_O = txtSearch_O;
                c_grdData_O = grdData_O;

                c_txtClientID = txtClientID;
                c_txtUserID = txtUserID;
                c_txtSysCD = txtSysCD;
                c_txtAllYN = txtAllYN;
                c_txtSRCYN = txtSRCYN;
                c_txtColumn = txtColumn;
                c_txtLable = txtLable;
                c_lstClient = lstClient;
                c_lstType = lstType;
                c_txtLang = txtLang;

                c_ibtnSearch_O = ibtnSearch_O;

                c_dso_Data = dso_Data;
                c_dso_Get_List_Client = dso_Get_List_Client;
                c_dso_Get_Grid_Type = dso_Get_List_Type;

                c_grdData_O.GetGridControl().FrozenCols = G0_LNAME;
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    case c_dso_Get_List_Client.id:
                        c_txtLable.text = 'SEL TYPE';
                        c_txtSysCD.text = 'SY_OBJ';
                        c_dso_Get_Grid_Type.Call();
                        break;
                    case c_dso_Get_Grid_Type.id:
                        lstType.value = 'OBJ_01';
                        lstType.SetEnable(false);
                        c_dso_Data.Call("SELECT");
                        break;                    
                    case c_dso_Data.id:
                        c_lblRecordDT.text = c_grdData_O.rows - 1;
                        System.Translate(document);
                        check_init = 1;
                        break;
                }
            }

            function OnClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_txtSearch_O.id:
                    case c_ibtnSearch_O.id:
                        c_dso_Data.Call("SELECT");
                        break;
                }
            }

            function OnDblClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    default: return false;
                    case c_grdData_O.id:
                           var row = obj.row;
                           
                           var arr_data = new Array();
   
                           //if(obj.rows > 1)
                           if(obj.row > 0)
                           {   
                              //for(var i=1;i<obj.rows;i++)
                              for(var i=1; i < 2; i++)
                              {
                                 var arrTemp=new Array();
         
                                 for(var j=0;j<obj.cols;j++)
                                 {
                                    //arrTemp[arrTemp.length]= obj.GetGridData(i,j);
                                    arrTemp[arrTemp.length]= obj.GetGridData(obj.row, j);
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
        </script>
    </body>
</html>