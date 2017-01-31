<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang['extras'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Filter form: BEGIN -->
	<div class="well">
		<div class="has-feedback">
			<input type="text" id="searchInput" class="search form-control" onkeyup="searchInTable();" placeholder="{{ lang['extras.search'] }}">
			<i class="fa fa-search form-control-feedback"></i>
		</div>
	</div>
	<ul class="nav nav-tabs nav-justified">
		<li data-filter="all" class="active"><a href="#">{{ lang['list.all'] }} <span class="badge">{{ cntAll }}</span></a></li>
		<li data-filter="pluginEntryActive"><a href="#">{{ lang['list.active'] }} <span class="badge">{{ cntActive }}</span></a></li>
		<li data-filter="pluginEntryInactive"><a href="#">{{ lang['list.inactive'] }} <span class="badge">{{ cntInactive }}</span></a></li>
		<li data-filter="pluginEntryUninstalled"><a href="#">{{ lang['list.needinstall'] }} <span class="badge">{{ cntUninstalled }}</span></a></li>
	</ul>
	<!-- Filter form: END -->
	
	<!-- List of plugins: BEGIN -->
	<div class="table-responsive">
		<table id="maincontent" class="table table-hover table-condensed table-extras">
			<thead>
				<tr>
				<th>{{ lang['id'] }}</th>
				<th>{{ lang['title'] }}</th>
				<th class="hidden-xs">{{ lang['type'] }}</th>
				<th class="hidden-xs">{{ lang['version'] }}</th>
				<th class="hidden-xs">{{ lang['description'] }}</th>
				<th class="hidden-xs">{{ lang['author'] }}</th>
				<th>{{ lang['action'] }}</th>
				</tr>
			</thead>
			<tbody id="entryList">
				{% for entry in entries %}
				<tr class="all {{ entry.style }}" id="plugin_{{ entry.id }}">
					<td>{{ entry.id }} {{ entry.new }}</td>
					<td>{{ entry.url }}</td>
					<td class="hidden-xs">{{ entry.type }}</td>
					<td nowrap class="hidden-xs">{{ entry.history }} {{ entry.version }}</td>
					<td class="hidden-xs">{{ entry.readme }} {{ entry.description }}</td>
					<td class="hidden-xs">{{ entry.author_url }}</td>
					<td nowrap="nowrap">{{ entry.link }} {{ entry.install }}</td>
				</tr>
				{% endfor %}
			</tbody>
		</table>
	</div>
	<!-- List of plugins: End -->
</div>

<script>
function tabsSwitch(tabs) {
	var newSelection;
	
	$(".nav-tabs li").removeClass("active");
	tabs.addClass("active");
	newSelection = tabs.attr("data-filter");
	$(".all").not("."+newSelection).hide();
	$("."+newSelection).show();
	
}

$(document).ready(function() {
	$(".nav-tabs").on('click', 'li:not(.active):not(.pull-right)', function(){
		$("#searchInput").val('');
		tabsSwitch($(this));
		return false;
	});
});
</script>
