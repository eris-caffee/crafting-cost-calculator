import { useEffect } from 'react';

import './App.css';
import Order from './Order'

function App() {

    useEffect(() => {
        document.title = 'ESO Crafting Cost Calculator';
    }, []);

    return (
            <div className="App">
            <header className="App-header">
                <h1>ESO Crafting Cost Calculator</h1>
            </header>
            <p>This is a demo site for an application to calculate the cost of crafting items in Elder Scrolls Online.
            It is currently ugly, and limited because I am still testing the waters and trying to decide how much more effort to put into it.  It started out as a learning project for ReactJS programming, you see.</p>
            <p>You can add and delete items from the order and submit the order to get the list of prices for the items and the order total.  Prices are calulated using the upper end of the recommended prices of materials from <a href="https://tamrieltradecentre.com/">Tamriel Trade Centre</a>.  All items are currently assumed to be CP160 items.  To start a new order, just reload the web page.</p>
            <p>If people express interest in this tool, I will expand it to all levels of items and give it a nicer appearance.  Other features, such as saving orders, or even sending orders to registered crafters, may come in the future, but again, only if there is sufficient interest.</p>
            <hr />
            <Order />
            </div>
  );
}

export default App;
