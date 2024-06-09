let classes = [
    ["https://i.pinimg.com/736x/70/01/0d/70010df057bb304649da087fa4966bf0.jpg", "Linoel Messi"],
    ["/model/images_dataset/maria_sharapova/2-70.jpg","Maria Sharapova"],
    ["/model/images_dataset/roger_federer/55d4aba6a570417280c790d119c91ee7_18.jpg","Roger Federer"],
    ["/model/images_dataset/serena_williams/0ae47ed53dc47509d3f1d68b5a36a0c2.jpg","Serena Williams"],
    ["/model/images_dataset/virat_kohli/3e6d62bc8e.jpg","Virat Kohli"]
]

function make_element(url,person){
    var div = document.createElement('div')
    div.className = "sport-person"

    const image = document.createElement('img')
    image.src = url
    console.log("img done")
    const name = document.createElement('p')
    name.textContent = person

    div.appendChild(image)
    div.appendChild(name)
    return div
}

// function images() {
    // var element = classes.map(one => make_element(one[0],one[1]));
    
    var classList = document.getElementById("classes");
    // classList.appendChild(element)
    // classList.innerHTML = element;

    for (let index = 0; index < 5; index++) {
        const el = make_element(classes[index][0],classes[index][1])
        classList.appendChild(el)
    }
    // classList.innerHTML = el
// }

var err = document.getElementById("error")
err.hidden = true

var result = document.getElementById("resultHolder")
result.hidden = true