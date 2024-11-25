//import { Component } from "react";
import { useState, useEffect } from 'react';

function Clicker(){
    const [count, setCount] = useState(0);
    // [상태명, 상태변경시 사용할 함수명] = useState(초기값);
    useEffect(()=>{
        document.title = '클릭횟수:'+count;
       })
       // => 랜더링될 때마다 실행
    return (
        // 반드시 요소(Element) 하나만 리턴해야 함!
        <div>
            <p>클릭 횟수 : {count}</p>
            <button onClick={()=>{
            setCount(count+1)
            }}>클릭</button>
        </div>
    );
}
/*
class Clicker extends Component{
    render(){
        return
    }
}
*/
export default Clicker;