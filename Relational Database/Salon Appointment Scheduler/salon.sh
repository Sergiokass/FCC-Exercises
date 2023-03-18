#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
  echo $1
  fi

  echo -e "\nWelcome to My Salon, how can I help you?\n"
  $PSQL "SELECT * FROM services" | while read SERVICE_ID BAR NAME BAR
  do
  echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  if [[ ! $($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED") ]]
  then
  MAIN_MENU "I could not find that service. What would you like today?"
  else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  if [[ ! $($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' ") ]]
  then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  fi

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED ")
  echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME
  #INSERT APPOINTMENT
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME." | sed 's/, /,/'
  echo $CUSTOMER_NAME
  fi
}

MAIN_MENU