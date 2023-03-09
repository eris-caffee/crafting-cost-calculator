import $ from 'jquery'

class CraftDatabase {
    constructor() {
        this.itemTypeData = [];
        this.armorTypeData = [];
        this.setData = [];
        this.motifData = [];
        this.traitData = [];
        this.itemData = [];
        this.haveData = false;
    }

    submitOrder(order, onSuccess) {
        let order_result;
        $.ajax({
            url: 'http://eldalin.com:5000/order',
            type: "POST",
            dataType: "json",
            data: JSON.stringify(order),
            contentType: "application/json; charset=utf-8",
        })
            .done(function (json) {
                console.log("json ", json);
                if (json.success === 1) {
                    order_result = json.data;
                    onSuccess(order_result);
                }
                else {
                    console.log( "Failed to submit order: " + json.errorMsg );
                }
            })
            .fail(function (xhr, status, errorThrown) {
                console.log("Failed to submit order: " + status + " " + errorThrown);
            });
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
            this.getData( "traitData", "http://eldalin.com:5000/traits/" + type.id,
                          type.id );
            this.getData( "itemData", "http://eldalin.com:5000/items/" + type.id,
                          type.id );
        }
    }
    
    getAllData() {
        if ( ! this.haveData ) {
            this.getData( "itemTypeData", "http://eldalin.com:5000/item_types" );
            this.getData( "armorTypeData", "http://eldalin.com:5000/armor_types",
                          null, this.getDataByArmorType.bind( this ) );
            this.getData( "setData", "http://eldalin.com:5000/sets" );
            this.getData( "motifData", "http://eldalin.com:5000/motifs" );
            this.haveData = true;
        }
        
    }
}

export default CraftDatabase;
