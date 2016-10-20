<?php

use yii\helpers\Html;
//use yii\grid\GridView;
use yii\widgets\Pjax;

use yii\widgets\ListView;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Заметки');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notes-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php
    echo ListView::widget([
        'dataProvider' => $dataProvider,
        'layout' => "{summary}<br/>{items}\n{pager}",
        'itemView' => '_list',
        'id' => 'accordion',
        'options' => [
            'class' => 'panel-group',
            'role' => 'tablist',
            'aria-multiselectable' => 'true'
        ],
        'itemOptions' => [
            'class'=> 'panel panel-success'
        ]
    ]);
    ?>
</div>
