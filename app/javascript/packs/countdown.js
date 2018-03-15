console.log('test')

minutesCreatedAgo = document.getElementById('min-created-ago').innerText
countdownMinutes = document.getElementById('countdown-minutes').innerText
countdownSeconds = document.getElementById('countdown-seconds').innerText

let minutesCreatedAgoCounter = parseInt(minutesCreatedAgo, 10)
let minutesCounter = parseInt(countdownMinutes, 10)
let secondsCounter = parseInt(countdownSeconds, 10)

const countdown = () => {
  setInterval(() => {
    const timeInSeconds = (minutesCounter * 60) + secondsCounter
    if (timeInSeconds <= 0) {
      document.getElementById('countdown-minutes').innerText = "Ticket"
      document.getElementById('countdown-seconds').innerText = "Expired"
      document.getElementById('clock').style = "background-color: red;"
    } else {
      if (secondsCounter > 0) {
        document.getElementById('countdown-seconds').innerText = secondsCounter - 1
        secondsCounter -= 1
      } else if (timeInSeconds === 300) {
        document.getElementById('countdown-seconds').innerText = 60
        document.getElementById('countdown-minutes').innerText = minutesCounter - 1
        secondsCounter = 60
        minutesCounter -= 1
      } else {
        document.getElementById('countdown-seconds').innerText = 60
        document.getElementById('countdown-minutes').innerText = minutesCounter - 1
        document.getElementById('min-created-ago').innerText = minutesCreatedAgoCounter + 1
        secondsCounter = 60
        minutesCounter -= 1
        minutesCreatedAgoCounter += 1
      }
    }
  }, 1000)
}

countdown()
