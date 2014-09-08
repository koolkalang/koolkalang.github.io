---
layout: post
title: C++ Quick Thoughts
tags:
- process
- c++
---
### C++ 
* the `delete` operator doesn't actually delete the object - it merely calls the desturctor, and tells the allocator that memory is free.
* For certain functions, apparently `Test::helloWorld(test); == test->helloWorld();` is valid, I'll have to look into this further, not quite sure what implications are for this.
* C++11 - use unique_ptr so that you don't have to delete afterwards.

```c++
#include <iostream>
#include <memory>

struct foo
{
	foo() { std::cout << "constructing" << std::endl; }
	~foo() { std::cout << "destructing" << std::endl; }
};

int main()
{
	std::unique_ptr<foo> p(new foo);
	// no need to remember to delete p
	return 0;
}
```
* This really confused me - once you initialize an object that has functions, those functions are slightly independent of the object/class. I'll have to dig deeper into this, because I am not entirely sure about the specifics. 

```c++
#include <iostream>
#include <functional>

struct Test {
	void helloWorld() {
		std::cout << "Hello, "<< this->me << "!" << std::endl;
	}
	
	std::string me = "World";
};

int main() {
	std::function<void(Test *)> helloWorld = &Test::helloWorld;
	
	Test test;
	helloWorld(&test);
	
	return 0;
}
```

### assumptions 
* learning about c++ doesn't mean that work is actually getting done on the project. 
* I should probably work on the individual functions separately first, and then refactor them into a class later if I have time.
* I spend 30 minutes researching why git couldn't connect to github.com, assuming it was a proxy issue. Turns out my laptop wasn't connected to the internet. Such a smart cookie I am. 

---