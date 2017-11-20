<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%brand}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $logo
 * @property string $desc
 * @property string $url
 * @property integer $sort
 * @property string $cat_name
 * @property integer $parent_cat_id
 * @property integer $cat_id
 * @property integer $is_hot
 */
class BrandModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%brand}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['desc'], 'required'],
            [['desc'], 'string'],
            [['sort', 'parent_cat_id', 'cat_id', 'is_hot'], 'integer'],
            [['name'], 'string', 'max' => 60],
            [['logo'], 'string', 'max' => 80],
            [['url'], 'string', 'max' => 255],
            [['cat_name'], 'string', 'max' => 128],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '品牌表',
            'name' => '品牌名称',
            'logo' => '品牌logo',
            'desc' => '品牌描述',
            'url' => '品牌地址',
            'sort' => '排序',
            'cat_name' => '品牌分类',
            'parent_cat_id' => '分类id',
            'cat_id' => '分类id',
            'is_hot' => '是否推荐',
        ];
    }
}
