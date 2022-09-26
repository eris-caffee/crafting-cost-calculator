from flask import Flask

from CraftApp import *

################################################################################

app = Flask(__name__)

craftApp = CraftApp()

# Get all materials
@app.route( "/materials" )
def materials():
    return craftApp.materials()

# Get material by id
@app.route( "/material/<int:material_id>" )
def material( material_id=None ):
    return craftApp.material( material_id )

# Get all armor types
@app.route( "/armor_types" )
def armor_types():
    return craftApp.armor_types()

# Get all crafting types
@app.route( "/crafting_types" )
def crafting_types():
    return craftApp.crafting_types()

# Get all item types
@app.route( "/item_types" )
def item_types():
    return craftApp.item_types()

# Get traits by item type id
@app.route( "/traits/<int:item_type_id>" )
def traits( item_type_id = None ):
    return craftApp.traits( item_type_id )

# Get items by item type id
@app.route( "/items/<int:item_type_id>" )
def items( item_type_id = None ):
    return craftApp.items( item_type_id )
