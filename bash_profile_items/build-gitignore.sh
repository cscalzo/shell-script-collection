function build-gitignore() {
  result="$(curl https://www.gitignore.io/api/$1 2>/dev/null)"

  # if the results contain an error, as a result of a bad query
  if [[ $result =~ 'ERROR' ]]
  then
    echo -e 'ERROR:\nYour call resulted in an error.\nView list of available calls use build-gitignore list.\n'

  # if the parameter is equal to list then display the available queries
  elif [[ $1 = list ]]
  then
    echo -e 'Listing Available gitignore.io Queries\n'
    echo -e $result

  # if no attributes are passed then return an error
  elif [[ -z $1 ]]
  then
    echo -e 'Error:\nNo parameters Passed\n'
  else

    # check if the .gitignore file exists and append or write
    if [[ -f .gitignore ]]
    then
      echo '.gitignore already exist, appending...'
      echo "$result" >> .gitignore
    else
      echo '.gitignore does not exit, writing...'
      echo "$result" > .gitignore
    fi
  fi
  echo -e 'Complete\n'
}