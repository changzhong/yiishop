<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\BrandModel */

$this->title = '添加品牌';
$this->params['breadcrumbs'][] = ['label' => '品牌列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="brand-model-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
