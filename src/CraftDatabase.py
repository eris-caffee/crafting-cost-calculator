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
        print ( path )
        print ( path + "/../config.ini" )
        config = configparser.ConfigParser()
        config.read(path + "/../config.ini")

        db_host = config["Database"]["Host"]
        db_database = config["Database"]["Database"]
        db_user = config["Database"]["User"]
        db_password = config["Database"]["Password"]
        
        self.__db = mysql.connect( host=db_host, database=db_database, user=db_user, password=db_password )

        self.__db_cursor = self.__db.cursor()

    ################################################################################
    # get_db_cursor

    def get_db_cursor( self ):
        return self.__db_cursor

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


