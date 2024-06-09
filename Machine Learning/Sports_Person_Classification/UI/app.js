var dropZone = document.getElementById("dropzone");
var submitbtn = document.getElementById("submitbtn")
let dataURL


    submitbtn.addEventListener("click",function (event){
        event.preventDefault();


        if(dataURL == undefined || dataURL == null){
          var t = document.createElement('p')
          t.textContent = "No Image dropped here!"
          t.style.textAlign = "center"
          t.width = "100%"

          dropZone.innerHTML = null
          dropZone.appendChild(t)
        }else{

          
          // fetch("http://127.0.0.1:5000/classify_image", {
          //   method: "POST",
          //   headers: {
          //     "Content-Type": "application/json"
          //   },
          //   body: JSON.stringify({
          //     "image_data": dataURL
          //   })
          // })
          // .then(response => {
          //   // Check if the response is ok
          //   if (!response.ok) {
          //     // Throw an error if not
          //     throw new Error("Network response was not ok");
          //   }
          //   // Convert the response to text
          //   return response.text();
          // })
          // .then(data => {
          //   // Do something with the data
          //   const text = document.createElement('p')
          //   text.innerHTML = data;
          //   resultHolder.appendChild(text);
          //   alert(data);
          // })
          // .catch(error => {
          //   // Handle the error
          //   console.error("Error:", error);
          // });


        var xhr = new XMLHttpRequest();

        xhr.open("POST", "http://127.0.0.1:5000/classify_image",true);
        
        // xhr.setRequestHeader("Access-Control-Allow-Origin", "*");
        // xhr.setRequestHeader("Access-Control-Allow-Methods", "*");
        // xhr.setRequestHeader("Access-Control-Allow-Headers", "Content-Type");
        xhr.setRequestHeader("Content-Type", "application/json");
        // xhr.setRequestHeader("Content-Type", "multipart/form-data");

        xhr.addEventListener("load", function(event) {
          
          if (xhr.status == 200) {
            
            const res = document.getElementById("resultHolder")
            
            const text = document.createElement('p')
            var classified_result = ""
            try {
              console.log(xhr.responseText)
              console.log(JSON.parse(xhr.response)[0]["class"])
              classified_result = JSON.parse(xhr.response)[0]["class"]
            } catch (error) {
              classified_result = "Unable to classify"
            }
            text.innerHTML = classified_result
            res.appendChild(text)
            res.hidden = false

            // alert(xhr.responseText);
          } else {
            alert("Error: " + xhr.statusText);
          }
        });

        // var formdata = new FormData()

        // formdata.append("image_data",dataURL)

        // xhr.send(formdata);
        xhr.send(JSON.stringify ({"image_data": dataURL})); 
      }
    })
    
    dropZone.addEventListener("dragover", function(event) {
      event.preventDefault();
    });

    dropZone.addEventListener("drop", function(event) {
      event.preventDefault();

      var file = event.dataTransfer.files[0];

      var reader = new FileReader();
      reader.readAsDataURL(file);

      reader.addEventListener("load",function(event){
        event.preventDefault();
        dataURL = event.target.result;


        var image = document.createElement('img')
        image.style.objectFit = "contain"
        image.style.width = "120px"
        image.style.height = "120px"
        image.src = dataURL

        dropZone.innerHTML = null
        dropZone.appendChild(image)

      })

    });
