<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ticket1".
 *
 * @property integer $id
 * @property string $tick_details
 * @property string $tick_status
 * @property string $tick_priority
 * @property string $tick_date
 * @property string $tick_limit
 * @property string $tick_closed_time
 * @property integer $tick_escalate
 * @property integer $room_id
 * @property integer $ticket_type_id
 * @property integer $employee_id
 * @property integer $employee_id1
 *
 * @property Employee $employeeId1
 * @property Room $room
 * @property TicketType $ticketType
 * @property Employee $employee
 */
class Ticket extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ticket1';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tick_details', 'tick_status', 'tick_priority', 'tick_date', 'tick_limit', 'tick_closed_time', 'tick_escalate', 'room_id', 'ticket_type_id', 'employee_id'], 'required'],
            [['tick_date', 'tick_limit', 'tick_closed_time'], 'safe'],
            [['tick_escalate', 'room_id', 'ticket_type_id', 'employee_id', 'employee_id1'], 'integer'],
            [['tick_details'], 'string', 'max' => 255],
            [['tick_status', 'tick_priority'], 'string', 'max' => 10],
            [['employee_id1'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['employee_id1' => 'id']],
            [['room_id'], 'exist', 'skipOnError' => true, 'targetClass' => Room::className(), 'targetAttribute' => ['room_id' => 'id']],
            [['ticket_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => TicketType::className(), 'targetAttribute' => ['ticket_type_id' => 'id']],
            [['employee_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['employee_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tick_details' => 'Ticket Details',
            'tick_status' => 'Ticket Status',
            'tick_priority' => 'Ticket Priority',
            'tick_date' => 'Ticket Date',
            'tick_limit' => 'Ticket Limit',
            'tick_closed_time' => 'Ticket Closing Time',
            'tick_escalate' => 'Ticket Flag',
            'room_id' => 'Room No.',
            'ticket_type_id' => 'Ticket Type',
            'employee_id' => 'Assigned Employee',
            'employee_id1' => 'Closing Employee',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeId1()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_id1']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoom()
    {
        return $this->hasOne(Room::className(), ['id' => 'room_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTicketType()
    {
        return $this->hasOne(TicketType::className(), ['id' => 'ticket_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_id']);
    }
}
