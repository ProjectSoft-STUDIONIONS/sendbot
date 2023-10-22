<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
	'title' => array(
		'caption' => 'Title',
		'type' => 'text'
	),
	'image' => array(
		'caption' => 'Image',
		'type' => 'image'
	),
	'thumb' => array(
		'caption' => 'Thumbnail',
		'type' => 'thumb',
		'thumbof' => 'image'
	)
);
$settings['templates'] = array(
	'outerTpl' => '<div class="row">
	<div class="clearfix photogallery">[+wrapper+]
	</div>
</div>',
	'rowTpl' => '
	<div class="photogallery-item">
		<div class="column photogallery-item-image">
			<a href="[(site_url)][+image+]" data-fancybox-group="photogallery" data-fancybox="ptogallery" data-caption="[+title:ifempty=`[*pagetitle:hsc*]`+]" data-loop="true" title="[+title:ifempty=`[*pagetitle:hsc*]`+]">
				<img src="[[thumb? &input=`[+image+]` &options=`w=375,h=240,zc=C`]]" alt="[+title:ifempty=`[*pagetitle:hsc*]`+]">
			</a>
		</div>
	</div>'
);
$settings['configuration'] = array(
	'enablePaste' => true,
	'csvseparator' => ';'
);