<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Notes */

$this->title = Yii::t('notes', 'Create note');
$this->params['breadcrumbs'][] = ['label' => Yii::t('notes', 'Notes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
