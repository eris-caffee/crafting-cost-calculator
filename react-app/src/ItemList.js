import React from 'react'

import Item from './Item'


class ItemList extends React.Component {

    constructor( props ) {
        super( props );

        this.state = {
            itemList : [],
            nextKey : 1,
        };

        this.addItem = this.addItem.bind( this );
        this.deleteItem = this.deleteItem.bind( this );
    }

    addItem() {
        let newItem = [ this.state.nextKey, ( <Item key="{this.nextKey}"/> ) ];
        let newList = this.state.itemList;
        newList.push( newItem );
        this.setState( { itemList : newList, nextKey : this.state.nextKey + 1 } );
    }
    
    deleteItem( id ) {
        let item = this.state.itemList.find( e => e[0] === id );
        let index = this.state.itemList.indexOf( item );
        let newList = this.state.itemList;
        newList.splice( index, 1 );
        this.setState( { itemList : newList } );
    }
    
    render() {
        let items = this.state.itemList.map(
            ( item ) => (
                <div className="ItemRow" key={item[0]}>
                    {item[1]}
                    <button className="DeleteItemButton" onClick={this.deleteItem.bind( this, item[0] )}>Delete This Item</button>
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
