// src/App.js
import { useState, useEffect } from 'react';
import './App.css';
import { Route,Link, BrowserRouter, Routes } from 'react-router-dom';
import Timer from './components/Timer';
import CountLetters from './components/CountLetters';
import Home from './components/Home';
import { createContext } from 'react';
import Stopwatch from './components/Stopwatch';
import WaitList from './components/WaitList';


export const UserContext = createContext();
let defaultUser = {
    id: '',
    pwd: ''
}
function App() {
  const [user, setUser] = useState(defaultUser);
  const defaultContext = {
        data: user,
        setData: setUser
  }
  return(
    <BrowserRouter>
    <div className='App'>
        <header>
        {/* <Timer/> */}
        <nav style={{backgroundColor: 'teal'}}>
            <Link to="/">HOME</Link>
            <Link to="/timer">타이머</Link>
            <Link to="/countLetters">글자 수 세기</Link>
            <Link to="/stopwatch">스톱워치</Link>
            <Link to="/WaitList">대기명단</Link>
        </nav>
        </header>

        <UserContext.Provider value={defaultContext}>

            <Routes>

        <Route path="/" element={<Home/>}/>
        <Route path="/timer" element={<Timer/>}/> 
        <Route path="/CountLetters" element={<CountLetters/>}/>
        <Route path="/stopwatch" element={<Stopwatch />} />
        <Route path="/waitlist" element={<WaitList />} />
        </Routes>

        </UserContext.Provider>

    </div>
    </BrowserRouter>
  );
}

export default App;
