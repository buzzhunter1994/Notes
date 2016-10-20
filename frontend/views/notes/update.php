<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Notes */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Notes',
]) . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('notes', 'Notes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="notes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
