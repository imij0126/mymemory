import { useState,useRef} from "react";


const taStyle = {
    resize: 'none',
    minHeight: '500px',
    minWidth: '50%'
}

const CountLetters =() => {
    const [text, setText] = useState('');

    const taRef = useRef();

    const changeText = (e) => {
        setText(e.target.value);
    }

    const resetPage =()=>{
        setText('');

        taRef.current.focus();
    }

    return (
        <>
            <textarea style={taStyle} 
                      onChange={changeText}
                      value={text}  
                      ref={taRef} ></textarea>
                <hr></hr>    
            <p>공백 포함: {text.length} 자</p>
            <p>공백 제외: {text.replace(/ /g,'').length} 자</p>
            <hr></hr>
            <button >초기화</button>
        </>
    );
}

export default CountLetters;