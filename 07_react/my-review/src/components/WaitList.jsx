import React, { useState } from 'react';


//* const [상태명 ,set상태명] = useState(초기값)
const WaitList = () => {
    const [waiters, setWaiters] = useState([
        { name: '아이유', count: 10, contact: '010-1010-1010' },
        { name: '차은우', count: 5, contact: '010-3030-3030' },
        { name: '카리나', count: 3, contact: '010-7070-7070' },
        { name: '이효리', count: 4, contact: '010-2312-1313' },
    ]);//대기 명단 관련 상태

    const [newName, setNewName] = useState('');     //이름 입력 관련 상태
    const [newCount, setNewCount] = useState('');   //인원수 입력 고나련 상태
    const [newContact, setNewContact] = useState(''); //연락처 입력 관련 상태

    //function addList() {}
    const addWaiter = () => {
        const newWaiter = {
            name: newName,
            count: parseInt(newCount, 10),
            contact: newContact
        };
        setWaiters([...waiters, newWaiter]);
        setNewName('');
        setNewCount('');
        setNewContact('');
    };

    return (
        <div align="center">
            <h3>엘식당 대기 명단 표</h3>
            <table border="1">
                <thead style={{backgroundColor: 'light'}}>
                    <tr>
                        <th>이름</th>
                        <th>인원 수</th>
                        <th>입장 여부</th>
                    </tr>
                </thead>
                <tbody>
                    {waiters.map((waiter, index) => (
                        <tr key={index}>
                            <td>{waiter.name}</td>
                            <td>{waiter.count}</td>
                            <td>📞{waiter.contact}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <h4>새 대기자 추가</h4>
            <div>
            <input
                type="text"
                placeholder="이름 입력"
                value={newName}
                onChange={(e) => setNewName(e.target.value)}
            />
            <input 
                type="number"
                placeholder="인원 수 입력"
                value={newCount}
                onChange={(e) => setNewCount(e.target.value)}
            />
            <input
                type="text"
                placeholder="연락처 입력"
                value={newContact}
                onChange={(e) => setNewContact(e.target.value)}
            />
            <button onClick={addWaiter}>등록</button>
            </div>
        </div>
    );
};

export default WaitList;
