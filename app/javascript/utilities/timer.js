document.addEventListener('turbolinks:load', () => {
    let timerSpan = document.getElementById('timer');

    if (timerSpan) {
        startTimer(timerSpan);
    }
});

function startTimer(timer) {
    let seconds = timer.dataset.seconds;
    let testPassageId = timer.dataset.testPassageId;

    timer.textContent = secondsToTimeString(seconds);

    setInterval(() => {
        seconds -= 1;
        timer.textContent = secondsToTimeString(seconds);
        if (seconds < 0) {
            window.location.href = `/test_passages/${testPassageId}/result`;
        }
    }, 1000);
}

function secondsToTimeString(seconds) {
    let min = parseInt(seconds / 60, 10);
    let sec = parseInt(seconds % 60, 10);

    min = min < 10 ? "0" + min : min;
    sec = sec < 10 ? "0" + sec : sec;

    return min + ":" + sec;
}
