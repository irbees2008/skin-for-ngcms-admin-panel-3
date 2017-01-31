<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang.templates['title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="row">
		<div class="col col-sm-5 col-md-4">
			<ul class="nav nav-tabs nav-justified">
				<li class="dropdown active">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						{{ lang.templates['tplsite'] }} <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						{% for st in siteTemplates %}
							<li><a href="#" data-toggle="tab" class="tpl-select" data-select="{{ st.name }}">{{ st.name }} ({{ st.title }})</a></li>
						{% endfor %}
					</ul>
				</li>
				<li><a href="#" data-toggle="tab" onclick="submitTemplateSelector();">{{ lang.templates['tplmodules'] }}</a></li>
			</ul>
			
		</div>
		<div class="col col-sm-7 col-md-8"></div>
	</div>
	<div class="row">
		<div class="col col-sm-5 col-md-4">
			<div id="fileTreeSelector">TEST CONTENT</div>
		</div>
		<div class="col col-sm-7 col-md-8" style="height: 100%;">
			<div class="fileEditorInfo">
				{{ lang.templates['tpl.edit'] }} [ <b><span id="templateNameArea">default</span> </b>]
				<div id="fileEditorInfo" style=" ">&nbsp;</div>
			</div>
			<div id="fileEditorContainer" class="Code-to-Mirror ">
				<textarea id="fileEditorSelector" class="form-control">*** EDITOR ***</textarea>
				<div id="imageViewContainer"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col col-sm-5 col-md-4">
			<div class="form-group">
				
			</div></div>
		<div class="col col-sm-7 col-md-8">
			<div class="form-group">
				<input type="button" value="{{ lang['save'] }}" onclick="submitTemplateEdit();" title="Ctrl+S" class="btn btn-success">
			</div>
		</div>
	</div>
	<div class="alert alert-info">
		<h4>Hotkeys for codemirror, if it is in focus</h4>
		<div class="row">
			<div class="col col-xs-3"><kbd>Ctrl+S</kbd> - save template</div>
			<div class="col col-xs-3"><kbd>F11</kbd> - view fullscreen</div>
			<div class="col col-xs-3"></div>
			<div class="col col-xs-3"></div>
		</div>
	</div>
	<!--div class="alert alert-info">
		<h4>Twig &#123;&#123; variables &#125;&#125; for this template, if it is standard</h4>
		<div class="row">
			<div class="col col-xs-6"><code>&#123;&#123; lang['langcode'] &#125;&#125;</code> - language code</div>
			<div class="col col-xs-6"><code>&#123;&#123; lang['langcode'] &#125;&#125;</code> - language code</div>
		</div>
	</div-->
</div>

<link href="{{ skins_url }}/assets/codemirror-5.23.0/codemirror.css" rel="stylesheet">
<script src="{{ skins_url }}/assets/codemirror-5.23.0/codemirror.js"></script>
<script src="{{ skins_url }}/assets/js/emmet.js"></script>

<script src="{{ home }}/lib/ngFileTree.js"></script>
<link href="{{ home }}/lib/ngFileTree.css" rel="stylesheet" />

<script>
var ngTemplateName = 'default';
var ngFileName = '';
var ngFileType = '';
var ngFileContent = '';
var ngFileTreeParams = { root: '/', script: '../engine/rpc.php', securityToken : '{{ token }}', templateName : ngTemplateName };

var ngFileTreeFunc = function(file) {
        ngFileName = file;
        ngShowLoading();
		$.post('../engine/rpc.php', { json : 1, methodName : 'admin.templates.getFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : file, token : '{{ token }}' }) }, function(data) {
			ngHideLoading();
			// Try to decode incoming data
			try {
				resTX = eval('('+data+')');
			} catch (err) {
				$.notify({message: 'Error parsing JSON output (mod=templates). Result: '+resTX.response},{type: 'danger'});
			}
			if (!resTX['status']) {
				$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
			}

			ngFileContent = '';
			ngFileType = resTX['type'];

			$('#fileEditorInfo').html(((ngFileType == 'image')?'Image':'File')+' name: <b>'+ngFileName+'</b> ('+formatSize(resTX['size'])+' )<br/>Last change time: '+resTX['lastChange']);
			
			// Remove previous codemirror (if installed)
			$(".CodeMirror").remove();
			
			if (resTX['type'] == 'image') {
				document.getElementById('imageViewContainer').style.display = 'block';
				document.getElementById('fileEditorSelector').style.display = 'none';
				$('#imageViewContainer').html(resTX['content']);
			} else {
				document.getElementById('imageViewContainer').style.display = 'none';
				document.getElementById('fileEditorSelector').style.display = 'block';
				$('#fileEditorSelector').val(resTX['content']);

				// Install codemirror
				var tmode;
				if (ngFileName.indexOf(".ini") > 0) {tmode = "text/x-ini"};
				if (ngFileName.indexOf(".tpl") > 0) {tmode = "text/html"};
				if (ngFileName.indexOf(".css") > 0) {tmode = "text/x-gss"};
				if (ngFileName.indexOf(".js") > 0) {tmode = "javascript"};
				var edField = $('#fileEditorSelector');
				var eW = edField.width();
				var eH = edField.height();
				var cm = CodeMirror.fromTextArea(
					document.getElementById('fileEditorSelector'), {
						lineNumbers: true,
						mode: tmode,
						lineWrapping: true,
						styleActiveLine: true,
						tabMode: "indent",
						//theme: 'panda-syntax',
						extraKeys: {
							"F11": function(cm) {cm.setOption("fullScreen", !cm.getOption("fullScreen"));},
							"Esc": function(cm) {if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);}
						}
				});
				cm.setSize(eW, eH);
				cm.on("change", function(cm) {
					$("#fileEditorSelector").val(cm.getValue());
				});
				ngFileContent = resTX['content'];
				emmetCodeMirror(cm);
			}
		}, "text").error(function() { ngHideLoading(); $.notify({message: 'HTTP error during request'},{type: 'danger'}); });
		
		$('html, body').animate({scrollTop: $('.fileEditorInfo').offset().top - 50}, '888');
}

function submitTemplateSelector(selTpl) {
	
	// Remove previous codemirror (if installed)
	$('.CodeMirror').remove();
	$('#fileEditorInfo').html('');
	$('#imageViewContainer').html('');
	$('#fileEditorSelector').val('');

	ngFileName = '';

	if (selTpl) {
		ngTemplateName = selTpl;
		ngFileTreeParams['templateName'] = ngTemplateName;

		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(ngTemplateName);
	} else {
		ngTemplateName = '#plugins';
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' PLUGIN TEMPLATES ');
	}
}

function submitTemplateEdit() {
	var editedContent = $('#fileEditorSelector').val();

	ngShowLoading();
	$.post('../engine/rpc.php', { json : 1, methodName : 'admin.templates.updateFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : ngFileName, token : '{{ token }}', 'content' : editedContent }) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) {
			$.notify({message: 'Error parsing JSON output. Result: '+linkTX.response},{type: 'danger'});
		}
		if (!resTX['status']) {
			$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
		} else {
			$.notify({message: resTX['content']},{type: 'info'});
		}
	}, "text").error(function() { ngHideLoading(); $.notify({message: 'HTTP error during request'},{type: 'danger'}); });
}

$(document).ready( function() {
    $('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
	
	$('.tpl-select').click(function(){
		// Remove previous codemirror (if installed)
		$('.CodeMirror').remove();
		submitTemplateSelector($(this).attr('data-select'));
	});
});

document.onkeydown = function(e) {
  e = e || event;

  if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
    submitTemplateEdit();
    return false;
  }
}
</script>