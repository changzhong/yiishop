<?php
namespace backend\controllers;

use common\models\CategoryGroupModel;
use common\models\GoodsCategoryModel;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\LoginForm;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'get-categorys', 'get-group'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
	
	/**
	 * 获取下级分类
	 */
    public function actionGetCategorys(){
	    $pid = Yii::$app->request->post('pid');
	
	    $model = new GoodsCategoryModel();
	    $rows = $model::find()
		    ->where(['parent_id' => $pid])
		    ->orderBy(['sort' => 'ASC', 'name' => 'ASC'])
		    ->asArray()
		    ->all();
	    if($rows) {
		    echo json_encode([
			    'status' => true,
			    'data' => $rows,
		    ]);
	    } else {
		    echo json_encode([
			    'status' => false,
		    ]);
	    }
	    die;
    }
	
	/**
	 * 获取下级分类
	 */
	public function actionGetGroup(){
		$pid = Yii::$app->request->post('pid');
		if($pid) {
			$where['category_id'] = $pid;
		} else {
			$where['category_id'] = null;
		}
		$model = new CategoryGroupModel();
		$rows = $model::find()
			->where($where)
			->orderBy(['name' => 'ASC'])
			->asArray()
			->all();
		if($rows) {
			echo json_encode([
				'status' => true,
				'data' => $rows,
			]);
		} else {
			echo json_encode([
				'status' => false,
			]);
		}
		die;
	}
}
