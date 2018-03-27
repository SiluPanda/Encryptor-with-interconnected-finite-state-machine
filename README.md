This is design of a simple encryptor which takes a 32 bit plane text and a 32 bit key, and outputs a 32 bit ciphertext.
This design has four components:
1. Interconnected state machines: This a design of three state machines connected to each other in such a fashion that, each of one takes a single bit input and outputs two single bit inputs. The outputs indicate their current state and each of them each running in same clock cycle. Each of them will given new ouput at each rising edge of clock. Among the two ouputs one of them is the global output and one goes as the input of the next state machine.
2. Bit converter: It converts a 3 single inputs to a 8 bit output
3. Reading data module: It takes a 8 bit input and gives a 32 bit as output.
4. Encryptor: Takes a 32 bit planetext and a 32 bit key and outputs a 32 bit ciphertext.
