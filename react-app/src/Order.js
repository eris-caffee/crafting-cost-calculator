import React from 'react'
import { v4 as uuidv4 } from 'uuid'

import DBData from './DBData'
import ItemList from './ItemList'

class Order extends React.Component {

    constructor( props ) {
        super( props );

        let me = this;
        this.state = {
            id : uuidv4(),
            dbData : new DBData(
                function() {
                    me.forceUpdate();
                }
            ),
        };

    }

   
    componentDidMount() {
        this.state.dbData.getAllData();
    }        

    render() {
        return (
            <div className="Order" id={this.state.id}>
                <h2>Your Order</h2>
                <ItemList dbData={this.state.dbData}/>
            </div>
        );
    }

}

export default Order;
