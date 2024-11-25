import { useEffect, useState } from "react";

function Callbackview(props){
    const [numbers, setNumbers] = useState([]);

    useEffect(()=>{

        setNumbers(props.getNumbers());
        console.log("숫자가 변경되었습니다.");

    },[props.getNumbers]);

    props.getNumbers()
    return(
        <>
            {
                numbers.map((item, index)=><div key={index}>{item}</div>)
            }
        </>
    )
}

export default Callbackview;