#!/usr/bin/env bash

cd app

for ((n = 0; n < 100000; n++)); do
  # $RANDOM возвращает различные случайные числа при каждом обращении к ней.
  # Диапазон изменения: 0 - 32767 (16-битовое целое со знаком).
  rand=$RANDOM

  if [[ rand -gt 10000 ]]; then
    mysql --defaults-extra-file=my.cnf <./dml/gen3.sql
  elif [[ rand -gt 5000 ]]; then
    mysql --defaults-extra-file=my.cnf <./dml/gen2.sql
  else
    mysql --defaults-extra-file=my.cnf <./dml/gen1.sql
  fi

done
