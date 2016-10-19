<?php

use yii\helpers\Html;
//use yii\grid\GridView;
use yii\widgets\Pjax;

use yii\widgets\ListView;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Notes');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notes-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Notes'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php
    //Pjax::begin();
    echo ListView::widget(['dataProvider' => $dataProvider, 'itemView' => '_list' ]);
    //Pjax::end();
    ?>
</div>
