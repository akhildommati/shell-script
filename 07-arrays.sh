#!/bin/bash

MOVIES=("Puspha" "rrr" "devara")
# index starts from 0, size is 3

echo "First movie: ${MOVIES[0]}"
echo "Second movie: ${MOVIES[1]}"
echo "Third movie: ${MOVIES[2]}"

echo "All movies: ${MOVIES[@]}"

echo "Number of movies: ${#MOVIES[@]}"

echo "Index of movies: ${!MOVIES[@]}"

echo "Index of movies: ${!MOVIES[*]}"
# Both of the above commands will give the same output

echo "Index of movies: ${!MOVIES[@]}"