<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\GoodsCategorySearchModel */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '商品分类列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-category-model-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加分类', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            // ['class' => 'yii\grid\SerialColumn'],

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

	        ['class' => 'yii\grid\ActionColumn','header'=>'操作','template' => '{update} {delete}',
//		        'buttons' => [
//			        'add' => function ($url, $model, $key) {
//				        return  Html::a('<span class="glyphicon glyphicon-plus  btn btn-warning btn-sm"></span>', $url, ['title' => '添加'] ) ;
//			        },
//		        ],
		        'headerOptions' => ['width' => '80']
	        ],
        ],
    ]); ?>
</div>

<script>
	function showBigImg(th) {
	    var img_src = $(th).attr('src');
        layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            area: '80%',
            skin: 'layui-layer-nobg', //没有背景色
            shadeClose: true,
            content: '<img src="'+img_src+'" onclick="layer.closeAll()" class="img-responsive center-block text-center" >',
        });
	}
</script>
