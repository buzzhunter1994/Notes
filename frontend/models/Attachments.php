<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "attachments".
 *
 * @property string $id
 * @property integer $type
 * @property string $title
 * @property string $attach
 * @property string $note_id
 *
 * @property Notes $note
 */
class Attachments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'attachments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'note_id'], 'integer'],
            [['attach'], 'string'],
            [['title'], 'string', 'max' => 255],
            [['note_id'], 'exist', 'skipOnError' => true, 'targetClass' => Notes::className(), 'targetAttribute' => ['note_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'title' => 'Title',
            'attach' => 'Attach',
            'note_id' => 'Note ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNote()
    {
        return $this->hasOne(Notes::className(), ['id' => 'note_id']);
    }
}
