<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
//use moonland\tinymce\TinyMCE;
use dosamigos\tinymce\TinyMce;
/* @var $this yii\web\View */
/* @var $model app\models\Notes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="notes-form">

    <?php
        $form = ActiveForm::begin([
            'options' => ['enctype'=>'multipart/form-data']
        ]);
    ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'text')->widget(TinyMCE::className(), [
        'options' => ['rows' => 35],
        'language' => 'ru',
        'clientOptions' => [
            'plugins' => [
                'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                'searchreplace wordcount visualblocks visualchars code fullscreen',
                'insertdatetime media nonbreaking save table contextmenu directionality',
                'emoticons template paste textcolor colorpicker textpattern imagetools codesample'
            ],
            'toolbar1' => 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image responsivefilemanager filemanager',
            'toolbar2' => 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code',
            'toolbar3' => 'print preview media | forecolor backcolor emoticons | codesample responsivefilemanager ',
            'content_css' => [
                //'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                '//www.tinymce.com/css/codepen.min.css'
            ],
            'external_filemanager_path' => '/frontend/web/plugins/responsivefilemanager/filemanager/',
            'filemanager_title' => 'Responsive Filemanager',
            'external_plugins' => [
                //Иконка/кнопка загрузки файла в диалоге вставки изображения.
                'filemanager' => '/frontend/web/plugins/responsivefilemanager/filemanager/plugin.min.js',
                //Иконка/кнопка загрузки файла в панеле иснструментов.
                'responsivefilemanager' => '/frontend/web/plugins/responsivefilemanager/tinymce/plugins/responsivefilemanager/plugin.min.js',
            ],
        ]
    ]) ?>
    <?//= $form->field($model, 'text')->textarea(['rows' => 6])
    ?>
    <?= \nemmo\attachments\components\AttachmentsInput::widget([
        'id' => 'file-input', // Optional
        'model' => $model,
        'options' => [ // Options of the Kartik's FileInput widget
            'multiple' => true, // If you want to allow multiple upload, default to false
        ],
        'pluginOptions' => [ // Plugin options of the Kartik's FileInput widget
            'maxFileCount' => 10 // Client max files
        ]
    ]) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('notes', 'Create') : Yii::t('notes', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
