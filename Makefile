all : coffee

coffee : coffee.cc
	g++ -o coffee coffee.cc -lv8 -lpthread -lreadline
