#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"
INPUT_USER=$1
NOT_FIND_ANSWER="I could not find that element in the database."
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else
# The user choose a number
if [[ $INPUT_USER =~ ^[0-9]{1,3}$ ]]
then
# Check if number exists in the database
ELEMENT_NUMBER_SELECTED=$($PSQL "SELECT * FROM elements WHERE atomic_number = $INPUT_USER")
ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE elements.atomic_number = $INPUT_USER ")
ELEMENT_TYPE=$($PSQL "SELECT types.type FROM types LEFT JOIN properties USING(type_id) WHERE properties.type_id = types.type_id AND properties.atomic_number = $INPUT_USER")

  if [[ -z $ELEMENT_NUMBER_SELECTED ]]
    then
      echo $NOT_FIND_ANSWER
    else
    echo "$ELEMENT_NUMBER_SELECTED" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
    do
      echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    done
  fi

# The user choose a symbol
elif [[ $INPUT_USER =~ ^[A-Z][a-z]?$ ]]
then
# Check if the symbol exists in the database
ELEMENT_SYMBOL_SELECTED=$($PSQL "SELECT * FROM elements WHERE symbol = '$INPUT_USER'")
ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE elements.symbol = '$INPUT_USER' ")
ELEMENT_TYPE=$($PSQL "SELECT types.type FROM types LEFT JOIN properties USING(type_id) INNER JOIN elements USING(atomic_number) WHERE properties.type_id = types.type_id AND properties.atomic_number = elements.atomic_number AND elements.symbol = '$INPUT_USER'")

  if [[ -z $ELEMENT_SYMBOL_SELECTED ]]
    then
      echo $NOT_FIND_ANSWER
    else
    echo "$ELEMENT_SYMBOL_SELECTED" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
    do
      echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    done
  fi

# The user choose a element name
elif [[ $INPUT_USER =~ ^[A-Za-z]+$ ]]
then
# Check if the name exists in the database
ELEMENT_NAME_SELECTED=$($PSQL "SELECT * FROM elements WHERE name = '$INPUT_USER'")
ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE elements.name = '$INPUT_USER'")
ELEMENT_TYPE=$($PSQL "SELECT types.type FROM types LEFT JOIN properties USING(type_id) INNER JOIN elements USING(atomic_number) WHERE properties.type_id = types.type_id AND properties.atomic_number = elements.atomic_number AND elements.name = '$INPUT_USER'")
  if [[ -z $ELEMENT_NAME_SELECTED ]]
    then
      echo $NOT_FIND_ANSWER
    else
    echo "$ELEMENT_NAME_SELECTED" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
    do
      echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    done
  fi
else
  echo $NOT_FIND_ANSWER
 fi
fi
