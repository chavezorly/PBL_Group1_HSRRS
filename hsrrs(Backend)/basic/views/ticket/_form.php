<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper; 
use app\models\Employee;
use app\models\Tickettype;
use app\models\Room

/* @var $this yii\web\View */
/* @var $model app\models\Ticket */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ticket-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tick_details')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tick_status')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tick_priority')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tick_date')->textInput() ?>

    <?= $form->field($model, 'tick_limit')->textInput() ?>

    <?= $form->field($model, 'tick_closed_time')->textInput() ?>

    <?= $form->field($model, 'tick_escalate')->textInput() ?>

   <?= $form->field($model, 'room_id')->dropDownList(
        ArrayHelper::map(Room::find()->all(),'id','room_no')    , 
    ['prompt'=>'Select Information'] 
    ) ?>

    <?= $form->field($model, 'ticket_type_id')->dropDownList(
    ArrayHelper::map(Tickettype::find()->all(),'id','type_name')    , 
    ['prompt'=>'Select Information'] 
  ) ?>

     <?= $form->field($model, 'employee_id')->dropDownList(
    ArrayHelper::map(Employee::find()->all(),'id','emp_fname')    , 
    ['prompt'=>'Select Information'] 
    ) ?>


       <?= $form->field($model, 'employee_id1')->dropDownList(
    ArrayHelper::map(Employee::find()->all(),'id','emp_fname')    , 
    ['prompt'=>'Select Information'] 
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
