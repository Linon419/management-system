import logo from './logo.svg';
import {
  Navigate,
  Route,
  Routes,
  BrowserRouter
} from "react-router-dom";
import Main from './Components/Home/Main';
import Header from './Components/Header/Header';
function App() {
  return (
    <div>
      <Header></Header>
     <Main>
      
     </Main>
    </div>
  );
}

export default App;
