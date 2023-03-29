# テーブル設計


##　users_table
| column            | type   | options     | 
| ----------------- | ------ | ----------- | 
| last_name(kanji)  | string | null: false | 
| first_name(kanji) | string | null: false | 
| last_name(kana)   | string | null: false | 
| first_name(kana)  | string | null: false | 
| email             | string | null: false | 
| password          | string | null: false | 

### Association
- has_one :shipping_to
- has_many :items
- has_many :buying_history

# items_table
| cloumn      | type        | option                          | 
| ----------- | ----------  |------------                     | 
| item_name   | string      |  null: false                    | 
| explanation | text        |  null: false                    | 
| detail      | string      |  null: false                    | 
| price       | integer     |  null: false                    | 
| user_id     | references  |  null: false, foreign_key: true |

### Association
- has_one :user
- has_one :shipping_to
- has_one :buying_history

# shipping_to
| cloumn            | type       | option                          | 
| ----------------  | ---------- | ------------------------------- | 
| postal_code       | integer    |  null: false                    |
| address           | string     |  null: false                    |
| phone_number      | integer    |  null: false
| user_id           | references |  null: false, foreign_key: true | 
| items_id          | references |  null: false, foreign_key: true | 
| buying_history_id | references |  null: false, foreign_key: true |

### Association
belongs_to :user
has_one :item
has_one :shipping_to

# buying_history
| cloumn         |  type      | option                         |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |
| shipping_to_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_one :shipping_to