<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\CategoryGroupModel */

$this->title = '添加分组';
$this->params['breadcrumbs'][] = ['label' => '分组列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-group-model-create">


    <?= $this->render('_form', [
        'model' => $model,
	    'categorys' => $categorys,
    ]) ?>

</div>
