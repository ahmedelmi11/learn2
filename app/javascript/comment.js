const button = document.getElementById('comment-button');
const commentContent = document.getElementById('comment_content');

const prevent = (e) => {
  if (commentContent.value == "") {
    e.preventDefault();
    alert('please type something');
  }
}

button.addEventListener('click', prevent);


// this logics prevents a form from re-loading
