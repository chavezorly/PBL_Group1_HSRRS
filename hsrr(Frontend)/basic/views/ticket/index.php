<br>
<br>


<?php

use yii\helpers\Html;
use yii\grid\GridView;
use dosamigos\datepicker\DatePicker;


/* @var $this yii\web\View */
/* @var $searchModel app\models\TicketSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Tickets';

?>
<div class="ticket-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Ticket', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'tick_details',
            'tick_status',
            'tick_priority',
            'tick_date',
            // 'tick_limit',
            // 'tick_closed_time',
            // 'tick_escalate',
            // 'room_id',
            // 'ticket_type_id',
            // 'employee_id',
            // 'employee_id1',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
