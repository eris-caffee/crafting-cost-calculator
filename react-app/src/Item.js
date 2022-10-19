import React from 'react'
import $ from 'jquery'

import Selector from './Selector'

class Item extends React.Component {

    constructor( props ) {
        super( props );

        this.state = {
            showArmorType : true,
            showMotif : true,
            
            item_type_id : -1,
            armor_type_id : -1,
            set_id : -1,
            motif_id : -1,
            trait_id : -1,
            item_id : -1,
            
            itemTypeData : [],
            armorTypeData : [],
            setData : [],
            motifData : [],
            traitData : [],
            itemData : [],
        };

        this.onItemTypeChange = this.onItemTypeChange.bind( this );
        this.onArmorTypeChange = this.onArmorTypeChange.bind( this );
        this.onSetChange = this.onSetChange.bind( this );
        this.onMotifChange = this.onMotifChange.bind( this );
        this.onTraitChange = this.onTraitChange.bind( this );
        this.onItemChange = this.onItemChange.bind( this );
    }

    onItemTypeChange( id ) {
        let newState = { item_type_id : id };

        let entry = this.state.itemTypeData.find(
            (el) => el.id == id
        );
        let extra_url = "";
        if ( entry.name === "Armor" ) {
            newState.showArmorType = true;
            newState.showMotif = true;
            extra_url = "/" + this.state.armor_type_id;
        } else if ( entry.name === "Weapon" ) {
            newState.showArmorType = false;
            newState.showMotif = true;
            newState.armor_type_id = -1;
            newState.trait_id = -1;
            newState.item_id = -1;
        } else {
            newState.showArmorType = false;
            newState.showMotif = false;
            newState.armor_type_id = -1;
            newState.motif_type_id = -1;
            newState.trait_id = -1;
            newState.item_id = -1;
        }
        
        this.getData( "trait_id",
                      "traitData",
                      "http://localhost:5000/traits/" + id );
        this.getData( "item_id",
                      "itemData",
                      "http://localhost:5000/items/" + id + extra_url );
        this.setState( newState );
    }
    
    onArmorTypeChange( id ) {
        this.getData( "item_id",
                      "itemData",
                      "http://localhost:5000/items/" + this.state.item_type_id + "/" + id );
        this.setState( { armor_type_id : id } );
    }
    
    onSetChange( id ) {
        this.setState( { set_id : id } );
    }

    onMotifChange( id ) {
        this.setState( { motif_id : id } );
    }

    onTraitChange( id ) {
        this.setState( { trait_id : id } );
    }
    
    onItemChange( id ) {
        this.setState( { item_id : id } );
    }
    
    getData( id_key, data_key, url ) {
        let me = this;
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
        })
            .done( function( json ) {
                if ( json.success === 1 ) {
                    let adjData = [];
                    let entry = json.data.find( (el) => el.name == 'None' );
                    if (entry) {
                        let index = json.data.indexOf( entry );
                        json.data.splice( index, 1 );
                        adjData = [ entry ];
                        adjData.push( ...json.data );
                    }
                    else {
                        adjData = json.data;
                    }
                    me.state[id_key] = adjData[0].id;
                    me.state[data_key] = adjData;
                    me.forceUpdate();
                }
                else {
                    console.log( "Failed to get data: " + json.errorMsg );
                }
            })
            .fail( function ( xhr, status, errorThrown ) {
                console.log( "Failed to get data: " + status + " " + errorThrown );
            });
    }

    
    componentDidMount() {
        this.getData( "item_type_id", "itemTypeData", "http://localhost:5000/item_types" );
        this.getData( "armor_type_id", "armorTypeData", "http://localhost:5000/armor_types" );
        this.getData( "set_id", "setData", "http://localhost:5000/sets" );
        this.getData( "motif_id", "motifData", "http://localhost:5000/motifs" );
        this.getData( "trait_id", "traitData", "http://localhost:5000/traits/2" ); // Armor
        this.getData( "item_id", "itemData", "http://localhost:5000/items/2/1" ); // Armor, Light
    }

    render() {
        return (
            <div className="Item" >
                <Selector
                    name="Item Type"
                    onValueChange={this.onItemTypeChange}
                    data={this.state.itemTypeData}
                />
                { this.state.showArmorType &&
                  <Selector
                      name="Armor Type"
                      onValueChange={this.onArmorTypeChange}
                      data={this.state.armorTypeData}
                  /> }
                <Selector
                    name="Item"
                    onValueChange={this.onItemChange}
                    data={this.state.itemData}
                />
                <Selector
                    name="Trait"
                    onValueChange={this.onTraitChange}
                    data={this.state.traitData}
                />
                <Selector
                    name="Set"
                    onValueChange={this.onSetChange}
                    data={this.state.setData}
                />
                { this.state.showMotif &&
                  <Selector
                      name="Motif"
                      onValueChange={this.onMotifChange}
                      data={this.state.motifData}
                  /> }
            </div>
        );
    }
}

export default Item;
