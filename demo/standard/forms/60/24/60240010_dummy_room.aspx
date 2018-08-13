<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var start_col = 4;
function BodyInit()
{
	OnSearch();
}

function OnDataReceive()
{

}

function OnSearch()
{
	dsoRoom.Call("SELECT");
}
function OnSelectDummyRoom(obj)
{
    var arrReturn = new Array();
	if(obj.row > 0){
		arrReturn[0] = grdRoom.GetGridData(obj.row,0);
		arrReturn[1] = grdRoom.GetGridData(obj.row,1);
		arrReturn[2] = grdRoom.GetGridData(obj.row,2);
	  window.returnValue = arrReturn;
	  window.close();
	}
	else{
		alert("Please select a dummy room.");	
	}
}
</script>

</head>
<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoRoom" onreceive="OnDataReceive(this)">
        <xml>
           <dso  type="grid"  function="st_ht_sel_60240010_dummy_room" >
                <input  bind="grdRoom">
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr>
            <td>
                <gw:grid id='grdRoom' header='_PK|RM|Type|Name'
                    format='0|0|0|0' 
					aligns='0|0|0|0'
					editcol='0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" 
					oncelldblclick='OnSelectDummyRoom(this);' />
            </td>
        </tr>
		
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
