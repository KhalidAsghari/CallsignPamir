##preparatory steps
if (!require("notifier", character.only = TRUE)) {
  url <- "https://cloud.r-project.org/src/contrib/Archive/notifier/notifier_1.0.0.tar.gz"
  install.packages(url, type = "source", repos = NULL)
}
if (!require("later", character.only = TRUE)) {
  install.packages("later")
}
download.file("https://api.fifa.com/api/v1/picture/tournaments-sq-4/254645_w", "logo.png")

## 1. get match score
readLiveMatchScore <- function() {
  # reading in the API data
  worldcupDataDF <- 
    jsonlite::fromJSON("https://api.fifa.com/api/v1/live/football/")$Results
  # which World Cup match is currently active?
  worldcupMatchIdx <- which(worldcupDataDF$IdSeason == 254645 & 
                              worldcupDataDF$MatchStatus == 3)
  
  if (length(worldcupMatchIdx) != 1) { # no matches or more than 1 match
    liveScore <- NULL
  } else {
    # get the score
    liveScore <- unlist(worldcupDataDF[worldcupMatchIdx, 
                                       c("AggregateHomeTeamScore", "AggregateAwayTeamScore", 
                                         "HomeTeamPenaltyScore", "AwayTeamPenaltyScore")])
    
    homeTeam <- worldcupDataDF$HomeTeam$TeamName[[worldcupMatchIdx]]$Description
    awayTeam <- worldcupDataDF$AwayTeam$TeamName[[worldcupMatchIdx]]$Description
    names(liveScore) <- rep(c(homeTeam, awayTeam), 2)
  }
  liveScore
}

scoreAsString <- function(matchScore, penalties = FALSE) {
  out <- paste(names(matchScore)[1], " - ", names(matchScore)[2], ":", 
               matchScore[1], " - ", matchScore[2])
  if (penalties && matchScore[1] == matchScore[2])
    out <- paste0(out, " (pen. ", matchScore[3], " - ", matchScore[4], ")" )
  out
}

## 2. check for score changes
checkScoreAndNotify <- function(prevScore = NULL) {
  newScore <- readLiveMatchScore()
  if (is.null(newScore) && is.null(prevScore)) {
    # nothing to do here
  } else if (is.null(newScore) && !is.null(prevScore)) {
    # end of the game
    sendNotification(title = "Match ended", message = scoreAsString(prevScore, TRUE))
    
  } else if (is.null(prevScore) && !is.null(newScore)) {
    # start of the game
    sendNotification(title = "Match started", message = scoreAsString(newScore))
    
  } else if (!is.null(prevScore) && !is.null(newScore) && !identical(newScore, prevScore)) {
    # change in the score
    sendNotification(title = "GOAL!", message = scoreAsString(newScore))
  }
  return(newScore)
}

## 3. send notification
sendNotification <- function(title = "", message) {
  notifier::notify(title = title, msg = message, image = normalizePath("logo.png"))
}

## 4. check score every minute
getScoreUpdates <- function() {
  prevScore <<- checkScoreAndNotify(prevScore)
  later::later(getScoreUpdates, delay = 60)
}

## 5. launch everything
prevScore <- NULL 
getScoreUpdates()
