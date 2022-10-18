import json

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

        try:
            all_data = self.__db.get_all_materials()
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (materials): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get material by id

    def material( self, material_id=None ):
        if ( material_id == None ):
            return { "success" : 0, "ErrorMsg" : "No material specified" }

        try:
            data = self.__db.get_material( material_id )
            result = { "success" : 1, "data" : data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (material): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get all armor types

    def armor_types( self ):
        try:
            all_data = self.__db.get_all_armor_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (armor_types): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get all crafting types

    def crafting_types( self ):
        try:
            all_data = self.__db.get_all_crafting_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (crafing_types): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get all item types

    def item_types( self ):
        try:
            all_data = self.__db.get_all_item_types()
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (item_types): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get all motifs

    def motifs( self ):
        try:
            all_data = self.__db.get_all_motifs()
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (motifs): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get motif by id or name

    def motif( self, id_or_name=None ):
        if ( id_or_name == None ):
            return { "success" : 0, "errorMsg" : "No motif specified" }

        try:
            motif_id = None
            motif_name = None
            try:
                motif_id = int(id_or_name)
            except:
                motif_name = id_or_name
            
            all_data = self.__db.get_motif( motif_id, motif_name )
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (motif): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
            
        return result

    ################################################################################
    # Get traits by item type id

    def traits( self, item_type_id = None ):
        if ( item_type_id == None ):
            return { "success" : 0, "ErrorMsg" : "No item type specified" }

        try:
            all_data = self.__db.get_traits_by_item_type( item_type_id )
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (traits): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # Get items by item type id

    def items( self, item_type_id = None ):
        if ( item_type_id == None ):
            return { "success" : 0, "ErrorMsg" : "No item type specified" }

        try:
            all_data = self.__db.get_items_by_type( item_type_id )
            result = { "success" : 1, "data" : all_data }
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (items): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }

        return result

    ################################################################################
    # get_item_price
    # Get price for single item

    def get_item_price( self, item_id=None, trait_id=None, motif_id=None ):
        if ( item_id == None ):
            raise CraftException( "No item specified" );

        item = self.__db.get_item( item_id, motif_id )
        print( item )
        item_material = self.__db.get_material( item["material_id"] )
        motif_material = self.__db.get_material( item["material_id"] )
        price = item["num_materials"] * item_material["price"] + motif_material["price"]

        if ( trait_id != None ):
            trait = self.__db.get_trait( trait_id )
            trait_material = self.__db.get_material( trait["material_id"] )
            price = price + trait_material["price"]

        return price

    ################################################################################
    # Calculate order total

    def order( self, order ):
        if ( order == None ):
            raise CraftException( "No order specified" )

        try:
            order_data = json.loads( order )

            if ( "items" not in order_data
                or not isinstance(order_data["items"], list)
                ):
                raise CraftException( "items missing or not a list" )

            order_data["total"] = 0
            for item in order_data["items"] :
                item_id = item["item"];
                trait_id = None
                if ( "trait" in item ):
                    trait_id = item["trait"]
                price = self.get_item_price( item_id, trait_id )
                item["price"] = price
                order_data["total"] += price
            
            result = { "success" : 1, "data" : order_data }
            
        except CraftException as e:
            result = { "success" : 0, "errorMsg" : e.msg }
        except Exception as e:
            print( "Exception (order): ", e )
            result = { "success" : 0, "errorMsg" : "An unknown exception occurred" }
            
        return result
        
