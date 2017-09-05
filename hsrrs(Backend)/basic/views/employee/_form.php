<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper; 
use app\models\Department;
use app\models\Position;

/* @var $this yii\web\View */
/* @var $model app\models\Employee */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_lname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_fname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_mname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_contact_no')->textInput(['maxlength' => true]) ?>

      <?= $form->field($model, 'pos_id')->dropDownList(
    ArrayHelper::map(Position::find()->all(),'id','pos_des')    , 
    ['prompt'=>'Select Information'] 
    ) ?>


   <?= $form->field($model, 'dept_id')->dropDownList(
    ArrayHelper::map(Department::find()->all(),'id','dept_name')    , 
    ['prompt'=>'Select Information'] 
    ) ?>



    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
