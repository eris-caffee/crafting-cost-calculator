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
            <Order />
            </div>
  );
}

export default App;
