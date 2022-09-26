from CraftException import *
from CraftDatabase import *

class CraftApp:

    __db = None

    ################################################################################

    def __init__( self ):
        self.__db = CraftDatabase()
        if ( self.__db == None ):
            raise CraftError( "Could not open database" )
    
    ################################################################################
    # Get all materials

    def materials( self ):
        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        try:
            all_data = self.__db.get_all_materials()
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get material by id

    def material( self, material_id=None ):
        if ( material_id == None ):
            return { "success" : 0, "ErrorMsg" : "No material specified" }

        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        try:
            data = self.__db.get_material( material_id )
            result = { "success" : 1, "data" : data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get all armor types

    def armor_types( self ):
        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        try:
            all_data = self.__db.get_all_armor_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get all crafting types

    def crafting_types( self ):
        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        try:
            all_data = self.__db.get_all_crafting_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get all item types

    def item_types( self ):
        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        try:
            all_data = self.__db.get_all_item_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get traits by item type id

    def traits( self, item_type_id = None ):
        if ( item_type_id == None ):
            return { "success" : 0, "ErrorMsg" : "No item type specified" }

        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
        try:
            all_data = self.__db.get_traits_by_item_type( item_type_id )
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result

    ################################################################################
    # Get items by item type id

    def items( self, item_type_id = None ):
        if ( item_type_id == None ):
            return { "success" : 0, "ErrorMsg" : "No item type specified" }

        result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
        try:
            all_data = self.__db.get_items_by_type( item_type_id )
            result = { "success" : 1, "data" : all_data }
        except CraftException as E:
            result = { "success" : 0, "errorMsg" : E.msg }

        return result
