<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "room".
 *
 * @property integer $id
 * @property integer $room_no
 * @property string $room_location
 *
 * @property Ticket1[] $ticket1s
 */
class Room extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'room';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['room_no', 'room_location'], 'required'],
            [['room_no'], 'integer'],
            [['room_location'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'room_no' => 'Room No',
            'room_location' => 'Room Location',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTicket1s()
    {
        return $this->hasMany(Ticket1::className(), ['room_id' => 'id']);
    }
}
