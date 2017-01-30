export const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map((id) => state.todos[id]);
};

export const stepsByTodoId = (state, todo_id) => {
  const keys = Object.keys(state.steps);
  const filteredKeys= keys.filter(id => {
    return state.steps[id].todo_id === todo_id;
  });
  return filteredKeys.map(key => state.steps[key]);
};
