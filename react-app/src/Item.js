import React from 'react'

import Selector from './Selector'

class ItemData {
    constructor( {
        item_type_id = null,
        armor_type_id = null,
        set_id = null,
        motif_id = null,
        trait_id = null,
        item_id = null,
        price = null,
        showArmorType = false,
        showMotif = false,
    } = {} ) {
        this.item_type_id = item_type_id;
        this.armor_type_id = armor_type_id;
        this.set_id = set_id;
        this.motif_id = motif_id;
        this.trait_id = trait_id;
        this.item_id = item_id;
        this.price = price;
        this.showArmorType = showArmorType;
        this.showMotif = showMotif;
    }
}

class Item extends React.Component {

    constructor( props ) {
        super( props );

        this.onItemTypeChange = this.onItemTypeChange.bind( this );
        this.onArmorTypeChange = this.onArmorTypeChange.bind( this );
        this.onSetChange = this.onSetChange.bind( this );
        this.onMotifChange = this.onMotifChange.bind( this );
        this.onTraitChange = this.onTraitChange.bind( this );
        this.onItemChange = this.onItemChange.bind( this );
    }

    onItemTypeChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.item_type_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        // Because we aren't storing state in this component, React won't know
        // this needs to be redrawn, so we forceUpdate
        this.forceUpdate();
    }
    
    onArmorTypeChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.armor_type_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        this.forceUpdate();
    }
    
    onSetChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.set_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        this.forceUpdate();
    }

    onMotifChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.motif_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        this.forceUpdate();
    }

    onTraitChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.trait_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        this.forceUpdate();
    }
    
    onItemChange( id ) {
        let newItemData = this.props.itemData;
        newItemData.item_id = id;
        this.props.updateItem( this.props.myKey, newItemData );
        this.forceUpdate();
    }
    
    render() {
        return (
            <div className="Item" >
                <Selector
                    name="Item Type"
                    onValueChange={this.onItemTypeChange}
                    data={this.props.dbData.itemTypeData}
                />
                { this.props.itemData.showArmorType &&
                  <Selector
                      name="Armor Type"
                      onValueChange={this.onArmorTypeChange}
                      data={this.props.dbData.armorTypeData}
                  /> }
                <Selector
                    name="Item"
                    onValueChange={this.onItemChange}
                    data={this.props.dbData.itemData[this.props.itemData.item_type_id]}
                />
                <Selector
                    name="Trait"
                    onValueChange={this.onTraitChange}
                    data={this.props.dbData.traitData[this.props.itemData.item_type_id]}
                />
                <Selector
                    name="Set"
                    onValueChange={this.onSetChange}
                    data={this.props.dbData.setData}
                />
                { this.props.itemData.showMotif &&
                  <Selector
                      name="Motif"
                      onValueChange={this.onMotifChange}
                      data={this.props.dbData.motifData}
                  /> }
            </div>
        );
    }
}

export { Item, ItemData };
