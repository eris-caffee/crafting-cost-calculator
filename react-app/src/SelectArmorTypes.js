import React from 'react'
import $ from 'jquery'

class SelectArmorTypes extends React.Component {
    constructor( props ) {
        super( props );
        this.state = {
            armor_type_list : [],
            value : "",
        };

        this.handleChange = this.handleChange.bind( this );
        this.getArmorTypes = this.getArmorTypes.bind( this );
    }

    componentDidMount() {
        this.getArmorTypes();
    }
    
    handleChange( e ) {
        this.setState( { value: e.target.value } );
    }

    getArmorTypes() {
        const me = this;
        $.ajax({
            url: "http://localhost:5000/armor_types",
            type: "GET",
            dataType: "json",
        })
            .done( function( json ) {
                if ( json.success === 1 ) {
                    me.setState({ armor_type_list : json.data });
                }
                else {
                    console.log( "Failed to get armor type list: " + json.errorMsg );
                }
            })
            .fail( function ( xhr, status, errorThrown ) {
                console.log( "Failed to get armor type list: " + status + " " + errorThrown );
            });
    }
    
    render() {
        const selectOptions = this.state.armor_type_list.map(
            ( armor ) =>
            <option value={armor.id} key={armor.id}>{armor.name}</option>
        );
        return (
            <div>
                <h6>Armor Type</h6>
                <select value={this.state.value} onChange={this.handleChange} >
                    {selectOptions}
                </select>
            </div>
        );
    }
}

export default SelectArmorTypes;
