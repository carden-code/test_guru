document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    setProgressBar(progressBar)
  }
})

function setProgressBar(progressBar) {
  progressBar.setAttribute('value', progressBar.dataset.value)
  progressBar.setAttribute('max', progressBar.dataset.max)
}
