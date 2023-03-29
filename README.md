# テーブル設計


##　users_table
| column             | type    | options                   | 
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               |
| last_name(kanji)   | string  | null: false               | 
| first_name(kanji)  | string  | null: false               | 
| last_name(kana)    | string  | null: false               | 
| first_name(kana)   | string  | null: false               |  
| birth              | integer | null: false               |

### Association
- has_one :addresses
- has_many :items
- has_many :buying_histories

# items_table
| cloumn         | type        | option                          | 
| -------------- | ----------  |------------                     | 
| item_name      | string      |  null: false                    | 
| explanation    | text        |  null: false                    | 
| category       | string      |  null: false                    | 
| condition      | string      |  null: false                    |
| shipping_price | string      |  null: false                    |
| from           | string      |  null: false                    |
| days_to_ship   | string      |  null: false                    |
| price          | integer     |  null: false                    | 
| user           | references  |  null: false, foreign_key: true |

### Association
- has_one :user
- has_one :shipping_to
- has_one :buying_histories

# addresses_table
| cloumn            | type       | option                          | 
| ----------------  | ---------- | ------------------------------- | 
| postal_code       | integer    |  null: false                    |
| prefectures       | string     |  null: false                    |
| Municipality      | string     |  null: false                    |
| address           | integer    |  null: false                    |
| building          | integer    |  null: false                    |
| phone_number      | integer    |  null: false                    | 
| buying_histories  | references |  null: false, foreign_key: true |

### Association
has_one :buying_histories

# buying_histories_table
| cloumn         |  type      | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_one :addresses