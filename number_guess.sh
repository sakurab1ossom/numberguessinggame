#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read INPUT_USER_NAME

RND_INT=$(( ( RANDOM % 1000 )  + 1 ))

USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE user_name = '$INPUT_USER_NAME'")
USER_NAME=$($PSQL "SELECT user_name FROM user_info WHERE user_name = '$INPUT_USER_NAME'")
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $INPUT_USER_NAME! It looks like this is your first time here."
  INSERT_USER_INFO=$($PSQL "INSERT INTO user_info(user_name) VALUES('$INPUT_USER_NAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM game_result WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM game_result WHERE user_id = $USER_ID")
  echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read SELECTED_NUM
USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE user_name = '$INPUT_USER_NAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO game_result(user_id,guess_count) VALUES($USER_ID,1)")
GAME_ID=$($PSQL "SELECT MAX(game_id) FROM game_result")

GAME(){
  ((TRIES++))
  if [[ $SELECTED_NUM =~ ^[0-9]+$ ]]
  then
    if [[ ! $SELECTED_NUM -lt $RND_INT ]]
    then
      if [[ $SELECTED_NUM -gt $RND_INT ]]
      then
        echo -e "\nIt's lower than that, guess again:"
        read SELECTED_NUM
        GAME
      else
        UPDATE_GAME_RESULT=$($PSQL "UPDATE game_result SET guess_count = $TRIES WHERE game_id = $GAME_ID")
        GUESS_COUNT=$($PSQL "SELECT guess_count FROM game_result WHERE game_id = $GAME_ID")
        echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RND_INT. Nice job!"
      fi
    else
      echo -e "\nIt's higher than that, guess again:"
      read SELECTED_NUM
      GAME
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    read SELECTED_NUM
    GAME
  fi
}

GAME
