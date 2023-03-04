import React from 'react';
import { arrayOf, bool, func, number, object, shape, } from 'prop-types';

import Item from './Item';

const propTypes = {
    itemData: arrayOf(shape({
        key: number.isRequired,
        item_type_id: number.isRequired,
        armor_type_id: number.isRequired,
        set_id: number.isRequired,
        motif_id: number.isRequired,
        trait_id: number.isRequired,
        item_id: number.isRequired,
        showArmorType: bool.isRequired,
        showMotif: bool.isRequired,
    })).isRequired,
    onNewItemClick: func.isRequired,
    dbData: object.isRequired,
};

const ItemList = ({
    itemData,
    onNewItemClick,
    dbData,
    ...props
}) => {

    const buildItems = () => {
        return itemData.map( item => {
            return (
                <Item
                    key={item.key}
                    item={item}
                    dbData={dbData}
                    {...props}
                />
            );
        });
    };

    const items = buildItems(itemData);

    return (
        <div className="ItemList">
            <button onClick={onNewItemClick}>Add New Item</button>
            {items}
        </div>
    );
};

ItemList.propTypes = propTypes;
export default ItemList;

/*
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
*/