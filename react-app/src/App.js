import logo from './logo.svg';
import './App.css';
import Selector from './Selector'

function App() {
    return (
    <div className="App">
      <header className="App-header">
        <h1>ESO Crafting Cost Calculator</h1>
      </header>
      <div className="ItemSelector">      
        <Selector name="Crafting Types" url="http://localhost:5000/crafting_types" />
        <Selector name="Item Types" url="http://localhost:5000/item_types" />
        <Selector name="Armor Types" url="http://localhost:5000/armor_types" />
        <Selector name="Materials" url="http://localhost:5000/materials" />
        <Selector name="Motifs" url="http://localhost:5000/motifs" />
      </div>    
    </div>
  );
}

export default App;
