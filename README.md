# Cap-Extenstion
This code will simultaneously extend the max capacities of a unit's class ID, HP, and regular stats by clever bit manipulation
Specifically:
The original code stores 7 bits for the class ID, 6 bits for the HP, and 5 for each of 6 stats. 
This allows a capacity of 127, 63, and 31 respectively.
However, there is an unused 8 bit byte which I use to store the class ID(which acts as an index in an array of const Class objects)
I further repurposed the now unused 7 bits of the class ID as a new HP cap essentially doubling it. 
The 6 bits from the former HP data was also repurposed to extend each of the 6 stats by 1 bit.
In short, we went from 7 bits for the class ID, 6 bits for the HP, and 5 for each of 6 stats to 8 bits for the class ID, 7 bits for the HP, and 6 for each of 6 stats.
