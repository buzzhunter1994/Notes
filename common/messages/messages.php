<?php
return [
    'sourcePath' => __DIR__ . DIRECTORY_SEPARATOR . '..'. DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..',
    'languages' => ['ru','ru-RU', 'uk-UA'],
    'translator' => 'Yii::t',
    'sort' => false,
    'removeUnused' => false,
    'markUnused' => true,
    'only' => ['*.php'],
    'except' => [
        '.svn',
        '.git',
        '.gitignore',
        '.gitkeep',
        '.hgignore',
        '.hgkeep',
        '/messages',
		'/vendor'
    ],
    'format' => 'php',
    'messagePath' => __DIR__	,
    'overwrite' => true,
];