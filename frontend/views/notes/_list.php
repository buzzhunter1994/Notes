<?php
use yii\helpers\Html;
//use yii\helpers\HtmlPurifier;
//use giovdk21\yii2SyntaxHighlighter\SyntaxHighlighter as SyntaxHighlighter;
/*
 * <?php
		SyntaxHighlighter::begin(['brushes' => ['php']]);
		echo SyntaxHighlighter::getBlock($model->text, 'php');
		SyntaxHighlighter::end();
	?>*/
?>

<div class="news-item">
    <h3><?= Html::encode($model->title) ?></h3>


	<textarea><?= $model->text ?></textarea>
</div>