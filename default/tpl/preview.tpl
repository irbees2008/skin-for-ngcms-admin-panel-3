<!DOCTYPE html>
<html lang="{l_langcode}">
<head>
	<title>{l_preview}</title>
	<meta charset="{l_encoding}">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
	<link href="{tpl_url}/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="{scriptLibrary}/functions.js"></script>
	<script type="text/javascript" src="{scriptLibrary}/ajax.js"></script>
	{htmlvars}
</head>
<body>
	<fieldset style="border : 1px solid #333;"><legend> <span style="font-size: 10px; font-family: Verdana">{l_short}</span> </legend>
	{short}
	</fieldset>
	<fieldset style="border : 1px solid #333;"><legend> <span style="font-size: 10px; font-family: Verdana">{l_full}</span> </legend>
	{full}
	</fieldset>
</body>
</html>