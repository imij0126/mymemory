import { useContext } from "react"
import Login from "./Login"
import { UserContext } from "../App"



export default function Home(){
    const userCtx = useContext(UserContext);
    const user = userCtx.data;
    
    return ( 
<>
        {
            user.id === ''?
        <Login/>
        :
        <div>
        <p>{user.id}님 반갑습니다. ^^</p>
        <input type="button" value="로그아웃"
        onDoubleClick={()=>{userCtx.setData({id: '', pwd: ''})}} />
        </div>
        }
</>
    )
}