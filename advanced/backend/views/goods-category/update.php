<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\GoodsCategoryModel */

$this->title = '更改分类: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => '分类列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="goods-category-model-update">


    <?= $this->render('_form', [
        'model' => $model,
	    'top_category' => $top_category,
	    'categorys' => $categorys,
	    'group' => $group,
    ]) ?>

</div>
