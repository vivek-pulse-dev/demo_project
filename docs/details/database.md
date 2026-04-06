# DB : Users

## Fields:
- `user_id` → int (Primary Key, autoGenerate)
- `first_name` → String ( min 2)
- `last_name` → String ( min 2)
- `birth_date` → String (YYYY-MM-DD)
- `email` → String (Unique)
- `password` → String ( min 6 )

## Operations :
- Insert new user
- Update existing user
- Delete user by ID
- Fetch users with pagination + search (by name or email)
- Check email uniqueness
