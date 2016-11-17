<?php
use yii\helpers\Html;
//use yii\helpers\HtmlPurifier;
use giovdk21\yii2SyntaxHighlighter\SyntaxHighlighter as SyntaxHighlighter;
?>

<div class="panel-heading clearfix">
	<a href="#post-<?= $model->id ?>" data-toggle="collapse" aria-expanded="false" aria-controls="post-<?= $model->id ?>" class="pull-left" data-parent="#accordion" >
	<?= Html::encode($model->title) ?> :: <?=Yii::$app->formatter->asDatetime($model->date)?>
	</a>
	<span class="pull-right">
		<a href="/notes/update?id=<?= $model->id ?>" class="btn btn-primary">Изменить</a>
	</span>
</div>
<div id="post-<?= $model->id ?>" class="collapse panel-body">
	<?php
    if ($model->text){
        echo $model->text;
    }
	/*
    if ($model->text){
		SyntaxHighlighter::begin(['brushes' => ['php']]);
		echo SyntaxHighlighter::getBlock($model->text, 'php');
		SyntaxHighlighter::end();
	}*/
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