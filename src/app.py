from flask import Flask

from CraftException import *
from CraftDatabase import *


################################################################################

app = Flask(__name__)

db = CraftDatabase()
db_cursor = db.get_db_cursor()

################################################################################
# Get all materials
@app.route( "/materials" )
def materials():
    result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
    
    try:
        query = ( "SELECT * FROM materials" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1], "price" : row[2] } )
        result = { "success" : 1, "data" : all_data }
    except CraftException as E:
        result = { "success" : 0, "errorMsg" : E.msg }
    
    return result

################################################################################
# Get material by id
@app.route( "/material/<int:material_id>" )
def material( material_id=None ):
    if ( material_id == None ):
        return { "success" : 0, "ErrorMsg" : "No material specified" }

    result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

    try:
        data = db.get_material( material_id )
        result = { "success" : 1, "data" : data }
    except CraftException as E:
        result = { "success" : 0, "errorMsg" : E.msg }

    return result
    
################################################################################
# Get all armor types
@app.route( "/armor_types" )
def armor_types():
    result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
    
    try:
        query = ( "SELECT * FROM armor_types" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
            result = { "success" : 1, "data" : all_data }
    except CraftException as E:
        result = { "success" : 0, "errorMsg" : E.msg }

    return result

################################################################################
# Get all crafting types
@app.route( "/crafting_types" )
def crafting_types():
    result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
    
    try:
        query = ( "SELECT * FROM crafting_types" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
            restult = { "success" : 1, "data" : all_data }
    except CraftException as E:
        result = { "success" : 0, "errorMsg" : E.msg }

    return result

################################################################################
# Get all item types
@app.route( "/item_types" )
def item_types():
    result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
    
    try:
        query = ( "SELECT * FROM item_types" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
            result = { "success" : 1, "data" : all_data }
    except CraftException as E:
        result = { "success" : 0, "errorMsg" : E.msg }

    return result

################################################################################
# Get traits by item type id
@app.route( "/traits/<int:item_type_id>" )
def traits( item_type_id = None ):
    if ( item_type_id == None ):
        return { "success" : 0, "ErrorMsg" : "No item type specified" }

    query = (
        "SELECT traits.id, "
        "       traits.name, "
        "       traits.description, "
        "       traits.material_id, "
        "       materials.name AS material_name, "
        "       traits.item_type_id, "
        "       item_types.name AS item_type_name "
        "FROM traits "
        "     INNER JOIN materials ON traits.material_id = materials.id "
        "     INNER JOIN item_types ON traits.item_type_id = item_types.id "
        "WHERE item_type_id = %(item_type_id)s"
    )
    db_cursor.execute( query, { "item_type_id" : item_type_id } )
    raw_data = db_cursor.fetchall()
    all_data = []
    for row in raw_data:
        all_data.append( {
            "id" : row[0],
            "name" : row[1],
            "description" : row[2],
            "material_id" : row[3],
            "material_name" : row[4],
            "item_type_id" : row[5],
            "item_type_name" : row[6]
        } )
    return { "success" : 1, "data" : all_data }

################################################################################
# Get items by item type id
@app.route( "/items/<int:item_type_id>" )
def items( item_type_id = None ):
    if ( item_type_id == None ):
        return { "success" : 0, "ErrorMsg" : "No item type specified" }

    query = (
        "SELECT items.id, "
        "       items.name, "
        "       items.num_materials, "
        "       items.material_id, "
        "       materials.name AS material_name, "
        "       items.item_type_id, "
        "       item_types.name AS item_type_name, "
        "       items.crafting_type_id, "
        "       crafting_types.name AS crafting_type_name, "
        "       items.armor_type_id, "
        "       armor_types.name AS armor_type_name "
        "FROM items "
        "     INNER JOIN materials ON items.material_id = materials.id "
        "     INNER JOIN item_types ON items.item_type_id = item_types.id "
        "     LEFT JOIN armor_types ON items.armor_type_id = armor_types.id "
        "     INNER JOIN crafting_types ON items.crafting_type_id = crafting_types.id "
        "WHERE items.item_type_id = %(item_type_id)s"
    )

    db_cursor.execute( query, { "item_type_id" : item_type_id } )
    raw_data = db_cursor.fetchall()
    all_data = []
    for row in raw_data:
        all_data.append( {
            "id" : row[0],
            "num_materials" : row[1],
            "name" : row[2],
            "material_id" : row[3],
            "material_name" : row[4],
            "item_type_id" : row[5],
            "item_type_name" : row[6],
            "crafting_type_id" : row[7],
            "crafting_type_name" : row[8],
            "armor_type_id" : row[9],
            "armor_type_name" : row[10]
        } )

    return { "success" : 1, "data" : all_data }

################################################################################
# End of routes

