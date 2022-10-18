import React from 'react'
import $ from 'jquery'

class SelectItemTypes extends React.Component {
    constructor( props ) {
        super( props );
        this.state = {
            item_type_list : [],
            value : "",
        };

        this.handleChange = this.handleChange.bind( this );
        this.getItemTypes = this.getItemTypes.bind( this );
    }

    componentDidMount() {
        this.getItemTypes();
    }
    
    handleChange( e ) {
        this.setState( { value: e.target.value } );
    }

    getItemTypes() {
        const me = this;
        $.ajax({
            url: "http://localhost:5000/item_types",
            type: "GET",
            dataType: "json",
        })
            .done( function( json ) {
                if ( json.success === 1 ) {
                    me.setState({ item_type_list : json.data });
                }
                else {
                    console.log( "Failed to get item type list: " + json.errorMsg );
                }
            })
            .fail( function ( xhr, status, errorThrown ) {
                console.log( "Failed to get item type list: " + status + " " + errorThrown );
            });
    }
    
    render() {
        const selectOptions = this.state.item_type_list.map(
            ( item ) =>
            <option value={item.id} key={item.id}>{item.name}</option>
        );
        return (
            <div>
                <h6>Item Type</h6>
                <select value={this.state.value} onChange={this.handleChange} >
                    {selectOptions}
                </select>
            </div>
        );
    }
}

export default SelectItemTypes;
