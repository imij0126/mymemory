import { useEffect, useState } from "react";

   
    let timer;
    const Timer = () => {
        const [day, setDay] = useState(new Date());

        useEffect(()=>{
            //1초마다 시간에 대한 정보를 업데이트
            timer = setInterval(()=>{
                setDay(new Date());
            }, 1000);

            return()=>{
                
                clearInterval(timer);
              
            }
            
        })
    }
    export default Timer;