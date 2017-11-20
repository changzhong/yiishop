<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\BrandSearchModel */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '品牌列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="brand-model-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加品牌', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'logo',
            'desc:ntext',
            'url:url',
            // 'sort',
            // 'cat_name',
            // 'parent_cat_id',
            // 'cat_id',
            // 'is_hot',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
