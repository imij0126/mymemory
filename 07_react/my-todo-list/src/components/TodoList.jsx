import styled from 'styled-components';

const ListContainer = styled.ul`
    width: 100%;
    margin: 12px 0px;
    padding: 0px 30px;
`

const TodoItem = styled.li`
    height:30px;
    background-color:lightblue;
    display:flex;
    align-items: center;
    justify-content: center;
`

export default function TodoList({list}){
    return(
        <ListContainer>
            {
                list.map((todo, index)=>
                    <TodoItem key={'todo'+index}>{todo}</TodoItem>
                )
            }
        </ListContainer>
    );
}