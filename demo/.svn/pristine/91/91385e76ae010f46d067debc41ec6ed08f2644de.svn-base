<!-- #include file="../../../system/lib/form.inc"  -->
<script>window.dhx_globalImgPath = "../../../system/controls/dhtmlxCombo/codebase/imgs/";</script>
<link rel="STYLESHEET" type="text/css" href="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcombo.css">
<script  src="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcommon.js"></script>
<script  src="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcombo.js"></script>
 
<h3>From select box</h3>
            <select style='width:200px;'  id="combo_zone1" name="alfa1">
                <option value="1">a00</option>
                <option value="2">a01</option>
                <option value="3">a02</option>
                <option value="4">a10</option>
                <option value="5">a11</option>
                <option value="6">a12</option>
                <option value="7">b00</option>
                <option value="8">b01</option>
                <option value="9">b02</option>
                <option value="10">b10</option>
                <option value="11">b11</option>
                <option value="12">b12</option>
                <option value="13">a22</option>
                <option value="14">a31</option>
                <option value="15">a04</option>
            </select>
<br>
 <gw:list id="lstDept" styles="width:99%" onchange="" />
 
<script>
function BodyInit()
{
    var z = dhtmlXComboFromSelect("combo_zone1");
z.enableFilteringMode(true);
z.addOption([[1, 1111], [2, 2222], [3, 3333], [4, 4444], [5, 5555]]);
var data;
 
//z = dhtmlXComboFromSelect("lstDept");
//z.enableFilteringMode(true);
data = "DATA|915|B?p Hai Bà Trung|910|Nhân S?|911|K? Toán|912|Kho|913|Bánh Kem|914|Sanwitch|933|C?a Hàng Cao Th?ng|934|C?a Hàng Hai Bà Trung|892|TEAM A|890|DIVISION A|891|DEPT A|882|GENERAL DIRECTOR|888|Bánh Mì|930|Bánh Mì|883|Office|884|Central Kitchen|885|B?p Cao Th?ng|886|Hành Chánh|887|Bánh Mì|931|Nhân|932|Sanwich"; 
 lstDept.SetDataText(data + "||Select All");
 lstDept.value = "";
//z.addOption([[1, 1111], [2, 2222], [3, 3333], [4, 4444], [5, 5555]]);  
}
/*
var z = new dhtmlXCombo("combo_zone2", "alfa2", 200);
z.enableFilteringMode(true);
z.loadXML("../common/data.xml");
var z = new dhtmlXCombo("combo_zone3", "alfa3", 200);
z.addOption([[1, 1111], [2, 2222], [3, 3333], [4, 4444], [5, 5555]]);
z.enableFilteringMode(true);
var z = new dhtmlXCombo("combo_zone4", "alfa4", 200);
z.enableFilteringMode(true, "php/complete.php", true);
var z = new dhtmlXCombo("combo_zone5", "alfa5", 200);
z.enableFilteringMode(true, "php/complete.php", true, true);
*/
</script>