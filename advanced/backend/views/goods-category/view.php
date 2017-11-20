<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsCategoryModel */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Goods Category Models', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-category-model-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
	        'id',
	        [
		        'attribute'=>'image_url',
		        'label'=>'图片',
		        'format' => 'raw',
		        'filter'=>false,
		        'value'=>function($model){
			        return Html::img(
				        $model->image_url,
				        [
					        'width' => 50,
					        'onclick' => 'showBigImg(this)'
				        ]
			        );
		        }],
	
	        'name',
	        'mobile_name',
	        // 'parent_id',
	        // 'parent_id_path',
	        // 'level',
	
	        ['attribute'=>'sort','label'=>'排序','filter'=>false,'value'=>function($model){return $model->sort;}],
	        ['attribute'=>'is_show','filter'=>$show,'value'=>function($model){return $model::$_show[$model->is_show];}],
	        // 'image',
	        ['attribute'=>'is_hot','filter'=>$hot,'label'=>'是否热门','value'=>function($model){return $model::$_hot[$model->is_hot];}],
	
	        ['class' => 'yii\grid\ActionColumn'],
        ],
    ]) ?>

</div>
