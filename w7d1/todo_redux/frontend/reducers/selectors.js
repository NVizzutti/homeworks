export const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map((id) => state.todos[id]);
};

export const stepsByTodoId = (state, todoId) => {
  const keys = Object.keys(state.steps);
  const filteredKeys= keys.filter(id => {
    return state.steps[id].todoId === todoId;
  });
  return filteredKeys.map(key => state.steps[key]);
};
