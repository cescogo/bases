@echo off
echo Prueba una caso de prueba: %1
java -cp .;lib;%CLASSPATH% eightBit.compile.EightBitc cases\helloWorld.8bit%1 > output\%1.out.asm