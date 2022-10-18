import configparser
import mysql.connector as mysql
import os

from CraftException import *

class CraftDatabase:

    __db_host = None
    __db_database = None
    __db_user = None
    __db_password = None
    
    ################################################################################

    def __init__( self ):

        path = os.path.dirname(__file__)
        config = configparser.ConfigParser()
        config.read(path + "/../config.ini")

        self.__db_host = config["Database"]["Host"]
        self.__db_database = config["Database"]["Database"]
        self.__db_user = config["Database"]["User"]
        self.__db_password = config["Database"]["Password"]
        
    ################################################################################
    # open connection

    def connect( self ):
        return mysql.connect( host=self.__db_host, database=self.__db_database,
                              user=self.__db_user, password=self.__db_password )

        
    
    ################################################################################
    # get_all_materials

    def get_all_materials( self ):
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM materials ORDER BY name" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1], "price" : row[2] } )
        db_cursor.close()
        db.close()
        return all_data
        
    ################################################################################
    # get_material
    # Get material by ID

    def get_material( self, material_id=None ):
        if ( material_id == None ):
            raise CraftException( "No material specified" );

        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = (
            "SELECT * "
            "FROM materials "
            "WHERE id = %(material_id)s"
        )

        db_cursor.execute( query, { "material_id" : material_id } )
        row = db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Material " + str(material_id) + " not found" )

        db_cursor.close()
        db.close()

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
        
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
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
            "WHERE item_type_id = %(item_type_id)s "
            "ORDER BY traits.name"
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

        db_cursor.close()
        db.close()

        return all_data


    ################################################################################
    # get_trait
    # Get trait by ID

    def get_trait( self, trait_id=None ):
        if ( trait_id == None ):
            raise CraftException( "No trait specified" );

        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = (
            "SELECT * "
            "FROM traits "
            "WHERE id = %(trait_id)s"
        )

        db_cursor.execute( query, { "trait_id" : trait_id } )
        row = db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Trait " + str(trait_id) + "not found" )

        db_cursor.close()
        db.close()

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
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM armor_types ORDER BY id" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        db_cursor.close()
        db.close()
        return all_data
            
    ################################################################################
    # get_all_crafting_types

    def get_all_crafting_types( self ):
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM crafting_types ORDER BY name" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        db_cursor.close()
        db.close()
        return all_data
            
    ################################################################################
    # get_all_item_types

    def get_all_item_types( self ):
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM item_types ORDER BY name" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        db_cursor.close()
        db.close()
        return all_data
            
    ################################################################################
    # get_item_type

    def get_item_type( self, item_type_id ):
        if ( item_type_id == None ):
            raise CraftException( "No item type specified" );

        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM item_types WHERE id = %(item_type_id)s" )
        db_cursor.execute( query, { "item_type_id" : item_type_id } )
        row = db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Item type " + str(item_type_id) + " not found" )
        
        db_cursor.close()
        db.close()

        return {
            "id" : row[0],
            "name" : row[1]
        }

    ################################################################################
    # get all motifs

    def get_all_motifs( self ):
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = ( "SELECT * FROM sets ORDER BY name" )
        db_cursor.execute( query )
        raw_data = db_cursor.fetchall()
        all_data = []
        for row in raw_data:
            all_data.append( { "id" : row[0], "name" : row[1] } )
        db_cursor.close()
        db.close()
        return all_data


    ################################################################################
    # get_motif
    # specify one of motif_id or motif_name

    def get_motif( self, motif_id=None, motif_name=None ):
        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = None
        query_args = None

        if ( motif_id != None ):
            query = ( "SELECT * FROM motifs WHERE id = %(motif_id)s" )
            query_args = { "motif_id" : motif_id }
        else:
            query = ( "SELECT * FROM motifs WHERE name = %(motif_name)s" )
            query_args = { "motif_name" : motif_name }

        if ( query == None ):
            raise CraftException( "No motif specified" )

        db_cursor.execute( query, query_args )
        row = db_cursor.fetchone()

        if ( row == None ):
            if ( motif_id != None ):
                id_or_name = str(motif_id)
            else:
                id_or_name = motif_name
            raise CraftException( "Motif " + id_or_name + "not found" )

        db_cursor.close()
        db.close()

        return {
            "id " : row[0],
            "name" : row[1],
            "material_id" : row[2]
        }
    
    ################################################################################
    # get_item
    # Get single item by ID
    # motif_id optional.  Will assume Breton is not specified

    def get_item( self, item_id=None, motif_id=None ):
        if ( item_id == None ):
            raise CraftException( "No item specified" );

        motif = None
        if ( motif_id == None ):
            motif = self.get_motif( None, "Breton" )
        else:
            motif = self.get_motif( motif_id )

        db = self.connect()
        db_cursor = db.cursor( buffered=True )
        query = (
            "SELECT * "
            "FROM items "
            "WHERE id = %(item_id)s"
        )

        db_cursor.execute( query, { "item_id" : item_id } )
        row = db_cursor.fetchone()

        if ( row == None ):
            raise CraftException( "Item " + str(item_id) + "not found" )
    
        db_cursor.close()
        db.close()

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
    # get_items_by_type

    def get_items_by_type( self, item_type_id=None ):
        if ( item_type_id == None ):
            raise CraftException( "No item type specified" );
        
        # Verify that the specified things exist.
        self.get_item_type( item_type_id )

        db = self.connect()
        db_cursor = db.cursor( buffered=True )
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
        db_cursor.close()
        db.close()

        return all_data
    
