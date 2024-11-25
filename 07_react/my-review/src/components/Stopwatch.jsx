import React, { useState, useEffect } from 'react';

const Stopwatch = () => {
    const [time, setTime] = useState(0);
    const [running, setRunning] = useState(false);

    useEffect(() => {
        let timer;
        if (running) {
            timer = setInterval(() => {
                setTime(prevTime => prevTime + 1);
            }, 1000);
        }
        return () => clearInterval(timer);
    }, [running]);

    const start = () => setRunning(true);
    const stop = () => setRunning(false);
    const reset = () => {
        setRunning(false);
        setTime(0);
    };

    // 시간을 "분:초" 형식으로 변환하는 함수
    const formatTime = (time) => {
        const minutes = Math.floor(time / 60);
        const seconds = time % 60;
        return `${minutes}:${seconds < 10 ? `0${seconds}` : seconds}`;
    };

    return (
        <div>
            <h2>Stopwatch</h2>
            <p>{formatTime(time)}</p>
            <button onClick={start}>start</button>
            <button onClick={stop}>stop</button>
            <button onClick={reset}>reset</button>
        </div>
    );
};

export default Stopwatch;