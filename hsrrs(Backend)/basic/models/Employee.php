<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property string $emp_num
 * @property string $emp_lname
 * @property string $emp_fname
 * @property string $emp_mname
 * @property string $emp_contact_no
 * @property integer $pos_id
 * @property integer $dept_id
 *
 * @property Department $dept
 * @property Position $pos
 * @property Ticket1[] $ticket1s
 */
class Employee extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_num', 'emp_lname', 'emp_fname', 'emp_mname', 'emp_contact_no', 'pos_id', 'dept_id'], 'required'],
            [['pos_id', 'dept_id'], 'integer'],
            [['emp_num'], 'string', 'max' => 45],
            [['emp_lname', 'emp_fname', 'emp_mname'], 'string', 'max' => 20],
            [['emp_contact_no'], 'string', 'max' => 15],
            [['dept_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['dept_id' => 'id']],
            [['pos_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['pos_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'emp_num' => 'Employee No.',
            'emp_lname' => 'Employee Last name',
            'emp_fname' => 'Employee First name',
            'emp_mname' => 'Employee  Middle name',
            'emp_contact_no' => 'Employee Contact No.',
            'pos_id' => 'Position',
            'dept_id' => 'Department',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDept()
    {
        return $this->hasOne(Department::className(), ['id' => 'dept_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPos()
    {
        return $this->hasOne(Position::className(), ['id' => 'pos_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTicket1s()
    {
        return $this->hasMany(Ticket1::className(), ['employee_id' => 'id']);
    }
}
