<?php

namespace backend\controllers;

use common\models\CategoryGroupModel;
use Yii;
use common\models\GoodsCategoryModel;
use backend\models\GoodsCategorySearchModel;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * GoodsCategoryController implements the CRUD actions for GoodsCategoryModel model.
 */
class GoodsCategoryController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }
	
	public function actions()
	{
		return [
			'upload'=>[
				'class' => 'common\widgets\file_upload\UploadAction',     //这里扩展地址别写错
				'config' => [
					'imagePathFormat' => "/image/category/{yyyy}{mm}{dd}/{time}{rand:6}",
				]
			]
		];
	}
    

    /**
     * Lists all GoodsCategoryModel models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new GoodsCategorySearchModel();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $model = new GoodsCategoryModel();
        $show = $model::$_show;
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'show' => $show,
            'hot' => $model::$_hot,
        ]);
    }

    /**
     * Displays a single GoodsCategoryModel model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
	        'hot' => GoodsCategoryModel::$_hot,
	        'show' => GoodsCategoryModel::$_show
        ]);
    }

    /**
     * Creates a new GoodsCategoryModel model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new GoodsCategoryModel();

        if ($model->load(Yii::$app->request->post())) {
	        $categoryId = Yii::$app->request->post('GoodsCategoryModel')['top_category'];
	        //如果存在顶级分类，并且没有上级分类,把顶级分类设置为上级分类
	        if($categoryId > 0 && $model->parent_id <= 0) {
		        $model->parent_id = $categoryId;
	        }
	        
	        //如果不是顶级分类,查找上级分类
	        if($model->parent_id > 0) {
		        $parent = GoodsCategoryModel::findOne($model->parent_id);
		        $model->parent_id_path = $parent->parent_id_path ? $parent->parent_id_path.'_'.$parent->id : $parent->id;
		        $model->level = $parent->level + 1;
	        } else {
	        	$model->parent_id = 0;
	        }
	       
	        
	        if($model->save()){
		       
		        return $this->redirect(['index']);
	        }
        } else {
        	$model->is_show = $model::SHOW_Y;
        	$model->is_hot = $model::HOT_N;
            $model->sort = 10;
            $model->level = 1;
            $model->parent_id = 0;
        	$top_category = $model->getSons(0, 'id,name');
        	$categorys = [];
        	
        	$group = CategoryGroupModel::find()
		        ->where(['category_id' => null])
		        ->all();
            return $this->render('create', [
                'model' => $model,
	            'top_category' => $top_category,
	            'categorys' => $categorys,
	            'group' => $group,
            ]);
        }
    }

    /**
     * Updates an existing GoodsCategoryModel model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
	
	        $categoryId = Yii::$app->request->post('GoodsCategoryModel')['top_category'];
	        //如果存在顶级分类，并且没有上级分类,把顶级分类设置为上级分类
	        if($categoryId > 0 && $model->parent_id <= 0) {
		        $model->parent_id = $categoryId;
	        }
	
	        //如果不是顶级分类,查找上级分类
	        if($model->parent_id > 0) {
		        $parent = GoodsCategoryModel::findOne($model->parent_id);
		        $model->parent_id_path = $parent->parent_id_path ? $parent->parent_id_path.'_'.$parent->id : $parent->id;
		        $model->level = $parent->level + 1;
	        } else {
		        $model->parent_id = 0;
	        }
	
	        if($model->save()){
		        return $this->redirect(['index']);
	        }
	        
        } else {
        	
        	$categorys = [];
	        $top_category = $model->getSons(0, 'id,name');
	        if($model->parent_id != 0) {
	        	$category = $model::findOne($model->parent_id);
	        	//上级不是顶级分类
	        	if($category['parent_id_path']) {
	        		$path = explode('_', $category['parent_id_path']);
	        		$model->top_category = $path[0];
			        $categorys = $model->getSons($model->top_category, 'id, name');
		        } else {
			        $categorys = $top_category;
		        }
	        }
	
	        //已经存在分类分组，查看该分组分类下的分组列表
	        if($model->group_id) {
	        	$groupRow = CategoryGroupModel::findOne($model->group->category_id);
	            $where['category_id'] = $groupRow['category_id'];
	        } else {
		        $where['category_id'] = null;
	        }
	        $group = CategoryGroupModel::find()
		        ->where($where)
		        ->all();
	        
	        return $this->render('update', [
		        'model' => $model,
		        'top_category' => $top_category,
		        'categorys' => $categorys,
		        'group' => $group,
	        ]);
        }
    }

    /**
     * Deletes an existing GoodsCategoryModel model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the GoodsCategoryModel model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GoodsCategoryModel the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = GoodsCategoryModel::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
