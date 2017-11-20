<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%category_group}}".
 *
 * @property integer $id
 * @property integer $category_id
 * @property string $name
 * @property integer $status
 * @property integer $create_time
 * @property integer $update_time
 */
class CategoryGroupModel extends \yii\db\ActiveRecord
{
	const STATUS_Y = 1;
	const STATUS_N = 0;
	
	public static $_status = [
		self::STATUS_Y => '启用',
		self::STATUS_N => '禁用'
	];
	
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category_group}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['status'], 'integer'],
            [['name'], 'string', 'max' => 100],
	        [['category_id'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => '商品分类',
            'name' => '名称',
            'status' => '状态',
            'create_time' => '添加时间',
            'update_time' => '更新时间',
        ];
    }
    
	
    public function beforeSave($insert)
    {
    	if(parent::beforeSave($insert)) {
    	    if($insert) {
    	    	$this->create_time = time();
	        }
	        $this->update_time = time();
    	    return true;
	    }
	    return false;
    }
	
    
    public function getCategory(){
    	return $this->hasOne(GoodsCategoryModel::className(), ['id' => 'category_id']);
    }
}
