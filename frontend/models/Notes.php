<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "notes".
 *
 * @property string $id
 * @property string $title
 * @property string $text
 * @property integer $date
 *
 * @property Attachments[] $attachments
 */
class Notes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'notes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['text'], 'string'],
            [['title'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'text' => 'Text',
            'date' => 'Date',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAttachments()
    {
        return $this->hasMany(Attachments::className(), ['note_id' => 'id']);
    }
	
	public function beforeSave($insert)
	{
		if (parent::beforeSave($insert)) {
	 
			$this->date = time();
			return true;
		}
		return false;
	}
}
