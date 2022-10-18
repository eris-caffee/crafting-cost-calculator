import React from 'react'
import $ from 'jquery'

class Selector extends React.Component {
    constructor( props ) {
        super( props );
        this.state = {
            url : props.url,
            name : props.name,
            data : [],
            value : "",
        };

        this.handleChange = this.handleChange.bind( this );
        this.getData = this.getData.bind( this );
    }

    componentDidMount() {
        this.getData();
    }
    
    handleChange( e ) {
        this.setState( { value: e.target.value } );
    }

    getData() {
        const me = this;
        $.ajax({
            url: me.state.url,
            type: "GET",
            dataType: "json",
        })
            .done( function( json ) {
                if ( json.success === 1 ) {
                    me.setState({ data : json.data });
                }
                else {
                    console.log( "Failed to get data: " + json.errorMsg );
                }
            })
            .fail( function ( xhr, status, errorThrown ) {
                console.log( "Failed to get data: " + status + " " + errorThrown );
            });
    }
    
    render() {
        const selectOptions = this.state.data.map(
            ( entry ) =>
            <option value={entry.id} key={entry.id}>{entry.name}</option>
        );
        return (
            <div>
                <h6>{this.state.name}</h6>
                <select value={this.state.value} onChange={this.handleChange} >
                    {selectOptions}
                </select>
            </div>
        );
    }
}

export default Selector;
