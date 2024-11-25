import logo from './logo.svg';

import './App.css';
import Mycontainer from './components/Mycontainer';
import InsertItem from './components/InsertItem';
import TodoList from './components/TodoList';
import { useState } from 'react';

function App() {

  const[list, setList] = useState(['빵!', '악']);

  const addItem = (item) => {   // InsertItem 컴포넌트에서 추가될 데이터를 매개변수로 받아
                                // list 상태에 추가
    list.push(item);
    setList([...list]);
  }

  return (
    <div className="App">
          <Mycontainer title="My TodoList">
              <InsertItem addItem={addItem}></InsertItem>
              <TodoList list={list} />
          </Mycontainer>
    </div>
  );
}

export default App;
