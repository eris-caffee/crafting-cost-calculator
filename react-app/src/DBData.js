import $ from 'jquery'

class DBData {
    constructor() {
        this.itemTypeData = [];
        this.armorTypeData = [];
        this.setData = [];
        this.motifData = [];
        this.traitData = [];
        this.itemData = [];
        this.haveData = false;
    }

    getData( data_key, url, index=null, followUp=null ) {
        let me = this;
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
        })
            .done( function( json ) {
                if ( json.success === 1 ) {
                    let adjData = [];
                    let entry = json.data.find( (el) => el.name + "" === "None" );
                    if (entry) {
                        let index = json.data.indexOf( entry );
                        json.data.splice( index, 1 );
                        adjData = [ entry ];
                        adjData.push( ...json.data );
                    }
                    else {
                        adjData = json.data;
                    }
                    if ( index != null ) {
                        me[data_key][index] = adjData;
                    } else {
                        me[data_key] = adjData;
                    }
                    
                    if ( followUp != null ) {
                        followUp();
                    }
                }
                else {
                    console.log( "Failed to get data: " + json.errorMsg );
                }
            })
            .fail( function ( xhr, status, errorThrown ) {
                console.log( "Failed to get data: " + status + " " + errorThrown );
            });
    }

    getDataByArmorType() {
        for ( let index in this.itemTypeData ) {
            let type = this.itemTypeData[index];
            this.getData( "traitData", "http://localhost:5000/traits/" + type.id,
                          type.id );
            this.getData( "itemData", "http://localhost:5000/items/" + type.id,
                          type.id );
        }
    }
    
    getAllData() {
        if ( ! this.haveData ) {
            this.getData( "itemTypeData", "http://localhost:5000/item_types" );
            this.getData( "armorTypeData", "http://localhost:5000/armor_types",
                          null, this.getDataByArmorType.bind( this ) );
            this.getData( "setData", "http://localhost:5000/sets" );
            this.getData( "motifData", "http://localhost:5000/motifs" );
            this.haveData = true;
        }
        
    }
}

export default DBData;
