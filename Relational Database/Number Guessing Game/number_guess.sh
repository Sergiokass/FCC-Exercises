#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --tuples-only -c"

# Starting prompt

echo "Enter your username:"
read INPUT_USERNAME

# Add counter of guesses
NUMBER_OF_GUESSES=0

# Generate a random number between 1 and 1000.
SECRET_NUMBER=$(($RANDOM % 1000 + 1))

USER=$($PSQL "SELECT * FROM players WHERE username = '$INPUT_USERNAME'")
# Checking if username exists in database
# If doesnt exist we must insert username into database
if [[ -z $USER ]]
  then
    # Insert username in database
    echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
  else
  echo "$USER" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"

# Create the game function
GUESS_GAME() {
  if [[ $1 ]]
  then
    echo $1
  fi
  read NUMBER
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
    then
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    GUESS_GAME "That is not an integer, guess again:"

    elif [[ $NUMBER -lt $SECRET_NUMBER ]]
    then
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    GUESS_GAME "It's higher than that, guess again:"

    elif [[ $NUMBER -gt $SECRET_NUMBER ]]
    then
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    GUESS_GAME "It's lower than that, guess again:" 

    else
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    #See games_played by username
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username = '$INPUT_USERNAME'")
    if [[ -z $GAMES_PLAYED ]]
    then
      ($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$INPUT_USERNAME', 1, $NUMBER_OF_GUESSES)") | sed 's/INSERT 0 1/''/'
    else
      ($PSQL "UPDATE players SET games_played = (games_played + 1) WHERE username = '$INPUT_USERNAME'") | sed 's/UPDATE 1/''/'
    fi

    #See best game of username
    BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username = '$INPUT_USERNAME'")
      if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
      then
      ($PSQL "UPDATE players SET best_game = $NUMBER_OF_GUESSES WHERE username = '$INPUT_USERNAME'") | sed 's/UPDATE 1/''/'
      fi

    # Final print
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  fi
}

GUESS_GAME