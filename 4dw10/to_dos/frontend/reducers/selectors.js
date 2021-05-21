
export default function allTodos(state) {
    return Object.values(state.todos);//.map(id => state.todos[id]);
    // return listTodos.map((id) => state.todos[id]);
}