## messagesテーブル
 |Column|Type|Options|
 |------|----|-------|
 |body|text|null: false|
 |image|string|
 |user_id|integer|null: false, foreign_key: true|
 |group_id|integer|null: false, foreign_key: true|

 ### Association
 - belongs_to :group
 - belongs_to :user

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :members
- has_many :users, through: :members
- has_many :messages

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :members
- has_many :groups, through: :members



