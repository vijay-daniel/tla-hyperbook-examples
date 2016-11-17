------------------------------ MODULE DieHard ------------------------------

EXTENDS Integers

VARIABLES big, small

Init == /\ big = 0
        /\ small = 0
        
FillBig == big' = 5 /\ small' = small
EmptyBig == big' = 0 /\ small' = small
BigToSmall == \/ /\ big + small > 3
                 /\ small' = 3
                 /\ big' = big - (small' - small)
              \/ /\ big + small <= 3
                 /\ small' = big + small
                 /\ big' = 0 
FillSmall == small' = 3 /\ big' = big
EmptySmall == small' = 0 /\ big' = big
SmallToBig == \/ /\ big + small > 5
                 /\ big' = 5
                 /\ small' = small - (big' - big)
              \/ /\ big + small <= 5
                 /\ big' = big + small
                 /\ small' = 0
                 
                 
        
Next == \/ FillBig
        \/ EmptyBig
        \/ BigToSmall
        \/ FillSmall
        \/ EmptySmall
        \/ SmallToBig
        


=============================================================================
\* Modification History
\* Last modified Wed Nov 16 22:55:58 GMT+05:30 2016 by vijay.daniel
\* Created Tue Nov 15 23:37:34 GMT+05:30 2016 by vijay.daniel
