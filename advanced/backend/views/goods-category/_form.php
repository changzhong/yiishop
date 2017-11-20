<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsCategoryModel */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="goods-category-model-form">

    <?php $form = ActiveForm::begin([
    		'options' => ['class' => 'form-horizontal'],
	        'fieldConfig' => [
	            'template' => "{label}\n<div class=\"col-xs-5\">{input}</div>\n<div class=\"col-xs-5\">{error}</div>",
		        'labelOptions' => ["class" => "col-xs-2 text-right control-label"],
	        ],
	    
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mobile_name')->textInput(['maxlength' => true]) ?>
	
	<?= $form->field($model, 'top_category',['inputOptions' => ['onchange' => 'getNext(this), getGroup(this)', 'class' => 'form-control']])->dropDownList(ArrayHelper::map($top_category,'id', 'name'), ['prompt' => '请选择']) ?>
	
	<?= $form->field($model, 'parent_id',['inputOptions' => ['onchange' => 'getGroup(this)', 'class' => 'form-control']])->dropDownList(ArrayHelper::map($categorys,'id', 'name'), ['prompt' => '请选择']) ?>
	
	<?= $form->field($model, 'group_id',['inputOptions' => [ 'class' => 'form-control']])->dropDownList(ArrayHelper::map($group,'id', 'name'), ['prompt' => '请选择']) ?>

    <?= $form->field($model, 'sort')->textInput() ?>

    <?= $form->field($model, 'is_show')->radioList($model::$_show) ?>


	<?= $form->field($model, 'image_url')->widget('common\widgets\file_upload\FileUpload',[
		'config'=>[
			//图片上传的一些配置，不写调用默认配置
		]
	]) ?>

    <?= $form->field($model, 'is_hot')->radioList($model::$_hot) ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加分类' : '更改分类', ['class' => $model->isNewRecord ? 'btn btn-success col-xs-offset-2' : 'btn btn-primary col-xs-offset-2']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<script>
	function getNext(th) {
	    var catHtml = '<option>请选择</option>';
	    var pid = $(th).val();
	    if(pid) {
	        $('#goodscategorymodel-parent_id').html(catHtml);
            $.ajax({
                'url': '<?php echo \yii\helpers\Url::to(['site/get-categorys'])?>',
				'data' : {'pid': pid},
	            'type' : 'post',
	            'dataType' : 'json',
	            success: function(res) {
                    if(res.status) {
                        res.data.forEach(function (item) {
                            catHtml += '<option value="'+item.id+'">'+item.name+'</option>';
                        });
                        $('#goodscategorymodel-parent_id').html(catHtml);
                    }
                }
            });
	        
	    }
	}

    function getGroup(th) {
        var catHtml = '<option>请选择</option>';
        var pid = $(th).val();
        $.ajax({
            'url': '<?php echo \yii\helpers\Url::to(['site/get-group'])?>',
            'data' : {'pid': pid},
            'type' : 'post',
            'dataType' : 'json',
            success: function(res) {
                if(res.status) {
                    res.data.forEach(function (item) {
                        catHtml += '<option value="'+item.id+'">'+item.name+'</option>';
                    });
                    $('#goodscategorymodel-group_id').html(catHtml);
                }
            }
        });

    }
</script>
