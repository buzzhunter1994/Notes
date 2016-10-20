<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Notes */

$this->title = Yii::t('notes', 'Update'). ' - ' . Html::encode($model->title);
$this->params['breadcrumbs'][] = ['label' => Yii::t('notes', 'Notes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
?>
<div class="notes-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
