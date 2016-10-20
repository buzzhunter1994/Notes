<?php
use yii\helpers\Html;
//use yii\helpers\HtmlPurifier;
use giovdk21\yii2SyntaxHighlighter\SyntaxHighlighter as SyntaxHighlighter;
?>

<div class="panel-heading">
	<a href="#post-<?= $model->id ?>" data-toggle="collapse" aria-expanded="false" aria-controls="post-<?= $model->id ?>"  data-parent="#accordion" ><?= Html::encode($model->title) ?> <span class="pull-right"><?=Yii::$app->formatter->asDatetime($model->date)?></span></a>
</div>
<div id="post-<?= $model->id ?>" class="collapse panel-body">
	<?php
	if ($model->text){
		SyntaxHighlighter::begin(['brushes' => ['php']]);
		echo SyntaxHighlighter::getBlock($model->text, 'php');
		SyntaxHighlighter::end();
	}
	if ($model->files) {
		foreach ($model->files as $file) {
			switch ($file->type) {
				default:
					echo Html::a(Html::img("icons/32px/$file->type.png") . "<span>$file->name.$file->type</span>", $file->getUrl(), ['class'=>'attachment']);
					break;
			}
		}
	}
	?>
</div>