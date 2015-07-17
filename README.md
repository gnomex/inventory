# Hey
    The CELTAB inventory for our automation office

## Inventory

Toolbox 1-* items
* uuid
* Name
* Owner or responsible
* Description
* created_at
* updated_at

items *-1 categories
* uuid
* name
* useful_for (aka description)
* quantity
* category_id
* created_at
* updated_at

Components *-1 category
* uuid
* name
* model
* description
* stock
* package
* manufacturer
* datasheet link
* Image link
* status (aka it still working? In use?)
* created_at
* updated_at
* category_id

Categories
* uuid
* name
* created_at
* updated_at

Users
* uuid
* name
* username
* password
* department
* role
* created_at
* updated_at
