
function showPeople () {
  
  const showPeople = (data) => {
    data.forEach( i => {
      let newLi = document.createElement('li')
      newLi.innerHTML = i.name
      document.getElementById("person-name").appendChild(newLi)
    })
  }
  
  const fetchPeople = (event) => {
    const url = "/api/v1/people"
    fetch(url)
      .then(res => res.json())
      .then(showPeople)
  }
  
  const leWagon = window.addEventListener('load', fetchPeople)

}  


function addPerson () {
  const newPerson = document.getElementById("new-person")
  const newPersonInput = document.getElementById("new-person-name")
  
  newPerson.addEventListener("submit", (event) => {
    event.preventDefault();
    fetch("/api/v1/people", {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ person: { name: newPersonInput.value }})
    })
      .then(response => response.json())
      .then((data) => {
      })
      newPerson.submit()
      newPerson.reset()
  })
}

export default addPerson;

export default showPeople;
