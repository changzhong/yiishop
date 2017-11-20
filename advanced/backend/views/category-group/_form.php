<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CategoryGroupModel */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-group-model-form">

    <?php $form = ActiveForm::begin([
    		'options' => ['class' => 'form-horizontal'],
	        'fieldConfig' => [
	        		'template' => "{label}\n<div class='col-xs-5'>{input}</div>\n<div class='col-xs-5'>{error}</div> ",
		            "labelOptions" => ["class" => "col-xs-2 text-right"]
	        ]
    ]); ?>

    <?= $form->field($model, 'category_id')->dropDownList(\yii\helpers\ArrayHelper::map($categorys, 'id', 'name'), ['prompt' => '请选择']) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->radioList($model::$_status) ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '确定添加' : '提交保存', ['class' => $model->isNewRecord ? 'btn btn-success col-xs-offset-2' : 'btn btn-primary col-xs-offset-2']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
