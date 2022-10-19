import React from 'react'
import { v4 as uuidv4 } from 'uuid'

import ItemList from './ItemList'

class Order extends React.Component {

    constructor( props ) {
        super( props );

        this.state = {
            id : uuidv4(),
            itemList : ( <ItemList /> ),
        };

    }

    render() {
        return (
            <div className="Order" id={this.state.id} >
                <h2>Your Order</h2>
                { this.state.itemList }
            </div>
        );
    }

}

export default Order;
