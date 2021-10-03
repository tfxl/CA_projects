#!/usr/bin/env bash

if 'gem list bundle -i'; 
then
  echo "bundle is already installed !"
  echo "...updating dependencies..."
  echo "...launching program..."

else
  echo "...installing bundle for your convenience..."
  bundle install
  echo "...updating dependencies..."
  echo "...launching program..."

fi

ruby main.rb
