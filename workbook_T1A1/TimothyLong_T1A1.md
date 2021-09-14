# T1A1 WORKBOOK (Timothy Long CAB022105)

---

## Q1 Five Key events in the development of the internet

### 1) EVENT

Text Text Text

### 2) EVENT

Text Text Text

### 3) EVENT

Text Text Text

### 4) EVENT

Text Text Text

### 5) EVENT

Text Text Text

## Q1 Define the following technologies

### 1) Packets

Data travels across the intenet in units called packets, which are routed from the origin address to the destination address (1) Fundamentally, as packets form the units of data being transferred, it is a significant part of the technology where information sharing occurs.

Packets are thus the smaller parts of a larger set of information that allow this to happen. While IP packets can potentially be much larger (relatively speaking) a typical packet size is up to around 1,500 bytes (1)(2). This is comprised of a packet header (critical information about the packet, such as source and destination addresses) and the actual data (4), also known as the payload (3).

While theoretically a computer could send a large file directly to another computer in a single long line of unbroken bits, it is not practical to complete this same process to additional computers simultaneously (3) - these would have to wait until the transfer was completed to all other computers in this theoretical que. Instead, the internet can utilise the technology of packets in a "packet-switching" fashion, where the packets of data are able to be transfered across various networks, allowing a much more efficient transfer of data (5). In this fashion, the use of packets and packet-switching technology has contributed to more efficient data flow across the internet.

1. Zola, A., Gillis, A., 2021, Tech Target, _Network Packet_, viewed 12/09/2021, <https://www.techtarget.com/searchnetworking/definition/packet>
2. 2021, Live Action, _What is a Network Packet?_, viewed 12/09/2021, <https://www.liveaction.com/resources/blog/network-packet/>
3. Cloudflare, _WHat is a packet?_, viewed 12/09/2021, <https://www.cloudflare.com/en-au/learning/network-layer/what-is-a-packet/>
4. Fox, P., Khan Academy, _IP Packets_, viewed 12/09/2021, <https://www.khanacademy.org/computing/computers-and-internet/xcae6f4a7ff015e7d:the-internet/xcae6f4a7ff015e7d:routing-with-redundancy/a/ip-packets>
5. AVI Networks, _Packet Switching_, viewed 12/09/2021, <https://avinetworks.com/glossary/packet-switching/>

### 2) IP Addresses (IPv4 and IPv6)

IP addresses are essentially unique identitiers for a device on local networks or the internet (1). The IP represents "Internet Protocol" and lays out the rules, regulations and standards for connecting to the internet, and for routing data, which can allow for bi-directionaly data flow (2). Given this ability is an essential technology in the web.

Version 4 (IPv4) addresses are divided into four groups of numbers, separated by a full stop. Each group of numbers ranges from 0-255 because each group of numbers is underlaid by an 8-bit number. Thus, the whole address is a a unique 32-bit number (3) which allows unique numbers from 0.0.0.0 to 255.255.255.255. As the number of connected devices in the world reach ever higher numbers, the 4.2 Billion + addresses was an essential foresight in the design.

Version 6 (IPv6) was created in 1998 with the most significant difference to IPv4 in that it is created from 128 bits, instead of 32 (3). This creates an enormous amount more unique addresses to potentially be used, however as the two IP address versions do not cummunicate with each other directly (2) this creates a difficulty with moving to this next technology en masse. Still, the potential for the increased number of unique IP addresses is one solution to the ever-expanding number of connected devices.

1. Kaspersky, 2021, _What is an IP Address - Definition and Explanation_, viewed 12/09/2021, <https://www.kaspersky.com/resource-center/definitions/what-is-an-ip-address>
2. Mozilla, Mozilla VPN, _What is an IP address?_, viewed 12/09/2021, <https://www.mozilla.org/en-US/products/vpn/more/what-is-an-ip-address/>
3. Sebesta,R. (2013) Programming the World Wide Web, 7th ed. Boston, Person Education, Inc, p4

### 3) Routers & Routing

As information moves across the internet in a packet-switching fashion (1), each packet makes a stop at its nearest router, which is a device used in networks that assists packet transfers (2). This device can be physical or virtual (3).

Once a packet is received at a router, the router examines the packet header for its critical information, primarily the destination address (2). Here, the router needs to send the package to the next closest router to the packet's final destination. That router, in turn, does the same, until finally one of the routers in the network is able to forward the packet to its desintation IP address. The message travels, or is routed along, a network of routers to reach its final IP address.

![Example of router network may from source (2)](https://cdn.kastatic.org/ka-perseus-images/0d415093c4d2160530541f0170204200c89111d3.svg)

_Image source (2)_

In this way, routers (and routing) is a critical part of the infrastructure of the internet, creating a network of transfers through a map of routers, for packets of information to arrive at their destination. Routers are able to guide and direct data through the network, choosing the optimal routes for transferring the packets (4).

One might compare the analogy of a boat carring cargo (data payload) from the home port (source IP address) to the destination port (destination IP address), noting that it will require stops along the journey from port-to-port, closer and closer to the final address, until it arrives.  
The importance

This infrastructure's importance cannot be under-stated; without routers and routing, there would not be the self-same ability to communicate or collaborate over the internet (4)

1. AVI Networks, _Packet Switching_, viewed 12/09/2021, <https://avinetworks.com/glossary/packet-switching/>
2. Fox, P., Khan Academy, _Internet routing protocol_, viewed 12/09/2021, <https://www.khanacademy.org/computing/computers-and-internet/xcae6f4a7ff015e7d:the-internet/xcae6f4a7ff015e7d:routing-with-redundancy/a/internet-routing>
3. Irei, A., 2019, Tech Target, _router_, viewed 12/09/2021, <https://www.techtarget.com/searchnetworking/definition/router>
4. Cisco, What is a router? _Key Q&A_, viewed 12/09/2021, <https://www.cisco.com/c/en_au/solutions/small-business/resource-center/networking/what-is-a-router.html>

### 4) Domains & DNS

The Domain Name System (DNS) if a fundamental part of the internet that connects a directory of names with numbers; these numbers primarily being the IP addresses (1). As it is acknowledged that people have difficulty rememembering numbers, internet addresses were given textual names (2) that allowed users to access the addresses with words instead of difficult-to-remember IP addresses. For instance, one could use the IP address 35.246.6.109 or simply use icecream.com.au

As for this example, the DNS icecream.com.au can hold multiple IP records for the same domain name, allowing browsers to to try the multiple IP addresses one-by-one until it receives an appropriate response (3) DNS has thus enabled a single website address (icecream.com.au) to be accessed via mutliple IP addresses, which may be more closely routed in various countries of interest.

To delve further into this, domains allow addresses to carry certain characteristics of identity, where fully qualified domain name comprises the hostname and all domain names; the latter of which related to a larger enclosing collection of machines that share the same group identity (2). For instance, using the DNS the educational institutions can belong to the same domain name .edu or .gov which allows ready identity and recognition to users or to groups that might allocate special priviledges to those institutions.

For interest purposes, in the 1970's and early 80's, the assignment of names to addresses was completed by one person! Her name was Elizabeth Feinler, who kept a master-list of every connected computer (1), until such time as it became too unwieldy!

1. Shaw, K., Fruhlinger J., 2020, Network World, _What is DNS and how does it work?_, viewed 12/09/2021, <https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html>
2. Sebesta, R. (2013) Programming the World Wide Web, 7th ed. Boston, Person Education, Inc, p4
3. Tezer, O., 2014, Digital Ocean, _How to configure DNS Round-Robin Load-Balancing For High-Availability_, viewed 12/09/2021, <https://www.digitalocean.com/community/tutorials/how-to-configure-dns-round-robin-load-balancing-for-high-availability>

## Q3 Define the following technologies

### 1) TCP

### 1) HTTP and HTTPS

### 1) Web Browsers (Requests, Rendering & Developer Tools)

## Q4 Identify THREE data structures in Ruby and explain the reasons for each

### 1)

### 1)

### 1)

## Q5 Describe the features of _interpreters_ and _compilers_ and how they are different.

Interpreters and compilers are programs that both help convert high-level languages (the "Source Code") into a language recognised by computers (such as "Machine Code") (1)(2). While high-level languages are considered "human readable" the machine code is made up of binary 1 and 0 bits (2) so requires that conversion.

While both types of programs will complete the conversion, there are some fundamental differences.

Interpreters will translate code "on-the-fly" which means that it translates code line-by-line as the program is running (3). While the interpreter takes very little time to analyze a single line-of-code each time, overall interpreted code runs slower than Compiled code (3). Errors are also revealed one-by-one per line, as this is the method that the Interpreter translates (3)

Compiled code conversely convertss all the source code, including pre-compiled code and scripts, into machine code _before_ the program is run. While taking time to analyze the entire code beforehand, the compiled code runs faster than interpreted code (2). Compiles will display all errors when going through its process, as it has analyzed the entire program, and might not even complete compilation if the code has signficant enough mistakes (3)

![Example of compiler vs interpreter from source (2)](https://cdn.guru99.com/images/1/053018_0616_CompilervsI1.png)

_Image source (2)_

Some additional features relating to their differences in executing code include the fact that as Interpreters do not generate Object Code they are memory efficient, whereas Compilers do generate Object Code and require more memory (4)

Compilers allow source code to be private (5) as the conversion occurs into binary code can occur before it is distributed, although it suffers from limited cross-platform support, such as Mac-Windows (5) because they won't utilise the exact same machine code. Interpreters do not have the same privacy, as the source code is largely intact at distribution, and relies on the user machine to have the Interpreter installed. (5)

Languages that _typically_ uses Compilers include C, C++ (5) and Java (4) while those that use Interpreters _typically_ include Ruby, Javascript and Python (2) although Python and Java may be considered under a _Hybrid_ category, along with C# (5) which allow for some variations to the full-compiler method.

While a little outside the scope of this discussion, it worth mentioning that Hybrid languages attempt to gain the a balance of benefits of both Interpreters and Compilers. This is done by compiling the source code to an Intermediate stage, which is as close to machine code as possible while allowing it to be portable and gain cross-platform support (5). It will undergo a final compilation at the user machine with a "Just in Time" compilation (5).

1. Bureau, B., 2019, Business Insider (India), _Difference between Compiler and Interpreter_, viewed 12/09/2021, <https://www.businessinsider.in/difference-between-compiler-and-interpreter/articleshow/69523408.cms>
2. Smith, J., 2021, Guru99, _Compiler vs Interpreter: Complete Difference Between Compiler and Interpreter_, viewed 12/09/2021, <https://www.guru99.com/difference-compiler-vs-interpreter.html>
3. Sassi, R., Better Programming, _Compiler vs. Interpreter: Know The Difference And
   When To Use Each Of Them_, viewed 12/09/2021, <https://betterprogramming.pub/compiler-vs-interpreter-d0a12ca1c1b6>
4. Programmiz, _Interpreter Vs Compiler: Differences Between Interpreter and Compiler_, viewed 12/09/2012, <https://www.programiz.com/article/difference-compiler-interpreter>
5. Tandiono, J., 2020, _Understanding Compiled | Interpreted | Hybrid languages_, viewed 12/09/2021, <https://jeffrytandiono.medium.com/understanding-compiled-interpreted-hybrid-languages-9764f641faa7>

## Q6 Describe two commonly used programming languages and explain the benefits and drawbacks of each

## Q7 Describe two ethical issues (from the nominated areas) and discuss the extent to which an IT professional is ethically responsible.

There is

## Q8 Explain control flow, using an example from Ruby programming language

In programming terms, control flow refers to the order that statements in a code are executed (1) and evaluated (2). _Broadly speaking_ this is from the first line of code to the last line of code (1). This description is clarified as "broadly speaking" because there are frequent structures implemented within code that modify this control flow, such as conditionals, loops (1) and calling on functions. So it might be considered as the way that the code is executed based on control structures that that self-same code contains.

Using a couple of examples in Ruby, it can be displayed as follows:

```Ruby
x = 7
puts x + y
y = 4
```

In this case, the statments are executed line by line.
7 is stored in variable x.
The result of variable x (7) + y (not defined) is requested.
This returns an error ("undefined local variable or method...")

A human may be able to glance ahead, and understand that y should represent 4, and establish that x + y is thus equal to 11. However, the computer obeys control flow guidance, and will not, in this case, "glance" ahead (at least, not without specific instructions to do so, which is the critical point).

```Ruby
x = 7
y = 4
puts x + y
```

This now follows our natural control flow (first line to last) and will output 11.

It is worth noting the "control" part of control flow. Here, the programmer is able to direct the computer to follow a specific pathway, that is not simply first-line to last-line.

```Ruby
x = 1
while x < 5
  puts "x is currently equal to #{x} which is less than the value of 5"
  puts "x can now be increased by 1"
  x += 1

end
x = 100
```

Here the code begins by reading first-line to next consecutive line, however the programmer has utilised techniques to create a desired control flow. In this case, by using a "while loop". There are 7 lines of code. Rather than executing 1-7 this program will run lines 3-5 as long as the condition on line 2 is "true".

As before, the program does not "glance ahead" to see that eventually x is to be equal to 100. Instead the programmer controls the flow to stay within the while loop, until created conditions (the value of x in relation to 5) are satisfied, in which case the program will continue in a line-by-line fashion, moving from line 2 and jumping to line 7.

Several examples of control flow structures that Ruby programming offer include statements such as "Break", "Next", "Redo", "Retry", "Return", "Throw/catch" (3)

1. MDN Web Docs, _Control Flow_, viewed 12/09/2021, <https://developer.mozilla.org/en-US/docs/Glossary/Control_flow>
2. Computer Hope, 2018, _Control FLow_, viewed 12/09/2021, <https://www.computerhope.com/jargon/c/contflow.htm>
3. Dumitru, S., 2019, _Control Flow in Ruby_, viewed 12/09/2021, <https://medium.com/@soni.dumitru/control-flow-in-ruby-18bdd6bdb92d>

## Q9 Explain type coercion

There are cases where data of one type (such as integers) may be required as another type (such as strings). This is where type coercion comes into play, where there is automatic or implicit (but not _explicit_) conversion of one type to another (1). It can largely be considered where the interpreter or compiler determines what type will be applied when values are being compared of differnt types (2). Here, the values may be coerced so that they can better interact.

For instance, this example modified from source (1) is a JavaScript example.

```Javascript
const my_string = '4';
const my_integer = 3;
let my_sum = my_string + my_integer;
console.log(my_sum);
```

Here, the output to console will be a string "43". JavaScript automatically coerced the integer (my_integer) into a string, so that it could concatenate the two of them.

This differs from _type conversion_ which is a broader umbrella term, and may include implicit or explicit conversions (1). For instance, in Ruby, we could explicitly convert our string "5" to an integer (example 1) or vice-versa (example 2)

```Ruby
Example (1)

x = "5"
x = x.to_i
x == 5 (true)
```

```Ruby
Example (2)

y = 5
y = y.to_s
y == "5" (true)
```

1. MDN Web Docs, _Type coercion_, viewed 12/09/2021, <https://developer.mozilla.org/en-US/docs/Glossary/Type_coercion>
2. McFarlin, T., 2014, envatotuts+, \*The Beginner's Guid to Type Coercion: What is Coercion?", viewed 12/09/2021, <https://code.tutsplus.com/articles/the-beginners-guide-to-type-coercion-what-is-coercion--cms-21917>

## Q10 Explain data types, using examples

Data types are an important concept in programming languages, where data can be stored as a variety of types, which interact differently (1) in their environment. Data types can be considered as an attribute that, when linked with the data, guides the computer system how to interpret its value (2).

This acknowledges that different data types can allow different features, for instance integers and floating point numbers can be used for mathematically reasoning, while boolean or bool types can can carry the value of true or false (3) making them ideal for conditional statements (4).

Further to this, different programming languages define data types differently (5) so it can be tricky to make comparisons, although there are some common themes.

For instance, most languages acknowledge the different types of Integer (whole numbers) and Floating Point (fractional numbers in decimal) (5) while some languages use the type "Number" to incorporate both (2).

Some languages recognise Character type (5) which is a single letter or digit, a punctuation mark or sympbol, and even a blank space (2) and String type is a popular reference to a sequence of characters (2). In the programming language Python, a single character is referenced as a string with a length of 1 (6) and, like many other programming languages, strings are recognised as arrays of bytes (6).

This leads on to some collective data types, such as Arrays or Lists that have an ordered collection of data contained therein (2). Different languages will have rules as to the types of data types stored within arrays or lists, such as a homogenous array which can only store values of the same type (7). Or a heterogeneous list in Python will usually store homogenous objects, but are easily able to store multiple values of different types, such as strings, integers, other lists and dictionaries (8).

Some final other examples of Data Types include those recognised by programming language Ruby, such as Hashes (values linked to a unique key) and Symbols, with the latter allowing an alternative to naming a variable with a string, and offering the advantage of better memory performance (9). This is linked to their immutable characteristic and ability to be stored in the one memory location, even if the same symbol is used multiple times to hold a value, such as with keys in hashes (10)

From this discussion, it can be noted that many different data types exist, and while programming languages have their individual interpretations, there are common threads between the languages and their types. Overall, they retain a consistant philosophy which is that the type determines how the system will recognise and be able to utilise that particular value of that particular type.

1. W3 Schools, Python Data Types, _Built-in Data Types_, viewed 12/09/2021, <https://www.w3schools.com/python/python_datatypes.asp>
2. Choudhury, A., data_led academy, _What are Data Types and Why are They Important_, viewed 12/09/2021, <https://dataled.academy/guides/data-types/>
3. 2021, Computer Hope, _Boolen_, viewed 12/09/2021, <https://www.computerhope.com/jargon/b/boolean.htm>
4. Busbee, K., Braunshweig, D., Programming Fundamentals, _Boolean Data Type_, viewed 12/09/2021, <https://press.rebus.community/programmingfundamentals/chapter/boolean-data-type/#:~:text=A%20Boolean%20data%20type%20has,in%20the%20mid%2019th%20century.>
5. Future Learn, _Using data types and variables_, viewed 12/09/2021, <https://www.futurelearn.com/info/courses/begin-programming/0/steps/2940>
6. W3 Schools, _Python Strings_, viewed 12/09/2021, <https://www.w3schools.com/python/python_strings.asp>
7. Singh, C., Beginners Book, _Data Structure - Array_, viewed 12/09/2021, <https://beginnersbook.com/2018/10/data-structure-array/#:~:text=An%20array%20is%20a%20collection,double%2C%20float%2C%20char%20etc.>
8. Python Progamming, _Python Lists_, viewed 12/09/2021, <https://www.pythonprogramming.in/list.html#:~:text=List%20can%20contain%20heterogeneous%20values,in%20some%20kind%20of%20order.>
9. Geeks for Geeks, _Ruby | Data Types_, viewed 12/09/2021, <https://www.geeksforgeeks.org/ruby-data-types/>
10. Criswell, L., 2018, Medium, _Ruby Symbols vs. Strings_, viewed 12/09/2021, <https://medium.com/@lcriswell/ruby-symbols-vs-strings-248842529fd9>

## Q11 Restaurant Problem. Identify classes to help solve the problem, with a short exaplantion as to why those classes would be used.

## Q12 Identify and Explain the Error in the Code (snipped below) that is preventing correct execution of the program

![Take the picture from the workbook and use here (2)](https://www.rubyguides.com/wp-content/uploads/2018/10/logo-white-border.png)

The issue is related to an understanding of types

When utilising the "gets" method in Ruby, the return is a string (1). So the variable, celcius, is storing a string. When performing multiplication, Ruby actually has the ability to join a string by the number of times it is _multiplied_ by (or, in this case, concatenated with duplicates of itself).

For instance

```Ruby
our_variable = "hello" * 3
puts our_variable
"hellohellohello"
```

Once the above code requests a _division_ however, Ruby will not be able to divide the string, running into an error. Looking ahead, a concatenation of the string with an integer would also have been problematic, assuming our order-of-operations had not run into this initial problem.

Furthermore, using the "gets" method returns not only a string, but a trailing whitespace \n, which should be rememebered. The example above, if using the "gets" method to input hello, without chaining a ".chomp" method, and then multiplying it, would have resulted in :

```Ruby
"hello\nhello\nhello\n"
```

The initial issue here, is perhaps that the user input was never meant to be a string. It was probably meant to be an integer. If it was an integer, then we could apply mathematical operands to it, such as multiplication, division and addition.

A possible fix would be to convert the input into an integer, before it is even stored in the variable, celcius, by chaining the "to_i" (to integer) method to the "gets" method

```Ruby
celcius = gets.to_i
```

This method has the further advantage of avoiding a trailing whitespace that would usually carry with a string input.

As a point of interest, utilising interpolation could tidy up the final 3 lines of code, while still retaining easy readability.

```Ruby
celcius = gets.to_i
fahrenheit = (celcius * 9/5) + 32
puts "The result is: #{fahrenheit}."
```

1. Castello, J., Ruby Guides, _How to Use The Ruby Gets & Ruby Chomp Methods_, viewed 12/09/2021, <https://www.rubyguides.com/2019/10/ruby-chomp-gets/>

## Q13 Rewrite the supplied code so that only the first two elements are swapped.

This question is requesting that only the first two elements that are out of order are to be swapped, which leaves the assumption that the remaining elements, even if out of order, do not need to be re-arranged.

If this is the case, then the solution is relatively straightforward.

```Ruby
arr[i] = arr[i+1]
arr[i+1] = arr[i]
```

Will run into issues because it is similar to

```Ruby
x = y
y = x
```

Were the value of y is already stored in x, so the second line is essentially `y = y`

We need an interim value to house one of these values if we want to swap them.

```Ruby
temp_var = y
y = x
x = temp_variable
```

or for our example:

```Ruby
> temp_var = arr[i+1]
> arr[i+1] = arr[i]
> arr[i] = temp_var
```

If we wanted to continue sorting this array in this fasion, then we would need to continue iterating through our array, swapping additional values under the same conditions. Once the whole array had been iterated through, the process is restarted, again and again, until all values are in their correct order.

While helpul for debugging, the "puts" statement can be removed if not desired.

![Take the picture from the workbook and use here (2)](https://www.rubyguides.com/wp-content/uploads/2018/10/logo-white-border.png)

![Take the picture from the workbook and use here (2)](_URL image of other code_)

## Q14 Demonstrate algorithmic thinking through completing two tasks

### Create a flowchart outlining steps for all prime numbers between 1 and 100 (inclusive)

### Write pseudocode for the process outlined in flowchart

```
1. Numbers to be considered are 1 – 100

2. 1 is not considered a prime number

3. Which makes 2 our first prime number

4. It is a special case prime number. All other even numbers are not prime numbers.

5. A collection of prime numbers can be kept.

6. The first prime number “2” can begin this collection.

7. Starting at 3 for our first number to investigate

8. We will iterate through all numbers up to 100

9. If any number that is more than two can be wholly divisible by 2 (an even number) then  it is not a prime number.

10. If that is the case, then the next number in the range can be investigated.

11. If the number is not divisible by two, it remains a potential prime number. Is it wholly divisible by the next potential factor, being 3 in this case

12. If that is the case, then the next number in the range can be investigated

13. Follow this pattern. If the number is not divisible by our potential factor, then is it divisible by the number after our potential factor, and so on.

14. As the factors are paired, if the lower potential factor ever reaches a point, following the procedure, that it is greater than its pair, then the number under investigation is a prime number.

15. This prime number needs to be added to a collection of other discovered prime numbers

16. Then, once done, the next number in the range can be investigated, following the same process

17. Eventually the range of numbers being investigated will be exhausted, and once this happens, the program can stop assessing numbers.

18. As per the task, all prime numbers can be outputted or displayed to the user.
```

With this logic in mind, the code can now be created, such as this author's example below.

```Ruby

prime_numbers = [2]
# as this problem requests values 0-100, we can start our array of prime numbers with 2, the first prime number. This avoids an early conditional statement.
# if the range was more diverse, further conditions would be required, or potentially the ability to input, or the creation of a method with parameters to set the range.

investigated_number = 3
# as per above, given the range parameters, our investigation starts at number 3, as 2 already recorded in array

possible_factor = 2
# the first possible factor to investigate is 2 (even numbers)

while investigated_number < 101

  if investigated_number % possible_factor == 0
    possible_factor = 2
    investigated_number += 1
    next
  elsif possible_factor > (investigated_number / possible_factor)
    prime_numbers.append(investigated_number)
    possible_factor = 2
    investigated_number += 1
    next
  else possible_factor += 1
  end
end

p prime_numbers
#various alternatives for output, such as puts for a lengthly vertical list, or interpolation for more structured output.
```

1.  Create a flowchart to outline the steps for listing all prime numbers between 1 and 100 (inclusive). Your flowchart should make use of standard conventions for flowcharts to indicate processes, tasks, actions, or operations

FLOWCHART FOR PRIME NUMBERS

Initial understanding. What is a prime number ?

## Q15

T

## Q16

###### Completed - however need to implement into file

to output I can execute `puts "hello`

to write an if statement..

```ruby
if true
  puts "hello"
end
```

d
