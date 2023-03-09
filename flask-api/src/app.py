from flask import Flask, request
from flask_cors import CORS

from CraftApp import *

################################################################################

flaskApp = Flask(__name__)
CORS( flaskApp, origins=["http://eldalin.com:5000"] )

craftApp = CraftApp()

# Get all materials
@flaskApp.route( "/materials" )
def materials():
    return craftApp.materials()

# Get material by id
@flaskApp.route( "/material/<int:material_id>" )
def material( material_id=None ):
    return craftApp.material( material_id )

# Get all armor types
@flaskApp.route( "/armor_types" )
def armor_types():
    return craftApp.armor_types()

# Get all crafting types
@flaskApp.route( "/crafting_types" )
def crafting_types():
    return craftApp.crafting_types()

# Get all item types
@flaskApp.route( "/item_types" )
def item_types():
    return craftApp.item_types()

# Get all sets
@flaskApp.route( "/sets" )
def sets():
    return craftApp.sets()

# Get all motifs
@flaskApp.route( "/motifs" )
def motifs():
    return craftApp.motifs()

@flaskApp.route( "/motif/<id_or_name>" )
def motif( id_or_name=None ):
    return craftApp.motif( id_or_name )

# Get traits by item type id
@flaskApp.route( "/traits/<int:item_type_id>" )
def traits( item_type_id = None ):
    return craftApp.traits( item_type_id )

# Get items by item type id
@flaskApp.route( "/items/<int:item_type_id>/" )
# Get items by item type id and armor_type_id
@flaskApp.route( "/items/<int:item_type_id>/<int:armor_type_id>" )
def items( item_type_id = None, armor_type_id = None ):
    return craftApp.items( item_type_id, armor_type_id )

# calculate order total
@flaskApp.route( "/order", methods = [ "POST" ] )
def order():
    return craftApp.order( request.json )
