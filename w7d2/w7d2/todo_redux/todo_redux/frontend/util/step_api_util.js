export const fetchSteps = () => (
  $.ajax({
    type: 'GET',
    url: 'api/steps'
  })
);

export const createStep = step => (
  $.ajax({
    type: 'POST',
    url: 'api/steps',
    data: step
  })
);

export const updateStep = step => (
  $.ajax({
    type: 'PATCH',
    url: `api/steps/${step.id}`,
    data: step
  })
);

export const deleteStep = step => (
  $.ajax({
    type: 'DELETE',
    url: `api/steps/${step.id}`
  })
);
