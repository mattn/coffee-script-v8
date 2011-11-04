all : coffee

coffee : coffee.cc
	g++ -o coffee coffee.cc -lv8 -lpthread

readline : coffee.cc
	g++ -DHAVE_READLINE -o coffee coffee.cc -lv8 -lpthread -lreadline
