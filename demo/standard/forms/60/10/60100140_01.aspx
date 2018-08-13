<!-- #include file="../../../../system/lib/form.inc"  -->
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Finger Index Checking</title>



  <style type="text/css">
  
  html, body {
                 
                margin: 0;
                padding: 0;
                
            }
 
 #poup{
	position: relative;
	background-image: url("assets/hinh/nen4.jpg");
    background-repeat: no-repeat;
	height: 620px; 
	
}
 


 #poup #title{
 position: absolute;
	font-size: 200%;
	 text-align: center;
	  color: red;
	 
	top: 5px;
	margin-left: 10%;
}

#poup #imn1 {
	position: absolute;
	left: 350 px;
	top: 135 px;
}

#poup   #imn2 {
	position: absolute;
	left: 280px;
	top: 60px;
	
}
#poup   #imn3 {
	position: absolute;
	left: 180px;
	top: 30px;
	
}

#poup  #imn4 {
	position: absolute;
	left: 70px;
	top: 65px;	
}

#poup   #imn5 {
	 position: absolute;
	left: 5px;
	top: 215px;
	
}


#poup  #imn6 {
	position: absolute;
	left: 0px;
	top: 130px;
	
}

#poup #imn7 {
	 position: absolute; 
	left: 280px;
	top: 60px;
	
	
}

#poup  #imn8 {
	  position: absolute; 
	left: 180px;
	top: 30px;
	
}

#poup   #imn9 {
	  position: absolute;
	
	left:70px;
	top: 55px;
}

#poup   #imn10 {
	 position: absolute;
	left: 340px;
	top: 215px;
	
}

#poup #bun10{
	 
	width:100px;
	margin-left: 40%;
}
 
div p {
	color: #ff0000;
}
</style>
</head>
<body >
 

  <div id="poup" style="width: :100%;">
  
  		<div id = "title" style="float: left;">Please scan index finger</div>
	
			<%if Request("idx")="1" or Request("idx")="2" or Request("idx")="3" or Request("idx")="4" or Request("idx")="5" then %>
			<img alt="" src=""  id="imn1"> 
		
			<img alt="" src="" id ="imn2">
	
			<img alt="" src="" id ="imn3">
	
			<img alt="" src="" id ="imn4">
		
			<img alt="" src="" id ="imn5">
		<%else%>
			<img alt="" src="" id ="imn6">
		
			<img alt="" src="" id ="imn7">
		
			<img alt="" src="" id ="imn8">
		
			<img alt="" src="" id ="imn9">
		
			<img alt="" src="" id ="imn10">
			<% end if%>
				<%if Request("idx")="1" or Request("idx")="2" or Request("idx")="3" or Request("idx")="4" or Request("idx")="5" then %>
				<img alt="" src="assets/finger_picture_val_04.gif" id ="imn11"  style="width:380px;">
				<%else%>
				<img alt="" src="assets/finger_picture_val_03.gif" id ="imn12"  style="width:380px;">
				<% end if%>
			
		<button onclick="OK()" id ="bun10"> OK</button>
		

	</div>
	
<script type="text/javascript">
var  image1 =  "<%=Request("idx") %>" ;
//var oMyObject = window.dialogArguments;
//var image1 = oMyObject.image1;
for(var i =1 ;i<11;i++){
	var obj = document.getElementById("imn"+i);
	if(obj != undefined)
		obj.src="assets/finger_picture_05.gif";
}

changeimg(image1);

function changeimg(index){
document.getElementById("imn"+index).src= "assets/finger_picture_03.gif";
}

var vReturnValue = new Object();
vReturnValue.yesNo =0;
window.returnValue = vReturnValue;
function OK()
{
   
	vReturnValue.yesNo =1;
	window.returnValue = vReturnValue;
    window.close();
	
	
} 
</script>
 
</body>
</html>