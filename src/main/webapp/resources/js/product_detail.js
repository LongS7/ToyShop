var count;

function starmark(item) {
  count = item.id[0];
  sessionStorage.starRating = count;
  var subid = item.id.substring(1);
  for (var i = 0; i < 5; i++) {
    if (i < count) {
      document.getElementById(i + 1 + subid).style.color = "orange";
    } else {
      document.getElementById(i + 1 + subid).style.color = "black";
    }
  }
}

function result() {
  //Rating : Count
  //Review : Comment(id)
  alert(
    "Rating : " +
      count +
      "\nReview : " +
      document.getElementById("comment").value
  );
}
function incrementValue() {
  var value = parseInt(document.getElementById("number").value, 10);
  value = isNaN(value) ? 0 : value;
  value++;
  document.getElementById("number").value = value;
}
function dncrementValue() {
  var value = parseInt(document.getElementById("number").value, 10);
  value = isNaN(value) ? 0 : value;
  value--;
  if (value < 0) {
    value = 0;
  }
  document.getElementById("number").value = value;
}

let img1 = document.querySelector("#img1");
let img2 = document.querySelector("#img2");
let img3 = document.querySelector("#img3");

let hinh1 = document.getElementById("hinh1");
let hinh2 = document.getElementById("hinh2");
let hinh3 = document.getElementById("hinh3");

var proimg1 = document.querySelector(".pro-img");
var child = document.querySelector(".child");

var elements = document.getElementsByClassName("child");
for (var i = 0; i < elements.length; i++) {
  elements[i].onclick = function () {
    var el = elements[0];
    while (el) {
      if (el.tagName === "DIV") {
        el.classList.remove("bak");
      }
      el = el.nextSibling;
    }
    this.classList.add("bak");
  };
}

// function changeImage(event) {
//   // proimg1.src = event.children[0].src;
//   console.log(event);
// }
// var proimgs = document.querySelectorAll("#img1");
// for (var i = 0; i < proimgs.length; ++i) {
//   proimgs[i].onclick = function (e) {
//     // console.log(e.children[i].src);
//     proimg1.src = e.src;
//     // console.log(proimg1.src);
//   };
// }
// là sao mày
// var imgg1 = document.getElementsByClassName("img1");
// function changeImage(e) {
//   console.log(e.children[0].src);
// }
function changeimg(url, e) {
  document.getElementById("pro-img").src = url;
  let nodes = document.querySelector(".child");
  console.log(nodes);
  let img_child = nodes.children;
  console.log(img_child);
  for (i = 0; i < img_child.length; i++) {
    img_child[i].classList.remove("active");
  }
  e.classList.add("active");
}
