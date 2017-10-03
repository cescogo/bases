@echo off
REM compila modelo y compilador
javac -cp .;lib;%CLASSPATH%  -d lib src/ASM/*.java src/compiler/*.java 
