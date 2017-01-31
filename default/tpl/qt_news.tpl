<span id="save_area" style="display: block;"></span>
<div id="tags" class="btn-group btn-group-justified bbcodes" data-toggle="buttons">
	
	<a href="#" class="btn btn-default" onclick="insertext('[p]','[/p]', {area})" title='{l_tags.paragraph}'><i class="fa fa-paragraph"></i></a>
	
	<span class="btn btn-default btn-divider"></span>

	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-font"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[b]','[/b]', {area})"><i class="fa fa-bold"></i> {l_tags.bold}</a></li>
			<li><a href="#" onclick="insertext('[u]','[/u]', {area})"><i class="fa fa-underline"></i> {l_tags.underline}</a></li>
			<li><a href="#" onclick="insertext('[i]','[/i]', {area})"><i class="fa fa-italic"></i> {l_tags.italic}</a></li>
			<li><a href="#" onclick="insertext('[s]','[/s]', {area})"><i class="fa fa-strikethrough"></i>{l_tags.crossline}</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-left"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[left]','[/left]', {area})"><i class="fa fa-align-left"></i> {l_tags.left}</a></li>
			<li><a href="#" onclick="insertext('[center]','[/center]', {area})"><i class="fa fa-align-center"></i> {l_tags.center}</a></li>
			<li><a href="#" onclick="insertext('[right]','[/right]', {area})"><i class="fa fa-align-right"></i> {l_tags.right}</a></li>
			<li><a href="#" onclick="insertext('[justify]','[/justify]', {area})"><i class="fa fa-align-justify"></i> {l_tags.justify}</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-quote-left"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[ul]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ul]','', {area})"><i class="fa fa-list-ul"></i> {l_tags.bulllist}</a></li>
			<li><a href="#" onclick="insertext('[ol]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ol]','', {area})"><i class="fa fa-list-ol"></i> {l_tags.numlist}</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="#" onclick="insertext('[quote]','[/quote]', {area})"><i class="fa fa-quote-left"></i> {l_tags.comment}</a></li>
			<li><a href="#" onclick="insertext('[code]','[/code]', {area})"><i class="fa fa-code"></i> {l_tags.code}</a></li>
			<li><a href="#" onclick="insertext('[hide]','[/hide]', {area})"><i class="fa fa-shield"></i> {l_tags.hide}</a></li>
			<li><a href="#" onclick="insertext('[spoiler]','[/spoiler]', {area})"><i class="fa fa-list-alt"></i> {l_tags.spoiler}</a></li>
		</ul>
	</div>
	
	<span class="btn btn-default btn-divider"></span>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-link"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" data-toggle="modal" data-target="#modal-email"><i class="fa fa-envelope-o"></i> {l_tags.email}</a></li>
			<li><a href="#" data-toggle="modal" data-target="#modal-url"><i class="fa fa-link"></i> {l_tags.link}</a></li>
			<li><a href="#" data-toggle="modal" data-target="#modal-img-url"><i class="fa fa-picture-o"></i> {l_tags.imagelink}</a></li>
		</ul>
	</div>
	
	<a href="#" class="btn btn-default" onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('admin.php?mod=images&amp;ifield='+{area}, '_Addimage', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addimage" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></a>
	<a href="#" class="btn btn-default" onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('admin.php?mod=files&amp;ifield='+{area}, '_Addfile', 'height=600,resizable=yes,scrollbars=yes,width=800');return false;" target="DATA_Addfile" title='{l_tags.file}'><i class="fa fa-file-text-o"></i></a>
	
	<span class="btn btn-default btn-divider"></span>
	
	<a href="#" class="btn btn-default" onclick="insertext('<!--nextpage-->','', {area})" title="{l_tags.nextpage}"><i class="fa fa-files-o"></i></a>
	<a href="#" class="btn btn-default" onclick="insertext('<!--more-->','', {area})" title="{l_tags.more}"><i class="fa fa-ellipsis-h"></i></a>
	<span class="btn btn-default btn-divider"></span><a href="#" class="btn btn-default" data-toggle="modal" data-target="#modal-smiles"><i class="fa fa-smile-o"></i></a>
	
</div>

<!-- EMAIL -->
<div id="modal-email" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4>{l_tags.email}</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">Электронная почта</label>
					<div class="col-sm-9">
						<input type="email" id="modal-email-1" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Текст ссылки</label>
					<div class="col-sm-9">
						<input type="text" id="modal-email-2" class="form-control" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="cancel" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="insertext('[email=' + $('#modal-email-1').val() + ']' + $('#modal-email-2').val() + '','[/email]', {area})">{l_ok}</button>
			</div>

		</div>
	</div>
</div>

<!-- URL LINK -->
<div id="modal-url" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4>{l_tags.link}</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">Адрес ссылки</label>
					<div class="col-sm-9">
						<input type="url" id="modal-url-1" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Текст ссылки</label>
					<div class="col-sm-9">
						<input type="text" id="modal-url-2" class="form-control" />
					</div>
				</div>
				<!--div class="form-group">
					<label class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<label><input type="checkbox"> Open link in new window</label>
					</div>
				</div-->
			</div>
			<div class="modal-footer">
				<button type="cancel" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="insertext('[url=' + $('#modal-url-1').val() + ']' + $('#modal-url-2').val() + '','[/url]', {area})">{l_ok}</button>
			</div>

		</div>
	</div>
</div>

<!-- IMG LINK -->
<div id="modal-img-url" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4>{l_tags.imagelink}</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">Ссылка на изображение</label>
					<div class="col-sm-9">
						<input type="url" id="modal-img-url-1" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">Альтернативный текст</label>
					<div class="col-sm-9">
						<input type="text" id="modal-img-url-2" class="form-control" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="cancel" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="insertext('[img=' + $('#modal-img-url-1').val() + ']' + $('#modal-img-url-2').val() + '','[/img]', {area})">{l_ok}</button>
			</div>

		</div>
	</div>
</div>