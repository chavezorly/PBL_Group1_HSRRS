<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Ticket;

/**
 * TicketSearch represents the model behind the search form about `app\models\Ticket`.
 */
class TicketSearch extends Ticket
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'tick_escalate', 'room_id', 'ticket_type_id', 'employee_id', 'employee_id1'], 'integer'],
            [['tick_details', 'tick_status', 'tick_priority', 'tick_date', 'tick_limit', 'tick_closed_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Ticket::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'tick_date' => $this->tick_date,
            'tick_limit' => $this->tick_limit,
            'tick_closed_time' => $this->tick_closed_time,
            'tick_escalate' => $this->tick_escalate,
            'room_id' => $this->room_id,
            'ticket_type_id' => $this->ticket_type_id,
            'employee_id' => $this->employee_id,
            'employee_id1' => $this->employee_id1,
        ]);

        $query->andFilterWhere(['like', 'tick_details', $this->tick_details])
            ->andFilterWhere(['like', 'tick_status', $this->tick_status])
            ->andFilterWhere(['like', 'tick_priority', $this->tick_priority]);

        return $dataProvider;
    }
}
