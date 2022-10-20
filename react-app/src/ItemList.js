import React from 'react'

import { Item, ItemData } from './Item'


class ItemList extends React.Component {

    constructor( props ) {
        super( props );

        this.state = {
            itemList : [],
            nextKey : 1,
        };

        this.addItem = this.addItem.bind( this );
        this.deleteItem = this.deleteItem.bind( this );
        this.updateItem = this.updateItem.bind( this );
    }

    addItem() {
        let key = this.state.nextKey;

        let itemData = new ItemData();
        itemData.item_type_id = this.props.dbData.itemTypeData[0].id;
        itemData.armor_type_id = this.props.dbData.armorTypeData[0].id;
        itemData.set_id = this.props.dbData.setData[0].id;
        itemData.motif_id = this.props.dbData.motifData[0].id;
        itemData.trait_id = this.props.dbData.traitData[itemData.item_type_id][0].id;
        itemData.item_id = this.props.dbData.itemData[itemData.item_type_id][0].id;
        itemData.showArmorType = this.props.dbData.itemTypeData[0].name === "Armor";
        itemData.showMotif = this.props.dbData.itemTypeData[0].name !== "Jewelry";
        
        let newItem = {
            key : key,
            component : ( <Item key = "{key}"
                                myKey = {key}
                                itemData = {itemData}
                                updateItem = {this.updateItem}
                                dbData = {this.props.dbData}
                          /> ),
            data : itemData,
        };
        let newList = this.state.itemList;
        newList.push( newItem );
        this.setState( {
            itemList : newList,
            nextKey : this.state.nextKey + 1,
        } );
    }
    
    deleteItem( key ) {
        let item = this.state.itemList.find( e => e.key === key );
        let index = this.state.itemList.indexOf( item );
        let newList = this.state.itemList;
        newList.splice( index, 1 );
        this.setState( { itemList : newList } );
    }

    updateItem( key, itemData ) {
        let newList = this.state.itemList;
        let oldItem = newList.find( e => e.key === key );
        
        if ( itemData.item_type_id === 1 ) {
            // Weapon
            itemData.showMotif = true;
            itemData.showArmorType = false;
        } else if ( itemData.item_type_id === 2 ) {
            // Armor
            itemData.showMotif = true;
            itemData.showArmorType = true;
        } else {
            // Jewelry
            itemData.showMotif = false;
            itemData.showArmorType = false;
        }

        let newItem = {
            key : key,
            component : oldItem.component,
            data: itemData,
        };

        let index = newList.indexOf( oldItem );

        newList[index] = newItem;
        this.setState( { itemList : newList } );
    }
    
    render() {
        let items = this.state.itemList.map(
            ( item ) => (
                <div className="ItemRow" key={item.key}>
                    {item.component}
                    <button className="DeleteItemButton"
                            onClick={this.deleteItem.bind( this, item.key )}
                    >Delete This Item</button>
                </div>
            )
        );
        return (
            <div className="ItemList">
                <button onClick={this.addItem}>Add New Item</button>
                {items}
            </div>
        );
    }
}

export default ItemList;
