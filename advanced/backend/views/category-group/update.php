<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\CategoryGroupModel */

$this->title = '编辑分组: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => '分组列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="category-group-model-update">


    <?= $this->render('_form', [
        'model' => $model,
	    'categorys' => $categorys,
    ]) ?>

</div>
