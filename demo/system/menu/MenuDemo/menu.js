function bindMenu(obj){
	obj.innerHTML =
		'<ul class="menu" id="menu" onmouseover="SetSizeMenu(size)">' +
			'<li>' +
				'<a href="#" class="menulink" name="folder" onclick="On_Active(this)" id="fd1">Hotel Management</a>' +
			'</li>'+
			'<li>'+
				'<a href="#" class="menulink" name="folder" onclick="On_Active(this)" id="fd2">Dropdown Two</a>' +
			'</li>'+
			'<li>'+
				'<a href="#" class="menulink" name="folder" onclick="On_Active(this)" id="fd3">Dropdown Three</a>' +
			'</li>'+
			'<li>'+
				'<a href="#" class="menulink" name="folder" onclick="On_Active(this)" id="fd4">Dropdown Four</a>' +
			'</li>'+
		'</ul>';
}