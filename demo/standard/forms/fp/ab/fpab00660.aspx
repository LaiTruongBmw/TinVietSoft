<!-- #include file="../../../../system/lib/form.inc"  -->
<script language="javascript">
var hex=""
function onDouble(gg,rr,bb)
{
      hex=deciToHex(gg)+deciToHex(rr)+deciToHex(bb);
      window.returnValue = hex; 
      this.close(); 
}
function onSelect()
{
     window.returnValue = hex; 
      this.close();
}
function clicked(gg,rr,bb)
{
	hex = deciToHex(gg)+deciToHex(rr)+deciToHex(bb);
      //document.body.style.backgroundColor=hex;
     document.all("selectColor").style.backgroundColor = '#'+hex;
//	document.getElementById('tbprev').style.backgroundColor=hex;
}
function getHexNum(num)
{
	ar1=new Array('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15');
	ar2=new Array('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
	if(num>15)
		return num;
	else
	{
		red=ar2[num];
		return red;
	}
}

function deciToHex(arg)
{
	res2=999;
	args=arg;
	while(args>15)
	{
		arg1=parseInt(args/16);
		arg2=args%16;
		arg2=getHexNum(arg2);
		args=arg1;
		if(res2==999)
			res2=arg2.toString();
		else
			res2=arg2.toString()+res2.toString();
	}

	if(args<16 && res2 != 999)
	{
		def=getHexNum(args);
		res2=def+res2.toString();
	}
	else if(res2==999)
	{
		if(args<16)
			res2=getHexNum(args);
		else
			res2=1;
	}

	if(res2.length==1)
		res2="0"+res2;

	return res2;
}
</script>
<style>
.tab{border: 1px inset black; background-color: black;}
</style>
<table width=100% id='tbprev' style="height:100%">
<tr style="height:5%">
    <td style="width:20%"> Color</td>
    <td style="width:75%" id="selectColor" >
        
    </td>
    <td style="width:5%">
        <gw:button img="select" id="ibtnSearch"   alt="Select"  onclick="onSelect()"/>
    </td>
</tr>
<tr style="height:100%"><td colspan="3">
<form name=colchanger>
<table class=tab cellpadding=0 cellspacing=0 width=100% style="height:100%">
<script language=javascript>
	for(i=0;i<=256;i+=18)
	{
	if(i==252) i=255;
	document.write("<tr>");
	for(j=0;j<=256;j=j+51)
	{
		for(k=0;k<=256;k=k+51)
		{
		document.write("<td ondblclick='onDouble("+i+","+j+","+k+")' onclick='clicked("+i+","+j+","+k+")' \
		style=\"border: 1px inset black; width:10px; \
		height: 10px; font-size: 6px; background-color: rgb("+i+","+j+","+k+");\""+"> </td>");
		}
	}
	document.write("</tr>");
	}
</script>
</table>
</form>
</td></tr>
</table>



