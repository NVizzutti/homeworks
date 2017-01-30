export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  })
);


export const fetchPokemon = (id) => {
  console.log('making request to fetch poke');
  return $.ajax({
    method: "GET",
    url: `api/pokemon/${id}`
  });
};

export const createPokemon = (poke) => (
  $.ajax({
    method: 'POST',
    url: 'api/pokemon',
    data: poke
  })
);
