------------------------------- MODULE OneBitClock -------------------------------

EXTENDS Integers

VARIABLE b

TypeOk == b \in {0, 1}

Init1 == \/ b = 0
         \/ b = 1

Next1 == \/ /\ b = 0
            /\ b' = 1
         \/ /\ b = 1
            /\ b' = 0
            
            
Init2 == b \in {0, 1}
Next2 == b' = (b+1)%2

Next3 == /\ b = 0 => b' = 1
         /\ b = 1 => b' = 0

=============================================================================
\* Modification History
\* Last modified Wed Nov 16 21:28:18 GMT+05:30 2016 by vijay.daniel
\* Created Tue Nov 15 21:40:41 GMT+05:30 2016 by vijay.daniel
