import React from 'react'

class Selector extends React.Component {
    constructor( props ) {
        super( props );
        this.state = {
            value : "",
        };

        this.handleChange = this.handleChange.bind( this );
    }

    handleChange( e ) {
        this.setState( { value: e.target.value } );
        this.props.onValueChange( e.target.value );
    }

    render() {
        let selectOptions = this.props.data.map(
            ( entry ) =>
            <option value={entry.id} key={entry.id}>{entry.name}</option>
        );
        return (
            <div>
                <h6>{this.props.name}</h6>
                <select value={this.state.value}
                        onChange={this.handleChange} >
                    {selectOptions}
                </select>
            </div>
        );
    }
}

export default Selector;
