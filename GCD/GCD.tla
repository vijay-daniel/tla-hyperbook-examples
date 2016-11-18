-------------------------------- MODULE GCD --------------------------------

EXTENDS Integers

Divides(p, n) == \E q \in Int : n = p * q

DivisorsOf(n) == { p \in Int : p > 0 /\ Divides(p, n) } 

SetMax(S) == CHOOSE i \in S : \A j \in S : i >= j

GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))

=============================================================================
\* Modification History
\* Last modified Thu Nov 17 23:38:02 GMT+05:30 2016 by vijay.daniel
\* Created Thu Nov 17 17:56:58 GMT+05:30 2016 by vijay.daniel
