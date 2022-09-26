import configparser
import mysql.connector as mysql
import os

from CraftException import *

class CraftDatabase:

    __db = None
    __db_cursor = None
    
    ################################################################################

    def __init__( self ):

        path = os.path.dirname(__file__)
        config = configparser.ConfigParser()
        config.read(path + "/../config.ini")

        db_host = config["Database"]["Host"]
        db_database = config["Database"]["Database"]
        db_user = config["Database"]["User"]
        db_password = config["Database"]["Password"]
        
        self.__db = mysql.connect( host=db_host, database=db_database,
                                   user=db_user, password=db_password )

        self.__db_cursor = self.__db.cursor()

    ################################################################################
    # get_db_cursor

    def get_db_cursor( self ):
        return self.__db_cursor

    ################################################################################
    # get_all_materials

    def get_all_materials( self ):
        query = ( "SELECT * FROM materials" )
        self.__db_cursor.execute( query )
        raw_data = self.__db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1], "price" : row[2] } )
        return all_data
        
    ################################################################################
    # get_material
    # Get material by ID

    def get_material( self, material_id=None ):
        if ( material_id == None ):
            raise CraftException( "No material specified" );

        query = (
            "SELECT * "
            "FROM materials "
            "WHERE id = %(material_id)s"
        )

        self.__db_cursor.execute( query, { "material_id" : material_id } )
        row = self.__db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Material " + str(material_id) + " not found" )

        return {
            "id" : row[0],
            "name" : row[1],
            "price" : row[2]
        }

    ################################################################################
    # get_traits_by_item_type

    def get_traits_by_item_type( self, item_type_id ):
        if ( item_type_id == None ):
            raise CraftException( "No item type specified" );

        # Verify that the specified item_type exists.
        self.get_item_type( item_type_id )
        
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
        self.__db_cursor.execute( query, { "item_type_id" : item_type_id } )
        raw_data = self.__db_cursor.fetchall()
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

        return all_data


    ################################################################################
    # get_trait
    # Get trait by ID

    def get_trait( self, trait_id=None ):
        if ( trait_id == None ):
            raise CraftException( "No trait specified" );

        query = (
            "SELECT * "
            "FROM traits "
            "WHERE id = %(trait_id)s"
        )

        self.__db_cursor.execute( query, { "trait_id" : trait_id } )
        row = self.__db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Trait " + str(trait_id) + "not found" )

        return {
            "id" : row[0],
            "name" : row[1],
            "description" : row[2],
            "material_id" : row[3],
            "item_type_id" : row[4]
        }

    ################################################################################
    # get_all_armor_types

    def get_all_armor_types( self ):
        query = ( "SELECT * FROM armor_types" )
        self.__db_cursor.execute( query )
        raw_data = self.__db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        return all_data
            
    ################################################################################
    # get_all_crafting_types

    def get_all_crafting_types( self ):
        query = ( "SELECT * FROM crafting_types" )
        self.__db_cursor.execute( query )
        raw_data = self.__db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        return all_data
            
    ################################################################################
    # get_all_item_types

    def get_all_item_types( self ):
        query = ( "SELECT * FROM item_types" )
        self.__db_cursor.execute( query )
        raw_data = self.__db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        return all_data
            
    ################################################################################
    # get_item_type

    def get_item_type( self, item_type_id ):
        if ( item_type_id == None ):
            raise CraftException( "No item type specified" );

        query = ( "SELECT * FROM item_types WHERE id = %(item_type_id)s" )
        self.__db_cursor.execute( query, { "item_type_id" : item_type_id } )
        row = self.__db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Item type " + str(item_type_id) + " not found" )
        
        return {
            "id" : row[0],
            "name" : row[1]
        }

    ################################################################################
    # get_item
    # Get single item by ID

    def get_item( self, item_id=None ):
        if ( item_id == None ):
            raise CraftException( "No item specified" );

        query = (
            "SELECT * "
            "FROM items "
            "WHERE id = %(item_id)s"
        )

        self.__db_cursor.execute( query, { "item_id" : item_id } )
        row = self.__db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Item " + str(item_id) + "not found" )
    
        return {
            "id" : row[0],
            "name" : row[1],
            "material_id" : row[2],
            "num_materials" : row[3],
            "item_type_id" : row[4],
            "crafting_type_id" : row[5],
            "armor_type_id" : row[6]
        }

    ################################################################################
    # get_item_price
    # Get price for single item

    def get_item_price( self, item_id=None, trait_id=None ):
        if ( item_id == None ):
            raise CraftException( "No item specified" );

        item = self.get_item( item_id )
        item_material = self.get_material( item.material_id )
        price = item.num_materials * item_material.price

        if ( trait_id != None ):
            trait = self.get_trait( trait_id )
            trait_material = self.get_material( trait.material_id )
            price = price + trait_material.price

        return price

    ################################################################################
    # get_items_by_type

    def get_items_by_type( self, item_type_id ):
        if ( item_type_id == None ):
            raise CraftException( "No item type specified" );
        
        # Verify that the specified item_type exists.
        self.get_item_type( item_type_id )

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

        self.__db_cursor.execute( query, { "item_type_id" : item_type_id } )
        raw_data = self.__db_cursor.fetchall()
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

        return all_data
    
