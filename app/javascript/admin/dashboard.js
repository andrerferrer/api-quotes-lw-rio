
const loadPeopleInTheDOM = () => {
  
  const showPeople = (data) => {
    // select the ul
    const peopleNames = document.getElementById("people-names");
    // empty it
    peopleNames.innerHTML = ""
    // add all the <li>s
    data.forEach( i => {
      let newLi = document.createElement('li')
      newLi.innerHTML = i.name
      peopleNames.appendChild(newLi)
    })
  }
  
  const fetchPeople = (event) => {
    const url = "/api/v1/people"
    fetch(url)
      .then(res => res.json())
      .then(showPeople)
  }
  
  fetchPeople();

}  


const addPerson = () => {
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
        loadPeopleInTheDOM();
      })

      newPerson.reset()
  })
}

export { addPerson, loadPeopleInTheDOM }
