<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%goods_category}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $mobile_name
 * @property integer $parent_id
 * @property string $parent_id_path
 * @property integer $level
 * @property integer $sort
 * @property integer $is_show
 * @property string $image
 * @property integer $is_hot
 * @property integer $cat_group
 * @property integer $commission_rate
 */
class GoodsCategoryModel extends \yii\db\ActiveRecord
{
	public $top_category;
	
    const SHOW_Y = 1;
    const SHOW_N = 0;

    public static $_show = [
        self::SHOW_Y => '显示',
        self::SHOW_N => '不显示'
    ];

    const HOT_Y = 1;
    const HOT_N = 0;
    public static $_hot = [
        self::HOT_Y => '是',
        self::HOT_N => '否'
    ];
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%goods_category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['name','required'],
	        ['mobile_name','required'],
            [['level', 'sort', 'is_show', 'is_hot'], 'integer'],
            [['name'], 'string', 'max' => 90],
            [['mobile_name'], 'string', 'max' => 64],
            [['image_url'], 'string', 'max' => 512],
	        [['parent_id', 'parent_id_path', 'group_id'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'id',
            'name' => '分类名称',
            'mobile_name' => '手机端分类名',
            'parent_id' => '上级分类',
            'parent_id_path' => '家族图谱',
            'level' => '等级',
            'sort' => '顺序排序',
            'is_show' => '是否显示',
            'image_url' => '分类图片',
            'is_hot' => '是否推荐为热门分类',
	        'top_category' => '顶级分类',
	        'group_id' => '分类分组'
        ];
    }
	
	/**
	 * 获取对应的下级分类
	 * @param int $pid
	 * @param string $field
	 * @return array|\yii\db\ActiveRecord[]
	 */
    public function getSons($pid = 0, $field="*") {
    	return $this::find()->where(['parent_id' => $pid])->select($field)->all();
    }
	
	/**
	 * 获取所有分类
	 * @return array|\yii\db\ActiveRecord[]
	 */
    public function getAll(){
    	$category = $this::find()
		    ->where(['is_show' => self::SHOW_Y])
		    ->asArray(true)
		    ->orderBy(['sort' => 'ASC', 'parent_id' => 'ASC'])
		    ->select('id, name')
		    ->all();
    	return$category;
    }
    
    public function getGroup(){
    	return $this->hasOne(CategoryGroupModel::className(), ['id' => 'group_id']);
    }
    
}
