<!-- #include file="../../lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Dictionnary</title>
</head>
<script>
    var insert_status = true;
    var form_id = '<%= Request.QueryString("form_id") %>';
    var type_dic = '<%= Request.QueryString("type_dic") %>';
var G2_pk=0,
	G2_TCO_BSOBJ_ID=1,
    G2_FIELD_NAME=2,
	G2_ENGLISH=3,
	G2_VIETNAMESE=4,
	G2_KOREAN=5,
	G2_CHINESE=6,
	G2_JAPANESE=7,
	G2_FRENCH=8,
	G2_REMARK=9,
    G2_TYPE_DIC=10;

function BodyInit() {
    txtFormID.text = form_id;
    txtType.text = type_dic;
    idBtnSaveF.SetEnable(System.S_Lang == "ENG");
    OnSeach();
    
}

function OnAdd() {
    var data = new Array;
    data = System.S_ArrDictAuto;
    var arr_grd = new Array;
    var str_return = "";
    for (var i = 1; i <= idGrid2.rows - 1; i++) {
        arr_grd[i-1] = idGrid2.GetGridData(i, G2_FIELD_NAME);
    }
    
    if (txtFormID.text != "") {
        //if (dict != "") {
        if (data.length > 0){
            var b_exist = false;
            //data = dict.split('!');
            for (var x = 0; x < data.length; x++) {
			document.getElementById("test111").value += data[x];
                if (data[x].length > 1) {
                    b_exist = false;
                    for (var i = 0; i < arr_grd.length; i++) {
                        if (data[x] == arr_grd[i]) {
                            b_exist = true;
                        }
                    }
                    if (b_exist == false) {
                        str_return += data[x] + "!";
                    }
                }
            }

            str_return = str_return.substr(0, str_return.length - 1);
        }

        if (System.S_Lang == "ENG") {
            if (str_return != "") {
                data = str_return.split('!');
                for (var idx = 0; idx < data.length; idx++) {
                    idGrid2.AddRow();
                    idGrid2.SetGridText(idGrid2.rows - 1, G2_TCO_BSOBJ_ID, txtFormID.text);
                    idGrid2.SetGridText(idGrid2.rows - 1, G2_FIELD_NAME, data[idx])//feild
                    idGrid2.SetGridText(idGrid2.rows - 1, G2_ENGLISH, data[idx])//eng
                    idGrid2.SetGridText(idGrid2.rows - 1, G2_TYPE_DIC, txtType.text)//type
                }
            }
        }
    }

    //OnSave();
}

function OnSave() {
    idBtnSaveF.SetEnable(false);
    dataObjectDic.Call();
}
function OnSeach()
{
    dataObjectDic.Call("SELECT");
}

function SearchSupport() {
    txtSupport.text = idGrid2.GetGridData(idGrid2.row, G2_FIELD_NAME);
    dataObjectSupport.Call("SELECT");
}

function ReturnSupport() {
    idGrid2.SetGridText(idGrid2.row, G2_ENGLISH, idGridSupport.GetGridData(idGridSupport.row, 0));
    idGrid2.SetGridText(idGrid2.row, G2_VIETNAMESE, idGridSupport.GetGridData(idGridSupport.row, 1));
    idGrid2.SetGridText(idGrid2.row, G2_KOREAN, idGridSupport.GetGridData(idGridSupport.row, 2));
    idGrid2.SetGridText(idGrid2.row, G2_CHINESE, idGridSupport.GetGridData(idGridSupport.row, 3));
    idGrid2.SetGridText(idGrid2.row, G2_JAPANESE, idGridSupport.GetGridData(idGridSupport.row, 4));
    idGrid2.SetGridText(idGrid2.row, G2_FRENCH, idGridSupport.GetGridData(idGridSupport.row, 5));
}

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dataObjectDic":
            idBtnSaveF.SetEnable(true);
            if (insert_status == true) {
                OnAdd();
                insert_status = false;
            }
            break;
    }
}
</script>

<body>
   <gw:data id="dataObjectDic" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="ST_SY_SEL_DIC_AUTO" parameter="0,1,2,3,4,5,6,7,8,9,10" procedure="ST_SY_UPD_DIC_AUTO" > 
                <input bind="idGrid2" > 
                    <input bind="txtFormID" /> 
                    <input bind="txtType" /> 
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data> 
    <gw:data id="dataObjectSupport" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="ST_SY_SEL_DIC_SUPPORT"> 
                <input bind="idGridSupport" > 
                    <input bind="txtSupport" /> 
                </input> 
                <output bind="idGridSupport" /> 
            </dso> 
        </xml> 
    </gw:data> 
    <table border="0" width="100%" style="height:100%" >
        <tr style="height:5%; width:100%">
            <td colspan="8">
                <table width="100%" style="height:100%" id="tui">
					<tr>
					   <td>
							<table style=" width:100%; height:100%">
								<tr >
                                    <td style="width:50%">
									<td style="width:7%" align="right">
										 <b>Form ID</b>
									</td>
									 <td style="width:12%">
										 <gw:textbox id="txtFormID" styles="width:100%" csstype="mandatory"  readonly="true"/>
                                         <gw:textbox id="txtType" styles="width:100%;display:none;" csstype="mandatory"  readonly="true"/>
                                         <gw:textbox id="txtSupport" styles="width:100%;display:none;" csstype="mandatory"  readonly="true"/>
									</td>
									 <td width="3%">
										<gw:button img="search" alt="Search" id="idBtnSearchF" onclick="OnSeach()" />
									</td>
									<td width="3%">
										<gw:button img="save" alt="Save" id="idBtnSaveF" onclick="OnSave()" />
									</td> 
								</tr>
						</table>
					   </td>
						
					</tr>
                    
                </table>
            </td>
        </tr>
        <tr style="height:65%">
            <td colspan="8">
                <gw:grid id="idGrid2" header="_pk|_TCO_BSOBJ_ID|_FIELD NAME|ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH|REMARK|_TYPE_DIC"
                    format="0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0" defaults="|||||||||||" editcol="1|1|0|0|1|1|1|0|0|0|0"
                   styles="width:100%; height:100%" oncellclick="SearchSupport();"
                    sorting="T" autosize="T"  />
				
            </td>
        </tr>
        <tr>
            <td colspan="8">
                <gw:grid id="idGridSupport" header="ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH"
                    format="0|0|0|0|0|0" aligns="0|0|0|0|0|0" defaults="|||||" editcol="0|0|0|0|0|0"
                   styles="width:100%; height:100%"  oncelldblclick="ReturnSupport();"
                    sorting="T" autosize="T"  />
            </td>
        </tr>
    </table>     
</html>
<input id="test111" type="hidden" />