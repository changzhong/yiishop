<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\GoodsCategoryModel */

$this->title = '添加商品分类';
$this->params['breadcrumbs'][] = ['label' => '商品分类列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="goods-category-model-create">


    <?= $this->render('_form', [
        'model' => $model,
	    'top_category' => $top_category,
	    'categorys' => $categorys,
	    'group' => $group,
    ]) ?>

</div>
