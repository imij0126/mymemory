import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import './App.css';
import Practice1 from './components/Practice1';
import Practice2 from './components/Practice2';
import MyChatbot from './components/chatbot/MyChatbot';

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <header>
          <nav>
            <Link to="/">HOME</Link> |&nbsp; 
            <Link to="/pt1">연습</Link> |&nbsp;
            <Link to="/pt2">연습2</Link> |&nbsp;
            <Link to="/chatbot">챗봇</Link>
          </nav>
        </header>
        
        <Routes>
          <Route path="/" element={<p>안녕리액트?</p>}></Route>
          <Route path="/pt1" element={<Practice1 />} />
          <Route path="/pt2" element={<Practice2 />} />
          <Route path="/chatbot" element={<MyChatbot />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
