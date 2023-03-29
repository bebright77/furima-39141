# テーブル設計


##　users_table
| column             | type    | options                   | 
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               |
| last_name_kanji    | string  | null: false               | 
| first_name_kanji   | string  | null: false               | 
| last_name_kana     | string  | null: false               | 
| first_name_kana    | string  | null: false               |  
| birth              | date    | null: false               |

### Association
- has_many :items
- has_many :buying_histories

# items_table
| cloumn            | type        | option                          |
| ----------------- | ----------  |-------------------------------- |
| item_name         | string      |  null: false                    |
| explanation       | text        |  null: false                    |
| category_id       | integer     |  null: false                    |
| condition_id      | integer     |  null: false                    |
| shipping_price_id | integer     |  null: false                    |
| sender_id         | integer     |  null: false                    |
| days_to_ship_id   | integer     |  null: false                    |
| price             | integer     |  null: false                    | 
| user              | references  |  null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buying_history


# buying_histories_table
| cloumn         |  type      | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# addresses_table
| cloumn            | type       | option                          | 
| ----------------  | ---------- | ------------------------------- | 
| postal_code       | string     |  null: false                    |
| sender_id         | integer    |  null: false                    |
| municipality      | string     |  null: false                    |
| address           | string     |  null: false                    |
| building          | string     |                                 |
| phone_number      | string     |  null: false                    | 
| buying_history    | references |  null: false, foreign_key: true |

### Association
belongs_to :buying_history