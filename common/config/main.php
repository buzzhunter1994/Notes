<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
	'modules' => [
		'attachments' => [
			'class' => nemmo\attachments\Module::className(),
			'tempPath' => '@app/uploads/temp',
			'storePath' => '@app/uploads/store',
			'rules' => [ // Rules according to the FileValidator
				'maxFiles' => 10, // Allow to upload maximum 3 files, default to 3
				'maxSize' => 1024 * 1024 * 20// 1 MB
			],
			'tableName' => '{{%yii_attachments}}' // Optional, default to 'attach_file'
		]
	]
];
