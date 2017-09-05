<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Tickettype */

$this->title = 'Create Tickettype';
$this->params['breadcrumbs'][] = ['label' => 'Tickettypes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tickettype-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
